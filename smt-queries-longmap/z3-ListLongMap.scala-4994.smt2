; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68598 () Bool)

(assert start!68598)

(declare-fun b!796667 () Bool)

(declare-fun res!540816 () Bool)

(declare-fun e!442161 () Bool)

(assert (=> b!796667 (=> (not res!540816) (not e!442161))))

(declare-datatypes ((array!43262 0))(
  ( (array!43263 (arr!20707 (Array (_ BitVec 32) (_ BitVec 64))) (size!21127 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43262)

(declare-datatypes ((List!14577 0))(
  ( (Nil!14574) (Cons!14573 (h!15708 (_ BitVec 64)) (t!20884 List!14577)) )
))
(declare-fun arrayNoDuplicates!0 (array!43262 (_ BitVec 32) List!14577) Bool)

(assert (=> b!796667 (= res!540816 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14574))))

(declare-fun b!796668 () Bool)

(declare-fun res!540813 () Bool)

(declare-fun e!442162 () Bool)

(assert (=> b!796668 (=> (not res!540813) (not e!442162))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796668 (= res!540813 (validKeyInArray!0 k0!2044))))

(declare-fun b!796669 () Bool)

(declare-fun e!442163 () Bool)

(assert (=> b!796669 (= e!442163 (not true))))

(declare-datatypes ((SeekEntryResult!8254 0))(
  ( (MissingZero!8254 (index!35384 (_ BitVec 32))) (Found!8254 (index!35385 (_ BitVec 32))) (Intermediate!8254 (undefined!9066 Bool) (index!35386 (_ BitVec 32)) (x!66455 (_ BitVec 32))) (Undefined!8254) (MissingVacant!8254 (index!35387 (_ BitVec 32))) )
))
(declare-fun lt!355133 () SeekEntryResult!8254)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796669 (= lt!355133 (Found!8254 index!1236))))

(declare-fun b!796670 () Bool)

(declare-fun res!540822 () Bool)

(assert (=> b!796670 (=> (not res!540822) (not e!442161))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43262 (_ BitVec 32)) Bool)

(assert (=> b!796670 (= res!540822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796671 () Bool)

(assert (=> b!796671 (= e!442162 e!442161)))

(declare-fun res!540812 () Bool)

(assert (=> b!796671 (=> (not res!540812) (not e!442161))))

(declare-fun lt!355137 () SeekEntryResult!8254)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796671 (= res!540812 (or (= lt!355137 (MissingZero!8254 i!1163)) (= lt!355137 (MissingVacant!8254 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43262 (_ BitVec 32)) SeekEntryResult!8254)

(assert (=> b!796671 (= lt!355137 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796672 () Bool)

(declare-fun res!540821 () Bool)

(assert (=> b!796672 (=> (not res!540821) (not e!442162))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796672 (= res!540821 (and (= (size!21127 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21127 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21127 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796673 () Bool)

(declare-fun res!540814 () Bool)

(assert (=> b!796673 (=> (not res!540814) (not e!442162))))

(assert (=> b!796673 (= res!540814 (validKeyInArray!0 (select (arr!20707 a!3170) j!153)))))

(declare-fun res!540819 () Bool)

(assert (=> start!68598 (=> (not res!540819) (not e!442162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68598 (= res!540819 (validMask!0 mask!3266))))

(assert (=> start!68598 e!442162))

(assert (=> start!68598 true))

(declare-fun array_inv!16566 (array!43262) Bool)

(assert (=> start!68598 (array_inv!16566 a!3170)))

(declare-fun b!796674 () Bool)

(declare-fun res!540818 () Bool)

(assert (=> b!796674 (=> (not res!540818) (not e!442162))))

(declare-fun arrayContainsKey!0 (array!43262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796674 (= res!540818 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796675 () Bool)

(declare-fun res!540817 () Bool)

(assert (=> b!796675 (=> (not res!540817) (not e!442161))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796675 (= res!540817 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21127 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20707 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21127 a!3170)) (= (select (arr!20707 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796676 () Bool)

(declare-fun e!442164 () Bool)

(assert (=> b!796676 (= e!442164 e!442163)))

(declare-fun res!540820 () Bool)

(assert (=> b!796676 (=> (not res!540820) (not e!442163))))

(declare-fun lt!355134 () SeekEntryResult!8254)

(declare-fun lt!355138 () SeekEntryResult!8254)

(assert (=> b!796676 (= res!540820 (and (= lt!355134 lt!355138) (= lt!355138 (Found!8254 j!153)) (= (select (arr!20707 a!3170) index!1236) (select (arr!20707 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43262 (_ BitVec 32)) SeekEntryResult!8254)

(assert (=> b!796676 (= lt!355138 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796676 (= lt!355134 (seekEntryOrOpen!0 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796677 () Bool)

(assert (=> b!796677 (= e!442161 e!442164)))

(declare-fun res!540815 () Bool)

(assert (=> b!796677 (=> (not res!540815) (not e!442164))))

(declare-fun lt!355135 () SeekEntryResult!8254)

(assert (=> b!796677 (= res!540815 (= lt!355135 lt!355133))))

(declare-fun lt!355132 () (_ BitVec 64))

(declare-fun lt!355136 () array!43262)

(assert (=> b!796677 (= lt!355133 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355132 lt!355136 mask!3266))))

(assert (=> b!796677 (= lt!355135 (seekEntryOrOpen!0 lt!355132 lt!355136 mask!3266))))

(assert (=> b!796677 (= lt!355132 (select (store (arr!20707 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796677 (= lt!355136 (array!43263 (store (arr!20707 a!3170) i!1163 k0!2044) (size!21127 a!3170)))))

(assert (= (and start!68598 res!540819) b!796672))

(assert (= (and b!796672 res!540821) b!796673))

(assert (= (and b!796673 res!540814) b!796668))

(assert (= (and b!796668 res!540813) b!796674))

(assert (= (and b!796674 res!540818) b!796671))

(assert (= (and b!796671 res!540812) b!796670))

(assert (= (and b!796670 res!540822) b!796667))

(assert (= (and b!796667 res!540816) b!796675))

(assert (= (and b!796675 res!540817) b!796677))

(assert (= (and b!796677 res!540815) b!796676))

(assert (= (and b!796676 res!540820) b!796669))

(declare-fun m!737843 () Bool)

(assert (=> b!796676 m!737843))

(declare-fun m!737845 () Bool)

(assert (=> b!796676 m!737845))

(assert (=> b!796676 m!737845))

(declare-fun m!737847 () Bool)

(assert (=> b!796676 m!737847))

(assert (=> b!796676 m!737845))

(declare-fun m!737849 () Bool)

(assert (=> b!796676 m!737849))

(declare-fun m!737851 () Bool)

(assert (=> b!796668 m!737851))

(declare-fun m!737853 () Bool)

(assert (=> b!796674 m!737853))

(declare-fun m!737855 () Bool)

(assert (=> b!796675 m!737855))

(declare-fun m!737857 () Bool)

(assert (=> b!796675 m!737857))

(declare-fun m!737859 () Bool)

(assert (=> b!796667 m!737859))

(declare-fun m!737861 () Bool)

(assert (=> b!796670 m!737861))

(declare-fun m!737863 () Bool)

(assert (=> start!68598 m!737863))

(declare-fun m!737865 () Bool)

(assert (=> start!68598 m!737865))

(assert (=> b!796673 m!737845))

(assert (=> b!796673 m!737845))

(declare-fun m!737867 () Bool)

(assert (=> b!796673 m!737867))

(declare-fun m!737869 () Bool)

(assert (=> b!796671 m!737869))

(declare-fun m!737871 () Bool)

(assert (=> b!796677 m!737871))

(declare-fun m!737873 () Bool)

(assert (=> b!796677 m!737873))

(declare-fun m!737875 () Bool)

(assert (=> b!796677 m!737875))

(declare-fun m!737877 () Bool)

(assert (=> b!796677 m!737877))

(check-sat (not start!68598) (not b!796667) (not b!796673) (not b!796677) (not b!796671) (not b!796676) (not b!796670) (not b!796674) (not b!796668))
(check-sat)
