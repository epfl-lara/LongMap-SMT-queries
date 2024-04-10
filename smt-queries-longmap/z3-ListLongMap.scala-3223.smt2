; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45086 () Bool)

(assert start!45086)

(declare-fun res!297514 () Bool)

(declare-fun e!290389 () Bool)

(assert (=> start!45086 (=> (not res!297514) (not e!290389))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45086 (= res!297514 (validMask!0 mask!3524))))

(assert (=> start!45086 e!290389))

(assert (=> start!45086 true))

(declare-datatypes ((array!32031 0))(
  ( (array!32032 (arr!15400 (Array (_ BitVec 32) (_ BitVec 64))) (size!15764 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32031)

(declare-fun array_inv!11196 (array!32031) Bool)

(assert (=> start!45086 (array_inv!11196 a!3235)))

(declare-fun b!494941 () Bool)

(declare-fun res!297518 () Bool)

(assert (=> b!494941 (=> (not res!297518) (not e!290389))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494941 (= res!297518 (and (= (size!15764 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15764 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15764 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494942 () Bool)

(declare-fun res!297513 () Bool)

(declare-fun e!290387 () Bool)

(assert (=> b!494942 (=> (not res!297513) (not e!290387))))

(declare-datatypes ((List!9558 0))(
  ( (Nil!9555) (Cons!9554 (h!10422 (_ BitVec 64)) (t!15786 List!9558)) )
))
(declare-fun arrayNoDuplicates!0 (array!32031 (_ BitVec 32) List!9558) Bool)

(assert (=> b!494942 (= res!297513 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9555))))

(declare-fun b!494943 () Bool)

(assert (=> b!494943 (= e!290389 e!290387)))

(declare-fun res!297517 () Bool)

(assert (=> b!494943 (=> (not res!297517) (not e!290387))))

(declare-datatypes ((SeekEntryResult!3867 0))(
  ( (MissingZero!3867 (index!17647 (_ BitVec 32))) (Found!3867 (index!17648 (_ BitVec 32))) (Intermediate!3867 (undefined!4679 Bool) (index!17649 (_ BitVec 32)) (x!46713 (_ BitVec 32))) (Undefined!3867) (MissingVacant!3867 (index!17650 (_ BitVec 32))) )
))
(declare-fun lt!224066 () SeekEntryResult!3867)

(assert (=> b!494943 (= res!297517 (or (= lt!224066 (MissingZero!3867 i!1204)) (= lt!224066 (MissingVacant!3867 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32031 (_ BitVec 32)) SeekEntryResult!3867)

(assert (=> b!494943 (= lt!224066 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494944 () Bool)

(declare-fun res!297516 () Bool)

(assert (=> b!494944 (=> (not res!297516) (not e!290389))))

(declare-fun arrayContainsKey!0 (array!32031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494944 (= res!297516 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494945 () Bool)

(declare-fun res!297512 () Bool)

(assert (=> b!494945 (=> (not res!297512) (not e!290389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494945 (= res!297512 (validKeyInArray!0 k0!2280))))

(declare-fun b!494946 () Bool)

(declare-fun e!290390 () Bool)

(assert (=> b!494946 (= e!290387 (not e!290390))))

(declare-fun res!297520 () Bool)

(assert (=> b!494946 (=> res!297520 e!290390)))

(declare-fun lt!224065 () SeekEntryResult!3867)

(declare-fun lt!224064 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32031 (_ BitVec 32)) SeekEntryResult!3867)

(assert (=> b!494946 (= res!297520 (= lt!224065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224064 (select (store (arr!15400 a!3235) i!1204 k0!2280) j!176) (array!32032 (store (arr!15400 a!3235) i!1204 k0!2280) (size!15764 a!3235)) mask!3524)))))

(declare-fun lt!224067 () (_ BitVec 32))

(assert (=> b!494946 (= lt!224065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224067 (select (arr!15400 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494946 (= lt!224064 (toIndex!0 (select (store (arr!15400 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494946 (= lt!224067 (toIndex!0 (select (arr!15400 a!3235) j!176) mask!3524))))

(declare-fun e!290391 () Bool)

(assert (=> b!494946 e!290391))

(declare-fun res!297511 () Bool)

(assert (=> b!494946 (=> (not res!297511) (not e!290391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32031 (_ BitVec 32)) Bool)

(assert (=> b!494946 (= res!297511 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14680 0))(
  ( (Unit!14681) )
))
(declare-fun lt!224068 () Unit!14680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14680)

(assert (=> b!494946 (= lt!224068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494947 () Bool)

(declare-fun res!297521 () Bool)

(assert (=> b!494947 (=> res!297521 e!290390)))

(get-info :version)

(assert (=> b!494947 (= res!297521 (or (undefined!4679 lt!224065) (not ((_ is Intermediate!3867) lt!224065))))))

(declare-fun b!494948 () Bool)

(declare-fun res!297515 () Bool)

(assert (=> b!494948 (=> (not res!297515) (not e!290387))))

(assert (=> b!494948 (= res!297515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494949 () Bool)

(declare-fun res!297519 () Bool)

(assert (=> b!494949 (=> (not res!297519) (not e!290389))))

(assert (=> b!494949 (= res!297519 (validKeyInArray!0 (select (arr!15400 a!3235) j!176)))))

(declare-fun b!494950 () Bool)

(assert (=> b!494950 (= e!290391 (= (seekEntryOrOpen!0 (select (arr!15400 a!3235) j!176) a!3235 mask!3524) (Found!3867 j!176)))))

(declare-fun b!494951 () Bool)

(assert (=> b!494951 (= e!290390 (or (not (= (select (arr!15400 a!3235) (index!17649 lt!224065)) (select (arr!15400 a!3235) j!176))) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!494951 (and (bvslt (x!46713 lt!224065) #b01111111111111111111111111111110) (or (= (select (arr!15400 a!3235) (index!17649 lt!224065)) (select (arr!15400 a!3235) j!176)) (= (select (arr!15400 a!3235) (index!17649 lt!224065)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15400 a!3235) (index!17649 lt!224065)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45086 res!297514) b!494941))

(assert (= (and b!494941 res!297518) b!494949))

(assert (= (and b!494949 res!297519) b!494945))

(assert (= (and b!494945 res!297512) b!494944))

(assert (= (and b!494944 res!297516) b!494943))

(assert (= (and b!494943 res!297517) b!494948))

(assert (= (and b!494948 res!297515) b!494942))

(assert (= (and b!494942 res!297513) b!494946))

(assert (= (and b!494946 res!297511) b!494950))

(assert (= (and b!494946 (not res!297520)) b!494947))

(assert (= (and b!494947 (not res!297521)) b!494951))

(declare-fun m!476081 () Bool)

(assert (=> b!494951 m!476081))

(declare-fun m!476083 () Bool)

(assert (=> b!494951 m!476083))

(declare-fun m!476085 () Bool)

(assert (=> b!494945 m!476085))

(declare-fun m!476087 () Bool)

(assert (=> b!494944 m!476087))

(declare-fun m!476089 () Bool)

(assert (=> start!45086 m!476089))

(declare-fun m!476091 () Bool)

(assert (=> start!45086 m!476091))

(assert (=> b!494949 m!476083))

(assert (=> b!494949 m!476083))

(declare-fun m!476093 () Bool)

(assert (=> b!494949 m!476093))

(declare-fun m!476095 () Bool)

(assert (=> b!494948 m!476095))

(declare-fun m!476097 () Bool)

(assert (=> b!494942 m!476097))

(assert (=> b!494950 m!476083))

(assert (=> b!494950 m!476083))

(declare-fun m!476099 () Bool)

(assert (=> b!494950 m!476099))

(declare-fun m!476101 () Bool)

(assert (=> b!494943 m!476101))

(assert (=> b!494946 m!476083))

(declare-fun m!476103 () Bool)

(assert (=> b!494946 m!476103))

(declare-fun m!476105 () Bool)

(assert (=> b!494946 m!476105))

(declare-fun m!476107 () Bool)

(assert (=> b!494946 m!476107))

(declare-fun m!476109 () Bool)

(assert (=> b!494946 m!476109))

(assert (=> b!494946 m!476109))

(declare-fun m!476111 () Bool)

(assert (=> b!494946 m!476111))

(assert (=> b!494946 m!476083))

(declare-fun m!476113 () Bool)

(assert (=> b!494946 m!476113))

(assert (=> b!494946 m!476083))

(declare-fun m!476115 () Bool)

(assert (=> b!494946 m!476115))

(assert (=> b!494946 m!476109))

(declare-fun m!476117 () Bool)

(assert (=> b!494946 m!476117))

(check-sat (not b!494944) (not b!494949) (not b!494948) (not b!494942) (not start!45086) (not b!494943) (not b!494950) (not b!494945) (not b!494946))
(check-sat)
