; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65516 () Bool)

(assert start!65516)

(declare-fun b!747858 () Bool)

(declare-fun res!504495 () Bool)

(declare-fun e!417448 () Bool)

(assert (=> b!747858 (=> (not res!504495) (not e!417448))))

(declare-datatypes ((array!41706 0))(
  ( (array!41707 (arr!19967 (Array (_ BitVec 32) (_ BitVec 64))) (size!20388 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41706)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!747858 (= res!504495 (and (= (size!20388 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20388 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20388 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747859 () Bool)

(declare-fun res!504493 () Bool)

(assert (=> b!747859 (=> (not res!504493) (not e!417448))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747859 (= res!504493 (validKeyInArray!0 k0!2102))))

(declare-fun res!504499 () Bool)

(assert (=> start!65516 (=> (not res!504499) (not e!417448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65516 (= res!504499 (validMask!0 mask!3328))))

(assert (=> start!65516 e!417448))

(assert (=> start!65516 true))

(declare-fun array_inv!15850 (array!41706) Bool)

(assert (=> start!65516 (array_inv!15850 a!3186)))

(declare-fun b!747860 () Bool)

(declare-fun e!417451 () Bool)

(declare-fun e!417443 () Bool)

(assert (=> b!747860 (= e!417451 (not e!417443))))

(declare-fun res!504485 () Bool)

(assert (=> b!747860 (=> res!504485 e!417443)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7564 0))(
  ( (MissingZero!7564 (index!32624 (_ BitVec 32))) (Found!7564 (index!32625 (_ BitVec 32))) (Intermediate!7564 (undefined!8376 Bool) (index!32626 (_ BitVec 32)) (x!63573 (_ BitVec 32))) (Undefined!7564) (MissingVacant!7564 (index!32627 (_ BitVec 32))) )
))
(declare-fun lt!332314 () SeekEntryResult!7564)

(get-info :version)

(assert (=> b!747860 (= res!504485 (or (not ((_ is Intermediate!7564) lt!332314)) (bvslt x!1131 (x!63573 lt!332314)) (not (= x!1131 (x!63573 lt!332314))) (not (= index!1321 (index!32626 lt!332314)))))))

(declare-fun e!417450 () Bool)

(assert (=> b!747860 e!417450))

(declare-fun res!504488 () Bool)

(assert (=> b!747860 (=> (not res!504488) (not e!417450))))

(declare-fun lt!332312 () SeekEntryResult!7564)

(declare-fun lt!332310 () SeekEntryResult!7564)

(assert (=> b!747860 (= res!504488 (= lt!332312 lt!332310))))

(assert (=> b!747860 (= lt!332310 (Found!7564 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41706 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!747860 (= lt!332312 (seekEntryOrOpen!0 (select (arr!19967 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41706 (_ BitVec 32)) Bool)

(assert (=> b!747860 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25616 0))(
  ( (Unit!25617) )
))
(declare-fun lt!332307 () Unit!25616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25616)

(assert (=> b!747860 (= lt!332307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747861 () Bool)

(declare-fun res!504487 () Bool)

(assert (=> b!747861 (=> (not res!504487) (not e!417448))))

(declare-fun arrayContainsKey!0 (array!41706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747861 (= res!504487 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747862 () Bool)

(declare-fun e!417447 () Bool)

(assert (=> b!747862 (= e!417447 e!417451)))

(declare-fun res!504501 () Bool)

(assert (=> b!747862 (=> (not res!504501) (not e!417451))))

(declare-fun lt!332308 () SeekEntryResult!7564)

(assert (=> b!747862 (= res!504501 (= lt!332308 lt!332314))))

(declare-fun lt!332315 () array!41706)

(declare-fun lt!332311 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41706 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!747862 (= lt!332314 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332311 lt!332315 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747862 (= lt!332308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332311 mask!3328) lt!332311 lt!332315 mask!3328))))

(assert (=> b!747862 (= lt!332311 (select (store (arr!19967 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747862 (= lt!332315 (array!41707 (store (arr!19967 a!3186) i!1173 k0!2102) (size!20388 a!3186)))))

(declare-fun b!747863 () Bool)

(declare-fun e!417444 () Unit!25616)

(declare-fun Unit!25618 () Unit!25616)

(assert (=> b!747863 (= e!417444 Unit!25618)))

(assert (=> b!747863 false))

(declare-fun lt!332309 () SeekEntryResult!7564)

(declare-fun b!747864 () Bool)

(declare-fun e!417445 () Bool)

(assert (=> b!747864 (= e!417445 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332309))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!747865 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41706 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!747865 (= e!417450 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332310))))

(declare-fun b!747866 () Bool)

(declare-fun res!504491 () Bool)

(declare-fun e!417446 () Bool)

(assert (=> b!747866 (=> (not res!504491) (not e!417446))))

(assert (=> b!747866 (= res!504491 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20388 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20388 a!3186))))))

(declare-fun b!747867 () Bool)

(declare-fun res!504497 () Bool)

(assert (=> b!747867 (=> (not res!504497) (not e!417447))))

(assert (=> b!747867 (= res!504497 e!417445)))

(declare-fun c!82068 () Bool)

(assert (=> b!747867 (= c!82068 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747868 () Bool)

(declare-fun res!504492 () Bool)

(assert (=> b!747868 (=> res!504492 e!417443)))

(assert (=> b!747868 (= res!504492 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332310)))))

(declare-fun b!747869 () Bool)

(assert (=> b!747869 (= e!417448 e!417446)))

(declare-fun res!504489 () Bool)

(assert (=> b!747869 (=> (not res!504489) (not e!417446))))

(declare-fun lt!332313 () SeekEntryResult!7564)

(assert (=> b!747869 (= res!504489 (or (= lt!332313 (MissingZero!7564 i!1173)) (= lt!332313 (MissingVacant!7564 i!1173))))))

(assert (=> b!747869 (= lt!332313 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747870 () Bool)

(declare-fun res!504498 () Bool)

(assert (=> b!747870 (=> (not res!504498) (not e!417446))))

(assert (=> b!747870 (= res!504498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747871 () Bool)

(assert (=> b!747871 (= e!417446 e!417447)))

(declare-fun res!504490 () Bool)

(assert (=> b!747871 (=> (not res!504490) (not e!417447))))

(assert (=> b!747871 (= res!504490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19967 a!3186) j!159) mask!3328) (select (arr!19967 a!3186) j!159) a!3186 mask!3328) lt!332309))))

(assert (=> b!747871 (= lt!332309 (Intermediate!7564 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747872 () Bool)

(assert (=> b!747872 (= e!417443 true)))

(assert (=> b!747872 (= (select (store (arr!19967 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332306 () Unit!25616)

(assert (=> b!747872 (= lt!332306 e!417444)))

(declare-fun c!82067 () Bool)

(assert (=> b!747872 (= c!82067 (= (select (store (arr!19967 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747873 () Bool)

(declare-fun res!504496 () Bool)

(assert (=> b!747873 (=> (not res!504496) (not e!417446))))

(declare-datatypes ((List!14008 0))(
  ( (Nil!14005) (Cons!14004 (h!15076 (_ BitVec 64)) (t!20314 List!14008)) )
))
(declare-fun arrayNoDuplicates!0 (array!41706 (_ BitVec 32) List!14008) Bool)

(assert (=> b!747873 (= res!504496 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14005))))

(declare-fun b!747874 () Bool)

(declare-fun Unit!25619 () Unit!25616)

(assert (=> b!747874 (= e!417444 Unit!25619)))

(declare-fun b!747875 () Bool)

(assert (=> b!747875 (= e!417445 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19967 a!3186) j!159) a!3186 mask!3328) (Found!7564 j!159)))))

(declare-fun b!747876 () Bool)

(declare-fun res!504486 () Bool)

(assert (=> b!747876 (=> (not res!504486) (not e!417447))))

(assert (=> b!747876 (= res!504486 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19967 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747877 () Bool)

(declare-fun res!504500 () Bool)

(assert (=> b!747877 (=> res!504500 e!417443)))

(assert (=> b!747877 (= res!504500 (= (select (store (arr!19967 a!3186) i!1173 k0!2102) index!1321) lt!332311))))

(declare-fun b!747878 () Bool)

(declare-fun res!504494 () Bool)

(assert (=> b!747878 (=> (not res!504494) (not e!417448))))

(assert (=> b!747878 (= res!504494 (validKeyInArray!0 (select (arr!19967 a!3186) j!159)))))

(assert (= (and start!65516 res!504499) b!747858))

(assert (= (and b!747858 res!504495) b!747878))

(assert (= (and b!747878 res!504494) b!747859))

(assert (= (and b!747859 res!504493) b!747861))

(assert (= (and b!747861 res!504487) b!747869))

(assert (= (and b!747869 res!504489) b!747870))

(assert (= (and b!747870 res!504498) b!747873))

(assert (= (and b!747873 res!504496) b!747866))

(assert (= (and b!747866 res!504491) b!747871))

(assert (= (and b!747871 res!504490) b!747876))

(assert (= (and b!747876 res!504486) b!747867))

(assert (= (and b!747867 c!82068) b!747864))

(assert (= (and b!747867 (not c!82068)) b!747875))

(assert (= (and b!747867 res!504497) b!747862))

(assert (= (and b!747862 res!504501) b!747860))

(assert (= (and b!747860 res!504488) b!747865))

(assert (= (and b!747860 (not res!504485)) b!747868))

(assert (= (and b!747868 (not res!504492)) b!747877))

(assert (= (and b!747877 (not res!504500)) b!747872))

(assert (= (and b!747872 c!82067) b!747863))

(assert (= (and b!747872 (not c!82067)) b!747874))

(declare-fun m!697271 () Bool)

(assert (=> b!747872 m!697271))

(declare-fun m!697273 () Bool)

(assert (=> b!747872 m!697273))

(declare-fun m!697275 () Bool)

(assert (=> b!747878 m!697275))

(assert (=> b!747878 m!697275))

(declare-fun m!697277 () Bool)

(assert (=> b!747878 m!697277))

(assert (=> b!747868 m!697275))

(assert (=> b!747868 m!697275))

(declare-fun m!697279 () Bool)

(assert (=> b!747868 m!697279))

(declare-fun m!697281 () Bool)

(assert (=> start!65516 m!697281))

(declare-fun m!697283 () Bool)

(assert (=> start!65516 m!697283))

(assert (=> b!747864 m!697275))

(assert (=> b!747864 m!697275))

(declare-fun m!697285 () Bool)

(assert (=> b!747864 m!697285))

(declare-fun m!697287 () Bool)

(assert (=> b!747873 m!697287))

(assert (=> b!747871 m!697275))

(assert (=> b!747871 m!697275))

(declare-fun m!697289 () Bool)

(assert (=> b!747871 m!697289))

(assert (=> b!747871 m!697289))

(assert (=> b!747871 m!697275))

(declare-fun m!697291 () Bool)

(assert (=> b!747871 m!697291))

(assert (=> b!747877 m!697271))

(assert (=> b!747877 m!697273))

(declare-fun m!697293 () Bool)

(assert (=> b!747861 m!697293))

(declare-fun m!697295 () Bool)

(assert (=> b!747862 m!697295))

(assert (=> b!747862 m!697271))

(assert (=> b!747862 m!697295))

(declare-fun m!697297 () Bool)

(assert (=> b!747862 m!697297))

(declare-fun m!697299 () Bool)

(assert (=> b!747862 m!697299))

(declare-fun m!697301 () Bool)

(assert (=> b!747862 m!697301))

(declare-fun m!697303 () Bool)

(assert (=> b!747859 m!697303))

(assert (=> b!747865 m!697275))

(assert (=> b!747865 m!697275))

(declare-fun m!697305 () Bool)

(assert (=> b!747865 m!697305))

(declare-fun m!697307 () Bool)

(assert (=> b!747870 m!697307))

(declare-fun m!697309 () Bool)

(assert (=> b!747876 m!697309))

(declare-fun m!697311 () Bool)

(assert (=> b!747869 m!697311))

(assert (=> b!747875 m!697275))

(assert (=> b!747875 m!697275))

(assert (=> b!747875 m!697279))

(assert (=> b!747860 m!697275))

(assert (=> b!747860 m!697275))

(declare-fun m!697313 () Bool)

(assert (=> b!747860 m!697313))

(declare-fun m!697315 () Bool)

(assert (=> b!747860 m!697315))

(declare-fun m!697317 () Bool)

(assert (=> b!747860 m!697317))

(check-sat (not b!747864) (not b!747859) (not b!747865) (not b!747871) (not b!747878) (not b!747875) (not b!747869) (not b!747862) (not start!65516) (not b!747868) (not b!747860) (not b!747873) (not b!747870) (not b!747861))
(check-sat)
