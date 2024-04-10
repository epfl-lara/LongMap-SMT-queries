; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66750 () Bool)

(assert start!66750)

(declare-fun b!768896 () Bool)

(declare-fun res!519918 () Bool)

(declare-fun e!428187 () Bool)

(assert (=> b!768896 (=> (not res!519918) (not e!428187))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42312 0))(
  ( (array!42313 (arr!20256 (Array (_ BitVec 32) (_ BitVec 64))) (size!20677 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42312)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768896 (= res!519918 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20256 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768897 () Bool)

(declare-fun res!519917 () Bool)

(declare-fun e!428182 () Bool)

(assert (=> b!768897 (=> (not res!519917) (not e!428182))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768897 (= res!519917 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768898 () Bool)

(declare-fun e!428183 () Bool)

(declare-fun e!428188 () Bool)

(assert (=> b!768898 (= e!428183 (not e!428188))))

(declare-fun res!519922 () Bool)

(assert (=> b!768898 (=> res!519922 e!428188)))

(declare-datatypes ((SeekEntryResult!7856 0))(
  ( (MissingZero!7856 (index!33792 (_ BitVec 32))) (Found!7856 (index!33793 (_ BitVec 32))) (Intermediate!7856 (undefined!8668 Bool) (index!33794 (_ BitVec 32)) (x!64731 (_ BitVec 32))) (Undefined!7856) (MissingVacant!7856 (index!33795 (_ BitVec 32))) )
))
(declare-fun lt!342046 () SeekEntryResult!7856)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!768898 (= res!519922 (or (not (is-Intermediate!7856 lt!342046)) (bvsge x!1131 (x!64731 lt!342046))))))

(declare-fun e!428185 () Bool)

(assert (=> b!768898 e!428185))

(declare-fun res!519931 () Bool)

(assert (=> b!768898 (=> (not res!519931) (not e!428185))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42312 (_ BitVec 32)) Bool)

(assert (=> b!768898 (= res!519931 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26438 0))(
  ( (Unit!26439) )
))
(declare-fun lt!342047 () Unit!26438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26438)

(assert (=> b!768898 (= lt!342047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768899 () Bool)

(declare-fun res!519924 () Bool)

(declare-fun e!428181 () Bool)

(assert (=> b!768899 (=> (not res!519924) (not e!428181))))

(declare-datatypes ((List!14258 0))(
  ( (Nil!14255) (Cons!14254 (h!15353 (_ BitVec 64)) (t!20573 List!14258)) )
))
(declare-fun arrayNoDuplicates!0 (array!42312 (_ BitVec 32) List!14258) Bool)

(assert (=> b!768899 (= res!519924 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14255))))

(declare-fun b!768900 () Bool)

(assert (=> b!768900 (= e!428188 true)))

(declare-fun lt!342048 () Unit!26438)

(declare-fun e!428186 () Unit!26438)

(assert (=> b!768900 (= lt!342048 e!428186)))

(declare-fun c!84886 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768900 (= c!84886 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342052 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768900 (= lt!342052 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768901 () Bool)

(declare-fun res!519920 () Bool)

(assert (=> b!768901 (=> (not res!519920) (not e!428182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768901 (= res!519920 (validKeyInArray!0 k!2102))))

(declare-fun b!768902 () Bool)

(assert (=> b!768902 (= e!428182 e!428181)))

(declare-fun res!519925 () Bool)

(assert (=> b!768902 (=> (not res!519925) (not e!428181))))

(declare-fun lt!342055 () SeekEntryResult!7856)

(assert (=> b!768902 (= res!519925 (or (= lt!342055 (MissingZero!7856 i!1173)) (= lt!342055 (MissingVacant!7856 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42312 (_ BitVec 32)) SeekEntryResult!7856)

(assert (=> b!768902 (= lt!342055 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!519928 () Bool)

(assert (=> start!66750 (=> (not res!519928) (not e!428182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66750 (= res!519928 (validMask!0 mask!3328))))

(assert (=> start!66750 e!428182))

(assert (=> start!66750 true))

(declare-fun array_inv!16052 (array!42312) Bool)

(assert (=> start!66750 (array_inv!16052 a!3186)))

(declare-fun b!768903 () Bool)

(declare-fun res!519923 () Bool)

(assert (=> b!768903 (=> (not res!519923) (not e!428187))))

(declare-fun e!428189 () Bool)

(assert (=> b!768903 (= res!519923 e!428189)))

(declare-fun c!84885 () Bool)

(assert (=> b!768903 (= c!84885 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768904 () Bool)

(declare-fun Unit!26440 () Unit!26438)

(assert (=> b!768904 (= e!428186 Unit!26440)))

(declare-fun lt!342051 () SeekEntryResult!7856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42312 (_ BitVec 32)) SeekEntryResult!7856)

(assert (=> b!768904 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342052 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) lt!342051)))

(declare-fun b!768905 () Bool)

(declare-fun res!519927 () Bool)

(assert (=> b!768905 (=> (not res!519927) (not e!428182))))

(assert (=> b!768905 (= res!519927 (and (= (size!20677 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20677 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20677 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768906 () Bool)

(declare-fun res!519926 () Bool)

(assert (=> b!768906 (=> (not res!519926) (not e!428181))))

(assert (=> b!768906 (= res!519926 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20677 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20677 a!3186))))))

(declare-fun e!428184 () Bool)

(declare-fun lt!342054 () SeekEntryResult!7856)

(declare-fun b!768907 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42312 (_ BitVec 32)) SeekEntryResult!7856)

(assert (=> b!768907 (= e!428184 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) lt!342054))))

(declare-fun b!768908 () Bool)

(declare-fun res!519919 () Bool)

(assert (=> b!768908 (=> (not res!519919) (not e!428182))))

(assert (=> b!768908 (= res!519919 (validKeyInArray!0 (select (arr!20256 a!3186) j!159)))))

(declare-fun b!768909 () Bool)

(assert (=> b!768909 (= e!428189 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) lt!342051))))

(declare-fun b!768910 () Bool)

(assert (=> b!768910 (= e!428189 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) (Found!7856 j!159)))))

(declare-fun b!768911 () Bool)

(declare-fun res!519929 () Bool)

(assert (=> b!768911 (=> (not res!519929) (not e!428181))))

(assert (=> b!768911 (= res!519929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768912 () Bool)

(assert (=> b!768912 (= e!428187 e!428183)))

(declare-fun res!519930 () Bool)

(assert (=> b!768912 (=> (not res!519930) (not e!428183))))

(declare-fun lt!342050 () SeekEntryResult!7856)

(assert (=> b!768912 (= res!519930 (= lt!342050 lt!342046))))

(declare-fun lt!342049 () (_ BitVec 64))

(declare-fun lt!342056 () array!42312)

(assert (=> b!768912 (= lt!342046 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342049 lt!342056 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768912 (= lt!342050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342049 mask!3328) lt!342049 lt!342056 mask!3328))))

(assert (=> b!768912 (= lt!342049 (select (store (arr!20256 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!768912 (= lt!342056 (array!42313 (store (arr!20256 a!3186) i!1173 k!2102) (size!20677 a!3186)))))

(declare-fun b!768913 () Bool)

(declare-fun Unit!26441 () Unit!26438)

(assert (=> b!768913 (= e!428186 Unit!26441)))

(declare-fun lt!342053 () SeekEntryResult!7856)

(assert (=> b!768913 (= lt!342053 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20256 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!768913 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342052 resIntermediateIndex!5 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) (Found!7856 j!159))))

(declare-fun b!768914 () Bool)

(assert (=> b!768914 (= e!428185 e!428184)))

(declare-fun res!519921 () Bool)

(assert (=> b!768914 (=> (not res!519921) (not e!428184))))

(assert (=> b!768914 (= res!519921 (= (seekEntryOrOpen!0 (select (arr!20256 a!3186) j!159) a!3186 mask!3328) lt!342054))))

(assert (=> b!768914 (= lt!342054 (Found!7856 j!159))))

(declare-fun b!768915 () Bool)

(assert (=> b!768915 (= e!428181 e!428187)))

(declare-fun res!519932 () Bool)

(assert (=> b!768915 (=> (not res!519932) (not e!428187))))

(assert (=> b!768915 (= res!519932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20256 a!3186) j!159) mask!3328) (select (arr!20256 a!3186) j!159) a!3186 mask!3328) lt!342051))))

(assert (=> b!768915 (= lt!342051 (Intermediate!7856 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66750 res!519928) b!768905))

(assert (= (and b!768905 res!519927) b!768908))

(assert (= (and b!768908 res!519919) b!768901))

(assert (= (and b!768901 res!519920) b!768897))

(assert (= (and b!768897 res!519917) b!768902))

(assert (= (and b!768902 res!519925) b!768911))

(assert (= (and b!768911 res!519929) b!768899))

(assert (= (and b!768899 res!519924) b!768906))

(assert (= (and b!768906 res!519926) b!768915))

(assert (= (and b!768915 res!519932) b!768896))

(assert (= (and b!768896 res!519918) b!768903))

(assert (= (and b!768903 c!84885) b!768909))

(assert (= (and b!768903 (not c!84885)) b!768910))

(assert (= (and b!768903 res!519923) b!768912))

(assert (= (and b!768912 res!519930) b!768898))

(assert (= (and b!768898 res!519931) b!768914))

(assert (= (and b!768914 res!519921) b!768907))

(assert (= (and b!768898 (not res!519922)) b!768900))

(assert (= (and b!768900 c!84886) b!768904))

(assert (= (and b!768900 (not c!84886)) b!768913))

(declare-fun m!714383 () Bool)

(assert (=> b!768911 m!714383))

(declare-fun m!714385 () Bool)

(assert (=> b!768904 m!714385))

(assert (=> b!768904 m!714385))

(declare-fun m!714387 () Bool)

(assert (=> b!768904 m!714387))

(declare-fun m!714389 () Bool)

(assert (=> b!768902 m!714389))

(declare-fun m!714391 () Bool)

(assert (=> b!768896 m!714391))

(declare-fun m!714393 () Bool)

(assert (=> b!768899 m!714393))

(declare-fun m!714395 () Bool)

(assert (=> b!768900 m!714395))

(declare-fun m!714397 () Bool)

(assert (=> b!768898 m!714397))

(declare-fun m!714399 () Bool)

(assert (=> b!768898 m!714399))

(declare-fun m!714401 () Bool)

(assert (=> start!66750 m!714401))

(declare-fun m!714403 () Bool)

(assert (=> start!66750 m!714403))

(declare-fun m!714405 () Bool)

(assert (=> b!768912 m!714405))

(declare-fun m!714407 () Bool)

(assert (=> b!768912 m!714407))

(declare-fun m!714409 () Bool)

(assert (=> b!768912 m!714409))

(declare-fun m!714411 () Bool)

(assert (=> b!768912 m!714411))

(assert (=> b!768912 m!714405))

(declare-fun m!714413 () Bool)

(assert (=> b!768912 m!714413))

(assert (=> b!768914 m!714385))

(assert (=> b!768914 m!714385))

(declare-fun m!714415 () Bool)

(assert (=> b!768914 m!714415))

(assert (=> b!768910 m!714385))

(assert (=> b!768910 m!714385))

(declare-fun m!714417 () Bool)

(assert (=> b!768910 m!714417))

(assert (=> b!768913 m!714385))

(assert (=> b!768913 m!714385))

(assert (=> b!768913 m!714417))

(assert (=> b!768913 m!714385))

(declare-fun m!714419 () Bool)

(assert (=> b!768913 m!714419))

(declare-fun m!714421 () Bool)

(assert (=> b!768897 m!714421))

(declare-fun m!714423 () Bool)

(assert (=> b!768901 m!714423))

(assert (=> b!768909 m!714385))

(assert (=> b!768909 m!714385))

(declare-fun m!714425 () Bool)

(assert (=> b!768909 m!714425))

(assert (=> b!768908 m!714385))

(assert (=> b!768908 m!714385))

(declare-fun m!714427 () Bool)

(assert (=> b!768908 m!714427))

(assert (=> b!768915 m!714385))

(assert (=> b!768915 m!714385))

(declare-fun m!714429 () Bool)

(assert (=> b!768915 m!714429))

(assert (=> b!768915 m!714429))

(assert (=> b!768915 m!714385))

(declare-fun m!714431 () Bool)

(assert (=> b!768915 m!714431))

(assert (=> b!768907 m!714385))

(assert (=> b!768907 m!714385))

(declare-fun m!714433 () Bool)

(assert (=> b!768907 m!714433))

(push 1)

