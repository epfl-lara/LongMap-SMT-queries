; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31724 () Bool)

(assert start!31724)

(declare-fun b!317022 () Bool)

(declare-fun res!171799 () Bool)

(declare-fun e!197134 () Bool)

(assert (=> b!317022 (=> (not res!171799) (not e!197134))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317022 (= res!171799 (validKeyInArray!0 k!2441))))

(declare-fun b!317023 () Bool)

(declare-fun res!171796 () Bool)

(assert (=> b!317023 (=> (not res!171796) (not e!197134))))

(declare-datatypes ((array!16146 0))(
  ( (array!16147 (arr!7640 (Array (_ BitVec 32) (_ BitVec 64))) (size!7992 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16146)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16146 (_ BitVec 32)) Bool)

(assert (=> b!317023 (= res!171796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317024 () Bool)

(declare-fun e!197133 () Bool)

(declare-fun e!197132 () Bool)

(assert (=> b!317024 (= e!197133 e!197132)))

(declare-fun res!171802 () Bool)

(assert (=> b!317024 (=> (not res!171802) (not e!197132))))

(declare-datatypes ((SeekEntryResult!2780 0))(
  ( (MissingZero!2780 (index!13296 (_ BitVec 32))) (Found!2780 (index!13297 (_ BitVec 32))) (Intermediate!2780 (undefined!3592 Bool) (index!13298 (_ BitVec 32)) (x!31556 (_ BitVec 32))) (Undefined!2780) (MissingVacant!2780 (index!13299 (_ BitVec 32))) )
))
(declare-fun lt!154776 () SeekEntryResult!2780)

(declare-fun lt!154779 () SeekEntryResult!2780)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317024 (= res!171802 (and (= lt!154779 lt!154776) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7640 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16146 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!317024 (= lt!154779 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317025 () Bool)

(assert (=> b!317025 (= e!197134 e!197133)))

(declare-fun res!171798 () Bool)

(assert (=> b!317025 (=> (not res!171798) (not e!197133))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317025 (= res!171798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154776))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317025 (= lt!154776 (Intermediate!2780 false resIndex!52 resX!52))))

(declare-fun b!317026 () Bool)

(declare-fun lt!154778 () (_ BitVec 32))

(declare-fun lt!154777 () array!16146)

(assert (=> b!317026 (= e!197132 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154777 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154778 k!2441 lt!154777 mask!3709))))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317026 (= lt!154777 (array!16147 (store (arr!7640 a!3293) i!1240 k!2441) (size!7992 a!3293)))))

(assert (=> b!317026 (= lt!154779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154778 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317026 (= lt!154778 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317027 () Bool)

(declare-fun res!171803 () Bool)

(assert (=> b!317027 (=> (not res!171803) (not e!197134))))

(assert (=> b!317027 (= res!171803 (and (= (size!7992 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7992 a!3293))))))

(declare-fun res!171804 () Bool)

(assert (=> start!31724 (=> (not res!171804) (not e!197134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31724 (= res!171804 (validMask!0 mask!3709))))

(assert (=> start!31724 e!197134))

(declare-fun array_inv!5603 (array!16146) Bool)

(assert (=> start!31724 (array_inv!5603 a!3293)))

(assert (=> start!31724 true))

(declare-fun b!317028 () Bool)

(declare-fun res!171801 () Bool)

(assert (=> b!317028 (=> (not res!171801) (not e!197133))))

(assert (=> b!317028 (= res!171801 (and (= (select (arr!7640 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7992 a!3293))))))

(declare-fun b!317029 () Bool)

(declare-fun res!171797 () Bool)

(assert (=> b!317029 (=> (not res!171797) (not e!197134))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16146 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!317029 (= res!171797 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2780 i!1240)))))

(declare-fun b!317030 () Bool)

(declare-fun res!171800 () Bool)

(assert (=> b!317030 (=> (not res!171800) (not e!197134))))

(declare-fun arrayContainsKey!0 (array!16146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317030 (= res!171800 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31724 res!171804) b!317027))

(assert (= (and b!317027 res!171803) b!317022))

(assert (= (and b!317022 res!171799) b!317030))

(assert (= (and b!317030 res!171800) b!317029))

(assert (= (and b!317029 res!171797) b!317023))

(assert (= (and b!317023 res!171796) b!317025))

(assert (= (and b!317025 res!171798) b!317028))

(assert (= (and b!317028 res!171801) b!317024))

(assert (= (and b!317024 res!171802) b!317026))

(declare-fun m!325763 () Bool)

(assert (=> b!317025 m!325763))

(assert (=> b!317025 m!325763))

(declare-fun m!325765 () Bool)

(assert (=> b!317025 m!325765))

(declare-fun m!325767 () Bool)

(assert (=> b!317024 m!325767))

(declare-fun m!325769 () Bool)

(assert (=> b!317024 m!325769))

(declare-fun m!325771 () Bool)

(assert (=> b!317029 m!325771))

(declare-fun m!325773 () Bool)

(assert (=> b!317022 m!325773))

(declare-fun m!325775 () Bool)

(assert (=> b!317028 m!325775))

(declare-fun m!325777 () Bool)

(assert (=> start!31724 m!325777))

(declare-fun m!325779 () Bool)

(assert (=> start!31724 m!325779))

(declare-fun m!325781 () Bool)

(assert (=> b!317026 m!325781))

(declare-fun m!325783 () Bool)

(assert (=> b!317026 m!325783))

(declare-fun m!325785 () Bool)

(assert (=> b!317026 m!325785))

(declare-fun m!325787 () Bool)

(assert (=> b!317026 m!325787))

(declare-fun m!325789 () Bool)

(assert (=> b!317026 m!325789))

(declare-fun m!325791 () Bool)

(assert (=> b!317023 m!325791))

(declare-fun m!325793 () Bool)

(assert (=> b!317030 m!325793))

(push 1)

(assert (not b!317029))

(assert (not b!317030))

(assert (not b!317026))

(assert (not b!317023))

(assert (not b!317025))

(assert (not start!31724))

(assert (not b!317022))

(assert (not b!317024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69125 () Bool)

(declare-fun lt!154831 () SeekEntryResult!2780)

(assert (=> d!69125 (and (or (is-Undefined!2780 lt!154831) (not (is-Found!2780 lt!154831)) (and (bvsge (index!13297 lt!154831) #b00000000000000000000000000000000) (bvslt (index!13297 lt!154831) (size!7992 a!3293)))) (or (is-Undefined!2780 lt!154831) (is-Found!2780 lt!154831) (not (is-MissingZero!2780 lt!154831)) (and (bvsge (index!13296 lt!154831) #b00000000000000000000000000000000) (bvslt (index!13296 lt!154831) (size!7992 a!3293)))) (or (is-Undefined!2780 lt!154831) (is-Found!2780 lt!154831) (is-MissingZero!2780 lt!154831) (not (is-MissingVacant!2780 lt!154831)) (and (bvsge (index!13299 lt!154831) #b00000000000000000000000000000000) (bvslt (index!13299 lt!154831) (size!7992 a!3293)))) (or (is-Undefined!2780 lt!154831) (ite (is-Found!2780 lt!154831) (= (select (arr!7640 a!3293) (index!13297 lt!154831)) k!2441) (ite (is-MissingZero!2780 lt!154831) (= (select (arr!7640 a!3293) (index!13296 lt!154831)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2780 lt!154831) (= (select (arr!7640 a!3293) (index!13299 lt!154831)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!197212 () SeekEntryResult!2780)

(assert (=> d!69125 (= lt!154831 e!197212)))

(declare-fun c!50260 () Bool)

(declare-fun lt!154833 () SeekEntryResult!2780)

(assert (=> d!69125 (= c!50260 (and (is-Intermediate!2780 lt!154833) (undefined!3592 lt!154833)))))

(assert (=> d!69125 (= lt!154833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69125 (validMask!0 mask!3709)))

(assert (=> d!69125 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154831)))

(declare-fun b!317169 () Bool)

(assert (=> b!317169 (= e!197212 Undefined!2780)))

(declare-fun b!317170 () Bool)

(declare-fun c!50261 () Bool)

(declare-fun lt!154832 () (_ BitVec 64))

(assert (=> b!317170 (= c!50261 (= lt!154832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!197210 () SeekEntryResult!2780)

(declare-fun e!197211 () SeekEntryResult!2780)

(assert (=> b!317170 (= e!197210 e!197211)))

(declare-fun b!317171 () Bool)

(assert (=> b!317171 (= e!197212 e!197210)))

(assert (=> b!317171 (= lt!154832 (select (arr!7640 a!3293) (index!13298 lt!154833)))))

(declare-fun c!50262 () Bool)

(assert (=> b!317171 (= c!50262 (= lt!154832 k!2441))))

(declare-fun b!317172 () Bool)

(assert (=> b!317172 (= e!197210 (Found!2780 (index!13298 lt!154833)))))

(declare-fun b!317173 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16146 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!317173 (= e!197211 (seekKeyOrZeroReturnVacant!0 (x!31556 lt!154833) (index!13298 lt!154833) (index!13298 lt!154833) k!2441 a!3293 mask!3709))))

(declare-fun b!317174 () Bool)

(assert (=> b!317174 (= e!197211 (MissingZero!2780 (index!13298 lt!154833)))))

(assert (= (and d!69125 c!50260) b!317169))

(assert (= (and d!69125 (not c!50260)) b!317171))

(assert (= (and b!317171 c!50262) b!317172))

(assert (= (and b!317171 (not c!50262)) b!317170))

(assert (= (and b!317170 c!50261) b!317174))

(assert (= (and b!317170 (not c!50261)) b!317173))

(declare-fun m!325887 () Bool)

(assert (=> d!69125 m!325887))

(assert (=> d!69125 m!325777))

(declare-fun m!325889 () Bool)

(assert (=> d!69125 m!325889))

(assert (=> d!69125 m!325763))

(assert (=> d!69125 m!325765))

(declare-fun m!325891 () Bool)

(assert (=> d!69125 m!325891))

(assert (=> d!69125 m!325763))

(declare-fun m!325893 () Bool)

(assert (=> b!317171 m!325893))

(declare-fun m!325895 () Bool)

(assert (=> b!317173 m!325895))

(assert (=> b!317029 d!69125))

(declare-fun d!69137 () Bool)

(declare-fun e!197243 () Bool)

(assert (=> d!69137 e!197243))

(declare-fun c!50282 () Bool)

(declare-fun lt!154852 () SeekEntryResult!2780)

(assert (=> d!69137 (= c!50282 (and (is-Intermediate!2780 lt!154852) (undefined!3592 lt!154852)))))

(declare-fun e!197241 () SeekEntryResult!2780)

(assert (=> d!69137 (= lt!154852 e!197241)))

(declare-fun c!50281 () Bool)

(assert (=> d!69137 (= c!50281 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154851 () (_ BitVec 64))

(assert (=> d!69137 (= lt!154851 (select (arr!7640 a!3293) index!1781))))

(assert (=> d!69137 (validMask!0 mask!3709)))

(assert (=> d!69137 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154852)))

(declare-fun b!317223 () Bool)

(assert (=> b!317223 (= e!197243 (bvsge (x!31556 lt!154852) #b01111111111111111111111111111110))))

(declare-fun b!317224 () Bool)

(declare-fun e!197242 () SeekEntryResult!2780)

(assert (=> b!317224 (= e!197242 (Intermediate!2780 false index!1781 x!1427))))

(declare-fun b!317225 () Bool)

(assert (=> b!317225 (= e!197241 (Intermediate!2780 true index!1781 x!1427))))

(declare-fun b!317226 () Bool)

(assert (=> b!317226 (and (bvsge (index!13298 lt!154852) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154852) (size!7992 a!3293)))))

(declare-fun e!197240 () Bool)

(assert (=> b!317226 (= e!197240 (= (select (arr!7640 a!3293) (index!13298 lt!154852)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317227 () Bool)

(declare-fun e!197239 () Bool)

(assert (=> b!317227 (= e!197243 e!197239)))

(declare-fun res!171901 () Bool)

(assert (=> b!317227 (= res!171901 (and (is-Intermediate!2780 lt!154852) (not (undefined!3592 lt!154852)) (bvslt (x!31556 lt!154852) #b01111111111111111111111111111110) (bvsge (x!31556 lt!154852) #b00000000000000000000000000000000) (bvsge (x!31556 lt!154852) x!1427)))))

(assert (=> b!317227 (=> (not res!171901) (not e!197239))))

(declare-fun b!317228 () Bool)

(assert (=> b!317228 (and (bvsge (index!13298 lt!154852) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154852) (size!7992 a!3293)))))

(declare-fun res!171902 () Bool)

(assert (=> b!317228 (= res!171902 (= (select (arr!7640 a!3293) (index!13298 lt!154852)) k!2441))))

(assert (=> b!317228 (=> res!171902 e!197240)))

(assert (=> b!317228 (= e!197239 e!197240)))

(declare-fun b!317229 () Bool)

(assert (=> b!317229 (and (bvsge (index!13298 lt!154852) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154852) (size!7992 a!3293)))))

(declare-fun res!171903 () Bool)

(assert (=> b!317229 (= res!171903 (= (select (arr!7640 a!3293) (index!13298 lt!154852)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317229 (=> res!171903 e!197240)))

(declare-fun b!317230 () Bool)

(assert (=> b!317230 (= e!197241 e!197242)))

(declare-fun c!50283 () Bool)

(assert (=> b!317230 (= c!50283 (or (= lt!154851 k!2441) (= (bvadd lt!154851 lt!154851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317231 () Bool)

(assert (=> b!317231 (= e!197242 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69137 c!50281) b!317225))

(assert (= (and d!69137 (not c!50281)) b!317230))

(assert (= (and b!317230 c!50283) b!317224))

(assert (= (and b!317230 (not c!50283)) b!317231))

(assert (= (and d!69137 c!50282) b!317223))

(assert (= (and d!69137 (not c!50282)) b!317227))

(assert (= (and b!317227 res!171901) b!317228))

(assert (= (and b!317228 (not res!171902)) b!317229))

(assert (= (and b!317229 (not res!171903)) b!317226))

(assert (=> d!69137 m!325767))

(assert (=> d!69137 m!325777))

(declare-fun m!325909 () Bool)

(assert (=> b!317229 m!325909))

(assert (=> b!317228 m!325909))

(assert (=> b!317226 m!325909))

(assert (=> b!317231 m!325783))

(assert (=> b!317231 m!325783))

(declare-fun m!325911 () Bool)

(assert (=> b!317231 m!325911))

(assert (=> b!317024 d!69137))

(declare-fun d!69149 () Bool)

(declare-fun e!197248 () Bool)

(assert (=> d!69149 e!197248))

(declare-fun c!50285 () Bool)

(declare-fun lt!154854 () SeekEntryResult!2780)

(assert (=> d!69149 (= c!50285 (and (is-Intermediate!2780 lt!154854) (undefined!3592 lt!154854)))))

(declare-fun e!197246 () SeekEntryResult!2780)

(assert (=> d!69149 (= lt!154854 e!197246)))

(declare-fun c!50284 () Bool)

(assert (=> d!69149 (= c!50284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154853 () (_ BitVec 64))

(assert (=> d!69149 (= lt!154853 (select (arr!7640 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69149 (validMask!0 mask!3709)))

(assert (=> d!69149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154854)))

(declare-fun b!317232 () Bool)

(assert (=> b!317232 (= e!197248 (bvsge (x!31556 lt!154854) #b01111111111111111111111111111110))))

(declare-fun b!317233 () Bool)

(declare-fun e!197247 () SeekEntryResult!2780)

(assert (=> b!317233 (= e!197247 (Intermediate!2780 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!317234 () Bool)

(assert (=> b!317234 (= e!197246 (Intermediate!2780 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!317235 () Bool)

(assert (=> b!317235 (and (bvsge (index!13298 lt!154854) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154854) (size!7992 a!3293)))))

(declare-fun e!197245 () Bool)

(assert (=> b!317235 (= e!197245 (= (select (arr!7640 a!3293) (index!13298 lt!154854)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317236 () Bool)

(declare-fun e!197244 () Bool)

(assert (=> b!317236 (= e!197248 e!197244)))

(declare-fun res!171904 () Bool)

(assert (=> b!317236 (= res!171904 (and (is-Intermediate!2780 lt!154854) (not (undefined!3592 lt!154854)) (bvslt (x!31556 lt!154854) #b01111111111111111111111111111110) (bvsge (x!31556 lt!154854) #b00000000000000000000000000000000) (bvsge (x!31556 lt!154854) #b00000000000000000000000000000000)))))

(assert (=> b!317236 (=> (not res!171904) (not e!197244))))

(declare-fun b!317237 () Bool)

(assert (=> b!317237 (and (bvsge (index!13298 lt!154854) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154854) (size!7992 a!3293)))))

(declare-fun res!171905 () Bool)

(assert (=> b!317237 (= res!171905 (= (select (arr!7640 a!3293) (index!13298 lt!154854)) k!2441))))

(assert (=> b!317237 (=> res!171905 e!197245)))

(assert (=> b!317237 (= e!197244 e!197245)))

(declare-fun b!317238 () Bool)

(assert (=> b!317238 (and (bvsge (index!13298 lt!154854) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154854) (size!7992 a!3293)))))

(declare-fun res!171906 () Bool)

(assert (=> b!317238 (= res!171906 (= (select (arr!7640 a!3293) (index!13298 lt!154854)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317238 (=> res!171906 e!197245)))

(declare-fun b!317239 () Bool)

(assert (=> b!317239 (= e!197246 e!197247)))

(declare-fun c!50286 () Bool)

(assert (=> b!317239 (= c!50286 (or (= lt!154853 k!2441) (= (bvadd lt!154853 lt!154853) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317240 () Bool)

(assert (=> b!317240 (= e!197247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69149 c!50284) b!317234))

(assert (= (and d!69149 (not c!50284)) b!317239))

(assert (= (and b!317239 c!50286) b!317233))

(assert (= (and b!317239 (not c!50286)) b!317240))

(assert (= (and d!69149 c!50285) b!317232))

(assert (= (and d!69149 (not c!50285)) b!317236))

(assert (= (and b!317236 res!171904) b!317237))

(assert (= (and b!317237 (not res!171905)) b!317238))

(assert (= (and b!317238 (not res!171906)) b!317235))

(assert (=> d!69149 m!325763))

(declare-fun m!325913 () Bool)

(assert (=> d!69149 m!325913))

(assert (=> d!69149 m!325777))

(declare-fun m!325915 () Bool)

(assert (=> b!317238 m!325915))

(assert (=> b!317237 m!325915))

(assert (=> b!317235 m!325915))

(assert (=> b!317240 m!325763))

(declare-fun m!325917 () Bool)

(assert (=> b!317240 m!325917))

(assert (=> b!317240 m!325917))

(declare-fun m!325919 () Bool)

(assert (=> b!317240 m!325919))

(assert (=> b!317025 d!69149))

(declare-fun d!69151 () Bool)

(declare-fun lt!154863 () (_ BitVec 32))

(declare-fun lt!154862 () (_ BitVec 32))

(assert (=> d!69151 (= lt!154863 (bvmul (bvxor lt!154862 (bvlshr lt!154862 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69151 (= lt!154862 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69151 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171907 (let ((h!5376 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31563 (bvmul (bvxor h!5376 (bvlshr h!5376 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31563 (bvlshr x!31563 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171907 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171907 #b00000000000000000000000000000000))))))

(assert (=> d!69151 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154863 (bvlshr lt!154863 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!317025 d!69151))

(declare-fun d!69155 () Bool)

(declare-fun res!171912 () Bool)

(declare-fun e!197256 () Bool)

(assert (=> d!69155 (=> res!171912 e!197256)))

(assert (=> d!69155 (= res!171912 (= (select (arr!7640 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69155 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!197256)))

(declare-fun b!317253 () Bool)

(declare-fun e!197257 () Bool)

(assert (=> b!317253 (= e!197256 e!197257)))

(declare-fun res!171913 () Bool)

(assert (=> b!317253 (=> (not res!171913) (not e!197257))))

(assert (=> b!317253 (= res!171913 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7992 a!3293)))))

(declare-fun b!317254 () Bool)

(assert (=> b!317254 (= e!197257 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69155 (not res!171912)) b!317253))

(assert (= (and b!317253 res!171913) b!317254))

(declare-fun m!325931 () Bool)

(assert (=> d!69155 m!325931))

(declare-fun m!325933 () Bool)

(assert (=> b!317254 m!325933))

(assert (=> b!317030 d!69155))

(declare-fun d!69157 () Bool)

(declare-fun e!197268 () Bool)

(assert (=> d!69157 e!197268))

(declare-fun c!50297 () Bool)

(declare-fun lt!154871 () SeekEntryResult!2780)

(assert (=> d!69157 (= c!50297 (and (is-Intermediate!2780 lt!154871) (undefined!3592 lt!154871)))))

(declare-fun e!197266 () SeekEntryResult!2780)

(assert (=> d!69157 (= lt!154871 e!197266)))

(declare-fun c!50296 () Bool)

(assert (=> d!69157 (= c!50296 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154870 () (_ BitVec 64))

(assert (=> d!69157 (= lt!154870 (select (arr!7640 lt!154777) index!1781))))

(assert (=> d!69157 (validMask!0 mask!3709)))

(assert (=> d!69157 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154777 mask!3709) lt!154871)))

(declare-fun b!317265 () Bool)

(assert (=> b!317265 (= e!197268 (bvsge (x!31556 lt!154871) #b01111111111111111111111111111110))))

(declare-fun b!317266 () Bool)

(declare-fun e!197267 () SeekEntryResult!2780)

(assert (=> b!317266 (= e!197267 (Intermediate!2780 false index!1781 x!1427))))

(declare-fun b!317267 () Bool)

(assert (=> b!317267 (= e!197266 (Intermediate!2780 true index!1781 x!1427))))

(declare-fun b!317268 () Bool)

(assert (=> b!317268 (and (bvsge (index!13298 lt!154871) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154871) (size!7992 lt!154777)))))

(declare-fun e!197265 () Bool)

(assert (=> b!317268 (= e!197265 (= (select (arr!7640 lt!154777) (index!13298 lt!154871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317269 () Bool)

(declare-fun e!197264 () Bool)

(assert (=> b!317269 (= e!197268 e!197264)))

(declare-fun res!171914 () Bool)

(assert (=> b!317269 (= res!171914 (and (is-Intermediate!2780 lt!154871) (not (undefined!3592 lt!154871)) (bvslt (x!31556 lt!154871) #b01111111111111111111111111111110) (bvsge (x!31556 lt!154871) #b00000000000000000000000000000000) (bvsge (x!31556 lt!154871) x!1427)))))

(assert (=> b!317269 (=> (not res!171914) (not e!197264))))

(declare-fun b!317270 () Bool)

(assert (=> b!317270 (and (bvsge (index!13298 lt!154871) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154871) (size!7992 lt!154777)))))

(declare-fun res!171915 () Bool)

(assert (=> b!317270 (= res!171915 (= (select (arr!7640 lt!154777) (index!13298 lt!154871)) k!2441))))

(assert (=> b!317270 (=> res!171915 e!197265)))

(assert (=> b!317270 (= e!197264 e!197265)))

(declare-fun b!317271 () Bool)

(assert (=> b!317271 (and (bvsge (index!13298 lt!154871) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154871) (size!7992 lt!154777)))))

(declare-fun res!171916 () Bool)

(assert (=> b!317271 (= res!171916 (= (select (arr!7640 lt!154777) (index!13298 lt!154871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317271 (=> res!171916 e!197265)))

(declare-fun b!317272 () Bool)

(assert (=> b!317272 (= e!197266 e!197267)))

(declare-fun c!50298 () Bool)

(assert (=> b!317272 (= c!50298 (or (= lt!154870 k!2441) (= (bvadd lt!154870 lt!154870) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317273 () Bool)

(assert (=> b!317273 (= e!197267 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 lt!154777 mask!3709))))

(assert (= (and d!69157 c!50296) b!317267))

(assert (= (and d!69157 (not c!50296)) b!317272))

(assert (= (and b!317272 c!50298) b!317266))

(assert (= (and b!317272 (not c!50298)) b!317273))

(assert (= (and d!69157 c!50297) b!317265))

(assert (= (and d!69157 (not c!50297)) b!317269))

(assert (= (and b!317269 res!171914) b!317270))

(assert (= (and b!317270 (not res!171915)) b!317271))

(assert (= (and b!317271 (not res!171916)) b!317268))

(declare-fun m!325935 () Bool)

(assert (=> d!69157 m!325935))

(assert (=> d!69157 m!325777))

(declare-fun m!325937 () Bool)

(assert (=> b!317271 m!325937))

(assert (=> b!317270 m!325937))

(assert (=> b!317268 m!325937))

(assert (=> b!317273 m!325783))

(assert (=> b!317273 m!325783))

(declare-fun m!325939 () Bool)

(assert (=> b!317273 m!325939))

(assert (=> b!317026 d!69157))

(declare-fun d!69159 () Bool)

(declare-fun e!197273 () Bool)

(assert (=> d!69159 e!197273))

(declare-fun c!50300 () Bool)

(declare-fun lt!154873 () SeekEntryResult!2780)

(assert (=> d!69159 (= c!50300 (and (is-Intermediate!2780 lt!154873) (undefined!3592 lt!154873)))))

(declare-fun e!197271 () SeekEntryResult!2780)

(assert (=> d!69159 (= lt!154873 e!197271)))

(declare-fun c!50299 () Bool)

(assert (=> d!69159 (= c!50299 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154872 () (_ BitVec 64))

(assert (=> d!69159 (= lt!154872 (select (arr!7640 lt!154777) lt!154778))))

(assert (=> d!69159 (validMask!0 mask!3709)))

(assert (=> d!69159 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154778 k!2441 lt!154777 mask!3709) lt!154873)))

(declare-fun b!317274 () Bool)

(assert (=> b!317274 (= e!197273 (bvsge (x!31556 lt!154873) #b01111111111111111111111111111110))))

(declare-fun b!317275 () Bool)

(declare-fun e!197272 () SeekEntryResult!2780)

(assert (=> b!317275 (= e!197272 (Intermediate!2780 false lt!154778 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317276 () Bool)

(assert (=> b!317276 (= e!197271 (Intermediate!2780 true lt!154778 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317277 () Bool)

(assert (=> b!317277 (and (bvsge (index!13298 lt!154873) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154873) (size!7992 lt!154777)))))

(declare-fun e!197270 () Bool)

(assert (=> b!317277 (= e!197270 (= (select (arr!7640 lt!154777) (index!13298 lt!154873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317278 () Bool)

(declare-fun e!197269 () Bool)

(assert (=> b!317278 (= e!197273 e!197269)))

(declare-fun res!171917 () Bool)

(assert (=> b!317278 (= res!171917 (and (is-Intermediate!2780 lt!154873) (not (undefined!3592 lt!154873)) (bvslt (x!31556 lt!154873) #b01111111111111111111111111111110) (bvsge (x!31556 lt!154873) #b00000000000000000000000000000000) (bvsge (x!31556 lt!154873) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317278 (=> (not res!171917) (not e!197269))))

(declare-fun b!317279 () Bool)

(assert (=> b!317279 (and (bvsge (index!13298 lt!154873) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154873) (size!7992 lt!154777)))))

(declare-fun res!171918 () Bool)

(assert (=> b!317279 (= res!171918 (= (select (arr!7640 lt!154777) (index!13298 lt!154873)) k!2441))))

(assert (=> b!317279 (=> res!171918 e!197270)))

(assert (=> b!317279 (= e!197269 e!197270)))

(declare-fun b!317280 () Bool)

(assert (=> b!317280 (and (bvsge (index!13298 lt!154873) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154873) (size!7992 lt!154777)))))

(declare-fun res!171919 () Bool)

(assert (=> b!317280 (= res!171919 (= (select (arr!7640 lt!154777) (index!13298 lt!154873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317280 (=> res!171919 e!197270)))

(declare-fun b!317281 () Bool)

(assert (=> b!317281 (= e!197271 e!197272)))

(declare-fun c!50301 () Bool)

(assert (=> b!317281 (= c!50301 (or (= lt!154872 k!2441) (= (bvadd lt!154872 lt!154872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317282 () Bool)

(assert (=> b!317282 (= e!197272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154778 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 lt!154777 mask!3709))))

(assert (= (and d!69159 c!50299) b!317276))

(assert (= (and d!69159 (not c!50299)) b!317281))

(assert (= (and b!317281 c!50301) b!317275))

(assert (= (and b!317281 (not c!50301)) b!317282))

(assert (= (and d!69159 c!50300) b!317274))

(assert (= (and d!69159 (not c!50300)) b!317278))

(assert (= (and b!317278 res!171917) b!317279))

(assert (= (and b!317279 (not res!171918)) b!317280))

(assert (= (and b!317280 (not res!171919)) b!317277))

(declare-fun m!325941 () Bool)

(assert (=> d!69159 m!325941))

(assert (=> d!69159 m!325777))

(declare-fun m!325943 () Bool)

(assert (=> b!317280 m!325943))

(assert (=> b!317279 m!325943))

(assert (=> b!317277 m!325943))

(declare-fun m!325945 () Bool)

(assert (=> b!317282 m!325945))

(assert (=> b!317282 m!325945))

(declare-fun m!325947 () Bool)

(assert (=> b!317282 m!325947))

(assert (=> b!317026 d!69159))

(declare-fun d!69161 () Bool)

(declare-fun e!197278 () Bool)

(assert (=> d!69161 e!197278))

(declare-fun c!50303 () Bool)

(declare-fun lt!154875 () SeekEntryResult!2780)

(assert (=> d!69161 (= c!50303 (and (is-Intermediate!2780 lt!154875) (undefined!3592 lt!154875)))))

(declare-fun e!197276 () SeekEntryResult!2780)

(assert (=> d!69161 (= lt!154875 e!197276)))

(declare-fun c!50302 () Bool)

(assert (=> d!69161 (= c!50302 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154874 () (_ BitVec 64))

(assert (=> d!69161 (= lt!154874 (select (arr!7640 a!3293) lt!154778))))

(assert (=> d!69161 (validMask!0 mask!3709)))

(assert (=> d!69161 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154778 k!2441 a!3293 mask!3709) lt!154875)))

(declare-fun b!317283 () Bool)

(assert (=> b!317283 (= e!197278 (bvsge (x!31556 lt!154875) #b01111111111111111111111111111110))))

(declare-fun b!317284 () Bool)

(declare-fun e!197277 () SeekEntryResult!2780)

(assert (=> b!317284 (= e!197277 (Intermediate!2780 false lt!154778 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317285 () Bool)

(assert (=> b!317285 (= e!197276 (Intermediate!2780 true lt!154778 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317286 () Bool)

(assert (=> b!317286 (and (bvsge (index!13298 lt!154875) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154875) (size!7992 a!3293)))))

(declare-fun e!197275 () Bool)

(assert (=> b!317286 (= e!197275 (= (select (arr!7640 a!3293) (index!13298 lt!154875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317287 () Bool)

(declare-fun e!197274 () Bool)

(assert (=> b!317287 (= e!197278 e!197274)))

(declare-fun res!171920 () Bool)

(assert (=> b!317287 (= res!171920 (and (is-Intermediate!2780 lt!154875) (not (undefined!3592 lt!154875)) (bvslt (x!31556 lt!154875) #b01111111111111111111111111111110) (bvsge (x!31556 lt!154875) #b00000000000000000000000000000000) (bvsge (x!31556 lt!154875) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317287 (=> (not res!171920) (not e!197274))))

(declare-fun b!317288 () Bool)

(assert (=> b!317288 (and (bvsge (index!13298 lt!154875) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154875) (size!7992 a!3293)))))

(declare-fun res!171921 () Bool)

(assert (=> b!317288 (= res!171921 (= (select (arr!7640 a!3293) (index!13298 lt!154875)) k!2441))))

(assert (=> b!317288 (=> res!171921 e!197275)))

(assert (=> b!317288 (= e!197274 e!197275)))

(declare-fun b!317289 () Bool)

(assert (=> b!317289 (and (bvsge (index!13298 lt!154875) #b00000000000000000000000000000000) (bvslt (index!13298 lt!154875) (size!7992 a!3293)))))

(declare-fun res!171922 () Bool)

(assert (=> b!317289 (= res!171922 (= (select (arr!7640 a!3293) (index!13298 lt!154875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317289 (=> res!171922 e!197275)))

(declare-fun b!317290 () Bool)

(assert (=> b!317290 (= e!197276 e!197277)))

(declare-fun c!50304 () Bool)

(assert (=> b!317290 (= c!50304 (or (= lt!154874 k!2441) (= (bvadd lt!154874 lt!154874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317291 () Bool)

(assert (=> b!317291 (= e!197277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154778 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69161 c!50302) b!317285))

(assert (= (and d!69161 (not c!50302)) b!317290))

(assert (= (and b!317290 c!50304) b!317284))

(assert (= (and b!317290 (not c!50304)) b!317291))

(assert (= (and d!69161 c!50303) b!317283))

(assert (= (and d!69161 (not c!50303)) b!317287))

(assert (= (and b!317287 res!171920) b!317288))

(assert (= (and b!317288 (not res!171921)) b!317289))

(assert (= (and b!317289 (not res!171922)) b!317286))

(declare-fun m!325949 () Bool)

(assert (=> d!69161 m!325949))

(assert (=> d!69161 m!325777))

(declare-fun m!325951 () Bool)

(assert (=> b!317289 m!325951))

(assert (=> b!317288 m!325951))

(assert (=> b!317286 m!325951))

(assert (=> b!317291 m!325945))

(assert (=> b!317291 m!325945))

(declare-fun m!325953 () Bool)

(assert (=> b!317291 m!325953))

(assert (=> b!317026 d!69161))

(declare-fun d!69163 () Bool)

(declare-fun lt!154887 () (_ BitVec 32))

(assert (=> d!69163 (and (bvsge lt!154887 #b00000000000000000000000000000000) (bvslt lt!154887 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69163 (= lt!154887 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69163 (validMask!0 mask!3709)))

(assert (=> d!69163 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154887)))

(declare-fun bs!11064 () Bool)

(assert (= bs!11064 d!69163))

(declare-fun m!325971 () Bool)

(assert (=> bs!11064 m!325971))

(assert (=> bs!11064 m!325777))

(assert (=> b!317026 d!69163))

(declare-fun d!69173 () Bool)

(assert (=> d!69173 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31724 d!69173))

(declare-fun d!69191 () Bool)

(assert (=> d!69191 (= (array_inv!5603 a!3293) (bvsge (size!7992 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31724 d!69191))

(declare-fun d!69195 () Bool)

(assert (=> d!69195 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!317022 d!69195))

(declare-fun b!317378 () Bool)

(declare-fun e!197334 () Bool)

(declare-fun call!26026 () Bool)

(assert (=> b!317378 (= e!197334 call!26026)))

(declare-fun b!317379 () Bool)

(declare-fun e!197335 () Bool)

(assert (=> b!317379 (= e!197334 e!197335)))

(declare-fun lt!154925 () (_ BitVec 64))

(assert (=> b!317379 (= lt!154925 (select (arr!7640 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9790 0))(
  ( (Unit!9791) )
))
(declare-fun lt!154926 () Unit!9790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16146 (_ BitVec 64) (_ BitVec 32)) Unit!9790)

(assert (=> b!317379 (= lt!154926 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154925 #b00000000000000000000000000000000))))

(assert (=> b!317379 (arrayContainsKey!0 a!3293 lt!154925 #b00000000000000000000000000000000)))

(declare-fun lt!154924 () Unit!9790)

(assert (=> b!317379 (= lt!154924 lt!154926)))

(declare-fun res!171959 () Bool)

(assert (=> b!317379 (= res!171959 (= (seekEntryOrOpen!0 (select (arr!7640 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2780 #b00000000000000000000000000000000)))))

(assert (=> b!317379 (=> (not res!171959) (not e!197335))))

(declare-fun bm!26023 () Bool)

(assert (=> bm!26023 (= call!26026 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!69197 () Bool)

(declare-fun res!171960 () Bool)

(declare-fun e!197333 () Bool)

(assert (=> d!69197 (=> res!171960 e!197333)))

(assert (=> d!69197 (= res!171960 (bvsge #b00000000000000000000000000000000 (size!7992 a!3293)))))

(assert (=> d!69197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!197333)))

(declare-fun b!317380 () Bool)

(assert (=> b!317380 (= e!197335 call!26026)))

(declare-fun b!317381 () Bool)

(assert (=> b!317381 (= e!197333 e!197334)))

(declare-fun c!50331 () Bool)

(assert (=> b!317381 (= c!50331 (validKeyInArray!0 (select (arr!7640 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!69197 (not res!171960)) b!317381))

(assert (= (and b!317381 c!50331) b!317379))

(assert (= (and b!317381 (not c!50331)) b!317378))

(assert (= (and b!317379 res!171959) b!317380))

(assert (= (or b!317380 b!317378) bm!26023))

(assert (=> b!317379 m!325931))

(declare-fun m!326023 () Bool)

(assert (=> b!317379 m!326023))

(declare-fun m!326025 () Bool)

(assert (=> b!317379 m!326025))

(assert (=> b!317379 m!325931))

(declare-fun m!326027 () Bool)

(assert (=> b!317379 m!326027))

(declare-fun m!326029 () Bool)

(assert (=> bm!26023 m!326029))

(assert (=> b!317381 m!325931))

(assert (=> b!317381 m!325931))

(declare-fun m!326031 () Bool)

(assert (=> b!317381 m!326031))

(assert (=> b!317023 d!69197))

(push 1)

(assert (not b!317381))

(assert (not b!317231))

(assert (not b!317282))

(assert (not b!317291))

(assert (not b!317254))

(assert (not d!69157))

(assert (not b!317273))

(assert (not d!69159))

(assert (not b!317379))

(assert (not b!317240))

(assert (not d!69163))

(assert (not d!69125))

(assert (not b!317173))

(assert (not d!69137))

(assert (not d!69149))

(assert (not d!69161))

(assert (not bm!26023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

