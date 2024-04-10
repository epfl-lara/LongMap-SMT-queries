; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45958 () Bool)

(assert start!45958)

(declare-fun b!508731 () Bool)

(declare-fun e!297608 () Bool)

(declare-fun e!297609 () Bool)

(assert (=> b!508731 (= e!297608 e!297609)))

(declare-fun res!309576 () Bool)

(assert (=> b!508731 (=> (not res!309576) (not e!297609))))

(declare-datatypes ((SeekEntryResult!4180 0))(
  ( (MissingZero!4180 (index!18908 (_ BitVec 32))) (Found!4180 (index!18909 (_ BitVec 32))) (Intermediate!4180 (undefined!4992 Bool) (index!18910 (_ BitVec 32)) (x!47885 (_ BitVec 32))) (Undefined!4180) (MissingVacant!4180 (index!18911 (_ BitVec 32))) )
))
(declare-fun lt!232339 () SeekEntryResult!4180)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508731 (= res!309576 (or (= lt!232339 (MissingZero!4180 i!1204)) (= lt!232339 (MissingVacant!4180 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!32669 0))(
  ( (array!32670 (arr!15713 (Array (_ BitVec 32) (_ BitVec 64))) (size!16077 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32669)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32669 (_ BitVec 32)) SeekEntryResult!4180)

(assert (=> b!508731 (= lt!232339 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508732 () Bool)

(declare-fun res!309582 () Bool)

(assert (=> b!508732 (=> (not res!309582) (not e!297608))))

(declare-fun arrayContainsKey!0 (array!32669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508732 (= res!309582 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508733 () Bool)

(declare-fun e!297606 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508733 (= e!297606 (= (seekEntryOrOpen!0 (select (arr!15713 a!3235) j!176) a!3235 mask!3524) (Found!4180 j!176)))))

(declare-fun b!508734 () Bool)

(declare-fun res!309580 () Bool)

(assert (=> b!508734 (=> (not res!309580) (not e!297608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508734 (= res!309580 (validKeyInArray!0 (select (arr!15713 a!3235) j!176)))))

(declare-fun b!508735 () Bool)

(declare-fun res!309579 () Bool)

(assert (=> b!508735 (=> (not res!309579) (not e!297609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32669 (_ BitVec 32)) Bool)

(assert (=> b!508735 (= res!309579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508736 () Bool)

(assert (=> b!508736 (= e!297609 (not true))))

(assert (=> b!508736 e!297606))

(declare-fun res!309581 () Bool)

(assert (=> b!508736 (=> (not res!309581) (not e!297606))))

(assert (=> b!508736 (= res!309581 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15618 0))(
  ( (Unit!15619) )
))
(declare-fun lt!232338 () Unit!15618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15618)

(assert (=> b!508736 (= lt!232338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508737 () Bool)

(declare-fun res!309577 () Bool)

(assert (=> b!508737 (=> (not res!309577) (not e!297608))))

(assert (=> b!508737 (= res!309577 (validKeyInArray!0 k!2280))))

(declare-fun res!309583 () Bool)

(assert (=> start!45958 (=> (not res!309583) (not e!297608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45958 (= res!309583 (validMask!0 mask!3524))))

(assert (=> start!45958 e!297608))

(assert (=> start!45958 true))

(declare-fun array_inv!11509 (array!32669) Bool)

(assert (=> start!45958 (array_inv!11509 a!3235)))

(declare-fun b!508738 () Bool)

(declare-fun res!309584 () Bool)

(assert (=> b!508738 (=> (not res!309584) (not e!297608))))

(assert (=> b!508738 (= res!309584 (and (= (size!16077 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16077 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16077 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508739 () Bool)

(declare-fun res!309578 () Bool)

(assert (=> b!508739 (=> (not res!309578) (not e!297609))))

(declare-datatypes ((List!9871 0))(
  ( (Nil!9868) (Cons!9867 (h!10744 (_ BitVec 64)) (t!16099 List!9871)) )
))
(declare-fun arrayNoDuplicates!0 (array!32669 (_ BitVec 32) List!9871) Bool)

(assert (=> b!508739 (= res!309578 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9868))))

(assert (= (and start!45958 res!309583) b!508738))

(assert (= (and b!508738 res!309584) b!508734))

(assert (= (and b!508734 res!309580) b!508737))

(assert (= (and b!508737 res!309577) b!508732))

(assert (= (and b!508732 res!309582) b!508731))

(assert (= (and b!508731 res!309576) b!508735))

(assert (= (and b!508735 res!309579) b!508739))

(assert (= (and b!508739 res!309578) b!508736))

(assert (= (and b!508736 res!309581) b!508733))

(declare-fun m!489477 () Bool)

(assert (=> b!508732 m!489477))

(declare-fun m!489479 () Bool)

(assert (=> b!508734 m!489479))

(assert (=> b!508734 m!489479))

(declare-fun m!489481 () Bool)

(assert (=> b!508734 m!489481))

(declare-fun m!489483 () Bool)

(assert (=> b!508739 m!489483))

(declare-fun m!489485 () Bool)

(assert (=> start!45958 m!489485))

(declare-fun m!489487 () Bool)

(assert (=> start!45958 m!489487))

(declare-fun m!489489 () Bool)

(assert (=> b!508737 m!489489))

(declare-fun m!489491 () Bool)

(assert (=> b!508735 m!489491))

(declare-fun m!489493 () Bool)

(assert (=> b!508736 m!489493))

(declare-fun m!489495 () Bool)

(assert (=> b!508736 m!489495))

(declare-fun m!489497 () Bool)

(assert (=> b!508731 m!489497))

(assert (=> b!508733 m!489479))

(assert (=> b!508733 m!489479))

(declare-fun m!489499 () Bool)

(assert (=> b!508733 m!489499))

(push 1)

(assert (not b!508733))

(assert (not b!508731))

(assert (not b!508732))

(assert (not b!508739))

(assert (not b!508734))

(assert (not b!508736))

(assert (not b!508737))

(assert (not b!508735))

(assert (not start!45958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

