; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86742 () Bool)

(assert start!86742)

(declare-fun b!1005442 () Bool)

(declare-fun res!674656 () Bool)

(declare-fun e!566103 () Bool)

(assert (=> b!1005442 (=> (not res!674656) (not e!566103))))

(declare-datatypes ((array!63388 0))(
  ( (array!63389 (arr!30516 (Array (_ BitVec 32) (_ BitVec 64))) (size!31020 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63388)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005442 (= res!674656 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31020 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31020 a!3219))))))

(declare-fun b!1005443 () Bool)

(declare-fun e!566104 () Bool)

(assert (=> b!1005443 (= e!566104 e!566103)))

(declare-fun res!674654 () Bool)

(assert (=> b!1005443 (=> (not res!674654) (not e!566103))))

(declare-datatypes ((SeekEntryResult!9473 0))(
  ( (MissingZero!9473 (index!40263 (_ BitVec 32))) (Found!9473 (index!40264 (_ BitVec 32))) (Intermediate!9473 (undefined!10285 Bool) (index!40265 (_ BitVec 32)) (x!87684 (_ BitVec 32))) (Undefined!9473) (MissingVacant!9473 (index!40266 (_ BitVec 32))) )
))
(declare-fun lt!444367 () SeekEntryResult!9473)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005443 (= res!674654 (or (= lt!444367 (MissingVacant!9473 i!1194)) (= lt!444367 (MissingZero!9473 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63388 (_ BitVec 32)) SeekEntryResult!9473)

(assert (=> b!1005443 (= lt!444367 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005444 () Bool)

(declare-fun res!674657 () Bool)

(assert (=> b!1005444 (=> (not res!674657) (not e!566104))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005444 (= res!674657 (and (= (size!31020 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31020 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31020 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005445 () Bool)

(declare-fun res!674662 () Bool)

(assert (=> b!1005445 (=> (not res!674662) (not e!566103))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63388 (_ BitVec 32)) SeekEntryResult!9473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005445 (= res!674662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30516 a!3219) j!170) mask!3464) (select (arr!30516 a!3219) j!170) a!3219 mask!3464) (Intermediate!9473 false resIndex!38 resX!38)))))

(declare-fun b!1005446 () Bool)

(assert (=> b!1005446 (= e!566103 false)))

(declare-fun lt!444366 () SeekEntryResult!9473)

(assert (=> b!1005446 (= lt!444366 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30516 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005447 () Bool)

(declare-fun res!674660 () Bool)

(assert (=> b!1005447 (=> (not res!674660) (not e!566104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005447 (= res!674660 (validKeyInArray!0 (select (arr!30516 a!3219) j!170)))))

(declare-fun b!1005448 () Bool)

(declare-fun res!674658 () Bool)

(assert (=> b!1005448 (=> (not res!674658) (not e!566104))))

(declare-fun arrayContainsKey!0 (array!63388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005448 (= res!674658 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005449 () Bool)

(declare-fun res!674655 () Bool)

(assert (=> b!1005449 (=> (not res!674655) (not e!566103))))

(declare-datatypes ((List!21258 0))(
  ( (Nil!21255) (Cons!21254 (h!22437 (_ BitVec 64)) (t!30250 List!21258)) )
))
(declare-fun arrayNoDuplicates!0 (array!63388 (_ BitVec 32) List!21258) Bool)

(assert (=> b!1005449 (= res!674655 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21255))))

(declare-fun b!1005450 () Bool)

(declare-fun res!674663 () Bool)

(assert (=> b!1005450 (=> (not res!674663) (not e!566104))))

(assert (=> b!1005450 (= res!674663 (validKeyInArray!0 k0!2224))))

(declare-fun res!674659 () Bool)

(assert (=> start!86742 (=> (not res!674659) (not e!566104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86742 (= res!674659 (validMask!0 mask!3464))))

(assert (=> start!86742 e!566104))

(declare-fun array_inv!23659 (array!63388) Bool)

(assert (=> start!86742 (array_inv!23659 a!3219)))

(assert (=> start!86742 true))

(declare-fun b!1005451 () Bool)

(declare-fun res!674661 () Bool)

(assert (=> b!1005451 (=> (not res!674661) (not e!566103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63388 (_ BitVec 32)) Bool)

(assert (=> b!1005451 (= res!674661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86742 res!674659) b!1005444))

(assert (= (and b!1005444 res!674657) b!1005447))

(assert (= (and b!1005447 res!674660) b!1005450))

(assert (= (and b!1005450 res!674663) b!1005448))

(assert (= (and b!1005448 res!674658) b!1005443))

(assert (= (and b!1005443 res!674654) b!1005451))

(assert (= (and b!1005451 res!674661) b!1005449))

(assert (= (and b!1005449 res!674655) b!1005442))

(assert (= (and b!1005442 res!674656) b!1005445))

(assert (= (and b!1005445 res!674662) b!1005446))

(declare-fun m!930127 () Bool)

(assert (=> b!1005448 m!930127))

(declare-fun m!930129 () Bool)

(assert (=> b!1005449 m!930129))

(declare-fun m!930131 () Bool)

(assert (=> b!1005446 m!930131))

(assert (=> b!1005446 m!930131))

(declare-fun m!930133 () Bool)

(assert (=> b!1005446 m!930133))

(declare-fun m!930135 () Bool)

(assert (=> b!1005451 m!930135))

(assert (=> b!1005447 m!930131))

(assert (=> b!1005447 m!930131))

(declare-fun m!930137 () Bool)

(assert (=> b!1005447 m!930137))

(declare-fun m!930139 () Bool)

(assert (=> start!86742 m!930139))

(declare-fun m!930141 () Bool)

(assert (=> start!86742 m!930141))

(assert (=> b!1005445 m!930131))

(assert (=> b!1005445 m!930131))

(declare-fun m!930143 () Bool)

(assert (=> b!1005445 m!930143))

(assert (=> b!1005445 m!930143))

(assert (=> b!1005445 m!930131))

(declare-fun m!930145 () Bool)

(assert (=> b!1005445 m!930145))

(declare-fun m!930147 () Bool)

(assert (=> b!1005443 m!930147))

(declare-fun m!930149 () Bool)

(assert (=> b!1005450 m!930149))

(check-sat (not b!1005443) (not b!1005448) (not b!1005451) (not b!1005447) (not b!1005449) (not b!1005446) (not start!86742) (not b!1005445) (not b!1005450))
(check-sat)
