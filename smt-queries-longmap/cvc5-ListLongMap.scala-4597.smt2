; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64096 () Bool)

(assert start!64096)

(declare-fun b!719959 () Bool)

(declare-fun e!403868 () Bool)

(declare-fun e!403866 () Bool)

(assert (=> b!719959 (= e!403868 e!403866)))

(declare-fun res!482358 () Bool)

(assert (=> b!719959 (=> (not res!482358) (not e!403866))))

(declare-datatypes ((SeekEntryResult!7121 0))(
  ( (MissingZero!7121 (index!30852 (_ BitVec 32))) (Found!7121 (index!30853 (_ BitVec 32))) (Intermediate!7121 (undefined!7933 Bool) (index!30854 (_ BitVec 32)) (x!61856 (_ BitVec 32))) (Undefined!7121) (MissingVacant!7121 (index!30855 (_ BitVec 32))) )
))
(declare-fun lt!319685 () SeekEntryResult!7121)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719959 (= res!482358 (or (= lt!319685 (MissingZero!7121 i!1173)) (= lt!319685 (MissingVacant!7121 i!1173))))))

(declare-datatypes ((array!40791 0))(
  ( (array!40792 (arr!19521 (Array (_ BitVec 32) (_ BitVec 64))) (size!19942 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40791)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40791 (_ BitVec 32)) SeekEntryResult!7121)

(assert (=> b!719959 (= lt!319685 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719960 () Bool)

(declare-fun res!482360 () Bool)

(assert (=> b!719960 (=> (not res!482360) (not e!403868))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719960 (= res!482360 (and (= (size!19942 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19942 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19942 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719961 () Bool)

(declare-fun res!482353 () Bool)

(assert (=> b!719961 (=> (not res!482353) (not e!403866))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719961 (= res!482353 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19942 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19942 a!3186))))))

(declare-fun b!719963 () Bool)

(declare-fun res!482356 () Bool)

(assert (=> b!719963 (=> (not res!482356) (not e!403868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719963 (= res!482356 (validKeyInArray!0 k!2102))))

(declare-fun b!719964 () Bool)

(declare-fun res!482357 () Bool)

(assert (=> b!719964 (=> (not res!482357) (not e!403866))))

(declare-datatypes ((List!13523 0))(
  ( (Nil!13520) (Cons!13519 (h!14567 (_ BitVec 64)) (t!19838 List!13523)) )
))
(declare-fun arrayNoDuplicates!0 (array!40791 (_ BitVec 32) List!13523) Bool)

(assert (=> b!719964 (= res!482357 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13520))))

(declare-fun b!719965 () Bool)

(assert (=> b!719965 (= e!403866 false)))

(declare-fun lt!319684 () SeekEntryResult!7121)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40791 (_ BitVec 32)) SeekEntryResult!7121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719965 (= lt!319684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19521 a!3186) j!159) mask!3328) (select (arr!19521 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719962 () Bool)

(declare-fun res!482359 () Bool)

(assert (=> b!719962 (=> (not res!482359) (not e!403868))))

(declare-fun arrayContainsKey!0 (array!40791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719962 (= res!482359 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!482354 () Bool)

(assert (=> start!64096 (=> (not res!482354) (not e!403868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64096 (= res!482354 (validMask!0 mask!3328))))

(assert (=> start!64096 e!403868))

(assert (=> start!64096 true))

(declare-fun array_inv!15317 (array!40791) Bool)

(assert (=> start!64096 (array_inv!15317 a!3186)))

(declare-fun b!719966 () Bool)

(declare-fun res!482352 () Bool)

(assert (=> b!719966 (=> (not res!482352) (not e!403868))))

(assert (=> b!719966 (= res!482352 (validKeyInArray!0 (select (arr!19521 a!3186) j!159)))))

(declare-fun b!719967 () Bool)

(declare-fun res!482355 () Bool)

(assert (=> b!719967 (=> (not res!482355) (not e!403866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40791 (_ BitVec 32)) Bool)

(assert (=> b!719967 (= res!482355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64096 res!482354) b!719960))

(assert (= (and b!719960 res!482360) b!719966))

(assert (= (and b!719966 res!482352) b!719963))

(assert (= (and b!719963 res!482356) b!719962))

(assert (= (and b!719962 res!482359) b!719959))

(assert (= (and b!719959 res!482358) b!719967))

(assert (= (and b!719967 res!482355) b!719964))

(assert (= (and b!719964 res!482357) b!719961))

(assert (= (and b!719961 res!482353) b!719965))

(declare-fun m!675265 () Bool)

(assert (=> b!719964 m!675265))

(declare-fun m!675267 () Bool)

(assert (=> b!719967 m!675267))

(declare-fun m!675269 () Bool)

(assert (=> b!719966 m!675269))

(assert (=> b!719966 m!675269))

(declare-fun m!675271 () Bool)

(assert (=> b!719966 m!675271))

(declare-fun m!675273 () Bool)

(assert (=> b!719962 m!675273))

(declare-fun m!675275 () Bool)

(assert (=> b!719959 m!675275))

(declare-fun m!675277 () Bool)

(assert (=> b!719963 m!675277))

(assert (=> b!719965 m!675269))

(assert (=> b!719965 m!675269))

(declare-fun m!675279 () Bool)

(assert (=> b!719965 m!675279))

(assert (=> b!719965 m!675279))

(assert (=> b!719965 m!675269))

(declare-fun m!675281 () Bool)

(assert (=> b!719965 m!675281))

(declare-fun m!675283 () Bool)

(assert (=> start!64096 m!675283))

(declare-fun m!675285 () Bool)

(assert (=> start!64096 m!675285))

(push 1)

