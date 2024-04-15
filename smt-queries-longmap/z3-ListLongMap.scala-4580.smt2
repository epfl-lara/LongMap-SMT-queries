; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63926 () Bool)

(assert start!63926)

(declare-fun b!718134 () Bool)

(declare-fun res!480755 () Bool)

(declare-fun e!403147 () Bool)

(assert (=> b!718134 (=> (not res!480755) (not e!403147))))

(declare-datatypes ((array!40683 0))(
  ( (array!40684 (arr!19469 (Array (_ BitVec 32) (_ BitVec 64))) (size!19890 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40683)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718134 (= res!480755 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718135 () Bool)

(declare-fun e!403146 () Bool)

(assert (=> b!718135 (= e!403147 e!403146)))

(declare-fun res!480760 () Bool)

(assert (=> b!718135 (=> (not res!480760) (not e!403146))))

(declare-datatypes ((SeekEntryResult!7066 0))(
  ( (MissingZero!7066 (index!30632 (_ BitVec 32))) (Found!7066 (index!30633 (_ BitVec 32))) (Intermediate!7066 (undefined!7878 Bool) (index!30634 (_ BitVec 32)) (x!61657 (_ BitVec 32))) (Undefined!7066) (MissingVacant!7066 (index!30635 (_ BitVec 32))) )
))
(declare-fun lt!319112 () SeekEntryResult!7066)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718135 (= res!480760 (or (= lt!319112 (MissingZero!7066 i!1173)) (= lt!319112 (MissingVacant!7066 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40683 (_ BitVec 32)) SeekEntryResult!7066)

(assert (=> b!718135 (= lt!319112 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718136 () Bool)

(declare-fun res!480759 () Bool)

(assert (=> b!718136 (=> (not res!480759) (not e!403146))))

(declare-datatypes ((List!13510 0))(
  ( (Nil!13507) (Cons!13506 (h!14551 (_ BitVec 64)) (t!19816 List!13510)) )
))
(declare-fun arrayNoDuplicates!0 (array!40683 (_ BitVec 32) List!13510) Bool)

(assert (=> b!718136 (= res!480759 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13507))))

(declare-fun res!480761 () Bool)

(assert (=> start!63926 (=> (not res!480761) (not e!403147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63926 (= res!480761 (validMask!0 mask!3328))))

(assert (=> start!63926 e!403147))

(assert (=> start!63926 true))

(declare-fun array_inv!15352 (array!40683) Bool)

(assert (=> start!63926 (array_inv!15352 a!3186)))

(declare-fun b!718137 () Bool)

(declare-fun res!480757 () Bool)

(assert (=> b!718137 (=> (not res!480757) (not e!403147))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718137 (= res!480757 (and (= (size!19890 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19890 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19890 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718138 () Bool)

(declare-fun res!480762 () Bool)

(assert (=> b!718138 (=> (not res!480762) (not e!403147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718138 (= res!480762 (validKeyInArray!0 (select (arr!19469 a!3186) j!159)))))

(declare-fun b!718139 () Bool)

(declare-fun res!480754 () Bool)

(assert (=> b!718139 (=> (not res!480754) (not e!403147))))

(assert (=> b!718139 (= res!480754 (validKeyInArray!0 k0!2102))))

(declare-fun b!718140 () Bool)

(declare-fun res!480756 () Bool)

(assert (=> b!718140 (=> (not res!480756) (not e!403146))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718140 (= res!480756 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19890 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19890 a!3186))))))

(declare-fun b!718141 () Bool)

(assert (=> b!718141 (= e!403146 false)))

(declare-fun lt!319111 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718141 (= lt!319111 (toIndex!0 (select (arr!19469 a!3186) j!159) mask!3328))))

(declare-fun b!718142 () Bool)

(declare-fun res!480758 () Bool)

(assert (=> b!718142 (=> (not res!480758) (not e!403146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40683 (_ BitVec 32)) Bool)

(assert (=> b!718142 (= res!480758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63926 res!480761) b!718137))

(assert (= (and b!718137 res!480757) b!718138))

(assert (= (and b!718138 res!480762) b!718139))

(assert (= (and b!718139 res!480754) b!718134))

(assert (= (and b!718134 res!480755) b!718135))

(assert (= (and b!718135 res!480760) b!718142))

(assert (= (and b!718142 res!480758) b!718136))

(assert (= (and b!718136 res!480759) b!718140))

(assert (= (and b!718140 res!480756) b!718141))

(declare-fun m!673283 () Bool)

(assert (=> b!718139 m!673283))

(declare-fun m!673285 () Bool)

(assert (=> start!63926 m!673285))

(declare-fun m!673287 () Bool)

(assert (=> start!63926 m!673287))

(declare-fun m!673289 () Bool)

(assert (=> b!718141 m!673289))

(assert (=> b!718141 m!673289))

(declare-fun m!673291 () Bool)

(assert (=> b!718141 m!673291))

(declare-fun m!673293 () Bool)

(assert (=> b!718134 m!673293))

(declare-fun m!673295 () Bool)

(assert (=> b!718142 m!673295))

(declare-fun m!673297 () Bool)

(assert (=> b!718135 m!673297))

(assert (=> b!718138 m!673289))

(assert (=> b!718138 m!673289))

(declare-fun m!673299 () Bool)

(assert (=> b!718138 m!673299))

(declare-fun m!673301 () Bool)

(assert (=> b!718136 m!673301))

(check-sat (not start!63926) (not b!718135) (not b!718138) (not b!718142) (not b!718136) (not b!718134) (not b!718141) (not b!718139))
(check-sat)
