; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85830 () Bool)

(assert start!85830)

(declare-fun b!995086 () Bool)

(declare-fun res!665577 () Bool)

(declare-fun e!561505 () Bool)

(assert (=> b!995086 (=> (not res!665577) (not e!561505))))

(declare-datatypes ((array!62911 0))(
  ( (array!62912 (arr!30291 (Array (_ BitVec 32) (_ BitVec 64))) (size!30795 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62911)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62911 (_ BitVec 32)) Bool)

(assert (=> b!995086 (= res!665577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995087 () Bool)

(declare-fun res!665581 () Bool)

(assert (=> b!995087 (=> (not res!665581) (not e!561505))))

(assert (=> b!995087 (= res!665581 (and (bvsle #b00000000000000000000000000000000 (size!30795 a!3219)) (bvslt (size!30795 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!995088 () Bool)

(declare-fun e!561506 () Bool)

(assert (=> b!995088 (= e!561505 e!561506)))

(declare-fun res!665575 () Bool)

(assert (=> b!995088 (=> res!665575 e!561506)))

(declare-datatypes ((List!21033 0))(
  ( (Nil!21030) (Cons!21029 (h!22191 (_ BitVec 64)) (t!30025 List!21033)) )
))
(declare-fun contains!5832 (List!21033 (_ BitVec 64)) Bool)

(assert (=> b!995088 (= res!665575 (contains!5832 Nil!21030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995089 () Bool)

(declare-fun res!665578 () Bool)

(declare-fun e!561504 () Bool)

(assert (=> b!995089 (=> (not res!665578) (not e!561504))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995089 (= res!665578 (validKeyInArray!0 k0!2224))))

(declare-fun b!995090 () Bool)

(declare-fun res!665576 () Bool)

(assert (=> b!995090 (=> (not res!665576) (not e!561504))))

(declare-fun arrayContainsKey!0 (array!62911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995090 (= res!665576 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995091 () Bool)

(assert (=> b!995091 (= e!561504 e!561505)))

(declare-fun res!665579 () Bool)

(assert (=> b!995091 (=> (not res!665579) (not e!561505))))

(declare-datatypes ((SeekEntryResult!9248 0))(
  ( (MissingZero!9248 (index!39363 (_ BitVec 32))) (Found!9248 (index!39364 (_ BitVec 32))) (Intermediate!9248 (undefined!10060 Bool) (index!39365 (_ BitVec 32)) (x!86820 (_ BitVec 32))) (Undefined!9248) (MissingVacant!9248 (index!39366 (_ BitVec 32))) )
))
(declare-fun lt!440683 () SeekEntryResult!9248)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995091 (= res!665579 (or (= lt!440683 (MissingVacant!9248 i!1194)) (= lt!440683 (MissingZero!9248 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62911 (_ BitVec 32)) SeekEntryResult!9248)

(assert (=> b!995091 (= lt!440683 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995092 () Bool)

(declare-fun res!665573 () Bool)

(assert (=> b!995092 (=> (not res!665573) (not e!561505))))

(declare-fun noDuplicate!1465 (List!21033) Bool)

(assert (=> b!995092 (= res!665573 (noDuplicate!1465 Nil!21030))))

(declare-fun b!995093 () Bool)

(assert (=> b!995093 (= e!561506 (contains!5832 Nil!21030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995094 () Bool)

(declare-fun res!665582 () Bool)

(assert (=> b!995094 (=> (not res!665582) (not e!561504))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995094 (= res!665582 (and (= (size!30795 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30795 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30795 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665574 () Bool)

(assert (=> start!85830 (=> (not res!665574) (not e!561504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85830 (= res!665574 (validMask!0 mask!3464))))

(assert (=> start!85830 e!561504))

(declare-fun array_inv!23434 (array!62911) Bool)

(assert (=> start!85830 (array_inv!23434 a!3219)))

(assert (=> start!85830 true))

(declare-fun b!995095 () Bool)

(declare-fun res!665580 () Bool)

(assert (=> b!995095 (=> (not res!665580) (not e!561504))))

(assert (=> b!995095 (= res!665580 (validKeyInArray!0 (select (arr!30291 a!3219) j!170)))))

(assert (= (and start!85830 res!665574) b!995094))

(assert (= (and b!995094 res!665582) b!995095))

(assert (= (and b!995095 res!665580) b!995089))

(assert (= (and b!995089 res!665578) b!995090))

(assert (= (and b!995090 res!665576) b!995091))

(assert (= (and b!995091 res!665579) b!995086))

(assert (= (and b!995086 res!665577) b!995087))

(assert (= (and b!995087 res!665581) b!995092))

(assert (= (and b!995092 res!665573) b!995088))

(assert (= (and b!995088 (not res!665575)) b!995093))

(declare-fun m!922003 () Bool)

(assert (=> b!995090 m!922003))

(declare-fun m!922005 () Bool)

(assert (=> start!85830 m!922005))

(declare-fun m!922007 () Bool)

(assert (=> start!85830 m!922007))

(declare-fun m!922009 () Bool)

(assert (=> b!995086 m!922009))

(declare-fun m!922011 () Bool)

(assert (=> b!995088 m!922011))

(declare-fun m!922013 () Bool)

(assert (=> b!995095 m!922013))

(assert (=> b!995095 m!922013))

(declare-fun m!922015 () Bool)

(assert (=> b!995095 m!922015))

(declare-fun m!922017 () Bool)

(assert (=> b!995093 m!922017))

(declare-fun m!922019 () Bool)

(assert (=> b!995089 m!922019))

(declare-fun m!922021 () Bool)

(assert (=> b!995092 m!922021))

(declare-fun m!922023 () Bool)

(assert (=> b!995091 m!922023))

(check-sat (not b!995089) (not b!995090) (not b!995086) (not b!995088) (not b!995095) (not b!995091) (not b!995093) (not start!85830) (not b!995092))
(check-sat)
(get-model)

(declare-fun d!118663 () Bool)

(declare-fun lt!440692 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!479 (List!21033) (InoxSet (_ BitVec 64)))

(assert (=> d!118663 (= lt!440692 (select (content!479 Nil!21030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561535 () Bool)

(assert (=> d!118663 (= lt!440692 e!561535)))

(declare-fun res!665647 () Bool)

(assert (=> d!118663 (=> (not res!665647) (not e!561535))))

(get-info :version)

(assert (=> d!118663 (= res!665647 ((_ is Cons!21029) Nil!21030))))

(assert (=> d!118663 (= (contains!5832 Nil!21030 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440692)))

(declare-fun b!995160 () Bool)

(declare-fun e!561536 () Bool)

(assert (=> b!995160 (= e!561535 e!561536)))

(declare-fun res!665648 () Bool)

(assert (=> b!995160 (=> res!665648 e!561536)))

(assert (=> b!995160 (= res!665648 (= (h!22191 Nil!21030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995161 () Bool)

(assert (=> b!995161 (= e!561536 (contains!5832 (t!30025 Nil!21030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118663 res!665647) b!995160))

(assert (= (and b!995160 (not res!665648)) b!995161))

(declare-fun m!922069 () Bool)

(assert (=> d!118663 m!922069))

(declare-fun m!922071 () Bool)

(assert (=> d!118663 m!922071))

(declare-fun m!922073 () Bool)

(assert (=> b!995161 m!922073))

(assert (=> b!995088 d!118663))

(declare-fun d!118665 () Bool)

(declare-fun lt!440693 () Bool)

(assert (=> d!118665 (= lt!440693 (select (content!479 Nil!21030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561537 () Bool)

(assert (=> d!118665 (= lt!440693 e!561537)))

(declare-fun res!665649 () Bool)

(assert (=> d!118665 (=> (not res!665649) (not e!561537))))

(assert (=> d!118665 (= res!665649 ((_ is Cons!21029) Nil!21030))))

(assert (=> d!118665 (= (contains!5832 Nil!21030 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440693)))

(declare-fun b!995162 () Bool)

(declare-fun e!561538 () Bool)

(assert (=> b!995162 (= e!561537 e!561538)))

(declare-fun res!665650 () Bool)

(assert (=> b!995162 (=> res!665650 e!561538)))

(assert (=> b!995162 (= res!665650 (= (h!22191 Nil!21030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995163 () Bool)

(assert (=> b!995163 (= e!561538 (contains!5832 (t!30025 Nil!21030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118665 res!665649) b!995162))

(assert (= (and b!995162 (not res!665650)) b!995163))

(assert (=> d!118665 m!922069))

(declare-fun m!922075 () Bool)

(assert (=> d!118665 m!922075))

(declare-fun m!922077 () Bool)

(assert (=> b!995163 m!922077))

(assert (=> b!995093 d!118665))

(declare-fun d!118667 () Bool)

(assert (=> d!118667 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85830 d!118667))

(declare-fun d!118675 () Bool)

(assert (=> d!118675 (= (array_inv!23434 a!3219) (bvsge (size!30795 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85830 d!118675))

(declare-fun d!118677 () Bool)

(assert (=> d!118677 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995089 d!118677))

(declare-fun d!118679 () Bool)

(declare-fun res!665667 () Bool)

(declare-fun e!561555 () Bool)

(assert (=> d!118679 (=> res!665667 e!561555)))

(assert (=> d!118679 (= res!665667 (= (select (arr!30291 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118679 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561555)))

(declare-fun b!995180 () Bool)

(declare-fun e!561556 () Bool)

(assert (=> b!995180 (= e!561555 e!561556)))

(declare-fun res!665668 () Bool)

(assert (=> b!995180 (=> (not res!665668) (not e!561556))))

(assert (=> b!995180 (= res!665668 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30795 a!3219)))))

(declare-fun b!995181 () Bool)

(assert (=> b!995181 (= e!561556 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118679 (not res!665667)) b!995180))

(assert (= (and b!995180 res!665668) b!995181))

(declare-fun m!922089 () Bool)

(assert (=> d!118679 m!922089))

(declare-fun m!922091 () Bool)

(assert (=> b!995181 m!922091))

(assert (=> b!995090 d!118679))

(declare-fun d!118683 () Bool)

(assert (=> d!118683 (= (validKeyInArray!0 (select (arr!30291 a!3219) j!170)) (and (not (= (select (arr!30291 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30291 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995095 d!118683))

(declare-fun bm!42172 () Bool)

(declare-fun call!42175 () Bool)

(assert (=> bm!42172 (= call!42175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995214 () Bool)

(declare-fun e!561578 () Bool)

(assert (=> b!995214 (= e!561578 call!42175)))

(declare-fun b!995216 () Bool)

(declare-fun e!561579 () Bool)

(assert (=> b!995216 (= e!561579 call!42175)))

(declare-fun b!995217 () Bool)

(declare-fun e!561580 () Bool)

(assert (=> b!995217 (= e!561580 e!561579)))

(declare-fun c!100909 () Bool)

(assert (=> b!995217 (= c!100909 (validKeyInArray!0 (select (arr!30291 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118685 () Bool)

(declare-fun res!665679 () Bool)

(assert (=> d!118685 (=> res!665679 e!561580)))

(assert (=> d!118685 (= res!665679 (bvsge #b00000000000000000000000000000000 (size!30795 a!3219)))))

(assert (=> d!118685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561580)))

(declare-fun b!995215 () Bool)

(assert (=> b!995215 (= e!561579 e!561578)))

(declare-fun lt!440718 () (_ BitVec 64))

(assert (=> b!995215 (= lt!440718 (select (arr!30291 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32829 0))(
  ( (Unit!32830) )
))
(declare-fun lt!440720 () Unit!32829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62911 (_ BitVec 64) (_ BitVec 32)) Unit!32829)

(assert (=> b!995215 (= lt!440720 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440718 #b00000000000000000000000000000000))))

(assert (=> b!995215 (arrayContainsKey!0 a!3219 lt!440718 #b00000000000000000000000000000000)))

(declare-fun lt!440719 () Unit!32829)

(assert (=> b!995215 (= lt!440719 lt!440720)))

(declare-fun res!665680 () Bool)

(assert (=> b!995215 (= res!665680 (= (seekEntryOrOpen!0 (select (arr!30291 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9248 #b00000000000000000000000000000000)))))

(assert (=> b!995215 (=> (not res!665680) (not e!561578))))

(assert (= (and d!118685 (not res!665679)) b!995217))

(assert (= (and b!995217 c!100909) b!995215))

(assert (= (and b!995217 (not c!100909)) b!995216))

(assert (= (and b!995215 res!665680) b!995214))

(assert (= (or b!995214 b!995216) bm!42172))

(declare-fun m!922103 () Bool)

(assert (=> bm!42172 m!922103))

(assert (=> b!995217 m!922089))

(assert (=> b!995217 m!922089))

(declare-fun m!922105 () Bool)

(assert (=> b!995217 m!922105))

(assert (=> b!995215 m!922089))

(declare-fun m!922107 () Bool)

(assert (=> b!995215 m!922107))

(declare-fun m!922109 () Bool)

(assert (=> b!995215 m!922109))

(assert (=> b!995215 m!922089))

(declare-fun m!922111 () Bool)

(assert (=> b!995215 m!922111))

(assert (=> b!995086 d!118685))

(declare-fun b!995268 () Bool)

(declare-fun e!561613 () SeekEntryResult!9248)

(declare-fun lt!440744 () SeekEntryResult!9248)

(assert (=> b!995268 (= e!561613 (Found!9248 (index!39365 lt!440744)))))

(declare-fun e!561615 () SeekEntryResult!9248)

(declare-fun b!995269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62911 (_ BitVec 32)) SeekEntryResult!9248)

(assert (=> b!995269 (= e!561615 (seekKeyOrZeroReturnVacant!0 (x!86820 lt!440744) (index!39365 lt!440744) (index!39365 lt!440744) k0!2224 a!3219 mask!3464))))

(declare-fun b!995270 () Bool)

(declare-fun e!561614 () SeekEntryResult!9248)

(assert (=> b!995270 (= e!561614 e!561613)))

(declare-fun lt!440743 () (_ BitVec 64))

(assert (=> b!995270 (= lt!440743 (select (arr!30291 a!3219) (index!39365 lt!440744)))))

(declare-fun c!100928 () Bool)

(assert (=> b!995270 (= c!100928 (= lt!440743 k0!2224))))

(declare-fun b!995271 () Bool)

(declare-fun c!100930 () Bool)

(assert (=> b!995271 (= c!100930 (= lt!440743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!995271 (= e!561613 e!561615)))

(declare-fun b!995272 () Bool)

(assert (=> b!995272 (= e!561615 (MissingZero!9248 (index!39365 lt!440744)))))

(declare-fun b!995273 () Bool)

(assert (=> b!995273 (= e!561614 Undefined!9248)))

(declare-fun d!118689 () Bool)

(declare-fun lt!440745 () SeekEntryResult!9248)

(assert (=> d!118689 (and (or ((_ is Undefined!9248) lt!440745) (not ((_ is Found!9248) lt!440745)) (and (bvsge (index!39364 lt!440745) #b00000000000000000000000000000000) (bvslt (index!39364 lt!440745) (size!30795 a!3219)))) (or ((_ is Undefined!9248) lt!440745) ((_ is Found!9248) lt!440745) (not ((_ is MissingZero!9248) lt!440745)) (and (bvsge (index!39363 lt!440745) #b00000000000000000000000000000000) (bvslt (index!39363 lt!440745) (size!30795 a!3219)))) (or ((_ is Undefined!9248) lt!440745) ((_ is Found!9248) lt!440745) ((_ is MissingZero!9248) lt!440745) (not ((_ is MissingVacant!9248) lt!440745)) (and (bvsge (index!39366 lt!440745) #b00000000000000000000000000000000) (bvslt (index!39366 lt!440745) (size!30795 a!3219)))) (or ((_ is Undefined!9248) lt!440745) (ite ((_ is Found!9248) lt!440745) (= (select (arr!30291 a!3219) (index!39364 lt!440745)) k0!2224) (ite ((_ is MissingZero!9248) lt!440745) (= (select (arr!30291 a!3219) (index!39363 lt!440745)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9248) lt!440745) (= (select (arr!30291 a!3219) (index!39366 lt!440745)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118689 (= lt!440745 e!561614)))

(declare-fun c!100929 () Bool)

(assert (=> d!118689 (= c!100929 (and ((_ is Intermediate!9248) lt!440744) (undefined!10060 lt!440744)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62911 (_ BitVec 32)) SeekEntryResult!9248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118689 (= lt!440744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118689 (validMask!0 mask!3464)))

(assert (=> d!118689 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440745)))

(assert (= (and d!118689 c!100929) b!995273))

(assert (= (and d!118689 (not c!100929)) b!995270))

(assert (= (and b!995270 c!100928) b!995268))

(assert (= (and b!995270 (not c!100928)) b!995271))

(assert (= (and b!995271 c!100930) b!995272))

(assert (= (and b!995271 (not c!100930)) b!995269))

(declare-fun m!922155 () Bool)

(assert (=> b!995269 m!922155))

(declare-fun m!922157 () Bool)

(assert (=> b!995270 m!922157))

(assert (=> d!118689 m!922005))

(declare-fun m!922159 () Bool)

(assert (=> d!118689 m!922159))

(declare-fun m!922161 () Bool)

(assert (=> d!118689 m!922161))

(declare-fun m!922163 () Bool)

(assert (=> d!118689 m!922163))

(declare-fun m!922165 () Bool)

(assert (=> d!118689 m!922165))

(declare-fun m!922167 () Bool)

(assert (=> d!118689 m!922167))

(assert (=> d!118689 m!922163))

(assert (=> b!995091 d!118689))

(declare-fun d!118709 () Bool)

(declare-fun res!665699 () Bool)

(declare-fun e!561620 () Bool)

(assert (=> d!118709 (=> res!665699 e!561620)))

(assert (=> d!118709 (= res!665699 ((_ is Nil!21030) Nil!21030))))

(assert (=> d!118709 (= (noDuplicate!1465 Nil!21030) e!561620)))

(declare-fun b!995278 () Bool)

(declare-fun e!561621 () Bool)

(assert (=> b!995278 (= e!561620 e!561621)))

(declare-fun res!665700 () Bool)

(assert (=> b!995278 (=> (not res!665700) (not e!561621))))

(assert (=> b!995278 (= res!665700 (not (contains!5832 (t!30025 Nil!21030) (h!22191 Nil!21030))))))

(declare-fun b!995279 () Bool)

(assert (=> b!995279 (= e!561621 (noDuplicate!1465 (t!30025 Nil!21030)))))

(assert (= (and d!118709 (not res!665699)) b!995278))

(assert (= (and b!995278 res!665700) b!995279))

(declare-fun m!922169 () Bool)

(assert (=> b!995278 m!922169))

(declare-fun m!922171 () Bool)

(assert (=> b!995279 m!922171))

(assert (=> b!995092 d!118709))

(check-sat (not b!995278) (not d!118665) (not b!995163) (not b!995279) (not b!995181) (not d!118663) (not b!995215) (not b!995269) (not bm!42172) (not d!118689) (not b!995161) (not b!995217))
(check-sat)
