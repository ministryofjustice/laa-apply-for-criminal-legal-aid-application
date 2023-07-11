MainOffence = Struct.new(:description) do
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CollectionLiteralLength
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Layout/LineLength
  def self.all
    @all ||= [
      new('Assault (common)'),
      new('Battery (common)'),
      new('Assault occasioning actual bodily harm'),
      new('Wounding or inflicting grievous bodily harm'),
      new('Wounding or causing grievous bodily harm with intent'),
      new('Making threats to kill'),
      new('Racially aggravated assaults'),
      new('Assault on constable in execution of duty'),
      new('Resisting or wilfully obstructing constable'),
      new('Assault with intention to resist arrest'),
      new('Attempting to choke, suffocate, strangle etc'),
      new('Endangering the safety of railway passengers '),
      new('Causing bodily injury by explosives'),
      new('Using gunpowder to explode, or sending to any person an explosive substance, or throwing corrosive fluid on a person, with intent to grievous bodily harm '),
      new('Placing explosives etc., with intent to do bodily injury to any person'),
      new('Making or having gunpowder etc., with intent to commit or enable any person to commit a felony'),
      new('Causing miscarriage by poison, instrument'),
      new('Supplying instrument etc. to cause miscarriage'),
      new('Concealment of birth'),
      new('Administering chloroform, laudanum etc.'),
      new('Administering poison etc. so as to endanger life'),
      new('Administering poison with intent to injure etc.'),
      new('Circumcision of females'),
      new('Kidnapping (common law)'),
      new('Hostage taking'),
      new('False imprisonment (common law)'),
      new('Torture'),
      new('Murder (common law)'),
      new('Manslaughter (common law)'),
      new('Causing death by dangerous driving'),
      new('Causing death by careless driving while under the influence of drink or drugs'),
      new('Aggravated vehicle taking resulting in death'),
      new('Killing in pursuance of suicide pact'),
      new('Complicity to suicide'),
      new('Soliciting to murder'),
      new('Child destruction'),
      new('Infanticide'),
      new('Abortion'),
      new('Supplying or procuring means for abortion'),
      new('Concealment of birth'),
      new('Possession of firearm without certificate'),
      new('Possession or acquisition of shotgun without certificate'),
      new('Dealing in firearms'),
      new('Shortening of shotgun or possession of shortened shotgun'),
      new('Possession or acquisition of certain prohibited weapons etc.'),
      new('Possession of firearm with intent to injure / endanger life'),
      new('Possession of firearm or imitation firearm with intent to cause fear of violence'),
      new('Use of firearm to resist arrest'),
      new('Possession of firearm with criminal intent'),
      new('Carrying loaded firearm in public place'),
      new('Possession of firearm without certificate '),
      new('Trespassing with a firearm'),
      new('Possession of firearms by person convicted of crime'),
      new('Acquisition by or supply of firearms to person denied them'),
      new('Failure to comply with certificate when transferring firearm'),
      new('Shortening of smooth bore gun'),
      new('Permitting an escape (common law)'),
      new('Rescue (common law)'),
      new('Escape (common law)'),
      new('Escaping from lawful custody without force (common law)'),
      new('Breach of prison (common law)'),
      new('Prison mutiny'),
      new('Assaulting prison officer whilst possessing firearm etc.'),
      new('Harbouring escaped prisoners'),
      new('Assisting prisoners to escape Terrorist Offences'),
      new('Offences under the Terrorism Act 2000'),
      new('Offences against international protection of nuclear material'),
      new('Offences under the Northern Ireland'),
      new('Offences under the Sexual Offences Act 2003'),
      new('Child abduction by connected person'),
      new('Child abduction by other person'),
      new('Keping brothel and related offences'),
      new('Keeping a disorderly house'),
      new('Soliciting'),
      new('Taking, having etc. indecent photographs of children'),
      new('Sexual intercourse with patients'),
      new('Ill treatment of persons of unsound mind'),
      new('Bigamy'),
      new('Abuse of position of trust'),
      new('Abandonment of children under two'),
      new('Cruelty to persons under 16'),
      new('Armed robbery'),
      new('Assault with weapon with intent to rob'),
      new('Burglary (domestic)'),
      new('Going equipped to steal'),
      new('Burglary (non-domestic)'),
      new('Aggravated burglary'),
      new('Criminal Damage'),
      new('Destroying or damaging property with the intention or recklessness as to endanger life'),
      new('Aggravated criminal damage'),
      new('Threats to destroy or damage property'),
      new('Racially aggravated criminal damage'),
      new('Possessing anything with intent to destroy or damage property'),
      new('Possessing bladed article / instrument'),
      new('Prohibition of the carrying of offensive weapons without lawful authority or reasonable excuse'),
      new('Arson'),
      new('Aggravated arson'),
      new('Racially aggravated arson'),
      new('Theft'),
      new('Taking conveyance without authority'),
      new('Taking or riding a pedal cycle without authority'),
      new('Aggravated vehicle taking'),
      new('Handling stolen goods'),
      new('Receiving property by another‚Äôs mistake'),
      new('Removal of articles from places open to the public'),
      new('Abstraction of electricity'),
      new('Making off without payment'),
      new('Fraud (common law)'),
      new('Forgery'),
      new('Copying a false instrument'),
      new('Using a false statement'),
      new('Using a copy of a false instrument'),
      new('Custody or control of false instruments etc.'),
      new('Offences relating to money orders, share certificates, passports etc, etc.'),
      new('Counterfeiting notes and coins'),
      new('Passing, etc. counterfeiting notes and coins'),
      new('Offences involving the custody/control of counterfeit notes and coins'),
      new('Making, custody or control of counterfeiting materials etc.'),
      new('Illegal importation'),
      new('Offences involving the making/custody/control of counterfeiting materials and implements'),
      new('Reproducing British currency'),
      new('Offences in making, etc., imitation of British coins'),
      new('Prohibition of importation of counterfeit note and coins'),
      new('Prohibition of exportation of counterfeit notes and coins'),
      new('Destruction of registers of births etc'),
      new('Making false entries in copies of registers sent to register'),
      new('Fraudulent evasion'),
      new('Obtaining services by deception'),
      new('Evasion of liability by deception'),
      new('Obtaining property by deception'),
      new('Obtaining a money transfer by deception'),
      new('Obtaining pecuniary advantage by deception'),
      new('False accounting'),
      new('Liability of company officers for offences of deception committed by the company'),
      new('False statements by company directors'),
      new('Suppression, etc. of documents'),
      new('Procuring execution of a valuable security by deception'),
      new('Advertising rewards for return of goods stolen or lost'),
      new('Dishonestly retaining a wrongful credit'),
      new('raudulent use of telecommunication system'),
      new('Possession or supply of anything for fraudulent purpose in connection with use of telecommunication system'),
      new('Offences under the Companies Act 1985'),
      new('Insider dealing'),
      new('False declarations of insolvency in voluntary liquidations'),
      new('Concealment of property and failure to account for losses'),
      new('Concealment or falsification of books and papers'),
      new('False statements'),
      new('Fraudulent disposal of property'),
      new('Absconding with property'),
      new('Fraudulent dealing with property obtained on credit'),
      new('Undischarged bankrupt concerned in a company'),
      new('Failure to keep proper business accounts'),
      new('Misleading statements and practices'),
      new('Fraudulent inducement to make a deposit'),
      new('Counterfeiting customs documents'),
      new('Offences in relation to dies or stamps'),
      new('Counterfeiting of dies or marks'),
      new('Fraudulent application of trademark'),
      new('False application or use of trademarks'),
      new('Forgery of driving documents'),
      new('Forgery and misuse of driving documents'),
      new('Forgery etc. of licenses and other documents'),
      new('Mishandling or falsifying parking documents'),
      new('Forgery, Alteration etc. of documents etc.'),
      new('False records or entries relating to driver‚Äôs hours'),
      new('Forgery, alteration, fraud of licences etc.'),
      new('Forgery, alteration etc. of licenses, marks, trade plates etc'),
      new('Forgery of documents etc.'),
      new('Fraudulent evasion of agricultural levy'),
      new('Evasion of duty'),
      new('Trade description offences (9 offences)'),
      new('VAT offences'),
      new('Breach of any order made by a court'),
      new('Causing explosion likely to endanger life or property'),
      new('Attempt to cause explosion, making or keeping explosive etc.'),
      new('Making or possession of explosive under suspicious circumstances'),
      new('Bomb Hoaxes'),
      new('Contamination of goods with intent'),
      new('Placing wood etc. on railway'),
      new('Exhibiting false signals etc.'),
      new('Perjuries (7 offences)'),
      new('Offences akin to perjury'),
      new('Perverting the course of public justice (common law)'),
      new('Public nuisance (common law)'),
      new('Contempt of court (common law)'),
      new('Blackmail'),
      new('Corrupt transactions with agents'),
      new('Corruption (common law)'),
      new('Corruption in public office'),
      new('Embracery'),
      new('Fabrication of evidence with intent to mislead a tribunal (common law)'),
      new('Personation of jurors (common law)'),
      new('Concealing an arrestable offence'),
      new('Assisting offenders'),
      new('False evidence before European Court'),
      new('Intimidating a witness, juror etc.'),
      new('Harming, threatening to harm a witness, juror etc.'),
      new('Ticket touts'),
      new('Prejudicing a drug trafficking investigation'),
      new('Giving false statements to procure cremation'),
      new('False statement tendered under section 9 of the Criminal Justice Act 1967'),
      new('False statement tendered under section 102 of the Magistrates‚Äô Courts Act 1980'),
      new('Making a false statement to obtain or resist interim possession order'),
      new('Making false statement to authorised officer'),
      new('Riot'),
      new('Violent disorder'),
      new('Affray'),
      new('Fear or provocation of violence'),
      new('Intentional harassment, alarm, or distress'),
      new('Harassment, alarm or distress'),
      new('Harassment of debtors'),
      new('Offence of harassment'),
      new('Putting people in fear of violence'),
      new('Breach of restraining order/injunction'),
      new('Racially aggravated public order offences'),
      new('Racially aggravated harassment etc.'),
      new('Using words or behaviour or displaying written material stirring up racial hatred'),
      new('Publishing or distributing written material stirring up racial hatred'),
      new('Public performance of play stirring up racial hatred'),
      new('Distributing, showing or playing a recording stirring up racial hatred'),
      new('Broadcasting programme stirring up racial hatred'),
      new('Possession of written material or recording stirring up racial hatred'),
      new('Possession of offensive weapon'),
      new('Possession of bladed article'),
      new('Criminal libel (common law)'),
      new('Blasphemy and blasphemous libel (common law)'),
      new('Sedition'),
      new('Indecent display'),
      new('Presentation of obscene performance'),
      new('Obstructing railway or carriage on railway'),
      new('Obscene articles intended for publication for gain'),
      new('Offences of publication of obscene matter'),
      new('Agreeing to indemnify sureties'),
      new('Absconding by person released on bail'),
      new('Personating for purposes of bail etc.'),
      new('Sending prohibited articles by post'),
      new('Impersonating Customs officer'),
      new('Obstructing Customs officer'),
      new('Penalty on keepers of refreshment houses permitting drunkenness, disorderly conduct, or gaming, etc., therein '),
      new('Penalty on persons found drunk'),
      new('Drunkenness in a public place'),
      new('Drunk in a late night refreshment house'),
      new('Drunk while in charge of a child'),
      new('Drunk on an aircraft'),
      new('Intimidation or annoyance by violence or otherwise'),
      new('Offences affecting security'),
      new('Offences under the Official Secrets Act 1911, 1920 and 1989'),
      new('Unlawful interception of communications by public and private systems'),
      new('Disclosure of telecommunication messages'),
      new('Incitement to disaffection'),
      new('Restriction of importation and exportation of controlled drugs'),
      new('Producing or supplying a Class A, B or C drug'),
      new('Possession of controlled drugs'),
      new('Possession of a Class A, B or C drug with intent to supply'),
      new('Cultivation of cannabis plant'),
      new('Occupier knowingly permitting drugs offences etc.'),
      new('Activities relating to opium'),
      new('Prohibition of supply etc., of articles for administering or preparing controlled drugs'),
      new('Offences relating to the safe custody of controlled drugs'),
      new('Practitioner contravening drug supply regulations'),
      new('Incitement'),
      new('Assisting in or inducing commission outside United Kingdom of offence punishable under a corresponding law'),
      new('Powers of entry, search and seizure'),
      new('Illegal importation of Class A, B or C drugs'),
      new('Fraudulent evasion of controls on Class A, B or C drugs'),
      new('Failure to disclose knowledge or suspicion of money laundering'),
      new('Tipping-off in relation to money laundering investigations'),
      new('Offences in relation to proceeds of drug trafficking'),
      new('Offences in relation to money laundering investigations'),
      new('Manufacture and supply of scheduled substances'),
      new('Drug Trafficking offences at sea'),
      new('Ships used for illicit traffic'),
      new('Making and preserving records of production and supply of certain scheduled substances'),
      new('Supply of intoxicating substance'),
      new('Dangerous driving'),
      new('Careless, and inconsiderate driving'),
      new('Driving, or being in charge, when under the influence of drink or drugs'),
      new('Driving or being in charge of a motor vehicle with excess alcohol'),
      new('Breath tests'),
      new('Provision of specimens for analysis'),
      new('Motor racing on highways'),
      new('Leaving vehicle in dangerous position'),
      new('Causing danger to road users'),
      new('Restriction of carriage of persons on motor cycles'),
      new('Failing to stop at school gate'),
      new('Failure to comply with indication given by traffic sign'),
      new('Directions to pedestrians'),
      new('Using vehicles in dangerous condition'),
      new('Contravention of construction and use regulations'),
      new('Using etc. motor vehicle without test certificate'),
      new('Driving otherwise than in accordance with a licence'),
      new('Driving after refusal or revocation of licence'),
      new('False declaration as to physical fitness'),
      new('Failure to notify disability'),
      new('Driving with uncorrected defective eyesight'),
      new('Driving while disqualified'),
      new('Using etc. motor vehicle without insurance'),
      new('Failure to produce driving licence, insurance etc'),
      new('Failure to give, or giving false, name and address in case of dangerous or careless or inconsiderate driving or cycling'),
      new('Pedestrian contravening constable‚Äôs direction to stop to give name and address'),
      new('Failing to stop and failing to report accident'),
      new('Duty of owner of motor vehicle to give information for verifying compliance with requirement of compulsory insurance or security'),
      new('Duty to give information as to identity of driver etc., in certain circumstances'),
      new('Street playgrounds'),
      new('Speeding'),
      new('Wanton or furious driving'),
      new('Interference with vehicles'),
      new('Other road traffic offences (including policing etc.)'),
      new('Proceedings for the making of anti-social behaviour orders, sex offender orders etc'),
      new('Failing to keep dogs under proper control resulting in injury and other dog offences'),
      new('Failing to keep dogs under proper control resulting in injury and other dog offences'),
      new('Hijacking of aircraft'),
      new('Destroying, damaging or endangering safety of aircraft'),
      new('Other acts endangering or likely to endanger safety of aircraft'),
      new('Offences in relation to certain dangerous articles'),
      new('Endangering safety at aerodromes Hijacking of ships'),
      new('Other offences under the Aviation and Maritime Security Act 1990'),
      new('Piracy'),
      new('Offences under the Football Spectators Act 1989'),
      new('Throwing of missiles'),
      new('Indecent or racialist chanting'),
      new('Going onto the playing area'),
      new('Offences in connection with alcohol on coaches and trains'),
      new('Offences in connection with alcohol, containers etc., at sports grounds'),
      new('Offences of cruelty (Protection of Animals)'),
      new('Penalties for abandonment of animals'),
      new('Offences (Wild Mammals Protection)'),
      new('Raves'),
      new('Offences affecting enjoyment of premises'),
      new('Unlawful eviction and harassment of occupier'),
      new('Use or threat of violence for purpose of securing entry to premises'),
      new('Adverse occupation of residential premises'),
      new('Trespassing during the currency of an interim possession order'),
      new('Interim possession orders'),
      new('Aggravated trespass'),
      new('Failure to leave or re-entry to land after police direction to leave'),
      new('Unauthorised campers'),
    ]
  end

  # rubocop:enable Layout/LineLength
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CollectionLiteralLength
  # rubocop:enable Metrics/AbcSize
  def name
    # {description}.to_s
  end
end
