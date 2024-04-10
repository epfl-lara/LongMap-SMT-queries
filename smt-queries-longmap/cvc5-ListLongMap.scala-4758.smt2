; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65608 () Bool)

(assert start!65608)

(declare-fun b!750441 () Bool)

(declare-fun res!506503 () Bool)

(declare-fun e!418698 () Bool)

(assert (=> b!750441 (=> (not res!506503) (not e!418698))))

(declare-datatypes ((array!41781 0))(
  ( (array!41782 (arr!20004 (Array (_ BitVec 32) (_ BitVec 64))) (size!20425 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41781)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750441 (= res!506503 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750442 () Bool)

(declare-fun res!506507 () Bool)

(declare-fun e!418697 () Bool)

(assert (=> b!750442 (=> (not res!506507) (not e!418697))))

(declare-fun e!418699 () Bool)

(assert (=> b!750442 (= res!506507 e!418699)))

(declare-fun c!82353 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750442 (= c!82353 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750443 () Bool)

(declare-fun res!506504 () Bool)

(declare-fun e!418692 () Bool)

(assert (=> b!750443 (=> (not res!506504) (not e!418692))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!750443 (= res!506504 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20425 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20425 a!3186))))))

(declare-fun b!750444 () Bool)

(assert (=> b!750444 (= e!418698 e!418692)))

(declare-fun res!506512 () Bool)

(assert (=> b!750444 (=> (not res!506512) (not e!418692))))

(declare-datatypes ((SeekEntryResult!7604 0))(
  ( (MissingZero!7604 (index!32784 (_ BitVec 32))) (Found!7604 (index!32785 (_ BitVec 32))) (Intermediate!7604 (undefined!8416 Bool) (index!32786 (_ BitVec 32)) (x!63714 (_ BitVec 32))) (Undefined!7604) (MissingVacant!7604 (index!32787 (_ BitVec 32))) )
))
(declare-fun lt!333682 () SeekEntryResult!7604)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750444 (= res!506512 (or (= lt!333682 (MissingZero!7604 i!1173)) (= lt!333682 (MissingVacant!7604 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41781 (_ BitVec 32)) SeekEntryResult!7604)

(assert (=> b!750444 (= lt!333682 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!418696 () Bool)

(declare-fun lt!333687 () SeekEntryResult!7604)

(declare-fun b!750445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41781 (_ BitVec 32)) SeekEntryResult!7604)

(assert (=> b!750445 (= e!418696 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20004 a!3186) j!159) a!3186 mask!3328) lt!333687))))

(declare-fun b!750446 () Bool)

(declare-fun res!506506 () Bool)

(assert (=> b!750446 (=> (not res!506506) (not e!418698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750446 (= res!506506 (validKeyInArray!0 k!2102))))

(declare-fun b!750448 () Bool)

(declare-fun e!418694 () Bool)

(declare-fun e!418695 () Bool)

(assert (=> b!750448 (= e!418694 (not e!418695))))

(declare-fun res!506501 () Bool)

(assert (=> b!750448 (=> res!506501 e!418695)))

(declare-fun lt!333692 () SeekEntryResult!7604)

(assert (=> b!750448 (= res!506501 (or (not (is-Intermediate!7604 lt!333692)) (bvslt x!1131 (x!63714 lt!333692)) (not (= x!1131 (x!63714 lt!333692))) (not (= index!1321 (index!32786 lt!333692)))))))

(assert (=> b!750448 e!418696))

(declare-fun res!506499 () Bool)

(assert (=> b!750448 (=> (not res!506499) (not e!418696))))

(declare-fun lt!333691 () SeekEntryResult!7604)

(assert (=> b!750448 (= res!506499 (= lt!333691 lt!333687))))

(assert (=> b!750448 (= lt!333687 (Found!7604 j!159))))

(assert (=> b!750448 (= lt!333691 (seekEntryOrOpen!0 (select (arr!20004 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41781 (_ BitVec 32)) Bool)

(assert (=> b!750448 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25796 0))(
  ( (Unit!25797) )
))
(declare-fun lt!333683 () Unit!25796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25796)

(assert (=> b!750448 (= lt!333683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750449 () Bool)

(declare-fun e!418693 () Bool)

(assert (=> b!750449 (= e!418695 e!418693)))

(declare-fun res!506511 () Bool)

(assert (=> b!750449 (=> res!506511 e!418693)))

(declare-fun lt!333685 () (_ BitVec 64))

(declare-fun lt!333688 () (_ BitVec 64))

(assert (=> b!750449 (= res!506511 (= lt!333685 lt!333688))))

(assert (=> b!750449 (= lt!333685 (select (store (arr!20004 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750450 () Bool)

(declare-fun res!506496 () Bool)

(assert (=> b!750450 (=> (not res!506496) (not e!418697))))

(assert (=> b!750450 (= res!506496 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20004 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750451 () Bool)

(declare-fun e!418691 () Unit!25796)

(declare-fun Unit!25798 () Unit!25796)

(assert (=> b!750451 (= e!418691 Unit!25798)))

(declare-fun b!750452 () Bool)

(assert (=> b!750452 (= e!418692 e!418697)))

(declare-fun res!506497 () Bool)

(assert (=> b!750452 (=> (not res!506497) (not e!418697))))

(declare-fun lt!333690 () SeekEntryResult!7604)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41781 (_ BitVec 32)) SeekEntryResult!7604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750452 (= res!506497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20004 a!3186) j!159) mask!3328) (select (arr!20004 a!3186) j!159) a!3186 mask!3328) lt!333690))))

(assert (=> b!750452 (= lt!333690 (Intermediate!7604 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750453 () Bool)

(assert (=> b!750453 (= e!418699 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20004 a!3186) j!159) a!3186 mask!3328) (Found!7604 j!159)))))

(declare-fun b!750454 () Bool)

(declare-fun res!506508 () Bool)

(assert (=> b!750454 (=> (not res!506508) (not e!418698))))

(assert (=> b!750454 (= res!506508 (and (= (size!20425 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20425 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20425 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750455 () Bool)

(declare-fun res!506510 () Bool)

(assert (=> b!750455 (=> res!506510 e!418695)))

(assert (=> b!750455 (= res!506510 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20004 a!3186) j!159) a!3186 mask!3328) lt!333687)))))

(declare-fun b!750456 () Bool)

(assert (=> b!750456 (= e!418693 true)))

(declare-fun e!418690 () Bool)

(assert (=> b!750456 e!418690))

(declare-fun res!506500 () Bool)

(assert (=> b!750456 (=> (not res!506500) (not e!418690))))

(assert (=> b!750456 (= res!506500 (= lt!333685 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333689 () Unit!25796)

(assert (=> b!750456 (= lt!333689 e!418691)))

(declare-fun c!82354 () Bool)

(assert (=> b!750456 (= c!82354 (= lt!333685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750457 () Bool)

(declare-fun res!506513 () Bool)

(assert (=> b!750457 (=> (not res!506513) (not e!418698))))

(assert (=> b!750457 (= res!506513 (validKeyInArray!0 (select (arr!20004 a!3186) j!159)))))

(declare-fun b!750458 () Bool)

(assert (=> b!750458 (= e!418697 e!418694)))

(declare-fun res!506509 () Bool)

(assert (=> b!750458 (=> (not res!506509) (not e!418694))))

(declare-fun lt!333686 () SeekEntryResult!7604)

(assert (=> b!750458 (= res!506509 (= lt!333686 lt!333692))))

(declare-fun lt!333684 () array!41781)

(assert (=> b!750458 (= lt!333692 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333688 lt!333684 mask!3328))))

(assert (=> b!750458 (= lt!333686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333688 mask!3328) lt!333688 lt!333684 mask!3328))))

(assert (=> b!750458 (= lt!333688 (select (store (arr!20004 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750458 (= lt!333684 (array!41782 (store (arr!20004 a!3186) i!1173 k!2102) (size!20425 a!3186)))))

(declare-fun b!750447 () Bool)

(declare-fun res!506505 () Bool)

(assert (=> b!750447 (=> (not res!506505) (not e!418692))))

(declare-datatypes ((List!14006 0))(
  ( (Nil!14003) (Cons!14002 (h!15074 (_ BitVec 64)) (t!20321 List!14006)) )
))
(declare-fun arrayNoDuplicates!0 (array!41781 (_ BitVec 32) List!14006) Bool)

(assert (=> b!750447 (= res!506505 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14003))))

(declare-fun res!506498 () Bool)

(assert (=> start!65608 (=> (not res!506498) (not e!418698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65608 (= res!506498 (validMask!0 mask!3328))))

(assert (=> start!65608 e!418698))

(assert (=> start!65608 true))

(declare-fun array_inv!15800 (array!41781) Bool)

(assert (=> start!65608 (array_inv!15800 a!3186)))

(declare-fun b!750459 () Bool)

(assert (=> b!750459 (= e!418699 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20004 a!3186) j!159) a!3186 mask!3328) lt!333690))))

(declare-fun b!750460 () Bool)

(assert (=> b!750460 (= e!418690 (= (seekEntryOrOpen!0 lt!333688 lt!333684 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333688 lt!333684 mask!3328)))))

(declare-fun b!750461 () Bool)

(declare-fun res!506502 () Bool)

(assert (=> b!750461 (=> (not res!506502) (not e!418692))))

(assert (=> b!750461 (= res!506502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750462 () Bool)

(declare-fun Unit!25799 () Unit!25796)

(assert (=> b!750462 (= e!418691 Unit!25799)))

(assert (=> b!750462 false))

(assert (= (and start!65608 res!506498) b!750454))

(assert (= (and b!750454 res!506508) b!750457))

(assert (= (and b!750457 res!506513) b!750446))

(assert (= (and b!750446 res!506506) b!750441))

(assert (= (and b!750441 res!506503) b!750444))

(assert (= (and b!750444 res!506512) b!750461))

(assert (= (and b!750461 res!506502) b!750447))

(assert (= (and b!750447 res!506505) b!750443))

(assert (= (and b!750443 res!506504) b!750452))

(assert (= (and b!750452 res!506497) b!750450))

(assert (= (and b!750450 res!506496) b!750442))

(assert (= (and b!750442 c!82353) b!750459))

(assert (= (and b!750442 (not c!82353)) b!750453))

(assert (= (and b!750442 res!506507) b!750458))

(assert (= (and b!750458 res!506509) b!750448))

(assert (= (and b!750448 res!506499) b!750445))

(assert (= (and b!750448 (not res!506501)) b!750455))

(assert (= (and b!750455 (not res!506510)) b!750449))

(assert (= (and b!750449 (not res!506511)) b!750456))

(assert (= (and b!750456 c!82354) b!750462))

(assert (= (and b!750456 (not c!82354)) b!750451))

(assert (= (and b!750456 res!506500) b!750460))

(declare-fun m!699835 () Bool)

(assert (=> b!750453 m!699835))

(assert (=> b!750453 m!699835))

(declare-fun m!699837 () Bool)

(assert (=> b!750453 m!699837))

(assert (=> b!750457 m!699835))

(assert (=> b!750457 m!699835))

(declare-fun m!699839 () Bool)

(assert (=> b!750457 m!699839))

(assert (=> b!750448 m!699835))

(assert (=> b!750448 m!699835))

(declare-fun m!699841 () Bool)

(assert (=> b!750448 m!699841))

(declare-fun m!699843 () Bool)

(assert (=> b!750448 m!699843))

(declare-fun m!699845 () Bool)

(assert (=> b!750448 m!699845))

(declare-fun m!699847 () Bool)

(assert (=> b!750461 m!699847))

(declare-fun m!699849 () Bool)

(assert (=> b!750444 m!699849))

(declare-fun m!699851 () Bool)

(assert (=> b!750450 m!699851))

(assert (=> b!750445 m!699835))

(assert (=> b!750445 m!699835))

(declare-fun m!699853 () Bool)

(assert (=> b!750445 m!699853))

(declare-fun m!699855 () Bool)

(assert (=> b!750458 m!699855))

(declare-fun m!699857 () Bool)

(assert (=> b!750458 m!699857))

(assert (=> b!750458 m!699855))

(declare-fun m!699859 () Bool)

(assert (=> b!750458 m!699859))

(declare-fun m!699861 () Bool)

(assert (=> b!750458 m!699861))

(declare-fun m!699863 () Bool)

(assert (=> b!750458 m!699863))

(declare-fun m!699865 () Bool)

(assert (=> b!750447 m!699865))

(assert (=> b!750452 m!699835))

(assert (=> b!750452 m!699835))

(declare-fun m!699867 () Bool)

(assert (=> b!750452 m!699867))

(assert (=> b!750452 m!699867))

(assert (=> b!750452 m!699835))

(declare-fun m!699869 () Bool)

(assert (=> b!750452 m!699869))

(declare-fun m!699871 () Bool)

(assert (=> b!750441 m!699871))

(assert (=> b!750459 m!699835))

(assert (=> b!750459 m!699835))

(declare-fun m!699873 () Bool)

(assert (=> b!750459 m!699873))

(declare-fun m!699875 () Bool)

(assert (=> start!65608 m!699875))

(declare-fun m!699877 () Bool)

(assert (=> start!65608 m!699877))

(declare-fun m!699879 () Bool)

(assert (=> b!750460 m!699879))

(declare-fun m!699881 () Bool)

(assert (=> b!750460 m!699881))

(assert (=> b!750455 m!699835))

(assert (=> b!750455 m!699835))

(assert (=> b!750455 m!699837))

(assert (=> b!750449 m!699863))

(declare-fun m!699883 () Bool)

(assert (=> b!750449 m!699883))

(declare-fun m!699885 () Bool)

(assert (=> b!750446 m!699885))

(push 1)

