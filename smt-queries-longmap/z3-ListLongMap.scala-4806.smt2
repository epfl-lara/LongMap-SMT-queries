; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66024 () Bool)

(assert start!66024)

(declare-datatypes ((array!42072 0))(
  ( (array!42073 (arr!20147 (Array (_ BitVec 32) (_ BitVec 64))) (size!20568 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42072)

(declare-fun e!424088 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7744 0))(
  ( (MissingZero!7744 (index!33344 (_ BitVec 32))) (Found!7744 (index!33345 (_ BitVec 32))) (Intermediate!7744 (undefined!8556 Bool) (index!33346 (_ BitVec 32)) (x!64253 (_ BitVec 32))) (Undefined!7744) (MissingVacant!7744 (index!33347 (_ BitVec 32))) )
))
(declare-fun lt!338800 () SeekEntryResult!7744)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!760748 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42072 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!760748 (= e!424088 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338800))))

(declare-fun b!760750 () Bool)

(declare-fun e!424085 () Bool)

(declare-fun e!424091 () Bool)

(assert (=> b!760750 (= e!424085 e!424091)))

(declare-fun res!514626 () Bool)

(assert (=> b!760750 (=> (not res!514626) (not e!424091))))

(declare-fun lt!338803 () SeekEntryResult!7744)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42072 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!760750 (= res!514626 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338803))))

(assert (=> b!760750 (= lt!338803 (Found!7744 j!159))))

(declare-fun b!760751 () Bool)

(declare-fun res!514622 () Bool)

(declare-fun e!424087 () Bool)

(assert (=> b!760751 (=> (not res!514622) (not e!424087))))

(declare-datatypes ((List!14188 0))(
  ( (Nil!14185) (Cons!14184 (h!15262 (_ BitVec 64)) (t!20494 List!14188)) )
))
(declare-fun arrayNoDuplicates!0 (array!42072 (_ BitVec 32) List!14188) Bool)

(assert (=> b!760751 (= res!514622 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14185))))

(declare-fun b!760752 () Bool)

(declare-fun res!514617 () Bool)

(assert (=> b!760752 (=> (not res!514617) (not e!424087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42072 (_ BitVec 32)) Bool)

(assert (=> b!760752 (= res!514617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760753 () Bool)

(declare-fun res!514620 () Bool)

(declare-fun e!424090 () Bool)

(assert (=> b!760753 (=> (not res!514620) (not e!424090))))

(assert (=> b!760753 (= res!514620 e!424088)))

(declare-fun c!83451 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760753 (= c!83451 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!760754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42072 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!760754 (= e!424091 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338803))))

(declare-fun b!760755 () Bool)

(declare-fun res!514613 () Bool)

(assert (=> b!760755 (=> (not res!514613) (not e!424087))))

(assert (=> b!760755 (= res!514613 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20568 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20568 a!3186))))))

(declare-fun b!760756 () Bool)

(declare-fun e!424083 () Bool)

(assert (=> b!760756 (= e!424090 e!424083)))

(declare-fun res!514624 () Bool)

(assert (=> b!760756 (=> (not res!514624) (not e!424083))))

(declare-fun lt!338802 () SeekEntryResult!7744)

(declare-fun lt!338805 () SeekEntryResult!7744)

(assert (=> b!760756 (= res!514624 (= lt!338802 lt!338805))))

(declare-fun lt!338804 () array!42072)

(declare-fun lt!338807 () (_ BitVec 64))

(assert (=> b!760756 (= lt!338805 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338807 lt!338804 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760756 (= lt!338802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338807 mask!3328) lt!338807 lt!338804 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!760756 (= lt!338807 (select (store (arr!20147 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760756 (= lt!338804 (array!42073 (store (arr!20147 a!3186) i!1173 k0!2102) (size!20568 a!3186)))))

(declare-fun b!760757 () Bool)

(declare-fun res!514616 () Bool)

(declare-fun e!424086 () Bool)

(assert (=> b!760757 (=> (not res!514616) (not e!424086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760757 (= res!514616 (validKeyInArray!0 k0!2102))))

(declare-fun b!760758 () Bool)

(declare-fun res!514627 () Bool)

(assert (=> b!760758 (=> (not res!514627) (not e!424086))))

(assert (=> b!760758 (= res!514627 (validKeyInArray!0 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!760759 () Bool)

(declare-fun res!514619 () Bool)

(assert (=> b!760759 (=> (not res!514619) (not e!424086))))

(declare-fun arrayContainsKey!0 (array!42072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760759 (= res!514619 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!514621 () Bool)

(assert (=> start!66024 (=> (not res!514621) (not e!424086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66024 (= res!514621 (validMask!0 mask!3328))))

(assert (=> start!66024 e!424086))

(assert (=> start!66024 true))

(declare-fun array_inv!16030 (array!42072) Bool)

(assert (=> start!66024 (array_inv!16030 a!3186)))

(declare-fun b!760749 () Bool)

(declare-fun res!514618 () Bool)

(assert (=> b!760749 (=> (not res!514618) (not e!424086))))

(assert (=> b!760749 (= res!514618 (and (= (size!20568 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20568 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20568 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760760 () Bool)

(assert (=> b!760760 (= e!424088 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(declare-fun b!760761 () Bool)

(assert (=> b!760761 (= e!424087 e!424090)))

(declare-fun res!514615 () Bool)

(assert (=> b!760761 (=> (not res!514615) (not e!424090))))

(assert (=> b!760761 (= res!514615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338800))))

(assert (=> b!760761 (= lt!338800 (Intermediate!7744 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!424084 () Bool)

(declare-fun b!760762 () Bool)

(assert (=> b!760762 (= e!424084 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(declare-fun b!760763 () Bool)

(declare-fun res!514628 () Bool)

(assert (=> b!760763 (=> (not res!514628) (not e!424090))))

(assert (=> b!760763 (= res!514628 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20147 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760764 () Bool)

(assert (=> b!760764 (= e!424086 e!424087)))

(declare-fun res!514614 () Bool)

(assert (=> b!760764 (=> (not res!514614) (not e!424087))))

(declare-fun lt!338801 () SeekEntryResult!7744)

(assert (=> b!760764 (= res!514614 (or (= lt!338801 (MissingZero!7744 i!1173)) (= lt!338801 (MissingVacant!7744 i!1173))))))

(assert (=> b!760764 (= lt!338801 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!760765 () Bool)

(assert (=> b!760765 (= e!424083 (not e!424084))))

(declare-fun res!514623 () Bool)

(assert (=> b!760765 (=> res!514623 e!424084)))

(get-info :version)

(assert (=> b!760765 (= res!514623 (or (not ((_ is Intermediate!7744) lt!338805)) (bvslt x!1131 (x!64253 lt!338805)) (not (= x!1131 (x!64253 lt!338805))) (not (= index!1321 (index!33346 lt!338805)))))))

(assert (=> b!760765 e!424085))

(declare-fun res!514625 () Bool)

(assert (=> b!760765 (=> (not res!514625) (not e!424085))))

(assert (=> b!760765 (= res!514625 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26300 0))(
  ( (Unit!26301) )
))
(declare-fun lt!338806 () Unit!26300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26300)

(assert (=> b!760765 (= lt!338806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!66024 res!514621) b!760749))

(assert (= (and b!760749 res!514618) b!760758))

(assert (= (and b!760758 res!514627) b!760757))

(assert (= (and b!760757 res!514616) b!760759))

(assert (= (and b!760759 res!514619) b!760764))

(assert (= (and b!760764 res!514614) b!760752))

(assert (= (and b!760752 res!514617) b!760751))

(assert (= (and b!760751 res!514622) b!760755))

(assert (= (and b!760755 res!514613) b!760761))

(assert (= (and b!760761 res!514615) b!760763))

(assert (= (and b!760763 res!514628) b!760753))

(assert (= (and b!760753 c!83451) b!760748))

(assert (= (and b!760753 (not c!83451)) b!760760))

(assert (= (and b!760753 res!514620) b!760756))

(assert (= (and b!760756 res!514624) b!760765))

(assert (= (and b!760765 res!514625) b!760750))

(assert (= (and b!760750 res!514626) b!760754))

(assert (= (and b!760765 (not res!514623)) b!760762))

(declare-fun m!707347 () Bool)

(assert (=> b!760764 m!707347))

(declare-fun m!707349 () Bool)

(assert (=> b!760751 m!707349))

(declare-fun m!707351 () Bool)

(assert (=> b!760750 m!707351))

(assert (=> b!760750 m!707351))

(declare-fun m!707353 () Bool)

(assert (=> b!760750 m!707353))

(declare-fun m!707355 () Bool)

(assert (=> b!760752 m!707355))

(assert (=> b!760754 m!707351))

(assert (=> b!760754 m!707351))

(declare-fun m!707357 () Bool)

(assert (=> b!760754 m!707357))

(assert (=> b!760761 m!707351))

(assert (=> b!760761 m!707351))

(declare-fun m!707359 () Bool)

(assert (=> b!760761 m!707359))

(assert (=> b!760761 m!707359))

(assert (=> b!760761 m!707351))

(declare-fun m!707361 () Bool)

(assert (=> b!760761 m!707361))

(declare-fun m!707363 () Bool)

(assert (=> start!66024 m!707363))

(declare-fun m!707365 () Bool)

(assert (=> start!66024 m!707365))

(assert (=> b!760758 m!707351))

(assert (=> b!760758 m!707351))

(declare-fun m!707367 () Bool)

(assert (=> b!760758 m!707367))

(declare-fun m!707369 () Bool)

(assert (=> b!760756 m!707369))

(declare-fun m!707371 () Bool)

(assert (=> b!760756 m!707371))

(assert (=> b!760756 m!707369))

(declare-fun m!707373 () Bool)

(assert (=> b!760756 m!707373))

(declare-fun m!707375 () Bool)

(assert (=> b!760756 m!707375))

(declare-fun m!707377 () Bool)

(assert (=> b!760756 m!707377))

(assert (=> b!760762 m!707351))

(assert (=> b!760762 m!707351))

(declare-fun m!707379 () Bool)

(assert (=> b!760762 m!707379))

(declare-fun m!707381 () Bool)

(assert (=> b!760763 m!707381))

(declare-fun m!707383 () Bool)

(assert (=> b!760765 m!707383))

(declare-fun m!707385 () Bool)

(assert (=> b!760765 m!707385))

(declare-fun m!707387 () Bool)

(assert (=> b!760759 m!707387))

(assert (=> b!760748 m!707351))

(assert (=> b!760748 m!707351))

(declare-fun m!707389 () Bool)

(assert (=> b!760748 m!707389))

(declare-fun m!707391 () Bool)

(assert (=> b!760757 m!707391))

(assert (=> b!760760 m!707351))

(assert (=> b!760760 m!707351))

(assert (=> b!760760 m!707379))

(check-sat (not b!760765) (not b!760756) (not start!66024) (not b!760752) (not b!760760) (not b!760762) (not b!760751) (not b!760759) (not b!760758) (not b!760757) (not b!760754) (not b!760748) (not b!760764) (not b!760750) (not b!760761))
(check-sat)
(get-model)

(declare-fun d!100513 () Bool)

(declare-fun lt!338862 () SeekEntryResult!7744)

(assert (=> d!100513 (and (or ((_ is Undefined!7744) lt!338862) (not ((_ is Found!7744) lt!338862)) (and (bvsge (index!33345 lt!338862) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338862) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338862) ((_ is Found!7744) lt!338862) (not ((_ is MissingZero!7744) lt!338862)) (and (bvsge (index!33344 lt!338862) #b00000000000000000000000000000000) (bvslt (index!33344 lt!338862) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338862) ((_ is Found!7744) lt!338862) ((_ is MissingZero!7744) lt!338862) (not ((_ is MissingVacant!7744) lt!338862)) (and (bvsge (index!33347 lt!338862) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338862) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338862) (ite ((_ is Found!7744) lt!338862) (= (select (arr!20147 a!3186) (index!33345 lt!338862)) k0!2102) (ite ((_ is MissingZero!7744) lt!338862) (= (select (arr!20147 a!3186) (index!33344 lt!338862)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7744) lt!338862) (= (select (arr!20147 a!3186) (index!33347 lt!338862)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424154 () SeekEntryResult!7744)

(assert (=> d!100513 (= lt!338862 e!424154)))

(declare-fun c!83464 () Bool)

(declare-fun lt!338864 () SeekEntryResult!7744)

(assert (=> d!100513 (= c!83464 (and ((_ is Intermediate!7744) lt!338864) (undefined!8556 lt!338864)))))

(assert (=> d!100513 (= lt!338864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100513 (validMask!0 mask!3328)))

(assert (=> d!100513 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!338862)))

(declare-fun b!760886 () Bool)

(declare-fun e!424152 () SeekEntryResult!7744)

(assert (=> b!760886 (= e!424152 (Found!7744 (index!33346 lt!338864)))))

(declare-fun b!760887 () Bool)

(assert (=> b!760887 (= e!424154 Undefined!7744)))

(declare-fun b!760888 () Bool)

(declare-fun e!424153 () SeekEntryResult!7744)

(assert (=> b!760888 (= e!424153 (MissingZero!7744 (index!33346 lt!338864)))))

(declare-fun b!760889 () Bool)

(assert (=> b!760889 (= e!424154 e!424152)))

(declare-fun lt!338863 () (_ BitVec 64))

(assert (=> b!760889 (= lt!338863 (select (arr!20147 a!3186) (index!33346 lt!338864)))))

(declare-fun c!83465 () Bool)

(assert (=> b!760889 (= c!83465 (= lt!338863 k0!2102))))

(declare-fun b!760890 () Bool)

(declare-fun c!83466 () Bool)

(assert (=> b!760890 (= c!83466 (= lt!338863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760890 (= e!424152 e!424153)))

(declare-fun b!760891 () Bool)

(assert (=> b!760891 (= e!424153 (seekKeyOrZeroReturnVacant!0 (x!64253 lt!338864) (index!33346 lt!338864) (index!33346 lt!338864) k0!2102 a!3186 mask!3328))))

(assert (= (and d!100513 c!83464) b!760887))

(assert (= (and d!100513 (not c!83464)) b!760889))

(assert (= (and b!760889 c!83465) b!760886))

(assert (= (and b!760889 (not c!83465)) b!760890))

(assert (= (and b!760890 c!83466) b!760888))

(assert (= (and b!760890 (not c!83466)) b!760891))

(assert (=> d!100513 m!707363))

(declare-fun m!707485 () Bool)

(assert (=> d!100513 m!707485))

(declare-fun m!707487 () Bool)

(assert (=> d!100513 m!707487))

(declare-fun m!707489 () Bool)

(assert (=> d!100513 m!707489))

(declare-fun m!707491 () Bool)

(assert (=> d!100513 m!707491))

(assert (=> d!100513 m!707485))

(declare-fun m!707493 () Bool)

(assert (=> d!100513 m!707493))

(declare-fun m!707495 () Bool)

(assert (=> b!760889 m!707495))

(declare-fun m!707497 () Bool)

(assert (=> b!760891 m!707497))

(assert (=> b!760764 d!100513))

(declare-fun d!100515 () Bool)

(declare-fun lt!338869 () SeekEntryResult!7744)

(assert (=> d!100515 (and (or ((_ is Undefined!7744) lt!338869) (not ((_ is Found!7744) lt!338869)) (and (bvsge (index!33345 lt!338869) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338869) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338869) ((_ is Found!7744) lt!338869) (not ((_ is MissingVacant!7744) lt!338869)) (not (= (index!33347 lt!338869) resIntermediateIndex!5)) (and (bvsge (index!33347 lt!338869) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338869) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338869) (ite ((_ is Found!7744) lt!338869) (= (select (arr!20147 a!3186) (index!33345 lt!338869)) (select (arr!20147 a!3186) j!159)) (and ((_ is MissingVacant!7744) lt!338869) (= (index!33347 lt!338869) resIntermediateIndex!5) (= (select (arr!20147 a!3186) (index!33347 lt!338869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424161 () SeekEntryResult!7744)

(assert (=> d!100515 (= lt!338869 e!424161)))

(declare-fun c!83475 () Bool)

(assert (=> d!100515 (= c!83475 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!338870 () (_ BitVec 64))

(assert (=> d!100515 (= lt!338870 (select (arr!20147 a!3186) resIntermediateIndex!5))))

(assert (=> d!100515 (validMask!0 mask!3328)))

(assert (=> d!100515 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338869)))

(declare-fun b!760904 () Bool)

(declare-fun c!83473 () Bool)

(assert (=> b!760904 (= c!83473 (= lt!338870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424162 () SeekEntryResult!7744)

(declare-fun e!424163 () SeekEntryResult!7744)

(assert (=> b!760904 (= e!424162 e!424163)))

(declare-fun b!760905 () Bool)

(assert (=> b!760905 (= e!424162 (Found!7744 resIntermediateIndex!5))))

(declare-fun b!760906 () Bool)

(assert (=> b!760906 (= e!424161 e!424162)))

(declare-fun c!83474 () Bool)

(assert (=> b!760906 (= c!83474 (= lt!338870 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!760907 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760907 (= e!424163 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760908 () Bool)

(assert (=> b!760908 (= e!424161 Undefined!7744)))

(declare-fun b!760909 () Bool)

(assert (=> b!760909 (= e!424163 (MissingVacant!7744 resIntermediateIndex!5))))

(assert (= (and d!100515 c!83475) b!760908))

(assert (= (and d!100515 (not c!83475)) b!760906))

(assert (= (and b!760906 c!83474) b!760905))

(assert (= (and b!760906 (not c!83474)) b!760904))

(assert (= (and b!760904 c!83473) b!760909))

(assert (= (and b!760904 (not c!83473)) b!760907))

(declare-fun m!707499 () Bool)

(assert (=> d!100515 m!707499))

(declare-fun m!707501 () Bool)

(assert (=> d!100515 m!707501))

(assert (=> d!100515 m!707381))

(assert (=> d!100515 m!707363))

(declare-fun m!707503 () Bool)

(assert (=> b!760907 m!707503))

(assert (=> b!760907 m!707503))

(assert (=> b!760907 m!707351))

(declare-fun m!707505 () Bool)

(assert (=> b!760907 m!707505))

(assert (=> b!760754 d!100515))

(declare-fun b!760918 () Bool)

(declare-fun e!424170 () Bool)

(declare-fun e!424172 () Bool)

(assert (=> b!760918 (= e!424170 e!424172)))

(declare-fun lt!338878 () (_ BitVec 64))

(assert (=> b!760918 (= lt!338878 (select (arr!20147 a!3186) j!159))))

(declare-fun lt!338877 () Unit!26300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42072 (_ BitVec 64) (_ BitVec 32)) Unit!26300)

(assert (=> b!760918 (= lt!338877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338878 j!159))))

(assert (=> b!760918 (arrayContainsKey!0 a!3186 lt!338878 #b00000000000000000000000000000000)))

(declare-fun lt!338879 () Unit!26300)

(assert (=> b!760918 (= lt!338879 lt!338877)))

(declare-fun res!514729 () Bool)

(assert (=> b!760918 (= res!514729 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(assert (=> b!760918 (=> (not res!514729) (not e!424172))))

(declare-fun b!760919 () Bool)

(declare-fun call!34936 () Bool)

(assert (=> b!760919 (= e!424170 call!34936)))

(declare-fun b!760920 () Bool)

(declare-fun e!424171 () Bool)

(assert (=> b!760920 (= e!424171 e!424170)))

(declare-fun c!83478 () Bool)

(assert (=> b!760920 (= c!83478 (validKeyInArray!0 (select (arr!20147 a!3186) j!159)))))

(declare-fun d!100519 () Bool)

(declare-fun res!514730 () Bool)

(assert (=> d!100519 (=> res!514730 e!424171)))

(assert (=> d!100519 (= res!514730 (bvsge j!159 (size!20568 a!3186)))))

(assert (=> d!100519 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424171)))

(declare-fun bm!34933 () Bool)

(assert (=> bm!34933 (= call!34936 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760921 () Bool)

(assert (=> b!760921 (= e!424172 call!34936)))

(assert (= (and d!100519 (not res!514730)) b!760920))

(assert (= (and b!760920 c!83478) b!760918))

(assert (= (and b!760920 (not c!83478)) b!760919))

(assert (= (and b!760918 res!514729) b!760921))

(assert (= (or b!760921 b!760919) bm!34933))

(assert (=> b!760918 m!707351))

(declare-fun m!707507 () Bool)

(assert (=> b!760918 m!707507))

(declare-fun m!707509 () Bool)

(assert (=> b!760918 m!707509))

(assert (=> b!760918 m!707351))

(assert (=> b!760918 m!707353))

(assert (=> b!760920 m!707351))

(assert (=> b!760920 m!707351))

(assert (=> b!760920 m!707367))

(declare-fun m!707511 () Bool)

(assert (=> bm!34933 m!707511))

(assert (=> b!760765 d!100519))

(declare-fun d!100525 () Bool)

(assert (=> d!100525 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338888 () Unit!26300)

(declare-fun choose!38 (array!42072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26300)

(assert (=> d!100525 (= lt!338888 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100525 (validMask!0 mask!3328)))

(assert (=> d!100525 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338888)))

(declare-fun bs!21374 () Bool)

(assert (= bs!21374 d!100525))

(assert (=> bs!21374 m!707383))

(declare-fun m!707513 () Bool)

(assert (=> bs!21374 m!707513))

(assert (=> bs!21374 m!707363))

(assert (=> b!760765 d!100525))

(declare-fun b!760940 () Bool)

(declare-fun e!424182 () Bool)

(declare-fun e!424184 () Bool)

(assert (=> b!760940 (= e!424182 e!424184)))

(declare-fun lt!338893 () (_ BitVec 64))

(assert (=> b!760940 (= lt!338893 (select (arr!20147 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338892 () Unit!26300)

(assert (=> b!760940 (= lt!338892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338893 #b00000000000000000000000000000000))))

(assert (=> b!760940 (arrayContainsKey!0 a!3186 lt!338893 #b00000000000000000000000000000000)))

(declare-fun lt!338894 () Unit!26300)

(assert (=> b!760940 (= lt!338894 lt!338892)))

(declare-fun res!514731 () Bool)

(assert (=> b!760940 (= res!514731 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7744 #b00000000000000000000000000000000)))))

(assert (=> b!760940 (=> (not res!514731) (not e!424184))))

(declare-fun b!760941 () Bool)

(declare-fun call!34937 () Bool)

(assert (=> b!760941 (= e!424182 call!34937)))

(declare-fun b!760942 () Bool)

(declare-fun e!424183 () Bool)

(assert (=> b!760942 (= e!424183 e!424182)))

(declare-fun c!83488 () Bool)

(assert (=> b!760942 (= c!83488 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100527 () Bool)

(declare-fun res!514732 () Bool)

(assert (=> d!100527 (=> res!514732 e!424183)))

(assert (=> d!100527 (= res!514732 (bvsge #b00000000000000000000000000000000 (size!20568 a!3186)))))

(assert (=> d!100527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424183)))

(declare-fun bm!34934 () Bool)

(assert (=> bm!34934 (= call!34937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760943 () Bool)

(assert (=> b!760943 (= e!424184 call!34937)))

(assert (= (and d!100527 (not res!514732)) b!760942))

(assert (= (and b!760942 c!83488) b!760940))

(assert (= (and b!760942 (not c!83488)) b!760941))

(assert (= (and b!760940 res!514731) b!760943))

(assert (= (or b!760943 b!760941) bm!34934))

(declare-fun m!707515 () Bool)

(assert (=> b!760940 m!707515))

(declare-fun m!707517 () Bool)

(assert (=> b!760940 m!707517))

(declare-fun m!707519 () Bool)

(assert (=> b!760940 m!707519))

(assert (=> b!760940 m!707515))

(declare-fun m!707521 () Bool)

(assert (=> b!760940 m!707521))

(assert (=> b!760942 m!707515))

(assert (=> b!760942 m!707515))

(declare-fun m!707523 () Bool)

(assert (=> b!760942 m!707523))

(declare-fun m!707527 () Bool)

(assert (=> bm!34934 m!707527))

(assert (=> b!760752 d!100527))

(declare-fun b!760998 () Bool)

(declare-fun e!424216 () Bool)

(declare-fun e!424215 () Bool)

(assert (=> b!760998 (= e!424216 e!424215)))

(declare-fun res!514739 () Bool)

(declare-fun lt!338911 () SeekEntryResult!7744)

(assert (=> b!760998 (= res!514739 (and ((_ is Intermediate!7744) lt!338911) (not (undefined!8556 lt!338911)) (bvslt (x!64253 lt!338911) #b01111111111111111111111111111110) (bvsge (x!64253 lt!338911) #b00000000000000000000000000000000) (bvsge (x!64253 lt!338911) x!1131)))))

(assert (=> b!760998 (=> (not res!514739) (not e!424215))))

(declare-fun b!760999 () Bool)

(declare-fun e!424213 () SeekEntryResult!7744)

(declare-fun e!424214 () SeekEntryResult!7744)

(assert (=> b!760999 (= e!424213 e!424214)))

(declare-fun c!83515 () Bool)

(declare-fun lt!338912 () (_ BitVec 64))

(assert (=> b!760999 (= c!83515 (or (= lt!338912 lt!338807) (= (bvadd lt!338912 lt!338912) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100529 () Bool)

(assert (=> d!100529 e!424216))

(declare-fun c!83514 () Bool)

(assert (=> d!100529 (= c!83514 (and ((_ is Intermediate!7744) lt!338911) (undefined!8556 lt!338911)))))

(assert (=> d!100529 (= lt!338911 e!424213)))

(declare-fun c!83513 () Bool)

(assert (=> d!100529 (= c!83513 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100529 (= lt!338912 (select (arr!20147 lt!338804) index!1321))))

(assert (=> d!100529 (validMask!0 mask!3328)))

(assert (=> d!100529 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338807 lt!338804 mask!3328) lt!338911)))

(declare-fun b!761000 () Bool)

(assert (=> b!761000 (and (bvsge (index!33346 lt!338911) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338911) (size!20568 lt!338804)))))

(declare-fun res!514740 () Bool)

(assert (=> b!761000 (= res!514740 (= (select (arr!20147 lt!338804) (index!33346 lt!338911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424217 () Bool)

(assert (=> b!761000 (=> res!514740 e!424217)))

(declare-fun b!761001 () Bool)

(assert (=> b!761001 (= e!424213 (Intermediate!7744 true index!1321 x!1131))))

(declare-fun b!761002 () Bool)

(assert (=> b!761002 (and (bvsge (index!33346 lt!338911) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338911) (size!20568 lt!338804)))))

(declare-fun res!514741 () Bool)

(assert (=> b!761002 (= res!514741 (= (select (arr!20147 lt!338804) (index!33346 lt!338911)) lt!338807))))

(assert (=> b!761002 (=> res!514741 e!424217)))

(assert (=> b!761002 (= e!424215 e!424217)))

(declare-fun b!761003 () Bool)

(assert (=> b!761003 (and (bvsge (index!33346 lt!338911) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338911) (size!20568 lt!338804)))))

(assert (=> b!761003 (= e!424217 (= (select (arr!20147 lt!338804) (index!33346 lt!338911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761004 () Bool)

(assert (=> b!761004 (= e!424214 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338807 lt!338804 mask!3328))))

(declare-fun b!761005 () Bool)

(assert (=> b!761005 (= e!424214 (Intermediate!7744 false index!1321 x!1131))))

(declare-fun b!761006 () Bool)

(assert (=> b!761006 (= e!424216 (bvsge (x!64253 lt!338911) #b01111111111111111111111111111110))))

(assert (= (and d!100529 c!83513) b!761001))

(assert (= (and d!100529 (not c!83513)) b!760999))

(assert (= (and b!760999 c!83515) b!761005))

(assert (= (and b!760999 (not c!83515)) b!761004))

(assert (= (and d!100529 c!83514) b!761006))

(assert (= (and d!100529 (not c!83514)) b!760998))

(assert (= (and b!760998 res!514739) b!761002))

(assert (= (and b!761002 (not res!514741)) b!761000))

(assert (= (and b!761000 (not res!514740)) b!761003))

(declare-fun m!707557 () Bool)

(assert (=> b!761002 m!707557))

(assert (=> b!761003 m!707557))

(declare-fun m!707559 () Bool)

(assert (=> d!100529 m!707559))

(assert (=> d!100529 m!707363))

(assert (=> b!761000 m!707557))

(declare-fun m!707561 () Bool)

(assert (=> b!761004 m!707561))

(assert (=> b!761004 m!707561))

(declare-fun m!707563 () Bool)

(assert (=> b!761004 m!707563))

(assert (=> b!760756 d!100529))

(declare-fun b!761007 () Bool)

(declare-fun e!424221 () Bool)

(declare-fun e!424220 () Bool)

(assert (=> b!761007 (= e!424221 e!424220)))

(declare-fun res!514742 () Bool)

(declare-fun lt!338913 () SeekEntryResult!7744)

(assert (=> b!761007 (= res!514742 (and ((_ is Intermediate!7744) lt!338913) (not (undefined!8556 lt!338913)) (bvslt (x!64253 lt!338913) #b01111111111111111111111111111110) (bvsge (x!64253 lt!338913) #b00000000000000000000000000000000) (bvsge (x!64253 lt!338913) #b00000000000000000000000000000000)))))

(assert (=> b!761007 (=> (not res!514742) (not e!424220))))

(declare-fun b!761008 () Bool)

(declare-fun e!424218 () SeekEntryResult!7744)

(declare-fun e!424219 () SeekEntryResult!7744)

(assert (=> b!761008 (= e!424218 e!424219)))

(declare-fun c!83518 () Bool)

(declare-fun lt!338914 () (_ BitVec 64))

(assert (=> b!761008 (= c!83518 (or (= lt!338914 lt!338807) (= (bvadd lt!338914 lt!338914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100539 () Bool)

(assert (=> d!100539 e!424221))

(declare-fun c!83517 () Bool)

(assert (=> d!100539 (= c!83517 (and ((_ is Intermediate!7744) lt!338913) (undefined!8556 lt!338913)))))

(assert (=> d!100539 (= lt!338913 e!424218)))

(declare-fun c!83516 () Bool)

(assert (=> d!100539 (= c!83516 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100539 (= lt!338914 (select (arr!20147 lt!338804) (toIndex!0 lt!338807 mask!3328)))))

(assert (=> d!100539 (validMask!0 mask!3328)))

(assert (=> d!100539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338807 mask!3328) lt!338807 lt!338804 mask!3328) lt!338913)))

(declare-fun b!761009 () Bool)

(assert (=> b!761009 (and (bvsge (index!33346 lt!338913) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338913) (size!20568 lt!338804)))))

(declare-fun res!514743 () Bool)

(assert (=> b!761009 (= res!514743 (= (select (arr!20147 lt!338804) (index!33346 lt!338913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424222 () Bool)

(assert (=> b!761009 (=> res!514743 e!424222)))

(declare-fun b!761010 () Bool)

(assert (=> b!761010 (= e!424218 (Intermediate!7744 true (toIndex!0 lt!338807 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761011 () Bool)

(assert (=> b!761011 (and (bvsge (index!33346 lt!338913) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338913) (size!20568 lt!338804)))))

(declare-fun res!514744 () Bool)

(assert (=> b!761011 (= res!514744 (= (select (arr!20147 lt!338804) (index!33346 lt!338913)) lt!338807))))

(assert (=> b!761011 (=> res!514744 e!424222)))

(assert (=> b!761011 (= e!424220 e!424222)))

(declare-fun b!761012 () Bool)

(assert (=> b!761012 (and (bvsge (index!33346 lt!338913) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338913) (size!20568 lt!338804)))))

(assert (=> b!761012 (= e!424222 (= (select (arr!20147 lt!338804) (index!33346 lt!338913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761013 () Bool)

(assert (=> b!761013 (= e!424219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338807 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338807 lt!338804 mask!3328))))

(declare-fun b!761014 () Bool)

(assert (=> b!761014 (= e!424219 (Intermediate!7744 false (toIndex!0 lt!338807 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761015 () Bool)

(assert (=> b!761015 (= e!424221 (bvsge (x!64253 lt!338913) #b01111111111111111111111111111110))))

(assert (= (and d!100539 c!83516) b!761010))

(assert (= (and d!100539 (not c!83516)) b!761008))

(assert (= (and b!761008 c!83518) b!761014))

(assert (= (and b!761008 (not c!83518)) b!761013))

(assert (= (and d!100539 c!83517) b!761015))

(assert (= (and d!100539 (not c!83517)) b!761007))

(assert (= (and b!761007 res!514742) b!761011))

(assert (= (and b!761011 (not res!514744)) b!761009))

(assert (= (and b!761009 (not res!514743)) b!761012))

(declare-fun m!707565 () Bool)

(assert (=> b!761011 m!707565))

(assert (=> b!761012 m!707565))

(assert (=> d!100539 m!707369))

(declare-fun m!707567 () Bool)

(assert (=> d!100539 m!707567))

(assert (=> d!100539 m!707363))

(assert (=> b!761009 m!707565))

(assert (=> b!761013 m!707369))

(declare-fun m!707569 () Bool)

(assert (=> b!761013 m!707569))

(assert (=> b!761013 m!707569))

(declare-fun m!707571 () Bool)

(assert (=> b!761013 m!707571))

(assert (=> b!760756 d!100539))

(declare-fun d!100541 () Bool)

(declare-fun lt!338924 () (_ BitVec 32))

(declare-fun lt!338923 () (_ BitVec 32))

(assert (=> d!100541 (= lt!338924 (bvmul (bvxor lt!338923 (bvlshr lt!338923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100541 (= lt!338923 ((_ extract 31 0) (bvand (bvxor lt!338807 (bvlshr lt!338807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100541 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514751 (let ((h!15265 ((_ extract 31 0) (bvand (bvxor lt!338807 (bvlshr lt!338807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64260 (bvmul (bvxor h!15265 (bvlshr h!15265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64260 (bvlshr x!64260 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514751 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514751 #b00000000000000000000000000000000))))))

(assert (=> d!100541 (= (toIndex!0 lt!338807 mask!3328) (bvand (bvxor lt!338924 (bvlshr lt!338924 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760756 d!100541))

(declare-fun d!100545 () Bool)

(assert (=> d!100545 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760757 d!100545))

(declare-fun b!761049 () Bool)

(declare-fun e!424248 () Bool)

(declare-fun e!424247 () Bool)

(assert (=> b!761049 (= e!424248 e!424247)))

(declare-fun res!514761 () Bool)

(declare-fun lt!338925 () SeekEntryResult!7744)

(assert (=> b!761049 (= res!514761 (and ((_ is Intermediate!7744) lt!338925) (not (undefined!8556 lt!338925)) (bvslt (x!64253 lt!338925) #b01111111111111111111111111111110) (bvsge (x!64253 lt!338925) #b00000000000000000000000000000000) (bvsge (x!64253 lt!338925) x!1131)))))

(assert (=> b!761049 (=> (not res!514761) (not e!424247))))

(declare-fun b!761050 () Bool)

(declare-fun e!424245 () SeekEntryResult!7744)

(declare-fun e!424246 () SeekEntryResult!7744)

(assert (=> b!761050 (= e!424245 e!424246)))

(declare-fun lt!338926 () (_ BitVec 64))

(declare-fun c!83530 () Bool)

(assert (=> b!761050 (= c!83530 (or (= lt!338926 (select (arr!20147 a!3186) j!159)) (= (bvadd lt!338926 lt!338926) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100547 () Bool)

(assert (=> d!100547 e!424248))

(declare-fun c!83529 () Bool)

(assert (=> d!100547 (= c!83529 (and ((_ is Intermediate!7744) lt!338925) (undefined!8556 lt!338925)))))

(assert (=> d!100547 (= lt!338925 e!424245)))

(declare-fun c!83528 () Bool)

(assert (=> d!100547 (= c!83528 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100547 (= lt!338926 (select (arr!20147 a!3186) index!1321))))

(assert (=> d!100547 (validMask!0 mask!3328)))

(assert (=> d!100547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338925)))

(declare-fun b!761051 () Bool)

(assert (=> b!761051 (and (bvsge (index!33346 lt!338925) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338925) (size!20568 a!3186)))))

(declare-fun res!514762 () Bool)

(assert (=> b!761051 (= res!514762 (= (select (arr!20147 a!3186) (index!33346 lt!338925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424249 () Bool)

(assert (=> b!761051 (=> res!514762 e!424249)))

(declare-fun b!761052 () Bool)

(assert (=> b!761052 (= e!424245 (Intermediate!7744 true index!1321 x!1131))))

(declare-fun b!761053 () Bool)

(assert (=> b!761053 (and (bvsge (index!33346 lt!338925) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338925) (size!20568 a!3186)))))

(declare-fun res!514763 () Bool)

(assert (=> b!761053 (= res!514763 (= (select (arr!20147 a!3186) (index!33346 lt!338925)) (select (arr!20147 a!3186) j!159)))))

(assert (=> b!761053 (=> res!514763 e!424249)))

(assert (=> b!761053 (= e!424247 e!424249)))

(declare-fun b!761054 () Bool)

(assert (=> b!761054 (and (bvsge (index!33346 lt!338925) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338925) (size!20568 a!3186)))))

(assert (=> b!761054 (= e!424249 (= (select (arr!20147 a!3186) (index!33346 lt!338925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761055 () Bool)

(assert (=> b!761055 (= e!424246 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761056 () Bool)

(assert (=> b!761056 (= e!424246 (Intermediate!7744 false index!1321 x!1131))))

(declare-fun b!761057 () Bool)

(assert (=> b!761057 (= e!424248 (bvsge (x!64253 lt!338925) #b01111111111111111111111111111110))))

(assert (= (and d!100547 c!83528) b!761052))

(assert (= (and d!100547 (not c!83528)) b!761050))

(assert (= (and b!761050 c!83530) b!761056))

(assert (= (and b!761050 (not c!83530)) b!761055))

(assert (= (and d!100547 c!83529) b!761057))

(assert (= (and d!100547 (not c!83529)) b!761049))

(assert (= (and b!761049 res!514761) b!761053))

(assert (= (and b!761053 (not res!514763)) b!761051))

(assert (= (and b!761051 (not res!514762)) b!761054))

(declare-fun m!707581 () Bool)

(assert (=> b!761053 m!707581))

(assert (=> b!761054 m!707581))

(declare-fun m!707583 () Bool)

(assert (=> d!100547 m!707583))

(assert (=> d!100547 m!707363))

(assert (=> b!761051 m!707581))

(assert (=> b!761055 m!707561))

(assert (=> b!761055 m!707561))

(assert (=> b!761055 m!707351))

(declare-fun m!707585 () Bool)

(assert (=> b!761055 m!707585))

(assert (=> b!760748 d!100547))

(declare-fun d!100549 () Bool)

(declare-fun res!514772 () Bool)

(declare-fun e!424259 () Bool)

(assert (=> d!100549 (=> res!514772 e!424259)))

(assert (=> d!100549 (= res!514772 (= (select (arr!20147 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100549 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!424259)))

(declare-fun b!761071 () Bool)

(declare-fun e!424260 () Bool)

(assert (=> b!761071 (= e!424259 e!424260)))

(declare-fun res!514773 () Bool)

(assert (=> b!761071 (=> (not res!514773) (not e!424260))))

(assert (=> b!761071 (= res!514773 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20568 a!3186)))))

(declare-fun b!761072 () Bool)

(assert (=> b!761072 (= e!424260 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100549 (not res!514772)) b!761071))

(assert (= (and b!761071 res!514773) b!761072))

(assert (=> d!100549 m!707515))

(declare-fun m!707595 () Bool)

(assert (=> b!761072 m!707595))

(assert (=> b!760759 d!100549))

(declare-fun d!100553 () Bool)

(assert (=> d!100553 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66024 d!100553))

(declare-fun d!100557 () Bool)

(assert (=> d!100557 (= (array_inv!16030 a!3186) (bvsge (size!20568 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66024 d!100557))

(declare-fun d!100559 () Bool)

(assert (=> d!100559 (= (validKeyInArray!0 (select (arr!20147 a!3186) j!159)) (and (not (= (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20147 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760758 d!100559))

(declare-fun b!761131 () Bool)

(declare-fun e!424298 () Bool)

(declare-fun e!424301 () Bool)

(assert (=> b!761131 (= e!424298 e!424301)))

(declare-fun res!514800 () Bool)

(assert (=> b!761131 (=> (not res!514800) (not e!424301))))

(declare-fun e!424299 () Bool)

(assert (=> b!761131 (= res!514800 (not e!424299))))

(declare-fun res!514798 () Bool)

(assert (=> b!761131 (=> (not res!514798) (not e!424299))))

(assert (=> b!761131 (= res!514798 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761132 () Bool)

(declare-fun e!424300 () Bool)

(declare-fun call!34946 () Bool)

(assert (=> b!761132 (= e!424300 call!34946)))

(declare-fun d!100561 () Bool)

(declare-fun res!514799 () Bool)

(assert (=> d!100561 (=> res!514799 e!424298)))

(assert (=> d!100561 (= res!514799 (bvsge #b00000000000000000000000000000000 (size!20568 a!3186)))))

(assert (=> d!100561 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14185) e!424298)))

(declare-fun bm!34943 () Bool)

(declare-fun c!83551 () Bool)

(assert (=> bm!34943 (= call!34946 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83551 (Cons!14184 (select (arr!20147 a!3186) #b00000000000000000000000000000000) Nil!14185) Nil!14185)))))

(declare-fun b!761133 () Bool)

(assert (=> b!761133 (= e!424301 e!424300)))

(assert (=> b!761133 (= c!83551 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761134 () Bool)

(assert (=> b!761134 (= e!424300 call!34946)))

(declare-fun b!761135 () Bool)

(declare-fun contains!4052 (List!14188 (_ BitVec 64)) Bool)

(assert (=> b!761135 (= e!424299 (contains!4052 Nil!14185 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100561 (not res!514799)) b!761131))

(assert (= (and b!761131 res!514798) b!761135))

(assert (= (and b!761131 res!514800) b!761133))

(assert (= (and b!761133 c!83551) b!761132))

(assert (= (and b!761133 (not c!83551)) b!761134))

(assert (= (or b!761132 b!761134) bm!34943))

(assert (=> b!761131 m!707515))

(assert (=> b!761131 m!707515))

(assert (=> b!761131 m!707523))

(assert (=> bm!34943 m!707515))

(declare-fun m!707617 () Bool)

(assert (=> bm!34943 m!707617))

(assert (=> b!761133 m!707515))

(assert (=> b!761133 m!707515))

(assert (=> b!761133 m!707523))

(assert (=> b!761135 m!707515))

(assert (=> b!761135 m!707515))

(declare-fun m!707619 () Bool)

(assert (=> b!761135 m!707619))

(assert (=> b!760751 d!100561))

(declare-fun d!100569 () Bool)

(declare-fun lt!338955 () SeekEntryResult!7744)

(assert (=> d!100569 (and (or ((_ is Undefined!7744) lt!338955) (not ((_ is Found!7744) lt!338955)) (and (bvsge (index!33345 lt!338955) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338955) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338955) ((_ is Found!7744) lt!338955) (not ((_ is MissingVacant!7744) lt!338955)) (not (= (index!33347 lt!338955) resIntermediateIndex!5)) (and (bvsge (index!33347 lt!338955) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338955) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338955) (ite ((_ is Found!7744) lt!338955) (= (select (arr!20147 a!3186) (index!33345 lt!338955)) (select (arr!20147 a!3186) j!159)) (and ((_ is MissingVacant!7744) lt!338955) (= (index!33347 lt!338955) resIntermediateIndex!5) (= (select (arr!20147 a!3186) (index!33347 lt!338955)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424302 () SeekEntryResult!7744)

(assert (=> d!100569 (= lt!338955 e!424302)))

(declare-fun c!83554 () Bool)

(assert (=> d!100569 (= c!83554 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338956 () (_ BitVec 64))

(assert (=> d!100569 (= lt!338956 (select (arr!20147 a!3186) index!1321))))

(assert (=> d!100569 (validMask!0 mask!3328)))

(assert (=> d!100569 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338955)))

(declare-fun b!761136 () Bool)

(declare-fun c!83552 () Bool)

(assert (=> b!761136 (= c!83552 (= lt!338956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424303 () SeekEntryResult!7744)

(declare-fun e!424304 () SeekEntryResult!7744)

(assert (=> b!761136 (= e!424303 e!424304)))

(declare-fun b!761137 () Bool)

(assert (=> b!761137 (= e!424303 (Found!7744 index!1321))))

(declare-fun b!761138 () Bool)

(assert (=> b!761138 (= e!424302 e!424303)))

(declare-fun c!83553 () Bool)

(assert (=> b!761138 (= c!83553 (= lt!338956 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!761139 () Bool)

(assert (=> b!761139 (= e!424304 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761140 () Bool)

(assert (=> b!761140 (= e!424302 Undefined!7744)))

(declare-fun b!761141 () Bool)

(assert (=> b!761141 (= e!424304 (MissingVacant!7744 resIntermediateIndex!5))))

(assert (= (and d!100569 c!83554) b!761140))

(assert (= (and d!100569 (not c!83554)) b!761138))

(assert (= (and b!761138 c!83553) b!761137))

(assert (= (and b!761138 (not c!83553)) b!761136))

(assert (= (and b!761136 c!83552) b!761141))

(assert (= (and b!761136 (not c!83552)) b!761139))

(declare-fun m!707623 () Bool)

(assert (=> d!100569 m!707623))

(declare-fun m!707625 () Bool)

(assert (=> d!100569 m!707625))

(assert (=> d!100569 m!707583))

(assert (=> d!100569 m!707363))

(assert (=> b!761139 m!707561))

(assert (=> b!761139 m!707561))

(assert (=> b!761139 m!707351))

(declare-fun m!707627 () Bool)

(assert (=> b!761139 m!707627))

(assert (=> b!760762 d!100569))

(assert (=> b!760760 d!100569))

(declare-fun d!100573 () Bool)

(declare-fun lt!338957 () SeekEntryResult!7744)

(assert (=> d!100573 (and (or ((_ is Undefined!7744) lt!338957) (not ((_ is Found!7744) lt!338957)) (and (bvsge (index!33345 lt!338957) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338957) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338957) ((_ is Found!7744) lt!338957) (not ((_ is MissingZero!7744) lt!338957)) (and (bvsge (index!33344 lt!338957) #b00000000000000000000000000000000) (bvslt (index!33344 lt!338957) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338957) ((_ is Found!7744) lt!338957) ((_ is MissingZero!7744) lt!338957) (not ((_ is MissingVacant!7744) lt!338957)) (and (bvsge (index!33347 lt!338957) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338957) (size!20568 a!3186)))) (or ((_ is Undefined!7744) lt!338957) (ite ((_ is Found!7744) lt!338957) (= (select (arr!20147 a!3186) (index!33345 lt!338957)) (select (arr!20147 a!3186) j!159)) (ite ((_ is MissingZero!7744) lt!338957) (= (select (arr!20147 a!3186) (index!33344 lt!338957)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7744) lt!338957) (= (select (arr!20147 a!3186) (index!33347 lt!338957)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424307 () SeekEntryResult!7744)

(assert (=> d!100573 (= lt!338957 e!424307)))

(declare-fun c!83555 () Bool)

(declare-fun lt!338959 () SeekEntryResult!7744)

(assert (=> d!100573 (= c!83555 (and ((_ is Intermediate!7744) lt!338959) (undefined!8556 lt!338959)))))

(assert (=> d!100573 (= lt!338959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100573 (validMask!0 mask!3328)))

(assert (=> d!100573 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338957)))

(declare-fun b!761142 () Bool)

(declare-fun e!424305 () SeekEntryResult!7744)

(assert (=> b!761142 (= e!424305 (Found!7744 (index!33346 lt!338959)))))

(declare-fun b!761143 () Bool)

(assert (=> b!761143 (= e!424307 Undefined!7744)))

(declare-fun b!761144 () Bool)

(declare-fun e!424306 () SeekEntryResult!7744)

(assert (=> b!761144 (= e!424306 (MissingZero!7744 (index!33346 lt!338959)))))

(declare-fun b!761145 () Bool)

(assert (=> b!761145 (= e!424307 e!424305)))

(declare-fun lt!338958 () (_ BitVec 64))

(assert (=> b!761145 (= lt!338958 (select (arr!20147 a!3186) (index!33346 lt!338959)))))

(declare-fun c!83556 () Bool)

(assert (=> b!761145 (= c!83556 (= lt!338958 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!761146 () Bool)

(declare-fun c!83557 () Bool)

(assert (=> b!761146 (= c!83557 (= lt!338958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761146 (= e!424305 e!424306)))

(declare-fun b!761147 () Bool)

(assert (=> b!761147 (= e!424306 (seekKeyOrZeroReturnVacant!0 (x!64253 lt!338959) (index!33346 lt!338959) (index!33346 lt!338959) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100573 c!83555) b!761143))

(assert (= (and d!100573 (not c!83555)) b!761145))

(assert (= (and b!761145 c!83556) b!761142))

(assert (= (and b!761145 (not c!83556)) b!761146))

(assert (= (and b!761146 c!83557) b!761144))

(assert (= (and b!761146 (not c!83557)) b!761147))

(assert (=> d!100573 m!707363))

(assert (=> d!100573 m!707351))

(assert (=> d!100573 m!707359))

(declare-fun m!707629 () Bool)

(assert (=> d!100573 m!707629))

(declare-fun m!707631 () Bool)

(assert (=> d!100573 m!707631))

(declare-fun m!707633 () Bool)

(assert (=> d!100573 m!707633))

(assert (=> d!100573 m!707359))

(assert (=> d!100573 m!707351))

(assert (=> d!100573 m!707361))

(declare-fun m!707635 () Bool)

(assert (=> b!761145 m!707635))

(assert (=> b!761147 m!707351))

(declare-fun m!707637 () Bool)

(assert (=> b!761147 m!707637))

(assert (=> b!760750 d!100573))

(declare-fun b!761152 () Bool)

(declare-fun e!424315 () Bool)

(declare-fun e!424314 () Bool)

(assert (=> b!761152 (= e!424315 e!424314)))

(declare-fun res!514806 () Bool)

(declare-fun lt!338960 () SeekEntryResult!7744)

(assert (=> b!761152 (= res!514806 (and ((_ is Intermediate!7744) lt!338960) (not (undefined!8556 lt!338960)) (bvslt (x!64253 lt!338960) #b01111111111111111111111111111110) (bvsge (x!64253 lt!338960) #b00000000000000000000000000000000) (bvsge (x!64253 lt!338960) #b00000000000000000000000000000000)))))

(assert (=> b!761152 (=> (not res!514806) (not e!424314))))

(declare-fun b!761153 () Bool)

(declare-fun e!424312 () SeekEntryResult!7744)

(declare-fun e!424313 () SeekEntryResult!7744)

(assert (=> b!761153 (= e!424312 e!424313)))

(declare-fun c!83560 () Bool)

(declare-fun lt!338961 () (_ BitVec 64))

(assert (=> b!761153 (= c!83560 (or (= lt!338961 (select (arr!20147 a!3186) j!159)) (= (bvadd lt!338961 lt!338961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100575 () Bool)

(assert (=> d!100575 e!424315))

(declare-fun c!83559 () Bool)

(assert (=> d!100575 (= c!83559 (and ((_ is Intermediate!7744) lt!338960) (undefined!8556 lt!338960)))))

(assert (=> d!100575 (= lt!338960 e!424312)))

(declare-fun c!83558 () Bool)

(assert (=> d!100575 (= c!83558 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100575 (= lt!338961 (select (arr!20147 a!3186) (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328)))))

(assert (=> d!100575 (validMask!0 mask!3328)))

(assert (=> d!100575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338960)))

(declare-fun b!761154 () Bool)

(assert (=> b!761154 (and (bvsge (index!33346 lt!338960) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338960) (size!20568 a!3186)))))

(declare-fun res!514807 () Bool)

(assert (=> b!761154 (= res!514807 (= (select (arr!20147 a!3186) (index!33346 lt!338960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424316 () Bool)

(assert (=> b!761154 (=> res!514807 e!424316)))

(declare-fun b!761155 () Bool)

(assert (=> b!761155 (= e!424312 (Intermediate!7744 true (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761156 () Bool)

(assert (=> b!761156 (and (bvsge (index!33346 lt!338960) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338960) (size!20568 a!3186)))))

(declare-fun res!514808 () Bool)

(assert (=> b!761156 (= res!514808 (= (select (arr!20147 a!3186) (index!33346 lt!338960)) (select (arr!20147 a!3186) j!159)))))

(assert (=> b!761156 (=> res!514808 e!424316)))

(assert (=> b!761156 (= e!424314 e!424316)))

(declare-fun b!761157 () Bool)

(assert (=> b!761157 (and (bvsge (index!33346 lt!338960) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338960) (size!20568 a!3186)))))

(assert (=> b!761157 (= e!424316 (= (select (arr!20147 a!3186) (index!33346 lt!338960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761158 () Bool)

(assert (=> b!761158 (= e!424313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761159 () Bool)

(assert (=> b!761159 (= e!424313 (Intermediate!7744 false (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761160 () Bool)

(assert (=> b!761160 (= e!424315 (bvsge (x!64253 lt!338960) #b01111111111111111111111111111110))))

(assert (= (and d!100575 c!83558) b!761155))

(assert (= (and d!100575 (not c!83558)) b!761153))

(assert (= (and b!761153 c!83560) b!761159))

(assert (= (and b!761153 (not c!83560)) b!761158))

(assert (= (and d!100575 c!83559) b!761160))

(assert (= (and d!100575 (not c!83559)) b!761152))

(assert (= (and b!761152 res!514806) b!761156))

(assert (= (and b!761156 (not res!514808)) b!761154))

(assert (= (and b!761154 (not res!514807)) b!761157))

(declare-fun m!707639 () Bool)

(assert (=> b!761156 m!707639))

(assert (=> b!761157 m!707639))

(assert (=> d!100575 m!707359))

(declare-fun m!707641 () Bool)

(assert (=> d!100575 m!707641))

(assert (=> d!100575 m!707363))

(assert (=> b!761154 m!707639))

(assert (=> b!761158 m!707359))

(declare-fun m!707645 () Bool)

(assert (=> b!761158 m!707645))

(assert (=> b!761158 m!707645))

(assert (=> b!761158 m!707351))

(declare-fun m!707649 () Bool)

(assert (=> b!761158 m!707649))

(assert (=> b!760761 d!100575))

(declare-fun d!100579 () Bool)

(declare-fun lt!338970 () (_ BitVec 32))

(declare-fun lt!338969 () (_ BitVec 32))

(assert (=> d!100579 (= lt!338970 (bvmul (bvxor lt!338969 (bvlshr lt!338969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100579 (= lt!338969 ((_ extract 31 0) (bvand (bvxor (select (arr!20147 a!3186) j!159) (bvlshr (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100579 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514751 (let ((h!15265 ((_ extract 31 0) (bvand (bvxor (select (arr!20147 a!3186) j!159) (bvlshr (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64260 (bvmul (bvxor h!15265 (bvlshr h!15265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64260 (bvlshr x!64260 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514751 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514751 #b00000000000000000000000000000000))))))

(assert (=> d!100579 (= (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (bvand (bvxor lt!338970 (bvlshr lt!338970 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760761 d!100579))

(check-sat (not d!100529) (not b!761004) (not b!761133) (not d!100525) (not bm!34933) (not b!761147) (not bm!34943) (not d!100515) (not b!761055) (not b!761013) (not b!761072) (not b!761139) (not b!761131) (not d!100547) (not bm!34934) (not d!100539) (not d!100513) (not b!761135) (not b!760942) (not b!760918) (not b!760920) (not b!761158) (not b!760891) (not b!760940) (not b!760907) (not d!100569) (not d!100573) (not d!100575))
(check-sat)
