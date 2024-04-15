; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31812 () Bool)

(assert start!31812)

(declare-fun b!317757 () Bool)

(declare-fun e!197486 () Bool)

(assert (=> b!317757 (= e!197486 (not true))))

(declare-fun e!197489 () Bool)

(assert (=> b!317757 e!197489))

(declare-fun res!172484 () Bool)

(assert (=> b!317757 (=> (not res!172484) (not e!197489))))

(declare-datatypes ((array!16187 0))(
  ( (array!16188 (arr!7659 (Array (_ BitVec 32) (_ BitVec 64))) (size!8012 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16187)

(declare-datatypes ((SeekEntryResult!2798 0))(
  ( (MissingZero!2798 (index!13368 (_ BitVec 32))) (Found!2798 (index!13369 (_ BitVec 32))) (Intermediate!2798 (undefined!3610 Bool) (index!13370 (_ BitVec 32)) (x!31642 (_ BitVec 32))) (Undefined!2798) (MissingVacant!2798 (index!13371 (_ BitVec 32))) )
))
(declare-fun lt!154953 () SeekEntryResult!2798)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!154955 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16187 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!317757 (= res!172484 (= lt!154953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154955 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317757 (= lt!154955 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317758 () Bool)

(declare-fun res!172482 () Bool)

(declare-fun e!197487 () Bool)

(assert (=> b!317758 (=> (not res!172482) (not e!197487))))

(declare-fun arrayContainsKey!0 (array!16187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317758 (= res!172482 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317759 () Bool)

(declare-fun e!197488 () Bool)

(assert (=> b!317759 (= e!197487 e!197488)))

(declare-fun res!172488 () Bool)

(assert (=> b!317759 (=> (not res!172488) (not e!197488))))

(declare-fun lt!154954 () SeekEntryResult!2798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317759 (= res!172488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154954))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317759 (= lt!154954 (Intermediate!2798 false resIndex!52 resX!52))))

(declare-fun b!317760 () Bool)

(declare-fun res!172489 () Bool)

(assert (=> b!317760 (=> (not res!172489) (not e!197488))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317760 (= res!172489 (and (= (select (arr!7659 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8012 a!3293))))))

(declare-fun lt!154952 () array!16187)

(declare-fun b!317761 () Bool)

(assert (=> b!317761 (= e!197489 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154952 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154955 k0!2441 lt!154952 mask!3709)))))

(assert (=> b!317761 (= lt!154952 (array!16188 (store (arr!7659 a!3293) i!1240 k0!2441) (size!8012 a!3293)))))

(declare-fun b!317762 () Bool)

(assert (=> b!317762 (= e!197488 e!197486)))

(declare-fun res!172490 () Bool)

(assert (=> b!317762 (=> (not res!172490) (not e!197486))))

(assert (=> b!317762 (= res!172490 (and (= lt!154953 lt!154954) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7659 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317762 (= lt!154953 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317763 () Bool)

(declare-fun res!172486 () Bool)

(assert (=> b!317763 (=> (not res!172486) (not e!197487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16187 (_ BitVec 32)) Bool)

(assert (=> b!317763 (= res!172486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317764 () Bool)

(declare-fun res!172485 () Bool)

(assert (=> b!317764 (=> (not res!172485) (not e!197487))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16187 (_ BitVec 32)) SeekEntryResult!2798)

(assert (=> b!317764 (= res!172485 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2798 i!1240)))))

(declare-fun b!317765 () Bool)

(declare-fun res!172491 () Bool)

(assert (=> b!317765 (=> (not res!172491) (not e!197487))))

(assert (=> b!317765 (= res!172491 (and (= (size!8012 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8012 a!3293))))))

(declare-fun res!172483 () Bool)

(assert (=> start!31812 (=> (not res!172483) (not e!197487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31812 (= res!172483 (validMask!0 mask!3709))))

(assert (=> start!31812 e!197487))

(declare-fun array_inv!5631 (array!16187) Bool)

(assert (=> start!31812 (array_inv!5631 a!3293)))

(assert (=> start!31812 true))

(declare-fun b!317766 () Bool)

(declare-fun res!172487 () Bool)

(assert (=> b!317766 (=> (not res!172487) (not e!197487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317766 (= res!172487 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31812 res!172483) b!317765))

(assert (= (and b!317765 res!172491) b!317766))

(assert (= (and b!317766 res!172487) b!317758))

(assert (= (and b!317758 res!172482) b!317764))

(assert (= (and b!317764 res!172485) b!317763))

(assert (= (and b!317763 res!172486) b!317759))

(assert (= (and b!317759 res!172488) b!317760))

(assert (= (and b!317760 res!172489) b!317762))

(assert (= (and b!317762 res!172490) b!317757))

(assert (= (and b!317757 res!172484) b!317761))

(declare-fun m!325975 () Bool)

(assert (=> b!317766 m!325975))

(declare-fun m!325977 () Bool)

(assert (=> b!317763 m!325977))

(declare-fun m!325979 () Bool)

(assert (=> b!317758 m!325979))

(declare-fun m!325981 () Bool)

(assert (=> b!317760 m!325981))

(declare-fun m!325983 () Bool)

(assert (=> start!31812 m!325983))

(declare-fun m!325985 () Bool)

(assert (=> start!31812 m!325985))

(declare-fun m!325987 () Bool)

(assert (=> b!317762 m!325987))

(declare-fun m!325989 () Bool)

(assert (=> b!317762 m!325989))

(declare-fun m!325991 () Bool)

(assert (=> b!317757 m!325991))

(declare-fun m!325993 () Bool)

(assert (=> b!317757 m!325993))

(declare-fun m!325995 () Bool)

(assert (=> b!317759 m!325995))

(assert (=> b!317759 m!325995))

(declare-fun m!325997 () Bool)

(assert (=> b!317759 m!325997))

(declare-fun m!325999 () Bool)

(assert (=> b!317761 m!325999))

(declare-fun m!326001 () Bool)

(assert (=> b!317761 m!326001))

(declare-fun m!326003 () Bool)

(assert (=> b!317761 m!326003))

(declare-fun m!326005 () Bool)

(assert (=> b!317764 m!326005))

(check-sat (not b!317759) (not b!317757) (not b!317763) (not b!317764) (not b!317758) (not b!317766) (not b!317761) (not start!31812) (not b!317762))
(check-sat)
