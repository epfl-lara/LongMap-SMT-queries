; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31372 () Bool)

(assert start!31372)

(declare-fun b!314416 () Bool)

(declare-fun res!170166 () Bool)

(declare-fun e!195841 () Bool)

(assert (=> b!314416 (=> (not res!170166) (not e!195841))))

(declare-datatypes ((array!16043 0))(
  ( (array!16044 (arr!7596 (Array (_ BitVec 32) (_ BitVec 64))) (size!7948 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16043)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314416 (= res!170166 (and (= (size!7948 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7948 a!3293))))))

(declare-fun b!314417 () Bool)

(declare-fun res!170168 () Bool)

(assert (=> b!314417 (=> (not res!170168) (not e!195841))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314417 (= res!170168 (and (= (select (arr!7596 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7948 a!3293))))))

(declare-fun b!314418 () Bool)

(declare-fun res!170165 () Bool)

(assert (=> b!314418 (=> (not res!170165) (not e!195841))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2736 0))(
  ( (MissingZero!2736 (index!13120 (_ BitVec 32))) (Found!2736 (index!13121 (_ BitVec 32))) (Intermediate!2736 (undefined!3548 Bool) (index!13122 (_ BitVec 32)) (x!31350 (_ BitVec 32))) (Undefined!2736) (MissingVacant!2736 (index!13123 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16043 (_ BitVec 32)) SeekEntryResult!2736)

(assert (=> b!314418 (= res!170165 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2736 i!1240)))))

(declare-fun b!314419 () Bool)

(declare-fun res!170167 () Bool)

(assert (=> b!314419 (=> (not res!170167) (not e!195841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16043 (_ BitVec 32)) Bool)

(assert (=> b!314419 (= res!170167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314420 () Bool)

(assert (=> b!314420 (= e!195841 false)))

(declare-fun lt!153903 () SeekEntryResult!2736)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16043 (_ BitVec 32)) SeekEntryResult!2736)

(assert (=> b!314420 (= lt!153903 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314421 () Bool)

(declare-fun res!170170 () Bool)

(assert (=> b!314421 (=> (not res!170170) (not e!195841))))

(declare-fun arrayContainsKey!0 (array!16043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314421 (= res!170170 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170169 () Bool)

(assert (=> start!31372 (=> (not res!170169) (not e!195841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31372 (= res!170169 (validMask!0 mask!3709))))

(assert (=> start!31372 e!195841))

(declare-fun array_inv!5559 (array!16043) Bool)

(assert (=> start!31372 (array_inv!5559 a!3293)))

(assert (=> start!31372 true))

(declare-fun b!314422 () Bool)

(declare-fun res!170171 () Bool)

(assert (=> b!314422 (=> (not res!170171) (not e!195841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314422 (= res!170171 (validKeyInArray!0 k0!2441))))

(declare-fun b!314423 () Bool)

(declare-fun res!170172 () Bool)

(assert (=> b!314423 (=> (not res!170172) (not e!195841))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314423 (= res!170172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2736 false resIndex!52 resX!52)))))

(assert (= (and start!31372 res!170169) b!314416))

(assert (= (and b!314416 res!170166) b!314422))

(assert (= (and b!314422 res!170171) b!314421))

(assert (= (and b!314421 res!170170) b!314418))

(assert (= (and b!314418 res!170165) b!314419))

(assert (= (and b!314419 res!170167) b!314423))

(assert (= (and b!314423 res!170172) b!314417))

(assert (= (and b!314417 res!170168) b!314420))

(declare-fun m!323977 () Bool)

(assert (=> b!314419 m!323977))

(declare-fun m!323979 () Bool)

(assert (=> b!314420 m!323979))

(declare-fun m!323981 () Bool)

(assert (=> b!314417 m!323981))

(declare-fun m!323983 () Bool)

(assert (=> b!314422 m!323983))

(declare-fun m!323985 () Bool)

(assert (=> b!314418 m!323985))

(declare-fun m!323987 () Bool)

(assert (=> b!314421 m!323987))

(declare-fun m!323989 () Bool)

(assert (=> b!314423 m!323989))

(assert (=> b!314423 m!323989))

(declare-fun m!323991 () Bool)

(assert (=> b!314423 m!323991))

(declare-fun m!323993 () Bool)

(assert (=> start!31372 m!323993))

(declare-fun m!323995 () Bool)

(assert (=> start!31372 m!323995))

(check-sat (not b!314420) (not b!314423) (not b!314419) (not b!314422) (not b!314418) (not b!314421) (not start!31372))
