; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120092 () Bool)

(assert start!120092)

(declare-fun b!1398202 () Bool)

(declare-fun res!937123 () Bool)

(declare-fun e!791555 () Bool)

(assert (=> b!1398202 (=> (not res!937123) (not e!791555))))

(declare-datatypes ((array!95621 0))(
  ( (array!95622 (arr!46164 (Array (_ BitVec 32) (_ BitVec 64))) (size!46714 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95621)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95621 (_ BitVec 32)) Bool)

(assert (=> b!1398202 (= res!937123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398203 () Bool)

(declare-fun e!791558 () Bool)

(declare-fun e!791554 () Bool)

(assert (=> b!1398203 (= e!791558 e!791554)))

(declare-fun res!937120 () Bool)

(assert (=> b!1398203 (=> res!937120 e!791554)))

(declare-datatypes ((SeekEntryResult!10481 0))(
  ( (MissingZero!10481 (index!44295 (_ BitVec 32))) (Found!10481 (index!44296 (_ BitVec 32))) (Intermediate!10481 (undefined!11293 Bool) (index!44297 (_ BitVec 32)) (x!125943 (_ BitVec 32))) (Undefined!10481) (MissingVacant!10481 (index!44298 (_ BitVec 32))) )
))
(declare-fun lt!614774 () SeekEntryResult!10481)

(declare-fun lt!614773 () SeekEntryResult!10481)

(get-info :version)

(assert (=> b!1398203 (= res!937120 (or (= lt!614774 lt!614773) (not ((_ is Intermediate!10481) lt!614773))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614778 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95621 (_ BitVec 32)) SeekEntryResult!10481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398203 (= lt!614773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614778 mask!2840) lt!614778 (array!95622 (store (arr!46164 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46714 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398203 (= lt!614778 (select (store (arr!46164 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398204 () Bool)

(declare-fun res!937119 () Bool)

(assert (=> b!1398204 (=> (not res!937119) (not e!791555))))

(declare-datatypes ((List!32683 0))(
  ( (Nil!32680) (Cons!32679 (h!33921 (_ BitVec 64)) (t!47377 List!32683)) )
))
(declare-fun arrayNoDuplicates!0 (array!95621 (_ BitVec 32) List!32683) Bool)

(assert (=> b!1398204 (= res!937119 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32680))))

(declare-fun res!937115 () Bool)

(assert (=> start!120092 (=> (not res!937115) (not e!791555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120092 (= res!937115 (validMask!0 mask!2840))))

(assert (=> start!120092 e!791555))

(assert (=> start!120092 true))

(declare-fun array_inv!35192 (array!95621) Bool)

(assert (=> start!120092 (array_inv!35192 a!2901)))

(declare-fun b!1398205 () Bool)

(declare-fun res!937118 () Bool)

(assert (=> b!1398205 (=> (not res!937118) (not e!791555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398205 (= res!937118 (validKeyInArray!0 (select (arr!46164 a!2901) i!1037)))))

(declare-fun b!1398206 () Bool)

(declare-fun res!937116 () Bool)

(assert (=> b!1398206 (=> (not res!937116) (not e!791555))))

(assert (=> b!1398206 (= res!937116 (and (= (size!46714 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46714 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46714 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398207 () Bool)

(declare-fun res!937117 () Bool)

(assert (=> b!1398207 (=> (not res!937117) (not e!791555))))

(assert (=> b!1398207 (= res!937117 (validKeyInArray!0 (select (arr!46164 a!2901) j!112)))))

(declare-fun b!1398208 () Bool)

(assert (=> b!1398208 (= e!791555 (not e!791558))))

(declare-fun res!937121 () Bool)

(assert (=> b!1398208 (=> res!937121 e!791558)))

(assert (=> b!1398208 (= res!937121 (or (not ((_ is Intermediate!10481) lt!614774)) (undefined!11293 lt!614774)))))

(declare-fun e!791557 () Bool)

(assert (=> b!1398208 e!791557))

(declare-fun res!937122 () Bool)

(assert (=> b!1398208 (=> (not res!937122) (not e!791557))))

(assert (=> b!1398208 (= res!937122 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46966 0))(
  ( (Unit!46967) )
))
(declare-fun lt!614777 () Unit!46966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46966)

(assert (=> b!1398208 (= lt!614777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614775 () (_ BitVec 32))

(assert (=> b!1398208 (= lt!614774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614775 (select (arr!46164 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398208 (= lt!614775 (toIndex!0 (select (arr!46164 a!2901) j!112) mask!2840))))

(declare-fun b!1398209 () Bool)

(assert (=> b!1398209 (= e!791554 true)))

(assert (=> b!1398209 (and (not (undefined!11293 lt!614773)) (= (index!44297 lt!614773) i!1037) (bvslt (x!125943 lt!614773) (x!125943 lt!614774)) (= (select (store (arr!46164 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44297 lt!614773)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614776 () Unit!46966)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46966)

(assert (=> b!1398209 (= lt!614776 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614775 (x!125943 lt!614774) (index!44297 lt!614774) (x!125943 lt!614773) (index!44297 lt!614773) (undefined!11293 lt!614773) mask!2840))))

(declare-fun b!1398210 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95621 (_ BitVec 32)) SeekEntryResult!10481)

(assert (=> b!1398210 (= e!791557 (= (seekEntryOrOpen!0 (select (arr!46164 a!2901) j!112) a!2901 mask!2840) (Found!10481 j!112)))))

(assert (= (and start!120092 res!937115) b!1398206))

(assert (= (and b!1398206 res!937116) b!1398205))

(assert (= (and b!1398205 res!937118) b!1398207))

(assert (= (and b!1398207 res!937117) b!1398202))

(assert (= (and b!1398202 res!937123) b!1398204))

(assert (= (and b!1398204 res!937119) b!1398208))

(assert (= (and b!1398208 res!937122) b!1398210))

(assert (= (and b!1398208 (not res!937121)) b!1398203))

(assert (= (and b!1398203 (not res!937120)) b!1398209))

(declare-fun m!1285241 () Bool)

(assert (=> b!1398209 m!1285241))

(declare-fun m!1285243 () Bool)

(assert (=> b!1398209 m!1285243))

(declare-fun m!1285245 () Bool)

(assert (=> b!1398209 m!1285245))

(declare-fun m!1285247 () Bool)

(assert (=> b!1398203 m!1285247))

(assert (=> b!1398203 m!1285241))

(assert (=> b!1398203 m!1285247))

(declare-fun m!1285249 () Bool)

(assert (=> b!1398203 m!1285249))

(declare-fun m!1285251 () Bool)

(assert (=> b!1398203 m!1285251))

(declare-fun m!1285253 () Bool)

(assert (=> b!1398210 m!1285253))

(assert (=> b!1398210 m!1285253))

(declare-fun m!1285255 () Bool)

(assert (=> b!1398210 m!1285255))

(declare-fun m!1285257 () Bool)

(assert (=> b!1398205 m!1285257))

(assert (=> b!1398205 m!1285257))

(declare-fun m!1285259 () Bool)

(assert (=> b!1398205 m!1285259))

(assert (=> b!1398208 m!1285253))

(declare-fun m!1285261 () Bool)

(assert (=> b!1398208 m!1285261))

(assert (=> b!1398208 m!1285253))

(assert (=> b!1398208 m!1285253))

(declare-fun m!1285263 () Bool)

(assert (=> b!1398208 m!1285263))

(declare-fun m!1285265 () Bool)

(assert (=> b!1398208 m!1285265))

(declare-fun m!1285267 () Bool)

(assert (=> b!1398208 m!1285267))

(declare-fun m!1285269 () Bool)

(assert (=> b!1398202 m!1285269))

(declare-fun m!1285271 () Bool)

(assert (=> start!120092 m!1285271))

(declare-fun m!1285273 () Bool)

(assert (=> start!120092 m!1285273))

(assert (=> b!1398207 m!1285253))

(assert (=> b!1398207 m!1285253))

(declare-fun m!1285275 () Bool)

(assert (=> b!1398207 m!1285275))

(declare-fun m!1285277 () Bool)

(assert (=> b!1398204 m!1285277))

(check-sat (not b!1398209) (not b!1398203) (not b!1398202) (not b!1398210) (not b!1398204) (not b!1398207) (not start!120092) (not b!1398205) (not b!1398208))
(check-sat)
