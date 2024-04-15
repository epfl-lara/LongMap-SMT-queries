; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86292 () Bool)

(assert start!86292)

(declare-fun b!998712 () Bool)

(declare-fun res!668478 () Bool)

(declare-fun e!563147 () Bool)

(assert (=> b!998712 (=> (not res!668478) (not e!563147))))

(declare-datatypes ((array!63091 0))(
  ( (array!63092 (arr!30372 (Array (_ BitVec 32) (_ BitVec 64))) (size!30876 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63091)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998712 (= res!668478 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998713 () Bool)

(declare-fun res!668475 () Bool)

(declare-fun e!563150 () Bool)

(assert (=> b!998713 (=> (not res!668475) (not e!563150))))

(declare-datatypes ((List!21114 0))(
  ( (Nil!21111) (Cons!21110 (h!22284 (_ BitVec 64)) (t!30106 List!21114)) )
))
(declare-fun arrayNoDuplicates!0 (array!63091 (_ BitVec 32) List!21114) Bool)

(assert (=> b!998713 (= res!668475 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21111))))

(declare-fun b!998714 () Bool)

(declare-fun res!668483 () Bool)

(assert (=> b!998714 (=> (not res!668483) (not e!563147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998714 (= res!668483 (validKeyInArray!0 k0!2224))))

(declare-fun b!998715 () Bool)

(declare-fun e!563148 () Bool)

(assert (=> b!998715 (= e!563150 e!563148)))

(declare-fun res!668476 () Bool)

(assert (=> b!998715 (=> (not res!668476) (not e!563148))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9329 0))(
  ( (MissingZero!9329 (index!39687 (_ BitVec 32))) (Found!9329 (index!39688 (_ BitVec 32))) (Intermediate!9329 (undefined!10141 Bool) (index!39689 (_ BitVec 32)) (x!87138 (_ BitVec 32))) (Undefined!9329) (MissingVacant!9329 (index!39690 (_ BitVec 32))) )
))
(declare-fun lt!441627 () SeekEntryResult!9329)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63091 (_ BitVec 32)) SeekEntryResult!9329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998715 (= res!668476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30372 a!3219) j!170) mask!3464) (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441627))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998715 (= lt!441627 (Intermediate!9329 false resIndex!38 resX!38))))

(declare-fun b!998716 () Bool)

(assert (=> b!998716 (= e!563148 false)))

(declare-fun lt!441626 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998716 (= lt!441626 (toIndex!0 (select (store (arr!30372 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998717 () Bool)

(declare-fun res!668480 () Bool)

(assert (=> b!998717 (=> (not res!668480) (not e!563147))))

(assert (=> b!998717 (= res!668480 (validKeyInArray!0 (select (arr!30372 a!3219) j!170)))))

(declare-fun res!668477 () Bool)

(assert (=> start!86292 (=> (not res!668477) (not e!563147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86292 (= res!668477 (validMask!0 mask!3464))))

(assert (=> start!86292 e!563147))

(declare-fun array_inv!23515 (array!63091) Bool)

(assert (=> start!86292 (array_inv!23515 a!3219)))

(assert (=> start!86292 true))

(declare-fun b!998718 () Bool)

(declare-fun res!668481 () Bool)

(assert (=> b!998718 (=> (not res!668481) (not e!563150))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998718 (= res!668481 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30876 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30876 a!3219))))))

(declare-fun b!998719 () Bool)

(assert (=> b!998719 (= e!563147 e!563150)))

(declare-fun res!668479 () Bool)

(assert (=> b!998719 (=> (not res!668479) (not e!563150))))

(declare-fun lt!441628 () SeekEntryResult!9329)

(assert (=> b!998719 (= res!668479 (or (= lt!441628 (MissingVacant!9329 i!1194)) (= lt!441628 (MissingZero!9329 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63091 (_ BitVec 32)) SeekEntryResult!9329)

(assert (=> b!998719 (= lt!441628 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998720 () Bool)

(declare-fun res!668473 () Bool)

(assert (=> b!998720 (=> (not res!668473) (not e!563150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63091 (_ BitVec 32)) Bool)

(assert (=> b!998720 (= res!668473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998721 () Bool)

(declare-fun res!668482 () Bool)

(assert (=> b!998721 (=> (not res!668482) (not e!563148))))

(assert (=> b!998721 (= res!668482 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30372 a!3219) j!170) a!3219 mask!3464) lt!441627))))

(declare-fun b!998722 () Bool)

(declare-fun res!668474 () Bool)

(assert (=> b!998722 (=> (not res!668474) (not e!563147))))

(assert (=> b!998722 (= res!668474 (and (= (size!30876 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30876 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30876 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86292 res!668477) b!998722))

(assert (= (and b!998722 res!668474) b!998717))

(assert (= (and b!998717 res!668480) b!998714))

(assert (= (and b!998714 res!668483) b!998712))

(assert (= (and b!998712 res!668478) b!998719))

(assert (= (and b!998719 res!668479) b!998720))

(assert (= (and b!998720 res!668473) b!998713))

(assert (= (and b!998713 res!668475) b!998718))

(assert (= (and b!998718 res!668481) b!998715))

(assert (= (and b!998715 res!668476) b!998721))

(assert (= (and b!998721 res!668482) b!998716))

(declare-fun m!924583 () Bool)

(assert (=> b!998714 m!924583))

(declare-fun m!924585 () Bool)

(assert (=> b!998719 m!924585))

(declare-fun m!924587 () Bool)

(assert (=> b!998715 m!924587))

(assert (=> b!998715 m!924587))

(declare-fun m!924589 () Bool)

(assert (=> b!998715 m!924589))

(assert (=> b!998715 m!924589))

(assert (=> b!998715 m!924587))

(declare-fun m!924591 () Bool)

(assert (=> b!998715 m!924591))

(assert (=> b!998721 m!924587))

(assert (=> b!998721 m!924587))

(declare-fun m!924593 () Bool)

(assert (=> b!998721 m!924593))

(declare-fun m!924595 () Bool)

(assert (=> b!998720 m!924595))

(declare-fun m!924597 () Bool)

(assert (=> start!86292 m!924597))

(declare-fun m!924599 () Bool)

(assert (=> start!86292 m!924599))

(declare-fun m!924601 () Bool)

(assert (=> b!998713 m!924601))

(assert (=> b!998717 m!924587))

(assert (=> b!998717 m!924587))

(declare-fun m!924603 () Bool)

(assert (=> b!998717 m!924603))

(declare-fun m!924605 () Bool)

(assert (=> b!998716 m!924605))

(declare-fun m!924607 () Bool)

(assert (=> b!998716 m!924607))

(assert (=> b!998716 m!924607))

(declare-fun m!924609 () Bool)

(assert (=> b!998716 m!924609))

(declare-fun m!924611 () Bool)

(assert (=> b!998712 m!924611))

(check-sat (not b!998717) (not b!998713) (not b!998720) (not b!998715) (not b!998714) (not start!86292) (not b!998719) (not b!998716) (not b!998712) (not b!998721))
(check-sat)
