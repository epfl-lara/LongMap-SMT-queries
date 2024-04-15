; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131040 () Bool)

(assert start!131040)

(declare-fun b!1537740 () Bool)

(declare-fun res!1055013 () Bool)

(declare-fun e!855638 () Bool)

(assert (=> b!1537740 (=> (not res!1055013) (not e!855638))))

(declare-datatypes ((array!102136 0))(
  ( (array!102137 (arr!49285 (Array (_ BitVec 32) (_ BitVec 64))) (size!49837 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102136)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537740 (= res!1055013 (validKeyInArray!0 (select (arr!49285 a!2792) j!64)))))

(declare-fun b!1537741 () Bool)

(declare-fun res!1055015 () Bool)

(assert (=> b!1537741 (=> (not res!1055015) (not e!855638))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537741 (= res!1055015 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49837 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49837 a!2792)) (= (select (arr!49285 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055016 () Bool)

(assert (=> start!131040 (=> (not res!1055016) (not e!855638))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131040 (= res!1055016 (validMask!0 mask!2480))))

(assert (=> start!131040 e!855638))

(assert (=> start!131040 true))

(declare-fun array_inv!38518 (array!102136) Bool)

(assert (=> start!131040 (array_inv!38518 a!2792)))

(declare-datatypes ((SeekEntryResult!13436 0))(
  ( (MissingZero!13436 (index!56139 (_ BitVec 32))) (Found!13436 (index!56140 (_ BitVec 32))) (Intermediate!13436 (undefined!14248 Bool) (index!56141 (_ BitVec 32)) (x!137873 (_ BitVec 32))) (Undefined!13436) (MissingVacant!13436 (index!56142 (_ BitVec 32))) )
))
(declare-fun lt!664536 () SeekEntryResult!13436)

(declare-fun b!1537742 () Bool)

(declare-fun e!855639 () Bool)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102136 (_ BitVec 32)) SeekEntryResult!13436)

(assert (=> b!1537742 (= e!855639 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792)) mask!2480) lt!664536)))))

(declare-fun b!1537743 () Bool)

(declare-fun res!1055010 () Bool)

(assert (=> b!1537743 (=> (not res!1055010) (not e!855638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102136 (_ BitVec 32)) Bool)

(assert (=> b!1537743 (= res!1055010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537744 () Bool)

(declare-fun res!1055012 () Bool)

(assert (=> b!1537744 (=> (not res!1055012) (not e!855638))))

(assert (=> b!1537744 (= res!1055012 (validKeyInArray!0 (select (arr!49285 a!2792) i!951)))))

(declare-fun b!1537745 () Bool)

(assert (=> b!1537745 (= e!855638 e!855639)))

(declare-fun res!1055011 () Bool)

(assert (=> b!1537745 (=> (not res!1055011) (not e!855639))))

(assert (=> b!1537745 (= res!1055011 (and (= lt!664536 (Found!13436 j!64)) (= (select (arr!49285 a!2792) index!463) (select (arr!49285 a!2792) j!64))))))

(assert (=> b!1537745 (= lt!664536 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49285 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537746 () Bool)

(declare-fun res!1055014 () Bool)

(assert (=> b!1537746 (=> (not res!1055014) (not e!855638))))

(assert (=> b!1537746 (= res!1055014 (and (= (size!49837 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49837 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49837 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537747 () Bool)

(declare-fun res!1055017 () Bool)

(assert (=> b!1537747 (=> (not res!1055017) (not e!855638))))

(declare-datatypes ((List!35837 0))(
  ( (Nil!35834) (Cons!35833 (h!37279 (_ BitVec 64)) (t!50523 List!35837)) )
))
(declare-fun arrayNoDuplicates!0 (array!102136 (_ BitVec 32) List!35837) Bool)

(assert (=> b!1537747 (= res!1055017 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35834))))

(assert (= (and start!131040 res!1055016) b!1537746))

(assert (= (and b!1537746 res!1055014) b!1537744))

(assert (= (and b!1537744 res!1055012) b!1537740))

(assert (= (and b!1537740 res!1055013) b!1537743))

(assert (= (and b!1537743 res!1055010) b!1537747))

(assert (= (and b!1537747 res!1055017) b!1537741))

(assert (= (and b!1537741 res!1055015) b!1537745))

(assert (= (and b!1537745 res!1055011) b!1537742))

(declare-fun m!1419659 () Bool)

(assert (=> b!1537740 m!1419659))

(assert (=> b!1537740 m!1419659))

(declare-fun m!1419661 () Bool)

(assert (=> b!1537740 m!1419661))

(declare-fun m!1419663 () Bool)

(assert (=> start!131040 m!1419663))

(declare-fun m!1419665 () Bool)

(assert (=> start!131040 m!1419665))

(declare-fun m!1419667 () Bool)

(assert (=> b!1537741 m!1419667))

(declare-fun m!1419669 () Bool)

(assert (=> b!1537743 m!1419669))

(declare-fun m!1419671 () Bool)

(assert (=> b!1537742 m!1419671))

(declare-fun m!1419673 () Bool)

(assert (=> b!1537742 m!1419673))

(assert (=> b!1537742 m!1419673))

(declare-fun m!1419675 () Bool)

(assert (=> b!1537742 m!1419675))

(declare-fun m!1419677 () Bool)

(assert (=> b!1537747 m!1419677))

(declare-fun m!1419679 () Bool)

(assert (=> b!1537745 m!1419679))

(assert (=> b!1537745 m!1419659))

(assert (=> b!1537745 m!1419659))

(declare-fun m!1419681 () Bool)

(assert (=> b!1537745 m!1419681))

(declare-fun m!1419683 () Bool)

(assert (=> b!1537744 m!1419683))

(assert (=> b!1537744 m!1419683))

(declare-fun m!1419685 () Bool)

(assert (=> b!1537744 m!1419685))

(check-sat (not start!131040) (not b!1537743) (not b!1537745) (not b!1537747) (not b!1537744) (not b!1537740) (not b!1537742))
(check-sat)
(get-model)

(declare-fun d!160047 () Bool)

(assert (=> d!160047 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131040 d!160047))

(declare-fun d!160049 () Bool)

(assert (=> d!160049 (= (array_inv!38518 a!2792) (bvsge (size!49837 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131040 d!160049))

(declare-fun b!1537808 () Bool)

(declare-fun e!855666 () SeekEntryResult!13436)

(assert (=> b!1537808 (= e!855666 Undefined!13436)))

(declare-fun b!1537809 () Bool)

(declare-fun e!855665 () SeekEntryResult!13436)

(assert (=> b!1537809 (= e!855665 (MissingVacant!13436 vacantIndex!5))))

(declare-fun b!1537810 () Bool)

(declare-fun c!140932 () Bool)

(declare-fun lt!664547 () (_ BitVec 64))

(assert (=> b!1537810 (= c!140932 (= lt!664547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!855667 () SeekEntryResult!13436)

(assert (=> b!1537810 (= e!855667 e!855665)))

(declare-fun b!1537812 () Bool)

(assert (=> b!1537812 (= e!855666 e!855667)))

(declare-fun c!140934 () Bool)

(assert (=> b!1537812 (= c!140934 (= lt!664547 (select (arr!49285 a!2792) j!64)))))

(declare-fun b!1537813 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537813 (= e!855665 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49285 a!2792) j!64) a!2792 mask!2480))))

(declare-fun lt!664548 () SeekEntryResult!13436)

(declare-fun d!160051 () Bool)

(get-info :version)

(assert (=> d!160051 (and (or ((_ is Undefined!13436) lt!664548) (not ((_ is Found!13436) lt!664548)) (and (bvsge (index!56140 lt!664548) #b00000000000000000000000000000000) (bvslt (index!56140 lt!664548) (size!49837 a!2792)))) (or ((_ is Undefined!13436) lt!664548) ((_ is Found!13436) lt!664548) (not ((_ is MissingVacant!13436) lt!664548)) (not (= (index!56142 lt!664548) vacantIndex!5)) (and (bvsge (index!56142 lt!664548) #b00000000000000000000000000000000) (bvslt (index!56142 lt!664548) (size!49837 a!2792)))) (or ((_ is Undefined!13436) lt!664548) (ite ((_ is Found!13436) lt!664548) (= (select (arr!49285 a!2792) (index!56140 lt!664548)) (select (arr!49285 a!2792) j!64)) (and ((_ is MissingVacant!13436) lt!664548) (= (index!56142 lt!664548) vacantIndex!5) (= (select (arr!49285 a!2792) (index!56142 lt!664548)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160051 (= lt!664548 e!855666)))

(declare-fun c!140933 () Bool)

(assert (=> d!160051 (= c!140933 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160051 (= lt!664547 (select (arr!49285 a!2792) index!463))))

(assert (=> d!160051 (validMask!0 mask!2480)))

(assert (=> d!160051 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49285 a!2792) j!64) a!2792 mask!2480) lt!664548)))

(declare-fun b!1537811 () Bool)

(assert (=> b!1537811 (= e!855667 (Found!13436 index!463))))

(assert (= (and d!160051 c!140933) b!1537808))

(assert (= (and d!160051 (not c!140933)) b!1537812))

(assert (= (and b!1537812 c!140934) b!1537811))

(assert (= (and b!1537812 (not c!140934)) b!1537810))

(assert (= (and b!1537810 c!140932) b!1537809))

(assert (= (and b!1537810 (not c!140932)) b!1537813))

(declare-fun m!1419743 () Bool)

(assert (=> b!1537813 m!1419743))

(assert (=> b!1537813 m!1419743))

(assert (=> b!1537813 m!1419659))

(declare-fun m!1419745 () Bool)

(assert (=> b!1537813 m!1419745))

(declare-fun m!1419747 () Bool)

(assert (=> d!160051 m!1419747))

(declare-fun m!1419749 () Bool)

(assert (=> d!160051 m!1419749))

(assert (=> d!160051 m!1419679))

(assert (=> d!160051 m!1419663))

(assert (=> b!1537745 d!160051))

(declare-fun d!160053 () Bool)

(assert (=> d!160053 (= (validKeyInArray!0 (select (arr!49285 a!2792) j!64)) (and (not (= (select (arr!49285 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49285 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1537740 d!160053))

(declare-fun b!1537824 () Bool)

(declare-fun e!855678 () Bool)

(declare-fun call!68548 () Bool)

(assert (=> b!1537824 (= e!855678 call!68548)))

(declare-fun bm!68545 () Bool)

(declare-fun c!140937 () Bool)

(assert (=> bm!68545 (= call!68548 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140937 (Cons!35833 (select (arr!49285 a!2792) #b00000000000000000000000000000000) Nil!35834) Nil!35834)))))

(declare-fun b!1537825 () Bool)

(declare-fun e!855677 () Bool)

(assert (=> b!1537825 (= e!855677 e!855678)))

(assert (=> b!1537825 (= c!140937 (validKeyInArray!0 (select (arr!49285 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1537826 () Bool)

(assert (=> b!1537826 (= e!855678 call!68548)))

(declare-fun b!1537827 () Bool)

(declare-fun e!855676 () Bool)

(assert (=> b!1537827 (= e!855676 e!855677)))

(declare-fun res!1055073 () Bool)

(assert (=> b!1537827 (=> (not res!1055073) (not e!855677))))

(declare-fun e!855679 () Bool)

(assert (=> b!1537827 (= res!1055073 (not e!855679))))

(declare-fun res!1055074 () Bool)

(assert (=> b!1537827 (=> (not res!1055074) (not e!855679))))

(assert (=> b!1537827 (= res!1055074 (validKeyInArray!0 (select (arr!49285 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1537828 () Bool)

(declare-fun contains!9973 (List!35837 (_ BitVec 64)) Bool)

(assert (=> b!1537828 (= e!855679 (contains!9973 Nil!35834 (select (arr!49285 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160055 () Bool)

(declare-fun res!1055072 () Bool)

(assert (=> d!160055 (=> res!1055072 e!855676)))

(assert (=> d!160055 (= res!1055072 (bvsge #b00000000000000000000000000000000 (size!49837 a!2792)))))

(assert (=> d!160055 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35834) e!855676)))

(assert (= (and d!160055 (not res!1055072)) b!1537827))

(assert (= (and b!1537827 res!1055074) b!1537828))

(assert (= (and b!1537827 res!1055073) b!1537825))

(assert (= (and b!1537825 c!140937) b!1537826))

(assert (= (and b!1537825 (not c!140937)) b!1537824))

(assert (= (or b!1537826 b!1537824) bm!68545))

(declare-fun m!1419751 () Bool)

(assert (=> bm!68545 m!1419751))

(declare-fun m!1419753 () Bool)

(assert (=> bm!68545 m!1419753))

(assert (=> b!1537825 m!1419751))

(assert (=> b!1537825 m!1419751))

(declare-fun m!1419755 () Bool)

(assert (=> b!1537825 m!1419755))

(assert (=> b!1537827 m!1419751))

(assert (=> b!1537827 m!1419751))

(assert (=> b!1537827 m!1419755))

(assert (=> b!1537828 m!1419751))

(assert (=> b!1537828 m!1419751))

(declare-fun m!1419757 () Bool)

(assert (=> b!1537828 m!1419757))

(assert (=> b!1537747 d!160055))

(declare-fun b!1537829 () Bool)

(declare-fun e!855681 () SeekEntryResult!13436)

(assert (=> b!1537829 (= e!855681 Undefined!13436)))

(declare-fun b!1537830 () Bool)

(declare-fun e!855680 () SeekEntryResult!13436)

(assert (=> b!1537830 (= e!855680 (MissingVacant!13436 vacantIndex!5))))

(declare-fun b!1537831 () Bool)

(declare-fun c!140938 () Bool)

(declare-fun lt!664549 () (_ BitVec 64))

(assert (=> b!1537831 (= c!140938 (= lt!664549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!855682 () SeekEntryResult!13436)

(assert (=> b!1537831 (= e!855682 e!855680)))

(declare-fun b!1537833 () Bool)

(assert (=> b!1537833 (= e!855681 e!855682)))

(declare-fun c!140940 () Bool)

(assert (=> b!1537833 (= c!140940 (= lt!664549 (select (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)))))

(declare-fun b!1537834 () Bool)

(assert (=> b!1537834 (= e!855680 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792)) mask!2480))))

(declare-fun lt!664550 () SeekEntryResult!13436)

(declare-fun d!160059 () Bool)

(assert (=> d!160059 (and (or ((_ is Undefined!13436) lt!664550) (not ((_ is Found!13436) lt!664550)) (and (bvsge (index!56140 lt!664550) #b00000000000000000000000000000000) (bvslt (index!56140 lt!664550) (size!49837 (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792)))))) (or ((_ is Undefined!13436) lt!664550) ((_ is Found!13436) lt!664550) (not ((_ is MissingVacant!13436) lt!664550)) (not (= (index!56142 lt!664550) vacantIndex!5)) (and (bvsge (index!56142 lt!664550) #b00000000000000000000000000000000) (bvslt (index!56142 lt!664550) (size!49837 (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792)))))) (or ((_ is Undefined!13436) lt!664550) (ite ((_ is Found!13436) lt!664550) (= (select (arr!49285 (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792))) (index!56140 lt!664550)) (select (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)) (and ((_ is MissingVacant!13436) lt!664550) (= (index!56142 lt!664550) vacantIndex!5) (= (select (arr!49285 (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792))) (index!56142 lt!664550)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160059 (= lt!664550 e!855681)))

(declare-fun c!140939 () Bool)

(assert (=> d!160059 (= c!140939 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160059 (= lt!664549 (select (arr!49285 (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792))) index!463))))

(assert (=> d!160059 (validMask!0 mask!2480)))

(assert (=> d!160059 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102137 (store (arr!49285 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49837 a!2792)) mask!2480) lt!664550)))

(declare-fun b!1537832 () Bool)

(assert (=> b!1537832 (= e!855682 (Found!13436 index!463))))

(assert (= (and d!160059 c!140939) b!1537829))

(assert (= (and d!160059 (not c!140939)) b!1537833))

(assert (= (and b!1537833 c!140940) b!1537832))

(assert (= (and b!1537833 (not c!140940)) b!1537831))

(assert (= (and b!1537831 c!140938) b!1537830))

(assert (= (and b!1537831 (not c!140938)) b!1537834))

(assert (=> b!1537834 m!1419743))

(assert (=> b!1537834 m!1419743))

(assert (=> b!1537834 m!1419673))

(declare-fun m!1419759 () Bool)

(assert (=> b!1537834 m!1419759))

(declare-fun m!1419761 () Bool)

(assert (=> d!160059 m!1419761))

(declare-fun m!1419763 () Bool)

(assert (=> d!160059 m!1419763))

(declare-fun m!1419765 () Bool)

(assert (=> d!160059 m!1419765))

(assert (=> d!160059 m!1419663))

(assert (=> b!1537742 d!160059))

(declare-fun b!1537843 () Bool)

(declare-fun e!855689 () Bool)

(declare-fun call!68551 () Bool)

(assert (=> b!1537843 (= e!855689 call!68551)))

(declare-fun b!1537844 () Bool)

(declare-fun e!855690 () Bool)

(assert (=> b!1537844 (= e!855690 e!855689)))

(declare-fun lt!664559 () (_ BitVec 64))

(assert (=> b!1537844 (= lt!664559 (select (arr!49285 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51237 0))(
  ( (Unit!51238) )
))
(declare-fun lt!664558 () Unit!51237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102136 (_ BitVec 64) (_ BitVec 32)) Unit!51237)

(assert (=> b!1537844 (= lt!664558 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!664559 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1537844 (arrayContainsKey!0 a!2792 lt!664559 #b00000000000000000000000000000000)))

(declare-fun lt!664557 () Unit!51237)

(assert (=> b!1537844 (= lt!664557 lt!664558)))

(declare-fun res!1055080 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102136 (_ BitVec 32)) SeekEntryResult!13436)

(assert (=> b!1537844 (= res!1055080 (= (seekEntryOrOpen!0 (select (arr!49285 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13436 #b00000000000000000000000000000000)))))

(assert (=> b!1537844 (=> (not res!1055080) (not e!855689))))

(declare-fun b!1537845 () Bool)

(declare-fun e!855691 () Bool)

(assert (=> b!1537845 (= e!855691 e!855690)))

(declare-fun c!140943 () Bool)

(assert (=> b!1537845 (= c!140943 (validKeyInArray!0 (select (arr!49285 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1537846 () Bool)

(assert (=> b!1537846 (= e!855690 call!68551)))

(declare-fun d!160061 () Bool)

(declare-fun res!1055079 () Bool)

(assert (=> d!160061 (=> res!1055079 e!855691)))

(assert (=> d!160061 (= res!1055079 (bvsge #b00000000000000000000000000000000 (size!49837 a!2792)))))

(assert (=> d!160061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!855691)))

(declare-fun bm!68548 () Bool)

(assert (=> bm!68548 (= call!68551 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160061 (not res!1055079)) b!1537845))

(assert (= (and b!1537845 c!140943) b!1537844))

(assert (= (and b!1537845 (not c!140943)) b!1537846))

(assert (= (and b!1537844 res!1055080) b!1537843))

(assert (= (or b!1537843 b!1537846) bm!68548))

(assert (=> b!1537844 m!1419751))

(declare-fun m!1419767 () Bool)

(assert (=> b!1537844 m!1419767))

(declare-fun m!1419769 () Bool)

(assert (=> b!1537844 m!1419769))

(assert (=> b!1537844 m!1419751))

(declare-fun m!1419771 () Bool)

(assert (=> b!1537844 m!1419771))

(assert (=> b!1537845 m!1419751))

(assert (=> b!1537845 m!1419751))

(assert (=> b!1537845 m!1419755))

(declare-fun m!1419773 () Bool)

(assert (=> bm!68548 m!1419773))

(assert (=> b!1537743 d!160061))

(declare-fun d!160069 () Bool)

(assert (=> d!160069 (= (validKeyInArray!0 (select (arr!49285 a!2792) i!951)) (and (not (= (select (arr!49285 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49285 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1537744 d!160069))

(check-sat (not b!1537844) (not b!1537828) (not d!160051) (not bm!68548) (not b!1537827) (not b!1537834) (not b!1537845) (not d!160059) (not b!1537825) (not bm!68545) (not b!1537813))
(check-sat)
