; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68490 () Bool)

(assert start!68490)

(declare-fun b!795025 () Bool)

(declare-fun res!539171 () Bool)

(declare-fun e!441520 () Bool)

(assert (=> b!795025 (=> (not res!539171) (not e!441520))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43154 0))(
  ( (array!43155 (arr!20653 (Array (_ BitVec 32) (_ BitVec 64))) (size!21073 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43154)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795025 (= res!539171 (and (= (size!21073 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21073 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21073 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795026 () Bool)

(declare-fun res!539178 () Bool)

(declare-fun e!441519 () Bool)

(assert (=> b!795026 (=> (not res!539178) (not e!441519))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795026 (= res!539178 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21073 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20653 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21073 a!3170)) (= (select (arr!20653 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795027 () Bool)

(declare-fun res!539177 () Bool)

(assert (=> b!795027 (=> (not res!539177) (not e!441520))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795027 (= res!539177 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795028 () Bool)

(declare-fun res!539173 () Bool)

(assert (=> b!795028 (=> (not res!539173) (not e!441519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43154 (_ BitVec 32)) Bool)

(assert (=> b!795028 (= res!539173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795029 () Bool)

(declare-fun res!539176 () Bool)

(assert (=> b!795029 (=> (not res!539176) (not e!441520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795029 (= res!539176 (validKeyInArray!0 k0!2044))))

(declare-fun b!795031 () Bool)

(assert (=> b!795031 (= e!441520 e!441519)))

(declare-fun res!539175 () Bool)

(assert (=> b!795031 (=> (not res!539175) (not e!441519))))

(declare-datatypes ((SeekEntryResult!8200 0))(
  ( (MissingZero!8200 (index!35168 (_ BitVec 32))) (Found!8200 (index!35169 (_ BitVec 32))) (Intermediate!8200 (undefined!9012 Bool) (index!35170 (_ BitVec 32)) (x!66257 (_ BitVec 32))) (Undefined!8200) (MissingVacant!8200 (index!35171 (_ BitVec 32))) )
))
(declare-fun lt!354373 () SeekEntryResult!8200)

(assert (=> b!795031 (= res!539175 (or (= lt!354373 (MissingZero!8200 i!1163)) (= lt!354373 (MissingVacant!8200 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43154 (_ BitVec 32)) SeekEntryResult!8200)

(assert (=> b!795031 (= lt!354373 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795032 () Bool)

(assert (=> b!795032 (= e!441519 false)))

(declare-fun lt!354374 () SeekEntryResult!8200)

(declare-fun lt!354375 () array!43154)

(declare-fun lt!354376 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43154 (_ BitVec 32)) SeekEntryResult!8200)

(assert (=> b!795032 (= lt!354374 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354376 lt!354375 mask!3266))))

(declare-fun lt!354372 () SeekEntryResult!8200)

(assert (=> b!795032 (= lt!354372 (seekEntryOrOpen!0 lt!354376 lt!354375 mask!3266))))

(assert (=> b!795032 (= lt!354376 (select (store (arr!20653 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795032 (= lt!354375 (array!43155 (store (arr!20653 a!3170) i!1163 k0!2044) (size!21073 a!3170)))))

(declare-fun b!795033 () Bool)

(declare-fun res!539172 () Bool)

(assert (=> b!795033 (=> (not res!539172) (not e!441519))))

(declare-datatypes ((List!14523 0))(
  ( (Nil!14520) (Cons!14519 (h!15654 (_ BitVec 64)) (t!20830 List!14523)) )
))
(declare-fun arrayNoDuplicates!0 (array!43154 (_ BitVec 32) List!14523) Bool)

(assert (=> b!795033 (= res!539172 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14520))))

(declare-fun res!539174 () Bool)

(assert (=> start!68490 (=> (not res!539174) (not e!441520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68490 (= res!539174 (validMask!0 mask!3266))))

(assert (=> start!68490 e!441520))

(assert (=> start!68490 true))

(declare-fun array_inv!16512 (array!43154) Bool)

(assert (=> start!68490 (array_inv!16512 a!3170)))

(declare-fun b!795030 () Bool)

(declare-fun res!539170 () Bool)

(assert (=> b!795030 (=> (not res!539170) (not e!441520))))

(assert (=> b!795030 (= res!539170 (validKeyInArray!0 (select (arr!20653 a!3170) j!153)))))

(assert (= (and start!68490 res!539174) b!795025))

(assert (= (and b!795025 res!539171) b!795030))

(assert (= (and b!795030 res!539170) b!795029))

(assert (= (and b!795029 res!539176) b!795027))

(assert (= (and b!795027 res!539177) b!795031))

(assert (= (and b!795031 res!539175) b!795028))

(assert (= (and b!795028 res!539173) b!795033))

(assert (= (and b!795033 res!539172) b!795026))

(assert (= (and b!795026 res!539178) b!795032))

(declare-fun m!735983 () Bool)

(assert (=> b!795029 m!735983))

(declare-fun m!735985 () Bool)

(assert (=> b!795033 m!735985))

(declare-fun m!735987 () Bool)

(assert (=> b!795031 m!735987))

(declare-fun m!735989 () Bool)

(assert (=> start!68490 m!735989))

(declare-fun m!735991 () Bool)

(assert (=> start!68490 m!735991))

(declare-fun m!735993 () Bool)

(assert (=> b!795027 m!735993))

(declare-fun m!735995 () Bool)

(assert (=> b!795030 m!735995))

(assert (=> b!795030 m!735995))

(declare-fun m!735997 () Bool)

(assert (=> b!795030 m!735997))

(declare-fun m!735999 () Bool)

(assert (=> b!795032 m!735999))

(declare-fun m!736001 () Bool)

(assert (=> b!795032 m!736001))

(declare-fun m!736003 () Bool)

(assert (=> b!795032 m!736003))

(declare-fun m!736005 () Bool)

(assert (=> b!795032 m!736005))

(declare-fun m!736007 () Bool)

(assert (=> b!795028 m!736007))

(declare-fun m!736009 () Bool)

(assert (=> b!795026 m!736009))

(declare-fun m!736011 () Bool)

(assert (=> b!795026 m!736011))

(check-sat (not b!795027) (not start!68490) (not b!795030) (not b!795028) (not b!795029) (not b!795031) (not b!795032) (not b!795033))
(check-sat)
