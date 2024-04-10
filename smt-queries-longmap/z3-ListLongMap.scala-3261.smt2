; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45440 () Bool)

(assert start!45440)

(declare-fun b!499863 () Bool)

(declare-fun e!292899 () Bool)

(declare-fun e!292897 () Bool)

(assert (=> b!499863 (= e!292899 (not e!292897))))

(declare-fun res!301775 () Bool)

(assert (=> b!499863 (=> res!301775 e!292897)))

(declare-fun lt!226732 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32265 0))(
  ( (array!32266 (arr!15514 (Array (_ BitVec 32) (_ BitVec 64))) (size!15878 (_ BitVec 32))) )
))
(declare-fun lt!226729 () array!32265)

(declare-fun lt!226735 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3981 0))(
  ( (MissingZero!3981 (index!18106 (_ BitVec 32))) (Found!3981 (index!18107 (_ BitVec 32))) (Intermediate!3981 (undefined!4793 Bool) (index!18108 (_ BitVec 32)) (x!47146 (_ BitVec 32))) (Undefined!3981) (MissingVacant!3981 (index!18109 (_ BitVec 32))) )
))
(declare-fun lt!226734 () SeekEntryResult!3981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32265 (_ BitVec 32)) SeekEntryResult!3981)

(assert (=> b!499863 (= res!301775 (= lt!226734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226735 lt!226732 lt!226729 mask!3524)))))

(declare-fun a!3235 () array!32265)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226731 () (_ BitVec 32))

(assert (=> b!499863 (= lt!226734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226731 (select (arr!15514 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499863 (= lt!226735 (toIndex!0 lt!226732 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!499863 (= lt!226732 (select (store (arr!15514 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499863 (= lt!226731 (toIndex!0 (select (arr!15514 a!3235) j!176) mask!3524))))

(assert (=> b!499863 (= lt!226729 (array!32266 (store (arr!15514 a!3235) i!1204 k0!2280) (size!15878 a!3235)))))

(declare-fun e!292898 () Bool)

(assert (=> b!499863 e!292898))

(declare-fun res!301779 () Bool)

(assert (=> b!499863 (=> (not res!301779) (not e!292898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32265 (_ BitVec 32)) Bool)

(assert (=> b!499863 (= res!301779 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15000 0))(
  ( (Unit!15001) )
))
(declare-fun lt!226736 () Unit!15000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15000)

(assert (=> b!499863 (= lt!226736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499864 () Bool)

(declare-fun res!301772 () Bool)

(declare-fun e!292895 () Bool)

(assert (=> b!499864 (=> (not res!301772) (not e!292895))))

(assert (=> b!499864 (= res!301772 (and (= (size!15878 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15878 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15878 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499865 () Bool)

(declare-fun e!292896 () Bool)

(assert (=> b!499865 (= e!292897 e!292896)))

(declare-fun res!301776 () Bool)

(assert (=> b!499865 (=> res!301776 e!292896)))

(assert (=> b!499865 (= res!301776 (or (bvsgt #b00000000000000000000000000000000 (x!47146 lt!226734)) (bvsgt (x!47146 lt!226734) #b01111111111111111111111111111110) (bvslt lt!226731 #b00000000000000000000000000000000) (bvsge lt!226731 (size!15878 a!3235)) (bvslt (index!18108 lt!226734) #b00000000000000000000000000000000) (bvsge (index!18108 lt!226734) (size!15878 a!3235)) (not (= lt!226734 (Intermediate!3981 false (index!18108 lt!226734) (x!47146 lt!226734))))))))

(assert (=> b!499865 (and (or (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226733 () Unit!15000)

(declare-fun e!292900 () Unit!15000)

(assert (=> b!499865 (= lt!226733 e!292900)))

(declare-fun c!59324 () Bool)

(assert (=> b!499865 (= c!59324 (= (select (arr!15514 a!3235) (index!18108 lt!226734)) (select (arr!15514 a!3235) j!176)))))

(assert (=> b!499865 (and (bvslt (x!47146 lt!226734) #b01111111111111111111111111111110) (or (= (select (arr!15514 a!3235) (index!18108 lt!226734)) (select (arr!15514 a!3235) j!176)) (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15514 a!3235) (index!18108 lt!226734)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499866 () Bool)

(declare-fun Unit!15002 () Unit!15000)

(assert (=> b!499866 (= e!292900 Unit!15002)))

(declare-fun lt!226737 () Unit!15000)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15000)

(assert (=> b!499866 (= lt!226737 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226731 #b00000000000000000000000000000000 (index!18108 lt!226734) (x!47146 lt!226734) mask!3524))))

(declare-fun res!301769 () Bool)

(assert (=> b!499866 (= res!301769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226731 lt!226732 lt!226729 mask!3524) (Intermediate!3981 false (index!18108 lt!226734) (x!47146 lt!226734))))))

(declare-fun e!292902 () Bool)

(assert (=> b!499866 (=> (not res!301769) (not e!292902))))

(assert (=> b!499866 e!292902))

(declare-fun b!499867 () Bool)

(declare-fun res!301774 () Bool)

(assert (=> b!499867 (=> (not res!301774) (not e!292895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499867 (= res!301774 (validKeyInArray!0 (select (arr!15514 a!3235) j!176)))))

(declare-fun b!499868 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32265 (_ BitVec 32)) SeekEntryResult!3981)

(assert (=> b!499868 (= e!292898 (= (seekEntryOrOpen!0 (select (arr!15514 a!3235) j!176) a!3235 mask!3524) (Found!3981 j!176)))))

(declare-fun b!499869 () Bool)

(declare-fun res!301780 () Bool)

(assert (=> b!499869 (=> res!301780 e!292897)))

(get-info :version)

(assert (=> b!499869 (= res!301780 (or (undefined!4793 lt!226734) (not ((_ is Intermediate!3981) lt!226734))))))

(declare-fun b!499870 () Bool)

(assert (=> b!499870 (= e!292896 true)))

(declare-fun lt!226730 () SeekEntryResult!3981)

(assert (=> b!499870 (= lt!226730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226731 lt!226732 lt!226729 mask!3524))))

(declare-fun res!301777 () Bool)

(assert (=> start!45440 (=> (not res!301777) (not e!292895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45440 (= res!301777 (validMask!0 mask!3524))))

(assert (=> start!45440 e!292895))

(assert (=> start!45440 true))

(declare-fun array_inv!11310 (array!32265) Bool)

(assert (=> start!45440 (array_inv!11310 a!3235)))

(declare-fun b!499871 () Bool)

(declare-fun res!301771 () Bool)

(assert (=> b!499871 (=> (not res!301771) (not e!292895))))

(declare-fun arrayContainsKey!0 (array!32265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499871 (= res!301771 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499872 () Bool)

(declare-fun res!301773 () Bool)

(assert (=> b!499872 (=> (not res!301773) (not e!292899))))

(declare-datatypes ((List!9672 0))(
  ( (Nil!9669) (Cons!9668 (h!10542 (_ BitVec 64)) (t!15900 List!9672)) )
))
(declare-fun arrayNoDuplicates!0 (array!32265 (_ BitVec 32) List!9672) Bool)

(assert (=> b!499872 (= res!301773 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9669))))

(declare-fun b!499873 () Bool)

(assert (=> b!499873 (= e!292902 false)))

(declare-fun b!499874 () Bool)

(declare-fun res!301770 () Bool)

(assert (=> b!499874 (=> (not res!301770) (not e!292895))))

(assert (=> b!499874 (= res!301770 (validKeyInArray!0 k0!2280))))

(declare-fun b!499875 () Bool)

(declare-fun Unit!15003 () Unit!15000)

(assert (=> b!499875 (= e!292900 Unit!15003)))

(declare-fun b!499876 () Bool)

(declare-fun res!301781 () Bool)

(assert (=> b!499876 (=> (not res!301781) (not e!292899))))

(assert (=> b!499876 (= res!301781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499877 () Bool)

(assert (=> b!499877 (= e!292895 e!292899)))

(declare-fun res!301778 () Bool)

(assert (=> b!499877 (=> (not res!301778) (not e!292899))))

(declare-fun lt!226738 () SeekEntryResult!3981)

(assert (=> b!499877 (= res!301778 (or (= lt!226738 (MissingZero!3981 i!1204)) (= lt!226738 (MissingVacant!3981 i!1204))))))

(assert (=> b!499877 (= lt!226738 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45440 res!301777) b!499864))

(assert (= (and b!499864 res!301772) b!499867))

(assert (= (and b!499867 res!301774) b!499874))

(assert (= (and b!499874 res!301770) b!499871))

(assert (= (and b!499871 res!301771) b!499877))

(assert (= (and b!499877 res!301778) b!499876))

(assert (= (and b!499876 res!301781) b!499872))

(assert (= (and b!499872 res!301773) b!499863))

(assert (= (and b!499863 res!301779) b!499868))

(assert (= (and b!499863 (not res!301775)) b!499869))

(assert (= (and b!499869 (not res!301780)) b!499865))

(assert (= (and b!499865 c!59324) b!499866))

(assert (= (and b!499865 (not c!59324)) b!499875))

(assert (= (and b!499866 res!301769) b!499873))

(assert (= (and b!499865 (not res!301776)) b!499870))

(declare-fun m!481035 () Bool)

(assert (=> b!499877 m!481035))

(declare-fun m!481037 () Bool)

(assert (=> b!499868 m!481037))

(assert (=> b!499868 m!481037))

(declare-fun m!481039 () Bool)

(assert (=> b!499868 m!481039))

(declare-fun m!481041 () Bool)

(assert (=> b!499874 m!481041))

(declare-fun m!481043 () Bool)

(assert (=> b!499870 m!481043))

(declare-fun m!481045 () Bool)

(assert (=> b!499866 m!481045))

(assert (=> b!499866 m!481043))

(declare-fun m!481047 () Bool)

(assert (=> b!499876 m!481047))

(assert (=> b!499867 m!481037))

(assert (=> b!499867 m!481037))

(declare-fun m!481049 () Bool)

(assert (=> b!499867 m!481049))

(declare-fun m!481051 () Bool)

(assert (=> b!499863 m!481051))

(declare-fun m!481053 () Bool)

(assert (=> b!499863 m!481053))

(declare-fun m!481055 () Bool)

(assert (=> b!499863 m!481055))

(declare-fun m!481057 () Bool)

(assert (=> b!499863 m!481057))

(assert (=> b!499863 m!481037))

(declare-fun m!481059 () Bool)

(assert (=> b!499863 m!481059))

(assert (=> b!499863 m!481037))

(declare-fun m!481061 () Bool)

(assert (=> b!499863 m!481061))

(assert (=> b!499863 m!481037))

(declare-fun m!481063 () Bool)

(assert (=> b!499863 m!481063))

(declare-fun m!481065 () Bool)

(assert (=> b!499863 m!481065))

(declare-fun m!481067 () Bool)

(assert (=> b!499871 m!481067))

(declare-fun m!481069 () Bool)

(assert (=> b!499872 m!481069))

(declare-fun m!481071 () Bool)

(assert (=> b!499865 m!481071))

(assert (=> b!499865 m!481037))

(declare-fun m!481073 () Bool)

(assert (=> start!45440 m!481073))

(declare-fun m!481075 () Bool)

(assert (=> start!45440 m!481075))

(check-sat (not b!499877) (not b!499870) (not b!499874) (not b!499866) (not start!45440) (not b!499867) (not b!499868) (not b!499863) (not b!499871) (not b!499872) (not b!499876))
(check-sat)
