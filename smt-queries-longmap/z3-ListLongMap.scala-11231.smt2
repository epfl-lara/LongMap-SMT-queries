; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131020 () Bool)

(assert start!131020)

(declare-fun b!1537264 () Bool)

(declare-fun res!1054355 () Bool)

(declare-fun e!855559 () Bool)

(assert (=> b!1537264 (=> (not res!1054355) (not e!855559))))

(declare-datatypes ((array!102118 0))(
  ( (array!102119 (arr!49275 (Array (_ BitVec 32) (_ BitVec 64))) (size!49825 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102118)

(declare-datatypes ((List!35749 0))(
  ( (Nil!35746) (Cons!35745 (h!37190 (_ BitVec 64)) (t!50443 List!35749)) )
))
(declare-fun arrayNoDuplicates!0 (array!102118 (_ BitVec 32) List!35749) Bool)

(assert (=> b!1537264 (= res!1054355 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35746))))

(declare-fun b!1537265 () Bool)

(declare-fun res!1054360 () Bool)

(assert (=> b!1537265 (=> (not res!1054360) (not e!855559))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537265 (= res!1054360 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49825 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49825 a!2792)) (= (select (arr!49275 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537266 () Bool)

(declare-fun res!1054357 () Bool)

(assert (=> b!1537266 (=> (not res!1054357) (not e!855559))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537266 (= res!1054357 (validKeyInArray!0 (select (arr!49275 a!2792) j!64)))))

(declare-fun res!1054358 () Bool)

(assert (=> start!131020 (=> (not res!1054358) (not e!855559))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131020 (= res!1054358 (validMask!0 mask!2480))))

(assert (=> start!131020 e!855559))

(assert (=> start!131020 true))

(declare-fun array_inv!38303 (array!102118) Bool)

(assert (=> start!131020 (array_inv!38303 a!2792)))

(declare-fun b!1537267 () Bool)

(declare-fun res!1054353 () Bool)

(declare-fun e!855562 () Bool)

(assert (=> b!1537267 (=> (not res!1054353) (not e!855562))))

(assert (=> b!1537267 (= res!1054353 (not (= (select (arr!49275 a!2792) index!463) (select (arr!49275 a!2792) j!64))))))

(declare-fun b!1537268 () Bool)

(declare-fun e!855558 () Bool)

(assert (=> b!1537268 (= e!855562 e!855558)))

(declare-fun res!1054350 () Bool)

(assert (=> b!1537268 (=> (not res!1054350) (not e!855558))))

(declare-fun lt!664654 () (_ BitVec 32))

(assert (=> b!1537268 (= res!1054350 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664654 #b00000000000000000000000000000000) (bvslt lt!664654 (size!49825 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537268 (= lt!664654 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537269 () Bool)

(declare-fun res!1054356 () Bool)

(assert (=> b!1537269 (=> (not res!1054356) (not e!855559))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537269 (= res!1054356 (validKeyInArray!0 (select (arr!49275 a!2792) i!951)))))

(declare-fun b!1537270 () Bool)

(assert (=> b!1537270 (= e!855559 e!855562)))

(declare-fun res!1054359 () Bool)

(assert (=> b!1537270 (=> (not res!1054359) (not e!855562))))

(declare-datatypes ((SeekEntryResult!13407 0))(
  ( (MissingZero!13407 (index!56023 (_ BitVec 32))) (Found!13407 (index!56024 (_ BitVec 32))) (Intermediate!13407 (undefined!14219 Bool) (index!56025 (_ BitVec 32)) (x!137753 (_ BitVec 32))) (Undefined!13407) (MissingVacant!13407 (index!56026 (_ BitVec 32))) )
))
(declare-fun lt!664653 () SeekEntryResult!13407)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102118 (_ BitVec 32)) SeekEntryResult!13407)

(assert (=> b!1537270 (= res!1054359 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49275 a!2792) j!64) a!2792 mask!2480) lt!664653))))

(assert (=> b!1537270 (= lt!664653 (Found!13407 j!64))))

(declare-fun e!855561 () Bool)

(declare-fun b!1537271 () Bool)

(assert (=> b!1537271 (= e!855561 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!664651 () SeekEntryResult!13407)

(assert (=> b!1537271 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664654 vacantIndex!5 (select (store (arr!49275 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102119 (store (arr!49275 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49825 a!2792)) mask!2480) lt!664651)))

(declare-datatypes ((Unit!51386 0))(
  ( (Unit!51387) )
))
(declare-fun lt!664652 () Unit!51386)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51386)

(assert (=> b!1537271 (= lt!664652 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664654 vacantIndex!5 mask!2480))))

(declare-fun b!1537272 () Bool)

(declare-fun res!1054351 () Bool)

(assert (=> b!1537272 (=> (not res!1054351) (not e!855559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102118 (_ BitVec 32)) Bool)

(assert (=> b!1537272 (= res!1054351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537273 () Bool)

(declare-fun res!1054352 () Bool)

(assert (=> b!1537273 (=> (not res!1054352) (not e!855559))))

(assert (=> b!1537273 (= res!1054352 (and (= (size!49825 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49825 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49825 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537274 () Bool)

(assert (=> b!1537274 (= e!855558 e!855561)))

(declare-fun res!1054354 () Bool)

(assert (=> b!1537274 (=> (not res!1054354) (not e!855561))))

(assert (=> b!1537274 (= res!1054354 (= lt!664651 lt!664653))))

(assert (=> b!1537274 (= lt!664651 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664654 vacantIndex!5 (select (arr!49275 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131020 res!1054358) b!1537273))

(assert (= (and b!1537273 res!1054352) b!1537269))

(assert (= (and b!1537269 res!1054356) b!1537266))

(assert (= (and b!1537266 res!1054357) b!1537272))

(assert (= (and b!1537272 res!1054351) b!1537264))

(assert (= (and b!1537264 res!1054355) b!1537265))

(assert (= (and b!1537265 res!1054360) b!1537270))

(assert (= (and b!1537270 res!1054359) b!1537267))

(assert (= (and b!1537267 res!1054353) b!1537268))

(assert (= (and b!1537268 res!1054350) b!1537274))

(assert (= (and b!1537274 res!1054354) b!1537271))

(declare-fun m!1419763 () Bool)

(assert (=> b!1537267 m!1419763))

(declare-fun m!1419765 () Bool)

(assert (=> b!1537267 m!1419765))

(assert (=> b!1537266 m!1419765))

(assert (=> b!1537266 m!1419765))

(declare-fun m!1419767 () Bool)

(assert (=> b!1537266 m!1419767))

(assert (=> b!1537270 m!1419765))

(assert (=> b!1537270 m!1419765))

(declare-fun m!1419769 () Bool)

(assert (=> b!1537270 m!1419769))

(declare-fun m!1419771 () Bool)

(assert (=> b!1537271 m!1419771))

(declare-fun m!1419773 () Bool)

(assert (=> b!1537271 m!1419773))

(assert (=> b!1537271 m!1419773))

(declare-fun m!1419775 () Bool)

(assert (=> b!1537271 m!1419775))

(declare-fun m!1419777 () Bool)

(assert (=> b!1537271 m!1419777))

(assert (=> b!1537274 m!1419765))

(assert (=> b!1537274 m!1419765))

(declare-fun m!1419779 () Bool)

(assert (=> b!1537274 m!1419779))

(declare-fun m!1419781 () Bool)

(assert (=> b!1537268 m!1419781))

(declare-fun m!1419783 () Bool)

(assert (=> b!1537265 m!1419783))

(declare-fun m!1419785 () Bool)

(assert (=> start!131020 m!1419785))

(declare-fun m!1419787 () Bool)

(assert (=> start!131020 m!1419787))

(declare-fun m!1419789 () Bool)

(assert (=> b!1537272 m!1419789))

(declare-fun m!1419791 () Bool)

(assert (=> b!1537264 m!1419791))

(declare-fun m!1419793 () Bool)

(assert (=> b!1537269 m!1419793))

(assert (=> b!1537269 m!1419793))

(declare-fun m!1419795 () Bool)

(assert (=> b!1537269 m!1419795))

(check-sat (not b!1537266) (not b!1537272) (not b!1537264) (not start!131020) (not b!1537274) (not b!1537269) (not b!1537270) (not b!1537268) (not b!1537271))
(check-sat)
