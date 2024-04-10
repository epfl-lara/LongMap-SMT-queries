; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131012 () Bool)

(assert start!131012)

(declare-fun b!1537132 () Bool)

(declare-fun res!1054226 () Bool)

(declare-fun e!855499 () Bool)

(assert (=> b!1537132 (=> (not res!1054226) (not e!855499))))

(declare-datatypes ((array!102110 0))(
  ( (array!102111 (arr!49271 (Array (_ BitVec 32) (_ BitVec 64))) (size!49821 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102110)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537132 (= res!1054226 (and (= (size!49821 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49821 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49821 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537133 () Bool)

(declare-fun e!855498 () Bool)

(declare-fun e!855502 () Bool)

(assert (=> b!1537133 (= e!855498 e!855502)))

(declare-fun res!1054224 () Bool)

(assert (=> b!1537133 (=> (not res!1054224) (not e!855502))))

(declare-datatypes ((SeekEntryResult!13403 0))(
  ( (MissingZero!13403 (index!56007 (_ BitVec 32))) (Found!13403 (index!56008 (_ BitVec 32))) (Intermediate!13403 (undefined!14215 Bool) (index!56009 (_ BitVec 32)) (x!137741 (_ BitVec 32))) (Undefined!13403) (MissingVacant!13403 (index!56010 (_ BitVec 32))) )
))
(declare-fun lt!664603 () SeekEntryResult!13403)

(declare-fun lt!664606 () SeekEntryResult!13403)

(assert (=> b!1537133 (= res!1054224 (= lt!664603 lt!664606))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102110 (_ BitVec 32)) SeekEntryResult!13403)

(assert (=> b!1537133 (= lt!664603 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664605 vacantIndex!5 (select (arr!49271 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1054221 () Bool)

(assert (=> start!131012 (=> (not res!1054221) (not e!855499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131012 (= res!1054221 (validMask!0 mask!2480))))

(assert (=> start!131012 e!855499))

(assert (=> start!131012 true))

(declare-fun array_inv!38299 (array!102110) Bool)

(assert (=> start!131012 (array_inv!38299 a!2792)))

(declare-fun b!1537134 () Bool)

(declare-fun res!1054223 () Bool)

(assert (=> b!1537134 (=> (not res!1054223) (not e!855499))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537134 (= res!1054223 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49821 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49821 a!2792)) (= (select (arr!49271 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537135 () Bool)

(declare-fun res!1054219 () Bool)

(declare-fun e!855500 () Bool)

(assert (=> b!1537135 (=> (not res!1054219) (not e!855500))))

(assert (=> b!1537135 (= res!1054219 (not (= (select (arr!49271 a!2792) index!463) (select (arr!49271 a!2792) j!64))))))

(declare-fun b!1537136 () Bool)

(declare-fun res!1054228 () Bool)

(assert (=> b!1537136 (=> (not res!1054228) (not e!855499))))

(declare-datatypes ((List!35745 0))(
  ( (Nil!35742) (Cons!35741 (h!37186 (_ BitVec 64)) (t!50439 List!35745)) )
))
(declare-fun arrayNoDuplicates!0 (array!102110 (_ BitVec 32) List!35745) Bool)

(assert (=> b!1537136 (= res!1054228 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35742))))

(declare-fun b!1537137 () Bool)

(declare-fun res!1054222 () Bool)

(assert (=> b!1537137 (=> (not res!1054222) (not e!855499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102110 (_ BitVec 32)) Bool)

(assert (=> b!1537137 (= res!1054222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537138 () Bool)

(declare-fun res!1054218 () Bool)

(assert (=> b!1537138 (=> (not res!1054218) (not e!855499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537138 (= res!1054218 (validKeyInArray!0 (select (arr!49271 a!2792) j!64)))))

(declare-fun b!1537139 () Bool)

(assert (=> b!1537139 (= e!855502 (not true))))

(assert (=> b!1537139 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664605 vacantIndex!5 (select (store (arr!49271 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102111 (store (arr!49271 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49821 a!2792)) mask!2480) lt!664603)))

(declare-datatypes ((Unit!51378 0))(
  ( (Unit!51379) )
))
(declare-fun lt!664604 () Unit!51378)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51378)

(assert (=> b!1537139 (= lt!664604 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664605 vacantIndex!5 mask!2480))))

(declare-fun b!1537140 () Bool)

(assert (=> b!1537140 (= e!855499 e!855500)))

(declare-fun res!1054220 () Bool)

(assert (=> b!1537140 (=> (not res!1054220) (not e!855500))))

(assert (=> b!1537140 (= res!1054220 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49271 a!2792) j!64) a!2792 mask!2480) lt!664606))))

(assert (=> b!1537140 (= lt!664606 (Found!13403 j!64))))

(declare-fun b!1537141 () Bool)

(assert (=> b!1537141 (= e!855500 e!855498)))

(declare-fun res!1054225 () Bool)

(assert (=> b!1537141 (=> (not res!1054225) (not e!855498))))

(assert (=> b!1537141 (= res!1054225 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664605 #b00000000000000000000000000000000) (bvslt lt!664605 (size!49821 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537141 (= lt!664605 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537142 () Bool)

(declare-fun res!1054227 () Bool)

(assert (=> b!1537142 (=> (not res!1054227) (not e!855499))))

(assert (=> b!1537142 (= res!1054227 (validKeyInArray!0 (select (arr!49271 a!2792) i!951)))))

(assert (= (and start!131012 res!1054221) b!1537132))

(assert (= (and b!1537132 res!1054226) b!1537142))

(assert (= (and b!1537142 res!1054227) b!1537138))

(assert (= (and b!1537138 res!1054218) b!1537137))

(assert (= (and b!1537137 res!1054222) b!1537136))

(assert (= (and b!1537136 res!1054228) b!1537134))

(assert (= (and b!1537134 res!1054223) b!1537140))

(assert (= (and b!1537140 res!1054220) b!1537135))

(assert (= (and b!1537135 res!1054219) b!1537141))

(assert (= (and b!1537141 res!1054225) b!1537133))

(assert (= (and b!1537133 res!1054224) b!1537139))

(declare-fun m!1419627 () Bool)

(assert (=> b!1537134 m!1419627))

(declare-fun m!1419629 () Bool)

(assert (=> b!1537141 m!1419629))

(declare-fun m!1419631 () Bool)

(assert (=> start!131012 m!1419631))

(declare-fun m!1419633 () Bool)

(assert (=> start!131012 m!1419633))

(declare-fun m!1419635 () Bool)

(assert (=> b!1537136 m!1419635))

(declare-fun m!1419637 () Bool)

(assert (=> b!1537140 m!1419637))

(assert (=> b!1537140 m!1419637))

(declare-fun m!1419639 () Bool)

(assert (=> b!1537140 m!1419639))

(declare-fun m!1419641 () Bool)

(assert (=> b!1537137 m!1419641))

(declare-fun m!1419643 () Bool)

(assert (=> b!1537135 m!1419643))

(assert (=> b!1537135 m!1419637))

(declare-fun m!1419645 () Bool)

(assert (=> b!1537142 m!1419645))

(assert (=> b!1537142 m!1419645))

(declare-fun m!1419647 () Bool)

(assert (=> b!1537142 m!1419647))

(declare-fun m!1419649 () Bool)

(assert (=> b!1537139 m!1419649))

(declare-fun m!1419651 () Bool)

(assert (=> b!1537139 m!1419651))

(assert (=> b!1537139 m!1419651))

(declare-fun m!1419653 () Bool)

(assert (=> b!1537139 m!1419653))

(declare-fun m!1419655 () Bool)

(assert (=> b!1537139 m!1419655))

(assert (=> b!1537133 m!1419637))

(assert (=> b!1537133 m!1419637))

(declare-fun m!1419657 () Bool)

(assert (=> b!1537133 m!1419657))

(assert (=> b!1537138 m!1419637))

(assert (=> b!1537138 m!1419637))

(declare-fun m!1419659 () Bool)

(assert (=> b!1537138 m!1419659))

(push 1)

