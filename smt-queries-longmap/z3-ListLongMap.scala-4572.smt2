; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63792 () Bool)

(assert start!63792)

(declare-fun b!717577 () Bool)

(declare-fun res!480220 () Bool)

(declare-fun e!402918 () Bool)

(assert (=> b!717577 (=> (not res!480220) (not e!402918))))

(declare-datatypes ((array!40621 0))(
  ( (array!40622 (arr!19441 (Array (_ BitVec 32) (_ BitVec 64))) (size!19861 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40621)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717577 (= res!480220 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480217 () Bool)

(assert (=> start!63792 (=> (not res!480217) (not e!402918))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63792 (= res!480217 (validMask!0 mask!3328))))

(assert (=> start!63792 e!402918))

(declare-fun array_inv!15300 (array!40621) Bool)

(assert (=> start!63792 (array_inv!15300 a!3186)))

(assert (=> start!63792 true))

(declare-fun b!717578 () Bool)

(declare-fun res!480219 () Bool)

(assert (=> b!717578 (=> (not res!480219) (not e!402918))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717578 (= res!480219 (validKeyInArray!0 (select (arr!19441 a!3186) j!159)))))

(declare-fun b!717579 () Bool)

(declare-fun res!480218 () Bool)

(assert (=> b!717579 (=> (not res!480218) (not e!402918))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717579 (= res!480218 (and (= (size!19861 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19861 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19861 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717580 () Bool)

(declare-fun res!480214 () Bool)

(assert (=> b!717580 (=> (not res!480214) (not e!402918))))

(assert (=> b!717580 (= res!480214 (validKeyInArray!0 k0!2102))))

(declare-fun b!717581 () Bool)

(declare-fun e!402916 () Bool)

(assert (=> b!717581 (= e!402916 (bvsgt #b00000000000000000000000000000000 (size!19861 a!3186)))))

(declare-fun b!717582 () Bool)

(declare-fun res!480215 () Bool)

(assert (=> b!717582 (=> (not res!480215) (not e!402916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40621 (_ BitVec 32)) Bool)

(assert (=> b!717582 (= res!480215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717583 () Bool)

(assert (=> b!717583 (= e!402918 e!402916)))

(declare-fun res!480216 () Bool)

(assert (=> b!717583 (=> (not res!480216) (not e!402916))))

(declare-datatypes ((SeekEntryResult!6997 0))(
  ( (MissingZero!6997 (index!30356 (_ BitVec 32))) (Found!6997 (index!30357 (_ BitVec 32))) (Intermediate!6997 (undefined!7809 Bool) (index!30358 (_ BitVec 32)) (x!61532 (_ BitVec 32))) (Undefined!6997) (MissingVacant!6997 (index!30359 (_ BitVec 32))) )
))
(declare-fun lt!319161 () SeekEntryResult!6997)

(assert (=> b!717583 (= res!480216 (or (= lt!319161 (MissingZero!6997 i!1173)) (= lt!319161 (MissingVacant!6997 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40621 (_ BitVec 32)) SeekEntryResult!6997)

(assert (=> b!717583 (= lt!319161 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!63792 res!480217) b!717579))

(assert (= (and b!717579 res!480218) b!717578))

(assert (= (and b!717578 res!480219) b!717580))

(assert (= (and b!717580 res!480214) b!717577))

(assert (= (and b!717577 res!480220) b!717583))

(assert (= (and b!717583 res!480216) b!717582))

(assert (= (and b!717582 res!480215) b!717581))

(declare-fun m!674043 () Bool)

(assert (=> b!717582 m!674043))

(declare-fun m!674045 () Bool)

(assert (=> b!717577 m!674045))

(declare-fun m!674047 () Bool)

(assert (=> b!717583 m!674047))

(declare-fun m!674049 () Bool)

(assert (=> b!717580 m!674049))

(declare-fun m!674051 () Bool)

(assert (=> b!717578 m!674051))

(assert (=> b!717578 m!674051))

(declare-fun m!674053 () Bool)

(assert (=> b!717578 m!674053))

(declare-fun m!674055 () Bool)

(assert (=> start!63792 m!674055))

(declare-fun m!674057 () Bool)

(assert (=> start!63792 m!674057))

(check-sat (not b!717582) (not b!717578) (not b!717577) (not b!717583) (not start!63792) (not b!717580))
(check-sat)
