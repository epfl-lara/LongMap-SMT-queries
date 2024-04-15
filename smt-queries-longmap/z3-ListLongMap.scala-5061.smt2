; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68856 () Bool)

(assert start!68856)

(declare-fun b!802934 () Bool)

(declare-fun res!547593 () Bool)

(declare-fun e!444925 () Bool)

(assert (=> b!802934 (=> (not res!547593) (not e!444925))))

(declare-datatypes ((array!43663 0))(
  ( (array!43664 (arr!20912 (Array (_ BitVec 32) (_ BitVec 64))) (size!21333 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43663)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43663 (_ BitVec 32)) Bool)

(assert (=> b!802934 (= res!547593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802935 () Bool)

(declare-fun e!444924 () Bool)

(assert (=> b!802935 (= e!444925 e!444924)))

(declare-fun res!547603 () Bool)

(assert (=> b!802935 (=> (not res!547603) (not e!444924))))

(declare-datatypes ((SeekEntryResult!8500 0))(
  ( (MissingZero!8500 (index!36368 (_ BitVec 32))) (Found!8500 (index!36369 (_ BitVec 32))) (Intermediate!8500 (undefined!9312 Bool) (index!36370 (_ BitVec 32)) (x!67221 (_ BitVec 32))) (Undefined!8500) (MissingVacant!8500 (index!36371 (_ BitVec 32))) )
))
(declare-fun lt!359178 () SeekEntryResult!8500)

(declare-fun lt!359175 () SeekEntryResult!8500)

(assert (=> b!802935 (= res!547603 (= lt!359178 lt!359175))))

(declare-fun lt!359173 () array!43663)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359179 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43663 (_ BitVec 32)) SeekEntryResult!8500)

(assert (=> b!802935 (= lt!359175 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359179 lt!359173 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43663 (_ BitVec 32)) SeekEntryResult!8500)

(assert (=> b!802935 (= lt!359178 (seekEntryOrOpen!0 lt!359179 lt!359173 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802935 (= lt!359179 (select (store (arr!20912 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802935 (= lt!359173 (array!43664 (store (arr!20912 a!3170) i!1163 k0!2044) (size!21333 a!3170)))))

(declare-fun b!802936 () Bool)

(declare-fun e!444923 () Bool)

(assert (=> b!802936 (= e!444924 e!444923)))

(declare-fun res!547601 () Bool)

(assert (=> b!802936 (=> (not res!547601) (not e!444923))))

(declare-fun lt!359174 () SeekEntryResult!8500)

(declare-fun lt!359180 () SeekEntryResult!8500)

(assert (=> b!802936 (= res!547601 (= lt!359174 lt!359180))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802936 (= lt!359180 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802936 (= lt!359174 (seekEntryOrOpen!0 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802938 () Bool)

(declare-fun e!444922 () Bool)

(assert (=> b!802938 (= e!444922 e!444925)))

(declare-fun res!547594 () Bool)

(assert (=> b!802938 (=> (not res!547594) (not e!444925))))

(declare-fun lt!359171 () SeekEntryResult!8500)

(assert (=> b!802938 (= res!547594 (or (= lt!359171 (MissingZero!8500 i!1163)) (= lt!359171 (MissingVacant!8500 i!1163))))))

(assert (=> b!802938 (= lt!359171 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802939 () Bool)

(declare-fun res!547600 () Bool)

(assert (=> b!802939 (=> (not res!547600) (not e!444922))))

(declare-fun arrayContainsKey!0 (array!43663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802939 (= res!547600 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802940 () Bool)

(declare-fun res!547602 () Bool)

(assert (=> b!802940 (=> (not res!547602) (not e!444925))))

(declare-datatypes ((List!14914 0))(
  ( (Nil!14911) (Cons!14910 (h!16039 (_ BitVec 64)) (t!21220 List!14914)) )
))
(declare-fun arrayNoDuplicates!0 (array!43663 (_ BitVec 32) List!14914) Bool)

(assert (=> b!802940 (= res!547602 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14911))))

(declare-fun b!802941 () Bool)

(declare-fun res!547596 () Bool)

(assert (=> b!802941 (=> (not res!547596) (not e!444925))))

(assert (=> b!802941 (= res!547596 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21333 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20912 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21333 a!3170)) (= (select (arr!20912 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802942 () Bool)

(declare-fun e!444920 () Bool)

(declare-fun e!444919 () Bool)

(assert (=> b!802942 (= e!444920 (not e!444919))))

(declare-fun res!547604 () Bool)

(assert (=> b!802942 (=> res!547604 e!444919)))

(declare-fun lt!359172 () SeekEntryResult!8500)

(assert (=> b!802942 (= res!547604 (or (not (= lt!359175 lt!359172)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20912 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359176 () (_ BitVec 32))

(assert (=> b!802942 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359176 vacantAfter!23 lt!359179 lt!359173 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359176 vacantBefore!23 (select (arr!20912 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27514 0))(
  ( (Unit!27515) )
))
(declare-fun lt!359177 () Unit!27514)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43663 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27514)

(assert (=> b!802942 (= lt!359177 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359176 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802942 (= lt!359176 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802943 () Bool)

(declare-fun res!547595 () Bool)

(assert (=> b!802943 (=> (not res!547595) (not e!444922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802943 (= res!547595 (validKeyInArray!0 k0!2044))))

(declare-fun b!802944 () Bool)

(assert (=> b!802944 (= e!444919 (validKeyInArray!0 lt!359179))))

(declare-fun b!802937 () Bool)

(declare-fun res!547598 () Bool)

(assert (=> b!802937 (=> (not res!547598) (not e!444922))))

(assert (=> b!802937 (= res!547598 (validKeyInArray!0 (select (arr!20912 a!3170) j!153)))))

(declare-fun res!547605 () Bool)

(assert (=> start!68856 (=> (not res!547605) (not e!444922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68856 (= res!547605 (validMask!0 mask!3266))))

(assert (=> start!68856 e!444922))

(assert (=> start!68856 true))

(declare-fun array_inv!16795 (array!43663) Bool)

(assert (=> start!68856 (array_inv!16795 a!3170)))

(declare-fun b!802945 () Bool)

(assert (=> b!802945 (= e!444923 e!444920)))

(declare-fun res!547597 () Bool)

(assert (=> b!802945 (=> (not res!547597) (not e!444920))))

(assert (=> b!802945 (= res!547597 (and (= lt!359180 lt!359172) (not (= (select (arr!20912 a!3170) index!1236) (select (arr!20912 a!3170) j!153)))))))

(assert (=> b!802945 (= lt!359172 (Found!8500 j!153))))

(declare-fun b!802946 () Bool)

(declare-fun res!547599 () Bool)

(assert (=> b!802946 (=> (not res!547599) (not e!444922))))

(assert (=> b!802946 (= res!547599 (and (= (size!21333 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21333 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21333 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68856 res!547605) b!802946))

(assert (= (and b!802946 res!547599) b!802937))

(assert (= (and b!802937 res!547598) b!802943))

(assert (= (and b!802943 res!547595) b!802939))

(assert (= (and b!802939 res!547600) b!802938))

(assert (= (and b!802938 res!547594) b!802934))

(assert (= (and b!802934 res!547593) b!802940))

(assert (= (and b!802940 res!547602) b!802941))

(assert (= (and b!802941 res!547596) b!802935))

(assert (= (and b!802935 res!547603) b!802936))

(assert (= (and b!802936 res!547601) b!802945))

(assert (= (and b!802945 res!547597) b!802942))

(assert (= (and b!802942 (not res!547604)) b!802944))

(declare-fun m!744097 () Bool)

(assert (=> b!802942 m!744097))

(declare-fun m!744099 () Bool)

(assert (=> b!802942 m!744099))

(declare-fun m!744101 () Bool)

(assert (=> b!802942 m!744101))

(declare-fun m!744103 () Bool)

(assert (=> b!802942 m!744103))

(declare-fun m!744105 () Bool)

(assert (=> b!802942 m!744105))

(declare-fun m!744107 () Bool)

(assert (=> b!802942 m!744107))

(assert (=> b!802942 m!744097))

(declare-fun m!744109 () Bool)

(assert (=> b!802942 m!744109))

(declare-fun m!744111 () Bool)

(assert (=> b!802939 m!744111))

(declare-fun m!744113 () Bool)

(assert (=> b!802935 m!744113))

(declare-fun m!744115 () Bool)

(assert (=> b!802935 m!744115))

(assert (=> b!802935 m!744107))

(declare-fun m!744117 () Bool)

(assert (=> b!802935 m!744117))

(declare-fun m!744119 () Bool)

(assert (=> start!68856 m!744119))

(declare-fun m!744121 () Bool)

(assert (=> start!68856 m!744121))

(declare-fun m!744123 () Bool)

(assert (=> b!802943 m!744123))

(assert (=> b!802936 m!744097))

(assert (=> b!802936 m!744097))

(declare-fun m!744125 () Bool)

(assert (=> b!802936 m!744125))

(assert (=> b!802936 m!744097))

(declare-fun m!744127 () Bool)

(assert (=> b!802936 m!744127))

(declare-fun m!744129 () Bool)

(assert (=> b!802938 m!744129))

(declare-fun m!744131 () Bool)

(assert (=> b!802941 m!744131))

(declare-fun m!744133 () Bool)

(assert (=> b!802941 m!744133))

(declare-fun m!744135 () Bool)

(assert (=> b!802940 m!744135))

(declare-fun m!744137 () Bool)

(assert (=> b!802945 m!744137))

(assert (=> b!802945 m!744097))

(declare-fun m!744139 () Bool)

(assert (=> b!802944 m!744139))

(declare-fun m!744141 () Bool)

(assert (=> b!802934 m!744141))

(assert (=> b!802937 m!744097))

(assert (=> b!802937 m!744097))

(declare-fun m!744143 () Bool)

(assert (=> b!802937 m!744143))

(check-sat (not b!802936) (not b!802944) (not b!802943) (not b!802935) (not b!802939) (not b!802940) (not b!802934) (not start!68856) (not b!802938) (not b!802942) (not b!802937))
(check-sat)
