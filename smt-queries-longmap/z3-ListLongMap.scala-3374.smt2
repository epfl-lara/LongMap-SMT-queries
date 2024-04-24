; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46406 () Bool)

(assert start!46406)

(declare-fun b!513462 () Bool)

(declare-fun res!313822 () Bool)

(declare-fun e!299823 () Bool)

(assert (=> b!513462 (=> (not res!313822) (not e!299823))))

(declare-datatypes ((array!32947 0))(
  ( (array!32948 (arr!15847 (Array (_ BitVec 32) (_ BitVec 64))) (size!16211 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32947)

(declare-datatypes ((List!9912 0))(
  ( (Nil!9909) (Cons!9908 (h!10794 (_ BitVec 64)) (t!16132 List!9912)) )
))
(declare-fun arrayNoDuplicates!0 (array!32947 (_ BitVec 32) List!9912) Bool)

(assert (=> b!513462 (= res!313822 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9909))))

(declare-fun b!513463 () Bool)

(declare-fun e!299824 () Bool)

(assert (=> b!513463 (= e!299823 (not e!299824))))

(declare-fun res!313817 () Bool)

(assert (=> b!513463 (=> res!313817 e!299824)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4270 0))(
  ( (MissingZero!4270 (index!19268 (_ BitVec 32))) (Found!4270 (index!19269 (_ BitVec 32))) (Intermediate!4270 (undefined!5082 Bool) (index!19270 (_ BitVec 32)) (x!48366 (_ BitVec 32))) (Undefined!4270) (MissingVacant!4270 (index!19271 (_ BitVec 32))) )
))
(declare-fun lt!235118 () SeekEntryResult!4270)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235120 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32947 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!513463 (= res!313817 (= lt!235118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235120 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524)))))

(declare-fun lt!235119 () (_ BitVec 32))

(assert (=> b!513463 (= lt!235118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235119 (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513463 (= lt!235120 (toIndex!0 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513463 (= lt!235119 (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524))))

(declare-fun e!299826 () Bool)

(assert (=> b!513463 e!299826))

(declare-fun res!313820 () Bool)

(assert (=> b!513463 (=> (not res!313820) (not e!299826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32947 (_ BitVec 32)) Bool)

(assert (=> b!513463 (= res!313820 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15859 0))(
  ( (Unit!15860) )
))
(declare-fun lt!235117 () Unit!15859)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15859)

(assert (=> b!513463 (= lt!235117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513464 () Bool)

(declare-fun res!313818 () Bool)

(assert (=> b!513464 (=> res!313818 e!299824)))

(get-info :version)

(assert (=> b!513464 (= res!313818 (or (undefined!5082 lt!235118) (not ((_ is Intermediate!4270) lt!235118))))))

(declare-fun b!513465 () Bool)

(declare-fun res!313813 () Bool)

(assert (=> b!513465 (=> (not res!313813) (not e!299823))))

(assert (=> b!513465 (= res!313813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513466 () Bool)

(assert (=> b!513466 (= e!299824 (or (= (select (arr!15847 a!3235) (index!19270 lt!235118)) (select (arr!15847 a!3235) j!176)) (and (bvsge (index!19270 lt!235118) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235118) (size!16211 a!3235)))))))

(assert (=> b!513466 (bvslt (x!48366 lt!235118) #b01111111111111111111111111111110)))

(declare-fun res!313819 () Bool)

(declare-fun e!299825 () Bool)

(assert (=> start!46406 (=> (not res!313819) (not e!299825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46406 (= res!313819 (validMask!0 mask!3524))))

(assert (=> start!46406 e!299825))

(assert (=> start!46406 true))

(declare-fun array_inv!11706 (array!32947) Bool)

(assert (=> start!46406 (array_inv!11706 a!3235)))

(declare-fun b!513467 () Bool)

(declare-fun res!313814 () Bool)

(assert (=> b!513467 (=> (not res!313814) (not e!299825))))

(assert (=> b!513467 (= res!313814 (and (= (size!16211 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16211 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16211 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513468 () Bool)

(declare-fun res!313816 () Bool)

(assert (=> b!513468 (=> (not res!313816) (not e!299825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513468 (= res!313816 (validKeyInArray!0 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513469 () Bool)

(declare-fun res!313821 () Bool)

(assert (=> b!513469 (=> (not res!313821) (not e!299825))))

(assert (=> b!513469 (= res!313821 (validKeyInArray!0 k0!2280))))

(declare-fun b!513470 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32947 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!513470 (= e!299826 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) (Found!4270 j!176)))))

(declare-fun b!513471 () Bool)

(declare-fun res!313812 () Bool)

(assert (=> b!513471 (=> (not res!313812) (not e!299825))))

(declare-fun arrayContainsKey!0 (array!32947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513471 (= res!313812 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513472 () Bool)

(assert (=> b!513472 (= e!299825 e!299823)))

(declare-fun res!313815 () Bool)

(assert (=> b!513472 (=> (not res!313815) (not e!299823))))

(declare-fun lt!235116 () SeekEntryResult!4270)

(assert (=> b!513472 (= res!313815 (or (= lt!235116 (MissingZero!4270 i!1204)) (= lt!235116 (MissingVacant!4270 i!1204))))))

(assert (=> b!513472 (= lt!235116 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46406 res!313819) b!513467))

(assert (= (and b!513467 res!313814) b!513468))

(assert (= (and b!513468 res!313816) b!513469))

(assert (= (and b!513469 res!313821) b!513471))

(assert (= (and b!513471 res!313812) b!513472))

(assert (= (and b!513472 res!313815) b!513465))

(assert (= (and b!513465 res!313813) b!513462))

(assert (= (and b!513462 res!313822) b!513463))

(assert (= (and b!513463 res!313820) b!513470))

(assert (= (and b!513463 (not res!313817)) b!513464))

(assert (= (and b!513464 (not res!313818)) b!513466))

(declare-fun m!495277 () Bool)

(assert (=> b!513465 m!495277))

(declare-fun m!495279 () Bool)

(assert (=> b!513470 m!495279))

(assert (=> b!513470 m!495279))

(declare-fun m!495281 () Bool)

(assert (=> b!513470 m!495281))

(declare-fun m!495283 () Bool)

(assert (=> b!513462 m!495283))

(declare-fun m!495285 () Bool)

(assert (=> start!46406 m!495285))

(declare-fun m!495287 () Bool)

(assert (=> start!46406 m!495287))

(assert (=> b!513468 m!495279))

(assert (=> b!513468 m!495279))

(declare-fun m!495289 () Bool)

(assert (=> b!513468 m!495289))

(declare-fun m!495291 () Bool)

(assert (=> b!513463 m!495291))

(declare-fun m!495293 () Bool)

(assert (=> b!513463 m!495293))

(assert (=> b!513463 m!495279))

(declare-fun m!495295 () Bool)

(assert (=> b!513463 m!495295))

(assert (=> b!513463 m!495279))

(declare-fun m!495297 () Bool)

(assert (=> b!513463 m!495297))

(assert (=> b!513463 m!495279))

(declare-fun m!495299 () Bool)

(assert (=> b!513463 m!495299))

(assert (=> b!513463 m!495293))

(declare-fun m!495301 () Bool)

(assert (=> b!513463 m!495301))

(assert (=> b!513463 m!495293))

(declare-fun m!495303 () Bool)

(assert (=> b!513463 m!495303))

(declare-fun m!495305 () Bool)

(assert (=> b!513463 m!495305))

(declare-fun m!495307 () Bool)

(assert (=> b!513466 m!495307))

(assert (=> b!513466 m!495279))

(declare-fun m!495309 () Bool)

(assert (=> b!513472 m!495309))

(declare-fun m!495311 () Bool)

(assert (=> b!513469 m!495311))

(declare-fun m!495313 () Bool)

(assert (=> b!513471 m!495313))

(check-sat (not b!513463) (not b!513468) (not start!46406) (not b!513470) (not b!513469) (not b!513462) (not b!513471) (not b!513472) (not b!513465))
(check-sat)
(get-model)

(declare-fun d!79209 () Bool)

(declare-fun res!313893 () Bool)

(declare-fun e!299861 () Bool)

(assert (=> d!79209 (=> res!313893 e!299861)))

(assert (=> d!79209 (= res!313893 (= (select (arr!15847 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79209 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299861)))

(declare-fun b!513543 () Bool)

(declare-fun e!299862 () Bool)

(assert (=> b!513543 (= e!299861 e!299862)))

(declare-fun res!313894 () Bool)

(assert (=> b!513543 (=> (not res!313894) (not e!299862))))

(assert (=> b!513543 (= res!313894 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16211 a!3235)))))

(declare-fun b!513544 () Bool)

(assert (=> b!513544 (= e!299862 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79209 (not res!313893)) b!513543))

(assert (= (and b!513543 res!313894) b!513544))

(declare-fun m!495391 () Bool)

(assert (=> d!79209 m!495391))

(declare-fun m!495393 () Bool)

(assert (=> b!513544 m!495393))

(assert (=> b!513471 d!79209))

(declare-fun b!513557 () Bool)

(declare-fun e!299871 () SeekEntryResult!4270)

(declare-fun lt!235158 () SeekEntryResult!4270)

(assert (=> b!513557 (= e!299871 (Found!4270 (index!19270 lt!235158)))))

(declare-fun b!513558 () Bool)

(declare-fun c!60114 () Bool)

(declare-fun lt!235157 () (_ BitVec 64))

(assert (=> b!513558 (= c!60114 (= lt!235157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299869 () SeekEntryResult!4270)

(assert (=> b!513558 (= e!299871 e!299869)))

(declare-fun d!79211 () Bool)

(declare-fun lt!235159 () SeekEntryResult!4270)

(assert (=> d!79211 (and (or ((_ is Undefined!4270) lt!235159) (not ((_ is Found!4270) lt!235159)) (and (bvsge (index!19269 lt!235159) #b00000000000000000000000000000000) (bvslt (index!19269 lt!235159) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235159) ((_ is Found!4270) lt!235159) (not ((_ is MissingZero!4270) lt!235159)) (and (bvsge (index!19268 lt!235159) #b00000000000000000000000000000000) (bvslt (index!19268 lt!235159) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235159) ((_ is Found!4270) lt!235159) ((_ is MissingZero!4270) lt!235159) (not ((_ is MissingVacant!4270) lt!235159)) (and (bvsge (index!19271 lt!235159) #b00000000000000000000000000000000) (bvslt (index!19271 lt!235159) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235159) (ite ((_ is Found!4270) lt!235159) (= (select (arr!15847 a!3235) (index!19269 lt!235159)) (select (arr!15847 a!3235) j!176)) (ite ((_ is MissingZero!4270) lt!235159) (= (select (arr!15847 a!3235) (index!19268 lt!235159)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4270) lt!235159) (= (select (arr!15847 a!3235) (index!19271 lt!235159)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299870 () SeekEntryResult!4270)

(assert (=> d!79211 (= lt!235159 e!299870)))

(declare-fun c!60116 () Bool)

(assert (=> d!79211 (= c!60116 (and ((_ is Intermediate!4270) lt!235158) (undefined!5082 lt!235158)))))

(assert (=> d!79211 (= lt!235158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79211 (validMask!0 mask!3524)))

(assert (=> d!79211 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) lt!235159)))

(declare-fun b!513559 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32947 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!513559 (= e!299869 (seekKeyOrZeroReturnVacant!0 (x!48366 lt!235158) (index!19270 lt!235158) (index!19270 lt!235158) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513560 () Bool)

(assert (=> b!513560 (= e!299870 Undefined!4270)))

(declare-fun b!513561 () Bool)

(assert (=> b!513561 (= e!299870 e!299871)))

(assert (=> b!513561 (= lt!235157 (select (arr!15847 a!3235) (index!19270 lt!235158)))))

(declare-fun c!60115 () Bool)

(assert (=> b!513561 (= c!60115 (= lt!235157 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513562 () Bool)

(assert (=> b!513562 (= e!299869 (MissingZero!4270 (index!19270 lt!235158)))))

(assert (= (and d!79211 c!60116) b!513560))

(assert (= (and d!79211 (not c!60116)) b!513561))

(assert (= (and b!513561 c!60115) b!513557))

(assert (= (and b!513561 (not c!60115)) b!513558))

(assert (= (and b!513558 c!60114) b!513562))

(assert (= (and b!513558 (not c!60114)) b!513559))

(assert (=> d!79211 m!495279))

(assert (=> d!79211 m!495297))

(declare-fun m!495395 () Bool)

(assert (=> d!79211 m!495395))

(declare-fun m!495397 () Bool)

(assert (=> d!79211 m!495397))

(assert (=> d!79211 m!495297))

(assert (=> d!79211 m!495279))

(declare-fun m!495399 () Bool)

(assert (=> d!79211 m!495399))

(declare-fun m!495401 () Bool)

(assert (=> d!79211 m!495401))

(assert (=> d!79211 m!495285))

(assert (=> b!513559 m!495279))

(declare-fun m!495403 () Bool)

(assert (=> b!513559 m!495403))

(declare-fun m!495405 () Bool)

(assert (=> b!513561 m!495405))

(assert (=> b!513470 d!79211))

(declare-fun b!513575 () Bool)

(declare-fun e!299882 () Bool)

(declare-fun call!31545 () Bool)

(assert (=> b!513575 (= e!299882 call!31545)))

(declare-fun b!513576 () Bool)

(declare-fun e!299883 () Bool)

(assert (=> b!513576 (= e!299883 call!31545)))

(declare-fun bm!31542 () Bool)

(assert (=> bm!31542 (= call!31545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79213 () Bool)

(declare-fun res!313903 () Bool)

(declare-fun e!299884 () Bool)

(assert (=> d!79213 (=> res!313903 e!299884)))

(assert (=> d!79213 (= res!313903 (bvsge #b00000000000000000000000000000000 (size!16211 a!3235)))))

(assert (=> d!79213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299884)))

(declare-fun b!513577 () Bool)

(assert (=> b!513577 (= e!299884 e!299883)))

(declare-fun c!60119 () Bool)

(assert (=> b!513577 (= c!60119 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513578 () Bool)

(assert (=> b!513578 (= e!299883 e!299882)))

(declare-fun lt!235167 () (_ BitVec 64))

(assert (=> b!513578 (= lt!235167 (select (arr!15847 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235166 () Unit!15859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32947 (_ BitVec 64) (_ BitVec 32)) Unit!15859)

(assert (=> b!513578 (= lt!235166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235167 #b00000000000000000000000000000000))))

(assert (=> b!513578 (arrayContainsKey!0 a!3235 lt!235167 #b00000000000000000000000000000000)))

(declare-fun lt!235168 () Unit!15859)

(assert (=> b!513578 (= lt!235168 lt!235166)))

(declare-fun res!313904 () Bool)

(assert (=> b!513578 (= res!313904 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4270 #b00000000000000000000000000000000)))))

(assert (=> b!513578 (=> (not res!313904) (not e!299882))))

(assert (= (and d!79213 (not res!313903)) b!513577))

(assert (= (and b!513577 c!60119) b!513578))

(assert (= (and b!513577 (not c!60119)) b!513576))

(assert (= (and b!513578 res!313904) b!513575))

(assert (= (or b!513575 b!513576) bm!31542))

(declare-fun m!495407 () Bool)

(assert (=> bm!31542 m!495407))

(assert (=> b!513577 m!495391))

(assert (=> b!513577 m!495391))

(declare-fun m!495409 () Bool)

(assert (=> b!513577 m!495409))

(assert (=> b!513578 m!495391))

(declare-fun m!495411 () Bool)

(assert (=> b!513578 m!495411))

(declare-fun m!495413 () Bool)

(assert (=> b!513578 m!495413))

(assert (=> b!513578 m!495391))

(declare-fun m!495415 () Bool)

(assert (=> b!513578 m!495415))

(assert (=> b!513465 d!79213))

(declare-fun d!79217 () Bool)

(assert (=> d!79217 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513469 d!79217))

(declare-fun d!79223 () Bool)

(assert (=> d!79223 (= (validKeyInArray!0 (select (arr!15847 a!3235) j!176)) (and (not (= (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15847 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513468 d!79223))

(declare-fun d!79225 () Bool)

(declare-fun e!299918 () Bool)

(assert (=> d!79225 e!299918))

(declare-fun c!60138 () Bool)

(declare-fun lt!235197 () SeekEntryResult!4270)

(assert (=> d!79225 (= c!60138 (and ((_ is Intermediate!4270) lt!235197) (undefined!5082 lt!235197)))))

(declare-fun e!299916 () SeekEntryResult!4270)

(assert (=> d!79225 (= lt!235197 e!299916)))

(declare-fun c!60140 () Bool)

(assert (=> d!79225 (= c!60140 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235198 () (_ BitVec 64))

(assert (=> d!79225 (= lt!235198 (select (arr!15847 a!3235) lt!235119))))

(assert (=> d!79225 (validMask!0 mask!3524)))

(assert (=> d!79225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235119 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) lt!235197)))

(declare-fun b!513629 () Bool)

(declare-fun e!299917 () SeekEntryResult!4270)

(assert (=> b!513629 (= e!299916 e!299917)))

(declare-fun c!60139 () Bool)

(assert (=> b!513629 (= c!60139 (or (= lt!235198 (select (arr!15847 a!3235) j!176)) (= (bvadd lt!235198 lt!235198) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513630 () Bool)

(assert (=> b!513630 (= e!299917 (Intermediate!4270 false lt!235119 #b00000000000000000000000000000000))))

(declare-fun b!513631 () Bool)

(assert (=> b!513631 (= e!299918 (bvsge (x!48366 lt!235197) #b01111111111111111111111111111110))))

(declare-fun b!513632 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513632 (= e!299917 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235119 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513633 () Bool)

(assert (=> b!513633 (= e!299916 (Intermediate!4270 true lt!235119 #b00000000000000000000000000000000))))

(declare-fun b!513634 () Bool)

(declare-fun e!299919 () Bool)

(assert (=> b!513634 (= e!299918 e!299919)))

(declare-fun res!313920 () Bool)

(assert (=> b!513634 (= res!313920 (and ((_ is Intermediate!4270) lt!235197) (not (undefined!5082 lt!235197)) (bvslt (x!48366 lt!235197) #b01111111111111111111111111111110) (bvsge (x!48366 lt!235197) #b00000000000000000000000000000000) (bvsge (x!48366 lt!235197) #b00000000000000000000000000000000)))))

(assert (=> b!513634 (=> (not res!313920) (not e!299919))))

(declare-fun b!513635 () Bool)

(assert (=> b!513635 (and (bvsge (index!19270 lt!235197) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235197) (size!16211 a!3235)))))

(declare-fun res!313921 () Bool)

(assert (=> b!513635 (= res!313921 (= (select (arr!15847 a!3235) (index!19270 lt!235197)) (select (arr!15847 a!3235) j!176)))))

(declare-fun e!299915 () Bool)

(assert (=> b!513635 (=> res!313921 e!299915)))

(assert (=> b!513635 (= e!299919 e!299915)))

(declare-fun b!513636 () Bool)

(assert (=> b!513636 (and (bvsge (index!19270 lt!235197) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235197) (size!16211 a!3235)))))

(declare-fun res!313922 () Bool)

(assert (=> b!513636 (= res!313922 (= (select (arr!15847 a!3235) (index!19270 lt!235197)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513636 (=> res!313922 e!299915)))

(declare-fun b!513637 () Bool)

(assert (=> b!513637 (and (bvsge (index!19270 lt!235197) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235197) (size!16211 a!3235)))))

(assert (=> b!513637 (= e!299915 (= (select (arr!15847 a!3235) (index!19270 lt!235197)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79225 c!60140) b!513633))

(assert (= (and d!79225 (not c!60140)) b!513629))

(assert (= (and b!513629 c!60139) b!513630))

(assert (= (and b!513629 (not c!60139)) b!513632))

(assert (= (and d!79225 c!60138) b!513631))

(assert (= (and d!79225 (not c!60138)) b!513634))

(assert (= (and b!513634 res!313920) b!513635))

(assert (= (and b!513635 (not res!313921)) b!513636))

(assert (= (and b!513636 (not res!313922)) b!513637))

(declare-fun m!495437 () Bool)

(assert (=> b!513637 m!495437))

(declare-fun m!495439 () Bool)

(assert (=> b!513632 m!495439))

(assert (=> b!513632 m!495439))

(assert (=> b!513632 m!495279))

(declare-fun m!495445 () Bool)

(assert (=> b!513632 m!495445))

(declare-fun m!495447 () Bool)

(assert (=> d!79225 m!495447))

(assert (=> d!79225 m!495285))

(assert (=> b!513636 m!495437))

(assert (=> b!513635 m!495437))

(assert (=> b!513463 d!79225))

(declare-fun d!79237 () Bool)

(declare-fun lt!235204 () (_ BitVec 32))

(declare-fun lt!235203 () (_ BitVec 32))

(assert (=> d!79237 (= lt!235204 (bvmul (bvxor lt!235203 (bvlshr lt!235203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79237 (= lt!235203 ((_ extract 31 0) (bvand (bvxor (select (arr!15847 a!3235) j!176) (bvlshr (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79237 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313923 (let ((h!10798 ((_ extract 31 0) (bvand (bvxor (select (arr!15847 a!3235) j!176) (bvlshr (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48371 (bvmul (bvxor h!10798 (bvlshr h!10798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48371 (bvlshr x!48371 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313923 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313923 #b00000000000000000000000000000000))))))

(assert (=> d!79237 (= (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524) (bvand (bvxor lt!235204 (bvlshr lt!235204 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513463 d!79237))

(declare-fun b!513638 () Bool)

(declare-fun e!299920 () Bool)

(declare-fun call!31549 () Bool)

(assert (=> b!513638 (= e!299920 call!31549)))

(declare-fun b!513639 () Bool)

(declare-fun e!299921 () Bool)

(assert (=> b!513639 (= e!299921 call!31549)))

(declare-fun bm!31546 () Bool)

(assert (=> bm!31546 (= call!31549 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79239 () Bool)

(declare-fun res!313924 () Bool)

(declare-fun e!299922 () Bool)

(assert (=> d!79239 (=> res!313924 e!299922)))

(assert (=> d!79239 (= res!313924 (bvsge j!176 (size!16211 a!3235)))))

(assert (=> d!79239 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299922)))

(declare-fun b!513640 () Bool)

(assert (=> b!513640 (= e!299922 e!299921)))

(declare-fun c!60141 () Bool)

(assert (=> b!513640 (= c!60141 (validKeyInArray!0 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513641 () Bool)

(assert (=> b!513641 (= e!299921 e!299920)))

(declare-fun lt!235206 () (_ BitVec 64))

(assert (=> b!513641 (= lt!235206 (select (arr!15847 a!3235) j!176))))

(declare-fun lt!235205 () Unit!15859)

(assert (=> b!513641 (= lt!235205 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235206 j!176))))

(assert (=> b!513641 (arrayContainsKey!0 a!3235 lt!235206 #b00000000000000000000000000000000)))

(declare-fun lt!235207 () Unit!15859)

(assert (=> b!513641 (= lt!235207 lt!235205)))

(declare-fun res!313925 () Bool)

(assert (=> b!513641 (= res!313925 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) (Found!4270 j!176)))))

(assert (=> b!513641 (=> (not res!313925) (not e!299920))))

(assert (= (and d!79239 (not res!313924)) b!513640))

(assert (= (and b!513640 c!60141) b!513641))

(assert (= (and b!513640 (not c!60141)) b!513639))

(assert (= (and b!513641 res!313925) b!513638))

(assert (= (or b!513638 b!513639) bm!31546))

(declare-fun m!495449 () Bool)

(assert (=> bm!31546 m!495449))

(assert (=> b!513640 m!495279))

(assert (=> b!513640 m!495279))

(assert (=> b!513640 m!495289))

(assert (=> b!513641 m!495279))

(declare-fun m!495451 () Bool)

(assert (=> b!513641 m!495451))

(declare-fun m!495453 () Bool)

(assert (=> b!513641 m!495453))

(assert (=> b!513641 m!495279))

(assert (=> b!513641 m!495281))

(assert (=> b!513463 d!79239))

(declare-fun d!79241 () Bool)

(declare-fun e!299932 () Bool)

(assert (=> d!79241 e!299932))

(declare-fun c!60144 () Bool)

(declare-fun lt!235214 () SeekEntryResult!4270)

(assert (=> d!79241 (= c!60144 (and ((_ is Intermediate!4270) lt!235214) (undefined!5082 lt!235214)))))

(declare-fun e!299930 () SeekEntryResult!4270)

(assert (=> d!79241 (= lt!235214 e!299930)))

(declare-fun c!60146 () Bool)

(assert (=> d!79241 (= c!60146 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235215 () (_ BitVec 64))

(assert (=> d!79241 (= lt!235215 (select (arr!15847 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) lt!235120))))

(assert (=> d!79241 (validMask!0 mask!3524)))

(assert (=> d!79241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235120 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524) lt!235214)))

(declare-fun b!513650 () Bool)

(declare-fun e!299931 () SeekEntryResult!4270)

(assert (=> b!513650 (= e!299930 e!299931)))

(declare-fun c!60145 () Bool)

(assert (=> b!513650 (= c!60145 (or (= lt!235215 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235215 lt!235215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513651 () Bool)

(assert (=> b!513651 (= e!299931 (Intermediate!4270 false lt!235120 #b00000000000000000000000000000000))))

(declare-fun b!513652 () Bool)

(assert (=> b!513652 (= e!299932 (bvsge (x!48366 lt!235214) #b01111111111111111111111111111110))))

(declare-fun b!513653 () Bool)

(assert (=> b!513653 (= e!299931 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524))))

(declare-fun b!513654 () Bool)

(assert (=> b!513654 (= e!299930 (Intermediate!4270 true lt!235120 #b00000000000000000000000000000000))))

(declare-fun b!513655 () Bool)

(declare-fun e!299933 () Bool)

(assert (=> b!513655 (= e!299932 e!299933)))

(declare-fun res!313930 () Bool)

(assert (=> b!513655 (= res!313930 (and ((_ is Intermediate!4270) lt!235214) (not (undefined!5082 lt!235214)) (bvslt (x!48366 lt!235214) #b01111111111111111111111111111110) (bvsge (x!48366 lt!235214) #b00000000000000000000000000000000) (bvsge (x!48366 lt!235214) #b00000000000000000000000000000000)))))

(assert (=> b!513655 (=> (not res!313930) (not e!299933))))

(declare-fun b!513656 () Bool)

(assert (=> b!513656 (and (bvsge (index!19270 lt!235214) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235214) (size!16211 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(declare-fun res!313931 () Bool)

(assert (=> b!513656 (= res!313931 (= (select (arr!15847 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19270 lt!235214)) (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!299929 () Bool)

(assert (=> b!513656 (=> res!313931 e!299929)))

(assert (=> b!513656 (= e!299933 e!299929)))

(declare-fun b!513657 () Bool)

(assert (=> b!513657 (and (bvsge (index!19270 lt!235214) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235214) (size!16211 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(declare-fun res!313932 () Bool)

(assert (=> b!513657 (= res!313932 (= (select (arr!15847 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19270 lt!235214)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513657 (=> res!313932 e!299929)))

(declare-fun b!513658 () Bool)

(assert (=> b!513658 (and (bvsge (index!19270 lt!235214) #b00000000000000000000000000000000) (bvslt (index!19270 lt!235214) (size!16211 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(assert (=> b!513658 (= e!299929 (= (select (arr!15847 (array!32948 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19270 lt!235214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79241 c!60146) b!513654))

(assert (= (and d!79241 (not c!60146)) b!513650))

(assert (= (and b!513650 c!60145) b!513651))

(assert (= (and b!513650 (not c!60145)) b!513653))

(assert (= (and d!79241 c!60144) b!513652))

(assert (= (and d!79241 (not c!60144)) b!513655))

(assert (= (and b!513655 res!313930) b!513656))

(assert (= (and b!513656 (not res!313931)) b!513657))

(assert (= (and b!513657 (not res!313932)) b!513658))

(declare-fun m!495455 () Bool)

(assert (=> b!513658 m!495455))

(declare-fun m!495457 () Bool)

(assert (=> b!513653 m!495457))

(assert (=> b!513653 m!495457))

(assert (=> b!513653 m!495293))

(declare-fun m!495459 () Bool)

(assert (=> b!513653 m!495459))

(declare-fun m!495461 () Bool)

(assert (=> d!79241 m!495461))

(assert (=> d!79241 m!495285))

(assert (=> b!513657 m!495455))

(assert (=> b!513656 m!495455))

(assert (=> b!513463 d!79241))

(declare-fun d!79243 () Bool)

(assert (=> d!79243 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235225 () Unit!15859)

(declare-fun choose!38 (array!32947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15859)

(assert (=> d!79243 (= lt!235225 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79243 (validMask!0 mask!3524)))

(assert (=> d!79243 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235225)))

(declare-fun bs!16271 () Bool)

(assert (= bs!16271 d!79243))

(assert (=> bs!16271 m!495299))

(declare-fun m!495475 () Bool)

(assert (=> bs!16271 m!495475))

(assert (=> bs!16271 m!495285))

(assert (=> b!513463 d!79243))

(declare-fun d!79247 () Bool)

(declare-fun lt!235227 () (_ BitVec 32))

(declare-fun lt!235226 () (_ BitVec 32))

(assert (=> d!79247 (= lt!235227 (bvmul (bvxor lt!235226 (bvlshr lt!235226 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79247 (= lt!235226 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79247 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313923 (let ((h!10798 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48371 (bvmul (bvxor h!10798 (bvlshr h!10798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48371 (bvlshr x!48371 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313923 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313923 #b00000000000000000000000000000000))))))

(assert (=> d!79247 (= (toIndex!0 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235227 (bvlshr lt!235227 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513463 d!79247))

(declare-fun b!513709 () Bool)

(declare-fun e!299965 () Bool)

(declare-fun e!299968 () Bool)

(assert (=> b!513709 (= e!299965 e!299968)))

(declare-fun c!60162 () Bool)

(assert (=> b!513709 (= c!60162 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513710 () Bool)

(declare-fun call!31555 () Bool)

(assert (=> b!513710 (= e!299968 call!31555)))

(declare-fun d!79249 () Bool)

(declare-fun res!313955 () Bool)

(declare-fun e!299967 () Bool)

(assert (=> d!79249 (=> res!313955 e!299967)))

(assert (=> d!79249 (= res!313955 (bvsge #b00000000000000000000000000000000 (size!16211 a!3235)))))

(assert (=> d!79249 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9909) e!299967)))

(declare-fun b!513711 () Bool)

(assert (=> b!513711 (= e!299967 e!299965)))

(declare-fun res!313953 () Bool)

(assert (=> b!513711 (=> (not res!313953) (not e!299965))))

(declare-fun e!299966 () Bool)

(assert (=> b!513711 (= res!313953 (not e!299966))))

(declare-fun res!313954 () Bool)

(assert (=> b!513711 (=> (not res!313954) (not e!299966))))

(assert (=> b!513711 (= res!313954 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513712 () Bool)

(declare-fun contains!2709 (List!9912 (_ BitVec 64)) Bool)

(assert (=> b!513712 (= e!299966 (contains!2709 Nil!9909 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513713 () Bool)

(assert (=> b!513713 (= e!299968 call!31555)))

(declare-fun bm!31552 () Bool)

(assert (=> bm!31552 (= call!31555 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60162 (Cons!9908 (select (arr!15847 a!3235) #b00000000000000000000000000000000) Nil!9909) Nil!9909)))))

(assert (= (and d!79249 (not res!313955)) b!513711))

(assert (= (and b!513711 res!313954) b!513712))

(assert (= (and b!513711 res!313953) b!513709))

(assert (= (and b!513709 c!60162) b!513713))

(assert (= (and b!513709 (not c!60162)) b!513710))

(assert (= (or b!513713 b!513710) bm!31552))

(assert (=> b!513709 m!495391))

(assert (=> b!513709 m!495391))

(assert (=> b!513709 m!495409))

(assert (=> b!513711 m!495391))

(assert (=> b!513711 m!495391))

(assert (=> b!513711 m!495409))

(assert (=> b!513712 m!495391))

(assert (=> b!513712 m!495391))

(declare-fun m!495493 () Bool)

(assert (=> b!513712 m!495493))

(assert (=> bm!31552 m!495391))

(declare-fun m!495495 () Bool)

(assert (=> bm!31552 m!495495))

(assert (=> b!513462 d!79249))

(declare-fun b!513714 () Bool)

(declare-fun e!299971 () SeekEntryResult!4270)

(declare-fun lt!235237 () SeekEntryResult!4270)

(assert (=> b!513714 (= e!299971 (Found!4270 (index!19270 lt!235237)))))

(declare-fun b!513715 () Bool)

(declare-fun c!60163 () Bool)

(declare-fun lt!235236 () (_ BitVec 64))

(assert (=> b!513715 (= c!60163 (= lt!235236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299969 () SeekEntryResult!4270)

(assert (=> b!513715 (= e!299971 e!299969)))

(declare-fun d!79257 () Bool)

(declare-fun lt!235238 () SeekEntryResult!4270)

(assert (=> d!79257 (and (or ((_ is Undefined!4270) lt!235238) (not ((_ is Found!4270) lt!235238)) (and (bvsge (index!19269 lt!235238) #b00000000000000000000000000000000) (bvslt (index!19269 lt!235238) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235238) ((_ is Found!4270) lt!235238) (not ((_ is MissingZero!4270) lt!235238)) (and (bvsge (index!19268 lt!235238) #b00000000000000000000000000000000) (bvslt (index!19268 lt!235238) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235238) ((_ is Found!4270) lt!235238) ((_ is MissingZero!4270) lt!235238) (not ((_ is MissingVacant!4270) lt!235238)) (and (bvsge (index!19271 lt!235238) #b00000000000000000000000000000000) (bvslt (index!19271 lt!235238) (size!16211 a!3235)))) (or ((_ is Undefined!4270) lt!235238) (ite ((_ is Found!4270) lt!235238) (= (select (arr!15847 a!3235) (index!19269 lt!235238)) k0!2280) (ite ((_ is MissingZero!4270) lt!235238) (= (select (arr!15847 a!3235) (index!19268 lt!235238)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4270) lt!235238) (= (select (arr!15847 a!3235) (index!19271 lt!235238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299970 () SeekEntryResult!4270)

(assert (=> d!79257 (= lt!235238 e!299970)))

(declare-fun c!60165 () Bool)

(assert (=> d!79257 (= c!60165 (and ((_ is Intermediate!4270) lt!235237) (undefined!5082 lt!235237)))))

(assert (=> d!79257 (= lt!235237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79257 (validMask!0 mask!3524)))

(assert (=> d!79257 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235238)))

(declare-fun b!513716 () Bool)

(assert (=> b!513716 (= e!299969 (seekKeyOrZeroReturnVacant!0 (x!48366 lt!235237) (index!19270 lt!235237) (index!19270 lt!235237) k0!2280 a!3235 mask!3524))))

(declare-fun b!513717 () Bool)

(assert (=> b!513717 (= e!299970 Undefined!4270)))

(declare-fun b!513718 () Bool)

(assert (=> b!513718 (= e!299970 e!299971)))

(assert (=> b!513718 (= lt!235236 (select (arr!15847 a!3235) (index!19270 lt!235237)))))

(declare-fun c!60164 () Bool)

(assert (=> b!513718 (= c!60164 (= lt!235236 k0!2280))))

(declare-fun b!513719 () Bool)

(assert (=> b!513719 (= e!299969 (MissingZero!4270 (index!19270 lt!235237)))))

(assert (= (and d!79257 c!60165) b!513717))

(assert (= (and d!79257 (not c!60165)) b!513718))

(assert (= (and b!513718 c!60164) b!513714))

(assert (= (and b!513718 (not c!60164)) b!513715))

(assert (= (and b!513715 c!60163) b!513719))

(assert (= (and b!513715 (not c!60163)) b!513716))

(declare-fun m!495499 () Bool)

(assert (=> d!79257 m!495499))

(declare-fun m!495501 () Bool)

(assert (=> d!79257 m!495501))

(declare-fun m!495503 () Bool)

(assert (=> d!79257 m!495503))

(assert (=> d!79257 m!495499))

(declare-fun m!495505 () Bool)

(assert (=> d!79257 m!495505))

(declare-fun m!495507 () Bool)

(assert (=> d!79257 m!495507))

(assert (=> d!79257 m!495285))

(declare-fun m!495509 () Bool)

(assert (=> b!513716 m!495509))

(declare-fun m!495511 () Bool)

(assert (=> b!513718 m!495511))

(assert (=> b!513472 d!79257))

(declare-fun d!79261 () Bool)

(assert (=> d!79261 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46406 d!79261))

(declare-fun d!79265 () Bool)

(assert (=> d!79265 (= (array_inv!11706 a!3235) (bvsge (size!16211 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46406 d!79265))

(check-sat (not b!513712) (not d!79257) (not b!513653) (not d!79225) (not b!513641) (not b!513544) (not bm!31546) (not d!79241) (not b!513578) (not b!513711) (not b!513632) (not b!513640) (not bm!31552) (not b!513577) (not d!79211) (not d!79243) (not bm!31542) (not b!513716) (not b!513709) (not b!513559))
(check-sat)
