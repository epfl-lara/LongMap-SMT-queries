; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131308 () Bool)

(assert start!131308)

(declare-fun b!1539797 () Bool)

(declare-fun res!1056597 () Bool)

(declare-fun e!856426 () Bool)

(assert (=> b!1539797 (=> (not res!1056597) (not e!856426))))

(declare-datatypes ((array!102295 0))(
  ( (array!102296 (arr!49359 (Array (_ BitVec 32) (_ BitVec 64))) (size!49909 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102295)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102295 (_ BitVec 32)) Bool)

(assert (=> b!1539797 (= res!1056597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539798 () Bool)

(declare-fun res!1056604 () Bool)

(declare-fun e!856427 () Bool)

(assert (=> b!1539798 (=> (not res!1056604) (not e!856427))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539798 (= res!1056604 (not (= (select (arr!49359 a!2792) index!463) (select (arr!49359 a!2792) j!64))))))

(declare-fun b!1539799 () Bool)

(declare-fun res!1056600 () Bool)

(assert (=> b!1539799 (=> (not res!1056600) (not e!856426))))

(declare-datatypes ((List!35833 0))(
  ( (Nil!35830) (Cons!35829 (h!37274 (_ BitVec 64)) (t!50527 List!35833)) )
))
(declare-fun arrayNoDuplicates!0 (array!102295 (_ BitVec 32) List!35833) Bool)

(assert (=> b!1539799 (= res!1056600 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35830))))

(declare-fun b!1539800 () Bool)

(assert (=> b!1539800 (= e!856426 e!856427)))

(declare-fun res!1056599 () Bool)

(assert (=> b!1539800 (=> (not res!1056599) (not e!856427))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13485 0))(
  ( (MissingZero!13485 (index!56335 (_ BitVec 32))) (Found!13485 (index!56336 (_ BitVec 32))) (Intermediate!13485 (undefined!14297 Bool) (index!56337 (_ BitVec 32)) (x!138070 (_ BitVec 32))) (Undefined!13485) (MissingVacant!13485 (index!56338 (_ BitVec 32))) )
))
(declare-fun lt!665134 () SeekEntryResult!13485)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102295 (_ BitVec 32)) SeekEntryResult!13485)

(assert (=> b!1539800 (= res!1056599 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480) lt!665134))))

(assert (=> b!1539800 (= lt!665134 (Found!13485 j!64))))

(declare-fun b!1539801 () Bool)

(declare-fun res!1056598 () Bool)

(assert (=> b!1539801 (=> (not res!1056598) (not e!856426))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539801 (= res!1056598 (validKeyInArray!0 (select (arr!49359 a!2792) i!951)))))

(declare-fun b!1539802 () Bool)

(declare-fun res!1056603 () Bool)

(assert (=> b!1539802 (=> (not res!1056603) (not e!856426))))

(assert (=> b!1539802 (= res!1056603 (validKeyInArray!0 (select (arr!49359 a!2792) j!64)))))

(declare-fun b!1539803 () Bool)

(declare-fun res!1056595 () Bool)

(assert (=> b!1539803 (=> (not res!1056595) (not e!856426))))

(assert (=> b!1539803 (= res!1056595 (and (= (size!49909 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49909 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49909 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056602 () Bool)

(assert (=> start!131308 (=> (not res!1056602) (not e!856426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131308 (= res!1056602 (validMask!0 mask!2480))))

(assert (=> start!131308 e!856426))

(assert (=> start!131308 true))

(declare-fun array_inv!38387 (array!102295) Bool)

(assert (=> start!131308 (array_inv!38387 a!2792)))

(declare-fun b!1539804 () Bool)

(declare-fun res!1056596 () Bool)

(assert (=> b!1539804 (=> (not res!1056596) (not e!856426))))

(assert (=> b!1539804 (= res!1056596 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49909 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49909 a!2792)) (= (select (arr!49359 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!665133 () (_ BitVec 32))

(declare-fun b!1539805 () Bool)

(declare-fun e!856429 () Bool)

(assert (=> b!1539805 (= e!856429 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665133 vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480) lt!665134)))))

(declare-fun b!1539806 () Bool)

(assert (=> b!1539806 (= e!856427 e!856429)))

(declare-fun res!1056601 () Bool)

(assert (=> b!1539806 (=> (not res!1056601) (not e!856429))))

(assert (=> b!1539806 (= res!1056601 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665133 #b00000000000000000000000000000000) (bvslt lt!665133 (size!49909 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539806 (= lt!665133 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131308 res!1056602) b!1539803))

(assert (= (and b!1539803 res!1056595) b!1539801))

(assert (= (and b!1539801 res!1056598) b!1539802))

(assert (= (and b!1539802 res!1056603) b!1539797))

(assert (= (and b!1539797 res!1056597) b!1539799))

(assert (= (and b!1539799 res!1056600) b!1539804))

(assert (= (and b!1539804 res!1056596) b!1539800))

(assert (= (and b!1539800 res!1056599) b!1539798))

(assert (= (and b!1539798 res!1056604) b!1539806))

(assert (= (and b!1539806 res!1056601) b!1539805))

(declare-fun m!1421981 () Bool)

(assert (=> start!131308 m!1421981))

(declare-fun m!1421983 () Bool)

(assert (=> start!131308 m!1421983))

(declare-fun m!1421985 () Bool)

(assert (=> b!1539797 m!1421985))

(declare-fun m!1421987 () Bool)

(assert (=> b!1539802 m!1421987))

(assert (=> b!1539802 m!1421987))

(declare-fun m!1421989 () Bool)

(assert (=> b!1539802 m!1421989))

(declare-fun m!1421991 () Bool)

(assert (=> b!1539806 m!1421991))

(declare-fun m!1421993 () Bool)

(assert (=> b!1539798 m!1421993))

(assert (=> b!1539798 m!1421987))

(declare-fun m!1421995 () Bool)

(assert (=> b!1539799 m!1421995))

(assert (=> b!1539805 m!1421987))

(assert (=> b!1539805 m!1421987))

(declare-fun m!1421997 () Bool)

(assert (=> b!1539805 m!1421997))

(declare-fun m!1421999 () Bool)

(assert (=> b!1539801 m!1421999))

(assert (=> b!1539801 m!1421999))

(declare-fun m!1422001 () Bool)

(assert (=> b!1539801 m!1422001))

(declare-fun m!1422003 () Bool)

(assert (=> b!1539804 m!1422003))

(assert (=> b!1539800 m!1421987))

(assert (=> b!1539800 m!1421987))

(declare-fun m!1422005 () Bool)

(assert (=> b!1539800 m!1422005))

(check-sat (not b!1539797) (not b!1539799) (not b!1539806) (not b!1539802) (not b!1539805) (not b!1539800) (not b!1539801) (not start!131308))
(check-sat)
(get-model)

(declare-fun b!1539849 () Bool)

(declare-fun e!856448 () SeekEntryResult!13485)

(assert (=> b!1539849 (= e!856448 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539851 () Bool)

(declare-fun e!856450 () SeekEntryResult!13485)

(assert (=> b!1539851 (= e!856450 (Found!13485 index!463))))

(declare-fun b!1539852 () Bool)

(declare-fun e!856449 () SeekEntryResult!13485)

(assert (=> b!1539852 (= e!856449 e!856450)))

(declare-fun lt!665145 () (_ BitVec 64))

(declare-fun c!141167 () Bool)

(assert (=> b!1539852 (= c!141167 (= lt!665145 (select (arr!49359 a!2792) j!64)))))

(declare-fun b!1539853 () Bool)

(declare-fun c!141166 () Bool)

(assert (=> b!1539853 (= c!141166 (= lt!665145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539853 (= e!856450 e!856448)))

(declare-fun b!1539854 () Bool)

(assert (=> b!1539854 (= e!856449 Undefined!13485)))

(declare-fun b!1539850 () Bool)

(assert (=> b!1539850 (= e!856448 (MissingVacant!13485 vacantIndex!5))))

(declare-fun d!160477 () Bool)

(declare-fun lt!665146 () SeekEntryResult!13485)

(get-info :version)

(assert (=> d!160477 (and (or ((_ is Undefined!13485) lt!665146) (not ((_ is Found!13485) lt!665146)) (and (bvsge (index!56336 lt!665146) #b00000000000000000000000000000000) (bvslt (index!56336 lt!665146) (size!49909 a!2792)))) (or ((_ is Undefined!13485) lt!665146) ((_ is Found!13485) lt!665146) (not ((_ is MissingVacant!13485) lt!665146)) (not (= (index!56338 lt!665146) vacantIndex!5)) (and (bvsge (index!56338 lt!665146) #b00000000000000000000000000000000) (bvslt (index!56338 lt!665146) (size!49909 a!2792)))) (or ((_ is Undefined!13485) lt!665146) (ite ((_ is Found!13485) lt!665146) (= (select (arr!49359 a!2792) (index!56336 lt!665146)) (select (arr!49359 a!2792) j!64)) (and ((_ is MissingVacant!13485) lt!665146) (= (index!56338 lt!665146) vacantIndex!5) (= (select (arr!49359 a!2792) (index!56338 lt!665146)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160477 (= lt!665146 e!856449)))

(declare-fun c!141165 () Bool)

(assert (=> d!160477 (= c!141165 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160477 (= lt!665145 (select (arr!49359 a!2792) index!463))))

(assert (=> d!160477 (validMask!0 mask!2480)))

(assert (=> d!160477 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480) lt!665146)))

(assert (= (and d!160477 c!141165) b!1539854))

(assert (= (and d!160477 (not c!141165)) b!1539852))

(assert (= (and b!1539852 c!141167) b!1539851))

(assert (= (and b!1539852 (not c!141167)) b!1539853))

(assert (= (and b!1539853 c!141166) b!1539850))

(assert (= (and b!1539853 (not c!141166)) b!1539849))

(assert (=> b!1539849 m!1421991))

(assert (=> b!1539849 m!1421991))

(assert (=> b!1539849 m!1421987))

(declare-fun m!1422033 () Bool)

(assert (=> b!1539849 m!1422033))

(declare-fun m!1422035 () Bool)

(assert (=> d!160477 m!1422035))

(declare-fun m!1422037 () Bool)

(assert (=> d!160477 m!1422037))

(assert (=> d!160477 m!1421993))

(assert (=> d!160477 m!1421981))

(assert (=> b!1539800 d!160477))

(declare-fun e!856451 () SeekEntryResult!13485)

(declare-fun b!1539855 () Bool)

(assert (=> b!1539855 (= e!856451 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665133 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539857 () Bool)

(declare-fun e!856453 () SeekEntryResult!13485)

(assert (=> b!1539857 (= e!856453 (Found!13485 lt!665133))))

(declare-fun b!1539858 () Bool)

(declare-fun e!856452 () SeekEntryResult!13485)

(assert (=> b!1539858 (= e!856452 e!856453)))

(declare-fun c!141170 () Bool)

(declare-fun lt!665147 () (_ BitVec 64))

(assert (=> b!1539858 (= c!141170 (= lt!665147 (select (arr!49359 a!2792) j!64)))))

(declare-fun b!1539859 () Bool)

(declare-fun c!141169 () Bool)

(assert (=> b!1539859 (= c!141169 (= lt!665147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539859 (= e!856453 e!856451)))

(declare-fun b!1539860 () Bool)

(assert (=> b!1539860 (= e!856452 Undefined!13485)))

(declare-fun b!1539856 () Bool)

(assert (=> b!1539856 (= e!856451 (MissingVacant!13485 vacantIndex!5))))

(declare-fun d!160479 () Bool)

(declare-fun lt!665148 () SeekEntryResult!13485)

(assert (=> d!160479 (and (or ((_ is Undefined!13485) lt!665148) (not ((_ is Found!13485) lt!665148)) (and (bvsge (index!56336 lt!665148) #b00000000000000000000000000000000) (bvslt (index!56336 lt!665148) (size!49909 a!2792)))) (or ((_ is Undefined!13485) lt!665148) ((_ is Found!13485) lt!665148) (not ((_ is MissingVacant!13485) lt!665148)) (not (= (index!56338 lt!665148) vacantIndex!5)) (and (bvsge (index!56338 lt!665148) #b00000000000000000000000000000000) (bvslt (index!56338 lt!665148) (size!49909 a!2792)))) (or ((_ is Undefined!13485) lt!665148) (ite ((_ is Found!13485) lt!665148) (= (select (arr!49359 a!2792) (index!56336 lt!665148)) (select (arr!49359 a!2792) j!64)) (and ((_ is MissingVacant!13485) lt!665148) (= (index!56338 lt!665148) vacantIndex!5) (= (select (arr!49359 a!2792) (index!56338 lt!665148)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160479 (= lt!665148 e!856452)))

(declare-fun c!141168 () Bool)

(assert (=> d!160479 (= c!141168 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160479 (= lt!665147 (select (arr!49359 a!2792) lt!665133))))

(assert (=> d!160479 (validMask!0 mask!2480)))

(assert (=> d!160479 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665133 vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480) lt!665148)))

(assert (= (and d!160479 c!141168) b!1539860))

(assert (= (and d!160479 (not c!141168)) b!1539858))

(assert (= (and b!1539858 c!141170) b!1539857))

(assert (= (and b!1539858 (not c!141170)) b!1539859))

(assert (= (and b!1539859 c!141169) b!1539856))

(assert (= (and b!1539859 (not c!141169)) b!1539855))

(declare-fun m!1422039 () Bool)

(assert (=> b!1539855 m!1422039))

(assert (=> b!1539855 m!1422039))

(assert (=> b!1539855 m!1421987))

(declare-fun m!1422041 () Bool)

(assert (=> b!1539855 m!1422041))

(declare-fun m!1422043 () Bool)

(assert (=> d!160479 m!1422043))

(declare-fun m!1422045 () Bool)

(assert (=> d!160479 m!1422045))

(declare-fun m!1422047 () Bool)

(assert (=> d!160479 m!1422047))

(assert (=> d!160479 m!1421981))

(assert (=> b!1539805 d!160479))

(declare-fun d!160481 () Bool)

(declare-fun res!1056642 () Bool)

(declare-fun e!856463 () Bool)

(assert (=> d!160481 (=> res!1056642 e!856463)))

(assert (=> d!160481 (= res!1056642 (bvsge #b00000000000000000000000000000000 (size!49909 a!2792)))))

(assert (=> d!160481 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35830) e!856463)))

(declare-fun bm!68634 () Bool)

(declare-fun call!68637 () Bool)

(declare-fun c!141173 () Bool)

(assert (=> bm!68634 (= call!68637 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141173 (Cons!35829 (select (arr!49359 a!2792) #b00000000000000000000000000000000) Nil!35830) Nil!35830)))))

(declare-fun b!1539871 () Bool)

(declare-fun e!856462 () Bool)

(assert (=> b!1539871 (= e!856462 call!68637)))

(declare-fun b!1539872 () Bool)

(declare-fun e!856464 () Bool)

(assert (=> b!1539872 (= e!856463 e!856464)))

(declare-fun res!1056643 () Bool)

(assert (=> b!1539872 (=> (not res!1056643) (not e!856464))))

(declare-fun e!856465 () Bool)

(assert (=> b!1539872 (= res!1056643 (not e!856465))))

(declare-fun res!1056641 () Bool)

(assert (=> b!1539872 (=> (not res!1056641) (not e!856465))))

(assert (=> b!1539872 (= res!1056641 (validKeyInArray!0 (select (arr!49359 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539873 () Bool)

(assert (=> b!1539873 (= e!856462 call!68637)))

(declare-fun b!1539874 () Bool)

(declare-fun contains!10016 (List!35833 (_ BitVec 64)) Bool)

(assert (=> b!1539874 (= e!856465 (contains!10016 Nil!35830 (select (arr!49359 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539875 () Bool)

(assert (=> b!1539875 (= e!856464 e!856462)))

(assert (=> b!1539875 (= c!141173 (validKeyInArray!0 (select (arr!49359 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160481 (not res!1056642)) b!1539872))

(assert (= (and b!1539872 res!1056641) b!1539874))

(assert (= (and b!1539872 res!1056643) b!1539875))

(assert (= (and b!1539875 c!141173) b!1539873))

(assert (= (and b!1539875 (not c!141173)) b!1539871))

(assert (= (or b!1539873 b!1539871) bm!68634))

(declare-fun m!1422049 () Bool)

(assert (=> bm!68634 m!1422049))

(declare-fun m!1422051 () Bool)

(assert (=> bm!68634 m!1422051))

(assert (=> b!1539872 m!1422049))

(assert (=> b!1539872 m!1422049))

(declare-fun m!1422053 () Bool)

(assert (=> b!1539872 m!1422053))

(assert (=> b!1539874 m!1422049))

(assert (=> b!1539874 m!1422049))

(declare-fun m!1422055 () Bool)

(assert (=> b!1539874 m!1422055))

(assert (=> b!1539875 m!1422049))

(assert (=> b!1539875 m!1422049))

(assert (=> b!1539875 m!1422053))

(assert (=> b!1539799 d!160481))

(declare-fun d!160487 () Bool)

(assert (=> d!160487 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131308 d!160487))

(declare-fun d!160493 () Bool)

(assert (=> d!160493 (= (array_inv!38387 a!2792) (bvsge (size!49909 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131308 d!160493))

(declare-fun bm!68643 () Bool)

(declare-fun call!68646 () Bool)

(assert (=> bm!68643 (= call!68646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1539933 () Bool)

(declare-fun e!856504 () Bool)

(declare-fun e!856507 () Bool)

(assert (=> b!1539933 (= e!856504 e!856507)))

(declare-fun c!141194 () Bool)

(assert (=> b!1539933 (= c!141194 (validKeyInArray!0 (select (arr!49359 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539935 () Bool)

(declare-fun e!856502 () Bool)

(assert (=> b!1539935 (= e!856507 e!856502)))

(declare-fun lt!665175 () (_ BitVec 64))

(assert (=> b!1539935 (= lt!665175 (select (arr!49359 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51416 0))(
  ( (Unit!51417) )
))
(declare-fun lt!665178 () Unit!51416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102295 (_ BitVec 64) (_ BitVec 32)) Unit!51416)

(assert (=> b!1539935 (= lt!665178 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665175 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1539935 (arrayContainsKey!0 a!2792 lt!665175 #b00000000000000000000000000000000)))

(declare-fun lt!665177 () Unit!51416)

(assert (=> b!1539935 (= lt!665177 lt!665178)))

(declare-fun res!1056663 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102295 (_ BitVec 32)) SeekEntryResult!13485)

(assert (=> b!1539935 (= res!1056663 (= (seekEntryOrOpen!0 (select (arr!49359 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13485 #b00000000000000000000000000000000)))))

(assert (=> b!1539935 (=> (not res!1056663) (not e!856502))))

(declare-fun d!160495 () Bool)

(declare-fun res!1056664 () Bool)

(assert (=> d!160495 (=> res!1056664 e!856504)))

(assert (=> d!160495 (= res!1056664 (bvsge #b00000000000000000000000000000000 (size!49909 a!2792)))))

(assert (=> d!160495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856504)))

(declare-fun b!1539937 () Bool)

(assert (=> b!1539937 (= e!856507 call!68646)))

(declare-fun b!1539938 () Bool)

(assert (=> b!1539938 (= e!856502 call!68646)))

(assert (= (and d!160495 (not res!1056664)) b!1539933))

(assert (= (and b!1539933 c!141194) b!1539935))

(assert (= (and b!1539933 (not c!141194)) b!1539937))

(assert (= (and b!1539935 res!1056663) b!1539938))

(assert (= (or b!1539938 b!1539937) bm!68643))

(declare-fun m!1422081 () Bool)

(assert (=> bm!68643 m!1422081))

(assert (=> b!1539933 m!1422049))

(assert (=> b!1539933 m!1422049))

(assert (=> b!1539933 m!1422053))

(assert (=> b!1539935 m!1422049))

(declare-fun m!1422087 () Bool)

(assert (=> b!1539935 m!1422087))

(declare-fun m!1422089 () Bool)

(assert (=> b!1539935 m!1422089))

(assert (=> b!1539935 m!1422049))

(declare-fun m!1422093 () Bool)

(assert (=> b!1539935 m!1422093))

(assert (=> b!1539797 d!160495))

(declare-fun d!160507 () Bool)

(assert (=> d!160507 (= (validKeyInArray!0 (select (arr!49359 a!2792) j!64)) (and (not (= (select (arr!49359 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49359 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539802 d!160507))

(declare-fun d!160511 () Bool)

(assert (=> d!160511 (= (validKeyInArray!0 (select (arr!49359 a!2792) i!951)) (and (not (= (select (arr!49359 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49359 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539801 d!160511))

(declare-fun d!160513 () Bool)

(declare-fun lt!665183 () (_ BitVec 32))

(assert (=> d!160513 (and (bvsge lt!665183 #b00000000000000000000000000000000) (bvslt lt!665183 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160513 (= lt!665183 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160513 (validMask!0 mask!2480)))

(assert (=> d!160513 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665183)))

(declare-fun bs!44208 () Bool)

(assert (= bs!44208 d!160513))

(declare-fun m!1422101 () Bool)

(assert (=> bs!44208 m!1422101))

(assert (=> bs!44208 m!1421981))

(assert (=> b!1539806 d!160513))

(check-sat (not bm!68643) (not bm!68634) (not b!1539872) (not b!1539875) (not b!1539855) (not d!160513) (not b!1539874) (not d!160479) (not d!160477) (not b!1539933) (not b!1539849) (not b!1539935))
(check-sat)
