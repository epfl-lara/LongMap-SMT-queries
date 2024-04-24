; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65898 () Bool)

(assert start!65898)

(declare-fun b!756723 () Bool)

(declare-fun e!422035 () Bool)

(declare-fun e!422042 () Bool)

(assert (=> b!756723 (= e!422035 e!422042)))

(declare-fun res!511374 () Bool)

(assert (=> b!756723 (=> (not res!511374) (not e!422042))))

(declare-datatypes ((SeekEntryResult!7636 0))(
  ( (MissingZero!7636 (index!32912 (_ BitVec 32))) (Found!7636 (index!32913 (_ BitVec 32))) (Intermediate!7636 (undefined!8448 Bool) (index!32914 (_ BitVec 32)) (x!63974 (_ BitVec 32))) (Undefined!7636) (MissingVacant!7636 (index!32915 (_ BitVec 32))) )
))
(declare-fun lt!336861 () SeekEntryResult!7636)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756723 (= res!511374 (or (= lt!336861 (MissingZero!7636 i!1173)) (= lt!336861 (MissingVacant!7636 i!1173))))))

(declare-datatypes ((array!41941 0))(
  ( (array!41942 (arr!20080 (Array (_ BitVec 32) (_ BitVec 64))) (size!20500 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41941)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!756723 (= lt!336861 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756724 () Bool)

(declare-fun res!511383 () Bool)

(assert (=> b!756724 (=> (not res!511383) (not e!422035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756724 (= res!511383 (validKeyInArray!0 k0!2102))))

(declare-fun b!756725 () Bool)

(declare-datatypes ((Unit!26101 0))(
  ( (Unit!26102) )
))
(declare-fun e!422032 () Unit!26101)

(declare-fun Unit!26103 () Unit!26101)

(assert (=> b!756725 (= e!422032 Unit!26103)))

(assert (=> b!756725 false))

(declare-fun b!756726 () Bool)

(declare-fun e!422038 () Bool)

(declare-fun e!422040 () Bool)

(assert (=> b!756726 (= e!422038 e!422040)))

(declare-fun res!511372 () Bool)

(assert (=> b!756726 (=> (not res!511372) (not e!422040))))

(declare-fun lt!336867 () SeekEntryResult!7636)

(declare-fun lt!336859 () SeekEntryResult!7636)

(assert (=> b!756726 (= res!511372 (= lt!336867 lt!336859))))

(declare-fun lt!336866 () array!41941)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336863 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!756726 (= lt!336859 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336863 lt!336866 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756726 (= lt!336867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336863 mask!3328) lt!336863 lt!336866 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756726 (= lt!336863 (select (store (arr!20080 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756726 (= lt!336866 (array!41942 (store (arr!20080 a!3186) i!1173 k0!2102) (size!20500 a!3186)))))

(declare-fun b!756727 () Bool)

(declare-fun res!511366 () Bool)

(declare-fun e!422041 () Bool)

(assert (=> b!756727 (=> (not res!511366) (not e!422041))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7636)

(assert (=> b!756727 (= res!511366 (= (seekEntryOrOpen!0 lt!336863 lt!336866 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336863 lt!336866 mask!3328)))))

(declare-fun b!756728 () Bool)

(declare-fun e!422033 () Bool)

(assert (=> b!756728 (= e!422040 (not e!422033))))

(declare-fun res!511376 () Bool)

(assert (=> b!756728 (=> res!511376 e!422033)))

(get-info :version)

(assert (=> b!756728 (= res!511376 (or (not ((_ is Intermediate!7636) lt!336859)) (bvslt x!1131 (x!63974 lt!336859)) (not (= x!1131 (x!63974 lt!336859))) (not (= index!1321 (index!32914 lt!336859)))))))

(declare-fun e!422036 () Bool)

(assert (=> b!756728 e!422036))

(declare-fun res!511370 () Bool)

(assert (=> b!756728 (=> (not res!511370) (not e!422036))))

(declare-fun lt!336869 () SeekEntryResult!7636)

(declare-fun lt!336870 () SeekEntryResult!7636)

(assert (=> b!756728 (= res!511370 (= lt!336869 lt!336870))))

(assert (=> b!756728 (= lt!336870 (Found!7636 j!159))))

(assert (=> b!756728 (= lt!336869 (seekEntryOrOpen!0 (select (arr!20080 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41941 (_ BitVec 32)) Bool)

(assert (=> b!756728 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336864 () Unit!26101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26101)

(assert (=> b!756728 (= lt!336864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!422043 () Bool)

(declare-fun lt!336865 () SeekEntryResult!7636)

(declare-fun b!756729 () Bool)

(assert (=> b!756729 (= e!422043 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336865))))

(declare-fun b!756730 () Bool)

(assert (=> b!756730 (= e!422042 e!422038)))

(declare-fun res!511380 () Bool)

(assert (=> b!756730 (=> (not res!511380) (not e!422038))))

(assert (=> b!756730 (= res!511380 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20080 a!3186) j!159) mask!3328) (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336865))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756730 (= lt!336865 (Intermediate!7636 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756731 () Bool)

(declare-fun lt!336862 () SeekEntryResult!7636)

(assert (=> b!756731 (= e!422041 (= lt!336869 lt!336862))))

(declare-fun b!756732 () Bool)

(declare-fun res!511375 () Bool)

(assert (=> b!756732 (=> (not res!511375) (not e!422042))))

(assert (=> b!756732 (= res!511375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756733 () Bool)

(declare-fun res!511381 () Bool)

(assert (=> b!756733 (=> (not res!511381) (not e!422035))))

(assert (=> b!756733 (= res!511381 (validKeyInArray!0 (select (arr!20080 a!3186) j!159)))))

(declare-fun b!756734 () Bool)

(declare-fun res!511368 () Bool)

(assert (=> b!756734 (=> (not res!511368) (not e!422042))))

(declare-datatypes ((List!13989 0))(
  ( (Nil!13986) (Cons!13985 (h!15063 (_ BitVec 64)) (t!20296 List!13989)) )
))
(declare-fun arrayNoDuplicates!0 (array!41941 (_ BitVec 32) List!13989) Bool)

(assert (=> b!756734 (= res!511368 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13986))))

(declare-fun res!511369 () Bool)

(assert (=> start!65898 (=> (not res!511369) (not e!422035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65898 (= res!511369 (validMask!0 mask!3328))))

(assert (=> start!65898 e!422035))

(assert (=> start!65898 true))

(declare-fun array_inv!15939 (array!41941) Bool)

(assert (=> start!65898 (array_inv!15939 a!3186)))

(declare-fun b!756735 () Bool)

(assert (=> b!756735 (= e!422036 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336870))))

(declare-fun b!756736 () Bool)

(declare-fun Unit!26104 () Unit!26101)

(assert (=> b!756736 (= e!422032 Unit!26104)))

(declare-fun b!756737 () Bool)

(declare-fun res!511378 () Bool)

(assert (=> b!756737 (=> (not res!511378) (not e!422035))))

(declare-fun arrayContainsKey!0 (array!41941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756737 (= res!511378 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756738 () Bool)

(declare-fun res!511384 () Bool)

(assert (=> b!756738 (=> (not res!511384) (not e!422038))))

(assert (=> b!756738 (= res!511384 e!422043)))

(declare-fun c!83062 () Bool)

(assert (=> b!756738 (= c!83062 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756739 () Bool)

(declare-fun e!422034 () Bool)

(assert (=> b!756739 (= e!422033 e!422034)))

(declare-fun res!511373 () Bool)

(assert (=> b!756739 (=> res!511373 e!422034)))

(assert (=> b!756739 (= res!511373 (not (= lt!336862 lt!336870)))))

(assert (=> b!756739 (= lt!336862 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756740 () Bool)

(assert (=> b!756740 (= e!422043 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) (Found!7636 j!159)))))

(declare-fun b!756741 () Bool)

(declare-fun res!511377 () Bool)

(assert (=> b!756741 (=> (not res!511377) (not e!422038))))

(assert (=> b!756741 (= res!511377 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20080 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756742 () Bool)

(declare-fun res!511371 () Bool)

(assert (=> b!756742 (=> (not res!511371) (not e!422035))))

(assert (=> b!756742 (= res!511371 (and (= (size!20500 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20500 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20500 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756743 () Bool)

(declare-fun e!422039 () Bool)

(assert (=> b!756743 (= e!422034 e!422039)))

(declare-fun res!511379 () Bool)

(assert (=> b!756743 (=> res!511379 e!422039)))

(declare-fun lt!336868 () (_ BitVec 64))

(assert (=> b!756743 (= res!511379 (= lt!336868 lt!336863))))

(assert (=> b!756743 (= lt!336868 (select (store (arr!20080 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756744 () Bool)

(assert (=> b!756744 (= e!422039 true)))

(assert (=> b!756744 e!422041))

(declare-fun res!511367 () Bool)

(assert (=> b!756744 (=> (not res!511367) (not e!422041))))

(assert (=> b!756744 (= res!511367 (= lt!336868 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336860 () Unit!26101)

(assert (=> b!756744 (= lt!336860 e!422032)))

(declare-fun c!83063 () Bool)

(assert (=> b!756744 (= c!83063 (= lt!336868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756745 () Bool)

(declare-fun res!511382 () Bool)

(assert (=> b!756745 (=> (not res!511382) (not e!422042))))

(assert (=> b!756745 (= res!511382 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20500 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20500 a!3186))))))

(assert (= (and start!65898 res!511369) b!756742))

(assert (= (and b!756742 res!511371) b!756733))

(assert (= (and b!756733 res!511381) b!756724))

(assert (= (and b!756724 res!511383) b!756737))

(assert (= (and b!756737 res!511378) b!756723))

(assert (= (and b!756723 res!511374) b!756732))

(assert (= (and b!756732 res!511375) b!756734))

(assert (= (and b!756734 res!511368) b!756745))

(assert (= (and b!756745 res!511382) b!756730))

(assert (= (and b!756730 res!511380) b!756741))

(assert (= (and b!756741 res!511377) b!756738))

(assert (= (and b!756738 c!83062) b!756729))

(assert (= (and b!756738 (not c!83062)) b!756740))

(assert (= (and b!756738 res!511384) b!756726))

(assert (= (and b!756726 res!511372) b!756728))

(assert (= (and b!756728 res!511370) b!756735))

(assert (= (and b!756728 (not res!511376)) b!756739))

(assert (= (and b!756739 (not res!511373)) b!756743))

(assert (= (and b!756743 (not res!511379)) b!756744))

(assert (= (and b!756744 c!83063) b!756725))

(assert (= (and b!756744 (not c!83063)) b!756736))

(assert (= (and b!756744 res!511367) b!756727))

(assert (= (and b!756727 res!511366) b!756731))

(declare-fun m!705207 () Bool)

(assert (=> b!756734 m!705207))

(declare-fun m!705209 () Bool)

(assert (=> b!756723 m!705209))

(declare-fun m!705211 () Bool)

(assert (=> b!756724 m!705211))

(declare-fun m!705213 () Bool)

(assert (=> b!756727 m!705213))

(declare-fun m!705215 () Bool)

(assert (=> b!756727 m!705215))

(declare-fun m!705217 () Bool)

(assert (=> b!756730 m!705217))

(assert (=> b!756730 m!705217))

(declare-fun m!705219 () Bool)

(assert (=> b!756730 m!705219))

(assert (=> b!756730 m!705219))

(assert (=> b!756730 m!705217))

(declare-fun m!705221 () Bool)

(assert (=> b!756730 m!705221))

(declare-fun m!705223 () Bool)

(assert (=> b!756743 m!705223))

(declare-fun m!705225 () Bool)

(assert (=> b!756743 m!705225))

(assert (=> b!756739 m!705217))

(assert (=> b!756739 m!705217))

(declare-fun m!705227 () Bool)

(assert (=> b!756739 m!705227))

(declare-fun m!705229 () Bool)

(assert (=> b!756741 m!705229))

(declare-fun m!705231 () Bool)

(assert (=> b!756737 m!705231))

(assert (=> b!756735 m!705217))

(assert (=> b!756735 m!705217))

(declare-fun m!705233 () Bool)

(assert (=> b!756735 m!705233))

(declare-fun m!705235 () Bool)

(assert (=> b!756732 m!705235))

(assert (=> b!756729 m!705217))

(assert (=> b!756729 m!705217))

(declare-fun m!705237 () Bool)

(assert (=> b!756729 m!705237))

(assert (=> b!756740 m!705217))

(assert (=> b!756740 m!705217))

(assert (=> b!756740 m!705227))

(assert (=> b!756733 m!705217))

(assert (=> b!756733 m!705217))

(declare-fun m!705239 () Bool)

(assert (=> b!756733 m!705239))

(declare-fun m!705241 () Bool)

(assert (=> start!65898 m!705241))

(declare-fun m!705243 () Bool)

(assert (=> start!65898 m!705243))

(declare-fun m!705245 () Bool)

(assert (=> b!756726 m!705245))

(assert (=> b!756726 m!705223))

(declare-fun m!705247 () Bool)

(assert (=> b!756726 m!705247))

(declare-fun m!705249 () Bool)

(assert (=> b!756726 m!705249))

(declare-fun m!705251 () Bool)

(assert (=> b!756726 m!705251))

(assert (=> b!756726 m!705249))

(assert (=> b!756728 m!705217))

(assert (=> b!756728 m!705217))

(declare-fun m!705253 () Bool)

(assert (=> b!756728 m!705253))

(declare-fun m!705255 () Bool)

(assert (=> b!756728 m!705255))

(declare-fun m!705257 () Bool)

(assert (=> b!756728 m!705257))

(check-sat (not b!756730) (not b!756735) (not b!756723) (not b!756737) (not b!756739) (not b!756734) (not b!756727) (not b!756728) (not start!65898) (not b!756732) (not b!756729) (not b!756740) (not b!756726) (not b!756733) (not b!756724))
(check-sat)
