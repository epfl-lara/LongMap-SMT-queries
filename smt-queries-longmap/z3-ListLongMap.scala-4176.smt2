; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56898 () Bool)

(assert start!56898)

(declare-fun res!407220 () Bool)

(declare-fun e!360151 () Bool)

(assert (=> start!56898 (=> (not res!407220) (not e!360151))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56898 (= res!407220 (validMask!0 mask!3053))))

(assert (=> start!56898 e!360151))

(assert (=> start!56898 true))

(declare-datatypes ((array!38043 0))(
  ( (array!38044 (arr!18257 (Array (_ BitVec 32) (_ BitVec 64))) (size!18622 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38043)

(declare-fun array_inv!14140 (array!38043) Bool)

(assert (=> start!56898 (array_inv!14140 a!2986)))

(declare-fun b!629859 () Bool)

(declare-fun e!360149 () Bool)

(declare-datatypes ((SeekEntryResult!6694 0))(
  ( (MissingZero!6694 (index!29063 (_ BitVec 32))) (Found!6694 (index!29064 (_ BitVec 32))) (Intermediate!6694 (undefined!7506 Bool) (index!29065 (_ BitVec 32)) (x!57810 (_ BitVec 32))) (Undefined!6694) (MissingVacant!6694 (index!29066 (_ BitVec 32))) )
))
(declare-fun lt!290799 () SeekEntryResult!6694)

(declare-fun lt!290802 () SeekEntryResult!6694)

(assert (=> b!629859 (= e!360149 (= lt!290799 lt!290802))))

(declare-fun b!629860 () Bool)

(declare-fun res!407215 () Bool)

(declare-fun e!360150 () Bool)

(assert (=> b!629860 (=> (not res!407215) (not e!360150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38043 (_ BitVec 32)) Bool)

(assert (=> b!629860 (= res!407215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629861 () Bool)

(declare-fun res!407222 () Bool)

(assert (=> b!629861 (=> (not res!407222) (not e!360151))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629861 (= res!407222 (and (= (size!18622 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18622 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18622 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629862 () Bool)

(declare-fun res!407224 () Bool)

(assert (=> b!629862 (=> (not res!407224) (not e!360151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629862 (= res!407224 (validKeyInArray!0 (select (arr!18257 a!2986) j!136)))))

(declare-fun b!629863 () Bool)

(declare-fun e!360152 () Bool)

(assert (=> b!629863 (= e!360150 e!360152)))

(declare-fun res!407219 () Bool)

(assert (=> b!629863 (=> (not res!407219) (not e!360152))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629863 (= res!407219 (and (= lt!290799 (Found!6694 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18257 a!2986) index!984) (select (arr!18257 a!2986) j!136))) (not (= (select (arr!18257 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38043 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!629863 (= lt!290799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18257 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629864 () Bool)

(assert (=> b!629864 (= e!360151 e!360150)))

(declare-fun res!407223 () Bool)

(assert (=> b!629864 (=> (not res!407223) (not e!360150))))

(declare-fun lt!290801 () SeekEntryResult!6694)

(assert (=> b!629864 (= res!407223 (or (= lt!290801 (MissingZero!6694 i!1108)) (= lt!290801 (MissingVacant!6694 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38043 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!629864 (= lt!290801 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629865 () Bool)

(assert (=> b!629865 (= e!360152 (not true))))

(assert (=> b!629865 e!360149))

(declare-fun res!407216 () Bool)

(assert (=> b!629865 (=> (not res!407216) (not e!360149))))

(declare-fun lt!290800 () (_ BitVec 32))

(assert (=> b!629865 (= res!407216 (= lt!290802 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290800 vacantSpotIndex!68 (select (store (arr!18257 a!2986) i!1108 k0!1786) j!136) (array!38044 (store (arr!18257 a!2986) i!1108 k0!1786) (size!18622 a!2986)) mask!3053)))))

(assert (=> b!629865 (= lt!290802 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290800 vacantSpotIndex!68 (select (arr!18257 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21116 0))(
  ( (Unit!21117) )
))
(declare-fun lt!290803 () Unit!21116)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21116)

(assert (=> b!629865 (= lt!290803 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290800 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629865 (= lt!290800 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629866 () Bool)

(declare-fun res!407225 () Bool)

(assert (=> b!629866 (=> (not res!407225) (not e!360150))))

(assert (=> b!629866 (= res!407225 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18257 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18257 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629867 () Bool)

(declare-fun res!407217 () Bool)

(assert (=> b!629867 (=> (not res!407217) (not e!360151))))

(declare-fun arrayContainsKey!0 (array!38043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629867 (= res!407217 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629868 () Bool)

(declare-fun res!407218 () Bool)

(assert (=> b!629868 (=> (not res!407218) (not e!360151))))

(assert (=> b!629868 (= res!407218 (validKeyInArray!0 k0!1786))))

(declare-fun b!629869 () Bool)

(declare-fun res!407221 () Bool)

(assert (=> b!629869 (=> (not res!407221) (not e!360150))))

(declare-datatypes ((List!12337 0))(
  ( (Nil!12334) (Cons!12333 (h!13378 (_ BitVec 64)) (t!18556 List!12337)) )
))
(declare-fun arrayNoDuplicates!0 (array!38043 (_ BitVec 32) List!12337) Bool)

(assert (=> b!629869 (= res!407221 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12334))))

(assert (= (and start!56898 res!407220) b!629861))

(assert (= (and b!629861 res!407222) b!629862))

(assert (= (and b!629862 res!407224) b!629868))

(assert (= (and b!629868 res!407218) b!629867))

(assert (= (and b!629867 res!407217) b!629864))

(assert (= (and b!629864 res!407223) b!629860))

(assert (= (and b!629860 res!407215) b!629869))

(assert (= (and b!629869 res!407221) b!629866))

(assert (= (and b!629866 res!407225) b!629863))

(assert (= (and b!629863 res!407219) b!629865))

(assert (= (and b!629865 res!407216) b!629859))

(declare-fun m!604375 () Bool)

(assert (=> b!629862 m!604375))

(assert (=> b!629862 m!604375))

(declare-fun m!604377 () Bool)

(assert (=> b!629862 m!604377))

(declare-fun m!604379 () Bool)

(assert (=> b!629869 m!604379))

(declare-fun m!604381 () Bool)

(assert (=> b!629866 m!604381))

(declare-fun m!604383 () Bool)

(assert (=> b!629866 m!604383))

(declare-fun m!604385 () Bool)

(assert (=> b!629866 m!604385))

(declare-fun m!604387 () Bool)

(assert (=> b!629868 m!604387))

(declare-fun m!604389 () Bool)

(assert (=> b!629865 m!604389))

(declare-fun m!604391 () Bool)

(assert (=> b!629865 m!604391))

(assert (=> b!629865 m!604375))

(assert (=> b!629865 m!604383))

(assert (=> b!629865 m!604391))

(declare-fun m!604393 () Bool)

(assert (=> b!629865 m!604393))

(declare-fun m!604395 () Bool)

(assert (=> b!629865 m!604395))

(assert (=> b!629865 m!604375))

(declare-fun m!604397 () Bool)

(assert (=> b!629865 m!604397))

(declare-fun m!604399 () Bool)

(assert (=> b!629864 m!604399))

(declare-fun m!604401 () Bool)

(assert (=> b!629860 m!604401))

(declare-fun m!604403 () Bool)

(assert (=> b!629867 m!604403))

(declare-fun m!604405 () Bool)

(assert (=> start!56898 m!604405))

(declare-fun m!604407 () Bool)

(assert (=> start!56898 m!604407))

(declare-fun m!604409 () Bool)

(assert (=> b!629863 m!604409))

(assert (=> b!629863 m!604375))

(assert (=> b!629863 m!604375))

(declare-fun m!604411 () Bool)

(assert (=> b!629863 m!604411))

(check-sat (not b!629864) (not b!629863) (not b!629868) (not b!629862) (not b!629860) (not b!629865) (not b!629867) (not start!56898) (not b!629869))
(check-sat)
