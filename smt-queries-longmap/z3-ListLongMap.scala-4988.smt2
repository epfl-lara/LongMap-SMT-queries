; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68562 () Bool)

(assert start!68562)

(declare-fun b!796116 () Bool)

(declare-fun res!540268 () Bool)

(declare-fun e!441934 () Bool)

(assert (=> b!796116 (=> (not res!540268) (not e!441934))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43226 0))(
  ( (array!43227 (arr!20689 (Array (_ BitVec 32) (_ BitVec 64))) (size!21109 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43226)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796116 (= res!540268 (and (= (size!21109 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21109 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21109 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796117 () Bool)

(declare-fun res!540261 () Bool)

(declare-fun e!441935 () Bool)

(assert (=> b!796117 (=> (not res!540261) (not e!441935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43226 (_ BitVec 32)) Bool)

(assert (=> b!796117 (= res!540261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!540269 () Bool)

(assert (=> start!68562 (=> (not res!540269) (not e!441934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68562 (= res!540269 (validMask!0 mask!3266))))

(assert (=> start!68562 e!441934))

(assert (=> start!68562 true))

(declare-fun array_inv!16548 (array!43226) Bool)

(assert (=> start!68562 (array_inv!16548 a!3170)))

(declare-fun b!796118 () Bool)

(declare-fun e!441936 () Bool)

(assert (=> b!796118 (= e!441936 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8236 0))(
  ( (MissingZero!8236 (index!35312 (_ BitVec 32))) (Found!8236 (index!35313 (_ BitVec 32))) (Intermediate!8236 (undefined!9048 Bool) (index!35314 (_ BitVec 32)) (x!66389 (_ BitVec 32))) (Undefined!8236) (MissingVacant!8236 (index!35315 (_ BitVec 32))) )
))
(declare-fun lt!354859 () SeekEntryResult!8236)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43226 (_ BitVec 32)) SeekEntryResult!8236)

(assert (=> b!796118 (= lt!354859 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20689 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354862 () SeekEntryResult!8236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43226 (_ BitVec 32)) SeekEntryResult!8236)

(assert (=> b!796118 (= lt!354862 (seekEntryOrOpen!0 (select (arr!20689 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796119 () Bool)

(declare-fun res!540266 () Bool)

(assert (=> b!796119 (=> (not res!540266) (not e!441934))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796119 (= res!540266 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796120 () Bool)

(assert (=> b!796120 (= e!441935 e!441936)))

(declare-fun res!540267 () Bool)

(assert (=> b!796120 (=> (not res!540267) (not e!441936))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354860 () (_ BitVec 64))

(declare-fun lt!354861 () array!43226)

(assert (=> b!796120 (= res!540267 (= (seekEntryOrOpen!0 lt!354860 lt!354861 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354860 lt!354861 mask!3266)))))

(assert (=> b!796120 (= lt!354860 (select (store (arr!20689 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796120 (= lt!354861 (array!43227 (store (arr!20689 a!3170) i!1163 k0!2044) (size!21109 a!3170)))))

(declare-fun b!796121 () Bool)

(assert (=> b!796121 (= e!441934 e!441935)))

(declare-fun res!540265 () Bool)

(assert (=> b!796121 (=> (not res!540265) (not e!441935))))

(declare-fun lt!354858 () SeekEntryResult!8236)

(assert (=> b!796121 (= res!540265 (or (= lt!354858 (MissingZero!8236 i!1163)) (= lt!354858 (MissingVacant!8236 i!1163))))))

(assert (=> b!796121 (= lt!354858 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796122 () Bool)

(declare-fun res!540262 () Bool)

(assert (=> b!796122 (=> (not res!540262) (not e!441935))))

(declare-datatypes ((List!14559 0))(
  ( (Nil!14556) (Cons!14555 (h!15690 (_ BitVec 64)) (t!20866 List!14559)) )
))
(declare-fun arrayNoDuplicates!0 (array!43226 (_ BitVec 32) List!14559) Bool)

(assert (=> b!796122 (= res!540262 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14556))))

(declare-fun b!796123 () Bool)

(declare-fun res!540263 () Bool)

(assert (=> b!796123 (=> (not res!540263) (not e!441934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796123 (= res!540263 (validKeyInArray!0 (select (arr!20689 a!3170) j!153)))))

(declare-fun b!796124 () Bool)

(declare-fun res!540264 () Bool)

(assert (=> b!796124 (=> (not res!540264) (not e!441935))))

(assert (=> b!796124 (= res!540264 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21109 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20689 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21109 a!3170)) (= (select (arr!20689 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796125 () Bool)

(declare-fun res!540270 () Bool)

(assert (=> b!796125 (=> (not res!540270) (not e!441934))))

(assert (=> b!796125 (= res!540270 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68562 res!540269) b!796116))

(assert (= (and b!796116 res!540268) b!796123))

(assert (= (and b!796123 res!540263) b!796125))

(assert (= (and b!796125 res!540270) b!796119))

(assert (= (and b!796119 res!540266) b!796121))

(assert (= (and b!796121 res!540265) b!796117))

(assert (= (and b!796117 res!540261) b!796122))

(assert (= (and b!796122 res!540262) b!796124))

(assert (= (and b!796124 res!540264) b!796120))

(assert (= (and b!796120 res!540267) b!796118))

(declare-fun m!737189 () Bool)

(assert (=> b!796117 m!737189))

(declare-fun m!737191 () Bool)

(assert (=> b!796123 m!737191))

(assert (=> b!796123 m!737191))

(declare-fun m!737193 () Bool)

(assert (=> b!796123 m!737193))

(declare-fun m!737195 () Bool)

(assert (=> b!796121 m!737195))

(assert (=> b!796118 m!737191))

(assert (=> b!796118 m!737191))

(declare-fun m!737197 () Bool)

(assert (=> b!796118 m!737197))

(assert (=> b!796118 m!737191))

(declare-fun m!737199 () Bool)

(assert (=> b!796118 m!737199))

(declare-fun m!737201 () Bool)

(assert (=> b!796125 m!737201))

(declare-fun m!737203 () Bool)

(assert (=> b!796122 m!737203))

(declare-fun m!737205 () Bool)

(assert (=> start!68562 m!737205))

(declare-fun m!737207 () Bool)

(assert (=> start!68562 m!737207))

(declare-fun m!737209 () Bool)

(assert (=> b!796120 m!737209))

(declare-fun m!737211 () Bool)

(assert (=> b!796120 m!737211))

(declare-fun m!737213 () Bool)

(assert (=> b!796120 m!737213))

(declare-fun m!737215 () Bool)

(assert (=> b!796120 m!737215))

(declare-fun m!737217 () Bool)

(assert (=> b!796119 m!737217))

(declare-fun m!737219 () Bool)

(assert (=> b!796124 m!737219))

(declare-fun m!737221 () Bool)

(assert (=> b!796124 m!737221))

(check-sat (not b!796120) (not b!796121) (not b!796122) (not start!68562) (not b!796119) (not b!796118) (not b!796125) (not b!796117) (not b!796123))
(check-sat)
