; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44958 () Bool)

(assert start!44958)

(declare-fun b!492941 () Bool)

(declare-fun res!295659 () Bool)

(declare-fun e!289515 () Bool)

(assert (=> b!492941 (=> (not res!295659) (not e!289515))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31913 0))(
  ( (array!31914 (arr!15341 (Array (_ BitVec 32) (_ BitVec 64))) (size!15706 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31913)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492941 (= res!295659 (and (= (size!15706 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15706 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15706 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492942 () Bool)

(declare-fun res!295654 () Bool)

(declare-fun e!289514 () Bool)

(assert (=> b!492942 (=> (not res!295654) (not e!289514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31913 (_ BitVec 32)) Bool)

(assert (=> b!492942 (= res!295654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492943 () Bool)

(assert (=> b!492943 (= e!289515 e!289514)))

(declare-fun res!295657 () Bool)

(assert (=> b!492943 (=> (not res!295657) (not e!289514))))

(declare-datatypes ((SeekEntryResult!3805 0))(
  ( (MissingZero!3805 (index!17399 (_ BitVec 32))) (Found!3805 (index!17400 (_ BitVec 32))) (Intermediate!3805 (undefined!4617 Bool) (index!17401 (_ BitVec 32)) (x!46494 (_ BitVec 32))) (Undefined!3805) (MissingVacant!3805 (index!17402 (_ BitVec 32))) )
))
(declare-fun lt!222792 () SeekEntryResult!3805)

(assert (=> b!492943 (= res!295657 (or (= lt!222792 (MissingZero!3805 i!1204)) (= lt!222792 (MissingVacant!3805 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31913 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!492943 (= lt!222792 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492944 () Bool)

(declare-fun res!295655 () Bool)

(assert (=> b!492944 (=> (not res!295655) (not e!289515))))

(declare-fun arrayContainsKey!0 (array!31913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492944 (= res!295655 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492945 () Bool)

(declare-fun res!295653 () Bool)

(assert (=> b!492945 (=> (not res!295653) (not e!289515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492945 (= res!295653 (validKeyInArray!0 k0!2280))))

(declare-fun b!492946 () Bool)

(declare-fun e!289512 () Bool)

(assert (=> b!492946 (= e!289512 (= (seekEntryOrOpen!0 (select (arr!15341 a!3235) j!176) a!3235 mask!3524) (Found!3805 j!176)))))

(declare-fun res!295661 () Bool)

(assert (=> start!44958 (=> (not res!295661) (not e!289515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44958 (= res!295661 (validMask!0 mask!3524))))

(assert (=> start!44958 e!289515))

(assert (=> start!44958 true))

(declare-fun array_inv!11224 (array!31913) Bool)

(assert (=> start!44958 (array_inv!11224 a!3235)))

(declare-fun b!492947 () Bool)

(declare-fun res!295658 () Bool)

(assert (=> b!492947 (=> (not res!295658) (not e!289514))))

(declare-datatypes ((List!9538 0))(
  ( (Nil!9535) (Cons!9534 (h!10402 (_ BitVec 64)) (t!15757 List!9538)) )
))
(declare-fun arrayNoDuplicates!0 (array!31913 (_ BitVec 32) List!9538) Bool)

(assert (=> b!492947 (= res!295658 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9535))))

(declare-fun b!492948 () Bool)

(declare-fun res!295660 () Bool)

(assert (=> b!492948 (=> (not res!295660) (not e!289515))))

(assert (=> b!492948 (= res!295660 (validKeyInArray!0 (select (arr!15341 a!3235) j!176)))))

(declare-fun b!492949 () Bool)

(assert (=> b!492949 (= e!289514 (not true))))

(declare-fun lt!222791 () SeekEntryResult!3805)

(declare-fun lt!222796 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31913 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!492949 (= lt!222791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222796 (select (store (arr!15341 a!3235) i!1204 k0!2280) j!176) (array!31914 (store (arr!15341 a!3235) i!1204 k0!2280) (size!15706 a!3235)) mask!3524))))

(declare-fun lt!222793 () SeekEntryResult!3805)

(declare-fun lt!222795 () (_ BitVec 32))

(assert (=> b!492949 (= lt!222793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222795 (select (arr!15341 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492949 (= lt!222796 (toIndex!0 (select (store (arr!15341 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492949 (= lt!222795 (toIndex!0 (select (arr!15341 a!3235) j!176) mask!3524))))

(assert (=> b!492949 e!289512))

(declare-fun res!295656 () Bool)

(assert (=> b!492949 (=> (not res!295656) (not e!289512))))

(assert (=> b!492949 (= res!295656 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14542 0))(
  ( (Unit!14543) )
))
(declare-fun lt!222794 () Unit!14542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14542)

(assert (=> b!492949 (= lt!222794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44958 res!295661) b!492941))

(assert (= (and b!492941 res!295659) b!492948))

(assert (= (and b!492948 res!295660) b!492945))

(assert (= (and b!492945 res!295653) b!492944))

(assert (= (and b!492944 res!295655) b!492943))

(assert (= (and b!492943 res!295657) b!492942))

(assert (= (and b!492942 res!295654) b!492947))

(assert (= (and b!492947 res!295658) b!492949))

(assert (= (and b!492949 res!295656) b!492946))

(declare-fun m!473239 () Bool)

(assert (=> start!44958 m!473239))

(declare-fun m!473241 () Bool)

(assert (=> start!44958 m!473241))

(declare-fun m!473243 () Bool)

(assert (=> b!492942 m!473243))

(declare-fun m!473245 () Bool)

(assert (=> b!492946 m!473245))

(assert (=> b!492946 m!473245))

(declare-fun m!473247 () Bool)

(assert (=> b!492946 m!473247))

(declare-fun m!473249 () Bool)

(assert (=> b!492944 m!473249))

(assert (=> b!492948 m!473245))

(assert (=> b!492948 m!473245))

(declare-fun m!473251 () Bool)

(assert (=> b!492948 m!473251))

(declare-fun m!473253 () Bool)

(assert (=> b!492943 m!473253))

(declare-fun m!473255 () Bool)

(assert (=> b!492945 m!473255))

(assert (=> b!492949 m!473245))

(declare-fun m!473257 () Bool)

(assert (=> b!492949 m!473257))

(declare-fun m!473259 () Bool)

(assert (=> b!492949 m!473259))

(declare-fun m!473261 () Bool)

(assert (=> b!492949 m!473261))

(declare-fun m!473263 () Bool)

(assert (=> b!492949 m!473263))

(assert (=> b!492949 m!473245))

(declare-fun m!473265 () Bool)

(assert (=> b!492949 m!473265))

(declare-fun m!473267 () Bool)

(assert (=> b!492949 m!473267))

(assert (=> b!492949 m!473263))

(declare-fun m!473269 () Bool)

(assert (=> b!492949 m!473269))

(assert (=> b!492949 m!473263))

(declare-fun m!473271 () Bool)

(assert (=> b!492949 m!473271))

(assert (=> b!492949 m!473245))

(declare-fun m!473273 () Bool)

(assert (=> b!492947 m!473273))

(check-sat (not b!492942) (not start!44958) (not b!492945) (not b!492949) (not b!492943) (not b!492947) (not b!492948) (not b!492944) (not b!492946))
(check-sat)
