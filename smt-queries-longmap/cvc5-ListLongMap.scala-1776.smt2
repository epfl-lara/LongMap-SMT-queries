; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32356 () Bool)

(assert start!32356)

(declare-fun b!322190 () Bool)

(declare-fun res!176173 () Bool)

(declare-fun e!199470 () Bool)

(assert (=> b!322190 (=> (not res!176173) (not e!199470))))

(declare-datatypes ((array!16495 0))(
  ( (array!16496 (arr!7805 (Array (_ BitVec 32) (_ BitVec 64))) (size!8157 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16495)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16495 (_ BitVec 32)) Bool)

(assert (=> b!322190 (= res!176173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322191 () Bool)

(declare-fun res!176174 () Bool)

(assert (=> b!322191 (=> (not res!176174) (not e!199470))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322191 (= res!176174 (and (= (size!8157 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8157 a!3305))))))

(declare-fun b!322192 () Bool)

(declare-fun res!176177 () Bool)

(declare-fun e!199471 () Bool)

(assert (=> b!322192 (=> (not res!176177) (not e!199471))))

(declare-datatypes ((SeekEntryResult!2936 0))(
  ( (MissingZero!2936 (index!13920 (_ BitVec 32))) (Found!2936 (index!13921 (_ BitVec 32))) (Intermediate!2936 (undefined!3748 Bool) (index!13922 (_ BitVec 32)) (x!32188 (_ BitVec 32))) (Undefined!2936) (MissingVacant!2936 (index!13923 (_ BitVec 32))) )
))
(declare-fun lt!156402 () SeekEntryResult!2936)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16495 (_ BitVec 32)) SeekEntryResult!2936)

(assert (=> b!322192 (= res!176177 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156402))))

(declare-fun b!322193 () Bool)

(declare-fun res!176169 () Bool)

(assert (=> b!322193 (=> (not res!176169) (not e!199471))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322193 (= res!176169 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7805 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7805 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7805 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322194 () Bool)

(assert (=> b!322194 (= e!199471 false)))

(declare-fun lt!156401 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322194 (= lt!156401 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!322195 () Bool)

(declare-fun res!176176 () Bool)

(assert (=> b!322195 (=> (not res!176176) (not e!199470))))

(declare-fun arrayContainsKey!0 (array!16495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322195 (= res!176176 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322197 () Bool)

(declare-fun res!176172 () Bool)

(assert (=> b!322197 (=> (not res!176172) (not e!199470))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16495 (_ BitVec 32)) SeekEntryResult!2936)

(assert (=> b!322197 (= res!176172 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2936 i!1250)))))

(declare-fun b!322198 () Bool)

(declare-fun res!176178 () Bool)

(assert (=> b!322198 (=> (not res!176178) (not e!199470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322198 (= res!176178 (validKeyInArray!0 k!2497))))

(declare-fun b!322199 () Bool)

(assert (=> b!322199 (= e!199470 e!199471)))

(declare-fun res!176171 () Bool)

(assert (=> b!322199 (=> (not res!176171) (not e!199471))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322199 (= res!176171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156402))))

(assert (=> b!322199 (= lt!156402 (Intermediate!2936 false resIndex!58 resX!58))))

(declare-fun res!176175 () Bool)

(assert (=> start!32356 (=> (not res!176175) (not e!199470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32356 (= res!176175 (validMask!0 mask!3777))))

(assert (=> start!32356 e!199470))

(declare-fun array_inv!5768 (array!16495) Bool)

(assert (=> start!32356 (array_inv!5768 a!3305)))

(assert (=> start!32356 true))

(declare-fun b!322196 () Bool)

(declare-fun res!176170 () Bool)

(assert (=> b!322196 (=> (not res!176170) (not e!199471))))

(assert (=> b!322196 (= res!176170 (and (= (select (arr!7805 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8157 a!3305))))))

(assert (= (and start!32356 res!176175) b!322191))

(assert (= (and b!322191 res!176174) b!322198))

(assert (= (and b!322198 res!176178) b!322195))

(assert (= (and b!322195 res!176176) b!322197))

(assert (= (and b!322197 res!176172) b!322190))

(assert (= (and b!322190 res!176173) b!322199))

(assert (= (and b!322199 res!176171) b!322196))

(assert (= (and b!322196 res!176170) b!322192))

(assert (= (and b!322192 res!176177) b!322193))

(assert (= (and b!322193 res!176169) b!322194))

(declare-fun m!330125 () Bool)

(assert (=> b!322193 m!330125))

(declare-fun m!330127 () Bool)

(assert (=> b!322199 m!330127))

(assert (=> b!322199 m!330127))

(declare-fun m!330129 () Bool)

(assert (=> b!322199 m!330129))

(declare-fun m!330131 () Bool)

(assert (=> b!322190 m!330131))

(declare-fun m!330133 () Bool)

(assert (=> b!322194 m!330133))

(declare-fun m!330135 () Bool)

(assert (=> b!322196 m!330135))

(declare-fun m!330137 () Bool)

(assert (=> b!322197 m!330137))

(declare-fun m!330139 () Bool)

(assert (=> b!322192 m!330139))

(declare-fun m!330141 () Bool)

(assert (=> b!322195 m!330141))

(declare-fun m!330143 () Bool)

(assert (=> start!32356 m!330143))

(declare-fun m!330145 () Bool)

(assert (=> start!32356 m!330145))

(declare-fun m!330147 () Bool)

(assert (=> b!322198 m!330147))

(push 1)

