; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45278 () Bool)

(assert start!45278)

(declare-fun b!497410 () Bool)

(declare-fun e!291563 () Bool)

(declare-fun e!291567 () Bool)

(assert (=> b!497410 (= e!291563 e!291567)))

(declare-fun res!299805 () Bool)

(assert (=> b!497410 (=> (not res!299805) (not e!291567))))

(declare-datatypes ((SeekEntryResult!3933 0))(
  ( (MissingZero!3933 (index!17911 (_ BitVec 32))) (Found!3933 (index!17912 (_ BitVec 32))) (Intermediate!3933 (undefined!4745 Bool) (index!17913 (_ BitVec 32)) (x!46961 (_ BitVec 32))) (Undefined!3933) (MissingVacant!3933 (index!17914 (_ BitVec 32))) )
))
(declare-fun lt!225183 () SeekEntryResult!3933)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497410 (= res!299805 (or (= lt!225183 (MissingZero!3933 i!1204)) (= lt!225183 (MissingVacant!3933 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!32166 0))(
  ( (array!32167 (arr!15466 (Array (_ BitVec 32) (_ BitVec 64))) (size!15830 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32166)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32166 (_ BitVec 32)) SeekEntryResult!3933)

(assert (=> b!497410 (= lt!225183 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497411 () Bool)

(declare-fun res!299807 () Bool)

(assert (=> b!497411 (=> (not res!299807) (not e!291567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32166 (_ BitVec 32)) Bool)

(assert (=> b!497411 (= res!299807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497412 () Bool)

(declare-fun res!299797 () Bool)

(assert (=> b!497412 (=> (not res!299797) (not e!291563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497412 (= res!299797 (validKeyInArray!0 k0!2280))))

(declare-fun b!497413 () Bool)

(declare-fun res!299800 () Bool)

(assert (=> b!497413 (=> (not res!299800) (not e!291567))))

(declare-datatypes ((List!9624 0))(
  ( (Nil!9621) (Cons!9620 (h!10491 (_ BitVec 64)) (t!15852 List!9624)) )
))
(declare-fun arrayNoDuplicates!0 (array!32166 (_ BitVec 32) List!9624) Bool)

(assert (=> b!497413 (= res!299800 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9621))))

(declare-fun b!497414 () Bool)

(declare-fun e!291564 () Bool)

(assert (=> b!497414 (= e!291564 true)))

(declare-fun lt!225185 () SeekEntryResult!3933)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497414 (and (bvslt (x!46961 lt!225185) #b01111111111111111111111111111110) (or (= (select (arr!15466 a!3235) (index!17913 lt!225185)) (select (arr!15466 a!3235) j!176)) (= (select (arr!15466 a!3235) (index!17913 lt!225185)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15466 a!3235) (index!17913 lt!225185)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497416 () Bool)

(declare-fun res!299804 () Bool)

(assert (=> b!497416 (=> res!299804 e!291564)))

(get-info :version)

(assert (=> b!497416 (= res!299804 (or (undefined!4745 lt!225185) (not ((_ is Intermediate!3933) lt!225185))))))

(declare-fun b!497417 () Bool)

(declare-fun res!299802 () Bool)

(assert (=> b!497417 (=> (not res!299802) (not e!291563))))

(assert (=> b!497417 (= res!299802 (validKeyInArray!0 (select (arr!15466 a!3235) j!176)))))

(declare-fun b!497418 () Bool)

(assert (=> b!497418 (= e!291567 (not e!291564))))

(declare-fun res!299806 () Bool)

(assert (=> b!497418 (=> res!299806 e!291564)))

(declare-fun lt!225187 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32166 (_ BitVec 32)) SeekEntryResult!3933)

(assert (=> b!497418 (= res!299806 (= lt!225185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225187 (select (store (arr!15466 a!3235) i!1204 k0!2280) j!176) (array!32167 (store (arr!15466 a!3235) i!1204 k0!2280) (size!15830 a!3235)) mask!3524)))))

(declare-fun lt!225184 () (_ BitVec 32))

(assert (=> b!497418 (= lt!225185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225184 (select (arr!15466 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497418 (= lt!225187 (toIndex!0 (select (store (arr!15466 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497418 (= lt!225184 (toIndex!0 (select (arr!15466 a!3235) j!176) mask!3524))))

(declare-fun e!291565 () Bool)

(assert (=> b!497418 e!291565))

(declare-fun res!299799 () Bool)

(assert (=> b!497418 (=> (not res!299799) (not e!291565))))

(assert (=> b!497418 (= res!299799 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14812 0))(
  ( (Unit!14813) )
))
(declare-fun lt!225186 () Unit!14812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14812)

(assert (=> b!497418 (= lt!225186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497419 () Bool)

(assert (=> b!497419 (= e!291565 (= (seekEntryOrOpen!0 (select (arr!15466 a!3235) j!176) a!3235 mask!3524) (Found!3933 j!176)))))

(declare-fun b!497420 () Bool)

(declare-fun res!299801 () Bool)

(assert (=> b!497420 (=> (not res!299801) (not e!291563))))

(assert (=> b!497420 (= res!299801 (and (= (size!15830 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15830 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15830 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497415 () Bool)

(declare-fun res!299798 () Bool)

(assert (=> b!497415 (=> (not res!299798) (not e!291563))))

(declare-fun arrayContainsKey!0 (array!32166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497415 (= res!299798 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299803 () Bool)

(assert (=> start!45278 (=> (not res!299803) (not e!291563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45278 (= res!299803 (validMask!0 mask!3524))))

(assert (=> start!45278 e!291563))

(assert (=> start!45278 true))

(declare-fun array_inv!11262 (array!32166) Bool)

(assert (=> start!45278 (array_inv!11262 a!3235)))

(assert (= (and start!45278 res!299803) b!497420))

(assert (= (and b!497420 res!299801) b!497417))

(assert (= (and b!497417 res!299802) b!497412))

(assert (= (and b!497412 res!299797) b!497415))

(assert (= (and b!497415 res!299798) b!497410))

(assert (= (and b!497410 res!299805) b!497411))

(assert (= (and b!497411 res!299807) b!497413))

(assert (= (and b!497413 res!299800) b!497418))

(assert (= (and b!497418 res!299799) b!497419))

(assert (= (and b!497418 (not res!299806)) b!497416))

(assert (= (and b!497416 (not res!299804)) b!497414))

(declare-fun m!478793 () Bool)

(assert (=> b!497411 m!478793))

(declare-fun m!478795 () Bool)

(assert (=> start!45278 m!478795))

(declare-fun m!478797 () Bool)

(assert (=> start!45278 m!478797))

(declare-fun m!478799 () Bool)

(assert (=> b!497412 m!478799))

(declare-fun m!478801 () Bool)

(assert (=> b!497417 m!478801))

(assert (=> b!497417 m!478801))

(declare-fun m!478803 () Bool)

(assert (=> b!497417 m!478803))

(declare-fun m!478805 () Bool)

(assert (=> b!497415 m!478805))

(declare-fun m!478807 () Bool)

(assert (=> b!497418 m!478807))

(declare-fun m!478809 () Bool)

(assert (=> b!497418 m!478809))

(declare-fun m!478811 () Bool)

(assert (=> b!497418 m!478811))

(assert (=> b!497418 m!478801))

(declare-fun m!478813 () Bool)

(assert (=> b!497418 m!478813))

(assert (=> b!497418 m!478811))

(declare-fun m!478815 () Bool)

(assert (=> b!497418 m!478815))

(assert (=> b!497418 m!478801))

(declare-fun m!478817 () Bool)

(assert (=> b!497418 m!478817))

(assert (=> b!497418 m!478801))

(declare-fun m!478819 () Bool)

(assert (=> b!497418 m!478819))

(assert (=> b!497418 m!478811))

(declare-fun m!478821 () Bool)

(assert (=> b!497418 m!478821))

(declare-fun m!478823 () Bool)

(assert (=> b!497410 m!478823))

(declare-fun m!478825 () Bool)

(assert (=> b!497414 m!478825))

(assert (=> b!497414 m!478801))

(assert (=> b!497419 m!478801))

(assert (=> b!497419 m!478801))

(declare-fun m!478827 () Bool)

(assert (=> b!497419 m!478827))

(declare-fun m!478829 () Bool)

(assert (=> b!497413 m!478829))

(check-sat (not b!497410) (not b!497415) (not b!497417) (not b!497419) (not b!497412) (not b!497418) (not start!45278) (not b!497411) (not b!497413))
(check-sat)
