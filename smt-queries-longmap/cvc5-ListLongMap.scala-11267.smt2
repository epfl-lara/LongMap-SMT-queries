; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131860 () Bool)

(assert start!131860)

(declare-fun b!1543279 () Bool)

(declare-fun res!1058250 () Bool)

(declare-fun e!858472 () Bool)

(assert (=> b!1543279 (=> (not res!1058250) (not e!858472))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102471 0))(
  ( (array!102472 (arr!49437 (Array (_ BitVec 32) (_ BitVec 64))) (size!49988 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102471)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543279 (= res!1058250 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49988 a!3920))))))

(declare-fun res!1058248 () Bool)

(assert (=> start!131860 (=> (not res!1058248) (not e!858472))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131860 (= res!1058248 (validMask!0 mask!4052))))

(assert (=> start!131860 e!858472))

(assert (=> start!131860 true))

(declare-fun array_inv!38718 (array!102471) Bool)

(assert (=> start!131860 (array_inv!38718 a!3920)))

(declare-fun b!1543277 () Bool)

(declare-fun res!1058249 () Bool)

(assert (=> b!1543277 (=> (not res!1058249) (not e!858472))))

(assert (=> b!1543277 (= res!1058249 (and (= (size!49988 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49988 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49988 a!3920))))))

(declare-fun b!1543280 () Bool)

(assert (=> b!1543280 (= e!858472 false)))

(declare-fun lt!666432 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102471 (_ BitVec 32)) Bool)

(assert (=> b!1543280 (= lt!666432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543278 () Bool)

(declare-fun res!1058247 () Bool)

(assert (=> b!1543278 (=> (not res!1058247) (not e!858472))))

(assert (=> b!1543278 (= res!1058247 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131860 res!1058248) b!1543277))

(assert (= (and b!1543277 res!1058249) b!1543278))

(assert (= (and b!1543278 res!1058247) b!1543279))

(assert (= (and b!1543279 res!1058250) b!1543280))

(declare-fun m!1425189 () Bool)

(assert (=> start!131860 m!1425189))

(declare-fun m!1425191 () Bool)

(assert (=> start!131860 m!1425191))

(declare-fun m!1425193 () Bool)

(assert (=> b!1543280 m!1425193))

(declare-fun m!1425195 () Bool)

(assert (=> b!1543278 m!1425195))

(push 1)

(assert (not b!1543278))

(assert (not b!1543280))

(assert (not start!131860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

