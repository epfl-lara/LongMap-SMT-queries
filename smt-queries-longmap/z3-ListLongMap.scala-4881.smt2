; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67268 () Bool)

(assert start!67268)

(declare-fun b!777959 () Bool)

(declare-fun e!432840 () Bool)

(declare-fun e!432844 () Bool)

(assert (=> b!777959 (= e!432840 e!432844)))

(declare-fun res!526352 () Bool)

(assert (=> b!777959 (=> (not res!526352) (not e!432844))))

(declare-datatypes ((array!42560 0))(
  ( (array!42561 (arr!20374 (Array (_ BitVec 32) (_ BitVec 64))) (size!20795 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42560)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7974 0))(
  ( (MissingZero!7974 (index!34264 (_ BitVec 32))) (Found!7974 (index!34265 (_ BitVec 32))) (Intermediate!7974 (undefined!8786 Bool) (index!34266 (_ BitVec 32)) (x!65206 (_ BitVec 32))) (Undefined!7974) (MissingVacant!7974 (index!34267 (_ BitVec 32))) )
))
(declare-fun lt!346602 () SeekEntryResult!7974)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42560 (_ BitVec 32)) SeekEntryResult!7974)

(assert (=> b!777959 (= res!526352 (= (seekEntryOrOpen!0 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!346602))))

(assert (=> b!777959 (= lt!346602 (Found!7974 j!159))))

(declare-fun b!777960 () Bool)

(declare-fun e!432842 () Bool)

(declare-fun e!432837 () Bool)

(assert (=> b!777960 (= e!432842 e!432837)))

(declare-fun res!526341 () Bool)

(assert (=> b!777960 (=> (not res!526341) (not e!432837))))

(declare-fun lt!346601 () SeekEntryResult!7974)

(declare-fun lt!346603 () SeekEntryResult!7974)

(assert (=> b!777960 (= res!526341 (= lt!346601 lt!346603))))

(declare-fun lt!346598 () array!42560)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!346600 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42560 (_ BitVec 32)) SeekEntryResult!7974)

(assert (=> b!777960 (= lt!346603 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346600 lt!346598 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777960 (= lt!346601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346600 mask!3328) lt!346600 lt!346598 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!777960 (= lt!346600 (select (store (arr!20374 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777960 (= lt!346598 (array!42561 (store (arr!20374 a!3186) i!1173 k0!2102) (size!20795 a!3186)))))

(declare-fun b!777961 () Bool)

(declare-fun e!432843 () Bool)

(assert (=> b!777961 (= e!432843 e!432842)))

(declare-fun res!526348 () Bool)

(assert (=> b!777961 (=> (not res!526348) (not e!432842))))

(declare-fun lt!346604 () SeekEntryResult!7974)

(assert (=> b!777961 (= res!526348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20374 a!3186) j!159) mask!3328) (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!346604))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777961 (= lt!346604 (Intermediate!7974 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777962 () Bool)

(declare-fun res!526353 () Bool)

(declare-fun e!432845 () Bool)

(assert (=> b!777962 (=> res!526353 e!432845)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42560 (_ BitVec 32)) SeekEntryResult!7974)

(assert (=> b!777962 (= res!526353 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) (Found!7974 j!159))))))

(declare-fun b!777963 () Bool)

(declare-fun res!526343 () Bool)

(assert (=> b!777963 (=> res!526343 e!432845)))

(assert (=> b!777963 (= res!526343 (or (not (= (select (store (arr!20374 a!3186) i!1173 k0!2102) index!1321) lt!346600)) (undefined!8786 lt!346603)))))

(declare-fun b!777964 () Bool)

(declare-fun res!526346 () Bool)

(assert (=> b!777964 (=> (not res!526346) (not e!432842))))

(declare-fun e!432839 () Bool)

(assert (=> b!777964 (= res!526346 e!432839)))

(declare-fun c!86212 () Bool)

(assert (=> b!777964 (= c!86212 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!526355 () Bool)

(declare-fun e!432838 () Bool)

(assert (=> start!67268 (=> (not res!526355) (not e!432838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67268 (= res!526355 (validMask!0 mask!3328))))

(assert (=> start!67268 e!432838))

(assert (=> start!67268 true))

(declare-fun array_inv!16170 (array!42560) Bool)

(assert (=> start!67268 (array_inv!16170 a!3186)))

(declare-fun b!777965 () Bool)

(declare-fun res!526345 () Bool)

(assert (=> b!777965 (=> (not res!526345) (not e!432838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777965 (= res!526345 (validKeyInArray!0 k0!2102))))

(declare-fun b!777966 () Bool)

(declare-fun res!526351 () Bool)

(assert (=> b!777966 (=> (not res!526351) (not e!432838))))

(assert (=> b!777966 (= res!526351 (and (= (size!20795 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20795 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20795 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777967 () Bool)

(assert (=> b!777967 (= e!432839 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!346604))))

(declare-fun b!777968 () Bool)

(assert (=> b!777968 (= e!432844 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!346602))))

(declare-fun b!777969 () Bool)

(declare-fun res!526340 () Bool)

(assert (=> b!777969 (=> (not res!526340) (not e!432838))))

(declare-fun arrayContainsKey!0 (array!42560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777969 (= res!526340 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777970 () Bool)

(declare-fun res!526350 () Bool)

(assert (=> b!777970 (=> (not res!526350) (not e!432843))))

(assert (=> b!777970 (= res!526350 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20795 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20795 a!3186))))))

(declare-fun b!777971 () Bool)

(assert (=> b!777971 (= e!432845 true)))

(declare-fun lt!346599 () SeekEntryResult!7974)

(assert (=> b!777971 (= lt!346599 (seekEntryOrOpen!0 lt!346600 lt!346598 mask!3328))))

(declare-fun b!777972 () Bool)

(assert (=> b!777972 (= e!432838 e!432843)))

(declare-fun res!526339 () Bool)

(assert (=> b!777972 (=> (not res!526339) (not e!432843))))

(declare-fun lt!346597 () SeekEntryResult!7974)

(assert (=> b!777972 (= res!526339 (or (= lt!346597 (MissingZero!7974 i!1173)) (= lt!346597 (MissingVacant!7974 i!1173))))))

(assert (=> b!777972 (= lt!346597 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777973 () Bool)

(declare-fun res!526338 () Bool)

(assert (=> b!777973 (=> (not res!526338) (not e!432842))))

(assert (=> b!777973 (= res!526338 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20374 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777974 () Bool)

(assert (=> b!777974 (= e!432837 (not e!432845))))

(declare-fun res!526347 () Bool)

(assert (=> b!777974 (=> res!526347 e!432845)))

(get-info :version)

(assert (=> b!777974 (= res!526347 (or (not ((_ is Intermediate!7974) lt!346603)) (bvslt x!1131 (x!65206 lt!346603)) (not (= x!1131 (x!65206 lt!346603))) (not (= index!1321 (index!34266 lt!346603)))))))

(assert (=> b!777974 e!432840))

(declare-fun res!526344 () Bool)

(assert (=> b!777974 (=> (not res!526344) (not e!432840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42560 (_ BitVec 32)) Bool)

(assert (=> b!777974 (= res!526344 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26842 0))(
  ( (Unit!26843) )
))
(declare-fun lt!346596 () Unit!26842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26842)

(assert (=> b!777974 (= lt!346596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777975 () Bool)

(assert (=> b!777975 (= e!432839 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) (Found!7974 j!159)))))

(declare-fun b!777976 () Bool)

(declare-fun res!526349 () Bool)

(assert (=> b!777976 (=> (not res!526349) (not e!432838))))

(assert (=> b!777976 (= res!526349 (validKeyInArray!0 (select (arr!20374 a!3186) j!159)))))

(declare-fun b!777977 () Bool)

(declare-fun res!526354 () Bool)

(assert (=> b!777977 (=> (not res!526354) (not e!432843))))

(declare-datatypes ((List!14376 0))(
  ( (Nil!14373) (Cons!14372 (h!15483 (_ BitVec 64)) (t!20691 List!14376)) )
))
(declare-fun arrayNoDuplicates!0 (array!42560 (_ BitVec 32) List!14376) Bool)

(assert (=> b!777977 (= res!526354 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14373))))

(declare-fun b!777978 () Bool)

(declare-fun res!526342 () Bool)

(assert (=> b!777978 (=> (not res!526342) (not e!432843))))

(assert (=> b!777978 (= res!526342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67268 res!526355) b!777966))

(assert (= (and b!777966 res!526351) b!777976))

(assert (= (and b!777976 res!526349) b!777965))

(assert (= (and b!777965 res!526345) b!777969))

(assert (= (and b!777969 res!526340) b!777972))

(assert (= (and b!777972 res!526339) b!777978))

(assert (= (and b!777978 res!526342) b!777977))

(assert (= (and b!777977 res!526354) b!777970))

(assert (= (and b!777970 res!526350) b!777961))

(assert (= (and b!777961 res!526348) b!777973))

(assert (= (and b!777973 res!526338) b!777964))

(assert (= (and b!777964 c!86212) b!777967))

(assert (= (and b!777964 (not c!86212)) b!777975))

(assert (= (and b!777964 res!526346) b!777960))

(assert (= (and b!777960 res!526341) b!777974))

(assert (= (and b!777974 res!526344) b!777959))

(assert (= (and b!777959 res!526352) b!777968))

(assert (= (and b!777974 (not res!526347)) b!777962))

(assert (= (and b!777962 (not res!526353)) b!777963))

(assert (= (and b!777963 (not res!526343)) b!777971))

(declare-fun m!721741 () Bool)

(assert (=> b!777977 m!721741))

(declare-fun m!721743 () Bool)

(assert (=> b!777961 m!721743))

(assert (=> b!777961 m!721743))

(declare-fun m!721745 () Bool)

(assert (=> b!777961 m!721745))

(assert (=> b!777961 m!721745))

(assert (=> b!777961 m!721743))

(declare-fun m!721747 () Bool)

(assert (=> b!777961 m!721747))

(declare-fun m!721749 () Bool)

(assert (=> b!777960 m!721749))

(declare-fun m!721751 () Bool)

(assert (=> b!777960 m!721751))

(declare-fun m!721753 () Bool)

(assert (=> b!777960 m!721753))

(assert (=> b!777960 m!721751))

(declare-fun m!721755 () Bool)

(assert (=> b!777960 m!721755))

(declare-fun m!721757 () Bool)

(assert (=> b!777960 m!721757))

(assert (=> b!777976 m!721743))

(assert (=> b!777976 m!721743))

(declare-fun m!721759 () Bool)

(assert (=> b!777976 m!721759))

(assert (=> b!777975 m!721743))

(assert (=> b!777975 m!721743))

(declare-fun m!721761 () Bool)

(assert (=> b!777975 m!721761))

(declare-fun m!721763 () Bool)

(assert (=> start!67268 m!721763))

(declare-fun m!721765 () Bool)

(assert (=> start!67268 m!721765))

(assert (=> b!777967 m!721743))

(assert (=> b!777967 m!721743))

(declare-fun m!721767 () Bool)

(assert (=> b!777967 m!721767))

(declare-fun m!721769 () Bool)

(assert (=> b!777971 m!721769))

(assert (=> b!777968 m!721743))

(assert (=> b!777968 m!721743))

(declare-fun m!721771 () Bool)

(assert (=> b!777968 m!721771))

(declare-fun m!721773 () Bool)

(assert (=> b!777978 m!721773))

(assert (=> b!777959 m!721743))

(assert (=> b!777959 m!721743))

(declare-fun m!721775 () Bool)

(assert (=> b!777959 m!721775))

(declare-fun m!721777 () Bool)

(assert (=> b!777974 m!721777))

(declare-fun m!721779 () Bool)

(assert (=> b!777974 m!721779))

(declare-fun m!721781 () Bool)

(assert (=> b!777973 m!721781))

(assert (=> b!777963 m!721753))

(declare-fun m!721783 () Bool)

(assert (=> b!777963 m!721783))

(declare-fun m!721785 () Bool)

(assert (=> b!777965 m!721785))

(declare-fun m!721787 () Bool)

(assert (=> b!777972 m!721787))

(assert (=> b!777962 m!721743))

(assert (=> b!777962 m!721743))

(assert (=> b!777962 m!721761))

(declare-fun m!721789 () Bool)

(assert (=> b!777969 m!721789))

(check-sat (not b!777965) (not b!777961) (not b!777969) (not b!777978) (not b!777967) (not b!777968) (not b!777977) (not b!777974) (not b!777962) (not b!777959) (not b!777976) (not start!67268) (not b!777960) (not b!777975) (not b!777971) (not b!777972))
(check-sat)
