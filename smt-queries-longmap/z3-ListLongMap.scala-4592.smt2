; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64046 () Bool)

(assert start!64046)

(declare-fun b!719286 () Bool)

(declare-fun res!481822 () Bool)

(declare-fun e!403579 () Bool)

(assert (=> b!719286 (=> (not res!481822) (not e!403579))))

(declare-datatypes ((array!40758 0))(
  ( (array!40759 (arr!19505 (Array (_ BitVec 32) (_ BitVec 64))) (size!19926 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40758)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719286 (= res!481822 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719287 () Bool)

(declare-fun res!481819 () Bool)

(declare-fun e!403577 () Bool)

(assert (=> b!719287 (=> (not res!481819) (not e!403577))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40758 (_ BitVec 32)) Bool)

(assert (=> b!719287 (= res!481819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719288 () Bool)

(assert (=> b!719288 (= e!403577 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7102 0))(
  ( (MissingZero!7102 (index!30776 (_ BitVec 32))) (Found!7102 (index!30777 (_ BitVec 32))) (Intermediate!7102 (undefined!7914 Bool) (index!30778 (_ BitVec 32)) (x!61792 (_ BitVec 32))) (Undefined!7102) (MissingVacant!7102 (index!30779 (_ BitVec 32))) )
))
(declare-fun lt!319373 () SeekEntryResult!7102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40758 (_ BitVec 32)) SeekEntryResult!7102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719288 (= lt!319373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19505 a!3186) j!159) mask!3328) (select (arr!19505 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719289 () Bool)

(declare-fun res!481824 () Bool)

(assert (=> b!719289 (=> (not res!481824) (not e!403579))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719289 (= res!481824 (and (= (size!19926 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19926 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19926 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719290 () Bool)

(declare-fun res!481823 () Bool)

(assert (=> b!719290 (=> (not res!481823) (not e!403579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719290 (= res!481823 (validKeyInArray!0 (select (arr!19505 a!3186) j!159)))))

(declare-fun b!719291 () Bool)

(declare-fun res!481827 () Bool)

(assert (=> b!719291 (=> (not res!481827) (not e!403579))))

(assert (=> b!719291 (= res!481827 (validKeyInArray!0 k0!2102))))

(declare-fun res!481820 () Bool)

(assert (=> start!64046 (=> (not res!481820) (not e!403579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64046 (= res!481820 (validMask!0 mask!3328))))

(assert (=> start!64046 e!403579))

(assert (=> start!64046 true))

(declare-fun array_inv!15388 (array!40758) Bool)

(assert (=> start!64046 (array_inv!15388 a!3186)))

(declare-fun b!719292 () Bool)

(declare-fun res!481826 () Bool)

(assert (=> b!719292 (=> (not res!481826) (not e!403577))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719292 (= res!481826 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19926 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19926 a!3186))))))

(declare-fun b!719293 () Bool)

(declare-fun res!481821 () Bool)

(assert (=> b!719293 (=> (not res!481821) (not e!403577))))

(declare-datatypes ((List!13546 0))(
  ( (Nil!13543) (Cons!13542 (h!14590 (_ BitVec 64)) (t!19852 List!13546)) )
))
(declare-fun arrayNoDuplicates!0 (array!40758 (_ BitVec 32) List!13546) Bool)

(assert (=> b!719293 (= res!481821 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13543))))

(declare-fun b!719294 () Bool)

(assert (=> b!719294 (= e!403579 e!403577)))

(declare-fun res!481825 () Bool)

(assert (=> b!719294 (=> (not res!481825) (not e!403577))))

(declare-fun lt!319372 () SeekEntryResult!7102)

(assert (=> b!719294 (= res!481825 (or (= lt!319372 (MissingZero!7102 i!1173)) (= lt!319372 (MissingVacant!7102 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40758 (_ BitVec 32)) SeekEntryResult!7102)

(assert (=> b!719294 (= lt!319372 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64046 res!481820) b!719289))

(assert (= (and b!719289 res!481824) b!719290))

(assert (= (and b!719290 res!481823) b!719291))

(assert (= (and b!719291 res!481827) b!719286))

(assert (= (and b!719286 res!481822) b!719294))

(assert (= (and b!719294 res!481825) b!719287))

(assert (= (and b!719287 res!481819) b!719293))

(assert (= (and b!719293 res!481821) b!719292))

(assert (= (and b!719292 res!481826) b!719288))

(declare-fun m!674165 () Bool)

(assert (=> b!719286 m!674165))

(declare-fun m!674167 () Bool)

(assert (=> b!719288 m!674167))

(assert (=> b!719288 m!674167))

(declare-fun m!674169 () Bool)

(assert (=> b!719288 m!674169))

(assert (=> b!719288 m!674169))

(assert (=> b!719288 m!674167))

(declare-fun m!674171 () Bool)

(assert (=> b!719288 m!674171))

(declare-fun m!674173 () Bool)

(assert (=> b!719287 m!674173))

(declare-fun m!674175 () Bool)

(assert (=> b!719291 m!674175))

(declare-fun m!674177 () Bool)

(assert (=> b!719293 m!674177))

(declare-fun m!674179 () Bool)

(assert (=> b!719294 m!674179))

(assert (=> b!719290 m!674167))

(assert (=> b!719290 m!674167))

(declare-fun m!674181 () Bool)

(assert (=> b!719290 m!674181))

(declare-fun m!674183 () Bool)

(assert (=> start!64046 m!674183))

(declare-fun m!674185 () Bool)

(assert (=> start!64046 m!674185))

(check-sat (not b!719293) (not b!719287) (not b!719294) (not b!719290) (not b!719291) (not b!719288) (not start!64046) (not b!719286))
(check-sat)
