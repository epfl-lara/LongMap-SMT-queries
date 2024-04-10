; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65880 () Bool)

(assert start!65880)

(declare-fun b!759555 () Bool)

(declare-fun res!514054 () Bool)

(declare-fun e!423419 () Bool)

(assert (=> b!759555 (=> (not res!514054) (not e!423419))))

(declare-datatypes ((array!42053 0))(
  ( (array!42054 (arr!20140 (Array (_ BitVec 32) (_ BitVec 64))) (size!20561 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42053)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759555 (= res!514054 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759556 () Bool)

(declare-fun res!514050 () Bool)

(assert (=> b!759556 (=> (not res!514050) (not e!423419))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!759556 (= res!514050 (and (= (size!20561 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20561 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20561 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759557 () Bool)

(declare-fun res!514043 () Bool)

(declare-fun e!423416 () Bool)

(assert (=> b!759557 (=> (not res!514043) (not e!423416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42053 (_ BitVec 32)) Bool)

(assert (=> b!759557 (= res!514043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759558 () Bool)

(declare-fun e!423420 () Bool)

(assert (=> b!759558 (= e!423416 e!423420)))

(declare-fun res!514053 () Bool)

(assert (=> b!759558 (=> (not res!514053) (not e!423420))))

(declare-datatypes ((SeekEntryResult!7740 0))(
  ( (MissingZero!7740 (index!33328 (_ BitVec 32))) (Found!7740 (index!33329 (_ BitVec 32))) (Intermediate!7740 (undefined!8552 Bool) (index!33330 (_ BitVec 32)) (x!64210 (_ BitVec 32))) (Undefined!7740) (MissingVacant!7740 (index!33331 (_ BitVec 32))) )
))
(declare-fun lt!338443 () SeekEntryResult!7740)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42053 (_ BitVec 32)) SeekEntryResult!7740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759558 (= res!514053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!338443))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759558 (= lt!338443 (Intermediate!7740 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!423415 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!759559 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!759559 (= e!423415 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!338443))))

(declare-fun b!759560 () Bool)

(declare-fun res!514051 () Bool)

(assert (=> b!759560 (=> (not res!514051) (not e!423419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759560 (= res!514051 (validKeyInArray!0 k0!2102))))

(declare-fun b!759561 () Bool)

(declare-fun e!423422 () Bool)

(declare-fun e!423417 () Bool)

(assert (=> b!759561 (= e!423422 e!423417)))

(declare-fun res!514046 () Bool)

(assert (=> b!759561 (=> (not res!514046) (not e!423417))))

(declare-fun lt!338444 () SeekEntryResult!7740)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42053 (_ BitVec 32)) SeekEntryResult!7740)

(assert (=> b!759561 (= res!514046 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!338444))))

(assert (=> b!759561 (= lt!338444 (Found!7740 j!159))))

(declare-fun b!759562 () Bool)

(declare-fun res!514052 () Bool)

(assert (=> b!759562 (=> (not res!514052) (not e!423416))))

(assert (=> b!759562 (= res!514052 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20561 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20561 a!3186))))))

(declare-fun b!759563 () Bool)

(declare-fun res!514047 () Bool)

(assert (=> b!759563 (=> (not res!514047) (not e!423420))))

(assert (=> b!759563 (= res!514047 e!423415)))

(declare-fun c!83137 () Bool)

(assert (=> b!759563 (= c!83137 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759554 () Bool)

(declare-fun res!514048 () Bool)

(assert (=> b!759554 (=> (not res!514048) (not e!423420))))

(assert (=> b!759554 (= res!514048 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20140 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!514041 () Bool)

(assert (=> start!65880 (=> (not res!514041) (not e!423419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65880 (= res!514041 (validMask!0 mask!3328))))

(assert (=> start!65880 e!423419))

(assert (=> start!65880 true))

(declare-fun array_inv!15936 (array!42053) Bool)

(assert (=> start!65880 (array_inv!15936 a!3186)))

(declare-fun b!759564 () Bool)

(declare-fun res!514055 () Bool)

(assert (=> b!759564 (=> (not res!514055) (not e!423419))))

(assert (=> b!759564 (= res!514055 (validKeyInArray!0 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!759565 () Bool)

(declare-fun e!423421 () Bool)

(assert (=> b!759565 (= e!423421 (not true))))

(assert (=> b!759565 e!423422))

(declare-fun res!514044 () Bool)

(assert (=> b!759565 (=> (not res!514044) (not e!423422))))

(assert (=> b!759565 (= res!514044 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26320 0))(
  ( (Unit!26321) )
))
(declare-fun lt!338442 () Unit!26320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26320)

(assert (=> b!759565 (= lt!338442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759566 () Bool)

(declare-fun res!514042 () Bool)

(assert (=> b!759566 (=> (not res!514042) (not e!423416))))

(declare-datatypes ((List!14142 0))(
  ( (Nil!14139) (Cons!14138 (h!15210 (_ BitVec 64)) (t!20457 List!14142)) )
))
(declare-fun arrayNoDuplicates!0 (array!42053 (_ BitVec 32) List!14142) Bool)

(assert (=> b!759566 (= res!514042 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14139))))

(declare-fun b!759567 () Bool)

(assert (=> b!759567 (= e!423420 e!423421)))

(declare-fun res!514049 () Bool)

(assert (=> b!759567 (=> (not res!514049) (not e!423421))))

(declare-fun lt!338446 () (_ BitVec 64))

(declare-fun lt!338445 () array!42053)

(assert (=> b!759567 (= res!514049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338446 mask!3328) lt!338446 lt!338445 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338446 lt!338445 mask!3328)))))

(assert (=> b!759567 (= lt!338446 (select (store (arr!20140 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759567 (= lt!338445 (array!42054 (store (arr!20140 a!3186) i!1173 k0!2102) (size!20561 a!3186)))))

(declare-fun b!759568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42053 (_ BitVec 32)) SeekEntryResult!7740)

(assert (=> b!759568 (= e!423417 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!338444))))

(declare-fun b!759569 () Bool)

(assert (=> b!759569 (= e!423415 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) (Found!7740 j!159)))))

(declare-fun b!759570 () Bool)

(assert (=> b!759570 (= e!423419 e!423416)))

(declare-fun res!514045 () Bool)

(assert (=> b!759570 (=> (not res!514045) (not e!423416))))

(declare-fun lt!338447 () SeekEntryResult!7740)

(assert (=> b!759570 (= res!514045 (or (= lt!338447 (MissingZero!7740 i!1173)) (= lt!338447 (MissingVacant!7740 i!1173))))))

(assert (=> b!759570 (= lt!338447 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65880 res!514041) b!759556))

(assert (= (and b!759556 res!514050) b!759564))

(assert (= (and b!759564 res!514055) b!759560))

(assert (= (and b!759560 res!514051) b!759555))

(assert (= (and b!759555 res!514054) b!759570))

(assert (= (and b!759570 res!514045) b!759557))

(assert (= (and b!759557 res!514043) b!759566))

(assert (= (and b!759566 res!514042) b!759562))

(assert (= (and b!759562 res!514052) b!759558))

(assert (= (and b!759558 res!514053) b!759554))

(assert (= (and b!759554 res!514048) b!759563))

(assert (= (and b!759563 c!83137) b!759559))

(assert (= (and b!759563 (not c!83137)) b!759569))

(assert (= (and b!759563 res!514047) b!759567))

(assert (= (and b!759567 res!514049) b!759565))

(assert (= (and b!759565 res!514044) b!759561))

(assert (= (and b!759561 res!514046) b!759568))

(declare-fun m!706901 () Bool)

(assert (=> b!759565 m!706901))

(declare-fun m!706903 () Bool)

(assert (=> b!759565 m!706903))

(declare-fun m!706905 () Bool)

(assert (=> b!759554 m!706905))

(declare-fun m!706907 () Bool)

(assert (=> b!759558 m!706907))

(assert (=> b!759558 m!706907))

(declare-fun m!706909 () Bool)

(assert (=> b!759558 m!706909))

(assert (=> b!759558 m!706909))

(assert (=> b!759558 m!706907))

(declare-fun m!706911 () Bool)

(assert (=> b!759558 m!706911))

(assert (=> b!759568 m!706907))

(assert (=> b!759568 m!706907))

(declare-fun m!706913 () Bool)

(assert (=> b!759568 m!706913))

(assert (=> b!759561 m!706907))

(assert (=> b!759561 m!706907))

(declare-fun m!706915 () Bool)

(assert (=> b!759561 m!706915))

(declare-fun m!706917 () Bool)

(assert (=> start!65880 m!706917))

(declare-fun m!706919 () Bool)

(assert (=> start!65880 m!706919))

(assert (=> b!759569 m!706907))

(assert (=> b!759569 m!706907))

(declare-fun m!706921 () Bool)

(assert (=> b!759569 m!706921))

(assert (=> b!759559 m!706907))

(assert (=> b!759559 m!706907))

(declare-fun m!706923 () Bool)

(assert (=> b!759559 m!706923))

(declare-fun m!706925 () Bool)

(assert (=> b!759555 m!706925))

(declare-fun m!706927 () Bool)

(assert (=> b!759566 m!706927))

(declare-fun m!706929 () Bool)

(assert (=> b!759567 m!706929))

(declare-fun m!706931 () Bool)

(assert (=> b!759567 m!706931))

(declare-fun m!706933 () Bool)

(assert (=> b!759567 m!706933))

(declare-fun m!706935 () Bool)

(assert (=> b!759567 m!706935))

(assert (=> b!759567 m!706933))

(declare-fun m!706937 () Bool)

(assert (=> b!759567 m!706937))

(declare-fun m!706939 () Bool)

(assert (=> b!759560 m!706939))

(assert (=> b!759564 m!706907))

(assert (=> b!759564 m!706907))

(declare-fun m!706941 () Bool)

(assert (=> b!759564 m!706941))

(declare-fun m!706943 () Bool)

(assert (=> b!759570 m!706943))

(declare-fun m!706945 () Bool)

(assert (=> b!759557 m!706945))

(check-sat (not b!759570) (not b!759558) (not b!759569) (not b!759568) (not b!759567) (not b!759565) (not b!759555) (not b!759566) (not b!759560) (not start!65880) (not b!759559) (not b!759557) (not b!759561) (not b!759564))
(check-sat)
