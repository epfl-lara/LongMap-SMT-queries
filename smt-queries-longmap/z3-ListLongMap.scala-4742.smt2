; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65492 () Bool)

(assert start!65492)

(declare-fun b!747093 () Bool)

(declare-fun res!503875 () Bool)

(declare-fun e!417116 () Bool)

(assert (=> b!747093 (=> (not res!503875) (not e!417116))))

(declare-datatypes ((array!41682 0))(
  ( (array!41683 (arr!19955 (Array (_ BitVec 32) (_ BitVec 64))) (size!20376 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41682)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747093 (= res!503875 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747094 () Bool)

(declare-fun e!417113 () Bool)

(declare-fun e!417118 () Bool)

(assert (=> b!747094 (= e!417113 (not e!417118))))

(declare-fun res!503878 () Bool)

(assert (=> b!747094 (=> res!503878 e!417118)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7552 0))(
  ( (MissingZero!7552 (index!32576 (_ BitVec 32))) (Found!7552 (index!32577 (_ BitVec 32))) (Intermediate!7552 (undefined!8364 Bool) (index!32578 (_ BitVec 32)) (x!63529 (_ BitVec 32))) (Undefined!7552) (MissingVacant!7552 (index!32579 (_ BitVec 32))) )
))
(declare-fun lt!331953 () SeekEntryResult!7552)

(get-info :version)

(assert (=> b!747094 (= res!503878 (or (not ((_ is Intermediate!7552) lt!331953)) (bvslt x!1131 (x!63529 lt!331953)) (not (= x!1131 (x!63529 lt!331953))) (not (= index!1321 (index!32578 lt!331953)))))))

(declare-fun e!417110 () Bool)

(assert (=> b!747094 e!417110))

(declare-fun res!503872 () Bool)

(assert (=> b!747094 (=> (not res!503872) (not e!417110))))

(declare-fun lt!331948 () SeekEntryResult!7552)

(declare-fun lt!331951 () SeekEntryResult!7552)

(assert (=> b!747094 (= res!503872 (= lt!331948 lt!331951))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747094 (= lt!331951 (Found!7552 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41682 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!747094 (= lt!331948 (seekEntryOrOpen!0 (select (arr!19955 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41682 (_ BitVec 32)) Bool)

(assert (=> b!747094 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25568 0))(
  ( (Unit!25569) )
))
(declare-fun lt!331947 () Unit!25568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25568)

(assert (=> b!747094 (= lt!331947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747095 () Bool)

(declare-fun e!417115 () Unit!25568)

(declare-fun Unit!25570 () Unit!25568)

(assert (=> b!747095 (= e!417115 Unit!25570)))

(declare-fun b!747097 () Bool)

(declare-fun e!417111 () Bool)

(assert (=> b!747097 (= e!417116 e!417111)))

(declare-fun res!503865 () Bool)

(assert (=> b!747097 (=> (not res!503865) (not e!417111))))

(declare-fun lt!331955 () SeekEntryResult!7552)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747097 (= res!503865 (or (= lt!331955 (MissingZero!7552 i!1173)) (= lt!331955 (MissingVacant!7552 i!1173))))))

(assert (=> b!747097 (= lt!331955 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!747098 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41682 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!747098 (= e!417110 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!331951))))

(declare-fun b!747099 () Bool)

(assert (=> b!747099 (= e!417118 true)))

(assert (=> b!747099 (= (select (store (arr!19955 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331950 () Unit!25568)

(assert (=> b!747099 (= lt!331950 e!417115)))

(declare-fun c!81995 () Bool)

(assert (=> b!747099 (= c!81995 (= (select (store (arr!19955 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747100 () Bool)

(declare-fun res!503879 () Bool)

(declare-fun e!417112 () Bool)

(assert (=> b!747100 (=> (not res!503879) (not e!417112))))

(declare-fun e!417114 () Bool)

(assert (=> b!747100 (= res!503879 e!417114)))

(declare-fun c!81996 () Bool)

(assert (=> b!747100 (= c!81996 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747101 () Bool)

(declare-fun res!503869 () Bool)

(assert (=> b!747101 (=> (not res!503869) (not e!417111))))

(declare-datatypes ((List!13996 0))(
  ( (Nil!13993) (Cons!13992 (h!15064 (_ BitVec 64)) (t!20302 List!13996)) )
))
(declare-fun arrayNoDuplicates!0 (array!41682 (_ BitVec 32) List!13996) Bool)

(assert (=> b!747101 (= res!503869 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13993))))

(declare-fun b!747102 () Bool)

(declare-fun res!503880 () Bool)

(assert (=> b!747102 (=> (not res!503880) (not e!417116))))

(assert (=> b!747102 (= res!503880 (and (= (size!20376 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20376 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20376 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747103 () Bool)

(declare-fun Unit!25571 () Unit!25568)

(assert (=> b!747103 (= e!417115 Unit!25571)))

(assert (=> b!747103 false))

(declare-fun res!503873 () Bool)

(assert (=> start!65492 (=> (not res!503873) (not e!417116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65492 (= res!503873 (validMask!0 mask!3328))))

(assert (=> start!65492 e!417116))

(assert (=> start!65492 true))

(declare-fun array_inv!15838 (array!41682) Bool)

(assert (=> start!65492 (array_inv!15838 a!3186)))

(declare-fun b!747096 () Bool)

(declare-fun res!503867 () Bool)

(assert (=> b!747096 (=> (not res!503867) (not e!417111))))

(assert (=> b!747096 (= res!503867 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20376 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20376 a!3186))))))

(declare-fun b!747104 () Bool)

(declare-fun lt!331949 () SeekEntryResult!7552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41682 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!747104 (= e!417114 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!331949))))

(declare-fun b!747105 () Bool)

(declare-fun res!503864 () Bool)

(assert (=> b!747105 (=> res!503864 e!417118)))

(declare-fun lt!331952 () (_ BitVec 64))

(assert (=> b!747105 (= res!503864 (= (select (store (arr!19955 a!3186) i!1173 k0!2102) index!1321) lt!331952))))

(declare-fun b!747106 () Bool)

(declare-fun res!503877 () Bool)

(assert (=> b!747106 (=> (not res!503877) (not e!417116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747106 (= res!503877 (validKeyInArray!0 (select (arr!19955 a!3186) j!159)))))

(declare-fun b!747107 () Bool)

(assert (=> b!747107 (= e!417111 e!417112)))

(declare-fun res!503876 () Bool)

(assert (=> b!747107 (=> (not res!503876) (not e!417112))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747107 (= res!503876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19955 a!3186) j!159) mask!3328) (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!331949))))

(assert (=> b!747107 (= lt!331949 (Intermediate!7552 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747108 () Bool)

(assert (=> b!747108 (= e!417112 e!417113)))

(declare-fun res!503868 () Bool)

(assert (=> b!747108 (=> (not res!503868) (not e!417113))))

(declare-fun lt!331946 () SeekEntryResult!7552)

(assert (=> b!747108 (= res!503868 (= lt!331946 lt!331953))))

(declare-fun lt!331954 () array!41682)

(assert (=> b!747108 (= lt!331953 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331952 lt!331954 mask!3328))))

(assert (=> b!747108 (= lt!331946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331952 mask!3328) lt!331952 lt!331954 mask!3328))))

(assert (=> b!747108 (= lt!331952 (select (store (arr!19955 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747108 (= lt!331954 (array!41683 (store (arr!19955 a!3186) i!1173 k0!2102) (size!20376 a!3186)))))

(declare-fun b!747109 () Bool)

(assert (=> b!747109 (= e!417114 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) (Found!7552 j!159)))))

(declare-fun b!747110 () Bool)

(declare-fun res!503874 () Bool)

(assert (=> b!747110 (=> (not res!503874) (not e!417111))))

(assert (=> b!747110 (= res!503874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747111 () Bool)

(declare-fun res!503871 () Bool)

(assert (=> b!747111 (=> (not res!503871) (not e!417116))))

(assert (=> b!747111 (= res!503871 (validKeyInArray!0 k0!2102))))

(declare-fun b!747112 () Bool)

(declare-fun res!503866 () Bool)

(assert (=> b!747112 (=> res!503866 e!417118)))

(assert (=> b!747112 (= res!503866 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19955 a!3186) j!159) a!3186 mask!3328) lt!331951)))))

(declare-fun b!747113 () Bool)

(declare-fun res!503870 () Bool)

(assert (=> b!747113 (=> (not res!503870) (not e!417112))))

(assert (=> b!747113 (= res!503870 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19955 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65492 res!503873) b!747102))

(assert (= (and b!747102 res!503880) b!747106))

(assert (= (and b!747106 res!503877) b!747111))

(assert (= (and b!747111 res!503871) b!747093))

(assert (= (and b!747093 res!503875) b!747097))

(assert (= (and b!747097 res!503865) b!747110))

(assert (= (and b!747110 res!503874) b!747101))

(assert (= (and b!747101 res!503869) b!747096))

(assert (= (and b!747096 res!503867) b!747107))

(assert (= (and b!747107 res!503876) b!747113))

(assert (= (and b!747113 res!503870) b!747100))

(assert (= (and b!747100 c!81996) b!747104))

(assert (= (and b!747100 (not c!81996)) b!747109))

(assert (= (and b!747100 res!503879) b!747108))

(assert (= (and b!747108 res!503868) b!747094))

(assert (= (and b!747094 res!503872) b!747098))

(assert (= (and b!747094 (not res!503878)) b!747112))

(assert (= (and b!747112 (not res!503866)) b!747105))

(assert (= (and b!747105 (not res!503864)) b!747099))

(assert (= (and b!747099 c!81995) b!747103))

(assert (= (and b!747099 (not c!81995)) b!747095))

(declare-fun m!696689 () Bool)

(assert (=> b!747106 m!696689))

(assert (=> b!747106 m!696689))

(declare-fun m!696691 () Bool)

(assert (=> b!747106 m!696691))

(declare-fun m!696693 () Bool)

(assert (=> b!747105 m!696693))

(declare-fun m!696695 () Bool)

(assert (=> b!747105 m!696695))

(declare-fun m!696697 () Bool)

(assert (=> b!747110 m!696697))

(declare-fun m!696699 () Bool)

(assert (=> b!747111 m!696699))

(assert (=> b!747107 m!696689))

(assert (=> b!747107 m!696689))

(declare-fun m!696701 () Bool)

(assert (=> b!747107 m!696701))

(assert (=> b!747107 m!696701))

(assert (=> b!747107 m!696689))

(declare-fun m!696703 () Bool)

(assert (=> b!747107 m!696703))

(declare-fun m!696705 () Bool)

(assert (=> start!65492 m!696705))

(declare-fun m!696707 () Bool)

(assert (=> start!65492 m!696707))

(assert (=> b!747109 m!696689))

(assert (=> b!747109 m!696689))

(declare-fun m!696709 () Bool)

(assert (=> b!747109 m!696709))

(assert (=> b!747094 m!696689))

(assert (=> b!747094 m!696689))

(declare-fun m!696711 () Bool)

(assert (=> b!747094 m!696711))

(declare-fun m!696713 () Bool)

(assert (=> b!747094 m!696713))

(declare-fun m!696715 () Bool)

(assert (=> b!747094 m!696715))

(declare-fun m!696717 () Bool)

(assert (=> b!747093 m!696717))

(assert (=> b!747098 m!696689))

(assert (=> b!747098 m!696689))

(declare-fun m!696719 () Bool)

(assert (=> b!747098 m!696719))

(assert (=> b!747104 m!696689))

(assert (=> b!747104 m!696689))

(declare-fun m!696721 () Bool)

(assert (=> b!747104 m!696721))

(assert (=> b!747112 m!696689))

(assert (=> b!747112 m!696689))

(assert (=> b!747112 m!696709))

(declare-fun m!696723 () Bool)

(assert (=> b!747101 m!696723))

(declare-fun m!696725 () Bool)

(assert (=> b!747097 m!696725))

(declare-fun m!696727 () Bool)

(assert (=> b!747113 m!696727))

(assert (=> b!747099 m!696693))

(assert (=> b!747099 m!696695))

(declare-fun m!696729 () Bool)

(assert (=> b!747108 m!696729))

(assert (=> b!747108 m!696693))

(assert (=> b!747108 m!696729))

(declare-fun m!696731 () Bool)

(assert (=> b!747108 m!696731))

(declare-fun m!696733 () Bool)

(assert (=> b!747108 m!696733))

(declare-fun m!696735 () Bool)

(assert (=> b!747108 m!696735))

(check-sat (not b!747112) (not b!747108) (not b!747109) (not b!747094) (not b!747101) (not b!747104) (not b!747111) (not b!747106) (not b!747107) (not b!747097) (not b!747093) (not b!747110) (not start!65492) (not b!747098))
(check-sat)
