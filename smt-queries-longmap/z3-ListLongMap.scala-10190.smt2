; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120254 () Bool)

(assert start!120254)

(declare-fun b!1398991 () Bool)

(declare-fun e!792097 () Bool)

(assert (=> b!1398991 (= e!792097 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95705 0))(
  ( (array!95706 (arr!46204 (Array (_ BitVec 32) (_ BitVec 64))) (size!46755 (_ BitVec 32))) )
))
(declare-fun lt!614925 () array!95705)

(declare-datatypes ((SeekEntryResult!10424 0))(
  ( (MissingZero!10424 (index!44067 (_ BitVec 32))) (Found!10424 (index!44068 (_ BitVec 32))) (Intermediate!10424 (undefined!11236 Bool) (index!44069 (_ BitVec 32)) (x!125873 (_ BitVec 32))) (Undefined!10424) (MissingVacant!10424 (index!44070 (_ BitVec 32))) )
))
(declare-fun lt!614922 () SeekEntryResult!10424)

(declare-fun lt!614926 () (_ BitVec 64))

(declare-fun lt!614923 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95705 (_ BitVec 32)) SeekEntryResult!10424)

(assert (=> b!1398991 (= lt!614922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614923 lt!614926 lt!614925 mask!2840))))

(declare-fun res!937228 () Bool)

(declare-fun e!792101 () Bool)

(assert (=> start!120254 (=> (not res!937228) (not e!792101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120254 (= res!937228 (validMask!0 mask!2840))))

(assert (=> start!120254 e!792101))

(assert (=> start!120254 true))

(declare-fun a!2901 () array!95705)

(declare-fun array_inv!35485 (array!95705) Bool)

(assert (=> start!120254 (array_inv!35485 a!2901)))

(declare-fun b!1398992 () Bool)

(declare-fun res!937226 () Bool)

(assert (=> b!1398992 (=> (not res!937226) (not e!792101))))

(declare-datatypes ((List!32710 0))(
  ( (Nil!32707) (Cons!32706 (h!33956 (_ BitVec 64)) (t!47396 List!32710)) )
))
(declare-fun arrayNoDuplicates!0 (array!95705 (_ BitVec 32) List!32710) Bool)

(assert (=> b!1398992 (= res!937226 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32707))))

(declare-fun b!1398993 () Bool)

(declare-fun res!937225 () Bool)

(assert (=> b!1398993 (=> (not res!937225) (not e!792101))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398993 (= res!937225 (validKeyInArray!0 (select (arr!46204 a!2901) i!1037)))))

(declare-fun b!1398994 () Bool)

(declare-fun res!937222 () Bool)

(assert (=> b!1398994 (=> (not res!937222) (not e!792101))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398994 (= res!937222 (validKeyInArray!0 (select (arr!46204 a!2901) j!112)))))

(declare-fun b!1398995 () Bool)

(declare-fun res!937220 () Bool)

(assert (=> b!1398995 (=> (not res!937220) (not e!792101))))

(assert (=> b!1398995 (= res!937220 (and (= (size!46755 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46755 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46755 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398996 () Bool)

(declare-fun e!792099 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95705 (_ BitVec 32)) SeekEntryResult!10424)

(assert (=> b!1398996 (= e!792099 (= (seekEntryOrOpen!0 (select (arr!46204 a!2901) j!112) a!2901 mask!2840) (Found!10424 j!112)))))

(declare-fun b!1398997 () Bool)

(declare-fun res!937227 () Bool)

(assert (=> b!1398997 (=> (not res!937227) (not e!792101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95705 (_ BitVec 32)) Bool)

(assert (=> b!1398997 (= res!937227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398998 () Bool)

(declare-fun e!792098 () Bool)

(assert (=> b!1398998 (= e!792101 (not e!792098))))

(declare-fun res!937221 () Bool)

(assert (=> b!1398998 (=> res!937221 e!792098)))

(declare-fun lt!614924 () SeekEntryResult!10424)

(get-info :version)

(assert (=> b!1398998 (= res!937221 (or (not ((_ is Intermediate!10424) lt!614924)) (undefined!11236 lt!614924)))))

(assert (=> b!1398998 e!792099))

(declare-fun res!937224 () Bool)

(assert (=> b!1398998 (=> (not res!937224) (not e!792099))))

(assert (=> b!1398998 (= res!937224 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46879 0))(
  ( (Unit!46880) )
))
(declare-fun lt!614927 () Unit!46879)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46879)

(assert (=> b!1398998 (= lt!614927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398998 (= lt!614924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614923 (select (arr!46204 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398998 (= lt!614923 (toIndex!0 (select (arr!46204 a!2901) j!112) mask!2840))))

(declare-fun b!1398999 () Bool)

(assert (=> b!1398999 (= e!792098 e!792097)))

(declare-fun res!937223 () Bool)

(assert (=> b!1398999 (=> res!937223 e!792097)))

(declare-fun lt!614921 () SeekEntryResult!10424)

(assert (=> b!1398999 (= res!937223 (or (= lt!614924 lt!614921) (not ((_ is Intermediate!10424) lt!614921)) (bvslt (x!125873 lt!614924) #b00000000000000000000000000000000) (bvsgt (x!125873 lt!614924) #b01111111111111111111111111111110) (bvslt lt!614923 #b00000000000000000000000000000000) (bvsge lt!614923 (size!46755 a!2901)) (bvslt (index!44069 lt!614924) #b00000000000000000000000000000000) (bvsge (index!44069 lt!614924) (size!46755 a!2901)) (not (= lt!614924 (Intermediate!10424 false (index!44069 lt!614924) (x!125873 lt!614924)))) (not (= lt!614921 (Intermediate!10424 (undefined!11236 lt!614921) (index!44069 lt!614921) (x!125873 lt!614921))))))))

(assert (=> b!1398999 (= lt!614921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614926 mask!2840) lt!614926 lt!614925 mask!2840))))

(assert (=> b!1398999 (= lt!614926 (select (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398999 (= lt!614925 (array!95706 (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46755 a!2901)))))

(assert (= (and start!120254 res!937228) b!1398995))

(assert (= (and b!1398995 res!937220) b!1398993))

(assert (= (and b!1398993 res!937225) b!1398994))

(assert (= (and b!1398994 res!937222) b!1398997))

(assert (= (and b!1398997 res!937227) b!1398992))

(assert (= (and b!1398992 res!937226) b!1398998))

(assert (= (and b!1398998 res!937224) b!1398996))

(assert (= (and b!1398998 (not res!937221)) b!1398999))

(assert (= (and b!1398999 (not res!937223)) b!1398991))

(declare-fun m!1286131 () Bool)

(assert (=> b!1398991 m!1286131))

(declare-fun m!1286133 () Bool)

(assert (=> b!1398996 m!1286133))

(assert (=> b!1398996 m!1286133))

(declare-fun m!1286135 () Bool)

(assert (=> b!1398996 m!1286135))

(declare-fun m!1286137 () Bool)

(assert (=> b!1398993 m!1286137))

(assert (=> b!1398993 m!1286137))

(declare-fun m!1286139 () Bool)

(assert (=> b!1398993 m!1286139))

(declare-fun m!1286141 () Bool)

(assert (=> b!1398999 m!1286141))

(assert (=> b!1398999 m!1286141))

(declare-fun m!1286143 () Bool)

(assert (=> b!1398999 m!1286143))

(declare-fun m!1286145 () Bool)

(assert (=> b!1398999 m!1286145))

(declare-fun m!1286147 () Bool)

(assert (=> b!1398999 m!1286147))

(declare-fun m!1286149 () Bool)

(assert (=> b!1398997 m!1286149))

(declare-fun m!1286151 () Bool)

(assert (=> start!120254 m!1286151))

(declare-fun m!1286153 () Bool)

(assert (=> start!120254 m!1286153))

(declare-fun m!1286155 () Bool)

(assert (=> b!1398992 m!1286155))

(assert (=> b!1398998 m!1286133))

(declare-fun m!1286157 () Bool)

(assert (=> b!1398998 m!1286157))

(declare-fun m!1286159 () Bool)

(assert (=> b!1398998 m!1286159))

(declare-fun m!1286161 () Bool)

(assert (=> b!1398998 m!1286161))

(assert (=> b!1398998 m!1286133))

(declare-fun m!1286163 () Bool)

(assert (=> b!1398998 m!1286163))

(assert (=> b!1398998 m!1286133))

(assert (=> b!1398994 m!1286133))

(assert (=> b!1398994 m!1286133))

(declare-fun m!1286165 () Bool)

(assert (=> b!1398994 m!1286165))

(check-sat (not b!1398999) (not b!1398993) (not b!1398997) (not b!1398992) (not b!1398994) (not start!120254) (not b!1398998) (not b!1398991) (not b!1398996))
(check-sat)
