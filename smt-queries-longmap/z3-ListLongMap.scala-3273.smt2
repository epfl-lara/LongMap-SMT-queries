; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45572 () Bool)

(assert start!45572)

(declare-fun b!501708 () Bool)

(declare-fun e!293907 () Bool)

(declare-fun e!293900 () Bool)

(assert (=> b!501708 (= e!293907 e!293900)))

(declare-fun res!303268 () Bool)

(assert (=> b!501708 (=> res!303268 e!293900)))

(declare-fun lt!227958 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3967 0))(
  ( (MissingZero!3967 (index!18056 (_ BitVec 32))) (Found!3967 (index!18057 (_ BitVec 32))) (Intermediate!3967 (undefined!4779 Bool) (index!18058 (_ BitVec 32)) (x!47237 (_ BitVec 32))) (Undefined!3967) (MissingVacant!3967 (index!18059 (_ BitVec 32))) )
))
(declare-fun lt!227963 () SeekEntryResult!3967)

(declare-datatypes ((array!32329 0))(
  ( (array!32330 (arr!15544 (Array (_ BitVec 32) (_ BitVec 64))) (size!15908 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32329)

(assert (=> b!501708 (= res!303268 (or (bvsgt (x!47237 lt!227963) #b01111111111111111111111111111110) (bvslt lt!227958 #b00000000000000000000000000000000) (bvsge lt!227958 (size!15908 a!3235)) (bvslt (index!18058 lt!227963) #b00000000000000000000000000000000) (bvsge (index!18058 lt!227963) (size!15908 a!3235)) (not (= lt!227963 (Intermediate!3967 false (index!18058 lt!227963) (x!47237 lt!227963))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501708 (= (index!18058 lt!227963) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15103 0))(
  ( (Unit!15104) )
))
(declare-fun lt!227964 () Unit!15103)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15103)

(assert (=> b!501708 (= lt!227964 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227958 #b00000000000000000000000000000000 (index!18058 lt!227963) (x!47237 lt!227963) mask!3524))))

(assert (=> b!501708 (and (or (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227956 () Unit!15103)

(declare-fun e!293899 () Unit!15103)

(assert (=> b!501708 (= lt!227956 e!293899)))

(declare-fun c!59504 () Bool)

(assert (=> b!501708 (= c!59504 (= (select (arr!15544 a!3235) (index!18058 lt!227963)) (select (arr!15544 a!3235) j!176)))))

(assert (=> b!501708 (and (bvslt (x!47237 lt!227963) #b01111111111111111111111111111110) (or (= (select (arr!15544 a!3235) (index!18058 lt!227963)) (select (arr!15544 a!3235) j!176)) (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15544 a!3235) (index!18058 lt!227963)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501709 () Bool)

(declare-fun e!293904 () Bool)

(assert (=> b!501709 (= e!293904 false)))

(declare-fun b!501710 () Bool)

(declare-fun e!293905 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32329 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!501710 (= e!293905 (= (seekEntryOrOpen!0 (select (arr!15544 a!3235) j!176) a!3235 mask!3524) (Found!3967 j!176)))))

(declare-fun b!501711 () Bool)

(declare-fun e!293903 () Bool)

(declare-fun e!293901 () Bool)

(assert (=> b!501711 (= e!293903 e!293901)))

(declare-fun res!303261 () Bool)

(assert (=> b!501711 (=> (not res!303261) (not e!293901))))

(declare-fun lt!227960 () SeekEntryResult!3967)

(assert (=> b!501711 (= res!303261 (or (= lt!227960 (MissingZero!3967 i!1204)) (= lt!227960 (MissingVacant!3967 i!1204))))))

(assert (=> b!501711 (= lt!227960 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501712 () Bool)

(declare-fun res!303265 () Bool)

(assert (=> b!501712 (=> (not res!303265) (not e!293903))))

(declare-fun arrayContainsKey!0 (array!32329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501712 (= res!303265 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!303258 () Bool)

(assert (=> start!45572 (=> (not res!303258) (not e!293903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45572 (= res!303258 (validMask!0 mask!3524))))

(assert (=> start!45572 e!293903))

(assert (=> start!45572 true))

(declare-fun array_inv!11403 (array!32329) Bool)

(assert (=> start!45572 (array_inv!11403 a!3235)))

(declare-fun b!501713 () Bool)

(declare-fun res!303263 () Bool)

(assert (=> b!501713 (=> (not res!303263) (not e!293903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501713 (= res!303263 (validKeyInArray!0 (select (arr!15544 a!3235) j!176)))))

(declare-fun b!501714 () Bool)

(assert (=> b!501714 (= e!293900 true)))

(declare-fun lt!227965 () SeekEntryResult!3967)

(declare-fun lt!227959 () (_ BitVec 64))

(declare-fun lt!227957 () array!32329)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32329 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!501714 (= lt!227965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227958 lt!227959 lt!227957 mask!3524))))

(declare-fun b!501715 () Bool)

(declare-fun e!293902 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32329 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!501715 (= e!293902 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227958 (index!18058 lt!227963) (select (arr!15544 a!3235) j!176) a!3235 mask!3524) (Found!3967 j!176))))))

(declare-fun b!501716 () Bool)

(assert (=> b!501716 (= e!293901 (not e!293907))))

(declare-fun res!303259 () Bool)

(assert (=> b!501716 (=> res!303259 e!293907)))

(declare-fun lt!227961 () (_ BitVec 32))

(assert (=> b!501716 (= res!303259 (= lt!227963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227961 lt!227959 lt!227957 mask!3524)))))

(assert (=> b!501716 (= lt!227963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227958 (select (arr!15544 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501716 (= lt!227961 (toIndex!0 lt!227959 mask!3524))))

(assert (=> b!501716 (= lt!227959 (select (store (arr!15544 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501716 (= lt!227958 (toIndex!0 (select (arr!15544 a!3235) j!176) mask!3524))))

(assert (=> b!501716 (= lt!227957 (array!32330 (store (arr!15544 a!3235) i!1204 k0!2280) (size!15908 a!3235)))))

(assert (=> b!501716 e!293905))

(declare-fun res!303267 () Bool)

(assert (=> b!501716 (=> (not res!303267) (not e!293905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32329 (_ BitVec 32)) Bool)

(assert (=> b!501716 (= res!303267 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227955 () Unit!15103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15103)

(assert (=> b!501716 (= lt!227955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501717 () Bool)

(declare-fun res!303270 () Bool)

(assert (=> b!501717 (=> res!303270 e!293907)))

(get-info :version)

(assert (=> b!501717 (= res!303270 (or (undefined!4779 lt!227963) (not ((_ is Intermediate!3967) lt!227963))))))

(declare-fun b!501718 () Bool)

(declare-fun res!303269 () Bool)

(assert (=> b!501718 (=> (not res!303269) (not e!293901))))

(assert (=> b!501718 (= res!303269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501719 () Bool)

(declare-fun res!303260 () Bool)

(assert (=> b!501719 (=> (not res!303260) (not e!293903))))

(assert (=> b!501719 (= res!303260 (and (= (size!15908 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15908 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15908 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501720 () Bool)

(declare-fun res!303271 () Bool)

(assert (=> b!501720 (=> res!303271 e!293900)))

(assert (=> b!501720 (= res!303271 e!293902)))

(declare-fun res!303264 () Bool)

(assert (=> b!501720 (=> (not res!303264) (not e!293902))))

(assert (=> b!501720 (= res!303264 (bvsgt #b00000000000000000000000000000000 (x!47237 lt!227963)))))

(declare-fun b!501721 () Bool)

(declare-fun Unit!15105 () Unit!15103)

(assert (=> b!501721 (= e!293899 Unit!15105)))

(declare-fun b!501722 () Bool)

(declare-fun Unit!15106 () Unit!15103)

(assert (=> b!501722 (= e!293899 Unit!15106)))

(declare-fun lt!227962 () Unit!15103)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15103)

(assert (=> b!501722 (= lt!227962 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227958 #b00000000000000000000000000000000 (index!18058 lt!227963) (x!47237 lt!227963) mask!3524))))

(declare-fun res!303266 () Bool)

(assert (=> b!501722 (= res!303266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227958 lt!227959 lt!227957 mask!3524) (Intermediate!3967 false (index!18058 lt!227963) (x!47237 lt!227963))))))

(assert (=> b!501722 (=> (not res!303266) (not e!293904))))

(assert (=> b!501722 e!293904))

(declare-fun b!501723 () Bool)

(declare-fun res!303257 () Bool)

(assert (=> b!501723 (=> (not res!303257) (not e!293901))))

(declare-datatypes ((List!9609 0))(
  ( (Nil!9606) (Cons!9605 (h!10482 (_ BitVec 64)) (t!15829 List!9609)) )
))
(declare-fun arrayNoDuplicates!0 (array!32329 (_ BitVec 32) List!9609) Bool)

(assert (=> b!501723 (= res!303257 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9606))))

(declare-fun b!501724 () Bool)

(declare-fun res!303262 () Bool)

(assert (=> b!501724 (=> (not res!303262) (not e!293903))))

(assert (=> b!501724 (= res!303262 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45572 res!303258) b!501719))

(assert (= (and b!501719 res!303260) b!501713))

(assert (= (and b!501713 res!303263) b!501724))

(assert (= (and b!501724 res!303262) b!501712))

(assert (= (and b!501712 res!303265) b!501711))

(assert (= (and b!501711 res!303261) b!501718))

(assert (= (and b!501718 res!303269) b!501723))

(assert (= (and b!501723 res!303257) b!501716))

(assert (= (and b!501716 res!303267) b!501710))

(assert (= (and b!501716 (not res!303259)) b!501717))

(assert (= (and b!501717 (not res!303270)) b!501708))

(assert (= (and b!501708 c!59504) b!501722))

(assert (= (and b!501708 (not c!59504)) b!501721))

(assert (= (and b!501722 res!303266) b!501709))

(assert (= (and b!501708 (not res!303268)) b!501720))

(assert (= (and b!501720 res!303264) b!501715))

(assert (= (and b!501720 (not res!303271)) b!501714))

(declare-fun m!482953 () Bool)

(assert (=> b!501712 m!482953))

(declare-fun m!482955 () Bool)

(assert (=> b!501711 m!482955))

(declare-fun m!482957 () Bool)

(assert (=> b!501713 m!482957))

(assert (=> b!501713 m!482957))

(declare-fun m!482959 () Bool)

(assert (=> b!501713 m!482959))

(declare-fun m!482961 () Bool)

(assert (=> b!501724 m!482961))

(declare-fun m!482963 () Bool)

(assert (=> b!501708 m!482963))

(declare-fun m!482965 () Bool)

(assert (=> b!501708 m!482965))

(assert (=> b!501708 m!482957))

(declare-fun m!482967 () Bool)

(assert (=> b!501714 m!482967))

(declare-fun m!482969 () Bool)

(assert (=> b!501718 m!482969))

(assert (=> b!501716 m!482957))

(declare-fun m!482971 () Bool)

(assert (=> b!501716 m!482971))

(declare-fun m!482973 () Bool)

(assert (=> b!501716 m!482973))

(declare-fun m!482975 () Bool)

(assert (=> b!501716 m!482975))

(assert (=> b!501716 m!482957))

(declare-fun m!482977 () Bool)

(assert (=> b!501716 m!482977))

(declare-fun m!482979 () Bool)

(assert (=> b!501716 m!482979))

(assert (=> b!501716 m!482957))

(declare-fun m!482981 () Bool)

(assert (=> b!501716 m!482981))

(declare-fun m!482983 () Bool)

(assert (=> b!501716 m!482983))

(declare-fun m!482985 () Bool)

(assert (=> b!501716 m!482985))

(declare-fun m!482987 () Bool)

(assert (=> start!45572 m!482987))

(declare-fun m!482989 () Bool)

(assert (=> start!45572 m!482989))

(assert (=> b!501715 m!482957))

(assert (=> b!501715 m!482957))

(declare-fun m!482991 () Bool)

(assert (=> b!501715 m!482991))

(declare-fun m!482993 () Bool)

(assert (=> b!501722 m!482993))

(assert (=> b!501722 m!482967))

(declare-fun m!482995 () Bool)

(assert (=> b!501723 m!482995))

(assert (=> b!501710 m!482957))

(assert (=> b!501710 m!482957))

(declare-fun m!482997 () Bool)

(assert (=> b!501710 m!482997))

(check-sat (not b!501710) (not start!45572) (not b!501708) (not b!501714) (not b!501723) (not b!501711) (not b!501716) (not b!501718) (not b!501712) (not b!501724) (not b!501722) (not b!501715) (not b!501713))
(check-sat)
