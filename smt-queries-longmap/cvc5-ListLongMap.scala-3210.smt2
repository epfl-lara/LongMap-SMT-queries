; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45006 () Bool)

(assert start!45006)

(declare-fun b!493736 () Bool)

(declare-fun res!296315 () Bool)

(declare-fun e!289903 () Bool)

(assert (=> b!493736 (=> (not res!296315) (not e!289903))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31951 0))(
  ( (array!31952 (arr!15360 (Array (_ BitVec 32) (_ BitVec 64))) (size!15724 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31951)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493736 (= res!296315 (and (= (size!15724 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15724 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15724 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493737 () Bool)

(declare-fun res!296306 () Bool)

(declare-fun e!289905 () Bool)

(assert (=> b!493737 (=> (not res!296306) (not e!289905))))

(declare-datatypes ((List!9518 0))(
  ( (Nil!9515) (Cons!9514 (h!10382 (_ BitVec 64)) (t!15746 List!9518)) )
))
(declare-fun arrayNoDuplicates!0 (array!31951 (_ BitVec 32) List!9518) Bool)

(assert (=> b!493737 (= res!296306 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9515))))

(declare-fun res!296307 () Bool)

(assert (=> start!45006 (=> (not res!296307) (not e!289903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45006 (= res!296307 (validMask!0 mask!3524))))

(assert (=> start!45006 e!289903))

(assert (=> start!45006 true))

(declare-fun array_inv!11156 (array!31951) Bool)

(assert (=> start!45006 (array_inv!11156 a!3235)))

(declare-fun b!493738 () Bool)

(declare-fun e!289902 () Bool)

(assert (=> b!493738 (= e!289902 true)))

(declare-datatypes ((SeekEntryResult!3827 0))(
  ( (MissingZero!3827 (index!17487 (_ BitVec 32))) (Found!3827 (index!17488 (_ BitVec 32))) (Intermediate!3827 (undefined!4639 Bool) (index!17489 (_ BitVec 32)) (x!46569 (_ BitVec 32))) (Undefined!3827) (MissingVacant!3827 (index!17490 (_ BitVec 32))) )
))
(declare-fun lt!223350 () SeekEntryResult!3827)

(assert (=> b!493738 (= lt!223350 Undefined!3827)))

(declare-fun b!493739 () Bool)

(declare-fun res!296310 () Bool)

(assert (=> b!493739 (=> (not res!296310) (not e!289905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31951 (_ BitVec 32)) Bool)

(assert (=> b!493739 (= res!296310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493740 () Bool)

(declare-fun res!296312 () Bool)

(assert (=> b!493740 (=> (not res!296312) (not e!289903))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493740 (= res!296312 (validKeyInArray!0 k!2280))))

(declare-fun b!493741 () Bool)

(assert (=> b!493741 (= e!289903 e!289905)))

(declare-fun res!296313 () Bool)

(assert (=> b!493741 (=> (not res!296313) (not e!289905))))

(declare-fun lt!223349 () SeekEntryResult!3827)

(assert (=> b!493741 (= res!296313 (or (= lt!223349 (MissingZero!3827 i!1204)) (= lt!223349 (MissingVacant!3827 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31951 (_ BitVec 32)) SeekEntryResult!3827)

(assert (=> b!493741 (= lt!223349 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493742 () Bool)

(declare-fun res!296309 () Bool)

(assert (=> b!493742 (=> (not res!296309) (not e!289903))))

(declare-fun arrayContainsKey!0 (array!31951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493742 (= res!296309 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493743 () Bool)

(assert (=> b!493743 (= e!289905 (not e!289902))))

(declare-fun res!296314 () Bool)

(assert (=> b!493743 (=> res!296314 e!289902)))

(declare-fun lt!223354 () SeekEntryResult!3827)

(declare-fun lt!223353 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31951 (_ BitVec 32)) SeekEntryResult!3827)

(assert (=> b!493743 (= res!296314 (= lt!223354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223353 (select (store (arr!15360 a!3235) i!1204 k!2280) j!176) (array!31952 (store (arr!15360 a!3235) i!1204 k!2280) (size!15724 a!3235)) mask!3524)))))

(declare-fun lt!223352 () (_ BitVec 32))

(assert (=> b!493743 (= lt!223354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223352 (select (arr!15360 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493743 (= lt!223353 (toIndex!0 (select (store (arr!15360 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493743 (= lt!223352 (toIndex!0 (select (arr!15360 a!3235) j!176) mask!3524))))

(assert (=> b!493743 (= lt!223350 (Found!3827 j!176))))

(assert (=> b!493743 (= lt!223350 (seekEntryOrOpen!0 (select (arr!15360 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493743 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14600 0))(
  ( (Unit!14601) )
))
(declare-fun lt!223351 () Unit!14600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14600)

(assert (=> b!493743 (= lt!223351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493744 () Bool)

(declare-fun res!296308 () Bool)

(assert (=> b!493744 (=> (not res!296308) (not e!289903))))

(assert (=> b!493744 (= res!296308 (validKeyInArray!0 (select (arr!15360 a!3235) j!176)))))

(declare-fun b!493745 () Bool)

(declare-fun res!296311 () Bool)

(assert (=> b!493745 (=> res!296311 e!289902)))

(assert (=> b!493745 (= res!296311 (or (not (is-Intermediate!3827 lt!223354)) (not (undefined!4639 lt!223354))))))

(assert (= (and start!45006 res!296307) b!493736))

(assert (= (and b!493736 res!296315) b!493744))

(assert (= (and b!493744 res!296308) b!493740))

(assert (= (and b!493740 res!296312) b!493742))

(assert (= (and b!493742 res!296309) b!493741))

(assert (= (and b!493741 res!296313) b!493739))

(assert (= (and b!493739 res!296310) b!493737))

(assert (= (and b!493737 res!296306) b!493743))

(assert (= (and b!493743 (not res!296314)) b!493745))

(assert (= (and b!493745 (not res!296311)) b!493738))

(declare-fun m!474639 () Bool)

(assert (=> b!493743 m!474639))

(declare-fun m!474641 () Bool)

(assert (=> b!493743 m!474641))

(declare-fun m!474643 () Bool)

(assert (=> b!493743 m!474643))

(assert (=> b!493743 m!474643))

(declare-fun m!474645 () Bool)

(assert (=> b!493743 m!474645))

(declare-fun m!474647 () Bool)

(assert (=> b!493743 m!474647))

(declare-fun m!474649 () Bool)

(assert (=> b!493743 m!474649))

(assert (=> b!493743 m!474647))

(declare-fun m!474651 () Bool)

(assert (=> b!493743 m!474651))

(assert (=> b!493743 m!474647))

(declare-fun m!474653 () Bool)

(assert (=> b!493743 m!474653))

(assert (=> b!493743 m!474643))

(declare-fun m!474655 () Bool)

(assert (=> b!493743 m!474655))

(assert (=> b!493743 m!474647))

(declare-fun m!474657 () Bool)

(assert (=> b!493743 m!474657))

(declare-fun m!474659 () Bool)

(assert (=> b!493740 m!474659))

(declare-fun m!474661 () Bool)

(assert (=> b!493741 m!474661))

(declare-fun m!474663 () Bool)

(assert (=> start!45006 m!474663))

(declare-fun m!474665 () Bool)

(assert (=> start!45006 m!474665))

(declare-fun m!474667 () Bool)

(assert (=> b!493742 m!474667))

(declare-fun m!474669 () Bool)

(assert (=> b!493737 m!474669))

(assert (=> b!493744 m!474647))

(assert (=> b!493744 m!474647))

(declare-fun m!474671 () Bool)

(assert (=> b!493744 m!474671))

(declare-fun m!474673 () Bool)

(assert (=> b!493739 m!474673))

(push 1)

