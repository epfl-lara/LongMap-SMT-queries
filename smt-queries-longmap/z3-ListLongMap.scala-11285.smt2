; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131520 () Bool)

(assert start!131520)

(declare-fun res!1057802 () Bool)

(declare-fun e!857113 () Bool)

(assert (=> start!131520 (=> (not res!1057802) (not e!857113))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131520 (= res!1057802 (validMask!0 mask!4052))))

(assert (=> start!131520 e!857113))

(assert (=> start!131520 true))

(declare-datatypes ((array!102406 0))(
  ( (array!102407 (arr!49411 (Array (_ BitVec 32) (_ BitVec 64))) (size!49963 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102406)

(declare-fun array_inv!38644 (array!102406) Bool)

(assert (=> start!131520 (array_inv!38644 a!3920)))

(declare-fun b!1541094 () Bool)

(declare-fun res!1057801 () Bool)

(assert (=> b!1541094 (=> (not res!1057801) (not e!857113))))

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102406 (_ BitVec 32)) Bool)

(assert (=> b!1541094 (= res!1057801 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541095 () Bool)

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541095 (= e!857113 (bvsge (bvsub newFrom!293 (bvadd #b00000000000000000000000000000001 from!3298)) (bvsub newFrom!293 from!3298)))))

(declare-fun b!1541096 () Bool)

(declare-fun res!1057800 () Bool)

(assert (=> b!1541096 (=> (not res!1057800) (not e!857113))))

(assert (=> b!1541096 (= res!1057800 (and (= (size!49963 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49963 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49963 a!3920))))))

(declare-fun b!1541097 () Bool)

(declare-fun res!1057804 () Bool)

(assert (=> b!1541097 (=> (not res!1057804) (not e!857113))))

(assert (=> b!1541097 (= res!1057804 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541098 () Bool)

(declare-fun res!1057803 () Bool)

(assert (=> b!1541098 (=> (not res!1057803) (not e!857113))))

(assert (=> b!1541098 (= res!1057803 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49963 a!3920))))))

(assert (= (and start!131520 res!1057802) b!1541096))

(assert (= (and b!1541096 res!1057800) b!1541097))

(assert (= (and b!1541097 res!1057804) b!1541098))

(assert (= (and b!1541098 res!1057803) b!1541094))

(assert (= (and b!1541094 res!1057801) b!1541095))

(declare-fun m!1422521 () Bool)

(assert (=> start!131520 m!1422521))

(declare-fun m!1422523 () Bool)

(assert (=> start!131520 m!1422523))

(declare-fun m!1422525 () Bool)

(assert (=> b!1541094 m!1422525))

(declare-fun m!1422527 () Bool)

(assert (=> b!1541097 m!1422527))

(check-sat (not start!131520) (not b!1541094) (not b!1541097))
(check-sat)
