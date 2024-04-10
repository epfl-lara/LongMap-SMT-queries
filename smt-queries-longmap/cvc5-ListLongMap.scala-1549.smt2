; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29320 () Bool)

(assert start!29320)

(declare-fun b!297070 () Bool)

(declare-fun e!187749 () Bool)

(declare-fun e!187747 () Bool)

(assert (=> b!297070 (= e!187749 e!187747)))

(declare-fun res!156598 () Bool)

(assert (=> b!297070 (=> (not res!156598) (not e!187747))))

(declare-fun lt!147569 () Bool)

(assert (=> b!297070 (= res!156598 lt!147569)))

(declare-datatypes ((SeekEntryResult!2273 0))(
  ( (MissingZero!2273 (index!11262 (_ BitVec 32))) (Found!2273 (index!11263 (_ BitVec 32))) (Intermediate!2273 (undefined!3085 Bool) (index!11264 (_ BitVec 32)) (x!29481 (_ BitVec 32))) (Undefined!2273) (MissingVacant!2273 (index!11265 (_ BitVec 32))) )
))
(declare-fun lt!147573 () SeekEntryResult!2273)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147567 () (_ BitVec 32))

(declare-datatypes ((array!15033 0))(
  ( (array!15034 (arr!7124 (Array (_ BitVec 32) (_ BitVec 64))) (size!7476 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15033)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15033 (_ BitVec 32)) SeekEntryResult!2273)

(assert (=> b!297070 (= lt!147573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147567 k!2524 (array!15034 (store (arr!7124 a!3312) i!1256 k!2524) (size!7476 a!3312)) mask!3809))))

(declare-fun lt!147570 () SeekEntryResult!2273)

(assert (=> b!297070 (= lt!147570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147567 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297070 (= lt!147567 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297071 () Bool)

(declare-fun res!156600 () Bool)

(declare-fun e!187746 () Bool)

(assert (=> b!297071 (=> (not res!156600) (not e!187746))))

(declare-fun arrayContainsKey!0 (array!15033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297071 (= res!156600 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297072 () Bool)

(declare-fun res!156603 () Bool)

(assert (=> b!297072 (=> (not res!156603) (not e!187746))))

(assert (=> b!297072 (= res!156603 (and (= (size!7476 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7476 a!3312))))))

(declare-fun b!297073 () Bool)

(declare-fun e!187748 () Bool)

(assert (=> b!297073 (= e!187748 (not (and (bvsge (index!11264 lt!147570) #b00000000000000000000000000000000) (bvslt (index!11264 lt!147570) (size!7476 a!3312)))))))

(assert (=> b!297073 (= lt!147573 lt!147570)))

(declare-datatypes ((Unit!9244 0))(
  ( (Unit!9245) )
))
(declare-fun lt!147572 () Unit!9244)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9244)

(assert (=> b!297073 (= lt!147572 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147567 (index!11264 lt!147570) (x!29481 lt!147570) mask!3809))))

(assert (=> b!297073 (and (= (select (arr!7124 a!3312) (index!11264 lt!147570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11264 lt!147570) i!1256))))

(declare-fun b!297074 () Bool)

(assert (=> b!297074 (= e!187746 e!187749)))

(declare-fun res!156602 () Bool)

(assert (=> b!297074 (=> (not res!156602) (not e!187749))))

(declare-fun lt!147568 () SeekEntryResult!2273)

(assert (=> b!297074 (= res!156602 (or lt!147569 (= lt!147568 (MissingVacant!2273 i!1256))))))

(assert (=> b!297074 (= lt!147569 (= lt!147568 (MissingZero!2273 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15033 (_ BitVec 32)) SeekEntryResult!2273)

(assert (=> b!297074 (= lt!147568 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297076 () Bool)

(assert (=> b!297076 (= e!187747 e!187748)))

(declare-fun res!156599 () Bool)

(assert (=> b!297076 (=> (not res!156599) (not e!187748))))

(declare-fun lt!147571 () Bool)

(assert (=> b!297076 (= res!156599 (and (or lt!147571 (not (undefined!3085 lt!147570))) (or lt!147571 (not (= (select (arr!7124 a!3312) (index!11264 lt!147570)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147571 (not (= (select (arr!7124 a!3312) (index!11264 lt!147570)) k!2524))) (not lt!147571)))))

(assert (=> b!297076 (= lt!147571 (not (is-Intermediate!2273 lt!147570)))))

(declare-fun b!297077 () Bool)

(declare-fun res!156596 () Bool)

(assert (=> b!297077 (=> (not res!156596) (not e!187749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15033 (_ BitVec 32)) Bool)

(assert (=> b!297077 (= res!156596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156601 () Bool)

(assert (=> start!29320 (=> (not res!156601) (not e!187746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29320 (= res!156601 (validMask!0 mask!3809))))

(assert (=> start!29320 e!187746))

(assert (=> start!29320 true))

(declare-fun array_inv!5087 (array!15033) Bool)

(assert (=> start!29320 (array_inv!5087 a!3312)))

(declare-fun b!297075 () Bool)

(declare-fun res!156597 () Bool)

(assert (=> b!297075 (=> (not res!156597) (not e!187746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297075 (= res!156597 (validKeyInArray!0 k!2524))))

(assert (= (and start!29320 res!156601) b!297072))

(assert (= (and b!297072 res!156603) b!297075))

(assert (= (and b!297075 res!156597) b!297071))

(assert (= (and b!297071 res!156600) b!297074))

(assert (= (and b!297074 res!156602) b!297077))

(assert (= (and b!297077 res!156596) b!297070))

(assert (= (and b!297070 res!156598) b!297076))

(assert (= (and b!297076 res!156599) b!297073))

(declare-fun m!309891 () Bool)

(assert (=> b!297077 m!309891))

(declare-fun m!309893 () Bool)

(assert (=> b!297071 m!309893))

(declare-fun m!309895 () Bool)

(assert (=> b!297073 m!309895))

(declare-fun m!309897 () Bool)

(assert (=> b!297073 m!309897))

(declare-fun m!309899 () Bool)

(assert (=> start!29320 m!309899))

(declare-fun m!309901 () Bool)

(assert (=> start!29320 m!309901))

(assert (=> b!297076 m!309897))

(declare-fun m!309903 () Bool)

(assert (=> b!297074 m!309903))

(declare-fun m!309905 () Bool)

(assert (=> b!297070 m!309905))

(declare-fun m!309907 () Bool)

(assert (=> b!297070 m!309907))

(declare-fun m!309909 () Bool)

(assert (=> b!297070 m!309909))

(declare-fun m!309911 () Bool)

(assert (=> b!297070 m!309911))

(declare-fun m!309913 () Bool)

(assert (=> b!297075 m!309913))

(push 1)

(assert (not start!29320))

(assert (not b!297070))

(assert (not b!297077))

(assert (not b!297073))

(assert (not b!297071))

(assert (not b!297075))

(assert (not b!297074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

