; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137146 () Bool)

(assert start!137146)

(declare-fun b!1580932 () Bool)

(declare-fun res!1079349 () Bool)

(declare-fun e!881953 () Bool)

(assert (=> b!1580932 (=> (not res!1079349) (not e!881953))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580932 (= res!1079349 (validKeyInArray!0 k0!772))))

(declare-fun b!1580931 () Bool)

(declare-fun res!1079350 () Bool)

(assert (=> b!1580931 (=> (not res!1079350) (not e!881953))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105881 0))(
  ( (array!105882 (arr!51043 (Array (_ BitVec 32) (_ BitVec 64))) (size!51594 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105881)

(assert (=> b!1580931 (= res!1079350 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51594 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!51043 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580934 () Bool)

(declare-datatypes ((SeekEntryResult!13718 0))(
  ( (MissingZero!13718 (index!57270 (_ BitVec 32))) (Found!13718 (index!57271 (_ BitVec 32))) (Intermediate!13718 (undefined!14530 Bool) (index!57272 (_ BitVec 32)) (x!142759 (_ BitVec 32))) (Undefined!13718) (MissingVacant!13718 (index!57273 (_ BitVec 32))) )
))
(declare-fun lt!677172 () SeekEntryResult!13718)

(get-info :version)

(assert (=> b!1580934 (= e!881953 (and (not ((_ is Undefined!13718) lt!677172)) (ite ((_ is Found!13718) lt!677172) (not (= (select (arr!51043 _keys!614) (index!57271 lt!677172)) k0!772)) (or (not ((_ is MissingVacant!13718) lt!677172)) (not (= (index!57273 lt!677172) vacantSpotIndex!10)) (not (= (select (arr!51043 _keys!614) (index!57273 lt!677172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105881 (_ BitVec 32)) SeekEntryResult!13718)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580934 (= lt!677172 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun res!1079348 () Bool)

(assert (=> start!137146 (=> (not res!1079348) (not e!881953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137146 (= res!1079348 (validMask!0 mask!918))))

(assert (=> start!137146 e!881953))

(assert (=> start!137146 true))

(declare-fun array_inv!39998 (array!105881) Bool)

(assert (=> start!137146 (array_inv!39998 _keys!614)))

(declare-fun b!1580933 () Bool)

(declare-fun res!1079351 () Bool)

(assert (=> b!1580933 (=> (not res!1079351) (not e!881953))))

(assert (=> b!1580933 (= res!1079351 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!51043 _keys!614) ee!18) k0!772)) (not (= (select (arr!51043 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!137146 res!1079348) b!1580931))

(assert (= (and b!1580931 res!1079350) b!1580932))

(assert (= (and b!1580932 res!1079349) b!1580933))

(assert (= (and b!1580933 res!1079351) b!1580934))

(declare-fun m!1452849 () Bool)

(assert (=> start!137146 m!1452849))

(declare-fun m!1452851 () Bool)

(assert (=> start!137146 m!1452851))

(declare-fun m!1452853 () Bool)

(assert (=> b!1580933 m!1452853))

(declare-fun m!1452855 () Bool)

(assert (=> b!1580931 m!1452855))

(declare-fun m!1452857 () Bool)

(assert (=> b!1580932 m!1452857))

(declare-fun m!1452859 () Bool)

(assert (=> b!1580934 m!1452859))

(declare-fun m!1452861 () Bool)

(assert (=> b!1580934 m!1452861))

(declare-fun m!1452863 () Bool)

(assert (=> b!1580934 m!1452863))

(assert (=> b!1580934 m!1452863))

(declare-fun m!1452865 () Bool)

(assert (=> b!1580934 m!1452865))

(check-sat (not b!1580932) (not start!137146) (not b!1580934))
(check-sat)
(get-model)

(declare-fun d!166797 () Bool)

(assert (=> d!166797 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1580932 d!166797))

(declare-fun d!166799 () Bool)

(assert (=> d!166799 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!137146 d!166799))

(declare-fun d!166801 () Bool)

(assert (=> d!166801 (= (array_inv!39998 _keys!614) (bvsge (size!51594 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!137146 d!166801))

(declare-fun b!1580989 () Bool)

(declare-fun e!881983 () SeekEntryResult!13718)

(declare-fun e!881984 () SeekEntryResult!13718)

(assert (=> b!1580989 (= e!881983 e!881984)))

(declare-fun c!147102 () Bool)

(declare-fun lt!677193 () (_ BitVec 64))

(assert (=> b!1580989 (= c!147102 (= lt!677193 k0!772))))

(declare-fun b!1580990 () Bool)

(assert (=> b!1580990 (= e!881983 Undefined!13718)))

(declare-fun b!1580991 () Bool)

(declare-fun e!881982 () SeekEntryResult!13718)

(assert (=> b!1580991 (= e!881982 (MissingVacant!13718 vacantSpotIndex!10))))

(declare-fun b!1580992 () Bool)

(declare-fun c!147103 () Bool)

(assert (=> b!1580992 (= c!147103 (= lt!677193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1580992 (= e!881984 e!881982)))

(declare-fun b!1580993 () Bool)

(assert (=> b!1580993 (= e!881984 (Found!13718 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918)))))

(declare-fun b!1580994 () Bool)

(assert (=> b!1580994 (= e!881982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun lt!677192 () SeekEntryResult!13718)

(declare-fun d!166805 () Bool)

(assert (=> d!166805 (and (or ((_ is Undefined!13718) lt!677192) (not ((_ is Found!13718) lt!677192)) (and (bvsge (index!57271 lt!677192) #b00000000000000000000000000000000) (bvslt (index!57271 lt!677192) (size!51594 _keys!614)))) (or ((_ is Undefined!13718) lt!677192) ((_ is Found!13718) lt!677192) (not ((_ is MissingVacant!13718) lt!677192)) (not (= (index!57273 lt!677192) vacantSpotIndex!10)) (and (bvsge (index!57273 lt!677192) #b00000000000000000000000000000000) (bvslt (index!57273 lt!677192) (size!51594 _keys!614)))) (or ((_ is Undefined!13718) lt!677192) (ite ((_ is Found!13718) lt!677192) (= (select (arr!51043 _keys!614) (index!57271 lt!677192)) k0!772) (and ((_ is MissingVacant!13718) lt!677192) (= (index!57273 lt!677192) vacantSpotIndex!10) (= (select (arr!51043 _keys!614) (index!57273 lt!677192)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166805 (= lt!677192 e!881983)))

(declare-fun c!147104 () Bool)

(assert (=> d!166805 (= c!147104 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!166805 (= lt!677193 (select (arr!51043 _keys!614) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918)))))

(assert (=> d!166805 (validMask!0 mask!918)))

(assert (=> d!166805 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918) lt!677192)))

(assert (= (and d!166805 c!147104) b!1580990))

(assert (= (and d!166805 (not c!147104)) b!1580989))

(assert (= (and b!1580989 c!147102) b!1580993))

(assert (= (and b!1580989 (not c!147102)) b!1580992))

(assert (= (and b!1580992 c!147103) b!1580991))

(assert (= (and b!1580992 (not c!147103)) b!1580994))

(assert (=> b!1580994 m!1452863))

(declare-fun m!1452915 () Bool)

(assert (=> b!1580994 m!1452915))

(assert (=> b!1580994 m!1452915))

(declare-fun m!1452917 () Bool)

(assert (=> b!1580994 m!1452917))

(declare-fun m!1452919 () Bool)

(assert (=> d!166805 m!1452919))

(declare-fun m!1452921 () Bool)

(assert (=> d!166805 m!1452921))

(assert (=> d!166805 m!1452863))

(declare-fun m!1452923 () Bool)

(assert (=> d!166805 m!1452923))

(assert (=> d!166805 m!1452849))

(assert (=> b!1580934 d!166805))

(declare-fun d!166817 () Bool)

(declare-fun lt!677196 () (_ BitVec 32))

(assert (=> d!166817 (and (bvsge lt!677196 #b00000000000000000000000000000000) (bvslt lt!677196 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166817 (= lt!677196 (choose!52 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918))))

(assert (=> d!166817 (validMask!0 mask!918)))

(assert (=> d!166817 (= (nextIndex!0 ee!18 (bvadd #b00000000000000000000000000000001 x!466) mask!918) lt!677196)))

(declare-fun bs!45686 () Bool)

(assert (= bs!45686 d!166817))

(declare-fun m!1452925 () Bool)

(assert (=> bs!45686 m!1452925))

(assert (=> bs!45686 m!1452849))

(assert (=> b!1580934 d!166817))

(check-sat (not d!166805) (not b!1580994) (not d!166817))
(check-sat)
