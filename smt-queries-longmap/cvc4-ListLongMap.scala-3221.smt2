; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45076 () Bool)

(assert start!45076)

(declare-fun b!494786 () Bool)

(declare-fun res!297358 () Bool)

(declare-fun e!290325 () Bool)

(assert (=> b!494786 (=> (not res!297358) (not e!290325))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494786 (= res!297358 (validKeyInArray!0 k!2280))))

(declare-fun b!494787 () Bool)

(declare-fun res!297365 () Bool)

(assert (=> b!494787 (=> (not res!297365) (not e!290325))))

(declare-datatypes ((array!32021 0))(
  ( (array!32022 (arr!15395 (Array (_ BitVec 32) (_ BitVec 64))) (size!15759 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32021)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494787 (= res!297365 (validKeyInArray!0 (select (arr!15395 a!3235) j!176)))))

(declare-fun b!494788 () Bool)

(declare-fun e!290324 () Bool)

(assert (=> b!494788 (= e!290324 true)))

(declare-datatypes ((SeekEntryResult!3862 0))(
  ( (MissingZero!3862 (index!17627 (_ BitVec 32))) (Found!3862 (index!17628 (_ BitVec 32))) (Intermediate!3862 (undefined!4674 Bool) (index!17629 (_ BitVec 32)) (x!46692 (_ BitVec 32))) (Undefined!3862) (MissingVacant!3862 (index!17630 (_ BitVec 32))) )
))
(declare-fun lt!223980 () SeekEntryResult!3862)

(assert (=> b!494788 (= lt!223980 Undefined!3862)))

(declare-fun b!494789 () Bool)

(declare-fun res!297356 () Bool)

(assert (=> b!494789 (=> (not res!297356) (not e!290325))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!494789 (= res!297356 (and (= (size!15759 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15759 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15759 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494791 () Bool)

(declare-fun res!297357 () Bool)

(assert (=> b!494791 (=> res!297357 e!290324)))

(declare-fun lt!223982 () SeekEntryResult!3862)

(assert (=> b!494791 (= res!297357 (or (not (is-Intermediate!3862 lt!223982)) (not (undefined!4674 lt!223982))))))

(declare-fun b!494792 () Bool)

(declare-fun res!297359 () Bool)

(declare-fun e!290323 () Bool)

(assert (=> b!494792 (=> (not res!297359) (not e!290323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32021 (_ BitVec 32)) Bool)

(assert (=> b!494792 (= res!297359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494793 () Bool)

(declare-fun res!297364 () Bool)

(assert (=> b!494793 (=> (not res!297364) (not e!290323))))

(declare-datatypes ((List!9553 0))(
  ( (Nil!9550) (Cons!9549 (h!10417 (_ BitVec 64)) (t!15781 List!9553)) )
))
(declare-fun arrayNoDuplicates!0 (array!32021 (_ BitVec 32) List!9553) Bool)

(assert (=> b!494793 (= res!297364 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9550))))

(declare-fun b!494794 () Bool)

(assert (=> b!494794 (= e!290323 (not e!290324))))

(declare-fun res!297361 () Bool)

(assert (=> b!494794 (=> res!297361 e!290324)))

(declare-fun lt!223979 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32021 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!494794 (= res!297361 (= lt!223982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223979 (select (store (arr!15395 a!3235) i!1204 k!2280) j!176) (array!32022 (store (arr!15395 a!3235) i!1204 k!2280) (size!15759 a!3235)) mask!3524)))))

(declare-fun lt!223983 () (_ BitVec 32))

(assert (=> b!494794 (= lt!223982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223983 (select (arr!15395 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494794 (= lt!223979 (toIndex!0 (select (store (arr!15395 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494794 (= lt!223983 (toIndex!0 (select (arr!15395 a!3235) j!176) mask!3524))))

(assert (=> b!494794 (= lt!223980 (Found!3862 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32021 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!494794 (= lt!223980 (seekEntryOrOpen!0 (select (arr!15395 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494794 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14670 0))(
  ( (Unit!14671) )
))
(declare-fun lt!223984 () Unit!14670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14670)

(assert (=> b!494794 (= lt!223984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494795 () Bool)

(declare-fun res!297363 () Bool)

(assert (=> b!494795 (=> (not res!297363) (not e!290325))))

(declare-fun arrayContainsKey!0 (array!32021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494795 (= res!297363 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!297362 () Bool)

(assert (=> start!45076 (=> (not res!297362) (not e!290325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45076 (= res!297362 (validMask!0 mask!3524))))

(assert (=> start!45076 e!290325))

(assert (=> start!45076 true))

(declare-fun array_inv!11191 (array!32021) Bool)

(assert (=> start!45076 (array_inv!11191 a!3235)))

(declare-fun b!494790 () Bool)

(assert (=> b!494790 (= e!290325 e!290323)))

(declare-fun res!297360 () Bool)

(assert (=> b!494790 (=> (not res!297360) (not e!290323))))

(declare-fun lt!223981 () SeekEntryResult!3862)

(assert (=> b!494790 (= res!297360 (or (= lt!223981 (MissingZero!3862 i!1204)) (= lt!223981 (MissingVacant!3862 i!1204))))))

(assert (=> b!494790 (= lt!223981 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45076 res!297362) b!494789))

(assert (= (and b!494789 res!297356) b!494787))

(assert (= (and b!494787 res!297365) b!494786))

(assert (= (and b!494786 res!297358) b!494795))

(assert (= (and b!494795 res!297363) b!494790))

(assert (= (and b!494790 res!297360) b!494792))

(assert (= (and b!494792 res!297359) b!494793))

(assert (= (and b!494793 res!297364) b!494794))

(assert (= (and b!494794 (not res!297361)) b!494791))

(assert (= (and b!494791 (not res!297357)) b!494788))

(declare-fun m!475899 () Bool)

(assert (=> start!45076 m!475899))

(declare-fun m!475901 () Bool)

(assert (=> start!45076 m!475901))

(declare-fun m!475903 () Bool)

(assert (=> b!494792 m!475903))

(declare-fun m!475905 () Bool)

(assert (=> b!494793 m!475905))

(declare-fun m!475907 () Bool)

(assert (=> b!494794 m!475907))

(declare-fun m!475909 () Bool)

(assert (=> b!494794 m!475909))

(declare-fun m!475911 () Bool)

(assert (=> b!494794 m!475911))

(declare-fun m!475913 () Bool)

(assert (=> b!494794 m!475913))

(assert (=> b!494794 m!475907))

(declare-fun m!475915 () Bool)

(assert (=> b!494794 m!475915))

(declare-fun m!475917 () Bool)

(assert (=> b!494794 m!475917))

(assert (=> b!494794 m!475915))

(assert (=> b!494794 m!475915))

(declare-fun m!475919 () Bool)

(assert (=> b!494794 m!475919))

(assert (=> b!494794 m!475907))

(declare-fun m!475921 () Bool)

(assert (=> b!494794 m!475921))

(assert (=> b!494794 m!475915))

(declare-fun m!475923 () Bool)

(assert (=> b!494794 m!475923))

(declare-fun m!475925 () Bool)

(assert (=> b!494794 m!475925))

(declare-fun m!475927 () Bool)

(assert (=> b!494786 m!475927))

(declare-fun m!475929 () Bool)

(assert (=> b!494795 m!475929))

(declare-fun m!475931 () Bool)

(assert (=> b!494790 m!475931))

(assert (=> b!494787 m!475915))

(assert (=> b!494787 m!475915))

(declare-fun m!475933 () Bool)

(assert (=> b!494787 m!475933))

(push 1)

