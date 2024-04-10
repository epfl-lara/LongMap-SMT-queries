; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65320 () Bool)

(assert start!65320)

(declare-fun b!741953 () Bool)

(declare-fun res!499204 () Bool)

(declare-fun e!414689 () Bool)

(assert (=> b!741953 (=> (not res!499204) (not e!414689))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741953 (= res!499204 (validKeyInArray!0 k!2102))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7460 0))(
  ( (MissingZero!7460 (index!32208 (_ BitVec 32))) (Found!7460 (index!32209 (_ BitVec 32))) (Intermediate!7460 (undefined!8272 Bool) (index!32210 (_ BitVec 32)) (x!63186 (_ BitVec 32))) (Undefined!7460) (MissingVacant!7460 (index!32211 (_ BitVec 32))) )
))
(declare-fun lt!329625 () SeekEntryResult!7460)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!741954 () Bool)

(declare-datatypes ((array!41493 0))(
  ( (array!41494 (arr!19860 (Array (_ BitVec 32) (_ BitVec 64))) (size!20281 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41493)

(declare-fun e!414695 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41493 (_ BitVec 32)) SeekEntryResult!7460)

(assert (=> b!741954 (= e!414695 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19860 a!3186) j!159) a!3186 mask!3328) lt!329625))))

(declare-fun b!741955 () Bool)

(declare-fun e!414688 () Bool)

(declare-fun e!414692 () Bool)

(assert (=> b!741955 (= e!414688 e!414692)))

(declare-fun res!499200 () Bool)

(assert (=> b!741955 (=> (not res!499200) (not e!414692))))

(declare-fun lt!329623 () SeekEntryResult!7460)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41493 (_ BitVec 32)) SeekEntryResult!7460)

(assert (=> b!741955 (= res!499200 (= (seekEntryOrOpen!0 (select (arr!19860 a!3186) j!159) a!3186 mask!3328) lt!329623))))

(assert (=> b!741955 (= lt!329623 (Found!7460 j!159))))

(declare-fun b!741956 () Bool)

(declare-fun e!414690 () Bool)

(declare-fun e!414691 () Bool)

(assert (=> b!741956 (= e!414690 e!414691)))

(declare-fun res!499203 () Bool)

(assert (=> b!741956 (=> (not res!499203) (not e!414691))))

(declare-fun lt!329627 () (_ BitVec 64))

(declare-fun lt!329622 () array!41493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741956 (= res!499203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329627 mask!3328) lt!329627 lt!329622 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329627 lt!329622 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741956 (= lt!329627 (select (store (arr!19860 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741956 (= lt!329622 (array!41494 (store (arr!19860 a!3186) i!1173 k!2102) (size!20281 a!3186)))))

(declare-fun b!741957 () Bool)

(declare-fun res!499205 () Bool)

(assert (=> b!741957 (=> (not res!499205) (not e!414689))))

(assert (=> b!741957 (= res!499205 (and (= (size!20281 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20281 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20281 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741959 () Bool)

(declare-fun res!499213 () Bool)

(assert (=> b!741959 (=> (not res!499213) (not e!414690))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741959 (= res!499213 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19860 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741960 () Bool)

(declare-fun res!499209 () Bool)

(assert (=> b!741960 (=> (not res!499209) (not e!414690))))

(assert (=> b!741960 (= res!499209 e!414695)))

(declare-fun c!81757 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741960 (= c!81757 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741961 () Bool)

(declare-fun e!414694 () Bool)

(assert (=> b!741961 (= e!414689 e!414694)))

(declare-fun res!499210 () Bool)

(assert (=> b!741961 (=> (not res!499210) (not e!414694))))

(declare-fun lt!329626 () SeekEntryResult!7460)

(assert (=> b!741961 (= res!499210 (or (= lt!329626 (MissingZero!7460 i!1173)) (= lt!329626 (MissingVacant!7460 i!1173))))))

(assert (=> b!741961 (= lt!329626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741962 () Bool)

(assert (=> b!741962 (= e!414691 (not true))))

(assert (=> b!741962 e!414688))

(declare-fun res!499202 () Bool)

(assert (=> b!741962 (=> (not res!499202) (not e!414688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41493 (_ BitVec 32)) Bool)

(assert (=> b!741962 (= res!499202 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25400 0))(
  ( (Unit!25401) )
))
(declare-fun lt!329624 () Unit!25400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25400)

(assert (=> b!741962 (= lt!329624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741963 () Bool)

(assert (=> b!741963 (= e!414694 e!414690)))

(declare-fun res!499207 () Bool)

(assert (=> b!741963 (=> (not res!499207) (not e!414690))))

(assert (=> b!741963 (= res!499207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19860 a!3186) j!159) mask!3328) (select (arr!19860 a!3186) j!159) a!3186 mask!3328) lt!329625))))

(assert (=> b!741963 (= lt!329625 (Intermediate!7460 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741964 () Bool)

(declare-fun res!499201 () Bool)

(assert (=> b!741964 (=> (not res!499201) (not e!414689))))

(declare-fun arrayContainsKey!0 (array!41493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741964 (= res!499201 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741965 () Bool)

(declare-fun res!499211 () Bool)

(assert (=> b!741965 (=> (not res!499211) (not e!414694))))

(declare-datatypes ((List!13862 0))(
  ( (Nil!13859) (Cons!13858 (h!14930 (_ BitVec 64)) (t!20177 List!13862)) )
))
(declare-fun arrayNoDuplicates!0 (array!41493 (_ BitVec 32) List!13862) Bool)

(assert (=> b!741965 (= res!499211 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13859))))

(declare-fun b!741966 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41493 (_ BitVec 32)) SeekEntryResult!7460)

(assert (=> b!741966 (= e!414695 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19860 a!3186) j!159) a!3186 mask!3328) (Found!7460 j!159)))))

(declare-fun b!741967 () Bool)

(assert (=> b!741967 (= e!414692 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19860 a!3186) j!159) a!3186 mask!3328) lt!329623))))

(declare-fun res!499214 () Bool)

(assert (=> start!65320 (=> (not res!499214) (not e!414689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65320 (= res!499214 (validMask!0 mask!3328))))

(assert (=> start!65320 e!414689))

(assert (=> start!65320 true))

(declare-fun array_inv!15656 (array!41493) Bool)

(assert (=> start!65320 (array_inv!15656 a!3186)))

(declare-fun b!741958 () Bool)

(declare-fun res!499208 () Bool)

(assert (=> b!741958 (=> (not res!499208) (not e!414694))))

(assert (=> b!741958 (= res!499208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741968 () Bool)

(declare-fun res!499212 () Bool)

(assert (=> b!741968 (=> (not res!499212) (not e!414694))))

(assert (=> b!741968 (= res!499212 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20281 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20281 a!3186))))))

(declare-fun b!741969 () Bool)

(declare-fun res!499206 () Bool)

(assert (=> b!741969 (=> (not res!499206) (not e!414689))))

(assert (=> b!741969 (= res!499206 (validKeyInArray!0 (select (arr!19860 a!3186) j!159)))))

(assert (= (and start!65320 res!499214) b!741957))

(assert (= (and b!741957 res!499205) b!741969))

(assert (= (and b!741969 res!499206) b!741953))

(assert (= (and b!741953 res!499204) b!741964))

(assert (= (and b!741964 res!499201) b!741961))

(assert (= (and b!741961 res!499210) b!741958))

(assert (= (and b!741958 res!499208) b!741965))

(assert (= (and b!741965 res!499211) b!741968))

(assert (= (and b!741968 res!499212) b!741963))

(assert (= (and b!741963 res!499207) b!741959))

(assert (= (and b!741959 res!499213) b!741960))

(assert (= (and b!741960 c!81757) b!741954))

(assert (= (and b!741960 (not c!81757)) b!741966))

(assert (= (and b!741960 res!499209) b!741956))

(assert (= (and b!741956 res!499203) b!741962))

(assert (= (and b!741962 res!499202) b!741955))

(assert (= (and b!741955 res!499200) b!741967))

(declare-fun m!692875 () Bool)

(assert (=> b!741955 m!692875))

(assert (=> b!741955 m!692875))

(declare-fun m!692877 () Bool)

(assert (=> b!741955 m!692877))

(declare-fun m!692879 () Bool)

(assert (=> b!741964 m!692879))

(declare-fun m!692881 () Bool)

(assert (=> b!741958 m!692881))

(declare-fun m!692883 () Bool)

(assert (=> b!741956 m!692883))

(declare-fun m!692885 () Bool)

(assert (=> b!741956 m!692885))

(declare-fun m!692887 () Bool)

(assert (=> b!741956 m!692887))

(declare-fun m!692889 () Bool)

(assert (=> b!741956 m!692889))

(assert (=> b!741956 m!692889))

(declare-fun m!692891 () Bool)

(assert (=> b!741956 m!692891))

(declare-fun m!692893 () Bool)

(assert (=> b!741953 m!692893))

(assert (=> b!741969 m!692875))

(assert (=> b!741969 m!692875))

(declare-fun m!692895 () Bool)

(assert (=> b!741969 m!692895))

(assert (=> b!741967 m!692875))

(assert (=> b!741967 m!692875))

(declare-fun m!692897 () Bool)

(assert (=> b!741967 m!692897))

(assert (=> b!741963 m!692875))

(assert (=> b!741963 m!692875))

(declare-fun m!692899 () Bool)

(assert (=> b!741963 m!692899))

(assert (=> b!741963 m!692899))

(assert (=> b!741963 m!692875))

(declare-fun m!692901 () Bool)

(assert (=> b!741963 m!692901))

(declare-fun m!692903 () Bool)

(assert (=> start!65320 m!692903))

(declare-fun m!692905 () Bool)

(assert (=> start!65320 m!692905))

(assert (=> b!741954 m!692875))

(assert (=> b!741954 m!692875))

(declare-fun m!692907 () Bool)

(assert (=> b!741954 m!692907))

(declare-fun m!692909 () Bool)

(assert (=> b!741961 m!692909))

(declare-fun m!692911 () Bool)

(assert (=> b!741959 m!692911))

(assert (=> b!741966 m!692875))

(assert (=> b!741966 m!692875))

(declare-fun m!692913 () Bool)

(assert (=> b!741966 m!692913))

(declare-fun m!692915 () Bool)

(assert (=> b!741962 m!692915))

(declare-fun m!692917 () Bool)

(assert (=> b!741962 m!692917))

(declare-fun m!692919 () Bool)

(assert (=> b!741965 m!692919))

(push 1)

