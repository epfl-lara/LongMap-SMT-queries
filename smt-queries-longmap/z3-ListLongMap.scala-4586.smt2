; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64010 () Bool)

(assert start!64010)

(declare-fun b!718782 () Bool)

(declare-fun e!403417 () Bool)

(declare-fun e!403415 () Bool)

(assert (=> b!718782 (= e!403417 e!403415)))

(declare-fun res!481316 () Bool)

(assert (=> b!718782 (=> (not res!481316) (not e!403415))))

(declare-datatypes ((SeekEntryResult!7084 0))(
  ( (MissingZero!7084 (index!30704 (_ BitVec 32))) (Found!7084 (index!30705 (_ BitVec 32))) (Intermediate!7084 (undefined!7896 Bool) (index!30706 (_ BitVec 32)) (x!61726 (_ BitVec 32))) (Undefined!7084) (MissingVacant!7084 (index!30707 (_ BitVec 32))) )
))
(declare-fun lt!319282 () SeekEntryResult!7084)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718782 (= res!481316 (or (= lt!319282 (MissingZero!7084 i!1173)) (= lt!319282 (MissingVacant!7084 i!1173))))))

(declare-datatypes ((array!40722 0))(
  ( (array!40723 (arr!19487 (Array (_ BitVec 32) (_ BitVec 64))) (size!19908 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40722)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40722 (_ BitVec 32)) SeekEntryResult!7084)

(assert (=> b!718782 (= lt!319282 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718783 () Bool)

(declare-fun res!481323 () Bool)

(assert (=> b!718783 (=> (not res!481323) (not e!403417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718783 (= res!481323 (validKeyInArray!0 k0!2102))))

(declare-fun b!718784 () Bool)

(declare-fun res!481315 () Bool)

(assert (=> b!718784 (=> (not res!481315) (not e!403417))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718784 (= res!481315 (and (= (size!19908 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19908 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19908 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718785 () Bool)

(declare-fun res!481321 () Bool)

(assert (=> b!718785 (=> (not res!481321) (not e!403417))))

(declare-fun arrayContainsKey!0 (array!40722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718785 (= res!481321 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718786 () Bool)

(declare-fun res!481320 () Bool)

(assert (=> b!718786 (=> (not res!481320) (not e!403415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40722 (_ BitVec 32)) Bool)

(assert (=> b!718786 (= res!481320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718787 () Bool)

(declare-fun res!481319 () Bool)

(assert (=> b!718787 (=> (not res!481319) (not e!403417))))

(assert (=> b!718787 (= res!481319 (validKeyInArray!0 (select (arr!19487 a!3186) j!159)))))

(declare-fun res!481322 () Bool)

(assert (=> start!64010 (=> (not res!481322) (not e!403417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64010 (= res!481322 (validMask!0 mask!3328))))

(assert (=> start!64010 e!403417))

(assert (=> start!64010 true))

(declare-fun array_inv!15370 (array!40722) Bool)

(assert (=> start!64010 (array_inv!15370 a!3186)))

(declare-fun b!718788 () Bool)

(declare-fun res!481318 () Bool)

(assert (=> b!718788 (=> (not res!481318) (not e!403415))))

(declare-datatypes ((List!13528 0))(
  ( (Nil!13525) (Cons!13524 (h!14572 (_ BitVec 64)) (t!19834 List!13528)) )
))
(declare-fun arrayNoDuplicates!0 (array!40722 (_ BitVec 32) List!13528) Bool)

(assert (=> b!718788 (= res!481318 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13525))))

(declare-fun b!718789 () Bool)

(declare-fun res!481317 () Bool)

(assert (=> b!718789 (=> (not res!481317) (not e!403415))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718789 (= res!481317 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19908 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19908 a!3186))))))

(declare-fun b!718790 () Bool)

(assert (=> b!718790 (= e!403415 false)))

(declare-fun lt!319283 () SeekEntryResult!7084)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40722 (_ BitVec 32)) SeekEntryResult!7084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718790 (= lt!319283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19487 a!3186) j!159) mask!3328) (select (arr!19487 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64010 res!481322) b!718784))

(assert (= (and b!718784 res!481315) b!718787))

(assert (= (and b!718787 res!481319) b!718783))

(assert (= (and b!718783 res!481323) b!718785))

(assert (= (and b!718785 res!481321) b!718782))

(assert (= (and b!718782 res!481316) b!718786))

(assert (= (and b!718786 res!481320) b!718788))

(assert (= (and b!718788 res!481318) b!718789))

(assert (= (and b!718789 res!481317) b!718790))

(declare-fun m!673757 () Bool)

(assert (=> b!718787 m!673757))

(assert (=> b!718787 m!673757))

(declare-fun m!673759 () Bool)

(assert (=> b!718787 m!673759))

(declare-fun m!673761 () Bool)

(assert (=> b!718786 m!673761))

(assert (=> b!718790 m!673757))

(assert (=> b!718790 m!673757))

(declare-fun m!673763 () Bool)

(assert (=> b!718790 m!673763))

(assert (=> b!718790 m!673763))

(assert (=> b!718790 m!673757))

(declare-fun m!673765 () Bool)

(assert (=> b!718790 m!673765))

(declare-fun m!673767 () Bool)

(assert (=> b!718783 m!673767))

(declare-fun m!673769 () Bool)

(assert (=> start!64010 m!673769))

(declare-fun m!673771 () Bool)

(assert (=> start!64010 m!673771))

(declare-fun m!673773 () Bool)

(assert (=> b!718782 m!673773))

(declare-fun m!673775 () Bool)

(assert (=> b!718788 m!673775))

(declare-fun m!673777 () Bool)

(assert (=> b!718785 m!673777))

(check-sat (not b!718786) (not b!718788) (not b!718785) (not b!718783) (not b!718790) (not start!64010) (not b!718782) (not b!718787))
(check-sat)
