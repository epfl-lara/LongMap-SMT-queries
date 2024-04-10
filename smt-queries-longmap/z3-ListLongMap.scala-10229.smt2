; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120428 () Bool)

(assert start!120428)

(declare-fun b!1402070 () Bool)

(declare-fun e!793934 () Bool)

(declare-fun e!793936 () Bool)

(assert (=> b!1402070 (= e!793934 e!793936)))

(declare-fun res!940591 () Bool)

(assert (=> b!1402070 (=> res!940591 e!793936)))

(declare-datatypes ((SeekEntryResult!10586 0))(
  ( (MissingZero!10586 (index!44721 (_ BitVec 32))) (Found!10586 (index!44722 (_ BitVec 32))) (Intermediate!10586 (undefined!11398 Bool) (index!44723 (_ BitVec 32)) (x!126349 (_ BitVec 32))) (Undefined!10586) (MissingVacant!10586 (index!44724 (_ BitVec 32))) )
))
(declare-fun lt!617391 () SeekEntryResult!10586)

(declare-fun lt!617390 () SeekEntryResult!10586)

(get-info :version)

(assert (=> b!1402070 (= res!940591 (or (= lt!617391 lt!617390) (not ((_ is Intermediate!10586) lt!617390))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617394 () (_ BitVec 64))

(declare-datatypes ((array!95837 0))(
  ( (array!95838 (arr!46269 (Array (_ BitVec 32) (_ BitVec 64))) (size!46819 (_ BitVec 32))) )
))
(declare-fun lt!617392 () array!95837)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402070 (= lt!617390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617394 mask!2840) lt!617394 lt!617392 mask!2840))))

(declare-fun a!2901 () array!95837)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402070 (= lt!617394 (select (store (arr!46269 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402070 (= lt!617392 (array!95838 (store (arr!46269 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46819 a!2901)))))

(declare-fun b!1402071 () Bool)

(declare-fun res!940586 () Bool)

(declare-fun e!793935 () Bool)

(assert (=> b!1402071 (=> (not res!940586) (not e!793935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402071 (= res!940586 (validKeyInArray!0 (select (arr!46269 a!2901) i!1037)))))

(declare-fun b!1402072 () Bool)

(declare-fun e!793940 () Bool)

(assert (=> b!1402072 (= e!793936 e!793940)))

(declare-fun res!940588 () Bool)

(assert (=> b!1402072 (=> res!940588 e!793940)))

(declare-fun lt!617396 () (_ BitVec 32))

(assert (=> b!1402072 (= res!940588 (or (bvslt (x!126349 lt!617391) #b00000000000000000000000000000000) (bvsgt (x!126349 lt!617391) #b01111111111111111111111111111110) (bvslt (x!126349 lt!617390) #b00000000000000000000000000000000) (bvsgt (x!126349 lt!617390) #b01111111111111111111111111111110) (bvslt lt!617396 #b00000000000000000000000000000000) (bvsge lt!617396 (size!46819 a!2901)) (bvslt (index!44723 lt!617391) #b00000000000000000000000000000000) (bvsge (index!44723 lt!617391) (size!46819 a!2901)) (bvslt (index!44723 lt!617390) #b00000000000000000000000000000000) (bvsge (index!44723 lt!617390) (size!46819 a!2901)) (not (= lt!617391 (Intermediate!10586 false (index!44723 lt!617391) (x!126349 lt!617391)))) (not (= lt!617390 (Intermediate!10586 false (index!44723 lt!617390) (x!126349 lt!617390))))))))

(declare-fun e!793939 () Bool)

(assert (=> b!1402072 e!793939))

(declare-fun res!940581 () Bool)

(assert (=> b!1402072 (=> (not res!940581) (not e!793939))))

(assert (=> b!1402072 (= res!940581 (and (not (undefined!11398 lt!617390)) (= (index!44723 lt!617390) i!1037) (bvslt (x!126349 lt!617390) (x!126349 lt!617391)) (= (select (store (arr!46269 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44723 lt!617390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47176 0))(
  ( (Unit!47177) )
))
(declare-fun lt!617395 () Unit!47176)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47176)

(assert (=> b!1402072 (= lt!617395 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617396 (x!126349 lt!617391) (index!44723 lt!617391) (x!126349 lt!617390) (index!44723 lt!617390) (undefined!11398 lt!617390) mask!2840))))

(declare-fun b!1402073 () Bool)

(declare-fun res!940587 () Bool)

(assert (=> b!1402073 (=> (not res!940587) (not e!793935))))

(declare-datatypes ((List!32788 0))(
  ( (Nil!32785) (Cons!32784 (h!34032 (_ BitVec 64)) (t!47482 List!32788)) )
))
(declare-fun arrayNoDuplicates!0 (array!95837 (_ BitVec 32) List!32788) Bool)

(assert (=> b!1402073 (= res!940587 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32785))))

(declare-fun b!1402074 () Bool)

(declare-fun res!940583 () Bool)

(assert (=> b!1402074 (=> (not res!940583) (not e!793935))))

(assert (=> b!1402074 (= res!940583 (validKeyInArray!0 (select (arr!46269 a!2901) j!112)))))

(declare-fun b!1402075 () Bool)

(assert (=> b!1402075 (= e!793935 (not e!793934))))

(declare-fun res!940584 () Bool)

(assert (=> b!1402075 (=> res!940584 e!793934)))

(assert (=> b!1402075 (= res!940584 (or (not ((_ is Intermediate!10586) lt!617391)) (undefined!11398 lt!617391)))))

(declare-fun e!793937 () Bool)

(assert (=> b!1402075 e!793937))

(declare-fun res!940582 () Bool)

(assert (=> b!1402075 (=> (not res!940582) (not e!793937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95837 (_ BitVec 32)) Bool)

(assert (=> b!1402075 (= res!940582 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617397 () Unit!47176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47176)

(assert (=> b!1402075 (= lt!617397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402075 (= lt!617391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617396 (select (arr!46269 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402075 (= lt!617396 (toIndex!0 (select (arr!46269 a!2901) j!112) mask!2840))))

(declare-fun res!940585 () Bool)

(assert (=> start!120428 (=> (not res!940585) (not e!793935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120428 (= res!940585 (validMask!0 mask!2840))))

(assert (=> start!120428 e!793935))

(assert (=> start!120428 true))

(declare-fun array_inv!35297 (array!95837) Bool)

(assert (=> start!120428 (array_inv!35297 a!2901)))

(declare-fun b!1402076 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10586)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10586)

(assert (=> b!1402076 (= e!793939 (= (seekEntryOrOpen!0 lt!617394 lt!617392 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126349 lt!617390) (index!44723 lt!617390) (index!44723 lt!617390) (select (arr!46269 a!2901) j!112) lt!617392 mask!2840)))))

(declare-fun b!1402077 () Bool)

(declare-fun res!940590 () Bool)

(assert (=> b!1402077 (=> (not res!940590) (not e!793935))))

(assert (=> b!1402077 (= res!940590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402078 () Bool)

(assert (=> b!1402078 (= e!793940 true)))

(declare-fun lt!617393 () SeekEntryResult!10586)

(assert (=> b!1402078 (= lt!617393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617396 lt!617394 lt!617392 mask!2840))))

(declare-fun b!1402079 () Bool)

(declare-fun res!940589 () Bool)

(assert (=> b!1402079 (=> (not res!940589) (not e!793935))))

(assert (=> b!1402079 (= res!940589 (and (= (size!46819 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46819 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46819 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402080 () Bool)

(assert (=> b!1402080 (= e!793937 (= (seekEntryOrOpen!0 (select (arr!46269 a!2901) j!112) a!2901 mask!2840) (Found!10586 j!112)))))

(assert (= (and start!120428 res!940585) b!1402079))

(assert (= (and b!1402079 res!940589) b!1402071))

(assert (= (and b!1402071 res!940586) b!1402074))

(assert (= (and b!1402074 res!940583) b!1402077))

(assert (= (and b!1402077 res!940590) b!1402073))

(assert (= (and b!1402073 res!940587) b!1402075))

(assert (= (and b!1402075 res!940582) b!1402080))

(assert (= (and b!1402075 (not res!940584)) b!1402070))

(assert (= (and b!1402070 (not res!940591)) b!1402072))

(assert (= (and b!1402072 res!940581) b!1402076))

(assert (= (and b!1402072 (not res!940588)) b!1402078))

(declare-fun m!1290065 () Bool)

(assert (=> b!1402076 m!1290065))

(declare-fun m!1290067 () Bool)

(assert (=> b!1402076 m!1290067))

(assert (=> b!1402076 m!1290067))

(declare-fun m!1290069 () Bool)

(assert (=> b!1402076 m!1290069))

(declare-fun m!1290071 () Bool)

(assert (=> b!1402078 m!1290071))

(declare-fun m!1290073 () Bool)

(assert (=> start!120428 m!1290073))

(declare-fun m!1290075 () Bool)

(assert (=> start!120428 m!1290075))

(declare-fun m!1290077 () Bool)

(assert (=> b!1402073 m!1290077))

(declare-fun m!1290079 () Bool)

(assert (=> b!1402070 m!1290079))

(assert (=> b!1402070 m!1290079))

(declare-fun m!1290081 () Bool)

(assert (=> b!1402070 m!1290081))

(declare-fun m!1290083 () Bool)

(assert (=> b!1402070 m!1290083))

(declare-fun m!1290085 () Bool)

(assert (=> b!1402070 m!1290085))

(assert (=> b!1402080 m!1290067))

(assert (=> b!1402080 m!1290067))

(declare-fun m!1290087 () Bool)

(assert (=> b!1402080 m!1290087))

(assert (=> b!1402072 m!1290083))

(declare-fun m!1290089 () Bool)

(assert (=> b!1402072 m!1290089))

(declare-fun m!1290091 () Bool)

(assert (=> b!1402072 m!1290091))

(assert (=> b!1402075 m!1290067))

(declare-fun m!1290093 () Bool)

(assert (=> b!1402075 m!1290093))

(assert (=> b!1402075 m!1290067))

(declare-fun m!1290095 () Bool)

(assert (=> b!1402075 m!1290095))

(declare-fun m!1290097 () Bool)

(assert (=> b!1402075 m!1290097))

(assert (=> b!1402075 m!1290067))

(declare-fun m!1290099 () Bool)

(assert (=> b!1402075 m!1290099))

(declare-fun m!1290101 () Bool)

(assert (=> b!1402071 m!1290101))

(assert (=> b!1402071 m!1290101))

(declare-fun m!1290103 () Bool)

(assert (=> b!1402071 m!1290103))

(declare-fun m!1290105 () Bool)

(assert (=> b!1402077 m!1290105))

(assert (=> b!1402074 m!1290067))

(assert (=> b!1402074 m!1290067))

(declare-fun m!1290107 () Bool)

(assert (=> b!1402074 m!1290107))

(check-sat (not b!1402075) (not b!1402072) (not b!1402070) (not b!1402077) (not start!120428) (not b!1402073) (not b!1402080) (not b!1402078) (not b!1402071) (not b!1402074) (not b!1402076))
(check-sat)
