; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131992 () Bool)

(assert start!131992)

(declare-fun b!1543918 () Bool)

(declare-fun res!1058865 () Bool)

(declare-fun e!858850 () Bool)

(assert (=> b!1543918 (=> (not res!1058865) (not e!858850))))

(declare-datatypes ((array!102588 0))(
  ( (array!102589 (arr!49494 (Array (_ BitVec 32) (_ BitVec 64))) (size!50045 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102588)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102588 (_ BitVec 32)) Bool)

(assert (=> b!1543918 (= res!1058865 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1543919 () Bool)

(assert (=> b!1543919 (= e!858850 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1543919 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51413 0))(
  ( (Unit!51414) )
))
(declare-fun lt!666603 () Unit!51413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51413)

(assert (=> b!1543919 (= lt!666603 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun res!1058867 () Bool)

(assert (=> start!131992 (=> (not res!1058867) (not e!858850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131992 (= res!1058867 (validMask!0 mask!4052))))

(assert (=> start!131992 e!858850))

(assert (=> start!131992 true))

(declare-fun array_inv!38775 (array!102588) Bool)

(assert (=> start!131992 (array_inv!38775 a!3920)))

(declare-fun b!1543920 () Bool)

(declare-fun res!1058864 () Bool)

(assert (=> b!1543920 (=> (not res!1058864) (not e!858850))))

(assert (=> b!1543920 (= res!1058864 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50045 a!3920))))))

(declare-fun b!1543921 () Bool)

(declare-fun res!1058866 () Bool)

(assert (=> b!1543921 (=> (not res!1058866) (not e!858850))))

(assert (=> b!1543921 (= res!1058866 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543922 () Bool)

(declare-fun res!1058868 () Bool)

(assert (=> b!1543922 (=> (not res!1058868) (not e!858850))))

(assert (=> b!1543922 (= res!1058868 (and (= (size!50045 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50045 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50045 a!3920))))))

(assert (= (and start!131992 res!1058867) b!1543922))

(assert (= (and b!1543922 res!1058868) b!1543921))

(assert (= (and b!1543921 res!1058866) b!1543920))

(assert (= (and b!1543920 res!1058864) b!1543918))

(assert (= (and b!1543918 res!1058865) b!1543919))

(declare-fun m!1425719 () Bool)

(assert (=> b!1543918 m!1425719))

(declare-fun m!1425721 () Bool)

(assert (=> b!1543919 m!1425721))

(declare-fun m!1425723 () Bool)

(assert (=> b!1543919 m!1425723))

(declare-fun m!1425725 () Bool)

(assert (=> start!131992 m!1425725))

(declare-fun m!1425727 () Bool)

(assert (=> start!131992 m!1425727))

(declare-fun m!1425729 () Bool)

(assert (=> b!1543921 m!1425729))

(push 1)

(assert (not b!1543921))

(assert (not b!1543918))

(assert (not b!1543919))

(assert (not start!131992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

