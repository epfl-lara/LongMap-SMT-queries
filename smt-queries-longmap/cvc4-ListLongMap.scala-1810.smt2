; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32672 () Bool)

(assert start!32672)

(declare-fun b!326381 () Bool)

(declare-fun res!179416 () Bool)

(declare-fun e!201008 () Bool)

(assert (=> b!326381 (=> (not res!179416) (not e!201008))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16709 0))(
  ( (array!16710 (arr!7909 (Array (_ BitVec 32) (_ BitVec 64))) (size!8261 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16709)

(assert (=> b!326381 (= res!179416 (and (= (select (arr!7909 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8261 a!3305))))))

(declare-fun b!326382 () Bool)

(declare-fun res!179418 () Bool)

(assert (=> b!326382 (=> (not res!179418) (not e!201008))))

(declare-fun k!2497 () (_ BitVec 64))

(assert (=> b!326382 (= res!179418 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7909 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179412 () Bool)

(declare-fun e!201009 () Bool)

(assert (=> start!32672 (=> (not res!179412) (not e!201009))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32672 (= res!179412 (validMask!0 mask!3777))))

(assert (=> start!32672 e!201009))

(declare-fun array_inv!5872 (array!16709) Bool)

(assert (=> start!32672 (array_inv!5872 a!3305)))

(assert (=> start!32672 true))

(declare-fun b!326383 () Bool)

(assert (=> b!326383 (= e!201009 e!201008)))

(declare-fun res!179420 () Bool)

(assert (=> b!326383 (=> (not res!179420) (not e!201008))))

(declare-datatypes ((SeekEntryResult!3040 0))(
  ( (MissingZero!3040 (index!14336 (_ BitVec 32))) (Found!3040 (index!14337 (_ BitVec 32))) (Intermediate!3040 (undefined!3852 Bool) (index!14338 (_ BitVec 32)) (x!32582 (_ BitVec 32))) (Undefined!3040) (MissingVacant!3040 (index!14339 (_ BitVec 32))) )
))
(declare-fun lt!157314 () SeekEntryResult!3040)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16709 (_ BitVec 32)) SeekEntryResult!3040)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326383 (= res!179420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157314))))

(assert (=> b!326383 (= lt!157314 (Intermediate!3040 false resIndex!58 resX!58))))

(declare-fun b!326384 () Bool)

(declare-fun res!179414 () Bool)

(assert (=> b!326384 (=> (not res!179414) (not e!201009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16709 (_ BitVec 32)) Bool)

(assert (=> b!326384 (= res!179414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326385 () Bool)

(declare-fun res!179417 () Bool)

(assert (=> b!326385 (=> (not res!179417) (not e!201009))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16709 (_ BitVec 32)) SeekEntryResult!3040)

(assert (=> b!326385 (= res!179417 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3040 i!1250)))))

(declare-fun b!326386 () Bool)

(assert (=> b!326386 (= e!201008 false)))

(declare-datatypes ((Unit!10114 0))(
  ( (Unit!10115) )
))
(declare-fun lt!157313 () Unit!10114)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10114)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326386 (= lt!157313 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326387 () Bool)

(declare-fun res!179413 () Bool)

(assert (=> b!326387 (=> (not res!179413) (not e!201009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326387 (= res!179413 (validKeyInArray!0 k!2497))))

(declare-fun b!326388 () Bool)

(declare-fun res!179421 () Bool)

(assert (=> b!326388 (=> (not res!179421) (not e!201009))))

(declare-fun arrayContainsKey!0 (array!16709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326388 (= res!179421 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326389 () Bool)

(declare-fun res!179415 () Bool)

(assert (=> b!326389 (=> (not res!179415) (not e!201008))))

(assert (=> b!326389 (= res!179415 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157314))))

(declare-fun b!326390 () Bool)

(declare-fun res!179419 () Bool)

(assert (=> b!326390 (=> (not res!179419) (not e!201009))))

(assert (=> b!326390 (= res!179419 (and (= (size!8261 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8261 a!3305))))))

(assert (= (and start!32672 res!179412) b!326390))

(assert (= (and b!326390 res!179419) b!326387))

(assert (= (and b!326387 res!179413) b!326388))

(assert (= (and b!326388 res!179421) b!326385))

(assert (= (and b!326385 res!179417) b!326384))

(assert (= (and b!326384 res!179414) b!326383))

(assert (= (and b!326383 res!179420) b!326381))

(assert (= (and b!326381 res!179416) b!326389))

(assert (= (and b!326389 res!179415) b!326382))

(assert (= (and b!326382 res!179418) b!326386))

(declare-fun m!332937 () Bool)

(assert (=> start!32672 m!332937))

(declare-fun m!332939 () Bool)

(assert (=> start!32672 m!332939))

(declare-fun m!332941 () Bool)

(assert (=> b!326387 m!332941))

(declare-fun m!332943 () Bool)

(assert (=> b!326381 m!332943))

(declare-fun m!332945 () Bool)

(assert (=> b!326388 m!332945))

(declare-fun m!332947 () Bool)

(assert (=> b!326389 m!332947))

(declare-fun m!332949 () Bool)

(assert (=> b!326382 m!332949))

(declare-fun m!332951 () Bool)

(assert (=> b!326385 m!332951))

(declare-fun m!332953 () Bool)

(assert (=> b!326386 m!332953))

(assert (=> b!326386 m!332953))

(declare-fun m!332955 () Bool)

(assert (=> b!326386 m!332955))

(declare-fun m!332957 () Bool)

(assert (=> b!326383 m!332957))

(assert (=> b!326383 m!332957))

(declare-fun m!332959 () Bool)

(assert (=> b!326383 m!332959))

(declare-fun m!332961 () Bool)

(assert (=> b!326384 m!332961))

(push 1)

(assert (not start!32672))

(assert (not b!326383))

(assert (not b!326386))

(assert (not b!326388))

(assert (not b!326384))

(assert (not b!326389))

(assert (not b!326387))

(assert (not b!326385))

