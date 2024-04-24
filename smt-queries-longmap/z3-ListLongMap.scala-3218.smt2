; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45044 () Bool)

(assert start!45044)

(declare-fun res!297028 () Bool)

(declare-fun e!290153 () Bool)

(assert (=> start!45044 (=> (not res!297028) (not e!290153))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45044 (= res!297028 (validMask!0 mask!3524))))

(assert (=> start!45044 e!290153))

(assert (=> start!45044 true))

(declare-datatypes ((array!31990 0))(
  ( (array!31991 (arr!15379 (Array (_ BitVec 32) (_ BitVec 64))) (size!15743 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31990)

(declare-fun array_inv!11238 (array!31990) Bool)

(assert (=> start!45044 (array_inv!11238 a!3235)))

(declare-fun b!494395 () Bool)

(declare-fun res!297021 () Bool)

(assert (=> b!494395 (=> (not res!297021) (not e!290153))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494395 (= res!297021 (validKeyInArray!0 (select (arr!15379 a!3235) j!176)))))

(declare-fun b!494396 () Bool)

(declare-fun e!290151 () Bool)

(assert (=> b!494396 (= e!290153 e!290151)))

(declare-fun res!297026 () Bool)

(assert (=> b!494396 (=> (not res!297026) (not e!290151))))

(declare-datatypes ((SeekEntryResult!3802 0))(
  ( (MissingZero!3802 (index!17387 (_ BitVec 32))) (Found!3802 (index!17388 (_ BitVec 32))) (Intermediate!3802 (undefined!4614 Bool) (index!17389 (_ BitVec 32)) (x!46605 (_ BitVec 32))) (Undefined!3802) (MissingVacant!3802 (index!17390 (_ BitVec 32))) )
))
(declare-fun lt!223797 () SeekEntryResult!3802)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494396 (= res!297026 (or (= lt!223797 (MissingZero!3802 i!1204)) (= lt!223797 (MissingVacant!3802 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31990 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!494396 (= lt!223797 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494397 () Bool)

(declare-fun res!297022 () Bool)

(assert (=> b!494397 (=> (not res!297022) (not e!290151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31990 (_ BitVec 32)) Bool)

(assert (=> b!494397 (= res!297022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494398 () Bool)

(declare-fun res!297024 () Bool)

(declare-fun e!290154 () Bool)

(assert (=> b!494398 (=> res!297024 e!290154)))

(declare-fun lt!223794 () SeekEntryResult!3802)

(get-info :version)

(assert (=> b!494398 (= res!297024 (or (not ((_ is Intermediate!3802) lt!223794)) (not (undefined!4614 lt!223794))))))

(declare-fun b!494399 () Bool)

(assert (=> b!494399 (= e!290151 (not e!290154))))

(declare-fun res!297027 () Bool)

(assert (=> b!494399 (=> res!297027 e!290154)))

(declare-fun lt!223793 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31990 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!494399 (= res!297027 (= lt!223794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223793 (select (store (arr!15379 a!3235) i!1204 k0!2280) j!176) (array!31991 (store (arr!15379 a!3235) i!1204 k0!2280) (size!15743 a!3235)) mask!3524)))))

(declare-fun lt!223795 () (_ BitVec 32))

(assert (=> b!494399 (= lt!223794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223795 (select (arr!15379 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494399 (= lt!223793 (toIndex!0 (select (store (arr!15379 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494399 (= lt!223795 (toIndex!0 (select (arr!15379 a!3235) j!176) mask!3524))))

(declare-fun lt!223798 () SeekEntryResult!3802)

(assert (=> b!494399 (= lt!223798 (Found!3802 j!176))))

(assert (=> b!494399 (= lt!223798 (seekEntryOrOpen!0 (select (arr!15379 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494399 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14611 0))(
  ( (Unit!14612) )
))
(declare-fun lt!223796 () Unit!14611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14611)

(assert (=> b!494399 (= lt!223796 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494400 () Bool)

(declare-fun res!297023 () Bool)

(assert (=> b!494400 (=> (not res!297023) (not e!290153))))

(declare-fun arrayContainsKey!0 (array!31990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494400 (= res!297023 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494401 () Bool)

(declare-fun res!297020 () Bool)

(assert (=> b!494401 (=> (not res!297020) (not e!290153))))

(assert (=> b!494401 (= res!297020 (validKeyInArray!0 k0!2280))))

(declare-fun b!494402 () Bool)

(declare-fun res!297019 () Bool)

(assert (=> b!494402 (=> (not res!297019) (not e!290153))))

(assert (=> b!494402 (= res!297019 (and (= (size!15743 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15743 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15743 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494403 () Bool)

(declare-fun res!297025 () Bool)

(assert (=> b!494403 (=> (not res!297025) (not e!290151))))

(declare-datatypes ((List!9444 0))(
  ( (Nil!9441) (Cons!9440 (h!10308 (_ BitVec 64)) (t!15664 List!9444)) )
))
(declare-fun arrayNoDuplicates!0 (array!31990 (_ BitVec 32) List!9444) Bool)

(assert (=> b!494403 (= res!297025 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9441))))

(declare-fun b!494404 () Bool)

(assert (=> b!494404 (= e!290154 true)))

(assert (=> b!494404 (= lt!223798 Undefined!3802)))

(assert (= (and start!45044 res!297028) b!494402))

(assert (= (and b!494402 res!297019) b!494395))

(assert (= (and b!494395 res!297021) b!494401))

(assert (= (and b!494401 res!297020) b!494400))

(assert (= (and b!494400 res!297023) b!494396))

(assert (= (and b!494396 res!297026) b!494397))

(assert (= (and b!494397 res!297022) b!494403))

(assert (= (and b!494403 res!297025) b!494399))

(assert (= (and b!494399 (not res!297027)) b!494398))

(assert (= (and b!494398 (not res!297024)) b!494404))

(declare-fun m!475687 () Bool)

(assert (=> b!494397 m!475687))

(declare-fun m!475689 () Bool)

(assert (=> b!494399 m!475689))

(declare-fun m!475691 () Bool)

(assert (=> b!494399 m!475691))

(declare-fun m!475693 () Bool)

(assert (=> b!494399 m!475693))

(declare-fun m!475695 () Bool)

(assert (=> b!494399 m!475695))

(declare-fun m!475697 () Bool)

(assert (=> b!494399 m!475697))

(declare-fun m!475699 () Bool)

(assert (=> b!494399 m!475699))

(assert (=> b!494399 m!475689))

(assert (=> b!494399 m!475693))

(declare-fun m!475701 () Bool)

(assert (=> b!494399 m!475701))

(assert (=> b!494399 m!475693))

(declare-fun m!475703 () Bool)

(assert (=> b!494399 m!475703))

(assert (=> b!494399 m!475693))

(declare-fun m!475705 () Bool)

(assert (=> b!494399 m!475705))

(assert (=> b!494399 m!475689))

(declare-fun m!475707 () Bool)

(assert (=> b!494399 m!475707))

(declare-fun m!475709 () Bool)

(assert (=> b!494403 m!475709))

(declare-fun m!475711 () Bool)

(assert (=> b!494401 m!475711))

(declare-fun m!475713 () Bool)

(assert (=> b!494396 m!475713))

(declare-fun m!475715 () Bool)

(assert (=> b!494400 m!475715))

(assert (=> b!494395 m!475693))

(assert (=> b!494395 m!475693))

(declare-fun m!475717 () Bool)

(assert (=> b!494395 m!475717))

(declare-fun m!475719 () Bool)

(assert (=> start!45044 m!475719))

(declare-fun m!475721 () Bool)

(assert (=> start!45044 m!475721))

(check-sat (not b!494400) (not b!494399) (not b!494401) (not b!494396) (not b!494397) (not b!494395) (not start!45044) (not b!494403))
(check-sat)
