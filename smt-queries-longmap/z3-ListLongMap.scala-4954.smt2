; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68236 () Bool)

(assert start!68236)

(declare-fun b!792708 () Bool)

(declare-fun e!440475 () Bool)

(declare-fun e!440476 () Bool)

(assert (=> b!792708 (= e!440475 e!440476)))

(declare-fun res!537232 () Bool)

(assert (=> b!792708 (=> (not res!537232) (not e!440476))))

(declare-datatypes ((SeekEntryResult!8184 0))(
  ( (MissingZero!8184 (index!35104 (_ BitVec 32))) (Found!8184 (index!35105 (_ BitVec 32))) (Intermediate!8184 (undefined!8996 Bool) (index!35106 (_ BitVec 32)) (x!66054 (_ BitVec 32))) (Undefined!8184) (MissingVacant!8184 (index!35107 (_ BitVec 32))) )
))
(declare-fun lt!353569 () SeekEntryResult!8184)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792708 (= res!537232 (or (= lt!353569 (MissingZero!8184 i!1163)) (= lt!353569 (MissingVacant!8184 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43026 0))(
  ( (array!43027 (arr!20593 (Array (_ BitVec 32) (_ BitVec 64))) (size!21014 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43026)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43026 (_ BitVec 32)) SeekEntryResult!8184)

(assert (=> b!792708 (= lt!353569 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792709 () Bool)

(declare-fun res!537231 () Bool)

(assert (=> b!792709 (=> (not res!537231) (not e!440475))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792709 (= res!537231 (and (= (size!21014 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21014 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21014 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792710 () Bool)

(declare-fun res!537229 () Bool)

(assert (=> b!792710 (=> (not res!537229) (not e!440476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43026 (_ BitVec 32)) Bool)

(assert (=> b!792710 (= res!537229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792711 () Bool)

(declare-fun res!537227 () Bool)

(assert (=> b!792711 (=> (not res!537227) (not e!440475))))

(declare-fun arrayContainsKey!0 (array!43026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792711 (= res!537227 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792713 () Bool)

(declare-fun res!537233 () Bool)

(assert (=> b!792713 (=> (not res!537233) (not e!440475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792713 (= res!537233 (validKeyInArray!0 k0!2044))))

(declare-fun b!792714 () Bool)

(assert (=> b!792714 (= e!440476 false)))

(declare-fun lt!353570 () Bool)

(declare-datatypes ((List!14556 0))(
  ( (Nil!14553) (Cons!14552 (h!15681 (_ BitVec 64)) (t!20871 List!14556)) )
))
(declare-fun arrayNoDuplicates!0 (array!43026 (_ BitVec 32) List!14556) Bool)

(assert (=> b!792714 (= lt!353570 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14553))))

(declare-fun res!537230 () Bool)

(assert (=> start!68236 (=> (not res!537230) (not e!440475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68236 (= res!537230 (validMask!0 mask!3266))))

(assert (=> start!68236 e!440475))

(assert (=> start!68236 true))

(declare-fun array_inv!16389 (array!43026) Bool)

(assert (=> start!68236 (array_inv!16389 a!3170)))

(declare-fun b!792712 () Bool)

(declare-fun res!537228 () Bool)

(assert (=> b!792712 (=> (not res!537228) (not e!440475))))

(assert (=> b!792712 (= res!537228 (validKeyInArray!0 (select (arr!20593 a!3170) j!153)))))

(assert (= (and start!68236 res!537230) b!792709))

(assert (= (and b!792709 res!537231) b!792712))

(assert (= (and b!792712 res!537228) b!792713))

(assert (= (and b!792713 res!537233) b!792711))

(assert (= (and b!792711 res!537227) b!792708))

(assert (= (and b!792708 res!537232) b!792710))

(assert (= (and b!792710 res!537229) b!792714))

(declare-fun m!733235 () Bool)

(assert (=> b!792713 m!733235))

(declare-fun m!733237 () Bool)

(assert (=> b!792708 m!733237))

(declare-fun m!733239 () Bool)

(assert (=> b!792712 m!733239))

(assert (=> b!792712 m!733239))

(declare-fun m!733241 () Bool)

(assert (=> b!792712 m!733241))

(declare-fun m!733243 () Bool)

(assert (=> b!792710 m!733243))

(declare-fun m!733245 () Bool)

(assert (=> b!792711 m!733245))

(declare-fun m!733247 () Bool)

(assert (=> start!68236 m!733247))

(declare-fun m!733249 () Bool)

(assert (=> start!68236 m!733249))

(declare-fun m!733251 () Bool)

(assert (=> b!792714 m!733251))

(check-sat (not b!792711) (not b!792708) (not b!792710) (not b!792713) (not b!792714) (not start!68236) (not b!792712))
(check-sat)
