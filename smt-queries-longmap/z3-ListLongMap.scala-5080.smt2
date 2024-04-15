; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68970 () Bool)

(assert start!68970)

(declare-fun b!804539 () Bool)

(declare-fun e!445634 () Bool)

(declare-fun e!445635 () Bool)

(assert (=> b!804539 (= e!445634 e!445635)))

(declare-fun res!549205 () Bool)

(assert (=> b!804539 (=> (not res!549205) (not e!445635))))

(declare-datatypes ((SeekEntryResult!8557 0))(
  ( (MissingZero!8557 (index!36596 (_ BitVec 32))) (Found!8557 (index!36597 (_ BitVec 32))) (Intermediate!8557 (undefined!9369 Bool) (index!36598 (_ BitVec 32)) (x!67430 (_ BitVec 32))) (Undefined!8557) (MissingVacant!8557 (index!36599 (_ BitVec 32))) )
))
(declare-fun lt!360062 () SeekEntryResult!8557)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804539 (= res!549205 (or (= lt!360062 (MissingZero!8557 i!1163)) (= lt!360062 (MissingVacant!8557 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43777 0))(
  ( (array!43778 (arr!20969 (Array (_ BitVec 32) (_ BitVec 64))) (size!21390 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43777)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43777 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!804539 (= lt!360062 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804540 () Bool)

(declare-fun res!549200 () Bool)

(assert (=> b!804540 (=> (not res!549200) (not e!445634))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804540 (= res!549200 (validKeyInArray!0 (select (arr!20969 a!3170) j!153)))))

(declare-fun b!804541 () Bool)

(declare-fun res!549201 () Bool)

(assert (=> b!804541 (=> (not res!549201) (not e!445635))))

(declare-datatypes ((List!14971 0))(
  ( (Nil!14968) (Cons!14967 (h!16096 (_ BitVec 64)) (t!21277 List!14971)) )
))
(declare-fun arrayNoDuplicates!0 (array!43777 (_ BitVec 32) List!14971) Bool)

(assert (=> b!804541 (= res!549201 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14968))))

(declare-fun b!804542 () Bool)

(declare-fun res!549207 () Bool)

(assert (=> b!804542 (=> (not res!549207) (not e!445635))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804542 (= res!549207 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21390 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20969 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21390 a!3170)) (= (select (arr!20969 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804543 () Bool)

(declare-fun e!445633 () Bool)

(assert (=> b!804543 (= e!445635 e!445633)))

(declare-fun res!549204 () Bool)

(assert (=> b!804543 (=> (not res!549204) (not e!445633))))

(declare-fun lt!360064 () (_ BitVec 64))

(declare-fun lt!360063 () array!43777)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43777 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!804543 (= res!549204 (= (seekEntryOrOpen!0 lt!360064 lt!360063 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360064 lt!360063 mask!3266)))))

(assert (=> b!804543 (= lt!360064 (select (store (arr!20969 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804543 (= lt!360063 (array!43778 (store (arr!20969 a!3170) i!1163 k0!2044) (size!21390 a!3170)))))

(declare-fun b!804544 () Bool)

(declare-fun res!549203 () Bool)

(assert (=> b!804544 (=> (not res!549203) (not e!445634))))

(assert (=> b!804544 (= res!549203 (and (= (size!21390 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21390 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21390 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804546 () Bool)

(assert (=> b!804546 (= e!445633 false)))

(declare-fun lt!360065 () SeekEntryResult!8557)

(assert (=> b!804546 (= lt!360065 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20969 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360061 () SeekEntryResult!8557)

(assert (=> b!804546 (= lt!360061 (seekEntryOrOpen!0 (select (arr!20969 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804547 () Bool)

(declare-fun res!549199 () Bool)

(assert (=> b!804547 (=> (not res!549199) (not e!445634))))

(declare-fun arrayContainsKey!0 (array!43777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804547 (= res!549199 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804548 () Bool)

(declare-fun res!549198 () Bool)

(assert (=> b!804548 (=> (not res!549198) (not e!445634))))

(assert (=> b!804548 (= res!549198 (validKeyInArray!0 k0!2044))))

(declare-fun b!804545 () Bool)

(declare-fun res!549202 () Bool)

(assert (=> b!804545 (=> (not res!549202) (not e!445635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43777 (_ BitVec 32)) Bool)

(assert (=> b!804545 (= res!549202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549206 () Bool)

(assert (=> start!68970 (=> (not res!549206) (not e!445634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68970 (= res!549206 (validMask!0 mask!3266))))

(assert (=> start!68970 e!445634))

(assert (=> start!68970 true))

(declare-fun array_inv!16852 (array!43777) Bool)

(assert (=> start!68970 (array_inv!16852 a!3170)))

(assert (= (and start!68970 res!549206) b!804544))

(assert (= (and b!804544 res!549203) b!804540))

(assert (= (and b!804540 res!549200) b!804548))

(assert (= (and b!804548 res!549198) b!804547))

(assert (= (and b!804547 res!549199) b!804539))

(assert (= (and b!804539 res!549205) b!804545))

(assert (= (and b!804545 res!549202) b!804541))

(assert (= (and b!804541 res!549201) b!804542))

(assert (= (and b!804542 res!549207) b!804543))

(assert (= (and b!804543 res!549204) b!804546))

(declare-fun m!745909 () Bool)

(assert (=> b!804541 m!745909))

(declare-fun m!745911 () Bool)

(assert (=> b!804539 m!745911))

(declare-fun m!745913 () Bool)

(assert (=> start!68970 m!745913))

(declare-fun m!745915 () Bool)

(assert (=> start!68970 m!745915))

(declare-fun m!745917 () Bool)

(assert (=> b!804540 m!745917))

(assert (=> b!804540 m!745917))

(declare-fun m!745919 () Bool)

(assert (=> b!804540 m!745919))

(declare-fun m!745921 () Bool)

(assert (=> b!804548 m!745921))

(declare-fun m!745923 () Bool)

(assert (=> b!804545 m!745923))

(assert (=> b!804546 m!745917))

(assert (=> b!804546 m!745917))

(declare-fun m!745925 () Bool)

(assert (=> b!804546 m!745925))

(assert (=> b!804546 m!745917))

(declare-fun m!745927 () Bool)

(assert (=> b!804546 m!745927))

(declare-fun m!745929 () Bool)

(assert (=> b!804547 m!745929))

(declare-fun m!745931 () Bool)

(assert (=> b!804543 m!745931))

(declare-fun m!745933 () Bool)

(assert (=> b!804543 m!745933))

(declare-fun m!745935 () Bool)

(assert (=> b!804543 m!745935))

(declare-fun m!745937 () Bool)

(assert (=> b!804543 m!745937))

(declare-fun m!745939 () Bool)

(assert (=> b!804542 m!745939))

(declare-fun m!745941 () Bool)

(assert (=> b!804542 m!745941))

(check-sat (not b!804548) (not b!804541) (not b!804547) (not b!804545) (not b!804543) (not b!804540) (not b!804546) (not b!804539) (not start!68970))
(check-sat)
