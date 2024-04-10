; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33288 () Bool)

(assert start!33288)

(declare-fun b!330986 () Bool)

(declare-fun res!182390 () Bool)

(declare-fun e!203111 () Bool)

(assert (=> b!330986 (=> (not res!182390) (not e!203111))))

(declare-datatypes ((array!16896 0))(
  ( (array!16897 (arr!7989 (Array (_ BitVec 32) (_ BitVec 64))) (size!8341 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16896)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330986 (= res!182390 (and (= (select (arr!7989 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8341 a!3305))))))

(declare-fun b!330987 () Bool)

(declare-fun res!182392 () Bool)

(assert (=> b!330987 (=> (not res!182392) (not e!203111))))

(declare-fun k0!2497 () (_ BitVec 64))

(assert (=> b!330987 (= res!182392 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7989 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!330988 () Bool)

(declare-fun res!182389 () Bool)

(declare-fun e!203112 () Bool)

(assert (=> b!330988 (=> (not res!182389) (not e!203112))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3120 0))(
  ( (MissingZero!3120 (index!14656 (_ BitVec 32))) (Found!3120 (index!14657 (_ BitVec 32))) (Intermediate!3120 (undefined!3932 Bool) (index!14658 (_ BitVec 32)) (x!32944 (_ BitVec 32))) (Undefined!3120) (MissingVacant!3120 (index!14659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16896 (_ BitVec 32)) SeekEntryResult!3120)

(assert (=> b!330988 (= res!182389 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3120 i!1250)))))

(declare-fun b!330989 () Bool)

(declare-fun res!182397 () Bool)

(assert (=> b!330989 (=> (not res!182397) (not e!203111))))

(declare-fun lt!158691 () SeekEntryResult!3120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16896 (_ BitVec 32)) SeekEntryResult!3120)

(assert (=> b!330989 (= res!182397 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158691))))

(declare-fun b!330990 () Bool)

(assert (=> b!330990 (= e!203112 e!203111)))

(declare-fun res!182394 () Bool)

(assert (=> b!330990 (=> (not res!182394) (not e!203111))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330990 (= res!182394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158691))))

(assert (=> b!330990 (= lt!158691 (Intermediate!3120 false resIndex!58 resX!58))))

(declare-fun b!330991 () Bool)

(declare-fun res!182393 () Bool)

(assert (=> b!330991 (=> (not res!182393) (not e!203112))))

(declare-fun arrayContainsKey!0 (array!16896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330991 (= res!182393 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330993 () Bool)

(declare-fun res!182396 () Bool)

(assert (=> b!330993 (=> (not res!182396) (not e!203112))))

(assert (=> b!330993 (= res!182396 (and (= (size!8341 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8341 a!3305))))))

(declare-fun b!330994 () Bool)

(assert (=> b!330994 (= e!203111 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1490)) (bvsub #b01111111111111111111111111111110 x!1490)))))

(declare-fun lt!158690 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330994 (= lt!158690 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!330995 () Bool)

(declare-fun res!182391 () Bool)

(assert (=> b!330995 (=> (not res!182391) (not e!203112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330995 (= res!182391 (validKeyInArray!0 k0!2497))))

(declare-fun res!182388 () Bool)

(assert (=> start!33288 (=> (not res!182388) (not e!203112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33288 (= res!182388 (validMask!0 mask!3777))))

(assert (=> start!33288 e!203112))

(declare-fun array_inv!5952 (array!16896) Bool)

(assert (=> start!33288 (array_inv!5952 a!3305)))

(assert (=> start!33288 true))

(declare-fun b!330992 () Bool)

(declare-fun res!182395 () Bool)

(assert (=> b!330992 (=> (not res!182395) (not e!203112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16896 (_ BitVec 32)) Bool)

(assert (=> b!330992 (= res!182395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!33288 res!182388) b!330993))

(assert (= (and b!330993 res!182396) b!330995))

(assert (= (and b!330995 res!182391) b!330991))

(assert (= (and b!330991 res!182393) b!330988))

(assert (= (and b!330988 res!182389) b!330992))

(assert (= (and b!330992 res!182395) b!330990))

(assert (= (and b!330990 res!182394) b!330986))

(assert (= (and b!330986 res!182390) b!330989))

(assert (= (and b!330989 res!182397) b!330987))

(assert (= (and b!330987 res!182392) b!330994))

(declare-fun m!336005 () Bool)

(assert (=> b!330988 m!336005))

(declare-fun m!336007 () Bool)

(assert (=> b!330994 m!336007))

(declare-fun m!336009 () Bool)

(assert (=> start!33288 m!336009))

(declare-fun m!336011 () Bool)

(assert (=> start!33288 m!336011))

(declare-fun m!336013 () Bool)

(assert (=> b!330989 m!336013))

(declare-fun m!336015 () Bool)

(assert (=> b!330995 m!336015))

(declare-fun m!336017 () Bool)

(assert (=> b!330992 m!336017))

(declare-fun m!336019 () Bool)

(assert (=> b!330986 m!336019))

(declare-fun m!336021 () Bool)

(assert (=> b!330987 m!336021))

(declare-fun m!336023 () Bool)

(assert (=> b!330990 m!336023))

(assert (=> b!330990 m!336023))

(declare-fun m!336025 () Bool)

(assert (=> b!330990 m!336025))

(declare-fun m!336027 () Bool)

(assert (=> b!330991 m!336027))

(check-sat (not b!330991) (not b!330988) (not b!330990) (not start!33288) (not b!330992) (not b!330995) (not b!330989) (not b!330994))
(check-sat)
