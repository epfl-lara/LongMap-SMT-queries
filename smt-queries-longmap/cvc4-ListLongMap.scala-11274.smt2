; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131490 () Bool)

(assert start!131490)

(declare-fun b!1541128 () Bool)

(declare-fun res!1057674 () Bool)

(declare-fun e!857088 () Bool)

(assert (=> b!1541128 (=> (not res!1057674) (not e!857088))))

(declare-datatypes ((array!102393 0))(
  ( (array!102394 (arr!49405 (Array (_ BitVec 32) (_ BitVec 64))) (size!49955 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102393)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102393 (_ BitVec 32)) Bool)

(assert (=> b!1541128 (= res!1057674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541129 () Bool)

(declare-fun res!1057678 () Bool)

(assert (=> b!1541129 (=> (not res!1057678) (not e!857088))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541129 (= res!1057678 (and (= (size!49955 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49955 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49955 a!3920))))))

(declare-fun b!1541130 () Bool)

(declare-fun res!1057677 () Bool)

(assert (=> b!1541130 (=> (not res!1057677) (not e!857088))))

(assert (=> b!1541130 (= res!1057677 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541131 () Bool)

(declare-fun res!1057676 () Bool)

(assert (=> b!1541131 (=> (not res!1057676) (not e!857088))))

(assert (=> b!1541131 (= res!1057676 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49955 a!3920))))))

(declare-fun res!1057675 () Bool)

(assert (=> start!131490 (=> (not res!1057675) (not e!857088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131490 (= res!1057675 (validMask!0 mask!4052))))

(assert (=> start!131490 e!857088))

(assert (=> start!131490 true))

(declare-fun array_inv!38433 (array!102393) Bool)

(assert (=> start!131490 (array_inv!38433 a!3920)))

(declare-fun b!1541132 () Bool)

(assert (=> b!1541132 (= e!857088 (not true))))

(assert (=> b!1541132 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51472 0))(
  ( (Unit!51473) )
))
(declare-fun lt!665587 () Unit!51472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51472)

(assert (=> b!1541132 (= lt!665587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131490 res!1057675) b!1541129))

(assert (= (and b!1541129 res!1057678) b!1541130))

(assert (= (and b!1541130 res!1057677) b!1541131))

(assert (= (and b!1541131 res!1057676) b!1541128))

(assert (= (and b!1541128 res!1057674) b!1541132))

(declare-fun m!1423143 () Bool)

(assert (=> b!1541128 m!1423143))

(declare-fun m!1423145 () Bool)

(assert (=> b!1541130 m!1423145))

(declare-fun m!1423147 () Bool)

(assert (=> start!131490 m!1423147))

(declare-fun m!1423149 () Bool)

(assert (=> start!131490 m!1423149))

(declare-fun m!1423151 () Bool)

(assert (=> b!1541132 m!1423151))

(declare-fun m!1423153 () Bool)

(assert (=> b!1541132 m!1423153))

(push 1)

(assert (not b!1541132))

(assert (not b!1541128))

(assert (not b!1541130))

(assert (not start!131490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

