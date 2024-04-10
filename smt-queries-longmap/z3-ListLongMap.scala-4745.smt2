; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65532 () Bool)

(assert start!65532)

(declare-fun res!504497 () Bool)

(declare-fun e!417546 () Bool)

(assert (=> start!65532 (=> (not res!504497) (not e!417546))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65532 (= res!504497 (validMask!0 mask!3328))))

(assert (=> start!65532 e!417546))

(assert (=> start!65532 true))

(declare-datatypes ((array!41705 0))(
  ( (array!41706 (arr!19966 (Array (_ BitVec 32) (_ BitVec 64))) (size!20387 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41705)

(declare-fun array_inv!15762 (array!41705) Bool)

(assert (=> start!65532 (array_inv!15762 a!3186)))

(declare-fun b!747982 () Bool)

(declare-fun res!504501 () Bool)

(declare-fun e!417544 () Bool)

(assert (=> b!747982 (=> res!504501 e!417544)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332492 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747982 (= res!504501 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) lt!332492))))

(declare-fun b!747983 () Bool)

(declare-fun res!504498 () Bool)

(declare-fun e!417548 () Bool)

(assert (=> b!747983 (=> (not res!504498) (not e!417548))))

(declare-datatypes ((List!13968 0))(
  ( (Nil!13965) (Cons!13964 (h!15036 (_ BitVec 64)) (t!20283 List!13968)) )
))
(declare-fun arrayNoDuplicates!0 (array!41705 (_ BitVec 32) List!13968) Bool)

(assert (=> b!747983 (= res!504498 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13965))))

(declare-fun b!747984 () Bool)

(declare-fun e!417547 () Bool)

(assert (=> b!747984 (= e!417547 (not e!417544))))

(declare-fun res!504496 () Bool)

(assert (=> b!747984 (=> res!504496 e!417544)))

(declare-datatypes ((SeekEntryResult!7566 0))(
  ( (MissingZero!7566 (index!32632 (_ BitVec 32))) (Found!7566 (index!32633 (_ BitVec 32))) (Intermediate!7566 (undefined!8378 Bool) (index!32634 (_ BitVec 32)) (x!63572 (_ BitVec 32))) (Undefined!7566) (MissingVacant!7566 (index!32635 (_ BitVec 32))) )
))
(declare-fun lt!332490 () SeekEntryResult!7566)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!747984 (= res!504496 (or (not ((_ is Intermediate!7566) lt!332490)) (bvslt x!1131 (x!63572 lt!332490)) (not (= x!1131 (x!63572 lt!332490))) (not (= index!1321 (index!32634 lt!332490)))))))

(declare-fun e!417545 () Bool)

(assert (=> b!747984 e!417545))

(declare-fun res!504495 () Bool)

(assert (=> b!747984 (=> (not res!504495) (not e!417545))))

(declare-fun lt!332487 () SeekEntryResult!7566)

(declare-fun lt!332491 () SeekEntryResult!7566)

(assert (=> b!747984 (= res!504495 (= lt!332487 lt!332491))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747984 (= lt!332491 (Found!7566 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41705 (_ BitVec 32)) SeekEntryResult!7566)

(assert (=> b!747984 (= lt!332487 (seekEntryOrOpen!0 (select (arr!19966 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41705 (_ BitVec 32)) Bool)

(assert (=> b!747984 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25644 0))(
  ( (Unit!25645) )
))
(declare-fun lt!332488 () Unit!25644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25644)

(assert (=> b!747984 (= lt!332488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747985 () Bool)

(declare-fun res!504505 () Bool)

(assert (=> b!747985 (=> (not res!504505) (not e!417546))))

(declare-fun arrayContainsKey!0 (array!41705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747985 (= res!504505 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747986 () Bool)

(declare-fun res!504504 () Bool)

(declare-fun e!417549 () Bool)

(assert (=> b!747986 (=> (not res!504504) (not e!417549))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!747986 (= res!504504 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19966 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747987 () Bool)

(assert (=> b!747987 (= e!417549 e!417547)))

(declare-fun res!504508 () Bool)

(assert (=> b!747987 (=> (not res!504508) (not e!417547))))

(declare-fun lt!332486 () SeekEntryResult!7566)

(assert (=> b!747987 (= res!504508 (= lt!332486 lt!332490))))

(declare-fun lt!332489 () array!41705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41705 (_ BitVec 32)) SeekEntryResult!7566)

(assert (=> b!747987 (= lt!332490 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332492 lt!332489 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747987 (= lt!332486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332492 mask!3328) lt!332492 lt!332489 mask!3328))))

(assert (=> b!747987 (= lt!332492 (select (store (arr!19966 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747987 (= lt!332489 (array!41706 (store (arr!19966 a!3186) i!1173 k0!2102) (size!20387 a!3186)))))

(declare-fun b!747988 () Bool)

(declare-fun res!504506 () Bool)

(assert (=> b!747988 (=> (not res!504506) (not e!417546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747988 (= res!504506 (validKeyInArray!0 (select (arr!19966 a!3186) j!159)))))

(declare-fun b!747989 () Bool)

(declare-fun res!504507 () Bool)

(assert (=> b!747989 (=> (not res!504507) (not e!417546))))

(assert (=> b!747989 (= res!504507 (and (= (size!20387 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20387 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20387 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747990 () Bool)

(declare-fun lt!332495 () SeekEntryResult!7566)

(declare-fun e!417543 () Bool)

(assert (=> b!747990 (= e!417543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332495))))

(declare-fun b!747991 () Bool)

(declare-fun res!504499 () Bool)

(assert (=> b!747991 (=> (not res!504499) (not e!417549))))

(assert (=> b!747991 (= res!504499 e!417543)))

(declare-fun c!82126 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747991 (= c!82126 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747992 () Bool)

(assert (=> b!747992 (= e!417544 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747992 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332493 () Unit!25644)

(declare-fun e!417550 () Unit!25644)

(assert (=> b!747992 (= lt!332493 e!417550)))

(declare-fun c!82125 () Bool)

(assert (=> b!747992 (= c!82125 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747993 () Bool)

(declare-fun Unit!25646 () Unit!25644)

(assert (=> b!747993 (= e!417550 Unit!25646)))

(assert (=> b!747993 false))

(declare-fun b!747994 () Bool)

(declare-fun res!504500 () Bool)

(assert (=> b!747994 (=> res!504500 e!417544)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41705 (_ BitVec 32)) SeekEntryResult!7566)

(assert (=> b!747994 (= res!504500 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332491)))))

(declare-fun b!747995 () Bool)

(assert (=> b!747995 (= e!417548 e!417549)))

(declare-fun res!504493 () Bool)

(assert (=> b!747995 (=> (not res!504493) (not e!417549))))

(assert (=> b!747995 (= res!504493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19966 a!3186) j!159) mask!3328) (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332495))))

(assert (=> b!747995 (= lt!332495 (Intermediate!7566 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747996 () Bool)

(declare-fun Unit!25647 () Unit!25644)

(assert (=> b!747996 (= e!417550 Unit!25647)))

(declare-fun b!747997 () Bool)

(assert (=> b!747997 (= e!417543 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) (Found!7566 j!159)))))

(declare-fun b!747998 () Bool)

(declare-fun res!504503 () Bool)

(assert (=> b!747998 (=> (not res!504503) (not e!417548))))

(assert (=> b!747998 (= res!504503 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20387 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20387 a!3186))))))

(declare-fun b!747999 () Bool)

(assert (=> b!747999 (= e!417546 e!417548)))

(declare-fun res!504502 () Bool)

(assert (=> b!747999 (=> (not res!504502) (not e!417548))))

(declare-fun lt!332494 () SeekEntryResult!7566)

(assert (=> b!747999 (= res!504502 (or (= lt!332494 (MissingZero!7566 i!1173)) (= lt!332494 (MissingVacant!7566 i!1173))))))

(assert (=> b!747999 (= lt!332494 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748000 () Bool)

(declare-fun res!504509 () Bool)

(assert (=> b!748000 (=> (not res!504509) (not e!417546))))

(assert (=> b!748000 (= res!504509 (validKeyInArray!0 k0!2102))))

(declare-fun b!748001 () Bool)

(assert (=> b!748001 (= e!417545 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332491))))

(declare-fun b!748002 () Bool)

(declare-fun res!504494 () Bool)

(assert (=> b!748002 (=> (not res!504494) (not e!417548))))

(assert (=> b!748002 (= res!504494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65532 res!504497) b!747989))

(assert (= (and b!747989 res!504507) b!747988))

(assert (= (and b!747988 res!504506) b!748000))

(assert (= (and b!748000 res!504509) b!747985))

(assert (= (and b!747985 res!504505) b!747999))

(assert (= (and b!747999 res!504502) b!748002))

(assert (= (and b!748002 res!504494) b!747983))

(assert (= (and b!747983 res!504498) b!747998))

(assert (= (and b!747998 res!504503) b!747995))

(assert (= (and b!747995 res!504493) b!747986))

(assert (= (and b!747986 res!504504) b!747991))

(assert (= (and b!747991 c!82126) b!747990))

(assert (= (and b!747991 (not c!82126)) b!747997))

(assert (= (and b!747991 res!504499) b!747987))

(assert (= (and b!747987 res!504508) b!747984))

(assert (= (and b!747984 res!504495) b!748001))

(assert (= (and b!747984 (not res!504496)) b!747994))

(assert (= (and b!747994 (not res!504500)) b!747982))

(assert (= (and b!747982 (not res!504501)) b!747992))

(assert (= (and b!747992 c!82125) b!747993))

(assert (= (and b!747992 (not c!82125)) b!747996))

(declare-fun m!697933 () Bool)

(assert (=> b!747982 m!697933))

(declare-fun m!697935 () Bool)

(assert (=> b!747982 m!697935))

(declare-fun m!697937 () Bool)

(assert (=> start!65532 m!697937))

(declare-fun m!697939 () Bool)

(assert (=> start!65532 m!697939))

(declare-fun m!697941 () Bool)

(assert (=> b!747995 m!697941))

(assert (=> b!747995 m!697941))

(declare-fun m!697943 () Bool)

(assert (=> b!747995 m!697943))

(assert (=> b!747995 m!697943))

(assert (=> b!747995 m!697941))

(declare-fun m!697945 () Bool)

(assert (=> b!747995 m!697945))

(declare-fun m!697947 () Bool)

(assert (=> b!747986 m!697947))

(declare-fun m!697949 () Bool)

(assert (=> b!748002 m!697949))

(assert (=> b!747988 m!697941))

(assert (=> b!747988 m!697941))

(declare-fun m!697951 () Bool)

(assert (=> b!747988 m!697951))

(assert (=> b!747997 m!697941))

(assert (=> b!747997 m!697941))

(declare-fun m!697953 () Bool)

(assert (=> b!747997 m!697953))

(declare-fun m!697955 () Bool)

(assert (=> b!747999 m!697955))

(assert (=> b!747992 m!697933))

(assert (=> b!747992 m!697935))

(assert (=> b!747994 m!697941))

(assert (=> b!747994 m!697941))

(assert (=> b!747994 m!697953))

(declare-fun m!697957 () Bool)

(assert (=> b!747987 m!697957))

(declare-fun m!697959 () Bool)

(assert (=> b!747987 m!697959))

(assert (=> b!747987 m!697933))

(assert (=> b!747987 m!697957))

(declare-fun m!697961 () Bool)

(assert (=> b!747987 m!697961))

(declare-fun m!697963 () Bool)

(assert (=> b!747987 m!697963))

(declare-fun m!697965 () Bool)

(assert (=> b!748000 m!697965))

(assert (=> b!747984 m!697941))

(assert (=> b!747984 m!697941))

(declare-fun m!697967 () Bool)

(assert (=> b!747984 m!697967))

(declare-fun m!697969 () Bool)

(assert (=> b!747984 m!697969))

(declare-fun m!697971 () Bool)

(assert (=> b!747984 m!697971))

(assert (=> b!747990 m!697941))

(assert (=> b!747990 m!697941))

(declare-fun m!697973 () Bool)

(assert (=> b!747990 m!697973))

(declare-fun m!697975 () Bool)

(assert (=> b!747985 m!697975))

(declare-fun m!697977 () Bool)

(assert (=> b!747983 m!697977))

(assert (=> b!748001 m!697941))

(assert (=> b!748001 m!697941))

(declare-fun m!697979 () Bool)

(assert (=> b!748001 m!697979))

(check-sat (not b!747987) (not b!748000) (not b!748002) (not b!747983) (not b!747990) (not b!747985) (not b!747997) (not b!747999) (not b!748001) (not b!747995) (not b!747988) (not b!747994) (not b!747984) (not start!65532))
(check-sat)
