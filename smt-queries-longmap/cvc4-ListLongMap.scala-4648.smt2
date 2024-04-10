; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64664 () Bool)

(assert start!64664)

(declare-fun b!728686 () Bool)

(declare-fun res!489185 () Bool)

(declare-fun e!407891 () Bool)

(assert (=> b!728686 (=> (not res!489185) (not e!407891))))

(declare-datatypes ((array!41113 0))(
  ( (array!41114 (arr!19676 (Array (_ BitVec 32) (_ BitVec 64))) (size!20097 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41113)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41113 (_ BitVec 32)) Bool)

(assert (=> b!728686 (= res!489185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728687 () Bool)

(declare-fun res!489187 () Bool)

(assert (=> b!728687 (=> (not res!489187) (not e!407891))))

(declare-datatypes ((List!13678 0))(
  ( (Nil!13675) (Cons!13674 (h!14734 (_ BitVec 64)) (t!19993 List!13678)) )
))
(declare-fun arrayNoDuplicates!0 (array!41113 (_ BitVec 32) List!13678) Bool)

(assert (=> b!728687 (= res!489187 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13675))))

(declare-fun b!728688 () Bool)

(declare-fun e!407892 () Bool)

(declare-fun e!407889 () Bool)

(assert (=> b!728688 (= e!407892 e!407889)))

(declare-fun res!489173 () Bool)

(assert (=> b!728688 (=> (not res!489173) (not e!407889))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7276 0))(
  ( (MissingZero!7276 (index!31472 (_ BitVec 32))) (Found!7276 (index!31473 (_ BitVec 32))) (Intermediate!7276 (undefined!8088 Bool) (index!31474 (_ BitVec 32)) (x!62458 (_ BitVec 32))) (Undefined!7276) (MissingVacant!7276 (index!31475 (_ BitVec 32))) )
))
(declare-fun lt!322786 () SeekEntryResult!7276)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!728688 (= res!489173 (= (seekEntryOrOpen!0 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322786))))

(assert (=> b!728688 (= lt!322786 (Found!7276 j!159))))

(declare-fun b!728690 () Bool)

(declare-fun e!407887 () Bool)

(assert (=> b!728690 (= e!407887 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!322790 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728690 (= lt!322790 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728691 () Bool)

(declare-fun res!489176 () Bool)

(declare-fun e!407890 () Bool)

(assert (=> b!728691 (=> (not res!489176) (not e!407890))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728691 (= res!489176 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19676 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728692 () Bool)

(declare-fun res!489178 () Bool)

(declare-fun e!407894 () Bool)

(assert (=> b!728692 (=> (not res!489178) (not e!407894))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728692 (= res!489178 (validKeyInArray!0 k!2102))))

(declare-fun lt!322787 () SeekEntryResult!7276)

(declare-fun b!728693 () Bool)

(declare-fun e!407893 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!728693 (= e!407893 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322787))))

(declare-fun b!728694 () Bool)

(declare-fun e!407888 () Bool)

(assert (=> b!728694 (= e!407890 e!407888)))

(declare-fun res!489182 () Bool)

(assert (=> b!728694 (=> (not res!489182) (not e!407888))))

(declare-fun lt!322785 () SeekEntryResult!7276)

(declare-fun lt!322793 () SeekEntryResult!7276)

(assert (=> b!728694 (= res!489182 (= lt!322785 lt!322793))))

(declare-fun lt!322791 () (_ BitVec 64))

(declare-fun lt!322789 () array!41113)

(assert (=> b!728694 (= lt!322793 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322791 lt!322789 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728694 (= lt!322785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322791 mask!3328) lt!322791 lt!322789 mask!3328))))

(assert (=> b!728694 (= lt!322791 (select (store (arr!19676 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728694 (= lt!322789 (array!41114 (store (arr!19676 a!3186) i!1173 k!2102) (size!20097 a!3186)))))

(declare-fun b!728695 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!728695 (= e!407889 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322786))))

(declare-fun b!728696 () Bool)

(assert (=> b!728696 (= e!407891 e!407890)))

(declare-fun res!489186 () Bool)

(assert (=> b!728696 (=> (not res!489186) (not e!407890))))

(assert (=> b!728696 (= res!489186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19676 a!3186) j!159) mask!3328) (select (arr!19676 a!3186) j!159) a!3186 mask!3328) lt!322787))))

(assert (=> b!728696 (= lt!322787 (Intermediate!7276 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728697 () Bool)

(assert (=> b!728697 (= e!407893 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19676 a!3186) j!159) a!3186 mask!3328) (Found!7276 j!159)))))

(declare-fun b!728698 () Bool)

(declare-fun res!489181 () Bool)

(assert (=> b!728698 (=> (not res!489181) (not e!407890))))

(assert (=> b!728698 (= res!489181 e!407893)))

(declare-fun c!80131 () Bool)

(assert (=> b!728698 (= c!80131 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728699 () Bool)

(assert (=> b!728699 (= e!407888 (not e!407887))))

(declare-fun res!489175 () Bool)

(assert (=> b!728699 (=> res!489175 e!407887)))

(assert (=> b!728699 (= res!489175 (or (not (is-Intermediate!7276 lt!322793)) (bvsge x!1131 (x!62458 lt!322793))))))

(assert (=> b!728699 e!407892))

(declare-fun res!489183 () Bool)

(assert (=> b!728699 (=> (not res!489183) (not e!407892))))

(assert (=> b!728699 (= res!489183 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24870 0))(
  ( (Unit!24871) )
))
(declare-fun lt!322788 () Unit!24870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24870)

(assert (=> b!728699 (= lt!322788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728700 () Bool)

(declare-fun res!489180 () Bool)

(assert (=> b!728700 (=> (not res!489180) (not e!407894))))

(assert (=> b!728700 (= res!489180 (and (= (size!20097 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20097 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20097 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728701 () Bool)

(declare-fun res!489179 () Bool)

(assert (=> b!728701 (=> (not res!489179) (not e!407894))))

(declare-fun arrayContainsKey!0 (array!41113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728701 (= res!489179 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728689 () Bool)

(declare-fun res!489184 () Bool)

(assert (=> b!728689 (=> (not res!489184) (not e!407891))))

(assert (=> b!728689 (= res!489184 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20097 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20097 a!3186))))))

(declare-fun res!489174 () Bool)

(assert (=> start!64664 (=> (not res!489174) (not e!407894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64664 (= res!489174 (validMask!0 mask!3328))))

(assert (=> start!64664 e!407894))

(assert (=> start!64664 true))

(declare-fun array_inv!15472 (array!41113) Bool)

(assert (=> start!64664 (array_inv!15472 a!3186)))

(declare-fun b!728702 () Bool)

(declare-fun res!489177 () Bool)

(assert (=> b!728702 (=> (not res!489177) (not e!407894))))

(assert (=> b!728702 (= res!489177 (validKeyInArray!0 (select (arr!19676 a!3186) j!159)))))

(declare-fun b!728703 () Bool)

(assert (=> b!728703 (= e!407894 e!407891)))

(declare-fun res!489188 () Bool)

(assert (=> b!728703 (=> (not res!489188) (not e!407891))))

(declare-fun lt!322792 () SeekEntryResult!7276)

(assert (=> b!728703 (= res!489188 (or (= lt!322792 (MissingZero!7276 i!1173)) (= lt!322792 (MissingVacant!7276 i!1173))))))

(assert (=> b!728703 (= lt!322792 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64664 res!489174) b!728700))

(assert (= (and b!728700 res!489180) b!728702))

(assert (= (and b!728702 res!489177) b!728692))

(assert (= (and b!728692 res!489178) b!728701))

(assert (= (and b!728701 res!489179) b!728703))

(assert (= (and b!728703 res!489188) b!728686))

(assert (= (and b!728686 res!489185) b!728687))

(assert (= (and b!728687 res!489187) b!728689))

(assert (= (and b!728689 res!489184) b!728696))

(assert (= (and b!728696 res!489186) b!728691))

(assert (= (and b!728691 res!489176) b!728698))

(assert (= (and b!728698 c!80131) b!728693))

(assert (= (and b!728698 (not c!80131)) b!728697))

(assert (= (and b!728698 res!489181) b!728694))

(assert (= (and b!728694 res!489182) b!728699))

(assert (= (and b!728699 res!489183) b!728688))

(assert (= (and b!728688 res!489173) b!728695))

(assert (= (and b!728699 (not res!489175)) b!728690))

(declare-fun m!682411 () Bool)

(assert (=> b!728693 m!682411))

(assert (=> b!728693 m!682411))

(declare-fun m!682413 () Bool)

(assert (=> b!728693 m!682413))

(declare-fun m!682415 () Bool)

(assert (=> b!728703 m!682415))

(assert (=> b!728695 m!682411))

(assert (=> b!728695 m!682411))

(declare-fun m!682417 () Bool)

(assert (=> b!728695 m!682417))

(declare-fun m!682419 () Bool)

(assert (=> start!64664 m!682419))

(declare-fun m!682421 () Bool)

(assert (=> start!64664 m!682421))

(assert (=> b!728697 m!682411))

(assert (=> b!728697 m!682411))

(declare-fun m!682423 () Bool)

(assert (=> b!728697 m!682423))

(declare-fun m!682425 () Bool)

(assert (=> b!728690 m!682425))

(declare-fun m!682427 () Bool)

(assert (=> b!728687 m!682427))

(assert (=> b!728696 m!682411))

(assert (=> b!728696 m!682411))

(declare-fun m!682429 () Bool)

(assert (=> b!728696 m!682429))

(assert (=> b!728696 m!682429))

(assert (=> b!728696 m!682411))

(declare-fun m!682431 () Bool)

(assert (=> b!728696 m!682431))

(declare-fun m!682433 () Bool)

(assert (=> b!728699 m!682433))

(declare-fun m!682435 () Bool)

(assert (=> b!728699 m!682435))

(declare-fun m!682437 () Bool)

(assert (=> b!728691 m!682437))

(declare-fun m!682439 () Bool)

(assert (=> b!728694 m!682439))

(declare-fun m!682441 () Bool)

(assert (=> b!728694 m!682441))

(declare-fun m!682443 () Bool)

(assert (=> b!728694 m!682443))

(assert (=> b!728694 m!682443))

(declare-fun m!682445 () Bool)

(assert (=> b!728694 m!682445))

(declare-fun m!682447 () Bool)

(assert (=> b!728694 m!682447))

(declare-fun m!682449 () Bool)

(assert (=> b!728701 m!682449))

(declare-fun m!682451 () Bool)

(assert (=> b!728692 m!682451))

(assert (=> b!728702 m!682411))

(assert (=> b!728702 m!682411))

(declare-fun m!682453 () Bool)

(assert (=> b!728702 m!682453))

(assert (=> b!728688 m!682411))

(assert (=> b!728688 m!682411))

(declare-fun m!682455 () Bool)

(assert (=> b!728688 m!682455))

(declare-fun m!682457 () Bool)

(assert (=> b!728686 m!682457))

(push 1)

