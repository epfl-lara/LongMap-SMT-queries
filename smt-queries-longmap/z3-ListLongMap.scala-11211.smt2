; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131316 () Bool)

(assert start!131316)

(declare-fun res!1053251 () Bool)

(declare-fun e!856267 () Bool)

(assert (=> start!131316 (=> (not res!1053251) (not e!856267))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131316 (= res!1053251 (validMask!0 mask!2480))))

(assert (=> start!131316 e!856267))

(assert (=> start!131316 true))

(declare-datatypes ((array!102118 0))(
  ( (array!102119 (arr!49267 (Array (_ BitVec 32) (_ BitVec 64))) (size!49818 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102118)

(declare-fun array_inv!38548 (array!102118) Bool)

(assert (=> start!131316 (array_inv!38548 a!2792)))

(declare-fun b!1537739 () Bool)

(declare-fun res!1053255 () Bool)

(assert (=> b!1537739 (=> (not res!1053255) (not e!856267))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537739 (= res!1053255 (validKeyInArray!0 (select (arr!49267 a!2792) i!951)))))

(declare-fun b!1537740 () Bool)

(declare-fun res!1053249 () Bool)

(assert (=> b!1537740 (=> (not res!1053249) (not e!856267))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537740 (= res!1053249 (not (= (select (arr!49267 a!2792) index!463) (select (arr!49267 a!2792) j!64))))))

(declare-fun b!1537741 () Bool)

(declare-fun e!856265 () Bool)

(assert (=> b!1537741 (= e!856267 e!856265)))

(declare-fun res!1053253 () Bool)

(assert (=> b!1537741 (=> (not res!1053253) (not e!856265))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664944 () (_ BitVec 32))

(assert (=> b!1537741 (= res!1053253 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664944 #b00000000000000000000000000000000) (bvslt lt!664944 (size!49818 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537741 (= lt!664944 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537742 () Bool)

(declare-fun res!1053258 () Bool)

(assert (=> b!1537742 (=> (not res!1053258) (not e!856267))))

(declare-datatypes ((List!35728 0))(
  ( (Nil!35725) (Cons!35724 (h!37187 (_ BitVec 64)) (t!50414 List!35728)) )
))
(declare-fun arrayNoDuplicates!0 (array!102118 (_ BitVec 32) List!35728) Bool)

(assert (=> b!1537742 (= res!1053258 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35725))))

(declare-fun b!1537743 () Bool)

(declare-fun res!1053256 () Bool)

(assert (=> b!1537743 (=> (not res!1053256) (not e!856267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102118 (_ BitVec 32)) Bool)

(assert (=> b!1537743 (= res!1053256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537744 () Bool)

(declare-fun res!1053250 () Bool)

(assert (=> b!1537744 (=> (not res!1053250) (not e!856267))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1537744 (= res!1053250 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49818 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49818 a!2792)) (= (select (arr!49267 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537745 () Bool)

(assert (=> b!1537745 (= e!856265 false)))

(declare-datatypes ((SeekEntryResult!13294 0))(
  ( (MissingZero!13294 (index!55571 (_ BitVec 32))) (Found!13294 (index!55572 (_ BitVec 32))) (Intermediate!13294 (undefined!14106 Bool) (index!55573 (_ BitVec 32)) (x!137530 (_ BitVec 32))) (Undefined!13294) (MissingVacant!13294 (index!55574 (_ BitVec 32))) )
))
(declare-fun lt!664943 () SeekEntryResult!13294)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102118 (_ BitVec 32)) SeekEntryResult!13294)

(assert (=> b!1537745 (= lt!664943 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664944 vacantIndex!5 (select (arr!49267 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537746 () Bool)

(declare-fun res!1053257 () Bool)

(assert (=> b!1537746 (=> (not res!1053257) (not e!856267))))

(assert (=> b!1537746 (= res!1053257 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49267 a!2792) j!64) a!2792 mask!2480) (Found!13294 j!64)))))

(declare-fun b!1537747 () Bool)

(declare-fun res!1053254 () Bool)

(assert (=> b!1537747 (=> (not res!1053254) (not e!856267))))

(assert (=> b!1537747 (= res!1053254 (validKeyInArray!0 (select (arr!49267 a!2792) j!64)))))

(declare-fun b!1537748 () Bool)

(declare-fun res!1053252 () Bool)

(assert (=> b!1537748 (=> (not res!1053252) (not e!856267))))

(assert (=> b!1537748 (= res!1053252 (and (= (size!49818 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49818 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49818 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131316 res!1053251) b!1537748))

(assert (= (and b!1537748 res!1053252) b!1537739))

(assert (= (and b!1537739 res!1053255) b!1537747))

(assert (= (and b!1537747 res!1053254) b!1537743))

(assert (= (and b!1537743 res!1053256) b!1537742))

(assert (= (and b!1537742 res!1053258) b!1537744))

(assert (= (and b!1537744 res!1053250) b!1537746))

(assert (= (and b!1537746 res!1053257) b!1537740))

(assert (= (and b!1537740 res!1053249) b!1537741))

(assert (= (and b!1537741 res!1053253) b!1537745))

(declare-fun m!1420075 () Bool)

(assert (=> b!1537743 m!1420075))

(declare-fun m!1420077 () Bool)

(assert (=> b!1537739 m!1420077))

(assert (=> b!1537739 m!1420077))

(declare-fun m!1420079 () Bool)

(assert (=> b!1537739 m!1420079))

(declare-fun m!1420081 () Bool)

(assert (=> b!1537744 m!1420081))

(declare-fun m!1420083 () Bool)

(assert (=> b!1537740 m!1420083))

(declare-fun m!1420085 () Bool)

(assert (=> b!1537740 m!1420085))

(assert (=> b!1537745 m!1420085))

(assert (=> b!1537745 m!1420085))

(declare-fun m!1420087 () Bool)

(assert (=> b!1537745 m!1420087))

(declare-fun m!1420089 () Bool)

(assert (=> b!1537742 m!1420089))

(assert (=> b!1537747 m!1420085))

(assert (=> b!1537747 m!1420085))

(declare-fun m!1420091 () Bool)

(assert (=> b!1537747 m!1420091))

(declare-fun m!1420093 () Bool)

(assert (=> b!1537741 m!1420093))

(declare-fun m!1420095 () Bool)

(assert (=> start!131316 m!1420095))

(declare-fun m!1420097 () Bool)

(assert (=> start!131316 m!1420097))

(assert (=> b!1537746 m!1420085))

(assert (=> b!1537746 m!1420085))

(declare-fun m!1420099 () Bool)

(assert (=> b!1537746 m!1420099))

(check-sat (not b!1537746) (not start!131316) (not b!1537747) (not b!1537745) (not b!1537741) (not b!1537742) (not b!1537739) (not b!1537743))
(check-sat)
