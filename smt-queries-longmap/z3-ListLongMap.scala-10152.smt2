; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119678 () Bool)

(assert start!119678)

(declare-fun b!1394075 () Bool)

(declare-fun res!933488 () Bool)

(declare-fun e!789338 () Bool)

(assert (=> b!1394075 (=> (not res!933488) (not e!789338))))

(declare-datatypes ((array!95360 0))(
  ( (array!95361 (arr!46038 (Array (_ BitVec 32) (_ BitVec 64))) (size!46588 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95360)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95360 (_ BitVec 32)) Bool)

(assert (=> b!1394075 (= res!933488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394076 () Bool)

(declare-fun e!789337 () Bool)

(assert (=> b!1394076 (= e!789337 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10355 0))(
  ( (MissingZero!10355 (index!43791 (_ BitVec 32))) (Found!10355 (index!43792 (_ BitVec 32))) (Intermediate!10355 (undefined!11167 Bool) (index!43793 (_ BitVec 32)) (x!125463 (_ BitVec 32))) (Undefined!10355) (MissingVacant!10355 (index!43794 (_ BitVec 32))) )
))
(declare-fun lt!612229 () SeekEntryResult!10355)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95360 (_ BitVec 32)) SeekEntryResult!10355)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394076 (= lt!612229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46038 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46038 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95361 (store (arr!46038 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46588 a!2901)) mask!2840))))

(declare-fun b!1394077 () Bool)

(assert (=> b!1394077 (= e!789338 (not e!789337))))

(declare-fun res!933487 () Bool)

(assert (=> b!1394077 (=> res!933487 e!789337)))

(declare-fun lt!612231 () SeekEntryResult!10355)

(get-info :version)

(assert (=> b!1394077 (= res!933487 (or (not ((_ is Intermediate!10355) lt!612231)) (undefined!11167 lt!612231)))))

(declare-fun e!789335 () Bool)

(assert (=> b!1394077 e!789335))

(declare-fun res!933483 () Bool)

(assert (=> b!1394077 (=> (not res!933483) (not e!789335))))

(assert (=> b!1394077 (= res!933483 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46714 0))(
  ( (Unit!46715) )
))
(declare-fun lt!612230 () Unit!46714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46714)

(assert (=> b!1394077 (= lt!612230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394077 (= lt!612231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46038 a!2901) j!112) mask!2840) (select (arr!46038 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933490 () Bool)

(assert (=> start!119678 (=> (not res!933490) (not e!789338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119678 (= res!933490 (validMask!0 mask!2840))))

(assert (=> start!119678 e!789338))

(assert (=> start!119678 true))

(declare-fun array_inv!35066 (array!95360) Bool)

(assert (=> start!119678 (array_inv!35066 a!2901)))

(declare-fun b!1394078 () Bool)

(declare-fun res!933484 () Bool)

(assert (=> b!1394078 (=> (not res!933484) (not e!789338))))

(declare-datatypes ((List!32557 0))(
  ( (Nil!32554) (Cons!32553 (h!33786 (_ BitVec 64)) (t!47251 List!32557)) )
))
(declare-fun arrayNoDuplicates!0 (array!95360 (_ BitVec 32) List!32557) Bool)

(assert (=> b!1394078 (= res!933484 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32554))))

(declare-fun b!1394079 () Bool)

(declare-fun res!933485 () Bool)

(assert (=> b!1394079 (=> (not res!933485) (not e!789338))))

(assert (=> b!1394079 (= res!933485 (and (= (size!46588 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46588 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46588 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394080 () Bool)

(declare-fun res!933486 () Bool)

(assert (=> b!1394080 (=> (not res!933486) (not e!789338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394080 (= res!933486 (validKeyInArray!0 (select (arr!46038 a!2901) i!1037)))))

(declare-fun b!1394081 () Bool)

(declare-fun res!933489 () Bool)

(assert (=> b!1394081 (=> (not res!933489) (not e!789338))))

(assert (=> b!1394081 (= res!933489 (validKeyInArray!0 (select (arr!46038 a!2901) j!112)))))

(declare-fun b!1394082 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95360 (_ BitVec 32)) SeekEntryResult!10355)

(assert (=> b!1394082 (= e!789335 (= (seekEntryOrOpen!0 (select (arr!46038 a!2901) j!112) a!2901 mask!2840) (Found!10355 j!112)))))

(assert (= (and start!119678 res!933490) b!1394079))

(assert (= (and b!1394079 res!933485) b!1394080))

(assert (= (and b!1394080 res!933486) b!1394081))

(assert (= (and b!1394081 res!933489) b!1394075))

(assert (= (and b!1394075 res!933488) b!1394078))

(assert (= (and b!1394078 res!933484) b!1394077))

(assert (= (and b!1394077 res!933483) b!1394082))

(assert (= (and b!1394077 (not res!933487)) b!1394076))

(declare-fun m!1280251 () Bool)

(assert (=> b!1394082 m!1280251))

(assert (=> b!1394082 m!1280251))

(declare-fun m!1280253 () Bool)

(assert (=> b!1394082 m!1280253))

(declare-fun m!1280255 () Bool)

(assert (=> b!1394078 m!1280255))

(declare-fun m!1280257 () Bool)

(assert (=> start!119678 m!1280257))

(declare-fun m!1280259 () Bool)

(assert (=> start!119678 m!1280259))

(declare-fun m!1280261 () Bool)

(assert (=> b!1394076 m!1280261))

(declare-fun m!1280263 () Bool)

(assert (=> b!1394076 m!1280263))

(assert (=> b!1394076 m!1280263))

(declare-fun m!1280265 () Bool)

(assert (=> b!1394076 m!1280265))

(assert (=> b!1394076 m!1280265))

(assert (=> b!1394076 m!1280263))

(declare-fun m!1280267 () Bool)

(assert (=> b!1394076 m!1280267))

(declare-fun m!1280269 () Bool)

(assert (=> b!1394075 m!1280269))

(declare-fun m!1280271 () Bool)

(assert (=> b!1394080 m!1280271))

(assert (=> b!1394080 m!1280271))

(declare-fun m!1280273 () Bool)

(assert (=> b!1394080 m!1280273))

(assert (=> b!1394081 m!1280251))

(assert (=> b!1394081 m!1280251))

(declare-fun m!1280275 () Bool)

(assert (=> b!1394081 m!1280275))

(assert (=> b!1394077 m!1280251))

(declare-fun m!1280277 () Bool)

(assert (=> b!1394077 m!1280277))

(assert (=> b!1394077 m!1280251))

(declare-fun m!1280279 () Bool)

(assert (=> b!1394077 m!1280279))

(assert (=> b!1394077 m!1280277))

(assert (=> b!1394077 m!1280251))

(declare-fun m!1280281 () Bool)

(assert (=> b!1394077 m!1280281))

(declare-fun m!1280283 () Bool)

(assert (=> b!1394077 m!1280283))

(check-sat (not b!1394077) (not b!1394078) (not b!1394082) (not start!119678) (not b!1394076) (not b!1394081) (not b!1394080) (not b!1394075))
