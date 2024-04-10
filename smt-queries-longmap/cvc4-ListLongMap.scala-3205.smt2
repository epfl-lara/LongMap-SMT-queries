; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44980 () Bool)

(assert start!44980)

(declare-fun b!493347 () Bool)

(declare-fun res!295925 () Bool)

(declare-fun e!289748 () Bool)

(assert (=> b!493347 (=> (not res!295925) (not e!289748))))

(declare-datatypes ((array!31925 0))(
  ( (array!31926 (arr!15347 (Array (_ BitVec 32) (_ BitVec 64))) (size!15711 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31925)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493347 (= res!295925 (validKeyInArray!0 (select (arr!15347 a!3235) j!176)))))

(declare-fun b!493348 () Bool)

(declare-fun res!295921 () Bool)

(declare-fun e!289746 () Bool)

(assert (=> b!493348 (=> (not res!295921) (not e!289746))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31925 (_ BitVec 32)) Bool)

(assert (=> b!493348 (= res!295921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493349 () Bool)

(assert (=> b!493349 (= e!289748 e!289746)))

(declare-fun res!295919 () Bool)

(assert (=> b!493349 (=> (not res!295919) (not e!289746))))

(declare-datatypes ((SeekEntryResult!3814 0))(
  ( (MissingZero!3814 (index!17435 (_ BitVec 32))) (Found!3814 (index!17436 (_ BitVec 32))) (Intermediate!3814 (undefined!4626 Bool) (index!17437 (_ BitVec 32)) (x!46516 (_ BitVec 32))) (Undefined!3814) (MissingVacant!3814 (index!17438 (_ BitVec 32))) )
))
(declare-fun lt!223115 () SeekEntryResult!3814)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493349 (= res!295919 (or (= lt!223115 (MissingZero!3814 i!1204)) (= lt!223115 (MissingVacant!3814 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31925 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!493349 (= lt!223115 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!295920 () Bool)

(assert (=> start!44980 (=> (not res!295920) (not e!289748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44980 (= res!295920 (validMask!0 mask!3524))))

(assert (=> start!44980 e!289748))

(assert (=> start!44980 true))

(declare-fun array_inv!11143 (array!31925) Bool)

(assert (=> start!44980 (array_inv!11143 a!3235)))

(declare-fun e!289749 () Bool)

(declare-fun b!493350 () Bool)

(assert (=> b!493350 (= e!289749 (= (seekEntryOrOpen!0 (select (arr!15347 a!3235) j!176) a!3235 mask!3524) (Found!3814 j!176)))))

(declare-fun b!493351 () Bool)

(assert (=> b!493351 (= e!289746 (not true))))

(declare-fun lt!223120 () SeekEntryResult!3814)

(declare-fun lt!223119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31925 (_ BitVec 32)) SeekEntryResult!3814)

(assert (=> b!493351 (= lt!223120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223119 (select (store (arr!15347 a!3235) i!1204 k!2280) j!176) (array!31926 (store (arr!15347 a!3235) i!1204 k!2280) (size!15711 a!3235)) mask!3524))))

(declare-fun lt!223117 () (_ BitVec 32))

(declare-fun lt!223118 () SeekEntryResult!3814)

(assert (=> b!493351 (= lt!223118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223117 (select (arr!15347 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493351 (= lt!223119 (toIndex!0 (select (store (arr!15347 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493351 (= lt!223117 (toIndex!0 (select (arr!15347 a!3235) j!176) mask!3524))))

(assert (=> b!493351 e!289749))

(declare-fun res!295923 () Bool)

(assert (=> b!493351 (=> (not res!295923) (not e!289749))))

(assert (=> b!493351 (= res!295923 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14574 0))(
  ( (Unit!14575) )
))
(declare-fun lt!223116 () Unit!14574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14574)

(assert (=> b!493351 (= lt!223116 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493352 () Bool)

(declare-fun res!295922 () Bool)

(assert (=> b!493352 (=> (not res!295922) (not e!289748))))

(assert (=> b!493352 (= res!295922 (validKeyInArray!0 k!2280))))

(declare-fun b!493353 () Bool)

(declare-fun res!295924 () Bool)

(assert (=> b!493353 (=> (not res!295924) (not e!289746))))

(declare-datatypes ((List!9505 0))(
  ( (Nil!9502) (Cons!9501 (h!10369 (_ BitVec 64)) (t!15733 List!9505)) )
))
(declare-fun arrayNoDuplicates!0 (array!31925 (_ BitVec 32) List!9505) Bool)

(assert (=> b!493353 (= res!295924 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9502))))

(declare-fun b!493354 () Bool)

(declare-fun res!295918 () Bool)

(assert (=> b!493354 (=> (not res!295918) (not e!289748))))

(assert (=> b!493354 (= res!295918 (and (= (size!15711 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15711 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15711 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493355 () Bool)

(declare-fun res!295917 () Bool)

(assert (=> b!493355 (=> (not res!295917) (not e!289748))))

(declare-fun arrayContainsKey!0 (array!31925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493355 (= res!295917 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44980 res!295920) b!493354))

(assert (= (and b!493354 res!295918) b!493347))

(assert (= (and b!493347 res!295925) b!493352))

(assert (= (and b!493352 res!295922) b!493355))

(assert (= (and b!493355 res!295917) b!493349))

(assert (= (and b!493349 res!295919) b!493348))

(assert (= (and b!493348 res!295921) b!493353))

(assert (= (and b!493353 res!295924) b!493351))

(assert (= (and b!493351 res!295923) b!493350))

(declare-fun m!474171 () Bool)

(assert (=> b!493348 m!474171))

(declare-fun m!474173 () Bool)

(assert (=> b!493353 m!474173))

(declare-fun m!474175 () Bool)

(assert (=> b!493349 m!474175))

(declare-fun m!474177 () Bool)

(assert (=> b!493350 m!474177))

(assert (=> b!493350 m!474177))

(declare-fun m!474179 () Bool)

(assert (=> b!493350 m!474179))

(declare-fun m!474181 () Bool)

(assert (=> b!493352 m!474181))

(assert (=> b!493351 m!474177))

(declare-fun m!474183 () Bool)

(assert (=> b!493351 m!474183))

(declare-fun m!474185 () Bool)

(assert (=> b!493351 m!474185))

(declare-fun m!474187 () Bool)

(assert (=> b!493351 m!474187))

(declare-fun m!474189 () Bool)

(assert (=> b!493351 m!474189))

(declare-fun m!474191 () Bool)

(assert (=> b!493351 m!474191))

(assert (=> b!493351 m!474185))

(assert (=> b!493351 m!474177))

(declare-fun m!474193 () Bool)

(assert (=> b!493351 m!474193))

(assert (=> b!493351 m!474177))

(declare-fun m!474195 () Bool)

(assert (=> b!493351 m!474195))

(assert (=> b!493351 m!474185))

(declare-fun m!474197 () Bool)

(assert (=> b!493351 m!474197))

(declare-fun m!474199 () Bool)

(assert (=> start!44980 m!474199))

(declare-fun m!474201 () Bool)

(assert (=> start!44980 m!474201))

(assert (=> b!493347 m!474177))

(assert (=> b!493347 m!474177))

(declare-fun m!474203 () Bool)

(assert (=> b!493347 m!474203))

(declare-fun m!474205 () Bool)

(assert (=> b!493355 m!474205))

(push 1)

