; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45806 () Bool)

(assert start!45806)

(declare-fun b!507082 () Bool)

(declare-fun e!296769 () Bool)

(assert (=> b!507082 (= e!296769 true)))

(assert (=> b!507082 false))

(declare-fun res!308047 () Bool)

(declare-fun e!296767 () Bool)

(assert (=> start!45806 (=> (not res!308047) (not e!296767))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45806 (= res!308047 (validMask!0 mask!3524))))

(assert (=> start!45806 e!296767))

(assert (=> start!45806 true))

(declare-datatypes ((array!32562 0))(
  ( (array!32563 (arr!15661 (Array (_ BitVec 32) (_ BitVec 64))) (size!16025 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32562)

(declare-fun array_inv!11457 (array!32562) Bool)

(assert (=> start!45806 (array_inv!11457 a!3235)))

(declare-fun b!507083 () Bool)

(declare-fun res!308041 () Bool)

(assert (=> b!507083 (=> (not res!308041) (not e!296767))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507083 (= res!308041 (validKeyInArray!0 (select (arr!15661 a!3235) j!176)))))

(declare-fun b!507084 () Bool)

(declare-fun e!296771 () Bool)

(assert (=> b!507084 (= e!296771 e!296769)))

(declare-fun res!308043 () Bool)

(assert (=> b!507084 (=> res!308043 e!296769)))

(declare-fun lt!231444 () Bool)

(declare-datatypes ((SeekEntryResult!4128 0))(
  ( (MissingZero!4128 (index!18700 (_ BitVec 32))) (Found!4128 (index!18701 (_ BitVec 32))) (Intermediate!4128 (undefined!4940 Bool) (index!18702 (_ BitVec 32)) (x!47697 (_ BitVec 32))) (Undefined!4128) (MissingVacant!4128 (index!18703 (_ BitVec 32))) )
))
(declare-fun lt!231447 () SeekEntryResult!4128)

(assert (=> b!507084 (= res!308043 (or (and (not lt!231444) (undefined!4940 lt!231447)) (and (not lt!231444) (not (undefined!4940 lt!231447)))))))

(get-info :version)

(assert (=> b!507084 (= lt!231444 (not ((_ is Intermediate!4128) lt!231447)))))

(declare-fun b!507085 () Bool)

(declare-fun res!308042 () Bool)

(declare-fun e!296768 () Bool)

(assert (=> b!507085 (=> (not res!308042) (not e!296768))))

(declare-datatypes ((List!9819 0))(
  ( (Nil!9816) (Cons!9815 (h!10692 (_ BitVec 64)) (t!16047 List!9819)) )
))
(declare-fun arrayNoDuplicates!0 (array!32562 (_ BitVec 32) List!9819) Bool)

(assert (=> b!507085 (= res!308042 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9816))))

(declare-fun b!507086 () Bool)

(declare-fun res!308050 () Bool)

(assert (=> b!507086 (=> (not res!308050) (not e!296767))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507086 (= res!308050 (and (= (size!16025 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16025 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16025 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507087 () Bool)

(declare-fun res!308051 () Bool)

(assert (=> b!507087 (=> (not res!308051) (not e!296767))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507087 (= res!308051 (validKeyInArray!0 k0!2280))))

(declare-fun b!507088 () Bool)

(assert (=> b!507088 (= e!296767 e!296768)))

(declare-fun res!308048 () Bool)

(assert (=> b!507088 (=> (not res!308048) (not e!296768))))

(declare-fun lt!231448 () SeekEntryResult!4128)

(assert (=> b!507088 (= res!308048 (or (= lt!231448 (MissingZero!4128 i!1204)) (= lt!231448 (MissingVacant!4128 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32562 (_ BitVec 32)) SeekEntryResult!4128)

(assert (=> b!507088 (= lt!231448 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507089 () Bool)

(declare-fun res!308046 () Bool)

(assert (=> b!507089 (=> (not res!308046) (not e!296767))))

(declare-fun arrayContainsKey!0 (array!32562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507089 (= res!308046 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!296772 () Bool)

(declare-fun b!507090 () Bool)

(assert (=> b!507090 (= e!296772 (= (seekEntryOrOpen!0 (select (arr!15661 a!3235) j!176) a!3235 mask!3524) (Found!4128 j!176)))))

(declare-fun b!507091 () Bool)

(assert (=> b!507091 (= e!296768 (not e!296771))))

(declare-fun res!308044 () Bool)

(assert (=> b!507091 (=> res!308044 e!296771)))

(declare-fun lt!231446 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32562 (_ BitVec 32)) SeekEntryResult!4128)

(assert (=> b!507091 (= res!308044 (= lt!231447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231446 (select (store (arr!15661 a!3235) i!1204 k0!2280) j!176) (array!32563 (store (arr!15661 a!3235) i!1204 k0!2280) (size!16025 a!3235)) mask!3524)))))

(declare-fun lt!231443 () (_ BitVec 32))

(assert (=> b!507091 (= lt!231447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231443 (select (arr!15661 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507091 (= lt!231446 (toIndex!0 (select (store (arr!15661 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!507091 (= lt!231443 (toIndex!0 (select (arr!15661 a!3235) j!176) mask!3524))))

(assert (=> b!507091 e!296772))

(declare-fun res!308045 () Bool)

(assert (=> b!507091 (=> (not res!308045) (not e!296772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32562 (_ BitVec 32)) Bool)

(assert (=> b!507091 (= res!308045 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15544 0))(
  ( (Unit!15545) )
))
(declare-fun lt!231445 () Unit!15544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15544)

(assert (=> b!507091 (= lt!231445 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507092 () Bool)

(declare-fun res!308049 () Bool)

(assert (=> b!507092 (=> (not res!308049) (not e!296768))))

(assert (=> b!507092 (= res!308049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45806 res!308047) b!507086))

(assert (= (and b!507086 res!308050) b!507083))

(assert (= (and b!507083 res!308041) b!507087))

(assert (= (and b!507087 res!308051) b!507089))

(assert (= (and b!507089 res!308046) b!507088))

(assert (= (and b!507088 res!308048) b!507092))

(assert (= (and b!507092 res!308049) b!507085))

(assert (= (and b!507085 res!308042) b!507091))

(assert (= (and b!507091 res!308045) b!507090))

(assert (= (and b!507091 (not res!308044)) b!507084))

(assert (= (and b!507084 (not res!308043)) b!507082))

(declare-fun m!487803 () Bool)

(assert (=> b!507089 m!487803))

(declare-fun m!487805 () Bool)

(assert (=> b!507083 m!487805))

(assert (=> b!507083 m!487805))

(declare-fun m!487807 () Bool)

(assert (=> b!507083 m!487807))

(declare-fun m!487809 () Bool)

(assert (=> b!507087 m!487809))

(declare-fun m!487811 () Bool)

(assert (=> b!507092 m!487811))

(declare-fun m!487813 () Bool)

(assert (=> b!507091 m!487813))

(declare-fun m!487815 () Bool)

(assert (=> b!507091 m!487815))

(declare-fun m!487817 () Bool)

(assert (=> b!507091 m!487817))

(assert (=> b!507091 m!487805))

(declare-fun m!487819 () Bool)

(assert (=> b!507091 m!487819))

(assert (=> b!507091 m!487805))

(assert (=> b!507091 m!487805))

(declare-fun m!487821 () Bool)

(assert (=> b!507091 m!487821))

(declare-fun m!487823 () Bool)

(assert (=> b!507091 m!487823))

(assert (=> b!507091 m!487817))

(declare-fun m!487825 () Bool)

(assert (=> b!507091 m!487825))

(assert (=> b!507091 m!487817))

(declare-fun m!487827 () Bool)

(assert (=> b!507091 m!487827))

(declare-fun m!487829 () Bool)

(assert (=> start!45806 m!487829))

(declare-fun m!487831 () Bool)

(assert (=> start!45806 m!487831))

(declare-fun m!487833 () Bool)

(assert (=> b!507088 m!487833))

(assert (=> b!507090 m!487805))

(assert (=> b!507090 m!487805))

(declare-fun m!487835 () Bool)

(assert (=> b!507090 m!487835))

(declare-fun m!487837 () Bool)

(assert (=> b!507085 m!487837))

(check-sat (not b!507090) (not b!507087) (not b!507089) (not b!507092) (not start!45806) (not b!507085) (not b!507088) (not b!507091) (not b!507083))
(check-sat)
