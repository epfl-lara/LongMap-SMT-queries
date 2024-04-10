; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45072 () Bool)

(assert start!45072)

(declare-fun b!494726 () Bool)

(declare-fun res!297300 () Bool)

(declare-fun e!290299 () Bool)

(assert (=> b!494726 (=> (not res!297300) (not e!290299))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32017 0))(
  ( (array!32018 (arr!15393 (Array (_ BitVec 32) (_ BitVec 64))) (size!15757 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32017)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494726 (= res!297300 (and (= (size!15757 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15757 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15757 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494727 () Bool)

(declare-fun res!297305 () Bool)

(assert (=> b!494727 (=> (not res!297305) (not e!290299))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494727 (= res!297305 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494728 () Bool)

(declare-fun res!297296 () Bool)

(declare-fun e!290300 () Bool)

(assert (=> b!494728 (=> (not res!297296) (not e!290300))))

(declare-datatypes ((List!9551 0))(
  ( (Nil!9548) (Cons!9547 (h!10415 (_ BitVec 64)) (t!15779 List!9551)) )
))
(declare-fun arrayNoDuplicates!0 (array!32017 (_ BitVec 32) List!9551) Bool)

(assert (=> b!494728 (= res!297296 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9548))))

(declare-fun b!494729 () Bool)

(declare-fun e!290298 () Bool)

(assert (=> b!494729 (= e!290298 true)))

(declare-datatypes ((SeekEntryResult!3860 0))(
  ( (MissingZero!3860 (index!17619 (_ BitVec 32))) (Found!3860 (index!17620 (_ BitVec 32))) (Intermediate!3860 (undefined!4672 Bool) (index!17621 (_ BitVec 32)) (x!46690 (_ BitVec 32))) (Undefined!3860) (MissingVacant!3860 (index!17622 (_ BitVec 32))) )
))
(declare-fun lt!223947 () SeekEntryResult!3860)

(assert (=> b!494729 (= lt!223947 Undefined!3860)))

(declare-fun b!494730 () Bool)

(declare-fun res!297303 () Bool)

(assert (=> b!494730 (=> (not res!297303) (not e!290299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494730 (= res!297303 (validKeyInArray!0 (select (arr!15393 a!3235) j!176)))))

(declare-fun b!494731 () Bool)

(declare-fun res!297298 () Bool)

(assert (=> b!494731 (=> (not res!297298) (not e!290299))))

(assert (=> b!494731 (= res!297298 (validKeyInArray!0 k!2280))))

(declare-fun res!297302 () Bool)

(assert (=> start!45072 (=> (not res!297302) (not e!290299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45072 (= res!297302 (validMask!0 mask!3524))))

(assert (=> start!45072 e!290299))

(assert (=> start!45072 true))

(declare-fun array_inv!11189 (array!32017) Bool)

(assert (=> start!45072 (array_inv!11189 a!3235)))

(declare-fun b!494732 () Bool)

(declare-fun res!297299 () Bool)

(assert (=> b!494732 (=> (not res!297299) (not e!290300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32017 (_ BitVec 32)) Bool)

(assert (=> b!494732 (= res!297299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494733 () Bool)

(declare-fun res!297297 () Bool)

(assert (=> b!494733 (=> res!297297 e!290298)))

(declare-fun lt!223945 () SeekEntryResult!3860)

(assert (=> b!494733 (= res!297297 (or (not (is-Intermediate!3860 lt!223945)) (not (undefined!4672 lt!223945))))))

(declare-fun b!494734 () Bool)

(assert (=> b!494734 (= e!290300 (not e!290298))))

(declare-fun res!297301 () Bool)

(assert (=> b!494734 (=> res!297301 e!290298)))

(declare-fun lt!223948 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32017 (_ BitVec 32)) SeekEntryResult!3860)

(assert (=> b!494734 (= res!297301 (= lt!223945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223948 (select (store (arr!15393 a!3235) i!1204 k!2280) j!176) (array!32018 (store (arr!15393 a!3235) i!1204 k!2280) (size!15757 a!3235)) mask!3524)))))

(declare-fun lt!223944 () (_ BitVec 32))

(assert (=> b!494734 (= lt!223945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223944 (select (arr!15393 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494734 (= lt!223948 (toIndex!0 (select (store (arr!15393 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494734 (= lt!223944 (toIndex!0 (select (arr!15393 a!3235) j!176) mask!3524))))

(assert (=> b!494734 (= lt!223947 (Found!3860 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32017 (_ BitVec 32)) SeekEntryResult!3860)

(assert (=> b!494734 (= lt!223947 (seekEntryOrOpen!0 (select (arr!15393 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494734 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14666 0))(
  ( (Unit!14667) )
))
(declare-fun lt!223946 () Unit!14666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14666)

(assert (=> b!494734 (= lt!223946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494735 () Bool)

(assert (=> b!494735 (= e!290299 e!290300)))

(declare-fun res!297304 () Bool)

(assert (=> b!494735 (=> (not res!297304) (not e!290300))))

(declare-fun lt!223943 () SeekEntryResult!3860)

(assert (=> b!494735 (= res!297304 (or (= lt!223943 (MissingZero!3860 i!1204)) (= lt!223943 (MissingVacant!3860 i!1204))))))

(assert (=> b!494735 (= lt!223943 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45072 res!297302) b!494726))

(assert (= (and b!494726 res!297300) b!494730))

(assert (= (and b!494730 res!297303) b!494731))

(assert (= (and b!494731 res!297298) b!494727))

(assert (= (and b!494727 res!297305) b!494735))

(assert (= (and b!494735 res!297304) b!494732))

(assert (= (and b!494732 res!297299) b!494728))

(assert (= (and b!494728 res!297296) b!494734))

(assert (= (and b!494734 (not res!297301)) b!494733))

(assert (= (and b!494733 (not res!297297)) b!494729))

(declare-fun m!475827 () Bool)

(assert (=> b!494734 m!475827))

(declare-fun m!475829 () Bool)

(assert (=> b!494734 m!475829))

(declare-fun m!475831 () Bool)

(assert (=> b!494734 m!475831))

(assert (=> b!494734 m!475827))

(declare-fun m!475833 () Bool)

(assert (=> b!494734 m!475833))

(declare-fun m!475835 () Bool)

(assert (=> b!494734 m!475835))

(assert (=> b!494734 m!475833))

(declare-fun m!475837 () Bool)

(assert (=> b!494734 m!475837))

(assert (=> b!494734 m!475833))

(declare-fun m!475839 () Bool)

(assert (=> b!494734 m!475839))

(assert (=> b!494734 m!475827))

(declare-fun m!475841 () Bool)

(assert (=> b!494734 m!475841))

(assert (=> b!494734 m!475833))

(declare-fun m!475843 () Bool)

(assert (=> b!494734 m!475843))

(declare-fun m!475845 () Bool)

(assert (=> b!494734 m!475845))

(declare-fun m!475847 () Bool)

(assert (=> b!494727 m!475847))

(declare-fun m!475849 () Bool)

(assert (=> b!494728 m!475849))

(declare-fun m!475851 () Bool)

(assert (=> b!494732 m!475851))

(declare-fun m!475853 () Bool)

(assert (=> b!494731 m!475853))

(assert (=> b!494730 m!475833))

(assert (=> b!494730 m!475833))

(declare-fun m!475855 () Bool)

(assert (=> b!494730 m!475855))

(declare-fun m!475857 () Bool)

(assert (=> b!494735 m!475857))

(declare-fun m!475859 () Bool)

(assert (=> start!45072 m!475859))

(declare-fun m!475861 () Bool)

(assert (=> start!45072 m!475861))

(push 1)

