; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47724 () Bool)

(assert start!47724)

(declare-fun b!524985 () Bool)

(declare-fun e!306099 () Bool)

(assert (=> b!524985 (= e!306099 true)))

(declare-datatypes ((SeekEntryResult!4501 0))(
  ( (MissingZero!4501 (index!20216 (_ BitVec 32))) (Found!4501 (index!20217 (_ BitVec 32))) (Intermediate!4501 (undefined!5313 Bool) (index!20218 (_ BitVec 32)) (x!49205 (_ BitVec 32))) (Undefined!4501) (MissingVacant!4501 (index!20219 (_ BitVec 32))) )
))
(declare-fun lt!241039 () SeekEntryResult!4501)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524985 (= (index!20218 lt!241039) i!1204)))

(declare-fun lt!241033 () (_ BitVec 32))

(declare-datatypes ((Unit!16450 0))(
  ( (Unit!16451) )
))
(declare-fun lt!241030 () Unit!16450)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33371 0))(
  ( (array!33372 (arr!16037 (Array (_ BitVec 32) (_ BitVec 64))) (size!16402 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33371)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16450)

(assert (=> b!524985 (= lt!241030 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241033 #b00000000000000000000000000000000 (index!20218 lt!241039) (x!49205 lt!241039) mask!3524))))

(assert (=> b!524985 (and (or (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241032 () Unit!16450)

(declare-fun e!306095 () Unit!16450)

(assert (=> b!524985 (= lt!241032 e!306095)))

(declare-fun c!61839 () Bool)

(assert (=> b!524985 (= c!61839 (= (select (arr!16037 a!3235) (index!20218 lt!241039)) (select (arr!16037 a!3235) j!176)))))

(assert (=> b!524985 (and (bvslt (x!49205 lt!241039) #b01111111111111111111111111111110) (or (= (select (arr!16037 a!3235) (index!20218 lt!241039)) (select (arr!16037 a!3235) j!176)) (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16037 a!3235) (index!20218 lt!241039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524986 () Bool)

(declare-fun res!321924 () Bool)

(assert (=> b!524986 (=> res!321924 e!306099)))

(get-info :version)

(assert (=> b!524986 (= res!321924 (or (undefined!5313 lt!241039) (not ((_ is Intermediate!4501) lt!241039))))))

(declare-fun b!524987 () Bool)

(declare-fun res!321918 () Bool)

(declare-fun e!306096 () Bool)

(assert (=> b!524987 (=> (not res!321918) (not e!306096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33371 (_ BitVec 32)) Bool)

(assert (=> b!524987 (= res!321918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524988 () Bool)

(declare-fun res!321923 () Bool)

(declare-fun e!306098 () Bool)

(assert (=> b!524988 (=> (not res!321923) (not e!306098))))

(assert (=> b!524988 (= res!321923 (and (= (size!16402 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16402 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16402 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524989 () Bool)

(declare-fun res!321929 () Bool)

(assert (=> b!524989 (=> (not res!321929) (not e!306098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524989 (= res!321929 (validKeyInArray!0 (select (arr!16037 a!3235) j!176)))))

(declare-fun b!524990 () Bool)

(declare-fun res!321920 () Bool)

(assert (=> b!524990 (=> (not res!321920) (not e!306096))))

(declare-datatypes ((List!10234 0))(
  ( (Nil!10231) (Cons!10230 (h!11161 (_ BitVec 64)) (t!16453 List!10234)) )
))
(declare-fun arrayNoDuplicates!0 (array!33371 (_ BitVec 32) List!10234) Bool)

(assert (=> b!524990 (= res!321920 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10231))))

(declare-fun b!524991 () Bool)

(declare-fun res!321925 () Bool)

(assert (=> b!524991 (=> (not res!321925) (not e!306098))))

(declare-fun arrayContainsKey!0 (array!33371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524991 (= res!321925 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524992 () Bool)

(declare-fun Unit!16452 () Unit!16450)

(assert (=> b!524992 (= e!306095 Unit!16452)))

(declare-fun b!524993 () Bool)

(assert (=> b!524993 (= e!306098 e!306096)))

(declare-fun res!321926 () Bool)

(assert (=> b!524993 (=> (not res!321926) (not e!306096))))

(declare-fun lt!241037 () SeekEntryResult!4501)

(assert (=> b!524993 (= res!321926 (or (= lt!241037 (MissingZero!4501 i!1204)) (= lt!241037 (MissingVacant!4501 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33371 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!524993 (= lt!241037 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524994 () Bool)

(assert (=> b!524994 (= e!306096 (not e!306099))))

(declare-fun res!321928 () Bool)

(assert (=> b!524994 (=> res!321928 e!306099)))

(declare-fun lt!241034 () (_ BitVec 32))

(declare-fun lt!241031 () (_ BitVec 64))

(declare-fun lt!241038 () array!33371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33371 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!524994 (= res!321928 (= lt!241039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241034 lt!241031 lt!241038 mask!3524)))))

(assert (=> b!524994 (= lt!241039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241033 (select (arr!16037 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524994 (= lt!241034 (toIndex!0 lt!241031 mask!3524))))

(assert (=> b!524994 (= lt!241031 (select (store (arr!16037 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524994 (= lt!241033 (toIndex!0 (select (arr!16037 a!3235) j!176) mask!3524))))

(assert (=> b!524994 (= lt!241038 (array!33372 (store (arr!16037 a!3235) i!1204 k0!2280) (size!16402 a!3235)))))

(declare-fun e!306094 () Bool)

(assert (=> b!524994 e!306094))

(declare-fun res!321922 () Bool)

(assert (=> b!524994 (=> (not res!321922) (not e!306094))))

(assert (=> b!524994 (= res!321922 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241035 () Unit!16450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16450)

(assert (=> b!524994 (= lt!241035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524995 () Bool)

(declare-fun res!321921 () Bool)

(assert (=> b!524995 (=> (not res!321921) (not e!306098))))

(assert (=> b!524995 (= res!321921 (validKeyInArray!0 k0!2280))))

(declare-fun b!524996 () Bool)

(declare-fun e!306093 () Bool)

(assert (=> b!524996 (= e!306093 false)))

(declare-fun res!321919 () Bool)

(assert (=> start!47724 (=> (not res!321919) (not e!306098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47724 (= res!321919 (validMask!0 mask!3524))))

(assert (=> start!47724 e!306098))

(assert (=> start!47724 true))

(declare-fun array_inv!11920 (array!33371) Bool)

(assert (=> start!47724 (array_inv!11920 a!3235)))

(declare-fun b!524997 () Bool)

(assert (=> b!524997 (= e!306094 (= (seekEntryOrOpen!0 (select (arr!16037 a!3235) j!176) a!3235 mask!3524) (Found!4501 j!176)))))

(declare-fun b!524998 () Bool)

(declare-fun Unit!16453 () Unit!16450)

(assert (=> b!524998 (= e!306095 Unit!16453)))

(declare-fun lt!241036 () Unit!16450)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16450)

(assert (=> b!524998 (= lt!241036 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241033 #b00000000000000000000000000000000 (index!20218 lt!241039) (x!49205 lt!241039) mask!3524))))

(declare-fun res!321927 () Bool)

(assert (=> b!524998 (= res!321927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241033 lt!241031 lt!241038 mask!3524) (Intermediate!4501 false (index!20218 lt!241039) (x!49205 lt!241039))))))

(assert (=> b!524998 (=> (not res!321927) (not e!306093))))

(assert (=> b!524998 e!306093))

(assert (= (and start!47724 res!321919) b!524988))

(assert (= (and b!524988 res!321923) b!524989))

(assert (= (and b!524989 res!321929) b!524995))

(assert (= (and b!524995 res!321921) b!524991))

(assert (= (and b!524991 res!321925) b!524993))

(assert (= (and b!524993 res!321926) b!524987))

(assert (= (and b!524987 res!321918) b!524990))

(assert (= (and b!524990 res!321920) b!524994))

(assert (= (and b!524994 res!321922) b!524997))

(assert (= (and b!524994 (not res!321928)) b!524986))

(assert (= (and b!524986 (not res!321924)) b!524985))

(assert (= (and b!524985 c!61839) b!524998))

(assert (= (and b!524985 (not c!61839)) b!524992))

(assert (= (and b!524998 res!321927) b!524996))

(declare-fun m!505153 () Bool)

(assert (=> b!524985 m!505153))

(declare-fun m!505155 () Bool)

(assert (=> b!524985 m!505155))

(declare-fun m!505157 () Bool)

(assert (=> b!524985 m!505157))

(assert (=> b!524997 m!505157))

(assert (=> b!524997 m!505157))

(declare-fun m!505159 () Bool)

(assert (=> b!524997 m!505159))

(assert (=> b!524989 m!505157))

(assert (=> b!524989 m!505157))

(declare-fun m!505161 () Bool)

(assert (=> b!524989 m!505161))

(declare-fun m!505163 () Bool)

(assert (=> b!524993 m!505163))

(declare-fun m!505165 () Bool)

(assert (=> b!524990 m!505165))

(declare-fun m!505167 () Bool)

(assert (=> b!524994 m!505167))

(declare-fun m!505169 () Bool)

(assert (=> b!524994 m!505169))

(declare-fun m!505171 () Bool)

(assert (=> b!524994 m!505171))

(assert (=> b!524994 m!505157))

(declare-fun m!505173 () Bool)

(assert (=> b!524994 m!505173))

(assert (=> b!524994 m!505157))

(declare-fun m!505175 () Bool)

(assert (=> b!524994 m!505175))

(declare-fun m!505177 () Bool)

(assert (=> b!524994 m!505177))

(assert (=> b!524994 m!505157))

(declare-fun m!505179 () Bool)

(assert (=> b!524994 m!505179))

(declare-fun m!505181 () Bool)

(assert (=> b!524994 m!505181))

(declare-fun m!505183 () Bool)

(assert (=> start!47724 m!505183))

(declare-fun m!505185 () Bool)

(assert (=> start!47724 m!505185))

(declare-fun m!505187 () Bool)

(assert (=> b!524987 m!505187))

(declare-fun m!505189 () Bool)

(assert (=> b!524995 m!505189))

(declare-fun m!505191 () Bool)

(assert (=> b!524998 m!505191))

(declare-fun m!505193 () Bool)

(assert (=> b!524998 m!505193))

(declare-fun m!505195 () Bool)

(assert (=> b!524991 m!505195))

(check-sat (not b!524995) (not b!524990) (not b!524989) (not b!524993) (not b!524985) (not b!524994) (not b!524987) (not start!47724) (not b!524991) (not b!524998) (not b!524997))
(check-sat)
