; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131454 () Bool)

(assert start!131454)

(declare-fun b!1540878 () Bool)

(declare-fun res!1057423 () Bool)

(declare-fun e!856981 () Bool)

(assert (=> b!1540878 (=> (not res!1057423) (not e!856981))))

(declare-datatypes ((array!102357 0))(
  ( (array!102358 (arr!49387 (Array (_ BitVec 32) (_ BitVec 64))) (size!49937 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102357)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102357 (_ BitVec 32)) Bool)

(assert (=> b!1540878 (= res!1057423 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540877 () Bool)

(declare-fun res!1057426 () Bool)

(assert (=> b!1540877 (=> (not res!1057426) (not e!856981))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540877 (= res!1057426 (and (= (size!49937 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49937 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49937 a!3920))))))

(declare-fun b!1540880 () Bool)

(assert (=> b!1540880 (= e!856981 false)))

(declare-fun lt!665533 () Bool)

(assert (=> b!1540880 (= lt!665533 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540879 () Bool)

(declare-fun res!1057425 () Bool)

(assert (=> b!1540879 (=> (not res!1057425) (not e!856981))))

(assert (=> b!1540879 (= res!1057425 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49937 a!3920))))))

(declare-fun res!1057424 () Bool)

(assert (=> start!131454 (=> (not res!1057424) (not e!856981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131454 (= res!1057424 (validMask!0 mask!4052))))

(assert (=> start!131454 e!856981))

(assert (=> start!131454 true))

(declare-fun array_inv!38415 (array!102357) Bool)

(assert (=> start!131454 (array_inv!38415 a!3920)))

(assert (= (and start!131454 res!1057424) b!1540877))

(assert (= (and b!1540877 res!1057426) b!1540878))

(assert (= (and b!1540878 res!1057423) b!1540879))

(assert (= (and b!1540879 res!1057425) b!1540880))

(declare-fun m!1422955 () Bool)

(assert (=> b!1540878 m!1422955))

(declare-fun m!1422957 () Bool)

(assert (=> b!1540880 m!1422957))

(declare-fun m!1422959 () Bool)

(assert (=> start!131454 m!1422959))

(declare-fun m!1422961 () Bool)

(assert (=> start!131454 m!1422961))

(push 1)

(assert (not b!1540878))

(assert (not start!131454))

(assert (not b!1540880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

