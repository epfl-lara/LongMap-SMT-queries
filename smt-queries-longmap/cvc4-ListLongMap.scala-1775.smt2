; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32354 () Bool)

(assert start!32354)

(declare-fun b!322160 () Bool)

(declare-fun e!199460 () Bool)

(declare-fun e!199461 () Bool)

(assert (=> b!322160 (= e!199460 e!199461)))

(declare-fun res!176142 () Bool)

(assert (=> b!322160 (=> (not res!176142) (not e!199461))))

(declare-datatypes ((array!16493 0))(
  ( (array!16494 (arr!7804 (Array (_ BitVec 32) (_ BitVec 64))) (size!8156 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16493)

(declare-datatypes ((SeekEntryResult!2935 0))(
  ( (MissingZero!2935 (index!13916 (_ BitVec 32))) (Found!2935 (index!13917 (_ BitVec 32))) (Intermediate!2935 (undefined!3747 Bool) (index!13918 (_ BitVec 32)) (x!32179 (_ BitVec 32))) (Undefined!2935) (MissingVacant!2935 (index!13919 (_ BitVec 32))) )
))
(declare-fun lt!156396 () SeekEntryResult!2935)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16493 (_ BitVec 32)) SeekEntryResult!2935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322160 (= res!176142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156396))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322160 (= lt!156396 (Intermediate!2935 false resIndex!58 resX!58))))

(declare-fun b!322161 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!156395 () (_ BitVec 32))

(assert (=> b!322161 (= e!199461 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge lt!156395 #b00000000000000000000000000000000) (bvslt lt!156395 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322161 (= lt!156395 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!176139 () Bool)

(assert (=> start!32354 (=> (not res!176139) (not e!199460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32354 (= res!176139 (validMask!0 mask!3777))))

(assert (=> start!32354 e!199460))

(declare-fun array_inv!5767 (array!16493) Bool)

(assert (=> start!32354 (array_inv!5767 a!3305)))

(assert (=> start!32354 true))

(declare-fun b!322162 () Bool)

(declare-fun res!176148 () Bool)

(assert (=> b!322162 (=> (not res!176148) (not e!199460))))

(declare-fun arrayContainsKey!0 (array!16493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322162 (= res!176148 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322163 () Bool)

(declare-fun res!176143 () Bool)

(assert (=> b!322163 (=> (not res!176143) (not e!199460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16493 (_ BitVec 32)) Bool)

(assert (=> b!322163 (= res!176143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322164 () Bool)

(declare-fun res!176141 () Bool)

(assert (=> b!322164 (=> (not res!176141) (not e!199461))))

(assert (=> b!322164 (= res!176141 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156396))))

(declare-fun b!322165 () Bool)

(declare-fun res!176140 () Bool)

(assert (=> b!322165 (=> (not res!176140) (not e!199460))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16493 (_ BitVec 32)) SeekEntryResult!2935)

(assert (=> b!322165 (= res!176140 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2935 i!1250)))))

(declare-fun b!322166 () Bool)

(declare-fun res!176144 () Bool)

(assert (=> b!322166 (=> (not res!176144) (not e!199461))))

(assert (=> b!322166 (= res!176144 (and (= (select (arr!7804 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8156 a!3305))))))

(declare-fun b!322167 () Bool)

(declare-fun res!176145 () Bool)

(assert (=> b!322167 (=> (not res!176145) (not e!199460))))

(assert (=> b!322167 (= res!176145 (and (= (size!8156 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8156 a!3305))))))

(declare-fun b!322168 () Bool)

(declare-fun res!176146 () Bool)

(assert (=> b!322168 (=> (not res!176146) (not e!199460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322168 (= res!176146 (validKeyInArray!0 k!2497))))

(declare-fun b!322169 () Bool)

(declare-fun res!176147 () Bool)

(assert (=> b!322169 (=> (not res!176147) (not e!199461))))

(assert (=> b!322169 (= res!176147 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7804 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7804 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7804 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!32354 res!176139) b!322167))

(assert (= (and b!322167 res!176145) b!322168))

(assert (= (and b!322168 res!176146) b!322162))

(assert (= (and b!322162 res!176148) b!322165))

(assert (= (and b!322165 res!176140) b!322163))

(assert (= (and b!322163 res!176143) b!322160))

(assert (= (and b!322160 res!176142) b!322166))

(assert (= (and b!322166 res!176144) b!322164))

(assert (= (and b!322164 res!176141) b!322169))

(assert (= (and b!322169 res!176147) b!322161))

(declare-fun m!330101 () Bool)

(assert (=> b!322161 m!330101))

(declare-fun m!330103 () Bool)

(assert (=> b!322164 m!330103))

(declare-fun m!330105 () Bool)

(assert (=> b!322163 m!330105))

(declare-fun m!330107 () Bool)

(assert (=> b!322162 m!330107))

(declare-fun m!330109 () Bool)

(assert (=> b!322160 m!330109))

(assert (=> b!322160 m!330109))

(declare-fun m!330111 () Bool)

(assert (=> b!322160 m!330111))

(declare-fun m!330113 () Bool)

(assert (=> start!32354 m!330113))

(declare-fun m!330115 () Bool)

(assert (=> start!32354 m!330115))

(declare-fun m!330117 () Bool)

(assert (=> b!322166 m!330117))

(declare-fun m!330119 () Bool)

(assert (=> b!322169 m!330119))

(declare-fun m!330121 () Bool)

(assert (=> b!322165 m!330121))

(declare-fun m!330123 () Bool)

(assert (=> b!322168 m!330123))

(push 1)

(assert (not b!322160))

(assert (not b!322164))

(assert (not b!322161))

(assert (not start!32354))

(assert (not b!322162))

(assert (not b!322168))

(assert (not b!322165))

(assert (not b!322163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

