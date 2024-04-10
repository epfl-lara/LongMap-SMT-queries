; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64056 () Bool)

(assert start!64056)

(declare-fun b!719392 () Bool)

(declare-fun e!403688 () Bool)

(assert (=> b!719392 (= e!403688 false)))

(declare-datatypes ((array!40751 0))(
  ( (array!40752 (arr!19501 (Array (_ BitVec 32) (_ BitVec 64))) (size!19922 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40751)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7101 0))(
  ( (MissingZero!7101 (index!30772 (_ BitVec 32))) (Found!7101 (index!30773 (_ BitVec 32))) (Intermediate!7101 (undefined!7913 Bool) (index!30774 (_ BitVec 32)) (x!61780 (_ BitVec 32))) (Undefined!7101) (MissingVacant!7101 (index!30775 (_ BitVec 32))) )
))
(declare-fun lt!319591 () SeekEntryResult!7101)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40751 (_ BitVec 32)) SeekEntryResult!7101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719392 (= lt!319591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19501 a!3186) j!159) mask!3328) (select (arr!19501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719393 () Bool)

(declare-fun e!403687 () Bool)

(assert (=> b!719393 (= e!403687 e!403688)))

(declare-fun res!481785 () Bool)

(assert (=> b!719393 (=> (not res!481785) (not e!403688))))

(declare-fun lt!319592 () SeekEntryResult!7101)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719393 (= res!481785 (or (= lt!319592 (MissingZero!7101 i!1173)) (= lt!319592 (MissingVacant!7101 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40751 (_ BitVec 32)) SeekEntryResult!7101)

(assert (=> b!719393 (= lt!319592 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719394 () Bool)

(declare-fun res!481787 () Bool)

(assert (=> b!719394 (=> (not res!481787) (not e!403687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719394 (= res!481787 (validKeyInArray!0 k0!2102))))

(declare-fun b!719395 () Bool)

(declare-fun res!481788 () Bool)

(assert (=> b!719395 (=> (not res!481788) (not e!403687))))

(assert (=> b!719395 (= res!481788 (and (= (size!19922 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19922 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19922 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!481791 () Bool)

(assert (=> start!64056 (=> (not res!481791) (not e!403687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64056 (= res!481791 (validMask!0 mask!3328))))

(assert (=> start!64056 e!403687))

(assert (=> start!64056 true))

(declare-fun array_inv!15297 (array!40751) Bool)

(assert (=> start!64056 (array_inv!15297 a!3186)))

(declare-fun b!719396 () Bool)

(declare-fun res!481786 () Bool)

(assert (=> b!719396 (=> (not res!481786) (not e!403687))))

(assert (=> b!719396 (= res!481786 (validKeyInArray!0 (select (arr!19501 a!3186) j!159)))))

(declare-fun b!719397 () Bool)

(declare-fun res!481792 () Bool)

(assert (=> b!719397 (=> (not res!481792) (not e!403688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40751 (_ BitVec 32)) Bool)

(assert (=> b!719397 (= res!481792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719398 () Bool)

(declare-fun res!481793 () Bool)

(assert (=> b!719398 (=> (not res!481793) (not e!403687))))

(declare-fun arrayContainsKey!0 (array!40751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719398 (= res!481793 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719399 () Bool)

(declare-fun res!481789 () Bool)

(assert (=> b!719399 (=> (not res!481789) (not e!403688))))

(declare-datatypes ((List!13503 0))(
  ( (Nil!13500) (Cons!13499 (h!14547 (_ BitVec 64)) (t!19818 List!13503)) )
))
(declare-fun arrayNoDuplicates!0 (array!40751 (_ BitVec 32) List!13503) Bool)

(assert (=> b!719399 (= res!481789 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13500))))

(declare-fun b!719400 () Bool)

(declare-fun res!481790 () Bool)

(assert (=> b!719400 (=> (not res!481790) (not e!403688))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719400 (= res!481790 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19922 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19922 a!3186))))))

(assert (= (and start!64056 res!481791) b!719395))

(assert (= (and b!719395 res!481788) b!719396))

(assert (= (and b!719396 res!481786) b!719394))

(assert (= (and b!719394 res!481787) b!719398))

(assert (= (and b!719398 res!481793) b!719393))

(assert (= (and b!719393 res!481785) b!719397))

(assert (= (and b!719397 res!481792) b!719399))

(assert (= (and b!719399 res!481789) b!719400))

(assert (= (and b!719400 res!481790) b!719392))

(declare-fun m!674807 () Bool)

(assert (=> start!64056 m!674807))

(declare-fun m!674809 () Bool)

(assert (=> start!64056 m!674809))

(declare-fun m!674811 () Bool)

(assert (=> b!719399 m!674811))

(declare-fun m!674813 () Bool)

(assert (=> b!719397 m!674813))

(declare-fun m!674815 () Bool)

(assert (=> b!719393 m!674815))

(declare-fun m!674817 () Bool)

(assert (=> b!719394 m!674817))

(declare-fun m!674819 () Bool)

(assert (=> b!719396 m!674819))

(assert (=> b!719396 m!674819))

(declare-fun m!674821 () Bool)

(assert (=> b!719396 m!674821))

(assert (=> b!719392 m!674819))

(assert (=> b!719392 m!674819))

(declare-fun m!674823 () Bool)

(assert (=> b!719392 m!674823))

(assert (=> b!719392 m!674823))

(assert (=> b!719392 m!674819))

(declare-fun m!674825 () Bool)

(assert (=> b!719392 m!674825))

(declare-fun m!674827 () Bool)

(assert (=> b!719398 m!674827))

(check-sat (not b!719392) (not b!719399) (not b!719397) (not b!719394) (not b!719396) (not b!719398) (not start!64056) (not b!719393))
(check-sat)
