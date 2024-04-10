; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68626 () Bool)

(assert start!68626)

(declare-fun b!798600 () Bool)

(declare-fun e!442956 () Bool)

(declare-fun e!442955 () Bool)

(assert (=> b!798600 (= e!442956 e!442955)))

(declare-fun res!543124 () Bool)

(assert (=> b!798600 (=> (not res!543124) (not e!442955))))

(declare-datatypes ((SeekEntryResult!8379 0))(
  ( (MissingZero!8379 (index!35884 (_ BitVec 32))) (Found!8379 (index!35885 (_ BitVec 32))) (Intermediate!8379 (undefined!9191 Bool) (index!35886 (_ BitVec 32)) (x!66769 (_ BitVec 32))) (Undefined!8379) (MissingVacant!8379 (index!35887 (_ BitVec 32))) )
))
(declare-fun lt!356500 () SeekEntryResult!8379)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798600 (= res!543124 (or (= lt!356500 (MissingZero!8379 i!1163)) (= lt!356500 (MissingVacant!8379 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43416 0))(
  ( (array!43417 (arr!20788 (Array (_ BitVec 32) (_ BitVec 64))) (size!21209 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43416)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43416 (_ BitVec 32)) SeekEntryResult!8379)

(assert (=> b!798600 (= lt!356500 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798601 () Bool)

(declare-fun res!543127 () Bool)

(assert (=> b!798601 (=> (not res!543127) (not e!442955))))

(declare-datatypes ((List!14751 0))(
  ( (Nil!14748) (Cons!14747 (h!15876 (_ BitVec 64)) (t!21066 List!14751)) )
))
(declare-fun arrayNoDuplicates!0 (array!43416 (_ BitVec 32) List!14751) Bool)

(assert (=> b!798601 (= res!543127 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14748))))

(declare-fun res!543126 () Bool)

(assert (=> start!68626 (=> (not res!543126) (not e!442956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68626 (= res!543126 (validMask!0 mask!3266))))

(assert (=> start!68626 e!442956))

(assert (=> start!68626 true))

(declare-fun array_inv!16584 (array!43416) Bool)

(assert (=> start!68626 (array_inv!16584 a!3170)))

(declare-fun b!798602 () Bool)

(declare-fun res!543120 () Bool)

(assert (=> b!798602 (=> (not res!543120) (not e!442956))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798602 (= res!543120 (validKeyInArray!0 (select (arr!20788 a!3170) j!153)))))

(declare-fun b!798603 () Bool)

(declare-fun res!543119 () Bool)

(assert (=> b!798603 (=> (not res!543119) (not e!442955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43416 (_ BitVec 32)) Bool)

(assert (=> b!798603 (= res!543119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798604 () Bool)

(declare-fun res!543123 () Bool)

(assert (=> b!798604 (=> (not res!543123) (not e!442956))))

(assert (=> b!798604 (= res!543123 (and (= (size!21209 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21209 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21209 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798605 () Bool)

(declare-fun res!543121 () Bool)

(assert (=> b!798605 (=> (not res!543121) (not e!442956))))

(declare-fun arrayContainsKey!0 (array!43416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798605 (= res!543121 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798606 () Bool)

(declare-fun res!543128 () Bool)

(assert (=> b!798606 (=> (not res!543128) (not e!442956))))

(assert (=> b!798606 (= res!543128 (validKeyInArray!0 k0!2044))))

(declare-fun lt!356503 () SeekEntryResult!8379)

(declare-fun b!798607 () Bool)

(declare-fun lt!356501 () SeekEntryResult!8379)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun e!442958 () Bool)

(assert (=> b!798607 (= e!442958 (and (= lt!356501 lt!356503) (= lt!356503 (Found!8379 j!153)) (not (= (select (arr!20788 a!3170) index!1236) (select (arr!20788 a!3170) j!153))) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43416 (_ BitVec 32)) SeekEntryResult!8379)

(assert (=> b!798607 (= lt!356503 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798607 (= lt!356501 (seekEntryOrOpen!0 (select (arr!20788 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798608 () Bool)

(declare-fun res!543122 () Bool)

(assert (=> b!798608 (=> (not res!543122) (not e!442955))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!798608 (= res!543122 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21209 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20788 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21209 a!3170)) (= (select (arr!20788 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798609 () Bool)

(assert (=> b!798609 (= e!442955 e!442958)))

(declare-fun res!543125 () Bool)

(assert (=> b!798609 (=> (not res!543125) (not e!442958))))

(declare-fun lt!356504 () (_ BitVec 64))

(declare-fun lt!356502 () array!43416)

(assert (=> b!798609 (= res!543125 (= (seekEntryOrOpen!0 lt!356504 lt!356502 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356504 lt!356502 mask!3266)))))

(assert (=> b!798609 (= lt!356504 (select (store (arr!20788 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798609 (= lt!356502 (array!43417 (store (arr!20788 a!3170) i!1163 k0!2044) (size!21209 a!3170)))))

(assert (= (and start!68626 res!543126) b!798604))

(assert (= (and b!798604 res!543123) b!798602))

(assert (= (and b!798602 res!543120) b!798606))

(assert (= (and b!798606 res!543128) b!798605))

(assert (= (and b!798605 res!543121) b!798600))

(assert (= (and b!798600 res!543124) b!798603))

(assert (= (and b!798603 res!543119) b!798601))

(assert (= (and b!798601 res!543127) b!798608))

(assert (= (and b!798608 res!543122) b!798609))

(assert (= (and b!798609 res!543125) b!798607))

(declare-fun m!739529 () Bool)

(assert (=> b!798603 m!739529))

(declare-fun m!739531 () Bool)

(assert (=> b!798606 m!739531))

(declare-fun m!739533 () Bool)

(assert (=> b!798600 m!739533))

(declare-fun m!739535 () Bool)

(assert (=> b!798605 m!739535))

(declare-fun m!739537 () Bool)

(assert (=> b!798607 m!739537))

(declare-fun m!739539 () Bool)

(assert (=> b!798607 m!739539))

(assert (=> b!798607 m!739539))

(declare-fun m!739541 () Bool)

(assert (=> b!798607 m!739541))

(assert (=> b!798607 m!739539))

(declare-fun m!739543 () Bool)

(assert (=> b!798607 m!739543))

(declare-fun m!739545 () Bool)

(assert (=> b!798609 m!739545))

(declare-fun m!739547 () Bool)

(assert (=> b!798609 m!739547))

(declare-fun m!739549 () Bool)

(assert (=> b!798609 m!739549))

(declare-fun m!739551 () Bool)

(assert (=> b!798609 m!739551))

(declare-fun m!739553 () Bool)

(assert (=> b!798601 m!739553))

(declare-fun m!739555 () Bool)

(assert (=> b!798608 m!739555))

(declare-fun m!739557 () Bool)

(assert (=> b!798608 m!739557))

(declare-fun m!739559 () Bool)

(assert (=> start!68626 m!739559))

(declare-fun m!739561 () Bool)

(assert (=> start!68626 m!739561))

(assert (=> b!798602 m!739539))

(assert (=> b!798602 m!739539))

(declare-fun m!739563 () Bool)

(assert (=> b!798602 m!739563))

(check-sat (not b!798606) (not b!798607) (not start!68626) (not b!798605) (not b!798602) (not b!798603) (not b!798600) (not b!798601) (not b!798609))
(check-sat)
