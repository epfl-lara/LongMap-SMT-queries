; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131474 () Bool)

(assert start!131474)

(declare-fun b!1541008 () Bool)

(declare-fun res!1057557 () Bool)

(declare-fun e!857041 () Bool)

(assert (=> b!1541008 (=> (not res!1057557) (not e!857041))))

(declare-datatypes ((array!102377 0))(
  ( (array!102378 (arr!49397 (Array (_ BitVec 32) (_ BitVec 64))) (size!49947 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102377)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102377 (_ BitVec 32)) Bool)

(assert (=> b!1541008 (= res!1057557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541009 () Bool)

(declare-fun res!1057558 () Bool)

(assert (=> b!1541009 (=> (not res!1057558) (not e!857041))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541009 (= res!1057558 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49947 a!3920))))))

(declare-fun res!1057556 () Bool)

(assert (=> start!131474 (=> (not res!1057556) (not e!857041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131474 (= res!1057556 (validMask!0 mask!4052))))

(assert (=> start!131474 e!857041))

(assert (=> start!131474 true))

(declare-fun array_inv!38425 (array!102377) Bool)

(assert (=> start!131474 (array_inv!38425 a!3920)))

(declare-fun b!1541010 () Bool)

(assert (=> b!1541010 (= e!857041 (not true))))

(assert (=> b!1541010 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51456 0))(
  ( (Unit!51457) )
))
(declare-fun lt!665563 () Unit!51456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51456)

(assert (=> b!1541010 (= lt!665563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541011 () Bool)

(declare-fun res!1057554 () Bool)

(assert (=> b!1541011 (=> (not res!1057554) (not e!857041))))

(assert (=> b!1541011 (= res!1057554 (and (= (size!49947 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49947 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49947 a!3920))))))

(declare-fun b!1541012 () Bool)

(declare-fun res!1057555 () Bool)

(assert (=> b!1541012 (=> (not res!1057555) (not e!857041))))

(assert (=> b!1541012 (= res!1057555 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131474 res!1057556) b!1541011))

(assert (= (and b!1541011 res!1057554) b!1541012))

(assert (= (and b!1541012 res!1057555) b!1541009))

(assert (= (and b!1541009 res!1057558) b!1541008))

(assert (= (and b!1541008 res!1057557) b!1541010))

(declare-fun m!1423047 () Bool)

(assert (=> b!1541008 m!1423047))

(declare-fun m!1423049 () Bool)

(assert (=> start!131474 m!1423049))

(declare-fun m!1423051 () Bool)

(assert (=> start!131474 m!1423051))

(declare-fun m!1423053 () Bool)

(assert (=> b!1541010 m!1423053))

(declare-fun m!1423055 () Bool)

(assert (=> b!1541010 m!1423055))

(declare-fun m!1423057 () Bool)

(assert (=> b!1541012 m!1423057))

(push 1)

(assert (not b!1541008))

(assert (not b!1541010))

(assert (not start!131474))

(assert (not b!1541012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

