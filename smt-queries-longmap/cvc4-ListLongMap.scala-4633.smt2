; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64502 () Bool)

(assert start!64502)

(declare-fun b!725876 () Bool)

(declare-fun e!406459 () Bool)

(declare-fun e!406461 () Bool)

(assert (=> b!725876 (= e!406459 e!406461)))

(declare-fun res!486928 () Bool)

(assert (=> b!725876 (=> (not res!486928) (not e!406461))))

(declare-datatypes ((array!41020 0))(
  ( (array!41021 (arr!19631 (Array (_ BitVec 32) (_ BitVec 64))) (size!20052 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41020)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7231 0))(
  ( (MissingZero!7231 (index!31292 (_ BitVec 32))) (Found!7231 (index!31293 (_ BitVec 32))) (Intermediate!7231 (undefined!8043 Bool) (index!31294 (_ BitVec 32)) (x!62281 (_ BitVec 32))) (Undefined!7231) (MissingVacant!7231 (index!31295 (_ BitVec 32))) )
))
(declare-fun lt!321501 () SeekEntryResult!7231)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41020 (_ BitVec 32)) SeekEntryResult!7231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725876 (= res!486928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19631 a!3186) j!159) mask!3328) (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321501))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725876 (= lt!321501 (Intermediate!7231 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725877 () Bool)

(declare-fun e!406463 () Bool)

(assert (=> b!725877 (= e!406463 (not true))))

(declare-fun e!406458 () Bool)

(assert (=> b!725877 e!406458))

(declare-fun res!486932 () Bool)

(assert (=> b!725877 (=> (not res!486932) (not e!406458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41020 (_ BitVec 32)) Bool)

(assert (=> b!725877 (= res!486932 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24780 0))(
  ( (Unit!24781) )
))
(declare-fun lt!321503 () Unit!24780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24780)

(assert (=> b!725877 (= lt!321503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725878 () Bool)

(declare-fun res!486934 () Bool)

(assert (=> b!725878 (=> (not res!486934) (not e!406461))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725878 (= res!486934 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19631 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!486927 () Bool)

(declare-fun e!406460 () Bool)

(assert (=> start!64502 (=> (not res!486927) (not e!406460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64502 (= res!486927 (validMask!0 mask!3328))))

(assert (=> start!64502 e!406460))

(assert (=> start!64502 true))

(declare-fun array_inv!15427 (array!41020) Bool)

(assert (=> start!64502 (array_inv!15427 a!3186)))

(declare-fun b!725879 () Bool)

(assert (=> b!725879 (= e!406461 e!406463)))

(declare-fun res!486926 () Bool)

(assert (=> b!725879 (=> (not res!486926) (not e!406463))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321500 () array!41020)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321502 () (_ BitVec 64))

(assert (=> b!725879 (= res!486926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321502 mask!3328) lt!321502 lt!321500 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321502 lt!321500 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!725879 (= lt!321502 (select (store (arr!19631 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725879 (= lt!321500 (array!41021 (store (arr!19631 a!3186) i!1173 k!2102) (size!20052 a!3186)))))

(declare-fun e!406456 () Bool)

(declare-fun b!725880 () Bool)

(assert (=> b!725880 (= e!406456 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321501))))

(declare-fun b!725881 () Bool)

(declare-fun res!486929 () Bool)

(assert (=> b!725881 (=> (not res!486929) (not e!406459))))

(declare-datatypes ((List!13633 0))(
  ( (Nil!13630) (Cons!13629 (h!14686 (_ BitVec 64)) (t!19948 List!13633)) )
))
(declare-fun arrayNoDuplicates!0 (array!41020 (_ BitVec 32) List!13633) Bool)

(assert (=> b!725881 (= res!486929 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13630))))

(declare-fun b!725882 () Bool)

(assert (=> b!725882 (= e!406460 e!406459)))

(declare-fun res!486931 () Bool)

(assert (=> b!725882 (=> (not res!486931) (not e!406459))))

(declare-fun lt!321499 () SeekEntryResult!7231)

(assert (=> b!725882 (= res!486931 (or (= lt!321499 (MissingZero!7231 i!1173)) (= lt!321499 (MissingVacant!7231 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41020 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!725882 (= lt!321499 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725883 () Bool)

(declare-fun e!406462 () Bool)

(assert (=> b!725883 (= e!406458 e!406462)))

(declare-fun res!486924 () Bool)

(assert (=> b!725883 (=> (not res!486924) (not e!406462))))

(declare-fun lt!321498 () SeekEntryResult!7231)

(assert (=> b!725883 (= res!486924 (= (seekEntryOrOpen!0 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321498))))

(assert (=> b!725883 (= lt!321498 (Found!7231 j!159))))

(declare-fun b!725884 () Bool)

(declare-fun res!486936 () Bool)

(assert (=> b!725884 (=> (not res!486936) (not e!406461))))

(assert (=> b!725884 (= res!486936 e!406456)))

(declare-fun c!79849 () Bool)

(assert (=> b!725884 (= c!79849 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725885 () Bool)

(declare-fun res!486938 () Bool)

(assert (=> b!725885 (=> (not res!486938) (not e!406459))))

(assert (=> b!725885 (= res!486938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725886 () Bool)

(declare-fun res!486925 () Bool)

(assert (=> b!725886 (=> (not res!486925) (not e!406460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725886 (= res!486925 (validKeyInArray!0 k!2102))))

(declare-fun b!725887 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41020 (_ BitVec 32)) SeekEntryResult!7231)

(assert (=> b!725887 (= e!406462 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) lt!321498))))

(declare-fun b!725888 () Bool)

(declare-fun res!486935 () Bool)

(assert (=> b!725888 (=> (not res!486935) (not e!406459))))

(assert (=> b!725888 (= res!486935 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20052 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20052 a!3186))))))

(declare-fun b!725889 () Bool)

(declare-fun res!486930 () Bool)

(assert (=> b!725889 (=> (not res!486930) (not e!406460))))

(assert (=> b!725889 (= res!486930 (validKeyInArray!0 (select (arr!19631 a!3186) j!159)))))

(declare-fun b!725890 () Bool)

(declare-fun res!486933 () Bool)

(assert (=> b!725890 (=> (not res!486933) (not e!406460))))

(declare-fun arrayContainsKey!0 (array!41020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725890 (= res!486933 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725891 () Bool)

(declare-fun res!486937 () Bool)

(assert (=> b!725891 (=> (not res!486937) (not e!406460))))

(assert (=> b!725891 (= res!486937 (and (= (size!20052 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20052 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20052 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725892 () Bool)

(assert (=> b!725892 (= e!406456 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19631 a!3186) j!159) a!3186 mask!3328) (Found!7231 j!159)))))

(assert (= (and start!64502 res!486927) b!725891))

(assert (= (and b!725891 res!486937) b!725889))

(assert (= (and b!725889 res!486930) b!725886))

(assert (= (and b!725886 res!486925) b!725890))

(assert (= (and b!725890 res!486933) b!725882))

(assert (= (and b!725882 res!486931) b!725885))

(assert (= (and b!725885 res!486938) b!725881))

(assert (= (and b!725881 res!486929) b!725888))

(assert (= (and b!725888 res!486935) b!725876))

(assert (= (and b!725876 res!486928) b!725878))

(assert (= (and b!725878 res!486934) b!725884))

(assert (= (and b!725884 c!79849) b!725880))

(assert (= (and b!725884 (not c!79849)) b!725892))

(assert (= (and b!725884 res!486936) b!725879))

(assert (= (and b!725879 res!486926) b!725877))

(assert (= (and b!725877 res!486932) b!725883))

(assert (= (and b!725883 res!486924) b!725887))

(declare-fun m!679995 () Bool)

(assert (=> b!725877 m!679995))

(declare-fun m!679997 () Bool)

(assert (=> b!725877 m!679997))

(declare-fun m!679999 () Bool)

(assert (=> b!725889 m!679999))

(assert (=> b!725889 m!679999))

(declare-fun m!680001 () Bool)

(assert (=> b!725889 m!680001))

(assert (=> b!725892 m!679999))

(assert (=> b!725892 m!679999))

(declare-fun m!680003 () Bool)

(assert (=> b!725892 m!680003))

(declare-fun m!680005 () Bool)

(assert (=> b!725879 m!680005))

(declare-fun m!680007 () Bool)

(assert (=> b!725879 m!680007))

(declare-fun m!680009 () Bool)

(assert (=> b!725879 m!680009))

(declare-fun m!680011 () Bool)

(assert (=> b!725879 m!680011))

(declare-fun m!680013 () Bool)

(assert (=> b!725879 m!680013))

(assert (=> b!725879 m!680007))

(assert (=> b!725883 m!679999))

(assert (=> b!725883 m!679999))

(declare-fun m!680015 () Bool)

(assert (=> b!725883 m!680015))

(declare-fun m!680017 () Bool)

(assert (=> start!64502 m!680017))

(declare-fun m!680019 () Bool)

(assert (=> start!64502 m!680019))

(assert (=> b!725880 m!679999))

(assert (=> b!725880 m!679999))

(declare-fun m!680021 () Bool)

(assert (=> b!725880 m!680021))

(declare-fun m!680023 () Bool)

(assert (=> b!725885 m!680023))

(declare-fun m!680025 () Bool)

(assert (=> b!725882 m!680025))

(declare-fun m!680027 () Bool)

(assert (=> b!725878 m!680027))

(assert (=> b!725887 m!679999))

(assert (=> b!725887 m!679999))

(declare-fun m!680029 () Bool)

(assert (=> b!725887 m!680029))

(assert (=> b!725876 m!679999))

(assert (=> b!725876 m!679999))

(declare-fun m!680031 () Bool)

(assert (=> b!725876 m!680031))

(assert (=> b!725876 m!680031))

(assert (=> b!725876 m!679999))

(declare-fun m!680033 () Bool)

(assert (=> b!725876 m!680033))

(declare-fun m!680035 () Bool)

(assert (=> b!725886 m!680035))

(declare-fun m!680037 () Bool)

(assert (=> b!725890 m!680037))

(declare-fun m!680039 () Bool)

(assert (=> b!725881 m!680039))

(push 1)

