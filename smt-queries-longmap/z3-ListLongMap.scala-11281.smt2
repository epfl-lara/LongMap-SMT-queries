; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131530 () Bool)

(assert start!131530)

(declare-fun res!1057806 () Bool)

(declare-fun e!857209 () Bool)

(assert (=> start!131530 (=> (not res!1057806) (not e!857209))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131530 (= res!1057806 (validMask!0 mask!4052))))

(assert (=> start!131530 e!857209))

(assert (=> start!131530 true))

(declare-datatypes ((array!102433 0))(
  ( (array!102434 (arr!49425 (Array (_ BitVec 32) (_ BitVec 64))) (size!49975 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102433)

(declare-fun array_inv!38453 (array!102433) Bool)

(assert (=> start!131530 (array_inv!38453 a!3920)))

(declare-fun b!1541260 () Bool)

(declare-fun res!1057807 () Bool)

(assert (=> b!1541260 (=> (not res!1057807) (not e!857209))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541260 (= res!1057807 (and (= (size!49975 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49975 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49975 a!3920))))))

(declare-fun b!1541261 () Bool)

(assert (=> b!1541261 (= e!857209 false)))

(declare-fun lt!665638 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102433 (_ BitVec 32)) Bool)

(assert (=> b!1541261 (= lt!665638 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131530 res!1057806) b!1541260))

(assert (= (and b!1541260 res!1057807) b!1541261))

(declare-fun m!1423269 () Bool)

(assert (=> start!131530 m!1423269))

(declare-fun m!1423271 () Bool)

(assert (=> start!131530 m!1423271))

(declare-fun m!1423273 () Bool)

(assert (=> b!1541261 m!1423273))

(check-sat (not b!1541261) (not start!131530))
