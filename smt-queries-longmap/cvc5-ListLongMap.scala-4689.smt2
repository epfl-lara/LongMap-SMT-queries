; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65194 () Bool)

(assert start!65194)

(declare-fun res!495938 () Bool)

(declare-fun e!412635 () Bool)

(assert (=> start!65194 (=> (not res!495938) (not e!412635))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65194 (= res!495938 (validMask!0 mask!3328))))

(assert (=> start!65194 e!412635))

(assert (=> start!65194 true))

(declare-datatypes ((array!41367 0))(
  ( (array!41368 (arr!19797 (Array (_ BitVec 32) (_ BitVec 64))) (size!20218 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41367)

(declare-fun array_inv!15593 (array!41367) Bool)

(assert (=> start!65194 (array_inv!15593 a!3186)))

(declare-fun b!737764 () Bool)

(declare-fun e!412639 () Bool)

(declare-fun e!412645 () Bool)

(assert (=> b!737764 (= e!412639 e!412645)))

(declare-fun res!495929 () Bool)

(assert (=> b!737764 (=> (not res!495929) (not e!412645))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7397 0))(
  ( (MissingZero!7397 (index!31956 (_ BitVec 32))) (Found!7397 (index!31957 (_ BitVec 32))) (Intermediate!7397 (undefined!8209 Bool) (index!31958 (_ BitVec 32)) (x!62955 (_ BitVec 32))) (Undefined!7397) (MissingVacant!7397 (index!31959 (_ BitVec 32))) )
))
(declare-fun lt!327380 () SeekEntryResult!7397)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41367 (_ BitVec 32)) SeekEntryResult!7397)

(assert (=> b!737764 (= res!495929 (= (seekEntryOrOpen!0 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327380))))

(assert (=> b!737764 (= lt!327380 (Found!7397 j!159))))

(declare-fun b!737765 () Bool)

(declare-datatypes ((Unit!25184 0))(
  ( (Unit!25185) )
))
(declare-fun e!412637 () Unit!25184)

(declare-fun Unit!25186 () Unit!25184)

(assert (=> b!737765 (= e!412637 Unit!25186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327383 () SeekEntryResult!7397)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41367 (_ BitVec 32)) SeekEntryResult!7397)

(assert (=> b!737765 (= lt!327383 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19797 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327376 () SeekEntryResult!7397)

(declare-fun lt!327375 () (_ BitVec 32))

(assert (=> b!737765 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327375 resIntermediateIndex!5 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327376)))

(declare-fun b!737766 () Bool)

(declare-fun res!495936 () Bool)

(declare-fun e!412641 () Bool)

(assert (=> b!737766 (=> (not res!495936) (not e!412641))))

(declare-datatypes ((List!13799 0))(
  ( (Nil!13796) (Cons!13795 (h!14867 (_ BitVec 64)) (t!20114 List!13799)) )
))
(declare-fun arrayNoDuplicates!0 (array!41367 (_ BitVec 32) List!13799) Bool)

(assert (=> b!737766 (= res!495936 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13796))))

(declare-fun b!737767 () Bool)

(declare-fun e!412638 () Bool)

(declare-fun e!412646 () Bool)

(assert (=> b!737767 (= e!412638 (not e!412646))))

(declare-fun res!495927 () Bool)

(assert (=> b!737767 (=> res!495927 e!412646)))

(declare-fun lt!327374 () SeekEntryResult!7397)

(assert (=> b!737767 (= res!495927 (or (not (is-Intermediate!7397 lt!327374)) (bvsge x!1131 (x!62955 lt!327374))))))

(assert (=> b!737767 (= lt!327376 (Found!7397 j!159))))

(assert (=> b!737767 e!412639))

(declare-fun res!495937 () Bool)

(assert (=> b!737767 (=> (not res!495937) (not e!412639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41367 (_ BitVec 32)) Bool)

(assert (=> b!737767 (= res!495937 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327370 () Unit!25184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25184)

(assert (=> b!737767 (= lt!327370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737768 () Bool)

(declare-fun Unit!25187 () Unit!25184)

(assert (=> b!737768 (= e!412637 Unit!25187)))

(declare-fun lt!327378 () SeekEntryResult!7397)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41367 (_ BitVec 32)) SeekEntryResult!7397)

(assert (=> b!737768 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327375 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327378)))

(declare-fun b!737769 () Bool)

(declare-fun res!495925 () Bool)

(assert (=> b!737769 (=> (not res!495925) (not e!412635))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737769 (= res!495925 (validKeyInArray!0 k!2102))))

(declare-fun e!412642 () Bool)

(declare-fun b!737770 () Bool)

(assert (=> b!737770 (= e!412642 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327378))))

(declare-fun b!737771 () Bool)

(declare-fun res!495922 () Bool)

(declare-fun e!412636 () Bool)

(assert (=> b!737771 (=> (not res!495922) (not e!412636))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737771 (= res!495922 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19797 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737772 () Bool)

(declare-fun res!495923 () Bool)

(assert (=> b!737772 (=> (not res!495923) (not e!412635))))

(assert (=> b!737772 (= res!495923 (validKeyInArray!0 (select (arr!19797 a!3186) j!159)))))

(declare-fun b!737773 () Bool)

(assert (=> b!737773 (= e!412642 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) (Found!7397 j!159)))))

(declare-fun b!737774 () Bool)

(declare-fun e!412643 () Bool)

(assert (=> b!737774 (= e!412646 e!412643)))

(declare-fun res!495926 () Bool)

(assert (=> b!737774 (=> res!495926 e!412643)))

(assert (=> b!737774 (= res!495926 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327375 #b00000000000000000000000000000000) (bvsge lt!327375 (size!20218 a!3186))))))

(declare-fun lt!327381 () Unit!25184)

(assert (=> b!737774 (= lt!327381 e!412637)))

(declare-fun c!81303 () Bool)

(declare-fun lt!327371 () Bool)

(assert (=> b!737774 (= c!81303 lt!327371)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737774 (= lt!327371 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737774 (= lt!327375 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737775 () Bool)

(declare-fun res!495933 () Bool)

(assert (=> b!737775 (=> (not res!495933) (not e!412641))))

(assert (=> b!737775 (= res!495933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737776 () Bool)

(declare-fun res!495924 () Bool)

(assert (=> b!737776 (=> (not res!495924) (not e!412635))))

(declare-fun arrayContainsKey!0 (array!41367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737776 (= res!495924 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!412644 () Bool)

(declare-fun b!737777 () Bool)

(assert (=> b!737777 (= e!412644 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327375 resIntermediateIndex!5 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327376)))))

(declare-fun b!737778 () Bool)

(assert (=> b!737778 (= e!412644 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327375 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327378)))))

(declare-fun b!737779 () Bool)

(assert (=> b!737779 (= e!412635 e!412641)))

(declare-fun res!495931 () Bool)

(assert (=> b!737779 (=> (not res!495931) (not e!412641))))

(declare-fun lt!327379 () SeekEntryResult!7397)

(assert (=> b!737779 (= res!495931 (or (= lt!327379 (MissingZero!7397 i!1173)) (= lt!327379 (MissingVacant!7397 i!1173))))))

(assert (=> b!737779 (= lt!327379 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737780 () Bool)

(assert (=> b!737780 (= e!412645 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327380))))

(declare-fun b!737781 () Bool)

(declare-fun res!495932 () Bool)

(assert (=> b!737781 (=> (not res!495932) (not e!412641))))

(assert (=> b!737781 (= res!495932 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20218 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20218 a!3186))))))

(declare-fun b!737782 () Bool)

(declare-fun res!495928 () Bool)

(assert (=> b!737782 (=> res!495928 e!412643)))

(assert (=> b!737782 (= res!495928 e!412644)))

(declare-fun c!81302 () Bool)

(assert (=> b!737782 (= c!81302 lt!327371)))

(declare-fun b!737783 () Bool)

(assert (=> b!737783 (= e!412641 e!412636)))

(declare-fun res!495930 () Bool)

(assert (=> b!737783 (=> (not res!495930) (not e!412636))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737783 (= res!495930 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19797 a!3186) j!159) mask!3328) (select (arr!19797 a!3186) j!159) a!3186 mask!3328) lt!327378))))

(assert (=> b!737783 (= lt!327378 (Intermediate!7397 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737784 () Bool)

(declare-fun res!495935 () Bool)

(assert (=> b!737784 (=> (not res!495935) (not e!412635))))

(assert (=> b!737784 (= res!495935 (and (= (size!20218 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20218 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20218 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737785 () Bool)

(assert (=> b!737785 (= e!412643 true)))

(declare-fun lt!327372 () SeekEntryResult!7397)

(declare-fun lt!327373 () array!41367)

(declare-fun lt!327382 () (_ BitVec 64))

(assert (=> b!737785 (= lt!327372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327375 lt!327382 lt!327373 mask!3328))))

(declare-fun b!737786 () Bool)

(assert (=> b!737786 (= e!412636 e!412638)))

(declare-fun res!495921 () Bool)

(assert (=> b!737786 (=> (not res!495921) (not e!412638))))

(declare-fun lt!327377 () SeekEntryResult!7397)

(assert (=> b!737786 (= res!495921 (= lt!327377 lt!327374))))

(assert (=> b!737786 (= lt!327374 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327382 lt!327373 mask!3328))))

(assert (=> b!737786 (= lt!327377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327382 mask!3328) lt!327382 lt!327373 mask!3328))))

(assert (=> b!737786 (= lt!327382 (select (store (arr!19797 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737786 (= lt!327373 (array!41368 (store (arr!19797 a!3186) i!1173 k!2102) (size!20218 a!3186)))))

(declare-fun b!737787 () Bool)

(declare-fun res!495934 () Bool)

(assert (=> b!737787 (=> (not res!495934) (not e!412636))))

(assert (=> b!737787 (= res!495934 e!412642)))

(declare-fun c!81304 () Bool)

(assert (=> b!737787 (= c!81304 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65194 res!495938) b!737784))

(assert (= (and b!737784 res!495935) b!737772))

(assert (= (and b!737772 res!495923) b!737769))

(assert (= (and b!737769 res!495925) b!737776))

(assert (= (and b!737776 res!495924) b!737779))

(assert (= (and b!737779 res!495931) b!737775))

(assert (= (and b!737775 res!495933) b!737766))

(assert (= (and b!737766 res!495936) b!737781))

(assert (= (and b!737781 res!495932) b!737783))

(assert (= (and b!737783 res!495930) b!737771))

(assert (= (and b!737771 res!495922) b!737787))

(assert (= (and b!737787 c!81304) b!737770))

(assert (= (and b!737787 (not c!81304)) b!737773))

(assert (= (and b!737787 res!495934) b!737786))

(assert (= (and b!737786 res!495921) b!737767))

(assert (= (and b!737767 res!495937) b!737764))

(assert (= (and b!737764 res!495929) b!737780))

(assert (= (and b!737767 (not res!495927)) b!737774))

(assert (= (and b!737774 c!81303) b!737768))

(assert (= (and b!737774 (not c!81303)) b!737765))

(assert (= (and b!737774 (not res!495926)) b!737782))

(assert (= (and b!737782 c!81302) b!737778))

(assert (= (and b!737782 (not c!81302)) b!737777))

(assert (= (and b!737782 (not res!495928)) b!737785))

(declare-fun m!689563 () Bool)

(assert (=> b!737772 m!689563))

(assert (=> b!737772 m!689563))

(declare-fun m!689565 () Bool)

(assert (=> b!737772 m!689565))

(assert (=> b!737777 m!689563))

(assert (=> b!737777 m!689563))

(declare-fun m!689567 () Bool)

(assert (=> b!737777 m!689567))

(declare-fun m!689569 () Bool)

(assert (=> b!737767 m!689569))

(declare-fun m!689571 () Bool)

(assert (=> b!737767 m!689571))

(declare-fun m!689573 () Bool)

(assert (=> b!737774 m!689573))

(assert (=> b!737764 m!689563))

(assert (=> b!737764 m!689563))

(declare-fun m!689575 () Bool)

(assert (=> b!737764 m!689575))

(assert (=> b!737768 m!689563))

(assert (=> b!737768 m!689563))

(declare-fun m!689577 () Bool)

(assert (=> b!737768 m!689577))

(declare-fun m!689579 () Bool)

(assert (=> b!737766 m!689579))

(assert (=> b!737780 m!689563))

(assert (=> b!737780 m!689563))

(declare-fun m!689581 () Bool)

(assert (=> b!737780 m!689581))

(declare-fun m!689583 () Bool)

(assert (=> b!737785 m!689583))

(assert (=> b!737783 m!689563))

(assert (=> b!737783 m!689563))

(declare-fun m!689585 () Bool)

(assert (=> b!737783 m!689585))

(assert (=> b!737783 m!689585))

(assert (=> b!737783 m!689563))

(declare-fun m!689587 () Bool)

(assert (=> b!737783 m!689587))

(assert (=> b!737773 m!689563))

(assert (=> b!737773 m!689563))

(declare-fun m!689589 () Bool)

(assert (=> b!737773 m!689589))

(declare-fun m!689591 () Bool)

(assert (=> b!737786 m!689591))

(declare-fun m!689593 () Bool)

(assert (=> b!737786 m!689593))

(declare-fun m!689595 () Bool)

(assert (=> b!737786 m!689595))

(declare-fun m!689597 () Bool)

(assert (=> b!737786 m!689597))

(assert (=> b!737786 m!689591))

(declare-fun m!689599 () Bool)

(assert (=> b!737786 m!689599))

(declare-fun m!689601 () Bool)

(assert (=> b!737779 m!689601))

(assert (=> b!737765 m!689563))

(assert (=> b!737765 m!689563))

(assert (=> b!737765 m!689589))

(assert (=> b!737765 m!689563))

(assert (=> b!737765 m!689567))

(declare-fun m!689603 () Bool)

(assert (=> b!737775 m!689603))

(assert (=> b!737770 m!689563))

(assert (=> b!737770 m!689563))

(declare-fun m!689605 () Bool)

(assert (=> b!737770 m!689605))

(declare-fun m!689607 () Bool)

(assert (=> b!737771 m!689607))

(assert (=> b!737778 m!689563))

(assert (=> b!737778 m!689563))

(assert (=> b!737778 m!689577))

(declare-fun m!689609 () Bool)

(assert (=> b!737776 m!689609))

(declare-fun m!689611 () Bool)

(assert (=> start!65194 m!689611))

(declare-fun m!689613 () Bool)

(assert (=> start!65194 m!689613))

(declare-fun m!689615 () Bool)

(assert (=> b!737769 m!689615))

(push 1)

