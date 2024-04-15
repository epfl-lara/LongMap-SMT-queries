; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48024 () Bool)

(assert start!48024)

(declare-fun b!528988 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33527 0))(
  ( (array!33528 (arr!16112 (Array (_ BitVec 32) (_ BitVec 64))) (size!16477 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33527)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!308222 () Bool)

(declare-datatypes ((SeekEntryResult!4576 0))(
  ( (MissingZero!4576 (index!20528 (_ BitVec 32))) (Found!4576 (index!20529 (_ BitVec 32))) (Intermediate!4576 (undefined!5388 Bool) (index!20530 (_ BitVec 32)) (x!49507 (_ BitVec 32))) (Undefined!4576) (MissingVacant!4576 (index!20531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!528988 (= e!308222 (= (seekEntryOrOpen!0 (select (arr!16112 a!3235) j!176) a!3235 mask!3524) (Found!4576 j!176)))))

(declare-fun b!528989 () Bool)

(declare-fun res!325019 () Bool)

(declare-fun e!308220 () Bool)

(assert (=> b!528989 (=> (not res!325019) (not e!308220))))

(declare-datatypes ((List!10309 0))(
  ( (Nil!10306) (Cons!10305 (h!11242 (_ BitVec 64)) (t!16528 List!10309)) )
))
(declare-fun arrayNoDuplicates!0 (array!33527 (_ BitVec 32) List!10309) Bool)

(assert (=> b!528989 (= res!325019 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10306))))

(declare-fun b!528990 () Bool)

(declare-fun e!308219 () Bool)

(assert (=> b!528990 (= e!308220 (not e!308219))))

(declare-fun res!325023 () Bool)

(assert (=> b!528990 (=> res!325023 e!308219)))

(declare-fun lt!243762 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243759 () SeekEntryResult!4576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!528990 (= res!325023 (= lt!243759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243762 (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)) mask!3524)))))

(declare-fun lt!243760 () (_ BitVec 32))

(assert (=> b!528990 (= lt!243759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243760 (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528990 (= lt!243762 (toIndex!0 (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!528990 (= lt!243760 (toIndex!0 (select (arr!16112 a!3235) j!176) mask!3524))))

(assert (=> b!528990 e!308222))

(declare-fun res!325021 () Bool)

(assert (=> b!528990 (=> (not res!325021) (not e!308222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33527 (_ BitVec 32)) Bool)

(assert (=> b!528990 (= res!325021 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16750 0))(
  ( (Unit!16751) )
))
(declare-fun lt!243761 () Unit!16750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16750)

(assert (=> b!528990 (= lt!243761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!325025 () Bool)

(declare-fun e!308221 () Bool)

(assert (=> start!48024 (=> (not res!325025) (not e!308221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48024 (= res!325025 (validMask!0 mask!3524))))

(assert (=> start!48024 e!308221))

(assert (=> start!48024 true))

(declare-fun array_inv!11995 (array!33527) Bool)

(assert (=> start!48024 (array_inv!11995 a!3235)))

(declare-fun b!528991 () Bool)

(assert (=> b!528991 (= e!308221 e!308220)))

(declare-fun res!325020 () Bool)

(assert (=> b!528991 (=> (not res!325020) (not e!308220))))

(declare-fun lt!243763 () SeekEntryResult!4576)

(assert (=> b!528991 (= res!325020 (or (= lt!243763 (MissingZero!4576 i!1204)) (= lt!243763 (MissingVacant!4576 i!1204))))))

(assert (=> b!528991 (= lt!243763 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528992 () Bool)

(declare-fun res!325022 () Bool)

(assert (=> b!528992 (=> (not res!325022) (not e!308221))))

(declare-fun arrayContainsKey!0 (array!33527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528992 (= res!325022 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528993 () Bool)

(declare-fun res!325024 () Bool)

(assert (=> b!528993 (=> (not res!325024) (not e!308220))))

(assert (=> b!528993 (= res!325024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528994 () Bool)

(declare-fun res!325027 () Bool)

(assert (=> b!528994 (=> (not res!325027) (not e!308221))))

(assert (=> b!528994 (= res!325027 (and (= (size!16477 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16477 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16477 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528995 () Bool)

(declare-fun res!325026 () Bool)

(assert (=> b!528995 (=> (not res!325026) (not e!308221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528995 (= res!325026 (validKeyInArray!0 (select (arr!16112 a!3235) j!176)))))

(declare-fun b!528996 () Bool)

(declare-fun lt!243758 () Bool)

(assert (=> b!528996 (= e!308219 (or (and (not lt!243758) (undefined!5388 lt!243759)) (and (not lt!243758) (not (undefined!5388 lt!243759)))))))

(get-info :version)

(assert (=> b!528996 (= lt!243758 (not ((_ is Intermediate!4576) lt!243759)))))

(declare-fun b!528997 () Bool)

(declare-fun res!325028 () Bool)

(assert (=> b!528997 (=> (not res!325028) (not e!308221))))

(assert (=> b!528997 (= res!325028 (validKeyInArray!0 k0!2280))))

(assert (= (and start!48024 res!325025) b!528994))

(assert (= (and b!528994 res!325027) b!528995))

(assert (= (and b!528995 res!325026) b!528997))

(assert (= (and b!528997 res!325028) b!528992))

(assert (= (and b!528992 res!325022) b!528991))

(assert (= (and b!528991 res!325020) b!528993))

(assert (= (and b!528993 res!325024) b!528989))

(assert (= (and b!528989 res!325019) b!528990))

(assert (= (and b!528990 res!325021) b!528988))

(assert (= (and b!528990 (not res!325023)) b!528996))

(declare-fun m!509053 () Bool)

(assert (=> b!528993 m!509053))

(declare-fun m!509055 () Bool)

(assert (=> b!528988 m!509055))

(assert (=> b!528988 m!509055))

(declare-fun m!509057 () Bool)

(assert (=> b!528988 m!509057))

(declare-fun m!509059 () Bool)

(assert (=> b!528990 m!509059))

(declare-fun m!509061 () Bool)

(assert (=> b!528990 m!509061))

(assert (=> b!528990 m!509055))

(declare-fun m!509063 () Bool)

(assert (=> b!528990 m!509063))

(assert (=> b!528990 m!509055))

(declare-fun m!509065 () Bool)

(assert (=> b!528990 m!509065))

(assert (=> b!528990 m!509061))

(declare-fun m!509067 () Bool)

(assert (=> b!528990 m!509067))

(assert (=> b!528990 m!509061))

(declare-fun m!509069 () Bool)

(assert (=> b!528990 m!509069))

(assert (=> b!528990 m!509055))

(declare-fun m!509071 () Bool)

(assert (=> b!528990 m!509071))

(declare-fun m!509073 () Bool)

(assert (=> b!528990 m!509073))

(declare-fun m!509075 () Bool)

(assert (=> start!48024 m!509075))

(declare-fun m!509077 () Bool)

(assert (=> start!48024 m!509077))

(declare-fun m!509079 () Bool)

(assert (=> b!528997 m!509079))

(assert (=> b!528995 m!509055))

(assert (=> b!528995 m!509055))

(declare-fun m!509081 () Bool)

(assert (=> b!528995 m!509081))

(declare-fun m!509083 () Bool)

(assert (=> b!528991 m!509083))

(declare-fun m!509085 () Bool)

(assert (=> b!528992 m!509085))

(declare-fun m!509087 () Bool)

(assert (=> b!528989 m!509087))

(check-sat (not b!528995) (not b!528992) (not b!528988) (not b!528990) (not b!528997) (not start!48024) (not b!528989) (not b!528991) (not b!528993))
(check-sat)
(get-model)

(declare-fun d!80813 () Bool)

(declare-fun lt!243808 () SeekEntryResult!4576)

(assert (=> d!80813 (and (or ((_ is Undefined!4576) lt!243808) (not ((_ is Found!4576) lt!243808)) (and (bvsge (index!20529 lt!243808) #b00000000000000000000000000000000) (bvslt (index!20529 lt!243808) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243808) ((_ is Found!4576) lt!243808) (not ((_ is MissingZero!4576) lt!243808)) (and (bvsge (index!20528 lt!243808) #b00000000000000000000000000000000) (bvslt (index!20528 lt!243808) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243808) ((_ is Found!4576) lt!243808) ((_ is MissingZero!4576) lt!243808) (not ((_ is MissingVacant!4576) lt!243808)) (and (bvsge (index!20531 lt!243808) #b00000000000000000000000000000000) (bvslt (index!20531 lt!243808) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243808) (ite ((_ is Found!4576) lt!243808) (= (select (arr!16112 a!3235) (index!20529 lt!243808)) (select (arr!16112 a!3235) j!176)) (ite ((_ is MissingZero!4576) lt!243808) (= (select (arr!16112 a!3235) (index!20528 lt!243808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4576) lt!243808) (= (select (arr!16112 a!3235) (index!20531 lt!243808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!308261 () SeekEntryResult!4576)

(assert (=> d!80813 (= lt!243808 e!308261)))

(declare-fun c!62301 () Bool)

(declare-fun lt!243807 () SeekEntryResult!4576)

(assert (=> d!80813 (= c!62301 (and ((_ is Intermediate!4576) lt!243807) (undefined!5388 lt!243807)))))

(assert (=> d!80813 (= lt!243807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16112 a!3235) j!176) mask!3524) (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80813 (validMask!0 mask!3524)))

(assert (=> d!80813 (= (seekEntryOrOpen!0 (select (arr!16112 a!3235) j!176) a!3235 mask!3524) lt!243808)))

(declare-fun b!529070 () Bool)

(declare-fun e!308260 () SeekEntryResult!4576)

(assert (=> b!529070 (= e!308260 (MissingZero!4576 (index!20530 lt!243807)))))

(declare-fun b!529071 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33527 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!529071 (= e!308260 (seekKeyOrZeroReturnVacant!0 (x!49507 lt!243807) (index!20530 lt!243807) (index!20530 lt!243807) (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529072 () Bool)

(declare-fun e!308262 () SeekEntryResult!4576)

(assert (=> b!529072 (= e!308262 (Found!4576 (index!20530 lt!243807)))))

(declare-fun b!529073 () Bool)

(assert (=> b!529073 (= e!308261 Undefined!4576)))

(declare-fun b!529074 () Bool)

(declare-fun c!62299 () Bool)

(declare-fun lt!243806 () (_ BitVec 64))

(assert (=> b!529074 (= c!62299 (= lt!243806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529074 (= e!308262 e!308260)))

(declare-fun b!529075 () Bool)

(assert (=> b!529075 (= e!308261 e!308262)))

(assert (=> b!529075 (= lt!243806 (select (arr!16112 a!3235) (index!20530 lt!243807)))))

(declare-fun c!62300 () Bool)

(assert (=> b!529075 (= c!62300 (= lt!243806 (select (arr!16112 a!3235) j!176)))))

(assert (= (and d!80813 c!62301) b!529073))

(assert (= (and d!80813 (not c!62301)) b!529075))

(assert (= (and b!529075 c!62300) b!529072))

(assert (= (and b!529075 (not c!62300)) b!529074))

(assert (= (and b!529074 c!62299) b!529070))

(assert (= (and b!529074 (not c!62299)) b!529071))

(assert (=> d!80813 m!509075))

(declare-fun m!509161 () Bool)

(assert (=> d!80813 m!509161))

(declare-fun m!509163 () Bool)

(assert (=> d!80813 m!509163))

(assert (=> d!80813 m!509055))

(assert (=> d!80813 m!509063))

(declare-fun m!509165 () Bool)

(assert (=> d!80813 m!509165))

(assert (=> d!80813 m!509063))

(assert (=> d!80813 m!509055))

(declare-fun m!509167 () Bool)

(assert (=> d!80813 m!509167))

(assert (=> b!529071 m!509055))

(declare-fun m!509169 () Bool)

(assert (=> b!529071 m!509169))

(declare-fun m!509171 () Bool)

(assert (=> b!529075 m!509171))

(assert (=> b!528988 d!80813))

(declare-fun bm!31888 () Bool)

(declare-fun call!31891 () Bool)

(assert (=> bm!31888 (= call!31891 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80819 () Bool)

(declare-fun res!325094 () Bool)

(declare-fun e!308275 () Bool)

(assert (=> d!80819 (=> res!325094 e!308275)))

(assert (=> d!80819 (= res!325094 (bvsge #b00000000000000000000000000000000 (size!16477 a!3235)))))

(assert (=> d!80819 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!308275)))

(declare-fun b!529096 () Bool)

(declare-fun e!308277 () Bool)

(declare-fun e!308276 () Bool)

(assert (=> b!529096 (= e!308277 e!308276)))

(declare-fun lt!243823 () (_ BitVec 64))

(assert (=> b!529096 (= lt!243823 (select (arr!16112 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!243822 () Unit!16750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33527 (_ BitVec 64) (_ BitVec 32)) Unit!16750)

(assert (=> b!529096 (= lt!243822 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243823 #b00000000000000000000000000000000))))

(assert (=> b!529096 (arrayContainsKey!0 a!3235 lt!243823 #b00000000000000000000000000000000)))

(declare-fun lt!243821 () Unit!16750)

(assert (=> b!529096 (= lt!243821 lt!243822)))

(declare-fun res!325093 () Bool)

(assert (=> b!529096 (= res!325093 (= (seekEntryOrOpen!0 (select (arr!16112 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4576 #b00000000000000000000000000000000)))))

(assert (=> b!529096 (=> (not res!325093) (not e!308276))))

(declare-fun b!529097 () Bool)

(assert (=> b!529097 (= e!308277 call!31891)))

(declare-fun b!529098 () Bool)

(assert (=> b!529098 (= e!308276 call!31891)))

(declare-fun b!529099 () Bool)

(assert (=> b!529099 (= e!308275 e!308277)))

(declare-fun c!62310 () Bool)

(assert (=> b!529099 (= c!62310 (validKeyInArray!0 (select (arr!16112 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80819 (not res!325094)) b!529099))

(assert (= (and b!529099 c!62310) b!529096))

(assert (= (and b!529099 (not c!62310)) b!529097))

(assert (= (and b!529096 res!325093) b!529098))

(assert (= (or b!529098 b!529097) bm!31888))

(declare-fun m!509173 () Bool)

(assert (=> bm!31888 m!509173))

(declare-fun m!509175 () Bool)

(assert (=> b!529096 m!509175))

(declare-fun m!509177 () Bool)

(assert (=> b!529096 m!509177))

(declare-fun m!509179 () Bool)

(assert (=> b!529096 m!509179))

(assert (=> b!529096 m!509175))

(declare-fun m!509181 () Bool)

(assert (=> b!529096 m!509181))

(assert (=> b!529099 m!509175))

(assert (=> b!529099 m!509175))

(declare-fun m!509183 () Bool)

(assert (=> b!529099 m!509183))

(assert (=> b!528993 d!80819))

(declare-fun d!80821 () Bool)

(declare-fun res!325099 () Bool)

(declare-fun e!308291 () Bool)

(assert (=> d!80821 (=> res!325099 e!308291)))

(assert (=> d!80821 (= res!325099 (= (select (arr!16112 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80821 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!308291)))

(declare-fun b!529122 () Bool)

(declare-fun e!308292 () Bool)

(assert (=> b!529122 (= e!308291 e!308292)))

(declare-fun res!325100 () Bool)

(assert (=> b!529122 (=> (not res!325100) (not e!308292))))

(assert (=> b!529122 (= res!325100 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16477 a!3235)))))

(declare-fun b!529123 () Bool)

(assert (=> b!529123 (= e!308292 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80821 (not res!325099)) b!529122))

(assert (= (and b!529122 res!325100) b!529123))

(assert (=> d!80821 m!509175))

(declare-fun m!509197 () Bool)

(assert (=> b!529123 m!509197))

(assert (=> b!528992 d!80821))

(declare-fun d!80825 () Bool)

(assert (=> d!80825 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!528997 d!80825))

(declare-fun d!80827 () Bool)

(declare-fun lt!243835 () SeekEntryResult!4576)

(assert (=> d!80827 (and (or ((_ is Undefined!4576) lt!243835) (not ((_ is Found!4576) lt!243835)) (and (bvsge (index!20529 lt!243835) #b00000000000000000000000000000000) (bvslt (index!20529 lt!243835) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243835) ((_ is Found!4576) lt!243835) (not ((_ is MissingZero!4576) lt!243835)) (and (bvsge (index!20528 lt!243835) #b00000000000000000000000000000000) (bvslt (index!20528 lt!243835) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243835) ((_ is Found!4576) lt!243835) ((_ is MissingZero!4576) lt!243835) (not ((_ is MissingVacant!4576) lt!243835)) (and (bvsge (index!20531 lt!243835) #b00000000000000000000000000000000) (bvslt (index!20531 lt!243835) (size!16477 a!3235)))) (or ((_ is Undefined!4576) lt!243835) (ite ((_ is Found!4576) lt!243835) (= (select (arr!16112 a!3235) (index!20529 lt!243835)) k0!2280) (ite ((_ is MissingZero!4576) lt!243835) (= (select (arr!16112 a!3235) (index!20528 lt!243835)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4576) lt!243835) (= (select (arr!16112 a!3235) (index!20531 lt!243835)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!308294 () SeekEntryResult!4576)

(assert (=> d!80827 (= lt!243835 e!308294)))

(declare-fun c!62322 () Bool)

(declare-fun lt!243834 () SeekEntryResult!4576)

(assert (=> d!80827 (= c!62322 (and ((_ is Intermediate!4576) lt!243834) (undefined!5388 lt!243834)))))

(assert (=> d!80827 (= lt!243834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80827 (validMask!0 mask!3524)))

(assert (=> d!80827 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!243835)))

(declare-fun b!529124 () Bool)

(declare-fun e!308293 () SeekEntryResult!4576)

(assert (=> b!529124 (= e!308293 (MissingZero!4576 (index!20530 lt!243834)))))

(declare-fun b!529125 () Bool)

(assert (=> b!529125 (= e!308293 (seekKeyOrZeroReturnVacant!0 (x!49507 lt!243834) (index!20530 lt!243834) (index!20530 lt!243834) k0!2280 a!3235 mask!3524))))

(declare-fun b!529126 () Bool)

(declare-fun e!308295 () SeekEntryResult!4576)

(assert (=> b!529126 (= e!308295 (Found!4576 (index!20530 lt!243834)))))

(declare-fun b!529127 () Bool)

(assert (=> b!529127 (= e!308294 Undefined!4576)))

(declare-fun b!529128 () Bool)

(declare-fun c!62320 () Bool)

(declare-fun lt!243833 () (_ BitVec 64))

(assert (=> b!529128 (= c!62320 (= lt!243833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529128 (= e!308295 e!308293)))

(declare-fun b!529129 () Bool)

(assert (=> b!529129 (= e!308294 e!308295)))

(assert (=> b!529129 (= lt!243833 (select (arr!16112 a!3235) (index!20530 lt!243834)))))

(declare-fun c!62321 () Bool)

(assert (=> b!529129 (= c!62321 (= lt!243833 k0!2280))))

(assert (= (and d!80827 c!62322) b!529127))

(assert (= (and d!80827 (not c!62322)) b!529129))

(assert (= (and b!529129 c!62321) b!529126))

(assert (= (and b!529129 (not c!62321)) b!529128))

(assert (= (and b!529128 c!62320) b!529124))

(assert (= (and b!529128 (not c!62320)) b!529125))

(assert (=> d!80827 m!509075))

(declare-fun m!509199 () Bool)

(assert (=> d!80827 m!509199))

(declare-fun m!509201 () Bool)

(assert (=> d!80827 m!509201))

(declare-fun m!509203 () Bool)

(assert (=> d!80827 m!509203))

(declare-fun m!509205 () Bool)

(assert (=> d!80827 m!509205))

(assert (=> d!80827 m!509203))

(declare-fun m!509207 () Bool)

(assert (=> d!80827 m!509207))

(declare-fun m!509209 () Bool)

(assert (=> b!529125 m!509209))

(declare-fun m!509211 () Bool)

(assert (=> b!529129 m!509211))

(assert (=> b!528991 d!80827))

(declare-fun d!80829 () Bool)

(assert (=> d!80829 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!48024 d!80829))

(declare-fun d!80837 () Bool)

(assert (=> d!80837 (= (array_inv!11995 a!3235) (bvsge (size!16477 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!48024 d!80837))

(declare-fun b!529200 () Bool)

(declare-fun e!308352 () Bool)

(declare-fun call!31903 () Bool)

(assert (=> b!529200 (= e!308352 call!31903)))

(declare-fun b!529201 () Bool)

(assert (=> b!529201 (= e!308352 call!31903)))

(declare-fun b!529202 () Bool)

(declare-fun e!308349 () Bool)

(declare-fun contains!2761 (List!10309 (_ BitVec 64)) Bool)

(assert (=> b!529202 (= e!308349 (contains!2761 Nil!10306 (select (arr!16112 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529203 () Bool)

(declare-fun e!308351 () Bool)

(declare-fun e!308350 () Bool)

(assert (=> b!529203 (= e!308351 e!308350)))

(declare-fun res!325138 () Bool)

(assert (=> b!529203 (=> (not res!325138) (not e!308350))))

(assert (=> b!529203 (= res!325138 (not e!308349))))

(declare-fun res!325139 () Bool)

(assert (=> b!529203 (=> (not res!325139) (not e!308349))))

(assert (=> b!529203 (= res!325139 (validKeyInArray!0 (select (arr!16112 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529204 () Bool)

(assert (=> b!529204 (= e!308350 e!308352)))

(declare-fun c!62340 () Bool)

(assert (=> b!529204 (= c!62340 (validKeyInArray!0 (select (arr!16112 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80839 () Bool)

(declare-fun res!325140 () Bool)

(assert (=> d!80839 (=> res!325140 e!308351)))

(assert (=> d!80839 (= res!325140 (bvsge #b00000000000000000000000000000000 (size!16477 a!3235)))))

(assert (=> d!80839 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10306) e!308351)))

(declare-fun bm!31900 () Bool)

(assert (=> bm!31900 (= call!31903 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62340 (Cons!10305 (select (arr!16112 a!3235) #b00000000000000000000000000000000) Nil!10306) Nil!10306)))))

(assert (= (and d!80839 (not res!325140)) b!529203))

(assert (= (and b!529203 res!325139) b!529202))

(assert (= (and b!529203 res!325138) b!529204))

(assert (= (and b!529204 c!62340) b!529201))

(assert (= (and b!529204 (not c!62340)) b!529200))

(assert (= (or b!529201 b!529200) bm!31900))

(assert (=> b!529202 m!509175))

(assert (=> b!529202 m!509175))

(declare-fun m!509265 () Bool)

(assert (=> b!529202 m!509265))

(assert (=> b!529203 m!509175))

(assert (=> b!529203 m!509175))

(assert (=> b!529203 m!509183))

(assert (=> b!529204 m!509175))

(assert (=> b!529204 m!509175))

(assert (=> b!529204 m!509183))

(assert (=> bm!31900 m!509175))

(declare-fun m!509267 () Bool)

(assert (=> bm!31900 m!509267))

(assert (=> b!528989 d!80839))

(declare-fun d!80851 () Bool)

(declare-fun lt!243868 () (_ BitVec 32))

(declare-fun lt!243867 () (_ BitVec 32))

(assert (=> d!80851 (= lt!243868 (bvmul (bvxor lt!243867 (bvlshr lt!243867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80851 (= lt!243867 ((_ extract 31 0) (bvand (bvxor (select (arr!16112 a!3235) j!176) (bvlshr (select (arr!16112 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80851 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325141 (let ((h!11246 ((_ extract 31 0) (bvand (bvxor (select (arr!16112 a!3235) j!176) (bvlshr (select (arr!16112 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49511 (bvmul (bvxor h!11246 (bvlshr h!11246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49511 (bvlshr x!49511 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325141 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325141 #b00000000000000000000000000000000))))))

(assert (=> d!80851 (= (toIndex!0 (select (arr!16112 a!3235) j!176) mask!3524) (bvand (bvxor lt!243868 (bvlshr lt!243868 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!528990 d!80851))

(declare-fun d!80855 () Bool)

(declare-fun e!308404 () Bool)

(assert (=> d!80855 e!308404))

(declare-fun c!62368 () Bool)

(declare-fun lt!243904 () SeekEntryResult!4576)

(assert (=> d!80855 (= c!62368 (and ((_ is Intermediate!4576) lt!243904) (undefined!5388 lt!243904)))))

(declare-fun e!308403 () SeekEntryResult!4576)

(assert (=> d!80855 (= lt!243904 e!308403)))

(declare-fun c!62367 () Bool)

(assert (=> d!80855 (= c!62367 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243905 () (_ BitVec 64))

(assert (=> d!80855 (= lt!243905 (select (arr!16112 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235))) lt!243762))))

(assert (=> d!80855 (validMask!0 mask!3524)))

(assert (=> d!80855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243762 (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)) mask!3524) lt!243904)))

(declare-fun e!308402 () SeekEntryResult!4576)

(declare-fun b!529285 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529285 (= e!308402 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243762 #b00000000000000000000000000000000 mask!3524) (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)) mask!3524))))

(declare-fun b!529286 () Bool)

(assert (=> b!529286 (= e!308403 (Intermediate!4576 true lt!243762 #b00000000000000000000000000000000))))

(declare-fun b!529287 () Bool)

(assert (=> b!529287 (= e!308402 (Intermediate!4576 false lt!243762 #b00000000000000000000000000000000))))

(declare-fun b!529288 () Bool)

(assert (=> b!529288 (and (bvsge (index!20530 lt!243904) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243904) (size!16477 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)))))))

(declare-fun e!308405 () Bool)

(assert (=> b!529288 (= e!308405 (= (select (arr!16112 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235))) (index!20530 lt!243904)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529289 () Bool)

(assert (=> b!529289 (= e!308404 (bvsge (x!49507 lt!243904) #b01111111111111111111111111111110))))

(declare-fun b!529290 () Bool)

(declare-fun e!308401 () Bool)

(assert (=> b!529290 (= e!308404 e!308401)))

(declare-fun res!325173 () Bool)

(assert (=> b!529290 (= res!325173 (and ((_ is Intermediate!4576) lt!243904) (not (undefined!5388 lt!243904)) (bvslt (x!49507 lt!243904) #b01111111111111111111111111111110) (bvsge (x!49507 lt!243904) #b00000000000000000000000000000000) (bvsge (x!49507 lt!243904) #b00000000000000000000000000000000)))))

(assert (=> b!529290 (=> (not res!325173) (not e!308401))))

(declare-fun b!529291 () Bool)

(assert (=> b!529291 (and (bvsge (index!20530 lt!243904) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243904) (size!16477 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)))))))

(declare-fun res!325172 () Bool)

(assert (=> b!529291 (= res!325172 (= (select (arr!16112 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235))) (index!20530 lt!243904)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529291 (=> res!325172 e!308405)))

(declare-fun b!529292 () Bool)

(assert (=> b!529292 (and (bvsge (index!20530 lt!243904) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243904) (size!16477 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235)))))))

(declare-fun res!325171 () Bool)

(assert (=> b!529292 (= res!325171 (= (select (arr!16112 (array!33528 (store (arr!16112 a!3235) i!1204 k0!2280) (size!16477 a!3235))) (index!20530 lt!243904)) (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!529292 (=> res!325171 e!308405)))

(assert (=> b!529292 (= e!308401 e!308405)))

(declare-fun b!529293 () Bool)

(assert (=> b!529293 (= e!308403 e!308402)))

(declare-fun c!62369 () Bool)

(assert (=> b!529293 (= c!62369 (or (= lt!243905 (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!243905 lt!243905) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80855 c!62367) b!529286))

(assert (= (and d!80855 (not c!62367)) b!529293))

(assert (= (and b!529293 c!62369) b!529287))

(assert (= (and b!529293 (not c!62369)) b!529285))

(assert (= (and d!80855 c!62368) b!529289))

(assert (= (and d!80855 (not c!62368)) b!529290))

(assert (= (and b!529290 res!325173) b!529292))

(assert (= (and b!529292 (not res!325171)) b!529291))

(assert (= (and b!529291 (not res!325172)) b!529288))

(declare-fun m!509321 () Bool)

(assert (=> b!529285 m!509321))

(assert (=> b!529285 m!509321))

(assert (=> b!529285 m!509061))

(declare-fun m!509323 () Bool)

(assert (=> b!529285 m!509323))

(declare-fun m!509325 () Bool)

(assert (=> b!529292 m!509325))

(assert (=> b!529291 m!509325))

(declare-fun m!509327 () Bool)

(assert (=> d!80855 m!509327))

(assert (=> d!80855 m!509075))

(assert (=> b!529288 m!509325))

(assert (=> b!528990 d!80855))

(declare-fun bm!31906 () Bool)

(declare-fun call!31909 () Bool)

(assert (=> bm!31906 (= call!31909 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80875 () Bool)

(declare-fun res!325175 () Bool)

(declare-fun e!308406 () Bool)

(assert (=> d!80875 (=> res!325175 e!308406)))

(assert (=> d!80875 (= res!325175 (bvsge j!176 (size!16477 a!3235)))))

(assert (=> d!80875 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!308406)))

(declare-fun b!529294 () Bool)

(declare-fun e!308408 () Bool)

(declare-fun e!308407 () Bool)

(assert (=> b!529294 (= e!308408 e!308407)))

(declare-fun lt!243908 () (_ BitVec 64))

(assert (=> b!529294 (= lt!243908 (select (arr!16112 a!3235) j!176))))

(declare-fun lt!243907 () Unit!16750)

(assert (=> b!529294 (= lt!243907 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!243908 j!176))))

(assert (=> b!529294 (arrayContainsKey!0 a!3235 lt!243908 #b00000000000000000000000000000000)))

(declare-fun lt!243906 () Unit!16750)

(assert (=> b!529294 (= lt!243906 lt!243907)))

(declare-fun res!325174 () Bool)

(assert (=> b!529294 (= res!325174 (= (seekEntryOrOpen!0 (select (arr!16112 a!3235) j!176) a!3235 mask!3524) (Found!4576 j!176)))))

(assert (=> b!529294 (=> (not res!325174) (not e!308407))))

(declare-fun b!529295 () Bool)

(assert (=> b!529295 (= e!308408 call!31909)))

(declare-fun b!529296 () Bool)

(assert (=> b!529296 (= e!308407 call!31909)))

(declare-fun b!529297 () Bool)

(assert (=> b!529297 (= e!308406 e!308408)))

(declare-fun c!62370 () Bool)

(assert (=> b!529297 (= c!62370 (validKeyInArray!0 (select (arr!16112 a!3235) j!176)))))

(assert (= (and d!80875 (not res!325175)) b!529297))

(assert (= (and b!529297 c!62370) b!529294))

(assert (= (and b!529297 (not c!62370)) b!529295))

(assert (= (and b!529294 res!325174) b!529296))

(assert (= (or b!529296 b!529295) bm!31906))

(declare-fun m!509329 () Bool)

(assert (=> bm!31906 m!509329))

(assert (=> b!529294 m!509055))

(declare-fun m!509331 () Bool)

(assert (=> b!529294 m!509331))

(declare-fun m!509333 () Bool)

(assert (=> b!529294 m!509333))

(assert (=> b!529294 m!509055))

(assert (=> b!529294 m!509057))

(assert (=> b!529297 m!509055))

(assert (=> b!529297 m!509055))

(assert (=> b!529297 m!509081))

(assert (=> b!528990 d!80875))

(declare-fun d!80877 () Bool)

(assert (=> d!80877 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243916 () Unit!16750)

(declare-fun choose!38 (array!33527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16750)

(assert (=> d!80877 (= lt!243916 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80877 (validMask!0 mask!3524)))

(assert (=> d!80877 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!243916)))

(declare-fun bs!16545 () Bool)

(assert (= bs!16545 d!80877))

(assert (=> bs!16545 m!509065))

(declare-fun m!509337 () Bool)

(assert (=> bs!16545 m!509337))

(assert (=> bs!16545 m!509075))

(assert (=> b!528990 d!80877))

(declare-fun d!80887 () Bool)

(declare-fun lt!243918 () (_ BitVec 32))

(declare-fun lt!243917 () (_ BitVec 32))

(assert (=> d!80887 (= lt!243918 (bvmul (bvxor lt!243917 (bvlshr lt!243917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80887 (= lt!243917 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80887 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325141 (let ((h!11246 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49511 (bvmul (bvxor h!11246 (bvlshr h!11246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49511 (bvlshr x!49511 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325141 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325141 #b00000000000000000000000000000000))))))

(assert (=> d!80887 (= (toIndex!0 (select (store (arr!16112 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!243918 (bvlshr lt!243918 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!528990 d!80887))

(declare-fun d!80889 () Bool)

(declare-fun e!308412 () Bool)

(assert (=> d!80889 e!308412))

(declare-fun c!62372 () Bool)

(declare-fun lt!243919 () SeekEntryResult!4576)

(assert (=> d!80889 (= c!62372 (and ((_ is Intermediate!4576) lt!243919) (undefined!5388 lt!243919)))))

(declare-fun e!308411 () SeekEntryResult!4576)

(assert (=> d!80889 (= lt!243919 e!308411)))

(declare-fun c!62371 () Bool)

(assert (=> d!80889 (= c!62371 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!243920 () (_ BitVec 64))

(assert (=> d!80889 (= lt!243920 (select (arr!16112 a!3235) lt!243760))))

(assert (=> d!80889 (validMask!0 mask!3524)))

(assert (=> d!80889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243760 (select (arr!16112 a!3235) j!176) a!3235 mask!3524) lt!243919)))

(declare-fun e!308410 () SeekEntryResult!4576)

(declare-fun b!529298 () Bool)

(assert (=> b!529298 (= e!308410 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243760 #b00000000000000000000000000000000 mask!3524) (select (arr!16112 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529299 () Bool)

(assert (=> b!529299 (= e!308411 (Intermediate!4576 true lt!243760 #b00000000000000000000000000000000))))

(declare-fun b!529300 () Bool)

(assert (=> b!529300 (= e!308410 (Intermediate!4576 false lt!243760 #b00000000000000000000000000000000))))

(declare-fun b!529301 () Bool)

(assert (=> b!529301 (and (bvsge (index!20530 lt!243919) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243919) (size!16477 a!3235)))))

(declare-fun e!308413 () Bool)

(assert (=> b!529301 (= e!308413 (= (select (arr!16112 a!3235) (index!20530 lt!243919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529302 () Bool)

(assert (=> b!529302 (= e!308412 (bvsge (x!49507 lt!243919) #b01111111111111111111111111111110))))

(declare-fun b!529303 () Bool)

(declare-fun e!308409 () Bool)

(assert (=> b!529303 (= e!308412 e!308409)))

(declare-fun res!325178 () Bool)

(assert (=> b!529303 (= res!325178 (and ((_ is Intermediate!4576) lt!243919) (not (undefined!5388 lt!243919)) (bvslt (x!49507 lt!243919) #b01111111111111111111111111111110) (bvsge (x!49507 lt!243919) #b00000000000000000000000000000000) (bvsge (x!49507 lt!243919) #b00000000000000000000000000000000)))))

(assert (=> b!529303 (=> (not res!325178) (not e!308409))))

(declare-fun b!529304 () Bool)

(assert (=> b!529304 (and (bvsge (index!20530 lt!243919) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243919) (size!16477 a!3235)))))

(declare-fun res!325177 () Bool)

(assert (=> b!529304 (= res!325177 (= (select (arr!16112 a!3235) (index!20530 lt!243919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529304 (=> res!325177 e!308413)))

(declare-fun b!529305 () Bool)

(assert (=> b!529305 (and (bvsge (index!20530 lt!243919) #b00000000000000000000000000000000) (bvslt (index!20530 lt!243919) (size!16477 a!3235)))))

(declare-fun res!325176 () Bool)

(assert (=> b!529305 (= res!325176 (= (select (arr!16112 a!3235) (index!20530 lt!243919)) (select (arr!16112 a!3235) j!176)))))

(assert (=> b!529305 (=> res!325176 e!308413)))

(assert (=> b!529305 (= e!308409 e!308413)))

(declare-fun b!529306 () Bool)

(assert (=> b!529306 (= e!308411 e!308410)))

(declare-fun c!62373 () Bool)

(assert (=> b!529306 (= c!62373 (or (= lt!243920 (select (arr!16112 a!3235) j!176)) (= (bvadd lt!243920 lt!243920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80889 c!62371) b!529299))

(assert (= (and d!80889 (not c!62371)) b!529306))

(assert (= (and b!529306 c!62373) b!529300))

(assert (= (and b!529306 (not c!62373)) b!529298))

(assert (= (and d!80889 c!62372) b!529302))

(assert (= (and d!80889 (not c!62372)) b!529303))

(assert (= (and b!529303 res!325178) b!529305))

(assert (= (and b!529305 (not res!325176)) b!529304))

(assert (= (and b!529304 (not res!325177)) b!529301))

(declare-fun m!509339 () Bool)

(assert (=> b!529298 m!509339))

(assert (=> b!529298 m!509339))

(assert (=> b!529298 m!509055))

(declare-fun m!509341 () Bool)

(assert (=> b!529298 m!509341))

(declare-fun m!509343 () Bool)

(assert (=> b!529305 m!509343))

(assert (=> b!529304 m!509343))

(declare-fun m!509345 () Bool)

(assert (=> d!80889 m!509345))

(assert (=> d!80889 m!509075))

(assert (=> b!529301 m!509343))

(assert (=> b!528990 d!80889))

(declare-fun d!80891 () Bool)

(assert (=> d!80891 (= (validKeyInArray!0 (select (arr!16112 a!3235) j!176)) (and (not (= (select (arr!16112 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16112 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!528995 d!80891))

(check-sat (not d!80855) (not b!529298) (not b!529203) (not b!529202) (not bm!31888) (not b!529125) (not bm!31900) (not d!80813) (not b!529285) (not b!529204) (not bm!31906) (not b!529297) (not d!80827) (not b!529294) (not b!529096) (not b!529099) (not b!529123) (not d!80889) (not d!80877) (not b!529071))
(check-sat)
