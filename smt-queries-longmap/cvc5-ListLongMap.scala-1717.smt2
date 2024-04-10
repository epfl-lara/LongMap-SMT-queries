; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31592 () Bool)

(assert start!31592)

(declare-fun b!316150 () Bool)

(declare-datatypes ((Unit!9767 0))(
  ( (Unit!9768) )
))
(declare-fun e!196660 () Unit!9767)

(declare-fun e!196663 () Unit!9767)

(assert (=> b!316150 (= e!196660 e!196663)))

(declare-fun c!50048 () Bool)

(declare-datatypes ((array!16116 0))(
  ( (array!16117 (arr!7628 (Array (_ BitVec 32) (_ BitVec 64))) (size!7980 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16116)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316150 (= c!50048 (or (= (select (arr!7628 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7628 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!171295 () Bool)

(declare-fun e!196657 () Bool)

(assert (=> start!31592 (=> (not res!171295) (not e!196657))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31592 (= res!171295 (validMask!0 mask!3709))))

(assert (=> start!31592 e!196657))

(declare-fun array_inv!5591 (array!16116) Bool)

(assert (=> start!31592 (array_inv!5591 a!3293)))

(assert (=> start!31592 true))

(declare-fun b!316151 () Bool)

(declare-fun res!171297 () Bool)

(assert (=> b!316151 (=> (not res!171297) (not e!196657))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316151 (= res!171297 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316152 () Bool)

(declare-fun e!196658 () Bool)

(declare-fun e!196661 () Bool)

(assert (=> b!316152 (= e!196658 e!196661)))

(declare-fun res!171288 () Bool)

(assert (=> b!316152 (=> (not res!171288) (not e!196661))))

(declare-datatypes ((SeekEntryResult!2768 0))(
  ( (MissingZero!2768 (index!13248 (_ BitVec 32))) (Found!2768 (index!13249 (_ BitVec 32))) (Intermediate!2768 (undefined!3580 Bool) (index!13250 (_ BitVec 32)) (x!31494 (_ BitVec 32))) (Undefined!2768) (MissingVacant!2768 (index!13251 (_ BitVec 32))) )
))
(declare-fun lt!154458 () SeekEntryResult!2768)

(declare-fun lt!154460 () SeekEntryResult!2768)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!316152 (= res!171288 (and (= lt!154460 lt!154458) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7628 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16116 (_ BitVec 32)) SeekEntryResult!2768)

(assert (=> b!316152 (= lt!154460 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316153 () Bool)

(assert (=> b!316153 (= e!196657 e!196658)))

(declare-fun res!171296 () Bool)

(assert (=> b!316153 (=> (not res!171296) (not e!196658))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316153 (= res!171296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154458))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316153 (= lt!154458 (Intermediate!2768 false resIndex!52 resX!52))))

(declare-fun b!316154 () Bool)

(declare-fun res!171290 () Bool)

(assert (=> b!316154 (=> (not res!171290) (not e!196657))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316154 (= res!171290 (and (= (size!7980 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7980 a!3293))))))

(declare-fun b!316155 () Bool)

(declare-fun e!196659 () Bool)

(assert (=> b!316155 (= e!196661 (not e!196659))))

(declare-fun res!171292 () Bool)

(assert (=> b!316155 (=> res!171292 e!196659)))

(assert (=> b!316155 (= res!171292 (not (= (select (arr!7628 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!316155 (= index!1781 resIndex!52)))

(declare-fun lt!154459 () Unit!9767)

(assert (=> b!316155 (= lt!154459 e!196660)))

(declare-fun c!50049 () Bool)

(assert (=> b!316155 (= c!50049 (not (= resIndex!52 index!1781)))))

(declare-fun b!316156 () Bool)

(assert (=> b!316156 (= e!196659 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)) mask!3709) lt!154460))))

(declare-fun b!316157 () Bool)

(declare-fun res!171294 () Bool)

(assert (=> b!316157 (=> (not res!171294) (not e!196657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316157 (= res!171294 (validKeyInArray!0 k!2441))))

(declare-fun b!316158 () Bool)

(declare-fun res!171289 () Bool)

(assert (=> b!316158 (=> (not res!171289) (not e!196657))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16116 (_ BitVec 32)) SeekEntryResult!2768)

(assert (=> b!316158 (= res!171289 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2768 i!1240)))))

(declare-fun b!316159 () Bool)

(declare-fun res!171291 () Bool)

(assert (=> b!316159 (=> (not res!171291) (not e!196657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16116 (_ BitVec 32)) Bool)

(assert (=> b!316159 (= res!171291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316160 () Bool)

(declare-fun res!171293 () Bool)

(assert (=> b!316160 (=> (not res!171293) (not e!196658))))

(assert (=> b!316160 (= res!171293 (and (= (select (arr!7628 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7980 a!3293))))))

(declare-fun b!316161 () Bool)

(assert (=> b!316161 false))

(declare-fun lt!154461 () SeekEntryResult!2768)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316161 (= lt!154461 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9769 () Unit!9767)

(assert (=> b!316161 (= e!196663 Unit!9769)))

(declare-fun b!316162 () Bool)

(declare-fun Unit!9770 () Unit!9767)

(assert (=> b!316162 (= e!196660 Unit!9770)))

(declare-fun b!316163 () Bool)

(assert (=> b!316163 false))

(declare-fun Unit!9771 () Unit!9767)

(assert (=> b!316163 (= e!196663 Unit!9771)))

(assert (= (and start!31592 res!171295) b!316154))

(assert (= (and b!316154 res!171290) b!316157))

(assert (= (and b!316157 res!171294) b!316151))

(assert (= (and b!316151 res!171297) b!316158))

(assert (= (and b!316158 res!171289) b!316159))

(assert (= (and b!316159 res!171291) b!316153))

(assert (= (and b!316153 res!171296) b!316160))

(assert (= (and b!316160 res!171293) b!316152))

(assert (= (and b!316152 res!171288) b!316155))

(assert (= (and b!316155 c!50049) b!316150))

(assert (= (and b!316155 (not c!50049)) b!316162))

(assert (= (and b!316150 c!50048) b!316163))

(assert (= (and b!316150 (not c!50048)) b!316161))

(assert (= (and b!316155 (not res!171292)) b!316156))

(declare-fun m!325145 () Bool)

(assert (=> b!316158 m!325145))

(declare-fun m!325147 () Bool)

(assert (=> b!316151 m!325147))

(declare-fun m!325149 () Bool)

(assert (=> b!316156 m!325149))

(declare-fun m!325151 () Bool)

(assert (=> b!316156 m!325151))

(declare-fun m!325153 () Bool)

(assert (=> b!316155 m!325153))

(declare-fun m!325155 () Bool)

(assert (=> b!316159 m!325155))

(declare-fun m!325157 () Bool)

(assert (=> start!31592 m!325157))

(declare-fun m!325159 () Bool)

(assert (=> start!31592 m!325159))

(assert (=> b!316152 m!325153))

(declare-fun m!325161 () Bool)

(assert (=> b!316152 m!325161))

(declare-fun m!325163 () Bool)

(assert (=> b!316160 m!325163))

(declare-fun m!325165 () Bool)

(assert (=> b!316157 m!325165))

(declare-fun m!325167 () Bool)

(assert (=> b!316153 m!325167))

(assert (=> b!316153 m!325167))

(declare-fun m!325169 () Bool)

(assert (=> b!316153 m!325169))

(declare-fun m!325171 () Bool)

(assert (=> b!316161 m!325171))

(assert (=> b!316161 m!325171))

(declare-fun m!325173 () Bool)

(assert (=> b!316161 m!325173))

(assert (=> b!316150 m!325153))

(push 1)

(assert (not b!316157))

(assert (not b!316151))

(assert (not b!316161))

(assert (not start!31592))

(assert (not b!316158))

(assert (not b!316153))

(assert (not b!316152))

(assert (not b!316156))

(assert (not b!316159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68983 () Bool)

(declare-fun res!171384 () Bool)

(declare-fun e!196741 () Bool)

(assert (=> d!68983 (=> res!171384 e!196741)))

(assert (=> d!68983 (= res!171384 (= (select (arr!7628 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68983 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!196741)))

(declare-fun b!316303 () Bool)

(declare-fun e!196742 () Bool)

(assert (=> b!316303 (= e!196741 e!196742)))

(declare-fun res!171385 () Bool)

(assert (=> b!316303 (=> (not res!171385) (not e!196742))))

(assert (=> b!316303 (= res!171385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7980 a!3293)))))

(declare-fun b!316304 () Bool)

(assert (=> b!316304 (= e!196742 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68983 (not res!171384)) b!316303))

(assert (= (and b!316303 res!171385) b!316304))

(declare-fun m!325257 () Bool)

(assert (=> d!68983 m!325257))

(declare-fun m!325259 () Bool)

(assert (=> b!316304 m!325259))

(assert (=> b!316151 d!68983))

(declare-fun b!316377 () Bool)

(declare-fun e!196786 () SeekEntryResult!2768)

(assert (=> b!316377 (= e!196786 (Intermediate!2768 true index!1781 x!1427))))

(declare-fun d!68993 () Bool)

(declare-fun e!196785 () Bool)

(assert (=> d!68993 e!196785))

(declare-fun c!50104 () Bool)

(declare-fun lt!154532 () SeekEntryResult!2768)

(assert (=> d!68993 (= c!50104 (and (is-Intermediate!2768 lt!154532) (undefined!3580 lt!154532)))))

(assert (=> d!68993 (= lt!154532 e!196786)))

(declare-fun c!50105 () Bool)

(assert (=> d!68993 (= c!50105 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154533 () (_ BitVec 64))

(assert (=> d!68993 (= lt!154533 (select (arr!7628 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293))) index!1781))))

(assert (=> d!68993 (validMask!0 mask!3709)))

(assert (=> d!68993 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)) mask!3709) lt!154532)))

(declare-fun b!316378 () Bool)

(declare-fun e!196783 () Bool)

(assert (=> b!316378 (= e!196785 e!196783)))

(declare-fun res!171405 () Bool)

(assert (=> b!316378 (= res!171405 (and (is-Intermediate!2768 lt!154532) (not (undefined!3580 lt!154532)) (bvslt (x!31494 lt!154532) #b01111111111111111111111111111110) (bvsge (x!31494 lt!154532) #b00000000000000000000000000000000) (bvsge (x!31494 lt!154532) x!1427)))))

(assert (=> b!316378 (=> (not res!171405) (not e!196783))))

(declare-fun b!316379 () Bool)

(assert (=> b!316379 (and (bvsge (index!13250 lt!154532) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154532) (size!7980 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)))))))

(declare-fun res!171407 () Bool)

(assert (=> b!316379 (= res!171407 (= (select (arr!7628 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293))) (index!13250 lt!154532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196784 () Bool)

(assert (=> b!316379 (=> res!171407 e!196784)))

(declare-fun b!316380 () Bool)

(assert (=> b!316380 (and (bvsge (index!13250 lt!154532) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154532) (size!7980 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)))))))

(declare-fun res!171406 () Bool)

(assert (=> b!316380 (= res!171406 (= (select (arr!7628 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293))) (index!13250 lt!154532)) k!2441))))

(assert (=> b!316380 (=> res!171406 e!196784)))

(assert (=> b!316380 (= e!196783 e!196784)))

(declare-fun b!316381 () Bool)

(declare-fun e!196782 () SeekEntryResult!2768)

(assert (=> b!316381 (= e!196782 (Intermediate!2768 false index!1781 x!1427))))

(declare-fun b!316382 () Bool)

(assert (=> b!316382 (= e!196786 e!196782)))

(declare-fun c!50106 () Bool)

(assert (=> b!316382 (= c!50106 (or (= lt!154533 k!2441) (= (bvadd lt!154533 lt!154533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316383 () Bool)

(assert (=> b!316383 (and (bvsge (index!13250 lt!154532) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154532) (size!7980 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)))))))

(assert (=> b!316383 (= e!196784 (= (select (arr!7628 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293))) (index!13250 lt!154532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316384 () Bool)

(assert (=> b!316384 (= e!196785 (bvsge (x!31494 lt!154532) #b01111111111111111111111111111110))))

(declare-fun b!316385 () Bool)

(assert (=> b!316385 (= e!196782 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 (array!16117 (store (arr!7628 a!3293) i!1240 k!2441) (size!7980 a!3293)) mask!3709))))

(assert (= (and d!68993 c!50105) b!316377))

(assert (= (and d!68993 (not c!50105)) b!316382))

(assert (= (and b!316382 c!50106) b!316381))

(assert (= (and b!316382 (not c!50106)) b!316385))

(assert (= (and d!68993 c!50104) b!316384))

(assert (= (and d!68993 (not c!50104)) b!316378))

(assert (= (and b!316378 res!171405) b!316380))

(assert (= (and b!316380 (not res!171406)) b!316379))

(assert (= (and b!316379 (not res!171407)) b!316383))

(declare-fun m!325289 () Bool)

(assert (=> b!316379 m!325289))

(assert (=> b!316385 m!325171))

(assert (=> b!316385 m!325171))

(declare-fun m!325291 () Bool)

(assert (=> b!316385 m!325291))

(declare-fun m!325293 () Bool)

(assert (=> d!68993 m!325293))

(assert (=> d!68993 m!325157))

(assert (=> b!316380 m!325289))

(assert (=> b!316383 m!325289))

(assert (=> b!316156 d!68993))

(declare-fun d!69007 () Bool)

(assert (=> d!69007 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316157 d!69007))

(declare-fun b!316394 () Bool)

(declare-fun e!196797 () SeekEntryResult!2768)

(assert (=> b!316394 (= e!196797 (Intermediate!2768 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!69009 () Bool)

(declare-fun e!196796 () Bool)

(assert (=> d!69009 e!196796))

(declare-fun c!50109 () Bool)

(declare-fun lt!154540 () SeekEntryResult!2768)

(assert (=> d!69009 (= c!50109 (and (is-Intermediate!2768 lt!154540) (undefined!3580 lt!154540)))))

(assert (=> d!69009 (= lt!154540 e!196797)))

(declare-fun c!50110 () Bool)

(assert (=> d!69009 (= c!50110 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154541 () (_ BitVec 64))

(assert (=> d!69009 (= lt!154541 (select (arr!7628 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!69009 (validMask!0 mask!3709)))

(assert (=> d!69009 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154540)))

(declare-fun b!316395 () Bool)

(declare-fun e!196794 () Bool)

(assert (=> b!316395 (= e!196796 e!196794)))

(declare-fun res!171412 () Bool)

(assert (=> b!316395 (= res!171412 (and (is-Intermediate!2768 lt!154540) (not (undefined!3580 lt!154540)) (bvslt (x!31494 lt!154540) #b01111111111111111111111111111110) (bvsge (x!31494 lt!154540) #b00000000000000000000000000000000) (bvsge (x!31494 lt!154540) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316395 (=> (not res!171412) (not e!196794))))

(declare-fun b!316396 () Bool)

(assert (=> b!316396 (and (bvsge (index!13250 lt!154540) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154540) (size!7980 a!3293)))))

(declare-fun res!171414 () Bool)

(assert (=> b!316396 (= res!171414 (= (select (arr!7628 a!3293) (index!13250 lt!154540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196795 () Bool)

(assert (=> b!316396 (=> res!171414 e!196795)))

(declare-fun b!316397 () Bool)

(assert (=> b!316397 (and (bvsge (index!13250 lt!154540) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154540) (size!7980 a!3293)))))

(declare-fun res!171413 () Bool)

(assert (=> b!316397 (= res!171413 (= (select (arr!7628 a!3293) (index!13250 lt!154540)) k!2441))))

(assert (=> b!316397 (=> res!171413 e!196795)))

(assert (=> b!316397 (= e!196794 e!196795)))

(declare-fun b!316398 () Bool)

(declare-fun e!196793 () SeekEntryResult!2768)

(assert (=> b!316398 (= e!196793 (Intermediate!2768 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316399 () Bool)

(assert (=> b!316399 (= e!196797 e!196793)))

(declare-fun c!50111 () Bool)

(assert (=> b!316399 (= c!50111 (or (= lt!154541 k!2441) (= (bvadd lt!154541 lt!154541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316400 () Bool)

(assert (=> b!316400 (and (bvsge (index!13250 lt!154540) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154540) (size!7980 a!3293)))))

(assert (=> b!316400 (= e!196795 (= (select (arr!7628 a!3293) (index!13250 lt!154540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316401 () Bool)

(assert (=> b!316401 (= e!196796 (bvsge (x!31494 lt!154540) #b01111111111111111111111111111110))))

(declare-fun b!316402 () Bool)

(assert (=> b!316402 (= e!196793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69009 c!50110) b!316394))

(assert (= (and d!69009 (not c!50110)) b!316399))

(assert (= (and b!316399 c!50111) b!316398))

(assert (= (and b!316399 (not c!50111)) b!316402))

(assert (= (and d!69009 c!50109) b!316401))

(assert (= (and d!69009 (not c!50109)) b!316395))

(assert (= (and b!316395 res!171412) b!316397))

(assert (= (and b!316397 (not res!171413)) b!316396))

(assert (= (and b!316396 (not res!171414)) b!316400))

(declare-fun m!325295 () Bool)

(assert (=> b!316396 m!325295))

(assert (=> b!316402 m!325171))

(declare-fun m!325297 () Bool)

(assert (=> b!316402 m!325297))

(assert (=> b!316402 m!325297))

(declare-fun m!325299 () Bool)

(assert (=> b!316402 m!325299))

(assert (=> d!69009 m!325171))

(declare-fun m!325301 () Bool)

(assert (=> d!69009 m!325301))

(assert (=> d!69009 m!325157))

(assert (=> b!316397 m!325295))

(assert (=> b!316400 m!325295))

(assert (=> b!316161 d!69009))

(declare-fun d!69011 () Bool)

(declare-fun lt!154549 () (_ BitVec 32))

(assert (=> d!69011 (and (bvsge lt!154549 #b00000000000000000000000000000000) (bvslt lt!154549 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69011 (= lt!154549 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69011 (validMask!0 mask!3709)))

(assert (=> d!69011 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154549)))

(declare-fun bs!11046 () Bool)

(assert (= bs!11046 d!69011))

(declare-fun m!325319 () Bool)

(assert (=> bs!11046 m!325319))

(assert (=> bs!11046 m!325157))

(assert (=> b!316161 d!69011))

(declare-fun d!69021 () Bool)

(assert (=> d!69021 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31592 d!69021))

(declare-fun d!69029 () Bool)

(assert (=> d!69029 (= (array_inv!5591 a!3293) (bvsge (size!7980 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31592 d!69029))

(declare-fun b!316442 () Bool)

(declare-fun e!196828 () Bool)

(declare-fun call!26008 () Bool)

(assert (=> b!316442 (= e!196828 call!26008)))

(declare-fun d!69031 () Bool)

(declare-fun res!171437 () Bool)

(declare-fun e!196829 () Bool)

(assert (=> d!69031 (=> res!171437 e!196829)))

(assert (=> d!69031 (= res!171437 (bvsge #b00000000000000000000000000000000 (size!7980 a!3293)))))

(assert (=> d!69031 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196829)))

(declare-fun b!316443 () Bool)

(declare-fun e!196827 () Bool)

(assert (=> b!316443 (= e!196827 call!26008)))

(declare-fun b!316444 () Bool)

(assert (=> b!316444 (= e!196829 e!196828)))

(declare-fun c!50121 () Bool)

(assert (=> b!316444 (= c!50121 (validKeyInArray!0 (select (arr!7628 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!26005 () Bool)

(assert (=> bm!26005 (= call!26008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316445 () Bool)

(assert (=> b!316445 (= e!196828 e!196827)))

(declare-fun lt!154567 () (_ BitVec 64))

(assert (=> b!316445 (= lt!154567 (select (arr!7628 a!3293) #b00000000000000000000000000000000))))

(declare-fun lt!154566 () Unit!9767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16116 (_ BitVec 64) (_ BitVec 32)) Unit!9767)

(assert (=> b!316445 (= lt!154566 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154567 #b00000000000000000000000000000000))))

(assert (=> b!316445 (arrayContainsKey!0 a!3293 lt!154567 #b00000000000000000000000000000000)))

(declare-fun lt!154565 () Unit!9767)

(assert (=> b!316445 (= lt!154565 lt!154566)))

(declare-fun res!171436 () Bool)

(assert (=> b!316445 (= res!171436 (= (seekEntryOrOpen!0 (select (arr!7628 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2768 #b00000000000000000000000000000000)))))

(assert (=> b!316445 (=> (not res!171436) (not e!196827))))

(assert (= (and d!69031 (not res!171437)) b!316444))

(assert (= (and b!316444 c!50121) b!316445))

(assert (= (and b!316444 (not c!50121)) b!316442))

(assert (= (and b!316445 res!171436) b!316443))

(assert (= (or b!316443 b!316442) bm!26005))

(assert (=> b!316444 m!325257))

(assert (=> b!316444 m!325257))

(declare-fun m!325335 () Bool)

(assert (=> b!316444 m!325335))

(declare-fun m!325337 () Bool)

(assert (=> bm!26005 m!325337))

(assert (=> b!316445 m!325257))

(declare-fun m!325339 () Bool)

(assert (=> b!316445 m!325339))

(declare-fun m!325341 () Bool)

(assert (=> b!316445 m!325341))

(assert (=> b!316445 m!325257))

(declare-fun m!325343 () Bool)

(assert (=> b!316445 m!325343))

(assert (=> b!316159 d!69031))

(declare-fun b!316446 () Bool)

(declare-fun e!196834 () SeekEntryResult!2768)

(assert (=> b!316446 (= e!196834 (Intermediate!2768 true index!1781 x!1427))))

(declare-fun d!69033 () Bool)

(declare-fun e!196833 () Bool)

(assert (=> d!69033 e!196833))

(declare-fun c!50122 () Bool)

(declare-fun lt!154568 () SeekEntryResult!2768)

(assert (=> d!69033 (= c!50122 (and (is-Intermediate!2768 lt!154568) (undefined!3580 lt!154568)))))

(assert (=> d!69033 (= lt!154568 e!196834)))

(declare-fun c!50123 () Bool)

(assert (=> d!69033 (= c!50123 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154569 () (_ BitVec 64))

(assert (=> d!69033 (= lt!154569 (select (arr!7628 a!3293) index!1781))))

(assert (=> d!69033 (validMask!0 mask!3709)))

(assert (=> d!69033 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154568)))

(declare-fun b!316447 () Bool)

(declare-fun e!196831 () Bool)

(assert (=> b!316447 (= e!196833 e!196831)))

(declare-fun res!171438 () Bool)

(assert (=> b!316447 (= res!171438 (and (is-Intermediate!2768 lt!154568) (not (undefined!3580 lt!154568)) (bvslt (x!31494 lt!154568) #b01111111111111111111111111111110) (bvsge (x!31494 lt!154568) #b00000000000000000000000000000000) (bvsge (x!31494 lt!154568) x!1427)))))

(assert (=> b!316447 (=> (not res!171438) (not e!196831))))

(declare-fun b!316448 () Bool)

(assert (=> b!316448 (and (bvsge (index!13250 lt!154568) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154568) (size!7980 a!3293)))))

(declare-fun res!171440 () Bool)

(assert (=> b!316448 (= res!171440 (= (select (arr!7628 a!3293) (index!13250 lt!154568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196832 () Bool)

(assert (=> b!316448 (=> res!171440 e!196832)))

(declare-fun b!316449 () Bool)

(assert (=> b!316449 (and (bvsge (index!13250 lt!154568) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154568) (size!7980 a!3293)))))

(declare-fun res!171439 () Bool)

(assert (=> b!316449 (= res!171439 (= (select (arr!7628 a!3293) (index!13250 lt!154568)) k!2441))))

(assert (=> b!316449 (=> res!171439 e!196832)))

(assert (=> b!316449 (= e!196831 e!196832)))

(declare-fun b!316450 () Bool)

(declare-fun e!196830 () SeekEntryResult!2768)

(assert (=> b!316450 (= e!196830 (Intermediate!2768 false index!1781 x!1427))))

(declare-fun b!316451 () Bool)

(assert (=> b!316451 (= e!196834 e!196830)))

(declare-fun c!50124 () Bool)

(assert (=> b!316451 (= c!50124 (or (= lt!154569 k!2441) (= (bvadd lt!154569 lt!154569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316452 () Bool)

(assert (=> b!316452 (and (bvsge (index!13250 lt!154568) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154568) (size!7980 a!3293)))))

(assert (=> b!316452 (= e!196832 (= (select (arr!7628 a!3293) (index!13250 lt!154568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316453 () Bool)

(assert (=> b!316453 (= e!196833 (bvsge (x!31494 lt!154568) #b01111111111111111111111111111110))))

(declare-fun b!316454 () Bool)

(assert (=> b!316454 (= e!196830 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69033 c!50123) b!316446))

(assert (= (and d!69033 (not c!50123)) b!316451))

(assert (= (and b!316451 c!50124) b!316450))

(assert (= (and b!316451 (not c!50124)) b!316454))

(assert (= (and d!69033 c!50122) b!316453))

(assert (= (and d!69033 (not c!50122)) b!316447))

(assert (= (and b!316447 res!171438) b!316449))

(assert (= (and b!316449 (not res!171439)) b!316448))

(assert (= (and b!316448 (not res!171440)) b!316452))

(declare-fun m!325345 () Bool)

(assert (=> b!316448 m!325345))

(assert (=> b!316454 m!325171))

(assert (=> b!316454 m!325171))

(declare-fun m!325347 () Bool)

(assert (=> b!316454 m!325347))

(assert (=> d!69033 m!325153))

(assert (=> d!69033 m!325157))

(assert (=> b!316449 m!325345))

(assert (=> b!316452 m!325345))

(assert (=> b!316152 d!69033))

(declare-fun b!316455 () Bool)

(declare-fun e!196839 () SeekEntryResult!2768)

(assert (=> b!316455 (= e!196839 (Intermediate!2768 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!69035 () Bool)

(declare-fun e!196838 () Bool)

(assert (=> d!69035 e!196838))

(declare-fun c!50125 () Bool)

(declare-fun lt!154570 () SeekEntryResult!2768)

(assert (=> d!69035 (= c!50125 (and (is-Intermediate!2768 lt!154570) (undefined!3580 lt!154570)))))

(assert (=> d!69035 (= lt!154570 e!196839)))

(declare-fun c!50126 () Bool)

(assert (=> d!69035 (= c!50126 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154571 () (_ BitVec 64))

(assert (=> d!69035 (= lt!154571 (select (arr!7628 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69035 (validMask!0 mask!3709)))

(assert (=> d!69035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154570)))

(declare-fun b!316456 () Bool)

(declare-fun e!196836 () Bool)

(assert (=> b!316456 (= e!196838 e!196836)))

(declare-fun res!171441 () Bool)

(assert (=> b!316456 (= res!171441 (and (is-Intermediate!2768 lt!154570) (not (undefined!3580 lt!154570)) (bvslt (x!31494 lt!154570) #b01111111111111111111111111111110) (bvsge (x!31494 lt!154570) #b00000000000000000000000000000000) (bvsge (x!31494 lt!154570) #b00000000000000000000000000000000)))))

(assert (=> b!316456 (=> (not res!171441) (not e!196836))))

(declare-fun b!316457 () Bool)

(assert (=> b!316457 (and (bvsge (index!13250 lt!154570) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154570) (size!7980 a!3293)))))

(declare-fun res!171443 () Bool)

(assert (=> b!316457 (= res!171443 (= (select (arr!7628 a!3293) (index!13250 lt!154570)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196837 () Bool)

(assert (=> b!316457 (=> res!171443 e!196837)))

(declare-fun b!316458 () Bool)

(assert (=> b!316458 (and (bvsge (index!13250 lt!154570) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154570) (size!7980 a!3293)))))

(declare-fun res!171442 () Bool)

(assert (=> b!316458 (= res!171442 (= (select (arr!7628 a!3293) (index!13250 lt!154570)) k!2441))))

(assert (=> b!316458 (=> res!171442 e!196837)))

(assert (=> b!316458 (= e!196836 e!196837)))

(declare-fun b!316459 () Bool)

(declare-fun e!196835 () SeekEntryResult!2768)

(assert (=> b!316459 (= e!196835 (Intermediate!2768 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316460 () Bool)

(assert (=> b!316460 (= e!196839 e!196835)))

(declare-fun c!50127 () Bool)

(assert (=> b!316460 (= c!50127 (or (= lt!154571 k!2441) (= (bvadd lt!154571 lt!154571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316461 () Bool)

(assert (=> b!316461 (and (bvsge (index!13250 lt!154570) #b00000000000000000000000000000000) (bvslt (index!13250 lt!154570) (size!7980 a!3293)))))

(assert (=> b!316461 (= e!196837 (= (select (arr!7628 a!3293) (index!13250 lt!154570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316462 () Bool)

(assert (=> b!316462 (= e!196838 (bvsge (x!31494 lt!154570) #b01111111111111111111111111111110))))

(declare-fun b!316463 () Bool)

(assert (=> b!316463 (= e!196835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!69035 c!50126) b!316455))

(assert (= (and d!69035 (not c!50126)) b!316460))

