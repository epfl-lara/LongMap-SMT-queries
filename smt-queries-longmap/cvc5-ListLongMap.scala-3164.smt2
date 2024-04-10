; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44610 () Bool)

(assert start!44610)

(declare-fun b!489327 () Bool)

(declare-fun e!287811 () Bool)

(declare-fun e!287812 () Bool)

(assert (=> b!489327 (= e!287811 e!287812)))

(declare-fun res!292271 () Bool)

(assert (=> b!489327 (=> (not res!292271) (not e!287812))))

(declare-datatypes ((SeekEntryResult!3689 0))(
  ( (MissingZero!3689 (index!16935 (_ BitVec 32))) (Found!3689 (index!16936 (_ BitVec 32))) (Intermediate!3689 (undefined!4501 Bool) (index!16937 (_ BitVec 32)) (x!46051 (_ BitVec 32))) (Undefined!3689) (MissingVacant!3689 (index!16938 (_ BitVec 32))) )
))
(declare-fun lt!220751 () SeekEntryResult!3689)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489327 (= res!292271 (or (= lt!220751 (MissingZero!3689 i!1204)) (= lt!220751 (MissingVacant!3689 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31669 0))(
  ( (array!31670 (arr!15222 (Array (_ BitVec 32) (_ BitVec 64))) (size!15586 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31669)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31669 (_ BitVec 32)) SeekEntryResult!3689)

(assert (=> b!489327 (= lt!220751 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489328 () Bool)

(declare-fun res!292267 () Bool)

(assert (=> b!489328 (=> (not res!292267) (not e!287811))))

(declare-fun arrayContainsKey!0 (array!31669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489328 (= res!292267 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489329 () Bool)

(declare-fun res!292263 () Bool)

(assert (=> b!489329 (=> (not res!292263) (not e!287811))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489329 (= res!292263 (and (= (size!15586 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15586 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15586 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292266 () Bool)

(assert (=> start!44610 (=> (not res!292266) (not e!287811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44610 (= res!292266 (validMask!0 mask!3524))))

(assert (=> start!44610 e!287811))

(assert (=> start!44610 true))

(declare-fun array_inv!11018 (array!31669) Bool)

(assert (=> start!44610 (array_inv!11018 a!3235)))

(declare-fun b!489330 () Bool)

(declare-fun res!292270 () Bool)

(assert (=> b!489330 (=> (not res!292270) (not e!287811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489330 (= res!292270 (validKeyInArray!0 (select (arr!15222 a!3235) j!176)))))

(declare-fun b!489331 () Bool)

(assert (=> b!489331 (= e!287812 (not true))))

(declare-fun lt!220755 () (_ BitVec 32))

(declare-fun lt!220754 () SeekEntryResult!3689)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31669 (_ BitVec 32)) SeekEntryResult!3689)

(assert (=> b!489331 (= lt!220754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220755 (select (store (arr!15222 a!3235) i!1204 k!2280) j!176) (array!31670 (store (arr!15222 a!3235) i!1204 k!2280) (size!15586 a!3235)) mask!3524))))

(declare-fun lt!220756 () (_ BitVec 32))

(declare-fun lt!220752 () SeekEntryResult!3689)

(assert (=> b!489331 (= lt!220752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220756 (select (arr!15222 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489331 (= lt!220755 (toIndex!0 (select (store (arr!15222 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489331 (= lt!220756 (toIndex!0 (select (arr!15222 a!3235) j!176) mask!3524))))

(declare-fun e!287814 () Bool)

(assert (=> b!489331 e!287814))

(declare-fun res!292265 () Bool)

(assert (=> b!489331 (=> (not res!292265) (not e!287814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31669 (_ BitVec 32)) Bool)

(assert (=> b!489331 (= res!292265 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14324 0))(
  ( (Unit!14325) )
))
(declare-fun lt!220753 () Unit!14324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14324)

(assert (=> b!489331 (= lt!220753 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489332 () Bool)

(declare-fun res!292269 () Bool)

(assert (=> b!489332 (=> (not res!292269) (not e!287812))))

(assert (=> b!489332 (= res!292269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489333 () Bool)

(assert (=> b!489333 (= e!287814 (= (seekEntryOrOpen!0 (select (arr!15222 a!3235) j!176) a!3235 mask!3524) (Found!3689 j!176)))))

(declare-fun b!489334 () Bool)

(declare-fun res!292264 () Bool)

(assert (=> b!489334 (=> (not res!292264) (not e!287811))))

(assert (=> b!489334 (= res!292264 (validKeyInArray!0 k!2280))))

(declare-fun b!489335 () Bool)

(declare-fun res!292268 () Bool)

(assert (=> b!489335 (=> (not res!292268) (not e!287812))))

(declare-datatypes ((List!9380 0))(
  ( (Nil!9377) (Cons!9376 (h!10238 (_ BitVec 64)) (t!15608 List!9380)) )
))
(declare-fun arrayNoDuplicates!0 (array!31669 (_ BitVec 32) List!9380) Bool)

(assert (=> b!489335 (= res!292268 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9377))))

(assert (= (and start!44610 res!292266) b!489329))

(assert (= (and b!489329 res!292263) b!489330))

(assert (= (and b!489330 res!292270) b!489334))

(assert (= (and b!489334 res!292264) b!489328))

(assert (= (and b!489328 res!292267) b!489327))

(assert (= (and b!489327 res!292271) b!489332))

(assert (= (and b!489332 res!292269) b!489335))

(assert (= (and b!489335 res!292268) b!489331))

(assert (= (and b!489331 res!292265) b!489333))

(declare-fun m!469065 () Bool)

(assert (=> b!489335 m!469065))

(declare-fun m!469067 () Bool)

(assert (=> start!44610 m!469067))

(declare-fun m!469069 () Bool)

(assert (=> start!44610 m!469069))

(declare-fun m!469071 () Bool)

(assert (=> b!489327 m!469071))

(declare-fun m!469073 () Bool)

(assert (=> b!489334 m!469073))

(declare-fun m!469075 () Bool)

(assert (=> b!489330 m!469075))

(assert (=> b!489330 m!469075))

(declare-fun m!469077 () Bool)

(assert (=> b!489330 m!469077))

(declare-fun m!469079 () Bool)

(assert (=> b!489332 m!469079))

(declare-fun m!469081 () Bool)

(assert (=> b!489328 m!469081))

(assert (=> b!489333 m!469075))

(assert (=> b!489333 m!469075))

(declare-fun m!469083 () Bool)

(assert (=> b!489333 m!469083))

(declare-fun m!469085 () Bool)

(assert (=> b!489331 m!469085))

(declare-fun m!469087 () Bool)

(assert (=> b!489331 m!469087))

(declare-fun m!469089 () Bool)

(assert (=> b!489331 m!469089))

(assert (=> b!489331 m!469075))

(declare-fun m!469091 () Bool)

(assert (=> b!489331 m!469091))

(assert (=> b!489331 m!469075))

(declare-fun m!469093 () Bool)

(assert (=> b!489331 m!469093))

(assert (=> b!489331 m!469089))

(declare-fun m!469095 () Bool)

(assert (=> b!489331 m!469095))

(assert (=> b!489331 m!469075))

(declare-fun m!469097 () Bool)

(assert (=> b!489331 m!469097))

(assert (=> b!489331 m!469089))

(declare-fun m!469099 () Bool)

(assert (=> b!489331 m!469099))

(push 1)

