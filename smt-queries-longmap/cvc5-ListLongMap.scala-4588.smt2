; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64042 () Bool)

(assert start!64042)

(declare-fun b!719203 () Bool)

(declare-fun res!481603 () Bool)

(declare-fun e!403625 () Bool)

(assert (=> b!719203 (=> (not res!481603) (not e!403625))))

(declare-datatypes ((array!40737 0))(
  ( (array!40738 (arr!19494 (Array (_ BitVec 32) (_ BitVec 64))) (size!19915 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40737)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719203 (= res!481603 (and (= (size!19915 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19915 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19915 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719204 () Bool)

(declare-fun res!481597 () Bool)

(assert (=> b!719204 (=> (not res!481597) (not e!403625))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719204 (= res!481597 (validKeyInArray!0 k!2102))))

(declare-fun b!719205 () Bool)

(declare-fun res!481598 () Bool)

(declare-fun e!403623 () Bool)

(assert (=> b!719205 (=> (not res!481598) (not e!403623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40737 (_ BitVec 32)) Bool)

(assert (=> b!719205 (= res!481598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719206 () Bool)

(declare-fun res!481604 () Bool)

(assert (=> b!719206 (=> (not res!481604) (not e!403625))))

(assert (=> b!719206 (= res!481604 (validKeyInArray!0 (select (arr!19494 a!3186) j!159)))))

(declare-fun b!719207 () Bool)

(declare-fun res!481599 () Bool)

(assert (=> b!719207 (=> (not res!481599) (not e!403623))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!719207 (= res!481599 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19915 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19915 a!3186))))))

(declare-fun b!719208 () Bool)

(assert (=> b!719208 (= e!403625 e!403623)))

(declare-fun res!481601 () Bool)

(assert (=> b!719208 (=> (not res!481601) (not e!403623))))

(declare-datatypes ((SeekEntryResult!7094 0))(
  ( (MissingZero!7094 (index!30744 (_ BitVec 32))) (Found!7094 (index!30745 (_ BitVec 32))) (Intermediate!7094 (undefined!7906 Bool) (index!30746 (_ BitVec 32)) (x!61757 (_ BitVec 32))) (Undefined!7094) (MissingVacant!7094 (index!30747 (_ BitVec 32))) )
))
(declare-fun lt!319550 () SeekEntryResult!7094)

(assert (=> b!719208 (= res!481601 (or (= lt!319550 (MissingZero!7094 i!1173)) (= lt!319550 (MissingVacant!7094 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40737 (_ BitVec 32)) SeekEntryResult!7094)

(assert (=> b!719208 (= lt!319550 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719209 () Bool)

(declare-fun res!481602 () Bool)

(assert (=> b!719209 (=> (not res!481602) (not e!403625))))

(declare-fun arrayContainsKey!0 (array!40737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719209 (= res!481602 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481600 () Bool)

(assert (=> start!64042 (=> (not res!481600) (not e!403625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64042 (= res!481600 (validMask!0 mask!3328))))

(assert (=> start!64042 e!403625))

(assert (=> start!64042 true))

(declare-fun array_inv!15290 (array!40737) Bool)

(assert (=> start!64042 (array_inv!15290 a!3186)))

(declare-fun b!719210 () Bool)

(declare-fun res!481596 () Bool)

(assert (=> b!719210 (=> (not res!481596) (not e!403623))))

(declare-datatypes ((List!13496 0))(
  ( (Nil!13493) (Cons!13492 (h!14540 (_ BitVec 64)) (t!19811 List!13496)) )
))
(declare-fun arrayNoDuplicates!0 (array!40737 (_ BitVec 32) List!13496) Bool)

(assert (=> b!719210 (= res!481596 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13493))))

(declare-fun b!719211 () Bool)

(assert (=> b!719211 (= e!403623 false)))

(declare-fun lt!319549 () SeekEntryResult!7094)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40737 (_ BitVec 32)) SeekEntryResult!7094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719211 (= lt!319549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19494 a!3186) j!159) mask!3328) (select (arr!19494 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64042 res!481600) b!719203))

(assert (= (and b!719203 res!481603) b!719206))

(assert (= (and b!719206 res!481604) b!719204))

(assert (= (and b!719204 res!481597) b!719209))

(assert (= (and b!719209 res!481602) b!719208))

(assert (= (and b!719208 res!481601) b!719205))

(assert (= (and b!719205 res!481598) b!719210))

(assert (= (and b!719210 res!481596) b!719207))

(assert (= (and b!719207 res!481599) b!719211))

(declare-fun m!674653 () Bool)

(assert (=> start!64042 m!674653))

(declare-fun m!674655 () Bool)

(assert (=> start!64042 m!674655))

(declare-fun m!674657 () Bool)

(assert (=> b!719210 m!674657))

(declare-fun m!674659 () Bool)

(assert (=> b!719209 m!674659))

(declare-fun m!674661 () Bool)

(assert (=> b!719204 m!674661))

(declare-fun m!674663 () Bool)

(assert (=> b!719205 m!674663))

(declare-fun m!674665 () Bool)

(assert (=> b!719211 m!674665))

(assert (=> b!719211 m!674665))

(declare-fun m!674667 () Bool)

(assert (=> b!719211 m!674667))

(assert (=> b!719211 m!674667))

(assert (=> b!719211 m!674665))

(declare-fun m!674669 () Bool)

(assert (=> b!719211 m!674669))

(assert (=> b!719206 m!674665))

(assert (=> b!719206 m!674665))

(declare-fun m!674671 () Bool)

(assert (=> b!719206 m!674671))

(declare-fun m!674673 () Bool)

(assert (=> b!719208 m!674673))

(push 1)

