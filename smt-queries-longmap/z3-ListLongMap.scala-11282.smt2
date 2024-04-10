; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131536 () Bool)

(assert start!131536)

(declare-fun res!1057831 () Bool)

(declare-fun e!857226 () Bool)

(assert (=> start!131536 (=> (not res!1057831) (not e!857226))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131536 (= res!1057831 (validMask!0 mask!4052))))

(assert (=> start!131536 e!857226))

(assert (=> start!131536 true))

(declare-datatypes ((array!102439 0))(
  ( (array!102440 (arr!49428 (Array (_ BitVec 32) (_ BitVec 64))) (size!49978 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102439)

(declare-fun array_inv!38456 (array!102439) Bool)

(assert (=> start!131536 (array_inv!38456 a!3920)))

(declare-fun b!1541283 () Bool)

(declare-fun res!1057829 () Bool)

(assert (=> b!1541283 (=> (not res!1057829) (not e!857226))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541283 (= res!1057829 (and (= (size!49978 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49978 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49978 a!3920))))))

(declare-fun b!1541284 () Bool)

(declare-fun res!1057830 () Bool)

(assert (=> b!1541284 (=> (not res!1057830) (not e!857226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102439 (_ BitVec 32)) Bool)

(assert (=> b!1541284 (= res!1057830 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541285 () Bool)

(assert (=> b!1541285 (= e!857226 (and (bvslt from!3298 newFrom!293) (or (bvslt (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!3298) (size!49978 a!3920)))))))

(assert (= (and start!131536 res!1057831) b!1541283))

(assert (= (and b!1541283 res!1057829) b!1541284))

(assert (= (and b!1541284 res!1057830) b!1541285))

(declare-fun m!1423287 () Bool)

(assert (=> start!131536 m!1423287))

(declare-fun m!1423289 () Bool)

(assert (=> start!131536 m!1423289))

(declare-fun m!1423291 () Bool)

(assert (=> b!1541284 m!1423291))

(check-sat (not b!1541284) (not start!131536))
(check-sat)
