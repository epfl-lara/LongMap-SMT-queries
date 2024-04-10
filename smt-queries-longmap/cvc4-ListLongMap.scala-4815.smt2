; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66234 () Bool)

(assert start!66234)

(declare-fun b!762854 () Bool)

(declare-fun res!515914 () Bool)

(declare-fun e!425152 () Bool)

(assert (=> b!762854 (=> (not res!515914) (not e!425152))))

(declare-datatypes ((array!42139 0))(
  ( (array!42140 (arr!20177 (Array (_ BitVec 32) (_ BitVec 64))) (size!20598 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42139)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762854 (= res!515914 (and (= (size!20598 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20598 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20598 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762855 () Bool)

(declare-fun res!515921 () Bool)

(declare-fun e!425151 () Bool)

(assert (=> b!762855 (=> (not res!515921) (not e!425151))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!762855 (= res!515921 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20177 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762856 () Bool)

(declare-fun res!515913 () Bool)

(declare-fun e!425153 () Bool)

(assert (=> b!762856 (=> (not res!515913) (not e!425153))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762856 (= res!515913 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20598 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20598 a!3186))))))

(declare-fun res!515920 () Bool)

(assert (=> start!66234 (=> (not res!515920) (not e!425152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66234 (= res!515920 (validMask!0 mask!3328))))

(assert (=> start!66234 e!425152))

(assert (=> start!66234 true))

(declare-fun array_inv!15973 (array!42139) Bool)

(assert (=> start!66234 (array_inv!15973 a!3186)))

(declare-fun b!762857 () Bool)

(declare-fun res!515917 () Bool)

(assert (=> b!762857 (=> (not res!515917) (not e!425152))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762857 (= res!515917 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762858 () Bool)

(declare-fun res!515923 () Bool)

(assert (=> b!762858 (=> (not res!515923) (not e!425153))))

(declare-datatypes ((List!14179 0))(
  ( (Nil!14176) (Cons!14175 (h!15259 (_ BitVec 64)) (t!20494 List!14179)) )
))
(declare-fun arrayNoDuplicates!0 (array!42139 (_ BitVec 32) List!14179) Bool)

(assert (=> b!762858 (= res!515923 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14176))))

(declare-fun b!762859 () Bool)

(declare-fun e!425154 () Bool)

(declare-datatypes ((SeekEntryResult!7777 0))(
  ( (MissingZero!7777 (index!33476 (_ BitVec 32))) (Found!7777 (index!33477 (_ BitVec 32))) (Intermediate!7777 (undefined!8589 Bool) (index!33478 (_ BitVec 32)) (x!64381 (_ BitVec 32))) (Undefined!7777) (MissingVacant!7777 (index!33479 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!762859 (= e!425154 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20177 a!3186) j!159) a!3186 mask!3328) (Found!7777 j!159))))))

(declare-fun b!762860 () Bool)

(assert (=> b!762860 (= e!425153 e!425151)))

(declare-fun res!515919 () Bool)

(assert (=> b!762860 (=> (not res!515919) (not e!425151))))

(declare-fun lt!339666 () SeekEntryResult!7777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762860 (= res!515919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20177 a!3186) j!159) mask!3328) (select (arr!20177 a!3186) j!159) a!3186 mask!3328) lt!339666))))

(assert (=> b!762860 (= lt!339666 (Intermediate!7777 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762861 () Bool)

(declare-fun res!515915 () Bool)

(assert (=> b!762861 (=> (not res!515915) (not e!425152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762861 (= res!515915 (validKeyInArray!0 (select (arr!20177 a!3186) j!159)))))

(declare-fun b!762862 () Bool)

(declare-fun res!515922 () Bool)

(assert (=> b!762862 (=> (not res!515922) (not e!425152))))

(assert (=> b!762862 (= res!515922 (validKeyInArray!0 k!2102))))

(declare-fun b!762863 () Bool)

(assert (=> b!762863 (= e!425152 e!425153)))

(declare-fun res!515918 () Bool)

(assert (=> b!762863 (=> (not res!515918) (not e!425153))))

(declare-fun lt!339668 () SeekEntryResult!7777)

(assert (=> b!762863 (= res!515918 (or (= lt!339668 (MissingZero!7777 i!1173)) (= lt!339668 (MissingVacant!7777 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42139 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!762863 (= lt!339668 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762864 () Bool)

(declare-fun res!515916 () Bool)

(assert (=> b!762864 (=> (not res!515916) (not e!425153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42139 (_ BitVec 32)) Bool)

(assert (=> b!762864 (= res!515916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762865 () Bool)

(assert (=> b!762865 (= e!425154 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20177 a!3186) j!159) a!3186 mask!3328) lt!339666)))))

(declare-fun b!762866 () Bool)

(assert (=> b!762866 (= e!425151 false)))

(declare-fun lt!339667 () Bool)

(assert (=> b!762866 (= lt!339667 e!425154)))

(declare-fun c!83857 () Bool)

(assert (=> b!762866 (= c!83857 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66234 res!515920) b!762854))

(assert (= (and b!762854 res!515914) b!762861))

(assert (= (and b!762861 res!515915) b!762862))

(assert (= (and b!762862 res!515922) b!762857))

(assert (= (and b!762857 res!515917) b!762863))

(assert (= (and b!762863 res!515918) b!762864))

(assert (= (and b!762864 res!515916) b!762858))

(assert (= (and b!762858 res!515923) b!762856))

(assert (= (and b!762856 res!515913) b!762860))

(assert (= (and b!762860 res!515919) b!762855))

(assert (= (and b!762855 res!515921) b!762866))

(assert (= (and b!762866 c!83857) b!762865))

(assert (= (and b!762866 (not c!83857)) b!762859))

(declare-fun m!709487 () Bool)

(assert (=> b!762862 m!709487))

(declare-fun m!709489 () Bool)

(assert (=> b!762855 m!709489))

(declare-fun m!709491 () Bool)

(assert (=> b!762864 m!709491))

(declare-fun m!709493 () Bool)

(assert (=> start!66234 m!709493))

(declare-fun m!709495 () Bool)

(assert (=> start!66234 m!709495))

(declare-fun m!709497 () Bool)

(assert (=> b!762865 m!709497))

(assert (=> b!762865 m!709497))

(declare-fun m!709499 () Bool)

(assert (=> b!762865 m!709499))

(declare-fun m!709501 () Bool)

(assert (=> b!762863 m!709501))

(declare-fun m!709503 () Bool)

(assert (=> b!762857 m!709503))

(assert (=> b!762859 m!709497))

(assert (=> b!762859 m!709497))

(declare-fun m!709505 () Bool)

(assert (=> b!762859 m!709505))

(assert (=> b!762861 m!709497))

(assert (=> b!762861 m!709497))

(declare-fun m!709507 () Bool)

(assert (=> b!762861 m!709507))

(declare-fun m!709509 () Bool)

(assert (=> b!762858 m!709509))

(assert (=> b!762860 m!709497))

(assert (=> b!762860 m!709497))

(declare-fun m!709511 () Bool)

(assert (=> b!762860 m!709511))

(assert (=> b!762860 m!709511))

(assert (=> b!762860 m!709497))

(declare-fun m!709513 () Bool)

(assert (=> b!762860 m!709513))

(push 1)

(assert (not b!762862))

