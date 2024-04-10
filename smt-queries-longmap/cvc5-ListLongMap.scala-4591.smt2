; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64060 () Bool)

(assert start!64060)

(declare-fun b!719448 () Bool)

(declare-fun res!481846 () Bool)

(declare-fun e!403706 () Bool)

(assert (=> b!719448 (=> (not res!481846) (not e!403706))))

(declare-datatypes ((array!40755 0))(
  ( (array!40756 (arr!19503 (Array (_ BitVec 32) (_ BitVec 64))) (size!19924 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40755)

(declare-datatypes ((List!13505 0))(
  ( (Nil!13502) (Cons!13501 (h!14549 (_ BitVec 64)) (t!19820 List!13505)) )
))
(declare-fun arrayNoDuplicates!0 (array!40755 (_ BitVec 32) List!13505) Bool)

(assert (=> b!719448 (= res!481846 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13502))))

(declare-fun res!481850 () Bool)

(declare-fun e!403705 () Bool)

(assert (=> start!64060 (=> (not res!481850) (not e!403705))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64060 (= res!481850 (validMask!0 mask!3328))))

(assert (=> start!64060 e!403705))

(assert (=> start!64060 true))

(declare-fun array_inv!15299 (array!40755) Bool)

(assert (=> start!64060 (array_inv!15299 a!3186)))

(declare-fun b!719449 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719449 (= e!403706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19503 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!719450 () Bool)

(declare-fun res!481845 () Bool)

(assert (=> b!719450 (=> (not res!481845) (not e!403705))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719450 (= res!481845 (validKeyInArray!0 (select (arr!19503 a!3186) j!159)))))

(declare-fun b!719451 () Bool)

(declare-fun res!481849 () Bool)

(assert (=> b!719451 (=> (not res!481849) (not e!403705))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!719451 (= res!481849 (validKeyInArray!0 k!2102))))

(declare-fun b!719452 () Bool)

(declare-fun res!481841 () Bool)

(assert (=> b!719452 (=> (not res!481841) (not e!403705))))

(assert (=> b!719452 (= res!481841 (and (= (size!19924 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19924 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19924 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719453 () Bool)

(declare-fun res!481844 () Bool)

(assert (=> b!719453 (=> (not res!481844) (not e!403706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40755 (_ BitVec 32)) Bool)

(assert (=> b!719453 (= res!481844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719454 () Bool)

(declare-fun res!481842 () Bool)

(assert (=> b!719454 (=> (not res!481842) (not e!403706))))

(declare-datatypes ((SeekEntryResult!7103 0))(
  ( (MissingZero!7103 (index!30780 (_ BitVec 32))) (Found!7103 (index!30781 (_ BitVec 32))) (Intermediate!7103 (undefined!7915 Bool) (index!30782 (_ BitVec 32)) (x!61790 (_ BitVec 32))) (Undefined!7103) (MissingVacant!7103 (index!30783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40755 (_ BitVec 32)) SeekEntryResult!7103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719454 (= res!481842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19503 a!3186) j!159) mask!3328) (select (arr!19503 a!3186) j!159) a!3186 mask!3328) (Intermediate!7103 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719455 () Bool)

(declare-fun res!481843 () Bool)

(assert (=> b!719455 (=> (not res!481843) (not e!403705))))

(declare-fun arrayContainsKey!0 (array!40755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719455 (= res!481843 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719456 () Bool)

(declare-fun res!481848 () Bool)

(assert (=> b!719456 (=> (not res!481848) (not e!403706))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719456 (= res!481848 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19924 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19924 a!3186))))))

(declare-fun b!719457 () Bool)

(assert (=> b!719457 (= e!403705 e!403706)))

(declare-fun res!481847 () Bool)

(assert (=> b!719457 (=> (not res!481847) (not e!403706))))

(declare-fun lt!319601 () SeekEntryResult!7103)

(assert (=> b!719457 (= res!481847 (or (= lt!319601 (MissingZero!7103 i!1173)) (= lt!319601 (MissingVacant!7103 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40755 (_ BitVec 32)) SeekEntryResult!7103)

(assert (=> b!719457 (= lt!319601 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64060 res!481850) b!719452))

(assert (= (and b!719452 res!481841) b!719450))

(assert (= (and b!719450 res!481845) b!719451))

(assert (= (and b!719451 res!481849) b!719455))

(assert (= (and b!719455 res!481843) b!719457))

(assert (= (and b!719457 res!481847) b!719453))

(assert (= (and b!719453 res!481844) b!719448))

(assert (= (and b!719448 res!481846) b!719456))

(assert (= (and b!719456 res!481848) b!719454))

(assert (= (and b!719454 res!481842) b!719449))

(declare-fun m!674851 () Bool)

(assert (=> b!719454 m!674851))

(assert (=> b!719454 m!674851))

(declare-fun m!674853 () Bool)

(assert (=> b!719454 m!674853))

(assert (=> b!719454 m!674853))

(assert (=> b!719454 m!674851))

(declare-fun m!674855 () Bool)

(assert (=> b!719454 m!674855))

(declare-fun m!674857 () Bool)

(assert (=> b!719448 m!674857))

(declare-fun m!674859 () Bool)

(assert (=> b!719451 m!674859))

(declare-fun m!674861 () Bool)

(assert (=> b!719457 m!674861))

(declare-fun m!674863 () Bool)

(assert (=> b!719453 m!674863))

(assert (=> b!719450 m!674851))

(assert (=> b!719450 m!674851))

(declare-fun m!674865 () Bool)

(assert (=> b!719450 m!674865))

(declare-fun m!674867 () Bool)

(assert (=> b!719455 m!674867))

(declare-fun m!674869 () Bool)

(assert (=> b!719449 m!674869))

(declare-fun m!674871 () Bool)

(assert (=> start!64060 m!674871))

(declare-fun m!674873 () Bool)

(assert (=> start!64060 m!674873))

(push 1)

