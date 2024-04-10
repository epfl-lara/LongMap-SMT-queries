; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65768 () Bool)

(assert start!65768)

(declare-fun b!755909 () Bool)

(declare-fun res!511020 () Bool)

(declare-fun e!421521 () Bool)

(assert (=> b!755909 (=> (not res!511020) (not e!421521))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41941 0))(
  ( (array!41942 (arr!20084 (Array (_ BitVec 32) (_ BitVec 64))) (size!20505 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41941)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755909 (= res!511020 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20084 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755910 () Bool)

(declare-fun res!511010 () Bool)

(declare-fun e!421525 () Bool)

(assert (=> b!755910 (=> (not res!511010) (not e!421525))))

(declare-datatypes ((List!14086 0))(
  ( (Nil!14083) (Cons!14082 (h!15154 (_ BitVec 64)) (t!20401 List!14086)) )
))
(declare-fun arrayNoDuplicates!0 (array!41941 (_ BitVec 32) List!14086) Bool)

(assert (=> b!755910 (= res!511010 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14083))))

(declare-fun b!755911 () Bool)

(declare-fun res!511016 () Bool)

(declare-fun e!421522 () Bool)

(assert (=> b!755911 (=> (not res!511016) (not e!421522))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336521 () array!41941)

(declare-fun lt!336516 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7684 0))(
  ( (MissingZero!7684 (index!33104 (_ BitVec 32))) (Found!7684 (index!33105 (_ BitVec 32))) (Intermediate!7684 (undefined!8496 Bool) (index!33106 (_ BitVec 32)) (x!64002 (_ BitVec 32))) (Undefined!7684) (MissingVacant!7684 (index!33107 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7684)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7684)

(assert (=> b!755911 (= res!511016 (= (seekEntryOrOpen!0 lt!336516 lt!336521 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336516 lt!336521 mask!3328)))))

(declare-fun b!755912 () Bool)

(declare-fun e!421527 () Bool)

(assert (=> b!755912 (= e!421527 e!421525)))

(declare-fun res!511005 () Bool)

(assert (=> b!755912 (=> (not res!511005) (not e!421525))))

(declare-fun lt!336519 () SeekEntryResult!7684)

(assert (=> b!755912 (= res!511005 (or (= lt!336519 (MissingZero!7684 i!1173)) (= lt!336519 (MissingVacant!7684 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755912 (= lt!336519 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755913 () Bool)

(assert (=> b!755913 (= e!421525 e!421521)))

(declare-fun res!511013 () Bool)

(assert (=> b!755913 (=> (not res!511013) (not e!421521))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!336517 () SeekEntryResult!7684)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41941 (_ BitVec 32)) SeekEntryResult!7684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755913 (= res!511013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20084 a!3186) j!159) mask!3328) (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336517))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755913 (= lt!336517 (Intermediate!7684 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755914 () Bool)

(declare-fun e!421518 () Bool)

(declare-fun e!421526 () Bool)

(assert (=> b!755914 (= e!421518 (not e!421526))))

(declare-fun res!511007 () Bool)

(assert (=> b!755914 (=> res!511007 e!421526)))

(declare-fun lt!336515 () SeekEntryResult!7684)

(assert (=> b!755914 (= res!511007 (or (not (is-Intermediate!7684 lt!336515)) (bvslt x!1131 (x!64002 lt!336515)) (not (= x!1131 (x!64002 lt!336515))) (not (= index!1321 (index!33106 lt!336515)))))))

(declare-fun e!421528 () Bool)

(assert (=> b!755914 e!421528))

(declare-fun res!511019 () Bool)

(assert (=> b!755914 (=> (not res!511019) (not e!421528))))

(declare-fun lt!336512 () SeekEntryResult!7684)

(declare-fun lt!336520 () SeekEntryResult!7684)

(assert (=> b!755914 (= res!511019 (= lt!336512 lt!336520))))

(assert (=> b!755914 (= lt!336520 (Found!7684 j!159))))

(assert (=> b!755914 (= lt!336512 (seekEntryOrOpen!0 (select (arr!20084 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41941 (_ BitVec 32)) Bool)

(assert (=> b!755914 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26116 0))(
  ( (Unit!26117) )
))
(declare-fun lt!336510 () Unit!26116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26116)

(assert (=> b!755914 (= lt!336510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755915 () Bool)

(assert (=> b!755915 (= e!421528 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336520))))

(declare-fun b!755916 () Bool)

(declare-fun res!511017 () Bool)

(assert (=> b!755916 (=> (not res!511017) (not e!421521))))

(declare-fun e!421524 () Bool)

(assert (=> b!755916 (= res!511017 e!421524)))

(declare-fun c!82834 () Bool)

(assert (=> b!755916 (= c!82834 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755918 () Bool)

(declare-fun e!421520 () Bool)

(declare-fun e!421529 () Bool)

(assert (=> b!755918 (= e!421520 e!421529)))

(declare-fun res!511022 () Bool)

(assert (=> b!755918 (=> res!511022 e!421529)))

(declare-fun lt!336513 () (_ BitVec 64))

(assert (=> b!755918 (= res!511022 (= lt!336513 lt!336516))))

(assert (=> b!755918 (= lt!336513 (select (store (arr!20084 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755919 () Bool)

(declare-fun e!421523 () Unit!26116)

(declare-fun Unit!26118 () Unit!26116)

(assert (=> b!755919 (= e!421523 Unit!26118)))

(assert (=> b!755919 false))

(declare-fun b!755920 () Bool)

(assert (=> b!755920 (= e!421524 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) (Found!7684 j!159)))))

(declare-fun b!755921 () Bool)

(declare-fun lt!336514 () SeekEntryResult!7684)

(assert (=> b!755921 (= e!421522 (= lt!336512 lt!336514))))

(declare-fun b!755922 () Bool)

(assert (=> b!755922 (= e!421524 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336517))))

(declare-fun b!755923 () Bool)

(declare-fun res!511009 () Bool)

(assert (=> b!755923 (=> (not res!511009) (not e!421525))))

(assert (=> b!755923 (= res!511009 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20505 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20505 a!3186))))))

(declare-fun b!755924 () Bool)

(declare-fun res!511006 () Bool)

(assert (=> b!755924 (=> (not res!511006) (not e!421525))))

(assert (=> b!755924 (= res!511006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755925 () Bool)

(assert (=> b!755925 (= e!421521 e!421518)))

(declare-fun res!511018 () Bool)

(assert (=> b!755925 (=> (not res!511018) (not e!421518))))

(declare-fun lt!336518 () SeekEntryResult!7684)

(assert (=> b!755925 (= res!511018 (= lt!336518 lt!336515))))

(assert (=> b!755925 (= lt!336515 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336516 lt!336521 mask!3328))))

(assert (=> b!755925 (= lt!336518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336516 mask!3328) lt!336516 lt!336521 mask!3328))))

(assert (=> b!755925 (= lt!336516 (select (store (arr!20084 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755925 (= lt!336521 (array!41942 (store (arr!20084 a!3186) i!1173 k!2102) (size!20505 a!3186)))))

(declare-fun b!755926 () Bool)

(declare-fun res!511014 () Bool)

(assert (=> b!755926 (=> (not res!511014) (not e!421527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755926 (= res!511014 (validKeyInArray!0 k!2102))))

(declare-fun res!511004 () Bool)

(assert (=> start!65768 (=> (not res!511004) (not e!421527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65768 (= res!511004 (validMask!0 mask!3328))))

(assert (=> start!65768 e!421527))

(assert (=> start!65768 true))

(declare-fun array_inv!15880 (array!41941) Bool)

(assert (=> start!65768 (array_inv!15880 a!3186)))

(declare-fun b!755917 () Bool)

(assert (=> b!755917 (= e!421526 e!421520)))

(declare-fun res!511012 () Bool)

(assert (=> b!755917 (=> res!511012 e!421520)))

(assert (=> b!755917 (= res!511012 (not (= lt!336514 lt!336520)))))

(assert (=> b!755917 (= lt!336514 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755927 () Bool)

(declare-fun res!511011 () Bool)

(assert (=> b!755927 (=> (not res!511011) (not e!421527))))

(assert (=> b!755927 (= res!511011 (and (= (size!20505 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20505 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20505 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755928 () Bool)

(assert (=> b!755928 (= e!421529 true)))

(assert (=> b!755928 e!421522))

(declare-fun res!511015 () Bool)

(assert (=> b!755928 (=> (not res!511015) (not e!421522))))

(assert (=> b!755928 (= res!511015 (= lt!336513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336511 () Unit!26116)

(assert (=> b!755928 (= lt!336511 e!421523)))

(declare-fun c!82833 () Bool)

(assert (=> b!755928 (= c!82833 (= lt!336513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755929 () Bool)

(declare-fun res!511008 () Bool)

(assert (=> b!755929 (=> (not res!511008) (not e!421527))))

(assert (=> b!755929 (= res!511008 (validKeyInArray!0 (select (arr!20084 a!3186) j!159)))))

(declare-fun b!755930 () Bool)

(declare-fun res!511021 () Bool)

(assert (=> b!755930 (=> (not res!511021) (not e!421527))))

(declare-fun arrayContainsKey!0 (array!41941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755930 (= res!511021 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755931 () Bool)

(declare-fun Unit!26119 () Unit!26116)

(assert (=> b!755931 (= e!421523 Unit!26119)))

(assert (= (and start!65768 res!511004) b!755927))

(assert (= (and b!755927 res!511011) b!755929))

(assert (= (and b!755929 res!511008) b!755926))

(assert (= (and b!755926 res!511014) b!755930))

(assert (= (and b!755930 res!511021) b!755912))

(assert (= (and b!755912 res!511005) b!755924))

(assert (= (and b!755924 res!511006) b!755910))

(assert (= (and b!755910 res!511010) b!755923))

(assert (= (and b!755923 res!511009) b!755913))

(assert (= (and b!755913 res!511013) b!755909))

(assert (= (and b!755909 res!511020) b!755916))

(assert (= (and b!755916 c!82834) b!755922))

(assert (= (and b!755916 (not c!82834)) b!755920))

(assert (= (and b!755916 res!511017) b!755925))

(assert (= (and b!755925 res!511018) b!755914))

(assert (= (and b!755914 res!511019) b!755915))

(assert (= (and b!755914 (not res!511007)) b!755917))

(assert (= (and b!755917 (not res!511012)) b!755918))

(assert (= (and b!755918 (not res!511022)) b!755928))

(assert (= (and b!755928 c!82833) b!755919))

(assert (= (and b!755928 (not c!82833)) b!755931))

(assert (= (and b!755928 res!511015) b!755911))

(assert (= (and b!755911 res!511016) b!755921))

(declare-fun m!703995 () Bool)

(assert (=> b!755920 m!703995))

(assert (=> b!755920 m!703995))

(declare-fun m!703997 () Bool)

(assert (=> b!755920 m!703997))

(assert (=> b!755915 m!703995))

(assert (=> b!755915 m!703995))

(declare-fun m!703999 () Bool)

(assert (=> b!755915 m!703999))

(assert (=> b!755917 m!703995))

(assert (=> b!755917 m!703995))

(assert (=> b!755917 m!703997))

(assert (=> b!755929 m!703995))

(assert (=> b!755929 m!703995))

(declare-fun m!704001 () Bool)

(assert (=> b!755929 m!704001))

(declare-fun m!704003 () Bool)

(assert (=> b!755924 m!704003))

(declare-fun m!704005 () Bool)

(assert (=> b!755909 m!704005))

(declare-fun m!704007 () Bool)

(assert (=> b!755911 m!704007))

(declare-fun m!704009 () Bool)

(assert (=> b!755911 m!704009))

(declare-fun m!704011 () Bool)

(assert (=> b!755918 m!704011))

(declare-fun m!704013 () Bool)

(assert (=> b!755918 m!704013))

(assert (=> b!755925 m!704011))

(declare-fun m!704015 () Bool)

(assert (=> b!755925 m!704015))

(declare-fun m!704017 () Bool)

(assert (=> b!755925 m!704017))

(declare-fun m!704019 () Bool)

(assert (=> b!755925 m!704019))

(declare-fun m!704021 () Bool)

(assert (=> b!755925 m!704021))

(assert (=> b!755925 m!704019))

(declare-fun m!704023 () Bool)

(assert (=> b!755910 m!704023))

(declare-fun m!704025 () Bool)

(assert (=> b!755926 m!704025))

(assert (=> b!755922 m!703995))

(assert (=> b!755922 m!703995))

(declare-fun m!704027 () Bool)

(assert (=> b!755922 m!704027))

(assert (=> b!755914 m!703995))

(assert (=> b!755914 m!703995))

(declare-fun m!704029 () Bool)

(assert (=> b!755914 m!704029))

(declare-fun m!704031 () Bool)

(assert (=> b!755914 m!704031))

(declare-fun m!704033 () Bool)

(assert (=> b!755914 m!704033))

(declare-fun m!704035 () Bool)

(assert (=> start!65768 m!704035))

(declare-fun m!704037 () Bool)

(assert (=> start!65768 m!704037))

(declare-fun m!704039 () Bool)

(assert (=> b!755930 m!704039))

(declare-fun m!704041 () Bool)

(assert (=> b!755912 m!704041))

(assert (=> b!755913 m!703995))

(assert (=> b!755913 m!703995))

(declare-fun m!704043 () Bool)

(assert (=> b!755913 m!704043))

(assert (=> b!755913 m!704043))

(assert (=> b!755913 m!703995))

(declare-fun m!704045 () Bool)

(assert (=> b!755913 m!704045))

(push 1)

