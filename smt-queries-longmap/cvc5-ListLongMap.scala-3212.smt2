; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45018 () Bool)

(assert start!45018)

(declare-fun res!296489 () Bool)

(declare-fun e!289977 () Bool)

(assert (=> start!45018 (=> (not res!296489) (not e!289977))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45018 (= res!296489 (validMask!0 mask!3524))))

(assert (=> start!45018 e!289977))

(assert (=> start!45018 true))

(declare-datatypes ((array!31963 0))(
  ( (array!31964 (arr!15366 (Array (_ BitVec 32) (_ BitVec 64))) (size!15730 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31963)

(declare-fun array_inv!11162 (array!31963) Bool)

(assert (=> start!45018 (array_inv!11162 a!3235)))

(declare-fun b!493916 () Bool)

(declare-fun res!296487 () Bool)

(declare-fun e!289974 () Bool)

(assert (=> b!493916 (=> (not res!296487) (not e!289974))))

(declare-datatypes ((List!9524 0))(
  ( (Nil!9521) (Cons!9520 (h!10388 (_ BitVec 64)) (t!15752 List!9524)) )
))
(declare-fun arrayNoDuplicates!0 (array!31963 (_ BitVec 32) List!9524) Bool)

(assert (=> b!493916 (= res!296487 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9521))))

(declare-fun b!493917 () Bool)

(declare-fun res!296494 () Bool)

(assert (=> b!493917 (=> (not res!296494) (not e!289977))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493917 (= res!296494 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493918 () Bool)

(declare-fun res!296492 () Bool)

(assert (=> b!493918 (=> (not res!296492) (not e!289974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31963 (_ BitVec 32)) Bool)

(assert (=> b!493918 (= res!296492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493919 () Bool)

(declare-fun res!296493 () Bool)

(declare-fun e!289975 () Bool)

(assert (=> b!493919 (=> res!296493 e!289975)))

(declare-datatypes ((SeekEntryResult!3833 0))(
  ( (MissingZero!3833 (index!17511 (_ BitVec 32))) (Found!3833 (index!17512 (_ BitVec 32))) (Intermediate!3833 (undefined!4645 Bool) (index!17513 (_ BitVec 32)) (x!46591 (_ BitVec 32))) (Undefined!3833) (MissingVacant!3833 (index!17514 (_ BitVec 32))) )
))
(declare-fun lt!223457 () SeekEntryResult!3833)

(assert (=> b!493919 (= res!296493 (or (not (is-Intermediate!3833 lt!223457)) (not (undefined!4645 lt!223457))))))

(declare-fun b!493920 () Bool)

(declare-fun res!296491 () Bool)

(assert (=> b!493920 (=> (not res!296491) (not e!289977))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493920 (= res!296491 (and (= (size!15730 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15730 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15730 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493921 () Bool)

(assert (=> b!493921 (= e!289977 e!289974)))

(declare-fun res!296495 () Bool)

(assert (=> b!493921 (=> (not res!296495) (not e!289974))))

(declare-fun lt!223458 () SeekEntryResult!3833)

(assert (=> b!493921 (= res!296495 (or (= lt!223458 (MissingZero!3833 i!1204)) (= lt!223458 (MissingVacant!3833 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31963 (_ BitVec 32)) SeekEntryResult!3833)

(assert (=> b!493921 (= lt!223458 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493922 () Bool)

(assert (=> b!493922 (= e!289974 (not e!289975))))

(declare-fun res!296490 () Bool)

(assert (=> b!493922 (=> res!296490 e!289975)))

(declare-fun lt!223462 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31963 (_ BitVec 32)) SeekEntryResult!3833)

(assert (=> b!493922 (= res!296490 (= lt!223457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223462 (select (store (arr!15366 a!3235) i!1204 k!2280) j!176) (array!31964 (store (arr!15366 a!3235) i!1204 k!2280) (size!15730 a!3235)) mask!3524)))))

(declare-fun lt!223461 () (_ BitVec 32))

(assert (=> b!493922 (= lt!223457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223461 (select (arr!15366 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493922 (= lt!223462 (toIndex!0 (select (store (arr!15366 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493922 (= lt!223461 (toIndex!0 (select (arr!15366 a!3235) j!176) mask!3524))))

(declare-fun lt!223460 () SeekEntryResult!3833)

(assert (=> b!493922 (= lt!223460 (Found!3833 j!176))))

(assert (=> b!493922 (= lt!223460 (seekEntryOrOpen!0 (select (arr!15366 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493922 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14612 0))(
  ( (Unit!14613) )
))
(declare-fun lt!223459 () Unit!14612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14612)

(assert (=> b!493922 (= lt!223459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493923 () Bool)

(declare-fun res!296488 () Bool)

(assert (=> b!493923 (=> (not res!296488) (not e!289977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493923 (= res!296488 (validKeyInArray!0 (select (arr!15366 a!3235) j!176)))))

(declare-fun b!493924 () Bool)

(declare-fun res!296486 () Bool)

(assert (=> b!493924 (=> (not res!296486) (not e!289977))))

(assert (=> b!493924 (= res!296486 (validKeyInArray!0 k!2280))))

(declare-fun b!493925 () Bool)

(assert (=> b!493925 (= e!289975 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!493925 (= lt!223460 Undefined!3833)))

(assert (= (and start!45018 res!296489) b!493920))

(assert (= (and b!493920 res!296491) b!493923))

(assert (= (and b!493923 res!296488) b!493924))

(assert (= (and b!493924 res!296486) b!493917))

(assert (= (and b!493917 res!296494) b!493921))

(assert (= (and b!493921 res!296495) b!493918))

(assert (= (and b!493918 res!296492) b!493916))

(assert (= (and b!493916 res!296487) b!493922))

(assert (= (and b!493922 (not res!296490)) b!493919))

(assert (= (and b!493919 (not res!296493)) b!493925))

(declare-fun m!474855 () Bool)

(assert (=> b!493916 m!474855))

(declare-fun m!474857 () Bool)

(assert (=> b!493917 m!474857))

(declare-fun m!474859 () Bool)

(assert (=> b!493918 m!474859))

(declare-fun m!474861 () Bool)

(assert (=> start!45018 m!474861))

(declare-fun m!474863 () Bool)

(assert (=> start!45018 m!474863))

(declare-fun m!474865 () Bool)

(assert (=> b!493922 m!474865))

(declare-fun m!474867 () Bool)

(assert (=> b!493922 m!474867))

(declare-fun m!474869 () Bool)

(assert (=> b!493922 m!474869))

(assert (=> b!493922 m!474869))

(declare-fun m!474871 () Bool)

(assert (=> b!493922 m!474871))

(declare-fun m!474873 () Bool)

(assert (=> b!493922 m!474873))

(declare-fun m!474875 () Bool)

(assert (=> b!493922 m!474875))

(assert (=> b!493922 m!474873))

(declare-fun m!474877 () Bool)

(assert (=> b!493922 m!474877))

(assert (=> b!493922 m!474873))

(declare-fun m!474879 () Bool)

(assert (=> b!493922 m!474879))

(assert (=> b!493922 m!474873))

(declare-fun m!474881 () Bool)

(assert (=> b!493922 m!474881))

(assert (=> b!493922 m!474869))

(declare-fun m!474883 () Bool)

(assert (=> b!493922 m!474883))

(assert (=> b!493923 m!474873))

(assert (=> b!493923 m!474873))

(declare-fun m!474885 () Bool)

(assert (=> b!493923 m!474885))

(declare-fun m!474887 () Bool)

(assert (=> b!493921 m!474887))

(declare-fun m!474889 () Bool)

(assert (=> b!493924 m!474889))

(push 1)

