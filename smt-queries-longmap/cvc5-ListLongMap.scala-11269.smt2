; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131410 () Bool)

(assert start!131410)

(declare-fun b!1540601 () Bool)

(declare-fun res!1057330 () Bool)

(declare-fun e!856801 () Bool)

(assert (=> b!1540601 (=> (not res!1057330) (not e!856801))))

(declare-datatypes ((array!102311 0))(
  ( (array!102312 (arr!49365 (Array (_ BitVec 32) (_ BitVec 64))) (size!49917 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102311)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102311 (_ BitVec 32)) Bool)

(assert (=> b!1540601 (= res!1057330 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540603 () Bool)

(assert (=> b!1540603 (= e!856801 false)))

(declare-fun lt!665256 () Bool)

(assert (=> b!1540603 (= lt!665256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057332 () Bool)

(assert (=> start!131410 (=> (not res!1057332) (not e!856801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131410 (= res!1057332 (validMask!0 mask!4052))))

(assert (=> start!131410 e!856801))

(assert (=> start!131410 true))

(declare-fun array_inv!38598 (array!102311) Bool)

(assert (=> start!131410 (array_inv!38598 a!3920)))

(declare-fun b!1540600 () Bool)

(declare-fun res!1057331 () Bool)

(assert (=> b!1540600 (=> (not res!1057331) (not e!856801))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540600 (= res!1057331 (and (= (size!49917 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49917 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49917 a!3920))))))

(declare-fun b!1540602 () Bool)

(declare-fun res!1057333 () Bool)

(assert (=> b!1540602 (=> (not res!1057333) (not e!856801))))

(assert (=> b!1540602 (= res!1057333 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49917 a!3920))))))

(assert (= (and start!131410 res!1057332) b!1540600))

(assert (= (and b!1540600 res!1057331) b!1540601))

(assert (= (and b!1540601 res!1057330) b!1540602))

(assert (= (and b!1540602 res!1057333) b!1540603))

(declare-fun m!1422087 () Bool)

(assert (=> b!1540601 m!1422087))

(declare-fun m!1422089 () Bool)

(assert (=> b!1540603 m!1422089))

(declare-fun m!1422091 () Bool)

(assert (=> start!131410 m!1422091))

(declare-fun m!1422093 () Bool)

(assert (=> start!131410 m!1422093))

(push 1)

(assert (not start!131410))

(assert (not b!1540603))

(assert (not b!1540601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

