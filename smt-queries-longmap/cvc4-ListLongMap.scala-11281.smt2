; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131532 () Bool)

(assert start!131532)

(declare-fun res!1057813 () Bool)

(declare-fun e!857215 () Bool)

(assert (=> start!131532 (=> (not res!1057813) (not e!857215))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131532 (= res!1057813 (validMask!0 mask!4052))))

(assert (=> start!131532 e!857215))

(assert (=> start!131532 true))

(declare-datatypes ((array!102435 0))(
  ( (array!102436 (arr!49426 (Array (_ BitVec 32) (_ BitVec 64))) (size!49976 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102435)

(declare-fun array_inv!38454 (array!102435) Bool)

(assert (=> start!131532 (array_inv!38454 a!3920)))

(declare-fun b!1541266 () Bool)

(declare-fun res!1057812 () Bool)

(assert (=> b!1541266 (=> (not res!1057812) (not e!857215))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541266 (= res!1057812 (and (= (size!49976 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49976 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49976 a!3920))))))

(declare-fun b!1541267 () Bool)

(assert (=> b!1541267 (= e!857215 false)))

(declare-fun lt!665641 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102435 (_ BitVec 32)) Bool)

(assert (=> b!1541267 (= lt!665641 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131532 res!1057813) b!1541266))

(assert (= (and b!1541266 res!1057812) b!1541267))

(declare-fun m!1423275 () Bool)

(assert (=> start!131532 m!1423275))

(declare-fun m!1423277 () Bool)

(assert (=> start!131532 m!1423277))

(declare-fun m!1423279 () Bool)

(assert (=> b!1541267 m!1423279))

(push 1)

(assert (not start!131532))

(assert (not b!1541267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

