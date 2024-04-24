; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45968 () Bool)

(assert start!45968)

(declare-fun b!508940 () Bool)

(declare-fun e!297688 () Bool)

(declare-fun e!297690 () Bool)

(assert (=> b!508940 (= e!297688 e!297690)))

(declare-fun res!309842 () Bool)

(assert (=> b!508940 (=> (not res!309842) (not e!297690))))

(declare-datatypes ((SeekEntryResult!4141 0))(
  ( (MissingZero!4141 (index!18752 (_ BitVec 32))) (Found!4141 (index!18753 (_ BitVec 32))) (Intermediate!4141 (undefined!4953 Bool) (index!18754 (_ BitVec 32)) (x!47875 (_ BitVec 32))) (Undefined!4141) (MissingVacant!4141 (index!18755 (_ BitVec 32))) )
))
(declare-fun lt!232437 () SeekEntryResult!4141)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508940 (= res!309842 (or (= lt!232437 (MissingZero!4141 i!1204)) (= lt!232437 (MissingVacant!4141 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32680 0))(
  ( (array!32681 (arr!15718 (Array (_ BitVec 32) (_ BitVec 64))) (size!16082 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32680)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32680 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!508940 (= lt!232437 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508941 () Bool)

(declare-fun res!309846 () Bool)

(assert (=> b!508941 (=> (not res!309846) (not e!297688))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508941 (= res!309846 (validKeyInArray!0 (select (arr!15718 a!3235) j!176)))))

(declare-fun b!508942 () Bool)

(declare-fun res!309839 () Bool)

(assert (=> b!508942 (=> (not res!309839) (not e!297690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32680 (_ BitVec 32)) Bool)

(assert (=> b!508942 (= res!309839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508943 () Bool)

(declare-fun res!309844 () Bool)

(assert (=> b!508943 (=> (not res!309844) (not e!297688))))

(declare-fun arrayContainsKey!0 (array!32680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508943 (= res!309844 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508944 () Bool)

(declare-fun res!309841 () Bool)

(assert (=> b!508944 (=> (not res!309841) (not e!297690))))

(declare-datatypes ((List!9783 0))(
  ( (Nil!9780) (Cons!9779 (h!10656 (_ BitVec 64)) (t!16003 List!9783)) )
))
(declare-fun arrayNoDuplicates!0 (array!32680 (_ BitVec 32) List!9783) Bool)

(assert (=> b!508944 (= res!309841 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9780))))

(declare-fun b!508946 () Bool)

(declare-fun res!309847 () Bool)

(assert (=> b!508946 (=> (not res!309847) (not e!297688))))

(assert (=> b!508946 (= res!309847 (validKeyInArray!0 k0!2280))))

(declare-fun b!508947 () Bool)

(declare-fun res!309843 () Bool)

(assert (=> b!508947 (=> (not res!309843) (not e!297688))))

(assert (=> b!508947 (= res!309843 (and (= (size!16082 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16082 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16082 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508948 () Bool)

(assert (=> b!508948 (= e!297690 (not true))))

(declare-fun lt!232436 () (_ BitVec 32))

(declare-fun lt!232439 () SeekEntryResult!4141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32680 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!508948 (= lt!232439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232436 (select (store (arr!15718 a!3235) i!1204 k0!2280) j!176) (array!32681 (store (arr!15718 a!3235) i!1204 k0!2280) (size!16082 a!3235)) mask!3524))))

(declare-fun lt!232440 () SeekEntryResult!4141)

(declare-fun lt!232438 () (_ BitVec 32))

(assert (=> b!508948 (= lt!232440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232438 (select (arr!15718 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508948 (= lt!232436 (toIndex!0 (select (store (arr!15718 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508948 (= lt!232438 (toIndex!0 (select (arr!15718 a!3235) j!176) mask!3524))))

(declare-fun e!297689 () Bool)

(assert (=> b!508948 e!297689))

(declare-fun res!309845 () Bool)

(assert (=> b!508948 (=> (not res!309845) (not e!297689))))

(assert (=> b!508948 (= res!309845 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15601 0))(
  ( (Unit!15602) )
))
(declare-fun lt!232441 () Unit!15601)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15601)

(assert (=> b!508948 (= lt!232441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309840 () Bool)

(assert (=> start!45968 (=> (not res!309840) (not e!297688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45968 (= res!309840 (validMask!0 mask!3524))))

(assert (=> start!45968 e!297688))

(assert (=> start!45968 true))

(declare-fun array_inv!11577 (array!32680) Bool)

(assert (=> start!45968 (array_inv!11577 a!3235)))

(declare-fun b!508945 () Bool)

(assert (=> b!508945 (= e!297689 (= (seekEntryOrOpen!0 (select (arr!15718 a!3235) j!176) a!3235 mask!3524) (Found!4141 j!176)))))

(assert (= (and start!45968 res!309840) b!508947))

(assert (= (and b!508947 res!309843) b!508941))

(assert (= (and b!508941 res!309846) b!508946))

(assert (= (and b!508946 res!309847) b!508943))

(assert (= (and b!508943 res!309844) b!508940))

(assert (= (and b!508940 res!309842) b!508942))

(assert (= (and b!508942 res!309839) b!508944))

(assert (= (and b!508944 res!309841) b!508948))

(assert (= (and b!508948 res!309845) b!508945))

(declare-fun m!489925 () Bool)

(assert (=> start!45968 m!489925))

(declare-fun m!489927 () Bool)

(assert (=> start!45968 m!489927))

(declare-fun m!489929 () Bool)

(assert (=> b!508940 m!489929))

(declare-fun m!489931 () Bool)

(assert (=> b!508945 m!489931))

(assert (=> b!508945 m!489931))

(declare-fun m!489933 () Bool)

(assert (=> b!508945 m!489933))

(declare-fun m!489935 () Bool)

(assert (=> b!508948 m!489935))

(declare-fun m!489937 () Bool)

(assert (=> b!508948 m!489937))

(declare-fun m!489939 () Bool)

(assert (=> b!508948 m!489939))

(assert (=> b!508948 m!489931))

(assert (=> b!508948 m!489931))

(declare-fun m!489941 () Bool)

(assert (=> b!508948 m!489941))

(declare-fun m!489943 () Bool)

(assert (=> b!508948 m!489943))

(assert (=> b!508948 m!489939))

(declare-fun m!489945 () Bool)

(assert (=> b!508948 m!489945))

(assert (=> b!508948 m!489931))

(declare-fun m!489947 () Bool)

(assert (=> b!508948 m!489947))

(assert (=> b!508948 m!489939))

(declare-fun m!489949 () Bool)

(assert (=> b!508948 m!489949))

(declare-fun m!489951 () Bool)

(assert (=> b!508943 m!489951))

(declare-fun m!489953 () Bool)

(assert (=> b!508946 m!489953))

(declare-fun m!489955 () Bool)

(assert (=> b!508942 m!489955))

(assert (=> b!508941 m!489931))

(assert (=> b!508941 m!489931))

(declare-fun m!489957 () Bool)

(assert (=> b!508941 m!489957))

(declare-fun m!489959 () Bool)

(assert (=> b!508944 m!489959))

(check-sat (not b!508948) (not b!508944) (not b!508940) (not b!508941) (not b!508946) (not b!508945) (not start!45968) (not b!508942) (not b!508943))
(check-sat)
