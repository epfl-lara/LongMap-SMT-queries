; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68726 () Bool)

(assert start!68726)

(declare-fun res!545012 () Bool)

(declare-fun e!443816 () Bool)

(assert (=> start!68726 (=> (not res!545012) (not e!443816))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68726 (= res!545012 (validMask!0 mask!3266))))

(assert (=> start!68726 e!443816))

(assert (=> start!68726 true))

(declare-datatypes ((array!43516 0))(
  ( (array!43517 (arr!20838 (Array (_ BitVec 32) (_ BitVec 64))) (size!21259 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43516)

(declare-fun array_inv!16634 (array!43516) Bool)

(assert (=> start!68726 (array_inv!16634 a!3170)))

(declare-fun b!800484 () Bool)

(declare-fun e!443813 () Bool)

(declare-fun e!443812 () Bool)

(assert (=> b!800484 (= e!443813 e!443812)))

(declare-fun res!545004 () Bool)

(assert (=> b!800484 (=> (not res!545004) (not e!443812))))

(declare-fun lt!357640 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!800484 (= res!545004 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357640 #b00000000000000000000000000000000) (bvslt lt!357640 (size!21259 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800484 (= lt!357640 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800485 () Bool)

(declare-fun res!545015 () Bool)

(assert (=> b!800485 (=> (not res!545015) (not e!443816))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800485 (= res!545015 (validKeyInArray!0 k!2044))))

(declare-fun b!800486 () Bool)

(declare-fun res!545006 () Bool)

(declare-fun e!443815 () Bool)

(assert (=> b!800486 (=> (not res!545006) (not e!443815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43516 (_ BitVec 32)) Bool)

(assert (=> b!800486 (= res!545006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800487 () Bool)

(declare-fun e!443811 () Bool)

(assert (=> b!800487 (= e!443815 e!443811)))

(declare-fun res!545013 () Bool)

(assert (=> b!800487 (=> (not res!545013) (not e!443811))))

(declare-fun lt!357634 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8429 0))(
  ( (MissingZero!8429 (index!36084 (_ BitVec 32))) (Found!8429 (index!36085 (_ BitVec 32))) (Intermediate!8429 (undefined!9241 Bool) (index!36086 (_ BitVec 32)) (x!66955 (_ BitVec 32))) (Undefined!8429) (MissingVacant!8429 (index!36087 (_ BitVec 32))) )
))
(declare-fun lt!357641 () SeekEntryResult!8429)

(declare-fun lt!357637 () array!43516)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43516 (_ BitVec 32)) SeekEntryResult!8429)

(assert (=> b!800487 (= res!545013 (= lt!357641 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357634 lt!357637 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43516 (_ BitVec 32)) SeekEntryResult!8429)

(assert (=> b!800487 (= lt!357641 (seekEntryOrOpen!0 lt!357634 lt!357637 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800487 (= lt!357634 (select (store (arr!20838 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800487 (= lt!357637 (array!43517 (store (arr!20838 a!3170) i!1163 k!2044) (size!21259 a!3170)))))

(declare-fun b!800488 () Bool)

(declare-fun res!545007 () Bool)

(assert (=> b!800488 (=> (not res!545007) (not e!443815))))

(declare-datatypes ((List!14801 0))(
  ( (Nil!14798) (Cons!14797 (h!15926 (_ BitVec 64)) (t!21116 List!14801)) )
))
(declare-fun arrayNoDuplicates!0 (array!43516 (_ BitVec 32) List!14801) Bool)

(assert (=> b!800488 (= res!545007 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14798))))

(declare-fun b!800489 () Bool)

(declare-fun res!545008 () Bool)

(assert (=> b!800489 (=> (not res!545008) (not e!443816))))

(assert (=> b!800489 (= res!545008 (validKeyInArray!0 (select (arr!20838 a!3170) j!153)))))

(declare-fun b!800490 () Bool)

(declare-fun res!545010 () Bool)

(assert (=> b!800490 (=> (not res!545010) (not e!443816))))

(declare-fun arrayContainsKey!0 (array!43516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800490 (= res!545010 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800491 () Bool)

(assert (=> b!800491 (= e!443812 false)))

(declare-fun lt!357635 () SeekEntryResult!8429)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800491 (= lt!357635 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357640 vacantBefore!23 (select (arr!20838 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800492 () Bool)

(assert (=> b!800492 (= e!443811 e!443813)))

(declare-fun res!545003 () Bool)

(assert (=> b!800492 (=> (not res!545003) (not e!443813))))

(declare-fun lt!357636 () SeekEntryResult!8429)

(declare-fun lt!357638 () SeekEntryResult!8429)

(assert (=> b!800492 (= res!545003 (and (= lt!357638 lt!357636) (= lt!357636 (Found!8429 j!153)) (not (= (select (arr!20838 a!3170) index!1236) (select (arr!20838 a!3170) j!153)))))))

(assert (=> b!800492 (= lt!357636 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20838 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800492 (= lt!357638 (seekEntryOrOpen!0 (select (arr!20838 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800493 () Bool)

(declare-fun res!545014 () Bool)

(assert (=> b!800493 (=> (not res!545014) (not e!443812))))

(assert (=> b!800493 (= res!545014 (= lt!357641 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357640 vacantAfter!23 lt!357634 lt!357637 mask!3266)))))

(declare-fun b!800494 () Bool)

(declare-fun res!545011 () Bool)

(assert (=> b!800494 (=> (not res!545011) (not e!443816))))

(assert (=> b!800494 (= res!545011 (and (= (size!21259 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21259 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21259 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800495 () Bool)

(declare-fun res!545005 () Bool)

(assert (=> b!800495 (=> (not res!545005) (not e!443815))))

(assert (=> b!800495 (= res!545005 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21259 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20838 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21259 a!3170)) (= (select (arr!20838 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800496 () Bool)

(assert (=> b!800496 (= e!443816 e!443815)))

(declare-fun res!545009 () Bool)

(assert (=> b!800496 (=> (not res!545009) (not e!443815))))

(declare-fun lt!357639 () SeekEntryResult!8429)

(assert (=> b!800496 (= res!545009 (or (= lt!357639 (MissingZero!8429 i!1163)) (= lt!357639 (MissingVacant!8429 i!1163))))))

(assert (=> b!800496 (= lt!357639 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68726 res!545012) b!800494))

(assert (= (and b!800494 res!545011) b!800489))

(assert (= (and b!800489 res!545008) b!800485))

(assert (= (and b!800485 res!545015) b!800490))

(assert (= (and b!800490 res!545010) b!800496))

(assert (= (and b!800496 res!545009) b!800486))

(assert (= (and b!800486 res!545006) b!800488))

(assert (= (and b!800488 res!545007) b!800495))

(assert (= (and b!800495 res!545005) b!800487))

(assert (= (and b!800487 res!545013) b!800492))

(assert (= (and b!800492 res!545003) b!800484))

(assert (= (and b!800484 res!545004) b!800493))

(assert (= (and b!800493 res!545014) b!800491))

(declare-fun m!741575 () Bool)

(assert (=> b!800496 m!741575))

(declare-fun m!741577 () Bool)

(assert (=> b!800485 m!741577))

(declare-fun m!741579 () Bool)

(assert (=> b!800489 m!741579))

(assert (=> b!800489 m!741579))

(declare-fun m!741581 () Bool)

(assert (=> b!800489 m!741581))

(declare-fun m!741583 () Bool)

(assert (=> b!800486 m!741583))

(declare-fun m!741585 () Bool)

(assert (=> b!800492 m!741585))

(assert (=> b!800492 m!741579))

(assert (=> b!800492 m!741579))

(declare-fun m!741587 () Bool)

(assert (=> b!800492 m!741587))

(assert (=> b!800492 m!741579))

(declare-fun m!741589 () Bool)

(assert (=> b!800492 m!741589))

(declare-fun m!741591 () Bool)

(assert (=> start!68726 m!741591))

(declare-fun m!741593 () Bool)

(assert (=> start!68726 m!741593))

(declare-fun m!741595 () Bool)

(assert (=> b!800488 m!741595))

(assert (=> b!800491 m!741579))

(assert (=> b!800491 m!741579))

(declare-fun m!741597 () Bool)

(assert (=> b!800491 m!741597))

(declare-fun m!741599 () Bool)

(assert (=> b!800493 m!741599))

(declare-fun m!741601 () Bool)

(assert (=> b!800495 m!741601))

(declare-fun m!741603 () Bool)

(assert (=> b!800495 m!741603))

(declare-fun m!741605 () Bool)

(assert (=> b!800487 m!741605))

(declare-fun m!741607 () Bool)

(assert (=> b!800487 m!741607))

(declare-fun m!741609 () Bool)

(assert (=> b!800487 m!741609))

(declare-fun m!741611 () Bool)

(assert (=> b!800487 m!741611))

(declare-fun m!741613 () Bool)

(assert (=> b!800484 m!741613))

(declare-fun m!741615 () Bool)

(assert (=> b!800490 m!741615))

(push 1)

