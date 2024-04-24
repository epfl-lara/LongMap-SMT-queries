; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49666 () Bool)

(assert start!49666)

(declare-fun b!546244 () Bool)

(declare-fun res!340075 () Bool)

(declare-fun e!315726 () Bool)

(assert (=> b!546244 (=> (not res!340075) (not e!315726))))

(declare-datatypes ((array!34427 0))(
  ( (array!34428 (arr!16540 (Array (_ BitVec 32) (_ BitVec 64))) (size!16904 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34427)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34427 (_ BitVec 32)) Bool)

(assert (=> b!546244 (= res!340075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!546245 () Bool)

(declare-fun res!340074 () Bool)

(assert (=> b!546245 (=> (not res!340074) (not e!315726))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!546245 (= res!340074 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16904 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16904 a!3154)) (= (select (arr!16540 a!3154) resIndex!32) (select (arr!16540 a!3154) j!147))))))

(declare-fun b!546246 () Bool)

(declare-fun e!315729 () Bool)

(declare-fun e!315731 () Bool)

(assert (=> b!546246 (= e!315729 e!315731)))

(declare-fun res!340070 () Bool)

(assert (=> b!546246 (=> (not res!340070) (not e!315731))))

(declare-datatypes ((SeekEntryResult!4954 0))(
  ( (MissingZero!4954 (index!22040 (_ BitVec 32))) (Found!4954 (index!22041 (_ BitVec 32))) (Intermediate!4954 (undefined!5766 Bool) (index!22042 (_ BitVec 32)) (x!51117 (_ BitVec 32))) (Undefined!4954) (MissingVacant!4954 (index!22043 (_ BitVec 32))) )
))
(declare-fun lt!249255 () SeekEntryResult!4954)

(declare-fun lt!249261 () SeekEntryResult!4954)

(declare-fun lt!249257 () SeekEntryResult!4954)

(assert (=> b!546246 (= res!340070 (and (= lt!249257 lt!249255) (= lt!249261 lt!249257)))))

(declare-fun lt!249259 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34427 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!546246 (= lt!249257 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249259 (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546247 () Bool)

(declare-fun e!315730 () Bool)

(assert (=> b!546247 (= e!315730 e!315726)))

(declare-fun res!340072 () Bool)

(assert (=> b!546247 (=> (not res!340072) (not e!315726))))

(declare-fun lt!249256 () SeekEntryResult!4954)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546247 (= res!340072 (or (= lt!249256 (MissingZero!4954 i!1153)) (= lt!249256 (MissingVacant!4954 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34427 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!546247 (= lt!249256 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!546248 () Bool)

(declare-fun res!340068 () Bool)

(assert (=> b!546248 (=> (not res!340068) (not e!315730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546248 (= res!340068 (validKeyInArray!0 k0!1998))))

(declare-fun b!546249 () Bool)

(declare-fun res!340066 () Bool)

(assert (=> b!546249 (=> (not res!340066) (not e!315730))))

(assert (=> b!546249 (= res!340066 (validKeyInArray!0 (select (arr!16540 a!3154) j!147)))))

(declare-fun b!546250 () Bool)

(declare-fun e!315728 () Bool)

(declare-fun e!315727 () Bool)

(assert (=> b!546250 (= e!315728 e!315727)))

(declare-fun res!340071 () Bool)

(assert (=> b!546250 (=> (not res!340071) (not e!315727))))

(declare-fun lt!249254 () SeekEntryResult!4954)

(assert (=> b!546250 (= res!340071 (and (= lt!249261 lt!249254) (not (= (select (arr!16540 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16540 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16540 a!3154) index!1177) (select (arr!16540 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546250 (= lt!249261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546251 () Bool)

(declare-fun res!340078 () Bool)

(assert (=> b!546251 (=> (not res!340078) (not e!315726))))

(declare-datatypes ((List!10566 0))(
  ( (Nil!10563) (Cons!10562 (h!11529 (_ BitVec 64)) (t!16786 List!10566)) )
))
(declare-fun arrayNoDuplicates!0 (array!34427 (_ BitVec 32) List!10566) Bool)

(assert (=> b!546251 (= res!340078 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10563))))

(declare-fun b!546252 () Bool)

(declare-fun res!340067 () Bool)

(assert (=> b!546252 (=> (not res!340067) (not e!315730))))

(assert (=> b!546252 (= res!340067 (and (= (size!16904 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16904 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16904 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546253 () Bool)

(declare-fun res!340073 () Bool)

(assert (=> b!546253 (=> (not res!340073) (not e!315730))))

(declare-fun arrayContainsKey!0 (array!34427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546253 (= res!340073 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun lt!249258 () (_ BitVec 64))

(declare-fun lt!249260 () array!34427)

(declare-fun b!546254 () Bool)

(assert (=> b!546254 (= e!315731 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249258 lt!249260 mask!3216) lt!249255)))))

(assert (=> b!546254 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249259 lt!249258 lt!249260 mask!3216) lt!249255)))

(assert (=> b!546254 (= lt!249258 (select (store (arr!16540 a!3154) i!1153 k0!1998) j!147))))

(assert (=> b!546254 (= lt!249260 (array!34428 (store (arr!16540 a!3154) i!1153 k0!1998) (size!16904 a!3154)))))

(declare-datatypes ((Unit!16917 0))(
  ( (Unit!16918) )
))
(declare-fun lt!249262 () Unit!16917)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16917)

(assert (=> b!546254 (= lt!249262 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249259 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun res!340077 () Bool)

(assert (=> start!49666 (=> (not res!340077) (not e!315730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49666 (= res!340077 (validMask!0 mask!3216))))

(assert (=> start!49666 e!315730))

(assert (=> start!49666 true))

(declare-fun array_inv!12399 (array!34427) Bool)

(assert (=> start!49666 (array_inv!12399 a!3154)))

(declare-fun b!546255 () Bool)

(assert (=> b!546255 (= e!315726 e!315728)))

(declare-fun res!340069 () Bool)

(assert (=> b!546255 (=> (not res!340069) (not e!315728))))

(assert (=> b!546255 (= res!340069 (= lt!249254 lt!249255))))

(assert (=> b!546255 (= lt!249255 (Intermediate!4954 false resIndex!32 resX!32))))

(assert (=> b!546255 (= lt!249254 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546256 () Bool)

(assert (=> b!546256 (= e!315727 e!315729)))

(declare-fun res!340076 () Bool)

(assert (=> b!546256 (=> (not res!340076) (not e!315729))))

(assert (=> b!546256 (= res!340076 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249259 #b00000000000000000000000000000000) (bvslt lt!249259 (size!16904 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546256 (= lt!249259 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!49666 res!340077) b!546252))

(assert (= (and b!546252 res!340067) b!546249))

(assert (= (and b!546249 res!340066) b!546248))

(assert (= (and b!546248 res!340068) b!546253))

(assert (= (and b!546253 res!340073) b!546247))

(assert (= (and b!546247 res!340072) b!546244))

(assert (= (and b!546244 res!340075) b!546251))

(assert (= (and b!546251 res!340078) b!546245))

(assert (= (and b!546245 res!340074) b!546255))

(assert (= (and b!546255 res!340069) b!546250))

(assert (= (and b!546250 res!340071) b!546256))

(assert (= (and b!546256 res!340076) b!546246))

(assert (= (and b!546246 res!340070) b!546254))

(declare-fun m!523939 () Bool)

(assert (=> b!546246 m!523939))

(assert (=> b!546246 m!523939))

(declare-fun m!523941 () Bool)

(assert (=> b!546246 m!523941))

(declare-fun m!523943 () Bool)

(assert (=> b!546247 m!523943))

(declare-fun m!523945 () Bool)

(assert (=> b!546251 m!523945))

(declare-fun m!523947 () Bool)

(assert (=> b!546244 m!523947))

(assert (=> b!546249 m!523939))

(assert (=> b!546249 m!523939))

(declare-fun m!523949 () Bool)

(assert (=> b!546249 m!523949))

(assert (=> b!546255 m!523939))

(assert (=> b!546255 m!523939))

(declare-fun m!523951 () Bool)

(assert (=> b!546255 m!523951))

(declare-fun m!523953 () Bool)

(assert (=> b!546245 m!523953))

(assert (=> b!546245 m!523939))

(declare-fun m!523955 () Bool)

(assert (=> b!546250 m!523955))

(assert (=> b!546250 m!523939))

(assert (=> b!546250 m!523939))

(declare-fun m!523957 () Bool)

(assert (=> b!546250 m!523957))

(assert (=> b!546250 m!523957))

(assert (=> b!546250 m!523939))

(declare-fun m!523959 () Bool)

(assert (=> b!546250 m!523959))

(declare-fun m!523961 () Bool)

(assert (=> start!49666 m!523961))

(declare-fun m!523963 () Bool)

(assert (=> start!49666 m!523963))

(declare-fun m!523965 () Bool)

(assert (=> b!546248 m!523965))

(declare-fun m!523967 () Bool)

(assert (=> b!546254 m!523967))

(declare-fun m!523969 () Bool)

(assert (=> b!546254 m!523969))

(declare-fun m!523971 () Bool)

(assert (=> b!546254 m!523971))

(declare-fun m!523973 () Bool)

(assert (=> b!546254 m!523973))

(declare-fun m!523975 () Bool)

(assert (=> b!546254 m!523975))

(declare-fun m!523977 () Bool)

(assert (=> b!546253 m!523977))

(declare-fun m!523979 () Bool)

(assert (=> b!546256 m!523979))

(check-sat (not b!546251) (not b!546244) (not b!546254) (not b!546253) (not b!546256) (not start!49666) (not b!546246) (not b!546247) (not b!546249) (not b!546255) (not b!546248) (not b!546250))
(check-sat)
(get-model)

(declare-fun bm!32133 () Bool)

(declare-fun call!32136 () Bool)

(declare-fun c!63419 () Bool)

(assert (=> bm!32133 (= call!32136 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63419 (Cons!10562 (select (arr!16540 a!3154) #b00000000000000000000000000000000) Nil!10563) Nil!10563)))))

(declare-fun b!546345 () Bool)

(declare-fun e!315786 () Bool)

(assert (=> b!546345 (= e!315786 call!32136)))

(declare-fun d!82365 () Bool)

(declare-fun res!340165 () Bool)

(declare-fun e!315783 () Bool)

(assert (=> d!82365 (=> res!340165 e!315783)))

(assert (=> d!82365 (= res!340165 (bvsge #b00000000000000000000000000000000 (size!16904 a!3154)))))

(assert (=> d!82365 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10563) e!315783)))

(declare-fun b!546346 () Bool)

(declare-fun e!315785 () Bool)

(assert (=> b!546346 (= e!315783 e!315785)))

(declare-fun res!340163 () Bool)

(assert (=> b!546346 (=> (not res!340163) (not e!315785))))

(declare-fun e!315784 () Bool)

(assert (=> b!546346 (= res!340163 (not e!315784))))

(declare-fun res!340164 () Bool)

(assert (=> b!546346 (=> (not res!340164) (not e!315784))))

(assert (=> b!546346 (= res!340164 (validKeyInArray!0 (select (arr!16540 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546347 () Bool)

(assert (=> b!546347 (= e!315786 call!32136)))

(declare-fun b!546348 () Bool)

(assert (=> b!546348 (= e!315785 e!315786)))

(assert (=> b!546348 (= c!63419 (validKeyInArray!0 (select (arr!16540 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!546349 () Bool)

(declare-fun contains!2791 (List!10566 (_ BitVec 64)) Bool)

(assert (=> b!546349 (= e!315784 (contains!2791 Nil!10563 (select (arr!16540 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82365 (not res!340165)) b!546346))

(assert (= (and b!546346 res!340164) b!546349))

(assert (= (and b!546346 res!340163) b!546348))

(assert (= (and b!546348 c!63419) b!546347))

(assert (= (and b!546348 (not c!63419)) b!546345))

(assert (= (or b!546347 b!546345) bm!32133))

(declare-fun m!524065 () Bool)

(assert (=> bm!32133 m!524065))

(declare-fun m!524067 () Bool)

(assert (=> bm!32133 m!524067))

(assert (=> b!546346 m!524065))

(assert (=> b!546346 m!524065))

(declare-fun m!524069 () Bool)

(assert (=> b!546346 m!524069))

(assert (=> b!546348 m!524065))

(assert (=> b!546348 m!524065))

(assert (=> b!546348 m!524069))

(assert (=> b!546349 m!524065))

(assert (=> b!546349 m!524065))

(declare-fun m!524071 () Bool)

(assert (=> b!546349 m!524071))

(assert (=> b!546251 d!82365))

(declare-fun b!546368 () Bool)

(declare-fun e!315801 () Bool)

(declare-fun e!315800 () Bool)

(assert (=> b!546368 (= e!315801 e!315800)))

(declare-fun res!340174 () Bool)

(declare-fun lt!249322 () SeekEntryResult!4954)

(get-info :version)

(assert (=> b!546368 (= res!340174 (and ((_ is Intermediate!4954) lt!249322) (not (undefined!5766 lt!249322)) (bvslt (x!51117 lt!249322) #b01111111111111111111111111111110) (bvsge (x!51117 lt!249322) #b00000000000000000000000000000000) (bvsge (x!51117 lt!249322) #b00000000000000000000000000000000)))))

(assert (=> b!546368 (=> (not res!340174) (not e!315800))))

(declare-fun b!546369 () Bool)

(declare-fun e!315798 () SeekEntryResult!4954)

(assert (=> b!546369 (= e!315798 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546370 () Bool)

(assert (=> b!546370 (and (bvsge (index!22042 lt!249322) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249322) (size!16904 a!3154)))))

(declare-fun res!340173 () Bool)

(assert (=> b!546370 (= res!340173 (= (select (arr!16540 a!3154) (index!22042 lt!249322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315797 () Bool)

(assert (=> b!546370 (=> res!340173 e!315797)))

(declare-fun b!546371 () Bool)

(declare-fun e!315799 () SeekEntryResult!4954)

(assert (=> b!546371 (= e!315799 (Intermediate!4954 true (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546372 () Bool)

(assert (=> b!546372 (= e!315798 (Intermediate!4954 false (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!82367 () Bool)

(assert (=> d!82367 e!315801))

(declare-fun c!63427 () Bool)

(assert (=> d!82367 (= c!63427 (and ((_ is Intermediate!4954) lt!249322) (undefined!5766 lt!249322)))))

(assert (=> d!82367 (= lt!249322 e!315799)))

(declare-fun c!63428 () Bool)

(assert (=> d!82367 (= c!63428 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!249321 () (_ BitVec 64))

(assert (=> d!82367 (= lt!249321 (select (arr!16540 a!3154) (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216)))))

(assert (=> d!82367 (validMask!0 mask!3216)))

(assert (=> d!82367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216) lt!249322)))

(declare-fun b!546373 () Bool)

(assert (=> b!546373 (= e!315801 (bvsge (x!51117 lt!249322) #b01111111111111111111111111111110))))

(declare-fun b!546374 () Bool)

(assert (=> b!546374 (and (bvsge (index!22042 lt!249322) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249322) (size!16904 a!3154)))))

(declare-fun res!340172 () Bool)

(assert (=> b!546374 (= res!340172 (= (select (arr!16540 a!3154) (index!22042 lt!249322)) (select (arr!16540 a!3154) j!147)))))

(assert (=> b!546374 (=> res!340172 e!315797)))

(assert (=> b!546374 (= e!315800 e!315797)))

(declare-fun b!546375 () Bool)

(assert (=> b!546375 (= e!315799 e!315798)))

(declare-fun c!63426 () Bool)

(assert (=> b!546375 (= c!63426 (or (= lt!249321 (select (arr!16540 a!3154) j!147)) (= (bvadd lt!249321 lt!249321) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546376 () Bool)

(assert (=> b!546376 (and (bvsge (index!22042 lt!249322) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249322) (size!16904 a!3154)))))

(assert (=> b!546376 (= e!315797 (= (select (arr!16540 a!3154) (index!22042 lt!249322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82367 c!63428) b!546371))

(assert (= (and d!82367 (not c!63428)) b!546375))

(assert (= (and b!546375 c!63426) b!546372))

(assert (= (and b!546375 (not c!63426)) b!546369))

(assert (= (and d!82367 c!63427) b!546373))

(assert (= (and d!82367 (not c!63427)) b!546368))

(assert (= (and b!546368 res!340174) b!546374))

(assert (= (and b!546374 (not res!340172)) b!546370))

(assert (= (and b!546370 (not res!340173)) b!546376))

(assert (=> b!546369 m!523957))

(declare-fun m!524073 () Bool)

(assert (=> b!546369 m!524073))

(assert (=> b!546369 m!524073))

(assert (=> b!546369 m!523939))

(declare-fun m!524075 () Bool)

(assert (=> b!546369 m!524075))

(declare-fun m!524077 () Bool)

(assert (=> b!546370 m!524077))

(assert (=> b!546376 m!524077))

(assert (=> d!82367 m!523957))

(declare-fun m!524079 () Bool)

(assert (=> d!82367 m!524079))

(assert (=> d!82367 m!523961))

(assert (=> b!546374 m!524077))

(assert (=> b!546250 d!82367))

(declare-fun d!82369 () Bool)

(declare-fun lt!249328 () (_ BitVec 32))

(declare-fun lt!249327 () (_ BitVec 32))

(assert (=> d!82369 (= lt!249328 (bvmul (bvxor lt!249327 (bvlshr lt!249327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82369 (= lt!249327 ((_ extract 31 0) (bvand (bvxor (select (arr!16540 a!3154) j!147) (bvlshr (select (arr!16540 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82369 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!340175 (let ((h!11532 ((_ extract 31 0) (bvand (bvxor (select (arr!16540 a!3154) j!147) (bvlshr (select (arr!16540 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51121 (bvmul (bvxor h!11532 (bvlshr h!11532 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51121 (bvlshr x!51121 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!340175 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!340175 #b00000000000000000000000000000000))))))

(assert (=> d!82369 (= (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) (bvand (bvxor lt!249328 (bvlshr lt!249328 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!546250 d!82369))

(declare-fun b!546377 () Bool)

(declare-fun e!315806 () Bool)

(declare-fun e!315805 () Bool)

(assert (=> b!546377 (= e!315806 e!315805)))

(declare-fun res!340178 () Bool)

(declare-fun lt!249330 () SeekEntryResult!4954)

(assert (=> b!546377 (= res!340178 (and ((_ is Intermediate!4954) lt!249330) (not (undefined!5766 lt!249330)) (bvslt (x!51117 lt!249330) #b01111111111111111111111111111110) (bvsge (x!51117 lt!249330) #b00000000000000000000000000000000) (bvsge (x!51117 lt!249330) x!1030)))))

(assert (=> b!546377 (=> (not res!340178) (not e!315805))))

(declare-fun e!315803 () SeekEntryResult!4954)

(declare-fun b!546378 () Bool)

(assert (=> b!546378 (= e!315803 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) lt!249258 lt!249260 mask!3216))))

(declare-fun b!546379 () Bool)

(assert (=> b!546379 (and (bvsge (index!22042 lt!249330) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249330) (size!16904 lt!249260)))))

(declare-fun res!340177 () Bool)

(assert (=> b!546379 (= res!340177 (= (select (arr!16540 lt!249260) (index!22042 lt!249330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315802 () Bool)

(assert (=> b!546379 (=> res!340177 e!315802)))

(declare-fun b!546380 () Bool)

(declare-fun e!315804 () SeekEntryResult!4954)

(assert (=> b!546380 (= e!315804 (Intermediate!4954 true index!1177 x!1030))))

(declare-fun b!546381 () Bool)

(assert (=> b!546381 (= e!315803 (Intermediate!4954 false index!1177 x!1030))))

(declare-fun d!82371 () Bool)

(assert (=> d!82371 e!315806))

(declare-fun c!63430 () Bool)

(assert (=> d!82371 (= c!63430 (and ((_ is Intermediate!4954) lt!249330) (undefined!5766 lt!249330)))))

(assert (=> d!82371 (= lt!249330 e!315804)))

(declare-fun c!63431 () Bool)

(assert (=> d!82371 (= c!63431 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249329 () (_ BitVec 64))

(assert (=> d!82371 (= lt!249329 (select (arr!16540 lt!249260) index!1177))))

(assert (=> d!82371 (validMask!0 mask!3216)))

(assert (=> d!82371 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!249258 lt!249260 mask!3216) lt!249330)))

(declare-fun b!546382 () Bool)

(assert (=> b!546382 (= e!315806 (bvsge (x!51117 lt!249330) #b01111111111111111111111111111110))))

(declare-fun b!546383 () Bool)

(assert (=> b!546383 (and (bvsge (index!22042 lt!249330) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249330) (size!16904 lt!249260)))))

(declare-fun res!340176 () Bool)

(assert (=> b!546383 (= res!340176 (= (select (arr!16540 lt!249260) (index!22042 lt!249330)) lt!249258))))

(assert (=> b!546383 (=> res!340176 e!315802)))

(assert (=> b!546383 (= e!315805 e!315802)))

(declare-fun b!546384 () Bool)

(assert (=> b!546384 (= e!315804 e!315803)))

(declare-fun c!63429 () Bool)

(assert (=> b!546384 (= c!63429 (or (= lt!249329 lt!249258) (= (bvadd lt!249329 lt!249329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546385 () Bool)

(assert (=> b!546385 (and (bvsge (index!22042 lt!249330) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249330) (size!16904 lt!249260)))))

(assert (=> b!546385 (= e!315802 (= (select (arr!16540 lt!249260) (index!22042 lt!249330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82371 c!63431) b!546380))

(assert (= (and d!82371 (not c!63431)) b!546384))

(assert (= (and b!546384 c!63429) b!546381))

(assert (= (and b!546384 (not c!63429)) b!546378))

(assert (= (and d!82371 c!63430) b!546382))

(assert (= (and d!82371 (not c!63430)) b!546377))

(assert (= (and b!546377 res!340178) b!546383))

(assert (= (and b!546383 (not res!340176)) b!546379))

(assert (= (and b!546379 (not res!340177)) b!546385))

(declare-fun m!524081 () Bool)

(assert (=> b!546378 m!524081))

(assert (=> b!546378 m!524081))

(declare-fun m!524083 () Bool)

(assert (=> b!546378 m!524083))

(declare-fun m!524085 () Bool)

(assert (=> b!546379 m!524085))

(assert (=> b!546385 m!524085))

(declare-fun m!524087 () Bool)

(assert (=> d!82371 m!524087))

(assert (=> d!82371 m!523961))

(assert (=> b!546383 m!524085))

(assert (=> b!546254 d!82371))

(declare-fun b!546386 () Bool)

(declare-fun e!315811 () Bool)

(declare-fun e!315810 () Bool)

(assert (=> b!546386 (= e!315811 e!315810)))

(declare-fun res!340181 () Bool)

(declare-fun lt!249332 () SeekEntryResult!4954)

(assert (=> b!546386 (= res!340181 (and ((_ is Intermediate!4954) lt!249332) (not (undefined!5766 lt!249332)) (bvslt (x!51117 lt!249332) #b01111111111111111111111111111110) (bvsge (x!51117 lt!249332) #b00000000000000000000000000000000) (bvsge (x!51117 lt!249332) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546386 (=> (not res!340181) (not e!315810))))

(declare-fun b!546387 () Bool)

(declare-fun e!315808 () SeekEntryResult!4954)

(assert (=> b!546387 (= e!315808 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249259 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) mask!3216) lt!249258 lt!249260 mask!3216))))

(declare-fun b!546388 () Bool)

(assert (=> b!546388 (and (bvsge (index!22042 lt!249332) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249332) (size!16904 lt!249260)))))

(declare-fun res!340180 () Bool)

(assert (=> b!546388 (= res!340180 (= (select (arr!16540 lt!249260) (index!22042 lt!249332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315807 () Bool)

(assert (=> b!546388 (=> res!340180 e!315807)))

(declare-fun b!546389 () Bool)

(declare-fun e!315809 () SeekEntryResult!4954)

(assert (=> b!546389 (= e!315809 (Intermediate!4954 true lt!249259 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546390 () Bool)

(assert (=> b!546390 (= e!315808 (Intermediate!4954 false lt!249259 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun d!82373 () Bool)

(assert (=> d!82373 e!315811))

(declare-fun c!63433 () Bool)

(assert (=> d!82373 (= c!63433 (and ((_ is Intermediate!4954) lt!249332) (undefined!5766 lt!249332)))))

(assert (=> d!82373 (= lt!249332 e!315809)))

(declare-fun c!63434 () Bool)

(assert (=> d!82373 (= c!63434 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249331 () (_ BitVec 64))

(assert (=> d!82373 (= lt!249331 (select (arr!16540 lt!249260) lt!249259))))

(assert (=> d!82373 (validMask!0 mask!3216)))

(assert (=> d!82373 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249259 lt!249258 lt!249260 mask!3216) lt!249332)))

(declare-fun b!546391 () Bool)

(assert (=> b!546391 (= e!315811 (bvsge (x!51117 lt!249332) #b01111111111111111111111111111110))))

(declare-fun b!546392 () Bool)

(assert (=> b!546392 (and (bvsge (index!22042 lt!249332) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249332) (size!16904 lt!249260)))))

(declare-fun res!340179 () Bool)

(assert (=> b!546392 (= res!340179 (= (select (arr!16540 lt!249260) (index!22042 lt!249332)) lt!249258))))

(assert (=> b!546392 (=> res!340179 e!315807)))

(assert (=> b!546392 (= e!315810 e!315807)))

(declare-fun b!546393 () Bool)

(assert (=> b!546393 (= e!315809 e!315808)))

(declare-fun c!63432 () Bool)

(assert (=> b!546393 (= c!63432 (or (= lt!249331 lt!249258) (= (bvadd lt!249331 lt!249331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546394 () Bool)

(assert (=> b!546394 (and (bvsge (index!22042 lt!249332) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249332) (size!16904 lt!249260)))))

(assert (=> b!546394 (= e!315807 (= (select (arr!16540 lt!249260) (index!22042 lt!249332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82373 c!63434) b!546389))

(assert (= (and d!82373 (not c!63434)) b!546393))

(assert (= (and b!546393 c!63432) b!546390))

(assert (= (and b!546393 (not c!63432)) b!546387))

(assert (= (and d!82373 c!63433) b!546391))

(assert (= (and d!82373 (not c!63433)) b!546386))

(assert (= (and b!546386 res!340181) b!546392))

(assert (= (and b!546392 (not res!340179)) b!546388))

(assert (= (and b!546388 (not res!340180)) b!546394))

(declare-fun m!524089 () Bool)

(assert (=> b!546387 m!524089))

(assert (=> b!546387 m!524089))

(declare-fun m!524091 () Bool)

(assert (=> b!546387 m!524091))

(declare-fun m!524093 () Bool)

(assert (=> b!546388 m!524093))

(assert (=> b!546394 m!524093))

(declare-fun m!524095 () Bool)

(assert (=> d!82373 m!524095))

(assert (=> d!82373 m!523961))

(assert (=> b!546392 m!524093))

(assert (=> b!546254 d!82373))

(declare-fun d!82375 () Bool)

(declare-fun e!315814 () Bool)

(assert (=> d!82375 e!315814))

(declare-fun res!340184 () Bool)

(assert (=> d!82375 (=> (not res!340184) (not e!315814))))

(assert (=> d!82375 (= res!340184 (and (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16904 a!3154)) (and (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16904 a!3154)))) (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16904 a!3154)) (and (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16904 a!3154)))) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16904 a!3154))))))

(declare-fun lt!249335 () Unit!16917)

(declare-fun choose!47 (array!34427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16917)

(assert (=> d!82375 (= lt!249335 (choose!47 a!3154 i!1153 k0!1998 j!147 lt!249259 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (=> d!82375 (validMask!0 mask!3216)))

(assert (=> d!82375 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249259 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216) lt!249335)))

(declare-fun b!546397 () Bool)

(assert (=> b!546397 (= e!315814 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249259 (select (store (arr!16540 a!3154) i!1153 k0!1998) j!147) (array!34428 (store (arr!16540 a!3154) i!1153 k0!1998) (size!16904 a!3154)) mask!3216) (Intermediate!4954 false resIndex!32 resX!32)))))

(assert (= (and d!82375 res!340184) b!546397))

(declare-fun m!524097 () Bool)

(assert (=> d!82375 m!524097))

(assert (=> d!82375 m!523961))

(assert (=> b!546397 m!523973))

(assert (=> b!546397 m!523967))

(assert (=> b!546397 m!523967))

(declare-fun m!524099 () Bool)

(assert (=> b!546397 m!524099))

(assert (=> b!546254 d!82375))

(declare-fun bm!32136 () Bool)

(declare-fun call!32139 () Bool)

(assert (=> bm!32136 (= call!32139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!546412 () Bool)

(declare-fun e!315829 () Bool)

(declare-fun e!315827 () Bool)

(assert (=> b!546412 (= e!315829 e!315827)))

(declare-fun c!63437 () Bool)

(assert (=> b!546412 (= c!63437 (validKeyInArray!0 (select (arr!16540 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82377 () Bool)

(declare-fun res!340195 () Bool)

(assert (=> d!82377 (=> res!340195 e!315829)))

(assert (=> d!82377 (= res!340195 (bvsge #b00000000000000000000000000000000 (size!16904 a!3154)))))

(assert (=> d!82377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315829)))

(declare-fun b!546413 () Bool)

(declare-fun e!315828 () Bool)

(assert (=> b!546413 (= e!315827 e!315828)))

(declare-fun lt!249343 () (_ BitVec 64))

(assert (=> b!546413 (= lt!249343 (select (arr!16540 a!3154) #b00000000000000000000000000000000))))

(declare-fun lt!249344 () Unit!16917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34427 (_ BitVec 64) (_ BitVec 32)) Unit!16917)

(assert (=> b!546413 (= lt!249344 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!249343 #b00000000000000000000000000000000))))

(assert (=> b!546413 (arrayContainsKey!0 a!3154 lt!249343 #b00000000000000000000000000000000)))

(declare-fun lt!249342 () Unit!16917)

(assert (=> b!546413 (= lt!249342 lt!249344)))

(declare-fun res!340196 () Bool)

(assert (=> b!546413 (= res!340196 (= (seekEntryOrOpen!0 (select (arr!16540 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4954 #b00000000000000000000000000000000)))))

(assert (=> b!546413 (=> (not res!340196) (not e!315828))))

(declare-fun b!546414 () Bool)

(assert (=> b!546414 (= e!315828 call!32139)))

(declare-fun b!546415 () Bool)

(assert (=> b!546415 (= e!315827 call!32139)))

(assert (= (and d!82377 (not res!340195)) b!546412))

(assert (= (and b!546412 c!63437) b!546413))

(assert (= (and b!546412 (not c!63437)) b!546415))

(assert (= (and b!546413 res!340196) b!546414))

(assert (= (or b!546414 b!546415) bm!32136))

(declare-fun m!524105 () Bool)

(assert (=> bm!32136 m!524105))

(assert (=> b!546412 m!524065))

(assert (=> b!546412 m!524065))

(assert (=> b!546412 m!524069))

(assert (=> b!546413 m!524065))

(declare-fun m!524107 () Bool)

(assert (=> b!546413 m!524107))

(declare-fun m!524109 () Bool)

(assert (=> b!546413 m!524109))

(assert (=> b!546413 m!524065))

(declare-fun m!524111 () Bool)

(assert (=> b!546413 m!524111))

(assert (=> b!546244 d!82377))

(declare-fun d!82385 () Bool)

(declare-fun res!340201 () Bool)

(declare-fun e!315834 () Bool)

(assert (=> d!82385 (=> res!340201 e!315834)))

(assert (=> d!82385 (= res!340201 (= (select (arr!16540 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82385 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315834)))

(declare-fun b!546420 () Bool)

(declare-fun e!315835 () Bool)

(assert (=> b!546420 (= e!315834 e!315835)))

(declare-fun res!340202 () Bool)

(assert (=> b!546420 (=> (not res!340202) (not e!315835))))

(assert (=> b!546420 (= res!340202 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16904 a!3154)))))

(declare-fun b!546421 () Bool)

(assert (=> b!546421 (= e!315835 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82385 (not res!340201)) b!546420))

(assert (= (and b!546420 res!340202) b!546421))

(assert (=> d!82385 m!524065))

(declare-fun m!524113 () Bool)

(assert (=> b!546421 m!524113))

(assert (=> b!546253 d!82385))

(declare-fun b!546422 () Bool)

(declare-fun e!315840 () Bool)

(declare-fun e!315839 () Bool)

(assert (=> b!546422 (= e!315840 e!315839)))

(declare-fun res!340205 () Bool)

(declare-fun lt!249346 () SeekEntryResult!4954)

(assert (=> b!546422 (= res!340205 (and ((_ is Intermediate!4954) lt!249346) (not (undefined!5766 lt!249346)) (bvslt (x!51117 lt!249346) #b01111111111111111111111111111110) (bvsge (x!51117 lt!249346) #b00000000000000000000000000000000) (bvsge (x!51117 lt!249346) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546422 (=> (not res!340205) (not e!315839))))

(declare-fun b!546423 () Bool)

(declare-fun e!315837 () SeekEntryResult!4954)

(assert (=> b!546423 (= e!315837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!249259 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546424 () Bool)

(assert (=> b!546424 (and (bvsge (index!22042 lt!249346) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249346) (size!16904 a!3154)))))

(declare-fun res!340204 () Bool)

(assert (=> b!546424 (= res!340204 (= (select (arr!16540 a!3154) (index!22042 lt!249346)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315836 () Bool)

(assert (=> b!546424 (=> res!340204 e!315836)))

(declare-fun b!546425 () Bool)

(declare-fun e!315838 () SeekEntryResult!4954)

(assert (=> b!546425 (= e!315838 (Intermediate!4954 true lt!249259 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546426 () Bool)

(assert (=> b!546426 (= e!315837 (Intermediate!4954 false lt!249259 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun d!82387 () Bool)

(assert (=> d!82387 e!315840))

(declare-fun c!63439 () Bool)

(assert (=> d!82387 (= c!63439 (and ((_ is Intermediate!4954) lt!249346) (undefined!5766 lt!249346)))))

(assert (=> d!82387 (= lt!249346 e!315838)))

(declare-fun c!63440 () Bool)

(assert (=> d!82387 (= c!63440 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(declare-fun lt!249345 () (_ BitVec 64))

(assert (=> d!82387 (= lt!249345 (select (arr!16540 a!3154) lt!249259))))

(assert (=> d!82387 (validMask!0 mask!3216)))

(assert (=> d!82387 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249259 (select (arr!16540 a!3154) j!147) a!3154 mask!3216) lt!249346)))

(declare-fun b!546427 () Bool)

(assert (=> b!546427 (= e!315840 (bvsge (x!51117 lt!249346) #b01111111111111111111111111111110))))

(declare-fun b!546428 () Bool)

(assert (=> b!546428 (and (bvsge (index!22042 lt!249346) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249346) (size!16904 a!3154)))))

(declare-fun res!340203 () Bool)

(assert (=> b!546428 (= res!340203 (= (select (arr!16540 a!3154) (index!22042 lt!249346)) (select (arr!16540 a!3154) j!147)))))

(assert (=> b!546428 (=> res!340203 e!315836)))

(assert (=> b!546428 (= e!315839 e!315836)))

(declare-fun b!546429 () Bool)

(assert (=> b!546429 (= e!315838 e!315837)))

(declare-fun c!63438 () Bool)

(assert (=> b!546429 (= c!63438 (or (= lt!249345 (select (arr!16540 a!3154) j!147)) (= (bvadd lt!249345 lt!249345) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546430 () Bool)

(assert (=> b!546430 (and (bvsge (index!22042 lt!249346) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249346) (size!16904 a!3154)))))

(assert (=> b!546430 (= e!315836 (= (select (arr!16540 a!3154) (index!22042 lt!249346)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82387 c!63440) b!546425))

(assert (= (and d!82387 (not c!63440)) b!546429))

(assert (= (and b!546429 c!63438) b!546426))

(assert (= (and b!546429 (not c!63438)) b!546423))

(assert (= (and d!82387 c!63439) b!546427))

(assert (= (and d!82387 (not c!63439)) b!546422))

(assert (= (and b!546422 res!340205) b!546428))

(assert (= (and b!546428 (not res!340203)) b!546424))

(assert (= (and b!546424 (not res!340204)) b!546430))

(assert (=> b!546423 m!524089))

(assert (=> b!546423 m!524089))

(assert (=> b!546423 m!523939))

(declare-fun m!524115 () Bool)

(assert (=> b!546423 m!524115))

(declare-fun m!524117 () Bool)

(assert (=> b!546424 m!524117))

(assert (=> b!546430 m!524117))

(declare-fun m!524119 () Bool)

(assert (=> d!82387 m!524119))

(assert (=> d!82387 m!523961))

(assert (=> b!546428 m!524117))

(assert (=> b!546246 d!82387))

(declare-fun b!546439 () Bool)

(declare-fun e!315849 () Bool)

(declare-fun e!315848 () Bool)

(assert (=> b!546439 (= e!315849 e!315848)))

(declare-fun res!340208 () Bool)

(declare-fun lt!249352 () SeekEntryResult!4954)

(assert (=> b!546439 (= res!340208 (and ((_ is Intermediate!4954) lt!249352) (not (undefined!5766 lt!249352)) (bvslt (x!51117 lt!249352) #b01111111111111111111111111111110) (bvsge (x!51117 lt!249352) #b00000000000000000000000000000000) (bvsge (x!51117 lt!249352) x!1030)))))

(assert (=> b!546439 (=> (not res!340208) (not e!315848))))

(declare-fun b!546440 () Bool)

(declare-fun e!315846 () SeekEntryResult!4954)

(assert (=> b!546440 (= e!315846 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546441 () Bool)

(assert (=> b!546441 (and (bvsge (index!22042 lt!249352) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249352) (size!16904 a!3154)))))

(declare-fun res!340207 () Bool)

(assert (=> b!546441 (= res!340207 (= (select (arr!16540 a!3154) (index!22042 lt!249352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315845 () Bool)

(assert (=> b!546441 (=> res!340207 e!315845)))

(declare-fun b!546442 () Bool)

(declare-fun e!315847 () SeekEntryResult!4954)

(assert (=> b!546442 (= e!315847 (Intermediate!4954 true index!1177 x!1030))))

(declare-fun b!546443 () Bool)

(assert (=> b!546443 (= e!315846 (Intermediate!4954 false index!1177 x!1030))))

(declare-fun d!82389 () Bool)

(assert (=> d!82389 e!315849))

(declare-fun c!63446 () Bool)

(assert (=> d!82389 (= c!63446 (and ((_ is Intermediate!4954) lt!249352) (undefined!5766 lt!249352)))))

(assert (=> d!82389 (= lt!249352 e!315847)))

(declare-fun c!63447 () Bool)

(assert (=> d!82389 (= c!63447 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!249351 () (_ BitVec 64))

(assert (=> d!82389 (= lt!249351 (select (arr!16540 a!3154) index!1177))))

(assert (=> d!82389 (validMask!0 mask!3216)))

(assert (=> d!82389 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16540 a!3154) j!147) a!3154 mask!3216) lt!249352)))

(declare-fun b!546444 () Bool)

(assert (=> b!546444 (= e!315849 (bvsge (x!51117 lt!249352) #b01111111111111111111111111111110))))

(declare-fun b!546445 () Bool)

(assert (=> b!546445 (and (bvsge (index!22042 lt!249352) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249352) (size!16904 a!3154)))))

(declare-fun res!340206 () Bool)

(assert (=> b!546445 (= res!340206 (= (select (arr!16540 a!3154) (index!22042 lt!249352)) (select (arr!16540 a!3154) j!147)))))

(assert (=> b!546445 (=> res!340206 e!315845)))

(assert (=> b!546445 (= e!315848 e!315845)))

(declare-fun b!546446 () Bool)

(assert (=> b!546446 (= e!315847 e!315846)))

(declare-fun c!63445 () Bool)

(assert (=> b!546446 (= c!63445 (or (= lt!249351 (select (arr!16540 a!3154) j!147)) (= (bvadd lt!249351 lt!249351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546447 () Bool)

(assert (=> b!546447 (and (bvsge (index!22042 lt!249352) #b00000000000000000000000000000000) (bvslt (index!22042 lt!249352) (size!16904 a!3154)))))

(assert (=> b!546447 (= e!315845 (= (select (arr!16540 a!3154) (index!22042 lt!249352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82389 c!63447) b!546442))

(assert (= (and d!82389 (not c!63447)) b!546446))

(assert (= (and b!546446 c!63445) b!546443))

(assert (= (and b!546446 (not c!63445)) b!546440))

(assert (= (and d!82389 c!63446) b!546444))

(assert (= (and d!82389 (not c!63446)) b!546439))

(assert (= (and b!546439 res!340208) b!546445))

(assert (= (and b!546445 (not res!340206)) b!546441))

(assert (= (and b!546441 (not res!340207)) b!546447))

(assert (=> b!546440 m!524081))

(assert (=> b!546440 m!524081))

(assert (=> b!546440 m!523939))

(declare-fun m!524121 () Bool)

(assert (=> b!546440 m!524121))

(declare-fun m!524123 () Bool)

(assert (=> b!546441 m!524123))

(assert (=> b!546447 m!524123))

(assert (=> d!82389 m!523955))

(assert (=> d!82389 m!523961))

(assert (=> b!546445 m!524123))

(assert (=> b!546255 d!82389))

(declare-fun d!82393 () Bool)

(declare-fun lt!249357 () (_ BitVec 32))

(assert (=> d!82393 (and (bvsge lt!249357 #b00000000000000000000000000000000) (bvslt lt!249357 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82393 (= lt!249357 (choose!52 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (=> d!82393 (validMask!0 mask!3216)))

(assert (=> d!82393 (= (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!249357)))

(declare-fun bs!17042 () Bool)

(assert (= bs!17042 d!82393))

(declare-fun m!524125 () Bool)

(assert (=> bs!17042 m!524125))

(assert (=> bs!17042 m!523961))

(assert (=> b!546256 d!82393))

(declare-fun d!82397 () Bool)

(assert (=> d!82397 (= (validKeyInArray!0 (select (arr!16540 a!3154) j!147)) (and (not (= (select (arr!16540 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16540 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546249 d!82397))

(declare-fun d!82401 () Bool)

(declare-fun lt!249393 () SeekEntryResult!4954)

(assert (=> d!82401 (and (or ((_ is Undefined!4954) lt!249393) (not ((_ is Found!4954) lt!249393)) (and (bvsge (index!22041 lt!249393) #b00000000000000000000000000000000) (bvslt (index!22041 lt!249393) (size!16904 a!3154)))) (or ((_ is Undefined!4954) lt!249393) ((_ is Found!4954) lt!249393) (not ((_ is MissingZero!4954) lt!249393)) (and (bvsge (index!22040 lt!249393) #b00000000000000000000000000000000) (bvslt (index!22040 lt!249393) (size!16904 a!3154)))) (or ((_ is Undefined!4954) lt!249393) ((_ is Found!4954) lt!249393) ((_ is MissingZero!4954) lt!249393) (not ((_ is MissingVacant!4954) lt!249393)) (and (bvsge (index!22043 lt!249393) #b00000000000000000000000000000000) (bvslt (index!22043 lt!249393) (size!16904 a!3154)))) (or ((_ is Undefined!4954) lt!249393) (ite ((_ is Found!4954) lt!249393) (= (select (arr!16540 a!3154) (index!22041 lt!249393)) k0!1998) (ite ((_ is MissingZero!4954) lt!249393) (= (select (arr!16540 a!3154) (index!22040 lt!249393)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4954) lt!249393) (= (select (arr!16540 a!3154) (index!22043 lt!249393)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315906 () SeekEntryResult!4954)

(assert (=> d!82401 (= lt!249393 e!315906)))

(declare-fun c!63474 () Bool)

(declare-fun lt!249392 () SeekEntryResult!4954)

(assert (=> d!82401 (= c!63474 (and ((_ is Intermediate!4954) lt!249392) (undefined!5766 lt!249392)))))

(assert (=> d!82401 (= lt!249392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82401 (validMask!0 mask!3216)))

(assert (=> d!82401 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!249393)))

(declare-fun b!546536 () Bool)

(declare-fun e!315908 () SeekEntryResult!4954)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34427 (_ BitVec 32)) SeekEntryResult!4954)

(assert (=> b!546536 (= e!315908 (seekKeyOrZeroReturnVacant!0 (x!51117 lt!249392) (index!22042 lt!249392) (index!22042 lt!249392) k0!1998 a!3154 mask!3216))))

(declare-fun b!546537 () Bool)

(declare-fun e!315907 () SeekEntryResult!4954)

(assert (=> b!546537 (= e!315906 e!315907)))

(declare-fun lt!249391 () (_ BitVec 64))

(assert (=> b!546537 (= lt!249391 (select (arr!16540 a!3154) (index!22042 lt!249392)))))

(declare-fun c!63475 () Bool)

(assert (=> b!546537 (= c!63475 (= lt!249391 k0!1998))))

(declare-fun b!546538 () Bool)

(assert (=> b!546538 (= e!315907 (Found!4954 (index!22042 lt!249392)))))

(declare-fun b!546539 () Bool)

(assert (=> b!546539 (= e!315908 (MissingZero!4954 (index!22042 lt!249392)))))

(declare-fun b!546540 () Bool)

(declare-fun c!63476 () Bool)

(assert (=> b!546540 (= c!63476 (= lt!249391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546540 (= e!315907 e!315908)))

(declare-fun b!546541 () Bool)

(assert (=> b!546541 (= e!315906 Undefined!4954)))

(assert (= (and d!82401 c!63474) b!546541))

(assert (= (and d!82401 (not c!63474)) b!546537))

(assert (= (and b!546537 c!63475) b!546538))

(assert (= (and b!546537 (not c!63475)) b!546540))

(assert (= (and b!546540 c!63476) b!546539))

(assert (= (and b!546540 (not c!63476)) b!546536))

(declare-fun m!524181 () Bool)

(assert (=> d!82401 m!524181))

(declare-fun m!524183 () Bool)

(assert (=> d!82401 m!524183))

(declare-fun m!524185 () Bool)

(assert (=> d!82401 m!524185))

(assert (=> d!82401 m!523961))

(declare-fun m!524187 () Bool)

(assert (=> d!82401 m!524187))

(assert (=> d!82401 m!524181))

(declare-fun m!524189 () Bool)

(assert (=> d!82401 m!524189))

(declare-fun m!524191 () Bool)

(assert (=> b!546536 m!524191))

(declare-fun m!524193 () Bool)

(assert (=> b!546537 m!524193))

(assert (=> b!546247 d!82401))

(declare-fun d!82421 () Bool)

(assert (=> d!82421 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!546248 d!82421))

(declare-fun d!82423 () Bool)

(assert (=> d!82423 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49666 d!82423))

(declare-fun d!82443 () Bool)

(assert (=> d!82443 (= (array_inv!12399 a!3154) (bvsge (size!16904 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49666 d!82443))

(check-sat (not bm!32133) (not b!546346) (not d!82373) (not b!546412) (not b!546378) (not d!82387) (not b!546387) (not bm!32136) (not d!82393) (not b!546369) (not b!546348) (not b!546413) (not b!546423) (not b!546536) (not d!82389) (not b!546440) (not d!82371) (not b!546397) (not d!82375) (not d!82367) (not b!546421) (not b!546349) (not d!82401))
(check-sat)
