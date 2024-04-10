; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131164 () Bool)

(assert start!131164)

(declare-fun b!1538712 () Bool)

(declare-fun res!1055690 () Bool)

(declare-fun e!856056 () Bool)

(assert (=> b!1538712 (=> (not res!1055690) (not e!856056))))

(declare-datatypes ((array!102229 0))(
  ( (array!102230 (arr!49329 (Array (_ BitVec 32) (_ BitVec 64))) (size!49879 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102229)

(declare-datatypes ((List!35803 0))(
  ( (Nil!35800) (Cons!35799 (h!37244 (_ BitVec 64)) (t!50497 List!35803)) )
))
(declare-fun arrayNoDuplicates!0 (array!102229 (_ BitVec 32) List!35803) Bool)

(assert (=> b!1538712 (= res!1055690 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35800))))

(declare-fun res!1055694 () Bool)

(assert (=> start!131164 (=> (not res!1055694) (not e!856056))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131164 (= res!1055694 (validMask!0 mask!2480))))

(assert (=> start!131164 e!856056))

(assert (=> start!131164 true))

(declare-fun array_inv!38357 (array!102229) Bool)

(assert (=> start!131164 (array_inv!38357 a!2792)))

(declare-fun b!1538713 () Bool)

(declare-fun res!1055698 () Bool)

(assert (=> b!1538713 (=> (not res!1055698) (not e!856056))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13455 0))(
  ( (MissingZero!13455 (index!56215 (_ BitVec 32))) (Found!13455 (index!56216 (_ BitVec 32))) (Intermediate!13455 (undefined!14267 Bool) (index!56217 (_ BitVec 32)) (x!137948 (_ BitVec 32))) (Undefined!13455) (MissingVacant!13455 (index!56218 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102229 (_ BitVec 32)) SeekEntryResult!13455)

(assert (=> b!1538713 (= res!1055698 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49329 a!2792) j!64) a!2792 mask!2480) (Found!13455 j!64)))))

(declare-fun b!1538714 () Bool)

(declare-fun res!1055693 () Bool)

(assert (=> b!1538714 (=> (not res!1055693) (not e!856056))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538714 (= res!1055693 (and (= (size!49879 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49879 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49879 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538715 () Bool)

(declare-fun res!1055692 () Bool)

(assert (=> b!1538715 (=> (not res!1055692) (not e!856056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538715 (= res!1055692 (validKeyInArray!0 (select (arr!49329 a!2792) j!64)))))

(declare-fun b!1538716 () Bool)

(assert (=> b!1538716 (= e!856056 false)))

(declare-fun lt!664930 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538716 (= lt!664930 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538717 () Bool)

(declare-fun res!1055696 () Bool)

(assert (=> b!1538717 (=> (not res!1055696) (not e!856056))))

(assert (=> b!1538717 (= res!1055696 (not (= (select (arr!49329 a!2792) index!463) (select (arr!49329 a!2792) j!64))))))

(declare-fun b!1538718 () Bool)

(declare-fun res!1055695 () Bool)

(assert (=> b!1538718 (=> (not res!1055695) (not e!856056))))

(assert (=> b!1538718 (= res!1055695 (validKeyInArray!0 (select (arr!49329 a!2792) i!951)))))

(declare-fun b!1538719 () Bool)

(declare-fun res!1055697 () Bool)

(assert (=> b!1538719 (=> (not res!1055697) (not e!856056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102229 (_ BitVec 32)) Bool)

(assert (=> b!1538719 (= res!1055697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538720 () Bool)

(declare-fun res!1055691 () Bool)

(assert (=> b!1538720 (=> (not res!1055691) (not e!856056))))

(assert (=> b!1538720 (= res!1055691 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49879 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49879 a!2792)) (= (select (arr!49329 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131164 res!1055694) b!1538714))

(assert (= (and b!1538714 res!1055693) b!1538718))

(assert (= (and b!1538718 res!1055695) b!1538715))

(assert (= (and b!1538715 res!1055692) b!1538719))

(assert (= (and b!1538719 res!1055697) b!1538712))

(assert (= (and b!1538712 res!1055690) b!1538720))

(assert (= (and b!1538720 res!1055691) b!1538713))

(assert (= (and b!1538713 res!1055698) b!1538717))

(assert (= (and b!1538717 res!1055696) b!1538716))

(declare-fun m!1421115 () Bool)

(assert (=> b!1538720 m!1421115))

(declare-fun m!1421117 () Bool)

(assert (=> b!1538713 m!1421117))

(assert (=> b!1538713 m!1421117))

(declare-fun m!1421119 () Bool)

(assert (=> b!1538713 m!1421119))

(declare-fun m!1421121 () Bool)

(assert (=> b!1538716 m!1421121))

(declare-fun m!1421123 () Bool)

(assert (=> b!1538712 m!1421123))

(declare-fun m!1421125 () Bool)

(assert (=> b!1538718 m!1421125))

(assert (=> b!1538718 m!1421125))

(declare-fun m!1421127 () Bool)

(assert (=> b!1538718 m!1421127))

(declare-fun m!1421129 () Bool)

(assert (=> b!1538717 m!1421129))

(assert (=> b!1538717 m!1421117))

(assert (=> b!1538715 m!1421117))

(assert (=> b!1538715 m!1421117))

(declare-fun m!1421131 () Bool)

(assert (=> b!1538715 m!1421131))

(declare-fun m!1421133 () Bool)

(assert (=> b!1538719 m!1421133))

(declare-fun m!1421135 () Bool)

(assert (=> start!131164 m!1421135))

(declare-fun m!1421137 () Bool)

(assert (=> start!131164 m!1421137))

(check-sat (not start!131164) (not b!1538713) (not b!1538712) (not b!1538716) (not b!1538715) (not b!1538719) (not b!1538718))
