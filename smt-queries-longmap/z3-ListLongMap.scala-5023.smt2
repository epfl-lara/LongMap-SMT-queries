; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68816 () Bool)

(assert start!68816)

(declare-fun b!799851 () Bool)

(declare-fun res!543826 () Bool)

(declare-fun e!443686 () Bool)

(assert (=> b!799851 (=> (not res!543826) (not e!443686))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43438 0))(
  ( (array!43439 (arr!20794 (Array (_ BitVec 32) (_ BitVec 64))) (size!21214 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43438)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799851 (= res!543826 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21214 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20794 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21214 a!3170)) (= (select (arr!20794 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799852 () Bool)

(declare-fun res!543823 () Bool)

(declare-fun e!443681 () Bool)

(assert (=> b!799852 (=> (not res!543823) (not e!443681))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799852 (= res!543823 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799853 () Bool)

(declare-fun e!443682 () Bool)

(assert (=> b!799853 (= e!443682 false)))

(declare-datatypes ((SeekEntryResult!8341 0))(
  ( (MissingZero!8341 (index!35732 (_ BitVec 32))) (Found!8341 (index!35733 (_ BitVec 32))) (Intermediate!8341 (undefined!9153 Bool) (index!35734 (_ BitVec 32)) (x!66777 (_ BitVec 32))) (Undefined!8341) (MissingVacant!8341 (index!35735 (_ BitVec 32))) )
))
(declare-fun lt!357062 () SeekEntryResult!8341)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357060 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43438 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!799853 (= lt!357062 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357060 vacantBefore!23 (select (arr!20794 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799854 () Bool)

(declare-fun res!543828 () Bool)

(assert (=> b!799854 (=> (not res!543828) (not e!443681))))

(assert (=> b!799854 (= res!543828 (and (= (size!21214 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21214 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21214 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799855 () Bool)

(declare-fun e!443683 () Bool)

(declare-fun e!443684 () Bool)

(assert (=> b!799855 (= e!443683 e!443684)))

(declare-fun res!543834 () Bool)

(assert (=> b!799855 (=> (not res!543834) (not e!443684))))

(declare-fun lt!357056 () SeekEntryResult!8341)

(declare-fun lt!357058 () SeekEntryResult!8341)

(assert (=> b!799855 (= res!543834 (and (= lt!357058 lt!357056) (= lt!357056 (Found!8341 j!153)) (not (= (select (arr!20794 a!3170) index!1236) (select (arr!20794 a!3170) j!153)))))))

(assert (=> b!799855 (= lt!357056 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20794 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43438 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!799855 (= lt!357058 (seekEntryOrOpen!0 (select (arr!20794 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799856 () Bool)

(assert (=> b!799856 (= e!443686 e!443683)))

(declare-fun res!543825 () Bool)

(assert (=> b!799856 (=> (not res!543825) (not e!443683))))

(declare-fun lt!357059 () array!43438)

(declare-fun lt!357057 () (_ BitVec 64))

(declare-fun lt!357061 () SeekEntryResult!8341)

(assert (=> b!799856 (= res!543825 (= lt!357061 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357057 lt!357059 mask!3266)))))

(assert (=> b!799856 (= lt!357061 (seekEntryOrOpen!0 lt!357057 lt!357059 mask!3266))))

(assert (=> b!799856 (= lt!357057 (select (store (arr!20794 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799856 (= lt!357059 (array!43439 (store (arr!20794 a!3170) i!1163 k0!2044) (size!21214 a!3170)))))

(declare-fun b!799857 () Bool)

(declare-fun res!543824 () Bool)

(assert (=> b!799857 (=> (not res!543824) (not e!443682))))

(assert (=> b!799857 (= res!543824 (= lt!357061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357060 vacantAfter!23 lt!357057 lt!357059 mask!3266)))))

(declare-fun b!799858 () Bool)

(assert (=> b!799858 (= e!443681 e!443686)))

(declare-fun res!543830 () Bool)

(assert (=> b!799858 (=> (not res!543830) (not e!443686))))

(declare-fun lt!357055 () SeekEntryResult!8341)

(assert (=> b!799858 (= res!543830 (or (= lt!357055 (MissingZero!8341 i!1163)) (= lt!357055 (MissingVacant!8341 i!1163))))))

(assert (=> b!799858 (= lt!357055 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799859 () Bool)

(declare-fun res!543833 () Bool)

(assert (=> b!799859 (=> (not res!543833) (not e!443686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43438 (_ BitVec 32)) Bool)

(assert (=> b!799859 (= res!543833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!543832 () Bool)

(assert (=> start!68816 (=> (not res!543832) (not e!443681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68816 (= res!543832 (validMask!0 mask!3266))))

(assert (=> start!68816 e!443681))

(assert (=> start!68816 true))

(declare-fun array_inv!16653 (array!43438) Bool)

(assert (=> start!68816 (array_inv!16653 a!3170)))

(declare-fun b!799860 () Bool)

(declare-fun res!543822 () Bool)

(assert (=> b!799860 (=> (not res!543822) (not e!443681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799860 (= res!543822 (validKeyInArray!0 (select (arr!20794 a!3170) j!153)))))

(declare-fun b!799861 () Bool)

(declare-fun res!543827 () Bool)

(assert (=> b!799861 (=> (not res!543827) (not e!443686))))

(declare-datatypes ((List!14664 0))(
  ( (Nil!14661) (Cons!14660 (h!15795 (_ BitVec 64)) (t!20971 List!14664)) )
))
(declare-fun arrayNoDuplicates!0 (array!43438 (_ BitVec 32) List!14664) Bool)

(assert (=> b!799861 (= res!543827 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14661))))

(declare-fun b!799862 () Bool)

(declare-fun res!543829 () Bool)

(assert (=> b!799862 (=> (not res!543829) (not e!443681))))

(assert (=> b!799862 (= res!543829 (validKeyInArray!0 k0!2044))))

(declare-fun b!799863 () Bool)

(assert (=> b!799863 (= e!443684 e!443682)))

(declare-fun res!543831 () Bool)

(assert (=> b!799863 (=> (not res!543831) (not e!443682))))

(assert (=> b!799863 (= res!543831 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357060 #b00000000000000000000000000000000) (bvslt lt!357060 (size!21214 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799863 (= lt!357060 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (= (and start!68816 res!543832) b!799854))

(assert (= (and b!799854 res!543828) b!799860))

(assert (= (and b!799860 res!543822) b!799862))

(assert (= (and b!799862 res!543829) b!799852))

(assert (= (and b!799852 res!543823) b!799858))

(assert (= (and b!799858 res!543830) b!799859))

(assert (= (and b!799859 res!543833) b!799861))

(assert (= (and b!799861 res!543827) b!799851))

(assert (= (and b!799851 res!543826) b!799856))

(assert (= (and b!799856 res!543825) b!799855))

(assert (= (and b!799855 res!543834) b!799863))

(assert (= (and b!799863 res!543831) b!799857))

(assert (= (and b!799857 res!543824) b!799853))

(declare-fun m!741193 () Bool)

(assert (=> b!799856 m!741193))

(declare-fun m!741195 () Bool)

(assert (=> b!799856 m!741195))

(declare-fun m!741197 () Bool)

(assert (=> b!799856 m!741197))

(declare-fun m!741199 () Bool)

(assert (=> b!799856 m!741199))

(declare-fun m!741201 () Bool)

(assert (=> b!799852 m!741201))

(declare-fun m!741203 () Bool)

(assert (=> b!799862 m!741203))

(declare-fun m!741205 () Bool)

(assert (=> b!799861 m!741205))

(declare-fun m!741207 () Bool)

(assert (=> b!799858 m!741207))

(declare-fun m!741209 () Bool)

(assert (=> b!799859 m!741209))

(declare-fun m!741211 () Bool)

(assert (=> b!799857 m!741211))

(declare-fun m!741213 () Bool)

(assert (=> b!799853 m!741213))

(assert (=> b!799853 m!741213))

(declare-fun m!741215 () Bool)

(assert (=> b!799853 m!741215))

(declare-fun m!741217 () Bool)

(assert (=> b!799855 m!741217))

(assert (=> b!799855 m!741213))

(assert (=> b!799855 m!741213))

(declare-fun m!741219 () Bool)

(assert (=> b!799855 m!741219))

(assert (=> b!799855 m!741213))

(declare-fun m!741221 () Bool)

(assert (=> b!799855 m!741221))

(declare-fun m!741223 () Bool)

(assert (=> b!799863 m!741223))

(declare-fun m!741225 () Bool)

(assert (=> b!799851 m!741225))

(declare-fun m!741227 () Bool)

(assert (=> b!799851 m!741227))

(declare-fun m!741229 () Bool)

(assert (=> start!68816 m!741229))

(declare-fun m!741231 () Bool)

(assert (=> start!68816 m!741231))

(assert (=> b!799860 m!741213))

(assert (=> b!799860 m!741213))

(declare-fun m!741233 () Bool)

(assert (=> b!799860 m!741233))

(check-sat (not b!799861) (not start!68816) (not b!799863) (not b!799853) (not b!799862) (not b!799856) (not b!799858) (not b!799852) (not b!799857) (not b!799855) (not b!799859) (not b!799860))
(check-sat)
