; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68868 () Bool)

(assert start!68868)

(declare-fun b!803148 () Bool)

(declare-fun e!445030 () Bool)

(declare-fun e!445027 () Bool)

(assert (=> b!803148 (= e!445030 e!445027)))

(declare-fun res!547816 () Bool)

(assert (=> b!803148 (=> (not res!547816) (not e!445027))))

(declare-datatypes ((SeekEntryResult!8506 0))(
  ( (MissingZero!8506 (index!36392 (_ BitVec 32))) (Found!8506 (index!36393 (_ BitVec 32))) (Intermediate!8506 (undefined!9318 Bool) (index!36394 (_ BitVec 32)) (x!67243 (_ BitVec 32))) (Undefined!8506) (MissingVacant!8506 (index!36395 (_ BitVec 32))) )
))
(declare-fun lt!359329 () SeekEntryResult!8506)

(declare-fun lt!359331 () SeekEntryResult!8506)

(assert (=> b!803148 (= res!547816 (= lt!359329 lt!359331))))

(declare-datatypes ((array!43675 0))(
  ( (array!43676 (arr!20918 (Array (_ BitVec 32) (_ BitVec 64))) (size!21339 (_ BitVec 32))) )
))
(declare-fun lt!359327 () array!43675)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359330 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43675 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!803148 (= lt!359331 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359330 lt!359327 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43675 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!803148 (= lt!359329 (seekEntryOrOpen!0 lt!359330 lt!359327 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!43675)

(assert (=> b!803148 (= lt!359330 (select (store (arr!20918 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803148 (= lt!359327 (array!43676 (store (arr!20918 a!3170) i!1163 k0!2044) (size!21339 a!3170)))))

(declare-fun b!803149 () Bool)

(declare-fun res!547809 () Bool)

(assert (=> b!803149 (=> (not res!547809) (not e!445030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43675 (_ BitVec 32)) Bool)

(assert (=> b!803149 (= res!547809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803150 () Bool)

(declare-fun res!547814 () Bool)

(declare-fun e!445028 () Bool)

(assert (=> b!803150 (=> (not res!547814) (not e!445028))))

(declare-fun arrayContainsKey!0 (array!43675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803150 (= res!547814 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803151 () Bool)

(declare-fun res!547815 () Bool)

(assert (=> b!803151 (=> (not res!547815) (not e!445028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803151 (= res!547815 (validKeyInArray!0 k0!2044))))

(declare-fun res!547810 () Bool)

(assert (=> start!68868 (=> (not res!547810) (not e!445028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68868 (= res!547810 (validMask!0 mask!3266))))

(assert (=> start!68868 e!445028))

(assert (=> start!68868 true))

(declare-fun array_inv!16801 (array!43675) Bool)

(assert (=> start!68868 (array_inv!16801 a!3170)))

(declare-fun b!803152 () Bool)

(declare-fun res!547817 () Bool)

(assert (=> b!803152 (=> (not res!547817) (not e!445028))))

(assert (=> b!803152 (= res!547817 (validKeyInArray!0 (select (arr!20918 a!3170) j!153)))))

(declare-fun lt!359326 () SeekEntryResult!8506)

(declare-fun b!803153 () Bool)

(declare-fun e!445029 () Bool)

(assert (=> b!803153 (= e!445029 (not (or (not (= lt!359331 lt!359326)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359325 () (_ BitVec 32))

(assert (=> b!803153 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359325 vacantAfter!23 lt!359330 lt!359327 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359325 vacantBefore!23 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27526 0))(
  ( (Unit!27527) )
))
(declare-fun lt!359328 () Unit!27526)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27526)

(assert (=> b!803153 (= lt!359328 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359325 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803153 (= lt!359325 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803154 () Bool)

(declare-fun res!547813 () Bool)

(assert (=> b!803154 (=> (not res!547813) (not e!445028))))

(assert (=> b!803154 (= res!547813 (and (= (size!21339 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21339 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21339 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803155 () Bool)

(declare-fun res!547818 () Bool)

(assert (=> b!803155 (=> (not res!547818) (not e!445030))))

(assert (=> b!803155 (= res!547818 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21339 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20918 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21339 a!3170)) (= (select (arr!20918 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803156 () Bool)

(declare-fun e!445025 () Bool)

(assert (=> b!803156 (= e!445027 e!445025)))

(declare-fun res!547812 () Bool)

(assert (=> b!803156 (=> (not res!547812) (not e!445025))))

(declare-fun lt!359324 () SeekEntryResult!8506)

(declare-fun lt!359333 () SeekEntryResult!8506)

(assert (=> b!803156 (= res!547812 (= lt!359324 lt!359333))))

(assert (=> b!803156 (= lt!359333 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803156 (= lt!359324 (seekEntryOrOpen!0 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803157 () Bool)

(declare-fun res!547807 () Bool)

(assert (=> b!803157 (=> (not res!547807) (not e!445030))))

(declare-datatypes ((List!14920 0))(
  ( (Nil!14917) (Cons!14916 (h!16045 (_ BitVec 64)) (t!21226 List!14920)) )
))
(declare-fun arrayNoDuplicates!0 (array!43675 (_ BitVec 32) List!14920) Bool)

(assert (=> b!803157 (= res!547807 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14917))))

(declare-fun b!803158 () Bool)

(assert (=> b!803158 (= e!445025 e!445029)))

(declare-fun res!547808 () Bool)

(assert (=> b!803158 (=> (not res!547808) (not e!445029))))

(assert (=> b!803158 (= res!547808 (and (= lt!359333 lt!359326) (not (= (select (arr!20918 a!3170) index!1236) (select (arr!20918 a!3170) j!153)))))))

(assert (=> b!803158 (= lt!359326 (Found!8506 j!153))))

(declare-fun b!803159 () Bool)

(assert (=> b!803159 (= e!445028 e!445030)))

(declare-fun res!547811 () Bool)

(assert (=> b!803159 (=> (not res!547811) (not e!445030))))

(declare-fun lt!359332 () SeekEntryResult!8506)

(assert (=> b!803159 (= res!547811 (or (= lt!359332 (MissingZero!8506 i!1163)) (= lt!359332 (MissingVacant!8506 i!1163))))))

(assert (=> b!803159 (= lt!359332 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68868 res!547810) b!803154))

(assert (= (and b!803154 res!547813) b!803152))

(assert (= (and b!803152 res!547817) b!803151))

(assert (= (and b!803151 res!547815) b!803150))

(assert (= (and b!803150 res!547814) b!803159))

(assert (= (and b!803159 res!547811) b!803149))

(assert (= (and b!803149 res!547809) b!803157))

(assert (= (and b!803157 res!547807) b!803155))

(assert (= (and b!803155 res!547818) b!803148))

(assert (= (and b!803148 res!547816) b!803156))

(assert (= (and b!803156 res!547812) b!803158))

(assert (= (and b!803158 res!547808) b!803153))

(declare-fun m!744373 () Bool)

(assert (=> b!803157 m!744373))

(declare-fun m!744375 () Bool)

(assert (=> b!803159 m!744375))

(declare-fun m!744377 () Bool)

(assert (=> b!803149 m!744377))

(declare-fun m!744379 () Bool)

(assert (=> b!803158 m!744379))

(declare-fun m!744381 () Bool)

(assert (=> b!803158 m!744381))

(declare-fun m!744383 () Bool)

(assert (=> b!803148 m!744383))

(declare-fun m!744385 () Bool)

(assert (=> b!803148 m!744385))

(declare-fun m!744387 () Bool)

(assert (=> b!803148 m!744387))

(declare-fun m!744389 () Bool)

(assert (=> b!803148 m!744389))

(assert (=> b!803152 m!744381))

(assert (=> b!803152 m!744381))

(declare-fun m!744391 () Bool)

(assert (=> b!803152 m!744391))

(declare-fun m!744393 () Bool)

(assert (=> b!803151 m!744393))

(assert (=> b!803153 m!744381))

(assert (=> b!803153 m!744381))

(declare-fun m!744395 () Bool)

(assert (=> b!803153 m!744395))

(declare-fun m!744397 () Bool)

(assert (=> b!803153 m!744397))

(declare-fun m!744399 () Bool)

(assert (=> b!803153 m!744399))

(declare-fun m!744401 () Bool)

(assert (=> b!803153 m!744401))

(declare-fun m!744403 () Bool)

(assert (=> b!803155 m!744403))

(declare-fun m!744405 () Bool)

(assert (=> b!803155 m!744405))

(declare-fun m!744407 () Bool)

(assert (=> b!803150 m!744407))

(assert (=> b!803156 m!744381))

(assert (=> b!803156 m!744381))

(declare-fun m!744409 () Bool)

(assert (=> b!803156 m!744409))

(assert (=> b!803156 m!744381))

(declare-fun m!744411 () Bool)

(assert (=> b!803156 m!744411))

(declare-fun m!744413 () Bool)

(assert (=> start!68868 m!744413))

(declare-fun m!744415 () Bool)

(assert (=> start!68868 m!744415))

(check-sat (not b!803156) (not b!803159) (not b!803157) (not b!803149) (not b!803148) (not start!68868) (not b!803153) (not b!803152) (not b!803151) (not b!803150))
(check-sat)
