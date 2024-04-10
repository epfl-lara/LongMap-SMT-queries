; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31930 () Bool)

(assert start!31930)

(declare-fun b!319079 () Bool)

(declare-fun e!198214 () Bool)

(declare-fun e!198213 () Bool)

(assert (=> b!319079 (= e!198214 e!198213)))

(declare-fun res!173471 () Bool)

(assert (=> b!319079 (=> (not res!173471) (not e!198213))))

(declare-datatypes ((array!16250 0))(
  ( (array!16251 (arr!7689 (Array (_ BitVec 32) (_ BitVec 64))) (size!8041 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16250)

(declare-datatypes ((SeekEntryResult!2829 0))(
  ( (MissingZero!2829 (index!13492 (_ BitVec 32))) (Found!2829 (index!13493 (_ BitVec 32))) (Intermediate!2829 (undefined!3641 Bool) (index!13494 (_ BitVec 32)) (x!31751 (_ BitVec 32))) (Undefined!2829) (MissingVacant!2829 (index!13495 (_ BitVec 32))) )
))
(declare-fun lt!155625 () SeekEntryResult!2829)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!155624 () SeekEntryResult!2829)

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!319079 (= res!173471 (and (= lt!155624 lt!155625) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7689 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16250 (_ BitVec 32)) SeekEntryResult!2829)

(assert (=> b!319079 (= lt!155624 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!319080 () Bool)

(declare-fun res!173467 () Bool)

(declare-fun e!198215 () Bool)

(assert (=> b!319080 (=> (not res!173467) (not e!198215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319080 (= res!173467 (validKeyInArray!0 k0!2441))))

(declare-fun b!319081 () Bool)

(declare-fun res!173472 () Bool)

(assert (=> b!319081 (=> (not res!173472) (not e!198214))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!319081 (= res!173472 (and (= (select (arr!7689 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8041 a!3293))))))

(declare-fun b!319082 () Bool)

(declare-fun res!173470 () Bool)

(assert (=> b!319082 (=> (not res!173470) (not e!198215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16250 (_ BitVec 32)) Bool)

(assert (=> b!319082 (= res!173470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319083 () Bool)

(declare-fun res!173465 () Bool)

(assert (=> b!319083 (=> (not res!173465) (not e!198215))))

(declare-fun arrayContainsKey!0 (array!16250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319083 (= res!173465 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun lt!155626 () (_ BitVec 32))

(declare-fun lt!155627 () SeekEntryResult!2829)

(declare-fun b!319084 () Bool)

(assert (=> b!319084 (= e!198213 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155626 #b00000000000000000000000000000000) (bvsge lt!155626 (size!8041 a!3293)) (not (= lt!155627 lt!155625)) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1427)) (bvsub #b01111111111111111111111111111110 x!1427)))))))

(declare-fun e!198217 () Bool)

(assert (=> b!319084 e!198217))

(declare-fun res!173464 () Bool)

(assert (=> b!319084 (=> (not res!173464) (not e!198217))))

(assert (=> b!319084 (= res!173464 (= lt!155624 lt!155627))))

(assert (=> b!319084 (= lt!155627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155626 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319084 (= lt!155626 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!173469 () Bool)

(assert (=> start!31930 (=> (not res!173469) (not e!198215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31930 (= res!173469 (validMask!0 mask!3709))))

(assert (=> start!31930 e!198215))

(declare-fun array_inv!5652 (array!16250) Bool)

(assert (=> start!31930 (array_inv!5652 a!3293)))

(assert (=> start!31930 true))

(declare-fun b!319085 () Bool)

(declare-fun res!173463 () Bool)

(assert (=> b!319085 (=> (not res!173463) (not e!198215))))

(assert (=> b!319085 (= res!173463 (and (= (size!8041 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8041 a!3293))))))

(declare-fun b!319086 () Bool)

(assert (=> b!319086 (= e!198215 e!198214)))

(declare-fun res!173468 () Bool)

(assert (=> b!319086 (=> (not res!173468) (not e!198214))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319086 (= res!173468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155625))))

(assert (=> b!319086 (= lt!155625 (Intermediate!2829 false resIndex!52 resX!52))))

(declare-fun b!319087 () Bool)

(declare-fun res!173466 () Bool)

(assert (=> b!319087 (=> (not res!173466) (not e!198215))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16250 (_ BitVec 32)) SeekEntryResult!2829)

(assert (=> b!319087 (= res!173466 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2829 i!1240)))))

(declare-fun b!319088 () Bool)

(declare-fun lt!155628 () array!16250)

(assert (=> b!319088 (= e!198217 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155628 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155626 k0!2441 lt!155628 mask!3709)))))

(assert (=> b!319088 (= lt!155628 (array!16251 (store (arr!7689 a!3293) i!1240 k0!2441) (size!8041 a!3293)))))

(assert (= (and start!31930 res!173469) b!319085))

(assert (= (and b!319085 res!173463) b!319080))

(assert (= (and b!319080 res!173467) b!319083))

(assert (= (and b!319083 res!173465) b!319087))

(assert (= (and b!319087 res!173466) b!319082))

(assert (= (and b!319082 res!173470) b!319086))

(assert (= (and b!319086 res!173468) b!319081))

(assert (= (and b!319081 res!173472) b!319079))

(assert (= (and b!319079 res!173471) b!319084))

(assert (= (and b!319084 res!173464) b!319088))

(declare-fun m!327679 () Bool)

(assert (=> b!319087 m!327679))

(declare-fun m!327681 () Bool)

(assert (=> b!319083 m!327681))

(declare-fun m!327683 () Bool)

(assert (=> b!319082 m!327683))

(declare-fun m!327685 () Bool)

(assert (=> b!319080 m!327685))

(declare-fun m!327687 () Bool)

(assert (=> b!319088 m!327687))

(declare-fun m!327689 () Bool)

(assert (=> b!319088 m!327689))

(declare-fun m!327691 () Bool)

(assert (=> b!319088 m!327691))

(declare-fun m!327693 () Bool)

(assert (=> b!319079 m!327693))

(declare-fun m!327695 () Bool)

(assert (=> b!319079 m!327695))

(declare-fun m!327697 () Bool)

(assert (=> b!319086 m!327697))

(assert (=> b!319086 m!327697))

(declare-fun m!327699 () Bool)

(assert (=> b!319086 m!327699))

(declare-fun m!327701 () Bool)

(assert (=> b!319081 m!327701))

(declare-fun m!327703 () Bool)

(assert (=> b!319084 m!327703))

(declare-fun m!327705 () Bool)

(assert (=> b!319084 m!327705))

(declare-fun m!327707 () Bool)

(assert (=> start!31930 m!327707))

(declare-fun m!327709 () Bool)

(assert (=> start!31930 m!327709))

(check-sat (not b!319079) (not start!31930) (not b!319080) (not b!319088) (not b!319082) (not b!319086) (not b!319083) (not b!319084) (not b!319087))
(check-sat)
