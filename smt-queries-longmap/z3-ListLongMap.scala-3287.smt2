; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45654 () Bool)

(assert start!45654)

(declare-fun b!503640 () Bool)

(declare-fun res!305039 () Bool)

(declare-fun e!294898 () Bool)

(assert (=> b!503640 (=> res!305039 e!294898)))

(declare-datatypes ((SeekEntryResult!4054 0))(
  ( (MissingZero!4054 (index!18404 (_ BitVec 32))) (Found!4054 (index!18405 (_ BitVec 32))) (Intermediate!4054 (undefined!4866 Bool) (index!18406 (_ BitVec 32)) (x!47434 (_ BitVec 32))) (Undefined!4054) (MissingVacant!4054 (index!18407 (_ BitVec 32))) )
))
(declare-fun lt!229099 () SeekEntryResult!4054)

(get-info :version)

(assert (=> b!503640 (= res!305039 (or (undefined!4866 lt!229099) (not ((_ is Intermediate!4054) lt!229099))))))

(declare-fun b!503641 () Bool)

(declare-fun e!294899 () Bool)

(assert (=> b!503641 (= e!294899 false)))

(declare-fun b!503642 () Bool)

(declare-fun res!305035 () Bool)

(declare-fun e!294904 () Bool)

(assert (=> b!503642 (=> (not res!305035) (not e!294904))))

(declare-datatypes ((array!32420 0))(
  ( (array!32421 (arr!15590 (Array (_ BitVec 32) (_ BitVec 64))) (size!15955 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32420)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32420 (_ BitVec 32)) Bool)

(assert (=> b!503642 (= res!305035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503643 () Bool)

(declare-fun res!305038 () Bool)

(assert (=> b!503643 (=> (not res!305038) (not e!294904))))

(declare-datatypes ((List!9787 0))(
  ( (Nil!9784) (Cons!9783 (h!10660 (_ BitVec 64)) (t!16006 List!9787)) )
))
(declare-fun arrayNoDuplicates!0 (array!32420 (_ BitVec 32) List!9787) Bool)

(assert (=> b!503643 (= res!305038 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9784))))

(declare-fun b!503644 () Bool)

(declare-fun e!294905 () Bool)

(assert (=> b!503644 (= e!294905 e!294904)))

(declare-fun res!305032 () Bool)

(assert (=> b!503644 (=> (not res!305032) (not e!294904))))

(declare-fun lt!229096 () SeekEntryResult!4054)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503644 (= res!305032 (or (= lt!229096 (MissingZero!4054 i!1204)) (= lt!229096 (MissingVacant!4054 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503644 (= lt!229096 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503645 () Bool)

(declare-fun res!305030 () Bool)

(assert (=> b!503645 (=> (not res!305030) (not e!294905))))

(declare-fun arrayContainsKey!0 (array!32420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503645 (= res!305030 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!294901 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!503646 () Bool)

(assert (=> b!503646 (= e!294901 (= (seekEntryOrOpen!0 (select (arr!15590 a!3235) j!176) a!3235 mask!3524) (Found!4054 j!176)))))

(declare-fun res!305036 () Bool)

(assert (=> start!45654 (=> (not res!305036) (not e!294905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45654 (= res!305036 (validMask!0 mask!3524))))

(assert (=> start!45654 e!294905))

(assert (=> start!45654 true))

(declare-fun array_inv!11473 (array!32420) Bool)

(assert (=> start!45654 (array_inv!11473 a!3235)))

(declare-fun b!503647 () Bool)

(declare-datatypes ((Unit!15286 0))(
  ( (Unit!15287) )
))
(declare-fun e!294900 () Unit!15286)

(declare-fun Unit!15288 () Unit!15286)

(assert (=> b!503647 (= e!294900 Unit!15288)))

(declare-fun b!503648 () Bool)

(declare-fun res!305031 () Bool)

(assert (=> b!503648 (=> (not res!305031) (not e!294905))))

(assert (=> b!503648 (= res!305031 (and (= (size!15955 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15955 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15955 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503649 () Bool)

(declare-fun Unit!15289 () Unit!15286)

(assert (=> b!503649 (= e!294900 Unit!15289)))

(declare-fun lt!229104 () (_ BitVec 32))

(declare-fun lt!229100 () Unit!15286)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32420 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15286)

(assert (=> b!503649 (= lt!229100 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229104 #b00000000000000000000000000000000 (index!18406 lt!229099) (x!47434 lt!229099) mask!3524))))

(declare-fun res!305029 () Bool)

(declare-fun lt!229102 () (_ BitVec 64))

(declare-fun lt!229095 () array!32420)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503649 (= res!305029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229104 lt!229102 lt!229095 mask!3524) (Intermediate!4054 false (index!18406 lt!229099) (x!47434 lt!229099))))))

(assert (=> b!503649 (=> (not res!305029) (not e!294899))))

(assert (=> b!503649 e!294899))

(declare-fun b!503650 () Bool)

(declare-fun res!305026 () Bool)

(assert (=> b!503650 (=> (not res!305026) (not e!294905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503650 (= res!305026 (validKeyInArray!0 k0!2280))))

(declare-fun b!503651 () Bool)

(declare-fun e!294902 () Bool)

(assert (=> b!503651 (= e!294898 e!294902)))

(declare-fun res!305027 () Bool)

(assert (=> b!503651 (=> res!305027 e!294902)))

(assert (=> b!503651 (= res!305027 (or (bvsgt (x!47434 lt!229099) #b01111111111111111111111111111110) (bvslt lt!229104 #b00000000000000000000000000000000) (bvsge lt!229104 (size!15955 a!3235)) (bvslt (index!18406 lt!229099) #b00000000000000000000000000000000) (bvsge (index!18406 lt!229099) (size!15955 a!3235)) (not (= lt!229099 (Intermediate!4054 false (index!18406 lt!229099) (x!47434 lt!229099))))))))

(assert (=> b!503651 (= (index!18406 lt!229099) i!1204)))

(declare-fun lt!229101 () Unit!15286)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32420 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15286)

(assert (=> b!503651 (= lt!229101 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229104 #b00000000000000000000000000000000 (index!18406 lt!229099) (x!47434 lt!229099) mask!3524))))

(assert (=> b!503651 (and (or (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229097 () Unit!15286)

(assert (=> b!503651 (= lt!229097 e!294900)))

(declare-fun c!59586 () Bool)

(assert (=> b!503651 (= c!59586 (= (select (arr!15590 a!3235) (index!18406 lt!229099)) (select (arr!15590 a!3235) j!176)))))

(assert (=> b!503651 (and (bvslt (x!47434 lt!229099) #b01111111111111111111111111111110) (or (= (select (arr!15590 a!3235) (index!18406 lt!229099)) (select (arr!15590 a!3235) j!176)) (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15590 a!3235) (index!18406 lt!229099)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503652 () Bool)

(declare-fun e!294906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503652 (= e!294906 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229104 (index!18406 lt!229099) (select (arr!15590 a!3235) j!176) a!3235 mask!3524) (Found!4054 j!176))))))

(declare-fun b!503653 () Bool)

(assert (=> b!503653 (= e!294902 true)))

(declare-fun lt!229098 () SeekEntryResult!4054)

(assert (=> b!503653 (= lt!229098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229104 lt!229102 lt!229095 mask!3524))))

(declare-fun b!503654 () Bool)

(declare-fun res!305025 () Bool)

(assert (=> b!503654 (=> (not res!305025) (not e!294905))))

(assert (=> b!503654 (= res!305025 (validKeyInArray!0 (select (arr!15590 a!3235) j!176)))))

(declare-fun b!503655 () Bool)

(assert (=> b!503655 (= e!294904 (not e!294898))))

(declare-fun res!305034 () Bool)

(assert (=> b!503655 (=> res!305034 e!294898)))

(declare-fun lt!229103 () (_ BitVec 32))

(assert (=> b!503655 (= res!305034 (= lt!229099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229103 lt!229102 lt!229095 mask!3524)))))

(assert (=> b!503655 (= lt!229099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229104 (select (arr!15590 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503655 (= lt!229103 (toIndex!0 lt!229102 mask!3524))))

(assert (=> b!503655 (= lt!229102 (select (store (arr!15590 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503655 (= lt!229104 (toIndex!0 (select (arr!15590 a!3235) j!176) mask!3524))))

(assert (=> b!503655 (= lt!229095 (array!32421 (store (arr!15590 a!3235) i!1204 k0!2280) (size!15955 a!3235)))))

(assert (=> b!503655 e!294901))

(declare-fun res!305033 () Bool)

(assert (=> b!503655 (=> (not res!305033) (not e!294901))))

(assert (=> b!503655 (= res!305033 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229105 () Unit!15286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15286)

(assert (=> b!503655 (= lt!229105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503656 () Bool)

(declare-fun res!305028 () Bool)

(assert (=> b!503656 (=> res!305028 e!294902)))

(assert (=> b!503656 (= res!305028 e!294906)))

(declare-fun res!305037 () Bool)

(assert (=> b!503656 (=> (not res!305037) (not e!294906))))

(assert (=> b!503656 (= res!305037 (bvsgt #b00000000000000000000000000000000 (x!47434 lt!229099)))))

(assert (= (and start!45654 res!305036) b!503648))

(assert (= (and b!503648 res!305031) b!503654))

(assert (= (and b!503654 res!305025) b!503650))

(assert (= (and b!503650 res!305026) b!503645))

(assert (= (and b!503645 res!305030) b!503644))

(assert (= (and b!503644 res!305032) b!503642))

(assert (= (and b!503642 res!305035) b!503643))

(assert (= (and b!503643 res!305038) b!503655))

(assert (= (and b!503655 res!305033) b!503646))

(assert (= (and b!503655 (not res!305034)) b!503640))

(assert (= (and b!503640 (not res!305039)) b!503651))

(assert (= (and b!503651 c!59586) b!503649))

(assert (= (and b!503651 (not c!59586)) b!503647))

(assert (= (and b!503649 res!305029) b!503641))

(assert (= (and b!503651 (not res!305027)) b!503656))

(assert (= (and b!503656 res!305037) b!503652))

(assert (= (and b!503656 (not res!305028)) b!503653))

(declare-fun m!483949 () Bool)

(assert (=> b!503651 m!483949))

(declare-fun m!483951 () Bool)

(assert (=> b!503651 m!483951))

(declare-fun m!483953 () Bool)

(assert (=> b!503651 m!483953))

(declare-fun m!483955 () Bool)

(assert (=> b!503643 m!483955))

(declare-fun m!483957 () Bool)

(assert (=> start!45654 m!483957))

(declare-fun m!483959 () Bool)

(assert (=> start!45654 m!483959))

(assert (=> b!503655 m!483953))

(declare-fun m!483961 () Bool)

(assert (=> b!503655 m!483961))

(declare-fun m!483963 () Bool)

(assert (=> b!503655 m!483963))

(declare-fun m!483965 () Bool)

(assert (=> b!503655 m!483965))

(declare-fun m!483967 () Bool)

(assert (=> b!503655 m!483967))

(assert (=> b!503655 m!483953))

(declare-fun m!483969 () Bool)

(assert (=> b!503655 m!483969))

(assert (=> b!503655 m!483953))

(declare-fun m!483971 () Bool)

(assert (=> b!503655 m!483971))

(declare-fun m!483973 () Bool)

(assert (=> b!503655 m!483973))

(declare-fun m!483975 () Bool)

(assert (=> b!503655 m!483975))

(declare-fun m!483977 () Bool)

(assert (=> b!503653 m!483977))

(declare-fun m!483979 () Bool)

(assert (=> b!503645 m!483979))

(assert (=> b!503654 m!483953))

(assert (=> b!503654 m!483953))

(declare-fun m!483981 () Bool)

(assert (=> b!503654 m!483981))

(assert (=> b!503646 m!483953))

(assert (=> b!503646 m!483953))

(declare-fun m!483983 () Bool)

(assert (=> b!503646 m!483983))

(declare-fun m!483985 () Bool)

(assert (=> b!503649 m!483985))

(assert (=> b!503649 m!483977))

(declare-fun m!483987 () Bool)

(assert (=> b!503644 m!483987))

(assert (=> b!503652 m!483953))

(assert (=> b!503652 m!483953))

(declare-fun m!483989 () Bool)

(assert (=> b!503652 m!483989))

(declare-fun m!483991 () Bool)

(assert (=> b!503642 m!483991))

(declare-fun m!483993 () Bool)

(assert (=> b!503650 m!483993))

(check-sat (not b!503650) (not b!503645) (not b!503652) (not b!503651) (not b!503644) (not b!503655) (not b!503642) (not b!503649) (not b!503643) (not b!503654) (not b!503646) (not start!45654) (not b!503653))
(check-sat)
