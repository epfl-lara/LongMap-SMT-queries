; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64034 () Bool)

(assert start!64034)

(declare-fun b!719115 () Bool)

(declare-fun res!481652 () Bool)

(declare-fun e!403525 () Bool)

(assert (=> b!719115 (=> (not res!481652) (not e!403525))))

(declare-datatypes ((array!40746 0))(
  ( (array!40747 (arr!19499 (Array (_ BitVec 32) (_ BitVec 64))) (size!19920 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40746)

(declare-datatypes ((List!13540 0))(
  ( (Nil!13537) (Cons!13536 (h!14584 (_ BitVec 64)) (t!19846 List!13540)) )
))
(declare-fun arrayNoDuplicates!0 (array!40746 (_ BitVec 32) List!13540) Bool)

(assert (=> b!719115 (= res!481652 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13537))))

(declare-fun b!719116 () Bool)

(declare-fun e!403523 () Bool)

(assert (=> b!719116 (= e!403523 e!403525)))

(declare-fun res!481653 () Bool)

(assert (=> b!719116 (=> (not res!481653) (not e!403525))))

(declare-datatypes ((SeekEntryResult!7096 0))(
  ( (MissingZero!7096 (index!30752 (_ BitVec 32))) (Found!7096 (index!30753 (_ BitVec 32))) (Intermediate!7096 (undefined!7908 Bool) (index!30754 (_ BitVec 32)) (x!61770 (_ BitVec 32))) (Undefined!7096) (MissingVacant!7096 (index!30755 (_ BitVec 32))) )
))
(declare-fun lt!319345 () SeekEntryResult!7096)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719116 (= res!481653 (or (= lt!319345 (MissingZero!7096 i!1173)) (= lt!319345 (MissingVacant!7096 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40746 (_ BitVec 32)) SeekEntryResult!7096)

(assert (=> b!719116 (= lt!319345 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719118 () Bool)

(declare-fun res!481656 () Bool)

(assert (=> b!719118 (=> (not res!481656) (not e!403525))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719118 (= res!481656 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19920 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19920 a!3186))))))

(declare-fun b!719119 () Bool)

(declare-fun res!481650 () Bool)

(assert (=> b!719119 (=> (not res!481650) (not e!403523))))

(declare-fun arrayContainsKey!0 (array!40746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719119 (= res!481650 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719120 () Bool)

(declare-fun res!481649 () Bool)

(assert (=> b!719120 (=> (not res!481649) (not e!403523))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719120 (= res!481649 (and (= (size!19920 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19920 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19920 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719121 () Bool)

(declare-fun res!481651 () Bool)

(assert (=> b!719121 (=> (not res!481651) (not e!403523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719121 (= res!481651 (validKeyInArray!0 k0!2102))))

(declare-fun b!719117 () Bool)

(declare-fun res!481655 () Bool)

(assert (=> b!719117 (=> (not res!481655) (not e!403525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40746 (_ BitVec 32)) Bool)

(assert (=> b!719117 (= res!481655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!481648 () Bool)

(assert (=> start!64034 (=> (not res!481648) (not e!403523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64034 (= res!481648 (validMask!0 mask!3328))))

(assert (=> start!64034 e!403523))

(assert (=> start!64034 true))

(declare-fun array_inv!15382 (array!40746) Bool)

(assert (=> start!64034 (array_inv!15382 a!3186)))

(declare-fun b!719122 () Bool)

(declare-fun res!481654 () Bool)

(assert (=> b!719122 (=> (not res!481654) (not e!403523))))

(assert (=> b!719122 (= res!481654 (validKeyInArray!0 (select (arr!19499 a!3186) j!159)))))

(declare-fun b!719123 () Bool)

(assert (=> b!719123 (= e!403525 false)))

(declare-fun lt!319346 () SeekEntryResult!7096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40746 (_ BitVec 32)) SeekEntryResult!7096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719123 (= lt!319346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19499 a!3186) j!159) mask!3328) (select (arr!19499 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64034 res!481648) b!719120))

(assert (= (and b!719120 res!481649) b!719122))

(assert (= (and b!719122 res!481654) b!719121))

(assert (= (and b!719121 res!481651) b!719119))

(assert (= (and b!719119 res!481650) b!719116))

(assert (= (and b!719116 res!481653) b!719117))

(assert (= (and b!719117 res!481655) b!719115))

(assert (= (and b!719115 res!481652) b!719118))

(assert (= (and b!719118 res!481656) b!719123))

(declare-fun m!674027 () Bool)

(assert (=> b!719121 m!674027))

(declare-fun m!674029 () Bool)

(assert (=> b!719116 m!674029))

(declare-fun m!674031 () Bool)

(assert (=> b!719123 m!674031))

(assert (=> b!719123 m!674031))

(declare-fun m!674033 () Bool)

(assert (=> b!719123 m!674033))

(assert (=> b!719123 m!674033))

(assert (=> b!719123 m!674031))

(declare-fun m!674035 () Bool)

(assert (=> b!719123 m!674035))

(declare-fun m!674037 () Bool)

(assert (=> b!719119 m!674037))

(assert (=> b!719122 m!674031))

(assert (=> b!719122 m!674031))

(declare-fun m!674039 () Bool)

(assert (=> b!719122 m!674039))

(declare-fun m!674041 () Bool)

(assert (=> b!719117 m!674041))

(declare-fun m!674043 () Bool)

(assert (=> start!64034 m!674043))

(declare-fun m!674045 () Bool)

(assert (=> start!64034 m!674045))

(declare-fun m!674047 () Bool)

(assert (=> b!719115 m!674047))

(check-sat (not b!719116) (not b!719121) (not b!719123) (not b!719122) (not start!64034) (not b!719117) (not b!719115) (not b!719119))
(check-sat)
