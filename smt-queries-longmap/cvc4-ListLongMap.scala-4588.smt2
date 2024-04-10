; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64046 () Bool)

(assert start!64046)

(declare-fun b!719257 () Bool)

(declare-fun res!481652 () Bool)

(declare-fun e!403642 () Bool)

(assert (=> b!719257 (=> (not res!481652) (not e!403642))))

(declare-datatypes ((array!40741 0))(
  ( (array!40742 (arr!19496 (Array (_ BitVec 32) (_ BitVec 64))) (size!19917 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40741)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40741 (_ BitVec 32)) Bool)

(assert (=> b!719257 (= res!481652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719258 () Bool)

(declare-fun res!481650 () Bool)

(declare-fun e!403641 () Bool)

(assert (=> b!719258 (=> (not res!481650) (not e!403641))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719258 (= res!481650 (validKeyInArray!0 k!2102))))

(declare-fun b!719259 () Bool)

(declare-fun res!481654 () Bool)

(assert (=> b!719259 (=> (not res!481654) (not e!403641))))

(declare-fun arrayContainsKey!0 (array!40741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719259 (= res!481654 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481655 () Bool)

(assert (=> start!64046 (=> (not res!481655) (not e!403641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64046 (= res!481655 (validMask!0 mask!3328))))

(assert (=> start!64046 e!403641))

(assert (=> start!64046 true))

(declare-fun array_inv!15292 (array!40741) Bool)

(assert (=> start!64046 (array_inv!15292 a!3186)))

(declare-fun b!719260 () Bool)

(declare-fun res!481657 () Bool)

(assert (=> b!719260 (=> (not res!481657) (not e!403642))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719260 (= res!481657 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19917 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19917 a!3186))))))

(declare-fun b!719261 () Bool)

(declare-fun res!481656 () Bool)

(assert (=> b!719261 (=> (not res!481656) (not e!403641))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719261 (= res!481656 (and (= (size!19917 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19917 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19917 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719262 () Bool)

(declare-fun res!481651 () Bool)

(assert (=> b!719262 (=> (not res!481651) (not e!403641))))

(assert (=> b!719262 (= res!481651 (validKeyInArray!0 (select (arr!19496 a!3186) j!159)))))

(declare-fun b!719263 () Bool)

(assert (=> b!719263 (= e!403641 e!403642)))

(declare-fun res!481658 () Bool)

(assert (=> b!719263 (=> (not res!481658) (not e!403642))))

(declare-datatypes ((SeekEntryResult!7096 0))(
  ( (MissingZero!7096 (index!30752 (_ BitVec 32))) (Found!7096 (index!30753 (_ BitVec 32))) (Intermediate!7096 (undefined!7908 Bool) (index!30754 (_ BitVec 32)) (x!61759 (_ BitVec 32))) (Undefined!7096) (MissingVacant!7096 (index!30755 (_ BitVec 32))) )
))
(declare-fun lt!319561 () SeekEntryResult!7096)

(assert (=> b!719263 (= res!481658 (or (= lt!319561 (MissingZero!7096 i!1173)) (= lt!319561 (MissingVacant!7096 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40741 (_ BitVec 32)) SeekEntryResult!7096)

(assert (=> b!719263 (= lt!319561 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719264 () Bool)

(assert (=> b!719264 (= e!403642 false)))

(declare-fun lt!319562 () SeekEntryResult!7096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40741 (_ BitVec 32)) SeekEntryResult!7096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719264 (= lt!319562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19496 a!3186) j!159) mask!3328) (select (arr!19496 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719265 () Bool)

(declare-fun res!481653 () Bool)

(assert (=> b!719265 (=> (not res!481653) (not e!403642))))

(declare-datatypes ((List!13498 0))(
  ( (Nil!13495) (Cons!13494 (h!14542 (_ BitVec 64)) (t!19813 List!13498)) )
))
(declare-fun arrayNoDuplicates!0 (array!40741 (_ BitVec 32) List!13498) Bool)

(assert (=> b!719265 (= res!481653 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13495))))

(assert (= (and start!64046 res!481655) b!719261))

(assert (= (and b!719261 res!481656) b!719262))

(assert (= (and b!719262 res!481651) b!719258))

(assert (= (and b!719258 res!481650) b!719259))

(assert (= (and b!719259 res!481654) b!719263))

(assert (= (and b!719263 res!481658) b!719257))

(assert (= (and b!719257 res!481652) b!719265))

(assert (= (and b!719265 res!481653) b!719260))

(assert (= (and b!719260 res!481657) b!719264))

(declare-fun m!674697 () Bool)

(assert (=> b!719263 m!674697))

(declare-fun m!674699 () Bool)

(assert (=> b!719262 m!674699))

(assert (=> b!719262 m!674699))

(declare-fun m!674701 () Bool)

(assert (=> b!719262 m!674701))

(declare-fun m!674703 () Bool)

(assert (=> start!64046 m!674703))

(declare-fun m!674705 () Bool)

(assert (=> start!64046 m!674705))

(declare-fun m!674707 () Bool)

(assert (=> b!719258 m!674707))

(declare-fun m!674709 () Bool)

(assert (=> b!719265 m!674709))

(declare-fun m!674711 () Bool)

(assert (=> b!719257 m!674711))

(assert (=> b!719264 m!674699))

(assert (=> b!719264 m!674699))

(declare-fun m!674713 () Bool)

(assert (=> b!719264 m!674713))

(assert (=> b!719264 m!674713))

(assert (=> b!719264 m!674699))

(declare-fun m!674715 () Bool)

(assert (=> b!719264 m!674715))

(declare-fun m!674717 () Bool)

(assert (=> b!719259 m!674717))

(push 1)

