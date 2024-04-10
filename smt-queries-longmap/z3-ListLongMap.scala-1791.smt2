; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32448 () Bool)

(assert start!32448)

(declare-fun b!324186 () Bool)

(declare-fun e!200198 () Bool)

(declare-fun e!200199 () Bool)

(assert (=> b!324186 (= e!200198 e!200199)))

(declare-fun res!177520 () Bool)

(assert (=> b!324186 (=> (not res!177520) (not e!200199))))

(declare-datatypes ((array!16587 0))(
  ( (array!16588 (arr!7851 (Array (_ BitVec 32) (_ BitVec 64))) (size!8203 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16587)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2982 0))(
  ( (MissingZero!2982 (index!14104 (_ BitVec 32))) (Found!2982 (index!14105 (_ BitVec 32))) (Intermediate!2982 (undefined!3794 Bool) (index!14106 (_ BitVec 32)) (x!32354 (_ BitVec 32))) (Undefined!2982) (MissingVacant!2982 (index!14107 (_ BitVec 32))) )
))
(declare-fun lt!156762 () SeekEntryResult!2982)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16587 (_ BitVec 32)) SeekEntryResult!2982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324186 (= res!177520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156762))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324186 (= lt!156762 (Intermediate!2982 false resIndex!58 resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!324187 () Bool)

(assert (=> b!324187 (= e!200199 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7851 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!324188 () Bool)

(declare-fun res!177524 () Bool)

(assert (=> b!324188 (=> (not res!177524) (not e!200198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324188 (= res!177524 (validKeyInArray!0 k0!2497))))

(declare-fun res!177517 () Bool)

(assert (=> start!32448 (=> (not res!177517) (not e!200198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32448 (= res!177517 (validMask!0 mask!3777))))

(assert (=> start!32448 e!200198))

(declare-fun array_inv!5814 (array!16587) Bool)

(assert (=> start!32448 (array_inv!5814 a!3305)))

(assert (=> start!32448 true))

(declare-fun b!324189 () Bool)

(declare-fun res!177523 () Bool)

(assert (=> b!324189 (=> (not res!177523) (not e!200198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16587 (_ BitVec 32)) Bool)

(assert (=> b!324189 (= res!177523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324190 () Bool)

(declare-fun res!177518 () Bool)

(assert (=> b!324190 (=> (not res!177518) (not e!200198))))

(declare-fun arrayContainsKey!0 (array!16587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324190 (= res!177518 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324191 () Bool)

(declare-fun res!177521 () Bool)

(assert (=> b!324191 (=> (not res!177521) (not e!200199))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324191 (= res!177521 (and (= (select (arr!7851 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8203 a!3305))))))

(declare-fun b!324192 () Bool)

(declare-fun res!177525 () Bool)

(assert (=> b!324192 (=> (not res!177525) (not e!200198))))

(assert (=> b!324192 (= res!177525 (and (= (size!8203 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8203 a!3305))))))

(declare-fun b!324193 () Bool)

(declare-fun res!177522 () Bool)

(assert (=> b!324193 (=> (not res!177522) (not e!200198))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16587 (_ BitVec 32)) SeekEntryResult!2982)

(assert (=> b!324193 (= res!177522 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2982 i!1250)))))

(declare-fun b!324194 () Bool)

(declare-fun res!177519 () Bool)

(assert (=> b!324194 (=> (not res!177519) (not e!200199))))

(assert (=> b!324194 (= res!177519 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156762))))

(assert (= (and start!32448 res!177517) b!324192))

(assert (= (and b!324192 res!177525) b!324188))

(assert (= (and b!324188 res!177524) b!324190))

(assert (= (and b!324190 res!177518) b!324193))

(assert (= (and b!324193 res!177522) b!324189))

(assert (= (and b!324189 res!177523) b!324186))

(assert (= (and b!324186 res!177520) b!324191))

(assert (= (and b!324191 res!177521) b!324194))

(assert (= (and b!324194 res!177519) b!324187))

(declare-fun m!331281 () Bool)

(assert (=> b!324186 m!331281))

(assert (=> b!324186 m!331281))

(declare-fun m!331283 () Bool)

(assert (=> b!324186 m!331283))

(declare-fun m!331285 () Bool)

(assert (=> start!32448 m!331285))

(declare-fun m!331287 () Bool)

(assert (=> start!32448 m!331287))

(declare-fun m!331289 () Bool)

(assert (=> b!324190 m!331289))

(declare-fun m!331291 () Bool)

(assert (=> b!324193 m!331291))

(declare-fun m!331293 () Bool)

(assert (=> b!324189 m!331293))

(declare-fun m!331295 () Bool)

(assert (=> b!324194 m!331295))

(declare-fun m!331297 () Bool)

(assert (=> b!324187 m!331297))

(declare-fun m!331299 () Bool)

(assert (=> b!324188 m!331299))

(declare-fun m!331301 () Bool)

(assert (=> b!324191 m!331301))

(check-sat (not b!324186) (not start!32448) (not b!324193) (not b!324190) (not b!324188) (not b!324189) (not b!324194))
(check-sat)
