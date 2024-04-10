; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131538 () Bool)

(assert start!131538)

(declare-fun res!1057838 () Bool)

(declare-fun e!857232 () Bool)

(assert (=> start!131538 (=> (not res!1057838) (not e!857232))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131538 (= res!1057838 (validMask!0 mask!4052))))

(assert (=> start!131538 e!857232))

(assert (=> start!131538 true))

(declare-datatypes ((array!102441 0))(
  ( (array!102442 (arr!49429 (Array (_ BitVec 32) (_ BitVec 64))) (size!49979 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102441)

(declare-fun array_inv!38457 (array!102441) Bool)

(assert (=> start!131538 (array_inv!38457 a!3920)))

(declare-fun b!1541292 () Bool)

(declare-fun res!1057840 () Bool)

(assert (=> b!1541292 (=> (not res!1057840) (not e!857232))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541292 (= res!1057840 (and (= (size!49979 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49979 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49979 a!3920))))))

(declare-fun b!1541293 () Bool)

(declare-fun res!1057839 () Bool)

(assert (=> b!1541293 (=> (not res!1057839) (not e!857232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102441 (_ BitVec 32)) Bool)

(assert (=> b!1541293 (= res!1057839 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541294 () Bool)

(assert (=> b!1541294 (= e!857232 (and (bvslt from!3298 newFrom!293) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3298) (size!49979 a!3920)))))))

(assert (= (and start!131538 res!1057838) b!1541292))

(assert (= (and b!1541292 res!1057840) b!1541293))

(assert (= (and b!1541293 res!1057839) b!1541294))

(declare-fun m!1423293 () Bool)

(assert (=> start!131538 m!1423293))

(declare-fun m!1423295 () Bool)

(assert (=> start!131538 m!1423295))

(declare-fun m!1423297 () Bool)

(assert (=> b!1541293 m!1423297))

(push 1)

(assert (not b!1541293))

(assert (not start!131538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

