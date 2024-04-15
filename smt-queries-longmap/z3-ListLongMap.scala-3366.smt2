; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46236 () Bool)

(assert start!46236)

(declare-fun b!511939 () Bool)

(declare-fun res!312748 () Bool)

(declare-fun e!298998 () Bool)

(assert (=> b!511939 (=> (not res!312748) (not e!298998))))

(declare-datatypes ((array!32900 0))(
  ( (array!32901 (arr!15827 (Array (_ BitVec 32) (_ BitVec 64))) (size!16192 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32900)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511939 (= res!312748 (validKeyInArray!0 (select (arr!15827 a!3235) j!176)))))

(declare-fun b!511940 () Bool)

(declare-fun e!298999 () Bool)

(declare-fun e!299001 () Bool)

(assert (=> b!511940 (= e!298999 (not e!299001))))

(declare-fun res!312751 () Bool)

(assert (=> b!511940 (=> res!312751 e!299001)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4291 0))(
  ( (MissingZero!4291 (index!19352 (_ BitVec 32))) (Found!4291 (index!19353 (_ BitVec 32))) (Intermediate!4291 (undefined!5103 Bool) (index!19354 (_ BitVec 32)) (x!48309 (_ BitVec 32))) (Undefined!4291) (MissingVacant!4291 (index!19355 (_ BitVec 32))) )
))
(declare-fun lt!234209 () SeekEntryResult!4291)

(declare-fun lt!234210 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32900 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!511940 (= res!312751 (= lt!234209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234210 (select (store (arr!15827 a!3235) i!1204 k0!2280) j!176) (array!32901 (store (arr!15827 a!3235) i!1204 k0!2280) (size!16192 a!3235)) mask!3524)))))

(declare-fun lt!234212 () (_ BitVec 32))

(assert (=> b!511940 (= lt!234209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234212 (select (arr!15827 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511940 (= lt!234210 (toIndex!0 (select (store (arr!15827 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511940 (= lt!234212 (toIndex!0 (select (arr!15827 a!3235) j!176) mask!3524))))

(declare-fun lt!234214 () SeekEntryResult!4291)

(assert (=> b!511940 (= lt!234214 (Found!4291 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32900 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!511940 (= lt!234214 (seekEntryOrOpen!0 (select (arr!15827 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32900 (_ BitVec 32)) Bool)

(assert (=> b!511940 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15826 0))(
  ( (Unit!15827) )
))
(declare-fun lt!234211 () Unit!15826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15826)

(assert (=> b!511940 (= lt!234211 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511941 () Bool)

(assert (=> b!511941 (= e!299001 true)))

(assert (=> b!511941 (= lt!234214 Undefined!4291)))

(declare-fun b!511942 () Bool)

(declare-fun res!312744 () Bool)

(assert (=> b!511942 (=> (not res!312744) (not e!298998))))

(assert (=> b!511942 (= res!312744 (and (= (size!16192 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16192 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16192 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511943 () Bool)

(assert (=> b!511943 (= e!298998 e!298999)))

(declare-fun res!312745 () Bool)

(assert (=> b!511943 (=> (not res!312745) (not e!298999))))

(declare-fun lt!234213 () SeekEntryResult!4291)

(assert (=> b!511943 (= res!312745 (or (= lt!234213 (MissingZero!4291 i!1204)) (= lt!234213 (MissingVacant!4291 i!1204))))))

(assert (=> b!511943 (= lt!234213 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511944 () Bool)

(declare-fun res!312750 () Bool)

(assert (=> b!511944 (=> res!312750 e!299001)))

(get-info :version)

(assert (=> b!511944 (= res!312750 (or (not ((_ is Intermediate!4291) lt!234209)) (not (undefined!5103 lt!234209))))))

(declare-fun b!511945 () Bool)

(declare-fun res!312743 () Bool)

(assert (=> b!511945 (=> (not res!312743) (not e!298998))))

(assert (=> b!511945 (= res!312743 (validKeyInArray!0 k0!2280))))

(declare-fun b!511946 () Bool)

(declare-fun res!312747 () Bool)

(assert (=> b!511946 (=> (not res!312747) (not e!298999))))

(assert (=> b!511946 (= res!312747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511947 () Bool)

(declare-fun res!312752 () Bool)

(assert (=> b!511947 (=> (not res!312752) (not e!298999))))

(declare-datatypes ((List!10024 0))(
  ( (Nil!10021) (Cons!10020 (h!10900 (_ BitVec 64)) (t!16243 List!10024)) )
))
(declare-fun arrayNoDuplicates!0 (array!32900 (_ BitVec 32) List!10024) Bool)

(assert (=> b!511947 (= res!312752 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10021))))

(declare-fun b!511948 () Bool)

(declare-fun res!312749 () Bool)

(assert (=> b!511948 (=> (not res!312749) (not e!298998))))

(declare-fun arrayContainsKey!0 (array!32900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511948 (= res!312749 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312746 () Bool)

(assert (=> start!46236 (=> (not res!312746) (not e!298998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46236 (= res!312746 (validMask!0 mask!3524))))

(assert (=> start!46236 e!298998))

(assert (=> start!46236 true))

(declare-fun array_inv!11710 (array!32900) Bool)

(assert (=> start!46236 (array_inv!11710 a!3235)))

(assert (= (and start!46236 res!312746) b!511942))

(assert (= (and b!511942 res!312744) b!511939))

(assert (= (and b!511939 res!312748) b!511945))

(assert (= (and b!511945 res!312743) b!511948))

(assert (= (and b!511948 res!312749) b!511943))

(assert (= (and b!511943 res!312745) b!511946))

(assert (= (and b!511946 res!312747) b!511947))

(assert (= (and b!511947 res!312752) b!511940))

(assert (= (and b!511940 (not res!312751)) b!511944))

(assert (= (and b!511944 (not res!312750)) b!511941))

(declare-fun m!493069 () Bool)

(assert (=> b!511948 m!493069))

(declare-fun m!493071 () Bool)

(assert (=> start!46236 m!493071))

(declare-fun m!493073 () Bool)

(assert (=> start!46236 m!493073))

(declare-fun m!493075 () Bool)

(assert (=> b!511947 m!493075))

(declare-fun m!493077 () Bool)

(assert (=> b!511943 m!493077))

(declare-fun m!493079 () Bool)

(assert (=> b!511945 m!493079))

(declare-fun m!493081 () Bool)

(assert (=> b!511939 m!493081))

(assert (=> b!511939 m!493081))

(declare-fun m!493083 () Bool)

(assert (=> b!511939 m!493083))

(declare-fun m!493085 () Bool)

(assert (=> b!511946 m!493085))

(assert (=> b!511940 m!493081))

(declare-fun m!493087 () Bool)

(assert (=> b!511940 m!493087))

(declare-fun m!493089 () Bool)

(assert (=> b!511940 m!493089))

(declare-fun m!493091 () Bool)

(assert (=> b!511940 m!493091))

(declare-fun m!493093 () Bool)

(assert (=> b!511940 m!493093))

(declare-fun m!493095 () Bool)

(assert (=> b!511940 m!493095))

(assert (=> b!511940 m!493091))

(assert (=> b!511940 m!493081))

(declare-fun m!493097 () Bool)

(assert (=> b!511940 m!493097))

(assert (=> b!511940 m!493081))

(declare-fun m!493099 () Bool)

(assert (=> b!511940 m!493099))

(assert (=> b!511940 m!493081))

(declare-fun m!493101 () Bool)

(assert (=> b!511940 m!493101))

(assert (=> b!511940 m!493091))

(declare-fun m!493103 () Bool)

(assert (=> b!511940 m!493103))

(check-sat (not b!511947) (not b!511940) (not b!511946) (not b!511948) (not b!511939) (not b!511945) (not b!511943) (not start!46236))
(check-sat)
