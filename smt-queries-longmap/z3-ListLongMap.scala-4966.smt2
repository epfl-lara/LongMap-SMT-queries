; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68308 () Bool)

(assert start!68308)

(declare-fun b!793555 () Bool)

(declare-fun res!538082 () Bool)

(declare-fun e!440800 () Bool)

(assert (=> b!793555 (=> (not res!538082) (not e!440800))))

(declare-datatypes ((array!43098 0))(
  ( (array!43099 (arr!20629 (Array (_ BitVec 32) (_ BitVec 64))) (size!21050 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43098)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793555 (= res!538082 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793556 () Bool)

(declare-fun res!538081 () Bool)

(assert (=> b!793556 (=> (not res!538081) (not e!440800))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793556 (= res!538081 (and (= (size!21050 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21050 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21050 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793557 () Bool)

(declare-fun res!538077 () Bool)

(declare-fun e!440799 () Bool)

(assert (=> b!793557 (=> (not res!538077) (not e!440799))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793557 (= res!538077 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21050 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20629 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21050 a!3170)) (= (select (arr!20629 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793558 () Bool)

(declare-fun res!538079 () Bool)

(assert (=> b!793558 (=> (not res!538079) (not e!440800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793558 (= res!538079 (validKeyInArray!0 (select (arr!20629 a!3170) j!153)))))

(declare-fun b!793559 () Bool)

(declare-fun res!538075 () Bool)

(assert (=> b!793559 (=> (not res!538075) (not e!440799))))

(declare-datatypes ((List!14592 0))(
  ( (Nil!14589) (Cons!14588 (h!15717 (_ BitVec 64)) (t!20907 List!14592)) )
))
(declare-fun arrayNoDuplicates!0 (array!43098 (_ BitVec 32) List!14592) Bool)

(assert (=> b!793559 (= res!538075 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14589))))

(declare-fun b!793560 () Bool)

(assert (=> b!793560 (= e!440800 e!440799)))

(declare-fun res!538076 () Bool)

(assert (=> b!793560 (=> (not res!538076) (not e!440799))))

(declare-datatypes ((SeekEntryResult!8220 0))(
  ( (MissingZero!8220 (index!35248 (_ BitVec 32))) (Found!8220 (index!35249 (_ BitVec 32))) (Intermediate!8220 (undefined!9032 Bool) (index!35250 (_ BitVec 32)) (x!66186 (_ BitVec 32))) (Undefined!8220) (MissingVacant!8220 (index!35251 (_ BitVec 32))) )
))
(declare-fun lt!353738 () SeekEntryResult!8220)

(assert (=> b!793560 (= res!538076 (or (= lt!353738 (MissingZero!8220 i!1163)) (= lt!353738 (MissingVacant!8220 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43098 (_ BitVec 32)) SeekEntryResult!8220)

(assert (=> b!793560 (= lt!353738 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!538080 () Bool)

(assert (=> start!68308 (=> (not res!538080) (not e!440800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68308 (= res!538080 (validMask!0 mask!3266))))

(assert (=> start!68308 e!440800))

(assert (=> start!68308 true))

(declare-fun array_inv!16425 (array!43098) Bool)

(assert (=> start!68308 (array_inv!16425 a!3170)))

(declare-fun b!793561 () Bool)

(assert (=> b!793561 (= e!440799 false)))

(declare-fun lt!353740 () (_ BitVec 64))

(declare-fun lt!353739 () SeekEntryResult!8220)

(declare-fun lt!353741 () array!43098)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43098 (_ BitVec 32)) SeekEntryResult!8220)

(assert (=> b!793561 (= lt!353739 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353740 lt!353741 mask!3266))))

(declare-fun lt!353737 () SeekEntryResult!8220)

(assert (=> b!793561 (= lt!353737 (seekEntryOrOpen!0 lt!353740 lt!353741 mask!3266))))

(assert (=> b!793561 (= lt!353740 (select (store (arr!20629 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793561 (= lt!353741 (array!43099 (store (arr!20629 a!3170) i!1163 k0!2044) (size!21050 a!3170)))))

(declare-fun b!793562 () Bool)

(declare-fun res!538078 () Bool)

(assert (=> b!793562 (=> (not res!538078) (not e!440800))))

(assert (=> b!793562 (= res!538078 (validKeyInArray!0 k0!2044))))

(declare-fun b!793563 () Bool)

(declare-fun res!538074 () Bool)

(assert (=> b!793563 (=> (not res!538074) (not e!440799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43098 (_ BitVec 32)) Bool)

(assert (=> b!793563 (= res!538074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68308 res!538080) b!793556))

(assert (= (and b!793556 res!538081) b!793558))

(assert (= (and b!793558 res!538079) b!793562))

(assert (= (and b!793562 res!538078) b!793555))

(assert (= (and b!793555 res!538082) b!793560))

(assert (= (and b!793560 res!538076) b!793563))

(assert (= (and b!793563 res!538074) b!793559))

(assert (= (and b!793559 res!538075) b!793557))

(assert (= (and b!793557 res!538077) b!793561))

(declare-fun m!734033 () Bool)

(assert (=> start!68308 m!734033))

(declare-fun m!734035 () Bool)

(assert (=> start!68308 m!734035))

(declare-fun m!734037 () Bool)

(assert (=> b!793558 m!734037))

(assert (=> b!793558 m!734037))

(declare-fun m!734039 () Bool)

(assert (=> b!793558 m!734039))

(declare-fun m!734041 () Bool)

(assert (=> b!793562 m!734041))

(declare-fun m!734043 () Bool)

(assert (=> b!793555 m!734043))

(declare-fun m!734045 () Bool)

(assert (=> b!793563 m!734045))

(declare-fun m!734047 () Bool)

(assert (=> b!793559 m!734047))

(declare-fun m!734049 () Bool)

(assert (=> b!793557 m!734049))

(declare-fun m!734051 () Bool)

(assert (=> b!793557 m!734051))

(declare-fun m!734053 () Bool)

(assert (=> b!793560 m!734053))

(declare-fun m!734055 () Bool)

(assert (=> b!793561 m!734055))

(declare-fun m!734057 () Bool)

(assert (=> b!793561 m!734057))

(declare-fun m!734059 () Bool)

(assert (=> b!793561 m!734059))

(declare-fun m!734061 () Bool)

(assert (=> b!793561 m!734061))

(check-sat (not b!793558) (not b!793555) (not b!793560) (not b!793563) (not b!793561) (not b!793559) (not start!68308) (not b!793562))
(check-sat)
