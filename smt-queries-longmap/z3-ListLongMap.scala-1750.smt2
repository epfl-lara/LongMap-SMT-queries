; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32042 () Bool)

(assert start!32042)

(declare-fun b!319771 () Bool)

(declare-fun res!174135 () Bool)

(declare-fun e!198546 () Bool)

(assert (=> b!319771 (=> (not res!174135) (not e!198546))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319771 (= res!174135 (validKeyInArray!0 k0!2497))))

(declare-fun b!319772 () Bool)

(declare-fun res!174138 () Bool)

(assert (=> b!319772 (=> (not res!174138) (not e!198546))))

(declare-datatypes ((array!16329 0))(
  ( (array!16330 (arr!7726 (Array (_ BitVec 32) (_ BitVec 64))) (size!8078 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16329)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16329 (_ BitVec 32)) Bool)

(assert (=> b!319772 (= res!174138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319773 () Bool)

(declare-fun res!174134 () Bool)

(assert (=> b!319773 (=> (not res!174134) (not e!198546))))

(declare-fun arrayContainsKey!0 (array!16329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319773 (= res!174134 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174133 () Bool)

(assert (=> start!32042 (=> (not res!174133) (not e!198546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32042 (= res!174133 (validMask!0 mask!3777))))

(assert (=> start!32042 e!198546))

(assert (=> start!32042 true))

(declare-fun array_inv!5676 (array!16329) Bool)

(assert (=> start!32042 (array_inv!5676 a!3305)))

(declare-fun b!319774 () Bool)

(declare-fun res!174137 () Bool)

(assert (=> b!319774 (=> (not res!174137) (not e!198546))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319774 (= res!174137 (and (= (size!8078 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8078 a!3305))))))

(declare-fun b!319775 () Bool)

(declare-fun res!174136 () Bool)

(assert (=> b!319775 (=> (not res!174136) (not e!198546))))

(declare-datatypes ((SeekEntryResult!2822 0))(
  ( (MissingZero!2822 (index!13464 (_ BitVec 32))) (Found!2822 (index!13465 (_ BitVec 32))) (Intermediate!2822 (undefined!3634 Bool) (index!13466 (_ BitVec 32)) (x!31845 (_ BitVec 32))) (Undefined!2822) (MissingVacant!2822 (index!13467 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16329 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!319775 (= res!174136 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2822 i!1250)))))

(declare-fun b!319776 () Bool)

(assert (=> b!319776 (= e!198546 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155898 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319776 (= lt!155898 (toIndex!0 k0!2497 mask!3777))))

(assert (= (and start!32042 res!174133) b!319774))

(assert (= (and b!319774 res!174137) b!319771))

(assert (= (and b!319771 res!174135) b!319773))

(assert (= (and b!319773 res!174134) b!319775))

(assert (= (and b!319775 res!174136) b!319772))

(assert (= (and b!319772 res!174138) b!319776))

(declare-fun m!328501 () Bool)

(assert (=> start!32042 m!328501))

(declare-fun m!328503 () Bool)

(assert (=> start!32042 m!328503))

(declare-fun m!328505 () Bool)

(assert (=> b!319772 m!328505))

(declare-fun m!328507 () Bool)

(assert (=> b!319775 m!328507))

(declare-fun m!328509 () Bool)

(assert (=> b!319776 m!328509))

(declare-fun m!328511 () Bool)

(assert (=> b!319773 m!328511))

(declare-fun m!328513 () Bool)

(assert (=> b!319771 m!328513))

(check-sat (not b!319773) (not start!32042) (not b!319776) (not b!319771) (not b!319772) (not b!319775))
(check-sat)
