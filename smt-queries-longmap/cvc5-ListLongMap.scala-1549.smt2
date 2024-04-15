; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29310 () Bool)

(assert start!29310)

(declare-fun b!296871 () Bool)

(declare-fun e!187621 () Bool)

(declare-datatypes ((SeekEntryResult!2269 0))(
  ( (MissingZero!2269 (index!11246 (_ BitVec 32))) (Found!2269 (index!11247 (_ BitVec 32))) (Intermediate!2269 (undefined!3081 Bool) (index!11248 (_ BitVec 32)) (x!29473 (_ BitVec 32))) (Undefined!2269) (MissingVacant!2269 (index!11249 (_ BitVec 32))) )
))
(declare-fun lt!147387 () SeekEntryResult!2269)

(declare-datatypes ((array!15026 0))(
  ( (array!15027 (arr!7121 (Array (_ BitVec 32) (_ BitVec 64))) (size!7474 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15026)

(assert (=> b!296871 (= e!187621 (not (and (bvsge (index!11248 lt!147387) #b00000000000000000000000000000000) (bvslt (index!11248 lt!147387) (size!7474 a!3312)))))))

(declare-fun lt!147393 () SeekEntryResult!2269)

(assert (=> b!296871 (= lt!147393 lt!147387)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((Unit!9200 0))(
  ( (Unit!9201) )
))
(declare-fun lt!147392 () Unit!9200)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!147391 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9200)

(assert (=> b!296871 (= lt!147392 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147391 (index!11248 lt!147387) (x!29473 lt!147387) mask!3809))))

(assert (=> b!296871 (and (= (select (arr!7121 a!3312) (index!11248 lt!147387)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11248 lt!147387) i!1256))))

(declare-fun b!296872 () Bool)

(declare-fun e!187617 () Bool)

(declare-fun e!187619 () Bool)

(assert (=> b!296872 (= e!187617 e!187619)))

(declare-fun res!156529 () Bool)

(assert (=> b!296872 (=> (not res!156529) (not e!187619))))

(declare-fun lt!147388 () Bool)

(declare-fun lt!147390 () SeekEntryResult!2269)

(assert (=> b!296872 (= res!156529 (or lt!147388 (= lt!147390 (MissingVacant!2269 i!1256))))))

(assert (=> b!296872 (= lt!147388 (= lt!147390 (MissingZero!2269 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15026 (_ BitVec 32)) SeekEntryResult!2269)

(assert (=> b!296872 (= lt!147390 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296873 () Bool)

(declare-fun res!156527 () Bool)

(assert (=> b!296873 (=> (not res!156527) (not e!187617))))

(assert (=> b!296873 (= res!156527 (and (= (size!7474 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7474 a!3312))))))

(declare-fun b!296874 () Bool)

(declare-fun res!156528 () Bool)

(assert (=> b!296874 (=> (not res!156528) (not e!187617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296874 (= res!156528 (validKeyInArray!0 k!2524))))

(declare-fun b!296875 () Bool)

(declare-fun res!156526 () Bool)

(assert (=> b!296875 (=> (not res!156526) (not e!187619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15026 (_ BitVec 32)) Bool)

(assert (=> b!296875 (= res!156526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296876 () Bool)

(declare-fun e!187620 () Bool)

(assert (=> b!296876 (= e!187620 e!187621)))

(declare-fun res!156530 () Bool)

(assert (=> b!296876 (=> (not res!156530) (not e!187621))))

(declare-fun lt!147389 () Bool)

(assert (=> b!296876 (= res!156530 (and (or lt!147389 (not (undefined!3081 lt!147387))) (or lt!147389 (not (= (select (arr!7121 a!3312) (index!11248 lt!147387)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147389 (not (= (select (arr!7121 a!3312) (index!11248 lt!147387)) k!2524))) (not lt!147389)))))

(assert (=> b!296876 (= lt!147389 (not (is-Intermediate!2269 lt!147387)))))

(declare-fun b!296878 () Bool)

(assert (=> b!296878 (= e!187619 e!187620)))

(declare-fun res!156525 () Bool)

(assert (=> b!296878 (=> (not res!156525) (not e!187620))))

(assert (=> b!296878 (= res!156525 lt!147388)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15026 (_ BitVec 32)) SeekEntryResult!2269)

(assert (=> b!296878 (= lt!147393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147391 k!2524 (array!15027 (store (arr!7121 a!3312) i!1256 k!2524) (size!7474 a!3312)) mask!3809))))

(assert (=> b!296878 (= lt!147387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147391 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296878 (= lt!147391 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!156531 () Bool)

(assert (=> start!29310 (=> (not res!156531) (not e!187617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29310 (= res!156531 (validMask!0 mask!3809))))

(assert (=> start!29310 e!187617))

(assert (=> start!29310 true))

(declare-fun array_inv!5093 (array!15026) Bool)

(assert (=> start!29310 (array_inv!5093 a!3312)))

(declare-fun b!296877 () Bool)

(declare-fun res!156532 () Bool)

(assert (=> b!296877 (=> (not res!156532) (not e!187617))))

(declare-fun arrayContainsKey!0 (array!15026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296877 (= res!156532 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29310 res!156531) b!296873))

(assert (= (and b!296873 res!156527) b!296874))

(assert (= (and b!296874 res!156528) b!296877))

(assert (= (and b!296877 res!156532) b!296872))

(assert (= (and b!296872 res!156529) b!296875))

(assert (= (and b!296875 res!156526) b!296878))

(assert (= (and b!296878 res!156525) b!296876))

(assert (= (and b!296876 res!156530) b!296871))

(declare-fun m!309243 () Bool)

(assert (=> b!296872 m!309243))

(declare-fun m!309245 () Bool)

(assert (=> b!296875 m!309245))

(declare-fun m!309247 () Bool)

(assert (=> start!29310 m!309247))

(declare-fun m!309249 () Bool)

(assert (=> start!29310 m!309249))

(declare-fun m!309251 () Bool)

(assert (=> b!296877 m!309251))

(declare-fun m!309253 () Bool)

(assert (=> b!296878 m!309253))

(declare-fun m!309255 () Bool)

(assert (=> b!296878 m!309255))

(declare-fun m!309257 () Bool)

(assert (=> b!296878 m!309257))

(declare-fun m!309259 () Bool)

(assert (=> b!296878 m!309259))

(declare-fun m!309261 () Bool)

(assert (=> b!296874 m!309261))

(declare-fun m!309263 () Bool)

(assert (=> b!296876 m!309263))

(declare-fun m!309265 () Bool)

(assert (=> b!296871 m!309265))

(assert (=> b!296871 m!309263))

(push 1)

(assert (not b!296875))

(assert (not b!296874))

(assert (not b!296872))

(assert (not b!296871))

(assert (not b!296877))

(assert (not b!296878))

(assert (not start!29310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

