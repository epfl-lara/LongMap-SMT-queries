; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131484 () Bool)

(assert start!131484)

(declare-fun b!1541083 () Bool)

(declare-fun res!1057631 () Bool)

(declare-fun e!857070 () Bool)

(assert (=> b!1541083 (=> (not res!1057631) (not e!857070))))

(declare-datatypes ((array!102387 0))(
  ( (array!102388 (arr!49402 (Array (_ BitVec 32) (_ BitVec 64))) (size!49952 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102387)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102387 (_ BitVec 32)) Bool)

(assert (=> b!1541083 (= res!1057631 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057633 () Bool)

(assert (=> start!131484 (=> (not res!1057633) (not e!857070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131484 (= res!1057633 (validMask!0 mask!4052))))

(assert (=> start!131484 e!857070))

(assert (=> start!131484 true))

(declare-fun array_inv!38430 (array!102387) Bool)

(assert (=> start!131484 (array_inv!38430 a!3920)))

(declare-fun b!1541084 () Bool)

(declare-fun res!1057629 () Bool)

(assert (=> b!1541084 (=> (not res!1057629) (not e!857070))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541084 (= res!1057629 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49952 a!3920))))))

(declare-fun b!1541085 () Bool)

(declare-fun res!1057630 () Bool)

(assert (=> b!1541085 (=> (not res!1057630) (not e!857070))))

(assert (=> b!1541085 (= res!1057630 (and (= (size!49952 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49952 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49952 a!3920))))))

(declare-fun b!1541086 () Bool)

(declare-fun res!1057632 () Bool)

(assert (=> b!1541086 (=> (not res!1057632) (not e!857070))))

(assert (=> b!1541086 (= res!1057632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541087 () Bool)

(assert (=> b!1541087 (= e!857070 (not (bvsge newFrom!293 #b00000000000000000000000000000000)))))

(assert (=> b!1541087 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51466 0))(
  ( (Unit!51467) )
))
(declare-fun lt!665578 () Unit!51466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51466)

(assert (=> b!1541087 (= lt!665578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131484 res!1057633) b!1541085))

(assert (= (and b!1541085 res!1057630) b!1541083))

(assert (= (and b!1541083 res!1057631) b!1541084))

(assert (= (and b!1541084 res!1057629) b!1541086))

(assert (= (and b!1541086 res!1057632) b!1541087))

(declare-fun m!1423107 () Bool)

(assert (=> b!1541083 m!1423107))

(declare-fun m!1423109 () Bool)

(assert (=> start!131484 m!1423109))

(declare-fun m!1423111 () Bool)

(assert (=> start!131484 m!1423111))

(declare-fun m!1423113 () Bool)

(assert (=> b!1541086 m!1423113))

(declare-fun m!1423115 () Bool)

(assert (=> b!1541087 m!1423115))

(declare-fun m!1423117 () Bool)

(assert (=> b!1541087 m!1423117))

(push 1)

(assert (not b!1541086))

(assert (not b!1541087))

(assert (not b!1541083))

(assert (not start!131484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

