; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131878 () Bool)

(assert start!131878)

(declare-fun b!1543386 () Bool)

(declare-fun res!1058355 () Bool)

(declare-fun e!858525 () Bool)

(assert (=> b!1543386 (=> (not res!1058355) (not e!858525))))

(declare-datatypes ((array!102489 0))(
  ( (array!102490 (arr!49446 (Array (_ BitVec 32) (_ BitVec 64))) (size!49997 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102489)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102489 (_ BitVec 32)) Bool)

(assert (=> b!1543386 (= res!1058355 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543387 () Bool)

(declare-fun res!1058356 () Bool)

(assert (=> b!1543387 (=> (not res!1058356) (not e!858525))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543387 (= res!1058356 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49997 a!3920))))))

(declare-fun b!1543388 () Bool)

(assert (=> b!1543388 (= e!858525 false)))

(declare-fun lt!666459 () Bool)

(assert (=> b!1543388 (= lt!666459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1058357 () Bool)

(assert (=> start!131878 (=> (not res!1058357) (not e!858525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131878 (= res!1058357 (validMask!0 mask!4052))))

(assert (=> start!131878 e!858525))

(assert (=> start!131878 true))

(declare-fun array_inv!38727 (array!102489) Bool)

(assert (=> start!131878 (array_inv!38727 a!3920)))

(declare-fun b!1543385 () Bool)

(declare-fun res!1058358 () Bool)

(assert (=> b!1543385 (=> (not res!1058358) (not e!858525))))

(assert (=> b!1543385 (= res!1058358 (and (= (size!49997 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49997 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49997 a!3920))))))

(assert (= (and start!131878 res!1058357) b!1543385))

(assert (= (and b!1543385 res!1058358) b!1543386))

(assert (= (and b!1543386 res!1058355) b!1543387))

(assert (= (and b!1543387 res!1058356) b!1543388))

(declare-fun m!1425261 () Bool)

(assert (=> b!1543386 m!1425261))

(declare-fun m!1425263 () Bool)

(assert (=> b!1543388 m!1425263))

(declare-fun m!1425265 () Bool)

(assert (=> start!131878 m!1425265))

(declare-fun m!1425267 () Bool)

(assert (=> start!131878 m!1425267))

(push 1)

(assert (not b!1543388))

(assert (not start!131878))

(assert (not b!1543386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

