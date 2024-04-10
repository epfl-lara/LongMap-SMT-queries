; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130914 () Bool)

(assert start!130914)

(declare-fun b!1535543 () Bool)

(declare-fun e!854830 () Bool)

(assert (=> b!1535543 (= e!854830 false)))

(declare-datatypes ((SeekEntryResult!13354 0))(
  ( (MissingZero!13354 (index!55811 (_ BitVec 32))) (Found!13354 (index!55812 (_ BitVec 32))) (Intermediate!13354 (undefined!14166 Bool) (index!55813 (_ BitVec 32)) (x!137556 (_ BitVec 32))) (Undefined!13354) (MissingVacant!13354 (index!55814 (_ BitVec 32))) )
))
(declare-fun lt!664081 () SeekEntryResult!13354)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102012 0))(
  ( (array!102013 (arr!49222 (Array (_ BitVec 32) (_ BitVec 64))) (size!49772 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102012)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664080 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102012 (_ BitVec 32)) SeekEntryResult!13354)

(assert (=> b!1535543 (= lt!664081 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664080 vacantIndex!5 (select (arr!49222 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535544 () Bool)

(declare-fun res!1052638 () Bool)

(declare-fun e!854829 () Bool)

(assert (=> b!1535544 (=> (not res!1052638) (not e!854829))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535544 (= res!1052638 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49222 a!2792) j!64) a!2792 mask!2480) (Found!13354 j!64)))))

(declare-fun res!1052635 () Bool)

(assert (=> start!130914 (=> (not res!1052635) (not e!854829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130914 (= res!1052635 (validMask!0 mask!2480))))

(assert (=> start!130914 e!854829))

(assert (=> start!130914 true))

(declare-fun array_inv!38250 (array!102012) Bool)

(assert (=> start!130914 (array_inv!38250 a!2792)))

(declare-fun b!1535545 () Bool)

(declare-fun res!1052636 () Bool)

(assert (=> b!1535545 (=> (not res!1052636) (not e!854829))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535545 (= res!1052636 (validKeyInArray!0 (select (arr!49222 a!2792) i!951)))))

(declare-fun b!1535546 () Bool)

(declare-fun res!1052630 () Bool)

(assert (=> b!1535546 (=> (not res!1052630) (not e!854829))))

(assert (=> b!1535546 (= res!1052630 (and (= (size!49772 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49772 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49772 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535547 () Bool)

(declare-fun res!1052633 () Bool)

(assert (=> b!1535547 (=> (not res!1052633) (not e!854829))))

(assert (=> b!1535547 (= res!1052633 (validKeyInArray!0 (select (arr!49222 a!2792) j!64)))))

(declare-fun b!1535548 () Bool)

(declare-fun res!1052632 () Bool)

(assert (=> b!1535548 (=> (not res!1052632) (not e!854829))))

(declare-datatypes ((List!35696 0))(
  ( (Nil!35693) (Cons!35692 (h!37137 (_ BitVec 64)) (t!50390 List!35696)) )
))
(declare-fun arrayNoDuplicates!0 (array!102012 (_ BitVec 32) List!35696) Bool)

(assert (=> b!1535548 (= res!1052632 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35693))))

(declare-fun b!1535549 () Bool)

(declare-fun res!1052637 () Bool)

(assert (=> b!1535549 (=> (not res!1052637) (not e!854829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102012 (_ BitVec 32)) Bool)

(assert (=> b!1535549 (= res!1052637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535550 () Bool)

(declare-fun res!1052629 () Bool)

(assert (=> b!1535550 (=> (not res!1052629) (not e!854829))))

(assert (=> b!1535550 (= res!1052629 (not (= (select (arr!49222 a!2792) index!463) (select (arr!49222 a!2792) j!64))))))

(declare-fun b!1535551 () Bool)

(declare-fun res!1052631 () Bool)

(assert (=> b!1535551 (=> (not res!1052631) (not e!854829))))

(assert (=> b!1535551 (= res!1052631 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49772 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49772 a!2792)) (= (select (arr!49222 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535552 () Bool)

(assert (=> b!1535552 (= e!854829 e!854830)))

(declare-fun res!1052634 () Bool)

(assert (=> b!1535552 (=> (not res!1052634) (not e!854830))))

(assert (=> b!1535552 (= res!1052634 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664080 #b00000000000000000000000000000000) (bvslt lt!664080 (size!49772 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535552 (= lt!664080 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130914 res!1052635) b!1535546))

(assert (= (and b!1535546 res!1052630) b!1535545))

(assert (= (and b!1535545 res!1052636) b!1535547))

(assert (= (and b!1535547 res!1052633) b!1535549))

(assert (= (and b!1535549 res!1052637) b!1535548))

(assert (= (and b!1535548 res!1052632) b!1535551))

(assert (= (and b!1535551 res!1052631) b!1535544))

(assert (= (and b!1535544 res!1052638) b!1535550))

(assert (= (and b!1535550 res!1052629) b!1535552))

(assert (= (and b!1535552 res!1052634) b!1535543))

(declare-fun m!1418047 () Bool)

(assert (=> b!1535551 m!1418047))

(declare-fun m!1418049 () Bool)

(assert (=> b!1535548 m!1418049))

(declare-fun m!1418051 () Bool)

(assert (=> b!1535545 m!1418051))

(assert (=> b!1535545 m!1418051))

(declare-fun m!1418053 () Bool)

(assert (=> b!1535545 m!1418053))

(declare-fun m!1418055 () Bool)

(assert (=> b!1535543 m!1418055))

(assert (=> b!1535543 m!1418055))

(declare-fun m!1418057 () Bool)

(assert (=> b!1535543 m!1418057))

(declare-fun m!1418059 () Bool)

(assert (=> b!1535549 m!1418059))

(declare-fun m!1418061 () Bool)

(assert (=> b!1535550 m!1418061))

(assert (=> b!1535550 m!1418055))

(declare-fun m!1418063 () Bool)

(assert (=> start!130914 m!1418063))

(declare-fun m!1418065 () Bool)

(assert (=> start!130914 m!1418065))

(assert (=> b!1535544 m!1418055))

(assert (=> b!1535544 m!1418055))

(declare-fun m!1418067 () Bool)

(assert (=> b!1535544 m!1418067))

(assert (=> b!1535547 m!1418055))

(assert (=> b!1535547 m!1418055))

(declare-fun m!1418069 () Bool)

(assert (=> b!1535547 m!1418069))

(declare-fun m!1418071 () Bool)

(assert (=> b!1535552 m!1418071))

(push 1)

(assert (not b!1535547))

(assert (not b!1535545))

(assert (not start!130914))

(assert (not b!1535549))

(assert (not b!1535543))

(assert (not b!1535548))

(assert (not b!1535544))

(assert (not b!1535552))

(check-sat)

