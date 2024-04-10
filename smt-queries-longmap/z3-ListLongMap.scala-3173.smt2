; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44666 () Bool)

(assert start!44666)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31725 0))(
  ( (array!31726 (arr!15250 (Array (_ BitVec 32) (_ BitVec 64))) (size!15614 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31725)

(declare-fun e!288147 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!490083 () Bool)

(declare-datatypes ((SeekEntryResult!3717 0))(
  ( (MissingZero!3717 (index!17047 (_ BitVec 32))) (Found!3717 (index!17048 (_ BitVec 32))) (Intermediate!3717 (undefined!4529 Bool) (index!17049 (_ BitVec 32)) (x!46151 (_ BitVec 32))) (Undefined!3717) (MissingVacant!3717 (index!17050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31725 (_ BitVec 32)) SeekEntryResult!3717)

(assert (=> b!490083 (= e!288147 (= (seekEntryOrOpen!0 (select (arr!15250 a!3235) j!176) a!3235 mask!3524) (Found!3717 j!176)))))

(declare-fun b!490084 () Bool)

(declare-fun res!293024 () Bool)

(declare-fun e!288149 () Bool)

(assert (=> b!490084 (=> (not res!293024) (not e!288149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31725 (_ BitVec 32)) Bool)

(assert (=> b!490084 (= res!293024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490085 () Bool)

(declare-fun res!293023 () Bool)

(declare-fun e!288148 () Bool)

(assert (=> b!490085 (=> (not res!293023) (not e!288148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490085 (= res!293023 (validKeyInArray!0 (select (arr!15250 a!3235) j!176)))))

(declare-fun b!490086 () Bool)

(declare-fun res!293020 () Bool)

(assert (=> b!490086 (=> (not res!293020) (not e!288148))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490086 (= res!293020 (and (= (size!15614 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15614 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15614 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490087 () Bool)

(declare-fun res!293019 () Bool)

(assert (=> b!490087 (=> (not res!293019) (not e!288149))))

(declare-datatypes ((List!9408 0))(
  ( (Nil!9405) (Cons!9404 (h!10266 (_ BitVec 64)) (t!15636 List!9408)) )
))
(declare-fun arrayNoDuplicates!0 (array!31725 (_ BitVec 32) List!9408) Bool)

(assert (=> b!490087 (= res!293019 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9405))))

(declare-fun b!490088 () Bool)

(assert (=> b!490088 (= e!288149 (not true))))

(declare-fun lt!221257 () SeekEntryResult!3717)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!221259 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31725 (_ BitVec 32)) SeekEntryResult!3717)

(assert (=> b!490088 (= lt!221257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221259 (select (store (arr!15250 a!3235) i!1204 k0!2280) j!176) (array!31726 (store (arr!15250 a!3235) i!1204 k0!2280) (size!15614 a!3235)) mask!3524))))

(declare-fun lt!221256 () SeekEntryResult!3717)

(declare-fun lt!221255 () (_ BitVec 32))

(assert (=> b!490088 (= lt!221256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221255 (select (arr!15250 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490088 (= lt!221259 (toIndex!0 (select (store (arr!15250 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490088 (= lt!221255 (toIndex!0 (select (arr!15250 a!3235) j!176) mask!3524))))

(assert (=> b!490088 e!288147))

(declare-fun res!293021 () Bool)

(assert (=> b!490088 (=> (not res!293021) (not e!288147))))

(assert (=> b!490088 (= res!293021 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14380 0))(
  ( (Unit!14381) )
))
(declare-fun lt!221258 () Unit!14380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14380)

(assert (=> b!490088 (= lt!221258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293027 () Bool)

(assert (=> start!44666 (=> (not res!293027) (not e!288148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44666 (= res!293027 (validMask!0 mask!3524))))

(assert (=> start!44666 e!288148))

(assert (=> start!44666 true))

(declare-fun array_inv!11046 (array!31725) Bool)

(assert (=> start!44666 (array_inv!11046 a!3235)))

(declare-fun b!490089 () Bool)

(declare-fun res!293025 () Bool)

(assert (=> b!490089 (=> (not res!293025) (not e!288148))))

(declare-fun arrayContainsKey!0 (array!31725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490089 (= res!293025 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490090 () Bool)

(declare-fun res!293022 () Bool)

(assert (=> b!490090 (=> (not res!293022) (not e!288148))))

(assert (=> b!490090 (= res!293022 (validKeyInArray!0 k0!2280))))

(declare-fun b!490091 () Bool)

(assert (=> b!490091 (= e!288148 e!288149)))

(declare-fun res!293026 () Bool)

(assert (=> b!490091 (=> (not res!293026) (not e!288149))))

(declare-fun lt!221260 () SeekEntryResult!3717)

(assert (=> b!490091 (= res!293026 (or (= lt!221260 (MissingZero!3717 i!1204)) (= lt!221260 (MissingVacant!3717 i!1204))))))

(assert (=> b!490091 (= lt!221260 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44666 res!293027) b!490086))

(assert (= (and b!490086 res!293020) b!490085))

(assert (= (and b!490085 res!293023) b!490090))

(assert (= (and b!490090 res!293022) b!490089))

(assert (= (and b!490089 res!293025) b!490091))

(assert (= (and b!490091 res!293026) b!490084))

(assert (= (and b!490084 res!293024) b!490087))

(assert (= (and b!490087 res!293019) b!490088))

(assert (= (and b!490088 res!293021) b!490083))

(declare-fun m!470073 () Bool)

(assert (=> b!490085 m!470073))

(assert (=> b!490085 m!470073))

(declare-fun m!470075 () Bool)

(assert (=> b!490085 m!470075))

(declare-fun m!470077 () Bool)

(assert (=> b!490089 m!470077))

(declare-fun m!470079 () Bool)

(assert (=> b!490087 m!470079))

(declare-fun m!470081 () Bool)

(assert (=> b!490084 m!470081))

(declare-fun m!470083 () Bool)

(assert (=> b!490090 m!470083))

(declare-fun m!470085 () Bool)

(assert (=> b!490091 m!470085))

(declare-fun m!470087 () Bool)

(assert (=> start!44666 m!470087))

(declare-fun m!470089 () Bool)

(assert (=> start!44666 m!470089))

(assert (=> b!490088 m!470073))

(declare-fun m!470091 () Bool)

(assert (=> b!490088 m!470091))

(declare-fun m!470093 () Bool)

(assert (=> b!490088 m!470093))

(declare-fun m!470095 () Bool)

(assert (=> b!490088 m!470095))

(declare-fun m!470097 () Bool)

(assert (=> b!490088 m!470097))

(declare-fun m!470099 () Bool)

(assert (=> b!490088 m!470099))

(assert (=> b!490088 m!470095))

(assert (=> b!490088 m!470073))

(declare-fun m!470101 () Bool)

(assert (=> b!490088 m!470101))

(assert (=> b!490088 m!470073))

(declare-fun m!470103 () Bool)

(assert (=> b!490088 m!470103))

(assert (=> b!490088 m!470095))

(declare-fun m!470105 () Bool)

(assert (=> b!490088 m!470105))

(assert (=> b!490083 m!470073))

(assert (=> b!490083 m!470073))

(declare-fun m!470107 () Bool)

(assert (=> b!490083 m!470107))

(check-sat (not b!490085) (not b!490090) (not start!44666) (not b!490087) (not b!490083) (not b!490089) (not b!490091) (not b!490084) (not b!490088))
(check-sat)
