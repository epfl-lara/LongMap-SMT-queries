; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131062 () Bool)

(assert start!131062)

(declare-fun b!1537757 () Bool)

(declare-fun res!1054846 () Bool)

(declare-fun e!855751 () Bool)

(assert (=> b!1537757 (=> (not res!1054846) (not e!855751))))

(declare-datatypes ((array!102160 0))(
  ( (array!102161 (arr!49296 (Array (_ BitVec 32) (_ BitVec 64))) (size!49846 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102160)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102160 (_ BitVec 32)) Bool)

(assert (=> b!1537757 (= res!1054846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537758 () Bool)

(declare-fun res!1054849 () Bool)

(assert (=> b!1537758 (=> (not res!1054849) (not e!855751))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537758 (= res!1054849 (validKeyInArray!0 (select (arr!49296 a!2792) i!951)))))

(declare-fun b!1537759 () Bool)

(assert (=> b!1537759 (= e!855751 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13422 0))(
  ( (MissingZero!13422 (index!56083 (_ BitVec 32))) (Found!13422 (index!56084 (_ BitVec 32))) (Intermediate!13422 (undefined!14234 Bool) (index!56085 (_ BitVec 32)) (x!137824 (_ BitVec 32))) (Undefined!13422) (MissingVacant!13422 (index!56086 (_ BitVec 32))) )
))
(declare-fun lt!664780 () SeekEntryResult!13422)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102160 (_ BitVec 32)) SeekEntryResult!13422)

(assert (=> b!1537759 (= lt!664780 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49296 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537760 () Bool)

(declare-fun res!1054844 () Bool)

(assert (=> b!1537760 (=> (not res!1054844) (not e!855751))))

(assert (=> b!1537760 (= res!1054844 (and (= (size!49846 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49846 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49846 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537761 () Bool)

(declare-fun res!1054843 () Bool)

(assert (=> b!1537761 (=> (not res!1054843) (not e!855751))))

(assert (=> b!1537761 (= res!1054843 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49846 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49846 a!2792)) (= (select (arr!49296 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537762 () Bool)

(declare-fun res!1054848 () Bool)

(assert (=> b!1537762 (=> (not res!1054848) (not e!855751))))

(assert (=> b!1537762 (= res!1054848 (validKeyInArray!0 (select (arr!49296 a!2792) j!64)))))

(declare-fun res!1054847 () Bool)

(assert (=> start!131062 (=> (not res!1054847) (not e!855751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131062 (= res!1054847 (validMask!0 mask!2480))))

(assert (=> start!131062 e!855751))

(assert (=> start!131062 true))

(declare-fun array_inv!38324 (array!102160) Bool)

(assert (=> start!131062 (array_inv!38324 a!2792)))

(declare-fun b!1537763 () Bool)

(declare-fun res!1054845 () Bool)

(assert (=> b!1537763 (=> (not res!1054845) (not e!855751))))

(declare-datatypes ((List!35770 0))(
  ( (Nil!35767) (Cons!35766 (h!37211 (_ BitVec 64)) (t!50464 List!35770)) )
))
(declare-fun arrayNoDuplicates!0 (array!102160 (_ BitVec 32) List!35770) Bool)

(assert (=> b!1537763 (= res!1054845 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35767))))

(assert (= (and start!131062 res!1054847) b!1537760))

(assert (= (and b!1537760 res!1054844) b!1537758))

(assert (= (and b!1537758 res!1054849) b!1537762))

(assert (= (and b!1537762 res!1054848) b!1537757))

(assert (= (and b!1537757 res!1054846) b!1537763))

(assert (= (and b!1537763 res!1054845) b!1537761))

(assert (= (and b!1537761 res!1054843) b!1537759))

(declare-fun m!1420271 () Bool)

(assert (=> b!1537761 m!1420271))

(declare-fun m!1420273 () Bool)

(assert (=> start!131062 m!1420273))

(declare-fun m!1420275 () Bool)

(assert (=> start!131062 m!1420275))

(declare-fun m!1420277 () Bool)

(assert (=> b!1537762 m!1420277))

(assert (=> b!1537762 m!1420277))

(declare-fun m!1420279 () Bool)

(assert (=> b!1537762 m!1420279))

(declare-fun m!1420281 () Bool)

(assert (=> b!1537757 m!1420281))

(declare-fun m!1420283 () Bool)

(assert (=> b!1537758 m!1420283))

(assert (=> b!1537758 m!1420283))

(declare-fun m!1420285 () Bool)

(assert (=> b!1537758 m!1420285))

(assert (=> b!1537759 m!1420277))

(assert (=> b!1537759 m!1420277))

(declare-fun m!1420287 () Bool)

(assert (=> b!1537759 m!1420287))

(declare-fun m!1420289 () Bool)

(assert (=> b!1537763 m!1420289))

(check-sat (not b!1537757) (not b!1537762) (not start!131062) (not b!1537759) (not b!1537758) (not b!1537763))
