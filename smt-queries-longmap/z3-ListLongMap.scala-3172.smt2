; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44660 () Bool)

(assert start!44660)

(declare-fun res!292945 () Bool)

(declare-fun e!288112 () Bool)

(assert (=> start!44660 (=> (not res!292945) (not e!288112))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44660 (= res!292945 (validMask!0 mask!3524))))

(assert (=> start!44660 e!288112))

(assert (=> start!44660 true))

(declare-datatypes ((array!31719 0))(
  ( (array!31720 (arr!15247 (Array (_ BitVec 32) (_ BitVec 64))) (size!15611 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31719)

(declare-fun array_inv!11043 (array!31719) Bool)

(assert (=> start!44660 (array_inv!11043 a!3235)))

(declare-fun b!490002 () Bool)

(declare-fun e!288111 () Bool)

(assert (=> b!490002 (= e!288112 e!288111)))

(declare-fun res!292938 () Bool)

(assert (=> b!490002 (=> (not res!292938) (not e!288111))))

(declare-datatypes ((SeekEntryResult!3714 0))(
  ( (MissingZero!3714 (index!17035 (_ BitVec 32))) (Found!3714 (index!17036 (_ BitVec 32))) (Intermediate!3714 (undefined!4526 Bool) (index!17037 (_ BitVec 32)) (x!46140 (_ BitVec 32))) (Undefined!3714) (MissingVacant!3714 (index!17038 (_ BitVec 32))) )
))
(declare-fun lt!221205 () SeekEntryResult!3714)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490002 (= res!292938 (or (= lt!221205 (MissingZero!3714 i!1204)) (= lt!221205 (MissingVacant!3714 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31719 (_ BitVec 32)) SeekEntryResult!3714)

(assert (=> b!490002 (= lt!221205 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490003 () Bool)

(declare-fun res!292946 () Bool)

(assert (=> b!490003 (=> (not res!292946) (not e!288112))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490003 (= res!292946 (and (= (size!15611 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15611 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15611 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490004 () Bool)

(declare-fun res!292944 () Bool)

(assert (=> b!490004 (=> (not res!292944) (not e!288111))))

(declare-datatypes ((List!9405 0))(
  ( (Nil!9402) (Cons!9401 (h!10263 (_ BitVec 64)) (t!15633 List!9405)) )
))
(declare-fun arrayNoDuplicates!0 (array!31719 (_ BitVec 32) List!9405) Bool)

(assert (=> b!490004 (= res!292944 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9402))))

(declare-fun b!490005 () Bool)

(assert (=> b!490005 (= e!288111 (not true))))

(declare-fun lt!221203 () SeekEntryResult!3714)

(declare-fun lt!221202 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31719 (_ BitVec 32)) SeekEntryResult!3714)

(assert (=> b!490005 (= lt!221203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221202 (select (store (arr!15247 a!3235) i!1204 k0!2280) j!176) (array!31720 (store (arr!15247 a!3235) i!1204 k0!2280) (size!15611 a!3235)) mask!3524))))

(declare-fun lt!221206 () (_ BitVec 32))

(declare-fun lt!221201 () SeekEntryResult!3714)

(assert (=> b!490005 (= lt!221201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221206 (select (arr!15247 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490005 (= lt!221202 (toIndex!0 (select (store (arr!15247 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490005 (= lt!221206 (toIndex!0 (select (arr!15247 a!3235) j!176) mask!3524))))

(declare-fun e!288113 () Bool)

(assert (=> b!490005 e!288113))

(declare-fun res!292940 () Bool)

(assert (=> b!490005 (=> (not res!292940) (not e!288113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31719 (_ BitVec 32)) Bool)

(assert (=> b!490005 (= res!292940 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14374 0))(
  ( (Unit!14375) )
))
(declare-fun lt!221204 () Unit!14374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14374)

(assert (=> b!490005 (= lt!221204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490006 () Bool)

(declare-fun res!292943 () Bool)

(assert (=> b!490006 (=> (not res!292943) (not e!288112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490006 (= res!292943 (validKeyInArray!0 k0!2280))))

(declare-fun b!490007 () Bool)

(declare-fun res!292939 () Bool)

(assert (=> b!490007 (=> (not res!292939) (not e!288112))))

(assert (=> b!490007 (= res!292939 (validKeyInArray!0 (select (arr!15247 a!3235) j!176)))))

(declare-fun b!490008 () Bool)

(declare-fun res!292942 () Bool)

(assert (=> b!490008 (=> (not res!292942) (not e!288112))))

(declare-fun arrayContainsKey!0 (array!31719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490008 (= res!292942 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490009 () Bool)

(assert (=> b!490009 (= e!288113 (= (seekEntryOrOpen!0 (select (arr!15247 a!3235) j!176) a!3235 mask!3524) (Found!3714 j!176)))))

(declare-fun b!490010 () Bool)

(declare-fun res!292941 () Bool)

(assert (=> b!490010 (=> (not res!292941) (not e!288111))))

(assert (=> b!490010 (= res!292941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44660 res!292945) b!490003))

(assert (= (and b!490003 res!292946) b!490007))

(assert (= (and b!490007 res!292939) b!490006))

(assert (= (and b!490006 res!292943) b!490008))

(assert (= (and b!490008 res!292942) b!490002))

(assert (= (and b!490002 res!292938) b!490010))

(assert (= (and b!490010 res!292941) b!490004))

(assert (= (and b!490004 res!292944) b!490005))

(assert (= (and b!490005 res!292940) b!490009))

(declare-fun m!469965 () Bool)

(assert (=> b!490006 m!469965))

(declare-fun m!469967 () Bool)

(assert (=> b!490004 m!469967))

(declare-fun m!469969 () Bool)

(assert (=> b!490009 m!469969))

(assert (=> b!490009 m!469969))

(declare-fun m!469971 () Bool)

(assert (=> b!490009 m!469971))

(declare-fun m!469973 () Bool)

(assert (=> b!490010 m!469973))

(declare-fun m!469975 () Bool)

(assert (=> start!44660 m!469975))

(declare-fun m!469977 () Bool)

(assert (=> start!44660 m!469977))

(declare-fun m!469979 () Bool)

(assert (=> b!490005 m!469979))

(declare-fun m!469981 () Bool)

(assert (=> b!490005 m!469981))

(declare-fun m!469983 () Bool)

(assert (=> b!490005 m!469983))

(assert (=> b!490005 m!469969))

(declare-fun m!469985 () Bool)

(assert (=> b!490005 m!469985))

(assert (=> b!490005 m!469969))

(declare-fun m!469987 () Bool)

(assert (=> b!490005 m!469987))

(assert (=> b!490005 m!469969))

(declare-fun m!469989 () Bool)

(assert (=> b!490005 m!469989))

(assert (=> b!490005 m!469983))

(declare-fun m!469991 () Bool)

(assert (=> b!490005 m!469991))

(assert (=> b!490005 m!469983))

(declare-fun m!469993 () Bool)

(assert (=> b!490005 m!469993))

(declare-fun m!469995 () Bool)

(assert (=> b!490008 m!469995))

(declare-fun m!469997 () Bool)

(assert (=> b!490002 m!469997))

(assert (=> b!490007 m!469969))

(assert (=> b!490007 m!469969))

(declare-fun m!469999 () Bool)

(assert (=> b!490007 m!469999))

(check-sat (not b!490006) (not b!490007) (not b!490005) (not b!490008) (not b!490010) (not b!490004) (not start!44660) (not b!490009) (not b!490002))
(check-sat)
