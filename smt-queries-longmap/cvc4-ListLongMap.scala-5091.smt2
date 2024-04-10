; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69108 () Bool)

(assert start!69108)

(declare-fun b!806143 () Bool)

(declare-fun res!550465 () Bool)

(declare-fun e!446415 () Bool)

(assert (=> b!806143 (=> (not res!550465) (not e!446415))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806143 (= res!550465 (validKeyInArray!0 k!2044))))

(declare-fun b!806144 () Bool)

(declare-fun e!446417 () Bool)

(declare-fun e!446414 () Bool)

(assert (=> b!806144 (= e!446417 e!446414)))

(declare-fun res!550471 () Bool)

(assert (=> b!806144 (=> (not res!550471) (not e!446414))))

(declare-datatypes ((SeekEntryResult!8596 0))(
  ( (MissingZero!8596 (index!36752 (_ BitVec 32))) (Found!8596 (index!36753 (_ BitVec 32))) (Intermediate!8596 (undefined!9408 Bool) (index!36754 (_ BitVec 32)) (x!67565 (_ BitVec 32))) (Undefined!8596) (MissingVacant!8596 (index!36755 (_ BitVec 32))) )
))
(declare-fun lt!361024 () SeekEntryResult!8596)

(declare-fun lt!361020 () SeekEntryResult!8596)

(declare-datatypes ((array!43853 0))(
  ( (array!43854 (arr!21005 (Array (_ BitVec 32) (_ BitVec 64))) (size!21426 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43853)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806144 (= res!550471 (and (= lt!361024 lt!361020) (= (select (arr!21005 a!3170) index!1236) (select (arr!21005 a!3170) j!153))))))

(assert (=> b!806144 (= lt!361020 (Found!8596 j!153))))

(declare-fun b!806145 () Bool)

(declare-fun res!550475 () Bool)

(declare-fun e!446416 () Bool)

(assert (=> b!806145 (=> (not res!550475) (not e!446416))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43853 (_ BitVec 32)) Bool)

(assert (=> b!806145 (= res!550475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806146 () Bool)

(declare-fun e!446412 () Bool)

(assert (=> b!806146 (= e!446416 e!446412)))

(declare-fun res!550466 () Bool)

(assert (=> b!806146 (=> (not res!550466) (not e!446412))))

(declare-fun lt!361023 () SeekEntryResult!8596)

(declare-fun lt!361018 () SeekEntryResult!8596)

(assert (=> b!806146 (= res!550466 (= lt!361023 lt!361018))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361021 () array!43853)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361025 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43853 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!806146 (= lt!361018 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361025 lt!361021 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43853 (_ BitVec 32)) SeekEntryResult!8596)

(assert (=> b!806146 (= lt!361023 (seekEntryOrOpen!0 lt!361025 lt!361021 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806146 (= lt!361025 (select (store (arr!21005 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806146 (= lt!361021 (array!43854 (store (arr!21005 a!3170) i!1163 k!2044) (size!21426 a!3170)))))

(declare-fun b!806147 () Bool)

(assert (=> b!806147 (= e!446415 e!446416)))

(declare-fun res!550470 () Bool)

(assert (=> b!806147 (=> (not res!550470) (not e!446416))))

(declare-fun lt!361019 () SeekEntryResult!8596)

(assert (=> b!806147 (= res!550470 (or (= lt!361019 (MissingZero!8596 i!1163)) (= lt!361019 (MissingVacant!8596 i!1163))))))

(assert (=> b!806147 (= lt!361019 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806148 () Bool)

(declare-fun res!550469 () Bool)

(assert (=> b!806148 (=> (not res!550469) (not e!446416))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806148 (= res!550469 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21426 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21005 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21426 a!3170)) (= (select (arr!21005 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806149 () Bool)

(declare-fun res!550472 () Bool)

(assert (=> b!806149 (=> (not res!550472) (not e!446415))))

(assert (=> b!806149 (= res!550472 (validKeyInArray!0 (select (arr!21005 a!3170) j!153)))))

(declare-fun b!806150 () Bool)

(assert (=> b!806150 (= e!446414 (not (= lt!361018 lt!361020)))))

(assert (=> b!806150 (= lt!361018 (Found!8596 index!1236))))

(declare-fun b!806151 () Bool)

(declare-fun res!550468 () Bool)

(assert (=> b!806151 (=> (not res!550468) (not e!446415))))

(assert (=> b!806151 (= res!550468 (and (= (size!21426 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21426 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21426 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806152 () Bool)

(declare-fun res!550467 () Bool)

(assert (=> b!806152 (=> (not res!550467) (not e!446416))))

(declare-datatypes ((List!14968 0))(
  ( (Nil!14965) (Cons!14964 (h!16093 (_ BitVec 64)) (t!21283 List!14968)) )
))
(declare-fun arrayNoDuplicates!0 (array!43853 (_ BitVec 32) List!14968) Bool)

(assert (=> b!806152 (= res!550467 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14965))))

(declare-fun res!550474 () Bool)

(assert (=> start!69108 (=> (not res!550474) (not e!446415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69108 (= res!550474 (validMask!0 mask!3266))))

(assert (=> start!69108 e!446415))

(assert (=> start!69108 true))

(declare-fun array_inv!16801 (array!43853) Bool)

(assert (=> start!69108 (array_inv!16801 a!3170)))

(declare-fun b!806153 () Bool)

(assert (=> b!806153 (= e!446412 e!446417)))

(declare-fun res!550473 () Bool)

(assert (=> b!806153 (=> (not res!550473) (not e!446417))))

(declare-fun lt!361022 () SeekEntryResult!8596)

(assert (=> b!806153 (= res!550473 (= lt!361022 lt!361024))))

(assert (=> b!806153 (= lt!361024 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806153 (= lt!361022 (seekEntryOrOpen!0 (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806154 () Bool)

(declare-fun res!550464 () Bool)

(assert (=> b!806154 (=> (not res!550464) (not e!446415))))

(declare-fun arrayContainsKey!0 (array!43853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806154 (= res!550464 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69108 res!550474) b!806151))

(assert (= (and b!806151 res!550468) b!806149))

(assert (= (and b!806149 res!550472) b!806143))

(assert (= (and b!806143 res!550465) b!806154))

(assert (= (and b!806154 res!550464) b!806147))

(assert (= (and b!806147 res!550470) b!806145))

(assert (= (and b!806145 res!550475) b!806152))

(assert (= (and b!806152 res!550467) b!806148))

(assert (= (and b!806148 res!550469) b!806146))

(assert (= (and b!806146 res!550466) b!806153))

(assert (= (and b!806153 res!550473) b!806144))

(assert (= (and b!806144 res!550471) b!806150))

(declare-fun m!748097 () Bool)

(assert (=> b!806154 m!748097))

(declare-fun m!748099 () Bool)

(assert (=> b!806152 m!748099))

(declare-fun m!748101 () Bool)

(assert (=> b!806153 m!748101))

(assert (=> b!806153 m!748101))

(declare-fun m!748103 () Bool)

(assert (=> b!806153 m!748103))

(assert (=> b!806153 m!748101))

(declare-fun m!748105 () Bool)

(assert (=> b!806153 m!748105))

(declare-fun m!748107 () Bool)

(assert (=> b!806144 m!748107))

(assert (=> b!806144 m!748101))

(declare-fun m!748109 () Bool)

(assert (=> start!69108 m!748109))

(declare-fun m!748111 () Bool)

(assert (=> start!69108 m!748111))

(assert (=> b!806149 m!748101))

(assert (=> b!806149 m!748101))

(declare-fun m!748113 () Bool)

(assert (=> b!806149 m!748113))

(declare-fun m!748115 () Bool)

(assert (=> b!806143 m!748115))

(declare-fun m!748117 () Bool)

(assert (=> b!806145 m!748117))

(declare-fun m!748119 () Bool)

(assert (=> b!806146 m!748119))

(declare-fun m!748121 () Bool)

(assert (=> b!806146 m!748121))

(declare-fun m!748123 () Bool)

(assert (=> b!806146 m!748123))

(declare-fun m!748125 () Bool)

(assert (=> b!806146 m!748125))

(declare-fun m!748127 () Bool)

(assert (=> b!806147 m!748127))

(declare-fun m!748129 () Bool)

(assert (=> b!806148 m!748129))

(declare-fun m!748131 () Bool)

(assert (=> b!806148 m!748131))

(push 1)

(assert (not b!806153))

(assert (not b!806146))

(assert (not start!69108))

(assert (not b!806147))

(assert (not b!806152))

(assert (not b!806154))

(assert (not b!806145))

(assert (not b!806149))

(assert (not b!806143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!806197 () Bool)

(declare-fun e!446443 () SeekEntryResult!8596)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806197 (= e!446443 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806198 () Bool)

(declare-fun e!446442 () SeekEntryResult!8596)

(declare-fun e!446444 () SeekEntryResult!8596)

(assert (=> b!806198 (= e!446442 e!446444)))

(declare-fun c!88269 () Bool)

(declare-fun lt!361049 () (_ BitVec 64))

(assert (=> b!806198 (= c!88269 (= lt!361049 (select (arr!21005 a!3170) j!153)))))

(declare-fun lt!361048 () SeekEntryResult!8596)

(declare-fun d!103639 () Bool)

(assert (=> d!103639 (and (or (is-Undefined!8596 lt!361048) (not (is-Found!8596 lt!361048)) (and (bvsge (index!36753 lt!361048) #b00000000000000000000000000000000) (bvslt (index!36753 lt!361048) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361048) (is-Found!8596 lt!361048) (not (is-MissingVacant!8596 lt!361048)) (not (= (index!36755 lt!361048) vacantBefore!23)) (and (bvsge (index!36755 lt!361048) #b00000000000000000000000000000000) (bvslt (index!36755 lt!361048) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361048) (ite (is-Found!8596 lt!361048) (= (select (arr!21005 a!3170) (index!36753 lt!361048)) (select (arr!21005 a!3170) j!153)) (and (is-MissingVacant!8596 lt!361048) (= (index!36755 lt!361048) vacantBefore!23) (= (select (arr!21005 a!3170) (index!36755 lt!361048)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103639 (= lt!361048 e!446442)))

(declare-fun c!88270 () Bool)

(assert (=> d!103639 (= c!88270 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103639 (= lt!361049 (select (arr!21005 a!3170) index!1236))))

(assert (=> d!103639 (validMask!0 mask!3266)))

(assert (=> d!103639 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21005 a!3170) j!153) a!3170 mask!3266) lt!361048)))

(declare-fun b!806199 () Bool)

(declare-fun c!88268 () Bool)

(assert (=> b!806199 (= c!88268 (= lt!361049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806199 (= e!446444 e!446443)))

(declare-fun b!806200 () Bool)

(assert (=> b!806200 (= e!446443 (MissingVacant!8596 vacantBefore!23))))

(declare-fun b!806201 () Bool)

(assert (=> b!806201 (= e!446444 (Found!8596 index!1236))))

(declare-fun b!806202 () Bool)

(assert (=> b!806202 (= e!446442 Undefined!8596)))

(assert (= (and d!103639 c!88270) b!806202))

(assert (= (and d!103639 (not c!88270)) b!806198))

(assert (= (and b!806198 c!88269) b!806201))

(assert (= (and b!806198 (not c!88269)) b!806199))

(assert (= (and b!806199 c!88268) b!806200))

(assert (= (and b!806199 (not c!88268)) b!806197))

(declare-fun m!748159 () Bool)

(assert (=> b!806197 m!748159))

(assert (=> b!806197 m!748159))

(assert (=> b!806197 m!748101))

(declare-fun m!748161 () Bool)

(assert (=> b!806197 m!748161))

(declare-fun m!748163 () Bool)

(assert (=> d!103639 m!748163))

(declare-fun m!748165 () Bool)

(assert (=> d!103639 m!748165))

(assert (=> d!103639 m!748107))

(assert (=> d!103639 m!748109))

(assert (=> b!806153 d!103639))

(declare-fun b!806257 () Bool)

(declare-fun e!446476 () SeekEntryResult!8596)

(declare-fun e!446475 () SeekEntryResult!8596)

(assert (=> b!806257 (= e!446476 e!446475)))

(declare-fun lt!361077 () (_ BitVec 64))

(declare-fun lt!361076 () SeekEntryResult!8596)

(assert (=> b!806257 (= lt!361077 (select (arr!21005 a!3170) (index!36754 lt!361076)))))

(declare-fun c!88296 () Bool)

(assert (=> b!806257 (= c!88296 (= lt!361077 (select (arr!21005 a!3170) j!153)))))

(declare-fun b!806258 () Bool)

(assert (=> b!806258 (= e!446476 Undefined!8596)))

(declare-fun b!806259 () Bool)

(declare-fun e!446477 () SeekEntryResult!8596)

(assert (=> b!806259 (= e!446477 (MissingZero!8596 (index!36754 lt!361076)))))

(declare-fun d!103649 () Bool)

(declare-fun lt!361075 () SeekEntryResult!8596)

(assert (=> d!103649 (and (or (is-Undefined!8596 lt!361075) (not (is-Found!8596 lt!361075)) (and (bvsge (index!36753 lt!361075) #b00000000000000000000000000000000) (bvslt (index!36753 lt!361075) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361075) (is-Found!8596 lt!361075) (not (is-MissingZero!8596 lt!361075)) (and (bvsge (index!36752 lt!361075) #b00000000000000000000000000000000) (bvslt (index!36752 lt!361075) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361075) (is-Found!8596 lt!361075) (is-MissingZero!8596 lt!361075) (not (is-MissingVacant!8596 lt!361075)) (and (bvsge (index!36755 lt!361075) #b00000000000000000000000000000000) (bvslt (index!36755 lt!361075) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361075) (ite (is-Found!8596 lt!361075) (= (select (arr!21005 a!3170) (index!36753 lt!361075)) (select (arr!21005 a!3170) j!153)) (ite (is-MissingZero!8596 lt!361075) (= (select (arr!21005 a!3170) (index!36752 lt!361075)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8596 lt!361075) (= (select (arr!21005 a!3170) (index!36755 lt!361075)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103649 (= lt!361075 e!446476)))

(declare-fun c!88297 () Bool)

(assert (=> d!103649 (= c!88297 (and (is-Intermediate!8596 lt!361076) (undefined!9408 lt!361076)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43853 (_ BitVec 32)) SeekEntryResult!8596)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103649 (= lt!361076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21005 a!3170) j!153) mask!3266) (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103649 (validMask!0 mask!3266)))

(assert (=> d!103649 (= (seekEntryOrOpen!0 (select (arr!21005 a!3170) j!153) a!3170 mask!3266) lt!361075)))

(declare-fun b!806260 () Bool)

(assert (=> b!806260 (= e!446475 (Found!8596 (index!36754 lt!361076)))))

(declare-fun b!806261 () Bool)

(declare-fun c!88295 () Bool)

(assert (=> b!806261 (= c!88295 (= lt!361077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806261 (= e!446475 e!446477)))

(declare-fun b!806262 () Bool)

(assert (=> b!806262 (= e!446477 (seekKeyOrZeroReturnVacant!0 (x!67565 lt!361076) (index!36754 lt!361076) (index!36754 lt!361076) (select (arr!21005 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103649 c!88297) b!806258))

(assert (= (and d!103649 (not c!88297)) b!806257))

(assert (= (and b!806257 c!88296) b!806260))

(assert (= (and b!806257 (not c!88296)) b!806261))

(assert (= (and b!806261 c!88295) b!806259))

(assert (= (and b!806261 (not c!88295)) b!806262))

(declare-fun m!748189 () Bool)

(assert (=> b!806257 m!748189))

(declare-fun m!748191 () Bool)

(assert (=> d!103649 m!748191))

(declare-fun m!748193 () Bool)

(assert (=> d!103649 m!748193))

(assert (=> d!103649 m!748109))

(declare-fun m!748195 () Bool)

(assert (=> d!103649 m!748195))

(assert (=> d!103649 m!748101))

(declare-fun m!748197 () Bool)

(assert (=> d!103649 m!748197))

(assert (=> d!103649 m!748197))

(assert (=> d!103649 m!748101))

(declare-fun m!748199 () Bool)

(assert (=> d!103649 m!748199))

(assert (=> b!806262 m!748101))

(declare-fun m!748201 () Bool)

(assert (=> b!806262 m!748201))

(assert (=> b!806153 d!103649))

(declare-fun b!806263 () Bool)

(declare-fun e!446479 () SeekEntryResult!8596)

(declare-fun e!446478 () SeekEntryResult!8596)

(assert (=> b!806263 (= e!446479 e!446478)))

(declare-fun lt!361080 () (_ BitVec 64))

(declare-fun lt!361079 () SeekEntryResult!8596)

(assert (=> b!806263 (= lt!361080 (select (arr!21005 a!3170) (index!36754 lt!361079)))))

(declare-fun c!88299 () Bool)

(assert (=> b!806263 (= c!88299 (= lt!361080 k!2044))))

(declare-fun b!806264 () Bool)

(assert (=> b!806264 (= e!446479 Undefined!8596)))

(declare-fun b!806265 () Bool)

(declare-fun e!446480 () SeekEntryResult!8596)

(assert (=> b!806265 (= e!446480 (MissingZero!8596 (index!36754 lt!361079)))))

(declare-fun d!103655 () Bool)

(declare-fun lt!361078 () SeekEntryResult!8596)

(assert (=> d!103655 (and (or (is-Undefined!8596 lt!361078) (not (is-Found!8596 lt!361078)) (and (bvsge (index!36753 lt!361078) #b00000000000000000000000000000000) (bvslt (index!36753 lt!361078) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361078) (is-Found!8596 lt!361078) (not (is-MissingZero!8596 lt!361078)) (and (bvsge (index!36752 lt!361078) #b00000000000000000000000000000000) (bvslt (index!36752 lt!361078) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361078) (is-Found!8596 lt!361078) (is-MissingZero!8596 lt!361078) (not (is-MissingVacant!8596 lt!361078)) (and (bvsge (index!36755 lt!361078) #b00000000000000000000000000000000) (bvslt (index!36755 lt!361078) (size!21426 a!3170)))) (or (is-Undefined!8596 lt!361078) (ite (is-Found!8596 lt!361078) (= (select (arr!21005 a!3170) (index!36753 lt!361078)) k!2044) (ite (is-MissingZero!8596 lt!361078) (= (select (arr!21005 a!3170) (index!36752 lt!361078)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8596 lt!361078) (= (select (arr!21005 a!3170) (index!36755 lt!361078)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103655 (= lt!361078 e!446479)))

(declare-fun c!88300 () Bool)

(assert (=> d!103655 (= c!88300 (and (is-Intermediate!8596 lt!361079) (undefined!9408 lt!361079)))))

(assert (=> d!103655 (= lt!361079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103655 (validMask!0 mask!3266)))

(assert (=> d!103655 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!361078)))

(declare-fun b!806266 () Bool)

(assert (=> b!806266 (= e!446478 (Found!8596 (index!36754 lt!361079)))))

(declare-fun b!806267 () Bool)

(declare-fun c!88298 () Bool)

(assert (=> b!806267 (= c!88298 (= lt!361080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!806267 (= e!446478 e!446480)))

(declare-fun b!806268 () Bool)

(assert (=> b!806268 (= e!446480 (seekKeyOrZeroReturnVacant!0 (x!67565 lt!361079) (index!36754 lt!361079) (index!36754 lt!361079) k!2044 a!3170 mask!3266))))

(assert (= (and d!103655 c!88300) b!806264))

(assert (= (and d!103655 (not c!88300)) b!806263))

(assert (= (and b!806263 c!88299) b!806266))

(assert (= (and b!806263 (not c!88299)) b!806267))

(assert (= (and b!806267 c!88298) b!806265))

(assert (= (and b!806267 (not c!88298)) b!806268))

(declare-fun m!748205 () Bool)

(assert (=> b!806263 m!748205))

(declare-fun m!748207 () Bool)

(assert (=> d!103655 m!748207))

(declare-fun m!748211 () Bool)

(assert (=> d!103655 m!748211))

(assert (=> d!103655 m!748109))

(declare-fun m!748215 () Bool)

(assert (=> d!103655 m!748215))

(declare-fun m!748217 () Bool)

(assert (=> d!103655 m!748217))

(assert (=> d!103655 m!748217))

(declare-fun m!748223 () Bool)

(assert (=> d!103655 m!748223))

(declare-fun m!748225 () Bool)

(assert (=> b!806268 m!748225))

(assert (=> b!806147 d!103655))

(declare-fun d!103659 () Bool)

(assert (=> d!103659 (= (validKeyInArray!0 (select (arr!21005 a!3170) j!153)) (and (not (= (select (arr!21005 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21005 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806149 d!103659))

(declare-fun d!103661 () Bool)

(declare-fun res!550492 () Bool)

(declare-fun e!446491 () Bool)

(assert (=> d!103661 (=> res!550492 e!446491)))

(assert (=> d!103661 (= res!550492 (= (select (arr!21005 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103661 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!446491)))

(declare-fun b!806285 () Bool)

(declare-fun e!446492 () Bool)

(assert (=> b!806285 (= e!446491 e!446492)))

(declare-fun res!550493 () Bool)

(assert (=> b!806285 (=> (not res!550493) (not e!446492))))

(assert (=> b!806285 (= res!550493 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21426 a!3170)))))

(declare-fun b!806286 () Bool)

(assert (=> b!806286 (= e!446492 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103661 (not res!550492)) b!806285))

(assert (= (and b!806285 res!550493) b!806286))

(declare-fun m!748241 () Bool)

(assert (=> d!103661 m!748241))

(declare-fun m!748243 () Bool)

(assert (=> b!806286 m!748243))

(assert (=> b!806154 d!103661))

(declare-fun d!103665 () Bool)

(assert (=> d!103665 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806143 d!103665))

(declare-fun b!806358 () Bool)

(declare-fun e!446539 () Bool)

(declare-fun e!446540 () Bool)

(assert (=> b!806358 (= e!446539 e!446540)))

(declare-fun c!88333 () Bool)

(assert (=> b!806358 (= c!88333 (validKeyInArray!0 (select (arr!21005 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35373 () Bool)

(declare-fun call!35376 () Bool)

(assert (=> bm!35373 (= call!35376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!806359 () Bool)

(declare-fun e!446538 () Bool)

(assert (=> b!806359 (= e!446540 e!446538)))

(declare-fun lt!361112 () (_ BitVec 64))

(assert (=> b!806359 (= lt!361112 (select (arr!21005 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27612 0))(
  ( (Unit!27613) )
))
(declare-fun lt!361113 () Unit!27612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43853 (_ BitVec 64) (_ BitVec 32)) Unit!27612)

(assert (=> b!806359 (= lt!361113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!361112 #b00000000000000000000000000000000))))

(assert (=> b!806359 (arrayContainsKey!0 a!3170 lt!361112 #b00000000000000000000000000000000)))

(declare-fun lt!361111 () Unit!27612)

(assert (=> b!806359 (= lt!361111 lt!361113)))

(declare-fun res!550513 () Bool)

(assert (=> b!806359 (= res!550513 (= (seekEntryOrOpen!0 (select (arr!21005 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8596 #b00000000000000000000000000000000)))))

(assert (=> b!806359 (=> (not res!550513) (not e!446538))))

(declare-fun d!103667 () Bool)

(declare-fun res!550514 () Bool)

(assert (=> d!103667 (=> res!550514 e!446539)))

(assert (=> d!103667 (= res!550514 (bvsge #b00000000000000000000000000000000 (size!21426 a!3170)))))

(assert (=> d!103667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446539)))

(declare-fun b!806360 () Bool)

(assert (=> b!806360 (= e!446538 call!35376)))

(declare-fun b!806361 () Bool)

(assert (=> b!806361 (= e!446540 call!35376)))

(assert (= (and d!103667 (not res!550514)) b!806358))

(assert (= (and b!806358 c!88333) b!806359))

(assert (= (and b!806358 (not c!88333)) b!806361))

(assert (= (and b!806359 res!550513) b!806360))

(assert (= (or b!806360 b!806361) bm!35373))

(assert (=> b!806358 m!748241))

(assert (=> b!806358 m!748241))

(declare-fun m!748305 () Bool)

(assert (=> b!806358 m!748305))

(declare-fun m!748307 () Bool)

(assert (=> bm!35373 m!748307))

(assert (=> b!806359 m!748241))

(declare-fun m!748309 () Bool)

(assert (=> b!806359 m!748309))

