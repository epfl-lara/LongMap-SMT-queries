; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51608 () Bool)

(assert start!51608)

(declare-fun b!564647 () Bool)

(declare-fun e!325117 () Bool)

(declare-fun e!325118 () Bool)

(assert (=> b!564647 (= e!325117 e!325118)))

(declare-fun res!355944 () Bool)

(assert (=> b!564647 (=> (not res!355944) (not e!325118))))

(declare-datatypes ((SeekEntryResult!5488 0))(
  ( (MissingZero!5488 (index!24179 (_ BitVec 32))) (Found!5488 (index!24180 (_ BitVec 32))) (Intermediate!5488 (undefined!6300 Bool) (index!24181 (_ BitVec 32)) (x!53058 (_ BitVec 32))) (Undefined!5488) (MissingVacant!5488 (index!24182 (_ BitVec 32))) )
))
(declare-fun lt!257476 () SeekEntryResult!5488)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564647 (= res!355944 (or (= lt!257476 (MissingZero!5488 i!1132)) (= lt!257476 (MissingVacant!5488 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35482 0))(
  ( (array!35483 (arr!17042 (Array (_ BitVec 32) (_ BitVec 64))) (size!17407 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35482)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35482 (_ BitVec 32)) SeekEntryResult!5488)

(assert (=> b!564647 (= lt!257476 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564648 () Bool)

(declare-fun res!355946 () Bool)

(assert (=> b!564648 (=> (not res!355946) (not e!325117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564648 (= res!355946 (validKeyInArray!0 k0!1914))))

(declare-fun b!564649 () Bool)

(declare-fun res!355945 () Bool)

(assert (=> b!564649 (=> (not res!355945) (not e!325117))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564649 (= res!355945 (and (= (size!17407 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17407 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17407 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564650 () Bool)

(assert (=> b!564650 (= e!325118 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35482 (_ BitVec 32)) Bool)

(assert (=> b!564650 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17664 0))(
  ( (Unit!17665) )
))
(declare-fun lt!257475 () Unit!17664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17664)

(assert (=> b!564650 (= lt!257475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564651 () Bool)

(declare-fun res!355943 () Bool)

(assert (=> b!564651 (=> (not res!355943) (not e!325117))))

(assert (=> b!564651 (= res!355943 (validKeyInArray!0 (select (arr!17042 a!3118) j!142)))))

(declare-fun res!355942 () Bool)

(assert (=> start!51608 (=> (not res!355942) (not e!325117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51608 (= res!355942 (validMask!0 mask!3119))))

(assert (=> start!51608 e!325117))

(assert (=> start!51608 true))

(declare-fun array_inv!12925 (array!35482) Bool)

(assert (=> start!51608 (array_inv!12925 a!3118)))

(declare-fun b!564652 () Bool)

(declare-fun res!355949 () Bool)

(assert (=> b!564652 (=> (not res!355949) (not e!325117))))

(declare-fun arrayContainsKey!0 (array!35482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564652 (= res!355949 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564653 () Bool)

(declare-fun res!355948 () Bool)

(assert (=> b!564653 (=> (not res!355948) (not e!325118))))

(declare-datatypes ((List!11161 0))(
  ( (Nil!11158) (Cons!11157 (h!12160 (_ BitVec 64)) (t!17380 List!11161)) )
))
(declare-fun arrayNoDuplicates!0 (array!35482 (_ BitVec 32) List!11161) Bool)

(assert (=> b!564653 (= res!355948 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11158))))

(declare-fun b!564654 () Bool)

(declare-fun res!355941 () Bool)

(assert (=> b!564654 (=> (not res!355941) (not e!325118))))

(assert (=> b!564654 (= res!355941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564655 () Bool)

(declare-fun res!355947 () Bool)

(assert (=> b!564655 (=> (not res!355947) (not e!325118))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35482 (_ BitVec 32)) SeekEntryResult!5488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564655 (= res!355947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17042 a!3118) j!142) mask!3119) (select (arr!17042 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17042 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17042 a!3118) i!1132 k0!1914) j!142) (array!35483 (store (arr!17042 a!3118) i!1132 k0!1914) (size!17407 a!3118)) mask!3119)))))

(assert (= (and start!51608 res!355942) b!564649))

(assert (= (and b!564649 res!355945) b!564651))

(assert (= (and b!564651 res!355943) b!564648))

(assert (= (and b!564648 res!355946) b!564652))

(assert (= (and b!564652 res!355949) b!564647))

(assert (= (and b!564647 res!355944) b!564654))

(assert (= (and b!564654 res!355941) b!564653))

(assert (= (and b!564653 res!355948) b!564655))

(assert (= (and b!564655 res!355947) b!564650))

(declare-fun m!542639 () Bool)

(assert (=> b!564653 m!542639))

(declare-fun m!542641 () Bool)

(assert (=> b!564654 m!542641))

(declare-fun m!542643 () Bool)

(assert (=> b!564651 m!542643))

(assert (=> b!564651 m!542643))

(declare-fun m!542645 () Bool)

(assert (=> b!564651 m!542645))

(assert (=> b!564655 m!542643))

(declare-fun m!542647 () Bool)

(assert (=> b!564655 m!542647))

(assert (=> b!564655 m!542643))

(declare-fun m!542649 () Bool)

(assert (=> b!564655 m!542649))

(declare-fun m!542651 () Bool)

(assert (=> b!564655 m!542651))

(assert (=> b!564655 m!542649))

(declare-fun m!542653 () Bool)

(assert (=> b!564655 m!542653))

(assert (=> b!564655 m!542647))

(assert (=> b!564655 m!542643))

(declare-fun m!542655 () Bool)

(assert (=> b!564655 m!542655))

(declare-fun m!542657 () Bool)

(assert (=> b!564655 m!542657))

(assert (=> b!564655 m!542649))

(assert (=> b!564655 m!542651))

(declare-fun m!542659 () Bool)

(assert (=> start!51608 m!542659))

(declare-fun m!542661 () Bool)

(assert (=> start!51608 m!542661))

(declare-fun m!542663 () Bool)

(assert (=> b!564650 m!542663))

(declare-fun m!542665 () Bool)

(assert (=> b!564650 m!542665))

(declare-fun m!542667 () Bool)

(assert (=> b!564652 m!542667))

(declare-fun m!542669 () Bool)

(assert (=> b!564647 m!542669))

(declare-fun m!542671 () Bool)

(assert (=> b!564648 m!542671))

(check-sat (not b!564647) (not b!564651) (not start!51608) (not b!564655) (not b!564652) (not b!564653) (not b!564654) (not b!564648) (not b!564650))
(check-sat)
