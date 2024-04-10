; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68950 () Bool)

(assert start!68950)

(declare-fun b!804327 () Bool)

(declare-fun e!445607 () Bool)

(declare-fun e!445605 () Bool)

(assert (=> b!804327 (= e!445607 e!445605)))

(declare-fun res!548847 () Bool)

(assert (=> b!804327 (=> (not res!548847) (not e!445605))))

(declare-datatypes ((SeekEntryResult!8541 0))(
  ( (MissingZero!8541 (index!36532 (_ BitVec 32))) (Found!8541 (index!36533 (_ BitVec 32))) (Intermediate!8541 (undefined!9353 Bool) (index!36534 (_ BitVec 32)) (x!67363 (_ BitVec 32))) (Undefined!8541) (MissingVacant!8541 (index!36535 (_ BitVec 32))) )
))
(declare-fun lt!360122 () SeekEntryResult!8541)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804327 (= res!548847 (or (= lt!360122 (MissingZero!8541 i!1163)) (= lt!360122 (MissingVacant!8541 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43740 0))(
  ( (array!43741 (arr!20950 (Array (_ BitVec 32) (_ BitVec 64))) (size!21371 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43740)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43740 (_ BitVec 32)) SeekEntryResult!8541)

(assert (=> b!804327 (= lt!360122 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804328 () Bool)

(declare-fun res!548851 () Bool)

(assert (=> b!804328 (=> (not res!548851) (not e!445607))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804328 (= res!548851 (and (= (size!21371 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21371 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21371 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804329 () Bool)

(assert (=> b!804329 (= e!445605 false)))

(declare-fun lt!360121 () Bool)

(declare-datatypes ((List!14913 0))(
  ( (Nil!14910) (Cons!14909 (h!16038 (_ BitVec 64)) (t!21228 List!14913)) )
))
(declare-fun arrayNoDuplicates!0 (array!43740 (_ BitVec 32) List!14913) Bool)

(assert (=> b!804329 (= lt!360121 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14910))))

(declare-fun b!804330 () Bool)

(declare-fun res!548852 () Bool)

(assert (=> b!804330 (=> (not res!548852) (not e!445607))))

(declare-fun arrayContainsKey!0 (array!43740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804330 (= res!548852 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804331 () Bool)

(declare-fun res!548846 () Bool)

(assert (=> b!804331 (=> (not res!548846) (not e!445607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804331 (= res!548846 (validKeyInArray!0 k0!2044))))

(declare-fun res!548848 () Bool)

(assert (=> start!68950 (=> (not res!548848) (not e!445607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68950 (= res!548848 (validMask!0 mask!3266))))

(assert (=> start!68950 e!445607))

(assert (=> start!68950 true))

(declare-fun array_inv!16746 (array!43740) Bool)

(assert (=> start!68950 (array_inv!16746 a!3170)))

(declare-fun b!804332 () Bool)

(declare-fun res!548849 () Bool)

(assert (=> b!804332 (=> (not res!548849) (not e!445607))))

(assert (=> b!804332 (= res!548849 (validKeyInArray!0 (select (arr!20950 a!3170) j!153)))))

(declare-fun b!804333 () Bool)

(declare-fun res!548850 () Bool)

(assert (=> b!804333 (=> (not res!548850) (not e!445605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43740 (_ BitVec 32)) Bool)

(assert (=> b!804333 (= res!548850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68950 res!548848) b!804328))

(assert (= (and b!804328 res!548851) b!804332))

(assert (= (and b!804332 res!548849) b!804331))

(assert (= (and b!804331 res!548846) b!804330))

(assert (= (and b!804330 res!548852) b!804327))

(assert (= (and b!804327 res!548847) b!804333))

(assert (= (and b!804333 res!548850) b!804329))

(declare-fun m!746219 () Bool)

(assert (=> b!804330 m!746219))

(declare-fun m!746221 () Bool)

(assert (=> b!804332 m!746221))

(assert (=> b!804332 m!746221))

(declare-fun m!746223 () Bool)

(assert (=> b!804332 m!746223))

(declare-fun m!746225 () Bool)

(assert (=> start!68950 m!746225))

(declare-fun m!746227 () Bool)

(assert (=> start!68950 m!746227))

(declare-fun m!746229 () Bool)

(assert (=> b!804333 m!746229))

(declare-fun m!746231 () Bool)

(assert (=> b!804329 m!746231))

(declare-fun m!746233 () Bool)

(assert (=> b!804327 m!746233))

(declare-fun m!746235 () Bool)

(assert (=> b!804331 m!746235))

(check-sat (not b!804327) (not start!68950) (not b!804329) (not b!804333) (not b!804331) (not b!804332) (not b!804330))
(check-sat)
