; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121214 () Bool)

(assert start!121214)

(declare-fun b!1409414 () Bool)

(declare-fun e!797584 () Bool)

(declare-fun e!797583 () Bool)

(assert (=> b!1409414 (= e!797584 (not e!797583))))

(declare-fun res!947136 () Bool)

(assert (=> b!1409414 (=> res!947136 e!797583)))

(declare-datatypes ((SeekEntryResult!10838 0))(
  ( (MissingZero!10838 (index!45729 (_ BitVec 32))) (Found!10838 (index!45730 (_ BitVec 32))) (Intermediate!10838 (undefined!11650 Bool) (index!45731 (_ BitVec 32)) (x!127319 (_ BitVec 32))) (Undefined!10838) (MissingVacant!10838 (index!45732 (_ BitVec 32))) )
))
(declare-fun lt!620713 () SeekEntryResult!10838)

(get-info :version)

(assert (=> b!1409414 (= res!947136 (or (not ((_ is Intermediate!10838) lt!620713)) (undefined!11650 lt!620713)))))

(declare-fun e!797585 () Bool)

(assert (=> b!1409414 e!797585))

(declare-fun res!947143 () Bool)

(assert (=> b!1409414 (=> (not res!947143) (not e!797585))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96368 0))(
  ( (array!96369 (arr!46527 (Array (_ BitVec 32) (_ BitVec 64))) (size!47077 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96368)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96368 (_ BitVec 32)) Bool)

(assert (=> b!1409414 (= res!947143 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47650 0))(
  ( (Unit!47651) )
))
(declare-fun lt!620715 () Unit!47650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47650)

(assert (=> b!1409414 (= lt!620715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96368 (_ BitVec 32)) SeekEntryResult!10838)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409414 (= lt!620713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46527 a!2901) j!112) mask!2840) (select (arr!46527 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409415 () Bool)

(declare-fun res!947137 () Bool)

(assert (=> b!1409415 (=> (not res!947137) (not e!797584))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409415 (= res!947137 (and (= (size!47077 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47077 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47077 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947139 () Bool)

(assert (=> start!121214 (=> (not res!947139) (not e!797584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121214 (= res!947139 (validMask!0 mask!2840))))

(assert (=> start!121214 e!797584))

(assert (=> start!121214 true))

(declare-fun array_inv!35555 (array!96368) Bool)

(assert (=> start!121214 (array_inv!35555 a!2901)))

(declare-fun b!1409416 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96368 (_ BitVec 32)) SeekEntryResult!10838)

(assert (=> b!1409416 (= e!797585 (= (seekEntryOrOpen!0 (select (arr!46527 a!2901) j!112) a!2901 mask!2840) (Found!10838 j!112)))))

(declare-fun b!1409417 () Bool)

(assert (=> b!1409417 (= e!797583 true)))

(declare-fun lt!620714 () SeekEntryResult!10838)

(assert (=> b!1409417 (= lt!620714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46527 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46527 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96369 (store (arr!46527 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47077 a!2901)) mask!2840))))

(declare-fun b!1409418 () Bool)

(declare-fun res!947141 () Bool)

(assert (=> b!1409418 (=> (not res!947141) (not e!797584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409418 (= res!947141 (validKeyInArray!0 (select (arr!46527 a!2901) j!112)))))

(declare-fun b!1409419 () Bool)

(declare-fun res!947142 () Bool)

(assert (=> b!1409419 (=> (not res!947142) (not e!797584))))

(assert (=> b!1409419 (= res!947142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409420 () Bool)

(declare-fun res!947138 () Bool)

(assert (=> b!1409420 (=> (not res!947138) (not e!797584))))

(assert (=> b!1409420 (= res!947138 (validKeyInArray!0 (select (arr!46527 a!2901) i!1037)))))

(declare-fun b!1409421 () Bool)

(declare-fun res!947140 () Bool)

(assert (=> b!1409421 (=> (not res!947140) (not e!797584))))

(declare-datatypes ((List!33046 0))(
  ( (Nil!33043) (Cons!33042 (h!34305 (_ BitVec 64)) (t!47740 List!33046)) )
))
(declare-fun arrayNoDuplicates!0 (array!96368 (_ BitVec 32) List!33046) Bool)

(assert (=> b!1409421 (= res!947140 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33043))))

(assert (= (and start!121214 res!947139) b!1409415))

(assert (= (and b!1409415 res!947137) b!1409420))

(assert (= (and b!1409420 res!947138) b!1409418))

(assert (= (and b!1409418 res!947141) b!1409419))

(assert (= (and b!1409419 res!947142) b!1409421))

(assert (= (and b!1409421 res!947140) b!1409414))

(assert (= (and b!1409414 res!947143) b!1409416))

(assert (= (and b!1409414 (not res!947136)) b!1409417))

(declare-fun m!1299121 () Bool)

(assert (=> b!1409414 m!1299121))

(declare-fun m!1299123 () Bool)

(assert (=> b!1409414 m!1299123))

(assert (=> b!1409414 m!1299121))

(declare-fun m!1299125 () Bool)

(assert (=> b!1409414 m!1299125))

(assert (=> b!1409414 m!1299123))

(assert (=> b!1409414 m!1299121))

(declare-fun m!1299127 () Bool)

(assert (=> b!1409414 m!1299127))

(declare-fun m!1299129 () Bool)

(assert (=> b!1409414 m!1299129))

(assert (=> b!1409416 m!1299121))

(assert (=> b!1409416 m!1299121))

(declare-fun m!1299131 () Bool)

(assert (=> b!1409416 m!1299131))

(declare-fun m!1299133 () Bool)

(assert (=> b!1409420 m!1299133))

(assert (=> b!1409420 m!1299133))

(declare-fun m!1299135 () Bool)

(assert (=> b!1409420 m!1299135))

(declare-fun m!1299137 () Bool)

(assert (=> b!1409419 m!1299137))

(assert (=> b!1409418 m!1299121))

(assert (=> b!1409418 m!1299121))

(declare-fun m!1299139 () Bool)

(assert (=> b!1409418 m!1299139))

(declare-fun m!1299141 () Bool)

(assert (=> b!1409421 m!1299141))

(declare-fun m!1299143 () Bool)

(assert (=> start!121214 m!1299143))

(declare-fun m!1299145 () Bool)

(assert (=> start!121214 m!1299145))

(declare-fun m!1299147 () Bool)

(assert (=> b!1409417 m!1299147))

(declare-fun m!1299149 () Bool)

(assert (=> b!1409417 m!1299149))

(assert (=> b!1409417 m!1299149))

(declare-fun m!1299151 () Bool)

(assert (=> b!1409417 m!1299151))

(assert (=> b!1409417 m!1299151))

(assert (=> b!1409417 m!1299149))

(declare-fun m!1299153 () Bool)

(assert (=> b!1409417 m!1299153))

(check-sat (not b!1409418) (not start!121214) (not b!1409414) (not b!1409419) (not b!1409416) (not b!1409420) (not b!1409417) (not b!1409421))
