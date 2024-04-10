; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44532 () Bool)

(assert start!44532)

(declare-fun b!488811 () Bool)

(declare-fun res!291861 () Bool)

(declare-fun e!287534 () Bool)

(assert (=> b!488811 (=> (not res!291861) (not e!287534))))

(declare-datatypes ((array!31642 0))(
  ( (array!31643 (arr!15210 (Array (_ BitVec 32) (_ BitVec 64))) (size!15574 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31642)

(declare-datatypes ((List!9368 0))(
  ( (Nil!9365) (Cons!9364 (h!10223 (_ BitVec 64)) (t!15596 List!9368)) )
))
(declare-fun arrayNoDuplicates!0 (array!31642 (_ BitVec 32) List!9368) Bool)

(assert (=> b!488811 (= res!291861 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9365))))

(declare-fun res!291860 () Bool)

(declare-fun e!287533 () Bool)

(assert (=> start!44532 (=> (not res!291860) (not e!287533))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44532 (= res!291860 (validMask!0 mask!3524))))

(assert (=> start!44532 e!287533))

(assert (=> start!44532 true))

(declare-fun array_inv!11006 (array!31642) Bool)

(assert (=> start!44532 (array_inv!11006 a!3235)))

(declare-fun b!488812 () Bool)

(assert (=> b!488812 (= e!287533 e!287534)))

(declare-fun res!291862 () Bool)

(assert (=> b!488812 (=> (not res!291862) (not e!287534))))

(declare-datatypes ((SeekEntryResult!3677 0))(
  ( (MissingZero!3677 (index!16887 (_ BitVec 32))) (Found!3677 (index!16888 (_ BitVec 32))) (Intermediate!3677 (undefined!4489 Bool) (index!16889 (_ BitVec 32)) (x!46004 (_ BitVec 32))) (Undefined!3677) (MissingVacant!3677 (index!16890 (_ BitVec 32))) )
))
(declare-fun lt!220540 () SeekEntryResult!3677)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488812 (= res!291862 (or (= lt!220540 (MissingZero!3677 i!1204)) (= lt!220540 (MissingVacant!3677 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31642 (_ BitVec 32)) SeekEntryResult!3677)

(assert (=> b!488812 (= lt!220540 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488813 () Bool)

(declare-fun res!291866 () Bool)

(assert (=> b!488813 (=> (not res!291866) (not e!287533))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488813 (= res!291866 (and (= (size!15574 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15574 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15574 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488814 () Bool)

(assert (=> b!488814 (= e!287534 (not true))))

(declare-fun lt!220538 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488814 (= lt!220538 (toIndex!0 (select (store (arr!15210 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287532 () Bool)

(assert (=> b!488814 e!287532))

(declare-fun res!291863 () Bool)

(assert (=> b!488814 (=> (not res!291863) (not e!287532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31642 (_ BitVec 32)) Bool)

(assert (=> b!488814 (= res!291863 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14300 0))(
  ( (Unit!14301) )
))
(declare-fun lt!220539 () Unit!14300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14300)

(assert (=> b!488814 (= lt!220539 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488815 () Bool)

(declare-fun res!291858 () Bool)

(assert (=> b!488815 (=> (not res!291858) (not e!287533))))

(declare-fun arrayContainsKey!0 (array!31642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488815 (= res!291858 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488816 () Bool)

(assert (=> b!488816 (= e!287532 (= (seekEntryOrOpen!0 (select (arr!15210 a!3235) j!176) a!3235 mask!3524) (Found!3677 j!176)))))

(declare-fun b!488817 () Bool)

(declare-fun res!291865 () Bool)

(assert (=> b!488817 (=> (not res!291865) (not e!287533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488817 (= res!291865 (validKeyInArray!0 (select (arr!15210 a!3235) j!176)))))

(declare-fun b!488818 () Bool)

(declare-fun res!291864 () Bool)

(assert (=> b!488818 (=> (not res!291864) (not e!287533))))

(assert (=> b!488818 (= res!291864 (validKeyInArray!0 k!2280))))

(declare-fun b!488819 () Bool)

(declare-fun res!291859 () Bool)

(assert (=> b!488819 (=> (not res!291859) (not e!287534))))

(assert (=> b!488819 (= res!291859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44532 res!291860) b!488813))

(assert (= (and b!488813 res!291866) b!488817))

(assert (= (and b!488817 res!291865) b!488818))

(assert (= (and b!488818 res!291864) b!488815))

(assert (= (and b!488815 res!291858) b!488812))

(assert (= (and b!488812 res!291862) b!488819))

(assert (= (and b!488819 res!291859) b!488811))

(assert (= (and b!488811 res!291861) b!488814))

(assert (= (and b!488814 res!291863) b!488816))

(declare-fun m!468537 () Bool)

(assert (=> b!488815 m!468537))

(declare-fun m!468539 () Bool)

(assert (=> b!488819 m!468539))

(declare-fun m!468541 () Bool)

(assert (=> b!488817 m!468541))

(assert (=> b!488817 m!468541))

(declare-fun m!468543 () Bool)

(assert (=> b!488817 m!468543))

(declare-fun m!468545 () Bool)

(assert (=> b!488812 m!468545))

(declare-fun m!468547 () Bool)

(assert (=> start!44532 m!468547))

(declare-fun m!468549 () Bool)

(assert (=> start!44532 m!468549))

(declare-fun m!468551 () Bool)

(assert (=> b!488811 m!468551))

(declare-fun m!468553 () Bool)

(assert (=> b!488818 m!468553))

(declare-fun m!468555 () Bool)

(assert (=> b!488814 m!468555))

(declare-fun m!468557 () Bool)

(assert (=> b!488814 m!468557))

(declare-fun m!468559 () Bool)

(assert (=> b!488814 m!468559))

(declare-fun m!468561 () Bool)

(assert (=> b!488814 m!468561))

(assert (=> b!488814 m!468559))

(declare-fun m!468563 () Bool)

(assert (=> b!488814 m!468563))

(assert (=> b!488816 m!468541))

(assert (=> b!488816 m!468541))

(declare-fun m!468565 () Bool)

(assert (=> b!488816 m!468565))

(push 1)

(assert (not b!488815))

(assert (not b!488814))

(assert (not b!488816))

(assert (not b!488811))

(assert (not start!44532))

