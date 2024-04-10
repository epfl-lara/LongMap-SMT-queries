; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68320 () Bool)

(assert start!68320)

(declare-fun b!793726 () Bool)

(declare-fun res!538252 () Bool)

(declare-fun e!440863 () Bool)

(assert (=> b!793726 (=> (not res!538252) (not e!440863))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43110 0))(
  ( (array!43111 (arr!20635 (Array (_ BitVec 32) (_ BitVec 64))) (size!21056 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43110)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793726 (= res!538252 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21056 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20635 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21056 a!3170)) (= (select (arr!20635 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793727 () Bool)

(declare-fun res!538249 () Bool)

(declare-fun e!440862 () Bool)

(assert (=> b!793727 (=> (not res!538249) (not e!440862))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793727 (= res!538249 (and (= (size!21056 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21056 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21056 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793728 () Bool)

(assert (=> b!793728 (= e!440862 e!440863)))

(declare-fun res!538246 () Bool)

(assert (=> b!793728 (=> (not res!538246) (not e!440863))))

(declare-datatypes ((SeekEntryResult!8226 0))(
  ( (MissingZero!8226 (index!35272 (_ BitVec 32))) (Found!8226 (index!35273 (_ BitVec 32))) (Intermediate!8226 (undefined!9038 Bool) (index!35274 (_ BitVec 32)) (x!66208 (_ BitVec 32))) (Undefined!8226) (MissingVacant!8226 (index!35275 (_ BitVec 32))) )
))
(declare-fun lt!353811 () SeekEntryResult!8226)

(assert (=> b!793728 (= res!538246 (or (= lt!353811 (MissingZero!8226 i!1163)) (= lt!353811 (MissingVacant!8226 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43110 (_ BitVec 32)) SeekEntryResult!8226)

(assert (=> b!793728 (= lt!353811 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793729 () Bool)

(declare-fun res!538251 () Bool)

(assert (=> b!793729 (=> (not res!538251) (not e!440862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793729 (= res!538251 (validKeyInArray!0 k0!2044))))

(declare-fun b!793730 () Bool)

(declare-fun res!538248 () Bool)

(assert (=> b!793730 (=> (not res!538248) (not e!440863))))

(declare-datatypes ((List!14598 0))(
  ( (Nil!14595) (Cons!14594 (h!15723 (_ BitVec 64)) (t!20913 List!14598)) )
))
(declare-fun arrayNoDuplicates!0 (array!43110 (_ BitVec 32) List!14598) Bool)

(assert (=> b!793730 (= res!538248 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14595))))

(declare-fun b!793731 () Bool)

(declare-fun res!538250 () Bool)

(assert (=> b!793731 (=> (not res!538250) (not e!440863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43110 (_ BitVec 32)) Bool)

(assert (=> b!793731 (= res!538250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793732 () Bool)

(declare-fun res!538245 () Bool)

(assert (=> b!793732 (=> (not res!538245) (not e!440862))))

(assert (=> b!793732 (= res!538245 (validKeyInArray!0 (select (arr!20635 a!3170) j!153)))))

(declare-fun b!793733 () Bool)

(declare-fun res!538247 () Bool)

(assert (=> b!793733 (=> (not res!538247) (not e!440862))))

(declare-fun arrayContainsKey!0 (array!43110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793733 (= res!538247 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!538253 () Bool)

(assert (=> start!68320 (=> (not res!538253) (not e!440862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68320 (= res!538253 (validMask!0 mask!3266))))

(assert (=> start!68320 e!440862))

(assert (=> start!68320 true))

(declare-fun array_inv!16431 (array!43110) Bool)

(assert (=> start!68320 (array_inv!16431 a!3170)))

(declare-fun b!793734 () Bool)

(assert (=> b!793734 (= e!440863 false)))

(declare-fun lt!353812 () array!43110)

(declare-fun lt!353813 () (_ BitVec 64))

(declare-fun lt!353810 () SeekEntryResult!8226)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43110 (_ BitVec 32)) SeekEntryResult!8226)

(assert (=> b!793734 (= lt!353810 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353813 lt!353812 mask!3266))))

(declare-fun lt!353809 () SeekEntryResult!8226)

(assert (=> b!793734 (= lt!353809 (seekEntryOrOpen!0 lt!353813 lt!353812 mask!3266))))

(assert (=> b!793734 (= lt!353813 (select (store (arr!20635 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793734 (= lt!353812 (array!43111 (store (arr!20635 a!3170) i!1163 k0!2044) (size!21056 a!3170)))))

(assert (= (and start!68320 res!538253) b!793727))

(assert (= (and b!793727 res!538249) b!793732))

(assert (= (and b!793732 res!538245) b!793729))

(assert (= (and b!793729 res!538251) b!793733))

(assert (= (and b!793733 res!538247) b!793728))

(assert (= (and b!793728 res!538246) b!793731))

(assert (= (and b!793731 res!538250) b!793730))

(assert (= (and b!793730 res!538248) b!793726))

(assert (= (and b!793726 res!538252) b!793734))

(declare-fun m!734213 () Bool)

(assert (=> b!793734 m!734213))

(declare-fun m!734215 () Bool)

(assert (=> b!793734 m!734215))

(declare-fun m!734217 () Bool)

(assert (=> b!793734 m!734217))

(declare-fun m!734219 () Bool)

(assert (=> b!793734 m!734219))

(declare-fun m!734221 () Bool)

(assert (=> b!793732 m!734221))

(assert (=> b!793732 m!734221))

(declare-fun m!734223 () Bool)

(assert (=> b!793732 m!734223))

(declare-fun m!734225 () Bool)

(assert (=> start!68320 m!734225))

(declare-fun m!734227 () Bool)

(assert (=> start!68320 m!734227))

(declare-fun m!734229 () Bool)

(assert (=> b!793731 m!734229))

(declare-fun m!734231 () Bool)

(assert (=> b!793728 m!734231))

(declare-fun m!734233 () Bool)

(assert (=> b!793726 m!734233))

(declare-fun m!734235 () Bool)

(assert (=> b!793726 m!734235))

(declare-fun m!734237 () Bool)

(assert (=> b!793733 m!734237))

(declare-fun m!734239 () Bool)

(assert (=> b!793729 m!734239))

(declare-fun m!734241 () Bool)

(assert (=> b!793730 m!734241))

(check-sat (not b!793733) (not b!793728) (not b!793731) (not b!793734) (not b!793732) (not b!793730) (not b!793729) (not start!68320))
(check-sat)
