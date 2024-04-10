; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67464 () Bool)

(assert start!67464)

(declare-fun b!780589 () Bool)

(declare-fun res!528166 () Bool)

(declare-fun e!434213 () Bool)

(assert (=> b!780589 (=> (not res!528166) (not e!434213))))

(declare-datatypes ((array!42630 0))(
  ( (array!42631 (arr!20406 (Array (_ BitVec 32) (_ BitVec 64))) (size!20827 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42630)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780589 (= res!528166 (validKeyInArray!0 (select (arr!20406 a!3186) j!159)))))

(declare-fun b!780590 () Bool)

(declare-fun res!528168 () Bool)

(declare-fun e!434212 () Bool)

(assert (=> b!780590 (=> res!528168 e!434212)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8006 0))(
  ( (MissingZero!8006 (index!34392 (_ BitVec 32))) (Found!8006 (index!34393 (_ BitVec 32))) (Intermediate!8006 (undefined!8818 Bool) (index!34394 (_ BitVec 32)) (x!65344 (_ BitVec 32))) (Undefined!8006) (MissingVacant!8006 (index!34395 (_ BitVec 32))) )
))
(declare-fun lt!347857 () SeekEntryResult!8006)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42630 (_ BitVec 32)) SeekEntryResult!8006)

(assert (=> b!780590 (= res!528168 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20406 a!3186) j!159) a!3186 mask!3328) lt!347857)))))

(declare-fun b!780591 () Bool)

(declare-fun res!528169 () Bool)

(declare-fun e!434208 () Bool)

(assert (=> b!780591 (=> (not res!528169) (not e!434208))))

(declare-datatypes ((List!14408 0))(
  ( (Nil!14405) (Cons!14404 (h!15521 (_ BitVec 64)) (t!20723 List!14408)) )
))
(declare-fun arrayNoDuplicates!0 (array!42630 (_ BitVec 32) List!14408) Bool)

(assert (=> b!780591 (= res!528169 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14405))))

(declare-fun b!780592 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!434211 () Bool)

(assert (=> b!780592 (= e!434211 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20406 a!3186) j!159) a!3186 mask!3328) lt!347857))))

(declare-fun b!780593 () Bool)

(declare-datatypes ((Unit!26912 0))(
  ( (Unit!26913) )
))
(declare-fun e!434210 () Unit!26912)

(declare-fun Unit!26914 () Unit!26912)

(assert (=> b!780593 (= e!434210 Unit!26914)))

(declare-fun b!780594 () Bool)

(declare-fun e!434207 () Bool)

(assert (=> b!780594 (= e!434207 (not e!434212))))

(declare-fun res!528158 () Bool)

(assert (=> b!780594 (=> res!528158 e!434212)))

(declare-fun lt!347860 () SeekEntryResult!8006)

(assert (=> b!780594 (= res!528158 (or (not (is-Intermediate!8006 lt!347860)) (bvslt x!1131 (x!65344 lt!347860)) (not (= x!1131 (x!65344 lt!347860))) (not (= index!1321 (index!34394 lt!347860)))))))

(assert (=> b!780594 e!434211))

(declare-fun res!528165 () Bool)

(assert (=> b!780594 (=> (not res!528165) (not e!434211))))

(declare-fun lt!347858 () SeekEntryResult!8006)

(assert (=> b!780594 (= res!528165 (= lt!347858 lt!347857))))

(assert (=> b!780594 (= lt!347857 (Found!8006 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42630 (_ BitVec 32)) SeekEntryResult!8006)

(assert (=> b!780594 (= lt!347858 (seekEntryOrOpen!0 (select (arr!20406 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42630 (_ BitVec 32)) Bool)

(assert (=> b!780594 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347859 () Unit!26912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26912)

(assert (=> b!780594 (= lt!347859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780595 () Bool)

(declare-fun res!528161 () Bool)

(declare-fun e!434209 () Bool)

(assert (=> b!780595 (=> (not res!528161) (not e!434209))))

(declare-fun e!434206 () Bool)

(assert (=> b!780595 (= res!528161 e!434206)))

(declare-fun c!86623 () Bool)

(assert (=> b!780595 (= c!86623 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!528156 () Bool)

(assert (=> start!67464 (=> (not res!528156) (not e!434213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67464 (= res!528156 (validMask!0 mask!3328))))

(assert (=> start!67464 e!434213))

(assert (=> start!67464 true))

(declare-fun array_inv!16202 (array!42630) Bool)

(assert (=> start!67464 (array_inv!16202 a!3186)))

(declare-fun b!780596 () Bool)

(declare-fun res!528159 () Bool)

(assert (=> b!780596 (=> (not res!528159) (not e!434213))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780596 (= res!528159 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780597 () Bool)

(declare-fun res!528155 () Bool)

(assert (=> b!780597 (=> (not res!528155) (not e!434208))))

(assert (=> b!780597 (= res!528155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780598 () Bool)

(declare-fun Unit!26915 () Unit!26912)

(assert (=> b!780598 (= e!434210 Unit!26915)))

(assert (=> b!780598 false))

(declare-fun b!780599 () Bool)

(declare-fun res!528157 () Bool)

(assert (=> b!780599 (=> (not res!528157) (not e!434208))))

(assert (=> b!780599 (= res!528157 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20827 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20827 a!3186))))))

(declare-fun b!780600 () Bool)

(assert (=> b!780600 (= e!434213 e!434208)))

(declare-fun res!528163 () Bool)

(assert (=> b!780600 (=> (not res!528163) (not e!434208))))

(declare-fun lt!347855 () SeekEntryResult!8006)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780600 (= res!528163 (or (= lt!347855 (MissingZero!8006 i!1173)) (= lt!347855 (MissingVacant!8006 i!1173))))))

(assert (=> b!780600 (= lt!347855 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780601 () Bool)

(declare-fun res!528160 () Bool)

(assert (=> b!780601 (=> (not res!528160) (not e!434213))))

(assert (=> b!780601 (= res!528160 (and (= (size!20827 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20827 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20827 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780602 () Bool)

(assert (=> b!780602 (= e!434209 e!434207)))

(declare-fun res!528170 () Bool)

(assert (=> b!780602 (=> (not res!528170) (not e!434207))))

(declare-fun lt!347856 () SeekEntryResult!8006)

(assert (=> b!780602 (= res!528170 (= lt!347856 lt!347860))))

(declare-fun lt!347864 () array!42630)

(declare-fun lt!347862 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42630 (_ BitVec 32)) SeekEntryResult!8006)

(assert (=> b!780602 (= lt!347860 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347862 lt!347864 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780602 (= lt!347856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347862 mask!3328) lt!347862 lt!347864 mask!3328))))

(assert (=> b!780602 (= lt!347862 (select (store (arr!20406 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780602 (= lt!347864 (array!42631 (store (arr!20406 a!3186) i!1173 k!2102) (size!20827 a!3186)))))

(declare-fun b!780603 () Bool)

(declare-fun res!528167 () Bool)

(assert (=> b!780603 (=> (not res!528167) (not e!434209))))

(assert (=> b!780603 (= res!528167 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20406 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780604 () Bool)

(assert (=> b!780604 (= e!434208 e!434209)))

(declare-fun res!528154 () Bool)

(assert (=> b!780604 (=> (not res!528154) (not e!434209))))

(declare-fun lt!347863 () SeekEntryResult!8006)

(assert (=> b!780604 (= res!528154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20406 a!3186) j!159) mask!3328) (select (arr!20406 a!3186) j!159) a!3186 mask!3328) lt!347863))))

(assert (=> b!780604 (= lt!347863 (Intermediate!8006 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780605 () Bool)

(assert (=> b!780605 (= e!434206 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20406 a!3186) j!159) a!3186 mask!3328) (Found!8006 j!159)))))

(declare-fun b!780606 () Bool)

(assert (=> b!780606 (= e!434206 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20406 a!3186) j!159) a!3186 mask!3328) lt!347863))))

(declare-fun b!780607 () Bool)

(declare-fun res!528162 () Bool)

(assert (=> b!780607 (=> res!528162 e!434212)))

(assert (=> b!780607 (= res!528162 (= (select (store (arr!20406 a!3186) i!1173 k!2102) index!1321) lt!347862))))

(declare-fun b!780608 () Bool)

(assert (=> b!780608 (= e!434212 true)))

(declare-fun lt!347861 () Unit!26912)

(assert (=> b!780608 (= lt!347861 e!434210)))

(declare-fun c!86622 () Bool)

(assert (=> b!780608 (= c!86622 (= (select (store (arr!20406 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780609 () Bool)

(declare-fun res!528164 () Bool)

(assert (=> b!780609 (=> (not res!528164) (not e!434213))))

(assert (=> b!780609 (= res!528164 (validKeyInArray!0 k!2102))))

(assert (= (and start!67464 res!528156) b!780601))

(assert (= (and b!780601 res!528160) b!780589))

(assert (= (and b!780589 res!528166) b!780609))

(assert (= (and b!780609 res!528164) b!780596))

(assert (= (and b!780596 res!528159) b!780600))

(assert (= (and b!780600 res!528163) b!780597))

(assert (= (and b!780597 res!528155) b!780591))

(assert (= (and b!780591 res!528169) b!780599))

(assert (= (and b!780599 res!528157) b!780604))

(assert (= (and b!780604 res!528154) b!780603))

(assert (= (and b!780603 res!528167) b!780595))

(assert (= (and b!780595 c!86623) b!780606))

(assert (= (and b!780595 (not c!86623)) b!780605))

(assert (= (and b!780595 res!528161) b!780602))

(assert (= (and b!780602 res!528170) b!780594))

(assert (= (and b!780594 res!528165) b!780592))

(assert (= (and b!780594 (not res!528158)) b!780590))

(assert (= (and b!780590 (not res!528168)) b!780607))

(assert (= (and b!780607 (not res!528162)) b!780608))

(assert (= (and b!780608 c!86622) b!780598))

(assert (= (and b!780608 (not c!86622)) b!780593))

(declare-fun m!723857 () Bool)

(assert (=> b!780596 m!723857))

(declare-fun m!723859 () Bool)

(assert (=> b!780602 m!723859))

(declare-fun m!723861 () Bool)

(assert (=> b!780602 m!723861))

(declare-fun m!723863 () Bool)

(assert (=> b!780602 m!723863))

(assert (=> b!780602 m!723859))

(declare-fun m!723865 () Bool)

(assert (=> b!780602 m!723865))

(declare-fun m!723867 () Bool)

(assert (=> b!780602 m!723867))

(declare-fun m!723869 () Bool)

(assert (=> b!780603 m!723869))

(assert (=> b!780608 m!723863))

(declare-fun m!723871 () Bool)

(assert (=> b!780608 m!723871))

(declare-fun m!723873 () Bool)

(assert (=> b!780597 m!723873))

(declare-fun m!723875 () Bool)

(assert (=> b!780605 m!723875))

(assert (=> b!780605 m!723875))

(declare-fun m!723877 () Bool)

(assert (=> b!780605 m!723877))

(declare-fun m!723879 () Bool)

(assert (=> start!67464 m!723879))

(declare-fun m!723881 () Bool)

(assert (=> start!67464 m!723881))

(assert (=> b!780592 m!723875))

(assert (=> b!780592 m!723875))

(declare-fun m!723883 () Bool)

(assert (=> b!780592 m!723883))

(assert (=> b!780594 m!723875))

(assert (=> b!780594 m!723875))

(declare-fun m!723885 () Bool)

(assert (=> b!780594 m!723885))

(declare-fun m!723887 () Bool)

(assert (=> b!780594 m!723887))

(declare-fun m!723889 () Bool)

(assert (=> b!780594 m!723889))

(assert (=> b!780590 m!723875))

(assert (=> b!780590 m!723875))

(assert (=> b!780590 m!723877))

(assert (=> b!780606 m!723875))

(assert (=> b!780606 m!723875))

(declare-fun m!723891 () Bool)

(assert (=> b!780606 m!723891))

(assert (=> b!780604 m!723875))

(assert (=> b!780604 m!723875))

(declare-fun m!723893 () Bool)

(assert (=> b!780604 m!723893))

(assert (=> b!780604 m!723893))

(assert (=> b!780604 m!723875))

(declare-fun m!723895 () Bool)

(assert (=> b!780604 m!723895))

(assert (=> b!780607 m!723863))

(assert (=> b!780607 m!723871))

(assert (=> b!780589 m!723875))

(assert (=> b!780589 m!723875))

(declare-fun m!723897 () Bool)

(assert (=> b!780589 m!723897))

(declare-fun m!723899 () Bool)

(assert (=> b!780600 m!723899))

(declare-fun m!723901 () Bool)

(assert (=> b!780609 m!723901))

(declare-fun m!723903 () Bool)

(assert (=> b!780591 m!723903))

(push 1)

