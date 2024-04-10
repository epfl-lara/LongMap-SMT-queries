; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29326 () Bool)

(assert start!29326)

(declare-fun b!297142 () Bool)

(declare-fun e!187792 () Bool)

(declare-fun e!187794 () Bool)

(assert (=> b!297142 (= e!187792 e!187794)))

(declare-fun res!156675 () Bool)

(assert (=> b!297142 (=> (not res!156675) (not e!187794))))

(declare-datatypes ((SeekEntryResult!2276 0))(
  ( (MissingZero!2276 (index!11274 (_ BitVec 32))) (Found!2276 (index!11275 (_ BitVec 32))) (Intermediate!2276 (undefined!3088 Bool) (index!11276 (_ BitVec 32)) (x!29492 (_ BitVec 32))) (Undefined!2276) (MissingVacant!2276 (index!11277 (_ BitVec 32))) )
))
(declare-fun lt!147630 () SeekEntryResult!2276)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147635 () Bool)

(assert (=> b!297142 (= res!156675 (or lt!147635 (= lt!147630 (MissingVacant!2276 i!1256))))))

(assert (=> b!297142 (= lt!147635 (= lt!147630 (MissingZero!2276 i!1256)))))

(declare-datatypes ((array!15039 0))(
  ( (array!15040 (arr!7127 (Array (_ BitVec 32) (_ BitVec 64))) (size!7479 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15039)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15039 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!297142 (= lt!147630 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297143 () Bool)

(declare-fun res!156674 () Bool)

(assert (=> b!297143 (=> (not res!156674) (not e!187792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297143 (= res!156674 (validKeyInArray!0 k!2524))))

(declare-fun b!297144 () Bool)

(declare-fun e!187795 () Bool)

(declare-fun lt!147632 () SeekEntryResult!2276)

(assert (=> b!297144 (= e!187795 (not (= (select (store (arr!7127 a!3312) i!1256 k!2524) (index!11276 lt!147632)) k!2524)))))

(declare-fun lt!147634 () SeekEntryResult!2276)

(assert (=> b!297144 (= lt!147634 lt!147632)))

(declare-datatypes ((Unit!9250 0))(
  ( (Unit!9251) )
))
(declare-fun lt!147633 () Unit!9250)

(declare-fun lt!147631 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15039 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9250)

(assert (=> b!297144 (= lt!147633 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147631 (index!11276 lt!147632) (x!29492 lt!147632) mask!3809))))

(assert (=> b!297144 (and (= (select (arr!7127 a!3312) (index!11276 lt!147632)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11276 lt!147632) i!1256))))

(declare-fun b!297145 () Bool)

(declare-fun e!187791 () Bool)

(assert (=> b!297145 (= e!187794 e!187791)))

(declare-fun res!156671 () Bool)

(assert (=> b!297145 (=> (not res!156671) (not e!187791))))

(assert (=> b!297145 (= res!156671 lt!147635)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15039 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!297145 (= lt!147634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147631 k!2524 (array!15040 (store (arr!7127 a!3312) i!1256 k!2524) (size!7479 a!3312)) mask!3809))))

(assert (=> b!297145 (= lt!147632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147631 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297145 (= lt!147631 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!156673 () Bool)

(assert (=> start!29326 (=> (not res!156673) (not e!187792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29326 (= res!156673 (validMask!0 mask!3809))))

(assert (=> start!29326 e!187792))

(assert (=> start!29326 true))

(declare-fun array_inv!5090 (array!15039) Bool)

(assert (=> start!29326 (array_inv!5090 a!3312)))

(declare-fun b!297146 () Bool)

(declare-fun res!156668 () Bool)

(assert (=> b!297146 (=> (not res!156668) (not e!187792))))

(declare-fun arrayContainsKey!0 (array!15039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297146 (= res!156668 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297147 () Bool)

(assert (=> b!297147 (= e!187791 e!187795)))

(declare-fun res!156672 () Bool)

(assert (=> b!297147 (=> (not res!156672) (not e!187795))))

(declare-fun lt!147636 () Bool)

(assert (=> b!297147 (= res!156672 (and (or lt!147636 (not (undefined!3088 lt!147632))) (or lt!147636 (not (= (select (arr!7127 a!3312) (index!11276 lt!147632)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147636 (not (= (select (arr!7127 a!3312) (index!11276 lt!147632)) k!2524))) (not lt!147636)))))

(assert (=> b!297147 (= lt!147636 (not (is-Intermediate!2276 lt!147632)))))

(declare-fun b!297148 () Bool)

(declare-fun res!156670 () Bool)

(assert (=> b!297148 (=> (not res!156670) (not e!187792))))

(assert (=> b!297148 (= res!156670 (and (= (size!7479 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7479 a!3312))))))

(declare-fun b!297149 () Bool)

(declare-fun res!156669 () Bool)

(assert (=> b!297149 (=> (not res!156669) (not e!187794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15039 (_ BitVec 32)) Bool)

(assert (=> b!297149 (= res!156669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29326 res!156673) b!297148))

(assert (= (and b!297148 res!156670) b!297143))

(assert (= (and b!297143 res!156674) b!297146))

(assert (= (and b!297146 res!156668) b!297142))

(assert (= (and b!297142 res!156675) b!297149))

(assert (= (and b!297149 res!156669) b!297145))

(assert (= (and b!297145 res!156671) b!297147))

(assert (= (and b!297147 res!156672) b!297144))

(declare-fun m!309963 () Bool)

(assert (=> b!297143 m!309963))

(declare-fun m!309965 () Bool)

(assert (=> b!297149 m!309965))

(declare-fun m!309967 () Bool)

(assert (=> b!297144 m!309967))

(declare-fun m!309969 () Bool)

(assert (=> b!297144 m!309969))

(declare-fun m!309971 () Bool)

(assert (=> b!297144 m!309971))

(declare-fun m!309973 () Bool)

(assert (=> b!297144 m!309973))

(assert (=> b!297147 m!309973))

(assert (=> b!297145 m!309967))

(declare-fun m!309975 () Bool)

(assert (=> b!297145 m!309975))

(declare-fun m!309977 () Bool)

(assert (=> b!297145 m!309977))

(declare-fun m!309979 () Bool)

(assert (=> b!297145 m!309979))

(declare-fun m!309981 () Bool)

(assert (=> b!297146 m!309981))

(declare-fun m!309983 () Bool)

(assert (=> b!297142 m!309983))

(declare-fun m!309985 () Bool)

(assert (=> start!29326 m!309985))

(declare-fun m!309987 () Bool)

(assert (=> start!29326 m!309987))

(push 1)

