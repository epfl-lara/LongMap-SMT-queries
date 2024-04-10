; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131460 () Bool)

(assert start!131460)

(declare-fun b!1540913 () Bool)

(declare-fun res!1057461 () Bool)

(declare-fun e!856999 () Bool)

(assert (=> b!1540913 (=> (not res!1057461) (not e!856999))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102363 0))(
  ( (array!102364 (arr!49390 (Array (_ BitVec 32) (_ BitVec 64))) (size!49940 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102363)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540913 (= res!1057461 (and (= (size!49940 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49940 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49940 a!3920))))))

(declare-fun b!1540916 () Bool)

(assert (=> b!1540916 (= e!856999 false)))

(declare-fun lt!665542 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102363 (_ BitVec 32)) Bool)

(assert (=> b!1540916 (= lt!665542 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540915 () Bool)

(declare-fun res!1057459 () Bool)

(assert (=> b!1540915 (=> (not res!1057459) (not e!856999))))

(assert (=> b!1540915 (= res!1057459 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49940 a!3920))))))

(declare-fun res!1057460 () Bool)

(assert (=> start!131460 (=> (not res!1057460) (not e!856999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131460 (= res!1057460 (validMask!0 mask!4052))))

(assert (=> start!131460 e!856999))

(assert (=> start!131460 true))

(declare-fun array_inv!38418 (array!102363) Bool)

(assert (=> start!131460 (array_inv!38418 a!3920)))

(declare-fun b!1540914 () Bool)

(declare-fun res!1057462 () Bool)

(assert (=> b!1540914 (=> (not res!1057462) (not e!856999))))

(assert (=> b!1540914 (= res!1057462 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131460 res!1057460) b!1540913))

(assert (= (and b!1540913 res!1057461) b!1540914))

(assert (= (and b!1540914 res!1057462) b!1540915))

(assert (= (and b!1540915 res!1057459) b!1540916))

(declare-fun m!1422979 () Bool)

(assert (=> b!1540916 m!1422979))

(declare-fun m!1422981 () Bool)

(assert (=> start!131460 m!1422981))

(declare-fun m!1422983 () Bool)

(assert (=> start!131460 m!1422983))

(declare-fun m!1422985 () Bool)

(assert (=> b!1540914 m!1422985))

(push 1)

(assert (not b!1540914))

(assert (not start!131460))

(assert (not b!1540916))

(check-sat)

