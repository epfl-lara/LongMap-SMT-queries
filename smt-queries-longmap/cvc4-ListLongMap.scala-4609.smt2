; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64292 () Bool)

(assert start!64292)

(declare-fun b!722141 () Bool)

(declare-fun res!483903 () Bool)

(declare-fun e!404825 () Bool)

(assert (=> b!722141 (=> (not res!483903) (not e!404825))))

(declare-datatypes ((array!40873 0))(
  ( (array!40874 (arr!19559 (Array (_ BitVec 32) (_ BitVec 64))) (size!19980 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40873)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722141 (= res!483903 (validKeyInArray!0 (select (arr!19559 a!3186) j!159)))))

(declare-fun res!483895 () Bool)

(assert (=> start!64292 (=> (not res!483895) (not e!404825))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64292 (= res!483895 (validMask!0 mask!3328))))

(assert (=> start!64292 e!404825))

(assert (=> start!64292 true))

(declare-fun array_inv!15355 (array!40873) Bool)

(assert (=> start!64292 (array_inv!15355 a!3186)))

(declare-fun b!722142 () Bool)

(declare-fun res!483900 () Bool)

(assert (=> b!722142 (=> (not res!483900) (not e!404825))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!722142 (= res!483900 (validKeyInArray!0 k!2102))))

(declare-fun b!722143 () Bool)

(declare-fun res!483902 () Bool)

(assert (=> b!722143 (=> (not res!483902) (not e!404825))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722143 (= res!483902 (and (= (size!19980 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19980 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19980 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722144 () Bool)

(declare-fun res!483904 () Bool)

(declare-fun e!404822 () Bool)

(assert (=> b!722144 (=> (not res!483904) (not e!404822))))

(declare-datatypes ((List!13561 0))(
  ( (Nil!13558) (Cons!13557 (h!14611 (_ BitVec 64)) (t!19876 List!13561)) )
))
(declare-fun arrayNoDuplicates!0 (array!40873 (_ BitVec 32) List!13561) Bool)

(assert (=> b!722144 (= res!483904 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13558))))

(declare-fun b!722145 () Bool)

(declare-fun e!404821 () Bool)

(assert (=> b!722145 (= e!404822 e!404821)))

(declare-fun res!483899 () Bool)

(assert (=> b!722145 (=> (not res!483899) (not e!404821))))

(declare-datatypes ((SeekEntryResult!7159 0))(
  ( (MissingZero!7159 (index!31004 (_ BitVec 32))) (Found!7159 (index!31005 (_ BitVec 32))) (Intermediate!7159 (undefined!7971 Bool) (index!31006 (_ BitVec 32)) (x!62008 (_ BitVec 32))) (Undefined!7159) (MissingVacant!7159 (index!31007 (_ BitVec 32))) )
))
(declare-fun lt!320219 () SeekEntryResult!7159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40873 (_ BitVec 32)) SeekEntryResult!7159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722145 (= res!483899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19559 a!3186) j!159) mask!3328) (select (arr!19559 a!3186) j!159) a!3186 mask!3328) lt!320219))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722145 (= lt!320219 (Intermediate!7159 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722146 () Bool)

(declare-fun res!483897 () Bool)

(assert (=> b!722146 (=> (not res!483897) (not e!404822))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722146 (= res!483897 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19980 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19980 a!3186))))))

(declare-fun b!722147 () Bool)

(declare-fun res!483894 () Bool)

(assert (=> b!722147 (=> (not res!483894) (not e!404821))))

(assert (=> b!722147 (= res!483894 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19559 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722148 () Bool)

(assert (=> b!722148 (= e!404825 e!404822)))

(declare-fun res!483901 () Bool)

(assert (=> b!722148 (=> (not res!483901) (not e!404822))))

(declare-fun lt!320218 () SeekEntryResult!7159)

(assert (=> b!722148 (= res!483901 (or (= lt!320218 (MissingZero!7159 i!1173)) (= lt!320218 (MissingVacant!7159 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40873 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!722148 (= lt!320218 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!404824 () Bool)

(declare-fun b!722149 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40873 (_ BitVec 32)) SeekEntryResult!7159)

(assert (=> b!722149 (= e!404824 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19559 a!3186) j!159) a!3186 mask!3328) (Found!7159 j!159)))))

(declare-fun b!722150 () Bool)

(declare-fun res!483905 () Bool)

(assert (=> b!722150 (=> (not res!483905) (not e!404825))))

(declare-fun arrayContainsKey!0 (array!40873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722150 (= res!483905 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722151 () Bool)

(declare-fun res!483896 () Bool)

(assert (=> b!722151 (=> (not res!483896) (not e!404822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40873 (_ BitVec 32)) Bool)

(assert (=> b!722151 (= res!483896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722152 () Bool)

(assert (=> b!722152 (= e!404821 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722153 () Bool)

(declare-fun res!483898 () Bool)

(assert (=> b!722153 (=> (not res!483898) (not e!404821))))

(assert (=> b!722153 (= res!483898 e!404824)))

(declare-fun c!79495 () Bool)

(assert (=> b!722153 (= c!79495 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722154 () Bool)

(assert (=> b!722154 (= e!404824 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19559 a!3186) j!159) a!3186 mask!3328) lt!320219))))

(assert (= (and start!64292 res!483895) b!722143))

(assert (= (and b!722143 res!483902) b!722141))

(assert (= (and b!722141 res!483903) b!722142))

(assert (= (and b!722142 res!483900) b!722150))

(assert (= (and b!722150 res!483905) b!722148))

(assert (= (and b!722148 res!483901) b!722151))

(assert (= (and b!722151 res!483896) b!722144))

(assert (= (and b!722144 res!483904) b!722146))

(assert (= (and b!722146 res!483897) b!722145))

(assert (= (and b!722145 res!483899) b!722147))

(assert (= (and b!722147 res!483894) b!722153))

(assert (= (and b!722153 c!79495) b!722154))

(assert (= (and b!722153 (not c!79495)) b!722149))

(assert (= (and b!722153 res!483898) b!722152))

(declare-fun m!676749 () Bool)

(assert (=> b!722154 m!676749))

(assert (=> b!722154 m!676749))

(declare-fun m!676751 () Bool)

(assert (=> b!722154 m!676751))

(declare-fun m!676753 () Bool)

(assert (=> b!722151 m!676753))

(declare-fun m!676755 () Bool)

(assert (=> b!722147 m!676755))

(assert (=> b!722145 m!676749))

(assert (=> b!722145 m!676749))

(declare-fun m!676757 () Bool)

(assert (=> b!722145 m!676757))

(assert (=> b!722145 m!676757))

(assert (=> b!722145 m!676749))

(declare-fun m!676759 () Bool)

(assert (=> b!722145 m!676759))

(declare-fun m!676761 () Bool)

(assert (=> b!722150 m!676761))

(declare-fun m!676763 () Bool)

(assert (=> b!722142 m!676763))

(declare-fun m!676765 () Bool)

(assert (=> b!722144 m!676765))

(declare-fun m!676767 () Bool)

(assert (=> b!722148 m!676767))

(assert (=> b!722141 m!676749))

(assert (=> b!722141 m!676749))

(declare-fun m!676769 () Bool)

(assert (=> b!722141 m!676769))

(assert (=> b!722149 m!676749))

(assert (=> b!722149 m!676749))

(declare-fun m!676771 () Bool)

(assert (=> b!722149 m!676771))

(declare-fun m!676773 () Bool)

(assert (=> start!64292 m!676773))

(declare-fun m!676775 () Bool)

(assert (=> start!64292 m!676775))

(push 1)

(assert (not b!722145))

(assert (not b!722154))

(assert (not b!722141))

(assert (not b!722149))

(assert (not b!722150))

(assert (not b!722142))

(assert (not b!722144))

(assert (not b!722151))

(assert (not start!64292))

(assert (not b!722148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

