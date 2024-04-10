; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47780 () Bool)

(assert start!47780)

(declare-fun b!526180 () Bool)

(declare-fun res!322840 () Bool)

(declare-fun e!306729 () Bool)

(assert (=> b!526180 (=> (not res!322840) (not e!306729))))

(declare-datatypes ((array!33417 0))(
  ( (array!33418 (arr!16060 (Array (_ BitVec 32) (_ BitVec 64))) (size!16424 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33417)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526180 (= res!322840 (validKeyInArray!0 (select (arr!16060 a!3235) j!176)))))

(declare-fun b!526181 () Bool)

(declare-fun res!322839 () Bool)

(declare-fun e!306733 () Bool)

(assert (=> b!526181 (=> (not res!322839) (not e!306733))))

(declare-datatypes ((List!10218 0))(
  ( (Nil!10215) (Cons!10214 (h!11145 (_ BitVec 64)) (t!16446 List!10218)) )
))
(declare-fun arrayNoDuplicates!0 (array!33417 (_ BitVec 32) List!10218) Bool)

(assert (=> b!526181 (= res!322839 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10215))))

(declare-fun res!322850 () Bool)

(assert (=> start!47780 (=> (not res!322850) (not e!306729))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47780 (= res!322850 (validMask!0 mask!3524))))

(assert (=> start!47780 e!306729))

(assert (=> start!47780 true))

(declare-fun array_inv!11856 (array!33417) Bool)

(assert (=> start!47780 (array_inv!11856 a!3235)))

(declare-fun b!526182 () Bool)

(declare-fun e!306735 () Bool)

(assert (=> b!526182 (= e!306733 (not e!306735))))

(declare-fun res!322846 () Bool)

(assert (=> b!526182 (=> res!322846 e!306735)))

(declare-datatypes ((SeekEntryResult!4527 0))(
  ( (MissingZero!4527 (index!20320 (_ BitVec 32))) (Found!4527 (index!20321 (_ BitVec 32))) (Intermediate!4527 (undefined!5339 Bool) (index!20322 (_ BitVec 32)) (x!49292 (_ BitVec 32))) (Undefined!4527) (MissingVacant!4527 (index!20323 (_ BitVec 32))) )
))
(declare-fun lt!241932 () SeekEntryResult!4527)

(declare-fun lt!241925 () (_ BitVec 64))

(declare-fun lt!241926 () array!33417)

(declare-fun lt!241927 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33417 (_ BitVec 32)) SeekEntryResult!4527)

(assert (=> b!526182 (= res!322846 (= lt!241932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241927 lt!241925 lt!241926 mask!3524)))))

(declare-fun lt!241930 () (_ BitVec 32))

(assert (=> b!526182 (= lt!241932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241930 (select (arr!16060 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526182 (= lt!241927 (toIndex!0 lt!241925 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526182 (= lt!241925 (select (store (arr!16060 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526182 (= lt!241930 (toIndex!0 (select (arr!16060 a!3235) j!176) mask!3524))))

(assert (=> b!526182 (= lt!241926 (array!33418 (store (arr!16060 a!3235) i!1204 k0!2280) (size!16424 a!3235)))))

(declare-fun e!306732 () Bool)

(assert (=> b!526182 e!306732))

(declare-fun res!322849 () Bool)

(assert (=> b!526182 (=> (not res!322849) (not e!306732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33417 (_ BitVec 32)) Bool)

(assert (=> b!526182 (= res!322849 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16560 0))(
  ( (Unit!16561) )
))
(declare-fun lt!241924 () Unit!16560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16560)

(assert (=> b!526182 (= lt!241924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526183 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33417 (_ BitVec 32)) SeekEntryResult!4527)

(assert (=> b!526183 (= e!306732 (= (seekEntryOrOpen!0 (select (arr!16060 a!3235) j!176) a!3235 mask!3524) (Found!4527 j!176)))))

(declare-fun b!526184 () Bool)

(declare-fun res!322847 () Bool)

(assert (=> b!526184 (=> (not res!322847) (not e!306729))))

(assert (=> b!526184 (= res!322847 (and (= (size!16424 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16424 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16424 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526185 () Bool)

(declare-fun res!322848 () Bool)

(assert (=> b!526185 (=> res!322848 e!306735)))

(get-info :version)

(assert (=> b!526185 (= res!322848 (or (undefined!5339 lt!241932) (not ((_ is Intermediate!4527) lt!241932))))))

(declare-fun b!526186 () Bool)

(declare-fun e!306730 () Unit!16560)

(declare-fun Unit!16562 () Unit!16560)

(assert (=> b!526186 (= e!306730 Unit!16562)))

(declare-fun b!526187 () Bool)

(declare-fun res!322841 () Bool)

(assert (=> b!526187 (=> (not res!322841) (not e!306729))))

(assert (=> b!526187 (= res!322841 (validKeyInArray!0 k0!2280))))

(declare-fun b!526188 () Bool)

(declare-fun Unit!16563 () Unit!16560)

(assert (=> b!526188 (= e!306730 Unit!16563)))

(declare-fun lt!241933 () Unit!16560)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16560)

(assert (=> b!526188 (= lt!241933 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241930 #b00000000000000000000000000000000 (index!20322 lt!241932) (x!49292 lt!241932) mask!3524))))

(declare-fun res!322845 () Bool)

(assert (=> b!526188 (= res!322845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241930 lt!241925 lt!241926 mask!3524) (Intermediate!4527 false (index!20322 lt!241932) (x!49292 lt!241932))))))

(declare-fun e!306731 () Bool)

(assert (=> b!526188 (=> (not res!322845) (not e!306731))))

(assert (=> b!526188 e!306731))

(declare-fun b!526189 () Bool)

(declare-fun res!322843 () Bool)

(assert (=> b!526189 (=> (not res!322843) (not e!306733))))

(assert (=> b!526189 (= res!322843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526190 () Bool)

(assert (=> b!526190 (= e!306729 e!306733)))

(declare-fun res!322844 () Bool)

(assert (=> b!526190 (=> (not res!322844) (not e!306733))))

(declare-fun lt!241928 () SeekEntryResult!4527)

(assert (=> b!526190 (= res!322844 (or (= lt!241928 (MissingZero!4527 i!1204)) (= lt!241928 (MissingVacant!4527 i!1204))))))

(assert (=> b!526190 (= lt!241928 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526191 () Bool)

(assert (=> b!526191 (= e!306735 true)))

(assert (=> b!526191 (= (index!20322 lt!241932) i!1204)))

(declare-fun lt!241929 () Unit!16560)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16560)

(assert (=> b!526191 (= lt!241929 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241930 #b00000000000000000000000000000000 (index!20322 lt!241932) (x!49292 lt!241932) mask!3524))))

(assert (=> b!526191 (and (or (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241931 () Unit!16560)

(assert (=> b!526191 (= lt!241931 e!306730)))

(declare-fun c!61976 () Bool)

(assert (=> b!526191 (= c!61976 (= (select (arr!16060 a!3235) (index!20322 lt!241932)) (select (arr!16060 a!3235) j!176)))))

(assert (=> b!526191 (and (bvslt (x!49292 lt!241932) #b01111111111111111111111111111110) (or (= (select (arr!16060 a!3235) (index!20322 lt!241932)) (select (arr!16060 a!3235) j!176)) (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16060 a!3235) (index!20322 lt!241932)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526192 () Bool)

(assert (=> b!526192 (= e!306731 false)))

(declare-fun b!526193 () Bool)

(declare-fun res!322842 () Bool)

(assert (=> b!526193 (=> (not res!322842) (not e!306729))))

(declare-fun arrayContainsKey!0 (array!33417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526193 (= res!322842 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47780 res!322850) b!526184))

(assert (= (and b!526184 res!322847) b!526180))

(assert (= (and b!526180 res!322840) b!526187))

(assert (= (and b!526187 res!322841) b!526193))

(assert (= (and b!526193 res!322842) b!526190))

(assert (= (and b!526190 res!322844) b!526189))

(assert (= (and b!526189 res!322843) b!526181))

(assert (= (and b!526181 res!322839) b!526182))

(assert (= (and b!526182 res!322849) b!526183))

(assert (= (and b!526182 (not res!322846)) b!526185))

(assert (= (and b!526185 (not res!322848)) b!526191))

(assert (= (and b!526191 c!61976) b!526188))

(assert (= (and b!526191 (not c!61976)) b!526186))

(assert (= (and b!526188 res!322845) b!526192))

(declare-fun m!506873 () Bool)

(assert (=> b!526187 m!506873))

(declare-fun m!506875 () Bool)

(assert (=> b!526180 m!506875))

(assert (=> b!526180 m!506875))

(declare-fun m!506877 () Bool)

(assert (=> b!526180 m!506877))

(declare-fun m!506879 () Bool)

(assert (=> start!47780 m!506879))

(declare-fun m!506881 () Bool)

(assert (=> start!47780 m!506881))

(declare-fun m!506883 () Bool)

(assert (=> b!526190 m!506883))

(declare-fun m!506885 () Bool)

(assert (=> b!526188 m!506885))

(declare-fun m!506887 () Bool)

(assert (=> b!526188 m!506887))

(declare-fun m!506889 () Bool)

(assert (=> b!526189 m!506889))

(declare-fun m!506891 () Bool)

(assert (=> b!526181 m!506891))

(assert (=> b!526183 m!506875))

(assert (=> b!526183 m!506875))

(declare-fun m!506893 () Bool)

(assert (=> b!526183 m!506893))

(assert (=> b!526182 m!506875))

(declare-fun m!506895 () Bool)

(assert (=> b!526182 m!506895))

(declare-fun m!506897 () Bool)

(assert (=> b!526182 m!506897))

(assert (=> b!526182 m!506875))

(declare-fun m!506899 () Bool)

(assert (=> b!526182 m!506899))

(assert (=> b!526182 m!506875))

(declare-fun m!506901 () Bool)

(assert (=> b!526182 m!506901))

(declare-fun m!506903 () Bool)

(assert (=> b!526182 m!506903))

(declare-fun m!506905 () Bool)

(assert (=> b!526182 m!506905))

(declare-fun m!506907 () Bool)

(assert (=> b!526182 m!506907))

(declare-fun m!506909 () Bool)

(assert (=> b!526182 m!506909))

(declare-fun m!506911 () Bool)

(assert (=> b!526191 m!506911))

(declare-fun m!506913 () Bool)

(assert (=> b!526191 m!506913))

(assert (=> b!526191 m!506875))

(declare-fun m!506915 () Bool)

(assert (=> b!526193 m!506915))

(check-sat (not b!526189) (not b!526193) (not b!526182) (not b!526183) (not b!526188) (not b!526180) (not b!526181) (not b!526187) (not b!526191) (not start!47780) (not b!526190))
(check-sat)
