; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69428 () Bool)

(assert start!69428)

(declare-fun b!809018 () Bool)

(declare-fun res!552598 () Bool)

(declare-fun e!447940 () Bool)

(assert (=> b!809018 (=> (not res!552598) (not e!447940))))

(declare-datatypes ((array!43960 0))(
  ( (array!43961 (arr!21052 (Array (_ BitVec 32) (_ BitVec 64))) (size!21472 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43960)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43960 (_ BitVec 32)) Bool)

(assert (=> b!809018 (= res!552598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!552600 () Bool)

(declare-fun e!447937 () Bool)

(assert (=> start!69428 (=> (not res!552600) (not e!447937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69428 (= res!552600 (validMask!0 mask!3266))))

(assert (=> start!69428 e!447937))

(assert (=> start!69428 true))

(declare-fun array_inv!16911 (array!43960) Bool)

(assert (=> start!69428 (array_inv!16911 a!3170)))

(declare-fun b!809019 () Bool)

(assert (=> b!809019 (= e!447937 e!447940)))

(declare-fun res!552602 () Bool)

(assert (=> b!809019 (=> (not res!552602) (not e!447940))))

(declare-datatypes ((SeekEntryResult!8599 0))(
  ( (MissingZero!8599 (index!36764 (_ BitVec 32))) (Found!8599 (index!36765 (_ BitVec 32))) (Intermediate!8599 (undefined!9411 Bool) (index!36766 (_ BitVec 32)) (x!67729 (_ BitVec 32))) (Undefined!8599) (MissingVacant!8599 (index!36767 (_ BitVec 32))) )
))
(declare-fun lt!362467 () SeekEntryResult!8599)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809019 (= res!552602 (or (= lt!362467 (MissingZero!8599 i!1163)) (= lt!362467 (MissingVacant!8599 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43960 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!809019 (= lt!362467 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809020 () Bool)

(declare-fun res!552596 () Bool)

(assert (=> b!809020 (=> (not res!552596) (not e!447940))))

(declare-datatypes ((List!14922 0))(
  ( (Nil!14919) (Cons!14918 (h!16053 (_ BitVec 64)) (t!21229 List!14922)) )
))
(declare-fun arrayNoDuplicates!0 (array!43960 (_ BitVec 32) List!14922) Bool)

(assert (=> b!809020 (= res!552596 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14919))))

(declare-fun b!809021 () Bool)

(declare-fun e!447939 () Bool)

(assert (=> b!809021 (= e!447939 false)))

(declare-fun lt!362463 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809021 (= lt!362463 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!809022 () Bool)

(declare-fun e!447938 () Bool)

(assert (=> b!809022 (= e!447938 e!447939)))

(declare-fun res!552594 () Bool)

(assert (=> b!809022 (=> (not res!552594) (not e!447939))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362465 () SeekEntryResult!8599)

(declare-fun lt!362466 () SeekEntryResult!8599)

(assert (=> b!809022 (= res!552594 (and (= lt!362465 lt!362466) (= lt!362466 (Found!8599 j!153)) (not (= (select (arr!21052 a!3170) index!1236) (select (arr!21052 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43960 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!809022 (= lt!362466 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21052 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809022 (= lt!362465 (seekEntryOrOpen!0 (select (arr!21052 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809023 () Bool)

(declare-fun res!552593 () Bool)

(assert (=> b!809023 (=> (not res!552593) (not e!447940))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809023 (= res!552593 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21472 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21052 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21472 a!3170)) (= (select (arr!21052 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809024 () Bool)

(declare-fun res!552599 () Bool)

(assert (=> b!809024 (=> (not res!552599) (not e!447937))))

(declare-fun arrayContainsKey!0 (array!43960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809024 (= res!552599 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809025 () Bool)

(declare-fun res!552597 () Bool)

(assert (=> b!809025 (=> (not res!552597) (not e!447937))))

(assert (=> b!809025 (= res!552597 (and (= (size!21472 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21472 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21472 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809026 () Bool)

(declare-fun res!552601 () Bool)

(assert (=> b!809026 (=> (not res!552601) (not e!447937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809026 (= res!552601 (validKeyInArray!0 k0!2044))))

(declare-fun b!809027 () Bool)

(declare-fun res!552595 () Bool)

(assert (=> b!809027 (=> (not res!552595) (not e!447937))))

(assert (=> b!809027 (= res!552595 (validKeyInArray!0 (select (arr!21052 a!3170) j!153)))))

(declare-fun b!809028 () Bool)

(assert (=> b!809028 (= e!447940 e!447938)))

(declare-fun res!552603 () Bool)

(assert (=> b!809028 (=> (not res!552603) (not e!447938))))

(declare-fun lt!362464 () (_ BitVec 64))

(declare-fun lt!362468 () array!43960)

(assert (=> b!809028 (= res!552603 (= (seekEntryOrOpen!0 lt!362464 lt!362468 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362464 lt!362468 mask!3266)))))

(assert (=> b!809028 (= lt!362464 (select (store (arr!21052 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809028 (= lt!362468 (array!43961 (store (arr!21052 a!3170) i!1163 k0!2044) (size!21472 a!3170)))))

(assert (= (and start!69428 res!552600) b!809025))

(assert (= (and b!809025 res!552597) b!809027))

(assert (= (and b!809027 res!552595) b!809026))

(assert (= (and b!809026 res!552601) b!809024))

(assert (= (and b!809024 res!552599) b!809019))

(assert (= (and b!809019 res!552602) b!809018))

(assert (= (and b!809018 res!552598) b!809020))

(assert (= (and b!809020 res!552596) b!809023))

(assert (= (and b!809023 res!552593) b!809028))

(assert (= (and b!809028 res!552603) b!809022))

(assert (= (and b!809022 res!552594) b!809021))

(declare-fun m!751525 () Bool)

(assert (=> b!809027 m!751525))

(assert (=> b!809027 m!751525))

(declare-fun m!751527 () Bool)

(assert (=> b!809027 m!751527))

(declare-fun m!751529 () Bool)

(assert (=> b!809021 m!751529))

(declare-fun m!751531 () Bool)

(assert (=> b!809026 m!751531))

(declare-fun m!751533 () Bool)

(assert (=> b!809019 m!751533))

(declare-fun m!751535 () Bool)

(assert (=> b!809028 m!751535))

(declare-fun m!751537 () Bool)

(assert (=> b!809028 m!751537))

(declare-fun m!751539 () Bool)

(assert (=> b!809028 m!751539))

(declare-fun m!751541 () Bool)

(assert (=> b!809028 m!751541))

(declare-fun m!751543 () Bool)

(assert (=> start!69428 m!751543))

(declare-fun m!751545 () Bool)

(assert (=> start!69428 m!751545))

(declare-fun m!751547 () Bool)

(assert (=> b!809018 m!751547))

(declare-fun m!751549 () Bool)

(assert (=> b!809022 m!751549))

(assert (=> b!809022 m!751525))

(assert (=> b!809022 m!751525))

(declare-fun m!751551 () Bool)

(assert (=> b!809022 m!751551))

(assert (=> b!809022 m!751525))

(declare-fun m!751553 () Bool)

(assert (=> b!809022 m!751553))

(declare-fun m!751555 () Bool)

(assert (=> b!809020 m!751555))

(declare-fun m!751557 () Bool)

(assert (=> b!809024 m!751557))

(declare-fun m!751559 () Bool)

(assert (=> b!809023 m!751559))

(declare-fun m!751561 () Bool)

(assert (=> b!809023 m!751561))

(check-sat (not start!69428) (not b!809020) (not b!809022) (not b!809019) (not b!809028) (not b!809018) (not b!809027) (not b!809021) (not b!809024) (not b!809026))
(check-sat)
