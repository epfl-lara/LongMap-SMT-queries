; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30972 () Bool)

(assert start!30972)

(declare-fun b!311117 () Bool)

(declare-fun res!167571 () Bool)

(declare-fun e!194161 () Bool)

(assert (=> b!311117 (=> (not res!167571) (not e!194161))))

(declare-datatypes ((array!15874 0))(
  ( (array!15875 (arr!7519 (Array (_ BitVec 32) (_ BitVec 64))) (size!7871 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15874)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15874 (_ BitVec 32)) Bool)

(assert (=> b!311117 (= res!167571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311118 () Bool)

(declare-fun res!167579 () Bool)

(assert (=> b!311118 (=> (not res!167579) (not e!194161))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311118 (= res!167579 (validKeyInArray!0 k!2441))))

(declare-fun b!311119 () Bool)

(declare-fun res!167574 () Bool)

(assert (=> b!311119 (=> (not res!167574) (not e!194161))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311119 (= res!167574 (and (= (size!7871 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7871 a!3293))))))

(declare-fun b!311120 () Bool)

(declare-fun e!194158 () Bool)

(declare-fun e!194159 () Bool)

(assert (=> b!311120 (= e!194158 e!194159)))

(declare-fun res!167578 () Bool)

(assert (=> b!311120 (=> (not res!167578) (not e!194159))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2659 0))(
  ( (MissingZero!2659 (index!12812 (_ BitVec 32))) (Found!2659 (index!12813 (_ BitVec 32))) (Intermediate!2659 (undefined!3471 Bool) (index!12814 (_ BitVec 32)) (x!31032 (_ BitVec 32))) (Undefined!2659) (MissingVacant!2659 (index!12815 (_ BitVec 32))) )
))
(declare-fun lt!152226 () SeekEntryResult!2659)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152229 () SeekEntryResult!2659)

(assert (=> b!311120 (= res!167578 (and (= lt!152229 lt!152226) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7519 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15874 (_ BitVec 32)) SeekEntryResult!2659)

(assert (=> b!311120 (= lt!152229 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311121 () Bool)

(declare-fun res!167573 () Bool)

(assert (=> b!311121 (=> (not res!167573) (not e!194161))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15874 (_ BitVec 32)) SeekEntryResult!2659)

(assert (=> b!311121 (= res!167573 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2659 i!1240)))))

(declare-fun b!311122 () Bool)

(declare-fun res!167575 () Bool)

(assert (=> b!311122 (=> (not res!167575) (not e!194158))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311122 (= res!167575 (and (= (select (arr!7519 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7871 a!3293))))))

(declare-fun res!167577 () Bool)

(assert (=> start!30972 (=> (not res!167577) (not e!194161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30972 (= res!167577 (validMask!0 mask!3709))))

(assert (=> start!30972 e!194161))

(declare-fun array_inv!5482 (array!15874) Bool)

(assert (=> start!30972 (array_inv!5482 a!3293)))

(assert (=> start!30972 true))

(declare-fun b!311123 () Bool)

(declare-fun lt!152228 () array!15874)

(declare-fun lt!152227 () (_ BitVec 32))

(declare-fun e!194160 () Bool)

(assert (=> b!311123 (= e!194160 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152228 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152227 k!2441 lt!152228 mask!3709)))))

(assert (=> b!311123 (= lt!152228 (array!15875 (store (arr!7519 a!3293) i!1240 k!2441) (size!7871 a!3293)))))

(declare-fun b!311124 () Bool)

(assert (=> b!311124 (= e!194161 e!194158)))

(declare-fun res!167580 () Bool)

(assert (=> b!311124 (=> (not res!167580) (not e!194158))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311124 (= res!167580 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152226))))

(assert (=> b!311124 (= lt!152226 (Intermediate!2659 false resIndex!52 resX!52))))

(declare-fun b!311125 () Bool)

(declare-fun res!167572 () Bool)

(assert (=> b!311125 (=> (not res!167572) (not e!194161))))

(declare-fun arrayContainsKey!0 (array!15874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311125 (= res!167572 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311126 () Bool)

(assert (=> b!311126 (= e!194159 (not true))))

(assert (=> b!311126 e!194160))

(declare-fun res!167576 () Bool)

(assert (=> b!311126 (=> (not res!167576) (not e!194160))))

(assert (=> b!311126 (= res!167576 (= lt!152229 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152227 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311126 (= lt!152227 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30972 res!167577) b!311119))

(assert (= (and b!311119 res!167574) b!311118))

(assert (= (and b!311118 res!167579) b!311125))

(assert (= (and b!311125 res!167572) b!311121))

(assert (= (and b!311121 res!167573) b!311117))

(assert (= (and b!311117 res!167571) b!311124))

(assert (= (and b!311124 res!167580) b!311122))

(assert (= (and b!311122 res!167575) b!311120))

(assert (= (and b!311120 res!167578) b!311126))

(assert (= (and b!311126 res!167576) b!311123))

(declare-fun m!321069 () Bool)

(assert (=> b!311120 m!321069))

(declare-fun m!321071 () Bool)

(assert (=> b!311120 m!321071))

(declare-fun m!321073 () Bool)

(assert (=> b!311125 m!321073))

(declare-fun m!321075 () Bool)

(assert (=> b!311124 m!321075))

(assert (=> b!311124 m!321075))

(declare-fun m!321077 () Bool)

(assert (=> b!311124 m!321077))

(declare-fun m!321079 () Bool)

(assert (=> b!311123 m!321079))

(declare-fun m!321081 () Bool)

(assert (=> b!311123 m!321081))

(declare-fun m!321083 () Bool)

(assert (=> b!311123 m!321083))

(declare-fun m!321085 () Bool)

(assert (=> b!311122 m!321085))

(declare-fun m!321087 () Bool)

(assert (=> b!311117 m!321087))

(declare-fun m!321089 () Bool)

(assert (=> b!311121 m!321089))

(declare-fun m!321091 () Bool)

(assert (=> b!311126 m!321091))

(declare-fun m!321093 () Bool)

(assert (=> b!311126 m!321093))

(declare-fun m!321095 () Bool)

(assert (=> b!311118 m!321095))

(declare-fun m!321097 () Bool)

(assert (=> start!30972 m!321097))

(declare-fun m!321099 () Bool)

(assert (=> start!30972 m!321099))

(push 1)

(assert (not b!311124))

(assert (not b!311120))

