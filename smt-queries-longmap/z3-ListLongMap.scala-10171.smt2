; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119900 () Bool)

(assert start!119900)

(declare-fun b!1396088 () Bool)

(declare-fun res!935170 () Bool)

(declare-fun e!790364 () Bool)

(assert (=> b!1396088 (=> (not res!935170) (not e!790364))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95480 0))(
  ( (array!95481 (arr!46095 (Array (_ BitVec 32) (_ BitVec 64))) (size!46645 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95480)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396088 (= res!935170 (and (= (size!46645 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46645 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46645 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!935172 () Bool)

(assert (=> start!119900 (=> (not res!935172) (not e!790364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119900 (= res!935172 (validMask!0 mask!2840))))

(assert (=> start!119900 e!790364))

(assert (=> start!119900 true))

(declare-fun array_inv!35123 (array!95480) Bool)

(assert (=> start!119900 (array_inv!35123 a!2901)))

(declare-fun b!1396089 () Bool)

(declare-fun e!790367 () Bool)

(declare-datatypes ((SeekEntryResult!10412 0))(
  ( (MissingZero!10412 (index!44019 (_ BitVec 32))) (Found!10412 (index!44020 (_ BitVec 32))) (Intermediate!10412 (undefined!11224 Bool) (index!44021 (_ BitVec 32)) (x!125684 (_ BitVec 32))) (Undefined!10412) (MissingVacant!10412 (index!44022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95480 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1396089 (= e!790367 (= (seekEntryOrOpen!0 (select (arr!46095 a!2901) j!112) a!2901 mask!2840) (Found!10412 j!112)))))

(declare-fun b!1396090 () Bool)

(declare-fun e!790366 () Bool)

(assert (=> b!1396090 (= e!790364 (not e!790366))))

(declare-fun res!935166 () Bool)

(assert (=> b!1396090 (=> res!935166 e!790366)))

(declare-fun lt!613244 () SeekEntryResult!10412)

(get-info :version)

(assert (=> b!1396090 (= res!935166 (or (not ((_ is Intermediate!10412) lt!613244)) (undefined!11224 lt!613244)))))

(assert (=> b!1396090 e!790367))

(declare-fun res!935171 () Bool)

(assert (=> b!1396090 (=> (not res!935171) (not e!790367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95480 (_ BitVec 32)) Bool)

(assert (=> b!1396090 (= res!935171 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46828 0))(
  ( (Unit!46829) )
))
(declare-fun lt!613245 () Unit!46828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46828)

(assert (=> b!1396090 (= lt!613245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95480 (_ BitVec 32)) SeekEntryResult!10412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396090 (= lt!613244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) (select (arr!46095 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396091 () Bool)

(declare-fun res!935168 () Bool)

(assert (=> b!1396091 (=> (not res!935168) (not e!790364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396091 (= res!935168 (validKeyInArray!0 (select (arr!46095 a!2901) j!112)))))

(declare-fun b!1396092 () Bool)

(declare-fun res!935173 () Bool)

(assert (=> b!1396092 (=> (not res!935173) (not e!790364))))

(assert (=> b!1396092 (= res!935173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396093 () Bool)

(declare-fun res!935167 () Bool)

(assert (=> b!1396093 (=> (not res!935167) (not e!790364))))

(assert (=> b!1396093 (= res!935167 (validKeyInArray!0 (select (arr!46095 a!2901) i!1037)))))

(declare-fun b!1396094 () Bool)

(declare-fun res!935169 () Bool)

(assert (=> b!1396094 (=> (not res!935169) (not e!790364))))

(declare-datatypes ((List!32614 0))(
  ( (Nil!32611) (Cons!32610 (h!33849 (_ BitVec 64)) (t!47308 List!32614)) )
))
(declare-fun arrayNoDuplicates!0 (array!95480 (_ BitVec 32) List!32614) Bool)

(assert (=> b!1396094 (= res!935169 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32611))))

(declare-fun lt!613243 () SeekEntryResult!10412)

(declare-fun b!1396095 () Bool)

(assert (=> b!1396095 (= e!790366 (or (= lt!613244 lt!613243) (not ((_ is Intermediate!10412) lt!613243)) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1396095 (= lt!613243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)) mask!2840))))

(assert (= (and start!119900 res!935172) b!1396088))

(assert (= (and b!1396088 res!935170) b!1396093))

(assert (= (and b!1396093 res!935167) b!1396091))

(assert (= (and b!1396091 res!935168) b!1396092))

(assert (= (and b!1396092 res!935173) b!1396094))

(assert (= (and b!1396094 res!935169) b!1396090))

(assert (= (and b!1396090 res!935171) b!1396089))

(assert (= (and b!1396090 (not res!935166)) b!1396095))

(declare-fun m!1282597 () Bool)

(assert (=> b!1396094 m!1282597))

(declare-fun m!1282599 () Bool)

(assert (=> b!1396093 m!1282599))

(assert (=> b!1396093 m!1282599))

(declare-fun m!1282601 () Bool)

(assert (=> b!1396093 m!1282601))

(declare-fun m!1282603 () Bool)

(assert (=> b!1396090 m!1282603))

(declare-fun m!1282605 () Bool)

(assert (=> b!1396090 m!1282605))

(assert (=> b!1396090 m!1282603))

(declare-fun m!1282607 () Bool)

(assert (=> b!1396090 m!1282607))

(assert (=> b!1396090 m!1282605))

(assert (=> b!1396090 m!1282603))

(declare-fun m!1282609 () Bool)

(assert (=> b!1396090 m!1282609))

(declare-fun m!1282611 () Bool)

(assert (=> b!1396090 m!1282611))

(declare-fun m!1282613 () Bool)

(assert (=> start!119900 m!1282613))

(declare-fun m!1282615 () Bool)

(assert (=> start!119900 m!1282615))

(assert (=> b!1396089 m!1282603))

(assert (=> b!1396089 m!1282603))

(declare-fun m!1282617 () Bool)

(assert (=> b!1396089 m!1282617))

(declare-fun m!1282619 () Bool)

(assert (=> b!1396092 m!1282619))

(declare-fun m!1282621 () Bool)

(assert (=> b!1396095 m!1282621))

(declare-fun m!1282623 () Bool)

(assert (=> b!1396095 m!1282623))

(assert (=> b!1396095 m!1282623))

(declare-fun m!1282625 () Bool)

(assert (=> b!1396095 m!1282625))

(assert (=> b!1396095 m!1282625))

(assert (=> b!1396095 m!1282623))

(declare-fun m!1282627 () Bool)

(assert (=> b!1396095 m!1282627))

(assert (=> b!1396091 m!1282603))

(assert (=> b!1396091 m!1282603))

(declare-fun m!1282629 () Bool)

(assert (=> b!1396091 m!1282629))

(check-sat (not b!1396095) (not b!1396090) (not b!1396092) (not b!1396094) (not b!1396093) (not start!119900) (not b!1396091) (not b!1396089))
(check-sat)
(get-model)

(declare-fun b!1396130 () Bool)

(declare-fun e!790390 () Bool)

(declare-fun e!790391 () Bool)

(assert (=> b!1396130 (= e!790390 e!790391)))

(declare-fun c!129918 () Bool)

(assert (=> b!1396130 (= c!129918 (validKeyInArray!0 (select (arr!46095 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396131 () Bool)

(declare-fun call!66847 () Bool)

(assert (=> b!1396131 (= e!790391 call!66847)))

(declare-fun b!1396132 () Bool)

(declare-fun e!790389 () Bool)

(declare-fun contains!9780 (List!32614 (_ BitVec 64)) Bool)

(assert (=> b!1396132 (= e!790389 (contains!9780 Nil!32611 (select (arr!46095 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150807 () Bool)

(declare-fun res!935204 () Bool)

(declare-fun e!790388 () Bool)

(assert (=> d!150807 (=> res!935204 e!790388)))

(assert (=> d!150807 (= res!935204 (bvsge #b00000000000000000000000000000000 (size!46645 a!2901)))))

(assert (=> d!150807 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32611) e!790388)))

(declare-fun bm!66844 () Bool)

(assert (=> bm!66844 (= call!66847 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129918 (Cons!32610 (select (arr!46095 a!2901) #b00000000000000000000000000000000) Nil!32611) Nil!32611)))))

(declare-fun b!1396133 () Bool)

(assert (=> b!1396133 (= e!790388 e!790390)))

(declare-fun res!935206 () Bool)

(assert (=> b!1396133 (=> (not res!935206) (not e!790390))))

(assert (=> b!1396133 (= res!935206 (not e!790389))))

(declare-fun res!935205 () Bool)

(assert (=> b!1396133 (=> (not res!935205) (not e!790389))))

(assert (=> b!1396133 (= res!935205 (validKeyInArray!0 (select (arr!46095 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396134 () Bool)

(assert (=> b!1396134 (= e!790391 call!66847)))

(assert (= (and d!150807 (not res!935204)) b!1396133))

(assert (= (and b!1396133 res!935205) b!1396132))

(assert (= (and b!1396133 res!935206) b!1396130))

(assert (= (and b!1396130 c!129918) b!1396134))

(assert (= (and b!1396130 (not c!129918)) b!1396131))

(assert (= (or b!1396134 b!1396131) bm!66844))

(declare-fun m!1282665 () Bool)

(assert (=> b!1396130 m!1282665))

(assert (=> b!1396130 m!1282665))

(declare-fun m!1282667 () Bool)

(assert (=> b!1396130 m!1282667))

(assert (=> b!1396132 m!1282665))

(assert (=> b!1396132 m!1282665))

(declare-fun m!1282669 () Bool)

(assert (=> b!1396132 m!1282669))

(assert (=> bm!66844 m!1282665))

(declare-fun m!1282671 () Bool)

(assert (=> bm!66844 m!1282671))

(assert (=> b!1396133 m!1282665))

(assert (=> b!1396133 m!1282665))

(assert (=> b!1396133 m!1282667))

(assert (=> b!1396094 d!150807))

(declare-fun b!1396155 () Bool)

(declare-fun e!790404 () SeekEntryResult!10412)

(declare-fun lt!613269 () SeekEntryResult!10412)

(assert (=> b!1396155 (= e!790404 (Found!10412 (index!44021 lt!613269)))))

(declare-fun b!1396156 () Bool)

(declare-fun e!790406 () SeekEntryResult!10412)

(assert (=> b!1396156 (= e!790406 e!790404)))

(declare-fun lt!613268 () (_ BitVec 64))

(assert (=> b!1396156 (= lt!613268 (select (arr!46095 a!2901) (index!44021 lt!613269)))))

(declare-fun c!129928 () Bool)

(assert (=> b!1396156 (= c!129928 (= lt!613268 (select (arr!46095 a!2901) j!112)))))

(declare-fun d!150809 () Bool)

(declare-fun lt!613267 () SeekEntryResult!10412)

(assert (=> d!150809 (and (or ((_ is Undefined!10412) lt!613267) (not ((_ is Found!10412) lt!613267)) (and (bvsge (index!44020 lt!613267) #b00000000000000000000000000000000) (bvslt (index!44020 lt!613267) (size!46645 a!2901)))) (or ((_ is Undefined!10412) lt!613267) ((_ is Found!10412) lt!613267) (not ((_ is MissingZero!10412) lt!613267)) (and (bvsge (index!44019 lt!613267) #b00000000000000000000000000000000) (bvslt (index!44019 lt!613267) (size!46645 a!2901)))) (or ((_ is Undefined!10412) lt!613267) ((_ is Found!10412) lt!613267) ((_ is MissingZero!10412) lt!613267) (not ((_ is MissingVacant!10412) lt!613267)) (and (bvsge (index!44022 lt!613267) #b00000000000000000000000000000000) (bvslt (index!44022 lt!613267) (size!46645 a!2901)))) (or ((_ is Undefined!10412) lt!613267) (ite ((_ is Found!10412) lt!613267) (= (select (arr!46095 a!2901) (index!44020 lt!613267)) (select (arr!46095 a!2901) j!112)) (ite ((_ is MissingZero!10412) lt!613267) (= (select (arr!46095 a!2901) (index!44019 lt!613267)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10412) lt!613267) (= (select (arr!46095 a!2901) (index!44022 lt!613267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150809 (= lt!613267 e!790406)))

(declare-fun c!129929 () Bool)

(assert (=> d!150809 (= c!129929 (and ((_ is Intermediate!10412) lt!613269) (undefined!11224 lt!613269)))))

(assert (=> d!150809 (= lt!613269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) (select (arr!46095 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150809 (validMask!0 mask!2840)))

(assert (=> d!150809 (= (seekEntryOrOpen!0 (select (arr!46095 a!2901) j!112) a!2901 mask!2840) lt!613267)))

(declare-fun b!1396157 () Bool)

(assert (=> b!1396157 (= e!790406 Undefined!10412)))

(declare-fun b!1396158 () Bool)

(declare-fun e!790405 () SeekEntryResult!10412)

(assert (=> b!1396158 (= e!790405 (MissingZero!10412 (index!44021 lt!613269)))))

(declare-fun b!1396159 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95480 (_ BitVec 32)) SeekEntryResult!10412)

(assert (=> b!1396159 (= e!790405 (seekKeyOrZeroReturnVacant!0 (x!125684 lt!613269) (index!44021 lt!613269) (index!44021 lt!613269) (select (arr!46095 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396160 () Bool)

(declare-fun c!129927 () Bool)

(assert (=> b!1396160 (= c!129927 (= lt!613268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396160 (= e!790404 e!790405)))

(assert (= (and d!150809 c!129929) b!1396157))

(assert (= (and d!150809 (not c!129929)) b!1396156))

(assert (= (and b!1396156 c!129928) b!1396155))

(assert (= (and b!1396156 (not c!129928)) b!1396160))

(assert (= (and b!1396160 c!129927) b!1396158))

(assert (= (and b!1396160 (not c!129927)) b!1396159))

(declare-fun m!1282673 () Bool)

(assert (=> b!1396156 m!1282673))

(declare-fun m!1282675 () Bool)

(assert (=> d!150809 m!1282675))

(declare-fun m!1282677 () Bool)

(assert (=> d!150809 m!1282677))

(assert (=> d!150809 m!1282613))

(declare-fun m!1282679 () Bool)

(assert (=> d!150809 m!1282679))

(assert (=> d!150809 m!1282605))

(assert (=> d!150809 m!1282603))

(assert (=> d!150809 m!1282609))

(assert (=> d!150809 m!1282603))

(assert (=> d!150809 m!1282605))

(assert (=> b!1396159 m!1282603))

(declare-fun m!1282681 () Bool)

(assert (=> b!1396159 m!1282681))

(assert (=> b!1396089 d!150809))

(declare-fun d!150821 () Bool)

(assert (=> d!150821 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119900 d!150821))

(declare-fun d!150825 () Bool)

(assert (=> d!150825 (= (array_inv!35123 a!2901) (bvsge (size!46645 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119900 d!150825))

(declare-fun b!1396218 () Bool)

(declare-fun e!790443 () Bool)

(declare-fun e!790442 () Bool)

(assert (=> b!1396218 (= e!790443 e!790442)))

(declare-fun c!129948 () Bool)

(assert (=> b!1396218 (= c!129948 (validKeyInArray!0 (select (arr!46095 a!2901) j!112)))))

(declare-fun b!1396219 () Bool)

(declare-fun e!790441 () Bool)

(assert (=> b!1396219 (= e!790442 e!790441)))

(declare-fun lt!613297 () (_ BitVec 64))

(assert (=> b!1396219 (= lt!613297 (select (arr!46095 a!2901) j!112))))

(declare-fun lt!613295 () Unit!46828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95480 (_ BitVec 64) (_ BitVec 32)) Unit!46828)

(assert (=> b!1396219 (= lt!613295 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613297 j!112))))

(declare-fun arrayContainsKey!0 (array!95480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396219 (arrayContainsKey!0 a!2901 lt!613297 #b00000000000000000000000000000000)))

(declare-fun lt!613296 () Unit!46828)

(assert (=> b!1396219 (= lt!613296 lt!613295)))

(declare-fun res!935233 () Bool)

(assert (=> b!1396219 (= res!935233 (= (seekEntryOrOpen!0 (select (arr!46095 a!2901) j!112) a!2901 mask!2840) (Found!10412 j!112)))))

(assert (=> b!1396219 (=> (not res!935233) (not e!790441))))

(declare-fun d!150827 () Bool)

(declare-fun res!935234 () Bool)

(assert (=> d!150827 (=> res!935234 e!790443)))

(assert (=> d!150827 (= res!935234 (bvsge j!112 (size!46645 a!2901)))))

(assert (=> d!150827 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790443)))

(declare-fun b!1396220 () Bool)

(declare-fun call!66853 () Bool)

(assert (=> b!1396220 (= e!790442 call!66853)))

(declare-fun b!1396221 () Bool)

(assert (=> b!1396221 (= e!790441 call!66853)))

(declare-fun bm!66850 () Bool)

(assert (=> bm!66850 (= call!66853 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150827 (not res!935234)) b!1396218))

(assert (= (and b!1396218 c!129948) b!1396219))

(assert (= (and b!1396218 (not c!129948)) b!1396220))

(assert (= (and b!1396219 res!935233) b!1396221))

(assert (= (or b!1396221 b!1396220) bm!66850))

(assert (=> b!1396218 m!1282603))

(assert (=> b!1396218 m!1282603))

(assert (=> b!1396218 m!1282629))

(assert (=> b!1396219 m!1282603))

(declare-fun m!1282703 () Bool)

(assert (=> b!1396219 m!1282703))

(declare-fun m!1282705 () Bool)

(assert (=> b!1396219 m!1282705))

(assert (=> b!1396219 m!1282603))

(assert (=> b!1396219 m!1282617))

(declare-fun m!1282707 () Bool)

(assert (=> bm!66850 m!1282707))

(assert (=> b!1396090 d!150827))

(declare-fun d!150835 () Bool)

(assert (=> d!150835 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613302 () Unit!46828)

(declare-fun choose!38 (array!95480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46828)

(assert (=> d!150835 (= lt!613302 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150835 (validMask!0 mask!2840)))

(assert (=> d!150835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613302)))

(declare-fun bs!40631 () Bool)

(assert (= bs!40631 d!150835))

(assert (=> bs!40631 m!1282611))

(declare-fun m!1282717 () Bool)

(assert (=> bs!40631 m!1282717))

(assert (=> bs!40631 m!1282613))

(assert (=> b!1396090 d!150835))

(declare-fun e!790493 () SeekEntryResult!10412)

(declare-fun b!1396291 () Bool)

(assert (=> b!1396291 (= e!790493 (Intermediate!10412 false (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!790494 () SeekEntryResult!10412)

(declare-fun b!1396292 () Bool)

(assert (=> b!1396292 (= e!790494 (Intermediate!10412 true (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396293 () Bool)

(declare-fun lt!613322 () SeekEntryResult!10412)

(assert (=> b!1396293 (and (bvsge (index!44021 lt!613322) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613322) (size!46645 a!2901)))))

(declare-fun res!935271 () Bool)

(assert (=> b!1396293 (= res!935271 (= (select (arr!46095 a!2901) (index!44021 lt!613322)) (select (arr!46095 a!2901) j!112)))))

(declare-fun e!790492 () Bool)

(assert (=> b!1396293 (=> res!935271 e!790492)))

(declare-fun e!790495 () Bool)

(assert (=> b!1396293 (= e!790495 e!790492)))

(declare-fun d!150839 () Bool)

(declare-fun e!790496 () Bool)

(assert (=> d!150839 e!790496))

(declare-fun c!129969 () Bool)

(assert (=> d!150839 (= c!129969 (and ((_ is Intermediate!10412) lt!613322) (undefined!11224 lt!613322)))))

(assert (=> d!150839 (= lt!613322 e!790494)))

(declare-fun c!129967 () Bool)

(assert (=> d!150839 (= c!129967 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613323 () (_ BitVec 64))

(assert (=> d!150839 (= lt!613323 (select (arr!46095 a!2901) (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840)))))

(assert (=> d!150839 (validMask!0 mask!2840)))

(assert (=> d!150839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) (select (arr!46095 a!2901) j!112) a!2901 mask!2840) lt!613322)))

(declare-fun b!1396294 () Bool)

(assert (=> b!1396294 (= e!790496 e!790495)))

(declare-fun res!935270 () Bool)

(assert (=> b!1396294 (= res!935270 (and ((_ is Intermediate!10412) lt!613322) (not (undefined!11224 lt!613322)) (bvslt (x!125684 lt!613322) #b01111111111111111111111111111110) (bvsge (x!125684 lt!613322) #b00000000000000000000000000000000) (bvsge (x!125684 lt!613322) #b00000000000000000000000000000000)))))

(assert (=> b!1396294 (=> (not res!935270) (not e!790495))))

(declare-fun b!1396295 () Bool)

(assert (=> b!1396295 (and (bvsge (index!44021 lt!613322) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613322) (size!46645 a!2901)))))

(assert (=> b!1396295 (= e!790492 (= (select (arr!46095 a!2901) (index!44021 lt!613322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396296 () Bool)

(assert (=> b!1396296 (= e!790494 e!790493)))

(declare-fun c!129968 () Bool)

(assert (=> b!1396296 (= c!129968 (or (= lt!613323 (select (arr!46095 a!2901) j!112)) (= (bvadd lt!613323 lt!613323) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396297 () Bool)

(assert (=> b!1396297 (= e!790496 (bvsge (x!125684 lt!613322) #b01111111111111111111111111111110))))

(declare-fun b!1396298 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396298 (= e!790493 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46095 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396299 () Bool)

(assert (=> b!1396299 (and (bvsge (index!44021 lt!613322) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613322) (size!46645 a!2901)))))

(declare-fun res!935269 () Bool)

(assert (=> b!1396299 (= res!935269 (= (select (arr!46095 a!2901) (index!44021 lt!613322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396299 (=> res!935269 e!790492)))

(assert (= (and d!150839 c!129967) b!1396292))

(assert (= (and d!150839 (not c!129967)) b!1396296))

(assert (= (and b!1396296 c!129968) b!1396291))

(assert (= (and b!1396296 (not c!129968)) b!1396298))

(assert (= (and d!150839 c!129969) b!1396297))

(assert (= (and d!150839 (not c!129969)) b!1396294))

(assert (= (and b!1396294 res!935270) b!1396293))

(assert (= (and b!1396293 (not res!935271)) b!1396299))

(assert (= (and b!1396299 (not res!935269)) b!1396295))

(assert (=> d!150839 m!1282605))

(declare-fun m!1282739 () Bool)

(assert (=> d!150839 m!1282739))

(assert (=> d!150839 m!1282613))

(assert (=> b!1396298 m!1282605))

(declare-fun m!1282741 () Bool)

(assert (=> b!1396298 m!1282741))

(assert (=> b!1396298 m!1282741))

(assert (=> b!1396298 m!1282603))

(declare-fun m!1282743 () Bool)

(assert (=> b!1396298 m!1282743))

(declare-fun m!1282745 () Bool)

(assert (=> b!1396293 m!1282745))

(assert (=> b!1396299 m!1282745))

(assert (=> b!1396295 m!1282745))

(assert (=> b!1396090 d!150839))

(declare-fun d!150853 () Bool)

(declare-fun lt!613341 () (_ BitVec 32))

(declare-fun lt!613340 () (_ BitVec 32))

(assert (=> d!150853 (= lt!613341 (bvmul (bvxor lt!613340 (bvlshr lt!613340 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150853 (= lt!613340 ((_ extract 31 0) (bvand (bvxor (select (arr!46095 a!2901) j!112) (bvlshr (select (arr!46095 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150853 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935274 (let ((h!33853 ((_ extract 31 0) (bvand (bvxor (select (arr!46095 a!2901) j!112) (bvlshr (select (arr!46095 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125691 (bvmul (bvxor h!33853 (bvlshr h!33853 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125691 (bvlshr x!125691 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935274 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935274 #b00000000000000000000000000000000))))))

(assert (=> d!150853 (= (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) (bvand (bvxor lt!613341 (bvlshr lt!613341 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396090 d!150853))

(declare-fun e!790512 () SeekEntryResult!10412)

(declare-fun b!1396325 () Bool)

(assert (=> b!1396325 (= e!790512 (Intermediate!10412 false (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396326 () Bool)

(declare-fun e!790513 () SeekEntryResult!10412)

(assert (=> b!1396326 (= e!790513 (Intermediate!10412 true (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396327 () Bool)

(declare-fun lt!613344 () SeekEntryResult!10412)

(assert (=> b!1396327 (and (bvsge (index!44021 lt!613344) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613344) (size!46645 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)))))))

(declare-fun res!935280 () Bool)

(assert (=> b!1396327 (= res!935280 (= (select (arr!46095 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901))) (index!44021 lt!613344)) (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!790511 () Bool)

(assert (=> b!1396327 (=> res!935280 e!790511)))

(declare-fun e!790514 () Bool)

(assert (=> b!1396327 (= e!790514 e!790511)))

(declare-fun d!150859 () Bool)

(declare-fun e!790515 () Bool)

(assert (=> d!150859 e!790515))

(declare-fun c!129982 () Bool)

(assert (=> d!150859 (= c!129982 (and ((_ is Intermediate!10412) lt!613344) (undefined!11224 lt!613344)))))

(assert (=> d!150859 (= lt!613344 e!790513)))

(declare-fun c!129980 () Bool)

(assert (=> d!150859 (= c!129980 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613345 () (_ BitVec 64))

(assert (=> d!150859 (= lt!613345 (select (arr!46095 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901))) (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150859 (validMask!0 mask!2840)))

(assert (=> d!150859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)) mask!2840) lt!613344)))

(declare-fun b!1396328 () Bool)

(assert (=> b!1396328 (= e!790515 e!790514)))

(declare-fun res!935279 () Bool)

(assert (=> b!1396328 (= res!935279 (and ((_ is Intermediate!10412) lt!613344) (not (undefined!11224 lt!613344)) (bvslt (x!125684 lt!613344) #b01111111111111111111111111111110) (bvsge (x!125684 lt!613344) #b00000000000000000000000000000000) (bvsge (x!125684 lt!613344) #b00000000000000000000000000000000)))))

(assert (=> b!1396328 (=> (not res!935279) (not e!790514))))

(declare-fun b!1396329 () Bool)

(assert (=> b!1396329 (and (bvsge (index!44021 lt!613344) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613344) (size!46645 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)))))))

(assert (=> b!1396329 (= e!790511 (= (select (arr!46095 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901))) (index!44021 lt!613344)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396330 () Bool)

(assert (=> b!1396330 (= e!790513 e!790512)))

(declare-fun c!129981 () Bool)

(assert (=> b!1396330 (= c!129981 (or (= lt!613345 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613345 lt!613345) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396331 () Bool)

(assert (=> b!1396331 (= e!790515 (bvsge (x!125684 lt!613344) #b01111111111111111111111111111110))))

(declare-fun b!1396332 () Bool)

(assert (=> b!1396332 (= e!790512 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)) mask!2840))))

(declare-fun b!1396333 () Bool)

(assert (=> b!1396333 (and (bvsge (index!44021 lt!613344) #b00000000000000000000000000000000) (bvslt (index!44021 lt!613344) (size!46645 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)))))))

(declare-fun res!935278 () Bool)

(assert (=> b!1396333 (= res!935278 (= (select (arr!46095 (array!95481 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901))) (index!44021 lt!613344)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396333 (=> res!935278 e!790511)))

(assert (= (and d!150859 c!129980) b!1396326))

(assert (= (and d!150859 (not c!129980)) b!1396330))

(assert (= (and b!1396330 c!129981) b!1396325))

(assert (= (and b!1396330 (not c!129981)) b!1396332))

(assert (= (and d!150859 c!129982) b!1396331))

(assert (= (and d!150859 (not c!129982)) b!1396328))

(assert (= (and b!1396328 res!935279) b!1396327))

(assert (= (and b!1396327 (not res!935280)) b!1396333))

(assert (= (and b!1396333 (not res!935278)) b!1396329))

(assert (=> d!150859 m!1282625))

(declare-fun m!1282763 () Bool)

(assert (=> d!150859 m!1282763))

(assert (=> d!150859 m!1282613))

(assert (=> b!1396332 m!1282625))

(declare-fun m!1282765 () Bool)

(assert (=> b!1396332 m!1282765))

(assert (=> b!1396332 m!1282765))

(assert (=> b!1396332 m!1282623))

(declare-fun m!1282767 () Bool)

(assert (=> b!1396332 m!1282767))

(declare-fun m!1282769 () Bool)

(assert (=> b!1396327 m!1282769))

(assert (=> b!1396333 m!1282769))

(assert (=> b!1396329 m!1282769))

(assert (=> b!1396095 d!150859))

(declare-fun d!150863 () Bool)

(declare-fun lt!613349 () (_ BitVec 32))

(declare-fun lt!613348 () (_ BitVec 32))

(assert (=> d!150863 (= lt!613349 (bvmul (bvxor lt!613348 (bvlshr lt!613348 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150863 (= lt!613348 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150863 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935274 (let ((h!33853 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125691 (bvmul (bvxor h!33853 (bvlshr h!33853 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125691 (bvlshr x!125691 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935274 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935274 #b00000000000000000000000000000000))))))

(assert (=> d!150863 (= (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613349 (bvlshr lt!613349 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396095 d!150863))

(declare-fun d!150869 () Bool)

(assert (=> d!150869 (= (validKeyInArray!0 (select (arr!46095 a!2901) j!112)) (and (not (= (select (arr!46095 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46095 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396091 d!150869))

(declare-fun d!150871 () Bool)

(assert (=> d!150871 (= (validKeyInArray!0 (select (arr!46095 a!2901) i!1037)) (and (not (= (select (arr!46095 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46095 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396093 d!150871))

(declare-fun b!1396334 () Bool)

(declare-fun e!790518 () Bool)

(declare-fun e!790517 () Bool)

(assert (=> b!1396334 (= e!790518 e!790517)))

(declare-fun c!129984 () Bool)

(assert (=> b!1396334 (= c!129984 (validKeyInArray!0 (select (arr!46095 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396335 () Bool)

(declare-fun e!790516 () Bool)

(assert (=> b!1396335 (= e!790517 e!790516)))

(declare-fun lt!613352 () (_ BitVec 64))

(assert (=> b!1396335 (= lt!613352 (select (arr!46095 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613350 () Unit!46828)

(assert (=> b!1396335 (= lt!613350 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613352 #b00000000000000000000000000000000))))

(assert (=> b!1396335 (arrayContainsKey!0 a!2901 lt!613352 #b00000000000000000000000000000000)))

(declare-fun lt!613351 () Unit!46828)

(assert (=> b!1396335 (= lt!613351 lt!613350)))

(declare-fun res!935281 () Bool)

(assert (=> b!1396335 (= res!935281 (= (seekEntryOrOpen!0 (select (arr!46095 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10412 #b00000000000000000000000000000000)))))

(assert (=> b!1396335 (=> (not res!935281) (not e!790516))))

(declare-fun d!150873 () Bool)

(declare-fun res!935282 () Bool)

(assert (=> d!150873 (=> res!935282 e!790518)))

(assert (=> d!150873 (= res!935282 (bvsge #b00000000000000000000000000000000 (size!46645 a!2901)))))

(assert (=> d!150873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790518)))

(declare-fun b!1396336 () Bool)

(declare-fun call!66864 () Bool)

(assert (=> b!1396336 (= e!790517 call!66864)))

(declare-fun b!1396337 () Bool)

(assert (=> b!1396337 (= e!790516 call!66864)))

(declare-fun bm!66861 () Bool)

(assert (=> bm!66861 (= call!66864 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150873 (not res!935282)) b!1396334))

(assert (= (and b!1396334 c!129984) b!1396335))

(assert (= (and b!1396334 (not c!129984)) b!1396336))

(assert (= (and b!1396335 res!935281) b!1396337))

(assert (= (or b!1396337 b!1396336) bm!66861))

(assert (=> b!1396334 m!1282665))

(assert (=> b!1396334 m!1282665))

(assert (=> b!1396334 m!1282667))

(assert (=> b!1396335 m!1282665))

(declare-fun m!1282771 () Bool)

(assert (=> b!1396335 m!1282771))

(declare-fun m!1282773 () Bool)

(assert (=> b!1396335 m!1282773))

(assert (=> b!1396335 m!1282665))

(declare-fun m!1282775 () Bool)

(assert (=> b!1396335 m!1282775))

(declare-fun m!1282779 () Bool)

(assert (=> bm!66861 m!1282779))

(assert (=> b!1396092 d!150873))

(check-sat (not bm!66844) (not b!1396298) (not b!1396334) (not bm!66850) (not b!1396219) (not b!1396130) (not d!150859) (not b!1396133) (not b!1396332) (not b!1396335) (not d!150839) (not d!150835) (not bm!66861) (not d!150809) (not b!1396218) (not b!1396159) (not b!1396132))
