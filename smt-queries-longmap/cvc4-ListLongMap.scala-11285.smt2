; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131574 () Bool)

(assert start!131574)

(declare-fun b!1541437 () Bool)

(declare-fun res!1057963 () Bool)

(declare-fun e!857323 () Bool)

(assert (=> b!1541437 (=> (not res!1057963) (not e!857323))))

(declare-datatypes ((array!102462 0))(
  ( (array!102463 (arr!49438 (Array (_ BitVec 32) (_ BitVec 64))) (size!49988 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102462)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102462 (_ BitVec 32)) Bool)

(assert (=> b!1541437 (= res!1057963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541438 () Bool)

(declare-fun res!1057961 () Bool)

(assert (=> b!1541438 (=> (not res!1057961) (not e!857323))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541438 (= res!1057961 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49988 a!3920))))))

(declare-fun b!1541439 () Bool)

(declare-fun res!1057960 () Bool)

(assert (=> b!1541439 (=> (not res!1057960) (not e!857323))))

(assert (=> b!1541439 (= res!1057960 (and (= (size!49988 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49988 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49988 a!3920))))))

(declare-fun b!1541440 () Bool)

(assert (=> b!1541440 (= e!857323 (bvsge (bvsub newFrom!293 (bvadd #b00000000000000000000000000000001 from!3298)) (bvsub newFrom!293 from!3298)))))

(declare-fun b!1541441 () Bool)

(declare-fun res!1057962 () Bool)

(assert (=> b!1541441 (=> (not res!1057962) (not e!857323))))

(assert (=> b!1541441 (= res!1057962 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057959 () Bool)

(assert (=> start!131574 (=> (not res!1057959) (not e!857323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131574 (= res!1057959 (validMask!0 mask!4052))))

(assert (=> start!131574 e!857323))

(assert (=> start!131574 true))

(declare-fun array_inv!38466 (array!102462) Bool)

(assert (=> start!131574 (array_inv!38466 a!3920)))

(assert (= (and start!131574 res!1057959) b!1541439))

(assert (= (and b!1541439 res!1057960) b!1541441))

(assert (= (and b!1541441 res!1057962) b!1541438))

(assert (= (and b!1541438 res!1057961) b!1541437))

(assert (= (and b!1541437 res!1057963) b!1541440))

(declare-fun m!1423429 () Bool)

(assert (=> b!1541437 m!1423429))

(declare-fun m!1423431 () Bool)

(assert (=> b!1541441 m!1423431))

(declare-fun m!1423433 () Bool)

(assert (=> start!131574 m!1423433))

(declare-fun m!1423435 () Bool)

(assert (=> start!131574 m!1423435))

(push 1)

(assert (not start!131574))

(assert (not b!1541437))

(assert (not b!1541441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

