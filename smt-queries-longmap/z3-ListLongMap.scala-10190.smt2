; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120062 () Bool)

(assert start!120062)

(declare-fun b!1397770 () Bool)

(declare-fun res!936734 () Bool)

(declare-fun e!791320 () Bool)

(assert (=> b!1397770 (=> (not res!936734) (not e!791320))))

(declare-datatypes ((array!95544 0))(
  ( (array!95545 (arr!46126 (Array (_ BitVec 32) (_ BitVec 64))) (size!46678 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95544)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397770 (= res!936734 (validKeyInArray!0 (select (arr!46126 a!2901) j!112)))))

(declare-fun b!1397771 () Bool)

(declare-fun res!936739 () Bool)

(assert (=> b!1397771 (=> (not res!936739) (not e!791320))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95544 (_ BitVec 32)) Bool)

(assert (=> b!1397771 (= res!936739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397772 () Bool)

(declare-fun e!791321 () Bool)

(assert (=> b!1397772 (= e!791320 (not e!791321))))

(declare-fun res!936737 () Bool)

(assert (=> b!1397772 (=> res!936737 e!791321)))

(declare-datatypes ((SeekEntryResult!10469 0))(
  ( (MissingZero!10469 (index!44247 (_ BitVec 32))) (Found!10469 (index!44248 (_ BitVec 32))) (Intermediate!10469 (undefined!11281 Bool) (index!44249 (_ BitVec 32)) (x!125896 (_ BitVec 32))) (Undefined!10469) (MissingVacant!10469 (index!44250 (_ BitVec 32))) )
))
(declare-fun lt!614335 () SeekEntryResult!10469)

(get-info :version)

(assert (=> b!1397772 (= res!936737 (or (not ((_ is Intermediate!10469) lt!614335)) (undefined!11281 lt!614335)))))

(declare-fun e!791323 () Bool)

(assert (=> b!1397772 e!791323))

(declare-fun res!936738 () Bool)

(assert (=> b!1397772 (=> (not res!936738) (not e!791323))))

(assert (=> b!1397772 (= res!936738 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46785 0))(
  ( (Unit!46786) )
))
(declare-fun lt!614334 () Unit!46785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46785)

(assert (=> b!1397772 (= lt!614334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614333 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95544 (_ BitVec 32)) SeekEntryResult!10469)

(assert (=> b!1397772 (= lt!614335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614333 (select (arr!46126 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397772 (= lt!614333 (toIndex!0 (select (arr!46126 a!2901) j!112) mask!2840))))

(declare-fun res!936741 () Bool)

(assert (=> start!120062 (=> (not res!936741) (not e!791320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120062 (= res!936741 (validMask!0 mask!2840))))

(assert (=> start!120062 e!791320))

(assert (=> start!120062 true))

(declare-fun array_inv!35359 (array!95544) Bool)

(assert (=> start!120062 (array_inv!35359 a!2901)))

(declare-fun b!1397773 () Bool)

(declare-fun e!791324 () Bool)

(assert (=> b!1397773 (= e!791321 e!791324)))

(declare-fun res!936736 () Bool)

(assert (=> b!1397773 (=> res!936736 e!791324)))

(declare-fun lt!614336 () SeekEntryResult!10469)

(assert (=> b!1397773 (= res!936736 (or (= lt!614335 lt!614336) (not ((_ is Intermediate!10469) lt!614336)) (bvslt (x!125896 lt!614335) #b00000000000000000000000000000000) (bvsgt (x!125896 lt!614335) #b01111111111111111111111111111110) (bvslt lt!614333 #b00000000000000000000000000000000) (bvsge lt!614333 (size!46678 a!2901)) (bvslt (index!44249 lt!614335) #b00000000000000000000000000000000) (bvsge (index!44249 lt!614335) (size!46678 a!2901)) (not (= lt!614335 (Intermediate!10469 false (index!44249 lt!614335) (x!125896 lt!614335)))) (not (= lt!614336 (Intermediate!10469 (undefined!11281 lt!614336) (index!44249 lt!614336) (x!125896 lt!614336))))))))

(declare-fun lt!614338 () array!95544)

(declare-fun lt!614339 () (_ BitVec 64))

(assert (=> b!1397773 (= lt!614336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614339 mask!2840) lt!614339 lt!614338 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397773 (= lt!614339 (select (store (arr!46126 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397773 (= lt!614338 (array!95545 (store (arr!46126 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46678 a!2901)))))

(declare-fun b!1397774 () Bool)

(declare-fun res!936742 () Bool)

(assert (=> b!1397774 (=> (not res!936742) (not e!791320))))

(assert (=> b!1397774 (= res!936742 (validKeyInArray!0 (select (arr!46126 a!2901) i!1037)))))

(declare-fun b!1397775 () Bool)

(declare-fun res!936740 () Bool)

(assert (=> b!1397775 (=> (not res!936740) (not e!791320))))

(declare-datatypes ((List!32723 0))(
  ( (Nil!32720) (Cons!32719 (h!33961 (_ BitVec 64)) (t!47409 List!32723)) )
))
(declare-fun arrayNoDuplicates!0 (array!95544 (_ BitVec 32) List!32723) Bool)

(assert (=> b!1397775 (= res!936740 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32720))))

(declare-fun b!1397776 () Bool)

(assert (=> b!1397776 (= e!791324 true)))

(declare-fun lt!614337 () SeekEntryResult!10469)

(assert (=> b!1397776 (= lt!614337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614333 lt!614339 lt!614338 mask!2840))))

(declare-fun b!1397777 () Bool)

(declare-fun res!936735 () Bool)

(assert (=> b!1397777 (=> (not res!936735) (not e!791320))))

(assert (=> b!1397777 (= res!936735 (and (= (size!46678 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46678 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46678 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397778 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95544 (_ BitVec 32)) SeekEntryResult!10469)

(assert (=> b!1397778 (= e!791323 (= (seekEntryOrOpen!0 (select (arr!46126 a!2901) j!112) a!2901 mask!2840) (Found!10469 j!112)))))

(assert (= (and start!120062 res!936741) b!1397777))

(assert (= (and b!1397777 res!936735) b!1397774))

(assert (= (and b!1397774 res!936742) b!1397770))

(assert (= (and b!1397770 res!936734) b!1397771))

(assert (= (and b!1397771 res!936739) b!1397775))

(assert (= (and b!1397775 res!936740) b!1397772))

(assert (= (and b!1397772 res!936738) b!1397778))

(assert (= (and b!1397772 (not res!936737)) b!1397773))

(assert (= (and b!1397773 (not res!936736)) b!1397776))

(declare-fun m!1284223 () Bool)

(assert (=> b!1397774 m!1284223))

(assert (=> b!1397774 m!1284223))

(declare-fun m!1284225 () Bool)

(assert (=> b!1397774 m!1284225))

(declare-fun m!1284227 () Bool)

(assert (=> b!1397775 m!1284227))

(declare-fun m!1284229 () Bool)

(assert (=> b!1397778 m!1284229))

(assert (=> b!1397778 m!1284229))

(declare-fun m!1284231 () Bool)

(assert (=> b!1397778 m!1284231))

(declare-fun m!1284233 () Bool)

(assert (=> start!120062 m!1284233))

(declare-fun m!1284235 () Bool)

(assert (=> start!120062 m!1284235))

(declare-fun m!1284237 () Bool)

(assert (=> b!1397771 m!1284237))

(declare-fun m!1284239 () Bool)

(assert (=> b!1397773 m!1284239))

(assert (=> b!1397773 m!1284239))

(declare-fun m!1284241 () Bool)

(assert (=> b!1397773 m!1284241))

(declare-fun m!1284243 () Bool)

(assert (=> b!1397773 m!1284243))

(declare-fun m!1284245 () Bool)

(assert (=> b!1397773 m!1284245))

(assert (=> b!1397770 m!1284229))

(assert (=> b!1397770 m!1284229))

(declare-fun m!1284247 () Bool)

(assert (=> b!1397770 m!1284247))

(declare-fun m!1284249 () Bool)

(assert (=> b!1397776 m!1284249))

(assert (=> b!1397772 m!1284229))

(declare-fun m!1284251 () Bool)

(assert (=> b!1397772 m!1284251))

(assert (=> b!1397772 m!1284229))

(assert (=> b!1397772 m!1284229))

(declare-fun m!1284253 () Bool)

(assert (=> b!1397772 m!1284253))

(declare-fun m!1284255 () Bool)

(assert (=> b!1397772 m!1284255))

(declare-fun m!1284257 () Bool)

(assert (=> b!1397772 m!1284257))

(check-sat (not start!120062) (not b!1397775) (not b!1397774) (not b!1397770) (not b!1397778) (not b!1397771) (not b!1397772) (not b!1397776) (not b!1397773))
(check-sat)
