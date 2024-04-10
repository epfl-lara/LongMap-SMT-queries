; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65486 () Bool)

(assert start!65486)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41659 0))(
  ( (array!41660 (arr!19943 (Array (_ BitVec 32) (_ BitVec 64))) (size!20364 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41659)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!746581 () Bool)

(declare-datatypes ((SeekEntryResult!7543 0))(
  ( (MissingZero!7543 (index!32540 (_ BitVec 32))) (Found!7543 (index!32541 (_ BitVec 32))) (Intermediate!7543 (undefined!8355 Bool) (index!32542 (_ BitVec 32)) (x!63485 (_ BitVec 32))) (Undefined!7543) (MissingVacant!7543 (index!32543 (_ BitVec 32))) )
))
(declare-fun lt!331803 () SeekEntryResult!7543)

(declare-fun e!416914 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!746581 (= e!416914 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331803))))

(declare-fun b!746582 () Bool)

(declare-fun res!503343 () Bool)

(declare-fun e!416915 () Bool)

(assert (=> b!746582 (=> (not res!503343) (not e!416915))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746582 (= res!503343 (validKeyInArray!0 k!2102))))

(declare-fun b!746583 () Bool)

(declare-fun e!416918 () Bool)

(assert (=> b!746583 (= e!416915 e!416918)))

(declare-fun res!503341 () Bool)

(assert (=> b!746583 (=> (not res!503341) (not e!416918))))

(declare-fun lt!331797 () SeekEntryResult!7543)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746583 (= res!503341 (or (= lt!331797 (MissingZero!7543 i!1173)) (= lt!331797 (MissingVacant!7543 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!746583 (= lt!331797 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746584 () Bool)

(declare-fun e!416919 () Bool)

(assert (=> b!746584 (= e!416918 e!416919)))

(declare-fun res!503331 () Bool)

(assert (=> b!746584 (=> (not res!503331) (not e!416919))))

(declare-fun lt!331798 () SeekEntryResult!7543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746584 (= res!503331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19943 a!3186) j!159) mask!3328) (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331798))))

(assert (=> b!746584 (= lt!331798 (Intermediate!7543 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746585 () Bool)

(declare-fun e!416913 () Bool)

(assert (=> b!746585 (= e!416919 e!416913)))

(declare-fun res!503344 () Bool)

(assert (=> b!746585 (=> (not res!503344) (not e!416913))))

(declare-fun lt!331796 () SeekEntryResult!7543)

(declare-fun lt!331802 () SeekEntryResult!7543)

(assert (=> b!746585 (= res!503344 (= lt!331796 lt!331802))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!331799 () array!41659)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!331801 () (_ BitVec 64))

(assert (=> b!746585 (= lt!331802 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331801 lt!331799 mask!3328))))

(assert (=> b!746585 (= lt!331796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331801 mask!3328) lt!331801 lt!331799 mask!3328))))

(assert (=> b!746585 (= lt!331801 (select (store (arr!19943 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746585 (= lt!331799 (array!41660 (store (arr!19943 a!3186) i!1173 k!2102) (size!20364 a!3186)))))

(declare-fun res!503332 () Bool)

(assert (=> start!65486 (=> (not res!503332) (not e!416915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65486 (= res!503332 (validMask!0 mask!3328))))

(assert (=> start!65486 e!416915))

(assert (=> start!65486 true))

(declare-fun array_inv!15739 (array!41659) Bool)

(assert (=> start!65486 (array_inv!15739 a!3186)))

(declare-fun b!746586 () Bool)

(declare-fun res!503336 () Bool)

(assert (=> b!746586 (=> (not res!503336) (not e!416915))))

(assert (=> b!746586 (= res!503336 (validKeyInArray!0 (select (arr!19943 a!3186) j!159)))))

(declare-fun b!746587 () Bool)

(declare-fun res!503330 () Bool)

(assert (=> b!746587 (=> (not res!503330) (not e!416918))))

(assert (=> b!746587 (= res!503330 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20364 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20364 a!3186))))))

(declare-fun b!746588 () Bool)

(declare-fun res!503338 () Bool)

(assert (=> b!746588 (=> (not res!503338) (not e!416919))))

(assert (=> b!746588 (= res!503338 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19943 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746589 () Bool)

(declare-fun e!416920 () Bool)

(assert (=> b!746589 (= e!416920 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!331800 () SeekEntryResult!7543)

(declare-fun lt!331805 () SeekEntryResult!7543)

(assert (=> b!746589 (= lt!331800 lt!331805)))

(declare-fun b!746590 () Bool)

(declare-fun e!416916 () Bool)

(assert (=> b!746590 (= e!416916 e!416920)))

(declare-fun res!503342 () Bool)

(assert (=> b!746590 (=> res!503342 e!416920)))

(assert (=> b!746590 (= res!503342 (or (not (= lt!331805 lt!331803)) (= (select (store (arr!19943 a!3186) i!1173 k!2102) index!1321) lt!331801) (not (= (select (store (arr!19943 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746590 (= lt!331805 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746591 () Bool)

(declare-fun res!503335 () Bool)

(assert (=> b!746591 (=> (not res!503335) (not e!416915))))

(declare-fun arrayContainsKey!0 (array!41659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746591 (= res!503335 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746592 () Bool)

(declare-fun res!503334 () Bool)

(assert (=> b!746592 (=> (not res!503334) (not e!416918))))

(declare-datatypes ((List!13945 0))(
  ( (Nil!13942) (Cons!13941 (h!15013 (_ BitVec 64)) (t!20260 List!13945)) )
))
(declare-fun arrayNoDuplicates!0 (array!41659 (_ BitVec 32) List!13945) Bool)

(assert (=> b!746592 (= res!503334 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13942))))

(declare-fun b!746593 () Bool)

(declare-fun res!503340 () Bool)

(assert (=> b!746593 (=> (not res!503340) (not e!416918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41659 (_ BitVec 32)) Bool)

(assert (=> b!746593 (= res!503340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!416917 () Bool)

(declare-fun b!746594 () Bool)

(assert (=> b!746594 (= e!416917 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) (Found!7543 j!159)))))

(declare-fun b!746595 () Bool)

(assert (=> b!746595 (= e!416913 (not e!416916))))

(declare-fun res!503345 () Bool)

(assert (=> b!746595 (=> res!503345 e!416916)))

(assert (=> b!746595 (= res!503345 (or (not (is-Intermediate!7543 lt!331802)) (bvslt x!1131 (x!63485 lt!331802)) (not (= x!1131 (x!63485 lt!331802))) (not (= index!1321 (index!32542 lt!331802)))))))

(assert (=> b!746595 e!416914))

(declare-fun res!503333 () Bool)

(assert (=> b!746595 (=> (not res!503333) (not e!416914))))

(assert (=> b!746595 (= res!503333 (= lt!331800 lt!331803))))

(assert (=> b!746595 (= lt!331803 (Found!7543 j!159))))

(assert (=> b!746595 (= lt!331800 (seekEntryOrOpen!0 (select (arr!19943 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746595 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25566 0))(
  ( (Unit!25567) )
))
(declare-fun lt!331804 () Unit!25566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25566)

(assert (=> b!746595 (= lt!331804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746596 () Bool)

(declare-fun res!503337 () Bool)

(assert (=> b!746596 (=> (not res!503337) (not e!416915))))

(assert (=> b!746596 (= res!503337 (and (= (size!20364 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20364 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20364 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746597 () Bool)

(assert (=> b!746597 (= e!416917 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19943 a!3186) j!159) a!3186 mask!3328) lt!331798))))

(declare-fun b!746598 () Bool)

(declare-fun res!503339 () Bool)

(assert (=> b!746598 (=> (not res!503339) (not e!416919))))

(assert (=> b!746598 (= res!503339 e!416917)))

(declare-fun c!82006 () Bool)

(assert (=> b!746598 (= c!82006 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65486 res!503332) b!746596))

(assert (= (and b!746596 res!503337) b!746586))

(assert (= (and b!746586 res!503336) b!746582))

(assert (= (and b!746582 res!503343) b!746591))

(assert (= (and b!746591 res!503335) b!746583))

(assert (= (and b!746583 res!503341) b!746593))

(assert (= (and b!746593 res!503340) b!746592))

(assert (= (and b!746592 res!503334) b!746587))

(assert (= (and b!746587 res!503330) b!746584))

(assert (= (and b!746584 res!503331) b!746588))

(assert (= (and b!746588 res!503338) b!746598))

(assert (= (and b!746598 c!82006) b!746597))

(assert (= (and b!746598 (not c!82006)) b!746594))

(assert (= (and b!746598 res!503339) b!746585))

(assert (= (and b!746585 res!503344) b!746595))

(assert (= (and b!746595 res!503333) b!746581))

(assert (= (and b!746595 (not res!503345)) b!746590))

(assert (= (and b!746590 (not res!503342)) b!746589))

(declare-fun m!696823 () Bool)

(assert (=> b!746595 m!696823))

(assert (=> b!746595 m!696823))

(declare-fun m!696825 () Bool)

(assert (=> b!746595 m!696825))

(declare-fun m!696827 () Bool)

(assert (=> b!746595 m!696827))

(declare-fun m!696829 () Bool)

(assert (=> b!746595 m!696829))

(assert (=> b!746586 m!696823))

(assert (=> b!746586 m!696823))

(declare-fun m!696831 () Bool)

(assert (=> b!746586 m!696831))

(declare-fun m!696833 () Bool)

(assert (=> b!746591 m!696833))

(declare-fun m!696835 () Bool)

(assert (=> b!746592 m!696835))

(declare-fun m!696837 () Bool)

(assert (=> b!746585 m!696837))

(declare-fun m!696839 () Bool)

(assert (=> b!746585 m!696839))

(declare-fun m!696841 () Bool)

(assert (=> b!746585 m!696841))

(assert (=> b!746585 m!696841))

(declare-fun m!696843 () Bool)

(assert (=> b!746585 m!696843))

(declare-fun m!696845 () Bool)

(assert (=> b!746585 m!696845))

(declare-fun m!696847 () Bool)

(assert (=> b!746593 m!696847))

(assert (=> b!746584 m!696823))

(assert (=> b!746584 m!696823))

(declare-fun m!696849 () Bool)

(assert (=> b!746584 m!696849))

(assert (=> b!746584 m!696849))

(assert (=> b!746584 m!696823))

(declare-fun m!696851 () Bool)

(assert (=> b!746584 m!696851))

(declare-fun m!696853 () Bool)

(assert (=> b!746588 m!696853))

(declare-fun m!696855 () Bool)

(assert (=> b!746582 m!696855))

(declare-fun m!696857 () Bool)

(assert (=> b!746583 m!696857))

(assert (=> b!746590 m!696837))

(declare-fun m!696859 () Bool)

(assert (=> b!746590 m!696859))

(assert (=> b!746590 m!696823))

(assert (=> b!746590 m!696823))

(declare-fun m!696861 () Bool)

(assert (=> b!746590 m!696861))

(assert (=> b!746594 m!696823))

(assert (=> b!746594 m!696823))

(assert (=> b!746594 m!696861))

(assert (=> b!746597 m!696823))

(assert (=> b!746597 m!696823))

(declare-fun m!696863 () Bool)

(assert (=> b!746597 m!696863))

(assert (=> b!746581 m!696823))

(assert (=> b!746581 m!696823))

(declare-fun m!696865 () Bool)

(assert (=> b!746581 m!696865))

(declare-fun m!696867 () Bool)

(assert (=> start!65486 m!696867))

(declare-fun m!696869 () Bool)

(assert (=> start!65486 m!696869))

(push 1)

(assert (not b!746584))

(assert (not b!746595))

(assert (not b!746586))

(assert (not b!746585))

(assert (not b!746591))

(assert (not start!65486))

(assert (not b!746597))

(assert (not b!746582))

(assert (not b!746592))

(assert (not b!746581))

(assert (not b!746594))

(assert (not b!746590))

(assert (not b!746593))

(assert (not b!746583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

