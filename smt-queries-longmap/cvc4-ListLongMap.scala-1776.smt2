; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32360 () Bool)

(assert start!32360)

(declare-fun b!322250 () Bool)

(declare-fun res!176237 () Bool)

(declare-fun e!199489 () Bool)

(assert (=> b!322250 (=> (not res!176237) (not e!199489))))

(declare-datatypes ((array!16499 0))(
  ( (array!16500 (arr!7807 (Array (_ BitVec 32) (_ BitVec 64))) (size!8159 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16499)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322250 (= res!176237 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322251 () Bool)

(declare-fun e!199487 () Bool)

(assert (=> b!322251 (= e!199489 e!199487)))

(declare-fun res!176234 () Bool)

(assert (=> b!322251 (=> (not res!176234) (not e!199487))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2938 0))(
  ( (MissingZero!2938 (index!13928 (_ BitVec 32))) (Found!2938 (index!13929 (_ BitVec 32))) (Intermediate!2938 (undefined!3750 Bool) (index!13930 (_ BitVec 32)) (x!32190 (_ BitVec 32))) (Undefined!2938) (MissingVacant!2938 (index!13931 (_ BitVec 32))) )
))
(declare-fun lt!156413 () SeekEntryResult!2938)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16499 (_ BitVec 32)) SeekEntryResult!2938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322251 (= res!176234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156413))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322251 (= lt!156413 (Intermediate!2938 false resIndex!58 resX!58))))

(declare-fun res!176232 () Bool)

(assert (=> start!32360 (=> (not res!176232) (not e!199489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32360 (= res!176232 (validMask!0 mask!3777))))

(assert (=> start!32360 e!199489))

(declare-fun array_inv!5770 (array!16499) Bool)

(assert (=> start!32360 (array_inv!5770 a!3305)))

(assert (=> start!32360 true))

(declare-fun b!322252 () Bool)

(declare-fun res!176231 () Bool)

(assert (=> b!322252 (=> (not res!176231) (not e!199489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322252 (= res!176231 (validKeyInArray!0 k!2497))))

(declare-fun b!322253 () Bool)

(declare-fun res!176233 () Bool)

(assert (=> b!322253 (=> (not res!176233) (not e!199489))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322253 (= res!176233 (and (= (size!8159 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8159 a!3305))))))

(declare-fun b!322254 () Bool)

(declare-fun res!176235 () Bool)

(assert (=> b!322254 (=> (not res!176235) (not e!199487))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322254 (= res!176235 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7807 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7807 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7807 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322255 () Bool)

(declare-fun res!176230 () Bool)

(assert (=> b!322255 (=> (not res!176230) (not e!199487))))

(assert (=> b!322255 (= res!176230 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156413))))

(declare-fun b!322256 () Bool)

(assert (=> b!322256 (= e!199487 false)))

(declare-fun lt!156414 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322256 (= lt!156414 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!322257 () Bool)

(declare-fun res!176229 () Bool)

(assert (=> b!322257 (=> (not res!176229) (not e!199489))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16499 (_ BitVec 32)) SeekEntryResult!2938)

(assert (=> b!322257 (= res!176229 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2938 i!1250)))))

(declare-fun b!322258 () Bool)

(declare-fun res!176238 () Bool)

(assert (=> b!322258 (=> (not res!176238) (not e!199489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16499 (_ BitVec 32)) Bool)

(assert (=> b!322258 (= res!176238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322259 () Bool)

(declare-fun res!176236 () Bool)

(assert (=> b!322259 (=> (not res!176236) (not e!199487))))

(assert (=> b!322259 (= res!176236 (and (= (select (arr!7807 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8159 a!3305))))))

(assert (= (and start!32360 res!176232) b!322253))

(assert (= (and b!322253 res!176233) b!322252))

(assert (= (and b!322252 res!176231) b!322250))

(assert (= (and b!322250 res!176237) b!322257))

(assert (= (and b!322257 res!176229) b!322258))

(assert (= (and b!322258 res!176238) b!322251))

(assert (= (and b!322251 res!176234) b!322259))

(assert (= (and b!322259 res!176236) b!322255))

(assert (= (and b!322255 res!176230) b!322254))

(assert (= (and b!322254 res!176235) b!322256))

(declare-fun m!330173 () Bool)

(assert (=> b!322251 m!330173))

(assert (=> b!322251 m!330173))

(declare-fun m!330175 () Bool)

(assert (=> b!322251 m!330175))

(declare-fun m!330177 () Bool)

(assert (=> start!32360 m!330177))

(declare-fun m!330179 () Bool)

(assert (=> start!32360 m!330179))

(declare-fun m!330181 () Bool)

(assert (=> b!322255 m!330181))

(declare-fun m!330183 () Bool)

(assert (=> b!322252 m!330183))

(declare-fun m!330185 () Bool)

(assert (=> b!322258 m!330185))

(declare-fun m!330187 () Bool)

(assert (=> b!322254 m!330187))

(declare-fun m!330189 () Bool)

(assert (=> b!322256 m!330189))

(declare-fun m!330191 () Bool)

(assert (=> b!322257 m!330191))

(declare-fun m!330193 () Bool)

(assert (=> b!322250 m!330193))

(declare-fun m!330195 () Bool)

(assert (=> b!322259 m!330195))

(push 1)

(assert (not b!322255))

(assert (not b!322252))

(assert (not b!322257))

