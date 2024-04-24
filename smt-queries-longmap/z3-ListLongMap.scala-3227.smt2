; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45158 () Bool)

(assert start!45158)

(declare-fun b!495534 () Bool)

(declare-fun res!297980 () Bool)

(declare-fun e!290703 () Bool)

(assert (=> b!495534 (=> (not res!297980) (not e!290703))))

(declare-datatypes ((array!32047 0))(
  ( (array!32048 (arr!15406 (Array (_ BitVec 32) (_ BitVec 64))) (size!15770 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32047)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495534 (= res!297980 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495535 () Bool)

(declare-fun e!290699 () Bool)

(declare-fun e!290701 () Bool)

(assert (=> b!495535 (= e!290699 (not e!290701))))

(declare-fun res!297977 () Bool)

(assert (=> b!495535 (=> res!297977 e!290701)))

(declare-fun lt!224371 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3829 0))(
  ( (MissingZero!3829 (index!17495 (_ BitVec 32))) (Found!3829 (index!17496 (_ BitVec 32))) (Intermediate!3829 (undefined!4641 Bool) (index!17497 (_ BitVec 32)) (x!46710 (_ BitVec 32))) (Undefined!3829) (MissingVacant!3829 (index!17498 (_ BitVec 32))) )
))
(declare-fun lt!224372 () SeekEntryResult!3829)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32047 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!495535 (= res!297977 (= lt!224372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224371 (select (store (arr!15406 a!3235) i!1204 k0!2280) j!176) (array!32048 (store (arr!15406 a!3235) i!1204 k0!2280) (size!15770 a!3235)) mask!3524)))))

(declare-fun lt!224370 () (_ BitVec 32))

(assert (=> b!495535 (= lt!224372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224370 (select (arr!15406 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495535 (= lt!224371 (toIndex!0 (select (store (arr!15406 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495535 (= lt!224370 (toIndex!0 (select (arr!15406 a!3235) j!176) mask!3524))))

(declare-fun e!290700 () Bool)

(assert (=> b!495535 e!290700))

(declare-fun res!297982 () Bool)

(assert (=> b!495535 (=> (not res!297982) (not e!290700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32047 (_ BitVec 32)) Bool)

(assert (=> b!495535 (= res!297982 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14665 0))(
  ( (Unit!14666) )
))
(declare-fun lt!224373 () Unit!14665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14665)

(assert (=> b!495535 (= lt!224373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495536 () Bool)

(declare-fun res!297981 () Bool)

(assert (=> b!495536 (=> (not res!297981) (not e!290699))))

(declare-datatypes ((List!9471 0))(
  ( (Nil!9468) (Cons!9467 (h!10338 (_ BitVec 64)) (t!15691 List!9471)) )
))
(declare-fun arrayNoDuplicates!0 (array!32047 (_ BitVec 32) List!9471) Bool)

(assert (=> b!495536 (= res!297981 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9468))))

(declare-fun b!495537 () Bool)

(declare-fun res!297976 () Bool)

(assert (=> b!495537 (=> res!297976 e!290701)))

(get-info :version)

(assert (=> b!495537 (= res!297976 (or (undefined!4641 lt!224372) (not ((_ is Intermediate!3829) lt!224372))))))

(declare-fun res!297979 () Bool)

(assert (=> start!45158 (=> (not res!297979) (not e!290703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45158 (= res!297979 (validMask!0 mask!3524))))

(assert (=> start!45158 e!290703))

(assert (=> start!45158 true))

(declare-fun array_inv!11265 (array!32047) Bool)

(assert (=> start!45158 (array_inv!11265 a!3235)))

(declare-fun b!495538 () Bool)

(declare-fun res!297983 () Bool)

(assert (=> b!495538 (=> (not res!297983) (not e!290703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495538 (= res!297983 (validKeyInArray!0 k0!2280))))

(declare-fun b!495539 () Bool)

(assert (=> b!495539 (= e!290701 true)))

(assert (=> b!495539 (and (bvslt (x!46710 lt!224372) #b01111111111111111111111111111110) (or (= (select (arr!15406 a!3235) (index!17497 lt!224372)) (select (arr!15406 a!3235) j!176)) (= (select (arr!15406 a!3235) (index!17497 lt!224372)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15406 a!3235) (index!17497 lt!224372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495540 () Bool)

(declare-fun res!297978 () Bool)

(assert (=> b!495540 (=> (not res!297978) (not e!290703))))

(assert (=> b!495540 (= res!297978 (validKeyInArray!0 (select (arr!15406 a!3235) j!176)))))

(declare-fun b!495541 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32047 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!495541 (= e!290700 (= (seekEntryOrOpen!0 (select (arr!15406 a!3235) j!176) a!3235 mask!3524) (Found!3829 j!176)))))

(declare-fun b!495542 () Bool)

(assert (=> b!495542 (= e!290703 e!290699)))

(declare-fun res!297975 () Bool)

(assert (=> b!495542 (=> (not res!297975) (not e!290699))))

(declare-fun lt!224374 () SeekEntryResult!3829)

(assert (=> b!495542 (= res!297975 (or (= lt!224374 (MissingZero!3829 i!1204)) (= lt!224374 (MissingVacant!3829 i!1204))))))

(assert (=> b!495542 (= lt!224374 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495543 () Bool)

(declare-fun res!297984 () Bool)

(assert (=> b!495543 (=> (not res!297984) (not e!290699))))

(assert (=> b!495543 (= res!297984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495544 () Bool)

(declare-fun res!297985 () Bool)

(assert (=> b!495544 (=> (not res!297985) (not e!290703))))

(assert (=> b!495544 (= res!297985 (and (= (size!15770 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15770 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15770 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45158 res!297979) b!495544))

(assert (= (and b!495544 res!297985) b!495540))

(assert (= (and b!495540 res!297978) b!495538))

(assert (= (and b!495538 res!297983) b!495534))

(assert (= (and b!495534 res!297980) b!495542))

(assert (= (and b!495542 res!297975) b!495543))

(assert (= (and b!495543 res!297984) b!495536))

(assert (= (and b!495536 res!297981) b!495535))

(assert (= (and b!495535 res!297982) b!495541))

(assert (= (and b!495535 (not res!297977)) b!495537))

(assert (= (and b!495537 (not res!297976)) b!495539))

(declare-fun m!476887 () Bool)

(assert (=> b!495542 m!476887))

(declare-fun m!476889 () Bool)

(assert (=> b!495538 m!476889))

(declare-fun m!476891 () Bool)

(assert (=> b!495536 m!476891))

(declare-fun m!476893 () Bool)

(assert (=> b!495534 m!476893))

(declare-fun m!476895 () Bool)

(assert (=> b!495535 m!476895))

(declare-fun m!476897 () Bool)

(assert (=> b!495535 m!476897))

(declare-fun m!476899 () Bool)

(assert (=> b!495535 m!476899))

(declare-fun m!476901 () Bool)

(assert (=> b!495535 m!476901))

(declare-fun m!476903 () Bool)

(assert (=> b!495535 m!476903))

(assert (=> b!495535 m!476901))

(assert (=> b!495535 m!476901))

(declare-fun m!476905 () Bool)

(assert (=> b!495535 m!476905))

(declare-fun m!476907 () Bool)

(assert (=> b!495535 m!476907))

(assert (=> b!495535 m!476899))

(declare-fun m!476909 () Bool)

(assert (=> b!495535 m!476909))

(assert (=> b!495535 m!476899))

(declare-fun m!476911 () Bool)

(assert (=> b!495535 m!476911))

(declare-fun m!476913 () Bool)

(assert (=> b!495543 m!476913))

(assert (=> b!495541 m!476901))

(assert (=> b!495541 m!476901))

(declare-fun m!476915 () Bool)

(assert (=> b!495541 m!476915))

(declare-fun m!476917 () Bool)

(assert (=> b!495539 m!476917))

(assert (=> b!495539 m!476901))

(declare-fun m!476919 () Bool)

(assert (=> start!45158 m!476919))

(declare-fun m!476921 () Bool)

(assert (=> start!45158 m!476921))

(assert (=> b!495540 m!476901))

(assert (=> b!495540 m!476901))

(declare-fun m!476923 () Bool)

(assert (=> b!495540 m!476923))

(check-sat (not b!495538) (not b!495541) (not b!495540) (not start!45158) (not b!495542) (not b!495535) (not b!495534) (not b!495536) (not b!495543))
(check-sat)
