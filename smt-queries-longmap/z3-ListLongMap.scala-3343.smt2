; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46038 () Bool)

(assert start!46038)

(declare-fun res!310693 () Bool)

(declare-fun e!297985 () Bool)

(assert (=> start!46038 (=> (not res!310693) (not e!297985))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46038 (= res!310693 (validMask!0 mask!3524))))

(assert (=> start!46038 e!297985))

(assert (=> start!46038 true))

(declare-datatypes ((array!32759 0))(
  ( (array!32760 (arr!15758 (Array (_ BitVec 32) (_ BitVec 64))) (size!16123 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32759)

(declare-fun array_inv!11641 (array!32759) Bool)

(assert (=> start!46038 (array_inv!11641 a!3235)))

(declare-fun b!509702 () Bool)

(declare-fun e!297984 () Bool)

(assert (=> b!509702 (= e!297985 e!297984)))

(declare-fun res!310697 () Bool)

(assert (=> b!509702 (=> (not res!310697) (not e!297984))))

(declare-datatypes ((SeekEntryResult!4222 0))(
  ( (MissingZero!4222 (index!19076 (_ BitVec 32))) (Found!4222 (index!19077 (_ BitVec 32))) (Intermediate!4222 (undefined!5034 Bool) (index!19078 (_ BitVec 32)) (x!48050 (_ BitVec 32))) (Undefined!4222) (MissingVacant!4222 (index!19079 (_ BitVec 32))) )
))
(declare-fun lt!232839 () SeekEntryResult!4222)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509702 (= res!310697 (or (= lt!232839 (MissingZero!4222 i!1204)) (= lt!232839 (MissingVacant!4222 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32759 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!509702 (= lt!232839 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509703 () Bool)

(declare-fun res!310696 () Bool)

(assert (=> b!509703 (=> (not res!310696) (not e!297985))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509703 (= res!310696 (validKeyInArray!0 (select (arr!15758 a!3235) j!176)))))

(declare-fun b!509704 () Bool)

(assert (=> b!509704 (= e!297984 (not true))))

(declare-fun lt!232840 () (_ BitVec 32))

(declare-fun lt!232842 () SeekEntryResult!4222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32759 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!509704 (= lt!232842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232840 (select (store (arr!15758 a!3235) i!1204 k0!2280) j!176) (array!32760 (store (arr!15758 a!3235) i!1204 k0!2280) (size!16123 a!3235)) mask!3524))))

(declare-fun lt!232843 () SeekEntryResult!4222)

(declare-fun lt!232841 () (_ BitVec 32))

(assert (=> b!509704 (= lt!232843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232841 (select (arr!15758 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509704 (= lt!232840 (toIndex!0 (select (store (arr!15758 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509704 (= lt!232841 (toIndex!0 (select (arr!15758 a!3235) j!176) mask!3524))))

(declare-fun e!297986 () Bool)

(assert (=> b!509704 e!297986))

(declare-fun res!310690 () Bool)

(assert (=> b!509704 (=> (not res!310690) (not e!297986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32759 (_ BitVec 32)) Bool)

(assert (=> b!509704 (= res!310690 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15688 0))(
  ( (Unit!15689) )
))
(declare-fun lt!232838 () Unit!15688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15688)

(assert (=> b!509704 (= lt!232838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509705 () Bool)

(declare-fun res!310689 () Bool)

(assert (=> b!509705 (=> (not res!310689) (not e!297985))))

(declare-fun arrayContainsKey!0 (array!32759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509705 (= res!310689 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509706 () Bool)

(declare-fun res!310691 () Bool)

(assert (=> b!509706 (=> (not res!310691) (not e!297984))))

(declare-datatypes ((List!9955 0))(
  ( (Nil!9952) (Cons!9951 (h!10828 (_ BitVec 64)) (t!16174 List!9955)) )
))
(declare-fun arrayNoDuplicates!0 (array!32759 (_ BitVec 32) List!9955) Bool)

(assert (=> b!509706 (= res!310691 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9952))))

(declare-fun b!509707 () Bool)

(declare-fun res!310694 () Bool)

(assert (=> b!509707 (=> (not res!310694) (not e!297984))))

(assert (=> b!509707 (= res!310694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509708 () Bool)

(declare-fun res!310692 () Bool)

(assert (=> b!509708 (=> (not res!310692) (not e!297985))))

(assert (=> b!509708 (= res!310692 (validKeyInArray!0 k0!2280))))

(declare-fun b!509709 () Bool)

(assert (=> b!509709 (= e!297986 (= (seekEntryOrOpen!0 (select (arr!15758 a!3235) j!176) a!3235 mask!3524) (Found!4222 j!176)))))

(declare-fun b!509710 () Bool)

(declare-fun res!310695 () Bool)

(assert (=> b!509710 (=> (not res!310695) (not e!297985))))

(assert (=> b!509710 (= res!310695 (and (= (size!16123 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16123 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16123 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46038 res!310693) b!509710))

(assert (= (and b!509710 res!310695) b!509703))

(assert (= (and b!509703 res!310696) b!509708))

(assert (= (and b!509708 res!310692) b!509705))

(assert (= (and b!509705 res!310689) b!509702))

(assert (= (and b!509702 res!310697) b!509707))

(assert (= (and b!509707 res!310694) b!509706))

(assert (= (and b!509706 res!310691) b!509704))

(assert (= (and b!509704 res!310690) b!509709))

(declare-fun m!490285 () Bool)

(assert (=> b!509702 m!490285))

(declare-fun m!490287 () Bool)

(assert (=> b!509703 m!490287))

(assert (=> b!509703 m!490287))

(declare-fun m!490289 () Bool)

(assert (=> b!509703 m!490289))

(declare-fun m!490291 () Bool)

(assert (=> b!509706 m!490291))

(declare-fun m!490293 () Bool)

(assert (=> start!46038 m!490293))

(declare-fun m!490295 () Bool)

(assert (=> start!46038 m!490295))

(declare-fun m!490297 () Bool)

(assert (=> b!509708 m!490297))

(declare-fun m!490299 () Bool)

(assert (=> b!509707 m!490299))

(declare-fun m!490301 () Bool)

(assert (=> b!509704 m!490301))

(declare-fun m!490303 () Bool)

(assert (=> b!509704 m!490303))

(declare-fun m!490305 () Bool)

(assert (=> b!509704 m!490305))

(assert (=> b!509704 m!490287))

(declare-fun m!490307 () Bool)

(assert (=> b!509704 m!490307))

(assert (=> b!509704 m!490287))

(declare-fun m!490309 () Bool)

(assert (=> b!509704 m!490309))

(assert (=> b!509704 m!490305))

(declare-fun m!490311 () Bool)

(assert (=> b!509704 m!490311))

(assert (=> b!509704 m!490287))

(declare-fun m!490313 () Bool)

(assert (=> b!509704 m!490313))

(assert (=> b!509704 m!490305))

(declare-fun m!490315 () Bool)

(assert (=> b!509704 m!490315))

(declare-fun m!490317 () Bool)

(assert (=> b!509705 m!490317))

(assert (=> b!509709 m!490287))

(assert (=> b!509709 m!490287))

(declare-fun m!490319 () Bool)

(assert (=> b!509709 m!490319))

(check-sat (not b!509706) (not b!509702) (not start!46038) (not b!509704) (not b!509705) (not b!509709) (not b!509707) (not b!509708) (not b!509703))
(check-sat)
