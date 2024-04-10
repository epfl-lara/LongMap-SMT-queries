; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131050 () Bool)

(assert start!131050)

(declare-fun b!1537631 () Bool)

(declare-fun res!1054721 () Bool)

(declare-fun e!855715 () Bool)

(assert (=> b!1537631 (=> (not res!1054721) (not e!855715))))

(declare-datatypes ((array!102148 0))(
  ( (array!102149 (arr!49290 (Array (_ BitVec 32) (_ BitVec 64))) (size!49840 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102148)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537631 (= res!1054721 (and (= (size!49840 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49840 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49840 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537632 () Bool)

(declare-fun res!1054720 () Bool)

(assert (=> b!1537632 (=> (not res!1054720) (not e!855715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102148 (_ BitVec 32)) Bool)

(assert (=> b!1537632 (= res!1054720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537633 () Bool)

(declare-fun res!1054718 () Bool)

(assert (=> b!1537633 (=> (not res!1054718) (not e!855715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537633 (= res!1054718 (validKeyInArray!0 (select (arr!49290 a!2792) i!951)))))

(declare-fun b!1537634 () Bool)

(declare-fun res!1054717 () Bool)

(assert (=> b!1537634 (=> (not res!1054717) (not e!855715))))

(declare-datatypes ((List!35764 0))(
  ( (Nil!35761) (Cons!35760 (h!37205 (_ BitVec 64)) (t!50458 List!35764)) )
))
(declare-fun arrayNoDuplicates!0 (array!102148 (_ BitVec 32) List!35764) Bool)

(assert (=> b!1537634 (= res!1054717 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35761))))

(declare-fun b!1537636 () Bool)

(assert (=> b!1537636 (= e!855715 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13416 0))(
  ( (MissingZero!13416 (index!56059 (_ BitVec 32))) (Found!13416 (index!56060 (_ BitVec 32))) (Intermediate!13416 (undefined!14228 Bool) (index!56061 (_ BitVec 32)) (x!137802 (_ BitVec 32))) (Undefined!13416) (MissingVacant!13416 (index!56062 (_ BitVec 32))) )
))
(declare-fun lt!664762 () SeekEntryResult!13416)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102148 (_ BitVec 32)) SeekEntryResult!13416)

(assert (=> b!1537636 (= lt!664762 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49290 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537637 () Bool)

(declare-fun res!1054723 () Bool)

(assert (=> b!1537637 (=> (not res!1054723) (not e!855715))))

(assert (=> b!1537637 (= res!1054723 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49840 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49840 a!2792)) (= (select (arr!49290 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054722 () Bool)

(assert (=> start!131050 (=> (not res!1054722) (not e!855715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131050 (= res!1054722 (validMask!0 mask!2480))))

(assert (=> start!131050 e!855715))

(assert (=> start!131050 true))

(declare-fun array_inv!38318 (array!102148) Bool)

(assert (=> start!131050 (array_inv!38318 a!2792)))

(declare-fun b!1537635 () Bool)

(declare-fun res!1054719 () Bool)

(assert (=> b!1537635 (=> (not res!1054719) (not e!855715))))

(assert (=> b!1537635 (= res!1054719 (validKeyInArray!0 (select (arr!49290 a!2792) j!64)))))

(assert (= (and start!131050 res!1054722) b!1537631))

(assert (= (and b!1537631 res!1054721) b!1537633))

(assert (= (and b!1537633 res!1054718) b!1537635))

(assert (= (and b!1537635 res!1054719) b!1537632))

(assert (= (and b!1537632 res!1054720) b!1537634))

(assert (= (and b!1537634 res!1054717) b!1537637))

(assert (= (and b!1537637 res!1054723) b!1537636))

(declare-fun m!1420151 () Bool)

(assert (=> b!1537635 m!1420151))

(assert (=> b!1537635 m!1420151))

(declare-fun m!1420153 () Bool)

(assert (=> b!1537635 m!1420153))

(declare-fun m!1420155 () Bool)

(assert (=> b!1537632 m!1420155))

(declare-fun m!1420157 () Bool)

(assert (=> b!1537634 m!1420157))

(declare-fun m!1420159 () Bool)

(assert (=> start!131050 m!1420159))

(declare-fun m!1420161 () Bool)

(assert (=> start!131050 m!1420161))

(declare-fun m!1420163 () Bool)

(assert (=> b!1537637 m!1420163))

(declare-fun m!1420165 () Bool)

(assert (=> b!1537633 m!1420165))

(assert (=> b!1537633 m!1420165))

(declare-fun m!1420167 () Bool)

(assert (=> b!1537633 m!1420167))

(assert (=> b!1537636 m!1420151))

(assert (=> b!1537636 m!1420151))

(declare-fun m!1420169 () Bool)

(assert (=> b!1537636 m!1420169))

(check-sat (not b!1537632) (not b!1537634) (not b!1537635) (not start!131050) (not b!1537636) (not b!1537633))
