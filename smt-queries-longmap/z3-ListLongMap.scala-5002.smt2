; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68502 () Bool)

(assert start!68502)

(declare-fun b!796567 () Bool)

(declare-fun e!441954 () Bool)

(assert (=> b!796567 (= e!441954 (not true))))

(declare-datatypes ((SeekEntryResult!8323 0))(
  ( (MissingZero!8323 (index!35660 (_ BitVec 32))) (Found!8323 (index!35661 (_ BitVec 32))) (Intermediate!8323 (undefined!9135 Bool) (index!35662 (_ BitVec 32)) (x!66572 (_ BitVec 32))) (Undefined!8323) (MissingVacant!8323 (index!35663 (_ BitVec 32))) )
))
(declare-fun lt!355125 () SeekEntryResult!8323)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796567 (= lt!355125 (Found!8323 index!1236))))

(declare-fun res!541226 () Bool)

(declare-fun e!441957 () Bool)

(assert (=> start!68502 (=> (not res!541226) (not e!441957))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68502 (= res!541226 (validMask!0 mask!3266))))

(assert (=> start!68502 e!441957))

(assert (=> start!68502 true))

(declare-datatypes ((array!43309 0))(
  ( (array!43310 (arr!20735 (Array (_ BitVec 32) (_ BitVec 64))) (size!21156 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43309)

(declare-fun array_inv!16618 (array!43309) Bool)

(assert (=> start!68502 (array_inv!16618 a!3170)))

(declare-fun b!796568 () Bool)

(declare-fun e!441955 () Bool)

(declare-fun e!441958 () Bool)

(assert (=> b!796568 (= e!441955 e!441958)))

(declare-fun res!541229 () Bool)

(assert (=> b!796568 (=> (not res!541229) (not e!441958))))

(declare-fun lt!355126 () SeekEntryResult!8323)

(assert (=> b!796568 (= res!541229 (= lt!355126 lt!355125))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355130 () (_ BitVec 64))

(declare-fun lt!355128 () array!43309)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43309 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!796568 (= lt!355125 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355130 lt!355128 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43309 (_ BitVec 32)) SeekEntryResult!8323)

(assert (=> b!796568 (= lt!355126 (seekEntryOrOpen!0 lt!355130 lt!355128 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796568 (= lt!355130 (select (store (arr!20735 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796568 (= lt!355128 (array!43310 (store (arr!20735 a!3170) i!1163 k0!2044) (size!21156 a!3170)))))

(declare-fun b!796569 () Bool)

(declare-fun res!541234 () Bool)

(assert (=> b!796569 (=> (not res!541234) (not e!441957))))

(declare-fun arrayContainsKey!0 (array!43309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796569 (= res!541234 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796570 () Bool)

(assert (=> b!796570 (= e!441957 e!441955)))

(declare-fun res!541236 () Bool)

(assert (=> b!796570 (=> (not res!541236) (not e!441955))))

(declare-fun lt!355129 () SeekEntryResult!8323)

(assert (=> b!796570 (= res!541236 (or (= lt!355129 (MissingZero!8323 i!1163)) (= lt!355129 (MissingVacant!8323 i!1163))))))

(assert (=> b!796570 (= lt!355129 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796571 () Bool)

(declare-fun res!541228 () Bool)

(assert (=> b!796571 (=> (not res!541228) (not e!441955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43309 (_ BitVec 32)) Bool)

(assert (=> b!796571 (= res!541228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796572 () Bool)

(declare-fun res!541233 () Bool)

(assert (=> b!796572 (=> (not res!541233) (not e!441957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796572 (= res!541233 (validKeyInArray!0 k0!2044))))

(declare-fun b!796573 () Bool)

(declare-fun res!541230 () Bool)

(assert (=> b!796573 (=> (not res!541230) (not e!441955))))

(declare-datatypes ((List!14737 0))(
  ( (Nil!14734) (Cons!14733 (h!15862 (_ BitVec 64)) (t!21043 List!14737)) )
))
(declare-fun arrayNoDuplicates!0 (array!43309 (_ BitVec 32) List!14737) Bool)

(assert (=> b!796573 (= res!541230 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14734))))

(declare-fun b!796574 () Bool)

(declare-fun res!541227 () Bool)

(assert (=> b!796574 (=> (not res!541227) (not e!441955))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796574 (= res!541227 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21156 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20735 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21156 a!3170)) (= (select (arr!20735 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796575 () Bool)

(assert (=> b!796575 (= e!441958 e!441954)))

(declare-fun res!541235 () Bool)

(assert (=> b!796575 (=> (not res!541235) (not e!441954))))

(declare-fun lt!355124 () SeekEntryResult!8323)

(declare-fun lt!355127 () SeekEntryResult!8323)

(assert (=> b!796575 (= res!541235 (and (= lt!355124 lt!355127) (= lt!355127 (Found!8323 j!153)) (= (select (arr!20735 a!3170) index!1236) (select (arr!20735 a!3170) j!153))))))

(assert (=> b!796575 (= lt!355127 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20735 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796575 (= lt!355124 (seekEntryOrOpen!0 (select (arr!20735 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796576 () Bool)

(declare-fun res!541231 () Bool)

(assert (=> b!796576 (=> (not res!541231) (not e!441957))))

(assert (=> b!796576 (= res!541231 (validKeyInArray!0 (select (arr!20735 a!3170) j!153)))))

(declare-fun b!796577 () Bool)

(declare-fun res!541232 () Bool)

(assert (=> b!796577 (=> (not res!541232) (not e!441957))))

(assert (=> b!796577 (= res!541232 (and (= (size!21156 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21156 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21156 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68502 res!541226) b!796577))

(assert (= (and b!796577 res!541232) b!796576))

(assert (= (and b!796576 res!541231) b!796572))

(assert (= (and b!796572 res!541233) b!796569))

(assert (= (and b!796569 res!541234) b!796570))

(assert (= (and b!796570 res!541236) b!796571))

(assert (= (and b!796571 res!541228) b!796573))

(assert (= (and b!796573 res!541230) b!796574))

(assert (= (and b!796574 res!541227) b!796568))

(assert (= (and b!796568 res!541229) b!796575))

(assert (= (and b!796575 res!541235) b!796567))

(declare-fun m!736903 () Bool)

(assert (=> b!796571 m!736903))

(declare-fun m!736905 () Bool)

(assert (=> b!796568 m!736905))

(declare-fun m!736907 () Bool)

(assert (=> b!796568 m!736907))

(declare-fun m!736909 () Bool)

(assert (=> b!796568 m!736909))

(declare-fun m!736911 () Bool)

(assert (=> b!796568 m!736911))

(declare-fun m!736913 () Bool)

(assert (=> b!796575 m!736913))

(declare-fun m!736915 () Bool)

(assert (=> b!796575 m!736915))

(assert (=> b!796575 m!736915))

(declare-fun m!736917 () Bool)

(assert (=> b!796575 m!736917))

(assert (=> b!796575 m!736915))

(declare-fun m!736919 () Bool)

(assert (=> b!796575 m!736919))

(declare-fun m!736921 () Bool)

(assert (=> start!68502 m!736921))

(declare-fun m!736923 () Bool)

(assert (=> start!68502 m!736923))

(declare-fun m!736925 () Bool)

(assert (=> b!796570 m!736925))

(declare-fun m!736927 () Bool)

(assert (=> b!796572 m!736927))

(declare-fun m!736929 () Bool)

(assert (=> b!796569 m!736929))

(declare-fun m!736931 () Bool)

(assert (=> b!796573 m!736931))

(assert (=> b!796576 m!736915))

(assert (=> b!796576 m!736915))

(declare-fun m!736933 () Bool)

(assert (=> b!796576 m!736933))

(declare-fun m!736935 () Bool)

(assert (=> b!796574 m!736935))

(declare-fun m!736937 () Bool)

(assert (=> b!796574 m!736937))

(check-sat (not b!796575) (not b!796576) (not b!796571) (not b!796572) (not b!796568) (not b!796573) (not b!796570) (not b!796569) (not start!68502))
(check-sat)
