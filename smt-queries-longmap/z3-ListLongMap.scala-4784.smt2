; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65744 () Bool)

(assert start!65744)

(declare-fun b!755521 () Bool)

(declare-fun e!421298 () Bool)

(declare-fun e!421299 () Bool)

(assert (=> b!755521 (= e!421298 e!421299)))

(declare-fun res!510792 () Bool)

(assert (=> b!755521 (=> (not res!510792) (not e!421299))))

(declare-datatypes ((SeekEntryResult!7678 0))(
  ( (MissingZero!7678 (index!33080 (_ BitVec 32))) (Found!7678 (index!33081 (_ BitVec 32))) (Intermediate!7678 (undefined!8490 Bool) (index!33082 (_ BitVec 32)) (x!63991 (_ BitVec 32))) (Undefined!7678) (MissingVacant!7678 (index!33083 (_ BitVec 32))) )
))
(declare-fun lt!336202 () SeekEntryResult!7678)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755521 (= res!510792 (or (= lt!336202 (MissingZero!7678 i!1173)) (= lt!336202 (MissingVacant!7678 i!1173))))))

(declare-datatypes ((array!41934 0))(
  ( (array!41935 (arr!20081 (Array (_ BitVec 32) (_ BitVec 64))) (size!20502 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41934)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41934 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!755521 (= lt!336202 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755522 () Bool)

(declare-fun res!510781 () Bool)

(assert (=> b!755522 (=> (not res!510781) (not e!421298))))

(declare-fun arrayContainsKey!0 (array!41934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755522 (= res!510781 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!336209 () SeekEntryResult!7678)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!755523 () Bool)

(declare-fun e!421297 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41934 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!755523 (= e!421297 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336209))))

(declare-fun b!755524 () Bool)

(declare-datatypes ((Unit!26072 0))(
  ( (Unit!26073) )
))
(declare-fun e!421294 () Unit!26072)

(declare-fun Unit!26074 () Unit!26072)

(assert (=> b!755524 (= e!421294 Unit!26074)))

(assert (=> b!755524 false))

(declare-fun b!755525 () Bool)

(declare-fun res!510785 () Bool)

(assert (=> b!755525 (=> (not res!510785) (not e!421298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755525 (= res!510785 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!755526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41934 (_ BitVec 32)) SeekEntryResult!7678)

(assert (=> b!755526 (= e!421297 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) (Found!7678 j!159)))))

(declare-fun b!755527 () Bool)

(declare-fun res!510797 () Bool)

(assert (=> b!755527 (=> (not res!510797) (not e!421299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41934 (_ BitVec 32)) Bool)

(assert (=> b!755527 (= res!510797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755528 () Bool)

(declare-fun res!510780 () Bool)

(assert (=> b!755528 (=> (not res!510780) (not e!421299))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755528 (= res!510780 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20502 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20502 a!3186))))))

(declare-fun b!755529 () Bool)

(declare-fun res!510787 () Bool)

(assert (=> b!755529 (=> (not res!510787) (not e!421298))))

(assert (=> b!755529 (= res!510787 (and (= (size!20502 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20502 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20502 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755530 () Bool)

(declare-fun e!421293 () Bool)

(declare-fun e!421303 () Bool)

(assert (=> b!755530 (= e!421293 e!421303)))

(declare-fun res!510794 () Bool)

(assert (=> b!755530 (=> res!510794 e!421303)))

(declare-fun lt!336199 () SeekEntryResult!7678)

(declare-fun lt!336201 () SeekEntryResult!7678)

(assert (=> b!755530 (= res!510794 (not (= lt!336199 lt!336201)))))

(assert (=> b!755530 (= lt!336199 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755531 () Bool)

(declare-fun res!510782 () Bool)

(declare-fun e!421302 () Bool)

(assert (=> b!755531 (=> (not res!510782) (not e!421302))))

(assert (=> b!755531 (= res!510782 e!421297)))

(declare-fun c!82752 () Bool)

(assert (=> b!755531 (= c!82752 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755532 () Bool)

(declare-fun e!421300 () Bool)

(assert (=> b!755532 (= e!421300 true)))

(declare-fun e!421296 () Bool)

(assert (=> b!755532 e!421296))

(declare-fun res!510798 () Bool)

(assert (=> b!755532 (=> (not res!510798) (not e!421296))))

(declare-fun lt!336208 () (_ BitVec 64))

(assert (=> b!755532 (= res!510798 (= lt!336208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336198 () Unit!26072)

(assert (=> b!755532 (= lt!336198 e!421294)))

(declare-fun c!82751 () Bool)

(assert (=> b!755532 (= c!82751 (= lt!336208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755533 () Bool)

(declare-fun e!421295 () Bool)

(assert (=> b!755533 (= e!421302 e!421295)))

(declare-fun res!510796 () Bool)

(assert (=> b!755533 (=> (not res!510796) (not e!421295))))

(declare-fun lt!336207 () SeekEntryResult!7678)

(declare-fun lt!336200 () SeekEntryResult!7678)

(assert (=> b!755533 (= res!510796 (= lt!336207 lt!336200))))

(declare-fun lt!336203 () array!41934)

(declare-fun lt!336206 () (_ BitVec 64))

(assert (=> b!755533 (= lt!336200 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336206 lt!336203 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755533 (= lt!336207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336206 mask!3328) lt!336206 lt!336203 mask!3328))))

(assert (=> b!755533 (= lt!336206 (select (store (arr!20081 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755533 (= lt!336203 (array!41935 (store (arr!20081 a!3186) i!1173 k0!2102) (size!20502 a!3186)))))

(declare-fun b!755534 () Bool)

(assert (=> b!755534 (= e!421295 (not e!421293))))

(declare-fun res!510788 () Bool)

(assert (=> b!755534 (=> res!510788 e!421293)))

(get-info :version)

(assert (=> b!755534 (= res!510788 (or (not ((_ is Intermediate!7678) lt!336200)) (bvslt x!1131 (x!63991 lt!336200)) (not (= x!1131 (x!63991 lt!336200))) (not (= index!1321 (index!33082 lt!336200)))))))

(declare-fun e!421292 () Bool)

(assert (=> b!755534 e!421292))

(declare-fun res!510784 () Bool)

(assert (=> b!755534 (=> (not res!510784) (not e!421292))))

(declare-fun lt!336205 () SeekEntryResult!7678)

(assert (=> b!755534 (= res!510784 (= lt!336205 lt!336201))))

(assert (=> b!755534 (= lt!336201 (Found!7678 j!159))))

(assert (=> b!755534 (= lt!336205 (seekEntryOrOpen!0 (select (arr!20081 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755534 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336204 () Unit!26072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26072)

(assert (=> b!755534 (= lt!336204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755535 () Bool)

(declare-fun res!510786 () Bool)

(assert (=> b!755535 (=> (not res!510786) (not e!421296))))

(assert (=> b!755535 (= res!510786 (= (seekEntryOrOpen!0 lt!336206 lt!336203 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336206 lt!336203 mask!3328)))))

(declare-fun b!755536 () Bool)

(assert (=> b!755536 (= e!421292 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336201))))

(declare-fun b!755537 () Bool)

(assert (=> b!755537 (= e!421299 e!421302)))

(declare-fun res!510795 () Bool)

(assert (=> b!755537 (=> (not res!510795) (not e!421302))))

(assert (=> b!755537 (= res!510795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20081 a!3186) j!159) mask!3328) (select (arr!20081 a!3186) j!159) a!3186 mask!3328) lt!336209))))

(assert (=> b!755537 (= lt!336209 (Intermediate!7678 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755538 () Bool)

(declare-fun res!510789 () Bool)

(assert (=> b!755538 (=> (not res!510789) (not e!421302))))

(assert (=> b!755538 (= res!510789 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20081 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!510783 () Bool)

(assert (=> start!65744 (=> (not res!510783) (not e!421298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65744 (= res!510783 (validMask!0 mask!3328))))

(assert (=> start!65744 e!421298))

(assert (=> start!65744 true))

(declare-fun array_inv!15964 (array!41934) Bool)

(assert (=> start!65744 (array_inv!15964 a!3186)))

(declare-fun b!755539 () Bool)

(assert (=> b!755539 (= e!421303 e!421300)))

(declare-fun res!510790 () Bool)

(assert (=> b!755539 (=> res!510790 e!421300)))

(assert (=> b!755539 (= res!510790 (= lt!336208 lt!336206))))

(assert (=> b!755539 (= lt!336208 (select (store (arr!20081 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755540 () Bool)

(declare-fun Unit!26075 () Unit!26072)

(assert (=> b!755540 (= e!421294 Unit!26075)))

(declare-fun b!755541 () Bool)

(declare-fun res!510793 () Bool)

(assert (=> b!755541 (=> (not res!510793) (not e!421299))))

(declare-datatypes ((List!14122 0))(
  ( (Nil!14119) (Cons!14118 (h!15190 (_ BitVec 64)) (t!20428 List!14122)) )
))
(declare-fun arrayNoDuplicates!0 (array!41934 (_ BitVec 32) List!14122) Bool)

(assert (=> b!755541 (= res!510793 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14119))))

(declare-fun b!755542 () Bool)

(declare-fun res!510791 () Bool)

(assert (=> b!755542 (=> (not res!510791) (not e!421298))))

(assert (=> b!755542 (= res!510791 (validKeyInArray!0 (select (arr!20081 a!3186) j!159)))))

(declare-fun b!755543 () Bool)

(assert (=> b!755543 (= e!421296 (= lt!336205 lt!336199))))

(assert (= (and start!65744 res!510783) b!755529))

(assert (= (and b!755529 res!510787) b!755542))

(assert (= (and b!755542 res!510791) b!755525))

(assert (= (and b!755525 res!510785) b!755522))

(assert (= (and b!755522 res!510781) b!755521))

(assert (= (and b!755521 res!510792) b!755527))

(assert (= (and b!755527 res!510797) b!755541))

(assert (= (and b!755541 res!510793) b!755528))

(assert (= (and b!755528 res!510780) b!755537))

(assert (= (and b!755537 res!510795) b!755538))

(assert (= (and b!755538 res!510789) b!755531))

(assert (= (and b!755531 c!82752) b!755523))

(assert (= (and b!755531 (not c!82752)) b!755526))

(assert (= (and b!755531 res!510782) b!755533))

(assert (= (and b!755533 res!510796) b!755534))

(assert (= (and b!755534 res!510784) b!755536))

(assert (= (and b!755534 (not res!510788)) b!755530))

(assert (= (and b!755530 (not res!510794)) b!755539))

(assert (= (and b!755539 (not res!510790)) b!755532))

(assert (= (and b!755532 c!82751) b!755524))

(assert (= (and b!755532 (not c!82751)) b!755540))

(assert (= (and b!755532 res!510798) b!755535))

(assert (= (and b!755535 res!510786) b!755543))

(declare-fun m!703133 () Bool)

(assert (=> b!755538 m!703133))

(declare-fun m!703135 () Bool)

(assert (=> b!755534 m!703135))

(assert (=> b!755534 m!703135))

(declare-fun m!703137 () Bool)

(assert (=> b!755534 m!703137))

(declare-fun m!703139 () Bool)

(assert (=> b!755534 m!703139))

(declare-fun m!703141 () Bool)

(assert (=> b!755534 m!703141))

(declare-fun m!703143 () Bool)

(assert (=> b!755522 m!703143))

(assert (=> b!755536 m!703135))

(assert (=> b!755536 m!703135))

(declare-fun m!703145 () Bool)

(assert (=> b!755536 m!703145))

(assert (=> b!755523 m!703135))

(assert (=> b!755523 m!703135))

(declare-fun m!703147 () Bool)

(assert (=> b!755523 m!703147))

(assert (=> b!755530 m!703135))

(assert (=> b!755530 m!703135))

(declare-fun m!703149 () Bool)

(assert (=> b!755530 m!703149))

(declare-fun m!703151 () Bool)

(assert (=> b!755541 m!703151))

(assert (=> b!755526 m!703135))

(assert (=> b!755526 m!703135))

(assert (=> b!755526 m!703149))

(declare-fun m!703153 () Bool)

(assert (=> b!755535 m!703153))

(declare-fun m!703155 () Bool)

(assert (=> b!755535 m!703155))

(declare-fun m!703157 () Bool)

(assert (=> b!755521 m!703157))

(declare-fun m!703159 () Bool)

(assert (=> b!755525 m!703159))

(assert (=> b!755542 m!703135))

(assert (=> b!755542 m!703135))

(declare-fun m!703161 () Bool)

(assert (=> b!755542 m!703161))

(declare-fun m!703163 () Bool)

(assert (=> b!755533 m!703163))

(declare-fun m!703165 () Bool)

(assert (=> b!755533 m!703165))

(declare-fun m!703167 () Bool)

(assert (=> b!755533 m!703167))

(declare-fun m!703169 () Bool)

(assert (=> b!755533 m!703169))

(assert (=> b!755533 m!703163))

(declare-fun m!703171 () Bool)

(assert (=> b!755533 m!703171))

(declare-fun m!703173 () Bool)

(assert (=> start!65744 m!703173))

(declare-fun m!703175 () Bool)

(assert (=> start!65744 m!703175))

(declare-fun m!703177 () Bool)

(assert (=> b!755527 m!703177))

(assert (=> b!755539 m!703167))

(declare-fun m!703179 () Bool)

(assert (=> b!755539 m!703179))

(assert (=> b!755537 m!703135))

(assert (=> b!755537 m!703135))

(declare-fun m!703181 () Bool)

(assert (=> b!755537 m!703181))

(assert (=> b!755537 m!703181))

(assert (=> b!755537 m!703135))

(declare-fun m!703183 () Bool)

(assert (=> b!755537 m!703183))

(check-sat (not b!755526) (not b!755534) (not b!755527) (not b!755525) (not b!755530) (not b!755523) (not b!755542) (not start!65744) (not b!755533) (not b!755537) (not b!755521) (not b!755522) (not b!755535) (not b!755541) (not b!755536))
(check-sat)
