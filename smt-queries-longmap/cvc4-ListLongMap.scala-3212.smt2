; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45022 () Bool)

(assert start!45022)

(declare-fun b!493976 () Bool)

(declare-fun res!296549 () Bool)

(declare-fun e!290001 () Bool)

(assert (=> b!493976 (=> (not res!296549) (not e!290001))))

(declare-datatypes ((array!31967 0))(
  ( (array!31968 (arr!15368 (Array (_ BitVec 32) (_ BitVec 64))) (size!15732 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31967)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493976 (= res!296549 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493977 () Bool)

(declare-fun res!296555 () Bool)

(assert (=> b!493977 (=> (not res!296555) (not e!290001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493977 (= res!296555 (validKeyInArray!0 k!2280))))

(declare-fun b!493978 () Bool)

(declare-fun e!289999 () Bool)

(declare-fun e!290000 () Bool)

(assert (=> b!493978 (= e!289999 (not e!290000))))

(declare-fun res!296546 () Bool)

(assert (=> b!493978 (=> res!296546 e!290000)))

(declare-fun lt!223497 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3835 0))(
  ( (MissingZero!3835 (index!17519 (_ BitVec 32))) (Found!3835 (index!17520 (_ BitVec 32))) (Intermediate!3835 (undefined!4647 Bool) (index!17521 (_ BitVec 32)) (x!46593 (_ BitVec 32))) (Undefined!3835) (MissingVacant!3835 (index!17522 (_ BitVec 32))) )
))
(declare-fun lt!223495 () SeekEntryResult!3835)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31967 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!493978 (= res!296546 (= lt!223495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223497 (select (store (arr!15368 a!3235) i!1204 k!2280) j!176) (array!31968 (store (arr!15368 a!3235) i!1204 k!2280) (size!15732 a!3235)) mask!3524)))))

(declare-fun lt!223498 () (_ BitVec 32))

(assert (=> b!493978 (= lt!223495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223498 (select (arr!15368 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493978 (= lt!223497 (toIndex!0 (select (store (arr!15368 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493978 (= lt!223498 (toIndex!0 (select (arr!15368 a!3235) j!176) mask!3524))))

(declare-fun lt!223496 () SeekEntryResult!3835)

(assert (=> b!493978 (= lt!223496 (Found!3835 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31967 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!493978 (= lt!223496 (seekEntryOrOpen!0 (select (arr!15368 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31967 (_ BitVec 32)) Bool)

(assert (=> b!493978 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14616 0))(
  ( (Unit!14617) )
))
(declare-fun lt!223493 () Unit!14616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14616)

(assert (=> b!493978 (= lt!223493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493979 () Bool)

(assert (=> b!493979 (= e!290001 e!289999)))

(declare-fun res!296552 () Bool)

(assert (=> b!493979 (=> (not res!296552) (not e!289999))))

(declare-fun lt!223494 () SeekEntryResult!3835)

(assert (=> b!493979 (= res!296552 (or (= lt!223494 (MissingZero!3835 i!1204)) (= lt!223494 (MissingVacant!3835 i!1204))))))

(assert (=> b!493979 (= lt!223494 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493980 () Bool)

(declare-fun res!296547 () Bool)

(assert (=> b!493980 (=> (not res!296547) (not e!290001))))

(assert (=> b!493980 (= res!296547 (validKeyInArray!0 (select (arr!15368 a!3235) j!176)))))

(declare-fun b!493981 () Bool)

(declare-fun res!296551 () Bool)

(assert (=> b!493981 (=> (not res!296551) (not e!289999))))

(assert (=> b!493981 (= res!296551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493982 () Bool)

(declare-fun res!296548 () Bool)

(assert (=> b!493982 (=> (not res!296548) (not e!290001))))

(assert (=> b!493982 (= res!296548 (and (= (size!15732 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15732 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15732 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493983 () Bool)

(declare-fun res!296554 () Bool)

(assert (=> b!493983 (=> res!296554 e!290000)))

(assert (=> b!493983 (= res!296554 (or (not (is-Intermediate!3835 lt!223495)) (not (undefined!4647 lt!223495))))))

(declare-fun res!296550 () Bool)

(assert (=> start!45022 (=> (not res!296550) (not e!290001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45022 (= res!296550 (validMask!0 mask!3524))))

(assert (=> start!45022 e!290001))

(assert (=> start!45022 true))

(declare-fun array_inv!11164 (array!31967) Bool)

(assert (=> start!45022 (array_inv!11164 a!3235)))

(declare-fun b!493984 () Bool)

(assert (=> b!493984 (= e!290000 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!493984 (= lt!223496 Undefined!3835)))

(declare-fun b!493985 () Bool)

(declare-fun res!296553 () Bool)

(assert (=> b!493985 (=> (not res!296553) (not e!289999))))

(declare-datatypes ((List!9526 0))(
  ( (Nil!9523) (Cons!9522 (h!10390 (_ BitVec 64)) (t!15754 List!9526)) )
))
(declare-fun arrayNoDuplicates!0 (array!31967 (_ BitVec 32) List!9526) Bool)

(assert (=> b!493985 (= res!296553 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9523))))

(assert (= (and start!45022 res!296550) b!493982))

(assert (= (and b!493982 res!296548) b!493980))

(assert (= (and b!493980 res!296547) b!493977))

(assert (= (and b!493977 res!296555) b!493976))

(assert (= (and b!493976 res!296549) b!493979))

(assert (= (and b!493979 res!296552) b!493981))

(assert (= (and b!493981 res!296551) b!493985))

(assert (= (and b!493985 res!296553) b!493978))

(assert (= (and b!493978 (not res!296546)) b!493983))

(assert (= (and b!493983 (not res!296554)) b!493984))

(declare-fun m!474927 () Bool)

(assert (=> b!493979 m!474927))

(declare-fun m!474929 () Bool)

(assert (=> b!493981 m!474929))

(declare-fun m!474931 () Bool)

(assert (=> b!493978 m!474931))

(declare-fun m!474933 () Bool)

(assert (=> b!493978 m!474933))

(declare-fun m!474935 () Bool)

(assert (=> b!493978 m!474935))

(declare-fun m!474937 () Bool)

(assert (=> b!493978 m!474937))

(declare-fun m!474939 () Bool)

(assert (=> b!493978 m!474939))

(assert (=> b!493978 m!474939))

(declare-fun m!474941 () Bool)

(assert (=> b!493978 m!474941))

(assert (=> b!493978 m!474933))

(declare-fun m!474943 () Bool)

(assert (=> b!493978 m!474943))

(assert (=> b!493978 m!474933))

(declare-fun m!474945 () Bool)

(assert (=> b!493978 m!474945))

(assert (=> b!493978 m!474933))

(declare-fun m!474947 () Bool)

(assert (=> b!493978 m!474947))

(assert (=> b!493978 m!474939))

(declare-fun m!474949 () Bool)

(assert (=> b!493978 m!474949))

(declare-fun m!474951 () Bool)

(assert (=> b!493985 m!474951))

(declare-fun m!474953 () Bool)

(assert (=> b!493977 m!474953))

(declare-fun m!474955 () Bool)

(assert (=> b!493976 m!474955))

(assert (=> b!493980 m!474933))

(assert (=> b!493980 m!474933))

(declare-fun m!474957 () Bool)

(assert (=> b!493980 m!474957))

(declare-fun m!474959 () Bool)

(assert (=> start!45022 m!474959))

(declare-fun m!474961 () Bool)

(assert (=> start!45022 m!474961))

(push 1)

