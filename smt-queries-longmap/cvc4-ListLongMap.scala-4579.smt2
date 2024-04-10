; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63944 () Bool)

(assert start!63944)

(declare-fun b!718357 () Bool)

(declare-fun res!480841 () Bool)

(declare-fun e!403291 () Bool)

(assert (=> b!718357 (=> (not res!480841) (not e!403291))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718357 (= res!480841 (validKeyInArray!0 k!2102))))

(declare-fun b!718358 () Bool)

(declare-fun res!480839 () Bool)

(declare-fun e!403292 () Bool)

(assert (=> b!718358 (=> (not res!480839) (not e!403292))))

(declare-datatypes ((array!40684 0))(
  ( (array!40685 (arr!19469 (Array (_ BitVec 32) (_ BitVec 64))) (size!19890 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40684)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40684 (_ BitVec 32)) Bool)

(assert (=> b!718358 (= res!480839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718359 () Bool)

(declare-fun res!480845 () Bool)

(assert (=> b!718359 (=> (not res!480845) (not e!403292))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!718359 (= res!480845 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19890 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19890 a!3186))))))

(declare-fun b!718360 () Bool)

(declare-fun res!480842 () Bool)

(assert (=> b!718360 (=> (not res!480842) (not e!403292))))

(declare-datatypes ((List!13471 0))(
  ( (Nil!13468) (Cons!13467 (h!14512 (_ BitVec 64)) (t!19786 List!13471)) )
))
(declare-fun arrayNoDuplicates!0 (array!40684 (_ BitVec 32) List!13471) Bool)

(assert (=> b!718360 (= res!480842 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13468))))

(declare-fun b!718362 () Bool)

(assert (=> b!718362 (= e!403291 e!403292)))

(declare-fun res!480844 () Bool)

(assert (=> b!718362 (=> (not res!480844) (not e!403292))))

(declare-datatypes ((SeekEntryResult!7069 0))(
  ( (MissingZero!7069 (index!30644 (_ BitVec 32))) (Found!7069 (index!30645 (_ BitVec 32))) (Intermediate!7069 (undefined!7881 Bool) (index!30646 (_ BitVec 32)) (x!61657 (_ BitVec 32))) (Undefined!7069) (MissingVacant!7069 (index!30647 (_ BitVec 32))) )
))
(declare-fun lt!319345 () SeekEntryResult!7069)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718362 (= res!480844 (or (= lt!319345 (MissingZero!7069 i!1173)) (= lt!319345 (MissingVacant!7069 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40684 (_ BitVec 32)) SeekEntryResult!7069)

(assert (=> b!718362 (= lt!319345 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718363 () Bool)

(declare-fun res!480840 () Bool)

(assert (=> b!718363 (=> (not res!480840) (not e!403291))))

(declare-fun arrayContainsKey!0 (array!40684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718363 (= res!480840 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718364 () Bool)

(declare-fun res!480838 () Bool)

(assert (=> b!718364 (=> (not res!480838) (not e!403291))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718364 (= res!480838 (validKeyInArray!0 (select (arr!19469 a!3186) j!159)))))

(declare-fun b!718365 () Bool)

(assert (=> b!718365 (= e!403292 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319346 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718365 (= lt!319346 (toIndex!0 (select (arr!19469 a!3186) j!159) mask!3328))))

(declare-fun b!718361 () Bool)

(declare-fun res!480837 () Bool)

(assert (=> b!718361 (=> (not res!480837) (not e!403291))))

(assert (=> b!718361 (= res!480837 (and (= (size!19890 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19890 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19890 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480843 () Bool)

(assert (=> start!63944 (=> (not res!480843) (not e!403291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63944 (= res!480843 (validMask!0 mask!3328))))

(assert (=> start!63944 e!403291))

(assert (=> start!63944 true))

(declare-fun array_inv!15265 (array!40684) Bool)

(assert (=> start!63944 (array_inv!15265 a!3186)))

(assert (= (and start!63944 res!480843) b!718361))

(assert (= (and b!718361 res!480837) b!718364))

(assert (= (and b!718364 res!480838) b!718357))

(assert (= (and b!718357 res!480841) b!718363))

(assert (= (and b!718363 res!480840) b!718362))

(assert (= (and b!718362 res!480844) b!718358))

(assert (= (and b!718358 res!480839) b!718360))

(assert (= (and b!718360 res!480842) b!718359))

(assert (= (and b!718359 res!480845) b!718365))

(declare-fun m!674021 () Bool)

(assert (=> b!718365 m!674021))

(assert (=> b!718365 m!674021))

(declare-fun m!674023 () Bool)

(assert (=> b!718365 m!674023))

(assert (=> b!718364 m!674021))

(assert (=> b!718364 m!674021))

(declare-fun m!674025 () Bool)

(assert (=> b!718364 m!674025))

(declare-fun m!674027 () Bool)

(assert (=> start!63944 m!674027))

(declare-fun m!674029 () Bool)

(assert (=> start!63944 m!674029))

(declare-fun m!674031 () Bool)

(assert (=> b!718357 m!674031))

(declare-fun m!674033 () Bool)

(assert (=> b!718358 m!674033))

(declare-fun m!674035 () Bool)

(assert (=> b!718360 m!674035))

(declare-fun m!674037 () Bool)

(assert (=> b!718363 m!674037))

(declare-fun m!674039 () Bool)

(assert (=> b!718362 m!674039))

(push 1)

(assert (not b!718363))

(assert (not b!718358))

(assert (not b!718357))

(assert (not start!63944))

(assert (not b!718365))

(assert (not b!718362))

(assert (not b!718360))

(assert (not b!718364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

