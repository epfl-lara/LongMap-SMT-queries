; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31002 () Bool)

(assert start!31002)

(declare-fun b!311502 () Bool)

(declare-fun res!168103 () Bool)

(declare-fun e!194313 () Bool)

(assert (=> b!311502 (=> (not res!168103) (not e!194313))))

(declare-datatypes ((array!15908 0))(
  ( (array!15909 (arr!7536 (Array (_ BitVec 32) (_ BitVec 64))) (size!7889 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15908)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311502 (= res!168103 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311503 () Bool)

(declare-fun e!194311 () Bool)

(assert (=> b!311503 (= e!194313 e!194311)))

(declare-fun res!168105 () Bool)

(assert (=> b!311503 (=> (not res!168105) (not e!194311))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2675 0))(
  ( (MissingZero!2675 (index!12876 (_ BitVec 32))) (Found!2675 (index!12877 (_ BitVec 32))) (Intermediate!2675 (undefined!3487 Bool) (index!12878 (_ BitVec 32)) (x!31107 (_ BitVec 32))) (Undefined!2675) (MissingVacant!2675 (index!12879 (_ BitVec 32))) )
))
(declare-fun lt!152267 () SeekEntryResult!2675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15908 (_ BitVec 32)) SeekEntryResult!2675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311503 (= res!168105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152267))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311503 (= lt!152267 (Intermediate!2675 false resIndex!52 resX!52))))

(declare-fun b!311504 () Bool)

(declare-fun e!194314 () Bool)

(declare-fun e!194312 () Bool)

(assert (=> b!311504 (= e!194314 (not e!194312))))

(declare-fun res!168108 () Bool)

(assert (=> b!311504 (=> res!168108 e!194312)))

(declare-fun lt!152269 () SeekEntryResult!2675)

(declare-fun lt!152266 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!311504 (= res!168108 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152266 #b00000000000000000000000000000000) (bvsge lt!152266 (size!7889 a!3293)) (not (= lt!152269 lt!152267))))))

(declare-fun lt!152270 () SeekEntryResult!2675)

(declare-fun lt!152265 () SeekEntryResult!2675)

(assert (=> b!311504 (= lt!152270 lt!152265)))

(declare-fun lt!152264 () array!15908)

(assert (=> b!311504 (= lt!152265 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152266 k0!2441 lt!152264 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311504 (= lt!152270 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152264 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311504 (= lt!152264 (array!15909 (store (arr!7536 a!3293) i!1240 k0!2441) (size!7889 a!3293)))))

(declare-fun lt!152263 () SeekEntryResult!2675)

(assert (=> b!311504 (= lt!152263 lt!152269)))

(assert (=> b!311504 (= lt!152269 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152266 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311504 (= lt!152266 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311505 () Bool)

(declare-fun res!168107 () Bool)

(assert (=> b!311505 (=> (not res!168107) (not e!194313))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15908 (_ BitVec 32)) SeekEntryResult!2675)

(assert (=> b!311505 (= res!168107 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2675 i!1240)))))

(declare-fun b!311506 () Bool)

(declare-fun res!168109 () Bool)

(assert (=> b!311506 (=> (not res!168109) (not e!194313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311506 (= res!168109 (validKeyInArray!0 k0!2441))))

(declare-fun b!311507 () Bool)

(assert (=> b!311507 (= e!194311 e!194314)))

(declare-fun res!168106 () Bool)

(assert (=> b!311507 (=> (not res!168106) (not e!194314))))

(assert (=> b!311507 (= res!168106 (and (= lt!152263 lt!152267) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7536 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311507 (= lt!152263 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311509 () Bool)

(declare-fun res!168102 () Bool)

(assert (=> b!311509 (=> (not res!168102) (not e!194313))))

(assert (=> b!311509 (= res!168102 (and (= (size!7889 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7889 a!3293))))))

(declare-fun b!311510 () Bool)

(declare-fun res!168110 () Bool)

(assert (=> b!311510 (=> (not res!168110) (not e!194313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15908 (_ BitVec 32)) Bool)

(assert (=> b!311510 (= res!168110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311511 () Bool)

(declare-fun res!168104 () Bool)

(assert (=> b!311511 (=> (not res!168104) (not e!194311))))

(assert (=> b!311511 (= res!168104 (and (= (select (arr!7536 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7889 a!3293))))))

(declare-fun res!168111 () Bool)

(assert (=> start!31002 (=> (not res!168111) (not e!194313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31002 (= res!168111 (validMask!0 mask!3709))))

(assert (=> start!31002 e!194313))

(declare-fun array_inv!5508 (array!15908) Bool)

(assert (=> start!31002 (array_inv!5508 a!3293)))

(assert (=> start!31002 true))

(declare-fun b!311508 () Bool)

(assert (=> b!311508 (= e!194312 true)))

(assert (=> b!311508 (= lt!152265 lt!152269)))

(declare-datatypes ((Unit!9553 0))(
  ( (Unit!9554) )
))
(declare-fun lt!152268 () Unit!9553)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15908 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9553)

(assert (=> b!311508 (= lt!152268 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152266 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31002 res!168111) b!311509))

(assert (= (and b!311509 res!168102) b!311506))

(assert (= (and b!311506 res!168109) b!311502))

(assert (= (and b!311502 res!168103) b!311505))

(assert (= (and b!311505 res!168107) b!311510))

(assert (= (and b!311510 res!168110) b!311503))

(assert (= (and b!311503 res!168105) b!311511))

(assert (= (and b!311511 res!168104) b!311507))

(assert (= (and b!311507 res!168106) b!311504))

(assert (= (and b!311504 (not res!168108)) b!311508))

(declare-fun m!321043 () Bool)

(assert (=> b!311510 m!321043))

(declare-fun m!321045 () Bool)

(assert (=> b!311504 m!321045))

(declare-fun m!321047 () Bool)

(assert (=> b!311504 m!321047))

(declare-fun m!321049 () Bool)

(assert (=> b!311504 m!321049))

(declare-fun m!321051 () Bool)

(assert (=> b!311504 m!321051))

(declare-fun m!321053 () Bool)

(assert (=> b!311504 m!321053))

(declare-fun m!321055 () Bool)

(assert (=> b!311506 m!321055))

(declare-fun m!321057 () Bool)

(assert (=> b!311507 m!321057))

(declare-fun m!321059 () Bool)

(assert (=> b!311507 m!321059))

(declare-fun m!321061 () Bool)

(assert (=> b!311502 m!321061))

(declare-fun m!321063 () Bool)

(assert (=> b!311511 m!321063))

(declare-fun m!321065 () Bool)

(assert (=> b!311505 m!321065))

(declare-fun m!321067 () Bool)

(assert (=> b!311503 m!321067))

(assert (=> b!311503 m!321067))

(declare-fun m!321069 () Bool)

(assert (=> b!311503 m!321069))

(declare-fun m!321071 () Bool)

(assert (=> b!311508 m!321071))

(declare-fun m!321073 () Bool)

(assert (=> start!31002 m!321073))

(declare-fun m!321075 () Bool)

(assert (=> start!31002 m!321075))

(check-sat (not b!311508) (not b!311505) (not b!311510) (not b!311506) (not b!311503) (not b!311507) (not b!311504) (not start!31002) (not b!311502))
(check-sat)
