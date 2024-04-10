; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86536 () Bool)

(assert start!86536)

(declare-fun b!1002813 () Bool)

(declare-fun res!672294 () Bool)

(declare-fun e!564897 () Bool)

(assert (=> b!1002813 (=> (not res!672294) (not e!564897))))

(declare-datatypes ((array!63337 0))(
  ( (array!63338 (arr!30494 (Array (_ BitVec 32) (_ BitVec 64))) (size!30996 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63337)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002813 (= res!672294 (and (= (size!30996 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30996 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30996 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002814 () Bool)

(declare-fun e!564895 () Bool)

(assert (=> b!1002814 (= e!564895 false)))

(declare-fun lt!443362 () array!63337)

(declare-fun lt!443369 () (_ BitVec 64))

(declare-fun lt!443366 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9426 0))(
  ( (MissingZero!9426 (index!40075 (_ BitVec 32))) (Found!9426 (index!40076 (_ BitVec 32))) (Intermediate!9426 (undefined!10238 Bool) (index!40077 (_ BitVec 32)) (x!87486 (_ BitVec 32))) (Undefined!9426) (MissingVacant!9426 (index!40078 (_ BitVec 32))) )
))
(declare-fun lt!443368 () SeekEntryResult!9426)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63337 (_ BitVec 32)) SeekEntryResult!9426)

(assert (=> b!1002814 (= lt!443368 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443366 lt!443369 lt!443362 mask!3464))))

(declare-fun b!1002815 () Bool)

(declare-fun res!672300 () Bool)

(declare-fun e!564899 () Bool)

(assert (=> b!1002815 (=> (not res!672300) (not e!564899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63337 (_ BitVec 32)) Bool)

(assert (=> b!1002815 (= res!672300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002816 () Bool)

(declare-fun res!672291 () Bool)

(assert (=> b!1002816 (=> (not res!672291) (not e!564895))))

(declare-fun lt!443367 () SeekEntryResult!9426)

(assert (=> b!1002816 (= res!672291 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443366 (select (arr!30494 a!3219) j!170) a!3219 mask!3464) lt!443367))))

(declare-fun b!1002817 () Bool)

(declare-fun res!672305 () Bool)

(assert (=> b!1002817 (=> (not res!672305) (not e!564899))))

(declare-datatypes ((List!21170 0))(
  ( (Nil!21167) (Cons!21166 (h!22343 (_ BitVec 64)) (t!30171 List!21170)) )
))
(declare-fun arrayNoDuplicates!0 (array!63337 (_ BitVec 32) List!21170) Bool)

(assert (=> b!1002817 (= res!672305 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21167))))

(declare-fun b!1002818 () Bool)

(declare-fun res!672295 () Bool)

(assert (=> b!1002818 (=> (not res!672295) (not e!564897))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002818 (= res!672295 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002820 () Bool)

(declare-fun e!564901 () Bool)

(assert (=> b!1002820 (= e!564899 e!564901)))

(declare-fun res!672293 () Bool)

(assert (=> b!1002820 (=> (not res!672293) (not e!564901))))

(declare-fun lt!443363 () SeekEntryResult!9426)

(assert (=> b!1002820 (= res!672293 (= lt!443363 lt!443367))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002820 (= lt!443367 (Intermediate!9426 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002820 (= lt!443363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30494 a!3219) j!170) mask!3464) (select (arr!30494 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002821 () Bool)

(declare-fun res!672302 () Bool)

(assert (=> b!1002821 (=> (not res!672302) (not e!564897))))

(assert (=> b!1002821 (= res!672302 (validKeyInArray!0 (select (arr!30494 a!3219) j!170)))))

(declare-fun b!1002822 () Bool)

(declare-fun res!672304 () Bool)

(declare-fun e!564900 () Bool)

(assert (=> b!1002822 (=> (not res!672304) (not e!564900))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002822 (= res!672304 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002823 () Bool)

(declare-fun res!672301 () Bool)

(assert (=> b!1002823 (=> (not res!672301) (not e!564900))))

(declare-fun lt!443364 () SeekEntryResult!9426)

(assert (=> b!1002823 (= res!672301 (not (= lt!443364 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443369 lt!443362 mask!3464))))))

(declare-fun b!1002824 () Bool)

(assert (=> b!1002824 (= e!564897 e!564899)))

(declare-fun res!672306 () Bool)

(assert (=> b!1002824 (=> (not res!672306) (not e!564899))))

(declare-fun lt!443365 () SeekEntryResult!9426)

(assert (=> b!1002824 (= res!672306 (or (= lt!443365 (MissingVacant!9426 i!1194)) (= lt!443365 (MissingZero!9426 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63337 (_ BitVec 32)) SeekEntryResult!9426)

(assert (=> b!1002824 (= lt!443365 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002825 () Bool)

(declare-fun res!672303 () Bool)

(assert (=> b!1002825 (=> (not res!672303) (not e!564897))))

(declare-fun arrayContainsKey!0 (array!63337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002825 (= res!672303 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002826 () Bool)

(assert (=> b!1002826 (= e!564900 e!564895)))

(declare-fun res!672299 () Bool)

(assert (=> b!1002826 (=> (not res!672299) (not e!564895))))

(assert (=> b!1002826 (= res!672299 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443366 #b00000000000000000000000000000000) (bvslt lt!443366 (size!30996 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002826 (= lt!443366 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!672297 () Bool)

(assert (=> start!86536 (=> (not res!672297) (not e!564897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86536 (= res!672297 (validMask!0 mask!3464))))

(assert (=> start!86536 e!564897))

(declare-fun array_inv!23618 (array!63337) Bool)

(assert (=> start!86536 (array_inv!23618 a!3219)))

(assert (=> start!86536 true))

(declare-fun b!1002819 () Bool)

(declare-fun res!672292 () Bool)

(assert (=> b!1002819 (=> (not res!672292) (not e!564899))))

(assert (=> b!1002819 (= res!672292 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30996 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30996 a!3219))))))

(declare-fun b!1002827 () Bool)

(declare-fun e!564896 () Bool)

(assert (=> b!1002827 (= e!564901 e!564896)))

(declare-fun res!672296 () Bool)

(assert (=> b!1002827 (=> (not res!672296) (not e!564896))))

(assert (=> b!1002827 (= res!672296 (= lt!443364 lt!443367))))

(assert (=> b!1002827 (= lt!443364 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30494 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002828 () Bool)

(assert (=> b!1002828 (= e!564896 e!564900)))

(declare-fun res!672298 () Bool)

(assert (=> b!1002828 (=> (not res!672298) (not e!564900))))

(assert (=> b!1002828 (= res!672298 (not (= lt!443363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443369 mask!3464) lt!443369 lt!443362 mask!3464))))))

(assert (=> b!1002828 (= lt!443369 (select (store (arr!30494 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002828 (= lt!443362 (array!63338 (store (arr!30494 a!3219) i!1194 k0!2224) (size!30996 a!3219)))))

(assert (= (and start!86536 res!672297) b!1002813))

(assert (= (and b!1002813 res!672294) b!1002821))

(assert (= (and b!1002821 res!672302) b!1002818))

(assert (= (and b!1002818 res!672295) b!1002825))

(assert (= (and b!1002825 res!672303) b!1002824))

(assert (= (and b!1002824 res!672306) b!1002815))

(assert (= (and b!1002815 res!672300) b!1002817))

(assert (= (and b!1002817 res!672305) b!1002819))

(assert (= (and b!1002819 res!672292) b!1002820))

(assert (= (and b!1002820 res!672293) b!1002827))

(assert (= (and b!1002827 res!672296) b!1002828))

(assert (= (and b!1002828 res!672298) b!1002823))

(assert (= (and b!1002823 res!672301) b!1002822))

(assert (= (and b!1002822 res!672304) b!1002826))

(assert (= (and b!1002826 res!672299) b!1002816))

(assert (= (and b!1002816 res!672291) b!1002814))

(declare-fun m!928629 () Bool)

(assert (=> b!1002818 m!928629))

(declare-fun m!928631 () Bool)

(assert (=> b!1002816 m!928631))

(assert (=> b!1002816 m!928631))

(declare-fun m!928633 () Bool)

(assert (=> b!1002816 m!928633))

(assert (=> b!1002827 m!928631))

(assert (=> b!1002827 m!928631))

(declare-fun m!928635 () Bool)

(assert (=> b!1002827 m!928635))

(assert (=> b!1002820 m!928631))

(assert (=> b!1002820 m!928631))

(declare-fun m!928637 () Bool)

(assert (=> b!1002820 m!928637))

(assert (=> b!1002820 m!928637))

(assert (=> b!1002820 m!928631))

(declare-fun m!928639 () Bool)

(assert (=> b!1002820 m!928639))

(declare-fun m!928641 () Bool)

(assert (=> start!86536 m!928641))

(declare-fun m!928643 () Bool)

(assert (=> start!86536 m!928643))

(declare-fun m!928645 () Bool)

(assert (=> b!1002815 m!928645))

(declare-fun m!928647 () Bool)

(assert (=> b!1002828 m!928647))

(assert (=> b!1002828 m!928647))

(declare-fun m!928649 () Bool)

(assert (=> b!1002828 m!928649))

(declare-fun m!928651 () Bool)

(assert (=> b!1002828 m!928651))

(declare-fun m!928653 () Bool)

(assert (=> b!1002828 m!928653))

(declare-fun m!928655 () Bool)

(assert (=> b!1002823 m!928655))

(declare-fun m!928657 () Bool)

(assert (=> b!1002824 m!928657))

(assert (=> b!1002821 m!928631))

(assert (=> b!1002821 m!928631))

(declare-fun m!928659 () Bool)

(assert (=> b!1002821 m!928659))

(declare-fun m!928661 () Bool)

(assert (=> b!1002825 m!928661))

(declare-fun m!928663 () Bool)

(assert (=> b!1002826 m!928663))

(declare-fun m!928665 () Bool)

(assert (=> b!1002814 m!928665))

(declare-fun m!928667 () Bool)

(assert (=> b!1002817 m!928667))

(check-sat (not start!86536) (not b!1002821) (not b!1002823) (not b!1002827) (not b!1002826) (not b!1002818) (not b!1002825) (not b!1002816) (not b!1002815) (not b!1002820) (not b!1002814) (not b!1002824) (not b!1002817) (not b!1002828))
(check-sat)
