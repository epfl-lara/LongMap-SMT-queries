; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69374 () Bool)

(assert start!69374)

(declare-fun b!808127 () Bool)

(declare-fun res!551703 () Bool)

(declare-fun e!447532 () Bool)

(assert (=> b!808127 (=> (not res!551703) (not e!447532))))

(declare-datatypes ((array!43906 0))(
  ( (array!43907 (arr!21025 (Array (_ BitVec 32) (_ BitVec 64))) (size!21445 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43906)

(declare-datatypes ((List!14895 0))(
  ( (Nil!14892) (Cons!14891 (h!16026 (_ BitVec 64)) (t!21202 List!14895)) )
))
(declare-fun arrayNoDuplicates!0 (array!43906 (_ BitVec 32) List!14895) Bool)

(assert (=> b!808127 (= res!551703 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14892))))

(declare-fun res!551712 () Bool)

(declare-fun e!447534 () Bool)

(assert (=> start!69374 (=> (not res!551712) (not e!447534))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69374 (= res!551712 (validMask!0 mask!3266))))

(assert (=> start!69374 e!447534))

(assert (=> start!69374 true))

(declare-fun array_inv!16884 (array!43906) Bool)

(assert (=> start!69374 (array_inv!16884 a!3170)))

(declare-fun b!808128 () Bool)

(declare-fun e!447531 () Bool)

(declare-fun e!447535 () Bool)

(assert (=> b!808128 (= e!447531 e!447535)))

(declare-fun res!551704 () Bool)

(assert (=> b!808128 (=> (not res!551704) (not e!447535))))

(declare-datatypes ((SeekEntryResult!8572 0))(
  ( (MissingZero!8572 (index!36656 (_ BitVec 32))) (Found!8572 (index!36657 (_ BitVec 32))) (Intermediate!8572 (undefined!9384 Bool) (index!36658 (_ BitVec 32)) (x!67630 (_ BitVec 32))) (Undefined!8572) (MissingVacant!8572 (index!36659 (_ BitVec 32))) )
))
(declare-fun lt!361979 () SeekEntryResult!8572)

(declare-fun lt!361977 () SeekEntryResult!8572)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808128 (= res!551704 (and (= lt!361977 lt!361979) (= lt!361979 (Found!8572 j!153)) (not (= (select (arr!21025 a!3170) index!1236) (select (arr!21025 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43906 (_ BitVec 32)) SeekEntryResult!8572)

(assert (=> b!808128 (= lt!361979 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21025 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43906 (_ BitVec 32)) SeekEntryResult!8572)

(assert (=> b!808128 (= lt!361977 (seekEntryOrOpen!0 (select (arr!21025 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808129 () Bool)

(declare-fun res!551708 () Bool)

(assert (=> b!808129 (=> (not res!551708) (not e!447534))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808129 (= res!551708 (validKeyInArray!0 k0!2044))))

(declare-fun b!808130 () Bool)

(declare-fun res!551707 () Bool)

(assert (=> b!808130 (=> (not res!551707) (not e!447532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43906 (_ BitVec 32)) Bool)

(assert (=> b!808130 (= res!551707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808131 () Bool)

(declare-fun res!551702 () Bool)

(assert (=> b!808131 (=> (not res!551702) (not e!447534))))

(assert (=> b!808131 (= res!551702 (validKeyInArray!0 (select (arr!21025 a!3170) j!153)))))

(declare-fun b!808132 () Bool)

(assert (=> b!808132 (= e!447534 e!447532)))

(declare-fun res!551710 () Bool)

(assert (=> b!808132 (=> (not res!551710) (not e!447532))))

(declare-fun lt!361982 () SeekEntryResult!8572)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808132 (= res!551710 (or (= lt!361982 (MissingZero!8572 i!1163)) (= lt!361982 (MissingVacant!8572 i!1163))))))

(assert (=> b!808132 (= lt!361982 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808133 () Bool)

(assert (=> b!808133 (= e!447535 false)))

(declare-fun lt!361981 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808133 (= lt!361981 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808134 () Bool)

(assert (=> b!808134 (= e!447532 e!447531)))

(declare-fun res!551709 () Bool)

(assert (=> b!808134 (=> (not res!551709) (not e!447531))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361978 () array!43906)

(declare-fun lt!361980 () (_ BitVec 64))

(assert (=> b!808134 (= res!551709 (= (seekEntryOrOpen!0 lt!361980 lt!361978 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361980 lt!361978 mask!3266)))))

(assert (=> b!808134 (= lt!361980 (select (store (arr!21025 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808134 (= lt!361978 (array!43907 (store (arr!21025 a!3170) i!1163 k0!2044) (size!21445 a!3170)))))

(declare-fun b!808135 () Bool)

(declare-fun res!551706 () Bool)

(assert (=> b!808135 (=> (not res!551706) (not e!447534))))

(assert (=> b!808135 (= res!551706 (and (= (size!21445 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21445 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21445 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808136 () Bool)

(declare-fun res!551705 () Bool)

(assert (=> b!808136 (=> (not res!551705) (not e!447532))))

(assert (=> b!808136 (= res!551705 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21445 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21025 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21445 a!3170)) (= (select (arr!21025 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808137 () Bool)

(declare-fun res!551711 () Bool)

(assert (=> b!808137 (=> (not res!551711) (not e!447534))))

(declare-fun arrayContainsKey!0 (array!43906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808137 (= res!551711 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69374 res!551712) b!808135))

(assert (= (and b!808135 res!551706) b!808131))

(assert (= (and b!808131 res!551702) b!808129))

(assert (= (and b!808129 res!551708) b!808137))

(assert (= (and b!808137 res!551711) b!808132))

(assert (= (and b!808132 res!551710) b!808130))

(assert (= (and b!808130 res!551707) b!808127))

(assert (= (and b!808127 res!551703) b!808136))

(assert (= (and b!808136 res!551705) b!808134))

(assert (= (and b!808134 res!551709) b!808128))

(assert (= (and b!808128 res!551704) b!808133))

(declare-fun m!750499 () Bool)

(assert (=> b!808133 m!750499))

(declare-fun m!750501 () Bool)

(assert (=> b!808134 m!750501))

(declare-fun m!750503 () Bool)

(assert (=> b!808134 m!750503))

(declare-fun m!750505 () Bool)

(assert (=> b!808134 m!750505))

(declare-fun m!750507 () Bool)

(assert (=> b!808134 m!750507))

(declare-fun m!750509 () Bool)

(assert (=> b!808132 m!750509))

(declare-fun m!750511 () Bool)

(assert (=> b!808137 m!750511))

(declare-fun m!750513 () Bool)

(assert (=> start!69374 m!750513))

(declare-fun m!750515 () Bool)

(assert (=> start!69374 m!750515))

(declare-fun m!750517 () Bool)

(assert (=> b!808127 m!750517))

(declare-fun m!750519 () Bool)

(assert (=> b!808129 m!750519))

(declare-fun m!750521 () Bool)

(assert (=> b!808136 m!750521))

(declare-fun m!750523 () Bool)

(assert (=> b!808136 m!750523))

(declare-fun m!750525 () Bool)

(assert (=> b!808130 m!750525))

(declare-fun m!750527 () Bool)

(assert (=> b!808128 m!750527))

(declare-fun m!750529 () Bool)

(assert (=> b!808128 m!750529))

(assert (=> b!808128 m!750529))

(declare-fun m!750531 () Bool)

(assert (=> b!808128 m!750531))

(assert (=> b!808128 m!750529))

(declare-fun m!750533 () Bool)

(assert (=> b!808128 m!750533))

(assert (=> b!808131 m!750529))

(assert (=> b!808131 m!750529))

(declare-fun m!750535 () Bool)

(assert (=> b!808131 m!750535))

(check-sat (not b!808134) (not b!808129) (not b!808131) (not b!808130) (not b!808137) (not b!808133) (not b!808128) (not b!808132) (not start!69374) (not b!808127))
(check-sat)
