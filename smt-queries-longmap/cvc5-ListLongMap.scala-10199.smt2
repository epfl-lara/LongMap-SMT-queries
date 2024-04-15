; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120120 () Bool)

(assert start!120120)

(declare-fun b!1398562 () Bool)

(declare-fun res!937531 () Bool)

(declare-fun e!791767 () Bool)

(assert (=> b!1398562 (=> (not res!937531) (not e!791767))))

(declare-datatypes ((array!95602 0))(
  ( (array!95603 (arr!46155 (Array (_ BitVec 32) (_ BitVec 64))) (size!46707 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95602)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95602 (_ BitVec 32)) Bool)

(assert (=> b!1398562 (= res!937531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398563 () Bool)

(declare-fun e!791768 () Bool)

(declare-fun e!791764 () Bool)

(assert (=> b!1398563 (= e!791768 e!791764)))

(declare-fun res!937526 () Bool)

(assert (=> b!1398563 (=> res!937526 e!791764)))

(declare-datatypes ((SeekEntryResult!10498 0))(
  ( (MissingZero!10498 (index!44363 (_ BitVec 32))) (Found!10498 (index!44364 (_ BitVec 32))) (Intermediate!10498 (undefined!11310 Bool) (index!44365 (_ BitVec 32)) (x!125997 (_ BitVec 32))) (Undefined!10498) (MissingVacant!10498 (index!44366 (_ BitVec 32))) )
))
(declare-fun lt!614872 () SeekEntryResult!10498)

(declare-fun lt!614871 () SeekEntryResult!10498)

(assert (=> b!1398563 (= res!937526 (or (= lt!614872 lt!614871) (not (is-Intermediate!10498 lt!614871))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614874 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95602 (_ BitVec 32)) SeekEntryResult!10498)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398563 (= lt!614871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614874 mask!2840) lt!614874 (array!95603 (store (arr!46155 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46707 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398563 (= lt!614874 (select (store (arr!46155 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398564 () Bool)

(declare-fun res!937527 () Bool)

(assert (=> b!1398564 (=> (not res!937527) (not e!791767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398564 (= res!937527 (validKeyInArray!0 (select (arr!46155 a!2901) i!1037)))))

(declare-fun b!1398565 () Bool)

(assert (=> b!1398565 (= e!791764 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge (index!44365 lt!614871) #b00000000000000000000000000000000) (bvslt (index!44365 lt!614871) (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (=> b!1398565 (and (not (undefined!11310 lt!614871)) (= (index!44365 lt!614871) i!1037) (bvslt (x!125997 lt!614871) (x!125997 lt!614872)) (= (select (store (arr!46155 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44365 lt!614871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46843 0))(
  ( (Unit!46844) )
))
(declare-fun lt!614875 () Unit!46843)

(declare-fun lt!614873 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46843)

(assert (=> b!1398565 (= lt!614875 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614873 (x!125997 lt!614872) (index!44365 lt!614872) (x!125997 lt!614871) (index!44365 lt!614871) (undefined!11310 lt!614871) mask!2840))))

(declare-fun b!1398566 () Bool)

(declare-fun res!937532 () Bool)

(assert (=> b!1398566 (=> (not res!937532) (not e!791767))))

(declare-datatypes ((List!32752 0))(
  ( (Nil!32749) (Cons!32748 (h!33990 (_ BitVec 64)) (t!47438 List!32752)) )
))
(declare-fun arrayNoDuplicates!0 (array!95602 (_ BitVec 32) List!32752) Bool)

(assert (=> b!1398566 (= res!937532 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32749))))

(declare-fun b!1398567 () Bool)

(assert (=> b!1398567 (= e!791767 (not e!791768))))

(declare-fun res!937529 () Bool)

(assert (=> b!1398567 (=> res!937529 e!791768)))

(assert (=> b!1398567 (= res!937529 (or (not (is-Intermediate!10498 lt!614872)) (undefined!11310 lt!614872)))))

(declare-fun e!791766 () Bool)

(assert (=> b!1398567 e!791766))

(declare-fun res!937528 () Bool)

(assert (=> b!1398567 (=> (not res!937528) (not e!791766))))

(assert (=> b!1398567 (= res!937528 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614876 () Unit!46843)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46843)

(assert (=> b!1398567 (= lt!614876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398567 (= lt!614872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614873 (select (arr!46155 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398567 (= lt!614873 (toIndex!0 (select (arr!46155 a!2901) j!112) mask!2840))))

(declare-fun b!1398568 () Bool)

(declare-fun res!937533 () Bool)

(assert (=> b!1398568 (=> (not res!937533) (not e!791767))))

(assert (=> b!1398568 (= res!937533 (validKeyInArray!0 (select (arr!46155 a!2901) j!112)))))

(declare-fun b!1398569 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95602 (_ BitVec 32)) SeekEntryResult!10498)

(assert (=> b!1398569 (= e!791766 (= (seekEntryOrOpen!0 (select (arr!46155 a!2901) j!112) a!2901 mask!2840) (Found!10498 j!112)))))

(declare-fun b!1398570 () Bool)

(declare-fun res!937534 () Bool)

(assert (=> b!1398570 (=> (not res!937534) (not e!791767))))

(assert (=> b!1398570 (= res!937534 (and (= (size!46707 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46707 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46707 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937530 () Bool)

(assert (=> start!120120 (=> (not res!937530) (not e!791767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120120 (= res!937530 (validMask!0 mask!2840))))

(assert (=> start!120120 e!791767))

(assert (=> start!120120 true))

(declare-fun array_inv!35388 (array!95602) Bool)

(assert (=> start!120120 (array_inv!35388 a!2901)))

(assert (= (and start!120120 res!937530) b!1398570))

(assert (= (and b!1398570 res!937534) b!1398564))

(assert (= (and b!1398564 res!937527) b!1398568))

(assert (= (and b!1398568 res!937533) b!1398562))

(assert (= (and b!1398562 res!937531) b!1398566))

(assert (= (and b!1398566 res!937532) b!1398567))

(assert (= (and b!1398567 res!937528) b!1398569))

(assert (= (and b!1398567 (not res!937529)) b!1398563))

(assert (= (and b!1398563 (not res!937526)) b!1398565))

(declare-fun m!1285319 () Bool)

(assert (=> start!120120 m!1285319))

(declare-fun m!1285321 () Bool)

(assert (=> start!120120 m!1285321))

(declare-fun m!1285323 () Bool)

(assert (=> b!1398567 m!1285323))

(declare-fun m!1285325 () Bool)

(assert (=> b!1398567 m!1285325))

(assert (=> b!1398567 m!1285323))

(assert (=> b!1398567 m!1285323))

(declare-fun m!1285327 () Bool)

(assert (=> b!1398567 m!1285327))

(declare-fun m!1285329 () Bool)

(assert (=> b!1398567 m!1285329))

(declare-fun m!1285331 () Bool)

(assert (=> b!1398567 m!1285331))

(assert (=> b!1398569 m!1285323))

(assert (=> b!1398569 m!1285323))

(declare-fun m!1285333 () Bool)

(assert (=> b!1398569 m!1285333))

(declare-fun m!1285335 () Bool)

(assert (=> b!1398563 m!1285335))

(declare-fun m!1285337 () Bool)

(assert (=> b!1398563 m!1285337))

(assert (=> b!1398563 m!1285335))

(declare-fun m!1285339 () Bool)

(assert (=> b!1398563 m!1285339))

(declare-fun m!1285341 () Bool)

(assert (=> b!1398563 m!1285341))

(declare-fun m!1285343 () Bool)

(assert (=> b!1398564 m!1285343))

(assert (=> b!1398564 m!1285343))

(declare-fun m!1285345 () Bool)

(assert (=> b!1398564 m!1285345))

(declare-fun m!1285347 () Bool)

(assert (=> b!1398562 m!1285347))

(assert (=> b!1398565 m!1285337))

(declare-fun m!1285349 () Bool)

(assert (=> b!1398565 m!1285349))

(declare-fun m!1285351 () Bool)

(assert (=> b!1398565 m!1285351))

(assert (=> b!1398568 m!1285323))

(assert (=> b!1398568 m!1285323))

(declare-fun m!1285353 () Bool)

(assert (=> b!1398568 m!1285353))

(declare-fun m!1285355 () Bool)

(assert (=> b!1398566 m!1285355))

(push 1)

(assert (not b!1398565))

(assert (not b!1398562))

(assert (not b!1398564))

(assert (not b!1398567))

(assert (not b!1398566))

(assert (not b!1398563))

(assert (not b!1398568))

(assert (not start!120120))

(assert (not b!1398569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

