; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131508 () Bool)

(assert start!131508)

(declare-fun b!1540489 () Bool)

(declare-fun res!1056001 () Bool)

(declare-fun e!857346 () Bool)

(assert (=> b!1540489 (=> (not res!1056001) (not e!857346))))

(declare-datatypes ((array!102310 0))(
  ( (array!102311 (arr!49363 (Array (_ BitVec 32) (_ BitVec 64))) (size!49914 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102310)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540489 (= res!1056001 (validKeyInArray!0 (select (arr!49363 a!2792) i!951)))))

(declare-fun b!1540491 () Bool)

(declare-fun res!1056005 () Bool)

(assert (=> b!1540491 (=> (not res!1056005) (not e!857346))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1540491 (= res!1056005 (and (= (size!49914 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49914 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49914 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540492 () Bool)

(declare-fun res!1056004 () Bool)

(assert (=> b!1540492 (=> (not res!1056004) (not e!857346))))

(assert (=> b!1540492 (= res!1056004 (validKeyInArray!0 (select (arr!49363 a!2792) j!64)))))

(declare-fun b!1540493 () Bool)

(declare-fun res!1056006 () Bool)

(assert (=> b!1540493 (=> (not res!1056006) (not e!857346))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540493 (= res!1056006 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49914 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49914 a!2792)) (= (select (arr!49363 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540494 () Bool)

(declare-fun e!857347 () Bool)

(assert (=> b!1540494 (= e!857346 e!857347)))

(declare-fun res!1056002 () Bool)

(assert (=> b!1540494 (=> (not res!1056002) (not e!857347))))

(declare-datatypes ((SeekEntryResult!13384 0))(
  ( (MissingZero!13384 (index!55931 (_ BitVec 32))) (Found!13384 (index!55932 (_ BitVec 32))) (Intermediate!13384 (undefined!14196 Bool) (index!55933 (_ BitVec 32)) (x!137876 (_ BitVec 32))) (Undefined!13384) (MissingVacant!13384 (index!55934 (_ BitVec 32))) )
))
(declare-fun lt!665733 () SeekEntryResult!13384)

(assert (=> b!1540494 (= res!1056002 (and (= lt!665733 (Found!13384 j!64)) (= (select (arr!49363 a!2792) index!463) (select (arr!49363 a!2792) j!64))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102310 (_ BitVec 32)) SeekEntryResult!13384)

(assert (=> b!1540494 (= lt!665733 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49363 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540490 () Bool)

(declare-fun res!1055999 () Bool)

(assert (=> b!1540490 (=> (not res!1055999) (not e!857346))))

(declare-datatypes ((List!35824 0))(
  ( (Nil!35821) (Cons!35820 (h!37283 (_ BitVec 64)) (t!50510 List!35824)) )
))
(declare-fun arrayNoDuplicates!0 (array!102310 (_ BitVec 32) List!35824) Bool)

(assert (=> b!1540490 (= res!1055999 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35821))))

(declare-fun res!1056000 () Bool)

(assert (=> start!131508 (=> (not res!1056000) (not e!857346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131508 (= res!1056000 (validMask!0 mask!2480))))

(assert (=> start!131508 e!857346))

(assert (=> start!131508 true))

(declare-fun array_inv!38644 (array!102310) Bool)

(assert (=> start!131508 (array_inv!38644 a!2792)))

(declare-fun b!1540495 () Bool)

(assert (=> b!1540495 (= e!857347 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)) mask!2480) lt!665733)))))

(declare-fun b!1540496 () Bool)

(declare-fun res!1056003 () Bool)

(assert (=> b!1540496 (=> (not res!1056003) (not e!857346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102310 (_ BitVec 32)) Bool)

(assert (=> b!1540496 (= res!1056003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131508 res!1056000) b!1540491))

(assert (= (and b!1540491 res!1056005) b!1540489))

(assert (= (and b!1540489 res!1056001) b!1540492))

(assert (= (and b!1540492 res!1056004) b!1540496))

(assert (= (and b!1540496 res!1056003) b!1540490))

(assert (= (and b!1540490 res!1055999) b!1540493))

(assert (= (and b!1540493 res!1056006) b!1540494))

(assert (= (and b!1540494 res!1056002) b!1540495))

(declare-fun m!1422787 () Bool)

(assert (=> b!1540489 m!1422787))

(assert (=> b!1540489 m!1422787))

(declare-fun m!1422789 () Bool)

(assert (=> b!1540489 m!1422789))

(declare-fun m!1422791 () Bool)

(assert (=> b!1540495 m!1422791))

(declare-fun m!1422793 () Bool)

(assert (=> b!1540495 m!1422793))

(assert (=> b!1540495 m!1422793))

(declare-fun m!1422795 () Bool)

(assert (=> b!1540495 m!1422795))

(declare-fun m!1422797 () Bool)

(assert (=> b!1540494 m!1422797))

(declare-fun m!1422799 () Bool)

(assert (=> b!1540494 m!1422799))

(assert (=> b!1540494 m!1422799))

(declare-fun m!1422801 () Bool)

(assert (=> b!1540494 m!1422801))

(declare-fun m!1422803 () Bool)

(assert (=> b!1540490 m!1422803))

(declare-fun m!1422805 () Bool)

(assert (=> b!1540493 m!1422805))

(declare-fun m!1422807 () Bool)

(assert (=> start!131508 m!1422807))

(declare-fun m!1422809 () Bool)

(assert (=> start!131508 m!1422809))

(assert (=> b!1540492 m!1422799))

(assert (=> b!1540492 m!1422799))

(declare-fun m!1422811 () Bool)

(assert (=> b!1540492 m!1422811))

(declare-fun m!1422813 () Bool)

(assert (=> b!1540496 m!1422813))

(check-sat (not b!1540494) (not b!1540489) (not b!1540492) (not b!1540496) (not start!131508) (not b!1540495) (not b!1540490))
(check-sat)
(get-model)

(declare-fun d!161009 () Bool)

(assert (=> d!161009 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131508 d!161009))

(declare-fun d!161011 () Bool)

(assert (=> d!161011 (= (array_inv!38644 a!2792) (bvsge (size!49914 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131508 d!161011))

(declare-fun b!1540557 () Bool)

(declare-fun e!857373 () SeekEntryResult!13384)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540557 (= e!857373 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)) mask!2480))))

(declare-fun b!1540558 () Bool)

(declare-fun e!857374 () SeekEntryResult!13384)

(assert (=> b!1540558 (= e!857374 (Found!13384 index!463))))

(declare-fun lt!665744 () SeekEntryResult!13384)

(declare-fun d!161013 () Bool)

(get-info :version)

(assert (=> d!161013 (and (or ((_ is Undefined!13384) lt!665744) (not ((_ is Found!13384) lt!665744)) (and (bvsge (index!55932 lt!665744) #b00000000000000000000000000000000) (bvslt (index!55932 lt!665744) (size!49914 (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)))))) (or ((_ is Undefined!13384) lt!665744) ((_ is Found!13384) lt!665744) (not ((_ is MissingVacant!13384) lt!665744)) (not (= (index!55934 lt!665744) vacantIndex!5)) (and (bvsge (index!55934 lt!665744) #b00000000000000000000000000000000) (bvslt (index!55934 lt!665744) (size!49914 (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)))))) (or ((_ is Undefined!13384) lt!665744) (ite ((_ is Found!13384) lt!665744) (= (select (arr!49363 (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792))) (index!55932 lt!665744)) (select (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)) (and ((_ is MissingVacant!13384) lt!665744) (= (index!55934 lt!665744) vacantIndex!5) (= (select (arr!49363 (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792))) (index!55934 lt!665744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!857372 () SeekEntryResult!13384)

(assert (=> d!161013 (= lt!665744 e!857372)))

(declare-fun c!141822 () Bool)

(assert (=> d!161013 (= c!141822 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!665745 () (_ BitVec 64))

(assert (=> d!161013 (= lt!665745 (select (arr!49363 (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792))) index!463))))

(assert (=> d!161013 (validMask!0 mask!2480)))

(assert (=> d!161013 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102311 (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49914 a!2792)) mask!2480) lt!665744)))

(declare-fun b!1540559 () Bool)

(assert (=> b!1540559 (= e!857372 Undefined!13384)))

(declare-fun b!1540560 () Bool)

(assert (=> b!1540560 (= e!857373 (MissingVacant!13384 vacantIndex!5))))

(declare-fun b!1540561 () Bool)

(declare-fun c!141823 () Bool)

(assert (=> b!1540561 (= c!141823 (= lt!665745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540561 (= e!857374 e!857373)))

(declare-fun b!1540562 () Bool)

(assert (=> b!1540562 (= e!857372 e!857374)))

(declare-fun c!141821 () Bool)

(assert (=> b!1540562 (= c!141821 (= lt!665745 (select (store (arr!49363 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64)))))

(assert (= (and d!161013 c!141822) b!1540559))

(assert (= (and d!161013 (not c!141822)) b!1540562))

(assert (= (and b!1540562 c!141821) b!1540558))

(assert (= (and b!1540562 (not c!141821)) b!1540561))

(assert (= (and b!1540561 c!141823) b!1540560))

(assert (= (and b!1540561 (not c!141823)) b!1540557))

(declare-fun m!1422871 () Bool)

(assert (=> b!1540557 m!1422871))

(assert (=> b!1540557 m!1422871))

(assert (=> b!1540557 m!1422793))

(declare-fun m!1422873 () Bool)

(assert (=> b!1540557 m!1422873))

(declare-fun m!1422875 () Bool)

(assert (=> d!161013 m!1422875))

(declare-fun m!1422877 () Bool)

(assert (=> d!161013 m!1422877))

(declare-fun m!1422879 () Bool)

(assert (=> d!161013 m!1422879))

(assert (=> d!161013 m!1422807))

(assert (=> b!1540495 d!161013))

(declare-fun b!1540563 () Bool)

(declare-fun e!857376 () SeekEntryResult!13384)

(assert (=> b!1540563 (= e!857376 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49363 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540564 () Bool)

(declare-fun e!857377 () SeekEntryResult!13384)

(assert (=> b!1540564 (= e!857377 (Found!13384 index!463))))

(declare-fun lt!665746 () SeekEntryResult!13384)

(declare-fun d!161015 () Bool)

(assert (=> d!161015 (and (or ((_ is Undefined!13384) lt!665746) (not ((_ is Found!13384) lt!665746)) (and (bvsge (index!55932 lt!665746) #b00000000000000000000000000000000) (bvslt (index!55932 lt!665746) (size!49914 a!2792)))) (or ((_ is Undefined!13384) lt!665746) ((_ is Found!13384) lt!665746) (not ((_ is MissingVacant!13384) lt!665746)) (not (= (index!55934 lt!665746) vacantIndex!5)) (and (bvsge (index!55934 lt!665746) #b00000000000000000000000000000000) (bvslt (index!55934 lt!665746) (size!49914 a!2792)))) (or ((_ is Undefined!13384) lt!665746) (ite ((_ is Found!13384) lt!665746) (= (select (arr!49363 a!2792) (index!55932 lt!665746)) (select (arr!49363 a!2792) j!64)) (and ((_ is MissingVacant!13384) lt!665746) (= (index!55934 lt!665746) vacantIndex!5) (= (select (arr!49363 a!2792) (index!55934 lt!665746)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!857375 () SeekEntryResult!13384)

(assert (=> d!161015 (= lt!665746 e!857375)))

(declare-fun c!141825 () Bool)

(assert (=> d!161015 (= c!141825 (bvsge x!510 #b01111111111111111111111111111110))))

(declare-fun lt!665747 () (_ BitVec 64))

(assert (=> d!161015 (= lt!665747 (select (arr!49363 a!2792) index!463))))

(assert (=> d!161015 (validMask!0 mask!2480)))

(assert (=> d!161015 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49363 a!2792) j!64) a!2792 mask!2480) lt!665746)))

(declare-fun b!1540565 () Bool)

(assert (=> b!1540565 (= e!857375 Undefined!13384)))

(declare-fun b!1540566 () Bool)

(assert (=> b!1540566 (= e!857376 (MissingVacant!13384 vacantIndex!5))))

(declare-fun b!1540567 () Bool)

(declare-fun c!141826 () Bool)

(assert (=> b!1540567 (= c!141826 (= lt!665747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540567 (= e!857377 e!857376)))

(declare-fun b!1540568 () Bool)

(assert (=> b!1540568 (= e!857375 e!857377)))

(declare-fun c!141824 () Bool)

(assert (=> b!1540568 (= c!141824 (= lt!665747 (select (arr!49363 a!2792) j!64)))))

(assert (= (and d!161015 c!141825) b!1540565))

(assert (= (and d!161015 (not c!141825)) b!1540568))

(assert (= (and b!1540568 c!141824) b!1540564))

(assert (= (and b!1540568 (not c!141824)) b!1540567))

(assert (= (and b!1540567 c!141826) b!1540566))

(assert (= (and b!1540567 (not c!141826)) b!1540563))

(assert (=> b!1540563 m!1422871))

(assert (=> b!1540563 m!1422871))

(assert (=> b!1540563 m!1422799))

(declare-fun m!1422881 () Bool)

(assert (=> b!1540563 m!1422881))

(declare-fun m!1422883 () Bool)

(assert (=> d!161015 m!1422883))

(declare-fun m!1422885 () Bool)

(assert (=> d!161015 m!1422885))

(assert (=> d!161015 m!1422797))

(assert (=> d!161015 m!1422807))

(assert (=> b!1540494 d!161015))

(declare-fun d!161017 () Bool)

(assert (=> d!161017 (= (validKeyInArray!0 (select (arr!49363 a!2792) i!951)) (and (not (= (select (arr!49363 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49363 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540489 d!161017))

(declare-fun d!161019 () Bool)

(assert (=> d!161019 (= (validKeyInArray!0 (select (arr!49363 a!2792) j!64)) (and (not (= (select (arr!49363 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49363 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540492 d!161019))

(declare-fun d!161021 () Bool)

(declare-fun res!1056060 () Bool)

(declare-fun e!857386 () Bool)

(assert (=> d!161021 (=> res!1056060 e!857386)))

(assert (=> d!161021 (= res!1056060 (bvsge #b00000000000000000000000000000000 (size!49914 a!2792)))))

(assert (=> d!161021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!857386)))

(declare-fun b!1540577 () Bool)

(declare-fun e!857384 () Bool)

(declare-fun call!68733 () Bool)

(assert (=> b!1540577 (= e!857384 call!68733)))

(declare-fun bm!68730 () Bool)

(assert (=> bm!68730 (= call!68733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1540578 () Bool)

(assert (=> b!1540578 (= e!857386 e!857384)))

(declare-fun c!141829 () Bool)

(assert (=> b!1540578 (= c!141829 (validKeyInArray!0 (select (arr!49363 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540579 () Bool)

(declare-fun e!857385 () Bool)

(assert (=> b!1540579 (= e!857385 call!68733)))

(declare-fun b!1540580 () Bool)

(assert (=> b!1540580 (= e!857384 e!857385)))

(declare-fun lt!665754 () (_ BitVec 64))

(assert (=> b!1540580 (= lt!665754 (select (arr!49363 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51335 0))(
  ( (Unit!51336) )
))
(declare-fun lt!665756 () Unit!51335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102310 (_ BitVec 64) (_ BitVec 32)) Unit!51335)

(assert (=> b!1540580 (= lt!665756 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665754 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1540580 (arrayContainsKey!0 a!2792 lt!665754 #b00000000000000000000000000000000)))

(declare-fun lt!665755 () Unit!51335)

(assert (=> b!1540580 (= lt!665755 lt!665756)))

(declare-fun res!1056059 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102310 (_ BitVec 32)) SeekEntryResult!13384)

(assert (=> b!1540580 (= res!1056059 (= (seekEntryOrOpen!0 (select (arr!49363 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13384 #b00000000000000000000000000000000)))))

(assert (=> b!1540580 (=> (not res!1056059) (not e!857385))))

(assert (= (and d!161021 (not res!1056060)) b!1540578))

(assert (= (and b!1540578 c!141829) b!1540580))

(assert (= (and b!1540578 (not c!141829)) b!1540577))

(assert (= (and b!1540580 res!1056059) b!1540579))

(assert (= (or b!1540579 b!1540577) bm!68730))

(declare-fun m!1422887 () Bool)

(assert (=> bm!68730 m!1422887))

(declare-fun m!1422889 () Bool)

(assert (=> b!1540578 m!1422889))

(assert (=> b!1540578 m!1422889))

(declare-fun m!1422891 () Bool)

(assert (=> b!1540578 m!1422891))

(assert (=> b!1540580 m!1422889))

(declare-fun m!1422893 () Bool)

(assert (=> b!1540580 m!1422893))

(declare-fun m!1422895 () Bool)

(assert (=> b!1540580 m!1422895))

(assert (=> b!1540580 m!1422889))

(declare-fun m!1422897 () Bool)

(assert (=> b!1540580 m!1422897))

(assert (=> b!1540496 d!161021))

(declare-fun b!1540606 () Bool)

(declare-fun e!857408 () Bool)

(declare-fun call!68739 () Bool)

(assert (=> b!1540606 (= e!857408 call!68739)))

(declare-fun b!1540607 () Bool)

(declare-fun e!857407 () Bool)

(declare-fun contains!10061 (List!35824 (_ BitVec 64)) Bool)

(assert (=> b!1540607 (= e!857407 (contains!10061 Nil!35821 (select (arr!49363 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!161027 () Bool)

(declare-fun res!1056076 () Bool)

(declare-fun e!857410 () Bool)

(assert (=> d!161027 (=> res!1056076 e!857410)))

(assert (=> d!161027 (= res!1056076 (bvsge #b00000000000000000000000000000000 (size!49914 a!2792)))))

(assert (=> d!161027 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35821) e!857410)))

(declare-fun b!1540608 () Bool)

(declare-fun e!857409 () Bool)

(assert (=> b!1540608 (= e!857409 e!857408)))

(declare-fun c!141835 () Bool)

(assert (=> b!1540608 (= c!141835 (validKeyInArray!0 (select (arr!49363 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540609 () Bool)

(assert (=> b!1540609 (= e!857408 call!68739)))

(declare-fun bm!68736 () Bool)

(assert (=> bm!68736 (= call!68739 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141835 (Cons!35820 (select (arr!49363 a!2792) #b00000000000000000000000000000000) Nil!35821) Nil!35821)))))

(declare-fun b!1540610 () Bool)

(assert (=> b!1540610 (= e!857410 e!857409)))

(declare-fun res!1056078 () Bool)

(assert (=> b!1540610 (=> (not res!1056078) (not e!857409))))

(assert (=> b!1540610 (= res!1056078 (not e!857407))))

(declare-fun res!1056077 () Bool)

(assert (=> b!1540610 (=> (not res!1056077) (not e!857407))))

(assert (=> b!1540610 (= res!1056077 (validKeyInArray!0 (select (arr!49363 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!161027 (not res!1056076)) b!1540610))

(assert (= (and b!1540610 res!1056077) b!1540607))

(assert (= (and b!1540610 res!1056078) b!1540608))

(assert (= (and b!1540608 c!141835) b!1540609))

(assert (= (and b!1540608 (not c!141835)) b!1540606))

(assert (= (or b!1540609 b!1540606) bm!68736))

(assert (=> b!1540607 m!1422889))

(assert (=> b!1540607 m!1422889))

(declare-fun m!1422907 () Bool)

(assert (=> b!1540607 m!1422907))

(assert (=> b!1540608 m!1422889))

(assert (=> b!1540608 m!1422889))

(assert (=> b!1540608 m!1422891))

(assert (=> bm!68736 m!1422889))

(declare-fun m!1422909 () Bool)

(assert (=> bm!68736 m!1422909))

(assert (=> b!1540610 m!1422889))

(assert (=> b!1540610 m!1422889))

(assert (=> b!1540610 m!1422891))

(assert (=> b!1540490 d!161027))

(check-sat (not b!1540578) (not b!1540557) (not b!1540607) (not b!1540608) (not b!1540563) (not d!161013) (not bm!68730) (not d!161015) (not b!1540580) (not b!1540610) (not bm!68736))
(check-sat)
