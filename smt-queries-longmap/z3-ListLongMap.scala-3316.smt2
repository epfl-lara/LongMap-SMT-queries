; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45842 () Bool)

(assert start!45842)

(declare-fun b!507676 () Bool)

(declare-fun res!308640 () Bool)

(declare-fun e!297092 () Bool)

(assert (=> b!507676 (=> (not res!308640) (not e!297092))))

(declare-datatypes ((array!32598 0))(
  ( (array!32599 (arr!15679 (Array (_ BitVec 32) (_ BitVec 64))) (size!16043 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32598)

(declare-datatypes ((List!9837 0))(
  ( (Nil!9834) (Cons!9833 (h!10710 (_ BitVec 64)) (t!16065 List!9837)) )
))
(declare-fun arrayNoDuplicates!0 (array!32598 (_ BitVec 32) List!9837) Bool)

(assert (=> b!507676 (= res!308640 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9834))))

(declare-fun res!308635 () Bool)

(declare-fun e!297093 () Bool)

(assert (=> start!45842 (=> (not res!308635) (not e!297093))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45842 (= res!308635 (validMask!0 mask!3524))))

(assert (=> start!45842 e!297093))

(assert (=> start!45842 true))

(declare-fun array_inv!11475 (array!32598) Bool)

(assert (=> start!45842 (array_inv!11475 a!3235)))

(declare-fun b!507677 () Bool)

(declare-fun res!308639 () Bool)

(assert (=> b!507677 (=> (not res!308639) (not e!297093))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507677 (= res!308639 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507678 () Bool)

(declare-fun e!297094 () Bool)

(assert (=> b!507678 (= e!297092 (not e!297094))))

(declare-fun res!308644 () Bool)

(assert (=> b!507678 (=> res!308644 e!297094)))

(declare-fun lt!231920 () (_ BitVec 32))

(declare-fun lt!231924 () array!32598)

(declare-fun lt!231923 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4146 0))(
  ( (MissingZero!4146 (index!18772 (_ BitVec 32))) (Found!4146 (index!18773 (_ BitVec 32))) (Intermediate!4146 (undefined!4958 Bool) (index!18774 (_ BitVec 32)) (x!47763 (_ BitVec 32))) (Undefined!4146) (MissingVacant!4146 (index!18775 (_ BitVec 32))) )
))
(declare-fun lt!231921 () SeekEntryResult!4146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32598 (_ BitVec 32)) SeekEntryResult!4146)

(assert (=> b!507678 (= res!308644 (= lt!231921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231920 lt!231923 lt!231924 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231925 () (_ BitVec 32))

(assert (=> b!507678 (= lt!231921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231925 (select (arr!15679 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507678 (= lt!231920 (toIndex!0 lt!231923 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507678 (= lt!231923 (select (store (arr!15679 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507678 (= lt!231925 (toIndex!0 (select (arr!15679 a!3235) j!176) mask!3524))))

(assert (=> b!507678 (= lt!231924 (array!32599 (store (arr!15679 a!3235) i!1204 k0!2280) (size!16043 a!3235)))))

(declare-fun e!297095 () Bool)

(assert (=> b!507678 e!297095))

(declare-fun res!308642 () Bool)

(assert (=> b!507678 (=> (not res!308642) (not e!297095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32598 (_ BitVec 32)) Bool)

(assert (=> b!507678 (= res!308642 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15580 0))(
  ( (Unit!15581) )
))
(declare-fun lt!231917 () Unit!15580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15580)

(assert (=> b!507678 (= lt!231917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507679 () Bool)

(declare-fun e!297091 () Bool)

(assert (=> b!507679 (= e!297094 e!297091)))

(declare-fun res!308637 () Bool)

(assert (=> b!507679 (=> res!308637 e!297091)))

(declare-fun lt!231919 () Bool)

(assert (=> b!507679 (= res!308637 (or (and (not lt!231919) (undefined!4958 lt!231921)) (and (not lt!231919) (not (undefined!4958 lt!231921)))))))

(get-info :version)

(assert (=> b!507679 (= lt!231919 (not ((_ is Intermediate!4146) lt!231921)))))

(declare-fun b!507680 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32598 (_ BitVec 32)) SeekEntryResult!4146)

(assert (=> b!507680 (= e!297095 (= (seekEntryOrOpen!0 (select (arr!15679 a!3235) j!176) a!3235 mask!3524) (Found!4146 j!176)))))

(declare-fun b!507681 () Bool)

(assert (=> b!507681 (= e!297093 e!297092)))

(declare-fun res!308638 () Bool)

(assert (=> b!507681 (=> (not res!308638) (not e!297092))))

(declare-fun lt!231922 () SeekEntryResult!4146)

(assert (=> b!507681 (= res!308638 (or (= lt!231922 (MissingZero!4146 i!1204)) (= lt!231922 (MissingVacant!4146 i!1204))))))

(assert (=> b!507681 (= lt!231922 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507682 () Bool)

(declare-fun res!308645 () Bool)

(assert (=> b!507682 (=> (not res!308645) (not e!297093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507682 (= res!308645 (validKeyInArray!0 (select (arr!15679 a!3235) j!176)))))

(declare-fun b!507683 () Bool)

(assert (=> b!507683 (= e!297091 true)))

(declare-fun lt!231918 () SeekEntryResult!4146)

(assert (=> b!507683 (= lt!231918 (seekEntryOrOpen!0 lt!231923 lt!231924 mask!3524))))

(assert (=> b!507683 false))

(declare-fun b!507684 () Bool)

(declare-fun res!308636 () Bool)

(assert (=> b!507684 (=> (not res!308636) (not e!297092))))

(assert (=> b!507684 (= res!308636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507685 () Bool)

(declare-fun res!308641 () Bool)

(assert (=> b!507685 (=> (not res!308641) (not e!297093))))

(assert (=> b!507685 (= res!308641 (and (= (size!16043 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16043 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16043 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507686 () Bool)

(declare-fun res!308643 () Bool)

(assert (=> b!507686 (=> (not res!308643) (not e!297093))))

(assert (=> b!507686 (= res!308643 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45842 res!308635) b!507685))

(assert (= (and b!507685 res!308641) b!507682))

(assert (= (and b!507682 res!308645) b!507686))

(assert (= (and b!507686 res!308643) b!507677))

(assert (= (and b!507677 res!308639) b!507681))

(assert (= (and b!507681 res!308638) b!507684))

(assert (= (and b!507684 res!308636) b!507676))

(assert (= (and b!507676 res!308640) b!507678))

(assert (= (and b!507678 res!308642) b!507680))

(assert (= (and b!507678 (not res!308644)) b!507679))

(assert (= (and b!507679 (not res!308637)) b!507683))

(declare-fun m!488483 () Bool)

(assert (=> b!507682 m!488483))

(assert (=> b!507682 m!488483))

(declare-fun m!488485 () Bool)

(assert (=> b!507682 m!488485))

(declare-fun m!488487 () Bool)

(assert (=> b!507686 m!488487))

(declare-fun m!488489 () Bool)

(assert (=> start!45842 m!488489))

(declare-fun m!488491 () Bool)

(assert (=> start!45842 m!488491))

(declare-fun m!488493 () Bool)

(assert (=> b!507681 m!488493))

(declare-fun m!488495 () Bool)

(assert (=> b!507676 m!488495))

(declare-fun m!488497 () Bool)

(assert (=> b!507683 m!488497))

(declare-fun m!488499 () Bool)

(assert (=> b!507684 m!488499))

(declare-fun m!488501 () Bool)

(assert (=> b!507678 m!488501))

(declare-fun m!488503 () Bool)

(assert (=> b!507678 m!488503))

(declare-fun m!488505 () Bool)

(assert (=> b!507678 m!488505))

(declare-fun m!488507 () Bool)

(assert (=> b!507678 m!488507))

(declare-fun m!488509 () Bool)

(assert (=> b!507678 m!488509))

(assert (=> b!507678 m!488483))

(declare-fun m!488511 () Bool)

(assert (=> b!507678 m!488511))

(assert (=> b!507678 m!488483))

(declare-fun m!488513 () Bool)

(assert (=> b!507678 m!488513))

(assert (=> b!507678 m!488483))

(declare-fun m!488515 () Bool)

(assert (=> b!507678 m!488515))

(declare-fun m!488517 () Bool)

(assert (=> b!507677 m!488517))

(assert (=> b!507680 m!488483))

(assert (=> b!507680 m!488483))

(declare-fun m!488519 () Bool)

(assert (=> b!507680 m!488519))

(check-sat (not b!507676) (not b!507683) (not b!507680) (not b!507678) (not start!45842) (not b!507684) (not b!507677) (not b!507686) (not b!507682) (not b!507681))
(check-sat)
