; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131578 () Bool)

(assert start!131578)

(declare-fun b!1541467 () Bool)

(declare-fun e!857334 () Bool)

(assert (=> b!1541467 (= e!857334 (not true))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102466 0))(
  ( (array!102467 (arr!49440 (Array (_ BitVec 32) (_ BitVec 64))) (size!49990 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102466)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102466 (_ BitVec 32)) Bool)

(assert (=> b!1541467 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-fun from!3298 () (_ BitVec 32))

(declare-datatypes ((Unit!51482 0))(
  ( (Unit!51483) )
))
(declare-fun lt!665692 () Unit!51482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51482)

(assert (=> b!1541467 (= lt!665692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541468 () Bool)

(declare-fun res!1057990 () Bool)

(assert (=> b!1541468 (=> (not res!1057990) (not e!857334))))

(assert (=> b!1541468 (= res!1057990 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057989 () Bool)

(assert (=> start!131578 (=> (not res!1057989) (not e!857334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131578 (= res!1057989 (validMask!0 mask!4052))))

(assert (=> start!131578 e!857334))

(assert (=> start!131578 true))

(declare-fun array_inv!38468 (array!102466) Bool)

(assert (=> start!131578 (array_inv!38468 a!3920)))

(declare-fun b!1541469 () Bool)

(declare-fun res!1057991 () Bool)

(assert (=> b!1541469 (=> (not res!1057991) (not e!857334))))

(assert (=> b!1541469 (= res!1057991 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49990 a!3920))))))

(declare-fun b!1541470 () Bool)

(declare-fun res!1057993 () Bool)

(assert (=> b!1541470 (=> (not res!1057993) (not e!857334))))

(assert (=> b!1541470 (= res!1057993 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541471 () Bool)

(declare-fun res!1057992 () Bool)

(assert (=> b!1541471 (=> (not res!1057992) (not e!857334))))

(assert (=> b!1541471 (= res!1057992 (and (= (size!49990 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49990 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49990 a!3920))))))

(assert (= (and start!131578 res!1057989) b!1541471))

(assert (= (and b!1541471 res!1057992) b!1541470))

(assert (= (and b!1541470 res!1057993) b!1541469))

(assert (= (and b!1541469 res!1057991) b!1541468))

(assert (= (and b!1541468 res!1057990) b!1541467))

(declare-fun m!1423449 () Bool)

(assert (=> b!1541467 m!1423449))

(declare-fun m!1423451 () Bool)

(assert (=> b!1541467 m!1423451))

(declare-fun m!1423453 () Bool)

(assert (=> b!1541468 m!1423453))

(declare-fun m!1423455 () Bool)

(assert (=> start!131578 m!1423455))

(declare-fun m!1423457 () Bool)

(assert (=> start!131578 m!1423457))

(declare-fun m!1423459 () Bool)

(assert (=> b!1541470 m!1423459))

(check-sat (not start!131578) (not b!1541470) (not b!1541468) (not b!1541467))
