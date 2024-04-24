; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65820 () Bool)

(assert start!65820)

(declare-fun b!754032 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41863 0))(
  ( (array!41864 (arr!20041 (Array (_ BitVec 32) (_ BitVec 64))) (size!20461 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41863)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!420630 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7597 0))(
  ( (MissingZero!7597 (index!32756 (_ BitVec 32))) (Found!7597 (index!32757 (_ BitVec 32))) (Intermediate!7597 (undefined!8409 Bool) (index!32758 (_ BitVec 32)) (x!63831 (_ BitVec 32))) (Undefined!7597) (MissingVacant!7597 (index!32759 (_ BitVec 32))) )
))
(declare-fun lt!335465 () SeekEntryResult!7597)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!754032 (= e!420630 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!335465))))

(declare-fun b!754033 () Bool)

(declare-fun res!509157 () Bool)

(declare-fun e!420634 () Bool)

(assert (=> b!754033 (=> (not res!509157) (not e!420634))))

(declare-fun e!420632 () Bool)

(assert (=> b!754033 (= res!509157 e!420632)))

(declare-fun c!82828 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!754033 (= c!82828 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754034 () Bool)

(declare-fun e!420639 () Bool)

(declare-fun e!420631 () Bool)

(assert (=> b!754034 (= e!420639 e!420631)))

(declare-fun res!509147 () Bool)

(assert (=> b!754034 (=> res!509147 e!420631)))

(declare-fun lt!335455 () SeekEntryResult!7597)

(assert (=> b!754034 (= res!509147 (not (= lt!335455 lt!335465)))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!754034 (= lt!335455 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754035 () Bool)

(assert (=> b!754035 (= e!420632 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) (Found!7597 j!159)))))

(declare-fun b!754036 () Bool)

(declare-fun e!420638 () Bool)

(declare-fun e!420635 () Bool)

(assert (=> b!754036 (= e!420638 e!420635)))

(declare-fun res!509143 () Bool)

(assert (=> b!754036 (=> (not res!509143) (not e!420635))))

(declare-fun lt!335461 () SeekEntryResult!7597)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754036 (= res!509143 (or (= lt!335461 (MissingZero!7597 i!1173)) (= lt!335461 (MissingVacant!7597 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!754036 (= lt!335461 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754037 () Bool)

(declare-fun res!509156 () Bool)

(assert (=> b!754037 (=> (not res!509156) (not e!420638))))

(declare-fun arrayContainsKey!0 (array!41863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754037 (= res!509156 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754038 () Bool)

(declare-fun res!509159 () Bool)

(assert (=> b!754038 (=> (not res!509159) (not e!420635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41863 (_ BitVec 32)) Bool)

(assert (=> b!754038 (= res!509159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754039 () Bool)

(declare-fun e!420633 () Bool)

(assert (=> b!754039 (= e!420633 true)))

(declare-fun e!420637 () Bool)

(assert (=> b!754039 e!420637))

(declare-fun res!509146 () Bool)

(assert (=> b!754039 (=> (not res!509146) (not e!420637))))

(declare-fun lt!335464 () (_ BitVec 64))

(assert (=> b!754039 (= res!509146 (= lt!335464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25945 0))(
  ( (Unit!25946) )
))
(declare-fun lt!335463 () Unit!25945)

(declare-fun e!420628 () Unit!25945)

(assert (=> b!754039 (= lt!335463 e!420628)))

(declare-fun c!82829 () Bool)

(assert (=> b!754039 (= c!82829 (= lt!335464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754040 () Bool)

(declare-fun Unit!25947 () Unit!25945)

(assert (=> b!754040 (= e!420628 Unit!25947)))

(assert (=> b!754040 false))

(declare-fun b!754041 () Bool)

(assert (=> b!754041 (= e!420631 e!420633)))

(declare-fun res!509155 () Bool)

(assert (=> b!754041 (=> res!509155 e!420633)))

(declare-fun lt!335466 () (_ BitVec 64))

(assert (=> b!754041 (= res!509155 (= lt!335464 lt!335466))))

(assert (=> b!754041 (= lt!335464 (select (store (arr!20041 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754042 () Bool)

(declare-fun e!420636 () Bool)

(assert (=> b!754042 (= e!420634 e!420636)))

(declare-fun res!509150 () Bool)

(assert (=> b!754042 (=> (not res!509150) (not e!420636))))

(declare-fun lt!335456 () SeekEntryResult!7597)

(declare-fun lt!335459 () SeekEntryResult!7597)

(assert (=> b!754042 (= res!509150 (= lt!335456 lt!335459))))

(declare-fun lt!335457 () array!41863)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41863 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!754042 (= lt!335459 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335466 lt!335457 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754042 (= lt!335456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335466 mask!3328) lt!335466 lt!335457 mask!3328))))

(assert (=> b!754042 (= lt!335466 (select (store (arr!20041 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754042 (= lt!335457 (array!41864 (store (arr!20041 a!3186) i!1173 k0!2102) (size!20461 a!3186)))))

(declare-fun b!754043 () Bool)

(declare-fun lt!335458 () SeekEntryResult!7597)

(assert (=> b!754043 (= e!420637 (= lt!335458 lt!335455))))

(declare-fun b!754044 () Bool)

(assert (=> b!754044 (= e!420635 e!420634)))

(declare-fun res!509160 () Bool)

(assert (=> b!754044 (=> (not res!509160) (not e!420634))))

(declare-fun lt!335462 () SeekEntryResult!7597)

(assert (=> b!754044 (= res!509160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20041 a!3186) j!159) mask!3328) (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!335462))))

(assert (=> b!754044 (= lt!335462 (Intermediate!7597 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754045 () Bool)

(declare-fun res!509158 () Bool)

(assert (=> b!754045 (=> (not res!509158) (not e!420638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754045 (= res!509158 (validKeyInArray!0 (select (arr!20041 a!3186) j!159)))))

(declare-fun b!754046 () Bool)

(declare-fun Unit!25948 () Unit!25945)

(assert (=> b!754046 (= e!420628 Unit!25948)))

(declare-fun b!754047 () Bool)

(declare-fun res!509148 () Bool)

(assert (=> b!754047 (=> (not res!509148) (not e!420638))))

(assert (=> b!754047 (= res!509148 (and (= (size!20461 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20461 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20461 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754048 () Bool)

(declare-fun res!509151 () Bool)

(assert (=> b!754048 (=> (not res!509151) (not e!420637))))

(assert (=> b!754048 (= res!509151 (= (seekEntryOrOpen!0 lt!335466 lt!335457 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335466 lt!335457 mask!3328)))))

(declare-fun b!754049 () Bool)

(declare-fun res!509145 () Bool)

(assert (=> b!754049 (=> (not res!509145) (not e!420635))))

(assert (=> b!754049 (= res!509145 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20461 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20461 a!3186))))))

(declare-fun b!754050 () Bool)

(declare-fun res!509144 () Bool)

(assert (=> b!754050 (=> (not res!509144) (not e!420634))))

(assert (=> b!754050 (= res!509144 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20041 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!509149 () Bool)

(assert (=> start!65820 (=> (not res!509149) (not e!420638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65820 (= res!509149 (validMask!0 mask!3328))))

(assert (=> start!65820 e!420638))

(assert (=> start!65820 true))

(declare-fun array_inv!15900 (array!41863) Bool)

(assert (=> start!65820 (array_inv!15900 a!3186)))

(declare-fun b!754051 () Bool)

(declare-fun res!509152 () Bool)

(assert (=> b!754051 (=> (not res!509152) (not e!420638))))

(assert (=> b!754051 (= res!509152 (validKeyInArray!0 k0!2102))))

(declare-fun b!754052 () Bool)

(assert (=> b!754052 (= e!420632 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20041 a!3186) j!159) a!3186 mask!3328) lt!335462))))

(declare-fun b!754053 () Bool)

(assert (=> b!754053 (= e!420636 (not e!420639))))

(declare-fun res!509161 () Bool)

(assert (=> b!754053 (=> res!509161 e!420639)))

(get-info :version)

(assert (=> b!754053 (= res!509161 (or (not ((_ is Intermediate!7597) lt!335459)) (bvslt x!1131 (x!63831 lt!335459)) (not (= x!1131 (x!63831 lt!335459))) (not (= index!1321 (index!32758 lt!335459)))))))

(assert (=> b!754053 e!420630))

(declare-fun res!509154 () Bool)

(assert (=> b!754053 (=> (not res!509154) (not e!420630))))

(assert (=> b!754053 (= res!509154 (= lt!335458 lt!335465))))

(assert (=> b!754053 (= lt!335465 (Found!7597 j!159))))

(assert (=> b!754053 (= lt!335458 (seekEntryOrOpen!0 (select (arr!20041 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754053 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335460 () Unit!25945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25945)

(assert (=> b!754053 (= lt!335460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754054 () Bool)

(declare-fun res!509153 () Bool)

(assert (=> b!754054 (=> (not res!509153) (not e!420635))))

(declare-datatypes ((List!13950 0))(
  ( (Nil!13947) (Cons!13946 (h!15024 (_ BitVec 64)) (t!20257 List!13950)) )
))
(declare-fun arrayNoDuplicates!0 (array!41863 (_ BitVec 32) List!13950) Bool)

(assert (=> b!754054 (= res!509153 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13947))))

(assert (= (and start!65820 res!509149) b!754047))

(assert (= (and b!754047 res!509148) b!754045))

(assert (= (and b!754045 res!509158) b!754051))

(assert (= (and b!754051 res!509152) b!754037))

(assert (= (and b!754037 res!509156) b!754036))

(assert (= (and b!754036 res!509143) b!754038))

(assert (= (and b!754038 res!509159) b!754054))

(assert (= (and b!754054 res!509153) b!754049))

(assert (= (and b!754049 res!509145) b!754044))

(assert (= (and b!754044 res!509160) b!754050))

(assert (= (and b!754050 res!509144) b!754033))

(assert (= (and b!754033 c!82828) b!754052))

(assert (= (and b!754033 (not c!82828)) b!754035))

(assert (= (and b!754033 res!509157) b!754042))

(assert (= (and b!754042 res!509150) b!754053))

(assert (= (and b!754053 res!509154) b!754032))

(assert (= (and b!754053 (not res!509161)) b!754034))

(assert (= (and b!754034 (not res!509147)) b!754041))

(assert (= (and b!754041 (not res!509155)) b!754039))

(assert (= (and b!754039 c!82829) b!754040))

(assert (= (and b!754039 (not c!82829)) b!754046))

(assert (= (and b!754039 res!509146) b!754048))

(assert (= (and b!754048 res!509151) b!754043))

(declare-fun m!703179 () Bool)

(assert (=> b!754051 m!703179))

(declare-fun m!703181 () Bool)

(assert (=> b!754045 m!703181))

(assert (=> b!754045 m!703181))

(declare-fun m!703183 () Bool)

(assert (=> b!754045 m!703183))

(assert (=> b!754034 m!703181))

(assert (=> b!754034 m!703181))

(declare-fun m!703185 () Bool)

(assert (=> b!754034 m!703185))

(declare-fun m!703187 () Bool)

(assert (=> b!754050 m!703187))

(declare-fun m!703189 () Bool)

(assert (=> b!754054 m!703189))

(declare-fun m!703191 () Bool)

(assert (=> b!754042 m!703191))

(assert (=> b!754042 m!703191))

(declare-fun m!703193 () Bool)

(assert (=> b!754042 m!703193))

(declare-fun m!703195 () Bool)

(assert (=> b!754042 m!703195))

(declare-fun m!703197 () Bool)

(assert (=> b!754042 m!703197))

(declare-fun m!703199 () Bool)

(assert (=> b!754042 m!703199))

(assert (=> b!754041 m!703195))

(declare-fun m!703201 () Bool)

(assert (=> b!754041 m!703201))

(declare-fun m!703203 () Bool)

(assert (=> start!65820 m!703203))

(declare-fun m!703205 () Bool)

(assert (=> start!65820 m!703205))

(assert (=> b!754032 m!703181))

(assert (=> b!754032 m!703181))

(declare-fun m!703207 () Bool)

(assert (=> b!754032 m!703207))

(assert (=> b!754053 m!703181))

(assert (=> b!754053 m!703181))

(declare-fun m!703209 () Bool)

(assert (=> b!754053 m!703209))

(declare-fun m!703211 () Bool)

(assert (=> b!754053 m!703211))

(declare-fun m!703213 () Bool)

(assert (=> b!754053 m!703213))

(assert (=> b!754052 m!703181))

(assert (=> b!754052 m!703181))

(declare-fun m!703215 () Bool)

(assert (=> b!754052 m!703215))

(declare-fun m!703217 () Bool)

(assert (=> b!754036 m!703217))

(assert (=> b!754035 m!703181))

(assert (=> b!754035 m!703181))

(assert (=> b!754035 m!703185))

(declare-fun m!703219 () Bool)

(assert (=> b!754048 m!703219))

(declare-fun m!703221 () Bool)

(assert (=> b!754048 m!703221))

(declare-fun m!703223 () Bool)

(assert (=> b!754037 m!703223))

(assert (=> b!754044 m!703181))

(assert (=> b!754044 m!703181))

(declare-fun m!703225 () Bool)

(assert (=> b!754044 m!703225))

(assert (=> b!754044 m!703225))

(assert (=> b!754044 m!703181))

(declare-fun m!703227 () Bool)

(assert (=> b!754044 m!703227))

(declare-fun m!703229 () Bool)

(assert (=> b!754038 m!703229))

(check-sat (not b!754045) (not b!754052) (not b!754036) (not b!754048) (not b!754051) (not b!754037) (not b!754038) (not start!65820) (not b!754035) (not b!754034) (not b!754044) (not b!754042) (not b!754053) (not b!754054) (not b!754032))
(check-sat)
