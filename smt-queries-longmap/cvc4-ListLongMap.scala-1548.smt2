; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29318 () Bool)

(assert start!29318)

(declare-fun b!297046 () Bool)

(declare-fun e!187733 () Bool)

(declare-fun e!187734 () Bool)

(assert (=> b!297046 (= e!187733 e!187734)))

(declare-fun res!156572 () Bool)

(assert (=> b!297046 (=> (not res!156572) (not e!187734))))

(declare-datatypes ((SeekEntryResult!2272 0))(
  ( (MissingZero!2272 (index!11258 (_ BitVec 32))) (Found!2272 (index!11259 (_ BitVec 32))) (Intermediate!2272 (undefined!3084 Bool) (index!11260 (_ BitVec 32)) (x!29472 (_ BitVec 32))) (Undefined!2272) (MissingVacant!2272 (index!11261 (_ BitVec 32))) )
))
(declare-fun lt!147552 () SeekEntryResult!2272)

(declare-fun lt!147546 () Bool)

(declare-datatypes ((array!15031 0))(
  ( (array!15032 (arr!7123 (Array (_ BitVec 32) (_ BitVec 64))) (size!7475 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15031)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!297046 (= res!156572 (and (or lt!147546 (not (undefined!3084 lt!147552))) (or lt!147546 (not (= (select (arr!7123 a!3312) (index!11260 lt!147552)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147546 (not (= (select (arr!7123 a!3312) (index!11260 lt!147552)) k!2524))) (not lt!147546)))))

(assert (=> b!297046 (= lt!147546 (not (is-Intermediate!2272 lt!147552)))))

(declare-fun res!156574 () Bool)

(declare-fun e!187732 () Bool)

(assert (=> start!29318 (=> (not res!156574) (not e!187732))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29318 (= res!156574 (validMask!0 mask!3809))))

(assert (=> start!29318 e!187732))

(assert (=> start!29318 true))

(declare-fun array_inv!5086 (array!15031) Bool)

(assert (=> start!29318 (array_inv!5086 a!3312)))

(declare-fun b!297047 () Bool)

(declare-fun res!156573 () Bool)

(assert (=> b!297047 (=> (not res!156573) (not e!187732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297047 (= res!156573 (validKeyInArray!0 k!2524))))

(declare-fun b!297048 () Bool)

(declare-fun res!156577 () Bool)

(assert (=> b!297048 (=> (not res!156577) (not e!187732))))

(declare-fun arrayContainsKey!0 (array!15031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297048 (= res!156577 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297049 () Bool)

(declare-fun e!187735 () Bool)

(assert (=> b!297049 (= e!187735 e!187733)))

(declare-fun res!156578 () Bool)

(assert (=> b!297049 (=> (not res!156578) (not e!187733))))

(declare-fun lt!147550 () Bool)

(assert (=> b!297049 (= res!156578 lt!147550)))

(declare-fun lt!147551 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147549 () SeekEntryResult!2272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15031 (_ BitVec 32)) SeekEntryResult!2272)

(assert (=> b!297049 (= lt!147549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147551 k!2524 (array!15032 (store (arr!7123 a!3312) i!1256 k!2524) (size!7475 a!3312)) mask!3809))))

(assert (=> b!297049 (= lt!147552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147551 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297049 (= lt!147551 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297050 () Bool)

(declare-fun res!156579 () Bool)

(assert (=> b!297050 (=> (not res!156579) (not e!187735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15031 (_ BitVec 32)) Bool)

(assert (=> b!297050 (= res!156579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297051 () Bool)

(declare-fun res!156576 () Bool)

(assert (=> b!297051 (=> (not res!156576) (not e!187732))))

(assert (=> b!297051 (= res!156576 (and (= (size!7475 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7475 a!3312))))))

(declare-fun b!297052 () Bool)

(assert (=> b!297052 (= e!187732 e!187735)))

(declare-fun res!156575 () Bool)

(assert (=> b!297052 (=> (not res!156575) (not e!187735))))

(declare-fun lt!147547 () SeekEntryResult!2272)

(assert (=> b!297052 (= res!156575 (or lt!147550 (= lt!147547 (MissingVacant!2272 i!1256))))))

(assert (=> b!297052 (= lt!147550 (= lt!147547 (MissingZero!2272 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15031 (_ BitVec 32)) SeekEntryResult!2272)

(assert (=> b!297052 (= lt!147547 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297053 () Bool)

(assert (=> b!297053 (= e!187734 (not true))))

(assert (=> b!297053 (= lt!147549 lt!147552)))

(declare-datatypes ((Unit!9242 0))(
  ( (Unit!9243) )
))
(declare-fun lt!147548 () Unit!9242)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15031 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9242)

(assert (=> b!297053 (= lt!147548 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147551 (index!11260 lt!147552) (x!29472 lt!147552) mask!3809))))

(assert (=> b!297053 (and (= (select (arr!7123 a!3312) (index!11260 lt!147552)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11260 lt!147552) i!1256))))

(assert (= (and start!29318 res!156574) b!297051))

(assert (= (and b!297051 res!156576) b!297047))

(assert (= (and b!297047 res!156573) b!297048))

(assert (= (and b!297048 res!156577) b!297052))

(assert (= (and b!297052 res!156575) b!297050))

(assert (= (and b!297050 res!156579) b!297049))

(assert (= (and b!297049 res!156578) b!297046))

(assert (= (and b!297046 res!156572) b!297053))

(declare-fun m!309867 () Bool)

(assert (=> b!297048 m!309867))

(declare-fun m!309869 () Bool)

(assert (=> b!297047 m!309869))

(declare-fun m!309871 () Bool)

(assert (=> start!29318 m!309871))

(declare-fun m!309873 () Bool)

(assert (=> start!29318 m!309873))

(declare-fun m!309875 () Bool)

(assert (=> b!297052 m!309875))

(declare-fun m!309877 () Bool)

(assert (=> b!297049 m!309877))

(declare-fun m!309879 () Bool)

(assert (=> b!297049 m!309879))

(declare-fun m!309881 () Bool)

(assert (=> b!297049 m!309881))

(declare-fun m!309883 () Bool)

(assert (=> b!297049 m!309883))

(declare-fun m!309885 () Bool)

(assert (=> b!297050 m!309885))

(declare-fun m!309887 () Bool)

(assert (=> b!297053 m!309887))

(declare-fun m!309889 () Bool)

(assert (=> b!297053 m!309889))

(assert (=> b!297046 m!309889))

(push 1)

