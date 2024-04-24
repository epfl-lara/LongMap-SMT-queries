; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67252 () Bool)

(assert start!67252)

(declare-fun b!776276 () Bool)

(declare-fun res!524796 () Bool)

(declare-fun e!432084 () Bool)

(assert (=> b!776276 (=> (not res!524796) (not e!432084))))

(declare-datatypes ((array!42487 0))(
  ( (array!42488 (arr!20335 (Array (_ BitVec 32) (_ BitVec 64))) (size!20755 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42487)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776276 (= res!524796 (and (= (size!20755 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20755 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20755 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776277 () Bool)

(declare-fun res!524801 () Bool)

(assert (=> b!776277 (=> (not res!524801) (not e!432084))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776277 (= res!524801 (validKeyInArray!0 k0!2102))))

(declare-fun b!776278 () Bool)

(declare-fun res!524808 () Bool)

(declare-fun e!432087 () Bool)

(assert (=> b!776278 (=> (not res!524808) (not e!432087))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!776278 (= res!524808 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20335 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776279 () Bool)

(declare-fun res!524798 () Bool)

(assert (=> b!776279 (=> (not res!524798) (not e!432084))))

(assert (=> b!776279 (= res!524798 (validKeyInArray!0 (select (arr!20335 a!3186) j!159)))))

(declare-fun res!524805 () Bool)

(assert (=> start!67252 (=> (not res!524805) (not e!432084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67252 (= res!524805 (validMask!0 mask!3328))))

(assert (=> start!67252 e!432084))

(assert (=> start!67252 true))

(declare-fun array_inv!16194 (array!42487) Bool)

(assert (=> start!67252 (array_inv!16194 a!3186)))

(declare-fun b!776280 () Bool)

(declare-fun e!432086 () Bool)

(assert (=> b!776280 (= e!432087 e!432086)))

(declare-fun res!524806 () Bool)

(assert (=> b!776280 (=> (not res!524806) (not e!432086))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345809 () (_ BitVec 64))

(declare-fun lt!345806 () array!42487)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7891 0))(
  ( (MissingZero!7891 (index!33932 (_ BitVec 32))) (Found!7891 (index!33933 (_ BitVec 32))) (Intermediate!7891 (undefined!8703 Bool) (index!33934 (_ BitVec 32)) (x!65037 (_ BitVec 32))) (Undefined!7891) (MissingVacant!7891 (index!33935 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776280 (= res!524806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345809 mask!3328) lt!345809 lt!345806 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345809 lt!345806 mask!3328)))))

(assert (=> b!776280 (= lt!345809 (select (store (arr!20335 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776280 (= lt!345806 (array!42488 (store (arr!20335 a!3186) i!1173 k0!2102) (size!20755 a!3186)))))

(declare-fun lt!345808 () SeekEntryResult!7891)

(declare-fun e!432082 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776281 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!776281 (= e!432082 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345808))))

(declare-fun b!776282 () Bool)

(declare-fun e!432083 () Bool)

(assert (=> b!776282 (= e!432083 e!432082)))

(declare-fun res!524807 () Bool)

(assert (=> b!776282 (=> (not res!524807) (not e!432082))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!776282 (= res!524807 (= (seekEntryOrOpen!0 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345808))))

(assert (=> b!776282 (= lt!345808 (Found!7891 j!159))))

(declare-fun b!776283 () Bool)

(declare-fun res!524800 () Bool)

(assert (=> b!776283 (=> (not res!524800) (not e!432087))))

(declare-fun e!432088 () Bool)

(assert (=> b!776283 (= res!524800 e!432088)))

(declare-fun c!86144 () Bool)

(assert (=> b!776283 (= c!86144 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776284 () Bool)

(declare-fun res!524802 () Bool)

(declare-fun e!432085 () Bool)

(assert (=> b!776284 (=> (not res!524802) (not e!432085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42487 (_ BitVec 32)) Bool)

(assert (=> b!776284 (= res!524802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!345811 () SeekEntryResult!7891)

(declare-fun b!776285 () Bool)

(assert (=> b!776285 (= e!432088 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345811))))

(declare-fun b!776286 () Bool)

(declare-fun res!524804 () Bool)

(assert (=> b!776286 (=> (not res!524804) (not e!432085))))

(declare-datatypes ((List!14244 0))(
  ( (Nil!14241) (Cons!14240 (h!15354 (_ BitVec 64)) (t!20551 List!14244)) )
))
(declare-fun arrayNoDuplicates!0 (array!42487 (_ BitVec 32) List!14244) Bool)

(assert (=> b!776286 (= res!524804 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14241))))

(declare-fun b!776287 () Bool)

(assert (=> b!776287 (= e!432085 e!432087)))

(declare-fun res!524797 () Bool)

(assert (=> b!776287 (=> (not res!524797) (not e!432087))))

(assert (=> b!776287 (= res!524797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20335 a!3186) j!159) mask!3328) (select (arr!20335 a!3186) j!159) a!3186 mask!3328) lt!345811))))

(assert (=> b!776287 (= lt!345811 (Intermediate!7891 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776288 () Bool)

(assert (=> b!776288 (= e!432088 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20335 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159)))))

(declare-fun b!776289 () Bool)

(declare-fun res!524799 () Bool)

(assert (=> b!776289 (=> (not res!524799) (not e!432084))))

(declare-fun arrayContainsKey!0 (array!42487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776289 (= res!524799 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776290 () Bool)

(assert (=> b!776290 (= e!432086 (not true))))

(assert (=> b!776290 e!432083))

(declare-fun res!524794 () Bool)

(assert (=> b!776290 (=> (not res!524794) (not e!432083))))

(assert (=> b!776290 (= res!524794 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26755 0))(
  ( (Unit!26756) )
))
(declare-fun lt!345810 () Unit!26755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26755)

(assert (=> b!776290 (= lt!345810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776291 () Bool)

(declare-fun res!524803 () Bool)

(assert (=> b!776291 (=> (not res!524803) (not e!432085))))

(assert (=> b!776291 (= res!524803 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20755 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20755 a!3186))))))

(declare-fun b!776292 () Bool)

(assert (=> b!776292 (= e!432084 e!432085)))

(declare-fun res!524795 () Bool)

(assert (=> b!776292 (=> (not res!524795) (not e!432085))))

(declare-fun lt!345807 () SeekEntryResult!7891)

(assert (=> b!776292 (= res!524795 (or (= lt!345807 (MissingZero!7891 i!1173)) (= lt!345807 (MissingVacant!7891 i!1173))))))

(assert (=> b!776292 (= lt!345807 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67252 res!524805) b!776276))

(assert (= (and b!776276 res!524796) b!776279))

(assert (= (and b!776279 res!524798) b!776277))

(assert (= (and b!776277 res!524801) b!776289))

(assert (= (and b!776289 res!524799) b!776292))

(assert (= (and b!776292 res!524795) b!776284))

(assert (= (and b!776284 res!524802) b!776286))

(assert (= (and b!776286 res!524804) b!776291))

(assert (= (and b!776291 res!524803) b!776287))

(assert (= (and b!776287 res!524797) b!776278))

(assert (= (and b!776278 res!524808) b!776283))

(assert (= (and b!776283 c!86144) b!776285))

(assert (= (and b!776283 (not c!86144)) b!776288))

(assert (= (and b!776283 res!524800) b!776280))

(assert (= (and b!776280 res!524806) b!776290))

(assert (= (and b!776290 res!524794) b!776282))

(assert (= (and b!776282 res!524807) b!776281))

(declare-fun m!720887 () Bool)

(assert (=> b!776279 m!720887))

(assert (=> b!776279 m!720887))

(declare-fun m!720889 () Bool)

(assert (=> b!776279 m!720889))

(declare-fun m!720891 () Bool)

(assert (=> b!776284 m!720891))

(declare-fun m!720893 () Bool)

(assert (=> b!776278 m!720893))

(assert (=> b!776287 m!720887))

(assert (=> b!776287 m!720887))

(declare-fun m!720895 () Bool)

(assert (=> b!776287 m!720895))

(assert (=> b!776287 m!720895))

(assert (=> b!776287 m!720887))

(declare-fun m!720897 () Bool)

(assert (=> b!776287 m!720897))

(declare-fun m!720899 () Bool)

(assert (=> b!776290 m!720899))

(declare-fun m!720901 () Bool)

(assert (=> b!776290 m!720901))

(assert (=> b!776288 m!720887))

(assert (=> b!776288 m!720887))

(declare-fun m!720903 () Bool)

(assert (=> b!776288 m!720903))

(declare-fun m!720905 () Bool)

(assert (=> b!776289 m!720905))

(assert (=> b!776285 m!720887))

(assert (=> b!776285 m!720887))

(declare-fun m!720907 () Bool)

(assert (=> b!776285 m!720907))

(assert (=> b!776282 m!720887))

(assert (=> b!776282 m!720887))

(declare-fun m!720909 () Bool)

(assert (=> b!776282 m!720909))

(declare-fun m!720911 () Bool)

(assert (=> b!776277 m!720911))

(declare-fun m!720913 () Bool)

(assert (=> start!67252 m!720913))

(declare-fun m!720915 () Bool)

(assert (=> start!67252 m!720915))

(declare-fun m!720917 () Bool)

(assert (=> b!776280 m!720917))

(declare-fun m!720919 () Bool)

(assert (=> b!776280 m!720919))

(declare-fun m!720921 () Bool)

(assert (=> b!776280 m!720921))

(assert (=> b!776280 m!720917))

(declare-fun m!720923 () Bool)

(assert (=> b!776280 m!720923))

(declare-fun m!720925 () Bool)

(assert (=> b!776280 m!720925))

(declare-fun m!720927 () Bool)

(assert (=> b!776292 m!720927))

(assert (=> b!776281 m!720887))

(assert (=> b!776281 m!720887))

(declare-fun m!720929 () Bool)

(assert (=> b!776281 m!720929))

(declare-fun m!720931 () Bool)

(assert (=> b!776286 m!720931))

(check-sat (not b!776285) (not start!67252) (not b!776282) (not b!776277) (not b!776289) (not b!776287) (not b!776280) (not b!776279) (not b!776284) (not b!776290) (not b!776286) (not b!776292) (not b!776281) (not b!776288))
(check-sat)
