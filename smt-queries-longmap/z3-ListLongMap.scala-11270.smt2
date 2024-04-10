; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131464 () Bool)

(assert start!131464)

(declare-fun b!1540937 () Bool)

(declare-fun res!1057484 () Bool)

(declare-fun e!857010 () Bool)

(assert (=> b!1540937 (=> (not res!1057484) (not e!857010))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102367 0))(
  ( (array!102368 (arr!49392 (Array (_ BitVec 32) (_ BitVec 64))) (size!49942 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102367)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540937 (= res!1057484 (and (= (size!49942 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49942 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49942 a!3920))))))

(declare-fun res!1057483 () Bool)

(assert (=> start!131464 (=> (not res!1057483) (not e!857010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131464 (= res!1057483 (validMask!0 mask!4052))))

(assert (=> start!131464 e!857010))

(assert (=> start!131464 true))

(declare-fun array_inv!38420 (array!102367) Bool)

(assert (=> start!131464 (array_inv!38420 a!3920)))

(declare-fun b!1540939 () Bool)

(declare-fun res!1057486 () Bool)

(assert (=> b!1540939 (=> (not res!1057486) (not e!857010))))

(assert (=> b!1540939 (= res!1057486 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49942 a!3920))))))

(declare-fun b!1540938 () Bool)

(declare-fun res!1057485 () Bool)

(assert (=> b!1540938 (=> (not res!1057485) (not e!857010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102367 (_ BitVec 32)) Bool)

(assert (=> b!1540938 (= res!1057485 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540940 () Bool)

(assert (=> b!1540940 (= e!857010 false)))

(declare-fun lt!665548 () Bool)

(assert (=> b!1540940 (= lt!665548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131464 res!1057483) b!1540937))

(assert (= (and b!1540937 res!1057484) b!1540938))

(assert (= (and b!1540938 res!1057485) b!1540939))

(assert (= (and b!1540939 res!1057486) b!1540940))

(declare-fun m!1422995 () Bool)

(assert (=> start!131464 m!1422995))

(declare-fun m!1422997 () Bool)

(assert (=> start!131464 m!1422997))

(declare-fun m!1422999 () Bool)

(assert (=> b!1540938 m!1422999))

(declare-fun m!1423001 () Bool)

(assert (=> b!1540940 m!1423001))

(check-sat (not b!1540938) (not start!131464) (not b!1540940))
