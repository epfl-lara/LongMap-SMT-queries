; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29330 () Bool)

(assert start!29330)

(declare-fun b!297190 () Bool)

(declare-fun res!156716 () Bool)

(declare-fun e!187822 () Bool)

(assert (=> b!297190 (=> (not res!156716) (not e!187822))))

(declare-datatypes ((array!15043 0))(
  ( (array!15044 (arr!7129 (Array (_ BitVec 32) (_ BitVec 64))) (size!7481 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15043)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297190 (= res!156716 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297191 () Bool)

(declare-fun res!156718 () Bool)

(assert (=> b!297191 (=> (not res!156718) (not e!187822))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297191 (= res!156718 (and (= (size!7481 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7481 a!3312))))))

(declare-fun b!297192 () Bool)

(declare-fun e!187824 () Bool)

(declare-fun e!187825 () Bool)

(assert (=> b!297192 (= e!187824 e!187825)))

(declare-fun res!156720 () Bool)

(assert (=> b!297192 (=> (not res!156720) (not e!187825))))

(declare-datatypes ((SeekEntryResult!2278 0))(
  ( (MissingZero!2278 (index!11282 (_ BitVec 32))) (Found!2278 (index!11283 (_ BitVec 32))) (Intermediate!2278 (undefined!3090 Bool) (index!11284 (_ BitVec 32)) (x!29494 (_ BitVec 32))) (Undefined!2278) (MissingVacant!2278 (index!11285 (_ BitVec 32))) )
))
(declare-fun lt!147675 () SeekEntryResult!2278)

(declare-fun lt!147678 () Bool)

(assert (=> b!297192 (= res!156720 (and (or lt!147678 (not (undefined!3090 lt!147675))) (or lt!147678 (not (= (select (arr!7129 a!3312) (index!11284 lt!147675)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147678 (not (= (select (arr!7129 a!3312) (index!11284 lt!147675)) k!2524))) (not lt!147678)))))

(assert (=> b!297192 (= lt!147678 (not (is-Intermediate!2278 lt!147675)))))

(declare-fun b!297193 () Bool)

(assert (=> b!297193 (= e!187825 (not (= (select (store (arr!7129 a!3312) i!1256 k!2524) (index!11284 lt!147675)) k!2524)))))

(declare-fun lt!147672 () SeekEntryResult!2278)

(assert (=> b!297193 (= lt!147672 lt!147675)))

(declare-datatypes ((Unit!9254 0))(
  ( (Unit!9255) )
))
(declare-fun lt!147674 () Unit!9254)

(declare-fun lt!147673 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9254)

(assert (=> b!297193 (= lt!147674 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147673 (index!11284 lt!147675) (x!29494 lt!147675) mask!3809))))

(assert (=> b!297193 (and (= (select (arr!7129 a!3312) (index!11284 lt!147675)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11284 lt!147675) i!1256))))

(declare-fun b!297194 () Bool)

(declare-fun e!187821 () Bool)

(assert (=> b!297194 (= e!187822 e!187821)))

(declare-fun res!156719 () Bool)

(assert (=> b!297194 (=> (not res!156719) (not e!187821))))

(declare-fun lt!147677 () Bool)

(declare-fun lt!147676 () SeekEntryResult!2278)

(assert (=> b!297194 (= res!156719 (or lt!147677 (= lt!147676 (MissingVacant!2278 i!1256))))))

(assert (=> b!297194 (= lt!147677 (= lt!147676 (MissingZero!2278 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15043 (_ BitVec 32)) SeekEntryResult!2278)

(assert (=> b!297194 (= lt!147676 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297195 () Bool)

(declare-fun res!156721 () Bool)

(assert (=> b!297195 (=> (not res!156721) (not e!187821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15043 (_ BitVec 32)) Bool)

(assert (=> b!297195 (= res!156721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297196 () Bool)

(declare-fun res!156722 () Bool)

(assert (=> b!297196 (=> (not res!156722) (not e!187822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297196 (= res!156722 (validKeyInArray!0 k!2524))))

(declare-fun b!297197 () Bool)

(assert (=> b!297197 (= e!187821 e!187824)))

(declare-fun res!156723 () Bool)

(assert (=> b!297197 (=> (not res!156723) (not e!187824))))

(assert (=> b!297197 (= res!156723 lt!147677)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15043 (_ BitVec 32)) SeekEntryResult!2278)

(assert (=> b!297197 (= lt!147672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147673 k!2524 (array!15044 (store (arr!7129 a!3312) i!1256 k!2524) (size!7481 a!3312)) mask!3809))))

(assert (=> b!297197 (= lt!147675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147673 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297197 (= lt!147673 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!156717 () Bool)

(assert (=> start!29330 (=> (not res!156717) (not e!187822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29330 (= res!156717 (validMask!0 mask!3809))))

(assert (=> start!29330 e!187822))

(assert (=> start!29330 true))

(declare-fun array_inv!5092 (array!15043) Bool)

(assert (=> start!29330 (array_inv!5092 a!3312)))

(assert (= (and start!29330 res!156717) b!297191))

(assert (= (and b!297191 res!156718) b!297196))

(assert (= (and b!297196 res!156722) b!297190))

(assert (= (and b!297190 res!156716) b!297194))

(assert (= (and b!297194 res!156719) b!297195))

(assert (= (and b!297195 res!156721) b!297197))

(assert (= (and b!297197 res!156723) b!297192))

(assert (= (and b!297192 res!156720) b!297193))

(declare-fun m!310015 () Bool)

(assert (=> b!297190 m!310015))

(declare-fun m!310017 () Bool)

(assert (=> b!297193 m!310017))

(declare-fun m!310019 () Bool)

(assert (=> b!297193 m!310019))

(declare-fun m!310021 () Bool)

(assert (=> b!297193 m!310021))

(declare-fun m!310023 () Bool)

(assert (=> b!297193 m!310023))

(declare-fun m!310025 () Bool)

(assert (=> b!297194 m!310025))

(declare-fun m!310027 () Bool)

(assert (=> start!29330 m!310027))

(declare-fun m!310029 () Bool)

(assert (=> start!29330 m!310029))

(assert (=> b!297192 m!310023))

(declare-fun m!310031 () Bool)

(assert (=> b!297195 m!310031))

(assert (=> b!297197 m!310017))

(declare-fun m!310033 () Bool)

(assert (=> b!297197 m!310033))

(declare-fun m!310035 () Bool)

(assert (=> b!297197 m!310035))

(declare-fun m!310037 () Bool)

(assert (=> b!297197 m!310037))

(declare-fun m!310039 () Bool)

(assert (=> b!297196 m!310039))

(push 1)

