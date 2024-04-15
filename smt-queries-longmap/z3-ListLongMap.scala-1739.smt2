; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31926 () Bool)

(assert start!31926)

(declare-fun b!318954 () Bool)

(declare-fun e!198114 () Bool)

(declare-fun e!198112 () Bool)

(assert (=> b!318954 (= e!198114 (not e!198112))))

(declare-fun res!173487 () Bool)

(assert (=> b!318954 (=> res!173487 e!198112)))

(declare-fun lt!155500 () (_ BitVec 32))

(declare-datatypes ((array!16250 0))(
  ( (array!16251 (arr!7689 (Array (_ BitVec 32) (_ BitVec 64))) (size!8042 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16250)

(declare-datatypes ((SeekEntryResult!2828 0))(
  ( (MissingZero!2828 (index!13488 (_ BitVec 32))) (Found!2828 (index!13489 (_ BitVec 32))) (Intermediate!2828 (undefined!3640 Bool) (index!13490 (_ BitVec 32)) (x!31761 (_ BitVec 32))) (Undefined!2828) (MissingVacant!2828 (index!13491 (_ BitVec 32))) )
))
(declare-fun lt!155503 () SeekEntryResult!2828)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155498 () SeekEntryResult!2828)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318954 (= res!173487 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155500 #b00000000000000000000000000000000) (bvsge lt!155500 (size!8042 a!3293)) (not (= lt!155498 lt!155503))))))

(declare-fun lt!155499 () SeekEntryResult!2828)

(declare-fun lt!155497 () SeekEntryResult!2828)

(assert (=> b!318954 (= lt!155499 lt!155497)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155502 () array!16250)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16250 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!318954 (= lt!155497 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155500 k0!2441 lt!155502 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318954 (= lt!155499 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155502 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318954 (= lt!155502 (array!16251 (store (arr!7689 a!3293) i!1240 k0!2441) (size!8042 a!3293)))))

(declare-fun lt!155501 () SeekEntryResult!2828)

(assert (=> b!318954 (= lt!155501 lt!155498)))

(assert (=> b!318954 (= lt!155498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155500 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318954 (= lt!155500 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318955 () Bool)

(declare-fun res!173485 () Bool)

(declare-fun e!198116 () Bool)

(assert (=> b!318955 (=> (not res!173485) (not e!198116))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16250 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!318955 (= res!173485 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2828 i!1240)))))

(declare-fun b!318956 () Bool)

(declare-fun e!198115 () Bool)

(assert (=> b!318956 (= e!198116 e!198115)))

(declare-fun res!173492 () Bool)

(assert (=> b!318956 (=> (not res!173492) (not e!198115))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318956 (= res!173492 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155503))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318956 (= lt!155503 (Intermediate!2828 false resIndex!52 resX!52))))

(declare-fun b!318958 () Bool)

(assert (=> b!318958 (= e!198115 e!198114)))

(declare-fun res!173488 () Bool)

(assert (=> b!318958 (=> (not res!173488) (not e!198114))))

(assert (=> b!318958 (= res!173488 (and (= lt!155501 lt!155503) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7689 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318958 (= lt!155501 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318959 () Bool)

(declare-fun res!173491 () Bool)

(assert (=> b!318959 (=> (not res!173491) (not e!198116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16250 (_ BitVec 32)) Bool)

(assert (=> b!318959 (= res!173491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318960 () Bool)

(declare-fun res!173490 () Bool)

(assert (=> b!318960 (=> (not res!173490) (not e!198115))))

(assert (=> b!318960 (= res!173490 (and (= (select (arr!7689 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8042 a!3293))))))

(declare-fun b!318961 () Bool)

(declare-fun res!173484 () Bool)

(assert (=> b!318961 (=> (not res!173484) (not e!198116))))

(declare-fun arrayContainsKey!0 (array!16250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318961 (= res!173484 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318962 () Bool)

(declare-fun res!173486 () Bool)

(assert (=> b!318962 (=> (not res!173486) (not e!198116))))

(assert (=> b!318962 (= res!173486 (and (= (size!8042 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8042 a!3293))))))

(declare-fun b!318963 () Bool)

(declare-fun res!173489 () Bool)

(assert (=> b!318963 (=> (not res!173489) (not e!198116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318963 (= res!173489 (validKeyInArray!0 k0!2441))))

(declare-fun b!318957 () Bool)

(assert (=> b!318957 (= e!198112 (= lt!155499 lt!155501))))

(assert (=> b!318957 (= lt!155497 lt!155498)))

(declare-datatypes ((Unit!9770 0))(
  ( (Unit!9771) )
))
(declare-fun lt!155504 () Unit!9770)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9770)

(assert (=> b!318957 (= lt!155504 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155500 resIndex!52 resX!52 mask!3709))))

(declare-fun res!173493 () Bool)

(assert (=> start!31926 (=> (not res!173493) (not e!198116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31926 (= res!173493 (validMask!0 mask!3709))))

(assert (=> start!31926 e!198116))

(declare-fun array_inv!5661 (array!16250) Bool)

(assert (=> start!31926 (array_inv!5661 a!3293)))

(assert (=> start!31926 true))

(assert (= (and start!31926 res!173493) b!318962))

(assert (= (and b!318962 res!173486) b!318963))

(assert (= (and b!318963 res!173489) b!318961))

(assert (= (and b!318961 res!173484) b!318955))

(assert (= (and b!318955 res!173485) b!318959))

(assert (= (and b!318959 res!173491) b!318956))

(assert (= (and b!318956 res!173492) b!318960))

(assert (= (and b!318960 res!173490) b!318958))

(assert (= (and b!318958 res!173488) b!318954))

(assert (= (and b!318954 (not res!173487)) b!318957))

(declare-fun m!327115 () Bool)

(assert (=> b!318954 m!327115))

(declare-fun m!327117 () Bool)

(assert (=> b!318954 m!327117))

(declare-fun m!327119 () Bool)

(assert (=> b!318954 m!327119))

(declare-fun m!327121 () Bool)

(assert (=> b!318954 m!327121))

(declare-fun m!327123 () Bool)

(assert (=> b!318954 m!327123))

(declare-fun m!327125 () Bool)

(assert (=> b!318955 m!327125))

(declare-fun m!327127 () Bool)

(assert (=> b!318960 m!327127))

(declare-fun m!327129 () Bool)

(assert (=> b!318957 m!327129))

(declare-fun m!327131 () Bool)

(assert (=> b!318963 m!327131))

(declare-fun m!327133 () Bool)

(assert (=> start!31926 m!327133))

(declare-fun m!327135 () Bool)

(assert (=> start!31926 m!327135))

(declare-fun m!327137 () Bool)

(assert (=> b!318958 m!327137))

(declare-fun m!327139 () Bool)

(assert (=> b!318958 m!327139))

(declare-fun m!327141 () Bool)

(assert (=> b!318956 m!327141))

(assert (=> b!318956 m!327141))

(declare-fun m!327143 () Bool)

(assert (=> b!318956 m!327143))

(declare-fun m!327145 () Bool)

(assert (=> b!318959 m!327145))

(declare-fun m!327147 () Bool)

(assert (=> b!318961 m!327147))

(check-sat (not b!318956) (not b!318963) (not b!318959) (not b!318958) (not b!318955) (not b!318957) (not start!31926) (not b!318961) (not b!318954))
(check-sat)
