; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32654 () Bool)

(assert start!32654)

(declare-fun b!326268 () Bool)

(declare-fun res!179354 () Bool)

(declare-fun e!200957 () Bool)

(assert (=> b!326268 (=> (not res!179354) (not e!200957))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326268 (= res!179354 (validKeyInArray!0 k0!2497))))

(declare-fun b!326269 () Bool)

(declare-fun e!200956 () Bool)

(assert (=> b!326269 (= e!200957 e!200956)))

(declare-fun res!179355 () Bool)

(assert (=> b!326269 (=> (not res!179355) (not e!200956))))

(declare-datatypes ((array!16704 0))(
  ( (array!16705 (arr!7906 (Array (_ BitVec 32) (_ BitVec 64))) (size!8258 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16704)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3002 0))(
  ( (MissingZero!3002 (index!14184 (_ BitVec 32))) (Found!3002 (index!14185 (_ BitVec 32))) (Intermediate!3002 (undefined!3814 Bool) (index!14186 (_ BitVec 32)) (x!32541 (_ BitVec 32))) (Undefined!3002) (MissingVacant!3002 (index!14187 (_ BitVec 32))) )
))
(declare-fun lt!157320 () SeekEntryResult!3002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16704 (_ BitVec 32)) SeekEntryResult!3002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326269 (= res!179355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157320))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326269 (= lt!157320 (Intermediate!3002 false resIndex!58 resX!58))))

(declare-fun b!326270 () Bool)

(declare-fun res!179350 () Bool)

(assert (=> b!326270 (=> (not res!179350) (not e!200957))))

(declare-fun arrayContainsKey!0 (array!16704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326270 (= res!179350 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326271 () Bool)

(declare-fun res!179353 () Bool)

(assert (=> b!326271 (=> (not res!179353) (not e!200956))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326271 (= res!179353 (and (= (select (arr!7906 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8258 a!3305))))))

(declare-fun res!179349 () Bool)

(assert (=> start!32654 (=> (not res!179349) (not e!200957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32654 (= res!179349 (validMask!0 mask!3777))))

(assert (=> start!32654 e!200957))

(declare-fun array_inv!5856 (array!16704) Bool)

(assert (=> start!32654 (array_inv!5856 a!3305)))

(assert (=> start!32654 true))

(declare-fun b!326272 () Bool)

(declare-fun res!179352 () Bool)

(assert (=> b!326272 (=> (not res!179352) (not e!200957))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16704 (_ BitVec 32)) SeekEntryResult!3002)

(assert (=> b!326272 (= res!179352 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3002 i!1250)))))

(declare-fun b!326273 () Bool)

(assert (=> b!326273 (= e!200956 false)))

(declare-datatypes ((Unit!10072 0))(
  ( (Unit!10073) )
))
(declare-fun lt!157319 () Unit!10072)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16704 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10072)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326273 (= lt!157319 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326274 () Bool)

(declare-fun res!179351 () Bool)

(assert (=> b!326274 (=> (not res!179351) (not e!200957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16704 (_ BitVec 32)) Bool)

(assert (=> b!326274 (= res!179351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326275 () Bool)

(declare-fun res!179356 () Bool)

(assert (=> b!326275 (=> (not res!179356) (not e!200956))))

(assert (=> b!326275 (= res!179356 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157320))))

(declare-fun b!326276 () Bool)

(declare-fun res!179358 () Bool)

(assert (=> b!326276 (=> (not res!179358) (not e!200956))))

(assert (=> b!326276 (= res!179358 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7906 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326277 () Bool)

(declare-fun res!179357 () Bool)

(assert (=> b!326277 (=> (not res!179357) (not e!200957))))

(assert (=> b!326277 (= res!179357 (and (= (size!8258 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8258 a!3305))))))

(assert (= (and start!32654 res!179349) b!326277))

(assert (= (and b!326277 res!179357) b!326268))

(assert (= (and b!326268 res!179354) b!326270))

(assert (= (and b!326270 res!179350) b!326272))

(assert (= (and b!326272 res!179352) b!326274))

(assert (= (and b!326274 res!179351) b!326269))

(assert (= (and b!326269 res!179355) b!326271))

(assert (= (and b!326271 res!179353) b!326275))

(assert (= (and b!326275 res!179356) b!326276))

(assert (= (and b!326276 res!179358) b!326273))

(declare-fun m!333079 () Bool)

(assert (=> b!326268 m!333079))

(declare-fun m!333081 () Bool)

(assert (=> b!326272 m!333081))

(declare-fun m!333083 () Bool)

(assert (=> b!326271 m!333083))

(declare-fun m!333085 () Bool)

(assert (=> b!326273 m!333085))

(assert (=> b!326273 m!333085))

(declare-fun m!333087 () Bool)

(assert (=> b!326273 m!333087))

(declare-fun m!333089 () Bool)

(assert (=> b!326276 m!333089))

(declare-fun m!333091 () Bool)

(assert (=> start!32654 m!333091))

(declare-fun m!333093 () Bool)

(assert (=> start!32654 m!333093))

(declare-fun m!333095 () Bool)

(assert (=> b!326269 m!333095))

(assert (=> b!326269 m!333095))

(declare-fun m!333097 () Bool)

(assert (=> b!326269 m!333097))

(declare-fun m!333099 () Bool)

(assert (=> b!326275 m!333099))

(declare-fun m!333101 () Bool)

(assert (=> b!326270 m!333101))

(declare-fun m!333103 () Bool)

(assert (=> b!326274 m!333103))

(check-sat (not b!326273) (not b!326274) (not b!326275) (not b!326272) (not b!326269) (not b!326270) (not b!326268) (not start!32654))
(check-sat)
