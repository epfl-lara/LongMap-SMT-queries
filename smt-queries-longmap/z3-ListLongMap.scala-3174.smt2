; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44672 () Bool)

(assert start!44672)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31731 0))(
  ( (array!31732 (arr!15253 (Array (_ BitVec 32) (_ BitVec 64))) (size!15617 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31731)

(declare-fun b!490164 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!288183 () Bool)

(declare-datatypes ((SeekEntryResult!3720 0))(
  ( (MissingZero!3720 (index!17059 (_ BitVec 32))) (Found!3720 (index!17060 (_ BitVec 32))) (Intermediate!3720 (undefined!4532 Bool) (index!17061 (_ BitVec 32)) (x!46162 (_ BitVec 32))) (Undefined!3720) (MissingVacant!3720 (index!17062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31731 (_ BitVec 32)) SeekEntryResult!3720)

(assert (=> b!490164 (= e!288183 (= (seekEntryOrOpen!0 (select (arr!15253 a!3235) j!176) a!3235 mask!3524) (Found!3720 j!176)))))

(declare-fun b!490165 () Bool)

(declare-fun res!293108 () Bool)

(declare-fun e!288184 () Bool)

(assert (=> b!490165 (=> (not res!293108) (not e!288184))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490165 (= res!293108 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490166 () Bool)

(declare-fun res!293101 () Bool)

(declare-fun e!288185 () Bool)

(assert (=> b!490166 (=> (not res!293101) (not e!288185))))

(declare-datatypes ((List!9411 0))(
  ( (Nil!9408) (Cons!9407 (h!10269 (_ BitVec 64)) (t!15639 List!9411)) )
))
(declare-fun arrayNoDuplicates!0 (array!31731 (_ BitVec 32) List!9411) Bool)

(assert (=> b!490166 (= res!293101 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9408))))

(declare-fun b!490167 () Bool)

(assert (=> b!490167 (= e!288184 e!288185)))

(declare-fun res!293106 () Bool)

(assert (=> b!490167 (=> (not res!293106) (not e!288185))))

(declare-fun lt!221314 () SeekEntryResult!3720)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490167 (= res!293106 (or (= lt!221314 (MissingZero!3720 i!1204)) (= lt!221314 (MissingVacant!3720 i!1204))))))

(assert (=> b!490167 (= lt!221314 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!293100 () Bool)

(assert (=> start!44672 (=> (not res!293100) (not e!288184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44672 (= res!293100 (validMask!0 mask!3524))))

(assert (=> start!44672 e!288184))

(assert (=> start!44672 true))

(declare-fun array_inv!11049 (array!31731) Bool)

(assert (=> start!44672 (array_inv!11049 a!3235)))

(declare-fun b!490168 () Bool)

(declare-fun res!293103 () Bool)

(assert (=> b!490168 (=> (not res!293103) (not e!288184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490168 (= res!293103 (validKeyInArray!0 k0!2280))))

(declare-fun b!490169 () Bool)

(declare-fun res!293104 () Bool)

(assert (=> b!490169 (=> (not res!293104) (not e!288184))))

(assert (=> b!490169 (= res!293104 (validKeyInArray!0 (select (arr!15253 a!3235) j!176)))))

(declare-fun b!490170 () Bool)

(declare-fun res!293107 () Bool)

(assert (=> b!490170 (=> (not res!293107) (not e!288184))))

(assert (=> b!490170 (= res!293107 (and (= (size!15617 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15617 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15617 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490171 () Bool)

(assert (=> b!490171 (= e!288185 (not true))))

(declare-fun lt!221309 () (_ BitVec 32))

(declare-fun lt!221311 () SeekEntryResult!3720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31731 (_ BitVec 32)) SeekEntryResult!3720)

(assert (=> b!490171 (= lt!221311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221309 (select (store (arr!15253 a!3235) i!1204 k0!2280) j!176) (array!31732 (store (arr!15253 a!3235) i!1204 k0!2280) (size!15617 a!3235)) mask!3524))))

(declare-fun lt!221310 () (_ BitVec 32))

(declare-fun lt!221312 () SeekEntryResult!3720)

(assert (=> b!490171 (= lt!221312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221310 (select (arr!15253 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490171 (= lt!221309 (toIndex!0 (select (store (arr!15253 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490171 (= lt!221310 (toIndex!0 (select (arr!15253 a!3235) j!176) mask!3524))))

(assert (=> b!490171 e!288183))

(declare-fun res!293105 () Bool)

(assert (=> b!490171 (=> (not res!293105) (not e!288183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31731 (_ BitVec 32)) Bool)

(assert (=> b!490171 (= res!293105 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14386 0))(
  ( (Unit!14387) )
))
(declare-fun lt!221313 () Unit!14386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14386)

(assert (=> b!490171 (= lt!221313 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490172 () Bool)

(declare-fun res!293102 () Bool)

(assert (=> b!490172 (=> (not res!293102) (not e!288185))))

(assert (=> b!490172 (= res!293102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44672 res!293100) b!490170))

(assert (= (and b!490170 res!293107) b!490169))

(assert (= (and b!490169 res!293104) b!490168))

(assert (= (and b!490168 res!293103) b!490165))

(assert (= (and b!490165 res!293108) b!490167))

(assert (= (and b!490167 res!293106) b!490172))

(assert (= (and b!490172 res!293102) b!490166))

(assert (= (and b!490166 res!293101) b!490171))

(assert (= (and b!490171 res!293105) b!490164))

(declare-fun m!470181 () Bool)

(assert (=> b!490172 m!470181))

(declare-fun m!470183 () Bool)

(assert (=> b!490166 m!470183))

(declare-fun m!470185 () Bool)

(assert (=> b!490171 m!470185))

(declare-fun m!470187 () Bool)

(assert (=> b!490171 m!470187))

(declare-fun m!470189 () Bool)

(assert (=> b!490171 m!470189))

(declare-fun m!470191 () Bool)

(assert (=> b!490171 m!470191))

(declare-fun m!470193 () Bool)

(assert (=> b!490171 m!470193))

(declare-fun m!470195 () Bool)

(assert (=> b!490171 m!470195))

(assert (=> b!490171 m!470189))

(declare-fun m!470197 () Bool)

(assert (=> b!490171 m!470197))

(assert (=> b!490171 m!470189))

(declare-fun m!470199 () Bool)

(assert (=> b!490171 m!470199))

(assert (=> b!490171 m!470191))

(declare-fun m!470201 () Bool)

(assert (=> b!490171 m!470201))

(assert (=> b!490171 m!470191))

(declare-fun m!470203 () Bool)

(assert (=> b!490168 m!470203))

(assert (=> b!490164 m!470191))

(assert (=> b!490164 m!470191))

(declare-fun m!470205 () Bool)

(assert (=> b!490164 m!470205))

(declare-fun m!470207 () Bool)

(assert (=> b!490165 m!470207))

(declare-fun m!470209 () Bool)

(assert (=> b!490167 m!470209))

(declare-fun m!470211 () Bool)

(assert (=> start!44672 m!470211))

(declare-fun m!470213 () Bool)

(assert (=> start!44672 m!470213))

(assert (=> b!490169 m!470191))

(assert (=> b!490169 m!470191))

(declare-fun m!470215 () Bool)

(assert (=> b!490169 m!470215))

(check-sat (not b!490172) (not start!44672) (not b!490169) (not b!490165) (not b!490164) (not b!490166) (not b!490168) (not b!490167) (not b!490171))
(check-sat)
