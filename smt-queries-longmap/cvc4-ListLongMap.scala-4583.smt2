; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64016 () Bool)

(assert start!64016)

(declare-fun b!718834 () Bool)

(declare-fun res!481227 () Bool)

(declare-fun e!403506 () Bool)

(assert (=> b!718834 (=> (not res!481227) (not e!403506))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718834 (= res!481227 (validKeyInArray!0 k!2102))))

(declare-fun b!718835 () Bool)

(declare-fun res!481232 () Bool)

(declare-fun e!403507 () Bool)

(assert (=> b!718835 (=> (not res!481232) (not e!403507))))

(declare-datatypes ((array!40711 0))(
  ( (array!40712 (arr!19481 (Array (_ BitVec 32) (_ BitVec 64))) (size!19902 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40711)

(declare-datatypes ((List!13483 0))(
  ( (Nil!13480) (Cons!13479 (h!14527 (_ BitVec 64)) (t!19798 List!13483)) )
))
(declare-fun arrayNoDuplicates!0 (array!40711 (_ BitVec 32) List!13483) Bool)

(assert (=> b!718835 (= res!481232 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13480))))

(declare-fun b!718836 () Bool)

(declare-fun res!481231 () Bool)

(assert (=> b!718836 (=> (not res!481231) (not e!403506))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718836 (= res!481231 (and (= (size!19902 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19902 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19902 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!481230 () Bool)

(assert (=> start!64016 (=> (not res!481230) (not e!403506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64016 (= res!481230 (validMask!0 mask!3328))))

(assert (=> start!64016 e!403506))

(assert (=> start!64016 true))

(declare-fun array_inv!15277 (array!40711) Bool)

(assert (=> start!64016 (array_inv!15277 a!3186)))

(declare-fun b!718837 () Bool)

(declare-fun res!481229 () Bool)

(assert (=> b!718837 (=> (not res!481229) (not e!403506))))

(assert (=> b!718837 (= res!481229 (validKeyInArray!0 (select (arr!19481 a!3186) j!159)))))

(declare-fun b!718838 () Bool)

(declare-fun res!481233 () Bool)

(assert (=> b!718838 (=> (not res!481233) (not e!403506))))

(declare-fun arrayContainsKey!0 (array!40711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718838 (= res!481233 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718839 () Bool)

(assert (=> b!718839 (= e!403507 false)))

(declare-fun lt!319490 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718839 (= lt!319490 (toIndex!0 (select (arr!19481 a!3186) j!159) mask!3328))))

(declare-fun b!718840 () Bool)

(declare-fun res!481235 () Bool)

(assert (=> b!718840 (=> (not res!481235) (not e!403507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40711 (_ BitVec 32)) Bool)

(assert (=> b!718840 (= res!481235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718841 () Bool)

(declare-fun res!481234 () Bool)

(assert (=> b!718841 (=> (not res!481234) (not e!403507))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718841 (= res!481234 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19902 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19902 a!3186))))))

(declare-fun b!718842 () Bool)

(assert (=> b!718842 (= e!403506 e!403507)))

(declare-fun res!481228 () Bool)

(assert (=> b!718842 (=> (not res!481228) (not e!403507))))

(declare-datatypes ((SeekEntryResult!7081 0))(
  ( (MissingZero!7081 (index!30692 (_ BitVec 32))) (Found!7081 (index!30693 (_ BitVec 32))) (Intermediate!7081 (undefined!7893 Bool) (index!30694 (_ BitVec 32)) (x!61704 (_ BitVec 32))) (Undefined!7081) (MissingVacant!7081 (index!30695 (_ BitVec 32))) )
))
(declare-fun lt!319489 () SeekEntryResult!7081)

(assert (=> b!718842 (= res!481228 (or (= lt!319489 (MissingZero!7081 i!1173)) (= lt!319489 (MissingVacant!7081 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40711 (_ BitVec 32)) SeekEntryResult!7081)

(assert (=> b!718842 (= lt!319489 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64016 res!481230) b!718836))

(assert (= (and b!718836 res!481231) b!718837))

(assert (= (and b!718837 res!481229) b!718834))

(assert (= (and b!718834 res!481227) b!718838))

(assert (= (and b!718838 res!481233) b!718842))

(assert (= (and b!718842 res!481228) b!718840))

(assert (= (and b!718840 res!481235) b!718835))

(assert (= (and b!718835 res!481232) b!718841))

(assert (= (and b!718841 res!481234) b!718839))

(declare-fun m!674357 () Bool)

(assert (=> start!64016 m!674357))

(declare-fun m!674359 () Bool)

(assert (=> start!64016 m!674359))

(declare-fun m!674361 () Bool)

(assert (=> b!718842 m!674361))

(declare-fun m!674363 () Bool)

(assert (=> b!718834 m!674363))

(declare-fun m!674365 () Bool)

(assert (=> b!718838 m!674365))

(declare-fun m!674367 () Bool)

(assert (=> b!718837 m!674367))

(assert (=> b!718837 m!674367))

(declare-fun m!674369 () Bool)

(assert (=> b!718837 m!674369))

(declare-fun m!674371 () Bool)

(assert (=> b!718840 m!674371))

(assert (=> b!718839 m!674367))

(assert (=> b!718839 m!674367))

(declare-fun m!674373 () Bool)

(assert (=> b!718839 m!674373))

(declare-fun m!674375 () Bool)

(assert (=> b!718835 m!674375))

(push 1)

(assert (not start!64016))

(assert (not b!718835))

(assert (not b!718840))

(assert (not b!718838))

(assert (not b!718834))

(assert (not b!718842))

(assert (not b!718837))

(assert (not b!718839))

(check-sat)

(pop 1)

