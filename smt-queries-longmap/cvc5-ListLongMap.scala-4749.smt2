; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65554 () Bool)

(assert start!65554)

(declare-fun b!748675 () Bool)

(declare-fun res!505063 () Bool)

(declare-fun e!417846 () Bool)

(assert (=> b!748675 (=> (not res!505063) (not e!417846))))

(declare-datatypes ((array!41727 0))(
  ( (array!41728 (arr!19977 (Array (_ BitVec 32) (_ BitVec 64))) (size!20398 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41727)

(declare-datatypes ((List!13979 0))(
  ( (Nil!13976) (Cons!13975 (h!15047 (_ BitVec 64)) (t!20294 List!13979)) )
))
(declare-fun arrayNoDuplicates!0 (array!41727 (_ BitVec 32) List!13979) Bool)

(assert (=> b!748675 (= res!505063 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13976))))

(declare-fun b!748676 () Bool)

(declare-fun res!505060 () Bool)

(declare-fun e!417842 () Bool)

(assert (=> b!748676 (=> (not res!505060) (not e!417842))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!748676 (= res!505060 (and (= (size!20398 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20398 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20398 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748677 () Bool)

(declare-fun res!505058 () Bool)

(assert (=> b!748677 (=> (not res!505058) (not e!417842))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748677 (= res!505058 (validKeyInArray!0 k!2102))))

(declare-fun b!748678 () Bool)

(declare-fun res!505061 () Bool)

(assert (=> b!748678 (=> (not res!505061) (not e!417846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41727 (_ BitVec 32)) Bool)

(assert (=> b!748678 (= res!505061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748679 () Bool)

(declare-fun res!505064 () Bool)

(assert (=> b!748679 (=> (not res!505064) (not e!417842))))

(declare-fun arrayContainsKey!0 (array!41727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748679 (= res!505064 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748680 () Bool)

(assert (=> b!748680 (= e!417842 e!417846)))

(declare-fun res!505067 () Bool)

(assert (=> b!748680 (=> (not res!505067) (not e!417846))))

(declare-datatypes ((SeekEntryResult!7577 0))(
  ( (MissingZero!7577 (index!32676 (_ BitVec 32))) (Found!7577 (index!32677 (_ BitVec 32))) (Intermediate!7577 (undefined!8389 Bool) (index!32678 (_ BitVec 32)) (x!63615 (_ BitVec 32))) (Undefined!7577) (MissingVacant!7577 (index!32679 (_ BitVec 32))) )
))
(declare-fun lt!332821 () SeekEntryResult!7577)

(assert (=> b!748680 (= res!505067 (or (= lt!332821 (MissingZero!7577 i!1173)) (= lt!332821 (MissingVacant!7577 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41727 (_ BitVec 32)) SeekEntryResult!7577)

(assert (=> b!748680 (= lt!332821 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!417840 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!748682 () Bool)

(declare-fun lt!332818 () SeekEntryResult!7577)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41727 (_ BitVec 32)) SeekEntryResult!7577)

(assert (=> b!748682 (= e!417840 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19977 a!3186) j!159) a!3186 mask!3328) lt!332818))))

(declare-fun b!748683 () Bool)

(declare-fun e!417844 () Bool)

(declare-fun e!417841 () Bool)

(assert (=> b!748683 (= e!417844 (not e!417841))))

(declare-fun res!505070 () Bool)

(assert (=> b!748683 (=> res!505070 e!417841)))

(declare-fun lt!332816 () SeekEntryResult!7577)

(assert (=> b!748683 (= res!505070 (or (not (is-Intermediate!7577 lt!332816)) (bvslt x!1131 (x!63615 lt!332816)) (not (= x!1131 (x!63615 lt!332816))) (not (= index!1321 (index!32678 lt!332816)))))))

(declare-fun e!417843 () Bool)

(assert (=> b!748683 e!417843))

(declare-fun res!505054 () Bool)

(assert (=> b!748683 (=> (not res!505054) (not e!417843))))

(declare-fun lt!332819 () SeekEntryResult!7577)

(declare-fun lt!332817 () SeekEntryResult!7577)

(assert (=> b!748683 (= res!505054 (= lt!332819 lt!332817))))

(assert (=> b!748683 (= lt!332817 (Found!7577 j!159))))

(assert (=> b!748683 (= lt!332819 (seekEntryOrOpen!0 (select (arr!19977 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748683 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25688 0))(
  ( (Unit!25689) )
))
(declare-fun lt!332820 () Unit!25688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25688)

(assert (=> b!748683 (= lt!332820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748684 () Bool)

(declare-fun e!417847 () Unit!25688)

(declare-fun Unit!25690 () Unit!25688)

(assert (=> b!748684 (= e!417847 Unit!25690)))

(assert (=> b!748684 false))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!748685 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41727 (_ BitVec 32)) SeekEntryResult!7577)

(assert (=> b!748685 (= e!417843 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19977 a!3186) j!159) a!3186 mask!3328) lt!332817))))

(declare-fun b!748686 () Bool)

(declare-fun res!505057 () Bool)

(assert (=> b!748686 (=> res!505057 e!417841)))

(declare-fun lt!332824 () (_ BitVec 64))

(assert (=> b!748686 (= res!505057 (= (select (store (arr!19977 a!3186) i!1173 k!2102) index!1321) lt!332824))))

(declare-fun b!748687 () Bool)

(assert (=> b!748687 (= e!417841 true)))

(assert (=> b!748687 (= (select (store (arr!19977 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332822 () Unit!25688)

(assert (=> b!748687 (= lt!332822 e!417847)))

(declare-fun c!82192 () Bool)

(assert (=> b!748687 (= c!82192 (= (select (store (arr!19977 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748688 () Bool)

(declare-fun e!417845 () Bool)

(assert (=> b!748688 (= e!417846 e!417845)))

(declare-fun res!505062 () Bool)

(assert (=> b!748688 (=> (not res!505062) (not e!417845))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748688 (= res!505062 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19977 a!3186) j!159) mask!3328) (select (arr!19977 a!3186) j!159) a!3186 mask!3328) lt!332818))))

(assert (=> b!748688 (= lt!332818 (Intermediate!7577 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748689 () Bool)

(declare-fun res!505065 () Bool)

(assert (=> b!748689 (=> (not res!505065) (not e!417842))))

(assert (=> b!748689 (= res!505065 (validKeyInArray!0 (select (arr!19977 a!3186) j!159)))))

(declare-fun res!505066 () Bool)

(assert (=> start!65554 (=> (not res!505066) (not e!417842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65554 (= res!505066 (validMask!0 mask!3328))))

(assert (=> start!65554 e!417842))

(assert (=> start!65554 true))

(declare-fun array_inv!15773 (array!41727) Bool)

(assert (=> start!65554 (array_inv!15773 a!3186)))

(declare-fun b!748681 () Bool)

(declare-fun res!505055 () Bool)

(assert (=> b!748681 (=> (not res!505055) (not e!417845))))

(assert (=> b!748681 (= res!505055 e!417840)))

(declare-fun c!82191 () Bool)

(assert (=> b!748681 (= c!82191 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748690 () Bool)

(declare-fun res!505056 () Bool)

(assert (=> b!748690 (=> (not res!505056) (not e!417845))))

(assert (=> b!748690 (= res!505056 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19977 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748691 () Bool)

(declare-fun res!505059 () Bool)

(assert (=> b!748691 (=> res!505059 e!417841)))

(assert (=> b!748691 (= res!505059 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19977 a!3186) j!159) a!3186 mask!3328) lt!332817)))))

(declare-fun b!748692 () Bool)

(declare-fun res!505068 () Bool)

(assert (=> b!748692 (=> (not res!505068) (not e!417846))))

(assert (=> b!748692 (= res!505068 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20398 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20398 a!3186))))))

(declare-fun b!748693 () Bool)

(assert (=> b!748693 (= e!417845 e!417844)))

(declare-fun res!505069 () Bool)

(assert (=> b!748693 (=> (not res!505069) (not e!417844))))

(declare-fun lt!332823 () SeekEntryResult!7577)

(assert (=> b!748693 (= res!505069 (= lt!332823 lt!332816))))

(declare-fun lt!332825 () array!41727)

(assert (=> b!748693 (= lt!332816 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332824 lt!332825 mask!3328))))

(assert (=> b!748693 (= lt!332823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332824 mask!3328) lt!332824 lt!332825 mask!3328))))

(assert (=> b!748693 (= lt!332824 (select (store (arr!19977 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748693 (= lt!332825 (array!41728 (store (arr!19977 a!3186) i!1173 k!2102) (size!20398 a!3186)))))

(declare-fun b!748694 () Bool)

(assert (=> b!748694 (= e!417840 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19977 a!3186) j!159) a!3186 mask!3328) (Found!7577 j!159)))))

(declare-fun b!748695 () Bool)

(declare-fun Unit!25691 () Unit!25688)

(assert (=> b!748695 (= e!417847 Unit!25691)))

(assert (= (and start!65554 res!505066) b!748676))

(assert (= (and b!748676 res!505060) b!748689))

(assert (= (and b!748689 res!505065) b!748677))

(assert (= (and b!748677 res!505058) b!748679))

(assert (= (and b!748679 res!505064) b!748680))

(assert (= (and b!748680 res!505067) b!748678))

(assert (= (and b!748678 res!505061) b!748675))

(assert (= (and b!748675 res!505063) b!748692))

(assert (= (and b!748692 res!505068) b!748688))

(assert (= (and b!748688 res!505062) b!748690))

(assert (= (and b!748690 res!505056) b!748681))

(assert (= (and b!748681 c!82191) b!748682))

(assert (= (and b!748681 (not c!82191)) b!748694))

(assert (= (and b!748681 res!505055) b!748693))

(assert (= (and b!748693 res!505069) b!748683))

(assert (= (and b!748683 res!505054) b!748685))

(assert (= (and b!748683 (not res!505070)) b!748691))

(assert (= (and b!748691 (not res!505059)) b!748686))

(assert (= (and b!748686 (not res!505057)) b!748687))

(assert (= (and b!748687 c!82192) b!748684))

(assert (= (and b!748687 (not c!82192)) b!748695))

(declare-fun m!698461 () Bool)

(assert (=> b!748683 m!698461))

(assert (=> b!748683 m!698461))

(declare-fun m!698463 () Bool)

(assert (=> b!748683 m!698463))

(declare-fun m!698465 () Bool)

(assert (=> b!748683 m!698465))

(declare-fun m!698467 () Bool)

(assert (=> b!748683 m!698467))

(declare-fun m!698469 () Bool)

(assert (=> b!748675 m!698469))

(declare-fun m!698471 () Bool)

(assert (=> b!748690 m!698471))

(assert (=> b!748691 m!698461))

(assert (=> b!748691 m!698461))

(declare-fun m!698473 () Bool)

(assert (=> b!748691 m!698473))

(declare-fun m!698475 () Bool)

(assert (=> b!748678 m!698475))

(declare-fun m!698477 () Bool)

(assert (=> start!65554 m!698477))

(declare-fun m!698479 () Bool)

(assert (=> start!65554 m!698479))

(assert (=> b!748694 m!698461))

(assert (=> b!748694 m!698461))

(assert (=> b!748694 m!698473))

(assert (=> b!748685 m!698461))

(assert (=> b!748685 m!698461))

(declare-fun m!698481 () Bool)

(assert (=> b!748685 m!698481))

(declare-fun m!698483 () Bool)

(assert (=> b!748686 m!698483))

(declare-fun m!698485 () Bool)

(assert (=> b!748686 m!698485))

(declare-fun m!698487 () Bool)

(assert (=> b!748680 m!698487))

(assert (=> b!748689 m!698461))

(assert (=> b!748689 m!698461))

(declare-fun m!698489 () Bool)

(assert (=> b!748689 m!698489))

(assert (=> b!748688 m!698461))

(assert (=> b!748688 m!698461))

(declare-fun m!698491 () Bool)

(assert (=> b!748688 m!698491))

(assert (=> b!748688 m!698491))

(assert (=> b!748688 m!698461))

(declare-fun m!698493 () Bool)

(assert (=> b!748688 m!698493))

(declare-fun m!698495 () Bool)

(assert (=> b!748679 m!698495))

(assert (=> b!748687 m!698483))

(assert (=> b!748687 m!698485))

(declare-fun m!698497 () Bool)

(assert (=> b!748677 m!698497))

(assert (=> b!748682 m!698461))

(assert (=> b!748682 m!698461))

(declare-fun m!698499 () Bool)

(assert (=> b!748682 m!698499))

(declare-fun m!698501 () Bool)

(assert (=> b!748693 m!698501))

(declare-fun m!698503 () Bool)

(assert (=> b!748693 m!698503))

(assert (=> b!748693 m!698501))

(assert (=> b!748693 m!698483))

(declare-fun m!698505 () Bool)

(assert (=> b!748693 m!698505))

(declare-fun m!698507 () Bool)

(assert (=> b!748693 m!698507))

(push 1)

