; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67430 () Bool)

(assert start!67430)

(declare-fun b!779982 () Bool)

(declare-fun res!527746 () Bool)

(declare-fun e!433897 () Bool)

(assert (=> b!779982 (=> (not res!527746) (not e!433897))))

(declare-datatypes ((array!42615 0))(
  ( (array!42616 (arr!20399 (Array (_ BitVec 32) (_ BitVec 64))) (size!20820 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42615)

(declare-datatypes ((List!14440 0))(
  ( (Nil!14437) (Cons!14436 (h!15553 (_ BitVec 64)) (t!20746 List!14440)) )
))
(declare-fun arrayNoDuplicates!0 (array!42615 (_ BitVec 32) List!14440) Bool)

(assert (=> b!779982 (= res!527746 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14437))))

(declare-fun b!779983 () Bool)

(declare-fun e!433891 () Bool)

(assert (=> b!779983 (= e!433897 e!433891)))

(declare-fun res!527745 () Bool)

(assert (=> b!779983 (=> (not res!527745) (not e!433891))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7996 0))(
  ( (MissingZero!7996 (index!34352 (_ BitVec 32))) (Found!7996 (index!34353 (_ BitVec 32))) (Intermediate!7996 (undefined!8808 Bool) (index!34354 (_ BitVec 32)) (x!65313 (_ BitVec 32))) (Undefined!7996) (MissingVacant!7996 (index!34355 (_ BitVec 32))) )
))
(declare-fun lt!347443 () SeekEntryResult!7996)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42615 (_ BitVec 32)) SeekEntryResult!7996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779983 (= res!527745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20399 a!3186) j!159) mask!3328) (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347443))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779983 (= lt!347443 (Intermediate!7996 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!433892 () Bool)

(declare-fun b!779984 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!779984 (= e!433892 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347443))))

(declare-fun b!779985 () Bool)

(declare-fun res!527758 () Bool)

(assert (=> b!779985 (=> (not res!527758) (not e!433897))))

(assert (=> b!779985 (= res!527758 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20820 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20820 a!3186))))))

(declare-fun b!779986 () Bool)

(declare-fun e!433893 () Bool)

(assert (=> b!779986 (= e!433893 false)))

(declare-fun lt!347439 () SeekEntryResult!7996)

(declare-fun lt!347442 () SeekEntryResult!7996)

(assert (=> b!779986 (and (= lt!347439 lt!347442) (= lt!347442 (MissingVacant!7996 resIntermediateIndex!5)))))

(declare-fun b!779987 () Bool)

(declare-fun res!527757 () Bool)

(assert (=> b!779987 (=> (not res!527757) (not e!433897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42615 (_ BitVec 32)) Bool)

(assert (=> b!779987 (= res!527757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!527754 () Bool)

(declare-fun e!433889 () Bool)

(assert (=> start!67430 (=> (not res!527754) (not e!433889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67430 (= res!527754 (validMask!0 mask!3328))))

(assert (=> start!67430 e!433889))

(assert (=> start!67430 true))

(declare-fun array_inv!16282 (array!42615) Bool)

(assert (=> start!67430 (array_inv!16282 a!3186)))

(declare-fun b!779988 () Bool)

(declare-fun res!527760 () Bool)

(assert (=> b!779988 (=> (not res!527760) (not e!433891))))

(assert (=> b!779988 (= res!527760 e!433892)))

(declare-fun c!86523 () Bool)

(assert (=> b!779988 (= c!86523 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779989 () Bool)

(declare-fun res!527756 () Bool)

(assert (=> b!779989 (=> (not res!527756) (not e!433889))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779989 (= res!527756 (and (= (size!20820 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20820 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20820 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779990 () Bool)

(assert (=> b!779990 (= e!433889 e!433897)))

(declare-fun res!527750 () Bool)

(assert (=> b!779990 (=> (not res!527750) (not e!433897))))

(declare-fun lt!347441 () SeekEntryResult!7996)

(assert (=> b!779990 (= res!527750 (or (= lt!347441 (MissingZero!7996 i!1173)) (= lt!347441 (MissingVacant!7996 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42615 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!779990 (= lt!347441 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779991 () Bool)

(declare-fun e!433895 () Bool)

(assert (=> b!779991 (= e!433895 e!433893)))

(declare-fun res!527753 () Bool)

(assert (=> b!779991 (=> res!527753 e!433893)))

(declare-fun lt!347438 () SeekEntryResult!7996)

(declare-fun lt!347444 () (_ BitVec 64))

(assert (=> b!779991 (= res!527753 (or (not (= lt!347442 lt!347438)) (= (select (store (arr!20399 a!3186) i!1173 k0!2102) index!1321) lt!347444) (not (= (select (store (arr!20399 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42615 (_ BitVec 32)) SeekEntryResult!7996)

(assert (=> b!779991 (= lt!347442 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779992 () Bool)

(declare-fun res!527747 () Bool)

(assert (=> b!779992 (=> (not res!527747) (not e!433889))))

(declare-fun arrayContainsKey!0 (array!42615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779992 (= res!527747 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779993 () Bool)

(declare-fun res!527749 () Bool)

(assert (=> b!779993 (=> (not res!527749) (not e!433889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779993 (= res!527749 (validKeyInArray!0 (select (arr!20399 a!3186) j!159)))))

(declare-fun b!779994 () Bool)

(assert (=> b!779994 (= e!433892 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) (Found!7996 j!159)))))

(declare-fun e!433890 () Bool)

(declare-fun b!779995 () Bool)

(assert (=> b!779995 (= e!433890 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20399 a!3186) j!159) a!3186 mask!3328) lt!347438))))

(declare-fun b!779996 () Bool)

(declare-fun e!433894 () Bool)

(assert (=> b!779996 (= e!433894 (not e!433895))))

(declare-fun res!527748 () Bool)

(assert (=> b!779996 (=> res!527748 e!433895)))

(declare-fun lt!347437 () SeekEntryResult!7996)

(get-info :version)

(assert (=> b!779996 (= res!527748 (or (not ((_ is Intermediate!7996) lt!347437)) (bvslt x!1131 (x!65313 lt!347437)) (not (= x!1131 (x!65313 lt!347437))) (not (= index!1321 (index!34354 lt!347437)))))))

(assert (=> b!779996 e!433890))

(declare-fun res!527752 () Bool)

(assert (=> b!779996 (=> (not res!527752) (not e!433890))))

(assert (=> b!779996 (= res!527752 (= lt!347439 lt!347438))))

(assert (=> b!779996 (= lt!347438 (Found!7996 j!159))))

(assert (=> b!779996 (= lt!347439 (seekEntryOrOpen!0 (select (arr!20399 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779996 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26858 0))(
  ( (Unit!26859) )
))
(declare-fun lt!347435 () Unit!26858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26858)

(assert (=> b!779996 (= lt!347435 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779997 () Bool)

(assert (=> b!779997 (= e!433891 e!433894)))

(declare-fun res!527751 () Bool)

(assert (=> b!779997 (=> (not res!527751) (not e!433894))))

(declare-fun lt!347440 () SeekEntryResult!7996)

(assert (=> b!779997 (= res!527751 (= lt!347440 lt!347437))))

(declare-fun lt!347436 () array!42615)

(assert (=> b!779997 (= lt!347437 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347444 lt!347436 mask!3328))))

(assert (=> b!779997 (= lt!347440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347444 mask!3328) lt!347444 lt!347436 mask!3328))))

(assert (=> b!779997 (= lt!347444 (select (store (arr!20399 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779997 (= lt!347436 (array!42616 (store (arr!20399 a!3186) i!1173 k0!2102) (size!20820 a!3186)))))

(declare-fun b!779998 () Bool)

(declare-fun res!527759 () Bool)

(assert (=> b!779998 (=> (not res!527759) (not e!433891))))

(assert (=> b!779998 (= res!527759 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20399 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779999 () Bool)

(declare-fun res!527755 () Bool)

(assert (=> b!779999 (=> (not res!527755) (not e!433889))))

(assert (=> b!779999 (= res!527755 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67430 res!527754) b!779989))

(assert (= (and b!779989 res!527756) b!779993))

(assert (= (and b!779993 res!527749) b!779999))

(assert (= (and b!779999 res!527755) b!779992))

(assert (= (and b!779992 res!527747) b!779990))

(assert (= (and b!779990 res!527750) b!779987))

(assert (= (and b!779987 res!527757) b!779982))

(assert (= (and b!779982 res!527746) b!779985))

(assert (= (and b!779985 res!527758) b!779983))

(assert (= (and b!779983 res!527745) b!779998))

(assert (= (and b!779998 res!527759) b!779988))

(assert (= (and b!779988 c!86523) b!779984))

(assert (= (and b!779988 (not c!86523)) b!779994))

(assert (= (and b!779988 res!527760) b!779997))

(assert (= (and b!779997 res!527751) b!779996))

(assert (= (and b!779996 res!527752) b!779995))

(assert (= (and b!779996 (not res!527748)) b!779991))

(assert (= (and b!779991 (not res!527753)) b!779986))

(declare-fun m!722811 () Bool)

(assert (=> b!779993 m!722811))

(assert (=> b!779993 m!722811))

(declare-fun m!722813 () Bool)

(assert (=> b!779993 m!722813))

(declare-fun m!722815 () Bool)

(assert (=> b!779982 m!722815))

(declare-fun m!722817 () Bool)

(assert (=> b!779998 m!722817))

(declare-fun m!722819 () Bool)

(assert (=> b!779992 m!722819))

(declare-fun m!722821 () Bool)

(assert (=> b!779999 m!722821))

(declare-fun m!722823 () Bool)

(assert (=> b!779991 m!722823))

(declare-fun m!722825 () Bool)

(assert (=> b!779991 m!722825))

(assert (=> b!779991 m!722811))

(assert (=> b!779991 m!722811))

(declare-fun m!722827 () Bool)

(assert (=> b!779991 m!722827))

(assert (=> b!779995 m!722811))

(assert (=> b!779995 m!722811))

(declare-fun m!722829 () Bool)

(assert (=> b!779995 m!722829))

(declare-fun m!722831 () Bool)

(assert (=> b!779987 m!722831))

(declare-fun m!722833 () Bool)

(assert (=> b!779997 m!722833))

(declare-fun m!722835 () Bool)

(assert (=> b!779997 m!722835))

(declare-fun m!722837 () Bool)

(assert (=> b!779997 m!722837))

(assert (=> b!779997 m!722833))

(assert (=> b!779997 m!722823))

(declare-fun m!722839 () Bool)

(assert (=> b!779997 m!722839))

(assert (=> b!779996 m!722811))

(assert (=> b!779996 m!722811))

(declare-fun m!722841 () Bool)

(assert (=> b!779996 m!722841))

(declare-fun m!722843 () Bool)

(assert (=> b!779996 m!722843))

(declare-fun m!722845 () Bool)

(assert (=> b!779996 m!722845))

(assert (=> b!779983 m!722811))

(assert (=> b!779983 m!722811))

(declare-fun m!722847 () Bool)

(assert (=> b!779983 m!722847))

(assert (=> b!779983 m!722847))

(assert (=> b!779983 m!722811))

(declare-fun m!722849 () Bool)

(assert (=> b!779983 m!722849))

(assert (=> b!779994 m!722811))

(assert (=> b!779994 m!722811))

(assert (=> b!779994 m!722827))

(declare-fun m!722851 () Bool)

(assert (=> start!67430 m!722851))

(declare-fun m!722853 () Bool)

(assert (=> start!67430 m!722853))

(declare-fun m!722855 () Bool)

(assert (=> b!779990 m!722855))

(assert (=> b!779984 m!722811))

(assert (=> b!779984 m!722811))

(declare-fun m!722857 () Bool)

(assert (=> b!779984 m!722857))

(check-sat (not b!779995) (not b!779990) (not b!779984) (not b!779992) (not b!779991) (not b!779996) (not b!779997) (not b!779982) (not b!779994) (not b!779987) (not b!779993) (not b!779999) (not b!779983) (not start!67430))
(check-sat)
