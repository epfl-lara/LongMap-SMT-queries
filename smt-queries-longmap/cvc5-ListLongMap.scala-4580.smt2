; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63946 () Bool)

(assert start!63946)

(declare-fun b!718384 () Bool)

(declare-fun res!480864 () Bool)

(declare-fun e!403301 () Bool)

(assert (=> b!718384 (=> (not res!480864) (not e!403301))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718384 (= res!480864 (validKeyInArray!0 k!2102))))

(declare-fun b!718385 () Bool)

(declare-fun res!480866 () Bool)

(declare-fun e!403299 () Bool)

(assert (=> b!718385 (=> (not res!480866) (not e!403299))))

(declare-datatypes ((array!40686 0))(
  ( (array!40687 (arr!19470 (Array (_ BitVec 32) (_ BitVec 64))) (size!19891 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40686)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40686 (_ BitVec 32)) Bool)

(assert (=> b!718385 (= res!480866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718386 () Bool)

(declare-fun res!480869 () Bool)

(assert (=> b!718386 (=> (not res!480869) (not e!403301))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718386 (= res!480869 (validKeyInArray!0 (select (arr!19470 a!3186) j!159)))))

(declare-fun b!718387 () Bool)

(declare-fun res!480865 () Bool)

(assert (=> b!718387 (=> (not res!480865) (not e!403299))))

(declare-datatypes ((List!13472 0))(
  ( (Nil!13469) (Cons!13468 (h!14513 (_ BitVec 64)) (t!19787 List!13472)) )
))
(declare-fun arrayNoDuplicates!0 (array!40686 (_ BitVec 32) List!13472) Bool)

(assert (=> b!718387 (= res!480865 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13469))))

(declare-fun b!718388 () Bool)

(assert (=> b!718388 (= e!403299 false)))

(declare-fun lt!319351 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718388 (= lt!319351 (toIndex!0 (select (arr!19470 a!3186) j!159) mask!3328))))

(declare-fun b!718390 () Bool)

(declare-fun res!480870 () Bool)

(assert (=> b!718390 (=> (not res!480870) (not e!403301))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718390 (= res!480870 (and (= (size!19891 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19891 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19891 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718391 () Bool)

(assert (=> b!718391 (= e!403301 e!403299)))

(declare-fun res!480868 () Bool)

(assert (=> b!718391 (=> (not res!480868) (not e!403299))))

(declare-datatypes ((SeekEntryResult!7070 0))(
  ( (MissingZero!7070 (index!30648 (_ BitVec 32))) (Found!7070 (index!30649 (_ BitVec 32))) (Intermediate!7070 (undefined!7882 Bool) (index!30650 (_ BitVec 32)) (x!61666 (_ BitVec 32))) (Undefined!7070) (MissingVacant!7070 (index!30651 (_ BitVec 32))) )
))
(declare-fun lt!319352 () SeekEntryResult!7070)

(assert (=> b!718391 (= res!480868 (or (= lt!319352 (MissingZero!7070 i!1173)) (= lt!319352 (MissingVacant!7070 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40686 (_ BitVec 32)) SeekEntryResult!7070)

(assert (=> b!718391 (= lt!319352 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718392 () Bool)

(declare-fun res!480871 () Bool)

(assert (=> b!718392 (=> (not res!480871) (not e!403299))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718392 (= res!480871 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19891 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19891 a!3186))))))

(declare-fun res!480872 () Bool)

(assert (=> start!63946 (=> (not res!480872) (not e!403301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63946 (= res!480872 (validMask!0 mask!3328))))

(assert (=> start!63946 e!403301))

(assert (=> start!63946 true))

(declare-fun array_inv!15266 (array!40686) Bool)

(assert (=> start!63946 (array_inv!15266 a!3186)))

(declare-fun b!718389 () Bool)

(declare-fun res!480867 () Bool)

(assert (=> b!718389 (=> (not res!480867) (not e!403301))))

(declare-fun arrayContainsKey!0 (array!40686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718389 (= res!480867 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63946 res!480872) b!718390))

(assert (= (and b!718390 res!480870) b!718386))

(assert (= (and b!718386 res!480869) b!718384))

(assert (= (and b!718384 res!480864) b!718389))

(assert (= (and b!718389 res!480867) b!718391))

(assert (= (and b!718391 res!480868) b!718385))

(assert (= (and b!718385 res!480866) b!718387))

(assert (= (and b!718387 res!480865) b!718392))

(assert (= (and b!718392 res!480871) b!718388))

(declare-fun m!674041 () Bool)

(assert (=> b!718388 m!674041))

(assert (=> b!718388 m!674041))

(declare-fun m!674043 () Bool)

(assert (=> b!718388 m!674043))

(declare-fun m!674045 () Bool)

(assert (=> b!718384 m!674045))

(declare-fun m!674047 () Bool)

(assert (=> start!63946 m!674047))

(declare-fun m!674049 () Bool)

(assert (=> start!63946 m!674049))

(declare-fun m!674051 () Bool)

(assert (=> b!718391 m!674051))

(declare-fun m!674053 () Bool)

(assert (=> b!718385 m!674053))

(assert (=> b!718386 m!674041))

(assert (=> b!718386 m!674041))

(declare-fun m!674055 () Bool)

(assert (=> b!718386 m!674055))

(declare-fun m!674057 () Bool)

(assert (=> b!718389 m!674057))

(declare-fun m!674059 () Bool)

(assert (=> b!718387 m!674059))

(push 1)

(assert (not start!63946))

(assert (not b!718388))

(assert (not b!718391))

(assert (not b!718386))

(assert (not b!718387))

(assert (not b!718389))

(assert (not b!718385))

(assert (not b!718384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

