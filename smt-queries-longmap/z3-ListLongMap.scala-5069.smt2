; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68904 () Bool)

(assert start!68904)

(declare-fun b!803767 () Bool)

(declare-fun res!548432 () Bool)

(declare-fun e!445324 () Bool)

(assert (=> b!803767 (=> (not res!548432) (not e!445324))))

(declare-datatypes ((array!43711 0))(
  ( (array!43712 (arr!20936 (Array (_ BitVec 32) (_ BitVec 64))) (size!21357 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43711)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43711 (_ BitVec 32)) Bool)

(assert (=> b!803767 (= res!548432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803768 () Bool)

(declare-fun res!548436 () Bool)

(assert (=> b!803768 (=> (not res!548436) (not e!445324))))

(declare-datatypes ((List!14938 0))(
  ( (Nil!14935) (Cons!14934 (h!16063 (_ BitVec 64)) (t!21244 List!14938)) )
))
(declare-fun arrayNoDuplicates!0 (array!43711 (_ BitVec 32) List!14938) Bool)

(assert (=> b!803768 (= res!548436 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14935))))

(declare-fun b!803769 () Bool)

(declare-fun e!445321 () Bool)

(declare-fun e!445323 () Bool)

(assert (=> b!803769 (= e!445321 e!445323)))

(declare-fun res!548431 () Bool)

(assert (=> b!803769 (=> (not res!548431) (not e!445323))))

(declare-datatypes ((SeekEntryResult!8524 0))(
  ( (MissingZero!8524 (index!36464 (_ BitVec 32))) (Found!8524 (index!36465 (_ BitVec 32))) (Intermediate!8524 (undefined!9336 Bool) (index!36466 (_ BitVec 32)) (x!67309 (_ BitVec 32))) (Undefined!8524) (MissingVacant!8524 (index!36467 (_ BitVec 32))) )
))
(declare-fun lt!359781 () SeekEntryResult!8524)

(declare-fun lt!359778 () SeekEntryResult!8524)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803769 (= res!548431 (and (= lt!359778 lt!359781) (= lt!359781 (Found!8524 j!153)) (not (= (select (arr!20936 a!3170) index!1236) (select (arr!20936 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43711 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!803769 (= lt!359781 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43711 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!803769 (= lt!359778 (seekEntryOrOpen!0 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803770 () Bool)

(declare-fun res!548433 () Bool)

(declare-fun e!445322 () Bool)

(assert (=> b!803770 (=> (not res!548433) (not e!445322))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803770 (= res!548433 (validKeyInArray!0 k0!2044))))

(declare-fun b!803771 () Bool)

(declare-fun res!548430 () Bool)

(assert (=> b!803771 (=> (not res!548430) (not e!445322))))

(assert (=> b!803771 (= res!548430 (validKeyInArray!0 (select (arr!20936 a!3170) j!153)))))

(declare-fun b!803772 () Bool)

(declare-fun res!548435 () Bool)

(assert (=> b!803772 (=> (not res!548435) (not e!445322))))

(declare-fun arrayContainsKey!0 (array!43711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803772 (= res!548435 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548426 () Bool)

(assert (=> start!68904 (=> (not res!548426) (not e!445322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68904 (= res!548426 (validMask!0 mask!3266))))

(assert (=> start!68904 e!445322))

(assert (=> start!68904 true))

(declare-fun array_inv!16819 (array!43711) Bool)

(assert (=> start!68904 (array_inv!16819 a!3170)))

(declare-fun b!803773 () Bool)

(assert (=> b!803773 (= e!445324 e!445321)))

(declare-fun res!548429 () Bool)

(assert (=> b!803773 (=> (not res!548429) (not e!445321))))

(declare-fun lt!359782 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359780 () array!43711)

(assert (=> b!803773 (= res!548429 (= (seekEntryOrOpen!0 lt!359782 lt!359780 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359782 lt!359780 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803773 (= lt!359782 (select (store (arr!20936 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803773 (= lt!359780 (array!43712 (store (arr!20936 a!3170) i!1163 k0!2044) (size!21357 a!3170)))))

(declare-fun b!803774 () Bool)

(declare-fun res!548428 () Bool)

(assert (=> b!803774 (=> (not res!548428) (not e!445324))))

(assert (=> b!803774 (= res!548428 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21357 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20936 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21357 a!3170)) (= (select (arr!20936 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803775 () Bool)

(assert (=> b!803775 (= e!445322 e!445324)))

(declare-fun res!548427 () Bool)

(assert (=> b!803775 (=> (not res!548427) (not e!445324))))

(declare-fun lt!359779 () SeekEntryResult!8524)

(assert (=> b!803775 (= res!548427 (or (= lt!359779 (MissingZero!8524 i!1163)) (= lt!359779 (MissingVacant!8524 i!1163))))))

(assert (=> b!803775 (= lt!359779 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803776 () Bool)

(declare-fun res!548434 () Bool)

(assert (=> b!803776 (=> (not res!548434) (not e!445322))))

(assert (=> b!803776 (= res!548434 (and (= (size!21357 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21357 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21357 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803777 () Bool)

(assert (=> b!803777 (= e!445323 (not true))))

(declare-fun lt!359783 () (_ BitVec 32))

(assert (=> b!803777 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359783 vacantAfter!23 lt!359782 lt!359780 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359783 vacantBefore!23 (select (arr!20936 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27562 0))(
  ( (Unit!27563) )
))
(declare-fun lt!359777 () Unit!27562)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43711 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27562)

(assert (=> b!803777 (= lt!359777 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359783 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803777 (= lt!359783 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68904 res!548426) b!803776))

(assert (= (and b!803776 res!548434) b!803771))

(assert (= (and b!803771 res!548430) b!803770))

(assert (= (and b!803770 res!548433) b!803772))

(assert (= (and b!803772 res!548435) b!803775))

(assert (= (and b!803775 res!548427) b!803767))

(assert (= (and b!803767 res!548432) b!803768))

(assert (= (and b!803768 res!548436) b!803774))

(assert (= (and b!803774 res!548428) b!803773))

(assert (= (and b!803773 res!548429) b!803769))

(assert (= (and b!803769 res!548431) b!803777))

(declare-fun m!745165 () Bool)

(assert (=> b!803767 m!745165))

(declare-fun m!745167 () Bool)

(assert (=> b!803775 m!745167))

(declare-fun m!745169 () Bool)

(assert (=> b!803770 m!745169))

(declare-fun m!745171 () Bool)

(assert (=> b!803768 m!745171))

(declare-fun m!745173 () Bool)

(assert (=> b!803769 m!745173))

(declare-fun m!745175 () Bool)

(assert (=> b!803769 m!745175))

(assert (=> b!803769 m!745175))

(declare-fun m!745177 () Bool)

(assert (=> b!803769 m!745177))

(assert (=> b!803769 m!745175))

(declare-fun m!745179 () Bool)

(assert (=> b!803769 m!745179))

(declare-fun m!745181 () Bool)

(assert (=> b!803774 m!745181))

(declare-fun m!745183 () Bool)

(assert (=> b!803774 m!745183))

(declare-fun m!745185 () Bool)

(assert (=> b!803772 m!745185))

(assert (=> b!803771 m!745175))

(assert (=> b!803771 m!745175))

(declare-fun m!745187 () Bool)

(assert (=> b!803771 m!745187))

(declare-fun m!745189 () Bool)

(assert (=> start!68904 m!745189))

(declare-fun m!745191 () Bool)

(assert (=> start!68904 m!745191))

(declare-fun m!745193 () Bool)

(assert (=> b!803773 m!745193))

(declare-fun m!745195 () Bool)

(assert (=> b!803773 m!745195))

(declare-fun m!745197 () Bool)

(assert (=> b!803773 m!745197))

(declare-fun m!745199 () Bool)

(assert (=> b!803773 m!745199))

(assert (=> b!803777 m!745175))

(declare-fun m!745201 () Bool)

(assert (=> b!803777 m!745201))

(declare-fun m!745203 () Bool)

(assert (=> b!803777 m!745203))

(assert (=> b!803777 m!745175))

(declare-fun m!745205 () Bool)

(assert (=> b!803777 m!745205))

(declare-fun m!745207 () Bool)

(assert (=> b!803777 m!745207))

(check-sat (not b!803767) (not b!803770) (not b!803771) (not b!803775) (not b!803773) (not b!803768) (not b!803769) (not b!803772) (not start!68904) (not b!803777))
(check-sat)
