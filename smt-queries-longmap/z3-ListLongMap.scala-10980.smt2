; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128588 () Bool)

(assert start!128588)

(declare-fun b!1507509 () Bool)

(declare-fun res!1027727 () Bool)

(declare-fun e!842287 () Bool)

(assert (=> b!1507509 (=> (not res!1027727) (not e!842287))))

(declare-datatypes ((array!100561 0))(
  ( (array!100562 (arr!48522 (Array (_ BitVec 32) (_ BitVec 64))) (size!49072 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100561)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100561 (_ BitVec 32)) Bool)

(assert (=> b!1507509 (= res!1027727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507510 () Bool)

(declare-fun e!842286 () Bool)

(assert (=> b!1507510 (= e!842287 e!842286)))

(declare-fun res!1027729 () Bool)

(assert (=> b!1507510 (=> (not res!1027729) (not e!842286))))

(declare-fun lt!654402 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12693 0))(
  ( (MissingZero!12693 (index!53167 (_ BitVec 32))) (Found!12693 (index!53168 (_ BitVec 32))) (Intermediate!12693 (undefined!13505 Bool) (index!53169 (_ BitVec 32)) (x!134921 (_ BitVec 32))) (Undefined!12693) (MissingVacant!12693 (index!53170 (_ BitVec 32))) )
))
(declare-fun lt!654403 () SeekEntryResult!12693)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100561 (_ BitVec 32)) SeekEntryResult!12693)

(assert (=> b!1507510 (= res!1027729 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654402 (select (arr!48522 a!2804) j!70) a!2804 mask!2512) lt!654403))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507510 (= lt!654403 (Intermediate!12693 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507510 (= lt!654402 (toIndex!0 (select (arr!48522 a!2804) j!70) mask!2512))))

(declare-fun b!1507511 () Bool)

(declare-fun res!1027732 () Bool)

(assert (=> b!1507511 (=> (not res!1027732) (not e!842287))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507511 (= res!1027732 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49072 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49072 a!2804))))))

(declare-fun b!1507512 () Bool)

(assert (=> b!1507512 (= e!842286 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654402 #b00000000000000000000000000000000) (bvsge lt!654402 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun res!1027731 () Bool)

(assert (=> start!128588 (=> (not res!1027731) (not e!842287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128588 (= res!1027731 (validMask!0 mask!2512))))

(assert (=> start!128588 e!842287))

(assert (=> start!128588 true))

(declare-fun array_inv!37550 (array!100561) Bool)

(assert (=> start!128588 (array_inv!37550 a!2804)))

(declare-fun b!1507513 () Bool)

(declare-fun res!1027735 () Bool)

(assert (=> b!1507513 (=> (not res!1027735) (not e!842287))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507513 (= res!1027735 (validKeyInArray!0 (select (arr!48522 a!2804) i!961)))))

(declare-fun b!1507514 () Bool)

(declare-fun res!1027734 () Bool)

(assert (=> b!1507514 (=> (not res!1027734) (not e!842286))))

(assert (=> b!1507514 (= res!1027734 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48522 a!2804) j!70) a!2804 mask!2512) lt!654403))))

(declare-fun b!1507515 () Bool)

(declare-fun res!1027728 () Bool)

(assert (=> b!1507515 (=> (not res!1027728) (not e!842287))))

(assert (=> b!1507515 (= res!1027728 (validKeyInArray!0 (select (arr!48522 a!2804) j!70)))))

(declare-fun b!1507516 () Bool)

(declare-fun res!1027730 () Bool)

(assert (=> b!1507516 (=> (not res!1027730) (not e!842287))))

(declare-datatypes ((List!35005 0))(
  ( (Nil!35002) (Cons!35001 (h!36404 (_ BitVec 64)) (t!49699 List!35005)) )
))
(declare-fun arrayNoDuplicates!0 (array!100561 (_ BitVec 32) List!35005) Bool)

(assert (=> b!1507516 (= res!1027730 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35002))))

(declare-fun b!1507517 () Bool)

(declare-fun res!1027733 () Bool)

(assert (=> b!1507517 (=> (not res!1027733) (not e!842287))))

(assert (=> b!1507517 (= res!1027733 (and (= (size!49072 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49072 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49072 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128588 res!1027731) b!1507517))

(assert (= (and b!1507517 res!1027733) b!1507513))

(assert (= (and b!1507513 res!1027735) b!1507515))

(assert (= (and b!1507515 res!1027728) b!1507509))

(assert (= (and b!1507509 res!1027727) b!1507516))

(assert (= (and b!1507516 res!1027730) b!1507511))

(assert (= (and b!1507511 res!1027732) b!1507510))

(assert (= (and b!1507510 res!1027729) b!1507514))

(assert (= (and b!1507514 res!1027734) b!1507512))

(declare-fun m!1390247 () Bool)

(assert (=> b!1507515 m!1390247))

(assert (=> b!1507515 m!1390247))

(declare-fun m!1390249 () Bool)

(assert (=> b!1507515 m!1390249))

(declare-fun m!1390251 () Bool)

(assert (=> start!128588 m!1390251))

(declare-fun m!1390253 () Bool)

(assert (=> start!128588 m!1390253))

(declare-fun m!1390255 () Bool)

(assert (=> b!1507513 m!1390255))

(assert (=> b!1507513 m!1390255))

(declare-fun m!1390257 () Bool)

(assert (=> b!1507513 m!1390257))

(declare-fun m!1390259 () Bool)

(assert (=> b!1507509 m!1390259))

(declare-fun m!1390261 () Bool)

(assert (=> b!1507516 m!1390261))

(assert (=> b!1507514 m!1390247))

(assert (=> b!1507514 m!1390247))

(declare-fun m!1390263 () Bool)

(assert (=> b!1507514 m!1390263))

(assert (=> b!1507510 m!1390247))

(assert (=> b!1507510 m!1390247))

(declare-fun m!1390265 () Bool)

(assert (=> b!1507510 m!1390265))

(assert (=> b!1507510 m!1390247))

(declare-fun m!1390267 () Bool)

(assert (=> b!1507510 m!1390267))

(check-sat (not start!128588) (not b!1507515) (not b!1507513) (not b!1507510) (not b!1507514) (not b!1507516) (not b!1507509))
(check-sat)
(get-model)

(declare-fun b!1507553 () Bool)

(declare-fun e!842304 () Bool)

(declare-fun call!68259 () Bool)

(assert (=> b!1507553 (= e!842304 call!68259)))

(declare-fun b!1507554 () Bool)

(declare-fun e!842303 () Bool)

(assert (=> b!1507554 (= e!842303 call!68259)))

(declare-fun b!1507555 () Bool)

(assert (=> b!1507555 (= e!842304 e!842303)))

(declare-fun lt!654416 () (_ BitVec 64))

(assert (=> b!1507555 (= lt!654416 (select (arr!48522 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50330 0))(
  ( (Unit!50331) )
))
(declare-fun lt!654418 () Unit!50330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100561 (_ BitVec 64) (_ BitVec 32)) Unit!50330)

(assert (=> b!1507555 (= lt!654418 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654416 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507555 (arrayContainsKey!0 a!2804 lt!654416 #b00000000000000000000000000000000)))

(declare-fun lt!654417 () Unit!50330)

(assert (=> b!1507555 (= lt!654417 lt!654418)))

(declare-fun res!1027768 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100561 (_ BitVec 32)) SeekEntryResult!12693)

(assert (=> b!1507555 (= res!1027768 (= (seekEntryOrOpen!0 (select (arr!48522 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12693 #b00000000000000000000000000000000)))))

(assert (=> b!1507555 (=> (not res!1027768) (not e!842303))))

(declare-fun bm!68256 () Bool)

(assert (=> bm!68256 (= call!68259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158321 () Bool)

(declare-fun res!1027767 () Bool)

(declare-fun e!842305 () Bool)

(assert (=> d!158321 (=> res!1027767 e!842305)))

(assert (=> d!158321 (= res!1027767 (bvsge #b00000000000000000000000000000000 (size!49072 a!2804)))))

(assert (=> d!158321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842305)))

(declare-fun b!1507556 () Bool)

(assert (=> b!1507556 (= e!842305 e!842304)))

(declare-fun c!139430 () Bool)

(assert (=> b!1507556 (= c!139430 (validKeyInArray!0 (select (arr!48522 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158321 (not res!1027767)) b!1507556))

(assert (= (and b!1507556 c!139430) b!1507555))

(assert (= (and b!1507556 (not c!139430)) b!1507553))

(assert (= (and b!1507555 res!1027768) b!1507554))

(assert (= (or b!1507554 b!1507553) bm!68256))

(declare-fun m!1390291 () Bool)

(assert (=> b!1507555 m!1390291))

(declare-fun m!1390293 () Bool)

(assert (=> b!1507555 m!1390293))

(declare-fun m!1390295 () Bool)

(assert (=> b!1507555 m!1390295))

(assert (=> b!1507555 m!1390291))

(declare-fun m!1390297 () Bool)

(assert (=> b!1507555 m!1390297))

(declare-fun m!1390299 () Bool)

(assert (=> bm!68256 m!1390299))

(assert (=> b!1507556 m!1390291))

(assert (=> b!1507556 m!1390291))

(declare-fun m!1390301 () Bool)

(assert (=> b!1507556 m!1390301))

(assert (=> b!1507509 d!158321))

(declare-fun b!1507575 () Bool)

(declare-fun e!842317 () SeekEntryResult!12693)

(assert (=> b!1507575 (= e!842317 (Intermediate!12693 false index!487 x!534))))

(declare-fun b!1507576 () Bool)

(declare-fun lt!654423 () SeekEntryResult!12693)

(assert (=> b!1507576 (and (bvsge (index!53169 lt!654423) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654423) (size!49072 a!2804)))))

(declare-fun res!1027777 () Bool)

(assert (=> b!1507576 (= res!1027777 (= (select (arr!48522 a!2804) (index!53169 lt!654423)) (select (arr!48522 a!2804) j!70)))))

(declare-fun e!842318 () Bool)

(assert (=> b!1507576 (=> res!1027777 e!842318)))

(declare-fun e!842320 () Bool)

(assert (=> b!1507576 (= e!842320 e!842318)))

(declare-fun b!1507578 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507578 (= e!842317 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48522 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507579 () Bool)

(assert (=> b!1507579 (and (bvsge (index!53169 lt!654423) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654423) (size!49072 a!2804)))))

(declare-fun res!1027775 () Bool)

(assert (=> b!1507579 (= res!1027775 (= (select (arr!48522 a!2804) (index!53169 lt!654423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507579 (=> res!1027775 e!842318)))

(declare-fun b!1507580 () Bool)

(declare-fun e!842316 () SeekEntryResult!12693)

(assert (=> b!1507580 (= e!842316 e!842317)))

(declare-fun lt!654424 () (_ BitVec 64))

(declare-fun c!139439 () Bool)

(assert (=> b!1507580 (= c!139439 (or (= lt!654424 (select (arr!48522 a!2804) j!70)) (= (bvadd lt!654424 lt!654424) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507581 () Bool)

(declare-fun e!842319 () Bool)

(assert (=> b!1507581 (= e!842319 (bvsge (x!134921 lt!654423) #b01111111111111111111111111111110))))

(declare-fun b!1507582 () Bool)

(assert (=> b!1507582 (and (bvsge (index!53169 lt!654423) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654423) (size!49072 a!2804)))))

(assert (=> b!1507582 (= e!842318 (= (select (arr!48522 a!2804) (index!53169 lt!654423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507583 () Bool)

(assert (=> b!1507583 (= e!842316 (Intermediate!12693 true index!487 x!534))))

(declare-fun d!158323 () Bool)

(assert (=> d!158323 e!842319))

(declare-fun c!139438 () Bool)

(get-info :version)

(assert (=> d!158323 (= c!139438 (and ((_ is Intermediate!12693) lt!654423) (undefined!13505 lt!654423)))))

(assert (=> d!158323 (= lt!654423 e!842316)))

(declare-fun c!139437 () Bool)

(assert (=> d!158323 (= c!139437 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158323 (= lt!654424 (select (arr!48522 a!2804) index!487))))

(assert (=> d!158323 (validMask!0 mask!2512)))

(assert (=> d!158323 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48522 a!2804) j!70) a!2804 mask!2512) lt!654423)))

(declare-fun b!1507577 () Bool)

(assert (=> b!1507577 (= e!842319 e!842320)))

(declare-fun res!1027776 () Bool)

(assert (=> b!1507577 (= res!1027776 (and ((_ is Intermediate!12693) lt!654423) (not (undefined!13505 lt!654423)) (bvslt (x!134921 lt!654423) #b01111111111111111111111111111110) (bvsge (x!134921 lt!654423) #b00000000000000000000000000000000) (bvsge (x!134921 lt!654423) x!534)))))

(assert (=> b!1507577 (=> (not res!1027776) (not e!842320))))

(assert (= (and d!158323 c!139437) b!1507583))

(assert (= (and d!158323 (not c!139437)) b!1507580))

(assert (= (and b!1507580 c!139439) b!1507575))

(assert (= (and b!1507580 (not c!139439)) b!1507578))

(assert (= (and d!158323 c!139438) b!1507581))

(assert (= (and d!158323 (not c!139438)) b!1507577))

(assert (= (and b!1507577 res!1027776) b!1507576))

(assert (= (and b!1507576 (not res!1027777)) b!1507579))

(assert (= (and b!1507579 (not res!1027775)) b!1507582))

(declare-fun m!1390303 () Bool)

(assert (=> d!158323 m!1390303))

(assert (=> d!158323 m!1390251))

(declare-fun m!1390305 () Bool)

(assert (=> b!1507579 m!1390305))

(declare-fun m!1390307 () Bool)

(assert (=> b!1507578 m!1390307))

(assert (=> b!1507578 m!1390307))

(assert (=> b!1507578 m!1390247))

(declare-fun m!1390309 () Bool)

(assert (=> b!1507578 m!1390309))

(assert (=> b!1507576 m!1390305))

(assert (=> b!1507582 m!1390305))

(assert (=> b!1507514 d!158323))

(declare-fun b!1507602 () Bool)

(declare-fun e!842336 () Bool)

(declare-fun e!842338 () Bool)

(assert (=> b!1507602 (= e!842336 e!842338)))

(declare-fun res!1027789 () Bool)

(assert (=> b!1507602 (=> (not res!1027789) (not e!842338))))

(declare-fun e!842335 () Bool)

(assert (=> b!1507602 (= res!1027789 (not e!842335))))

(declare-fun res!1027790 () Bool)

(assert (=> b!1507602 (=> (not res!1027790) (not e!842335))))

(assert (=> b!1507602 (= res!1027790 (validKeyInArray!0 (select (arr!48522 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68261 () Bool)

(declare-fun call!68264 () Bool)

(declare-fun c!139444 () Bool)

(assert (=> bm!68261 (= call!68264 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139444 (Cons!35001 (select (arr!48522 a!2804) #b00000000000000000000000000000000) Nil!35002) Nil!35002)))))

(declare-fun b!1507603 () Bool)

(declare-fun e!842337 () Bool)

(assert (=> b!1507603 (= e!842337 call!68264)))

(declare-fun d!158337 () Bool)

(declare-fun res!1027788 () Bool)

(assert (=> d!158337 (=> res!1027788 e!842336)))

(assert (=> d!158337 (= res!1027788 (bvsge #b00000000000000000000000000000000 (size!49072 a!2804)))))

(assert (=> d!158337 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35002) e!842336)))

(declare-fun b!1507604 () Bool)

(declare-fun contains!9968 (List!35005 (_ BitVec 64)) Bool)

(assert (=> b!1507604 (= e!842335 (contains!9968 Nil!35002 (select (arr!48522 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507605 () Bool)

(assert (=> b!1507605 (= e!842337 call!68264)))

(declare-fun b!1507606 () Bool)

(assert (=> b!1507606 (= e!842338 e!842337)))

(assert (=> b!1507606 (= c!139444 (validKeyInArray!0 (select (arr!48522 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158337 (not res!1027788)) b!1507602))

(assert (= (and b!1507602 res!1027790) b!1507604))

(assert (= (and b!1507602 res!1027789) b!1507606))

(assert (= (and b!1507606 c!139444) b!1507603))

(assert (= (and b!1507606 (not c!139444)) b!1507605))

(assert (= (or b!1507603 b!1507605) bm!68261))

(assert (=> b!1507602 m!1390291))

(assert (=> b!1507602 m!1390291))

(assert (=> b!1507602 m!1390301))

(assert (=> bm!68261 m!1390291))

(declare-fun m!1390311 () Bool)

(assert (=> bm!68261 m!1390311))

(assert (=> b!1507604 m!1390291))

(assert (=> b!1507604 m!1390291))

(declare-fun m!1390313 () Bool)

(assert (=> b!1507604 m!1390313))

(assert (=> b!1507606 m!1390291))

(assert (=> b!1507606 m!1390291))

(assert (=> b!1507606 m!1390301))

(assert (=> b!1507516 d!158337))

(declare-fun b!1507607 () Bool)

(declare-fun e!842340 () SeekEntryResult!12693)

(assert (=> b!1507607 (= e!842340 (Intermediate!12693 false lt!654402 #b00000000000000000000000000000000))))

(declare-fun b!1507608 () Bool)

(declare-fun lt!654431 () SeekEntryResult!12693)

(assert (=> b!1507608 (and (bvsge (index!53169 lt!654431) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654431) (size!49072 a!2804)))))

(declare-fun res!1027793 () Bool)

(assert (=> b!1507608 (= res!1027793 (= (select (arr!48522 a!2804) (index!53169 lt!654431)) (select (arr!48522 a!2804) j!70)))))

(declare-fun e!842341 () Bool)

(assert (=> b!1507608 (=> res!1027793 e!842341)))

(declare-fun e!842343 () Bool)

(assert (=> b!1507608 (= e!842343 e!842341)))

(declare-fun b!1507610 () Bool)

(assert (=> b!1507610 (= e!842340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!654402 #b00000000000000000000000000000000 mask!2512) (select (arr!48522 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507611 () Bool)

(assert (=> b!1507611 (and (bvsge (index!53169 lt!654431) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654431) (size!49072 a!2804)))))

(declare-fun res!1027791 () Bool)

(assert (=> b!1507611 (= res!1027791 (= (select (arr!48522 a!2804) (index!53169 lt!654431)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1507611 (=> res!1027791 e!842341)))

(declare-fun b!1507612 () Bool)

(declare-fun e!842339 () SeekEntryResult!12693)

(assert (=> b!1507612 (= e!842339 e!842340)))

(declare-fun lt!654432 () (_ BitVec 64))

(declare-fun c!139447 () Bool)

(assert (=> b!1507612 (= c!139447 (or (= lt!654432 (select (arr!48522 a!2804) j!70)) (= (bvadd lt!654432 lt!654432) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1507613 () Bool)

(declare-fun e!842342 () Bool)

(assert (=> b!1507613 (= e!842342 (bvsge (x!134921 lt!654431) #b01111111111111111111111111111110))))

(declare-fun b!1507614 () Bool)

(assert (=> b!1507614 (and (bvsge (index!53169 lt!654431) #b00000000000000000000000000000000) (bvslt (index!53169 lt!654431) (size!49072 a!2804)))))

(assert (=> b!1507614 (= e!842341 (= (select (arr!48522 a!2804) (index!53169 lt!654431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507615 () Bool)

(assert (=> b!1507615 (= e!842339 (Intermediate!12693 true lt!654402 #b00000000000000000000000000000000))))

(declare-fun d!158339 () Bool)

(assert (=> d!158339 e!842342))

(declare-fun c!139446 () Bool)

(assert (=> d!158339 (= c!139446 (and ((_ is Intermediate!12693) lt!654431) (undefined!13505 lt!654431)))))

(assert (=> d!158339 (= lt!654431 e!842339)))

(declare-fun c!139445 () Bool)

(assert (=> d!158339 (= c!139445 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158339 (= lt!654432 (select (arr!48522 a!2804) lt!654402))))

(assert (=> d!158339 (validMask!0 mask!2512)))

(assert (=> d!158339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!654402 (select (arr!48522 a!2804) j!70) a!2804 mask!2512) lt!654431)))

(declare-fun b!1507609 () Bool)

(assert (=> b!1507609 (= e!842342 e!842343)))

(declare-fun res!1027792 () Bool)

(assert (=> b!1507609 (= res!1027792 (and ((_ is Intermediate!12693) lt!654431) (not (undefined!13505 lt!654431)) (bvslt (x!134921 lt!654431) #b01111111111111111111111111111110) (bvsge (x!134921 lt!654431) #b00000000000000000000000000000000) (bvsge (x!134921 lt!654431) #b00000000000000000000000000000000)))))

(assert (=> b!1507609 (=> (not res!1027792) (not e!842343))))

(assert (= (and d!158339 c!139445) b!1507615))

(assert (= (and d!158339 (not c!139445)) b!1507612))

(assert (= (and b!1507612 c!139447) b!1507607))

(assert (= (and b!1507612 (not c!139447)) b!1507610))

(assert (= (and d!158339 c!139446) b!1507613))

(assert (= (and d!158339 (not c!139446)) b!1507609))

(assert (= (and b!1507609 res!1027792) b!1507608))

(assert (= (and b!1507608 (not res!1027793)) b!1507611))

(assert (= (and b!1507611 (not res!1027791)) b!1507614))

(declare-fun m!1390315 () Bool)

(assert (=> d!158339 m!1390315))

(assert (=> d!158339 m!1390251))

(declare-fun m!1390317 () Bool)

(assert (=> b!1507611 m!1390317))

(declare-fun m!1390319 () Bool)

(assert (=> b!1507610 m!1390319))

(assert (=> b!1507610 m!1390319))

(assert (=> b!1507610 m!1390247))

(declare-fun m!1390321 () Bool)

(assert (=> b!1507610 m!1390321))

(assert (=> b!1507608 m!1390317))

(assert (=> b!1507614 m!1390317))

(assert (=> b!1507510 d!158339))

(declare-fun d!158341 () Bool)

(declare-fun lt!654445 () (_ BitVec 32))

(declare-fun lt!654444 () (_ BitVec 32))

(assert (=> d!158341 (= lt!654445 (bvmul (bvxor lt!654444 (bvlshr lt!654444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158341 (= lt!654444 ((_ extract 31 0) (bvand (bvxor (select (arr!48522 a!2804) j!70) (bvlshr (select (arr!48522 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158341 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1027796 (let ((h!36406 ((_ extract 31 0) (bvand (bvxor (select (arr!48522 a!2804) j!70) (bvlshr (select (arr!48522 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134925 (bvmul (bvxor h!36406 (bvlshr h!36406 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134925 (bvlshr x!134925 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1027796 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1027796 #b00000000000000000000000000000000))))))

(assert (=> d!158341 (= (toIndex!0 (select (arr!48522 a!2804) j!70) mask!2512) (bvand (bvxor lt!654445 (bvlshr lt!654445 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1507510 d!158341))

(declare-fun d!158345 () Bool)

(assert (=> d!158345 (= (validKeyInArray!0 (select (arr!48522 a!2804) j!70)) (and (not (= (select (arr!48522 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48522 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507515 d!158345))

(declare-fun d!158347 () Bool)

(assert (=> d!158347 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128588 d!158347))

(declare-fun d!158363 () Bool)

(assert (=> d!158363 (= (array_inv!37550 a!2804) (bvsge (size!49072 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128588 d!158363))

(declare-fun d!158365 () Bool)

(assert (=> d!158365 (= (validKeyInArray!0 (select (arr!48522 a!2804) i!961)) (and (not (= (select (arr!48522 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48522 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507513 d!158365))

(check-sat (not b!1507610) (not b!1507556) (not d!158323) (not b!1507604) (not b!1507606) (not d!158339) (not b!1507578) (not b!1507555) (not bm!68256) (not b!1507602) (not bm!68261))
(check-sat)
