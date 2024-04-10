; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131064 () Bool)

(assert start!131064)

(declare-fun res!1054865 () Bool)

(declare-fun e!855756 () Bool)

(assert (=> start!131064 (=> (not res!1054865) (not e!855756))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131064 (= res!1054865 (validMask!0 mask!2480))))

(assert (=> start!131064 e!855756))

(assert (=> start!131064 true))

(declare-datatypes ((array!102162 0))(
  ( (array!102163 (arr!49297 (Array (_ BitVec 32) (_ BitVec 64))) (size!49847 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102162)

(declare-fun array_inv!38325 (array!102162) Bool)

(assert (=> start!131064 (array_inv!38325 a!2792)))

(declare-fun b!1537778 () Bool)

(declare-fun res!1054866 () Bool)

(assert (=> b!1537778 (=> (not res!1054866) (not e!855756))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537778 (= res!1054866 (validKeyInArray!0 (select (arr!49297 a!2792) j!64)))))

(declare-fun b!1537779 () Bool)

(declare-fun res!1054868 () Bool)

(assert (=> b!1537779 (=> (not res!1054868) (not e!855756))))

(declare-datatypes ((List!35771 0))(
  ( (Nil!35768) (Cons!35767 (h!37212 (_ BitVec 64)) (t!50465 List!35771)) )
))
(declare-fun arrayNoDuplicates!0 (array!102162 (_ BitVec 32) List!35771) Bool)

(assert (=> b!1537779 (= res!1054868 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35768))))

(declare-fun b!1537780 () Bool)

(assert (=> b!1537780 (= e!855756 false)))

(declare-datatypes ((SeekEntryResult!13423 0))(
  ( (MissingZero!13423 (index!56087 (_ BitVec 32))) (Found!13423 (index!56088 (_ BitVec 32))) (Intermediate!13423 (undefined!14235 Bool) (index!56089 (_ BitVec 32)) (x!137825 (_ BitVec 32))) (Undefined!13423) (MissingVacant!13423 (index!56090 (_ BitVec 32))) )
))
(declare-fun lt!664783 () SeekEntryResult!13423)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102162 (_ BitVec 32)) SeekEntryResult!13423)

(assert (=> b!1537780 (= lt!664783 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49297 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537781 () Bool)

(declare-fun res!1054870 () Bool)

(assert (=> b!1537781 (=> (not res!1054870) (not e!855756))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537781 (= res!1054870 (validKeyInArray!0 (select (arr!49297 a!2792) i!951)))))

(declare-fun b!1537782 () Bool)

(declare-fun res!1054869 () Bool)

(assert (=> b!1537782 (=> (not res!1054869) (not e!855756))))

(assert (=> b!1537782 (= res!1054869 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49847 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49847 a!2792)) (= (select (arr!49297 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537783 () Bool)

(declare-fun res!1054867 () Bool)

(assert (=> b!1537783 (=> (not res!1054867) (not e!855756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102162 (_ BitVec 32)) Bool)

(assert (=> b!1537783 (= res!1054867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537784 () Bool)

(declare-fun res!1054864 () Bool)

(assert (=> b!1537784 (=> (not res!1054864) (not e!855756))))

(assert (=> b!1537784 (= res!1054864 (and (= (size!49847 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49847 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49847 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131064 res!1054865) b!1537784))

(assert (= (and b!1537784 res!1054864) b!1537781))

(assert (= (and b!1537781 res!1054870) b!1537778))

(assert (= (and b!1537778 res!1054866) b!1537783))

(assert (= (and b!1537783 res!1054867) b!1537779))

(assert (= (and b!1537779 res!1054868) b!1537782))

(assert (= (and b!1537782 res!1054869) b!1537780))

(declare-fun m!1420291 () Bool)

(assert (=> b!1537781 m!1420291))

(assert (=> b!1537781 m!1420291))

(declare-fun m!1420293 () Bool)

(assert (=> b!1537781 m!1420293))

(declare-fun m!1420295 () Bool)

(assert (=> b!1537782 m!1420295))

(declare-fun m!1420297 () Bool)

(assert (=> b!1537778 m!1420297))

(assert (=> b!1537778 m!1420297))

(declare-fun m!1420299 () Bool)

(assert (=> b!1537778 m!1420299))

(declare-fun m!1420301 () Bool)

(assert (=> b!1537779 m!1420301))

(assert (=> b!1537780 m!1420297))

(assert (=> b!1537780 m!1420297))

(declare-fun m!1420303 () Bool)

(assert (=> b!1537780 m!1420303))

(declare-fun m!1420305 () Bool)

(assert (=> start!131064 m!1420305))

(declare-fun m!1420307 () Bool)

(assert (=> start!131064 m!1420307))

(declare-fun m!1420309 () Bool)

(assert (=> b!1537783 m!1420309))

(push 1)

(assert (not b!1537783))

(assert (not b!1537778))

(assert (not b!1537781))

(assert (not b!1537779))

(assert (not start!131064))

(assert (not b!1537780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

