; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64006 () Bool)

(assert start!64006)

(declare-fun res!481094 () Bool)

(declare-fun e!403463 () Bool)

(assert (=> start!64006 (=> (not res!481094) (not e!403463))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64006 (= res!481094 (validMask!0 mask!3328))))

(assert (=> start!64006 e!403463))

(assert (=> start!64006 true))

(declare-datatypes ((array!40701 0))(
  ( (array!40702 (arr!19476 (Array (_ BitVec 32) (_ BitVec 64))) (size!19897 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40701)

(declare-fun array_inv!15272 (array!40701) Bool)

(assert (=> start!64006 (array_inv!15272 a!3186)))

(declare-fun b!718699 () Bool)

(declare-fun res!481098 () Bool)

(assert (=> b!718699 (=> (not res!481098) (not e!403463))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718699 (= res!481098 (validKeyInArray!0 k!2102))))

(declare-fun b!718700 () Bool)

(declare-fun res!481099 () Bool)

(assert (=> b!718700 (=> (not res!481099) (not e!403463))))

(declare-fun arrayContainsKey!0 (array!40701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718700 (= res!481099 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718701 () Bool)

(declare-fun res!481096 () Bool)

(declare-fun e!403462 () Bool)

(assert (=> b!718701 (=> (not res!481096) (not e!403462))))

(declare-datatypes ((List!13478 0))(
  ( (Nil!13475) (Cons!13474 (h!14522 (_ BitVec 64)) (t!19793 List!13478)) )
))
(declare-fun arrayNoDuplicates!0 (array!40701 (_ BitVec 32) List!13478) Bool)

(assert (=> b!718701 (= res!481096 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13475))))

(declare-fun b!718702 () Bool)

(declare-fun res!481100 () Bool)

(assert (=> b!718702 (=> (not res!481100) (not e!403462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40701 (_ BitVec 32)) Bool)

(assert (=> b!718702 (= res!481100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718703 () Bool)

(declare-fun res!481095 () Bool)

(assert (=> b!718703 (=> (not res!481095) (not e!403463))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718703 (= res!481095 (validKeyInArray!0 (select (arr!19476 a!3186) j!159)))))

(declare-fun b!718704 () Bool)

(declare-fun res!481093 () Bool)

(assert (=> b!718704 (=> (not res!481093) (not e!403462))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718704 (= res!481093 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19897 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19897 a!3186))))))

(declare-fun b!718705 () Bool)

(assert (=> b!718705 (= e!403462 false)))

(declare-fun lt!319459 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718705 (= lt!319459 (toIndex!0 (select (arr!19476 a!3186) j!159) mask!3328))))

(declare-fun b!718706 () Bool)

(declare-fun res!481097 () Bool)

(assert (=> b!718706 (=> (not res!481097) (not e!403463))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718706 (= res!481097 (and (= (size!19897 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19897 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19897 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718707 () Bool)

(assert (=> b!718707 (= e!403463 e!403462)))

(declare-fun res!481092 () Bool)

(assert (=> b!718707 (=> (not res!481092) (not e!403462))))

(declare-datatypes ((SeekEntryResult!7076 0))(
  ( (MissingZero!7076 (index!30672 (_ BitVec 32))) (Found!7076 (index!30673 (_ BitVec 32))) (Intermediate!7076 (undefined!7888 Bool) (index!30674 (_ BitVec 32)) (x!61691 (_ BitVec 32))) (Undefined!7076) (MissingVacant!7076 (index!30675 (_ BitVec 32))) )
))
(declare-fun lt!319460 () SeekEntryResult!7076)

(assert (=> b!718707 (= res!481092 (or (= lt!319460 (MissingZero!7076 i!1173)) (= lt!319460 (MissingVacant!7076 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40701 (_ BitVec 32)) SeekEntryResult!7076)

(assert (=> b!718707 (= lt!319460 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64006 res!481094) b!718706))

(assert (= (and b!718706 res!481097) b!718703))

(assert (= (and b!718703 res!481095) b!718699))

(assert (= (and b!718699 res!481098) b!718700))

(assert (= (and b!718700 res!481099) b!718707))

(assert (= (and b!718707 res!481092) b!718702))

(assert (= (and b!718702 res!481100) b!718701))

(assert (= (and b!718701 res!481096) b!718704))

(assert (= (and b!718704 res!481093) b!718705))

(declare-fun m!674257 () Bool)

(assert (=> b!718705 m!674257))

(assert (=> b!718705 m!674257))

(declare-fun m!674259 () Bool)

(assert (=> b!718705 m!674259))

(declare-fun m!674261 () Bool)

(assert (=> b!718700 m!674261))

(assert (=> b!718703 m!674257))

(assert (=> b!718703 m!674257))

(declare-fun m!674263 () Bool)

(assert (=> b!718703 m!674263))

(declare-fun m!674265 () Bool)

(assert (=> b!718702 m!674265))

(declare-fun m!674267 () Bool)

(assert (=> b!718699 m!674267))

(declare-fun m!674269 () Bool)

(assert (=> start!64006 m!674269))

(declare-fun m!674271 () Bool)

(assert (=> start!64006 m!674271))

(declare-fun m!674273 () Bool)

(assert (=> b!718707 m!674273))

(declare-fun m!674275 () Bool)

(assert (=> b!718701 m!674275))

(push 1)

