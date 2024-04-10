; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130962 () Bool)

(assert start!130962)

(declare-fun b!1536298 () Bool)

(declare-fun res!1053394 () Bool)

(declare-fun e!855114 () Bool)

(assert (=> b!1536298 (=> (not res!1053394) (not e!855114))))

(declare-datatypes ((array!102060 0))(
  ( (array!102061 (arr!49246 (Array (_ BitVec 32) (_ BitVec 64))) (size!49796 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102060)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536298 (= res!1053394 (not (= (select (arr!49246 a!2792) index!463) (select (arr!49246 a!2792) j!64))))))

(declare-fun b!1536299 () Bool)

(declare-fun res!1053385 () Bool)

(declare-fun e!855118 () Bool)

(assert (=> b!1536299 (=> (not res!1053385) (not e!855118))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1536299 (= res!1053385 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49796 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49796 a!2792)) (= (select (arr!49246 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536300 () Bool)

(declare-fun e!855115 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1536300 (= e!855115 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!664295 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13378 0))(
  ( (MissingZero!13378 (index!55907 (_ BitVec 32))) (Found!13378 (index!55908 (_ BitVec 32))) (Intermediate!13378 (undefined!14190 Bool) (index!55909 (_ BitVec 32)) (x!137644 (_ BitVec 32))) (Undefined!13378) (MissingVacant!13378 (index!55910 (_ BitVec 32))) )
))
(declare-fun lt!664296 () SeekEntryResult!13378)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102060 (_ BitVec 32)) SeekEntryResult!13378)

(assert (=> b!1536300 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664295 vacantIndex!5 (select (store (arr!49246 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102061 (store (arr!49246 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49796 a!2792)) mask!2480) lt!664296)))

(declare-datatypes ((Unit!51328 0))(
  ( (Unit!51329) )
))
(declare-fun lt!664297 () Unit!51328)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51328)

(assert (=> b!1536300 (= lt!664297 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664295 vacantIndex!5 mask!2480))))

(declare-fun b!1536301 () Bool)

(declare-fun res!1053388 () Bool)

(assert (=> b!1536301 (=> (not res!1053388) (not e!855118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536301 (= res!1053388 (validKeyInArray!0 (select (arr!49246 a!2792) i!951)))))

(declare-fun b!1536302 () Bool)

(declare-fun e!855117 () Bool)

(assert (=> b!1536302 (= e!855114 e!855117)))

(declare-fun res!1053387 () Bool)

(assert (=> b!1536302 (=> (not res!1053387) (not e!855117))))

(assert (=> b!1536302 (= res!1053387 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664295 #b00000000000000000000000000000000) (bvslt lt!664295 (size!49796 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536302 (= lt!664295 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536304 () Bool)

(assert (=> b!1536304 (= e!855118 e!855114)))

(declare-fun res!1053386 () Bool)

(assert (=> b!1536304 (=> (not res!1053386) (not e!855114))))

(declare-fun lt!664294 () SeekEntryResult!13378)

(assert (=> b!1536304 (= res!1053386 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480) lt!664294))))

(assert (=> b!1536304 (= lt!664294 (Found!13378 j!64))))

(declare-fun b!1536305 () Bool)

(declare-fun res!1053389 () Bool)

(assert (=> b!1536305 (=> (not res!1053389) (not e!855118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102060 (_ BitVec 32)) Bool)

(assert (=> b!1536305 (= res!1053389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536306 () Bool)

(declare-fun res!1053391 () Bool)

(assert (=> b!1536306 (=> (not res!1053391) (not e!855118))))

(assert (=> b!1536306 (= res!1053391 (validKeyInArray!0 (select (arr!49246 a!2792) j!64)))))

(declare-fun b!1536307 () Bool)

(assert (=> b!1536307 (= e!855117 e!855115)))

(declare-fun res!1053390 () Bool)

(assert (=> b!1536307 (=> (not res!1053390) (not e!855115))))

(assert (=> b!1536307 (= res!1053390 (= lt!664296 lt!664294))))

(assert (=> b!1536307 (= lt!664296 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664295 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536308 () Bool)

(declare-fun res!1053393 () Bool)

(assert (=> b!1536308 (=> (not res!1053393) (not e!855118))))

(declare-datatypes ((List!35720 0))(
  ( (Nil!35717) (Cons!35716 (h!37161 (_ BitVec 64)) (t!50414 List!35720)) )
))
(declare-fun arrayNoDuplicates!0 (array!102060 (_ BitVec 32) List!35720) Bool)

(assert (=> b!1536308 (= res!1053393 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35717))))

(declare-fun res!1053392 () Bool)

(assert (=> start!130962 (=> (not res!1053392) (not e!855118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130962 (= res!1053392 (validMask!0 mask!2480))))

(assert (=> start!130962 e!855118))

(assert (=> start!130962 true))

(declare-fun array_inv!38274 (array!102060) Bool)

(assert (=> start!130962 (array_inv!38274 a!2792)))

(declare-fun b!1536303 () Bool)

(declare-fun res!1053384 () Bool)

(assert (=> b!1536303 (=> (not res!1053384) (not e!855118))))

(assert (=> b!1536303 (= res!1053384 (and (= (size!49796 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49796 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49796 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130962 res!1053392) b!1536303))

(assert (= (and b!1536303 res!1053384) b!1536301))

(assert (= (and b!1536301 res!1053388) b!1536306))

(assert (= (and b!1536306 res!1053391) b!1536305))

(assert (= (and b!1536305 res!1053389) b!1536308))

(assert (= (and b!1536308 res!1053393) b!1536299))

(assert (= (and b!1536299 res!1053385) b!1536304))

(assert (= (and b!1536304 res!1053386) b!1536298))

(assert (= (and b!1536298 res!1053394) b!1536302))

(assert (= (and b!1536302 res!1053387) b!1536307))

(assert (= (and b!1536307 res!1053390) b!1536300))

(declare-fun m!1418759 () Bool)

(assert (=> b!1536300 m!1418759))

(declare-fun m!1418761 () Bool)

(assert (=> b!1536300 m!1418761))

(assert (=> b!1536300 m!1418761))

(declare-fun m!1418763 () Bool)

(assert (=> b!1536300 m!1418763))

(declare-fun m!1418765 () Bool)

(assert (=> b!1536300 m!1418765))

(declare-fun m!1418767 () Bool)

(assert (=> b!1536298 m!1418767))

(declare-fun m!1418769 () Bool)

(assert (=> b!1536298 m!1418769))

(assert (=> b!1536306 m!1418769))

(assert (=> b!1536306 m!1418769))

(declare-fun m!1418771 () Bool)

(assert (=> b!1536306 m!1418771))

(declare-fun m!1418773 () Bool)

(assert (=> b!1536299 m!1418773))

(declare-fun m!1418775 () Bool)

(assert (=> b!1536305 m!1418775))

(declare-fun m!1418777 () Bool)

(assert (=> b!1536302 m!1418777))

(declare-fun m!1418779 () Bool)

(assert (=> start!130962 m!1418779))

(declare-fun m!1418781 () Bool)

(assert (=> start!130962 m!1418781))

(declare-fun m!1418783 () Bool)

(assert (=> b!1536308 m!1418783))

(declare-fun m!1418785 () Bool)

(assert (=> b!1536301 m!1418785))

(assert (=> b!1536301 m!1418785))

(declare-fun m!1418787 () Bool)

(assert (=> b!1536301 m!1418787))

(assert (=> b!1536304 m!1418769))

(assert (=> b!1536304 m!1418769))

(declare-fun m!1418789 () Bool)

(assert (=> b!1536304 m!1418789))

(assert (=> b!1536307 m!1418769))

(assert (=> b!1536307 m!1418769))

(declare-fun m!1418791 () Bool)

(assert (=> b!1536307 m!1418791))

(push 1)

(assert (not b!1536302))

(assert (not b!1536305))

(assert (not b!1536308))

(assert (not b!1536300))

(assert (not b!1536307))

(assert (not b!1536301))

(assert (not b!1536304))

(assert (not b!1536306))

(assert (not start!130962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

