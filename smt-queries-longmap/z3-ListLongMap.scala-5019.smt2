; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68748 () Bool)

(assert start!68748)

(declare-fun b!799221 () Bool)

(declare-fun e!443366 () Bool)

(declare-fun e!443368 () Bool)

(assert (=> b!799221 (= e!443366 e!443368)))

(declare-fun res!543370 () Bool)

(assert (=> b!799221 (=> (not res!543370) (not e!443368))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43412 0))(
  ( (array!43413 (arr!20782 (Array (_ BitVec 32) (_ BitVec 64))) (size!21202 (_ BitVec 32))) )
))
(declare-fun lt!356758 () array!43412)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356759 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8329 0))(
  ( (MissingZero!8329 (index!35684 (_ BitVec 32))) (Found!8329 (index!35685 (_ BitVec 32))) (Intermediate!8329 (undefined!9141 Bool) (index!35686 (_ BitVec 32)) (x!66730 (_ BitVec 32))) (Undefined!8329) (MissingVacant!8329 (index!35687 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43412 (_ BitVec 32)) SeekEntryResult!8329)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43412 (_ BitVec 32)) SeekEntryResult!8329)

(assert (=> b!799221 (= res!543370 (= (seekEntryOrOpen!0 lt!356759 lt!356758 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356759 lt!356758 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43412)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799221 (= lt!356759 (select (store (arr!20782 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799221 (= lt!356758 (array!43413 (store (arr!20782 a!3170) i!1163 k0!2044) (size!21202 a!3170)))))

(declare-fun b!799222 () Bool)

(declare-fun res!543366 () Bool)

(declare-fun e!443365 () Bool)

(assert (=> b!799222 (=> (not res!543366) (not e!443365))))

(declare-fun arrayContainsKey!0 (array!43412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799222 (= res!543366 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799223 () Bool)

(declare-fun res!543374 () Bool)

(assert (=> b!799223 (=> (not res!543374) (not e!443366))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799223 (= res!543374 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21202 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20782 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21202 a!3170)) (= (select (arr!20782 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799224 () Bool)

(declare-fun res!543372 () Bool)

(assert (=> b!799224 (=> (not res!543372) (not e!443366))))

(declare-datatypes ((List!14652 0))(
  ( (Nil!14649) (Cons!14648 (h!15783 (_ BitVec 64)) (t!20959 List!14652)) )
))
(declare-fun arrayNoDuplicates!0 (array!43412 (_ BitVec 32) List!14652) Bool)

(assert (=> b!799224 (= res!543372 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14649))))

(declare-fun b!799225 () Bool)

(declare-fun lt!356757 () SeekEntryResult!8329)

(declare-fun lt!356761 () SeekEntryResult!8329)

(assert (=> b!799225 (= e!443368 (and (= lt!356757 lt!356761) (= lt!356761 (Found!8329 j!153)) (not (= (select (arr!20782 a!3170) index!1236) (select (arr!20782 a!3170) j!153))) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!799225 (= lt!356761 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20782 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799225 (= lt!356757 (seekEntryOrOpen!0 (select (arr!20782 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543369 () Bool)

(assert (=> start!68748 (=> (not res!543369) (not e!443365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68748 (= res!543369 (validMask!0 mask!3266))))

(assert (=> start!68748 e!443365))

(assert (=> start!68748 true))

(declare-fun array_inv!16641 (array!43412) Bool)

(assert (=> start!68748 (array_inv!16641 a!3170)))

(declare-fun b!799226 () Bool)

(declare-fun res!543375 () Bool)

(assert (=> b!799226 (=> (not res!543375) (not e!443365))))

(assert (=> b!799226 (= res!543375 (and (= (size!21202 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21202 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21202 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799227 () Bool)

(declare-fun res!543373 () Bool)

(assert (=> b!799227 (=> (not res!543373) (not e!443365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799227 (= res!543373 (validKeyInArray!0 k0!2044))))

(declare-fun b!799228 () Bool)

(assert (=> b!799228 (= e!443365 e!443366)))

(declare-fun res!543368 () Bool)

(assert (=> b!799228 (=> (not res!543368) (not e!443366))))

(declare-fun lt!356760 () SeekEntryResult!8329)

(assert (=> b!799228 (= res!543368 (or (= lt!356760 (MissingZero!8329 i!1163)) (= lt!356760 (MissingVacant!8329 i!1163))))))

(assert (=> b!799228 (= lt!356760 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799229 () Bool)

(declare-fun res!543371 () Bool)

(assert (=> b!799229 (=> (not res!543371) (not e!443365))))

(assert (=> b!799229 (= res!543371 (validKeyInArray!0 (select (arr!20782 a!3170) j!153)))))

(declare-fun b!799230 () Bool)

(declare-fun res!543367 () Bool)

(assert (=> b!799230 (=> (not res!543367) (not e!443366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43412 (_ BitVec 32)) Bool)

(assert (=> b!799230 (= res!543367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68748 res!543369) b!799226))

(assert (= (and b!799226 res!543375) b!799229))

(assert (= (and b!799229 res!543371) b!799227))

(assert (= (and b!799227 res!543373) b!799222))

(assert (= (and b!799222 res!543366) b!799228))

(assert (= (and b!799228 res!543368) b!799230))

(assert (= (and b!799230 res!543367) b!799224))

(assert (= (and b!799224 res!543372) b!799223))

(assert (= (and b!799223 res!543374) b!799221))

(assert (= (and b!799221 res!543370) b!799225))

(declare-fun m!740573 () Bool)

(assert (=> b!799223 m!740573))

(declare-fun m!740575 () Bool)

(assert (=> b!799223 m!740575))

(declare-fun m!740577 () Bool)

(assert (=> b!799221 m!740577))

(declare-fun m!740579 () Bool)

(assert (=> b!799221 m!740579))

(declare-fun m!740581 () Bool)

(assert (=> b!799221 m!740581))

(declare-fun m!740583 () Bool)

(assert (=> b!799221 m!740583))

(declare-fun m!740585 () Bool)

(assert (=> b!799229 m!740585))

(assert (=> b!799229 m!740585))

(declare-fun m!740587 () Bool)

(assert (=> b!799229 m!740587))

(declare-fun m!740589 () Bool)

(assert (=> b!799228 m!740589))

(declare-fun m!740591 () Bool)

(assert (=> b!799225 m!740591))

(assert (=> b!799225 m!740585))

(assert (=> b!799225 m!740585))

(declare-fun m!740593 () Bool)

(assert (=> b!799225 m!740593))

(assert (=> b!799225 m!740585))

(declare-fun m!740595 () Bool)

(assert (=> b!799225 m!740595))

(declare-fun m!740597 () Bool)

(assert (=> b!799230 m!740597))

(declare-fun m!740599 () Bool)

(assert (=> start!68748 m!740599))

(declare-fun m!740601 () Bool)

(assert (=> start!68748 m!740601))

(declare-fun m!740603 () Bool)

(assert (=> b!799222 m!740603))

(declare-fun m!740605 () Bool)

(assert (=> b!799227 m!740605))

(declare-fun m!740607 () Bool)

(assert (=> b!799224 m!740607))

(check-sat (not b!799228) (not b!799230) (not b!799225) (not start!68748) (not b!799222) (not b!799227) (not b!799224) (not b!799229) (not b!799221))
(check-sat)
