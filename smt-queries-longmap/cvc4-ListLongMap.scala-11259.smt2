; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131310 () Bool)

(assert start!131310)

(declare-fun b!1539827 () Bool)

(declare-fun res!1056625 () Bool)

(declare-fun e!856441 () Bool)

(assert (=> b!1539827 (=> (not res!1056625) (not e!856441))))

(declare-datatypes ((array!102297 0))(
  ( (array!102298 (arr!49360 (Array (_ BitVec 32) (_ BitVec 64))) (size!49910 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102297)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539827 (= res!1056625 (validKeyInArray!0 (select (arr!49360 a!2792) j!64)))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun e!856438 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13486 0))(
  ( (MissingZero!13486 (index!56339 (_ BitVec 32))) (Found!13486 (index!56340 (_ BitVec 32))) (Intermediate!13486 (undefined!14298 Bool) (index!56341 (_ BitVec 32)) (x!138071 (_ BitVec 32))) (Undefined!13486) (MissingVacant!13486 (index!56342 (_ BitVec 32))) )
))
(declare-fun lt!665139 () SeekEntryResult!13486)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!665140 () (_ BitVec 32))

(declare-fun b!1539828 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102297 (_ BitVec 32)) SeekEntryResult!13486)

(assert (=> b!1539828 (= e!856438 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665140 vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480) lt!665139)))))

(declare-fun b!1539829 () Bool)

(declare-fun e!856439 () Bool)

(assert (=> b!1539829 (= e!856439 e!856438)))

(declare-fun res!1056630 () Bool)

(assert (=> b!1539829 (=> (not res!1056630) (not e!856438))))

(assert (=> b!1539829 (= res!1056630 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665140 #b00000000000000000000000000000000) (bvslt lt!665140 (size!49910 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539829 (= lt!665140 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539830 () Bool)

(declare-fun res!1056628 () Bool)

(assert (=> b!1539830 (=> (not res!1056628) (not e!856441))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539830 (= res!1056628 (validKeyInArray!0 (select (arr!49360 a!2792) i!951)))))

(declare-fun res!1056632 () Bool)

(assert (=> start!131310 (=> (not res!1056632) (not e!856441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131310 (= res!1056632 (validMask!0 mask!2480))))

(assert (=> start!131310 e!856441))

(assert (=> start!131310 true))

(declare-fun array_inv!38388 (array!102297) Bool)

(assert (=> start!131310 (array_inv!38388 a!2792)))

(declare-fun b!1539831 () Bool)

(declare-fun res!1056633 () Bool)

(assert (=> b!1539831 (=> (not res!1056633) (not e!856441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102297 (_ BitVec 32)) Bool)

(assert (=> b!1539831 (= res!1056633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539832 () Bool)

(declare-fun res!1056631 () Bool)

(assert (=> b!1539832 (=> (not res!1056631) (not e!856441))))

(assert (=> b!1539832 (= res!1056631 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49910 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49910 a!2792)) (= (select (arr!49360 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539833 () Bool)

(declare-fun res!1056634 () Bool)

(assert (=> b!1539833 (=> (not res!1056634) (not e!856441))))

(declare-datatypes ((List!35834 0))(
  ( (Nil!35831) (Cons!35830 (h!37275 (_ BitVec 64)) (t!50528 List!35834)) )
))
(declare-fun arrayNoDuplicates!0 (array!102297 (_ BitVec 32) List!35834) Bool)

(assert (=> b!1539833 (= res!1056634 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35831))))

(declare-fun b!1539834 () Bool)

(declare-fun res!1056627 () Bool)

(assert (=> b!1539834 (=> (not res!1056627) (not e!856439))))

(assert (=> b!1539834 (= res!1056627 (not (= (select (arr!49360 a!2792) index!463) (select (arr!49360 a!2792) j!64))))))

(declare-fun b!1539835 () Bool)

(assert (=> b!1539835 (= e!856441 e!856439)))

(declare-fun res!1056626 () Bool)

(assert (=> b!1539835 (=> (not res!1056626) (not e!856439))))

(assert (=> b!1539835 (= res!1056626 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480) lt!665139))))

(assert (=> b!1539835 (= lt!665139 (Found!13486 j!64))))

(declare-fun b!1539836 () Bool)

(declare-fun res!1056629 () Bool)

(assert (=> b!1539836 (=> (not res!1056629) (not e!856441))))

(assert (=> b!1539836 (= res!1056629 (and (= (size!49910 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49910 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49910 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131310 res!1056632) b!1539836))

(assert (= (and b!1539836 res!1056629) b!1539830))

(assert (= (and b!1539830 res!1056628) b!1539827))

(assert (= (and b!1539827 res!1056625) b!1539831))

(assert (= (and b!1539831 res!1056633) b!1539833))

(assert (= (and b!1539833 res!1056634) b!1539832))

(assert (= (and b!1539832 res!1056631) b!1539835))

(assert (= (and b!1539835 res!1056626) b!1539834))

(assert (= (and b!1539834 res!1056627) b!1539829))

(assert (= (and b!1539829 res!1056630) b!1539828))

(declare-fun m!1422007 () Bool)

(assert (=> b!1539829 m!1422007))

(declare-fun m!1422009 () Bool)

(assert (=> b!1539832 m!1422009))

(declare-fun m!1422011 () Bool)

(assert (=> b!1539835 m!1422011))

(assert (=> b!1539835 m!1422011))

(declare-fun m!1422013 () Bool)

(assert (=> b!1539835 m!1422013))

(assert (=> b!1539827 m!1422011))

(assert (=> b!1539827 m!1422011))

(declare-fun m!1422015 () Bool)

(assert (=> b!1539827 m!1422015))

(assert (=> b!1539828 m!1422011))

(assert (=> b!1539828 m!1422011))

(declare-fun m!1422017 () Bool)

(assert (=> b!1539828 m!1422017))

(declare-fun m!1422019 () Bool)

(assert (=> b!1539831 m!1422019))

(declare-fun m!1422021 () Bool)

(assert (=> b!1539834 m!1422021))

(assert (=> b!1539834 m!1422011))

(declare-fun m!1422023 () Bool)

(assert (=> start!131310 m!1422023))

(declare-fun m!1422025 () Bool)

(assert (=> start!131310 m!1422025))

(declare-fun m!1422027 () Bool)

(assert (=> b!1539833 m!1422027))

(declare-fun m!1422029 () Bool)

(assert (=> b!1539830 m!1422029))

(assert (=> b!1539830 m!1422029))

(declare-fun m!1422031 () Bool)

(assert (=> b!1539830 m!1422031))

(push 1)

(assert (not b!1539835))

(assert (not b!1539828))

(assert (not b!1539831))

(assert (not b!1539827))

(assert (not b!1539829))

(assert (not b!1539830))

(assert (not b!1539833))

(assert (not start!131310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160483 () Bool)

(assert (=> d!160483 (= (validKeyInArray!0 (select (arr!49360 a!2792) i!951)) (and (not (= (select (arr!49360 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49360 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1539830 d!160483))

(declare-fun b!1539916 () Bool)

(declare-fun e!856494 () SeekEntryResult!13486)

(assert (=> b!1539916 (= e!856494 Undefined!13486)))

(declare-fun e!856495 () SeekEntryResult!13486)

(declare-fun b!1539917 () Bool)

(assert (=> b!1539917 (= e!856495 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539918 () Bool)

(assert (=> b!1539918 (= e!856495 (MissingVacant!13486 vacantIndex!5))))

(declare-fun b!1539919 () Bool)

(declare-fun e!856493 () SeekEntryResult!13486)

(assert (=> b!1539919 (= e!856494 e!856493)))

(declare-fun lt!665163 () (_ BitVec 64))

(declare-fun c!141186 () Bool)

(assert (=> b!1539919 (= c!141186 (= lt!665163 (select (arr!49360 a!2792) j!64)))))

(declare-fun b!1539920 () Bool)

(assert (=> b!1539920 (= e!856493 (Found!13486 index!463))))

(declare-fun d!160489 () Bool)

(declare-fun lt!665162 () SeekEntryResult!13486)

(assert (=> d!160489 (and (or (is-Undefined!13486 lt!665162) (not (is-Found!13486 lt!665162)) (and (bvsge (index!56340 lt!665162) #b00000000000000000000000000000000) (bvslt (index!56340 lt!665162) (size!49910 a!2792)))) (or (is-Undefined!13486 lt!665162) (is-Found!13486 lt!665162) (not (is-MissingVacant!13486 lt!665162)) (not (= (index!56342 lt!665162) vacantIndex!5)) (and (bvsge (index!56342 lt!665162) #b00000000000000000000000000000000) (bvslt (index!56342 lt!665162) (size!49910 a!2792)))) (or (is-Undefined!13486 lt!665162) (ite (is-Found!13486 lt!665162) (= (select (arr!49360 a!2792) (index!56340 lt!665162)) (select (arr!49360 a!2792) j!64)) (and (is-MissingVacant!13486 lt!665162) (= (index!56342 lt!665162) vacantIndex!5) (= (select (arr!49360 a!2792) (index!56342 lt!665162)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160489 (= lt!665162 e!856494)))

(declare-fun c!141187 () Bool)

(assert (=> d!160489 (= c!141187 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160489 (= lt!665163 (select (arr!49360 a!2792) index!463))))

(assert (=> d!160489 (validMask!0 mask!2480)))

(assert (=> d!160489 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480) lt!665162)))

(declare-fun b!1539915 () Bool)

(declare-fun c!141188 () Bool)

(assert (=> b!1539915 (= c!141188 (= lt!665163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539915 (= e!856493 e!856495)))

(assert (= (and d!160489 c!141187) b!1539916))

(assert (= (and d!160489 (not c!141187)) b!1539919))

(assert (= (and b!1539919 c!141186) b!1539920))

(assert (= (and b!1539919 (not c!141186)) b!1539915))

(assert (= (and b!1539915 c!141188) b!1539918))

(assert (= (and b!1539915 (not c!141188)) b!1539917))

(assert (=> b!1539917 m!1422007))

(assert (=> b!1539917 m!1422007))

(assert (=> b!1539917 m!1422011))

(declare-fun m!1422073 () Bool)

(assert (=> b!1539917 m!1422073))

(declare-fun m!1422075 () Bool)

(assert (=> d!160489 m!1422075))

(declare-fun m!1422077 () Bool)

(assert (=> d!160489 m!1422077))

(assert (=> d!160489 m!1422021))

(assert (=> d!160489 m!1422023))

(assert (=> b!1539835 d!160489))

(declare-fun d!160499 () Bool)

(declare-fun lt!665172 () (_ BitVec 32))

(assert (=> d!160499 (and (bvsge lt!665172 #b00000000000000000000000000000000) (bvslt lt!665172 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160499 (= lt!665172 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160499 (validMask!0 mask!2480)))

(assert (=> d!160499 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665172)))

(declare-fun bs!44206 () Bool)

(assert (= bs!44206 d!160499))

(declare-fun m!1422079 () Bool)

(assert (=> bs!44206 m!1422079))

(assert (=> bs!44206 m!1422023))

(assert (=> b!1539829 d!160499))

(declare-fun b!1539930 () Bool)

(declare-fun e!856505 () SeekEntryResult!13486)

(assert (=> b!1539930 (= e!856505 Undefined!13486)))

(declare-fun e!856506 () SeekEntryResult!13486)

(declare-fun b!1539931 () Bool)

(assert (=> b!1539931 (= e!856506 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510 #b00000000000000000000000000000001) (nextIndex!0 lt!665140 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539932 () Bool)

(assert (=> b!1539932 (= e!856506 (MissingVacant!13486 vacantIndex!5))))

(declare-fun b!1539934 () Bool)

(declare-fun e!856503 () SeekEntryResult!13486)

(assert (=> b!1539934 (= e!856505 e!856503)))

(declare-fun c!141191 () Bool)

(declare-fun lt!665179 () (_ BitVec 64))

(assert (=> b!1539934 (= c!141191 (= lt!665179 (select (arr!49360 a!2792) j!64)))))

(declare-fun b!1539936 () Bool)

(assert (=> b!1539936 (= e!856503 (Found!13486 lt!665140))))

(declare-fun d!160503 () Bool)

(declare-fun lt!665176 () SeekEntryResult!13486)

(assert (=> d!160503 (and (or (is-Undefined!13486 lt!665176) (not (is-Found!13486 lt!665176)) (and (bvsge (index!56340 lt!665176) #b00000000000000000000000000000000) (bvslt (index!56340 lt!665176) (size!49910 a!2792)))) (or (is-Undefined!13486 lt!665176) (is-Found!13486 lt!665176) (not (is-MissingVacant!13486 lt!665176)) (not (= (index!56342 lt!665176) vacantIndex!5)) (and (bvsge (index!56342 lt!665176) #b00000000000000000000000000000000) (bvslt (index!56342 lt!665176) (size!49910 a!2792)))) (or (is-Undefined!13486 lt!665176) (ite (is-Found!13486 lt!665176) (= (select (arr!49360 a!2792) (index!56340 lt!665176)) (select (arr!49360 a!2792) j!64)) (and (is-MissingVacant!13486 lt!665176) (= (index!56342 lt!665176) vacantIndex!5) (= (select (arr!49360 a!2792) (index!56342 lt!665176)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160503 (= lt!665176 e!856505)))

(declare-fun c!141192 () Bool)

(assert (=> d!160503 (= c!141192 (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110))))

(assert (=> d!160503 (= lt!665179 (select (arr!49360 a!2792) lt!665140))))

(assert (=> d!160503 (validMask!0 mask!2480)))

(assert (=> d!160503 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665140 vacantIndex!5 (select (arr!49360 a!2792) j!64) a!2792 mask!2480) lt!665176)))

(declare-fun b!1539929 () Bool)

(declare-fun c!141193 () Bool)

(assert (=> b!1539929 (= c!141193 (= lt!665179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1539929 (= e!856503 e!856506)))

(assert (= (and d!160503 c!141192) b!1539930))

(assert (= (and d!160503 (not c!141192)) b!1539934))

(assert (= (and b!1539934 c!141191) b!1539936))

(assert (= (and b!1539934 (not c!141191)) b!1539929))

(assert (= (and b!1539929 c!141193) b!1539932))

(assert (= (and b!1539929 (not c!141193)) b!1539931))

(declare-fun m!1422085 () Bool)

(assert (=> b!1539931 m!1422085))

(assert (=> b!1539931 m!1422085))

(assert (=> b!1539931 m!1422011))

(declare-fun m!1422091 () Bool)

(assert (=> b!1539931 m!1422091))

(declare-fun m!1422095 () Bool)

(assert (=> d!160503 m!1422095))

(declare-fun m!1422097 () Bool)

(assert (=> d!160503 m!1422097))

(declare-fun m!1422099 () Bool)

(assert (=> d!160503 m!1422099))

(assert (=> d!160503 m!1422023))

(assert (=> b!1539828 d!160503))

(declare-fun b!1539949 () Bool)

(declare-fun e!856517 () Bool)

(declare-fun e!856516 () Bool)

(assert (=> b!1539949 (= e!856517 e!856516)))

(declare-fun res!1056671 () Bool)

(assert (=> b!1539949 (=> (not res!1056671) (not e!856516))))

(declare-fun e!856518 () Bool)

(assert (=> b!1539949 (= res!1056671 (not e!856518))))

(declare-fun res!1056672 () Bool)

(assert (=> b!1539949 (=> (not res!1056672) (not e!856518))))

(assert (=> b!1539949 (= res!1056672 (validKeyInArray!0 (select (arr!49360 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539950 () Bool)

(declare-fun e!856519 () Bool)

(assert (=> b!1539950 (= e!856516 e!856519)))

(declare-fun c!141197 () Bool)

(assert (=> b!1539950 (= c!141197 (validKeyInArray!0 (select (arr!49360 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160509 () Bool)

(declare-fun res!1056673 () Bool)

(assert (=> d!160509 (=> res!1056673 e!856517)))

(assert (=> d!160509 (= res!1056673 (bvsge #b00000000000000000000000000000000 (size!49910 a!2792)))))

(assert (=> d!160509 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35831) e!856517)))

(declare-fun b!1539951 () Bool)

(declare-fun contains!10018 (List!35834 (_ BitVec 64)) Bool)

(assert (=> b!1539951 (= e!856518 (contains!10018 Nil!35831 (select (arr!49360 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1539952 () Bool)

(declare-fun call!68649 () Bool)

(assert (=> b!1539952 (= e!856519 call!68649)))

(declare-fun bm!68646 () Bool)

