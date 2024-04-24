; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31770 () Bool)

(assert start!31770)

(declare-fun b!317349 () Bool)

(declare-fun res!171981 () Bool)

(declare-fun e!197313 () Bool)

(assert (=> b!317349 (=> (not res!171981) (not e!197313))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317349 (= res!171981 (validKeyInArray!0 k0!2441))))

(declare-fun b!317350 () Bool)

(declare-fun e!197316 () Bool)

(declare-fun e!197312 () Bool)

(assert (=> b!317350 (= e!197316 e!197312)))

(declare-fun res!171982 () Bool)

(assert (=> b!317350 (=> (not res!171982) (not e!197312))))

(declare-datatypes ((SeekEntryResult!2747 0))(
  ( (MissingZero!2747 (index!13164 (_ BitVec 32))) (Found!2747 (index!13165 (_ BitVec 32))) (Intermediate!2747 (undefined!3559 Bool) (index!13166 (_ BitVec 32)) (x!31537 (_ BitVec 32))) (Undefined!2747) (MissingVacant!2747 (index!13167 (_ BitVec 32))) )
))
(declare-fun lt!154956 () SeekEntryResult!2747)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((array!16154 0))(
  ( (array!16155 (arr!7642 (Array (_ BitVec 32) (_ BitVec 64))) (size!7994 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16154)

(declare-fun lt!154955 () SeekEntryResult!2747)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317350 (= res!171982 (and (= lt!154956 lt!154955) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7642 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16154 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!317350 (= lt!154956 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317351 () Bool)

(declare-fun res!171986 () Bool)

(assert (=> b!317351 (=> (not res!171986) (not e!197313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16154 (_ BitVec 32)) Bool)

(assert (=> b!317351 (= res!171986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!154954 () array!16154)

(declare-fun lt!154953 () (_ BitVec 32))

(declare-fun b!317352 () Bool)

(declare-fun e!197314 () Bool)

(assert (=> b!317352 (= e!197314 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154954 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154953 k0!2441 lt!154954 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317352 (= lt!154954 (array!16155 (store (arr!7642 a!3293) i!1240 k0!2441) (size!7994 a!3293)))))

(declare-fun b!317353 () Bool)

(declare-fun res!171985 () Bool)

(assert (=> b!317353 (=> (not res!171985) (not e!197313))))

(assert (=> b!317353 (= res!171985 (and (= (size!7994 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7994 a!3293))))))

(declare-fun b!317354 () Bool)

(declare-fun res!171983 () Bool)

(assert (=> b!317354 (=> (not res!171983) (not e!197313))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16154 (_ BitVec 32)) SeekEntryResult!2747)

(assert (=> b!317354 (= res!171983 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2747 i!1240)))))

(declare-fun b!317355 () Bool)

(assert (=> b!317355 (= e!197313 e!197316)))

(declare-fun res!171979 () Bool)

(assert (=> b!317355 (=> (not res!171979) (not e!197316))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317355 (= res!171979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154955))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317355 (= lt!154955 (Intermediate!2747 false resIndex!52 resX!52))))

(declare-fun b!317356 () Bool)

(declare-fun res!171980 () Bool)

(assert (=> b!317356 (=> (not res!171980) (not e!197313))))

(declare-fun arrayContainsKey!0 (array!16154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317356 (= res!171980 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!171984 () Bool)

(assert (=> start!31770 (=> (not res!171984) (not e!197313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31770 (= res!171984 (validMask!0 mask!3709))))

(assert (=> start!31770 e!197313))

(declare-fun array_inv!5592 (array!16154) Bool)

(assert (=> start!31770 (array_inv!5592 a!3293)))

(assert (=> start!31770 true))

(declare-fun b!317357 () Bool)

(assert (=> b!317357 (= e!197312 (not true))))

(assert (=> b!317357 e!197314))

(declare-fun res!171978 () Bool)

(assert (=> b!317357 (=> (not res!171978) (not e!197314))))

(assert (=> b!317357 (= res!171978 (= lt!154956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154953 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317357 (= lt!154953 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!317358 () Bool)

(declare-fun res!171987 () Bool)

(assert (=> b!317358 (=> (not res!171987) (not e!197316))))

(assert (=> b!317358 (= res!171987 (and (= (select (arr!7642 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7994 a!3293))))))

(assert (= (and start!31770 res!171984) b!317353))

(assert (= (and b!317353 res!171985) b!317349))

(assert (= (and b!317349 res!171981) b!317356))

(assert (= (and b!317356 res!171980) b!317354))

(assert (= (and b!317354 res!171983) b!317351))

(assert (= (and b!317351 res!171986) b!317355))

(assert (= (and b!317355 res!171979) b!317358))

(assert (= (and b!317358 res!171987) b!317350))

(assert (= (and b!317350 res!171982) b!317357))

(assert (= (and b!317357 res!171978) b!317352))

(declare-fun m!326203 () Bool)

(assert (=> b!317357 m!326203))

(declare-fun m!326205 () Bool)

(assert (=> b!317357 m!326205))

(declare-fun m!326207 () Bool)

(assert (=> b!317358 m!326207))

(declare-fun m!326209 () Bool)

(assert (=> b!317352 m!326209))

(declare-fun m!326211 () Bool)

(assert (=> b!317352 m!326211))

(declare-fun m!326213 () Bool)

(assert (=> b!317352 m!326213))

(declare-fun m!326215 () Bool)

(assert (=> start!31770 m!326215))

(declare-fun m!326217 () Bool)

(assert (=> start!31770 m!326217))

(declare-fun m!326219 () Bool)

(assert (=> b!317356 m!326219))

(declare-fun m!326221 () Bool)

(assert (=> b!317349 m!326221))

(declare-fun m!326223 () Bool)

(assert (=> b!317350 m!326223))

(declare-fun m!326225 () Bool)

(assert (=> b!317350 m!326225))

(declare-fun m!326227 () Bool)

(assert (=> b!317354 m!326227))

(declare-fun m!326229 () Bool)

(assert (=> b!317355 m!326229))

(assert (=> b!317355 m!326229))

(declare-fun m!326231 () Bool)

(assert (=> b!317355 m!326231))

(declare-fun m!326233 () Bool)

(assert (=> b!317351 m!326233))

(check-sat (not b!317357) (not start!31770) (not b!317356) (not b!317354) (not b!317351) (not b!317349) (not b!317355) (not b!317350) (not b!317352))
(check-sat)
