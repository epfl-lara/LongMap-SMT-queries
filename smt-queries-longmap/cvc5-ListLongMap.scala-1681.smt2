; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30974 () Bool)

(assert start!30974)

(declare-fun b!311147 () Bool)

(declare-fun e!194172 () Bool)

(assert (=> b!311147 (= e!194172 (not true))))

(declare-fun e!194176 () Bool)

(assert (=> b!311147 e!194176))

(declare-fun res!167610 () Bool)

(assert (=> b!311147 (=> (not res!167610) (not e!194176))))

(declare-datatypes ((SeekEntryResult!2660 0))(
  ( (MissingZero!2660 (index!12816 (_ BitVec 32))) (Found!2660 (index!12817 (_ BitVec 32))) (Intermediate!2660 (undefined!3472 Bool) (index!12818 (_ BitVec 32)) (x!31041 (_ BitVec 32))) (Undefined!2660) (MissingVacant!2660 (index!12819 (_ BitVec 32))) )
))
(declare-fun lt!152240 () SeekEntryResult!2660)

(declare-datatypes ((array!15876 0))(
  ( (array!15877 (arr!7520 (Array (_ BitVec 32) (_ BitVec 64))) (size!7872 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15876)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152239 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15876 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!311147 (= res!167610 (= lt!152240 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152239 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311147 (= lt!152239 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311148 () Bool)

(declare-fun res!167605 () Bool)

(declare-fun e!194175 () Bool)

(assert (=> b!311148 (=> (not res!167605) (not e!194175))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311148 (= res!167605 (and (= (select (arr!7520 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7872 a!3293))))))

(declare-fun res!167609 () Bool)

(declare-fun e!194174 () Bool)

(assert (=> start!30974 (=> (not res!167609) (not e!194174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30974 (= res!167609 (validMask!0 mask!3709))))

(assert (=> start!30974 e!194174))

(declare-fun array_inv!5483 (array!15876) Bool)

(assert (=> start!30974 (array_inv!5483 a!3293)))

(assert (=> start!30974 true))

(declare-fun b!311149 () Bool)

(assert (=> b!311149 (= e!194174 e!194175)))

(declare-fun res!167604 () Bool)

(assert (=> b!311149 (=> (not res!167604) (not e!194175))))

(declare-fun lt!152241 () SeekEntryResult!2660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311149 (= res!167604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152241))))

(assert (=> b!311149 (= lt!152241 (Intermediate!2660 false resIndex!52 resX!52))))

(declare-fun b!311150 () Bool)

(declare-fun res!167603 () Bool)

(assert (=> b!311150 (=> (not res!167603) (not e!194174))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15876 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!311150 (= res!167603 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2660 i!1240)))))

(declare-fun b!311151 () Bool)

(declare-fun res!167608 () Bool)

(assert (=> b!311151 (=> (not res!167608) (not e!194174))))

(declare-fun arrayContainsKey!0 (array!15876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311151 (= res!167608 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311152 () Bool)

(declare-fun res!167606 () Bool)

(assert (=> b!311152 (=> (not res!167606) (not e!194174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15876 (_ BitVec 32)) Bool)

(assert (=> b!311152 (= res!167606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311153 () Bool)

(declare-fun lt!152238 () array!15876)

(assert (=> b!311153 (= e!194176 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152238 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152239 k!2441 lt!152238 mask!3709)))))

(assert (=> b!311153 (= lt!152238 (array!15877 (store (arr!7520 a!3293) i!1240 k!2441) (size!7872 a!3293)))))

(declare-fun b!311154 () Bool)

(declare-fun res!167601 () Bool)

(assert (=> b!311154 (=> (not res!167601) (not e!194174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311154 (= res!167601 (validKeyInArray!0 k!2441))))

(declare-fun b!311155 () Bool)

(assert (=> b!311155 (= e!194175 e!194172)))

(declare-fun res!167607 () Bool)

(assert (=> b!311155 (=> (not res!167607) (not e!194172))))

(assert (=> b!311155 (= res!167607 (and (= lt!152240 lt!152241) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7520 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311155 (= lt!152240 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311156 () Bool)

(declare-fun res!167602 () Bool)

(assert (=> b!311156 (=> (not res!167602) (not e!194174))))

(assert (=> b!311156 (= res!167602 (and (= (size!7872 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7872 a!3293))))))

(assert (= (and start!30974 res!167609) b!311156))

(assert (= (and b!311156 res!167602) b!311154))

(assert (= (and b!311154 res!167601) b!311151))

(assert (= (and b!311151 res!167608) b!311150))

(assert (= (and b!311150 res!167603) b!311152))

(assert (= (and b!311152 res!167606) b!311149))

(assert (= (and b!311149 res!167604) b!311148))

(assert (= (and b!311148 res!167605) b!311155))

(assert (= (and b!311155 res!167607) b!311147))

(assert (= (and b!311147 res!167610) b!311153))

(declare-fun m!321101 () Bool)

(assert (=> b!311148 m!321101))

(declare-fun m!321103 () Bool)

(assert (=> b!311147 m!321103))

(declare-fun m!321105 () Bool)

(assert (=> b!311147 m!321105))

(declare-fun m!321107 () Bool)

(assert (=> b!311155 m!321107))

(declare-fun m!321109 () Bool)

(assert (=> b!311155 m!321109))

(declare-fun m!321111 () Bool)

(assert (=> b!311152 m!321111))

(declare-fun m!321113 () Bool)

(assert (=> start!30974 m!321113))

(declare-fun m!321115 () Bool)

(assert (=> start!30974 m!321115))

(declare-fun m!321117 () Bool)

(assert (=> b!311154 m!321117))

(declare-fun m!321119 () Bool)

(assert (=> b!311151 m!321119))

(declare-fun m!321121 () Bool)

(assert (=> b!311150 m!321121))

(declare-fun m!321123 () Bool)

(assert (=> b!311153 m!321123))

(declare-fun m!321125 () Bool)

(assert (=> b!311153 m!321125))

(declare-fun m!321127 () Bool)

(assert (=> b!311153 m!321127))

(declare-fun m!321129 () Bool)

(assert (=> b!311149 m!321129))

(assert (=> b!311149 m!321129))

(declare-fun m!321131 () Bool)

(assert (=> b!311149 m!321131))

(push 1)

