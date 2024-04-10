; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68322 () Bool)

(assert start!68322)

(declare-fun res!538272 () Bool)

(declare-fun e!440871 () Bool)

(assert (=> start!68322 (=> (not res!538272) (not e!440871))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68322 (= res!538272 (validMask!0 mask!3266))))

(assert (=> start!68322 e!440871))

(assert (=> start!68322 true))

(declare-datatypes ((array!43112 0))(
  ( (array!43113 (arr!20636 (Array (_ BitVec 32) (_ BitVec 64))) (size!21057 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43112)

(declare-fun array_inv!16432 (array!43112) Bool)

(assert (=> start!68322 (array_inv!16432 a!3170)))

(declare-fun b!793753 () Bool)

(declare-fun res!538274 () Bool)

(assert (=> b!793753 (=> (not res!538274) (not e!440871))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793753 (= res!538274 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793754 () Bool)

(declare-fun res!538279 () Bool)

(declare-fun e!440872 () Bool)

(assert (=> b!793754 (=> (not res!538279) (not e!440872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43112 (_ BitVec 32)) Bool)

(assert (=> b!793754 (= res!538279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793755 () Bool)

(declare-fun res!538277 () Bool)

(assert (=> b!793755 (=> (not res!538277) (not e!440872))))

(declare-datatypes ((List!14599 0))(
  ( (Nil!14596) (Cons!14595 (h!15724 (_ BitVec 64)) (t!20914 List!14599)) )
))
(declare-fun arrayNoDuplicates!0 (array!43112 (_ BitVec 32) List!14599) Bool)

(assert (=> b!793755 (= res!538277 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14596))))

(declare-fun b!793756 () Bool)

(declare-fun res!538275 () Bool)

(assert (=> b!793756 (=> (not res!538275) (not e!440872))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793756 (= res!538275 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21057 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20636 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21057 a!3170)) (= (select (arr!20636 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793757 () Bool)

(declare-fun res!538276 () Bool)

(assert (=> b!793757 (=> (not res!538276) (not e!440871))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793757 (= res!538276 (validKeyInArray!0 (select (arr!20636 a!3170) j!153)))))

(declare-fun b!793758 () Bool)

(assert (=> b!793758 (= e!440871 e!440872)))

(declare-fun res!538273 () Bool)

(assert (=> b!793758 (=> (not res!538273) (not e!440872))))

(declare-datatypes ((SeekEntryResult!8227 0))(
  ( (MissingZero!8227 (index!35276 (_ BitVec 32))) (Found!8227 (index!35277 (_ BitVec 32))) (Intermediate!8227 (undefined!9039 Bool) (index!35278 (_ BitVec 32)) (x!66209 (_ BitVec 32))) (Undefined!8227) (MissingVacant!8227 (index!35279 (_ BitVec 32))) )
))
(declare-fun lt!353827 () SeekEntryResult!8227)

(assert (=> b!793758 (= res!538273 (or (= lt!353827 (MissingZero!8227 i!1163)) (= lt!353827 (MissingVacant!8227 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43112 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!793758 (= lt!353827 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793759 () Bool)

(declare-fun res!538278 () Bool)

(assert (=> b!793759 (=> (not res!538278) (not e!440871))))

(assert (=> b!793759 (= res!538278 (and (= (size!21057 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21057 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21057 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793760 () Bool)

(assert (=> b!793760 (= e!440872 false)))

(declare-fun lt!353826 () SeekEntryResult!8227)

(declare-fun lt!353825 () array!43112)

(declare-fun lt!353828 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43112 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!793760 (= lt!353826 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353828 lt!353825 mask!3266))))

(declare-fun lt!353824 () SeekEntryResult!8227)

(assert (=> b!793760 (= lt!353824 (seekEntryOrOpen!0 lt!353828 lt!353825 mask!3266))))

(assert (=> b!793760 (= lt!353828 (select (store (arr!20636 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793760 (= lt!353825 (array!43113 (store (arr!20636 a!3170) i!1163 k!2044) (size!21057 a!3170)))))

(declare-fun b!793761 () Bool)

(declare-fun res!538280 () Bool)

(assert (=> b!793761 (=> (not res!538280) (not e!440871))))

(assert (=> b!793761 (= res!538280 (validKeyInArray!0 k!2044))))

(assert (= (and start!68322 res!538272) b!793759))

(assert (= (and b!793759 res!538278) b!793757))

(assert (= (and b!793757 res!538276) b!793761))

(assert (= (and b!793761 res!538280) b!793753))

(assert (= (and b!793753 res!538274) b!793758))

(assert (= (and b!793758 res!538273) b!793754))

(assert (= (and b!793754 res!538279) b!793755))

(assert (= (and b!793755 res!538277) b!793756))

(assert (= (and b!793756 res!538275) b!793760))

(declare-fun m!734243 () Bool)

(assert (=> b!793757 m!734243))

(assert (=> b!793757 m!734243))

(declare-fun m!734245 () Bool)

(assert (=> b!793757 m!734245))

(declare-fun m!734247 () Bool)

(assert (=> start!68322 m!734247))

(declare-fun m!734249 () Bool)

(assert (=> start!68322 m!734249))

(declare-fun m!734251 () Bool)

(assert (=> b!793761 m!734251))

(declare-fun m!734253 () Bool)

(assert (=> b!793756 m!734253))

(declare-fun m!734255 () Bool)

(assert (=> b!793756 m!734255))

(declare-fun m!734257 () Bool)

(assert (=> b!793755 m!734257))

(declare-fun m!734259 () Bool)

(assert (=> b!793760 m!734259))

(declare-fun m!734261 () Bool)

(assert (=> b!793760 m!734261))

(declare-fun m!734263 () Bool)

(assert (=> b!793760 m!734263))

(declare-fun m!734265 () Bool)

(assert (=> b!793760 m!734265))

(declare-fun m!734267 () Bool)

(assert (=> b!793753 m!734267))

(declare-fun m!734269 () Bool)

(assert (=> b!793758 m!734269))

(declare-fun m!734271 () Bool)

(assert (=> b!793754 m!734271))

(push 1)

(assert (not start!68322))

(assert (not b!793760))

(assert (not b!793753))

(assert (not b!793758))

(assert (not b!793755))

(assert (not b!793761))

(assert (not b!793754))

(assert (not b!793757))

(check-sat)

