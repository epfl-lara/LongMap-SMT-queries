; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64064 () Bool)

(assert start!64064)

(declare-fun b!719508 () Bool)

(declare-fun res!481903 () Bool)

(declare-fun e!403723 () Bool)

(assert (=> b!719508 (=> (not res!481903) (not e!403723))))

(declare-datatypes ((array!40759 0))(
  ( (array!40760 (arr!19505 (Array (_ BitVec 32) (_ BitVec 64))) (size!19926 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40759)

(declare-datatypes ((List!13507 0))(
  ( (Nil!13504) (Cons!13503 (h!14551 (_ BitVec 64)) (t!19822 List!13507)) )
))
(declare-fun arrayNoDuplicates!0 (array!40759 (_ BitVec 32) List!13507) Bool)

(assert (=> b!719508 (= res!481903 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13504))))

(declare-fun b!719509 () Bool)

(declare-fun e!403724 () Bool)

(assert (=> b!719509 (= e!403724 e!403723)))

(declare-fun res!481905 () Bool)

(assert (=> b!719509 (=> (not res!481905) (not e!403723))))

(declare-datatypes ((SeekEntryResult!7105 0))(
  ( (MissingZero!7105 (index!30788 (_ BitVec 32))) (Found!7105 (index!30789 (_ BitVec 32))) (Intermediate!7105 (undefined!7917 Bool) (index!30790 (_ BitVec 32)) (x!61792 (_ BitVec 32))) (Undefined!7105) (MissingVacant!7105 (index!30791 (_ BitVec 32))) )
))
(declare-fun lt!319607 () SeekEntryResult!7105)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719509 (= res!481905 (or (= lt!319607 (MissingZero!7105 i!1173)) (= lt!319607 (MissingVacant!7105 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40759 (_ BitVec 32)) SeekEntryResult!7105)

(assert (=> b!719509 (= lt!319607 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719510 () Bool)

(declare-fun res!481907 () Bool)

(assert (=> b!719510 (=> (not res!481907) (not e!403724))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719510 (= res!481907 (validKeyInArray!0 (select (arr!19505 a!3186) j!159)))))

(declare-fun b!719511 () Bool)

(declare-fun res!481908 () Bool)

(assert (=> b!719511 (=> (not res!481908) (not e!403724))))

(assert (=> b!719511 (= res!481908 (and (= (size!19926 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19926 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19926 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719512 () Bool)

(declare-fun res!481910 () Bool)

(assert (=> b!719512 (=> (not res!481910) (not e!403724))))

(declare-fun arrayContainsKey!0 (array!40759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719512 (= res!481910 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719513 () Bool)

(declare-fun res!481906 () Bool)

(assert (=> b!719513 (=> (not res!481906) (not e!403723))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40759 (_ BitVec 32)) SeekEntryResult!7105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719513 (= res!481906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19505 a!3186) j!159) mask!3328) (select (arr!19505 a!3186) j!159) a!3186 mask!3328) (Intermediate!7105 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719514 () Bool)

(declare-fun res!481904 () Bool)

(assert (=> b!719514 (=> (not res!481904) (not e!403723))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719514 (= res!481904 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19926 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19926 a!3186))))))

(declare-fun b!719515 () Bool)

(declare-fun res!481909 () Bool)

(assert (=> b!719515 (=> (not res!481909) (not e!403723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40759 (_ BitVec 32)) Bool)

(assert (=> b!719515 (= res!481909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719516 () Bool)

(declare-fun res!481902 () Bool)

(assert (=> b!719516 (=> (not res!481902) (not e!403724))))

(assert (=> b!719516 (= res!481902 (validKeyInArray!0 k!2102))))

(declare-fun b!719517 () Bool)

(assert (=> b!719517 (= e!403723 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19505 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun res!481901 () Bool)

(assert (=> start!64064 (=> (not res!481901) (not e!403724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64064 (= res!481901 (validMask!0 mask!3328))))

(assert (=> start!64064 e!403724))

(assert (=> start!64064 true))

(declare-fun array_inv!15301 (array!40759) Bool)

(assert (=> start!64064 (array_inv!15301 a!3186)))

(assert (= (and start!64064 res!481901) b!719511))

(assert (= (and b!719511 res!481908) b!719510))

(assert (= (and b!719510 res!481907) b!719516))

(assert (= (and b!719516 res!481902) b!719512))

(assert (= (and b!719512 res!481910) b!719509))

(assert (= (and b!719509 res!481905) b!719515))

(assert (= (and b!719515 res!481909) b!719508))

(assert (= (and b!719508 res!481903) b!719514))

(assert (= (and b!719514 res!481904) b!719513))

(assert (= (and b!719513 res!481906) b!719517))

(declare-fun m!674899 () Bool)

(assert (=> b!719515 m!674899))

(declare-fun m!674901 () Bool)

(assert (=> b!719517 m!674901))

(declare-fun m!674903 () Bool)

(assert (=> b!719509 m!674903))

(declare-fun m!674905 () Bool)

(assert (=> start!64064 m!674905))

(declare-fun m!674907 () Bool)

(assert (=> start!64064 m!674907))

(declare-fun m!674909 () Bool)

(assert (=> b!719513 m!674909))

(assert (=> b!719513 m!674909))

(declare-fun m!674911 () Bool)

(assert (=> b!719513 m!674911))

(assert (=> b!719513 m!674911))

(assert (=> b!719513 m!674909))

(declare-fun m!674913 () Bool)

(assert (=> b!719513 m!674913))

(declare-fun m!674915 () Bool)

(assert (=> b!719516 m!674915))

(declare-fun m!674917 () Bool)

(assert (=> b!719508 m!674917))

(declare-fun m!674919 () Bool)

(assert (=> b!719512 m!674919))

(assert (=> b!719510 m!674909))

(assert (=> b!719510 m!674909))

(declare-fun m!674921 () Bool)

(assert (=> b!719510 m!674921))

(push 1)

(assert (not b!719512))

(assert (not b!719510))

(assert (not b!719515))

(assert (not b!719513))

(assert (not b!719508))

(assert (not start!64064))

(assert (not b!719516))

(assert (not b!719509))

(check-sat)

(pop 1)

