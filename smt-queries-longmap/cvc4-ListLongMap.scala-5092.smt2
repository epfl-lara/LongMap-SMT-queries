; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69162 () Bool)

(assert start!69162)

(declare-fun b!806504 () Bool)

(declare-fun e!446620 () Bool)

(declare-fun e!446622 () Bool)

(assert (=> b!806504 (= e!446620 e!446622)))

(declare-fun res!550632 () Bool)

(assert (=> b!806504 (=> (not res!550632) (not e!446622))))

(declare-datatypes ((SeekEntryResult!8599 0))(
  ( (MissingZero!8599 (index!36764 (_ BitVec 32))) (Found!8599 (index!36765 (_ BitVec 32))) (Intermediate!8599 (undefined!9411 Bool) (index!36766 (_ BitVec 32)) (x!67579 (_ BitVec 32))) (Undefined!8599) (MissingVacant!8599 (index!36767 (_ BitVec 32))) )
))
(declare-fun lt!361178 () SeekEntryResult!8599)

(declare-fun lt!361180 () SeekEntryResult!8599)

(assert (=> b!806504 (= res!550632 (= lt!361178 lt!361180))))

(declare-fun lt!361179 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43862 0))(
  ( (array!43863 (arr!21008 (Array (_ BitVec 32) (_ BitVec 64))) (size!21429 (_ BitVec 32))) )
))
(declare-fun lt!361181 () array!43862)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43862 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!806504 (= lt!361180 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361179 lt!361181 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43862 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!806504 (= lt!361178 (seekEntryOrOpen!0 lt!361179 lt!361181 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43862)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806504 (= lt!361179 (select (store (arr!21008 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806504 (= lt!361181 (array!43863 (store (arr!21008 a!3170) i!1163 k!2044) (size!21429 a!3170)))))

(declare-fun b!806505 () Bool)

(declare-fun res!550631 () Bool)

(declare-fun e!446621 () Bool)

(assert (=> b!806505 (=> (not res!550631) (not e!446621))))

(declare-fun arrayContainsKey!0 (array!43862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806505 (= res!550631 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806506 () Bool)

(declare-fun res!550635 () Bool)

(assert (=> b!806506 (=> (not res!550635) (not e!446620))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806506 (= res!550635 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21429 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21008 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21429 a!3170)) (= (select (arr!21008 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!550630 () Bool)

(assert (=> start!69162 (=> (not res!550630) (not e!446621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69162 (= res!550630 (validMask!0 mask!3266))))

(assert (=> start!69162 e!446621))

(assert (=> start!69162 true))

(declare-fun array_inv!16804 (array!43862) Bool)

(assert (=> start!69162 (array_inv!16804 a!3170)))

(declare-fun b!806507 () Bool)

(declare-fun res!550629 () Bool)

(assert (=> b!806507 (=> (not res!550629) (not e!446621))))

(assert (=> b!806507 (= res!550629 (and (= (size!21429 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21429 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21429 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806508 () Bool)

(declare-fun res!550636 () Bool)

(assert (=> b!806508 (=> (not res!550636) (not e!446620))))

(declare-datatypes ((List!14971 0))(
  ( (Nil!14968) (Cons!14967 (h!16096 (_ BitVec 64)) (t!21286 List!14971)) )
))
(declare-fun arrayNoDuplicates!0 (array!43862 (_ BitVec 32) List!14971) Bool)

(assert (=> b!806508 (= res!550636 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14968))))

(declare-fun b!806509 () Bool)

(declare-fun e!446624 () Bool)

(assert (=> b!806509 (= e!446624 (not true))))

(assert (=> b!806509 (= lt!361180 (Found!8599 index!1236))))

(declare-fun b!806510 () Bool)

(declare-fun res!550633 () Bool)

(assert (=> b!806510 (=> (not res!550633) (not e!446620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43862 (_ BitVec 32)) Bool)

(assert (=> b!806510 (= res!550633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806511 () Bool)

(assert (=> b!806511 (= e!446622 e!446624)))

(declare-fun res!550634 () Bool)

(assert (=> b!806511 (=> (not res!550634) (not e!446624))))

(declare-fun lt!361184 () SeekEntryResult!8599)

(declare-fun lt!361183 () SeekEntryResult!8599)

(assert (=> b!806511 (= res!550634 (and (= lt!361183 lt!361184) (= lt!361184 (Found!8599 j!153)) (= (select (arr!21008 a!3170) index!1236) (select (arr!21008 a!3170) j!153))))))

(assert (=> b!806511 (= lt!361184 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21008 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806511 (= lt!361183 (seekEntryOrOpen!0 (select (arr!21008 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806512 () Bool)

(declare-fun res!550628 () Bool)

(assert (=> b!806512 (=> (not res!550628) (not e!446621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806512 (= res!550628 (validKeyInArray!0 (select (arr!21008 a!3170) j!153)))))

(declare-fun b!806513 () Bool)

(declare-fun res!550627 () Bool)

(assert (=> b!806513 (=> (not res!550627) (not e!446621))))

(assert (=> b!806513 (= res!550627 (validKeyInArray!0 k!2044))))

(declare-fun b!806514 () Bool)

(assert (=> b!806514 (= e!446621 e!446620)))

(declare-fun res!550637 () Bool)

(assert (=> b!806514 (=> (not res!550637) (not e!446620))))

(declare-fun lt!361182 () SeekEntryResult!8599)

(assert (=> b!806514 (= res!550637 (or (= lt!361182 (MissingZero!8599 i!1163)) (= lt!361182 (MissingVacant!8599 i!1163))))))

(assert (=> b!806514 (= lt!361182 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69162 res!550630) b!806507))

(assert (= (and b!806507 res!550629) b!806512))

(assert (= (and b!806512 res!550628) b!806513))

(assert (= (and b!806513 res!550627) b!806505))

(assert (= (and b!806505 res!550631) b!806514))

(assert (= (and b!806514 res!550637) b!806510))

(assert (= (and b!806510 res!550633) b!806508))

(assert (= (and b!806508 res!550636) b!806506))

(assert (= (and b!806506 res!550635) b!806504))

(assert (= (and b!806504 res!550632) b!806511))

(assert (= (and b!806511 res!550634) b!806509))

(declare-fun m!748433 () Bool)

(assert (=> b!806514 m!748433))

(declare-fun m!748435 () Bool)

(assert (=> b!806510 m!748435))

(declare-fun m!748437 () Bool)

(assert (=> b!806511 m!748437))

(declare-fun m!748439 () Bool)

(assert (=> b!806511 m!748439))

(assert (=> b!806511 m!748439))

(declare-fun m!748441 () Bool)

(assert (=> b!806511 m!748441))

(assert (=> b!806511 m!748439))

(declare-fun m!748443 () Bool)

(assert (=> b!806511 m!748443))

(declare-fun m!748445 () Bool)

(assert (=> b!806508 m!748445))

(declare-fun m!748447 () Bool)

(assert (=> b!806505 m!748447))

(declare-fun m!748449 () Bool)

(assert (=> b!806506 m!748449))

(declare-fun m!748451 () Bool)

(assert (=> b!806506 m!748451))

(declare-fun m!748453 () Bool)

(assert (=> b!806513 m!748453))

(assert (=> b!806512 m!748439))

(assert (=> b!806512 m!748439))

(declare-fun m!748455 () Bool)

(assert (=> b!806512 m!748455))

(declare-fun m!748457 () Bool)

(assert (=> start!69162 m!748457))

(declare-fun m!748459 () Bool)

(assert (=> start!69162 m!748459))

(declare-fun m!748461 () Bool)

(assert (=> b!806504 m!748461))

(declare-fun m!748463 () Bool)

(assert (=> b!806504 m!748463))

(declare-fun m!748465 () Bool)

(assert (=> b!806504 m!748465))

(declare-fun m!748467 () Bool)

(assert (=> b!806504 m!748467))

(push 1)

(assert (not b!806514))

(assert (not b!806508))

(assert (not b!806511))

(assert (not start!69162))

(assert (not b!806505))

(assert (not b!806513))

(assert (not b!806512))

