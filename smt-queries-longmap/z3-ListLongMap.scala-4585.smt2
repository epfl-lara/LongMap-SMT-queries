; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64004 () Bool)

(assert start!64004)

(declare-fun b!718694 () Bool)

(declare-fun res!481232 () Bool)

(declare-fun e!403389 () Bool)

(assert (=> b!718694 (=> (not res!481232) (not e!403389))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40716 0))(
  ( (array!40717 (arr!19484 (Array (_ BitVec 32) (_ BitVec 64))) (size!19905 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40716)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7081 0))(
  ( (MissingZero!7081 (index!30692 (_ BitVec 32))) (Found!7081 (index!30693 (_ BitVec 32))) (Intermediate!7081 (undefined!7893 Bool) (index!30694 (_ BitVec 32)) (x!61715 (_ BitVec 32))) (Undefined!7081) (MissingVacant!7081 (index!30695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40716 (_ BitVec 32)) SeekEntryResult!7081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718694 (= res!481232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19484 a!3186) j!159) mask!3328) (select (arr!19484 a!3186) j!159) a!3186 mask!3328) (Intermediate!7081 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!718695 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!718695 (= e!403389 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19484 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!718696 () Bool)

(declare-fun res!481236 () Bool)

(declare-fun e!403390 () Bool)

(assert (=> b!718696 (=> (not res!481236) (not e!403390))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718696 (= res!481236 (validKeyInArray!0 k0!2102))))

(declare-fun b!718697 () Bool)

(declare-fun res!481235 () Bool)

(assert (=> b!718697 (=> (not res!481235) (not e!403389))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718697 (= res!481235 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19905 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19905 a!3186))))))

(declare-fun b!718698 () Bool)

(declare-fun res!481230 () Bool)

(assert (=> b!718698 (=> (not res!481230) (not e!403390))))

(assert (=> b!718698 (= res!481230 (and (= (size!19905 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19905 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19905 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718699 () Bool)

(declare-fun res!481234 () Bool)

(assert (=> b!718699 (=> (not res!481234) (not e!403389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40716 (_ BitVec 32)) Bool)

(assert (=> b!718699 (= res!481234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718700 () Bool)

(assert (=> b!718700 (= e!403390 e!403389)))

(declare-fun res!481228 () Bool)

(assert (=> b!718700 (=> (not res!481228) (not e!403389))))

(declare-fun lt!319271 () SeekEntryResult!7081)

(assert (=> b!718700 (= res!481228 (or (= lt!319271 (MissingZero!7081 i!1173)) (= lt!319271 (MissingVacant!7081 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40716 (_ BitVec 32)) SeekEntryResult!7081)

(assert (=> b!718700 (= lt!319271 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!481233 () Bool)

(assert (=> start!64004 (=> (not res!481233) (not e!403390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64004 (= res!481233 (validMask!0 mask!3328))))

(assert (=> start!64004 e!403390))

(assert (=> start!64004 true))

(declare-fun array_inv!15367 (array!40716) Bool)

(assert (=> start!64004 (array_inv!15367 a!3186)))

(declare-fun b!718701 () Bool)

(declare-fun res!481227 () Bool)

(assert (=> b!718701 (=> (not res!481227) (not e!403389))))

(declare-datatypes ((List!13525 0))(
  ( (Nil!13522) (Cons!13521 (h!14569 (_ BitVec 64)) (t!19831 List!13525)) )
))
(declare-fun arrayNoDuplicates!0 (array!40716 (_ BitVec 32) List!13525) Bool)

(assert (=> b!718701 (= res!481227 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13522))))

(declare-fun b!718702 () Bool)

(declare-fun res!481231 () Bool)

(assert (=> b!718702 (=> (not res!481231) (not e!403390))))

(assert (=> b!718702 (= res!481231 (validKeyInArray!0 (select (arr!19484 a!3186) j!159)))))

(declare-fun b!718703 () Bool)

(declare-fun res!481229 () Bool)

(assert (=> b!718703 (=> (not res!481229) (not e!403390))))

(declare-fun arrayContainsKey!0 (array!40716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718703 (= res!481229 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64004 res!481233) b!718698))

(assert (= (and b!718698 res!481230) b!718702))

(assert (= (and b!718702 res!481231) b!718696))

(assert (= (and b!718696 res!481236) b!718703))

(assert (= (and b!718703 res!481229) b!718700))

(assert (= (and b!718700 res!481228) b!718699))

(assert (= (and b!718699 res!481234) b!718701))

(assert (= (and b!718701 res!481227) b!718697))

(assert (= (and b!718697 res!481235) b!718694))

(assert (= (and b!718694 res!481232) b!718695))

(declare-fun m!673685 () Bool)

(assert (=> b!718696 m!673685))

(declare-fun m!673687 () Bool)

(assert (=> b!718703 m!673687))

(declare-fun m!673689 () Bool)

(assert (=> b!718699 m!673689))

(declare-fun m!673691 () Bool)

(assert (=> b!718700 m!673691))

(declare-fun m!673693 () Bool)

(assert (=> b!718694 m!673693))

(assert (=> b!718694 m!673693))

(declare-fun m!673695 () Bool)

(assert (=> b!718694 m!673695))

(assert (=> b!718694 m!673695))

(assert (=> b!718694 m!673693))

(declare-fun m!673697 () Bool)

(assert (=> b!718694 m!673697))

(declare-fun m!673699 () Bool)

(assert (=> b!718701 m!673699))

(declare-fun m!673701 () Bool)

(assert (=> b!718695 m!673701))

(assert (=> b!718702 m!673693))

(assert (=> b!718702 m!673693))

(declare-fun m!673703 () Bool)

(assert (=> b!718702 m!673703))

(declare-fun m!673705 () Bool)

(assert (=> start!64004 m!673705))

(declare-fun m!673707 () Bool)

(assert (=> start!64004 m!673707))

(check-sat (not start!64004) (not b!718701) (not b!718700) (not b!718703) (not b!718699) (not b!718696) (not b!718702) (not b!718694))
(check-sat)
