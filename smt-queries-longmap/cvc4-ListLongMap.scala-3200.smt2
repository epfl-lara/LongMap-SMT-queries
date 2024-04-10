; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44950 () Bool)

(assert start!44950)

(declare-fun b!492933 () Bool)

(declare-fun res!295509 () Bool)

(declare-fun e!289557 () Bool)

(assert (=> b!492933 (=> (not res!295509) (not e!289557))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492933 (= res!295509 (validKeyInArray!0 k!2280))))

(declare-fun b!492934 () Bool)

(declare-fun res!295505 () Bool)

(assert (=> b!492934 (=> (not res!295505) (not e!289557))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31895 0))(
  ( (array!31896 (arr!15332 (Array (_ BitVec 32) (_ BitVec 64))) (size!15696 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31895)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!492934 (= res!295505 (and (= (size!15696 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15696 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15696 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492935 () Bool)

(declare-fun res!295506 () Bool)

(assert (=> b!492935 (=> (not res!295506) (not e!289557))))

(declare-fun arrayContainsKey!0 (array!31895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492935 (= res!295506 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492936 () Bool)

(declare-fun e!289558 () Bool)

(declare-datatypes ((SeekEntryResult!3799 0))(
  ( (MissingZero!3799 (index!17375 (_ BitVec 32))) (Found!3799 (index!17376 (_ BitVec 32))) (Intermediate!3799 (undefined!4611 Bool) (index!17377 (_ BitVec 32)) (x!46461 (_ BitVec 32))) (Undefined!3799) (MissingVacant!3799 (index!17378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31895 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!492936 (= e!289558 (= (seekEntryOrOpen!0 (select (arr!15332 a!3235) j!176) a!3235 mask!3524) (Found!3799 j!176)))))

(declare-fun res!295503 () Bool)

(assert (=> start!44950 (=> (not res!295503) (not e!289557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44950 (= res!295503 (validMask!0 mask!3524))))

(assert (=> start!44950 e!289557))

(assert (=> start!44950 true))

(declare-fun array_inv!11128 (array!31895) Bool)

(assert (=> start!44950 (array_inv!11128 a!3235)))

(declare-fun b!492937 () Bool)

(declare-fun res!295507 () Bool)

(declare-fun e!289560 () Bool)

(assert (=> b!492937 (=> (not res!295507) (not e!289560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31895 (_ BitVec 32)) Bool)

(assert (=> b!492937 (= res!295507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492938 () Bool)

(declare-fun res!295504 () Bool)

(assert (=> b!492938 (=> (not res!295504) (not e!289557))))

(assert (=> b!492938 (= res!295504 (validKeyInArray!0 (select (arr!15332 a!3235) j!176)))))

(declare-fun b!492939 () Bool)

(assert (=> b!492939 (= e!289560 (not true))))

(declare-fun lt!222857 () SeekEntryResult!3799)

(declare-fun lt!222855 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31895 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!492939 (= lt!222857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222855 (select (store (arr!15332 a!3235) i!1204 k!2280) j!176) (array!31896 (store (arr!15332 a!3235) i!1204 k!2280) (size!15696 a!3235)) mask!3524))))

(declare-fun lt!222859 () SeekEntryResult!3799)

(declare-fun lt!222858 () (_ BitVec 32))

(assert (=> b!492939 (= lt!222859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222858 (select (arr!15332 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492939 (= lt!222855 (toIndex!0 (select (store (arr!15332 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492939 (= lt!222858 (toIndex!0 (select (arr!15332 a!3235) j!176) mask!3524))))

(assert (=> b!492939 e!289558))

(declare-fun res!295510 () Bool)

(assert (=> b!492939 (=> (not res!295510) (not e!289558))))

(assert (=> b!492939 (= res!295510 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14544 0))(
  ( (Unit!14545) )
))
(declare-fun lt!222856 () Unit!14544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14544)

(assert (=> b!492939 (= lt!222856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492940 () Bool)

(declare-fun res!295511 () Bool)

(assert (=> b!492940 (=> (not res!295511) (not e!289560))))

(declare-datatypes ((List!9490 0))(
  ( (Nil!9487) (Cons!9486 (h!10354 (_ BitVec 64)) (t!15718 List!9490)) )
))
(declare-fun arrayNoDuplicates!0 (array!31895 (_ BitVec 32) List!9490) Bool)

(assert (=> b!492940 (= res!295511 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9487))))

(declare-fun b!492941 () Bool)

(assert (=> b!492941 (= e!289557 e!289560)))

(declare-fun res!295508 () Bool)

(assert (=> b!492941 (=> (not res!295508) (not e!289560))))

(declare-fun lt!222854 () SeekEntryResult!3799)

(assert (=> b!492941 (= res!295508 (or (= lt!222854 (MissingZero!3799 i!1204)) (= lt!222854 (MissingVacant!3799 i!1204))))))

(assert (=> b!492941 (= lt!222854 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44950 res!295503) b!492934))

(assert (= (and b!492934 res!295505) b!492938))

(assert (= (and b!492938 res!295504) b!492933))

(assert (= (and b!492933 res!295509) b!492935))

(assert (= (and b!492935 res!295506) b!492941))

(assert (= (and b!492941 res!295508) b!492937))

(assert (= (and b!492937 res!295507) b!492940))

(assert (= (and b!492940 res!295511) b!492939))

(assert (= (and b!492939 res!295510) b!492936))

(declare-fun m!473631 () Bool)

(assert (=> b!492936 m!473631))

(assert (=> b!492936 m!473631))

(declare-fun m!473633 () Bool)

(assert (=> b!492936 m!473633))

(declare-fun m!473635 () Bool)

(assert (=> b!492940 m!473635))

(declare-fun m!473637 () Bool)

(assert (=> start!44950 m!473637))

(declare-fun m!473639 () Bool)

(assert (=> start!44950 m!473639))

(assert (=> b!492939 m!473631))

(declare-fun m!473641 () Bool)

(assert (=> b!492939 m!473641))

(declare-fun m!473643 () Bool)

(assert (=> b!492939 m!473643))

(declare-fun m!473645 () Bool)

(assert (=> b!492939 m!473645))

(declare-fun m!473647 () Bool)

(assert (=> b!492939 m!473647))

(assert (=> b!492939 m!473647))

(declare-fun m!473649 () Bool)

(assert (=> b!492939 m!473649))

(assert (=> b!492939 m!473631))

(declare-fun m!473651 () Bool)

(assert (=> b!492939 m!473651))

(assert (=> b!492939 m!473631))

(declare-fun m!473653 () Bool)

(assert (=> b!492939 m!473653))

(assert (=> b!492939 m!473647))

(declare-fun m!473655 () Bool)

(assert (=> b!492939 m!473655))

(declare-fun m!473657 () Bool)

(assert (=> b!492941 m!473657))

(declare-fun m!473659 () Bool)

(assert (=> b!492937 m!473659))

(declare-fun m!473661 () Bool)

(assert (=> b!492935 m!473661))

(assert (=> b!492938 m!473631))

(assert (=> b!492938 m!473631))

(declare-fun m!473663 () Bool)

(assert (=> b!492938 m!473663))

(declare-fun m!473665 () Bool)

(assert (=> b!492933 m!473665))

(push 1)

