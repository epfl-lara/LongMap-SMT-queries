; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49622 () Bool)

(assert start!49622)

(declare-fun b!546083 () Bool)

(declare-fun e!315619 () Bool)

(declare-fun e!315623 () Bool)

(assert (=> b!546083 (= e!315619 e!315623)))

(declare-fun res!340014 () Bool)

(assert (=> b!546083 (=> (not res!340014) (not e!315623))))

(declare-datatypes ((SeekEntryResult!5004 0))(
  ( (MissingZero!5004 (index!22240 (_ BitVec 32))) (Found!5004 (index!22241 (_ BitVec 32))) (Intermediate!5004 (undefined!5816 Bool) (index!22242 (_ BitVec 32)) (x!51164 (_ BitVec 32))) (Undefined!5004) (MissingVacant!5004 (index!22243 (_ BitVec 32))) )
))
(declare-fun lt!249170 () SeekEntryResult!5004)

(declare-fun lt!249171 () SeekEntryResult!5004)

(declare-fun lt!249175 () SeekEntryResult!5004)

(assert (=> b!546083 (= res!340014 (and (= lt!249171 lt!249175) (= lt!249170 lt!249171)))))

(declare-fun lt!249177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34435 0))(
  ( (array!34436 (arr!16546 (Array (_ BitVec 32) (_ BitVec 64))) (size!16910 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34435 (_ BitVec 32)) SeekEntryResult!5004)

(assert (=> b!546083 (= lt!249171 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249177 (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546084 () Bool)

(declare-fun e!315620 () Bool)

(declare-fun e!315622 () Bool)

(assert (=> b!546084 (= e!315620 e!315622)))

(declare-fun res!340013 () Bool)

(assert (=> b!546084 (=> (not res!340013) (not e!315622))))

(declare-fun lt!249173 () SeekEntryResult!5004)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546084 (= res!340013 (or (= lt!249173 (MissingZero!5004 i!1153)) (= lt!249173 (MissingVacant!5004 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34435 (_ BitVec 32)) SeekEntryResult!5004)

(assert (=> b!546084 (= lt!249173 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!546085 () Bool)

(declare-fun res!340018 () Bool)

(assert (=> b!546085 (=> (not res!340018) (not e!315622))))

(declare-datatypes ((List!10665 0))(
  ( (Nil!10662) (Cons!10661 (h!11625 (_ BitVec 64)) (t!16893 List!10665)) )
))
(declare-fun arrayNoDuplicates!0 (array!34435 (_ BitVec 32) List!10665) Bool)

(assert (=> b!546085 (= res!340018 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10662))))

(declare-fun b!546086 () Bool)

(declare-fun res!340020 () Bool)

(assert (=> b!546086 (=> (not res!340020) (not e!315620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546086 (= res!340020 (validKeyInArray!0 (select (arr!16546 a!3154) j!147)))))

(declare-fun b!546087 () Bool)

(declare-fun res!340022 () Bool)

(assert (=> b!546087 (=> (not res!340022) (not e!315620))))

(declare-fun arrayContainsKey!0 (array!34435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546087 (= res!340022 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546088 () Bool)

(declare-fun res!340016 () Bool)

(assert (=> b!546088 (=> (not res!340016) (not e!315620))))

(assert (=> b!546088 (= res!340016 (and (= (size!16910 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16910 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16910 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546089 () Bool)

(declare-fun e!315624 () Bool)

(assert (=> b!546089 (= e!315622 e!315624)))

(declare-fun res!340011 () Bool)

(assert (=> b!546089 (=> (not res!340011) (not e!315624))))

(declare-fun lt!249174 () SeekEntryResult!5004)

(assert (=> b!546089 (= res!340011 (= lt!249174 lt!249175))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!546089 (= lt!249175 (Intermediate!5004 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!546089 (= lt!249174 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546090 () Bool)

(declare-fun res!340019 () Bool)

(assert (=> b!546090 (=> (not res!340019) (not e!315622))))

(assert (=> b!546090 (= res!340019 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16910 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16910 a!3154)) (= (select (arr!16546 a!3154) resIndex!32) (select (arr!16546 a!3154) j!147))))))

(declare-fun b!546091 () Bool)

(declare-fun res!340012 () Bool)

(assert (=> b!546091 (=> (not res!340012) (not e!315622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34435 (_ BitVec 32)) Bool)

(assert (=> b!546091 (= res!340012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!340015 () Bool)

(assert (=> start!49622 (=> (not res!340015) (not e!315620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49622 (= res!340015 (validMask!0 mask!3216))))

(assert (=> start!49622 e!315620))

(assert (=> start!49622 true))

(declare-fun array_inv!12342 (array!34435) Bool)

(assert (=> start!49622 (array_inv!12342 a!3154)))

(declare-fun b!546092 () Bool)

(declare-fun e!315618 () Bool)

(assert (=> b!546092 (= e!315618 e!315619)))

(declare-fun res!340017 () Bool)

(assert (=> b!546092 (=> (not res!340017) (not e!315619))))

(assert (=> b!546092 (= res!340017 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249177 #b00000000000000000000000000000000) (bvslt lt!249177 (size!16910 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546092 (= lt!249177 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!546093 () Bool)

(declare-fun res!340021 () Bool)

(assert (=> b!546093 (=> (not res!340021) (not e!315620))))

(assert (=> b!546093 (= res!340021 (validKeyInArray!0 k0!1998))))

(declare-fun b!546094 () Bool)

(assert (=> b!546094 (= e!315624 e!315618)))

(declare-fun res!340010 () Bool)

(assert (=> b!546094 (=> (not res!340010) (not e!315618))))

(assert (=> b!546094 (= res!340010 (and (= lt!249170 lt!249174) (not (= (select (arr!16546 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16546 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16546 a!3154) index!1177) (select (arr!16546 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546094 (= lt!249170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun lt!249172 () array!34435)

(declare-fun lt!249178 () (_ BitVec 64))

(declare-fun b!546095 () Bool)

(assert (=> b!546095 (= e!315623 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249178 lt!249172 mask!3216) lt!249175)))))

(assert (=> b!546095 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249177 lt!249178 lt!249172 mask!3216) lt!249175)))

(assert (=> b!546095 (= lt!249178 (select (store (arr!16546 a!3154) i!1153 k0!1998) j!147))))

(assert (=> b!546095 (= lt!249172 (array!34436 (store (arr!16546 a!3154) i!1153 k0!1998) (size!16910 a!3154)))))

(declare-datatypes ((Unit!16942 0))(
  ( (Unit!16943) )
))
(declare-fun lt!249176 () Unit!16942)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16942)

(assert (=> b!546095 (= lt!249176 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249177 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (= (and start!49622 res!340015) b!546088))

(assert (= (and b!546088 res!340016) b!546086))

(assert (= (and b!546086 res!340020) b!546093))

(assert (= (and b!546093 res!340021) b!546087))

(assert (= (and b!546087 res!340022) b!546084))

(assert (= (and b!546084 res!340013) b!546091))

(assert (= (and b!546091 res!340012) b!546085))

(assert (= (and b!546085 res!340018) b!546090))

(assert (= (and b!546090 res!340019) b!546089))

(assert (= (and b!546089 res!340011) b!546094))

(assert (= (and b!546094 res!340010) b!546092))

(assert (= (and b!546092 res!340017) b!546083))

(assert (= (and b!546083 res!340014) b!546095))

(declare-fun m!523635 () Bool)

(assert (=> b!546090 m!523635))

(declare-fun m!523637 () Bool)

(assert (=> b!546090 m!523637))

(declare-fun m!523639 () Bool)

(assert (=> b!546094 m!523639))

(assert (=> b!546094 m!523637))

(assert (=> b!546094 m!523637))

(declare-fun m!523641 () Bool)

(assert (=> b!546094 m!523641))

(assert (=> b!546094 m!523641))

(assert (=> b!546094 m!523637))

(declare-fun m!523643 () Bool)

(assert (=> b!546094 m!523643))

(assert (=> b!546086 m!523637))

(assert (=> b!546086 m!523637))

(declare-fun m!523645 () Bool)

(assert (=> b!546086 m!523645))

(declare-fun m!523647 () Bool)

(assert (=> b!546084 m!523647))

(declare-fun m!523649 () Bool)

(assert (=> b!546091 m!523649))

(declare-fun m!523651 () Bool)

(assert (=> b!546095 m!523651))

(declare-fun m!523653 () Bool)

(assert (=> b!546095 m!523653))

(declare-fun m!523655 () Bool)

(assert (=> b!546095 m!523655))

(declare-fun m!523657 () Bool)

(assert (=> b!546095 m!523657))

(declare-fun m!523659 () Bool)

(assert (=> b!546095 m!523659))

(declare-fun m!523661 () Bool)

(assert (=> start!49622 m!523661))

(declare-fun m!523663 () Bool)

(assert (=> start!49622 m!523663))

(declare-fun m!523665 () Bool)

(assert (=> b!546093 m!523665))

(declare-fun m!523667 () Bool)

(assert (=> b!546092 m!523667))

(declare-fun m!523669 () Bool)

(assert (=> b!546087 m!523669))

(assert (=> b!546089 m!523637))

(assert (=> b!546089 m!523637))

(declare-fun m!523671 () Bool)

(assert (=> b!546089 m!523671))

(declare-fun m!523673 () Bool)

(assert (=> b!546085 m!523673))

(assert (=> b!546083 m!523637))

(assert (=> b!546083 m!523637))

(declare-fun m!523675 () Bool)

(assert (=> b!546083 m!523675))

(check-sat (not b!546092) (not start!49622) (not b!546095) (not b!546094) (not b!546083) (not b!546085) (not b!546087) (not b!546091) (not b!546089) (not b!546084) (not b!546093) (not b!546086))
(check-sat)
(get-model)

(declare-fun b!546143 () Bool)

(declare-fun e!315652 () Bool)

(declare-fun e!315654 () Bool)

(assert (=> b!546143 (= e!315652 e!315654)))

(declare-fun lt!249214 () (_ BitVec 64))

(assert (=> b!546143 (= lt!249214 (select (arr!16546 a!3154) #b00000000000000000000000000000000))))

(declare-fun lt!249213 () Unit!16942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34435 (_ BitVec 64) (_ BitVec 32)) Unit!16942)

(assert (=> b!546143 (= lt!249213 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!249214 #b00000000000000000000000000000000))))

(assert (=> b!546143 (arrayContainsKey!0 a!3154 lt!249214 #b00000000000000000000000000000000)))

(declare-fun lt!249212 () Unit!16942)

(assert (=> b!546143 (= lt!249212 lt!249213)))

(declare-fun res!340067 () Bool)

(assert (=> b!546143 (= res!340067 (= (seekEntryOrOpen!0 (select (arr!16546 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!5004 #b00000000000000000000000000000000)))))

(assert (=> b!546143 (=> (not res!340067) (not e!315654))))

(declare-fun b!546144 () Bool)

(declare-fun call!32132 () Bool)

(assert (=> b!546144 (= e!315654 call!32132)))

(declare-fun b!546145 () Bool)

(assert (=> b!546145 (= e!315652 call!32132)))

(declare-fun bm!32129 () Bool)

(assert (=> bm!32129 (= call!32132 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!546146 () Bool)

(declare-fun e!315653 () Bool)

(assert (=> b!546146 (= e!315653 e!315652)))

(declare-fun c!63365 () Bool)

(assert (=> b!546146 (= c!63365 (validKeyInArray!0 (select (arr!16546 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82257 () Bool)

(declare-fun res!340066 () Bool)

(assert (=> d!82257 (=> res!340066 e!315653)))

(assert (=> d!82257 (= res!340066 (bvsge #b00000000000000000000000000000000 (size!16910 a!3154)))))

(assert (=> d!82257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315653)))

(assert (= (and d!82257 (not res!340066)) b!546146))

(assert (= (and b!546146 c!63365) b!546143))

(assert (= (and b!546146 (not c!63365)) b!546145))

(assert (= (and b!546143 res!340067) b!546144))

(assert (= (or b!546144 b!546145) bm!32129))

(declare-fun m!523719 () Bool)

(assert (=> b!546143 m!523719))

(declare-fun m!523721 () Bool)

(assert (=> b!546143 m!523721))

(declare-fun m!523723 () Bool)

(assert (=> b!546143 m!523723))

(assert (=> b!546143 m!523719))

(declare-fun m!523725 () Bool)

(assert (=> b!546143 m!523725))

(declare-fun m!523727 () Bool)

(assert (=> bm!32129 m!523727))

(assert (=> b!546146 m!523719))

(assert (=> b!546146 m!523719))

(declare-fun m!523729 () Bool)

(assert (=> b!546146 m!523729))

(assert (=> b!546091 d!82257))

(declare-fun b!546165 () Bool)

(declare-fun lt!249219 () SeekEntryResult!5004)

(assert (=> b!546165 (and (bvsge (index!22242 lt!249219) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249219) (size!16910 a!3154)))))

(declare-fun res!340076 () Bool)

(assert (=> b!546165 (= res!340076 (= (select (arr!16546 a!3154) (index!22242 lt!249219)) (select (arr!16546 a!3154) j!147)))))

(declare-fun e!315668 () Bool)

(assert (=> b!546165 (=> res!340076 e!315668)))

(declare-fun e!315669 () Bool)

(assert (=> b!546165 (= e!315669 e!315668)))

(declare-fun e!315665 () SeekEntryResult!5004)

(declare-fun b!546166 () Bool)

(assert (=> b!546166 (= e!315665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546167 () Bool)

(assert (=> b!546167 (= e!315665 (Intermediate!5004 false lt!249177 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546168 () Bool)

(assert (=> b!546168 (and (bvsge (index!22242 lt!249219) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249219) (size!16910 a!3154)))))

(assert (=> b!546168 (= e!315668 (= (select (arr!16546 a!3154) (index!22242 lt!249219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546169 () Bool)

(declare-fun e!315667 () Bool)

(assert (=> b!546169 (= e!315667 (bvsge (x!51164 lt!249219) #b01111111111111111111111111111110))))

(declare-fun b!546170 () Bool)

(assert (=> b!546170 (= e!315667 e!315669)))

(declare-fun res!340075 () Bool)

(get-info :version)

(assert (=> b!546170 (= res!340075 (and ((_ is Intermediate!5004) lt!249219) (not (undefined!5816 lt!249219)) (bvslt (x!51164 lt!249219) #b01111111111111111111111111111110) (bvsge (x!51164 lt!249219) #b00000000000000000000000000000000) (bvsge (x!51164 lt!249219) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546170 (=> (not res!340075) (not e!315669))))

(declare-fun b!546171 () Bool)

(declare-fun e!315666 () SeekEntryResult!5004)

(assert (=> b!546171 (= e!315666 (Intermediate!5004 true lt!249177 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun d!82259 () Bool)

(assert (=> d!82259 e!315667))

(declare-fun c!63372 () Bool)

(assert (=> d!82259 (= c!63372 (and ((_ is Intermediate!5004) lt!249219) (undefined!5816 lt!249219)))))

(assert (=> d!82259 (= lt!249219 e!315666)))

(declare-fun c!63373 () Bool)

(assert (=> d!82259 (= c!63373 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249220 () (_ BitVec 64))

(assert (=> d!82259 (= lt!249220 (select (arr!16546 a!3154) lt!249177))))

(assert (=> d!82259 (validMask!0 mask!3216)))

(assert (=> d!82259 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249177 (select (arr!16546 a!3154) j!147) a!3154 mask!3216) lt!249219)))

(declare-fun b!546172 () Bool)

(assert (=> b!546172 (= e!315666 e!315665)))

(declare-fun c!63374 () Bool)

(assert (=> b!546172 (= c!63374 (or (= lt!249220 (select (arr!16546 a!3154) j!147)) (= (bvadd lt!249220 lt!249220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546173 () Bool)

(assert (=> b!546173 (and (bvsge (index!22242 lt!249219) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249219) (size!16910 a!3154)))))

(declare-fun res!340074 () Bool)

(assert (=> b!546173 (= res!340074 (= (select (arr!16546 a!3154) (index!22242 lt!249219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546173 (=> res!340074 e!315668)))

(assert (= (and d!82259 c!63373) b!546171))

(assert (= (and d!82259 (not c!63373)) b!546172))

(assert (= (and b!546172 c!63374) b!546167))

(assert (= (and b!546172 (not c!63374)) b!546166))

(assert (= (and d!82259 c!63372) b!546169))

(assert (= (and d!82259 (not c!63372)) b!546170))

(assert (= (and b!546170 res!340075) b!546165))

(assert (= (and b!546165 (not res!340076)) b!546173))

(assert (= (and b!546173 (not res!340074)) b!546168))

(declare-fun m!523731 () Bool)

(assert (=> b!546166 m!523731))

(assert (=> b!546166 m!523731))

(assert (=> b!546166 m!523637))

(declare-fun m!523733 () Bool)

(assert (=> b!546166 m!523733))

(declare-fun m!523735 () Bool)

(assert (=> b!546168 m!523735))

(assert (=> b!546173 m!523735))

(declare-fun m!523737 () Bool)

(assert (=> d!82259 m!523737))

(assert (=> d!82259 m!523661))

(assert (=> b!546165 m!523735))

(assert (=> b!546083 d!82259))

(declare-fun b!546174 () Bool)

(declare-fun lt!249221 () SeekEntryResult!5004)

(assert (=> b!546174 (and (bvsge (index!22242 lt!249221) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249221) (size!16910 a!3154)))))

(declare-fun res!340079 () Bool)

(assert (=> b!546174 (= res!340079 (= (select (arr!16546 a!3154) (index!22242 lt!249221)) (select (arr!16546 a!3154) j!147)))))

(declare-fun e!315673 () Bool)

(assert (=> b!546174 (=> res!340079 e!315673)))

(declare-fun e!315674 () Bool)

(assert (=> b!546174 (= e!315674 e!315673)))

(declare-fun b!546175 () Bool)

(declare-fun e!315670 () SeekEntryResult!5004)

(assert (=> b!546175 (= e!315670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546176 () Bool)

(assert (=> b!546176 (= e!315670 (Intermediate!5004 false (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546177 () Bool)

(assert (=> b!546177 (and (bvsge (index!22242 lt!249221) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249221) (size!16910 a!3154)))))

(assert (=> b!546177 (= e!315673 (= (select (arr!16546 a!3154) (index!22242 lt!249221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546178 () Bool)

(declare-fun e!315672 () Bool)

(assert (=> b!546178 (= e!315672 (bvsge (x!51164 lt!249221) #b01111111111111111111111111111110))))

(declare-fun b!546179 () Bool)

(assert (=> b!546179 (= e!315672 e!315674)))

(declare-fun res!340078 () Bool)

(assert (=> b!546179 (= res!340078 (and ((_ is Intermediate!5004) lt!249221) (not (undefined!5816 lt!249221)) (bvslt (x!51164 lt!249221) #b01111111111111111111111111111110) (bvsge (x!51164 lt!249221) #b00000000000000000000000000000000) (bvsge (x!51164 lt!249221) #b00000000000000000000000000000000)))))

(assert (=> b!546179 (=> (not res!340078) (not e!315674))))

(declare-fun e!315671 () SeekEntryResult!5004)

(declare-fun b!546180 () Bool)

(assert (=> b!546180 (= e!315671 (Intermediate!5004 true (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!82261 () Bool)

(assert (=> d!82261 e!315672))

(declare-fun c!63375 () Bool)

(assert (=> d!82261 (= c!63375 (and ((_ is Intermediate!5004) lt!249221) (undefined!5816 lt!249221)))))

(assert (=> d!82261 (= lt!249221 e!315671)))

(declare-fun c!63376 () Bool)

(assert (=> d!82261 (= c!63376 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!249222 () (_ BitVec 64))

(assert (=> d!82261 (= lt!249222 (select (arr!16546 a!3154) (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216)))))

(assert (=> d!82261 (validMask!0 mask!3216)))

(assert (=> d!82261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) (select (arr!16546 a!3154) j!147) a!3154 mask!3216) lt!249221)))

(declare-fun b!546181 () Bool)

(assert (=> b!546181 (= e!315671 e!315670)))

(declare-fun c!63377 () Bool)

(assert (=> b!546181 (= c!63377 (or (= lt!249222 (select (arr!16546 a!3154) j!147)) (= (bvadd lt!249222 lt!249222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546182 () Bool)

(assert (=> b!546182 (and (bvsge (index!22242 lt!249221) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249221) (size!16910 a!3154)))))

(declare-fun res!340077 () Bool)

(assert (=> b!546182 (= res!340077 (= (select (arr!16546 a!3154) (index!22242 lt!249221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546182 (=> res!340077 e!315673)))

(assert (= (and d!82261 c!63376) b!546180))

(assert (= (and d!82261 (not c!63376)) b!546181))

(assert (= (and b!546181 c!63377) b!546176))

(assert (= (and b!546181 (not c!63377)) b!546175))

(assert (= (and d!82261 c!63375) b!546178))

(assert (= (and d!82261 (not c!63375)) b!546179))

(assert (= (and b!546179 res!340078) b!546174))

(assert (= (and b!546174 (not res!340079)) b!546182))

(assert (= (and b!546182 (not res!340077)) b!546177))

(assert (=> b!546175 m!523641))

(declare-fun m!523739 () Bool)

(assert (=> b!546175 m!523739))

(assert (=> b!546175 m!523739))

(assert (=> b!546175 m!523637))

(declare-fun m!523741 () Bool)

(assert (=> b!546175 m!523741))

(declare-fun m!523743 () Bool)

(assert (=> b!546177 m!523743))

(assert (=> b!546182 m!523743))

(assert (=> d!82261 m!523641))

(declare-fun m!523745 () Bool)

(assert (=> d!82261 m!523745))

(assert (=> d!82261 m!523661))

(assert (=> b!546174 m!523743))

(assert (=> b!546094 d!82261))

(declare-fun d!82263 () Bool)

(declare-fun lt!249228 () (_ BitVec 32))

(declare-fun lt!249227 () (_ BitVec 32))

(assert (=> d!82263 (= lt!249228 (bvmul (bvxor lt!249227 (bvlshr lt!249227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82263 (= lt!249227 ((_ extract 31 0) (bvand (bvxor (select (arr!16546 a!3154) j!147) (bvlshr (select (arr!16546 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82263 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!340080 (let ((h!11627 ((_ extract 31 0) (bvand (bvxor (select (arr!16546 a!3154) j!147) (bvlshr (select (arr!16546 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51167 (bvmul (bvxor h!11627 (bvlshr h!11627 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51167 (bvlshr x!51167 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!340080 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!340080 #b00000000000000000000000000000000))))))

(assert (=> d!82263 (= (toIndex!0 (select (arr!16546 a!3154) j!147) mask!3216) (bvand (bvxor lt!249228 (bvlshr lt!249228 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!546094 d!82263))

(declare-fun d!82265 () Bool)

(declare-fun lt!249231 () (_ BitVec 32))

(assert (=> d!82265 (and (bvsge lt!249231 #b00000000000000000000000000000000) (bvslt lt!249231 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82265 (= lt!249231 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82265 (validMask!0 mask!3216)))

(assert (=> d!82265 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!249231)))

(declare-fun bs!17023 () Bool)

(assert (= bs!17023 d!82265))

(declare-fun m!523747 () Bool)

(assert (=> bs!17023 m!523747))

(assert (=> bs!17023 m!523661))

(assert (=> b!546092 d!82265))

(declare-fun d!82267 () Bool)

(assert (=> d!82267 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546093 d!82267))

(declare-fun d!82269 () Bool)

(assert (=> d!82269 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49622 d!82269))

(declare-fun d!82277 () Bool)

(assert (=> d!82277 (= (array_inv!12342 a!3154) (bvsge (size!16910 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49622 d!82277))

(declare-fun d!82279 () Bool)

(assert (=> d!82279 (= (validKeyInArray!0 (select (arr!16546 a!3154) j!147)) (and (not (= (select (arr!16546 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16546 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546086 d!82279))

(declare-fun b!546183 () Bool)

(declare-fun lt!249232 () SeekEntryResult!5004)

(assert (=> b!546183 (and (bvsge (index!22242 lt!249232) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249232) (size!16910 lt!249172)))))

(declare-fun res!340083 () Bool)

(assert (=> b!546183 (= res!340083 (= (select (arr!16546 lt!249172) (index!22242 lt!249232)) lt!249178))))

(declare-fun e!315678 () Bool)

(assert (=> b!546183 (=> res!340083 e!315678)))

(declare-fun e!315679 () Bool)

(assert (=> b!546183 (= e!315679 e!315678)))

(declare-fun e!315675 () SeekEntryResult!5004)

(declare-fun b!546184 () Bool)

(assert (=> b!546184 (= e!315675 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) lt!249178 lt!249172 mask!3216))))

(declare-fun b!546185 () Bool)

(assert (=> b!546185 (= e!315675 (Intermediate!5004 false index!1177 x!1030))))

(declare-fun b!546186 () Bool)

(assert (=> b!546186 (and (bvsge (index!22242 lt!249232) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249232) (size!16910 lt!249172)))))

(assert (=> b!546186 (= e!315678 (= (select (arr!16546 lt!249172) (index!22242 lt!249232)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546187 () Bool)

(declare-fun e!315677 () Bool)

(assert (=> b!546187 (= e!315677 (bvsge (x!51164 lt!249232) #b01111111111111111111111111111110))))

(declare-fun b!546188 () Bool)

(assert (=> b!546188 (= e!315677 e!315679)))

(declare-fun res!340082 () Bool)

(assert (=> b!546188 (= res!340082 (and ((_ is Intermediate!5004) lt!249232) (not (undefined!5816 lt!249232)) (bvslt (x!51164 lt!249232) #b01111111111111111111111111111110) (bvsge (x!51164 lt!249232) #b00000000000000000000000000000000) (bvsge (x!51164 lt!249232) x!1030)))))

(assert (=> b!546188 (=> (not res!340082) (not e!315679))))

(declare-fun b!546189 () Bool)

(declare-fun e!315676 () SeekEntryResult!5004)

(assert (=> b!546189 (= e!315676 (Intermediate!5004 true index!1177 x!1030))))

(declare-fun d!82281 () Bool)

(assert (=> d!82281 e!315677))

(declare-fun c!63378 () Bool)

(assert (=> d!82281 (= c!63378 (and ((_ is Intermediate!5004) lt!249232) (undefined!5816 lt!249232)))))

(assert (=> d!82281 (= lt!249232 e!315676)))

(declare-fun c!63379 () Bool)

(assert (=> d!82281 (= c!63379 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249233 () (_ BitVec 64))

(assert (=> d!82281 (= lt!249233 (select (arr!16546 lt!249172) index!1177))))

(assert (=> d!82281 (validMask!0 mask!3216)))

(assert (=> d!82281 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249178 lt!249172 mask!3216) lt!249232)))

(declare-fun b!546190 () Bool)

(assert (=> b!546190 (= e!315676 e!315675)))

(declare-fun c!63380 () Bool)

(assert (=> b!546190 (= c!63380 (or (= lt!249233 lt!249178) (= (bvadd lt!249233 lt!249233) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546191 () Bool)

(assert (=> b!546191 (and (bvsge (index!22242 lt!249232) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249232) (size!16910 lt!249172)))))

(declare-fun res!340081 () Bool)

(assert (=> b!546191 (= res!340081 (= (select (arr!16546 lt!249172) (index!22242 lt!249232)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546191 (=> res!340081 e!315678)))

(assert (= (and d!82281 c!63379) b!546189))

(assert (= (and d!82281 (not c!63379)) b!546190))

(assert (= (and b!546190 c!63380) b!546185))

(assert (= (and b!546190 (not c!63380)) b!546184))

(assert (= (and d!82281 c!63378) b!546187))

(assert (= (and d!82281 (not c!63378)) b!546188))

(assert (= (and b!546188 res!340082) b!546183))

(assert (= (and b!546183 (not res!340083)) b!546191))

(assert (= (and b!546191 (not res!340081)) b!546186))

(assert (=> b!546184 m!523667))

(assert (=> b!546184 m!523667))

(declare-fun m!523749 () Bool)

(assert (=> b!546184 m!523749))

(declare-fun m!523751 () Bool)

(assert (=> b!546186 m!523751))

(assert (=> b!546191 m!523751))

(declare-fun m!523753 () Bool)

(assert (=> d!82281 m!523753))

(assert (=> d!82281 m!523661))

(assert (=> b!546183 m!523751))

(assert (=> b!546095 d!82281))

(declare-fun b!546192 () Bool)

(declare-fun lt!249234 () SeekEntryResult!5004)

(assert (=> b!546192 (and (bvsge (index!22242 lt!249234) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249234) (size!16910 lt!249172)))))

(declare-fun res!340086 () Bool)

(assert (=> b!546192 (= res!340086 (= (select (arr!16546 lt!249172) (index!22242 lt!249234)) lt!249178))))

(declare-fun e!315683 () Bool)

(assert (=> b!546192 (=> res!340086 e!315683)))

(declare-fun e!315684 () Bool)

(assert (=> b!546192 (= e!315684 e!315683)))

(declare-fun b!546193 () Bool)

(declare-fun e!315680 () SeekEntryResult!5004)

(assert (=> b!546193 (= e!315680 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!249178 lt!249172 mask!3216))))

(declare-fun b!546194 () Bool)

(assert (=> b!546194 (= e!315680 (Intermediate!5004 false lt!249177 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546195 () Bool)

(assert (=> b!546195 (and (bvsge (index!22242 lt!249234) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249234) (size!16910 lt!249172)))))

(assert (=> b!546195 (= e!315683 (= (select (arr!16546 lt!249172) (index!22242 lt!249234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546196 () Bool)

(declare-fun e!315682 () Bool)

(assert (=> b!546196 (= e!315682 (bvsge (x!51164 lt!249234) #b01111111111111111111111111111110))))

(declare-fun b!546197 () Bool)

(assert (=> b!546197 (= e!315682 e!315684)))

(declare-fun res!340085 () Bool)

(assert (=> b!546197 (= res!340085 (and ((_ is Intermediate!5004) lt!249234) (not (undefined!5816 lt!249234)) (bvslt (x!51164 lt!249234) #b01111111111111111111111111111110) (bvsge (x!51164 lt!249234) #b00000000000000000000000000000000) (bvsge (x!51164 lt!249234) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546197 (=> (not res!340085) (not e!315684))))

(declare-fun b!546198 () Bool)

(declare-fun e!315681 () SeekEntryResult!5004)

(assert (=> b!546198 (= e!315681 (Intermediate!5004 true lt!249177 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun d!82283 () Bool)

(assert (=> d!82283 e!315682))

(declare-fun c!63381 () Bool)

(assert (=> d!82283 (= c!63381 (and ((_ is Intermediate!5004) lt!249234) (undefined!5816 lt!249234)))))

(assert (=> d!82283 (= lt!249234 e!315681)))

(declare-fun c!63382 () Bool)

(assert (=> d!82283 (= c!63382 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249235 () (_ BitVec 64))

(assert (=> d!82283 (= lt!249235 (select (arr!16546 lt!249172) lt!249177))))

(assert (=> d!82283 (validMask!0 mask!3216)))

(assert (=> d!82283 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249177 lt!249178 lt!249172 mask!3216) lt!249234)))

(declare-fun b!546199 () Bool)

(assert (=> b!546199 (= e!315681 e!315680)))

(declare-fun c!63383 () Bool)

(assert (=> b!546199 (= c!63383 (or (= lt!249235 lt!249178) (= (bvadd lt!249235 lt!249235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546200 () Bool)

(assert (=> b!546200 (and (bvsge (index!22242 lt!249234) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249234) (size!16910 lt!249172)))))

(declare-fun res!340084 () Bool)

(assert (=> b!546200 (= res!340084 (= (select (arr!16546 lt!249172) (index!22242 lt!249234)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546200 (=> res!340084 e!315683)))

(assert (= (and d!82283 c!63382) b!546198))

(assert (= (and d!82283 (not c!63382)) b!546199))

(assert (= (and b!546199 c!63383) b!546194))

(assert (= (and b!546199 (not c!63383)) b!546193))

(assert (= (and d!82283 c!63381) b!546196))

(assert (= (and d!82283 (not c!63381)) b!546197))

(assert (= (and b!546197 res!340085) b!546192))

(assert (= (and b!546192 (not res!340086)) b!546200))

(assert (= (and b!546200 (not res!340084)) b!546195))

(assert (=> b!546193 m!523731))

(assert (=> b!546193 m!523731))

(declare-fun m!523755 () Bool)

(assert (=> b!546193 m!523755))

(declare-fun m!523757 () Bool)

(assert (=> b!546195 m!523757))

(assert (=> b!546200 m!523757))

(declare-fun m!523759 () Bool)

(assert (=> d!82283 m!523759))

(assert (=> d!82283 m!523661))

(assert (=> b!546192 m!523757))

(assert (=> b!546095 d!82283))

(declare-fun d!82285 () Bool)

(declare-fun e!315712 () Bool)

(assert (=> d!82285 e!315712))

(declare-fun res!340104 () Bool)

(assert (=> d!82285 (=> (not res!340104) (not e!315712))))

(assert (=> d!82285 (= res!340104 (and (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16910 a!3154)) (and (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16910 a!3154)))) (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16910 a!3154)) (and (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16910 a!3154)))) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16910 a!3154))))))

(declare-fun lt!249248 () Unit!16942)

(declare-fun choose!47 (array!34435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16942)

(assert (=> d!82285 (= lt!249248 (choose!47 a!3154 i!1153 k0!1998 j!147 lt!249177 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (=> d!82285 (validMask!0 mask!3216)))

(assert (=> d!82285 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249177 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216) lt!249248)))

(declare-fun b!546248 () Bool)

(assert (=> b!546248 (= e!315712 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249177 (select (store (arr!16546 a!3154) i!1153 k0!1998) j!147) (array!34436 (store (arr!16546 a!3154) i!1153 k0!1998) (size!16910 a!3154)) mask!3216) (Intermediate!5004 false resIndex!32 resX!32)))))

(assert (= (and d!82285 res!340104) b!546248))

(declare-fun m!523769 () Bool)

(assert (=> d!82285 m!523769))

(assert (=> d!82285 m!523661))

(assert (=> b!546248 m!523653))

(assert (=> b!546248 m!523659))

(assert (=> b!546248 m!523659))

(declare-fun m!523771 () Bool)

(assert (=> b!546248 m!523771))

(assert (=> b!546095 d!82285))

(declare-fun lt!249275 () SeekEntryResult!5004)

(declare-fun e!315738 () SeekEntryResult!5004)

(declare-fun b!546297 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34435 (_ BitVec 32)) SeekEntryResult!5004)

(assert (=> b!546297 (= e!315738 (seekKeyOrZeroReturnVacant!0 (x!51164 lt!249275) (index!22242 lt!249275) (index!22242 lt!249275) k0!1998 a!3154 mask!3216))))

(declare-fun b!546298 () Bool)

(declare-fun e!315739 () SeekEntryResult!5004)

(declare-fun e!315740 () SeekEntryResult!5004)

(assert (=> b!546298 (= e!315739 e!315740)))

(declare-fun lt!249276 () (_ BitVec 64))

(assert (=> b!546298 (= lt!249276 (select (arr!16546 a!3154) (index!22242 lt!249275)))))

(declare-fun c!63421 () Bool)

(assert (=> b!546298 (= c!63421 (= lt!249276 k0!1998))))

(declare-fun d!82289 () Bool)

(declare-fun lt!249274 () SeekEntryResult!5004)

(assert (=> d!82289 (and (or ((_ is Undefined!5004) lt!249274) (not ((_ is Found!5004) lt!249274)) (and (bvsge (index!22241 lt!249274) #b00000000000000000000000000000000) (bvslt (index!22241 lt!249274) (size!16910 a!3154)))) (or ((_ is Undefined!5004) lt!249274) ((_ is Found!5004) lt!249274) (not ((_ is MissingZero!5004) lt!249274)) (and (bvsge (index!22240 lt!249274) #b00000000000000000000000000000000) (bvslt (index!22240 lt!249274) (size!16910 a!3154)))) (or ((_ is Undefined!5004) lt!249274) ((_ is Found!5004) lt!249274) ((_ is MissingZero!5004) lt!249274) (not ((_ is MissingVacant!5004) lt!249274)) (and (bvsge (index!22243 lt!249274) #b00000000000000000000000000000000) (bvslt (index!22243 lt!249274) (size!16910 a!3154)))) (or ((_ is Undefined!5004) lt!249274) (ite ((_ is Found!5004) lt!249274) (= (select (arr!16546 a!3154) (index!22241 lt!249274)) k0!1998) (ite ((_ is MissingZero!5004) lt!249274) (= (select (arr!16546 a!3154) (index!22240 lt!249274)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5004) lt!249274) (= (select (arr!16546 a!3154) (index!22243 lt!249274)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82289 (= lt!249274 e!315739)))

(declare-fun c!63422 () Bool)

(assert (=> d!82289 (= c!63422 (and ((_ is Intermediate!5004) lt!249275) (undefined!5816 lt!249275)))))

(assert (=> d!82289 (= lt!249275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82289 (validMask!0 mask!3216)))

(assert (=> d!82289 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!249274)))

(declare-fun b!546299 () Bool)

(assert (=> b!546299 (= e!315738 (MissingZero!5004 (index!22242 lt!249275)))))

(declare-fun b!546300 () Bool)

(declare-fun c!63420 () Bool)

(assert (=> b!546300 (= c!63420 (= lt!249276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546300 (= e!315740 e!315738)))

(declare-fun b!546301 () Bool)

(assert (=> b!546301 (= e!315740 (Found!5004 (index!22242 lt!249275)))))

(declare-fun b!546302 () Bool)

(assert (=> b!546302 (= e!315739 Undefined!5004)))

(assert (= (and d!82289 c!63422) b!546302))

(assert (= (and d!82289 (not c!63422)) b!546298))

(assert (= (and b!546298 c!63421) b!546301))

(assert (= (and b!546298 (not c!63421)) b!546300))

(assert (= (and b!546300 c!63420) b!546299))

(assert (= (and b!546300 (not c!63420)) b!546297))

(declare-fun m!523803 () Bool)

(assert (=> b!546297 m!523803))

(declare-fun m!523805 () Bool)

(assert (=> b!546298 m!523805))

(declare-fun m!523807 () Bool)

(assert (=> d!82289 m!523807))

(declare-fun m!523809 () Bool)

(assert (=> d!82289 m!523809))

(declare-fun m!523811 () Bool)

(assert (=> d!82289 m!523811))

(declare-fun m!523813 () Bool)

(assert (=> d!82289 m!523813))

(assert (=> d!82289 m!523807))

(declare-fun m!523815 () Bool)

(assert (=> d!82289 m!523815))

(assert (=> d!82289 m!523661))

(assert (=> b!546084 d!82289))

(declare-fun b!546343 () Bool)

(declare-fun e!315768 () Bool)

(declare-fun e!315767 () Bool)

(assert (=> b!546343 (= e!315768 e!315767)))

(declare-fun c!63437 () Bool)

(assert (=> b!546343 (= c!63437 (validKeyInArray!0 (select (arr!16546 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32132 () Bool)

(declare-fun call!32135 () Bool)

(assert (=> bm!32132 (= call!32135 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63437 (Cons!10661 (select (arr!16546 a!3154) #b00000000000000000000000000000000) Nil!10662) Nil!10662)))))

(declare-fun b!546344 () Bool)

(assert (=> b!546344 (= e!315767 call!32135)))

(declare-fun d!82301 () Bool)

(declare-fun res!340127 () Bool)

(declare-fun e!315765 () Bool)

(assert (=> d!82301 (=> res!340127 e!315765)))

(assert (=> d!82301 (= res!340127 (bvsge #b00000000000000000000000000000000 (size!16910 a!3154)))))

(assert (=> d!82301 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10662) e!315765)))

(declare-fun b!546345 () Bool)

(assert (=> b!546345 (= e!315765 e!315768)))

(declare-fun res!340126 () Bool)

(assert (=> b!546345 (=> (not res!340126) (not e!315768))))

(declare-fun e!315766 () Bool)

(assert (=> b!546345 (= res!340126 (not e!315766))))

(declare-fun res!340125 () Bool)

(assert (=> b!546345 (=> (not res!340125) (not e!315766))))

(assert (=> b!546345 (= res!340125 (validKeyInArray!0 (select (arr!16546 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546346 () Bool)

(assert (=> b!546346 (= e!315767 call!32135)))

(declare-fun b!546347 () Bool)

(declare-fun contains!2813 (List!10665 (_ BitVec 64)) Bool)

(assert (=> b!546347 (= e!315766 (contains!2813 Nil!10662 (select (arr!16546 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82301 (not res!340127)) b!546345))

(assert (= (and b!546345 res!340125) b!546347))

(assert (= (and b!546345 res!340126) b!546343))

(assert (= (and b!546343 c!63437) b!546346))

(assert (= (and b!546343 (not c!63437)) b!546344))

(assert (= (or b!546346 b!546344) bm!32132))

(assert (=> b!546343 m!523719))

(assert (=> b!546343 m!523719))

(assert (=> b!546343 m!523729))

(assert (=> bm!32132 m!523719))

(declare-fun m!523831 () Bool)

(assert (=> bm!32132 m!523831))

(assert (=> b!546345 m!523719))

(assert (=> b!546345 m!523719))

(assert (=> b!546345 m!523729))

(assert (=> b!546347 m!523719))

(assert (=> b!546347 m!523719))

(declare-fun m!523833 () Bool)

(assert (=> b!546347 m!523833))

(assert (=> b!546085 d!82301))

(declare-fun b!546363 () Bool)

(declare-fun lt!249298 () SeekEntryResult!5004)

(assert (=> b!546363 (and (bvsge (index!22242 lt!249298) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249298) (size!16910 a!3154)))))

(declare-fun res!340133 () Bool)

(assert (=> b!546363 (= res!340133 (= (select (arr!16546 a!3154) (index!22242 lt!249298)) (select (arr!16546 a!3154) j!147)))))

(declare-fun e!315780 () Bool)

(assert (=> b!546363 (=> res!340133 e!315780)))

(declare-fun e!315781 () Bool)

(assert (=> b!546363 (= e!315781 e!315780)))

(declare-fun b!546364 () Bool)

(declare-fun e!315777 () SeekEntryResult!5004)

(assert (=> b!546364 (= e!315777 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16546 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546365 () Bool)

(assert (=> b!546365 (= e!315777 (Intermediate!5004 false index!1177 x!1030))))

(declare-fun b!546366 () Bool)

(assert (=> b!546366 (and (bvsge (index!22242 lt!249298) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249298) (size!16910 a!3154)))))

(assert (=> b!546366 (= e!315780 (= (select (arr!16546 a!3154) (index!22242 lt!249298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546367 () Bool)

(declare-fun e!315779 () Bool)

(assert (=> b!546367 (= e!315779 (bvsge (x!51164 lt!249298) #b01111111111111111111111111111110))))

(declare-fun b!546368 () Bool)

(assert (=> b!546368 (= e!315779 e!315781)))

(declare-fun res!340132 () Bool)

(assert (=> b!546368 (= res!340132 (and ((_ is Intermediate!5004) lt!249298) (not (undefined!5816 lt!249298)) (bvslt (x!51164 lt!249298) #b01111111111111111111111111111110) (bvsge (x!51164 lt!249298) #b00000000000000000000000000000000) (bvsge (x!51164 lt!249298) x!1030)))))

(assert (=> b!546368 (=> (not res!340132) (not e!315781))))

(declare-fun b!546369 () Bool)

(declare-fun e!315778 () SeekEntryResult!5004)

(assert (=> b!546369 (= e!315778 (Intermediate!5004 true index!1177 x!1030))))

(declare-fun d!82309 () Bool)

(assert (=> d!82309 e!315779))

(declare-fun c!63444 () Bool)

(assert (=> d!82309 (= c!63444 (and ((_ is Intermediate!5004) lt!249298) (undefined!5816 lt!249298)))))

(assert (=> d!82309 (= lt!249298 e!315778)))

(declare-fun c!63445 () Bool)

(assert (=> d!82309 (= c!63445 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249299 () (_ BitVec 64))

(assert (=> d!82309 (= lt!249299 (select (arr!16546 a!3154) index!1177))))

(assert (=> d!82309 (validMask!0 mask!3216)))

(assert (=> d!82309 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16546 a!3154) j!147) a!3154 mask!3216) lt!249298)))

(declare-fun b!546370 () Bool)

(assert (=> b!546370 (= e!315778 e!315777)))

(declare-fun c!63446 () Bool)

(assert (=> b!546370 (= c!63446 (or (= lt!249299 (select (arr!16546 a!3154) j!147)) (= (bvadd lt!249299 lt!249299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546371 () Bool)

(assert (=> b!546371 (and (bvsge (index!22242 lt!249298) #b00000000000000000000000000000000) (bvslt (index!22242 lt!249298) (size!16910 a!3154)))))

(declare-fun res!340131 () Bool)

(assert (=> b!546371 (= res!340131 (= (select (arr!16546 a!3154) (index!22242 lt!249298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546371 (=> res!340131 e!315780)))

(assert (= (and d!82309 c!63445) b!546369))

(assert (= (and d!82309 (not c!63445)) b!546370))

(assert (= (and b!546370 c!63446) b!546365))

(assert (= (and b!546370 (not c!63446)) b!546364))

(assert (= (and d!82309 c!63444) b!546367))

(assert (= (and d!82309 (not c!63444)) b!546368))

(assert (= (and b!546368 res!340132) b!546363))

(assert (= (and b!546363 (not res!340133)) b!546371))

(assert (= (and b!546371 (not res!340131)) b!546366))

(assert (=> b!546364 m!523667))

(assert (=> b!546364 m!523667))

(assert (=> b!546364 m!523637))

(declare-fun m!523855 () Bool)

(assert (=> b!546364 m!523855))

(declare-fun m!523857 () Bool)

(assert (=> b!546366 m!523857))

(assert (=> b!546371 m!523857))

(assert (=> d!82309 m!523639))

(assert (=> d!82309 m!523661))

(assert (=> b!546363 m!523857))

(assert (=> b!546089 d!82309))

(declare-fun d!82315 () Bool)

(declare-fun res!340138 () Bool)

(declare-fun e!315786 () Bool)

(assert (=> d!82315 (=> res!340138 e!315786)))

(assert (=> d!82315 (= res!340138 (= (select (arr!16546 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82315 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315786)))

(declare-fun b!546376 () Bool)

(declare-fun e!315787 () Bool)

(assert (=> b!546376 (= e!315786 e!315787)))

(declare-fun res!340139 () Bool)

(assert (=> b!546376 (=> (not res!340139) (not e!315787))))

(assert (=> b!546376 (= res!340139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16910 a!3154)))))

(declare-fun b!546377 () Bool)

(assert (=> b!546377 (= e!315787 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82315 (not res!340138)) b!546376))

(assert (= (and b!546376 res!340139) b!546377))

(assert (=> d!82315 m!523719))

(declare-fun m!523861 () Bool)

(assert (=> b!546377 m!523861))

(assert (=> b!546087 d!82315))

(check-sat (not b!546297) (not b!546347) (not b!546343) (not bm!32132) (not b!546193) (not b!546146) (not b!546377) (not d!82283) (not d!82259) (not d!82265) (not b!546345) (not b!546364) (not bm!32129) (not d!82285) (not b!546175) (not b!546184) (not d!82309) (not b!546143) (not b!546248) (not d!82289) (not b!546166) (not d!82261) (not d!82281))
(check-sat)
