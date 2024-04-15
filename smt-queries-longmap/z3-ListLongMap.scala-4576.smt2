; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63860 () Bool)

(assert start!63860)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!717673 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40656 0))(
  ( (array!40657 (arr!19457 (Array (_ BitVec 32) (_ BitVec 64))) (size!19878 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40656)

(declare-fun e!402931 () Bool)

(assert (=> b!717673 (= e!402931 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19878 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19878 a!3186)) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun res!480387 () Bool)

(declare-fun e!402929 () Bool)

(assert (=> start!63860 (=> (not res!480387) (not e!402929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63860 (= res!480387 (validMask!0 mask!3328))))

(assert (=> start!63860 e!402929))

(assert (=> start!63860 true))

(declare-fun array_inv!15340 (array!40656) Bool)

(assert (=> start!63860 (array_inv!15340 a!3186)))

(declare-fun b!717674 () Bool)

(declare-fun res!480386 () Bool)

(assert (=> b!717674 (=> (not res!480386) (not e!402929))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717674 (= res!480386 (validKeyInArray!0 (select (arr!19457 a!3186) j!159)))))

(declare-fun b!717675 () Bool)

(declare-fun res!480390 () Bool)

(assert (=> b!717675 (=> (not res!480390) (not e!402931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40656 (_ BitVec 32)) Bool)

(assert (=> b!717675 (= res!480390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717676 () Bool)

(assert (=> b!717676 (= e!402929 e!402931)))

(declare-fun res!480388 () Bool)

(assert (=> b!717676 (=> (not res!480388) (not e!402931))))

(declare-datatypes ((SeekEntryResult!7054 0))(
  ( (MissingZero!7054 (index!30584 (_ BitVec 32))) (Found!7054 (index!30585 (_ BitVec 32))) (Intermediate!7054 (undefined!7866 Bool) (index!30586 (_ BitVec 32)) (x!61613 (_ BitVec 32))) (Undefined!7054) (MissingVacant!7054 (index!30587 (_ BitVec 32))) )
))
(declare-fun lt!319001 () SeekEntryResult!7054)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717676 (= res!480388 (or (= lt!319001 (MissingZero!7054 i!1173)) (= lt!319001 (MissingVacant!7054 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40656 (_ BitVec 32)) SeekEntryResult!7054)

(assert (=> b!717676 (= lt!319001 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717677 () Bool)

(declare-fun res!480383 () Bool)

(assert (=> b!717677 (=> (not res!480383) (not e!402931))))

(declare-datatypes ((List!13498 0))(
  ( (Nil!13495) (Cons!13494 (h!14539 (_ BitVec 64)) (t!19804 List!13498)) )
))
(declare-fun arrayNoDuplicates!0 (array!40656 (_ BitVec 32) List!13498) Bool)

(assert (=> b!717677 (= res!480383 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13495))))

(declare-fun b!717678 () Bool)

(declare-fun res!480385 () Bool)

(assert (=> b!717678 (=> (not res!480385) (not e!402929))))

(assert (=> b!717678 (= res!480385 (and (= (size!19878 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19878 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19878 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717679 () Bool)

(declare-fun res!480384 () Bool)

(assert (=> b!717679 (=> (not res!480384) (not e!402929))))

(assert (=> b!717679 (= res!480384 (validKeyInArray!0 k0!2102))))

(declare-fun b!717680 () Bool)

(declare-fun res!480389 () Bool)

(assert (=> b!717680 (=> (not res!480389) (not e!402929))))

(declare-fun arrayContainsKey!0 (array!40656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717680 (= res!480389 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63860 res!480387) b!717678))

(assert (= (and b!717678 res!480385) b!717674))

(assert (= (and b!717674 res!480386) b!717679))

(assert (= (and b!717679 res!480384) b!717680))

(assert (= (and b!717680 res!480389) b!717676))

(assert (= (and b!717676 res!480388) b!717675))

(assert (= (and b!717675 res!480390) b!717677))

(assert (= (and b!717677 res!480383) b!717673))

(declare-fun m!672959 () Bool)

(assert (=> b!717676 m!672959))

(declare-fun m!672961 () Bool)

(assert (=> b!717679 m!672961))

(declare-fun m!672963 () Bool)

(assert (=> start!63860 m!672963))

(declare-fun m!672965 () Bool)

(assert (=> start!63860 m!672965))

(declare-fun m!672967 () Bool)

(assert (=> b!717675 m!672967))

(declare-fun m!672969 () Bool)

(assert (=> b!717674 m!672969))

(assert (=> b!717674 m!672969))

(declare-fun m!672971 () Bool)

(assert (=> b!717674 m!672971))

(declare-fun m!672973 () Bool)

(assert (=> b!717677 m!672973))

(declare-fun m!672975 () Bool)

(assert (=> b!717680 m!672975))

(check-sat (not start!63860) (not b!717679) (not b!717674) (not b!717677) (not b!717676) (not b!717675) (not b!717680))
(check-sat)
