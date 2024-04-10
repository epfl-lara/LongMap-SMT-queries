; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67026 () Bool)

(assert start!67026)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42450 0))(
  ( (array!42451 (arr!20322 (Array (_ BitVec 32) (_ BitVec 64))) (size!20743 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42450)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!773815 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!430741 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7922 0))(
  ( (MissingZero!7922 (index!34056 (_ BitVec 32))) (Found!7922 (index!34057 (_ BitVec 32))) (Intermediate!7922 (undefined!8734 Bool) (index!34058 (_ BitVec 32)) (x!64997 (_ BitVec 32))) (Undefined!7922) (MissingVacant!7922 (index!34059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42450 (_ BitVec 32)) SeekEntryResult!7922)

(assert (=> b!773815 (= e!430741 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) (Found!7922 j!159)))))

(declare-fun b!773816 () Bool)

(declare-fun e!430735 () Bool)

(declare-fun e!430743 () Bool)

(assert (=> b!773816 (= e!430735 e!430743)))

(declare-fun res!523383 () Bool)

(assert (=> b!773816 (=> (not res!523383) (not e!430743))))

(declare-fun lt!344619 () SeekEntryResult!7922)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42450 (_ BitVec 32)) SeekEntryResult!7922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773816 (= res!523383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344619))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773816 (= lt!344619 (Intermediate!7922 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773817 () Bool)

(declare-fun e!430745 () Bool)

(assert (=> b!773817 (= e!430745 e!430735)))

(declare-fun res!523374 () Bool)

(assert (=> b!773817 (=> (not res!523374) (not e!430735))))

(declare-fun lt!344629 () SeekEntryResult!7922)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773817 (= res!523374 (or (= lt!344629 (MissingZero!7922 i!1173)) (= lt!344629 (MissingVacant!7922 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42450 (_ BitVec 32)) SeekEntryResult!7922)

(assert (=> b!773817 (= lt!344629 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773818 () Bool)

(declare-fun e!430737 () Bool)

(declare-fun e!430739 () Bool)

(assert (=> b!773818 (= e!430737 e!430739)))

(declare-fun res!523381 () Bool)

(assert (=> b!773818 (=> res!523381 e!430739)))

(declare-fun lt!344625 () (_ BitVec 32))

(assert (=> b!773818 (= res!523381 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344625 #b00000000000000000000000000000000) (bvsge lt!344625 (size!20743 a!3186))))))

(declare-datatypes ((Unit!26702 0))(
  ( (Unit!26703) )
))
(declare-fun lt!344618 () Unit!26702)

(declare-fun e!430738 () Unit!26702)

(assert (=> b!773818 (= lt!344618 e!430738)))

(declare-fun c!85623 () Bool)

(declare-fun lt!344623 () Bool)

(assert (=> b!773818 (= c!85623 lt!344623)))

(assert (=> b!773818 (= lt!344623 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773818 (= lt!344625 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773819 () Bool)

(declare-fun res!523372 () Bool)

(assert (=> b!773819 (=> (not res!523372) (not e!430745))))

(assert (=> b!773819 (= res!523372 (and (= (size!20743 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20743 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20743 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773820 () Bool)

(declare-fun res!523370 () Bool)

(assert (=> b!773820 (=> (not res!523370) (not e!430745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773820 (= res!523370 (validKeyInArray!0 (select (arr!20322 a!3186) j!159)))))

(declare-fun b!773821 () Bool)

(declare-fun e!430736 () Bool)

(assert (=> b!773821 (= e!430736 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344619)))))

(declare-fun b!773822 () Bool)

(declare-fun res!523375 () Bool)

(assert (=> b!773822 (=> (not res!523375) (not e!430745))))

(assert (=> b!773822 (= res!523375 (validKeyInArray!0 k!2102))))

(declare-fun b!773823 () Bool)

(declare-fun res!523376 () Bool)

(assert (=> b!773823 (=> (not res!523376) (not e!430743))))

(assert (=> b!773823 (= res!523376 e!430741)))

(declare-fun c!85622 () Bool)

(assert (=> b!773823 (= c!85622 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773824 () Bool)

(declare-fun res!523385 () Bool)

(assert (=> b!773824 (=> (not res!523385) (not e!430735))))

(assert (=> b!773824 (= res!523385 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20743 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20743 a!3186))))))

(declare-fun b!773825 () Bool)

(assert (=> b!773825 (= e!430741 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344619))))

(declare-fun b!773826 () Bool)

(declare-fun e!430740 () Bool)

(assert (=> b!773826 (= e!430743 e!430740)))

(declare-fun res!523380 () Bool)

(assert (=> b!773826 (=> (not res!523380) (not e!430740))))

(declare-fun lt!344627 () SeekEntryResult!7922)

(declare-fun lt!344622 () SeekEntryResult!7922)

(assert (=> b!773826 (= res!523380 (= lt!344627 lt!344622))))

(declare-fun lt!344626 () array!42450)

(declare-fun lt!344621 () (_ BitVec 64))

(assert (=> b!773826 (= lt!344622 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344621 lt!344626 mask!3328))))

(assert (=> b!773826 (= lt!344627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344621 mask!3328) lt!344621 lt!344626 mask!3328))))

(assert (=> b!773826 (= lt!344621 (select (store (arr!20322 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773826 (= lt!344626 (array!42451 (store (arr!20322 a!3186) i!1173 k!2102) (size!20743 a!3186)))))

(declare-fun b!773827 () Bool)

(declare-fun res!523369 () Bool)

(assert (=> b!773827 (=> res!523369 e!430739)))

(assert (=> b!773827 (= res!523369 e!430736)))

(declare-fun c!85624 () Bool)

(assert (=> b!773827 (= c!85624 lt!344623)))

(declare-fun b!773828 () Bool)

(declare-fun res!523379 () Bool)

(assert (=> b!773828 (=> (not res!523379) (not e!430745))))

(declare-fun arrayContainsKey!0 (array!42450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773828 (= res!523379 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!430742 () Bool)

(declare-fun b!773829 () Bool)

(declare-fun lt!344628 () SeekEntryResult!7922)

(assert (=> b!773829 (= e!430742 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344628))))

(declare-fun b!773830 () Bool)

(declare-fun res!523382 () Bool)

(assert (=> b!773830 (=> (not res!523382) (not e!430735))))

(declare-datatypes ((List!14324 0))(
  ( (Nil!14321) (Cons!14320 (h!15425 (_ BitVec 64)) (t!20639 List!14324)) )
))
(declare-fun arrayNoDuplicates!0 (array!42450 (_ BitVec 32) List!14324) Bool)

(assert (=> b!773830 (= res!523382 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14321))))

(declare-fun res!523368 () Bool)

(assert (=> start!67026 (=> (not res!523368) (not e!430745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67026 (= res!523368 (validMask!0 mask!3328))))

(assert (=> start!67026 e!430745))

(assert (=> start!67026 true))

(declare-fun array_inv!16118 (array!42450) Bool)

(assert (=> start!67026 (array_inv!16118 a!3186)))

(declare-fun b!773831 () Bool)

(assert (=> b!773831 (= e!430740 (not e!430737))))

(declare-fun res!523384 () Bool)

(assert (=> b!773831 (=> res!523384 e!430737)))

(assert (=> b!773831 (= res!523384 (or (not (is-Intermediate!7922 lt!344622)) (bvsge x!1131 (x!64997 lt!344622))))))

(declare-fun lt!344624 () SeekEntryResult!7922)

(assert (=> b!773831 (= lt!344624 (Found!7922 j!159))))

(declare-fun e!430734 () Bool)

(assert (=> b!773831 e!430734))

(declare-fun res!523371 () Bool)

(assert (=> b!773831 (=> (not res!523371) (not e!430734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42450 (_ BitVec 32)) Bool)

(assert (=> b!773831 (= res!523371 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344630 () Unit!26702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26702)

(assert (=> b!773831 (= lt!344630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773832 () Bool)

(declare-fun Unit!26704 () Unit!26702)

(assert (=> b!773832 (= e!430738 Unit!26704)))

(declare-fun lt!344620 () SeekEntryResult!7922)

(assert (=> b!773832 (= lt!344620 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773832 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344624)))

(declare-fun b!773833 () Bool)

(assert (=> b!773833 (= e!430736 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344624)))))

(declare-fun b!773834 () Bool)

(assert (=> b!773834 (= e!430739 (= lt!344627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 lt!344621 lt!344626 mask!3328)))))

(declare-fun b!773835 () Bool)

(declare-fun Unit!26705 () Unit!26702)

(assert (=> b!773835 (= e!430738 Unit!26705)))

(assert (=> b!773835 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344619)))

(declare-fun b!773836 () Bool)

(assert (=> b!773836 (= e!430734 e!430742)))

(declare-fun res!523377 () Bool)

(assert (=> b!773836 (=> (not res!523377) (not e!430742))))

(assert (=> b!773836 (= res!523377 (= (seekEntryOrOpen!0 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344628))))

(assert (=> b!773836 (= lt!344628 (Found!7922 j!159))))

(declare-fun b!773837 () Bool)

(declare-fun res!523373 () Bool)

(assert (=> b!773837 (=> (not res!523373) (not e!430743))))

(assert (=> b!773837 (= res!523373 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20322 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773838 () Bool)

(declare-fun res!523378 () Bool)

(assert (=> b!773838 (=> (not res!523378) (not e!430735))))

(assert (=> b!773838 (= res!523378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67026 res!523368) b!773819))

(assert (= (and b!773819 res!523372) b!773820))

(assert (= (and b!773820 res!523370) b!773822))

(assert (= (and b!773822 res!523375) b!773828))

(assert (= (and b!773828 res!523379) b!773817))

(assert (= (and b!773817 res!523374) b!773838))

(assert (= (and b!773838 res!523378) b!773830))

(assert (= (and b!773830 res!523382) b!773824))

(assert (= (and b!773824 res!523385) b!773816))

(assert (= (and b!773816 res!523383) b!773837))

(assert (= (and b!773837 res!523373) b!773823))

(assert (= (and b!773823 c!85622) b!773825))

(assert (= (and b!773823 (not c!85622)) b!773815))

(assert (= (and b!773823 res!523376) b!773826))

(assert (= (and b!773826 res!523380) b!773831))

(assert (= (and b!773831 res!523371) b!773836))

(assert (= (and b!773836 res!523377) b!773829))

(assert (= (and b!773831 (not res!523384)) b!773818))

(assert (= (and b!773818 c!85623) b!773835))

(assert (= (and b!773818 (not c!85623)) b!773832))

(assert (= (and b!773818 (not res!523381)) b!773827))

(assert (= (and b!773827 c!85624) b!773821))

(assert (= (and b!773827 (not c!85624)) b!773833))

(assert (= (and b!773827 (not res!523369)) b!773834))

(declare-fun m!718463 () Bool)

(assert (=> b!773833 m!718463))

(assert (=> b!773833 m!718463))

(declare-fun m!718465 () Bool)

(assert (=> b!773833 m!718465))

(declare-fun m!718467 () Bool)

(assert (=> start!67026 m!718467))

(declare-fun m!718469 () Bool)

(assert (=> start!67026 m!718469))

(declare-fun m!718471 () Bool)

(assert (=> b!773838 m!718471))

(assert (=> b!773836 m!718463))

(assert (=> b!773836 m!718463))

(declare-fun m!718473 () Bool)

(assert (=> b!773836 m!718473))

(assert (=> b!773820 m!718463))

(assert (=> b!773820 m!718463))

(declare-fun m!718475 () Bool)

(assert (=> b!773820 m!718475))

(assert (=> b!773821 m!718463))

(assert (=> b!773821 m!718463))

(declare-fun m!718477 () Bool)

(assert (=> b!773821 m!718477))

(assert (=> b!773832 m!718463))

(assert (=> b!773832 m!718463))

(declare-fun m!718479 () Bool)

(assert (=> b!773832 m!718479))

(assert (=> b!773832 m!718463))

(assert (=> b!773832 m!718465))

(declare-fun m!718481 () Bool)

(assert (=> b!773817 m!718481))

(assert (=> b!773815 m!718463))

(assert (=> b!773815 m!718463))

(assert (=> b!773815 m!718479))

(declare-fun m!718483 () Bool)

(assert (=> b!773826 m!718483))

(declare-fun m!718485 () Bool)

(assert (=> b!773826 m!718485))

(declare-fun m!718487 () Bool)

(assert (=> b!773826 m!718487))

(declare-fun m!718489 () Bool)

(assert (=> b!773826 m!718489))

(assert (=> b!773826 m!718483))

(declare-fun m!718491 () Bool)

(assert (=> b!773826 m!718491))

(declare-fun m!718493 () Bool)

(assert (=> b!773822 m!718493))

(assert (=> b!773835 m!718463))

(assert (=> b!773835 m!718463))

(assert (=> b!773835 m!718477))

(declare-fun m!718495 () Bool)

(assert (=> b!773830 m!718495))

(assert (=> b!773816 m!718463))

(assert (=> b!773816 m!718463))

(declare-fun m!718497 () Bool)

(assert (=> b!773816 m!718497))

(assert (=> b!773816 m!718497))

(assert (=> b!773816 m!718463))

(declare-fun m!718499 () Bool)

(assert (=> b!773816 m!718499))

(declare-fun m!718501 () Bool)

(assert (=> b!773834 m!718501))

(assert (=> b!773825 m!718463))

(assert (=> b!773825 m!718463))

(declare-fun m!718503 () Bool)

(assert (=> b!773825 m!718503))

(declare-fun m!718505 () Bool)

(assert (=> b!773828 m!718505))

(declare-fun m!718507 () Bool)

(assert (=> b!773831 m!718507))

(declare-fun m!718509 () Bool)

(assert (=> b!773831 m!718509))

(declare-fun m!718511 () Bool)

(assert (=> b!773818 m!718511))

(assert (=> b!773829 m!718463))

(assert (=> b!773829 m!718463))

(declare-fun m!718513 () Bool)

(assert (=> b!773829 m!718513))

(declare-fun m!718515 () Bool)

(assert (=> b!773837 m!718515))

(push 1)

(assert (not start!67026))

(assert (not b!773818))

(assert (not b!773816))

(assert (not b!773835))

(assert (not b!773830))

(assert (not b!773828))

(assert (not b!773829))

(assert (not b!773822))

(assert (not b!773820))

(assert (not b!773833))

(assert (not b!773815))

(assert (not b!773838))

(assert (not b!773821))

(assert (not b!773834))

(assert (not b!773826))

(assert (not b!773817))

(assert (not b!773831))

(assert (not b!773825))

(assert (not b!773836))

(assert (not b!773832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101983 () Bool)

(assert (=> d!101983 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67026 d!101983))

(declare-fun d!101991 () Bool)

(assert (=> d!101991 (= (array_inv!16118 a!3186) (bvsge (size!20743 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67026 d!101991))

(declare-fun b!774049 () Bool)

(declare-fun e!430859 () Bool)

(declare-fun contains!4094 (List!14324 (_ BitVec 64)) Bool)

(assert (=> b!774049 (= e!430859 (contains!4094 Nil!14321 (select (arr!20322 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35153 () Bool)

(declare-fun call!35156 () Bool)

(declare-fun c!85668 () Bool)

(assert (=> bm!35153 (= call!35156 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85668 (Cons!14320 (select (arr!20322 a!3186) #b00000000000000000000000000000000) Nil!14321) Nil!14321)))))

(declare-fun b!774050 () Bool)

(declare-fun e!430862 () Bool)

(assert (=> b!774050 (= e!430862 call!35156)))

(declare-fun d!101995 () Bool)

(declare-fun res!523510 () Bool)

(declare-fun e!430860 () Bool)

(assert (=> d!101995 (=> res!523510 e!430860)))

(assert (=> d!101995 (= res!523510 (bvsge #b00000000000000000000000000000000 (size!20743 a!3186)))))

(assert (=> d!101995 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14321) e!430860)))

(declare-fun b!774051 () Bool)

(declare-fun e!430861 () Bool)

(assert (=> b!774051 (= e!430860 e!430861)))

(declare-fun res!523511 () Bool)

(assert (=> b!774051 (=> (not res!523511) (not e!430861))))

(assert (=> b!774051 (= res!523511 (not e!430859))))

(declare-fun res!523512 () Bool)

(assert (=> b!774051 (=> (not res!523512) (not e!430859))))

(assert (=> b!774051 (= res!523512 (validKeyInArray!0 (select (arr!20322 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774052 () Bool)

(assert (=> b!774052 (= e!430862 call!35156)))

(declare-fun b!774053 () Bool)

(assert (=> b!774053 (= e!430861 e!430862)))

(assert (=> b!774053 (= c!85668 (validKeyInArray!0 (select (arr!20322 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101995 (not res!523510)) b!774051))

(assert (= (and b!774051 res!523512) b!774049))

(assert (= (and b!774051 res!523511) b!774053))

(assert (= (and b!774053 c!85668) b!774050))

(assert (= (and b!774053 (not c!85668)) b!774052))

(assert (= (or b!774050 b!774052) bm!35153))

(declare-fun m!718665 () Bool)

(assert (=> b!774049 m!718665))

(assert (=> b!774049 m!718665))

(declare-fun m!718667 () Bool)

(assert (=> b!774049 m!718667))

(assert (=> bm!35153 m!718665))

(declare-fun m!718669 () Bool)

(assert (=> bm!35153 m!718669))

(assert (=> b!774051 m!718665))

(assert (=> b!774051 m!718665))

(declare-fun m!718671 () Bool)

(assert (=> b!774051 m!718671))

(assert (=> b!774053 m!718665))

(assert (=> b!774053 m!718665))

(assert (=> b!774053 m!718671))

(assert (=> b!773830 d!101995))

(declare-fun d!101999 () Bool)

(declare-fun res!523531 () Bool)

(declare-fun e!430890 () Bool)

(assert (=> d!101999 (=> res!523531 e!430890)))

(assert (=> d!101999 (= res!523531 (bvsge j!159 (size!20743 a!3186)))))

(assert (=> d!101999 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430890)))

(declare-fun b!774090 () Bool)

(declare-fun e!430888 () Bool)

(declare-fun call!35160 () Bool)

(assert (=> b!774090 (= e!430888 call!35160)))

(declare-fun b!774091 () Bool)

(declare-fun e!430889 () Bool)

(assert (=> b!774091 (= e!430890 e!430889)))

(declare-fun c!85678 () Bool)

(assert (=> b!774091 (= c!85678 (validKeyInArray!0 (select (arr!20322 a!3186) j!159)))))

(declare-fun b!774092 () Bool)

(assert (=> b!774092 (= e!430889 e!430888)))

(declare-fun lt!344751 () (_ BitVec 64))

(assert (=> b!774092 (= lt!344751 (select (arr!20322 a!3186) j!159))))

(declare-fun lt!344753 () Unit!26702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42450 (_ BitVec 64) (_ BitVec 32)) Unit!26702)

(assert (=> b!774092 (= lt!344753 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344751 j!159))))

(assert (=> b!774092 (arrayContainsKey!0 a!3186 lt!344751 #b00000000000000000000000000000000)))

(declare-fun lt!344752 () Unit!26702)

(assert (=> b!774092 (= lt!344752 lt!344753)))

(declare-fun res!523532 () Bool)

(assert (=> b!774092 (= res!523532 (= (seekEntryOrOpen!0 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) (Found!7922 j!159)))))

(assert (=> b!774092 (=> (not res!523532) (not e!430888))))

(declare-fun bm!35157 () Bool)

(assert (=> bm!35157 (= call!35160 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774093 () Bool)

(assert (=> b!774093 (= e!430889 call!35160)))

(assert (= (and d!101999 (not res!523531)) b!774091))

(assert (= (and b!774091 c!85678) b!774092))

(assert (= (and b!774091 (not c!85678)) b!774093))

(assert (= (and b!774092 res!523532) b!774090))

(assert (= (or b!774090 b!774093) bm!35157))

(assert (=> b!774091 m!718463))

(assert (=> b!774091 m!718463))

(assert (=> b!774091 m!718475))

(assert (=> b!774092 m!718463))

(declare-fun m!718687 () Bool)

(assert (=> b!774092 m!718687))

(declare-fun m!718689 () Bool)

(assert (=> b!774092 m!718689))

(assert (=> b!774092 m!718463))

(assert (=> b!774092 m!718473))

(declare-fun m!718691 () Bool)

(assert (=> bm!35157 m!718691))

(assert (=> b!773831 d!101999))

(declare-fun d!102005 () Bool)

(assert (=> d!102005 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344758 () Unit!26702)

(declare-fun choose!38 (array!42450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26702)

(assert (=> d!102005 (= lt!344758 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102005 (validMask!0 mask!3328)))

(assert (=> d!102005 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344758)))

(declare-fun bs!21630 () Bool)

(assert (= bs!21630 d!102005))

(assert (=> bs!21630 m!718507))

(declare-fun m!718697 () Bool)

(assert (=> bs!21630 m!718697))

(assert (=> bs!21630 m!718467))

(assert (=> b!773831 d!102005))

(declare-fun d!102009 () Bool)

(assert (=> d!102009 (= (validKeyInArray!0 (select (arr!20322 a!3186) j!159)) (and (not (= (select (arr!20322 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20322 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773820 d!102009))

(declare-fun b!774172 () Bool)

(declare-fun lt!344797 () SeekEntryResult!7922)

(assert (=> b!774172 (and (bvsge (index!34058 lt!344797) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344797) (size!20743 a!3186)))))

(declare-fun res!523555 () Bool)

(assert (=> b!774172 (= res!523555 (= (select (arr!20322 a!3186) (index!34058 lt!344797)) (select (arr!20322 a!3186) j!159)))))

(declare-fun e!430936 () Bool)

(assert (=> b!774172 (=> res!523555 e!430936)))

(declare-fun e!430940 () Bool)

(assert (=> b!774172 (= e!430940 e!430936)))

(declare-fun b!774173 () Bool)

(declare-fun e!430937 () SeekEntryResult!7922)

(assert (=> b!774173 (= e!430937 (Intermediate!7922 true lt!344625 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774174 () Bool)

(declare-fun e!430938 () SeekEntryResult!7922)

(assert (=> b!774174 (= e!430938 (Intermediate!7922 false lt!344625 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774175 () Bool)

(assert (=> b!774175 (and (bvsge (index!34058 lt!344797) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344797) (size!20743 a!3186)))))

(declare-fun res!523554 () Bool)

(assert (=> b!774175 (= res!523554 (= (select (arr!20322 a!3186) (index!34058 lt!344797)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774175 (=> res!523554 e!430936)))

(declare-fun b!774176 () Bool)

(assert (=> b!774176 (= e!430938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344625 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774177 () Bool)

(assert (=> b!774177 (= e!430937 e!430938)))

(declare-fun c!85710 () Bool)

(declare-fun lt!344796 () (_ BitVec 64))

(assert (=> b!774177 (= c!85710 (or (= lt!344796 (select (arr!20322 a!3186) j!159)) (= (bvadd lt!344796 lt!344796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774178 () Bool)

(declare-fun e!430939 () Bool)

(assert (=> b!774178 (= e!430939 (bvsge (x!64997 lt!344797) #b01111111111111111111111111111110))))

(declare-fun d!102011 () Bool)

(assert (=> d!102011 e!430939))

(declare-fun c!85709 () Bool)

(assert (=> d!102011 (= c!85709 (and (is-Intermediate!7922 lt!344797) (undefined!8734 lt!344797)))))

(assert (=> d!102011 (= lt!344797 e!430937)))

(declare-fun c!85708 () Bool)

(assert (=> d!102011 (= c!85708 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102011 (= lt!344796 (select (arr!20322 a!3186) lt!344625))))

(assert (=> d!102011 (validMask!0 mask!3328)))

(assert (=> d!102011 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344797)))

(declare-fun b!774179 () Bool)

(assert (=> b!774179 (and (bvsge (index!34058 lt!344797) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344797) (size!20743 a!3186)))))

(assert (=> b!774179 (= e!430936 (= (select (arr!20322 a!3186) (index!34058 lt!344797)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774180 () Bool)

(assert (=> b!774180 (= e!430939 e!430940)))

(declare-fun res!523556 () Bool)

(assert (=> b!774180 (= res!523556 (and (is-Intermediate!7922 lt!344797) (not (undefined!8734 lt!344797)) (bvslt (x!64997 lt!344797) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344797) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344797) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774180 (=> (not res!523556) (not e!430940))))

(assert (= (and d!102011 c!85708) b!774173))

(assert (= (and d!102011 (not c!85708)) b!774177))

(assert (= (and b!774177 c!85710) b!774174))

(assert (= (and b!774177 (not c!85710)) b!774176))

(assert (= (and d!102011 c!85709) b!774178))

(assert (= (and d!102011 (not c!85709)) b!774180))

(assert (= (and b!774180 res!523556) b!774172))

(assert (= (and b!774172 (not res!523555)) b!774175))

(assert (= (and b!774175 (not res!523554)) b!774179))

(declare-fun m!718733 () Bool)

(assert (=> b!774179 m!718733))

(declare-fun m!718735 () Bool)

(assert (=> b!774176 m!718735))

(assert (=> b!774176 m!718735))

(assert (=> b!774176 m!718463))

(declare-fun m!718737 () Bool)

(assert (=> b!774176 m!718737))

(assert (=> b!774172 m!718733))

(assert (=> b!774175 m!718733))

(declare-fun m!718739 () Bool)

(assert (=> d!102011 m!718739))

(assert (=> d!102011 m!718467))

(assert (=> b!773821 d!102011))

(declare-fun b!774197 () Bool)

(declare-fun lt!344802 () SeekEntryResult!7922)

(assert (=> b!774197 (and (bvsge (index!34058 lt!344802) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344802) (size!20743 a!3186)))))

(declare-fun res!523564 () Bool)

(assert (=> b!774197 (= res!523564 (= (select (arr!20322 a!3186) (index!34058 lt!344802)) (select (arr!20322 a!3186) j!159)))))

(declare-fun e!430950 () Bool)

(assert (=> b!774197 (=> res!523564 e!430950)))

(declare-fun e!430954 () Bool)

(assert (=> b!774197 (= e!430954 e!430950)))

(declare-fun b!774198 () Bool)

(declare-fun e!430951 () SeekEntryResult!7922)

(assert (=> b!774198 (= e!430951 (Intermediate!7922 true (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774199 () Bool)

(declare-fun e!430952 () SeekEntryResult!7922)

(assert (=> b!774199 (= e!430952 (Intermediate!7922 false (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774200 () Bool)

(assert (=> b!774200 (and (bvsge (index!34058 lt!344802) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344802) (size!20743 a!3186)))))

(declare-fun res!523563 () Bool)

(assert (=> b!774200 (= res!523563 (= (select (arr!20322 a!3186) (index!34058 lt!344802)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774200 (=> res!523563 e!430950)))

(declare-fun b!774201 () Bool)

(assert (=> b!774201 (= e!430952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774202 () Bool)

(assert (=> b!774202 (= e!430951 e!430952)))

(declare-fun c!85718 () Bool)

(declare-fun lt!344801 () (_ BitVec 64))

(assert (=> b!774202 (= c!85718 (or (= lt!344801 (select (arr!20322 a!3186) j!159)) (= (bvadd lt!344801 lt!344801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774203 () Bool)

(declare-fun e!430953 () Bool)

(assert (=> b!774203 (= e!430953 (bvsge (x!64997 lt!344802) #b01111111111111111111111111111110))))

(declare-fun d!102025 () Bool)

(assert (=> d!102025 e!430953))

(declare-fun c!85717 () Bool)

(assert (=> d!102025 (= c!85717 (and (is-Intermediate!7922 lt!344802) (undefined!8734 lt!344802)))))

(assert (=> d!102025 (= lt!344802 e!430951)))

(declare-fun c!85716 () Bool)

(assert (=> d!102025 (= c!85716 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102025 (= lt!344801 (select (arr!20322 a!3186) (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328)))))

(assert (=> d!102025 (validMask!0 mask!3328)))

(assert (=> d!102025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344802)))

(declare-fun b!774204 () Bool)

(assert (=> b!774204 (and (bvsge (index!34058 lt!344802) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344802) (size!20743 a!3186)))))

(assert (=> b!774204 (= e!430950 (= (select (arr!20322 a!3186) (index!34058 lt!344802)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774205 () Bool)

(assert (=> b!774205 (= e!430953 e!430954)))

(declare-fun res!523565 () Bool)

(assert (=> b!774205 (= res!523565 (and (is-Intermediate!7922 lt!344802) (not (undefined!8734 lt!344802)) (bvslt (x!64997 lt!344802) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344802) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344802) #b00000000000000000000000000000000)))))

(assert (=> b!774205 (=> (not res!523565) (not e!430954))))

(assert (= (and d!102025 c!85716) b!774198))

(assert (= (and d!102025 (not c!85716)) b!774202))

(assert (= (and b!774202 c!85718) b!774199))

(assert (= (and b!774202 (not c!85718)) b!774201))

(assert (= (and d!102025 c!85717) b!774203))

(assert (= (and d!102025 (not c!85717)) b!774205))

(assert (= (and b!774205 res!523565) b!774197))

(assert (= (and b!774197 (not res!523564)) b!774200))

(assert (= (and b!774200 (not res!523563)) b!774204))

(declare-fun m!718751 () Bool)

(assert (=> b!774204 m!718751))

(assert (=> b!774201 m!718497))

(declare-fun m!718753 () Bool)

(assert (=> b!774201 m!718753))

(assert (=> b!774201 m!718753))

(assert (=> b!774201 m!718463))

(declare-fun m!718755 () Bool)

(assert (=> b!774201 m!718755))

(assert (=> b!774197 m!718751))

(assert (=> b!774200 m!718751))

(assert (=> d!102025 m!718497))

(declare-fun m!718757 () Bool)

(assert (=> d!102025 m!718757))

(assert (=> d!102025 m!718467))

(assert (=> b!773816 d!102025))

(declare-fun d!102029 () Bool)

(declare-fun lt!344814 () (_ BitVec 32))

(declare-fun lt!344813 () (_ BitVec 32))

(assert (=> d!102029 (= lt!344814 (bvmul (bvxor lt!344813 (bvlshr lt!344813 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102029 (= lt!344813 ((_ extract 31 0) (bvand (bvxor (select (arr!20322 a!3186) j!159) (bvlshr (select (arr!20322 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102029 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523569 (let ((h!15429 ((_ extract 31 0) (bvand (bvxor (select (arr!20322 a!3186) j!159) (bvlshr (select (arr!20322 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65008 (bvmul (bvxor h!15429 (bvlshr h!15429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65008 (bvlshr x!65008 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523569 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523569 #b00000000000000000000000000000000))))))

(assert (=> d!102029 (= (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) (bvand (bvxor lt!344814 (bvlshr lt!344814 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773816 d!102029))

(declare-fun b!774293 () Bool)

(declare-fun e!431006 () SeekEntryResult!7922)

(declare-fun e!431008 () SeekEntryResult!7922)

(assert (=> b!774293 (= e!431006 e!431008)))

(declare-fun lt!344843 () (_ BitVec 64))

(declare-fun lt!344841 () SeekEntryResult!7922)

(assert (=> b!774293 (= lt!344843 (select (arr!20322 a!3186) (index!34058 lt!344841)))))

(declare-fun c!85749 () Bool)

(assert (=> b!774293 (= c!85749 (= lt!344843 k!2102))))

(declare-fun b!774294 () Bool)

(declare-fun c!85750 () Bool)

(assert (=> b!774294 (= c!85750 (= lt!344843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431007 () SeekEntryResult!7922)

(assert (=> b!774294 (= e!431008 e!431007)))

(declare-fun d!102039 () Bool)

(declare-fun lt!344842 () SeekEntryResult!7922)

(assert (=> d!102039 (and (or (is-Undefined!7922 lt!344842) (not (is-Found!7922 lt!344842)) (and (bvsge (index!34057 lt!344842) #b00000000000000000000000000000000) (bvslt (index!34057 lt!344842) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344842) (is-Found!7922 lt!344842) (not (is-MissingZero!7922 lt!344842)) (and (bvsge (index!34056 lt!344842) #b00000000000000000000000000000000) (bvslt (index!34056 lt!344842) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344842) (is-Found!7922 lt!344842) (is-MissingZero!7922 lt!344842) (not (is-MissingVacant!7922 lt!344842)) (and (bvsge (index!34059 lt!344842) #b00000000000000000000000000000000) (bvslt (index!34059 lt!344842) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344842) (ite (is-Found!7922 lt!344842) (= (select (arr!20322 a!3186) (index!34057 lt!344842)) k!2102) (ite (is-MissingZero!7922 lt!344842) (= (select (arr!20322 a!3186) (index!34056 lt!344842)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7922 lt!344842) (= (select (arr!20322 a!3186) (index!34059 lt!344842)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102039 (= lt!344842 e!431006)))

(declare-fun c!85751 () Bool)

(assert (=> d!102039 (= c!85751 (and (is-Intermediate!7922 lt!344841) (undefined!8734 lt!344841)))))

(assert (=> d!102039 (= lt!344841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102039 (validMask!0 mask!3328)))

(assert (=> d!102039 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!344842)))

(declare-fun b!774295 () Bool)

(assert (=> b!774295 (= e!431006 Undefined!7922)))

(declare-fun b!774296 () Bool)

(assert (=> b!774296 (= e!431007 (MissingZero!7922 (index!34058 lt!344841)))))

(declare-fun b!774297 () Bool)

(assert (=> b!774297 (= e!431008 (Found!7922 (index!34058 lt!344841)))))

(declare-fun b!774298 () Bool)

(assert (=> b!774298 (= e!431007 (seekKeyOrZeroReturnVacant!0 (x!64997 lt!344841) (index!34058 lt!344841) (index!34058 lt!344841) k!2102 a!3186 mask!3328))))

(assert (= (and d!102039 c!85751) b!774295))

(assert (= (and d!102039 (not c!85751)) b!774293))

(assert (= (and b!774293 c!85749) b!774297))

(assert (= (and b!774293 (not c!85749)) b!774294))

(assert (= (and b!774294 c!85750) b!774296))

(assert (= (and b!774294 (not c!85750)) b!774298))

(declare-fun m!718811 () Bool)

(assert (=> b!774293 m!718811))

(assert (=> d!102039 m!718467))

(declare-fun m!718813 () Bool)

(assert (=> d!102039 m!718813))

(declare-fun m!718815 () Bool)

(assert (=> d!102039 m!718815))

(declare-fun m!718817 () Bool)

(assert (=> d!102039 m!718817))

(declare-fun m!718819 () Bool)

(assert (=> d!102039 m!718819))

(assert (=> d!102039 m!718817))

(declare-fun m!718821 () Bool)

(assert (=> d!102039 m!718821))

(declare-fun m!718823 () Bool)

(assert (=> b!774298 m!718823))

(assert (=> b!773817 d!102039))

(declare-fun d!102057 () Bool)

(declare-fun res!523595 () Bool)

(declare-fun e!431017 () Bool)

(assert (=> d!102057 (=> res!523595 e!431017)))

(assert (=> d!102057 (= res!523595 (bvsge #b00000000000000000000000000000000 (size!20743 a!3186)))))

(assert (=> d!102057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!431017)))

(declare-fun b!774311 () Bool)

(declare-fun e!431015 () Bool)

(declare-fun call!35168 () Bool)

(assert (=> b!774311 (= e!431015 call!35168)))

(declare-fun b!774312 () Bool)

(declare-fun e!431016 () Bool)

(assert (=> b!774312 (= e!431017 e!431016)))

(declare-fun c!85758 () Bool)

(assert (=> b!774312 (= c!85758 (validKeyInArray!0 (select (arr!20322 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774313 () Bool)

(assert (=> b!774313 (= e!431016 e!431015)))

(declare-fun lt!344846 () (_ BitVec 64))

(assert (=> b!774313 (= lt!344846 (select (arr!20322 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344848 () Unit!26702)

(assert (=> b!774313 (= lt!344848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344846 #b00000000000000000000000000000000))))

(assert (=> b!774313 (arrayContainsKey!0 a!3186 lt!344846 #b00000000000000000000000000000000)))

(declare-fun lt!344847 () Unit!26702)

(assert (=> b!774313 (= lt!344847 lt!344848)))

(declare-fun res!523596 () Bool)

(assert (=> b!774313 (= res!523596 (= (seekEntryOrOpen!0 (select (arr!20322 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7922 #b00000000000000000000000000000000)))))

(assert (=> b!774313 (=> (not res!523596) (not e!431015))))

(declare-fun bm!35165 () Bool)

(assert (=> bm!35165 (= call!35168 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774314 () Bool)

(assert (=> b!774314 (= e!431016 call!35168)))

(assert (= (and d!102057 (not res!523595)) b!774312))

(assert (= (and b!774312 c!85758) b!774313))

(assert (= (and b!774312 (not c!85758)) b!774314))

(assert (= (and b!774313 res!523596) b!774311))

(assert (= (or b!774311 b!774314) bm!35165))

(assert (=> b!774312 m!718665))

(assert (=> b!774312 m!718665))

(assert (=> b!774312 m!718671))

(assert (=> b!774313 m!718665))

(declare-fun m!718825 () Bool)

(assert (=> b!774313 m!718825))

(declare-fun m!718827 () Bool)

(assert (=> b!774313 m!718827))

(assert (=> b!774313 m!718665))

(declare-fun m!718829 () Bool)

(assert (=> b!774313 m!718829))

(declare-fun m!718831 () Bool)

(assert (=> bm!35165 m!718831))

(assert (=> b!773838 d!102057))

(declare-fun d!102059 () Bool)

(declare-fun res!523601 () Bool)

(declare-fun e!431022 () Bool)

(assert (=> d!102059 (=> res!523601 e!431022)))

(assert (=> d!102059 (= res!523601 (= (select (arr!20322 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102059 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!431022)))

(declare-fun b!774319 () Bool)

(declare-fun e!431023 () Bool)

(assert (=> b!774319 (= e!431022 e!431023)))

(declare-fun res!523602 () Bool)

(assert (=> b!774319 (=> (not res!523602) (not e!431023))))

(assert (=> b!774319 (= res!523602 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20743 a!3186)))))

(declare-fun b!774320 () Bool)

(assert (=> b!774320 (= e!431023 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102059 (not res!523601)) b!774319))

(assert (= (and b!774319 res!523602) b!774320))

(assert (=> d!102059 m!718665))

(declare-fun m!718833 () Bool)

(assert (=> b!774320 m!718833))

(assert (=> b!773828 d!102059))

(declare-fun b!774372 () Bool)

(declare-fun e!431053 () SeekEntryResult!7922)

(assert (=> b!774372 (= e!431053 (Found!7922 resIntermediateIndex!5))))

(declare-fun b!774373 () Bool)

(declare-fun e!431052 () SeekEntryResult!7922)

(assert (=> b!774373 (= e!431052 Undefined!7922)))

(declare-fun d!102061 () Bool)

(declare-fun lt!344865 () SeekEntryResult!7922)

(assert (=> d!102061 (and (or (is-Undefined!7922 lt!344865) (not (is-Found!7922 lt!344865)) (and (bvsge (index!34057 lt!344865) #b00000000000000000000000000000000) (bvslt (index!34057 lt!344865) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344865) (is-Found!7922 lt!344865) (not (is-MissingVacant!7922 lt!344865)) (not (= (index!34059 lt!344865) resIntermediateIndex!5)) (and (bvsge (index!34059 lt!344865) #b00000000000000000000000000000000) (bvslt (index!34059 lt!344865) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344865) (ite (is-Found!7922 lt!344865) (= (select (arr!20322 a!3186) (index!34057 lt!344865)) (select (arr!20322 a!3186) j!159)) (and (is-MissingVacant!7922 lt!344865) (= (index!34059 lt!344865) resIntermediateIndex!5) (= (select (arr!20322 a!3186) (index!34059 lt!344865)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102061 (= lt!344865 e!431052)))

(declare-fun c!85780 () Bool)

(assert (=> d!102061 (= c!85780 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!344864 () (_ BitVec 64))

(assert (=> d!102061 (= lt!344864 (select (arr!20322 a!3186) resIntermediateIndex!5))))

(assert (=> d!102061 (validMask!0 mask!3328)))

(assert (=> d!102061 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344865)))

(declare-fun b!774374 () Bool)

(declare-fun c!85782 () Bool)

(assert (=> b!774374 (= c!85782 (= lt!344864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431051 () SeekEntryResult!7922)

(assert (=> b!774374 (= e!431053 e!431051)))

(declare-fun b!774375 () Bool)

(assert (=> b!774375 (= e!431051 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774376 () Bool)

(assert (=> b!774376 (= e!431051 (MissingVacant!7922 resIntermediateIndex!5))))

(declare-fun b!774377 () Bool)

(assert (=> b!774377 (= e!431052 e!431053)))

(declare-fun c!85781 () Bool)

(assert (=> b!774377 (= c!85781 (= lt!344864 (select (arr!20322 a!3186) j!159)))))

(assert (= (and d!102061 c!85780) b!774373))

(assert (= (and d!102061 (not c!85780)) b!774377))

(assert (= (and b!774377 c!85781) b!774372))

(assert (= (and b!774377 (not c!85781)) b!774374))

(assert (= (and b!774374 c!85782) b!774376))

(assert (= (and b!774374 (not c!85782)) b!774375))

(declare-fun m!718871 () Bool)

(assert (=> d!102061 m!718871))

(declare-fun m!718873 () Bool)

(assert (=> d!102061 m!718873))

(assert (=> d!102061 m!718515))

(assert (=> d!102061 m!718467))

(declare-fun m!718875 () Bool)

(assert (=> b!774375 m!718875))

(assert (=> b!774375 m!718875))

(assert (=> b!774375 m!718463))

(declare-fun m!718877 () Bool)

(assert (=> b!774375 m!718877))

(assert (=> b!773829 d!102061))

(declare-fun d!102077 () Bool)

(declare-fun lt!344873 () (_ BitVec 32))

(assert (=> d!102077 (and (bvsge lt!344873 #b00000000000000000000000000000000) (bvslt lt!344873 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102077 (= lt!344873 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!102077 (validMask!0 mask!3328)))

(assert (=> d!102077 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344873)))

(declare-fun bs!21632 () Bool)

(assert (= bs!21632 d!102077))

(declare-fun m!718885 () Bool)

(assert (=> bs!21632 m!718885))

(assert (=> bs!21632 m!718467))

(assert (=> b!773818 d!102077))

(assert (=> b!773835 d!102011))

(declare-fun b!774382 () Bool)

(declare-fun lt!344875 () SeekEntryResult!7922)

(assert (=> b!774382 (and (bvsge (index!34058 lt!344875) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344875) (size!20743 a!3186)))))

(declare-fun res!523615 () Bool)

(assert (=> b!774382 (= res!523615 (= (select (arr!20322 a!3186) (index!34058 lt!344875)) (select (arr!20322 a!3186) j!159)))))

(declare-fun e!431057 () Bool)

(assert (=> b!774382 (=> res!523615 e!431057)))

(declare-fun e!431061 () Bool)

(assert (=> b!774382 (= e!431061 e!431057)))

(declare-fun b!774383 () Bool)

(declare-fun e!431058 () SeekEntryResult!7922)

(assert (=> b!774383 (= e!431058 (Intermediate!7922 true index!1321 x!1131))))

(declare-fun b!774384 () Bool)

(declare-fun e!431059 () SeekEntryResult!7922)

(assert (=> b!774384 (= e!431059 (Intermediate!7922 false index!1321 x!1131))))

(declare-fun b!774385 () Bool)

(assert (=> b!774385 (and (bvsge (index!34058 lt!344875) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344875) (size!20743 a!3186)))))

(declare-fun res!523614 () Bool)

(assert (=> b!774385 (= res!523614 (= (select (arr!20322 a!3186) (index!34058 lt!344875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774385 (=> res!523614 e!431057)))

(declare-fun b!774386 () Bool)

(assert (=> b!774386 (= e!431059 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774387 () Bool)

(assert (=> b!774387 (= e!431058 e!431059)))

(declare-fun c!85786 () Bool)

(declare-fun lt!344874 () (_ BitVec 64))

(assert (=> b!774387 (= c!85786 (or (= lt!344874 (select (arr!20322 a!3186) j!159)) (= (bvadd lt!344874 lt!344874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774388 () Bool)

(declare-fun e!431060 () Bool)

(assert (=> b!774388 (= e!431060 (bvsge (x!64997 lt!344875) #b01111111111111111111111111111110))))

(declare-fun d!102083 () Bool)

(assert (=> d!102083 e!431060))

(declare-fun c!85785 () Bool)

(assert (=> d!102083 (= c!85785 (and (is-Intermediate!7922 lt!344875) (undefined!8734 lt!344875)))))

(assert (=> d!102083 (= lt!344875 e!431058)))

(declare-fun c!85784 () Bool)

(assert (=> d!102083 (= c!85784 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102083 (= lt!344874 (select (arr!20322 a!3186) index!1321))))

(assert (=> d!102083 (validMask!0 mask!3328)))

(assert (=> d!102083 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344875)))

(declare-fun b!774389 () Bool)

(assert (=> b!774389 (and (bvsge (index!34058 lt!344875) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344875) (size!20743 a!3186)))))

(assert (=> b!774389 (= e!431057 (= (select (arr!20322 a!3186) (index!34058 lt!344875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774390 () Bool)

(assert (=> b!774390 (= e!431060 e!431061)))

(declare-fun res!523616 () Bool)

(assert (=> b!774390 (= res!523616 (and (is-Intermediate!7922 lt!344875) (not (undefined!8734 lt!344875)) (bvslt (x!64997 lt!344875) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344875) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344875) x!1131)))))

(assert (=> b!774390 (=> (not res!523616) (not e!431061))))

(assert (= (and d!102083 c!85784) b!774383))

(assert (= (and d!102083 (not c!85784)) b!774387))

(assert (= (and b!774387 c!85786) b!774384))

(assert (= (and b!774387 (not c!85786)) b!774386))

(assert (= (and d!102083 c!85785) b!774388))

(assert (= (and d!102083 (not c!85785)) b!774390))

(assert (= (and b!774390 res!523616) b!774382))

(assert (= (and b!774382 (not res!523615)) b!774385))

(assert (= (and b!774385 (not res!523614)) b!774389))

(declare-fun m!718887 () Bool)

(assert (=> b!774389 m!718887))

(assert (=> b!774386 m!718511))

(assert (=> b!774386 m!718511))

(assert (=> b!774386 m!718463))

(declare-fun m!718889 () Bool)

(assert (=> b!774386 m!718889))

(assert (=> b!774382 m!718887))

(assert (=> b!774385 m!718887))

(declare-fun m!718891 () Bool)

(assert (=> d!102083 m!718891))

(assert (=> d!102083 m!718467))

(assert (=> b!773825 d!102083))

(declare-fun b!774391 () Bool)

(declare-fun e!431064 () SeekEntryResult!7922)

(assert (=> b!774391 (= e!431064 (Found!7922 index!1321))))

(declare-fun b!774392 () Bool)

(declare-fun e!431063 () SeekEntryResult!7922)

(assert (=> b!774392 (= e!431063 Undefined!7922)))

(declare-fun lt!344877 () SeekEntryResult!7922)

(declare-fun d!102085 () Bool)

(assert (=> d!102085 (and (or (is-Undefined!7922 lt!344877) (not (is-Found!7922 lt!344877)) (and (bvsge (index!34057 lt!344877) #b00000000000000000000000000000000) (bvslt (index!34057 lt!344877) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344877) (is-Found!7922 lt!344877) (not (is-MissingVacant!7922 lt!344877)) (not (= (index!34059 lt!344877) resIntermediateIndex!5)) (and (bvsge (index!34059 lt!344877) #b00000000000000000000000000000000) (bvslt (index!34059 lt!344877) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344877) (ite (is-Found!7922 lt!344877) (= (select (arr!20322 a!3186) (index!34057 lt!344877)) (select (arr!20322 a!3186) j!159)) (and (is-MissingVacant!7922 lt!344877) (= (index!34059 lt!344877) resIntermediateIndex!5) (= (select (arr!20322 a!3186) (index!34059 lt!344877)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102085 (= lt!344877 e!431063)))

(declare-fun c!85787 () Bool)

(assert (=> d!102085 (= c!85787 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344876 () (_ BitVec 64))

(assert (=> d!102085 (= lt!344876 (select (arr!20322 a!3186) index!1321))))

(assert (=> d!102085 (validMask!0 mask!3328)))

(assert (=> d!102085 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344877)))

(declare-fun b!774393 () Bool)

(declare-fun c!85789 () Bool)

(assert (=> b!774393 (= c!85789 (= lt!344876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431062 () SeekEntryResult!7922)

(assert (=> b!774393 (= e!431064 e!431062)))

(declare-fun b!774394 () Bool)

(assert (=> b!774394 (= e!431062 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774395 () Bool)

(assert (=> b!774395 (= e!431062 (MissingVacant!7922 resIntermediateIndex!5))))

(declare-fun b!774396 () Bool)

(assert (=> b!774396 (= e!431063 e!431064)))

(declare-fun c!85788 () Bool)

(assert (=> b!774396 (= c!85788 (= lt!344876 (select (arr!20322 a!3186) j!159)))))

(assert (= (and d!102085 c!85787) b!774392))

(assert (= (and d!102085 (not c!85787)) b!774396))

(assert (= (and b!774396 c!85788) b!774391))

(assert (= (and b!774396 (not c!85788)) b!774393))

(assert (= (and b!774393 c!85789) b!774395))

(assert (= (and b!774393 (not c!85789)) b!774394))

(declare-fun m!718893 () Bool)

(assert (=> d!102085 m!718893))

(declare-fun m!718895 () Bool)

(assert (=> d!102085 m!718895))

(assert (=> d!102085 m!718891))

(assert (=> d!102085 m!718467))

(assert (=> b!774394 m!718511))

(assert (=> b!774394 m!718511))

(assert (=> b!774394 m!718463))

(declare-fun m!718897 () Bool)

(assert (=> b!774394 m!718897))

(assert (=> b!773815 d!102085))

(declare-fun b!774397 () Bool)

(declare-fun e!431065 () SeekEntryResult!7922)

(declare-fun e!431067 () SeekEntryResult!7922)

(assert (=> b!774397 (= e!431065 e!431067)))

(declare-fun lt!344882 () (_ BitVec 64))

(declare-fun lt!344880 () SeekEntryResult!7922)

(assert (=> b!774397 (= lt!344882 (select (arr!20322 a!3186) (index!34058 lt!344880)))))

(declare-fun c!85790 () Bool)

(assert (=> b!774397 (= c!85790 (= lt!344882 (select (arr!20322 a!3186) j!159)))))

(declare-fun b!774398 () Bool)

(declare-fun c!85791 () Bool)

(assert (=> b!774398 (= c!85791 (= lt!344882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431066 () SeekEntryResult!7922)

(assert (=> b!774398 (= e!431067 e!431066)))

(declare-fun d!102087 () Bool)

(declare-fun lt!344881 () SeekEntryResult!7922)

(assert (=> d!102087 (and (or (is-Undefined!7922 lt!344881) (not (is-Found!7922 lt!344881)) (and (bvsge (index!34057 lt!344881) #b00000000000000000000000000000000) (bvslt (index!34057 lt!344881) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344881) (is-Found!7922 lt!344881) (not (is-MissingZero!7922 lt!344881)) (and (bvsge (index!34056 lt!344881) #b00000000000000000000000000000000) (bvslt (index!34056 lt!344881) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344881) (is-Found!7922 lt!344881) (is-MissingZero!7922 lt!344881) (not (is-MissingVacant!7922 lt!344881)) (and (bvsge (index!34059 lt!344881) #b00000000000000000000000000000000) (bvslt (index!34059 lt!344881) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344881) (ite (is-Found!7922 lt!344881) (= (select (arr!20322 a!3186) (index!34057 lt!344881)) (select (arr!20322 a!3186) j!159)) (ite (is-MissingZero!7922 lt!344881) (= (select (arr!20322 a!3186) (index!34056 lt!344881)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7922 lt!344881) (= (select (arr!20322 a!3186) (index!34059 lt!344881)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102087 (= lt!344881 e!431065)))

(declare-fun c!85792 () Bool)

(assert (=> d!102087 (= c!85792 (and (is-Intermediate!7922 lt!344880) (undefined!8734 lt!344880)))))

(assert (=> d!102087 (= lt!344880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20322 a!3186) j!159) mask!3328) (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102087 (validMask!0 mask!3328)))

(assert (=> d!102087 (= (seekEntryOrOpen!0 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344881)))

(declare-fun b!774399 () Bool)

(assert (=> b!774399 (= e!431065 Undefined!7922)))

(declare-fun b!774400 () Bool)

(assert (=> b!774400 (= e!431066 (MissingZero!7922 (index!34058 lt!344880)))))

(declare-fun b!774401 () Bool)

(assert (=> b!774401 (= e!431067 (Found!7922 (index!34058 lt!344880)))))

(declare-fun b!774402 () Bool)

(assert (=> b!774402 (= e!431066 (seekKeyOrZeroReturnVacant!0 (x!64997 lt!344880) (index!34058 lt!344880) (index!34058 lt!344880) (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102087 c!85792) b!774399))

(assert (= (and d!102087 (not c!85792)) b!774397))

(assert (= (and b!774397 c!85790) b!774401))

(assert (= (and b!774397 (not c!85790)) b!774398))

(assert (= (and b!774398 c!85791) b!774400))

(assert (= (and b!774398 (not c!85791)) b!774402))

(declare-fun m!718901 () Bool)

(assert (=> b!774397 m!718901))

(assert (=> d!102087 m!718467))

(declare-fun m!718903 () Bool)

(assert (=> d!102087 m!718903))

(declare-fun m!718905 () Bool)

(assert (=> d!102087 m!718905))

(assert (=> d!102087 m!718497))

(assert (=> d!102087 m!718463))

(assert (=> d!102087 m!718499))

(assert (=> d!102087 m!718463))

(assert (=> d!102087 m!718497))

(declare-fun m!718907 () Bool)

(assert (=> d!102087 m!718907))

(assert (=> b!774402 m!718463))

(declare-fun m!718909 () Bool)

(assert (=> b!774402 m!718909))

(assert (=> b!773836 d!102087))

(declare-fun b!774412 () Bool)

(declare-fun lt!344887 () SeekEntryResult!7922)

(assert (=> b!774412 (and (bvsge (index!34058 lt!344887) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344887) (size!20743 lt!344626)))))

(declare-fun res!523621 () Bool)

(assert (=> b!774412 (= res!523621 (= (select (arr!20322 lt!344626) (index!34058 lt!344887)) lt!344621))))

(declare-fun e!431073 () Bool)

(assert (=> b!774412 (=> res!523621 e!431073)))

(declare-fun e!431077 () Bool)

(assert (=> b!774412 (= e!431077 e!431073)))

(declare-fun b!774413 () Bool)

(declare-fun e!431074 () SeekEntryResult!7922)

(assert (=> b!774413 (= e!431074 (Intermediate!7922 true index!1321 x!1131))))

(declare-fun b!774414 () Bool)

(declare-fun e!431075 () SeekEntryResult!7922)

(assert (=> b!774414 (= e!431075 (Intermediate!7922 false index!1321 x!1131))))

(declare-fun b!774415 () Bool)

(assert (=> b!774415 (and (bvsge (index!34058 lt!344887) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344887) (size!20743 lt!344626)))))

(declare-fun res!523620 () Bool)

(assert (=> b!774415 (= res!523620 (= (select (arr!20322 lt!344626) (index!34058 lt!344887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774415 (=> res!523620 e!431073)))

(declare-fun b!774416 () Bool)

(assert (=> b!774416 (= e!431075 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!344621 lt!344626 mask!3328))))

(declare-fun b!774417 () Bool)

(assert (=> b!774417 (= e!431074 e!431075)))

(declare-fun c!85798 () Bool)

(declare-fun lt!344886 () (_ BitVec 64))

(assert (=> b!774417 (= c!85798 (or (= lt!344886 lt!344621) (= (bvadd lt!344886 lt!344886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774418 () Bool)

(declare-fun e!431076 () Bool)

(assert (=> b!774418 (= e!431076 (bvsge (x!64997 lt!344887) #b01111111111111111111111111111110))))

(declare-fun d!102091 () Bool)

(assert (=> d!102091 e!431076))

(declare-fun c!85797 () Bool)

(assert (=> d!102091 (= c!85797 (and (is-Intermediate!7922 lt!344887) (undefined!8734 lt!344887)))))

(assert (=> d!102091 (= lt!344887 e!431074)))

(declare-fun c!85796 () Bool)

(assert (=> d!102091 (= c!85796 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102091 (= lt!344886 (select (arr!20322 lt!344626) index!1321))))

(assert (=> d!102091 (validMask!0 mask!3328)))

(assert (=> d!102091 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344621 lt!344626 mask!3328) lt!344887)))

(declare-fun b!774419 () Bool)

(assert (=> b!774419 (and (bvsge (index!34058 lt!344887) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344887) (size!20743 lt!344626)))))

(assert (=> b!774419 (= e!431073 (= (select (arr!20322 lt!344626) (index!34058 lt!344887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774420 () Bool)

(assert (=> b!774420 (= e!431076 e!431077)))

(declare-fun res!523622 () Bool)

(assert (=> b!774420 (= res!523622 (and (is-Intermediate!7922 lt!344887) (not (undefined!8734 lt!344887)) (bvslt (x!64997 lt!344887) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344887) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344887) x!1131)))))

(assert (=> b!774420 (=> (not res!523622) (not e!431077))))

(assert (= (and d!102091 c!85796) b!774413))

(assert (= (and d!102091 (not c!85796)) b!774417))

(assert (= (and b!774417 c!85798) b!774414))

(assert (= (and b!774417 (not c!85798)) b!774416))

(assert (= (and d!102091 c!85797) b!774418))

(assert (= (and d!102091 (not c!85797)) b!774420))

(assert (= (and b!774420 res!523622) b!774412))

(assert (= (and b!774412 (not res!523621)) b!774415))

(assert (= (and b!774415 (not res!523620)) b!774419))

(declare-fun m!718917 () Bool)

(assert (=> b!774419 m!718917))

(assert (=> b!774416 m!718511))

(assert (=> b!774416 m!718511))

(declare-fun m!718919 () Bool)

(assert (=> b!774416 m!718919))

(assert (=> b!774412 m!718917))

(assert (=> b!774415 m!718917))

(declare-fun m!718921 () Bool)

(assert (=> d!102091 m!718921))

(assert (=> d!102091 m!718467))

(assert (=> b!773826 d!102091))

(declare-fun b!774427 () Bool)

(declare-fun lt!344892 () SeekEntryResult!7922)

(assert (=> b!774427 (and (bvsge (index!34058 lt!344892) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344892) (size!20743 lt!344626)))))

(declare-fun res!523624 () Bool)

(assert (=> b!774427 (= res!523624 (= (select (arr!20322 lt!344626) (index!34058 lt!344892)) lt!344621))))

(declare-fun e!431081 () Bool)

(assert (=> b!774427 (=> res!523624 e!431081)))

(declare-fun e!431085 () Bool)

(assert (=> b!774427 (= e!431085 e!431081)))

(declare-fun b!774428 () Bool)

(declare-fun e!431082 () SeekEntryResult!7922)

(assert (=> b!774428 (= e!431082 (Intermediate!7922 true (toIndex!0 lt!344621 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774429 () Bool)

(declare-fun e!431083 () SeekEntryResult!7922)

(assert (=> b!774429 (= e!431083 (Intermediate!7922 false (toIndex!0 lt!344621 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774430 () Bool)

(assert (=> b!774430 (and (bvsge (index!34058 lt!344892) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344892) (size!20743 lt!344626)))))

(declare-fun res!523623 () Bool)

(assert (=> b!774430 (= res!523623 (= (select (arr!20322 lt!344626) (index!34058 lt!344892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774430 (=> res!523623 e!431081)))

(declare-fun b!774431 () Bool)

(assert (=> b!774431 (= e!431083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344621 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!344621 lt!344626 mask!3328))))

(declare-fun b!774432 () Bool)

(assert (=> b!774432 (= e!431082 e!431083)))

(declare-fun c!85804 () Bool)

(declare-fun lt!344891 () (_ BitVec 64))

(assert (=> b!774432 (= c!85804 (or (= lt!344891 lt!344621) (= (bvadd lt!344891 lt!344891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774433 () Bool)

(declare-fun e!431084 () Bool)

(assert (=> b!774433 (= e!431084 (bvsge (x!64997 lt!344892) #b01111111111111111111111111111110))))

(declare-fun d!102097 () Bool)

(assert (=> d!102097 e!431084))

(declare-fun c!85803 () Bool)

(assert (=> d!102097 (= c!85803 (and (is-Intermediate!7922 lt!344892) (undefined!8734 lt!344892)))))

(assert (=> d!102097 (= lt!344892 e!431082)))

(declare-fun c!85802 () Bool)

(assert (=> d!102097 (= c!85802 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102097 (= lt!344891 (select (arr!20322 lt!344626) (toIndex!0 lt!344621 mask!3328)))))

(assert (=> d!102097 (validMask!0 mask!3328)))

(assert (=> d!102097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344621 mask!3328) lt!344621 lt!344626 mask!3328) lt!344892)))

(declare-fun b!774434 () Bool)

(assert (=> b!774434 (and (bvsge (index!34058 lt!344892) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344892) (size!20743 lt!344626)))))

(assert (=> b!774434 (= e!431081 (= (select (arr!20322 lt!344626) (index!34058 lt!344892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774435 () Bool)

(assert (=> b!774435 (= e!431084 e!431085)))

(declare-fun res!523625 () Bool)

(assert (=> b!774435 (= res!523625 (and (is-Intermediate!7922 lt!344892) (not (undefined!8734 lt!344892)) (bvslt (x!64997 lt!344892) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344892) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344892) #b00000000000000000000000000000000)))))

(assert (=> b!774435 (=> (not res!523625) (not e!431085))))

(assert (= (and d!102097 c!85802) b!774428))

(assert (= (and d!102097 (not c!85802)) b!774432))

(assert (= (and b!774432 c!85804) b!774429))

(assert (= (and b!774432 (not c!85804)) b!774431))

(assert (= (and d!102097 c!85803) b!774433))

(assert (= (and d!102097 (not c!85803)) b!774435))

(assert (= (and b!774435 res!523625) b!774427))

(assert (= (and b!774427 (not res!523624)) b!774430))

(assert (= (and b!774430 (not res!523623)) b!774434))

(declare-fun m!718937 () Bool)

(assert (=> b!774434 m!718937))

(assert (=> b!774431 m!718483))

(declare-fun m!718939 () Bool)

(assert (=> b!774431 m!718939))

(assert (=> b!774431 m!718939))

(declare-fun m!718941 () Bool)

(assert (=> b!774431 m!718941))

(assert (=> b!774427 m!718937))

(assert (=> b!774430 m!718937))

(assert (=> d!102097 m!718483))

(declare-fun m!718943 () Bool)

(assert (=> d!102097 m!718943))

(assert (=> d!102097 m!718467))

(assert (=> b!773826 d!102097))

(declare-fun d!102101 () Bool)

(declare-fun lt!344896 () (_ BitVec 32))

(declare-fun lt!344895 () (_ BitVec 32))

(assert (=> d!102101 (= lt!344896 (bvmul (bvxor lt!344895 (bvlshr lt!344895 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102101 (= lt!344895 ((_ extract 31 0) (bvand (bvxor lt!344621 (bvlshr lt!344621 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102101 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523569 (let ((h!15429 ((_ extract 31 0) (bvand (bvxor lt!344621 (bvlshr lt!344621 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65008 (bvmul (bvxor h!15429 (bvlshr h!15429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65008 (bvlshr x!65008 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523569 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523569 #b00000000000000000000000000000000))))))

(assert (=> d!102101 (= (toIndex!0 lt!344621 mask!3328) (bvand (bvxor lt!344896 (bvlshr lt!344896 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773826 d!102101))

(assert (=> b!773832 d!102085))

(declare-fun b!774442 () Bool)

(declare-fun e!431091 () SeekEntryResult!7922)

(assert (=> b!774442 (= e!431091 (Found!7922 lt!344625))))

(declare-fun b!774443 () Bool)

(declare-fun e!431090 () SeekEntryResult!7922)

(assert (=> b!774443 (= e!431090 Undefined!7922)))

(declare-fun d!102103 () Bool)

(declare-fun lt!344898 () SeekEntryResult!7922)

(assert (=> d!102103 (and (or (is-Undefined!7922 lt!344898) (not (is-Found!7922 lt!344898)) (and (bvsge (index!34057 lt!344898) #b00000000000000000000000000000000) (bvslt (index!34057 lt!344898) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344898) (is-Found!7922 lt!344898) (not (is-MissingVacant!7922 lt!344898)) (not (= (index!34059 lt!344898) resIntermediateIndex!5)) (and (bvsge (index!34059 lt!344898) #b00000000000000000000000000000000) (bvslt (index!34059 lt!344898) (size!20743 a!3186)))) (or (is-Undefined!7922 lt!344898) (ite (is-Found!7922 lt!344898) (= (select (arr!20322 a!3186) (index!34057 lt!344898)) (select (arr!20322 a!3186) j!159)) (and (is-MissingVacant!7922 lt!344898) (= (index!34059 lt!344898) resIntermediateIndex!5) (= (select (arr!20322 a!3186) (index!34059 lt!344898)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102103 (= lt!344898 e!431090)))

(declare-fun c!85808 () Bool)

(assert (=> d!102103 (= c!85808 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344897 () (_ BitVec 64))

(assert (=> d!102103 (= lt!344897 (select (arr!20322 a!3186) lt!344625))))

(assert (=> d!102103 (validMask!0 mask!3328)))

(assert (=> d!102103 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328) lt!344898)))

(declare-fun b!774444 () Bool)

(declare-fun c!85810 () Bool)

(assert (=> b!774444 (= c!85810 (= lt!344897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!431089 () SeekEntryResult!7922)

(assert (=> b!774444 (= e!431091 e!431089)))

(declare-fun b!774445 () Bool)

(assert (=> b!774445 (= e!431089 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344625 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20322 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774446 () Bool)

(assert (=> b!774446 (= e!431089 (MissingVacant!7922 resIntermediateIndex!5))))

(declare-fun b!774447 () Bool)

(assert (=> b!774447 (= e!431090 e!431091)))

(declare-fun c!85809 () Bool)

(assert (=> b!774447 (= c!85809 (= lt!344897 (select (arr!20322 a!3186) j!159)))))

(assert (= (and d!102103 c!85808) b!774443))

(assert (= (and d!102103 (not c!85808)) b!774447))

(assert (= (and b!774447 c!85809) b!774442))

(assert (= (and b!774447 (not c!85809)) b!774444))

(assert (= (and b!774444 c!85810) b!774446))

(assert (= (and b!774444 (not c!85810)) b!774445))

(declare-fun m!718951 () Bool)

(assert (=> d!102103 m!718951))

(declare-fun m!718953 () Bool)

(assert (=> d!102103 m!718953))

(assert (=> d!102103 m!718739))

(assert (=> d!102103 m!718467))

(assert (=> b!774445 m!718735))

(assert (=> b!774445 m!718735))

(assert (=> b!774445 m!718463))

(declare-fun m!718955 () Bool)

(assert (=> b!774445 m!718955))

(assert (=> b!773832 d!102103))

(assert (=> b!773833 d!102103))

(declare-fun d!102107 () Bool)

(assert (=> d!102107 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773822 d!102107))

(declare-fun b!774448 () Bool)

(declare-fun lt!344900 () SeekEntryResult!7922)

(assert (=> b!774448 (and (bvsge (index!34058 lt!344900) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344900) (size!20743 lt!344626)))))

(declare-fun res!523627 () Bool)

(assert (=> b!774448 (= res!523627 (= (select (arr!20322 lt!344626) (index!34058 lt!344900)) lt!344621))))

(declare-fun e!431092 () Bool)

(assert (=> b!774448 (=> res!523627 e!431092)))

(declare-fun e!431096 () Bool)

(assert (=> b!774448 (= e!431096 e!431092)))

(declare-fun b!774449 () Bool)

(declare-fun e!431093 () SeekEntryResult!7922)

(assert (=> b!774449 (= e!431093 (Intermediate!7922 true lt!344625 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774450 () Bool)

(declare-fun e!431094 () SeekEntryResult!7922)

(assert (=> b!774450 (= e!431094 (Intermediate!7922 false lt!344625 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774451 () Bool)

(assert (=> b!774451 (and (bvsge (index!34058 lt!344900) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344900) (size!20743 lt!344626)))))

(declare-fun res!523626 () Bool)

(assert (=> b!774451 (= res!523626 (= (select (arr!20322 lt!344626) (index!34058 lt!344900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774451 (=> res!523626 e!431092)))

(declare-fun b!774452 () Bool)

(assert (=> b!774452 (= e!431094 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344625 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344621 lt!344626 mask!3328))))

(declare-fun b!774453 () Bool)

(assert (=> b!774453 (= e!431093 e!431094)))

(declare-fun c!85813 () Bool)

(declare-fun lt!344899 () (_ BitVec 64))

(assert (=> b!774453 (= c!85813 (or (= lt!344899 lt!344621) (= (bvadd lt!344899 lt!344899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774454 () Bool)

(declare-fun e!431095 () Bool)

(assert (=> b!774454 (= e!431095 (bvsge (x!64997 lt!344900) #b01111111111111111111111111111110))))

(declare-fun d!102109 () Bool)

(assert (=> d!102109 e!431095))

(declare-fun c!85812 () Bool)

(assert (=> d!102109 (= c!85812 (and (is-Intermediate!7922 lt!344900) (undefined!8734 lt!344900)))))

(assert (=> d!102109 (= lt!344900 e!431093)))

(declare-fun c!85811 () Bool)

(assert (=> d!102109 (= c!85811 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102109 (= lt!344899 (select (arr!20322 lt!344626) lt!344625))))

(assert (=> d!102109 (validMask!0 mask!3328)))

(assert (=> d!102109 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344625 lt!344621 lt!344626 mask!3328) lt!344900)))

(declare-fun b!774455 () Bool)

(assert (=> b!774455 (and (bvsge (index!34058 lt!344900) #b00000000000000000000000000000000) (bvslt (index!34058 lt!344900) (size!20743 lt!344626)))))

(assert (=> b!774455 (= e!431092 (= (select (arr!20322 lt!344626) (index!34058 lt!344900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!774456 () Bool)

(assert (=> b!774456 (= e!431095 e!431096)))

(declare-fun res!523628 () Bool)

(assert (=> b!774456 (= res!523628 (and (is-Intermediate!7922 lt!344900) (not (undefined!8734 lt!344900)) (bvslt (x!64997 lt!344900) #b01111111111111111111111111111110) (bvsge (x!64997 lt!344900) #b00000000000000000000000000000000) (bvsge (x!64997 lt!344900) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774456 (=> (not res!523628) (not e!431096))))

(assert (= (and d!102109 c!85811) b!774449))

(assert (= (and d!102109 (not c!85811)) b!774453))

(assert (= (and b!774453 c!85813) b!774450))

(assert (= (and b!774453 (not c!85813)) b!774452))

(assert (= (and d!102109 c!85812) b!774454))

(assert (= (and d!102109 (not c!85812)) b!774456))

(assert (= (and b!774456 res!523628) b!774448))

(assert (= (and b!774448 (not res!523627)) b!774451))

(assert (= (and b!774451 (not res!523626)) b!774455))

(declare-fun m!718957 () Bool)

(assert (=> b!774455 m!718957))

(assert (=> b!774452 m!718735))

(assert (=> b!774452 m!718735))

(declare-fun m!718959 () Bool)

(assert (=> b!774452 m!718959))

(assert (=> b!774448 m!718957))

(assert (=> b!774451 m!718957))

(declare-fun m!718961 () Bool)

(assert (=> d!102109 m!718961))

(assert (=> d!102109 m!718467))

(assert (=> b!773834 d!102109))

(push 1)

(assert (not bm!35165))

(assert (not b!774313))

(assert (not b!774091))

(assert (not b!774402))

(assert (not d!102011))

(assert (not d!102005))

(assert (not b!774092))

(assert (not b!774049))

(assert (not b!774320))

(assert (not d!102039))

(assert (not bm!35157))

(assert (not b!774312))

(assert (not bm!35153))

(assert (not d!102083))

(assert (not d!102085))

(assert (not b!774394))

(assert (not b!774051))

(assert (not b!774452))

(assert (not b!774298))

(assert (not d!102061))

(assert (not d!102077))

(assert (not d!102091))

(assert (not d!102087))

(assert (not b!774416))

(assert (not d!102097))

(assert (not b!774386))

(assert (not b!774176))

(assert (not b!774445))

(assert (not d!102109))

(assert (not d!102103))

(assert (not b!774053))

(assert (not b!774375))

(assert (not d!102025))

(assert (not b!774431))

(assert (not b!774201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

