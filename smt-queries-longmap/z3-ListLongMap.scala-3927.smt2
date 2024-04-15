; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53556 () Bool)

(assert start!53556)

(declare-fun b!583003 () Bool)

(declare-fun res!370966 () Bool)

(declare-fun e!334090 () Bool)

(assert (=> b!583003 (=> (not res!370966) (not e!334090))))

(declare-datatypes ((array!36471 0))(
  ( (array!36472 (arr!17510 (Array (_ BitVec 32) (_ BitVec 64))) (size!17875 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36471)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583003 (= res!370966 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583004 () Bool)

(declare-fun res!370962 () Bool)

(declare-fun e!334092 () Bool)

(assert (=> b!583004 (=> (not res!370962) (not e!334092))))

(declare-datatypes ((List!11590 0))(
  ( (Nil!11587) (Cons!11586 (h!12631 (_ BitVec 64)) (t!17809 List!11590)) )
))
(declare-fun arrayNoDuplicates!0 (array!36471 (_ BitVec 32) List!11590) Bool)

(assert (=> b!583004 (= res!370962 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11587))))

(declare-fun b!583005 () Bool)

(declare-fun res!370970 () Bool)

(assert (=> b!583005 (=> (not res!370970) (not e!334090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583005 (= res!370970 (validKeyInArray!0 k0!1786))))

(declare-fun res!370964 () Bool)

(assert (=> start!53556 (=> (not res!370964) (not e!334090))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53556 (= res!370964 (validMask!0 mask!3053))))

(assert (=> start!53556 e!334090))

(assert (=> start!53556 true))

(declare-fun array_inv!13393 (array!36471) Bool)

(assert (=> start!53556 (array_inv!13393 a!2986)))

(declare-fun b!583006 () Bool)

(declare-fun res!370968 () Bool)

(assert (=> b!583006 (=> (not res!370968) (not e!334090))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583006 (= res!370968 (and (= (size!17875 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17875 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17875 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583007 () Bool)

(declare-fun res!370969 () Bool)

(assert (=> b!583007 (=> (not res!370969) (not e!334092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36471 (_ BitVec 32)) Bool)

(assert (=> b!583007 (= res!370969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583008 () Bool)

(declare-fun res!370965 () Bool)

(assert (=> b!583008 (=> (not res!370965) (not e!334092))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5947 0))(
  ( (MissingZero!5947 (index!26015 (_ BitVec 32))) (Found!5947 (index!26016 (_ BitVec 32))) (Intermediate!5947 (undefined!6759 Bool) (index!26017 (_ BitVec 32)) (x!54867 (_ BitVec 32))) (Undefined!5947) (MissingVacant!5947 (index!26018 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36471 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!583008 (= res!370965 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17510 a!2986) j!136) a!2986 mask!3053) (Found!5947 j!136)))))

(declare-fun b!583009 () Bool)

(declare-fun res!370967 () Bool)

(assert (=> b!583009 (=> (not res!370967) (not e!334092))))

(assert (=> b!583009 (= res!370967 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17510 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17510 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583010 () Bool)

(assert (=> b!583010 (= e!334092 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17510 a!2986) index!984) (select (arr!17510 a!2986) j!136))) (not (= (select (arr!17510 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!583011 () Bool)

(assert (=> b!583011 (= e!334090 e!334092)))

(declare-fun res!370961 () Bool)

(assert (=> b!583011 (=> (not res!370961) (not e!334092))))

(declare-fun lt!265063 () SeekEntryResult!5947)

(assert (=> b!583011 (= res!370961 (or (= lt!265063 (MissingZero!5947 i!1108)) (= lt!265063 (MissingVacant!5947 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36471 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!583011 (= lt!265063 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583012 () Bool)

(declare-fun res!370963 () Bool)

(assert (=> b!583012 (=> (not res!370963) (not e!334090))))

(assert (=> b!583012 (= res!370963 (validKeyInArray!0 (select (arr!17510 a!2986) j!136)))))

(assert (= (and start!53556 res!370964) b!583006))

(assert (= (and b!583006 res!370968) b!583012))

(assert (= (and b!583012 res!370963) b!583005))

(assert (= (and b!583005 res!370970) b!583003))

(assert (= (and b!583003 res!370966) b!583011))

(assert (= (and b!583011 res!370961) b!583007))

(assert (= (and b!583007 res!370969) b!583004))

(assert (= (and b!583004 res!370962) b!583009))

(assert (= (and b!583009 res!370967) b!583008))

(assert (= (and b!583008 res!370965) b!583010))

(declare-fun m!560959 () Bool)

(assert (=> b!583007 m!560959))

(declare-fun m!560961 () Bool)

(assert (=> b!583012 m!560961))

(assert (=> b!583012 m!560961))

(declare-fun m!560963 () Bool)

(assert (=> b!583012 m!560963))

(declare-fun m!560965 () Bool)

(assert (=> start!53556 m!560965))

(declare-fun m!560967 () Bool)

(assert (=> start!53556 m!560967))

(declare-fun m!560969 () Bool)

(assert (=> b!583010 m!560969))

(assert (=> b!583010 m!560961))

(declare-fun m!560971 () Bool)

(assert (=> b!583003 m!560971))

(declare-fun m!560973 () Bool)

(assert (=> b!583011 m!560973))

(declare-fun m!560975 () Bool)

(assert (=> b!583009 m!560975))

(declare-fun m!560977 () Bool)

(assert (=> b!583009 m!560977))

(declare-fun m!560979 () Bool)

(assert (=> b!583009 m!560979))

(declare-fun m!560981 () Bool)

(assert (=> b!583004 m!560981))

(assert (=> b!583008 m!560961))

(assert (=> b!583008 m!560961))

(declare-fun m!560983 () Bool)

(assert (=> b!583008 m!560983))

(declare-fun m!560985 () Bool)

(assert (=> b!583005 m!560985))

(check-sat (not b!583004) (not b!583011) (not b!583008) (not b!583007) (not b!583005) (not b!583003) (not start!53556) (not b!583012))
(check-sat)
