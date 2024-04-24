; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131388 () Bool)

(assert start!131388)

(declare-fun res!1054376 () Bool)

(declare-fun e!856686 () Bool)

(assert (=> start!131388 (=> (not res!1054376) (not e!856686))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131388 (= res!1054376 (validMask!0 mask!2480))))

(assert (=> start!131388 e!856686))

(assert (=> start!131388 true))

(declare-datatypes ((array!102190 0))(
  ( (array!102191 (arr!49303 (Array (_ BitVec 32) (_ BitVec 64))) (size!49854 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102190)

(declare-fun array_inv!38584 (array!102190) Bool)

(assert (=> start!131388 (array_inv!38584 a!2792)))

(declare-fun b!1538866 () Bool)

(declare-fun e!856687 () Bool)

(assert (=> b!1538866 (= e!856686 e!856687)))

(declare-fun res!1054384 () Bool)

(assert (=> b!1538866 (=> (not res!1054384) (not e!856687))))

(declare-datatypes ((SeekEntryResult!13330 0))(
  ( (MissingZero!13330 (index!55715 (_ BitVec 32))) (Found!13330 (index!55716 (_ BitVec 32))) (Intermediate!13330 (undefined!14142 Bool) (index!55717 (_ BitVec 32)) (x!137662 (_ BitVec 32))) (Undefined!13330) (MissingVacant!13330 (index!55718 (_ BitVec 32))) )
))
(declare-fun lt!665253 () SeekEntryResult!13330)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102190 (_ BitVec 32)) SeekEntryResult!13330)

(assert (=> b!1538866 (= res!1054384 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49303 a!2792) j!64) a!2792 mask!2480) lt!665253))))

(assert (=> b!1538866 (= lt!665253 (Found!13330 j!64))))

(declare-fun b!1538867 () Bool)

(declare-fun res!1054385 () Bool)

(assert (=> b!1538867 (=> (not res!1054385) (not e!856686))))

(declare-datatypes ((List!35764 0))(
  ( (Nil!35761) (Cons!35760 (h!37223 (_ BitVec 64)) (t!50450 List!35764)) )
))
(declare-fun arrayNoDuplicates!0 (array!102190 (_ BitVec 32) List!35764) Bool)

(assert (=> b!1538867 (= res!1054385 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35761))))

(declare-fun b!1538868 () Bool)

(declare-fun res!1054380 () Bool)

(assert (=> b!1538868 (=> (not res!1054380) (not e!856686))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538868 (= res!1054380 (validKeyInArray!0 (select (arr!49303 a!2792) i!951)))))

(declare-fun b!1538869 () Bool)

(declare-fun e!856684 () Bool)

(assert (=> b!1538869 (= e!856687 e!856684)))

(declare-fun res!1054379 () Bool)

(assert (=> b!1538869 (=> (not res!1054379) (not e!856684))))

(declare-fun lt!665256 () (_ BitVec 32))

(assert (=> b!1538869 (= res!1054379 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665256 #b00000000000000000000000000000000) (bvslt lt!665256 (size!49854 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538869 (= lt!665256 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538870 () Bool)

(declare-fun e!856683 () Bool)

(assert (=> b!1538870 (= e!856684 e!856683)))

(declare-fun res!1054381 () Bool)

(assert (=> b!1538870 (=> (not res!1054381) (not e!856683))))

(declare-fun lt!665255 () SeekEntryResult!13330)

(assert (=> b!1538870 (= res!1054381 (= lt!665255 lt!665253))))

(assert (=> b!1538870 (= lt!665255 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665256 vacantIndex!5 (select (arr!49303 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538871 () Bool)

(assert (=> b!1538871 (= e!856683 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1538871 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665256 vacantIndex!5 (select (store (arr!49303 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102191 (store (arr!49303 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49854 a!2792)) mask!2480) lt!665255)))

(declare-datatypes ((Unit!51269 0))(
  ( (Unit!51270) )
))
(declare-fun lt!665254 () Unit!51269)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51269)

(assert (=> b!1538871 (= lt!665254 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665256 vacantIndex!5 mask!2480))))

(declare-fun b!1538872 () Bool)

(declare-fun res!1054377 () Bool)

(assert (=> b!1538872 (=> (not res!1054377) (not e!856686))))

(assert (=> b!1538872 (= res!1054377 (validKeyInArray!0 (select (arr!49303 a!2792) j!64)))))

(declare-fun b!1538873 () Bool)

(declare-fun res!1054383 () Bool)

(assert (=> b!1538873 (=> (not res!1054383) (not e!856686))))

(assert (=> b!1538873 (= res!1054383 (and (= (size!49854 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49854 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49854 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538874 () Bool)

(declare-fun res!1054378 () Bool)

(assert (=> b!1538874 (=> (not res!1054378) (not e!856686))))

(assert (=> b!1538874 (= res!1054378 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49854 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49854 a!2792)) (= (select (arr!49303 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538875 () Bool)

(declare-fun res!1054386 () Bool)

(assert (=> b!1538875 (=> (not res!1054386) (not e!856686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102190 (_ BitVec 32)) Bool)

(assert (=> b!1538875 (= res!1054386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538876 () Bool)

(declare-fun res!1054382 () Bool)

(assert (=> b!1538876 (=> (not res!1054382) (not e!856687))))

(assert (=> b!1538876 (= res!1054382 (not (= (select (arr!49303 a!2792) index!463) (select (arr!49303 a!2792) j!64))))))

(assert (= (and start!131388 res!1054376) b!1538873))

(assert (= (and b!1538873 res!1054383) b!1538868))

(assert (= (and b!1538868 res!1054380) b!1538872))

(assert (= (and b!1538872 res!1054377) b!1538875))

(assert (= (and b!1538875 res!1054386) b!1538867))

(assert (= (and b!1538867 res!1054385) b!1538874))

(assert (= (and b!1538874 res!1054378) b!1538866))

(assert (= (and b!1538866 res!1054384) b!1538876))

(assert (= (and b!1538876 res!1054382) b!1538869))

(assert (= (and b!1538869 res!1054379) b!1538870))

(assert (= (and b!1538870 res!1054381) b!1538871))

(declare-fun m!1421131 () Bool)

(assert (=> b!1538871 m!1421131))

(declare-fun m!1421133 () Bool)

(assert (=> b!1538871 m!1421133))

(assert (=> b!1538871 m!1421133))

(declare-fun m!1421135 () Bool)

(assert (=> b!1538871 m!1421135))

(declare-fun m!1421137 () Bool)

(assert (=> b!1538871 m!1421137))

(declare-fun m!1421139 () Bool)

(assert (=> b!1538866 m!1421139))

(assert (=> b!1538866 m!1421139))

(declare-fun m!1421141 () Bool)

(assert (=> b!1538866 m!1421141))

(declare-fun m!1421143 () Bool)

(assert (=> b!1538869 m!1421143))

(declare-fun m!1421145 () Bool)

(assert (=> start!131388 m!1421145))

(declare-fun m!1421147 () Bool)

(assert (=> start!131388 m!1421147))

(declare-fun m!1421149 () Bool)

(assert (=> b!1538867 m!1421149))

(declare-fun m!1421151 () Bool)

(assert (=> b!1538874 m!1421151))

(declare-fun m!1421153 () Bool)

(assert (=> b!1538875 m!1421153))

(assert (=> b!1538872 m!1421139))

(assert (=> b!1538872 m!1421139))

(declare-fun m!1421155 () Bool)

(assert (=> b!1538872 m!1421155))

(declare-fun m!1421157 () Bool)

(assert (=> b!1538876 m!1421157))

(assert (=> b!1538876 m!1421139))

(assert (=> b!1538870 m!1421139))

(assert (=> b!1538870 m!1421139))

(declare-fun m!1421159 () Bool)

(assert (=> b!1538870 m!1421159))

(declare-fun m!1421161 () Bool)

(assert (=> b!1538868 m!1421161))

(assert (=> b!1538868 m!1421161))

(declare-fun m!1421163 () Bool)

(assert (=> b!1538868 m!1421163))

(check-sat (not b!1538872) (not b!1538869) (not b!1538866) (not b!1538867) (not start!131388) (not b!1538875) (not b!1538871) (not b!1538868) (not b!1538870))
(check-sat)
