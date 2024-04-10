; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64546 () Bool)

(assert start!64546)

(declare-fun b!727027 () Bool)

(declare-fun e!407016 () Bool)

(declare-fun e!407017 () Bool)

(assert (=> b!727027 (= e!407016 e!407017)))

(declare-fun res!487943 () Bool)

(assert (=> b!727027 (=> (not res!487943) (not e!407017))))

(declare-datatypes ((array!41064 0))(
  ( (array!41065 (arr!19653 (Array (_ BitVec 32) (_ BitVec 64))) (size!20074 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41064)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7253 0))(
  ( (MissingZero!7253 (index!31380 (_ BitVec 32))) (Found!7253 (index!31381 (_ BitVec 32))) (Intermediate!7253 (undefined!8065 Bool) (index!31382 (_ BitVec 32)) (x!62367 (_ BitVec 32))) (Undefined!7253) (MissingVacant!7253 (index!31383 (_ BitVec 32))) )
))
(declare-fun lt!321998 () SeekEntryResult!7253)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41064 (_ BitVec 32)) SeekEntryResult!7253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727027 (= res!487943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19653 a!3186) j!159) mask!3328) (select (arr!19653 a!3186) j!159) a!3186 mask!3328) lt!321998))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727027 (= lt!321998 (Intermediate!7253 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727028 () Bool)

(declare-fun res!487949 () Bool)

(assert (=> b!727028 (=> (not res!487949) (not e!407016))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!727028 (= res!487949 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20074 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20074 a!3186))))))

(declare-fun b!727029 () Bool)

(declare-fun e!407020 () Bool)

(assert (=> b!727029 (= e!407020 true)))

(declare-fun lt!321995 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727029 (= lt!321995 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727030 () Bool)

(declare-fun res!487947 () Bool)

(assert (=> b!727030 (=> (not res!487947) (not e!407016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41064 (_ BitVec 32)) Bool)

(assert (=> b!727030 (= res!487947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727031 () Bool)

(declare-fun e!407013 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41064 (_ BitVec 32)) SeekEntryResult!7253)

(assert (=> b!727031 (= e!407013 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19653 a!3186) j!159) a!3186 mask!3328) (Found!7253 j!159)))))

(declare-fun b!727032 () Bool)

(declare-fun res!487946 () Bool)

(assert (=> b!727032 (=> (not res!487946) (not e!407017))))

(assert (=> b!727032 (= res!487946 e!407013)))

(declare-fun c!79915 () Bool)

(assert (=> b!727032 (= c!79915 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727034 () Bool)

(declare-fun e!407018 () Bool)

(assert (=> b!727034 (= e!407018 e!407016)))

(declare-fun res!487944 () Bool)

(assert (=> b!727034 (=> (not res!487944) (not e!407016))))

(declare-fun lt!321994 () SeekEntryResult!7253)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727034 (= res!487944 (or (= lt!321994 (MissingZero!7253 i!1173)) (= lt!321994 (MissingVacant!7253 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41064 (_ BitVec 32)) SeekEntryResult!7253)

(assert (=> b!727034 (= lt!321994 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727035 () Bool)

(declare-fun res!487956 () Bool)

(assert (=> b!727035 (=> (not res!487956) (not e!407016))))

(declare-datatypes ((List!13655 0))(
  ( (Nil!13652) (Cons!13651 (h!14708 (_ BitVec 64)) (t!19970 List!13655)) )
))
(declare-fun arrayNoDuplicates!0 (array!41064 (_ BitVec 32) List!13655) Bool)

(assert (=> b!727035 (= res!487956 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13652))))

(declare-fun b!727036 () Bool)

(declare-fun e!407014 () Bool)

(assert (=> b!727036 (= e!407014 (not e!407020))))

(declare-fun res!487953 () Bool)

(assert (=> b!727036 (=> res!487953 e!407020)))

(declare-fun lt!321996 () SeekEntryResult!7253)

(assert (=> b!727036 (= res!487953 (or (not (is-Intermediate!7253 lt!321996)) (bvsge x!1131 (x!62367 lt!321996))))))

(declare-fun e!407021 () Bool)

(assert (=> b!727036 e!407021))

(declare-fun res!487955 () Bool)

(assert (=> b!727036 (=> (not res!487955) (not e!407021))))

(assert (=> b!727036 (= res!487955 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24824 0))(
  ( (Unit!24825) )
))
(declare-fun lt!321992 () Unit!24824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24824)

(assert (=> b!727036 (= lt!321992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727037 () Bool)

(assert (=> b!727037 (= e!407013 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19653 a!3186) j!159) a!3186 mask!3328) lt!321998))))

(declare-fun b!727038 () Bool)

(declare-fun res!487945 () Bool)

(assert (=> b!727038 (=> (not res!487945) (not e!407018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727038 (= res!487945 (validKeyInArray!0 (select (arr!19653 a!3186) j!159)))))

(declare-fun b!727039 () Bool)

(declare-fun res!487954 () Bool)

(assert (=> b!727039 (=> (not res!487954) (not e!407017))))

(assert (=> b!727039 (= res!487954 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19653 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727040 () Bool)

(declare-fun res!487951 () Bool)

(assert (=> b!727040 (=> (not res!487951) (not e!407018))))

(declare-fun arrayContainsKey!0 (array!41064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727040 (= res!487951 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!321990 () SeekEntryResult!7253)

(declare-fun e!407015 () Bool)

(declare-fun b!727041 () Bool)

(assert (=> b!727041 (= e!407015 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19653 a!3186) j!159) a!3186 mask!3328) lt!321990))))

(declare-fun b!727042 () Bool)

(assert (=> b!727042 (= e!407021 e!407015)))

(declare-fun res!487950 () Bool)

(assert (=> b!727042 (=> (not res!487950) (not e!407015))))

(assert (=> b!727042 (= res!487950 (= (seekEntryOrOpen!0 (select (arr!19653 a!3186) j!159) a!3186 mask!3328) lt!321990))))

(assert (=> b!727042 (= lt!321990 (Found!7253 j!159))))

(declare-fun b!727043 () Bool)

(declare-fun res!487957 () Bool)

(assert (=> b!727043 (=> (not res!487957) (not e!407018))))

(assert (=> b!727043 (= res!487957 (and (= (size!20074 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20074 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20074 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727044 () Bool)

(declare-fun res!487952 () Bool)

(assert (=> b!727044 (=> (not res!487952) (not e!407018))))

(assert (=> b!727044 (= res!487952 (validKeyInArray!0 k!2102))))

(declare-fun res!487948 () Bool)

(assert (=> start!64546 (=> (not res!487948) (not e!407018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64546 (= res!487948 (validMask!0 mask!3328))))

(assert (=> start!64546 e!407018))

(assert (=> start!64546 true))

(declare-fun array_inv!15449 (array!41064) Bool)

(assert (=> start!64546 (array_inv!15449 a!3186)))

(declare-fun b!727033 () Bool)

(assert (=> b!727033 (= e!407017 e!407014)))

(declare-fun res!487958 () Bool)

(assert (=> b!727033 (=> (not res!487958) (not e!407014))))

(declare-fun lt!321993 () SeekEntryResult!7253)

(assert (=> b!727033 (= res!487958 (= lt!321993 lt!321996))))

(declare-fun lt!321997 () array!41064)

(declare-fun lt!321991 () (_ BitVec 64))

(assert (=> b!727033 (= lt!321996 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321991 lt!321997 mask!3328))))

(assert (=> b!727033 (= lt!321993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321991 mask!3328) lt!321991 lt!321997 mask!3328))))

(assert (=> b!727033 (= lt!321991 (select (store (arr!19653 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727033 (= lt!321997 (array!41065 (store (arr!19653 a!3186) i!1173 k!2102) (size!20074 a!3186)))))

(assert (= (and start!64546 res!487948) b!727043))

(assert (= (and b!727043 res!487957) b!727038))

(assert (= (and b!727038 res!487945) b!727044))

(assert (= (and b!727044 res!487952) b!727040))

(assert (= (and b!727040 res!487951) b!727034))

(assert (= (and b!727034 res!487944) b!727030))

(assert (= (and b!727030 res!487947) b!727035))

(assert (= (and b!727035 res!487956) b!727028))

(assert (= (and b!727028 res!487949) b!727027))

(assert (= (and b!727027 res!487943) b!727039))

(assert (= (and b!727039 res!487954) b!727032))

(assert (= (and b!727032 c!79915) b!727037))

(assert (= (and b!727032 (not c!79915)) b!727031))

(assert (= (and b!727032 res!487946) b!727033))

(assert (= (and b!727033 res!487958) b!727036))

(assert (= (and b!727036 res!487955) b!727042))

(assert (= (and b!727042 res!487950) b!727041))

(assert (= (and b!727036 (not res!487953)) b!727029))

(declare-fun m!681025 () Bool)

(assert (=> b!727041 m!681025))

(assert (=> b!727041 m!681025))

(declare-fun m!681027 () Bool)

(assert (=> b!727041 m!681027))

(declare-fun m!681029 () Bool)

(assert (=> b!727035 m!681029))

(assert (=> b!727037 m!681025))

(assert (=> b!727037 m!681025))

(declare-fun m!681031 () Bool)

(assert (=> b!727037 m!681031))

(declare-fun m!681033 () Bool)

(assert (=> b!727030 m!681033))

(declare-fun m!681035 () Bool)

(assert (=> b!727029 m!681035))

(declare-fun m!681037 () Bool)

(assert (=> b!727034 m!681037))

(assert (=> b!727027 m!681025))

(assert (=> b!727027 m!681025))

(declare-fun m!681039 () Bool)

(assert (=> b!727027 m!681039))

(assert (=> b!727027 m!681039))

(assert (=> b!727027 m!681025))

(declare-fun m!681041 () Bool)

(assert (=> b!727027 m!681041))

(declare-fun m!681043 () Bool)

(assert (=> b!727039 m!681043))

(assert (=> b!727042 m!681025))

(assert (=> b!727042 m!681025))

(declare-fun m!681045 () Bool)

(assert (=> b!727042 m!681045))

(assert (=> b!727031 m!681025))

(assert (=> b!727031 m!681025))

(declare-fun m!681047 () Bool)

(assert (=> b!727031 m!681047))

(declare-fun m!681049 () Bool)

(assert (=> b!727040 m!681049))

(declare-fun m!681051 () Bool)

(assert (=> b!727033 m!681051))

(declare-fun m!681053 () Bool)

(assert (=> b!727033 m!681053))

(declare-fun m!681055 () Bool)

(assert (=> b!727033 m!681055))

(declare-fun m!681057 () Bool)

(assert (=> b!727033 m!681057))

(assert (=> b!727033 m!681055))

(declare-fun m!681059 () Bool)

(assert (=> b!727033 m!681059))

(assert (=> b!727038 m!681025))

(assert (=> b!727038 m!681025))

(declare-fun m!681061 () Bool)

(assert (=> b!727038 m!681061))

(declare-fun m!681063 () Bool)

(assert (=> b!727036 m!681063))

(declare-fun m!681065 () Bool)

(assert (=> b!727036 m!681065))

(declare-fun m!681067 () Bool)

(assert (=> b!727044 m!681067))

(declare-fun m!681069 () Bool)

(assert (=> start!64546 m!681069))

(declare-fun m!681071 () Bool)

(assert (=> start!64546 m!681071))

(push 1)

