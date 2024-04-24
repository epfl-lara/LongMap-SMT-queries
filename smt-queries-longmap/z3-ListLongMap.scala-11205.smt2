; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131280 () Bool)

(assert start!131280)

(declare-fun b!1537199 () Bool)

(declare-fun e!856103 () Bool)

(assert (=> b!1537199 (= e!856103 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102082 0))(
  ( (array!102083 (arr!49249 (Array (_ BitVec 32) (_ BitVec 64))) (size!49800 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102082)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664835 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13276 0))(
  ( (MissingZero!13276 (index!55499 (_ BitVec 32))) (Found!13276 (index!55500 (_ BitVec 32))) (Intermediate!13276 (undefined!14088 Bool) (index!55501 (_ BitVec 32)) (x!137464 (_ BitVec 32))) (Undefined!13276) (MissingVacant!13276 (index!55502 (_ BitVec 32))) )
))
(declare-fun lt!664836 () SeekEntryResult!13276)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102082 (_ BitVec 32)) SeekEntryResult!13276)

(assert (=> b!1537199 (= lt!664836 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664835 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537200 () Bool)

(declare-fun res!1052709 () Bool)

(declare-fun e!856105 () Bool)

(assert (=> b!1537200 (=> (not res!1052709) (not e!856105))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537200 (= res!1052709 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49800 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49800 a!2792)) (= (select (arr!49249 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537202 () Bool)

(declare-fun res!1052716 () Bool)

(assert (=> b!1537202 (=> (not res!1052716) (not e!856105))))

(assert (=> b!1537202 (= res!1052716 (not (= (select (arr!49249 a!2792) index!463) (select (arr!49249 a!2792) j!64))))))

(declare-fun b!1537203 () Bool)

(declare-fun res!1052711 () Bool)

(assert (=> b!1537203 (=> (not res!1052711) (not e!856105))))

(assert (=> b!1537203 (= res!1052711 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49249 a!2792) j!64) a!2792 mask!2480) (Found!13276 j!64)))))

(declare-fun b!1537204 () Bool)

(declare-fun res!1052713 () Bool)

(assert (=> b!1537204 (=> (not res!1052713) (not e!856105))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537204 (= res!1052713 (and (= (size!49800 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49800 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49800 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537205 () Bool)

(declare-fun res!1052710 () Bool)

(assert (=> b!1537205 (=> (not res!1052710) (not e!856105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102082 (_ BitVec 32)) Bool)

(assert (=> b!1537205 (= res!1052710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537206 () Bool)

(assert (=> b!1537206 (= e!856105 e!856103)))

(declare-fun res!1052715 () Bool)

(assert (=> b!1537206 (=> (not res!1052715) (not e!856103))))

(assert (=> b!1537206 (= res!1052715 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664835 #b00000000000000000000000000000000) (bvslt lt!664835 (size!49800 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537206 (= lt!664835 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537201 () Bool)

(declare-fun res!1052714 () Bool)

(assert (=> b!1537201 (=> (not res!1052714) (not e!856105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537201 (= res!1052714 (validKeyInArray!0 (select (arr!49249 a!2792) j!64)))))

(declare-fun res!1052712 () Bool)

(assert (=> start!131280 (=> (not res!1052712) (not e!856105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131280 (= res!1052712 (validMask!0 mask!2480))))

(assert (=> start!131280 e!856105))

(assert (=> start!131280 true))

(declare-fun array_inv!38530 (array!102082) Bool)

(assert (=> start!131280 (array_inv!38530 a!2792)))

(declare-fun b!1537207 () Bool)

(declare-fun res!1052717 () Bool)

(assert (=> b!1537207 (=> (not res!1052717) (not e!856105))))

(declare-datatypes ((List!35710 0))(
  ( (Nil!35707) (Cons!35706 (h!37169 (_ BitVec 64)) (t!50396 List!35710)) )
))
(declare-fun arrayNoDuplicates!0 (array!102082 (_ BitVec 32) List!35710) Bool)

(assert (=> b!1537207 (= res!1052717 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35707))))

(declare-fun b!1537208 () Bool)

(declare-fun res!1052718 () Bool)

(assert (=> b!1537208 (=> (not res!1052718) (not e!856105))))

(assert (=> b!1537208 (= res!1052718 (validKeyInArray!0 (select (arr!49249 a!2792) i!951)))))

(assert (= (and start!131280 res!1052712) b!1537204))

(assert (= (and b!1537204 res!1052713) b!1537208))

(assert (= (and b!1537208 res!1052718) b!1537201))

(assert (= (and b!1537201 res!1052714) b!1537205))

(assert (= (and b!1537205 res!1052710) b!1537207))

(assert (= (and b!1537207 res!1052717) b!1537200))

(assert (= (and b!1537200 res!1052709) b!1537203))

(assert (= (and b!1537203 res!1052711) b!1537202))

(assert (= (and b!1537202 res!1052716) b!1537206))

(assert (= (and b!1537206 res!1052715) b!1537199))

(declare-fun m!1419607 () Bool)

(assert (=> b!1537201 m!1419607))

(assert (=> b!1537201 m!1419607))

(declare-fun m!1419609 () Bool)

(assert (=> b!1537201 m!1419609))

(declare-fun m!1419611 () Bool)

(assert (=> b!1537207 m!1419611))

(declare-fun m!1419613 () Bool)

(assert (=> b!1537205 m!1419613))

(declare-fun m!1419615 () Bool)

(assert (=> b!1537208 m!1419615))

(assert (=> b!1537208 m!1419615))

(declare-fun m!1419617 () Bool)

(assert (=> b!1537208 m!1419617))

(declare-fun m!1419619 () Bool)

(assert (=> b!1537206 m!1419619))

(assert (=> b!1537199 m!1419607))

(assert (=> b!1537199 m!1419607))

(declare-fun m!1419621 () Bool)

(assert (=> b!1537199 m!1419621))

(declare-fun m!1419623 () Bool)

(assert (=> start!131280 m!1419623))

(declare-fun m!1419625 () Bool)

(assert (=> start!131280 m!1419625))

(assert (=> b!1537203 m!1419607))

(assert (=> b!1537203 m!1419607))

(declare-fun m!1419627 () Bool)

(assert (=> b!1537203 m!1419627))

(declare-fun m!1419629 () Bool)

(assert (=> b!1537202 m!1419629))

(assert (=> b!1537202 m!1419607))

(declare-fun m!1419631 () Bool)

(assert (=> b!1537200 m!1419631))

(check-sat (not start!131280) (not b!1537207) (not b!1537206) (not b!1537199) (not b!1537201) (not b!1537203) (not b!1537208) (not b!1537205))
(check-sat)
