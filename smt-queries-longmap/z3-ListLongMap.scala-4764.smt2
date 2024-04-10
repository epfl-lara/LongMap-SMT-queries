; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65646 () Bool)

(assert start!65646)

(declare-fun b!751700 () Bool)

(declare-fun res!507535 () Bool)

(declare-fun e!419333 () Bool)

(assert (=> b!751700 (=> (not res!507535) (not e!419333))))

(declare-datatypes ((array!41819 0))(
  ( (array!41820 (arr!20023 (Array (_ BitVec 32) (_ BitVec 64))) (size!20444 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41819)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41819 (_ BitVec 32)) Bool)

(assert (=> b!751700 (= res!507535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751701 () Bool)

(declare-fun res!507544 () Bool)

(declare-fun e!419329 () Bool)

(assert (=> b!751701 (=> (not res!507544) (not e!419329))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751701 (= res!507544 (validKeyInArray!0 (select (arr!20023 a!3186) j!159)))))

(declare-fun res!507530 () Bool)

(assert (=> start!65646 (=> (not res!507530) (not e!419329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65646 (= res!507530 (validMask!0 mask!3328))))

(assert (=> start!65646 e!419329))

(assert (=> start!65646 true))

(declare-fun array_inv!15819 (array!41819) Bool)

(assert (=> start!65646 (array_inv!15819 a!3186)))

(declare-fun b!751702 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!419323 () Bool)

(declare-datatypes ((SeekEntryResult!7623 0))(
  ( (MissingZero!7623 (index!32860 (_ BitVec 32))) (Found!7623 (index!32861 (_ BitVec 32))) (Intermediate!7623 (undefined!8435 Bool) (index!32862 (_ BitVec 32)) (x!63781 (_ BitVec 32))) (Undefined!7623) (MissingVacant!7623 (index!32863 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41819 (_ BitVec 32)) SeekEntryResult!7623)

(assert (=> b!751702 (= e!419323 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) (Found!7623 j!159)))))

(declare-fun b!751703 () Bool)

(declare-fun res!507538 () Bool)

(declare-fun e!419322 () Bool)

(assert (=> b!751703 (=> (not res!507538) (not e!419322))))

(declare-fun lt!334319 () (_ BitVec 64))

(declare-fun lt!334320 () array!41819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41819 (_ BitVec 32)) SeekEntryResult!7623)

(assert (=> b!751703 (= res!507538 (= (seekEntryOrOpen!0 lt!334319 lt!334320 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334319 lt!334320 mask!3328)))))

(declare-fun b!751704 () Bool)

(declare-fun res!507536 () Bool)

(assert (=> b!751704 (=> (not res!507536) (not e!419329))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751704 (= res!507536 (and (= (size!20444 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20444 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20444 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751705 () Bool)

(assert (=> b!751705 (= e!419329 e!419333)))

(declare-fun res!507540 () Bool)

(assert (=> b!751705 (=> (not res!507540) (not e!419333))))

(declare-fun lt!334318 () SeekEntryResult!7623)

(assert (=> b!751705 (= res!507540 (or (= lt!334318 (MissingZero!7623 i!1173)) (= lt!334318 (MissingVacant!7623 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751705 (= lt!334318 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751706 () Bool)

(declare-fun e!419332 () Bool)

(declare-fun e!419325 () Bool)

(assert (=> b!751706 (= e!419332 e!419325)))

(declare-fun res!507541 () Bool)

(assert (=> b!751706 (=> res!507541 e!419325)))

(declare-fun lt!334323 () (_ BitVec 64))

(assert (=> b!751706 (= res!507541 (= lt!334323 lt!334319))))

(assert (=> b!751706 (= lt!334323 (select (store (arr!20023 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751707 () Bool)

(declare-fun res!507542 () Bool)

(assert (=> b!751707 (=> (not res!507542) (not e!419329))))

(assert (=> b!751707 (= res!507542 (validKeyInArray!0 k0!2102))))

(declare-fun b!751708 () Bool)

(declare-fun lt!334324 () SeekEntryResult!7623)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41819 (_ BitVec 32)) SeekEntryResult!7623)

(assert (=> b!751708 (= e!419323 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334324))))

(declare-fun b!751709 () Bool)

(declare-datatypes ((Unit!25872 0))(
  ( (Unit!25873) )
))
(declare-fun e!419326 () Unit!25872)

(declare-fun Unit!25874 () Unit!25872)

(assert (=> b!751709 (= e!419326 Unit!25874)))

(declare-fun e!419327 () Bool)

(declare-fun b!751710 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!334315 () SeekEntryResult!7623)

(assert (=> b!751710 (= e!419327 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334315))))

(declare-fun b!751711 () Bool)

(declare-fun res!507543 () Bool)

(assert (=> b!751711 (=> (not res!507543) (not e!419333))))

(declare-datatypes ((List!14025 0))(
  ( (Nil!14022) (Cons!14021 (h!15093 (_ BitVec 64)) (t!20340 List!14025)) )
))
(declare-fun arrayNoDuplicates!0 (array!41819 (_ BitVec 32) List!14025) Bool)

(assert (=> b!751711 (= res!507543 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14022))))

(declare-fun b!751712 () Bool)

(declare-fun e!419328 () Bool)

(declare-fun e!419331 () Bool)

(assert (=> b!751712 (= e!419328 e!419331)))

(declare-fun res!507527 () Bool)

(assert (=> b!751712 (=> (not res!507527) (not e!419331))))

(declare-fun lt!334325 () SeekEntryResult!7623)

(declare-fun lt!334322 () SeekEntryResult!7623)

(assert (=> b!751712 (= res!507527 (= lt!334325 lt!334322))))

(assert (=> b!751712 (= lt!334322 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334319 lt!334320 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751712 (= lt!334325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334319 mask!3328) lt!334319 lt!334320 mask!3328))))

(assert (=> b!751712 (= lt!334319 (select (store (arr!20023 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751712 (= lt!334320 (array!41820 (store (arr!20023 a!3186) i!1173 k0!2102) (size!20444 a!3186)))))

(declare-fun b!751713 () Bool)

(assert (=> b!751713 (= e!419325 true)))

(assert (=> b!751713 e!419322))

(declare-fun res!507532 () Bool)

(assert (=> b!751713 (=> (not res!507532) (not e!419322))))

(assert (=> b!751713 (= res!507532 (= lt!334323 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334321 () Unit!25872)

(assert (=> b!751713 (= lt!334321 e!419326)))

(declare-fun c!82467 () Bool)

(assert (=> b!751713 (= c!82467 (= lt!334323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751714 () Bool)

(declare-fun res!507545 () Bool)

(assert (=> b!751714 (=> (not res!507545) (not e!419328))))

(assert (=> b!751714 (= res!507545 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20023 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751715 () Bool)

(declare-fun res!507529 () Bool)

(assert (=> b!751715 (=> (not res!507529) (not e!419333))))

(assert (=> b!751715 (= res!507529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20444 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20444 a!3186))))))

(declare-fun b!751716 () Bool)

(declare-fun e!419330 () Bool)

(assert (=> b!751716 (= e!419331 (not e!419330))))

(declare-fun res!507539 () Bool)

(assert (=> b!751716 (=> res!507539 e!419330)))

(get-info :version)

(assert (=> b!751716 (= res!507539 (or (not ((_ is Intermediate!7623) lt!334322)) (bvslt x!1131 (x!63781 lt!334322)) (not (= x!1131 (x!63781 lt!334322))) (not (= index!1321 (index!32862 lt!334322)))))))

(assert (=> b!751716 e!419327))

(declare-fun res!507528 () Bool)

(assert (=> b!751716 (=> (not res!507528) (not e!419327))))

(declare-fun lt!334316 () SeekEntryResult!7623)

(assert (=> b!751716 (= res!507528 (= lt!334316 lt!334315))))

(assert (=> b!751716 (= lt!334315 (Found!7623 j!159))))

(assert (=> b!751716 (= lt!334316 (seekEntryOrOpen!0 (select (arr!20023 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751716 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334317 () Unit!25872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25872)

(assert (=> b!751716 (= lt!334317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751717 () Bool)

(declare-fun lt!334314 () SeekEntryResult!7623)

(assert (=> b!751717 (= e!419322 (= lt!334316 lt!334314))))

(declare-fun b!751718 () Bool)

(assert (=> b!751718 (= e!419333 e!419328)))

(declare-fun res!507533 () Bool)

(assert (=> b!751718 (=> (not res!507533) (not e!419328))))

(assert (=> b!751718 (= res!507533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20023 a!3186) j!159) mask!3328) (select (arr!20023 a!3186) j!159) a!3186 mask!3328) lt!334324))))

(assert (=> b!751718 (= lt!334324 (Intermediate!7623 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751719 () Bool)

(assert (=> b!751719 (= e!419330 e!419332)))

(declare-fun res!507534 () Bool)

(assert (=> b!751719 (=> res!507534 e!419332)))

(assert (=> b!751719 (= res!507534 (not (= lt!334314 lt!334315)))))

(assert (=> b!751719 (= lt!334314 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20023 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751720 () Bool)

(declare-fun Unit!25875 () Unit!25872)

(assert (=> b!751720 (= e!419326 Unit!25875)))

(assert (=> b!751720 false))

(declare-fun b!751721 () Bool)

(declare-fun res!507537 () Bool)

(assert (=> b!751721 (=> (not res!507537) (not e!419328))))

(assert (=> b!751721 (= res!507537 e!419323)))

(declare-fun c!82468 () Bool)

(assert (=> b!751721 (= c!82468 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751722 () Bool)

(declare-fun res!507531 () Bool)

(assert (=> b!751722 (=> (not res!507531) (not e!419329))))

(declare-fun arrayContainsKey!0 (array!41819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751722 (= res!507531 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65646 res!507530) b!751704))

(assert (= (and b!751704 res!507536) b!751701))

(assert (= (and b!751701 res!507544) b!751707))

(assert (= (and b!751707 res!507542) b!751722))

(assert (= (and b!751722 res!507531) b!751705))

(assert (= (and b!751705 res!507540) b!751700))

(assert (= (and b!751700 res!507535) b!751711))

(assert (= (and b!751711 res!507543) b!751715))

(assert (= (and b!751715 res!507529) b!751718))

(assert (= (and b!751718 res!507533) b!751714))

(assert (= (and b!751714 res!507545) b!751721))

(assert (= (and b!751721 c!82468) b!751708))

(assert (= (and b!751721 (not c!82468)) b!751702))

(assert (= (and b!751721 res!507537) b!751712))

(assert (= (and b!751712 res!507527) b!751716))

(assert (= (and b!751716 res!507528) b!751710))

(assert (= (and b!751716 (not res!507539)) b!751719))

(assert (= (and b!751719 (not res!507534)) b!751706))

(assert (= (and b!751706 (not res!507541)) b!751713))

(assert (= (and b!751713 c!82467) b!751720))

(assert (= (and b!751713 (not c!82467)) b!751709))

(assert (= (and b!751713 res!507532) b!751703))

(assert (= (and b!751703 res!507538) b!751717))

(declare-fun m!700823 () Bool)

(assert (=> b!751706 m!700823))

(declare-fun m!700825 () Bool)

(assert (=> b!751706 m!700825))

(declare-fun m!700827 () Bool)

(assert (=> b!751714 m!700827))

(declare-fun m!700829 () Bool)

(assert (=> b!751700 m!700829))

(declare-fun m!700831 () Bool)

(assert (=> b!751710 m!700831))

(assert (=> b!751710 m!700831))

(declare-fun m!700833 () Bool)

(assert (=> b!751710 m!700833))

(declare-fun m!700835 () Bool)

(assert (=> start!65646 m!700835))

(declare-fun m!700837 () Bool)

(assert (=> start!65646 m!700837))

(declare-fun m!700839 () Bool)

(assert (=> b!751707 m!700839))

(assert (=> b!751718 m!700831))

(assert (=> b!751718 m!700831))

(declare-fun m!700841 () Bool)

(assert (=> b!751718 m!700841))

(assert (=> b!751718 m!700841))

(assert (=> b!751718 m!700831))

(declare-fun m!700843 () Bool)

(assert (=> b!751718 m!700843))

(declare-fun m!700845 () Bool)

(assert (=> b!751703 m!700845))

(declare-fun m!700847 () Bool)

(assert (=> b!751703 m!700847))

(assert (=> b!751716 m!700831))

(assert (=> b!751716 m!700831))

(declare-fun m!700849 () Bool)

(assert (=> b!751716 m!700849))

(declare-fun m!700851 () Bool)

(assert (=> b!751716 m!700851))

(declare-fun m!700853 () Bool)

(assert (=> b!751716 m!700853))

(assert (=> b!751702 m!700831))

(assert (=> b!751702 m!700831))

(declare-fun m!700855 () Bool)

(assert (=> b!751702 m!700855))

(assert (=> b!751708 m!700831))

(assert (=> b!751708 m!700831))

(declare-fun m!700857 () Bool)

(assert (=> b!751708 m!700857))

(declare-fun m!700859 () Bool)

(assert (=> b!751722 m!700859))

(declare-fun m!700861 () Bool)

(assert (=> b!751705 m!700861))

(assert (=> b!751719 m!700831))

(assert (=> b!751719 m!700831))

(assert (=> b!751719 m!700855))

(declare-fun m!700863 () Bool)

(assert (=> b!751712 m!700863))

(assert (=> b!751712 m!700823))

(declare-fun m!700865 () Bool)

(assert (=> b!751712 m!700865))

(declare-fun m!700867 () Bool)

(assert (=> b!751712 m!700867))

(assert (=> b!751712 m!700863))

(declare-fun m!700869 () Bool)

(assert (=> b!751712 m!700869))

(assert (=> b!751701 m!700831))

(assert (=> b!751701 m!700831))

(declare-fun m!700871 () Bool)

(assert (=> b!751701 m!700871))

(declare-fun m!700873 () Bool)

(assert (=> b!751711 m!700873))

(check-sat (not b!751711) (not b!751705) (not start!65646) (not b!751708) (not b!751722) (not b!751719) (not b!751712) (not b!751718) (not b!751701) (not b!751702) (not b!751700) (not b!751703) (not b!751716) (not b!751710) (not b!751707))
(check-sat)
