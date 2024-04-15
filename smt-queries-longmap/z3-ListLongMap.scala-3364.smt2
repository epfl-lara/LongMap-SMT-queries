; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46224 () Bool)

(assert start!46224)

(declare-fun b!511759 () Bool)

(declare-fun res!312567 () Bool)

(declare-fun e!298928 () Bool)

(assert (=> b!511759 (=> (not res!312567) (not e!298928))))

(declare-datatypes ((array!32888 0))(
  ( (array!32889 (arr!15821 (Array (_ BitVec 32) (_ BitVec 64))) (size!16186 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32888)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511759 (= res!312567 (validKeyInArray!0 (select (arr!15821 a!3235) j!176)))))

(declare-fun b!511760 () Bool)

(declare-fun res!312571 () Bool)

(declare-fun e!298929 () Bool)

(assert (=> b!511760 (=> (not res!312571) (not e!298929))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32888 (_ BitVec 32)) Bool)

(assert (=> b!511760 (= res!312571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511761 () Bool)

(declare-fun res!312563 () Bool)

(declare-fun e!298927 () Bool)

(assert (=> b!511761 (=> res!312563 e!298927)))

(declare-datatypes ((SeekEntryResult!4285 0))(
  ( (MissingZero!4285 (index!19328 (_ BitVec 32))) (Found!4285 (index!19329 (_ BitVec 32))) (Intermediate!4285 (undefined!5097 Bool) (index!19330 (_ BitVec 32)) (x!48287 (_ BitVec 32))) (Undefined!4285) (MissingVacant!4285 (index!19331 (_ BitVec 32))) )
))
(declare-fun lt!234101 () SeekEntryResult!4285)

(get-info :version)

(assert (=> b!511761 (= res!312563 (or (not ((_ is Intermediate!4285) lt!234101)) (not (undefined!5097 lt!234101))))))

(declare-fun b!511762 () Bool)

(assert (=> b!511762 (= e!298927 false)))

(declare-fun lt!234106 () SeekEntryResult!4285)

(assert (=> b!511762 (= lt!234106 Undefined!4285)))

(declare-fun b!511763 () Bool)

(declare-fun res!312570 () Bool)

(assert (=> b!511763 (=> (not res!312570) (not e!298929))))

(declare-datatypes ((List!10018 0))(
  ( (Nil!10015) (Cons!10014 (h!10894 (_ BitVec 64)) (t!16237 List!10018)) )
))
(declare-fun arrayNoDuplicates!0 (array!32888 (_ BitVec 32) List!10018) Bool)

(assert (=> b!511763 (= res!312570 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10015))))

(declare-fun b!511764 () Bool)

(assert (=> b!511764 (= e!298929 (not e!298927))))

(declare-fun res!312565 () Bool)

(assert (=> b!511764 (=> res!312565 e!298927)))

(declare-fun lt!234102 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32888 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!511764 (= res!312565 (= lt!234101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234102 (select (store (arr!15821 a!3235) i!1204 k0!2280) j!176) (array!32889 (store (arr!15821 a!3235) i!1204 k0!2280) (size!16186 a!3235)) mask!3524)))))

(declare-fun lt!234104 () (_ BitVec 32))

(assert (=> b!511764 (= lt!234101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234104 (select (arr!15821 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511764 (= lt!234102 (toIndex!0 (select (store (arr!15821 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511764 (= lt!234104 (toIndex!0 (select (arr!15821 a!3235) j!176) mask!3524))))

(assert (=> b!511764 (= lt!234106 (Found!4285 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32888 (_ BitVec 32)) SeekEntryResult!4285)

(assert (=> b!511764 (= lt!234106 (seekEntryOrOpen!0 (select (arr!15821 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511764 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15814 0))(
  ( (Unit!15815) )
))
(declare-fun lt!234105 () Unit!15814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15814)

(assert (=> b!511764 (= lt!234105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511765 () Bool)

(assert (=> b!511765 (= e!298928 e!298929)))

(declare-fun res!312569 () Bool)

(assert (=> b!511765 (=> (not res!312569) (not e!298929))))

(declare-fun lt!234103 () SeekEntryResult!4285)

(assert (=> b!511765 (= res!312569 (or (= lt!234103 (MissingZero!4285 i!1204)) (= lt!234103 (MissingVacant!4285 i!1204))))))

(assert (=> b!511765 (= lt!234103 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!312572 () Bool)

(assert (=> start!46224 (=> (not res!312572) (not e!298928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46224 (= res!312572 (validMask!0 mask!3524))))

(assert (=> start!46224 e!298928))

(assert (=> start!46224 true))

(declare-fun array_inv!11704 (array!32888) Bool)

(assert (=> start!46224 (array_inv!11704 a!3235)))

(declare-fun b!511766 () Bool)

(declare-fun res!312568 () Bool)

(assert (=> b!511766 (=> (not res!312568) (not e!298928))))

(declare-fun arrayContainsKey!0 (array!32888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511766 (= res!312568 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511767 () Bool)

(declare-fun res!312566 () Bool)

(assert (=> b!511767 (=> (not res!312566) (not e!298928))))

(assert (=> b!511767 (= res!312566 (and (= (size!16186 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16186 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16186 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511768 () Bool)

(declare-fun res!312564 () Bool)

(assert (=> b!511768 (=> (not res!312564) (not e!298928))))

(assert (=> b!511768 (= res!312564 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46224 res!312572) b!511767))

(assert (= (and b!511767 res!312566) b!511759))

(assert (= (and b!511759 res!312567) b!511768))

(assert (= (and b!511768 res!312564) b!511766))

(assert (= (and b!511766 res!312568) b!511765))

(assert (= (and b!511765 res!312569) b!511760))

(assert (= (and b!511760 res!312571) b!511763))

(assert (= (and b!511763 res!312570) b!511764))

(assert (= (and b!511764 (not res!312565)) b!511761))

(assert (= (and b!511761 (not res!312563)) b!511762))

(declare-fun m!492853 () Bool)

(assert (=> b!511764 m!492853))

(declare-fun m!492855 () Bool)

(assert (=> b!511764 m!492855))

(declare-fun m!492857 () Bool)

(assert (=> b!511764 m!492857))

(declare-fun m!492859 () Bool)

(assert (=> b!511764 m!492859))

(declare-fun m!492861 () Bool)

(assert (=> b!511764 m!492861))

(assert (=> b!511764 m!492853))

(declare-fun m!492863 () Bool)

(assert (=> b!511764 m!492863))

(declare-fun m!492865 () Bool)

(assert (=> b!511764 m!492865))

(assert (=> b!511764 m!492853))

(declare-fun m!492867 () Bool)

(assert (=> b!511764 m!492867))

(assert (=> b!511764 m!492861))

(declare-fun m!492869 () Bool)

(assert (=> b!511764 m!492869))

(assert (=> b!511764 m!492861))

(declare-fun m!492871 () Bool)

(assert (=> b!511764 m!492871))

(assert (=> b!511764 m!492853))

(declare-fun m!492873 () Bool)

(assert (=> b!511765 m!492873))

(declare-fun m!492875 () Bool)

(assert (=> start!46224 m!492875))

(declare-fun m!492877 () Bool)

(assert (=> start!46224 m!492877))

(assert (=> b!511759 m!492853))

(assert (=> b!511759 m!492853))

(declare-fun m!492879 () Bool)

(assert (=> b!511759 m!492879))

(declare-fun m!492881 () Bool)

(assert (=> b!511766 m!492881))

(declare-fun m!492883 () Bool)

(assert (=> b!511760 m!492883))

(declare-fun m!492885 () Bool)

(assert (=> b!511763 m!492885))

(declare-fun m!492887 () Bool)

(assert (=> b!511768 m!492887))

(check-sat (not b!511768) (not b!511764) (not b!511763) (not b!511760) (not b!511765) (not b!511759) (not start!46224) (not b!511766))
(check-sat)
