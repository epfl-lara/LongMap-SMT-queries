; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45970 () Bool)

(assert start!45970)

(declare-datatypes ((array!32681 0))(
  ( (array!32682 (arr!15719 (Array (_ BitVec 32) (_ BitVec 64))) (size!16083 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32681)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297678 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!508893 () Bool)

(declare-datatypes ((SeekEntryResult!4186 0))(
  ( (MissingZero!4186 (index!18932 (_ BitVec 32))) (Found!4186 (index!18933 (_ BitVec 32))) (Intermediate!4186 (undefined!4998 Bool) (index!18934 (_ BitVec 32)) (x!47907 (_ BitVec 32))) (Undefined!4186) (MissingVacant!4186 (index!18935 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32681 (_ BitVec 32)) SeekEntryResult!4186)

(assert (=> b!508893 (= e!297678 (= (seekEntryOrOpen!0 (select (arr!15719 a!3235) j!176) a!3235 mask!3524) (Found!4186 j!176)))))

(declare-fun b!508894 () Bool)

(declare-fun res!309738 () Bool)

(declare-fun e!297681 () Bool)

(assert (=> b!508894 (=> (not res!309738) (not e!297681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508894 (= res!309738 (validKeyInArray!0 (select (arr!15719 a!3235) j!176)))))

(declare-fun b!508895 () Bool)

(declare-fun e!297680 () Bool)

(assert (=> b!508895 (= e!297681 e!297680)))

(declare-fun res!309743 () Bool)

(assert (=> b!508895 (=> (not res!309743) (not e!297680))))

(declare-fun lt!232383 () SeekEntryResult!4186)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508895 (= res!309743 (or (= lt!232383 (MissingZero!4186 i!1204)) (= lt!232383 (MissingVacant!4186 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!508895 (= lt!232383 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!508896 () Bool)

(assert (=> b!508896 (= e!297680 (not true))))

(assert (=> b!508896 e!297678))

(declare-fun res!309745 () Bool)

(assert (=> b!508896 (=> (not res!309745) (not e!297678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32681 (_ BitVec 32)) Bool)

(assert (=> b!508896 (= res!309745 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15630 0))(
  ( (Unit!15631) )
))
(declare-fun lt!232384 () Unit!15630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15630)

(assert (=> b!508896 (= lt!232384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508897 () Bool)

(declare-fun res!309742 () Bool)

(assert (=> b!508897 (=> (not res!309742) (not e!297680))))

(declare-datatypes ((List!9877 0))(
  ( (Nil!9874) (Cons!9873 (h!10750 (_ BitVec 64)) (t!16105 List!9877)) )
))
(declare-fun arrayNoDuplicates!0 (array!32681 (_ BitVec 32) List!9877) Bool)

(assert (=> b!508897 (= res!309742 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9874))))

(declare-fun b!508898 () Bool)

(declare-fun res!309740 () Bool)

(assert (=> b!508898 (=> (not res!309740) (not e!297681))))

(declare-fun arrayContainsKey!0 (array!32681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508898 (= res!309740 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508899 () Bool)

(declare-fun res!309744 () Bool)

(assert (=> b!508899 (=> (not res!309744) (not e!297681))))

(assert (=> b!508899 (= res!309744 (validKeyInArray!0 k!2280))))

(declare-fun b!508900 () Bool)

(declare-fun res!309739 () Bool)

(assert (=> b!508900 (=> (not res!309739) (not e!297680))))

(assert (=> b!508900 (= res!309739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309746 () Bool)

(assert (=> start!45970 (=> (not res!309746) (not e!297681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45970 (= res!309746 (validMask!0 mask!3524))))

(assert (=> start!45970 e!297681))

(assert (=> start!45970 true))

(declare-fun array_inv!11515 (array!32681) Bool)

(assert (=> start!45970 (array_inv!11515 a!3235)))

(declare-fun b!508901 () Bool)

(declare-fun res!309741 () Bool)

(assert (=> b!508901 (=> (not res!309741) (not e!297681))))

(assert (=> b!508901 (= res!309741 (and (= (size!16083 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16083 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16083 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45970 res!309746) b!508901))

(assert (= (and b!508901 res!309741) b!508894))

(assert (= (and b!508894 res!309738) b!508899))

(assert (= (and b!508899 res!309744) b!508898))

(assert (= (and b!508898 res!309740) b!508895))

(assert (= (and b!508895 res!309743) b!508900))

(assert (= (and b!508900 res!309739) b!508897))

(assert (= (and b!508897 res!309742) b!508896))

(assert (= (and b!508896 res!309745) b!508893))

(declare-fun m!489627 () Bool)

(assert (=> b!508896 m!489627))

(declare-fun m!489629 () Bool)

(assert (=> b!508896 m!489629))

(declare-fun m!489631 () Bool)

(assert (=> b!508898 m!489631))

(declare-fun m!489633 () Bool)

(assert (=> b!508899 m!489633))

(declare-fun m!489635 () Bool)

(assert (=> b!508897 m!489635))

(declare-fun m!489637 () Bool)

(assert (=> start!45970 m!489637))

(declare-fun m!489639 () Bool)

(assert (=> start!45970 m!489639))

(declare-fun m!489641 () Bool)

(assert (=> b!508900 m!489641))

(declare-fun m!489643 () Bool)

(assert (=> b!508894 m!489643))

(assert (=> b!508894 m!489643))

(declare-fun m!489645 () Bool)

(assert (=> b!508894 m!489645))

(declare-fun m!489647 () Bool)

(assert (=> b!508895 m!489647))

(assert (=> b!508893 m!489643))

(assert (=> b!508893 m!489643))

(declare-fun m!489649 () Bool)

(assert (=> b!508893 m!489649))

(push 1)

(assert (not b!508895))

