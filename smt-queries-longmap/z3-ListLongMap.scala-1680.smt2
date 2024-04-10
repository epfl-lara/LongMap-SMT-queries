; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30970 () Bool)

(assert start!30970)

(declare-fun b!311087 () Bool)

(declare-fun res!167545 () Bool)

(declare-fun e!194146 () Bool)

(assert (=> b!311087 (=> (not res!167545) (not e!194146))))

(declare-datatypes ((array!15872 0))(
  ( (array!15873 (arr!7518 (Array (_ BitVec 32) (_ BitVec 64))) (size!7870 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15872)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311087 (= res!167545 (and (= (size!7870 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7870 a!3293))))))

(declare-fun e!194143 () Bool)

(declare-fun lt!152217 () array!15872)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!311088 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152215 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2658 0))(
  ( (MissingZero!2658 (index!12808 (_ BitVec 32))) (Found!2658 (index!12809 (_ BitVec 32))) (Intermediate!2658 (undefined!3470 Bool) (index!12810 (_ BitVec 32)) (x!31031 (_ BitVec 32))) (Undefined!2658) (MissingVacant!2658 (index!12811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15872 (_ BitVec 32)) SeekEntryResult!2658)

(assert (=> b!311088 (= e!194143 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152217 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152215 k0!2441 lt!152217 mask!3709)))))

(assert (=> b!311088 (= lt!152217 (array!15873 (store (arr!7518 a!3293) i!1240 k0!2441) (size!7870 a!3293)))))

(declare-fun b!311089 () Bool)

(declare-fun res!167541 () Bool)

(assert (=> b!311089 (=> (not res!167541) (not e!194146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311089 (= res!167541 (validKeyInArray!0 k0!2441))))

(declare-fun b!311091 () Bool)

(declare-fun res!167543 () Bool)

(assert (=> b!311091 (=> (not res!167543) (not e!194146))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15872 (_ BitVec 32)) SeekEntryResult!2658)

(assert (=> b!311091 (= res!167543 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2658 i!1240)))))

(declare-fun b!311092 () Bool)

(declare-fun e!194145 () Bool)

(declare-fun e!194142 () Bool)

(assert (=> b!311092 (= e!194145 e!194142)))

(declare-fun res!167546 () Bool)

(assert (=> b!311092 (=> (not res!167546) (not e!194142))))

(declare-fun lt!152216 () SeekEntryResult!2658)

(declare-fun lt!152214 () SeekEntryResult!2658)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311092 (= res!167546 (and (= lt!152216 lt!152214) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7518 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311092 (= lt!152216 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311093 () Bool)

(assert (=> b!311093 (= e!194142 (not true))))

(assert (=> b!311093 e!194143))

(declare-fun res!167550 () Bool)

(assert (=> b!311093 (=> (not res!167550) (not e!194143))))

(assert (=> b!311093 (= res!167550 (= lt!152216 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152215 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311093 (= lt!152215 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311094 () Bool)

(declare-fun res!167549 () Bool)

(assert (=> b!311094 (=> (not res!167549) (not e!194146))))

(declare-fun arrayContainsKey!0 (array!15872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311094 (= res!167549 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!167547 () Bool)

(assert (=> start!30970 (=> (not res!167547) (not e!194146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30970 (= res!167547 (validMask!0 mask!3709))))

(assert (=> start!30970 e!194146))

(declare-fun array_inv!5481 (array!15872) Bool)

(assert (=> start!30970 (array_inv!5481 a!3293)))

(assert (=> start!30970 true))

(declare-fun b!311090 () Bool)

(declare-fun res!167544 () Bool)

(assert (=> b!311090 (=> (not res!167544) (not e!194146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15872 (_ BitVec 32)) Bool)

(assert (=> b!311090 (= res!167544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311095 () Bool)

(assert (=> b!311095 (= e!194146 e!194145)))

(declare-fun res!167542 () Bool)

(assert (=> b!311095 (=> (not res!167542) (not e!194145))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311095 (= res!167542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152214))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311095 (= lt!152214 (Intermediate!2658 false resIndex!52 resX!52))))

(declare-fun b!311096 () Bool)

(declare-fun res!167548 () Bool)

(assert (=> b!311096 (=> (not res!167548) (not e!194145))))

(assert (=> b!311096 (= res!167548 (and (= (select (arr!7518 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7870 a!3293))))))

(assert (= (and start!30970 res!167547) b!311087))

(assert (= (and b!311087 res!167545) b!311089))

(assert (= (and b!311089 res!167541) b!311094))

(assert (= (and b!311094 res!167549) b!311091))

(assert (= (and b!311091 res!167543) b!311090))

(assert (= (and b!311090 res!167544) b!311095))

(assert (= (and b!311095 res!167542) b!311096))

(assert (= (and b!311096 res!167548) b!311092))

(assert (= (and b!311092 res!167546) b!311093))

(assert (= (and b!311093 res!167550) b!311088))

(declare-fun m!321037 () Bool)

(assert (=> b!311090 m!321037))

(declare-fun m!321039 () Bool)

(assert (=> b!311091 m!321039))

(declare-fun m!321041 () Bool)

(assert (=> start!30970 m!321041))

(declare-fun m!321043 () Bool)

(assert (=> start!30970 m!321043))

(declare-fun m!321045 () Bool)

(assert (=> b!311089 m!321045))

(declare-fun m!321047 () Bool)

(assert (=> b!311092 m!321047))

(declare-fun m!321049 () Bool)

(assert (=> b!311092 m!321049))

(declare-fun m!321051 () Bool)

(assert (=> b!311095 m!321051))

(assert (=> b!311095 m!321051))

(declare-fun m!321053 () Bool)

(assert (=> b!311095 m!321053))

(declare-fun m!321055 () Bool)

(assert (=> b!311096 m!321055))

(declare-fun m!321057 () Bool)

(assert (=> b!311093 m!321057))

(declare-fun m!321059 () Bool)

(assert (=> b!311093 m!321059))

(declare-fun m!321061 () Bool)

(assert (=> b!311088 m!321061))

(declare-fun m!321063 () Bool)

(assert (=> b!311088 m!321063))

(declare-fun m!321065 () Bool)

(assert (=> b!311088 m!321065))

(declare-fun m!321067 () Bool)

(assert (=> b!311094 m!321067))

(check-sat (not b!311092) (not b!311091) (not b!311093) (not b!311089) (not b!311095) (not b!311088) (not start!30970) (not b!311094) (not b!311090))
(check-sat)
