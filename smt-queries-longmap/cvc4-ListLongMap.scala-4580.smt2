; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63950 () Bool)

(assert start!63950)

(declare-fun b!718438 () Bool)

(declare-fun res!480925 () Bool)

(declare-fun e!403318 () Bool)

(assert (=> b!718438 (=> (not res!480925) (not e!403318))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718438 (= res!480925 (validKeyInArray!0 k!2102))))

(declare-fun b!718439 () Bool)

(declare-fun res!480922 () Bool)

(declare-fun e!403317 () Bool)

(assert (=> b!718439 (=> (not res!480922) (not e!403317))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40690 0))(
  ( (array!40691 (arr!19472 (Array (_ BitVec 32) (_ BitVec 64))) (size!19893 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40690)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718439 (= res!480922 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19893 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19893 a!3186))))))

(declare-fun b!718440 () Bool)

(declare-fun res!480923 () Bool)

(assert (=> b!718440 (=> (not res!480923) (not e!403317))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40690 (_ BitVec 32)) Bool)

(assert (=> b!718440 (= res!480923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718441 () Bool)

(assert (=> b!718441 (= e!403318 e!403317)))

(declare-fun res!480921 () Bool)

(assert (=> b!718441 (=> (not res!480921) (not e!403317))))

(declare-datatypes ((SeekEntryResult!7072 0))(
  ( (MissingZero!7072 (index!30656 (_ BitVec 32))) (Found!7072 (index!30657 (_ BitVec 32))) (Intermediate!7072 (undefined!7884 Bool) (index!30658 (_ BitVec 32)) (x!61668 (_ BitVec 32))) (Undefined!7072) (MissingVacant!7072 (index!30659 (_ BitVec 32))) )
))
(declare-fun lt!319363 () SeekEntryResult!7072)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718441 (= res!480921 (or (= lt!319363 (MissingZero!7072 i!1173)) (= lt!319363 (MissingVacant!7072 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40690 (_ BitVec 32)) SeekEntryResult!7072)

(assert (=> b!718441 (= lt!319363 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718443 () Bool)

(assert (=> b!718443 (= e!403317 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319364 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718443 (= lt!319364 (toIndex!0 (select (arr!19472 a!3186) j!159) mask!3328))))

(declare-fun b!718444 () Bool)

(declare-fun res!480920 () Bool)

(assert (=> b!718444 (=> (not res!480920) (not e!403317))))

(declare-datatypes ((List!13474 0))(
  ( (Nil!13471) (Cons!13470 (h!14515 (_ BitVec 64)) (t!19789 List!13474)) )
))
(declare-fun arrayNoDuplicates!0 (array!40690 (_ BitVec 32) List!13474) Bool)

(assert (=> b!718444 (= res!480920 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13471))))

(declare-fun b!718445 () Bool)

(declare-fun res!480918 () Bool)

(assert (=> b!718445 (=> (not res!480918) (not e!403318))))

(declare-fun arrayContainsKey!0 (array!40690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718445 (= res!480918 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718446 () Bool)

(declare-fun res!480924 () Bool)

(assert (=> b!718446 (=> (not res!480924) (not e!403318))))

(assert (=> b!718446 (= res!480924 (and (= (size!19893 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19893 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19893 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718442 () Bool)

(declare-fun res!480919 () Bool)

(assert (=> b!718442 (=> (not res!480919) (not e!403318))))

(assert (=> b!718442 (= res!480919 (validKeyInArray!0 (select (arr!19472 a!3186) j!159)))))

(declare-fun res!480926 () Bool)

(assert (=> start!63950 (=> (not res!480926) (not e!403318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63950 (= res!480926 (validMask!0 mask!3328))))

(assert (=> start!63950 e!403318))

(assert (=> start!63950 true))

(declare-fun array_inv!15268 (array!40690) Bool)

(assert (=> start!63950 (array_inv!15268 a!3186)))

(assert (= (and start!63950 res!480926) b!718446))

(assert (= (and b!718446 res!480924) b!718442))

(assert (= (and b!718442 res!480919) b!718438))

(assert (= (and b!718438 res!480925) b!718445))

(assert (= (and b!718445 res!480918) b!718441))

(assert (= (and b!718441 res!480921) b!718440))

(assert (= (and b!718440 res!480923) b!718444))

(assert (= (and b!718444 res!480920) b!718439))

(assert (= (and b!718439 res!480922) b!718443))

(declare-fun m!674081 () Bool)

(assert (=> b!718438 m!674081))

(declare-fun m!674083 () Bool)

(assert (=> b!718440 m!674083))

(declare-fun m!674085 () Bool)

(assert (=> start!63950 m!674085))

(declare-fun m!674087 () Bool)

(assert (=> start!63950 m!674087))

(declare-fun m!674089 () Bool)

(assert (=> b!718444 m!674089))

(declare-fun m!674091 () Bool)

(assert (=> b!718442 m!674091))

(assert (=> b!718442 m!674091))

(declare-fun m!674093 () Bool)

(assert (=> b!718442 m!674093))

(assert (=> b!718443 m!674091))

(assert (=> b!718443 m!674091))

(declare-fun m!674095 () Bool)

(assert (=> b!718443 m!674095))

(declare-fun m!674097 () Bool)

(assert (=> b!718441 m!674097))

(declare-fun m!674099 () Bool)

(assert (=> b!718445 m!674099))

(push 1)

(assert (not b!718444))

(assert (not b!718442))

(assert (not b!718445))

(assert (not b!718438))

(assert (not b!718440))

(assert (not b!718443))

(assert (not b!718441))

(assert (not start!63950))

(check-sat)

(pop 1)

