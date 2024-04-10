; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45974 () Bool)

(assert start!45974)

(declare-fun b!508947 () Bool)

(declare-fun res!309795 () Bool)

(declare-fun e!297704 () Bool)

(assert (=> b!508947 (=> (not res!309795) (not e!297704))))

(declare-datatypes ((array!32685 0))(
  ( (array!32686 (arr!15721 (Array (_ BitVec 32) (_ BitVec 64))) (size!16085 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32685)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508947 (= res!309795 (validKeyInArray!0 (select (arr!15721 a!3235) j!176)))))

(declare-fun b!508948 () Bool)

(declare-fun e!297702 () Bool)

(assert (=> b!508948 (= e!297702 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232400 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508948 (= lt!232400 (toIndex!0 (select (store (arr!15721 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!297703 () Bool)

(assert (=> b!508948 e!297703))

(declare-fun res!309799 () Bool)

(assert (=> b!508948 (=> (not res!309799) (not e!297703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32685 (_ BitVec 32)) Bool)

(assert (=> b!508948 (= res!309799 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15634 0))(
  ( (Unit!15635) )
))
(declare-fun lt!232402 () Unit!15634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15634)

(assert (=> b!508948 (= lt!232402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309797 () Bool)

(assert (=> start!45974 (=> (not res!309797) (not e!297704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45974 (= res!309797 (validMask!0 mask!3524))))

(assert (=> start!45974 e!297704))

(assert (=> start!45974 true))

(declare-fun array_inv!11517 (array!32685) Bool)

(assert (=> start!45974 (array_inv!11517 a!3235)))

(declare-fun b!508949 () Bool)

(declare-fun res!309800 () Bool)

(assert (=> b!508949 (=> (not res!309800) (not e!297702))))

(declare-datatypes ((List!9879 0))(
  ( (Nil!9876) (Cons!9875 (h!10752 (_ BitVec 64)) (t!16107 List!9879)) )
))
(declare-fun arrayNoDuplicates!0 (array!32685 (_ BitVec 32) List!9879) Bool)

(assert (=> b!508949 (= res!309800 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9876))))

(declare-fun b!508950 () Bool)

(declare-datatypes ((SeekEntryResult!4188 0))(
  ( (MissingZero!4188 (index!18940 (_ BitVec 32))) (Found!4188 (index!18941 (_ BitVec 32))) (Intermediate!4188 (undefined!5000 Bool) (index!18942 (_ BitVec 32)) (x!47917 (_ BitVec 32))) (Undefined!4188) (MissingVacant!4188 (index!18943 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32685 (_ BitVec 32)) SeekEntryResult!4188)

(assert (=> b!508950 (= e!297703 (= (seekEntryOrOpen!0 (select (arr!15721 a!3235) j!176) a!3235 mask!3524) (Found!4188 j!176)))))

(declare-fun b!508951 () Bool)

(declare-fun res!309794 () Bool)

(assert (=> b!508951 (=> (not res!309794) (not e!297702))))

(assert (=> b!508951 (= res!309794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508952 () Bool)

(declare-fun res!309796 () Bool)

(assert (=> b!508952 (=> (not res!309796) (not e!297704))))

(assert (=> b!508952 (= res!309796 (validKeyInArray!0 k0!2280))))

(declare-fun b!508953 () Bool)

(assert (=> b!508953 (= e!297704 e!297702)))

(declare-fun res!309798 () Bool)

(assert (=> b!508953 (=> (not res!309798) (not e!297702))))

(declare-fun lt!232401 () SeekEntryResult!4188)

(assert (=> b!508953 (= res!309798 (or (= lt!232401 (MissingZero!4188 i!1204)) (= lt!232401 (MissingVacant!4188 i!1204))))))

(assert (=> b!508953 (= lt!232401 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508954 () Bool)

(declare-fun res!309792 () Bool)

(assert (=> b!508954 (=> (not res!309792) (not e!297704))))

(assert (=> b!508954 (= res!309792 (and (= (size!16085 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16085 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16085 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508955 () Bool)

(declare-fun res!309793 () Bool)

(assert (=> b!508955 (=> (not res!309793) (not e!297704))))

(declare-fun arrayContainsKey!0 (array!32685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508955 (= res!309793 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45974 res!309797) b!508954))

(assert (= (and b!508954 res!309792) b!508947))

(assert (= (and b!508947 res!309795) b!508952))

(assert (= (and b!508952 res!309796) b!508955))

(assert (= (and b!508955 res!309793) b!508953))

(assert (= (and b!508953 res!309798) b!508951))

(assert (= (and b!508951 res!309794) b!508949))

(assert (= (and b!508949 res!309800) b!508948))

(assert (= (and b!508948 res!309799) b!508950))

(declare-fun m!489681 () Bool)

(assert (=> b!508955 m!489681))

(declare-fun m!489683 () Bool)

(assert (=> b!508952 m!489683))

(declare-fun m!489685 () Bool)

(assert (=> b!508947 m!489685))

(assert (=> b!508947 m!489685))

(declare-fun m!489687 () Bool)

(assert (=> b!508947 m!489687))

(declare-fun m!489689 () Bool)

(assert (=> b!508953 m!489689))

(declare-fun m!489691 () Bool)

(assert (=> b!508948 m!489691))

(declare-fun m!489693 () Bool)

(assert (=> b!508948 m!489693))

(declare-fun m!489695 () Bool)

(assert (=> b!508948 m!489695))

(declare-fun m!489697 () Bool)

(assert (=> b!508948 m!489697))

(assert (=> b!508948 m!489695))

(declare-fun m!489699 () Bool)

(assert (=> b!508948 m!489699))

(declare-fun m!489701 () Bool)

(assert (=> start!45974 m!489701))

(declare-fun m!489703 () Bool)

(assert (=> start!45974 m!489703))

(declare-fun m!489705 () Bool)

(assert (=> b!508951 m!489705))

(declare-fun m!489707 () Bool)

(assert (=> b!508949 m!489707))

(assert (=> b!508950 m!489685))

(assert (=> b!508950 m!489685))

(declare-fun m!489709 () Bool)

(assert (=> b!508950 m!489709))

(check-sat (not b!508948) (not b!508955) (not b!508953) (not b!508952) (not b!508951) (not start!45974) (not b!508949) (not b!508950) (not b!508947))
(check-sat)
