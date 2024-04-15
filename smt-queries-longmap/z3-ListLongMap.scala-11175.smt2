; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130632 () Bool)

(assert start!130632)

(declare-fun b!1532471 () Bool)

(declare-fun res!1049743 () Bool)

(declare-fun e!853828 () Bool)

(assert (=> b!1532471 (=> (not res!1049743) (not e!853828))))

(declare-datatypes ((array!101728 0))(
  ( (array!101729 (arr!49081 (Array (_ BitVec 32) (_ BitVec 64))) (size!49633 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101728)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532471 (= res!1049743 (validKeyInArray!0 (select (arr!49081 a!2792) j!64)))))

(declare-fun b!1532472 () Bool)

(declare-fun res!1049745 () Bool)

(assert (=> b!1532472 (=> (not res!1049745) (not e!853828))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532472 (= res!1049745 (and (= (size!49633 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49633 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49633 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049744 () Bool)

(assert (=> start!130632 (=> (not res!1049744) (not e!853828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130632 (= res!1049744 (validMask!0 mask!2480))))

(assert (=> start!130632 e!853828))

(assert (=> start!130632 true))

(declare-fun array_inv!38314 (array!101728) Bool)

(assert (=> start!130632 (array_inv!38314 a!2792)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun b!1532473 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532473 (= e!853828 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49633 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49633 a!2792)) (= (select (arr!49081 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1532474 () Bool)

(declare-fun res!1049741 () Bool)

(assert (=> b!1532474 (=> (not res!1049741) (not e!853828))))

(assert (=> b!1532474 (= res!1049741 (validKeyInArray!0 (select (arr!49081 a!2792) i!951)))))

(declare-fun b!1532475 () Bool)

(declare-fun res!1049742 () Bool)

(assert (=> b!1532475 (=> (not res!1049742) (not e!853828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101728 (_ BitVec 32)) Bool)

(assert (=> b!1532475 (= res!1049742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532476 () Bool)

(declare-fun res!1049746 () Bool)

(assert (=> b!1532476 (=> (not res!1049746) (not e!853828))))

(declare-datatypes ((List!35633 0))(
  ( (Nil!35630) (Cons!35629 (h!37075 (_ BitVec 64)) (t!50319 List!35633)) )
))
(declare-fun arrayNoDuplicates!0 (array!101728 (_ BitVec 32) List!35633) Bool)

(assert (=> b!1532476 (= res!1049746 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35630))))

(assert (= (and start!130632 res!1049744) b!1532472))

(assert (= (and b!1532472 res!1049745) b!1532474))

(assert (= (and b!1532474 res!1049741) b!1532471))

(assert (= (and b!1532471 res!1049743) b!1532475))

(assert (= (and b!1532475 res!1049742) b!1532476))

(assert (= (and b!1532476 res!1049746) b!1532473))

(declare-fun m!1414595 () Bool)

(assert (=> b!1532473 m!1414595))

(declare-fun m!1414597 () Bool)

(assert (=> b!1532476 m!1414597))

(declare-fun m!1414599 () Bool)

(assert (=> b!1532475 m!1414599))

(declare-fun m!1414601 () Bool)

(assert (=> b!1532474 m!1414601))

(assert (=> b!1532474 m!1414601))

(declare-fun m!1414603 () Bool)

(assert (=> b!1532474 m!1414603))

(declare-fun m!1414605 () Bool)

(assert (=> start!130632 m!1414605))

(declare-fun m!1414607 () Bool)

(assert (=> start!130632 m!1414607))

(declare-fun m!1414609 () Bool)

(assert (=> b!1532471 m!1414609))

(assert (=> b!1532471 m!1414609))

(declare-fun m!1414611 () Bool)

(assert (=> b!1532471 m!1414611))

(check-sat (not start!130632) (not b!1532474) (not b!1532475) (not b!1532471) (not b!1532476))
(check-sat)
