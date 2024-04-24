; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33062 () Bool)

(assert start!33062)

(declare-fun b!329146 () Bool)

(declare-fun e!202228 () Bool)

(declare-fun e!202230 () Bool)

(assert (=> b!329146 (= e!202228 e!202230)))

(declare-fun res!181386 () Bool)

(assert (=> b!329146 (=> (not res!181386) (not e!202230))))

(declare-datatypes ((array!16836 0))(
  ( (array!16837 (arr!7963 (Array (_ BitVec 32) (_ BitVec 64))) (size!8315 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16836)

(declare-datatypes ((SeekEntryResult!3059 0))(
  ( (MissingZero!3059 (index!14412 (_ BitVec 32))) (Found!3059 (index!14413 (_ BitVec 32))) (Intermediate!3059 (undefined!3871 Bool) (index!14414 (_ BitVec 32)) (x!32789 (_ BitVec 32))) (Undefined!3059) (MissingVacant!3059 (index!14415 (_ BitVec 32))) )
))
(declare-fun lt!158174 () SeekEntryResult!3059)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun lt!158175 () SeekEntryResult!3059)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329146 (= res!181386 (and (= lt!158174 lt!158175) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7963 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7963 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7963 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16836 (_ BitVec 32)) SeekEntryResult!3059)

(assert (=> b!329146 (= lt!158174 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!329147 () Bool)

(declare-fun res!181389 () Bool)

(declare-fun e!202227 () Bool)

(assert (=> b!329147 (=> (not res!181389) (not e!202227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16836 (_ BitVec 32)) Bool)

(assert (=> b!329147 (= res!181389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329148 () Bool)

(assert (=> b!329148 (= e!202227 e!202228)))

(declare-fun res!181381 () Bool)

(assert (=> b!329148 (=> (not res!181381) (not e!202228))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329148 (= res!181381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158175))))

(assert (=> b!329148 (= lt!158175 (Intermediate!3059 false resIndex!58 resX!58))))

(declare-fun b!329149 () Bool)

(declare-fun res!181385 () Bool)

(assert (=> b!329149 (=> (not res!181385) (not e!202228))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329149 (= res!181385 (and (= (select (arr!7963 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8315 a!3305))))))

(declare-fun b!329150 () Bool)

(declare-fun res!181382 () Bool)

(assert (=> b!329150 (=> (not res!181382) (not e!202227))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16836 (_ BitVec 32)) SeekEntryResult!3059)

(assert (=> b!329150 (= res!181382 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3059 i!1250)))))

(declare-fun b!329151 () Bool)

(declare-fun res!181384 () Bool)

(assert (=> b!329151 (=> (not res!181384) (not e!202227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329151 (= res!181384 (validKeyInArray!0 k0!2497))))

(declare-fun res!181387 () Bool)

(assert (=> start!33062 (=> (not res!181387) (not e!202227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33062 (= res!181387 (validMask!0 mask!3777))))

(assert (=> start!33062 e!202227))

(declare-fun array_inv!5913 (array!16836) Bool)

(assert (=> start!33062 (array_inv!5913 a!3305)))

(assert (=> start!33062 true))

(declare-fun b!329152 () Bool)

(assert (=> b!329152 (= e!202230 (not false))))

(assert (=> b!329152 (= lt!158174 (Intermediate!3059 false index!1840 resX!58))))

(declare-fun b!329153 () Bool)

(declare-fun res!181383 () Bool)

(assert (=> b!329153 (=> (not res!181383) (not e!202227))))

(assert (=> b!329153 (= res!181383 (and (= (size!8315 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8315 a!3305))))))

(declare-fun b!329154 () Bool)

(declare-fun res!181388 () Bool)

(assert (=> b!329154 (=> (not res!181388) (not e!202227))))

(declare-fun arrayContainsKey!0 (array!16836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329154 (= res!181388 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33062 res!181387) b!329153))

(assert (= (and b!329153 res!181383) b!329151))

(assert (= (and b!329151 res!181384) b!329154))

(assert (= (and b!329154 res!181388) b!329150))

(assert (= (and b!329150 res!181382) b!329147))

(assert (= (and b!329147 res!181389) b!329148))

(assert (= (and b!329148 res!181381) b!329149))

(assert (= (and b!329149 res!181385) b!329146))

(assert (= (and b!329146 res!181386) b!329152))

(declare-fun m!335125 () Bool)

(assert (=> b!329154 m!335125))

(declare-fun m!335127 () Bool)

(assert (=> b!329147 m!335127))

(declare-fun m!335129 () Bool)

(assert (=> b!329150 m!335129))

(declare-fun m!335131 () Bool)

(assert (=> b!329148 m!335131))

(assert (=> b!329148 m!335131))

(declare-fun m!335133 () Bool)

(assert (=> b!329148 m!335133))

(declare-fun m!335135 () Bool)

(assert (=> b!329146 m!335135))

(declare-fun m!335137 () Bool)

(assert (=> b!329146 m!335137))

(declare-fun m!335139 () Bool)

(assert (=> start!33062 m!335139))

(declare-fun m!335141 () Bool)

(assert (=> start!33062 m!335141))

(declare-fun m!335143 () Bool)

(assert (=> b!329149 m!335143))

(declare-fun m!335145 () Bool)

(assert (=> b!329151 m!335145))

(check-sat (not b!329150) (not b!329146) (not b!329148) (not b!329151) (not b!329154) (not start!33062) (not b!329147))
(check-sat)
