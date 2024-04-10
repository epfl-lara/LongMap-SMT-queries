; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45232 () Bool)

(assert start!45232)

(declare-fun b!496651 () Bool)

(declare-fun res!299040 () Bool)

(declare-fun e!291220 () Bool)

(assert (=> b!496651 (=> (not res!299040) (not e!291220))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496651 (= res!299040 (validKeyInArray!0 k!2280))))

(declare-fun b!496652 () Bool)

(declare-fun e!291222 () Bool)

(declare-fun e!291221 () Bool)

(assert (=> b!496652 (= e!291222 (not e!291221))))

(declare-fun res!299048 () Bool)

(assert (=> b!496652 (=> res!299048 e!291221)))

(declare-datatypes ((SeekEntryResult!3910 0))(
  ( (MissingZero!3910 (index!17819 (_ BitVec 32))) (Found!3910 (index!17820 (_ BitVec 32))) (Intermediate!3910 (undefined!4722 Bool) (index!17821 (_ BitVec 32)) (x!46874 (_ BitVec 32))) (Undefined!3910) (MissingVacant!3910 (index!17822 (_ BitVec 32))) )
))
(declare-fun lt!224839 () SeekEntryResult!3910)

(declare-datatypes ((array!32120 0))(
  ( (array!32121 (arr!15443 (Array (_ BitVec 32) (_ BitVec 64))) (size!15807 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32120)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32120 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!496652 (= res!299048 (= lt!224839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224840 (select (store (arr!15443 a!3235) i!1204 k!2280) j!176) (array!32121 (store (arr!15443 a!3235) i!1204 k!2280) (size!15807 a!3235)) mask!3524)))))

(declare-fun lt!224838 () (_ BitVec 32))

(assert (=> b!496652 (= lt!224839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224838 (select (arr!15443 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496652 (= lt!224840 (toIndex!0 (select (store (arr!15443 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496652 (= lt!224838 (toIndex!0 (select (arr!15443 a!3235) j!176) mask!3524))))

(declare-fun e!291218 () Bool)

(assert (=> b!496652 e!291218))

(declare-fun res!299047 () Bool)

(assert (=> b!496652 (=> (not res!299047) (not e!291218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32120 (_ BitVec 32)) Bool)

(assert (=> b!496652 (= res!299047 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14766 0))(
  ( (Unit!14767) )
))
(declare-fun lt!224841 () Unit!14766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14766)

(assert (=> b!496652 (= lt!224841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496653 () Bool)

(assert (=> b!496653 (= e!291220 e!291222)))

(declare-fun res!299041 () Bool)

(assert (=> b!496653 (=> (not res!299041) (not e!291222))))

(declare-fun lt!224842 () SeekEntryResult!3910)

(assert (=> b!496653 (= res!299041 (or (= lt!224842 (MissingZero!3910 i!1204)) (= lt!224842 (MissingVacant!3910 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32120 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!496653 (= lt!224842 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496654 () Bool)

(assert (=> b!496654 (= e!291218 (= (seekEntryOrOpen!0 (select (arr!15443 a!3235) j!176) a!3235 mask!3524) (Found!3910 j!176)))))

(declare-fun b!496655 () Bool)

(declare-fun res!299043 () Bool)

(assert (=> b!496655 (=> (not res!299043) (not e!291220))))

(assert (=> b!496655 (= res!299043 (validKeyInArray!0 (select (arr!15443 a!3235) j!176)))))

(declare-fun b!496656 () Bool)

(assert (=> b!496656 (= e!291221 true)))

(assert (=> b!496656 (and (bvslt (x!46874 lt!224839) #b01111111111111111111111111111110) (or (= (select (arr!15443 a!3235) (index!17821 lt!224839)) (select (arr!15443 a!3235) j!176)) (= (select (arr!15443 a!3235) (index!17821 lt!224839)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15443 a!3235) (index!17821 lt!224839)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!299045 () Bool)

(assert (=> start!45232 (=> (not res!299045) (not e!291220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45232 (= res!299045 (validMask!0 mask!3524))))

(assert (=> start!45232 e!291220))

(assert (=> start!45232 true))

(declare-fun array_inv!11239 (array!32120) Bool)

(assert (=> start!45232 (array_inv!11239 a!3235)))

(declare-fun b!496657 () Bool)

(declare-fun res!299044 () Bool)

(assert (=> b!496657 (=> (not res!299044) (not e!291220))))

(assert (=> b!496657 (= res!299044 (and (= (size!15807 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15807 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15807 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496658 () Bool)

(declare-fun res!299038 () Bool)

(assert (=> b!496658 (=> (not res!299038) (not e!291220))))

(declare-fun arrayContainsKey!0 (array!32120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496658 (= res!299038 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496659 () Bool)

(declare-fun res!299039 () Bool)

(assert (=> b!496659 (=> (not res!299039) (not e!291222))))

(assert (=> b!496659 (= res!299039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496660 () Bool)

(declare-fun res!299042 () Bool)

(assert (=> b!496660 (=> res!299042 e!291221)))

(assert (=> b!496660 (= res!299042 (or (undefined!4722 lt!224839) (not (is-Intermediate!3910 lt!224839))))))

(declare-fun b!496661 () Bool)

(declare-fun res!299046 () Bool)

(assert (=> b!496661 (=> (not res!299046) (not e!291222))))

(declare-datatypes ((List!9601 0))(
  ( (Nil!9598) (Cons!9597 (h!10468 (_ BitVec 64)) (t!15829 List!9601)) )
))
(declare-fun arrayNoDuplicates!0 (array!32120 (_ BitVec 32) List!9601) Bool)

(assert (=> b!496661 (= res!299046 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9598))))

(assert (= (and start!45232 res!299045) b!496657))

(assert (= (and b!496657 res!299044) b!496655))

(assert (= (and b!496655 res!299043) b!496651))

(assert (= (and b!496651 res!299040) b!496658))

(assert (= (and b!496658 res!299038) b!496653))

(assert (= (and b!496653 res!299041) b!496659))

(assert (= (and b!496659 res!299039) b!496661))

(assert (= (and b!496661 res!299046) b!496652))

(assert (= (and b!496652 res!299047) b!496654))

(assert (= (and b!496652 (not res!299048)) b!496660))

(assert (= (and b!496660 (not res!299042)) b!496656))

(declare-fun m!477919 () Bool)

(assert (=> b!496652 m!477919))

(declare-fun m!477921 () Bool)

(assert (=> b!496652 m!477921))

(declare-fun m!477923 () Bool)

(assert (=> b!496652 m!477923))

(declare-fun m!477925 () Bool)

(assert (=> b!496652 m!477925))

(declare-fun m!477927 () Bool)

(assert (=> b!496652 m!477927))

(declare-fun m!477929 () Bool)

(assert (=> b!496652 m!477929))

(assert (=> b!496652 m!477927))

(declare-fun m!477931 () Bool)

(assert (=> b!496652 m!477931))

(assert (=> b!496652 m!477923))

(declare-fun m!477933 () Bool)

(assert (=> b!496652 m!477933))

(assert (=> b!496652 m!477927))

(declare-fun m!477935 () Bool)

(assert (=> b!496652 m!477935))

(assert (=> b!496652 m!477923))

(declare-fun m!477937 () Bool)

(assert (=> b!496658 m!477937))

(declare-fun m!477939 () Bool)

(assert (=> b!496661 m!477939))

(assert (=> b!496655 m!477927))

(assert (=> b!496655 m!477927))

(declare-fun m!477941 () Bool)

(assert (=> b!496655 m!477941))

(declare-fun m!477943 () Bool)

(assert (=> b!496651 m!477943))

(declare-fun m!477945 () Bool)

(assert (=> b!496653 m!477945))

(declare-fun m!477947 () Bool)

(assert (=> b!496656 m!477947))

(assert (=> b!496656 m!477927))

(declare-fun m!477949 () Bool)

(assert (=> start!45232 m!477949))

(declare-fun m!477951 () Bool)

(assert (=> start!45232 m!477951))

(declare-fun m!477953 () Bool)

(assert (=> b!496659 m!477953))

(assert (=> b!496654 m!477927))

(assert (=> b!496654 m!477927))

(declare-fun m!477955 () Bool)

(assert (=> b!496654 m!477955))

(push 1)

