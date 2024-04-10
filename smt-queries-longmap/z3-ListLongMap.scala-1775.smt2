; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32352 () Bool)

(assert start!32352)

(declare-fun b!322130 () Bool)

(declare-fun res!176114 () Bool)

(declare-fun e!199452 () Bool)

(assert (=> b!322130 (=> (not res!176114) (not e!199452))))

(declare-datatypes ((array!16491 0))(
  ( (array!16492 (arr!7803 (Array (_ BitVec 32) (_ BitVec 64))) (size!8155 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16491)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322130 (= res!176114 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7803 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7803 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7803 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322131 () Bool)

(declare-fun res!176115 () Bool)

(declare-fun e!199451 () Bool)

(assert (=> b!322131 (=> (not res!176115) (not e!199451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322131 (= res!176115 (validKeyInArray!0 k0!2497))))

(declare-fun b!322132 () Bool)

(declare-fun res!176112 () Bool)

(assert (=> b!322132 (=> (not res!176112) (not e!199451))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322132 (= res!176112 (and (= (size!8155 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8155 a!3305))))))

(declare-fun lt!156389 () (_ BitVec 32))

(declare-fun b!322134 () Bool)

(assert (=> b!322134 (= e!199452 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge lt!156389 #b00000000000000000000000000000000) (bvslt lt!156389 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322134 (= lt!156389 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!322135 () Bool)

(declare-fun res!176109 () Bool)

(assert (=> b!322135 (=> (not res!176109) (not e!199451))))

(declare-fun arrayContainsKey!0 (array!16491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322135 (= res!176109 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322136 () Bool)

(assert (=> b!322136 (= e!199451 e!199452)))

(declare-fun res!176116 () Bool)

(assert (=> b!322136 (=> (not res!176116) (not e!199452))))

(declare-datatypes ((SeekEntryResult!2934 0))(
  ( (MissingZero!2934 (index!13912 (_ BitVec 32))) (Found!2934 (index!13913 (_ BitVec 32))) (Intermediate!2934 (undefined!3746 Bool) (index!13914 (_ BitVec 32)) (x!32178 (_ BitVec 32))) (Undefined!2934) (MissingVacant!2934 (index!13915 (_ BitVec 32))) )
))
(declare-fun lt!156390 () SeekEntryResult!2934)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16491 (_ BitVec 32)) SeekEntryResult!2934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322136 (= res!176116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156390))))

(assert (=> b!322136 (= lt!156390 (Intermediate!2934 false resIndex!58 resX!58))))

(declare-fun b!322137 () Bool)

(declare-fun res!176117 () Bool)

(assert (=> b!322137 (=> (not res!176117) (not e!199451))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16491 (_ BitVec 32)) SeekEntryResult!2934)

(assert (=> b!322137 (= res!176117 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2934 i!1250)))))

(declare-fun b!322133 () Bool)

(declare-fun res!176110 () Bool)

(assert (=> b!322133 (=> (not res!176110) (not e!199452))))

(assert (=> b!322133 (= res!176110 (and (= (select (arr!7803 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8155 a!3305))))))

(declare-fun res!176111 () Bool)

(assert (=> start!32352 (=> (not res!176111) (not e!199451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32352 (= res!176111 (validMask!0 mask!3777))))

(assert (=> start!32352 e!199451))

(declare-fun array_inv!5766 (array!16491) Bool)

(assert (=> start!32352 (array_inv!5766 a!3305)))

(assert (=> start!32352 true))

(declare-fun b!322138 () Bool)

(declare-fun res!176113 () Bool)

(assert (=> b!322138 (=> (not res!176113) (not e!199452))))

(assert (=> b!322138 (= res!176113 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156390))))

(declare-fun b!322139 () Bool)

(declare-fun res!176118 () Bool)

(assert (=> b!322139 (=> (not res!176118) (not e!199451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16491 (_ BitVec 32)) Bool)

(assert (=> b!322139 (= res!176118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32352 res!176111) b!322132))

(assert (= (and b!322132 res!176112) b!322131))

(assert (= (and b!322131 res!176115) b!322135))

(assert (= (and b!322135 res!176109) b!322137))

(assert (= (and b!322137 res!176117) b!322139))

(assert (= (and b!322139 res!176118) b!322136))

(assert (= (and b!322136 res!176116) b!322133))

(assert (= (and b!322133 res!176110) b!322138))

(assert (= (and b!322138 res!176113) b!322130))

(assert (= (and b!322130 res!176114) b!322134))

(declare-fun m!330077 () Bool)

(assert (=> b!322139 m!330077))

(declare-fun m!330079 () Bool)

(assert (=> b!322130 m!330079))

(declare-fun m!330081 () Bool)

(assert (=> b!322131 m!330081))

(declare-fun m!330083 () Bool)

(assert (=> b!322137 m!330083))

(declare-fun m!330085 () Bool)

(assert (=> b!322138 m!330085))

(declare-fun m!330087 () Bool)

(assert (=> b!322134 m!330087))

(declare-fun m!330089 () Bool)

(assert (=> start!32352 m!330089))

(declare-fun m!330091 () Bool)

(assert (=> start!32352 m!330091))

(declare-fun m!330093 () Bool)

(assert (=> b!322136 m!330093))

(assert (=> b!322136 m!330093))

(declare-fun m!330095 () Bool)

(assert (=> b!322136 m!330095))

(declare-fun m!330097 () Bool)

(assert (=> b!322135 m!330097))

(declare-fun m!330099 () Bool)

(assert (=> b!322133 m!330099))

(check-sat (not b!322137) (not b!322138) (not b!322135) (not b!322134) (not b!322131) (not b!322136) (not start!32352) (not b!322139))
(check-sat)
