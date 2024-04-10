; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46418 () Bool)

(assert start!46418)

(declare-fun b!513556 () Bool)

(declare-fun res!313852 () Bool)

(declare-fun e!299880 () Bool)

(assert (=> b!513556 (=> (not res!313852) (not e!299880))))

(declare-datatypes ((array!32958 0))(
  ( (array!32959 (arr!15853 (Array (_ BitVec 32) (_ BitVec 64))) (size!16217 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32958)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513556 (= res!313852 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!313855 () Bool)

(assert (=> start!46418 (=> (not res!313855) (not e!299880))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46418 (= res!313855 (validMask!0 mask!3524))))

(assert (=> start!46418 e!299880))

(assert (=> start!46418 true))

(declare-fun array_inv!11649 (array!32958) Bool)

(assert (=> start!46418 (array_inv!11649 a!3235)))

(declare-fun b!513557 () Bool)

(declare-fun res!313858 () Bool)

(assert (=> b!513557 (=> (not res!313858) (not e!299880))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513557 (= res!313858 (validKeyInArray!0 (select (arr!15853 a!3235) j!176)))))

(declare-fun b!513558 () Bool)

(declare-fun e!299879 () Bool)

(assert (=> b!513558 (= e!299880 e!299879)))

(declare-fun res!313860 () Bool)

(assert (=> b!513558 (=> (not res!313860) (not e!299879))))

(declare-datatypes ((SeekEntryResult!4320 0))(
  ( (MissingZero!4320 (index!19468 (_ BitVec 32))) (Found!4320 (index!19469 (_ BitVec 32))) (Intermediate!4320 (undefined!5132 Bool) (index!19470 (_ BitVec 32)) (x!48419 (_ BitVec 32))) (Undefined!4320) (MissingVacant!4320 (index!19471 (_ BitVec 32))) )
))
(declare-fun lt!235121 () SeekEntryResult!4320)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513558 (= res!313860 (or (= lt!235121 (MissingZero!4320 i!1204)) (= lt!235121 (MissingVacant!4320 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32958 (_ BitVec 32)) SeekEntryResult!4320)

(assert (=> b!513558 (= lt!235121 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513559 () Bool)

(declare-fun res!313862 () Bool)

(assert (=> b!513559 (=> (not res!313862) (not e!299879))))

(declare-datatypes ((List!10011 0))(
  ( (Nil!10008) (Cons!10007 (h!10893 (_ BitVec 64)) (t!16239 List!10011)) )
))
(declare-fun arrayNoDuplicates!0 (array!32958 (_ BitVec 32) List!10011) Bool)

(assert (=> b!513559 (= res!313862 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10008))))

(declare-fun b!513560 () Bool)

(declare-fun res!313856 () Bool)

(assert (=> b!513560 (=> (not res!313856) (not e!299880))))

(assert (=> b!513560 (= res!313856 (validKeyInArray!0 k0!2280))))

(declare-fun b!513561 () Bool)

(declare-fun e!299876 () Bool)

(assert (=> b!513561 (= e!299879 (not e!299876))))

(declare-fun res!313861 () Bool)

(assert (=> b!513561 (=> res!313861 e!299876)))

(declare-fun lt!235119 () (_ BitVec 32))

(declare-fun lt!235120 () SeekEntryResult!4320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32958 (_ BitVec 32)) SeekEntryResult!4320)

(assert (=> b!513561 (= res!313861 (= lt!235120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235119 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524)))))

(declare-fun lt!235122 () (_ BitVec 32))

(assert (=> b!513561 (= lt!235120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235122 (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513561 (= lt!235119 (toIndex!0 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513561 (= lt!235122 (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524))))

(declare-fun e!299878 () Bool)

(assert (=> b!513561 e!299878))

(declare-fun res!313857 () Bool)

(assert (=> b!513561 (=> (not res!313857) (not e!299878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32958 (_ BitVec 32)) Bool)

(assert (=> b!513561 (= res!313857 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15898 0))(
  ( (Unit!15899) )
))
(declare-fun lt!235123 () Unit!15898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15898)

(assert (=> b!513561 (= lt!235123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513562 () Bool)

(declare-fun res!313859 () Bool)

(assert (=> b!513562 (=> (not res!313859) (not e!299879))))

(assert (=> b!513562 (= res!313859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513563 () Bool)

(declare-fun res!313854 () Bool)

(assert (=> b!513563 (=> res!313854 e!299876)))

(get-info :version)

(assert (=> b!513563 (= res!313854 (or (undefined!5132 lt!235120) (not ((_ is Intermediate!4320) lt!235120))))))

(declare-fun b!513564 () Bool)

(assert (=> b!513564 (= e!299876 (or (= (select (arr!15853 a!3235) (index!19470 lt!235120)) (select (arr!15853 a!3235) j!176)) (and (bvsge (index!19470 lt!235120) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235120) (size!16217 a!3235)))))))

(assert (=> b!513564 (bvslt (x!48419 lt!235120) #b01111111111111111111111111111110)))

(declare-fun b!513565 () Bool)

(assert (=> b!513565 (= e!299878 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) (Found!4320 j!176)))))

(declare-fun b!513566 () Bool)

(declare-fun res!313853 () Bool)

(assert (=> b!513566 (=> (not res!313853) (not e!299880))))

(assert (=> b!513566 (= res!313853 (and (= (size!16217 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16217 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16217 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46418 res!313855) b!513566))

(assert (= (and b!513566 res!313853) b!513557))

(assert (= (and b!513557 res!313858) b!513560))

(assert (= (and b!513560 res!313856) b!513556))

(assert (= (and b!513556 res!313852) b!513558))

(assert (= (and b!513558 res!313860) b!513562))

(assert (= (and b!513562 res!313859) b!513559))

(assert (= (and b!513559 res!313862) b!513561))

(assert (= (and b!513561 res!313857) b!513565))

(assert (= (and b!513561 (not res!313861)) b!513563))

(assert (= (and b!513563 (not res!313854)) b!513564))

(declare-fun m!495131 () Bool)

(assert (=> b!513565 m!495131))

(assert (=> b!513565 m!495131))

(declare-fun m!495133 () Bool)

(assert (=> b!513565 m!495133))

(declare-fun m!495135 () Bool)

(assert (=> b!513564 m!495135))

(assert (=> b!513564 m!495131))

(declare-fun m!495137 () Bool)

(assert (=> b!513559 m!495137))

(assert (=> b!513557 m!495131))

(assert (=> b!513557 m!495131))

(declare-fun m!495139 () Bool)

(assert (=> b!513557 m!495139))

(declare-fun m!495141 () Bool)

(assert (=> b!513562 m!495141))

(declare-fun m!495143 () Bool)

(assert (=> b!513558 m!495143))

(declare-fun m!495145 () Bool)

(assert (=> b!513561 m!495145))

(declare-fun m!495147 () Bool)

(assert (=> b!513561 m!495147))

(declare-fun m!495149 () Bool)

(assert (=> b!513561 m!495149))

(declare-fun m!495151 () Bool)

(assert (=> b!513561 m!495151))

(assert (=> b!513561 m!495147))

(assert (=> b!513561 m!495131))

(declare-fun m!495153 () Bool)

(assert (=> b!513561 m!495153))

(assert (=> b!513561 m!495131))

(declare-fun m!495155 () Bool)

(assert (=> b!513561 m!495155))

(assert (=> b!513561 m!495131))

(declare-fun m!495157 () Bool)

(assert (=> b!513561 m!495157))

(assert (=> b!513561 m!495147))

(declare-fun m!495159 () Bool)

(assert (=> b!513561 m!495159))

(declare-fun m!495161 () Bool)

(assert (=> b!513556 m!495161))

(declare-fun m!495163 () Bool)

(assert (=> b!513560 m!495163))

(declare-fun m!495165 () Bool)

(assert (=> start!46418 m!495165))

(declare-fun m!495167 () Bool)

(assert (=> start!46418 m!495167))

(check-sat (not b!513557) (not b!513565) (not b!513558) (not b!513556) (not b!513560) (not b!513559) (not b!513562) (not b!513561) (not start!46418))
(check-sat)
(get-model)

(declare-fun b!513612 () Bool)

(declare-fun e!299904 () SeekEntryResult!4320)

(declare-fun lt!235146 () SeekEntryResult!4320)

(assert (=> b!513612 (= e!299904 (MissingZero!4320 (index!19470 lt!235146)))))

(declare-fun b!513613 () Bool)

(declare-fun e!299903 () SeekEntryResult!4320)

(assert (=> b!513613 (= e!299903 Undefined!4320)))

(declare-fun b!513614 () Bool)

(declare-fun e!299902 () SeekEntryResult!4320)

(assert (=> b!513614 (= e!299903 e!299902)))

(declare-fun lt!235147 () (_ BitVec 64))

(assert (=> b!513614 (= lt!235147 (select (arr!15853 a!3235) (index!19470 lt!235146)))))

(declare-fun c!60141 () Bool)

(assert (=> b!513614 (= c!60141 (= lt!235147 (select (arr!15853 a!3235) j!176)))))

(declare-fun b!513615 () Bool)

(assert (=> b!513615 (= e!299902 (Found!4320 (index!19470 lt!235146)))))

(declare-fun b!513616 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32958 (_ BitVec 32)) SeekEntryResult!4320)

(assert (=> b!513616 (= e!299904 (seekKeyOrZeroReturnVacant!0 (x!48419 lt!235146) (index!19470 lt!235146) (index!19470 lt!235146) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513617 () Bool)

(declare-fun c!60142 () Bool)

(assert (=> b!513617 (= c!60142 (= lt!235147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513617 (= e!299902 e!299904)))

(declare-fun d!79175 () Bool)

(declare-fun lt!235145 () SeekEntryResult!4320)

(assert (=> d!79175 (and (or ((_ is Undefined!4320) lt!235145) (not ((_ is Found!4320) lt!235145)) (and (bvsge (index!19469 lt!235145) #b00000000000000000000000000000000) (bvslt (index!19469 lt!235145) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235145) ((_ is Found!4320) lt!235145) (not ((_ is MissingZero!4320) lt!235145)) (and (bvsge (index!19468 lt!235145) #b00000000000000000000000000000000) (bvslt (index!19468 lt!235145) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235145) ((_ is Found!4320) lt!235145) ((_ is MissingZero!4320) lt!235145) (not ((_ is MissingVacant!4320) lt!235145)) (and (bvsge (index!19471 lt!235145) #b00000000000000000000000000000000) (bvslt (index!19471 lt!235145) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235145) (ite ((_ is Found!4320) lt!235145) (= (select (arr!15853 a!3235) (index!19469 lt!235145)) (select (arr!15853 a!3235) j!176)) (ite ((_ is MissingZero!4320) lt!235145) (= (select (arr!15853 a!3235) (index!19468 lt!235145)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4320) lt!235145) (= (select (arr!15853 a!3235) (index!19471 lt!235145)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79175 (= lt!235145 e!299903)))

(declare-fun c!60143 () Bool)

(assert (=> d!79175 (= c!60143 (and ((_ is Intermediate!4320) lt!235146) (undefined!5132 lt!235146)))))

(assert (=> d!79175 (= lt!235146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79175 (validMask!0 mask!3524)))

(assert (=> d!79175 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) lt!235145)))

(assert (= (and d!79175 c!60143) b!513613))

(assert (= (and d!79175 (not c!60143)) b!513614))

(assert (= (and b!513614 c!60141) b!513615))

(assert (= (and b!513614 (not c!60141)) b!513617))

(assert (= (and b!513617 c!60142) b!513612))

(assert (= (and b!513617 (not c!60142)) b!513616))

(declare-fun m!495207 () Bool)

(assert (=> b!513614 m!495207))

(assert (=> b!513616 m!495131))

(declare-fun m!495209 () Bool)

(assert (=> b!513616 m!495209))

(assert (=> d!79175 m!495131))

(assert (=> d!79175 m!495153))

(assert (=> d!79175 m!495165))

(declare-fun m!495211 () Bool)

(assert (=> d!79175 m!495211))

(assert (=> d!79175 m!495153))

(assert (=> d!79175 m!495131))

(declare-fun m!495213 () Bool)

(assert (=> d!79175 m!495213))

(declare-fun m!495215 () Bool)

(assert (=> d!79175 m!495215))

(declare-fun m!495217 () Bool)

(assert (=> d!79175 m!495217))

(assert (=> b!513565 d!79175))

(declare-fun d!79177 () Bool)

(assert (=> d!79177 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513560 d!79177))

(declare-fun b!513618 () Bool)

(declare-fun e!299907 () SeekEntryResult!4320)

(declare-fun lt!235149 () SeekEntryResult!4320)

(assert (=> b!513618 (= e!299907 (MissingZero!4320 (index!19470 lt!235149)))))

(declare-fun b!513619 () Bool)

(declare-fun e!299906 () SeekEntryResult!4320)

(assert (=> b!513619 (= e!299906 Undefined!4320)))

(declare-fun b!513620 () Bool)

(declare-fun e!299905 () SeekEntryResult!4320)

(assert (=> b!513620 (= e!299906 e!299905)))

(declare-fun lt!235150 () (_ BitVec 64))

(assert (=> b!513620 (= lt!235150 (select (arr!15853 a!3235) (index!19470 lt!235149)))))

(declare-fun c!60144 () Bool)

(assert (=> b!513620 (= c!60144 (= lt!235150 k0!2280))))

(declare-fun b!513621 () Bool)

(assert (=> b!513621 (= e!299905 (Found!4320 (index!19470 lt!235149)))))

(declare-fun b!513622 () Bool)

(assert (=> b!513622 (= e!299907 (seekKeyOrZeroReturnVacant!0 (x!48419 lt!235149) (index!19470 lt!235149) (index!19470 lt!235149) k0!2280 a!3235 mask!3524))))

(declare-fun b!513623 () Bool)

(declare-fun c!60145 () Bool)

(assert (=> b!513623 (= c!60145 (= lt!235150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513623 (= e!299905 e!299907)))

(declare-fun d!79179 () Bool)

(declare-fun lt!235148 () SeekEntryResult!4320)

(assert (=> d!79179 (and (or ((_ is Undefined!4320) lt!235148) (not ((_ is Found!4320) lt!235148)) (and (bvsge (index!19469 lt!235148) #b00000000000000000000000000000000) (bvslt (index!19469 lt!235148) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235148) ((_ is Found!4320) lt!235148) (not ((_ is MissingZero!4320) lt!235148)) (and (bvsge (index!19468 lt!235148) #b00000000000000000000000000000000) (bvslt (index!19468 lt!235148) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235148) ((_ is Found!4320) lt!235148) ((_ is MissingZero!4320) lt!235148) (not ((_ is MissingVacant!4320) lt!235148)) (and (bvsge (index!19471 lt!235148) #b00000000000000000000000000000000) (bvslt (index!19471 lt!235148) (size!16217 a!3235)))) (or ((_ is Undefined!4320) lt!235148) (ite ((_ is Found!4320) lt!235148) (= (select (arr!15853 a!3235) (index!19469 lt!235148)) k0!2280) (ite ((_ is MissingZero!4320) lt!235148) (= (select (arr!15853 a!3235) (index!19468 lt!235148)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4320) lt!235148) (= (select (arr!15853 a!3235) (index!19471 lt!235148)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79179 (= lt!235148 e!299906)))

(declare-fun c!60146 () Bool)

(assert (=> d!79179 (= c!60146 (and ((_ is Intermediate!4320) lt!235149) (undefined!5132 lt!235149)))))

(assert (=> d!79179 (= lt!235149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79179 (validMask!0 mask!3524)))

(assert (=> d!79179 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235148)))

(assert (= (and d!79179 c!60146) b!513619))

(assert (= (and d!79179 (not c!60146)) b!513620))

(assert (= (and b!513620 c!60144) b!513621))

(assert (= (and b!513620 (not c!60144)) b!513623))

(assert (= (and b!513623 c!60145) b!513618))

(assert (= (and b!513623 (not c!60145)) b!513622))

(declare-fun m!495219 () Bool)

(assert (=> b!513620 m!495219))

(declare-fun m!495221 () Bool)

(assert (=> b!513622 m!495221))

(declare-fun m!495223 () Bool)

(assert (=> d!79179 m!495223))

(assert (=> d!79179 m!495165))

(declare-fun m!495225 () Bool)

(assert (=> d!79179 m!495225))

(assert (=> d!79179 m!495223))

(declare-fun m!495227 () Bool)

(assert (=> d!79179 m!495227))

(declare-fun m!495229 () Bool)

(assert (=> d!79179 m!495229))

(declare-fun m!495231 () Bool)

(assert (=> d!79179 m!495231))

(assert (=> b!513558 d!79179))

(declare-fun b!513634 () Bool)

(declare-fun e!299919 () Bool)

(declare-fun e!299917 () Bool)

(assert (=> b!513634 (= e!299919 e!299917)))

(declare-fun c!60149 () Bool)

(assert (=> b!513634 (= c!60149 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513635 () Bool)

(declare-fun e!299918 () Bool)

(declare-fun contains!2731 (List!10011 (_ BitVec 64)) Bool)

(assert (=> b!513635 (= e!299918 (contains!2731 Nil!10008 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31556 () Bool)

(declare-fun call!31559 () Bool)

(assert (=> bm!31556 (= call!31559 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60149 (Cons!10007 (select (arr!15853 a!3235) #b00000000000000000000000000000000) Nil!10008) Nil!10008)))))

(declare-fun d!79181 () Bool)

(declare-fun res!313902 () Bool)

(declare-fun e!299916 () Bool)

(assert (=> d!79181 (=> res!313902 e!299916)))

(assert (=> d!79181 (= res!313902 (bvsge #b00000000000000000000000000000000 (size!16217 a!3235)))))

(assert (=> d!79181 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10008) e!299916)))

(declare-fun b!513636 () Bool)

(assert (=> b!513636 (= e!299917 call!31559)))

(declare-fun b!513637 () Bool)

(assert (=> b!513637 (= e!299917 call!31559)))

(declare-fun b!513638 () Bool)

(assert (=> b!513638 (= e!299916 e!299919)))

(declare-fun res!313903 () Bool)

(assert (=> b!513638 (=> (not res!313903) (not e!299919))))

(assert (=> b!513638 (= res!313903 (not e!299918))))

(declare-fun res!313904 () Bool)

(assert (=> b!513638 (=> (not res!313904) (not e!299918))))

(assert (=> b!513638 (= res!313904 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79181 (not res!313902)) b!513638))

(assert (= (and b!513638 res!313904) b!513635))

(assert (= (and b!513638 res!313903) b!513634))

(assert (= (and b!513634 c!60149) b!513637))

(assert (= (and b!513634 (not c!60149)) b!513636))

(assert (= (or b!513637 b!513636) bm!31556))

(declare-fun m!495233 () Bool)

(assert (=> b!513634 m!495233))

(assert (=> b!513634 m!495233))

(declare-fun m!495235 () Bool)

(assert (=> b!513634 m!495235))

(assert (=> b!513635 m!495233))

(assert (=> b!513635 m!495233))

(declare-fun m!495237 () Bool)

(assert (=> b!513635 m!495237))

(assert (=> bm!31556 m!495233))

(declare-fun m!495239 () Bool)

(assert (=> bm!31556 m!495239))

(assert (=> b!513638 m!495233))

(assert (=> b!513638 m!495233))

(assert (=> b!513638 m!495235))

(assert (=> b!513559 d!79181))

(declare-fun b!513662 () Bool)

(declare-fun e!299939 () Bool)

(declare-fun e!299938 () Bool)

(assert (=> b!513662 (= e!299939 e!299938)))

(declare-fun c!60155 () Bool)

(assert (=> b!513662 (= c!60155 (validKeyInArray!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513663 () Bool)

(declare-fun e!299940 () Bool)

(declare-fun call!31565 () Bool)

(assert (=> b!513663 (= e!299940 call!31565)))

(declare-fun bm!31562 () Bool)

(assert (=> bm!31562 (= call!31565 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79183 () Bool)

(declare-fun res!313918 () Bool)

(assert (=> d!79183 (=> res!313918 e!299939)))

(assert (=> d!79183 (= res!313918 (bvsge #b00000000000000000000000000000000 (size!16217 a!3235)))))

(assert (=> d!79183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299939)))

(declare-fun b!513664 () Bool)

(assert (=> b!513664 (= e!299938 e!299940)))

(declare-fun lt!235159 () (_ BitVec 64))

(assert (=> b!513664 (= lt!235159 (select (arr!15853 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235158 () Unit!15898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32958 (_ BitVec 64) (_ BitVec 32)) Unit!15898)

(assert (=> b!513664 (= lt!235158 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235159 #b00000000000000000000000000000000))))

(assert (=> b!513664 (arrayContainsKey!0 a!3235 lt!235159 #b00000000000000000000000000000000)))

(declare-fun lt!235157 () Unit!15898)

(assert (=> b!513664 (= lt!235157 lt!235158)))

(declare-fun res!313919 () Bool)

(assert (=> b!513664 (= res!313919 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4320 #b00000000000000000000000000000000)))))

(assert (=> b!513664 (=> (not res!313919) (not e!299940))))

(declare-fun b!513665 () Bool)

(assert (=> b!513665 (= e!299938 call!31565)))

(assert (= (and d!79183 (not res!313918)) b!513662))

(assert (= (and b!513662 c!60155) b!513664))

(assert (= (and b!513662 (not c!60155)) b!513665))

(assert (= (and b!513664 res!313919) b!513663))

(assert (= (or b!513663 b!513665) bm!31562))

(assert (=> b!513662 m!495233))

(assert (=> b!513662 m!495233))

(assert (=> b!513662 m!495235))

(declare-fun m!495245 () Bool)

(assert (=> bm!31562 m!495245))

(assert (=> b!513664 m!495233))

(declare-fun m!495249 () Bool)

(assert (=> b!513664 m!495249))

(declare-fun m!495251 () Bool)

(assert (=> b!513664 m!495251))

(assert (=> b!513664 m!495233))

(declare-fun m!495255 () Bool)

(assert (=> b!513664 m!495255))

(assert (=> b!513562 d!79183))

(declare-fun d!79191 () Bool)

(assert (=> d!79191 (= (validKeyInArray!0 (select (arr!15853 a!3235) j!176)) (and (not (= (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15853 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513557 d!79191))

(declare-fun d!79195 () Bool)

(assert (=> d!79195 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46418 d!79195))

(declare-fun d!79199 () Bool)

(assert (=> d!79199 (= (array_inv!11649 a!3235) (bvsge (size!16217 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46418 d!79199))

(declare-fun d!79201 () Bool)

(declare-fun lt!235178 () (_ BitVec 32))

(declare-fun lt!235177 () (_ BitVec 32))

(assert (=> d!79201 (= lt!235178 (bvmul (bvxor lt!235177 (bvlshr lt!235177 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79201 (= lt!235177 ((_ extract 31 0) (bvand (bvxor (select (arr!15853 a!3235) j!176) (bvlshr (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79201 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313926 (let ((h!10895 ((_ extract 31 0) (bvand (bvxor (select (arr!15853 a!3235) j!176) (bvlshr (select (arr!15853 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48421 (bvmul (bvxor h!10895 (bvlshr h!10895 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48421 (bvlshr x!48421 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313926 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313926 #b00000000000000000000000000000000))))))

(assert (=> d!79201 (= (toIndex!0 (select (arr!15853 a!3235) j!176) mask!3524) (bvand (bvxor lt!235178 (bvlshr lt!235178 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513561 d!79201))

(declare-fun lt!235209 () SeekEntryResult!4320)

(declare-fun b!513762 () Bool)

(assert (=> b!513762 (and (bvsge (index!19470 lt!235209) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235209) (size!16217 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(declare-fun res!313961 () Bool)

(assert (=> b!513762 (= res!313961 (= (select (arr!15853 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19470 lt!235209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300002 () Bool)

(assert (=> b!513762 (=> res!313961 e!300002)))

(declare-fun b!513763 () Bool)

(declare-fun e!299999 () SeekEntryResult!4320)

(declare-fun e!300003 () SeekEntryResult!4320)

(assert (=> b!513763 (= e!299999 e!300003)))

(declare-fun lt!235210 () (_ BitVec 64))

(declare-fun c!60188 () Bool)

(assert (=> b!513763 (= c!60188 (or (= lt!235210 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235210 lt!235210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513764 () Bool)

(assert (=> b!513764 (and (bvsge (index!19470 lt!235209) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235209) (size!16217 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(assert (=> b!513764 (= e!300002 (= (select (arr!15853 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19470 lt!235209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513765 () Bool)

(declare-fun e!300001 () Bool)

(declare-fun e!300000 () Bool)

(assert (=> b!513765 (= e!300001 e!300000)))

(declare-fun res!313960 () Bool)

(assert (=> b!513765 (= res!313960 (and ((_ is Intermediate!4320) lt!235209) (not (undefined!5132 lt!235209)) (bvslt (x!48419 lt!235209) #b01111111111111111111111111111110) (bvsge (x!48419 lt!235209) #b00000000000000000000000000000000) (bvsge (x!48419 lt!235209) #b00000000000000000000000000000000)))))

(assert (=> b!513765 (=> (not res!313960) (not e!300000))))

(declare-fun b!513766 () Bool)

(assert (=> b!513766 (= e!300001 (bvsge (x!48419 lt!235209) #b01111111111111111111111111111110))))

(declare-fun d!79203 () Bool)

(assert (=> d!79203 e!300001))

(declare-fun c!60186 () Bool)

(assert (=> d!79203 (= c!60186 (and ((_ is Intermediate!4320) lt!235209) (undefined!5132 lt!235209)))))

(assert (=> d!79203 (= lt!235209 e!299999)))

(declare-fun c!60187 () Bool)

(assert (=> d!79203 (= c!60187 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79203 (= lt!235210 (select (arr!15853 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) lt!235119))))

(assert (=> d!79203 (validMask!0 mask!3524)))

(assert (=> d!79203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235119 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524) lt!235209)))

(declare-fun b!513767 () Bool)

(assert (=> b!513767 (= e!300003 (Intermediate!4320 false lt!235119 #b00000000000000000000000000000000))))

(declare-fun b!513768 () Bool)

(assert (=> b!513768 (and (bvsge (index!19470 lt!235209) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235209) (size!16217 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)))))))

(declare-fun res!313959 () Bool)

(assert (=> b!513768 (= res!313959 (= (select (arr!15853 (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235))) (index!19470 lt!235209)) (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!513768 (=> res!313959 e!300002)))

(assert (=> b!513768 (= e!300000 e!300002)))

(declare-fun b!513769 () Bool)

(assert (=> b!513769 (= e!299999 (Intermediate!4320 true lt!235119 #b00000000000000000000000000000000))))

(declare-fun b!513770 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513770 (= e!300003 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235119 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (array!32959 (store (arr!15853 a!3235) i!1204 k0!2280) (size!16217 a!3235)) mask!3524))))

(assert (= (and d!79203 c!60187) b!513769))

(assert (= (and d!79203 (not c!60187)) b!513763))

(assert (= (and b!513763 c!60188) b!513767))

(assert (= (and b!513763 (not c!60188)) b!513770))

(assert (= (and d!79203 c!60186) b!513766))

(assert (= (and d!79203 (not c!60186)) b!513765))

(assert (= (and b!513765 res!313960) b!513768))

(assert (= (and b!513768 (not res!313959)) b!513762))

(assert (= (and b!513762 (not res!313961)) b!513764))

(declare-fun m!495287 () Bool)

(assert (=> b!513770 m!495287))

(assert (=> b!513770 m!495287))

(assert (=> b!513770 m!495147))

(declare-fun m!495289 () Bool)

(assert (=> b!513770 m!495289))

(declare-fun m!495291 () Bool)

(assert (=> b!513768 m!495291))

(assert (=> b!513764 m!495291))

(assert (=> b!513762 m!495291))

(declare-fun m!495293 () Bool)

(assert (=> d!79203 m!495293))

(assert (=> d!79203 m!495165))

(assert (=> b!513561 d!79203))

(declare-fun b!513771 () Bool)

(declare-fun e!300005 () Bool)

(declare-fun e!300004 () Bool)

(assert (=> b!513771 (= e!300005 e!300004)))

(declare-fun c!60189 () Bool)

(assert (=> b!513771 (= c!60189 (validKeyInArray!0 (select (arr!15853 a!3235) j!176)))))

(declare-fun b!513772 () Bool)

(declare-fun e!300006 () Bool)

(declare-fun call!31572 () Bool)

(assert (=> b!513772 (= e!300006 call!31572)))

(declare-fun bm!31569 () Bool)

(assert (=> bm!31569 (= call!31572 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79215 () Bool)

(declare-fun res!313962 () Bool)

(assert (=> d!79215 (=> res!313962 e!300005)))

(assert (=> d!79215 (= res!313962 (bvsge j!176 (size!16217 a!3235)))))

(assert (=> d!79215 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300005)))

(declare-fun b!513773 () Bool)

(assert (=> b!513773 (= e!300004 e!300006)))

(declare-fun lt!235215 () (_ BitVec 64))

(assert (=> b!513773 (= lt!235215 (select (arr!15853 a!3235) j!176))))

(declare-fun lt!235214 () Unit!15898)

(assert (=> b!513773 (= lt!235214 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235215 j!176))))

(assert (=> b!513773 (arrayContainsKey!0 a!3235 lt!235215 #b00000000000000000000000000000000)))

(declare-fun lt!235213 () Unit!15898)

(assert (=> b!513773 (= lt!235213 lt!235214)))

(declare-fun res!313963 () Bool)

(assert (=> b!513773 (= res!313963 (= (seekEntryOrOpen!0 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) (Found!4320 j!176)))))

(assert (=> b!513773 (=> (not res!313963) (not e!300006))))

(declare-fun b!513774 () Bool)

(assert (=> b!513774 (= e!300004 call!31572)))

(assert (= (and d!79215 (not res!313962)) b!513771))

(assert (= (and b!513771 c!60189) b!513773))

(assert (= (and b!513771 (not c!60189)) b!513774))

(assert (= (and b!513773 res!313963) b!513772))

(assert (= (or b!513772 b!513774) bm!31569))

(assert (=> b!513771 m!495131))

(assert (=> b!513771 m!495131))

(assert (=> b!513771 m!495139))

(declare-fun m!495297 () Bool)

(assert (=> bm!31569 m!495297))

(assert (=> b!513773 m!495131))

(declare-fun m!495299 () Bool)

(assert (=> b!513773 m!495299))

(declare-fun m!495301 () Bool)

(assert (=> b!513773 m!495301))

(assert (=> b!513773 m!495131))

(assert (=> b!513773 m!495133))

(assert (=> b!513561 d!79215))

(declare-fun b!513775 () Bool)

(declare-fun lt!235219 () SeekEntryResult!4320)

(assert (=> b!513775 (and (bvsge (index!19470 lt!235219) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235219) (size!16217 a!3235)))))

(declare-fun res!313966 () Bool)

(assert (=> b!513775 (= res!313966 (= (select (arr!15853 a!3235) (index!19470 lt!235219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300010 () Bool)

(assert (=> b!513775 (=> res!313966 e!300010)))

(declare-fun b!513776 () Bool)

(declare-fun e!300007 () SeekEntryResult!4320)

(declare-fun e!300011 () SeekEntryResult!4320)

(assert (=> b!513776 (= e!300007 e!300011)))

(declare-fun c!60192 () Bool)

(declare-fun lt!235220 () (_ BitVec 64))

(assert (=> b!513776 (= c!60192 (or (= lt!235220 (select (arr!15853 a!3235) j!176)) (= (bvadd lt!235220 lt!235220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513777 () Bool)

(assert (=> b!513777 (and (bvsge (index!19470 lt!235219) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235219) (size!16217 a!3235)))))

(assert (=> b!513777 (= e!300010 (= (select (arr!15853 a!3235) (index!19470 lt!235219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513778 () Bool)

(declare-fun e!300009 () Bool)

(declare-fun e!300008 () Bool)

(assert (=> b!513778 (= e!300009 e!300008)))

(declare-fun res!313965 () Bool)

(assert (=> b!513778 (= res!313965 (and ((_ is Intermediate!4320) lt!235219) (not (undefined!5132 lt!235219)) (bvslt (x!48419 lt!235219) #b01111111111111111111111111111110) (bvsge (x!48419 lt!235219) #b00000000000000000000000000000000) (bvsge (x!48419 lt!235219) #b00000000000000000000000000000000)))))

(assert (=> b!513778 (=> (not res!313965) (not e!300008))))

(declare-fun b!513779 () Bool)

(assert (=> b!513779 (= e!300009 (bvsge (x!48419 lt!235219) #b01111111111111111111111111111110))))

(declare-fun d!79219 () Bool)

(assert (=> d!79219 e!300009))

(declare-fun c!60190 () Bool)

(assert (=> d!79219 (= c!60190 (and ((_ is Intermediate!4320) lt!235219) (undefined!5132 lt!235219)))))

(assert (=> d!79219 (= lt!235219 e!300007)))

(declare-fun c!60191 () Bool)

(assert (=> d!79219 (= c!60191 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79219 (= lt!235220 (select (arr!15853 a!3235) lt!235122))))

(assert (=> d!79219 (validMask!0 mask!3524)))

(assert (=> d!79219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235122 (select (arr!15853 a!3235) j!176) a!3235 mask!3524) lt!235219)))

(declare-fun b!513780 () Bool)

(assert (=> b!513780 (= e!300011 (Intermediate!4320 false lt!235122 #b00000000000000000000000000000000))))

(declare-fun b!513781 () Bool)

(assert (=> b!513781 (and (bvsge (index!19470 lt!235219) #b00000000000000000000000000000000) (bvslt (index!19470 lt!235219) (size!16217 a!3235)))))

(declare-fun res!313964 () Bool)

(assert (=> b!513781 (= res!313964 (= (select (arr!15853 a!3235) (index!19470 lt!235219)) (select (arr!15853 a!3235) j!176)))))

(assert (=> b!513781 (=> res!313964 e!300010)))

(assert (=> b!513781 (= e!300008 e!300010)))

(declare-fun b!513782 () Bool)

(assert (=> b!513782 (= e!300007 (Intermediate!4320 true lt!235122 #b00000000000000000000000000000000))))

(declare-fun b!513783 () Bool)

(assert (=> b!513783 (= e!300011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235122 #b00000000000000000000000000000000 mask!3524) (select (arr!15853 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79219 c!60191) b!513782))

(assert (= (and d!79219 (not c!60191)) b!513776))

(assert (= (and b!513776 c!60192) b!513780))

(assert (= (and b!513776 (not c!60192)) b!513783))

(assert (= (and d!79219 c!60190) b!513779))

(assert (= (and d!79219 (not c!60190)) b!513778))

(assert (= (and b!513778 res!313965) b!513781))

(assert (= (and b!513781 (not res!313964)) b!513775))

(assert (= (and b!513775 (not res!313966)) b!513777))

(declare-fun m!495303 () Bool)

(assert (=> b!513783 m!495303))

(assert (=> b!513783 m!495303))

(assert (=> b!513783 m!495131))

(declare-fun m!495305 () Bool)

(assert (=> b!513783 m!495305))

(declare-fun m!495307 () Bool)

(assert (=> b!513781 m!495307))

(assert (=> b!513777 m!495307))

(assert (=> b!513775 m!495307))

(declare-fun m!495311 () Bool)

(assert (=> d!79219 m!495311))

(assert (=> d!79219 m!495165))

(assert (=> b!513561 d!79219))

(declare-fun d!79223 () Bool)

(assert (=> d!79223 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235238 () Unit!15898)

(declare-fun choose!38 (array!32958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15898)

(assert (=> d!79223 (= lt!235238 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79223 (validMask!0 mask!3524)))

(assert (=> d!79223 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235238)))

(declare-fun bs!16257 () Bool)

(assert (= bs!16257 d!79223))

(assert (=> bs!16257 m!495157))

(declare-fun m!495339 () Bool)

(assert (=> bs!16257 m!495339))

(assert (=> bs!16257 m!495165))

(assert (=> b!513561 d!79223))

(declare-fun d!79237 () Bool)

(declare-fun lt!235240 () (_ BitVec 32))

(declare-fun lt!235239 () (_ BitVec 32))

(assert (=> d!79237 (= lt!235240 (bvmul (bvxor lt!235239 (bvlshr lt!235239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79237 (= lt!235239 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79237 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313926 (let ((h!10895 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48421 (bvmul (bvxor h!10895 (bvlshr h!10895 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48421 (bvlshr x!48421 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313926 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313926 #b00000000000000000000000000000000))))))

(assert (=> d!79237 (= (toIndex!0 (select (store (arr!15853 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235240 (bvlshr lt!235240 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513561 d!79237))

(declare-fun d!79239 () Bool)

(declare-fun res!313979 () Bool)

(declare-fun e!300029 () Bool)

(assert (=> d!79239 (=> res!313979 e!300029)))

(assert (=> d!79239 (= res!313979 (= (select (arr!15853 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79239 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300029)))

(declare-fun b!513810 () Bool)

(declare-fun e!300030 () Bool)

(assert (=> b!513810 (= e!300029 e!300030)))

(declare-fun res!313980 () Bool)

(assert (=> b!513810 (=> (not res!313980) (not e!300030))))

(assert (=> b!513810 (= res!313980 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16217 a!3235)))))

(declare-fun b!513811 () Bool)

(assert (=> b!513811 (= e!300030 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79239 (not res!313979)) b!513810))

(assert (= (and b!513810 res!313980) b!513811))

(assert (=> d!79239 m!495233))

(declare-fun m!495341 () Bool)

(assert (=> b!513811 m!495341))

(assert (=> b!513556 d!79239))

(check-sat (not d!79175) (not d!79203) (not b!513638) (not b!513773) (not b!513771) (not b!513783) (not b!513634) (not bm!31569) (not b!513811) (not d!79179) (not bm!31562) (not b!513616) (not b!513664) (not b!513770) (not bm!31556) (not b!513622) (not d!79219) (not b!513662) (not d!79223) (not b!513635))
(check-sat)
