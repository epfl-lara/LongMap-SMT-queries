; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68032 () Bool)

(assert start!68032)

(declare-fun b!791018 () Bool)

(declare-fun res!535766 () Bool)

(declare-fun e!439702 () Bool)

(assert (=> b!791018 (=> (not res!535766) (not e!439702))))

(declare-datatypes ((array!42889 0))(
  ( (array!42890 (arr!20527 (Array (_ BitVec 32) (_ BitVec 64))) (size!20947 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42889)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791018 (= res!535766 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791019 () Bool)

(declare-fun e!439699 () Bool)

(declare-fun e!439696 () Bool)

(assert (=> b!791019 (= e!439699 e!439696)))

(declare-fun res!535756 () Bool)

(assert (=> b!791019 (=> (not res!535756) (not e!439696))))

(declare-datatypes ((SeekEntryResult!8083 0))(
  ( (MissingZero!8083 (index!34700 (_ BitVec 32))) (Found!8083 (index!34701 (_ BitVec 32))) (Intermediate!8083 (undefined!8895 Bool) (index!34702 (_ BitVec 32)) (x!65795 (_ BitVec 32))) (Undefined!8083) (MissingVacant!8083 (index!34703 (_ BitVec 32))) )
))
(declare-fun lt!353122 () SeekEntryResult!8083)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!791019 (= res!535756 (= (seekEntryOrOpen!0 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353122))))

(assert (=> b!791019 (= lt!353122 (Found!8083 j!159))))

(declare-fun b!791020 () Bool)

(declare-fun res!535761 () Bool)

(declare-fun e!439698 () Bool)

(assert (=> b!791020 (=> (not res!535761) (not e!439698))))

(declare-datatypes ((List!14436 0))(
  ( (Nil!14433) (Cons!14432 (h!15564 (_ BitVec 64)) (t!20743 List!14436)) )
))
(declare-fun arrayNoDuplicates!0 (array!42889 (_ BitVec 32) List!14436) Bool)

(assert (=> b!791020 (= res!535761 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14433))))

(declare-fun b!791021 () Bool)

(declare-fun res!535767 () Bool)

(assert (=> b!791021 (=> (not res!535767) (not e!439698))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791021 (= res!535767 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20947 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20947 a!3186))))))

(declare-fun lt!353127 () SeekEntryResult!8083)

(declare-fun b!791022 () Bool)

(declare-fun e!439701 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!791022 (= e!439701 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353127))))

(declare-fun b!791023 () Bool)

(declare-fun res!535768 () Bool)

(assert (=> b!791023 (=> (not res!535768) (not e!439702))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791023 (= res!535768 (and (= (size!20947 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20947 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20947 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!535757 () Bool)

(assert (=> start!68032 (=> (not res!535757) (not e!439702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68032 (= res!535757 (validMask!0 mask!3328))))

(assert (=> start!68032 e!439702))

(assert (=> start!68032 true))

(declare-fun array_inv!16386 (array!42889) Bool)

(assert (=> start!68032 (array_inv!16386 a!3186)))

(declare-fun b!791024 () Bool)

(declare-fun res!535770 () Bool)

(assert (=> b!791024 (=> (not res!535770) (not e!439702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791024 (= res!535770 (validKeyInArray!0 (select (arr!20527 a!3186) j!159)))))

(declare-fun b!791025 () Bool)

(declare-fun res!535769 () Bool)

(declare-fun e!439700 () Bool)

(assert (=> b!791025 (=> (not res!535769) (not e!439700))))

(assert (=> b!791025 (= res!535769 e!439701)))

(declare-fun c!88043 () Bool)

(assert (=> b!791025 (= c!88043 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791026 () Bool)

(assert (=> b!791026 (= e!439698 e!439700)))

(declare-fun res!535763 () Bool)

(assert (=> b!791026 (=> (not res!535763) (not e!439700))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791026 (= res!535763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353127))))

(assert (=> b!791026 (= lt!353127 (Intermediate!8083 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791027 () Bool)

(declare-fun res!535759 () Bool)

(assert (=> b!791027 (=> (not res!535759) (not e!439700))))

(assert (=> b!791027 (= res!535759 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20527 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42889 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!791028 (= e!439701 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) (Found!8083 j!159)))))

(declare-fun b!791029 () Bool)

(assert (=> b!791029 (= e!439696 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353122))))

(declare-fun b!791030 () Bool)

(declare-fun e!439695 () Bool)

(declare-fun lt!353125 () SeekEntryResult!8083)

(get-info :version)

(assert (=> b!791030 (= e!439695 (not ((_ is Intermediate!8083) lt!353125)))))

(assert (=> b!791030 e!439699))

(declare-fun res!535765 () Bool)

(assert (=> b!791030 (=> (not res!535765) (not e!439699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42889 (_ BitVec 32)) Bool)

(assert (=> b!791030 (= res!535765 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27397 0))(
  ( (Unit!27398) )
))
(declare-fun lt!353124 () Unit!27397)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27397)

(assert (=> b!791030 (= lt!353124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791031 () Bool)

(declare-fun res!535758 () Bool)

(assert (=> b!791031 (=> (not res!535758) (not e!439698))))

(assert (=> b!791031 (= res!535758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791032 () Bool)

(assert (=> b!791032 (= e!439700 e!439695)))

(declare-fun res!535764 () Bool)

(assert (=> b!791032 (=> (not res!535764) (not e!439695))))

(declare-fun lt!353128 () SeekEntryResult!8083)

(assert (=> b!791032 (= res!535764 (= lt!353128 lt!353125))))

(declare-fun lt!353123 () array!42889)

(declare-fun lt!353126 () (_ BitVec 64))

(assert (=> b!791032 (= lt!353125 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353126 lt!353123 mask!3328))))

(assert (=> b!791032 (= lt!353128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353126 mask!3328) lt!353126 lt!353123 mask!3328))))

(assert (=> b!791032 (= lt!353126 (select (store (arr!20527 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791032 (= lt!353123 (array!42890 (store (arr!20527 a!3186) i!1173 k0!2102) (size!20947 a!3186)))))

(declare-fun b!791033 () Bool)

(assert (=> b!791033 (= e!439702 e!439698)))

(declare-fun res!535762 () Bool)

(assert (=> b!791033 (=> (not res!535762) (not e!439698))))

(declare-fun lt!353121 () SeekEntryResult!8083)

(assert (=> b!791033 (= res!535762 (or (= lt!353121 (MissingZero!8083 i!1173)) (= lt!353121 (MissingVacant!8083 i!1173))))))

(assert (=> b!791033 (= lt!353121 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791034 () Bool)

(declare-fun res!535760 () Bool)

(assert (=> b!791034 (=> (not res!535760) (not e!439702))))

(assert (=> b!791034 (= res!535760 (validKeyInArray!0 k0!2102))))

(assert (= (and start!68032 res!535757) b!791023))

(assert (= (and b!791023 res!535768) b!791024))

(assert (= (and b!791024 res!535770) b!791034))

(assert (= (and b!791034 res!535760) b!791018))

(assert (= (and b!791018 res!535766) b!791033))

(assert (= (and b!791033 res!535762) b!791031))

(assert (= (and b!791031 res!535758) b!791020))

(assert (= (and b!791020 res!535761) b!791021))

(assert (= (and b!791021 res!535767) b!791026))

(assert (= (and b!791026 res!535763) b!791027))

(assert (= (and b!791027 res!535759) b!791025))

(assert (= (and b!791025 c!88043) b!791022))

(assert (= (and b!791025 (not c!88043)) b!791028))

(assert (= (and b!791025 res!535769) b!791032))

(assert (= (and b!791032 res!535764) b!791030))

(assert (= (and b!791030 res!535765) b!791019))

(assert (= (and b!791019 res!535756) b!791029))

(declare-fun m!732371 () Bool)

(assert (=> b!791034 m!732371))

(declare-fun m!732373 () Bool)

(assert (=> b!791018 m!732373))

(declare-fun m!732375 () Bool)

(assert (=> b!791033 m!732375))

(declare-fun m!732377 () Bool)

(assert (=> start!68032 m!732377))

(declare-fun m!732379 () Bool)

(assert (=> start!68032 m!732379))

(declare-fun m!732381 () Bool)

(assert (=> b!791029 m!732381))

(assert (=> b!791029 m!732381))

(declare-fun m!732383 () Bool)

(assert (=> b!791029 m!732383))

(assert (=> b!791028 m!732381))

(assert (=> b!791028 m!732381))

(declare-fun m!732385 () Bool)

(assert (=> b!791028 m!732385))

(assert (=> b!791026 m!732381))

(assert (=> b!791026 m!732381))

(declare-fun m!732387 () Bool)

(assert (=> b!791026 m!732387))

(assert (=> b!791026 m!732387))

(assert (=> b!791026 m!732381))

(declare-fun m!732389 () Bool)

(assert (=> b!791026 m!732389))

(assert (=> b!791019 m!732381))

(assert (=> b!791019 m!732381))

(declare-fun m!732391 () Bool)

(assert (=> b!791019 m!732391))

(declare-fun m!732393 () Bool)

(assert (=> b!791027 m!732393))

(declare-fun m!732395 () Bool)

(assert (=> b!791031 m!732395))

(declare-fun m!732397 () Bool)

(assert (=> b!791020 m!732397))

(assert (=> b!791022 m!732381))

(assert (=> b!791022 m!732381))

(declare-fun m!732399 () Bool)

(assert (=> b!791022 m!732399))

(assert (=> b!791024 m!732381))

(assert (=> b!791024 m!732381))

(declare-fun m!732401 () Bool)

(assert (=> b!791024 m!732401))

(declare-fun m!732403 () Bool)

(assert (=> b!791030 m!732403))

(declare-fun m!732405 () Bool)

(assert (=> b!791030 m!732405))

(declare-fun m!732407 () Bool)

(assert (=> b!791032 m!732407))

(declare-fun m!732409 () Bool)

(assert (=> b!791032 m!732409))

(declare-fun m!732411 () Bool)

(assert (=> b!791032 m!732411))

(declare-fun m!732413 () Bool)

(assert (=> b!791032 m!732413))

(assert (=> b!791032 m!732407))

(declare-fun m!732415 () Bool)

(assert (=> b!791032 m!732415))

(check-sat (not b!791018) (not b!791034) (not b!791032) (not b!791030) (not b!791024) (not b!791033) (not b!791029) (not start!68032) (not b!791019) (not b!791031) (not b!791020) (not b!791028) (not b!791026) (not b!791022))
(check-sat)
(get-model)

(declare-fun d!103225 () Bool)

(declare-fun e!439762 () Bool)

(assert (=> d!103225 e!439762))

(declare-fun c!88056 () Bool)

(declare-fun lt!353181 () SeekEntryResult!8083)

(assert (=> d!103225 (= c!88056 (and ((_ is Intermediate!8083) lt!353181) (undefined!8895 lt!353181)))))

(declare-fun e!439765 () SeekEntryResult!8083)

(assert (=> d!103225 (= lt!353181 e!439765)))

(declare-fun c!88058 () Bool)

(assert (=> d!103225 (= c!88058 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!353182 () (_ BitVec 64))

(assert (=> d!103225 (= lt!353182 (select (arr!20527 lt!353123) index!1321))))

(assert (=> d!103225 (validMask!0 mask!3328)))

(assert (=> d!103225 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353126 lt!353123 mask!3328) lt!353181)))

(declare-fun b!791155 () Bool)

(declare-fun e!439763 () SeekEntryResult!8083)

(assert (=> b!791155 (= e!439765 e!439763)))

(declare-fun c!88057 () Bool)

(assert (=> b!791155 (= c!88057 (or (= lt!353182 lt!353126) (= (bvadd lt!353182 lt!353182) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791156 () Bool)

(assert (=> b!791156 (and (bvsge (index!34702 lt!353181) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353181) (size!20947 lt!353123)))))

(declare-fun res!535869 () Bool)

(assert (=> b!791156 (= res!535869 (= (select (arr!20527 lt!353123) (index!34702 lt!353181)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439764 () Bool)

(assert (=> b!791156 (=> res!535869 e!439764)))

(declare-fun b!791157 () Bool)

(assert (=> b!791157 (and (bvsge (index!34702 lt!353181) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353181) (size!20947 lt!353123)))))

(declare-fun res!535867 () Bool)

(assert (=> b!791157 (= res!535867 (= (select (arr!20527 lt!353123) (index!34702 lt!353181)) lt!353126))))

(assert (=> b!791157 (=> res!535867 e!439764)))

(declare-fun e!439761 () Bool)

(assert (=> b!791157 (= e!439761 e!439764)))

(declare-fun b!791158 () Bool)

(assert (=> b!791158 (= e!439763 (Intermediate!8083 false index!1321 x!1131))))

(declare-fun b!791159 () Bool)

(assert (=> b!791159 (= e!439762 e!439761)))

(declare-fun res!535868 () Bool)

(assert (=> b!791159 (= res!535868 (and ((_ is Intermediate!8083) lt!353181) (not (undefined!8895 lt!353181)) (bvslt (x!65795 lt!353181) #b01111111111111111111111111111110) (bvsge (x!65795 lt!353181) #b00000000000000000000000000000000) (bvsge (x!65795 lt!353181) x!1131)))))

(assert (=> b!791159 (=> (not res!535868) (not e!439761))))

(declare-fun b!791160 () Bool)

(assert (=> b!791160 (= e!439762 (bvsge (x!65795 lt!353181) #b01111111111111111111111111111110))))

(declare-fun b!791161 () Bool)

(assert (=> b!791161 (= e!439765 (Intermediate!8083 true index!1321 x!1131))))

(declare-fun b!791162 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791162 (= e!439763 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!353126 lt!353123 mask!3328))))

(declare-fun b!791163 () Bool)

(assert (=> b!791163 (and (bvsge (index!34702 lt!353181) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353181) (size!20947 lt!353123)))))

(assert (=> b!791163 (= e!439764 (= (select (arr!20527 lt!353123) (index!34702 lt!353181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103225 c!88058) b!791161))

(assert (= (and d!103225 (not c!88058)) b!791155))

(assert (= (and b!791155 c!88057) b!791158))

(assert (= (and b!791155 (not c!88057)) b!791162))

(assert (= (and d!103225 c!88056) b!791160))

(assert (= (and d!103225 (not c!88056)) b!791159))

(assert (= (and b!791159 res!535868) b!791157))

(assert (= (and b!791157 (not res!535867)) b!791156))

(assert (= (and b!791156 (not res!535869)) b!791163))

(declare-fun m!732509 () Bool)

(assert (=> b!791157 m!732509))

(declare-fun m!732511 () Bool)

(assert (=> b!791162 m!732511))

(assert (=> b!791162 m!732511))

(declare-fun m!732513 () Bool)

(assert (=> b!791162 m!732513))

(assert (=> b!791163 m!732509))

(assert (=> b!791156 m!732509))

(declare-fun m!732515 () Bool)

(assert (=> d!103225 m!732515))

(assert (=> d!103225 m!732377))

(assert (=> b!791032 d!103225))

(declare-fun d!103227 () Bool)

(declare-fun e!439767 () Bool)

(assert (=> d!103227 e!439767))

(declare-fun c!88059 () Bool)

(declare-fun lt!353183 () SeekEntryResult!8083)

(assert (=> d!103227 (= c!88059 (and ((_ is Intermediate!8083) lt!353183) (undefined!8895 lt!353183)))))

(declare-fun e!439770 () SeekEntryResult!8083)

(assert (=> d!103227 (= lt!353183 e!439770)))

(declare-fun c!88061 () Bool)

(assert (=> d!103227 (= c!88061 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!353184 () (_ BitVec 64))

(assert (=> d!103227 (= lt!353184 (select (arr!20527 lt!353123) (toIndex!0 lt!353126 mask!3328)))))

(assert (=> d!103227 (validMask!0 mask!3328)))

(assert (=> d!103227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353126 mask!3328) lt!353126 lt!353123 mask!3328) lt!353183)))

(declare-fun b!791164 () Bool)

(declare-fun e!439768 () SeekEntryResult!8083)

(assert (=> b!791164 (= e!439770 e!439768)))

(declare-fun c!88060 () Bool)

(assert (=> b!791164 (= c!88060 (or (= lt!353184 lt!353126) (= (bvadd lt!353184 lt!353184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791165 () Bool)

(assert (=> b!791165 (and (bvsge (index!34702 lt!353183) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353183) (size!20947 lt!353123)))))

(declare-fun res!535872 () Bool)

(assert (=> b!791165 (= res!535872 (= (select (arr!20527 lt!353123) (index!34702 lt!353183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439769 () Bool)

(assert (=> b!791165 (=> res!535872 e!439769)))

(declare-fun b!791166 () Bool)

(assert (=> b!791166 (and (bvsge (index!34702 lt!353183) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353183) (size!20947 lt!353123)))))

(declare-fun res!535870 () Bool)

(assert (=> b!791166 (= res!535870 (= (select (arr!20527 lt!353123) (index!34702 lt!353183)) lt!353126))))

(assert (=> b!791166 (=> res!535870 e!439769)))

(declare-fun e!439766 () Bool)

(assert (=> b!791166 (= e!439766 e!439769)))

(declare-fun b!791167 () Bool)

(assert (=> b!791167 (= e!439768 (Intermediate!8083 false (toIndex!0 lt!353126 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!791168 () Bool)

(assert (=> b!791168 (= e!439767 e!439766)))

(declare-fun res!535871 () Bool)

(assert (=> b!791168 (= res!535871 (and ((_ is Intermediate!8083) lt!353183) (not (undefined!8895 lt!353183)) (bvslt (x!65795 lt!353183) #b01111111111111111111111111111110) (bvsge (x!65795 lt!353183) #b00000000000000000000000000000000) (bvsge (x!65795 lt!353183) #b00000000000000000000000000000000)))))

(assert (=> b!791168 (=> (not res!535871) (not e!439766))))

(declare-fun b!791169 () Bool)

(assert (=> b!791169 (= e!439767 (bvsge (x!65795 lt!353183) #b01111111111111111111111111111110))))

(declare-fun b!791170 () Bool)

(assert (=> b!791170 (= e!439770 (Intermediate!8083 true (toIndex!0 lt!353126 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!791171 () Bool)

(assert (=> b!791171 (= e!439768 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!353126 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!353126 lt!353123 mask!3328))))

(declare-fun b!791172 () Bool)

(assert (=> b!791172 (and (bvsge (index!34702 lt!353183) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353183) (size!20947 lt!353123)))))

(assert (=> b!791172 (= e!439769 (= (select (arr!20527 lt!353123) (index!34702 lt!353183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103227 c!88061) b!791170))

(assert (= (and d!103227 (not c!88061)) b!791164))

(assert (= (and b!791164 c!88060) b!791167))

(assert (= (and b!791164 (not c!88060)) b!791171))

(assert (= (and d!103227 c!88059) b!791169))

(assert (= (and d!103227 (not c!88059)) b!791168))

(assert (= (and b!791168 res!535871) b!791166))

(assert (= (and b!791166 (not res!535870)) b!791165))

(assert (= (and b!791165 (not res!535872)) b!791172))

(declare-fun m!732517 () Bool)

(assert (=> b!791166 m!732517))

(assert (=> b!791171 m!732407))

(declare-fun m!732519 () Bool)

(assert (=> b!791171 m!732519))

(assert (=> b!791171 m!732519))

(declare-fun m!732521 () Bool)

(assert (=> b!791171 m!732521))

(assert (=> b!791172 m!732517))

(assert (=> b!791165 m!732517))

(assert (=> d!103227 m!732407))

(declare-fun m!732523 () Bool)

(assert (=> d!103227 m!732523))

(assert (=> d!103227 m!732377))

(assert (=> b!791032 d!103227))

(declare-fun d!103229 () Bool)

(declare-fun lt!353190 () (_ BitVec 32))

(declare-fun lt!353189 () (_ BitVec 32))

(assert (=> d!103229 (= lt!353190 (bvmul (bvxor lt!353189 (bvlshr lt!353189 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103229 (= lt!353189 ((_ extract 31 0) (bvand (bvxor lt!353126 (bvlshr lt!353126 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103229 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535873 (let ((h!15567 ((_ extract 31 0) (bvand (bvxor lt!353126 (bvlshr lt!353126 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65799 (bvmul (bvxor h!15567 (bvlshr h!15567 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65799 (bvlshr x!65799 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535873 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535873 #b00000000000000000000000000000000))))))

(assert (=> d!103229 (= (toIndex!0 lt!353126 mask!3328) (bvand (bvxor lt!353190 (bvlshr lt!353190 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!791032 d!103229))

(declare-fun d!103231 () Bool)

(declare-fun e!439772 () Bool)

(assert (=> d!103231 e!439772))

(declare-fun c!88062 () Bool)

(declare-fun lt!353191 () SeekEntryResult!8083)

(assert (=> d!103231 (= c!88062 (and ((_ is Intermediate!8083) lt!353191) (undefined!8895 lt!353191)))))

(declare-fun e!439775 () SeekEntryResult!8083)

(assert (=> d!103231 (= lt!353191 e!439775)))

(declare-fun c!88064 () Bool)

(assert (=> d!103231 (= c!88064 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!353192 () (_ BitVec 64))

(assert (=> d!103231 (= lt!353192 (select (arr!20527 a!3186) index!1321))))

(assert (=> d!103231 (validMask!0 mask!3328)))

(assert (=> d!103231 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353191)))

(declare-fun b!791173 () Bool)

(declare-fun e!439773 () SeekEntryResult!8083)

(assert (=> b!791173 (= e!439775 e!439773)))

(declare-fun c!88063 () Bool)

(assert (=> b!791173 (= c!88063 (or (= lt!353192 (select (arr!20527 a!3186) j!159)) (= (bvadd lt!353192 lt!353192) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791174 () Bool)

(assert (=> b!791174 (and (bvsge (index!34702 lt!353191) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353191) (size!20947 a!3186)))))

(declare-fun res!535876 () Bool)

(assert (=> b!791174 (= res!535876 (= (select (arr!20527 a!3186) (index!34702 lt!353191)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439774 () Bool)

(assert (=> b!791174 (=> res!535876 e!439774)))

(declare-fun b!791175 () Bool)

(assert (=> b!791175 (and (bvsge (index!34702 lt!353191) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353191) (size!20947 a!3186)))))

(declare-fun res!535874 () Bool)

(assert (=> b!791175 (= res!535874 (= (select (arr!20527 a!3186) (index!34702 lt!353191)) (select (arr!20527 a!3186) j!159)))))

(assert (=> b!791175 (=> res!535874 e!439774)))

(declare-fun e!439771 () Bool)

(assert (=> b!791175 (= e!439771 e!439774)))

(declare-fun b!791176 () Bool)

(assert (=> b!791176 (= e!439773 (Intermediate!8083 false index!1321 x!1131))))

(declare-fun b!791177 () Bool)

(assert (=> b!791177 (= e!439772 e!439771)))

(declare-fun res!535875 () Bool)

(assert (=> b!791177 (= res!535875 (and ((_ is Intermediate!8083) lt!353191) (not (undefined!8895 lt!353191)) (bvslt (x!65795 lt!353191) #b01111111111111111111111111111110) (bvsge (x!65795 lt!353191) #b00000000000000000000000000000000) (bvsge (x!65795 lt!353191) x!1131)))))

(assert (=> b!791177 (=> (not res!535875) (not e!439771))))

(declare-fun b!791178 () Bool)

(assert (=> b!791178 (= e!439772 (bvsge (x!65795 lt!353191) #b01111111111111111111111111111110))))

(declare-fun b!791179 () Bool)

(assert (=> b!791179 (= e!439775 (Intermediate!8083 true index!1321 x!1131))))

(declare-fun b!791180 () Bool)

(assert (=> b!791180 (= e!439773 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!791181 () Bool)

(assert (=> b!791181 (and (bvsge (index!34702 lt!353191) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353191) (size!20947 a!3186)))))

(assert (=> b!791181 (= e!439774 (= (select (arr!20527 a!3186) (index!34702 lt!353191)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103231 c!88064) b!791179))

(assert (= (and d!103231 (not c!88064)) b!791173))

(assert (= (and b!791173 c!88063) b!791176))

(assert (= (and b!791173 (not c!88063)) b!791180))

(assert (= (and d!103231 c!88062) b!791178))

(assert (= (and d!103231 (not c!88062)) b!791177))

(assert (= (and b!791177 res!535875) b!791175))

(assert (= (and b!791175 (not res!535874)) b!791174))

(assert (= (and b!791174 (not res!535876)) b!791181))

(declare-fun m!732525 () Bool)

(assert (=> b!791175 m!732525))

(assert (=> b!791180 m!732511))

(assert (=> b!791180 m!732511))

(assert (=> b!791180 m!732381))

(declare-fun m!732527 () Bool)

(assert (=> b!791180 m!732527))

(assert (=> b!791181 m!732525))

(assert (=> b!791174 m!732525))

(declare-fun m!732529 () Bool)

(assert (=> d!103231 m!732529))

(assert (=> d!103231 m!732377))

(assert (=> b!791022 d!103231))

(declare-fun bm!35325 () Bool)

(declare-fun call!35328 () Bool)

(declare-fun c!88067 () Bool)

(assert (=> bm!35325 (= call!35328 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88067 (Cons!14432 (select (arr!20527 a!3186) #b00000000000000000000000000000000) Nil!14433) Nil!14433)))))

(declare-fun b!791192 () Bool)

(declare-fun e!439786 () Bool)

(declare-fun e!439784 () Bool)

(assert (=> b!791192 (= e!439786 e!439784)))

(assert (=> b!791192 (= c!88067 (validKeyInArray!0 (select (arr!20527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!103233 () Bool)

(declare-fun res!535885 () Bool)

(declare-fun e!439785 () Bool)

(assert (=> d!103233 (=> res!535885 e!439785)))

(assert (=> d!103233 (= res!535885 (bvsge #b00000000000000000000000000000000 (size!20947 a!3186)))))

(assert (=> d!103233 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14433) e!439785)))

(declare-fun b!791193 () Bool)

(assert (=> b!791193 (= e!439785 e!439786)))

(declare-fun res!535883 () Bool)

(assert (=> b!791193 (=> (not res!535883) (not e!439786))))

(declare-fun e!439787 () Bool)

(assert (=> b!791193 (= res!535883 (not e!439787))))

(declare-fun res!535884 () Bool)

(assert (=> b!791193 (=> (not res!535884) (not e!439787))))

(assert (=> b!791193 (= res!535884 (validKeyInArray!0 (select (arr!20527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!791194 () Bool)

(assert (=> b!791194 (= e!439784 call!35328)))

(declare-fun b!791195 () Bool)

(declare-fun contains!4089 (List!14436 (_ BitVec 64)) Bool)

(assert (=> b!791195 (= e!439787 (contains!4089 Nil!14433 (select (arr!20527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!791196 () Bool)

(assert (=> b!791196 (= e!439784 call!35328)))

(assert (= (and d!103233 (not res!535885)) b!791193))

(assert (= (and b!791193 res!535884) b!791195))

(assert (= (and b!791193 res!535883) b!791192))

(assert (= (and b!791192 c!88067) b!791194))

(assert (= (and b!791192 (not c!88067)) b!791196))

(assert (= (or b!791194 b!791196) bm!35325))

(declare-fun m!732531 () Bool)

(assert (=> bm!35325 m!732531))

(declare-fun m!732533 () Bool)

(assert (=> bm!35325 m!732533))

(assert (=> b!791192 m!732531))

(assert (=> b!791192 m!732531))

(declare-fun m!732535 () Bool)

(assert (=> b!791192 m!732535))

(assert (=> b!791193 m!732531))

(assert (=> b!791193 m!732531))

(assert (=> b!791193 m!732535))

(assert (=> b!791195 m!732531))

(assert (=> b!791195 m!732531))

(declare-fun m!732537 () Bool)

(assert (=> b!791195 m!732537))

(assert (=> b!791020 d!103233))

(declare-fun b!791209 () Bool)

(declare-fun e!439796 () Bool)

(declare-fun call!35331 () Bool)

(assert (=> b!791209 (= e!439796 call!35331)))

(declare-fun b!791210 () Bool)

(declare-fun e!439798 () Bool)

(assert (=> b!791210 (= e!439796 e!439798)))

(declare-fun lt!353203 () (_ BitVec 64))

(assert (=> b!791210 (= lt!353203 (select (arr!20527 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!353204 () Unit!27397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42889 (_ BitVec 64) (_ BitVec 32)) Unit!27397)

(assert (=> b!791210 (= lt!353204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!353203 #b00000000000000000000000000000000))))

(assert (=> b!791210 (arrayContainsKey!0 a!3186 lt!353203 #b00000000000000000000000000000000)))

(declare-fun lt!353205 () Unit!27397)

(assert (=> b!791210 (= lt!353205 lt!353204)))

(declare-fun res!535890 () Bool)

(assert (=> b!791210 (= res!535890 (= (seekEntryOrOpen!0 (select (arr!20527 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8083 #b00000000000000000000000000000000)))))

(assert (=> b!791210 (=> (not res!535890) (not e!439798))))

(declare-fun d!103239 () Bool)

(declare-fun res!535891 () Bool)

(declare-fun e!439797 () Bool)

(assert (=> d!103239 (=> res!535891 e!439797)))

(assert (=> d!103239 (= res!535891 (bvsge #b00000000000000000000000000000000 (size!20947 a!3186)))))

(assert (=> d!103239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!439797)))

(declare-fun b!791211 () Bool)

(assert (=> b!791211 (= e!439797 e!439796)))

(declare-fun c!88072 () Bool)

(assert (=> b!791211 (= c!88072 (validKeyInArray!0 (select (arr!20527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!791212 () Bool)

(assert (=> b!791212 (= e!439798 call!35331)))

(declare-fun bm!35328 () Bool)

(assert (=> bm!35328 (= call!35331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!103239 (not res!535891)) b!791211))

(assert (= (and b!791211 c!88072) b!791210))

(assert (= (and b!791211 (not c!88072)) b!791209))

(assert (= (and b!791210 res!535890) b!791212))

(assert (= (or b!791212 b!791209) bm!35328))

(assert (=> b!791210 m!732531))

(declare-fun m!732539 () Bool)

(assert (=> b!791210 m!732539))

(declare-fun m!732541 () Bool)

(assert (=> b!791210 m!732541))

(assert (=> b!791210 m!732531))

(declare-fun m!732543 () Bool)

(assert (=> b!791210 m!732543))

(assert (=> b!791211 m!732531))

(assert (=> b!791211 m!732531))

(assert (=> b!791211 m!732535))

(declare-fun m!732545 () Bool)

(assert (=> bm!35328 m!732545))

(assert (=> b!791031 d!103239))

(declare-fun b!791269 () Bool)

(declare-fun e!439830 () SeekEntryResult!8083)

(assert (=> b!791269 (= e!439830 (MissingVacant!8083 resIntermediateIndex!5))))

(declare-fun b!791270 () Bool)

(declare-fun e!439831 () SeekEntryResult!8083)

(assert (=> b!791270 (= e!439831 (Found!8083 resIntermediateIndex!5))))

(declare-fun lt!353234 () SeekEntryResult!8083)

(declare-fun d!103241 () Bool)

(assert (=> d!103241 (and (or ((_ is Undefined!8083) lt!353234) (not ((_ is Found!8083) lt!353234)) (and (bvsge (index!34701 lt!353234) #b00000000000000000000000000000000) (bvslt (index!34701 lt!353234) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353234) ((_ is Found!8083) lt!353234) (not ((_ is MissingVacant!8083) lt!353234)) (not (= (index!34703 lt!353234) resIntermediateIndex!5)) (and (bvsge (index!34703 lt!353234) #b00000000000000000000000000000000) (bvslt (index!34703 lt!353234) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353234) (ite ((_ is Found!8083) lt!353234) (= (select (arr!20527 a!3186) (index!34701 lt!353234)) (select (arr!20527 a!3186) j!159)) (and ((_ is MissingVacant!8083) lt!353234) (= (index!34703 lt!353234) resIntermediateIndex!5) (= (select (arr!20527 a!3186) (index!34703 lt!353234)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!439832 () SeekEntryResult!8083)

(assert (=> d!103241 (= lt!353234 e!439832)))

(declare-fun c!88100 () Bool)

(assert (=> d!103241 (= c!88100 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!353233 () (_ BitVec 64))

(assert (=> d!103241 (= lt!353233 (select (arr!20527 a!3186) resIntermediateIndex!5))))

(assert (=> d!103241 (validMask!0 mask!3328)))

(assert (=> d!103241 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353234)))

(declare-fun b!791271 () Bool)

(assert (=> b!791271 (= e!439832 Undefined!8083)))

(declare-fun b!791272 () Bool)

(declare-fun c!88099 () Bool)

(assert (=> b!791272 (= c!88099 (= lt!353233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!791272 (= e!439831 e!439830)))

(declare-fun b!791273 () Bool)

(assert (=> b!791273 (= e!439830 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!791274 () Bool)

(assert (=> b!791274 (= e!439832 e!439831)))

(declare-fun c!88098 () Bool)

(assert (=> b!791274 (= c!88098 (= lt!353233 (select (arr!20527 a!3186) j!159)))))

(assert (= (and d!103241 c!88100) b!791271))

(assert (= (and d!103241 (not c!88100)) b!791274))

(assert (= (and b!791274 c!88098) b!791270))

(assert (= (and b!791274 (not c!88098)) b!791272))

(assert (= (and b!791272 c!88099) b!791269))

(assert (= (and b!791272 (not c!88099)) b!791273))

(declare-fun m!732583 () Bool)

(assert (=> d!103241 m!732583))

(declare-fun m!732585 () Bool)

(assert (=> d!103241 m!732585))

(assert (=> d!103241 m!732393))

(assert (=> d!103241 m!732377))

(declare-fun m!732587 () Bool)

(assert (=> b!791273 m!732587))

(assert (=> b!791273 m!732587))

(assert (=> b!791273 m!732381))

(declare-fun m!732589 () Bool)

(assert (=> b!791273 m!732589))

(assert (=> b!791029 d!103241))

(declare-fun b!791275 () Bool)

(declare-fun e!439833 () Bool)

(declare-fun call!35335 () Bool)

(assert (=> b!791275 (= e!439833 call!35335)))

(declare-fun b!791276 () Bool)

(declare-fun e!439835 () Bool)

(assert (=> b!791276 (= e!439833 e!439835)))

(declare-fun lt!353235 () (_ BitVec 64))

(assert (=> b!791276 (= lt!353235 (select (arr!20527 a!3186) j!159))))

(declare-fun lt!353236 () Unit!27397)

(assert (=> b!791276 (= lt!353236 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!353235 j!159))))

(assert (=> b!791276 (arrayContainsKey!0 a!3186 lt!353235 #b00000000000000000000000000000000)))

(declare-fun lt!353237 () Unit!27397)

(assert (=> b!791276 (= lt!353237 lt!353236)))

(declare-fun res!535898 () Bool)

(assert (=> b!791276 (= res!535898 (= (seekEntryOrOpen!0 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) (Found!8083 j!159)))))

(assert (=> b!791276 (=> (not res!535898) (not e!439835))))

(declare-fun d!103249 () Bool)

(declare-fun res!535899 () Bool)

(declare-fun e!439834 () Bool)

(assert (=> d!103249 (=> res!535899 e!439834)))

(assert (=> d!103249 (= res!535899 (bvsge j!159 (size!20947 a!3186)))))

(assert (=> d!103249 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!439834)))

(declare-fun b!791277 () Bool)

(assert (=> b!791277 (= e!439834 e!439833)))

(declare-fun c!88101 () Bool)

(assert (=> b!791277 (= c!88101 (validKeyInArray!0 (select (arr!20527 a!3186) j!159)))))

(declare-fun b!791278 () Bool)

(assert (=> b!791278 (= e!439835 call!35335)))

(declare-fun bm!35332 () Bool)

(assert (=> bm!35332 (= call!35335 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!103249 (not res!535899)) b!791277))

(assert (= (and b!791277 c!88101) b!791276))

(assert (= (and b!791277 (not c!88101)) b!791275))

(assert (= (and b!791276 res!535898) b!791278))

(assert (= (or b!791278 b!791275) bm!35332))

(assert (=> b!791276 m!732381))

(declare-fun m!732591 () Bool)

(assert (=> b!791276 m!732591))

(declare-fun m!732593 () Bool)

(assert (=> b!791276 m!732593))

(assert (=> b!791276 m!732381))

(assert (=> b!791276 m!732391))

(assert (=> b!791277 m!732381))

(assert (=> b!791277 m!732381))

(assert (=> b!791277 m!732401))

(declare-fun m!732595 () Bool)

(assert (=> bm!35332 m!732595))

(assert (=> b!791030 d!103249))

(declare-fun d!103251 () Bool)

(assert (=> d!103251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!353244 () Unit!27397)

(declare-fun choose!38 (array!42889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27397)

(assert (=> d!103251 (= lt!353244 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!103251 (validMask!0 mask!3328)))

(assert (=> d!103251 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!353244)))

(declare-fun bs!21878 () Bool)

(assert (= bs!21878 d!103251))

(assert (=> bs!21878 m!732403))

(declare-fun m!732597 () Bool)

(assert (=> bs!21878 m!732597))

(assert (=> bs!21878 m!732377))

(assert (=> b!791030 d!103251))

(declare-fun b!791336 () Bool)

(declare-fun e!439866 () SeekEntryResult!8083)

(assert (=> b!791336 (= e!439866 Undefined!8083)))

(declare-fun b!791337 () Bool)

(declare-fun e!439867 () SeekEntryResult!8083)

(declare-fun lt!353260 () SeekEntryResult!8083)

(assert (=> b!791337 (= e!439867 (MissingZero!8083 (index!34702 lt!353260)))))

(declare-fun b!791338 () Bool)

(declare-fun c!88127 () Bool)

(declare-fun lt!353261 () (_ BitVec 64))

(assert (=> b!791338 (= c!88127 (= lt!353261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439868 () SeekEntryResult!8083)

(assert (=> b!791338 (= e!439868 e!439867)))

(declare-fun d!103253 () Bool)

(declare-fun lt!353259 () SeekEntryResult!8083)

(assert (=> d!103253 (and (or ((_ is Undefined!8083) lt!353259) (not ((_ is Found!8083) lt!353259)) (and (bvsge (index!34701 lt!353259) #b00000000000000000000000000000000) (bvslt (index!34701 lt!353259) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353259) ((_ is Found!8083) lt!353259) (not ((_ is MissingZero!8083) lt!353259)) (and (bvsge (index!34700 lt!353259) #b00000000000000000000000000000000) (bvslt (index!34700 lt!353259) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353259) ((_ is Found!8083) lt!353259) ((_ is MissingZero!8083) lt!353259) (not ((_ is MissingVacant!8083) lt!353259)) (and (bvsge (index!34703 lt!353259) #b00000000000000000000000000000000) (bvslt (index!34703 lt!353259) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353259) (ite ((_ is Found!8083) lt!353259) (= (select (arr!20527 a!3186) (index!34701 lt!353259)) (select (arr!20527 a!3186) j!159)) (ite ((_ is MissingZero!8083) lt!353259) (= (select (arr!20527 a!3186) (index!34700 lt!353259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8083) lt!353259) (= (select (arr!20527 a!3186) (index!34703 lt!353259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103253 (= lt!353259 e!439866)))

(declare-fun c!88126 () Bool)

(assert (=> d!103253 (= c!88126 (and ((_ is Intermediate!8083) lt!353260) (undefined!8895 lt!353260)))))

(assert (=> d!103253 (= lt!353260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!103253 (validMask!0 mask!3328)))

(assert (=> d!103253 (= (seekEntryOrOpen!0 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353259)))

(declare-fun b!791339 () Bool)

(assert (=> b!791339 (= e!439868 (Found!8083 (index!34702 lt!353260)))))

(declare-fun b!791340 () Bool)

(assert (=> b!791340 (= e!439867 (seekKeyOrZeroReturnVacant!0 (x!65795 lt!353260) (index!34702 lt!353260) (index!34702 lt!353260) (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!791341 () Bool)

(assert (=> b!791341 (= e!439866 e!439868)))

(assert (=> b!791341 (= lt!353261 (select (arr!20527 a!3186) (index!34702 lt!353260)))))

(declare-fun c!88128 () Bool)

(assert (=> b!791341 (= c!88128 (= lt!353261 (select (arr!20527 a!3186) j!159)))))

(assert (= (and d!103253 c!88126) b!791336))

(assert (= (and d!103253 (not c!88126)) b!791341))

(assert (= (and b!791341 c!88128) b!791339))

(assert (= (and b!791341 (not c!88128)) b!791338))

(assert (= (and b!791338 c!88127) b!791337))

(assert (= (and b!791338 (not c!88127)) b!791340))

(assert (=> d!103253 m!732381))

(assert (=> d!103253 m!732387))

(assert (=> d!103253 m!732377))

(declare-fun m!732617 () Bool)

(assert (=> d!103253 m!732617))

(assert (=> d!103253 m!732387))

(assert (=> d!103253 m!732381))

(assert (=> d!103253 m!732389))

(declare-fun m!732619 () Bool)

(assert (=> d!103253 m!732619))

(declare-fun m!732621 () Bool)

(assert (=> d!103253 m!732621))

(assert (=> b!791340 m!732381))

(declare-fun m!732623 () Bool)

(assert (=> b!791340 m!732623))

(declare-fun m!732625 () Bool)

(assert (=> b!791341 m!732625))

(assert (=> b!791019 d!103253))

(declare-fun b!791342 () Bool)

(declare-fun e!439869 () SeekEntryResult!8083)

(assert (=> b!791342 (= e!439869 (MissingVacant!8083 resIntermediateIndex!5))))

(declare-fun b!791343 () Bool)

(declare-fun e!439870 () SeekEntryResult!8083)

(assert (=> b!791343 (= e!439870 (Found!8083 index!1321))))

(declare-fun d!103265 () Bool)

(declare-fun lt!353263 () SeekEntryResult!8083)

(assert (=> d!103265 (and (or ((_ is Undefined!8083) lt!353263) (not ((_ is Found!8083) lt!353263)) (and (bvsge (index!34701 lt!353263) #b00000000000000000000000000000000) (bvslt (index!34701 lt!353263) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353263) ((_ is Found!8083) lt!353263) (not ((_ is MissingVacant!8083) lt!353263)) (not (= (index!34703 lt!353263) resIntermediateIndex!5)) (and (bvsge (index!34703 lt!353263) #b00000000000000000000000000000000) (bvslt (index!34703 lt!353263) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353263) (ite ((_ is Found!8083) lt!353263) (= (select (arr!20527 a!3186) (index!34701 lt!353263)) (select (arr!20527 a!3186) j!159)) (and ((_ is MissingVacant!8083) lt!353263) (= (index!34703 lt!353263) resIntermediateIndex!5) (= (select (arr!20527 a!3186) (index!34703 lt!353263)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!439871 () SeekEntryResult!8083)

(assert (=> d!103265 (= lt!353263 e!439871)))

(declare-fun c!88131 () Bool)

(assert (=> d!103265 (= c!88131 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!353262 () (_ BitVec 64))

(assert (=> d!103265 (= lt!353262 (select (arr!20527 a!3186) index!1321))))

(assert (=> d!103265 (validMask!0 mask!3328)))

(assert (=> d!103265 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353263)))

(declare-fun b!791344 () Bool)

(assert (=> b!791344 (= e!439871 Undefined!8083)))

(declare-fun b!791345 () Bool)

(declare-fun c!88130 () Bool)

(assert (=> b!791345 (= c!88130 (= lt!353262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!791345 (= e!439870 e!439869)))

(declare-fun b!791346 () Bool)

(assert (=> b!791346 (= e!439869 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!791347 () Bool)

(assert (=> b!791347 (= e!439871 e!439870)))

(declare-fun c!88129 () Bool)

(assert (=> b!791347 (= c!88129 (= lt!353262 (select (arr!20527 a!3186) j!159)))))

(assert (= (and d!103265 c!88131) b!791344))

(assert (= (and d!103265 (not c!88131)) b!791347))

(assert (= (and b!791347 c!88129) b!791343))

(assert (= (and b!791347 (not c!88129)) b!791345))

(assert (= (and b!791345 c!88130) b!791342))

(assert (= (and b!791345 (not c!88130)) b!791346))

(declare-fun m!732627 () Bool)

(assert (=> d!103265 m!732627))

(declare-fun m!732629 () Bool)

(assert (=> d!103265 m!732629))

(assert (=> d!103265 m!732529))

(assert (=> d!103265 m!732377))

(assert (=> b!791346 m!732511))

(assert (=> b!791346 m!732511))

(assert (=> b!791346 m!732381))

(declare-fun m!732631 () Bool)

(assert (=> b!791346 m!732631))

(assert (=> b!791028 d!103265))

(declare-fun d!103267 () Bool)

(declare-fun res!535913 () Bool)

(declare-fun e!439876 () Bool)

(assert (=> d!103267 (=> res!535913 e!439876)))

(assert (=> d!103267 (= res!535913 (= (select (arr!20527 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!103267 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!439876)))

(declare-fun b!791352 () Bool)

(declare-fun e!439877 () Bool)

(assert (=> b!791352 (= e!439876 e!439877)))

(declare-fun res!535914 () Bool)

(assert (=> b!791352 (=> (not res!535914) (not e!439877))))

(assert (=> b!791352 (= res!535914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20947 a!3186)))))

(declare-fun b!791353 () Bool)

(assert (=> b!791353 (= e!439877 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103267 (not res!535913)) b!791352))

(assert (= (and b!791352 res!535914) b!791353))

(assert (=> d!103267 m!732531))

(declare-fun m!732633 () Bool)

(assert (=> b!791353 m!732633))

(assert (=> b!791018 d!103267))

(declare-fun d!103269 () Bool)

(declare-fun e!439879 () Bool)

(assert (=> d!103269 e!439879))

(declare-fun c!88132 () Bool)

(declare-fun lt!353264 () SeekEntryResult!8083)

(assert (=> d!103269 (= c!88132 (and ((_ is Intermediate!8083) lt!353264) (undefined!8895 lt!353264)))))

(declare-fun e!439882 () SeekEntryResult!8083)

(assert (=> d!103269 (= lt!353264 e!439882)))

(declare-fun c!88134 () Bool)

(assert (=> d!103269 (= c!88134 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!353265 () (_ BitVec 64))

(assert (=> d!103269 (= lt!353265 (select (arr!20527 a!3186) (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328)))))

(assert (=> d!103269 (validMask!0 mask!3328)))

(assert (=> d!103269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!353264)))

(declare-fun b!791354 () Bool)

(declare-fun e!439880 () SeekEntryResult!8083)

(assert (=> b!791354 (= e!439882 e!439880)))

(declare-fun c!88133 () Bool)

(assert (=> b!791354 (= c!88133 (or (= lt!353265 (select (arr!20527 a!3186) j!159)) (= (bvadd lt!353265 lt!353265) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791355 () Bool)

(assert (=> b!791355 (and (bvsge (index!34702 lt!353264) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353264) (size!20947 a!3186)))))

(declare-fun res!535917 () Bool)

(assert (=> b!791355 (= res!535917 (= (select (arr!20527 a!3186) (index!34702 lt!353264)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439881 () Bool)

(assert (=> b!791355 (=> res!535917 e!439881)))

(declare-fun b!791356 () Bool)

(assert (=> b!791356 (and (bvsge (index!34702 lt!353264) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353264) (size!20947 a!3186)))))

(declare-fun res!535915 () Bool)

(assert (=> b!791356 (= res!535915 (= (select (arr!20527 a!3186) (index!34702 lt!353264)) (select (arr!20527 a!3186) j!159)))))

(assert (=> b!791356 (=> res!535915 e!439881)))

(declare-fun e!439878 () Bool)

(assert (=> b!791356 (= e!439878 e!439881)))

(declare-fun b!791357 () Bool)

(assert (=> b!791357 (= e!439880 (Intermediate!8083 false (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!791358 () Bool)

(assert (=> b!791358 (= e!439879 e!439878)))

(declare-fun res!535916 () Bool)

(assert (=> b!791358 (= res!535916 (and ((_ is Intermediate!8083) lt!353264) (not (undefined!8895 lt!353264)) (bvslt (x!65795 lt!353264) #b01111111111111111111111111111110) (bvsge (x!65795 lt!353264) #b00000000000000000000000000000000) (bvsge (x!65795 lt!353264) #b00000000000000000000000000000000)))))

(assert (=> b!791358 (=> (not res!535916) (not e!439878))))

(declare-fun b!791359 () Bool)

(assert (=> b!791359 (= e!439879 (bvsge (x!65795 lt!353264) #b01111111111111111111111111111110))))

(declare-fun b!791360 () Bool)

(assert (=> b!791360 (= e!439882 (Intermediate!8083 true (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!791361 () Bool)

(assert (=> b!791361 (= e!439880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!791362 () Bool)

(assert (=> b!791362 (and (bvsge (index!34702 lt!353264) #b00000000000000000000000000000000) (bvslt (index!34702 lt!353264) (size!20947 a!3186)))))

(assert (=> b!791362 (= e!439881 (= (select (arr!20527 a!3186) (index!34702 lt!353264)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103269 c!88134) b!791360))

(assert (= (and d!103269 (not c!88134)) b!791354))

(assert (= (and b!791354 c!88133) b!791357))

(assert (= (and b!791354 (not c!88133)) b!791361))

(assert (= (and d!103269 c!88132) b!791359))

(assert (= (and d!103269 (not c!88132)) b!791358))

(assert (= (and b!791358 res!535916) b!791356))

(assert (= (and b!791356 (not res!535915)) b!791355))

(assert (= (and b!791355 (not res!535917)) b!791362))

(declare-fun m!732635 () Bool)

(assert (=> b!791356 m!732635))

(assert (=> b!791361 m!732387))

(declare-fun m!732637 () Bool)

(assert (=> b!791361 m!732637))

(assert (=> b!791361 m!732637))

(assert (=> b!791361 m!732381))

(declare-fun m!732639 () Bool)

(assert (=> b!791361 m!732639))

(assert (=> b!791362 m!732635))

(assert (=> b!791355 m!732635))

(assert (=> d!103269 m!732387))

(declare-fun m!732641 () Bool)

(assert (=> d!103269 m!732641))

(assert (=> d!103269 m!732377))

(assert (=> b!791026 d!103269))

(declare-fun d!103271 () Bool)

(declare-fun lt!353271 () (_ BitVec 32))

(declare-fun lt!353270 () (_ BitVec 32))

(assert (=> d!103271 (= lt!353271 (bvmul (bvxor lt!353270 (bvlshr lt!353270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!103271 (= lt!353270 ((_ extract 31 0) (bvand (bvxor (select (arr!20527 a!3186) j!159) (bvlshr (select (arr!20527 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!103271 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535873 (let ((h!15567 ((_ extract 31 0) (bvand (bvxor (select (arr!20527 a!3186) j!159) (bvlshr (select (arr!20527 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65799 (bvmul (bvxor h!15567 (bvlshr h!15567 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65799 (bvlshr x!65799 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535873 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535873 #b00000000000000000000000000000000))))))

(assert (=> d!103271 (= (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (bvand (bvxor lt!353271 (bvlshr lt!353271 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!791026 d!103271))

(declare-fun d!103273 () Bool)

(assert (=> d!103273 (= (validKeyInArray!0 (select (arr!20527 a!3186) j!159)) (and (not (= (select (arr!20527 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20527 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791024 d!103273))

(declare-fun d!103275 () Bool)

(assert (=> d!103275 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!68032 d!103275))

(declare-fun d!103285 () Bool)

(assert (=> d!103285 (= (array_inv!16386 a!3186) (bvsge (size!20947 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!68032 d!103285))

(declare-fun b!791417 () Bool)

(declare-fun e!439912 () SeekEntryResult!8083)

(assert (=> b!791417 (= e!439912 Undefined!8083)))

(declare-fun b!791418 () Bool)

(declare-fun e!439913 () SeekEntryResult!8083)

(declare-fun lt!353289 () SeekEntryResult!8083)

(assert (=> b!791418 (= e!439913 (MissingZero!8083 (index!34702 lt!353289)))))

(declare-fun b!791419 () Bool)

(declare-fun c!88157 () Bool)

(declare-fun lt!353290 () (_ BitVec 64))

(assert (=> b!791419 (= c!88157 (= lt!353290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439914 () SeekEntryResult!8083)

(assert (=> b!791419 (= e!439914 e!439913)))

(declare-fun d!103289 () Bool)

(declare-fun lt!353288 () SeekEntryResult!8083)

(assert (=> d!103289 (and (or ((_ is Undefined!8083) lt!353288) (not ((_ is Found!8083) lt!353288)) (and (bvsge (index!34701 lt!353288) #b00000000000000000000000000000000) (bvslt (index!34701 lt!353288) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353288) ((_ is Found!8083) lt!353288) (not ((_ is MissingZero!8083) lt!353288)) (and (bvsge (index!34700 lt!353288) #b00000000000000000000000000000000) (bvslt (index!34700 lt!353288) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353288) ((_ is Found!8083) lt!353288) ((_ is MissingZero!8083) lt!353288) (not ((_ is MissingVacant!8083) lt!353288)) (and (bvsge (index!34703 lt!353288) #b00000000000000000000000000000000) (bvslt (index!34703 lt!353288) (size!20947 a!3186)))) (or ((_ is Undefined!8083) lt!353288) (ite ((_ is Found!8083) lt!353288) (= (select (arr!20527 a!3186) (index!34701 lt!353288)) k0!2102) (ite ((_ is MissingZero!8083) lt!353288) (= (select (arr!20527 a!3186) (index!34700 lt!353288)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8083) lt!353288) (= (select (arr!20527 a!3186) (index!34703 lt!353288)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103289 (= lt!353288 e!439912)))

(declare-fun c!88156 () Bool)

(assert (=> d!103289 (= c!88156 (and ((_ is Intermediate!8083) lt!353289) (undefined!8895 lt!353289)))))

(assert (=> d!103289 (= lt!353289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!103289 (validMask!0 mask!3328)))

(assert (=> d!103289 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!353288)))

(declare-fun b!791420 () Bool)

(assert (=> b!791420 (= e!439914 (Found!8083 (index!34702 lt!353289)))))

(declare-fun b!791421 () Bool)

(assert (=> b!791421 (= e!439913 (seekKeyOrZeroReturnVacant!0 (x!65795 lt!353289) (index!34702 lt!353289) (index!34702 lt!353289) k0!2102 a!3186 mask!3328))))

(declare-fun b!791422 () Bool)

(assert (=> b!791422 (= e!439912 e!439914)))

(assert (=> b!791422 (= lt!353290 (select (arr!20527 a!3186) (index!34702 lt!353289)))))

(declare-fun c!88158 () Bool)

(assert (=> b!791422 (= c!88158 (= lt!353290 k0!2102))))

(assert (= (and d!103289 c!88156) b!791417))

(assert (= (and d!103289 (not c!88156)) b!791422))

(assert (= (and b!791422 c!88158) b!791420))

(assert (= (and b!791422 (not c!88158)) b!791419))

(assert (= (and b!791419 c!88157) b!791418))

(assert (= (and b!791419 (not c!88157)) b!791421))

(declare-fun m!732667 () Bool)

(assert (=> d!103289 m!732667))

(assert (=> d!103289 m!732377))

(declare-fun m!732669 () Bool)

(assert (=> d!103289 m!732669))

(assert (=> d!103289 m!732667))

(declare-fun m!732671 () Bool)

(assert (=> d!103289 m!732671))

(declare-fun m!732673 () Bool)

(assert (=> d!103289 m!732673))

(declare-fun m!732675 () Bool)

(assert (=> d!103289 m!732675))

(declare-fun m!732677 () Bool)

(assert (=> b!791421 m!732677))

(declare-fun m!732679 () Bool)

(assert (=> b!791422 m!732679))

(assert (=> b!791033 d!103289))

(declare-fun d!103291 () Bool)

(assert (=> d!103291 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!791034 d!103291))

(check-sat (not bm!35332) (not bm!35328) (not b!791421) (not d!103231) (not b!791361) (not b!791277) (not d!103265) (not b!791346) (not d!103251) (not b!791192) (not d!103227) (not b!791273) (not b!791211) (not b!791195) (not d!103225) (not b!791353) (not d!103269) (not d!103253) (not b!791210) (not bm!35325) (not b!791193) (not b!791340) (not d!103289) (not b!791276) (not d!103241) (not b!791171) (not b!791180) (not b!791162))
(check-sat)
