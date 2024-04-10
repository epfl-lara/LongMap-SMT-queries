; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131500 () Bool)

(assert start!131500)

(declare-fun res!1057707 () Bool)

(declare-fun e!857118 () Bool)

(assert (=> start!131500 (=> (not res!1057707) (not e!857118))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131500 (= res!1057707 (validMask!0 mask!4052))))

(assert (=> start!131500 e!857118))

(assert (=> start!131500 true))

(declare-datatypes ((array!102403 0))(
  ( (array!102404 (arr!49410 (Array (_ BitVec 32) (_ BitVec 64))) (size!49960 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102403)

(declare-fun array_inv!38438 (array!102403) Bool)

(assert (=> start!131500 (array_inv!38438 a!3920)))

(declare-fun b!1541161 () Bool)

(declare-fun res!1057708 () Bool)

(assert (=> b!1541161 (=> (not res!1057708) (not e!857118))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541161 (= res!1057708 (and (= (size!49960 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49960 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49960 a!3920))))))

(declare-fun b!1541162 () Bool)

(assert (=> b!1541162 (= e!857118 false)))

(declare-fun lt!665602 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102403 (_ BitVec 32)) Bool)

(assert (=> b!1541162 (= lt!665602 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131500 res!1057707) b!1541161))

(assert (= (and b!1541161 res!1057708) b!1541162))

(declare-fun m!1423179 () Bool)

(assert (=> start!131500 m!1423179))

(declare-fun m!1423181 () Bool)

(assert (=> start!131500 m!1423181))

(declare-fun m!1423183 () Bool)

(assert (=> b!1541162 m!1423183))

(check-sat (not start!131500) (not b!1541162))
