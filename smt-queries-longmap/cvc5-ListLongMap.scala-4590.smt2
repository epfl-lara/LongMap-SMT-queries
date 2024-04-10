; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64054 () Bool)

(assert start!64054)

(declare-fun b!719365 () Bool)

(declare-fun res!481762 () Bool)

(declare-fun e!403677 () Bool)

(assert (=> b!719365 (=> (not res!481762) (not e!403677))))

(declare-datatypes ((array!40749 0))(
  ( (array!40750 (arr!19500 (Array (_ BitVec 32) (_ BitVec 64))) (size!19921 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40749)

(declare-datatypes ((List!13502 0))(
  ( (Nil!13499) (Cons!13498 (h!14546 (_ BitVec 64)) (t!19817 List!13502)) )
))
(declare-fun arrayNoDuplicates!0 (array!40749 (_ BitVec 32) List!13502) Bool)

(assert (=> b!719365 (= res!481762 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13499))))

(declare-fun b!719366 () Bool)

(declare-fun res!481761 () Bool)

(assert (=> b!719366 (=> (not res!481761) (not e!403677))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719366 (= res!481761 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19921 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19921 a!3186))))))

(declare-fun b!719367 () Bool)

(declare-fun res!481764 () Bool)

(declare-fun e!403678 () Bool)

(assert (=> b!719367 (=> (not res!481764) (not e!403678))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719367 (= res!481764 (validKeyInArray!0 (select (arr!19500 a!3186) j!159)))))

(declare-fun res!481765 () Bool)

(assert (=> start!64054 (=> (not res!481765) (not e!403678))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64054 (= res!481765 (validMask!0 mask!3328))))

(assert (=> start!64054 e!403678))

(assert (=> start!64054 true))

(declare-fun array_inv!15296 (array!40749) Bool)

(assert (=> start!64054 (array_inv!15296 a!3186)))

(declare-fun b!719368 () Bool)

(assert (=> b!719368 (= e!403677 false)))

(declare-datatypes ((SeekEntryResult!7100 0))(
  ( (MissingZero!7100 (index!30768 (_ BitVec 32))) (Found!7100 (index!30769 (_ BitVec 32))) (Intermediate!7100 (undefined!7912 Bool) (index!30770 (_ BitVec 32)) (x!61779 (_ BitVec 32))) (Undefined!7100) (MissingVacant!7100 (index!30771 (_ BitVec 32))) )
))
(declare-fun lt!319585 () SeekEntryResult!7100)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40749 (_ BitVec 32)) SeekEntryResult!7100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719368 (= lt!319585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19500 a!3186) j!159) mask!3328) (select (arr!19500 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719369 () Bool)

(declare-fun res!481758 () Bool)

(assert (=> b!719369 (=> (not res!481758) (not e!403678))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719369 (= res!481758 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719370 () Bool)

(declare-fun res!481759 () Bool)

(assert (=> b!719370 (=> (not res!481759) (not e!403677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40749 (_ BitVec 32)) Bool)

(assert (=> b!719370 (= res!481759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719371 () Bool)

(declare-fun res!481763 () Bool)

(assert (=> b!719371 (=> (not res!481763) (not e!403678))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719371 (= res!481763 (and (= (size!19921 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19921 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19921 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719372 () Bool)

(declare-fun res!481766 () Bool)

(assert (=> b!719372 (=> (not res!481766) (not e!403678))))

(assert (=> b!719372 (= res!481766 (validKeyInArray!0 k!2102))))

(declare-fun b!719373 () Bool)

(assert (=> b!719373 (= e!403678 e!403677)))

(declare-fun res!481760 () Bool)

(assert (=> b!719373 (=> (not res!481760) (not e!403677))))

(declare-fun lt!319586 () SeekEntryResult!7100)

(assert (=> b!719373 (= res!481760 (or (= lt!319586 (MissingZero!7100 i!1173)) (= lt!319586 (MissingVacant!7100 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40749 (_ BitVec 32)) SeekEntryResult!7100)

(assert (=> b!719373 (= lt!319586 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64054 res!481765) b!719371))

(assert (= (and b!719371 res!481763) b!719367))

(assert (= (and b!719367 res!481764) b!719372))

(assert (= (and b!719372 res!481766) b!719369))

(assert (= (and b!719369 res!481758) b!719373))

(assert (= (and b!719373 res!481760) b!719370))

(assert (= (and b!719370 res!481759) b!719365))

(assert (= (and b!719365 res!481762) b!719366))

(assert (= (and b!719366 res!481761) b!719368))

(declare-fun m!674785 () Bool)

(assert (=> start!64054 m!674785))

(declare-fun m!674787 () Bool)

(assert (=> start!64054 m!674787))

(declare-fun m!674789 () Bool)

(assert (=> b!719365 m!674789))

(declare-fun m!674791 () Bool)

(assert (=> b!719373 m!674791))

(declare-fun m!674793 () Bool)

(assert (=> b!719367 m!674793))

(assert (=> b!719367 m!674793))

(declare-fun m!674795 () Bool)

(assert (=> b!719367 m!674795))

(declare-fun m!674797 () Bool)

(assert (=> b!719369 m!674797))

(declare-fun m!674799 () Bool)

(assert (=> b!719370 m!674799))

(assert (=> b!719368 m!674793))

(assert (=> b!719368 m!674793))

(declare-fun m!674801 () Bool)

(assert (=> b!719368 m!674801))

(assert (=> b!719368 m!674801))

(assert (=> b!719368 m!674793))

(declare-fun m!674803 () Bool)

(assert (=> b!719368 m!674803))

(declare-fun m!674805 () Bool)

(assert (=> b!719372 m!674805))

(push 1)

