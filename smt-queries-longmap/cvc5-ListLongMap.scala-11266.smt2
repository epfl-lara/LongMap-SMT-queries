; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131854 () Bool)

(assert start!131854)

(declare-fun res!1058214 () Bool)

(declare-fun e!858454 () Bool)

(assert (=> start!131854 (=> (not res!1058214) (not e!858454))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131854 (= res!1058214 (validMask!0 mask!4052))))

(assert (=> start!131854 e!858454))

(assert (=> start!131854 true))

(declare-datatypes ((array!102465 0))(
  ( (array!102466 (arr!49434 (Array (_ BitVec 32) (_ BitVec 64))) (size!49985 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102465)

(declare-fun array_inv!38715 (array!102465) Bool)

(assert (=> start!131854 (array_inv!38715 a!3920)))

(declare-fun b!1543244 () Bool)

(assert (=> b!1543244 (= e!858454 false)))

(declare-fun lt!666423 () Bool)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102465 (_ BitVec 32)) Bool)

(assert (=> b!1543244 (= lt!666423 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543242 () Bool)

(declare-fun res!1058211 () Bool)

(assert (=> b!1543242 (=> (not res!1058211) (not e!858454))))

(assert (=> b!1543242 (= res!1058211 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543241 () Bool)

(declare-fun res!1058213 () Bool)

(assert (=> b!1543241 (=> (not res!1058213) (not e!858454))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543241 (= res!1058213 (and (= (size!49985 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49985 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49985 a!3920))))))

(declare-fun b!1543243 () Bool)

(declare-fun res!1058212 () Bool)

(assert (=> b!1543243 (=> (not res!1058212) (not e!858454))))

(assert (=> b!1543243 (= res!1058212 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49985 a!3920))))))

(assert (= (and start!131854 res!1058214) b!1543241))

(assert (= (and b!1543241 res!1058213) b!1543242))

(assert (= (and b!1543242 res!1058211) b!1543243))

(assert (= (and b!1543243 res!1058212) b!1543244))

(declare-fun m!1425165 () Bool)

(assert (=> start!131854 m!1425165))

(declare-fun m!1425167 () Bool)

(assert (=> start!131854 m!1425167))

(declare-fun m!1425169 () Bool)

(assert (=> b!1543244 m!1425169))

(declare-fun m!1425171 () Bool)

(assert (=> b!1543242 m!1425171))

(push 1)

(assert (not b!1543242))

(assert (not b!1543244))

(assert (not start!131854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

