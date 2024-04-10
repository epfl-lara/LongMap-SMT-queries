; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131504 () Bool)

(assert start!131504)

(declare-fun res!1057723 () Bool)

(declare-fun e!857131 () Bool)

(assert (=> start!131504 (=> (not res!1057723) (not e!857131))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131504 (= res!1057723 (validMask!0 mask!4052))))

(assert (=> start!131504 e!857131))

(assert (=> start!131504 true))

(declare-datatypes ((array!102407 0))(
  ( (array!102408 (arr!49412 (Array (_ BitVec 32) (_ BitVec 64))) (size!49962 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102407)

(declare-fun array_inv!38440 (array!102407) Bool)

(assert (=> start!131504 (array_inv!38440 a!3920)))

(declare-fun b!1541175 () Bool)

(declare-fun res!1057721 () Bool)

(assert (=> b!1541175 (=> (not res!1057721) (not e!857131))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541175 (= res!1057721 (and (= (size!49962 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49962 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49962 a!3920))))))

(declare-fun b!1541176 () Bool)

(declare-fun res!1057722 () Bool)

(assert (=> b!1541176 (=> (not res!1057722) (not e!857131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102407 (_ BitVec 32)) Bool)

(assert (=> b!1541176 (= res!1057722 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541177 () Bool)

(assert (=> b!1541177 (= e!857131 (and (bvsge from!3298 newFrom!293) (bvslt newFrom!293 #b00000000000000000000000000000000)))))

(assert (= (and start!131504 res!1057723) b!1541175))

(assert (= (and b!1541175 res!1057721) b!1541176))

(assert (= (and b!1541176 res!1057722) b!1541177))

(declare-fun m!1423191 () Bool)

(assert (=> start!131504 m!1423191))

(declare-fun m!1423193 () Bool)

(assert (=> start!131504 m!1423193))

(declare-fun m!1423195 () Bool)

(assert (=> b!1541176 m!1423195))

(push 1)

(assert (not b!1541176))

(assert (not start!131504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

