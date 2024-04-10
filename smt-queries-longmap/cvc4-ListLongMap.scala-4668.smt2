; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64928 () Bool)

(assert start!64928)

(declare-fun b!732867 () Bool)

(declare-fun e!410090 () Bool)

(declare-fun e!410081 () Bool)

(assert (=> b!732867 (= e!410090 (not e!410081))))

(declare-fun res!492417 () Bool)

(assert (=> b!732867 (=> res!492417 e!410081)))

(declare-datatypes ((SeekEntryResult!7336 0))(
  ( (MissingZero!7336 (index!31712 (_ BitVec 32))) (Found!7336 (index!31713 (_ BitVec 32))) (Intermediate!7336 (undefined!8148 Bool) (index!31714 (_ BitVec 32)) (x!62702 (_ BitVec 32))) (Undefined!7336) (MissingVacant!7336 (index!31715 (_ BitVec 32))) )
))
(declare-fun lt!324788 () SeekEntryResult!7336)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!732867 (= res!492417 (or (not (is-Intermediate!7336 lt!324788)) (bvsge x!1131 (x!62702 lt!324788))))))

(declare-fun e!410085 () Bool)

(assert (=> b!732867 e!410085))

(declare-fun res!492421 () Bool)

(assert (=> b!732867 (=> (not res!492421) (not e!410085))))

(declare-datatypes ((array!41239 0))(
  ( (array!41240 (arr!19736 (Array (_ BitVec 32) (_ BitVec 64))) (size!20157 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41239)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41239 (_ BitVec 32)) Bool)

(assert (=> b!732867 (= res!492421 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24990 0))(
  ( (Unit!24991) )
))
(declare-fun lt!324794 () Unit!24990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24990)

(assert (=> b!732867 (= lt!324794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732868 () Bool)

(declare-fun e!410089 () Bool)

(assert (=> b!732868 (= e!410089 e!410090)))

(declare-fun res!492428 () Bool)

(assert (=> b!732868 (=> (not res!492428) (not e!410090))))

(declare-fun lt!324789 () SeekEntryResult!7336)

(assert (=> b!732868 (= res!492428 (= lt!324789 lt!324788))))

(declare-fun lt!324792 () array!41239)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!324793 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!732868 (= lt!324788 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324793 lt!324792 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732868 (= lt!324789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324793 mask!3328) lt!324793 lt!324792 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732868 (= lt!324793 (select (store (arr!19736 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732868 (= lt!324792 (array!41240 (store (arr!19736 a!3186) i!1173 k!2102) (size!20157 a!3186)))))

(declare-fun b!732869 () Bool)

(declare-fun res!492425 () Bool)

(declare-fun e!410088 () Bool)

(assert (=> b!732869 (=> (not res!492425) (not e!410088))))

(assert (=> b!732869 (= res!492425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732870 () Bool)

(assert (=> b!732870 (= e!410088 e!410089)))

(declare-fun res!492412 () Bool)

(assert (=> b!732870 (=> (not res!492412) (not e!410089))))

(declare-fun lt!324790 () SeekEntryResult!7336)

(assert (=> b!732870 (= res!492412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19736 a!3186) j!159) mask!3328) (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324790))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732870 (= lt!324790 (Intermediate!7336 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732871 () Bool)

(declare-fun e!410086 () Bool)

(assert (=> b!732871 (= e!410086 true)))

(declare-fun lt!324795 () SeekEntryResult!7336)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!732871 (= lt!324795 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732872 () Bool)

(declare-fun res!492416 () Bool)

(assert (=> b!732872 (=> (not res!492416) (not e!410089))))

(declare-fun e!410083 () Bool)

(assert (=> b!732872 (= res!492416 e!410083)))

(declare-fun c!80605 () Bool)

(assert (=> b!732872 (= c!80605 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732873 () Bool)

(assert (=> b!732873 (= e!410081 e!410086)))

(declare-fun res!492414 () Bool)

(assert (=> b!732873 (=> res!492414 e!410086)))

(assert (=> b!732873 (= res!492414 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324797 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732873 (= lt!324797 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732874 () Bool)

(declare-fun e!410082 () Bool)

(declare-fun lt!324796 () SeekEntryResult!7336)

(assert (=> b!732874 (= e!410082 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324796))))

(declare-fun b!732875 () Bool)

(assert (=> b!732875 (= e!410083 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) (Found!7336 j!159)))))

(declare-fun b!732877 () Bool)

(assert (=> b!732877 (= e!410083 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324790))))

(declare-fun b!732878 () Bool)

(declare-fun e!410087 () Bool)

(assert (=> b!732878 (= e!410087 e!410088)))

(declare-fun res!492423 () Bool)

(assert (=> b!732878 (=> (not res!492423) (not e!410088))))

(declare-fun lt!324791 () SeekEntryResult!7336)

(assert (=> b!732878 (= res!492423 (or (= lt!324791 (MissingZero!7336 i!1173)) (= lt!324791 (MissingVacant!7336 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7336)

(assert (=> b!732878 (= lt!324791 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732879 () Bool)

(declare-fun res!492413 () Bool)

(assert (=> b!732879 (=> (not res!492413) (not e!410087))))

(assert (=> b!732879 (= res!492413 (and (= (size!20157 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20157 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20157 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732880 () Bool)

(declare-fun res!492418 () Bool)

(assert (=> b!732880 (=> (not res!492418) (not e!410087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732880 (= res!492418 (validKeyInArray!0 (select (arr!19736 a!3186) j!159)))))

(declare-fun b!732881 () Bool)

(declare-fun res!492427 () Bool)

(assert (=> b!732881 (=> (not res!492427) (not e!410087))))

(assert (=> b!732881 (= res!492427 (validKeyInArray!0 k!2102))))

(declare-fun res!492419 () Bool)

(assert (=> start!64928 (=> (not res!492419) (not e!410087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64928 (= res!492419 (validMask!0 mask!3328))))

(assert (=> start!64928 e!410087))

(assert (=> start!64928 true))

(declare-fun array_inv!15532 (array!41239) Bool)

(assert (=> start!64928 (array_inv!15532 a!3186)))

(declare-fun b!732876 () Bool)

(assert (=> b!732876 (= e!410085 e!410082)))

(declare-fun res!492424 () Bool)

(assert (=> b!732876 (=> (not res!492424) (not e!410082))))

(assert (=> b!732876 (= res!492424 (= (seekEntryOrOpen!0 (select (arr!19736 a!3186) j!159) a!3186 mask!3328) lt!324796))))

(assert (=> b!732876 (= lt!324796 (Found!7336 j!159))))

(declare-fun b!732882 () Bool)

(declare-fun res!492420 () Bool)

(assert (=> b!732882 (=> (not res!492420) (not e!410088))))

(declare-datatypes ((List!13738 0))(
  ( (Nil!13735) (Cons!13734 (h!14800 (_ BitVec 64)) (t!20053 List!13738)) )
))
(declare-fun arrayNoDuplicates!0 (array!41239 (_ BitVec 32) List!13738) Bool)

(assert (=> b!732882 (= res!492420 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13735))))

(declare-fun b!732883 () Bool)

(declare-fun res!492426 () Bool)

(assert (=> b!732883 (=> (not res!492426) (not e!410089))))

(assert (=> b!732883 (= res!492426 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19736 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732884 () Bool)

(declare-fun res!492422 () Bool)

(assert (=> b!732884 (=> (not res!492422) (not e!410088))))

(assert (=> b!732884 (= res!492422 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20157 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20157 a!3186))))))

(declare-fun b!732885 () Bool)

(declare-fun res!492415 () Bool)

(assert (=> b!732885 (=> (not res!492415) (not e!410087))))

(declare-fun arrayContainsKey!0 (array!41239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732885 (= res!492415 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64928 res!492419) b!732879))

(assert (= (and b!732879 res!492413) b!732880))

(assert (= (and b!732880 res!492418) b!732881))

(assert (= (and b!732881 res!492427) b!732885))

(assert (= (and b!732885 res!492415) b!732878))

(assert (= (and b!732878 res!492423) b!732869))

(assert (= (and b!732869 res!492425) b!732882))

(assert (= (and b!732882 res!492420) b!732884))

(assert (= (and b!732884 res!492422) b!732870))

(assert (= (and b!732870 res!492412) b!732883))

(assert (= (and b!732883 res!492426) b!732872))

(assert (= (and b!732872 c!80605) b!732877))

(assert (= (and b!732872 (not c!80605)) b!732875))

(assert (= (and b!732872 res!492416) b!732868))

(assert (= (and b!732868 res!492428) b!732867))

(assert (= (and b!732867 res!492421) b!732876))

(assert (= (and b!732876 res!492424) b!732874))

(assert (= (and b!732867 (not res!492417)) b!732873))

(assert (= (and b!732873 (not res!492414)) b!732871))

(declare-fun m!685855 () Bool)

(assert (=> b!732870 m!685855))

(assert (=> b!732870 m!685855))

(declare-fun m!685857 () Bool)

(assert (=> b!732870 m!685857))

(assert (=> b!732870 m!685857))

(assert (=> b!732870 m!685855))

(declare-fun m!685859 () Bool)

(assert (=> b!732870 m!685859))

(declare-fun m!685861 () Bool)

(assert (=> b!732869 m!685861))

(declare-fun m!685863 () Bool)

(assert (=> b!732868 m!685863))

(declare-fun m!685865 () Bool)

(assert (=> b!732868 m!685865))

(declare-fun m!685867 () Bool)

(assert (=> b!732868 m!685867))

(declare-fun m!685869 () Bool)

(assert (=> b!732868 m!685869))

(assert (=> b!732868 m!685867))

(declare-fun m!685871 () Bool)

(assert (=> b!732868 m!685871))

(declare-fun m!685873 () Bool)

(assert (=> b!732885 m!685873))

(assert (=> b!732874 m!685855))

(assert (=> b!732874 m!685855))

(declare-fun m!685875 () Bool)

(assert (=> b!732874 m!685875))

(declare-fun m!685877 () Bool)

(assert (=> b!732883 m!685877))

(assert (=> b!732880 m!685855))

(assert (=> b!732880 m!685855))

(declare-fun m!685879 () Bool)

(assert (=> b!732880 m!685879))

(declare-fun m!685881 () Bool)

(assert (=> b!732881 m!685881))

(declare-fun m!685883 () Bool)

(assert (=> b!732882 m!685883))

(declare-fun m!685885 () Bool)

(assert (=> start!64928 m!685885))

(declare-fun m!685887 () Bool)

(assert (=> start!64928 m!685887))

(declare-fun m!685889 () Bool)

(assert (=> b!732873 m!685889))

(declare-fun m!685891 () Bool)

(assert (=> b!732878 m!685891))

(assert (=> b!732871 m!685855))

(assert (=> b!732871 m!685855))

(declare-fun m!685893 () Bool)

(assert (=> b!732871 m!685893))

(assert (=> b!732875 m!685855))

(assert (=> b!732875 m!685855))

(assert (=> b!732875 m!685893))

(assert (=> b!732877 m!685855))

(assert (=> b!732877 m!685855))

(declare-fun m!685895 () Bool)

(assert (=> b!732877 m!685895))

(declare-fun m!685897 () Bool)

(assert (=> b!732867 m!685897))

(declare-fun m!685899 () Bool)

(assert (=> b!732867 m!685899))

(assert (=> b!732876 m!685855))

(assert (=> b!732876 m!685855))

(declare-fun m!685901 () Bool)

(assert (=> b!732876 m!685901))

(push 1)

