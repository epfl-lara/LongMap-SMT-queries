; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36338 () Bool)

(assert start!36338)

(declare-fun b!363598 () Bool)

(declare-fun res!202761 () Bool)

(declare-fun e!222627 () Bool)

(assert (=> b!363598 (=> (not res!202761) (not e!222627))))

(declare-datatypes ((array!20618 0))(
  ( (array!20619 (arr!9788 (Array (_ BitVec 32) (_ BitVec 64))) (size!10140 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20618)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363598 (= res!202761 (not (validKeyInArray!0 (select (arr!9788 a!4289) i!1472))))))

(declare-fun res!202762 () Bool)

(assert (=> start!36338 (=> (not res!202762) (not e!222627))))

(assert (=> start!36338 (= res!202762 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10140 a!4289))))))

(assert (=> start!36338 e!222627))

(assert (=> start!36338 true))

(declare-fun array_inv!7230 (array!20618) Bool)

(assert (=> start!36338 (array_inv!7230 a!4289)))

(declare-fun b!363601 () Bool)

(assert (=> b!363601 (= e!222627 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167773 () (_ BitVec 32))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20618 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363601 (= lt!167773 (arrayCountValidKeys!0 (array!20619 (store (arr!9788 a!4289) i!1472 k0!2974) (size!10140 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167772 () (_ BitVec 32))

(assert (=> b!363601 (= lt!167772 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!363600 () Bool)

(declare-fun res!202759 () Bool)

(assert (=> b!363600 (=> (not res!202759) (not e!222627))))

(assert (=> b!363600 (= res!202759 (and (bvslt (size!10140 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10140 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363599 () Bool)

(declare-fun res!202760 () Bool)

(assert (=> b!363599 (=> (not res!202760) (not e!222627))))

(assert (=> b!363599 (= res!202760 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36338 res!202762) b!363598))

(assert (= (and b!363598 res!202761) b!363599))

(assert (= (and b!363599 res!202760) b!363600))

(assert (= (and b!363600 res!202759) b!363601))

(declare-fun m!360721 () Bool)

(assert (=> b!363598 m!360721))

(assert (=> b!363598 m!360721))

(declare-fun m!360723 () Bool)

(assert (=> b!363598 m!360723))

(declare-fun m!360725 () Bool)

(assert (=> start!36338 m!360725))

(declare-fun m!360727 () Bool)

(assert (=> b!363601 m!360727))

(declare-fun m!360729 () Bool)

(assert (=> b!363601 m!360729))

(declare-fun m!360731 () Bool)

(assert (=> b!363601 m!360731))

(declare-fun m!360733 () Bool)

(assert (=> b!363599 m!360733))

(check-sat (not b!363601) (not b!363598) (not b!363599) (not start!36338))
