; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45402 () Bool)

(assert start!45402)

(declare-fun b!499007 () Bool)

(declare-fun res!301134 () Bool)

(declare-fun e!292411 () Bool)

(assert (=> b!499007 (=> (not res!301134) (not e!292411))))

(declare-datatypes ((array!32237 0))(
  ( (array!32238 (arr!15500 (Array (_ BitVec 32) (_ BitVec 64))) (size!15865 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32237)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32237 (_ BitVec 32)) Bool)

(assert (=> b!499007 (= res!301134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499008 () Bool)

(declare-fun res!301145 () Bool)

(declare-fun e!292413 () Bool)

(assert (=> b!499008 (=> (not res!301145) (not e!292413))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499008 (= res!301145 (validKeyInArray!0 k0!2280))))

(declare-fun b!499010 () Bool)

(declare-fun e!292415 () Bool)

(assert (=> b!499010 (= e!292415 false)))

(declare-fun b!499011 () Bool)

(declare-fun res!301139 () Bool)

(assert (=> b!499011 (=> (not res!301139) (not e!292411))))

(declare-datatypes ((List!9697 0))(
  ( (Nil!9694) (Cons!9693 (h!10567 (_ BitVec 64)) (t!15916 List!9697)) )
))
(declare-fun arrayNoDuplicates!0 (array!32237 (_ BitVec 32) List!9697) Bool)

(assert (=> b!499011 (= res!301139 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9694))))

(declare-fun b!499012 () Bool)

(declare-datatypes ((Unit!14926 0))(
  ( (Unit!14927) )
))
(declare-fun e!292414 () Unit!14926)

(declare-fun Unit!14928 () Unit!14926)

(assert (=> b!499012 (= e!292414 Unit!14928)))

(declare-fun lt!226111 () (_ BitVec 32))

(declare-fun lt!226108 () Unit!14926)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3964 0))(
  ( (MissingZero!3964 (index!18038 (_ BitVec 32))) (Found!3964 (index!18039 (_ BitVec 32))) (Intermediate!3964 (undefined!4776 Bool) (index!18040 (_ BitVec 32)) (x!47092 (_ BitVec 32))) (Undefined!3964) (MissingVacant!3964 (index!18041 (_ BitVec 32))) )
))
(declare-fun lt!226112 () SeekEntryResult!3964)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14926)

(assert (=> b!499012 (= lt!226108 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226111 #b00000000000000000000000000000000 (index!18040 lt!226112) (x!47092 lt!226112) mask!3524))))

(declare-fun res!301135 () Bool)

(declare-fun lt!226109 () (_ BitVec 64))

(declare-fun lt!226114 () array!32237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32237 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!499012 (= res!301135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226111 lt!226109 lt!226114 mask!3524) (Intermediate!3964 false (index!18040 lt!226112) (x!47092 lt!226112))))))

(assert (=> b!499012 (=> (not res!301135) (not e!292415))))

(assert (=> b!499012 e!292415))

(declare-fun b!499013 () Bool)

(declare-fun e!292409 () Bool)

(assert (=> b!499013 (= e!292409 true)))

(declare-fun lt!226106 () SeekEntryResult!3964)

(assert (=> b!499013 (= lt!226106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226111 lt!226109 lt!226114 mask!3524))))

(declare-fun b!499014 () Bool)

(declare-fun Unit!14929 () Unit!14926)

(assert (=> b!499014 (= e!292414 Unit!14929)))

(declare-fun b!499015 () Bool)

(assert (=> b!499015 (= e!292413 e!292411)))

(declare-fun res!301141 () Bool)

(assert (=> b!499015 (=> (not res!301141) (not e!292411))))

(declare-fun lt!226105 () SeekEntryResult!3964)

(assert (=> b!499015 (= res!301141 (or (= lt!226105 (MissingZero!3964 i!1204)) (= lt!226105 (MissingVacant!3964 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32237 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!499015 (= lt!226105 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499016 () Bool)

(declare-fun e!292412 () Bool)

(assert (=> b!499016 (= e!292411 (not e!292412))))

(declare-fun res!301140 () Bool)

(assert (=> b!499016 (=> res!301140 e!292412)))

(declare-fun lt!226107 () (_ BitVec 32))

(assert (=> b!499016 (= res!301140 (= lt!226112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226107 lt!226109 lt!226114 mask!3524)))))

(assert (=> b!499016 (= lt!226112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226111 (select (arr!15500 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499016 (= lt!226107 (toIndex!0 lt!226109 mask!3524))))

(assert (=> b!499016 (= lt!226109 (select (store (arr!15500 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499016 (= lt!226111 (toIndex!0 (select (arr!15500 a!3235) j!176) mask!3524))))

(assert (=> b!499016 (= lt!226114 (array!32238 (store (arr!15500 a!3235) i!1204 k0!2280) (size!15865 a!3235)))))

(declare-fun e!292410 () Bool)

(assert (=> b!499016 e!292410))

(declare-fun res!301137 () Bool)

(assert (=> b!499016 (=> (not res!301137) (not e!292410))))

(assert (=> b!499016 (= res!301137 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226110 () Unit!14926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14926)

(assert (=> b!499016 (= lt!226110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499017 () Bool)

(declare-fun res!301144 () Bool)

(assert (=> b!499017 (=> (not res!301144) (not e!292413))))

(assert (=> b!499017 (= res!301144 (validKeyInArray!0 (select (arr!15500 a!3235) j!176)))))

(declare-fun b!499018 () Bool)

(declare-fun res!301136 () Bool)

(assert (=> b!499018 (=> (not res!301136) (not e!292413))))

(declare-fun arrayContainsKey!0 (array!32237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499018 (= res!301136 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499019 () Bool)

(assert (=> b!499019 (= e!292410 (= (seekEntryOrOpen!0 (select (arr!15500 a!3235) j!176) a!3235 mask!3524) (Found!3964 j!176)))))

(declare-fun res!301133 () Bool)

(assert (=> start!45402 (=> (not res!301133) (not e!292413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45402 (= res!301133 (validMask!0 mask!3524))))

(assert (=> start!45402 e!292413))

(assert (=> start!45402 true))

(declare-fun array_inv!11383 (array!32237) Bool)

(assert (=> start!45402 (array_inv!11383 a!3235)))

(declare-fun b!499009 () Bool)

(declare-fun res!301138 () Bool)

(assert (=> b!499009 (=> (not res!301138) (not e!292413))))

(assert (=> b!499009 (= res!301138 (and (= (size!15865 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15865 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15865 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499020 () Bool)

(declare-fun res!301142 () Bool)

(assert (=> b!499020 (=> res!301142 e!292412)))

(get-info :version)

(assert (=> b!499020 (= res!301142 (or (undefined!4776 lt!226112) (not ((_ is Intermediate!3964) lt!226112))))))

(declare-fun b!499021 () Bool)

(assert (=> b!499021 (= e!292412 e!292409)))

(declare-fun res!301143 () Bool)

(assert (=> b!499021 (=> res!301143 e!292409)))

(assert (=> b!499021 (= res!301143 (or (bvsgt #b00000000000000000000000000000000 (x!47092 lt!226112)) (bvsgt (x!47092 lt!226112) #b01111111111111111111111111111110) (bvslt lt!226111 #b00000000000000000000000000000000) (bvsge lt!226111 (size!15865 a!3235)) (bvslt (index!18040 lt!226112) #b00000000000000000000000000000000) (bvsge (index!18040 lt!226112) (size!15865 a!3235)) (not (= lt!226112 (Intermediate!3964 false (index!18040 lt!226112) (x!47092 lt!226112))))))))

(assert (=> b!499021 (and (or (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226113 () Unit!14926)

(assert (=> b!499021 (= lt!226113 e!292414)))

(declare-fun c!59214 () Bool)

(assert (=> b!499021 (= c!59214 (= (select (arr!15500 a!3235) (index!18040 lt!226112)) (select (arr!15500 a!3235) j!176)))))

(assert (=> b!499021 (and (bvslt (x!47092 lt!226112) #b01111111111111111111111111111110) (or (= (select (arr!15500 a!3235) (index!18040 lt!226112)) (select (arr!15500 a!3235) j!176)) (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15500 a!3235) (index!18040 lt!226112)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45402 res!301133) b!499009))

(assert (= (and b!499009 res!301138) b!499017))

(assert (= (and b!499017 res!301144) b!499008))

(assert (= (and b!499008 res!301145) b!499018))

(assert (= (and b!499018 res!301136) b!499015))

(assert (= (and b!499015 res!301141) b!499007))

(assert (= (and b!499007 res!301134) b!499011))

(assert (= (and b!499011 res!301139) b!499016))

(assert (= (and b!499016 res!301137) b!499019))

(assert (= (and b!499016 (not res!301140)) b!499020))

(assert (= (and b!499020 (not res!301142)) b!499021))

(assert (= (and b!499021 c!59214) b!499012))

(assert (= (and b!499021 (not c!59214)) b!499014))

(assert (= (and b!499012 res!301135) b!499010))

(assert (= (and b!499021 (not res!301143)) b!499013))

(declare-fun m!479737 () Bool)

(assert (=> b!499008 m!479737))

(declare-fun m!479739 () Bool)

(assert (=> b!499013 m!479739))

(declare-fun m!479741 () Bool)

(assert (=> b!499007 m!479741))

(declare-fun m!479743 () Bool)

(assert (=> b!499018 m!479743))

(declare-fun m!479745 () Bool)

(assert (=> b!499016 m!479745))

(declare-fun m!479747 () Bool)

(assert (=> b!499016 m!479747))

(declare-fun m!479749 () Bool)

(assert (=> b!499016 m!479749))

(declare-fun m!479751 () Bool)

(assert (=> b!499016 m!479751))

(declare-fun m!479753 () Bool)

(assert (=> b!499016 m!479753))

(declare-fun m!479755 () Bool)

(assert (=> b!499016 m!479755))

(declare-fun m!479757 () Bool)

(assert (=> b!499016 m!479757))

(assert (=> b!499016 m!479755))

(declare-fun m!479759 () Bool)

(assert (=> b!499016 m!479759))

(assert (=> b!499016 m!479755))

(declare-fun m!479761 () Bool)

(assert (=> b!499016 m!479761))

(declare-fun m!479763 () Bool)

(assert (=> b!499015 m!479763))

(declare-fun m!479765 () Bool)

(assert (=> start!45402 m!479765))

(declare-fun m!479767 () Bool)

(assert (=> start!45402 m!479767))

(declare-fun m!479769 () Bool)

(assert (=> b!499011 m!479769))

(assert (=> b!499019 m!479755))

(assert (=> b!499019 m!479755))

(declare-fun m!479771 () Bool)

(assert (=> b!499019 m!479771))

(declare-fun m!479773 () Bool)

(assert (=> b!499021 m!479773))

(assert (=> b!499021 m!479755))

(declare-fun m!479775 () Bool)

(assert (=> b!499012 m!479775))

(assert (=> b!499012 m!479739))

(assert (=> b!499017 m!479755))

(assert (=> b!499017 m!479755))

(declare-fun m!479777 () Bool)

(assert (=> b!499017 m!479777))

(check-sat (not b!499016) (not b!499008) (not b!499013) (not b!499015) (not b!499011) (not b!499007) (not b!499019) (not b!499012) (not b!499018) (not start!45402) (not b!499017))
(check-sat)
