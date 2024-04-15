; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56280 () Bool)

(assert start!56280)

(declare-fun b!623940 () Bool)

(declare-fun res!402233 () Bool)

(declare-fun e!357825 () Bool)

(assert (=> b!623940 (=> (not res!402233) (not e!357825))))

(declare-datatypes ((array!37719 0))(
  ( (array!37720 (arr!18104 (Array (_ BitVec 32) (_ BitVec 64))) (size!18469 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37719)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623940 (= res!402233 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623941 () Bool)

(declare-fun res!402237 () Bool)

(declare-fun e!357823 () Bool)

(assert (=> b!623941 (=> (not res!402237) (not e!357823))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37719 (_ BitVec 32)) Bool)

(assert (=> b!623941 (= res!402237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623942 () Bool)

(declare-fun res!402232 () Bool)

(assert (=> b!623942 (=> (not res!402232) (not e!357825))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623942 (= res!402232 (validKeyInArray!0 (select (arr!18104 a!2986) j!136)))))

(declare-fun b!623943 () Bool)

(declare-fun res!402235 () Bool)

(assert (=> b!623943 (=> (not res!402235) (not e!357825))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623943 (= res!402235 (and (= (size!18469 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18469 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18469 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623944 () Bool)

(declare-fun res!402234 () Bool)

(assert (=> b!623944 (=> (not res!402234) (not e!357823))))

(declare-datatypes ((List!12184 0))(
  ( (Nil!12181) (Cons!12180 (h!13225 (_ BitVec 64)) (t!18403 List!12184)) )
))
(declare-fun arrayNoDuplicates!0 (array!37719 (_ BitVec 32) List!12184) Bool)

(assert (=> b!623944 (= res!402234 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12181))))

(declare-fun b!623945 () Bool)

(declare-fun res!402238 () Bool)

(assert (=> b!623945 (=> (not res!402238) (not e!357825))))

(assert (=> b!623945 (= res!402238 (validKeyInArray!0 k0!1786))))

(declare-fun b!623946 () Bool)

(assert (=> b!623946 (= e!357825 e!357823)))

(declare-fun res!402239 () Bool)

(assert (=> b!623946 (=> (not res!402239) (not e!357823))))

(declare-datatypes ((SeekEntryResult!6541 0))(
  ( (MissingZero!6541 (index!28448 (_ BitVec 32))) (Found!6541 (index!28449 (_ BitVec 32))) (Intermediate!6541 (undefined!7353 Bool) (index!28450 (_ BitVec 32)) (x!57219 (_ BitVec 32))) (Undefined!6541) (MissingVacant!6541 (index!28451 (_ BitVec 32))) )
))
(declare-fun lt!289318 () SeekEntryResult!6541)

(assert (=> b!623946 (= res!402239 (or (= lt!289318 (MissingZero!6541 i!1108)) (= lt!289318 (MissingVacant!6541 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37719 (_ BitVec 32)) SeekEntryResult!6541)

(assert (=> b!623946 (= lt!289318 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!623947 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623947 (= e!357823 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge vacantSpotIndex!68 (size!18469 a!2986))))))

(declare-fun res!402236 () Bool)

(assert (=> start!56280 (=> (not res!402236) (not e!357825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56280 (= res!402236 (validMask!0 mask!3053))))

(assert (=> start!56280 e!357825))

(assert (=> start!56280 true))

(declare-fun array_inv!13987 (array!37719) Bool)

(assert (=> start!56280 (array_inv!13987 a!2986)))

(assert (= (and start!56280 res!402236) b!623943))

(assert (= (and b!623943 res!402235) b!623942))

(assert (= (and b!623942 res!402232) b!623945))

(assert (= (and b!623945 res!402238) b!623940))

(assert (= (and b!623940 res!402233) b!623946))

(assert (= (and b!623946 res!402239) b!623941))

(assert (= (and b!623941 res!402237) b!623944))

(assert (= (and b!623944 res!402234) b!623947))

(declare-fun m!599185 () Bool)

(assert (=> b!623942 m!599185))

(assert (=> b!623942 m!599185))

(declare-fun m!599187 () Bool)

(assert (=> b!623942 m!599187))

(declare-fun m!599189 () Bool)

(assert (=> b!623944 m!599189))

(declare-fun m!599191 () Bool)

(assert (=> b!623946 m!599191))

(declare-fun m!599193 () Bool)

(assert (=> b!623941 m!599193))

(declare-fun m!599195 () Bool)

(assert (=> b!623940 m!599195))

(declare-fun m!599197 () Bool)

(assert (=> start!56280 m!599197))

(declare-fun m!599199 () Bool)

(assert (=> start!56280 m!599199))

(declare-fun m!599201 () Bool)

(assert (=> b!623945 m!599201))

(check-sat (not start!56280) (not b!623941) (not b!623942) (not b!623946) (not b!623945) (not b!623940) (not b!623944))
(check-sat)
