; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45054 () Bool)

(assert start!45054)

(declare-fun b!494456 () Bool)

(declare-fun res!297035 () Bool)

(declare-fun e!290191 () Bool)

(assert (=> b!494456 (=> res!297035 e!290191)))

(declare-datatypes ((SeekEntryResult!3851 0))(
  ( (MissingZero!3851 (index!17583 (_ BitVec 32))) (Found!3851 (index!17584 (_ BitVec 32))) (Intermediate!3851 (undefined!4663 Bool) (index!17585 (_ BitVec 32)) (x!46657 (_ BitVec 32))) (Undefined!3851) (MissingVacant!3851 (index!17586 (_ BitVec 32))) )
))
(declare-fun lt!223781 () SeekEntryResult!3851)

(assert (=> b!494456 (= res!297035 (or (not (is-Intermediate!3851 lt!223781)) (not (undefined!4663 lt!223781))))))

(declare-fun b!494457 () Bool)

(declare-fun res!297033 () Bool)

(declare-fun e!290190 () Bool)

(assert (=> b!494457 (=> (not res!297033) (not e!290190))))

(declare-datatypes ((array!31999 0))(
  ( (array!32000 (arr!15384 (Array (_ BitVec 32) (_ BitVec 64))) (size!15748 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31999)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31999 (_ BitVec 32)) Bool)

(assert (=> b!494457 (= res!297033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494458 () Bool)

(declare-fun res!297029 () Bool)

(assert (=> b!494458 (=> (not res!297029) (not e!290190))))

(declare-datatypes ((List!9542 0))(
  ( (Nil!9539) (Cons!9538 (h!10406 (_ BitVec 64)) (t!15770 List!9542)) )
))
(declare-fun arrayNoDuplicates!0 (array!31999 (_ BitVec 32) List!9542) Bool)

(assert (=> b!494458 (= res!297029 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9539))))

(declare-fun res!297026 () Bool)

(declare-fun e!290193 () Bool)

(assert (=> start!45054 (=> (not res!297026) (not e!290193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45054 (= res!297026 (validMask!0 mask!3524))))

(assert (=> start!45054 e!290193))

(assert (=> start!45054 true))

(declare-fun array_inv!11180 (array!31999) Bool)

(assert (=> start!45054 (array_inv!11180 a!3235)))

(declare-fun b!494459 () Bool)

(declare-fun res!297031 () Bool)

(assert (=> b!494459 (=> (not res!297031) (not e!290193))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494459 (= res!297031 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494460 () Bool)

(assert (=> b!494460 (= e!290191 true)))

(declare-fun lt!223784 () SeekEntryResult!3851)

(assert (=> b!494460 (= lt!223784 Undefined!3851)))

(declare-fun b!494461 () Bool)

(declare-fun res!297027 () Bool)

(assert (=> b!494461 (=> (not res!297027) (not e!290193))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494461 (= res!297027 (and (= (size!15748 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15748 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15748 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494462 () Bool)

(assert (=> b!494462 (= e!290190 (not e!290191))))

(declare-fun res!297030 () Bool)

(assert (=> b!494462 (=> res!297030 e!290191)))

(declare-fun lt!223782 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31999 (_ BitVec 32)) SeekEntryResult!3851)

(assert (=> b!494462 (= res!297030 (= lt!223781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223782 (select (store (arr!15384 a!3235) i!1204 k!2280) j!176) (array!32000 (store (arr!15384 a!3235) i!1204 k!2280) (size!15748 a!3235)) mask!3524)))))

(declare-fun lt!223785 () (_ BitVec 32))

(assert (=> b!494462 (= lt!223781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223785 (select (arr!15384 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494462 (= lt!223782 (toIndex!0 (select (store (arr!15384 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494462 (= lt!223785 (toIndex!0 (select (arr!15384 a!3235) j!176) mask!3524))))

(assert (=> b!494462 (= lt!223784 (Found!3851 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31999 (_ BitVec 32)) SeekEntryResult!3851)

(assert (=> b!494462 (= lt!223784 (seekEntryOrOpen!0 (select (arr!15384 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494462 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14648 0))(
  ( (Unit!14649) )
))
(declare-fun lt!223783 () Unit!14648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14648)

(assert (=> b!494462 (= lt!223783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494463 () Bool)

(declare-fun res!297032 () Bool)

(assert (=> b!494463 (=> (not res!297032) (not e!290193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494463 (= res!297032 (validKeyInArray!0 k!2280))))

(declare-fun b!494464 () Bool)

(declare-fun res!297028 () Bool)

(assert (=> b!494464 (=> (not res!297028) (not e!290193))))

(assert (=> b!494464 (= res!297028 (validKeyInArray!0 (select (arr!15384 a!3235) j!176)))))

(declare-fun b!494465 () Bool)

(assert (=> b!494465 (= e!290193 e!290190)))

(declare-fun res!297034 () Bool)

(assert (=> b!494465 (=> (not res!297034) (not e!290190))))

(declare-fun lt!223786 () SeekEntryResult!3851)

(assert (=> b!494465 (= res!297034 (or (= lt!223786 (MissingZero!3851 i!1204)) (= lt!223786 (MissingVacant!3851 i!1204))))))

(assert (=> b!494465 (= lt!223786 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45054 res!297026) b!494461))

(assert (= (and b!494461 res!297027) b!494464))

(assert (= (and b!494464 res!297028) b!494463))

(assert (= (and b!494463 res!297032) b!494459))

(assert (= (and b!494459 res!297031) b!494465))

(assert (= (and b!494465 res!297034) b!494457))

(assert (= (and b!494457 res!297033) b!494458))

(assert (= (and b!494458 res!297029) b!494462))

(assert (= (and b!494462 (not res!297030)) b!494456))

(assert (= (and b!494456 (not res!297035)) b!494460))

(declare-fun m!475503 () Bool)

(assert (=> b!494464 m!475503))

(assert (=> b!494464 m!475503))

(declare-fun m!475505 () Bool)

(assert (=> b!494464 m!475505))

(declare-fun m!475507 () Bool)

(assert (=> b!494458 m!475507))

(declare-fun m!475509 () Bool)

(assert (=> b!494457 m!475509))

(declare-fun m!475511 () Bool)

(assert (=> b!494463 m!475511))

(declare-fun m!475513 () Bool)

(assert (=> b!494465 m!475513))

(declare-fun m!475515 () Bool)

(assert (=> b!494459 m!475515))

(declare-fun m!475517 () Bool)

(assert (=> start!45054 m!475517))

(declare-fun m!475519 () Bool)

(assert (=> start!45054 m!475519))

(declare-fun m!475521 () Bool)

(assert (=> b!494462 m!475521))

(assert (=> b!494462 m!475503))

(declare-fun m!475523 () Bool)

(assert (=> b!494462 m!475523))

(assert (=> b!494462 m!475503))

(declare-fun m!475525 () Bool)

(assert (=> b!494462 m!475525))

(assert (=> b!494462 m!475503))

(declare-fun m!475527 () Bool)

(assert (=> b!494462 m!475527))

(assert (=> b!494462 m!475521))

(declare-fun m!475529 () Bool)

(assert (=> b!494462 m!475529))

(declare-fun m!475531 () Bool)

(assert (=> b!494462 m!475531))

(assert (=> b!494462 m!475521))

(declare-fun m!475533 () Bool)

(assert (=> b!494462 m!475533))

(declare-fun m!475535 () Bool)

(assert (=> b!494462 m!475535))

(assert (=> b!494462 m!475503))

(declare-fun m!475537 () Bool)

(assert (=> b!494462 m!475537))

(push 1)

