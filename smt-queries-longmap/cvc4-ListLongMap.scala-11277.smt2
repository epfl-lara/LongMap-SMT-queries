; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131508 () Bool)

(assert start!131508)

(declare-fun res!1057740 () Bool)

(declare-fun e!857142 () Bool)

(assert (=> start!131508 (=> (not res!1057740) (not e!857142))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131508 (= res!1057740 (validMask!0 mask!4052))))

(assert (=> start!131508 e!857142))

(assert (=> start!131508 true))

(declare-datatypes ((array!102411 0))(
  ( (array!102412 (arr!49414 (Array (_ BitVec 32) (_ BitVec 64))) (size!49964 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102411)

(declare-fun array_inv!38442 (array!102411) Bool)

(assert (=> start!131508 (array_inv!38442 a!3920)))

(declare-fun b!1541193 () Bool)

(declare-fun res!1057741 () Bool)

(assert (=> b!1541193 (=> (not res!1057741) (not e!857142))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541193 (= res!1057741 (and (= (size!49964 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49964 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49964 a!3920))))))

(declare-fun b!1541194 () Bool)

(declare-fun res!1057739 () Bool)

(assert (=> b!1541194 (=> (not res!1057739) (not e!857142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102411 (_ BitVec 32)) Bool)

(assert (=> b!1541194 (= res!1057739 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541195 () Bool)

(assert (=> b!1541195 (= e!857142 (and (bvsge from!3298 newFrom!293) (bvslt newFrom!293 #b00000000000000000000000000000000)))))

(assert (= (and start!131508 res!1057740) b!1541193))

(assert (= (and b!1541193 res!1057741) b!1541194))

(assert (= (and b!1541194 res!1057739) b!1541195))

(declare-fun m!1423203 () Bool)

(assert (=> start!131508 m!1423203))

(declare-fun m!1423205 () Bool)

(assert (=> start!131508 m!1423205))

(declare-fun m!1423207 () Bool)

(assert (=> b!1541194 m!1423207))

(push 1)

(assert (not b!1541194))

(assert (not start!131508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

