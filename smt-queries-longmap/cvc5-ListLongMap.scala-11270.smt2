; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131416 () Bool)

(assert start!131416)

(declare-fun b!1540637 () Bool)

(declare-fun res!1057366 () Bool)

(declare-fun e!856819 () Bool)

(assert (=> b!1540637 (=> (not res!1057366) (not e!856819))))

(declare-datatypes ((array!102317 0))(
  ( (array!102318 (arr!49368 (Array (_ BitVec 32) (_ BitVec 64))) (size!49920 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102317)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102317 (_ BitVec 32)) Bool)

(assert (=> b!1540637 (= res!1057366 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540636 () Bool)

(declare-fun res!1057368 () Bool)

(assert (=> b!1540636 (=> (not res!1057368) (not e!856819))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540636 (= res!1057368 (and (= (size!49920 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49920 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49920 a!3920))))))

(declare-fun b!1540639 () Bool)

(assert (=> b!1540639 (= e!856819 false)))

(declare-fun lt!665265 () Bool)

(assert (=> b!1540639 (= lt!665265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540638 () Bool)

(declare-fun res!1057369 () Bool)

(assert (=> b!1540638 (=> (not res!1057369) (not e!856819))))

(assert (=> b!1540638 (= res!1057369 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49920 a!3920))))))

(declare-fun res!1057367 () Bool)

(assert (=> start!131416 (=> (not res!1057367) (not e!856819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131416 (= res!1057367 (validMask!0 mask!4052))))

(assert (=> start!131416 e!856819))

(assert (=> start!131416 true))

(declare-fun array_inv!38601 (array!102317) Bool)

(assert (=> start!131416 (array_inv!38601 a!3920)))

(assert (= (and start!131416 res!1057367) b!1540636))

(assert (= (and b!1540636 res!1057368) b!1540637))

(assert (= (and b!1540637 res!1057366) b!1540638))

(assert (= (and b!1540638 res!1057369) b!1540639))

(declare-fun m!1422111 () Bool)

(assert (=> b!1540637 m!1422111))

(declare-fun m!1422113 () Bool)

(assert (=> b!1540639 m!1422113))

(declare-fun m!1422115 () Bool)

(assert (=> start!131416 m!1422115))

(declare-fun m!1422117 () Bool)

(assert (=> start!131416 m!1422117))

(push 1)

(assert (not start!131416))

(assert (not b!1540639))

(assert (not b!1540637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

