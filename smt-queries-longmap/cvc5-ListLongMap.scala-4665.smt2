; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64834 () Bool)

(assert start!64834)

(declare-fun b!731807 () Bool)

(declare-fun e!409508 () Bool)

(declare-fun e!409504 () Bool)

(assert (=> b!731807 (= e!409508 e!409504)))

(declare-fun res!491725 () Bool)

(assert (=> b!731807 (=> res!491725 e!409504)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731807 (= res!491725 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324303 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731807 (= lt!324303 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731808 () Bool)

(declare-fun res!491717 () Bool)

(declare-fun e!409500 () Bool)

(assert (=> b!731808 (=> (not res!491717) (not e!409500))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731808 (= res!491717 (validKeyInArray!0 k!2102))))

(declare-fun b!731809 () Bool)

(declare-fun e!409502 () Bool)

(assert (=> b!731809 (= e!409502 (not e!409508))))

(declare-fun res!491721 () Bool)

(assert (=> b!731809 (=> res!491721 e!409508)))

(declare-datatypes ((SeekEntryResult!7325 0))(
  ( (MissingZero!7325 (index!31668 (_ BitVec 32))) (Found!7325 (index!31669 (_ BitVec 32))) (Intermediate!7325 (undefined!8137 Bool) (index!31670 (_ BitVec 32)) (x!62655 (_ BitVec 32))) (Undefined!7325) (MissingVacant!7325 (index!31671 (_ BitVec 32))) )
))
(declare-fun lt!324300 () SeekEntryResult!7325)

(assert (=> b!731809 (= res!491721 (or (not (is-Intermediate!7325 lt!324300)) (bvsge x!1131 (x!62655 lt!324300))))))

(declare-fun e!409501 () Bool)

(assert (=> b!731809 e!409501))

(declare-fun res!491712 () Bool)

(assert (=> b!731809 (=> (not res!491712) (not e!409501))))

(declare-datatypes ((array!41214 0))(
  ( (array!41215 (arr!19725 (Array (_ BitVec 32) (_ BitVec 64))) (size!20146 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41214)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41214 (_ BitVec 32)) Bool)

(assert (=> b!731809 (= res!491712 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24968 0))(
  ( (Unit!24969) )
))
(declare-fun lt!324304 () Unit!24968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24968)

(assert (=> b!731809 (= lt!324304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731810 () Bool)

(declare-fun res!491711 () Bool)

(declare-fun e!409507 () Bool)

(assert (=> b!731810 (=> (not res!491711) (not e!409507))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!731810 (= res!491711 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20146 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20146 a!3186))))))

(declare-fun b!731811 () Bool)

(declare-fun res!491726 () Bool)

(assert (=> b!731811 (=> (not res!491726) (not e!409500))))

(assert (=> b!731811 (= res!491726 (validKeyInArray!0 (select (arr!19725 a!3186) j!159)))))

(declare-fun b!731812 () Bool)

(declare-fun res!491720 () Bool)

(declare-fun e!409506 () Bool)

(assert (=> b!731812 (=> (not res!491720) (not e!409506))))

(declare-fun e!409503 () Bool)

(assert (=> b!731812 (= res!491720 e!409503)))

(declare-fun c!80425 () Bool)

(assert (=> b!731812 (= c!80425 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731813 () Bool)

(declare-fun lt!324308 () SeekEntryResult!7325)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41214 (_ BitVec 32)) SeekEntryResult!7325)

(assert (=> b!731813 (= e!409503 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324308))))

(declare-fun b!731814 () Bool)

(assert (=> b!731814 (= e!409500 e!409507)))

(declare-fun res!491715 () Bool)

(assert (=> b!731814 (=> (not res!491715) (not e!409507))))

(declare-fun lt!324305 () SeekEntryResult!7325)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731814 (= res!491715 (or (= lt!324305 (MissingZero!7325 i!1173)) (= lt!324305 (MissingVacant!7325 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41214 (_ BitVec 32)) SeekEntryResult!7325)

(assert (=> b!731814 (= lt!324305 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!731815 () Bool)

(declare-fun res!491724 () Bool)

(assert (=> b!731815 (=> (not res!491724) (not e!409507))))

(declare-datatypes ((List!13727 0))(
  ( (Nil!13724) (Cons!13723 (h!14786 (_ BitVec 64)) (t!20042 List!13727)) )
))
(declare-fun arrayNoDuplicates!0 (array!41214 (_ BitVec 32) List!13727) Bool)

(assert (=> b!731815 (= res!491724 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13724))))

(declare-fun b!731816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41214 (_ BitVec 32)) SeekEntryResult!7325)

(assert (=> b!731816 (= e!409503 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) (Found!7325 j!159)))))

(declare-fun b!731817 () Bool)

(assert (=> b!731817 (= e!409504 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324303 #b00000000000000000000000000000000) (bvsge lt!324303 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun res!491718 () Bool)

(assert (=> start!64834 (=> (not res!491718) (not e!409500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64834 (= res!491718 (validMask!0 mask!3328))))

(assert (=> start!64834 e!409500))

(assert (=> start!64834 true))

(declare-fun array_inv!15521 (array!41214) Bool)

(assert (=> start!64834 (array_inv!15521 a!3186)))

(declare-fun b!731818 () Bool)

(declare-fun res!491710 () Bool)

(assert (=> b!731818 (=> (not res!491710) (not e!409506))))

(assert (=> b!731818 (= res!491710 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19725 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731819 () Bool)

(declare-fun res!491719 () Bool)

(assert (=> b!731819 (=> res!491719 e!409504)))

(assert (=> b!731819 (= res!491719 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) (Found!7325 j!159))))))

(declare-fun lt!324302 () SeekEntryResult!7325)

(declare-fun e!409505 () Bool)

(declare-fun b!731820 () Bool)

(assert (=> b!731820 (= e!409505 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324302))))

(declare-fun b!731821 () Bool)

(declare-fun res!491713 () Bool)

(assert (=> b!731821 (=> (not res!491713) (not e!409500))))

(assert (=> b!731821 (= res!491713 (and (= (size!20146 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20146 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20146 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731822 () Bool)

(declare-fun res!491723 () Bool)

(assert (=> b!731822 (=> (not res!491723) (not e!409507))))

(assert (=> b!731822 (= res!491723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731823 () Bool)

(assert (=> b!731823 (= e!409506 e!409502)))

(declare-fun res!491714 () Bool)

(assert (=> b!731823 (=> (not res!491714) (not e!409502))))

(declare-fun lt!324301 () SeekEntryResult!7325)

(assert (=> b!731823 (= res!491714 (= lt!324301 lt!324300))))

(declare-fun lt!324307 () array!41214)

(declare-fun lt!324306 () (_ BitVec 64))

(assert (=> b!731823 (= lt!324300 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324306 lt!324307 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731823 (= lt!324301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324306 mask!3328) lt!324306 lt!324307 mask!3328))))

(assert (=> b!731823 (= lt!324306 (select (store (arr!19725 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!731823 (= lt!324307 (array!41215 (store (arr!19725 a!3186) i!1173 k!2102) (size!20146 a!3186)))))

(declare-fun b!731824 () Bool)

(assert (=> b!731824 (= e!409501 e!409505)))

(declare-fun res!491722 () Bool)

(assert (=> b!731824 (=> (not res!491722) (not e!409505))))

(assert (=> b!731824 (= res!491722 (= (seekEntryOrOpen!0 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324302))))

(assert (=> b!731824 (= lt!324302 (Found!7325 j!159))))

(declare-fun b!731825 () Bool)

(declare-fun res!491716 () Bool)

(assert (=> b!731825 (=> (not res!491716) (not e!409500))))

(declare-fun arrayContainsKey!0 (array!41214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731825 (= res!491716 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731826 () Bool)

(assert (=> b!731826 (= e!409507 e!409506)))

(declare-fun res!491709 () Bool)

(assert (=> b!731826 (=> (not res!491709) (not e!409506))))

(assert (=> b!731826 (= res!491709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324308))))

(assert (=> b!731826 (= lt!324308 (Intermediate!7325 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64834 res!491718) b!731821))

(assert (= (and b!731821 res!491713) b!731811))

(assert (= (and b!731811 res!491726) b!731808))

(assert (= (and b!731808 res!491717) b!731825))

(assert (= (and b!731825 res!491716) b!731814))

(assert (= (and b!731814 res!491715) b!731822))

(assert (= (and b!731822 res!491723) b!731815))

(assert (= (and b!731815 res!491724) b!731810))

(assert (= (and b!731810 res!491711) b!731826))

(assert (= (and b!731826 res!491709) b!731818))

(assert (= (and b!731818 res!491710) b!731812))

(assert (= (and b!731812 c!80425) b!731813))

(assert (= (and b!731812 (not c!80425)) b!731816))

(assert (= (and b!731812 res!491720) b!731823))

(assert (= (and b!731823 res!491714) b!731809))

(assert (= (and b!731809 res!491712) b!731824))

(assert (= (and b!731824 res!491722) b!731820))

(assert (= (and b!731809 (not res!491721)) b!731807))

(assert (= (and b!731807 (not res!491725)) b!731819))

(assert (= (and b!731819 (not res!491719)) b!731817))

(declare-fun m!685045 () Bool)

(assert (=> start!64834 m!685045))

(declare-fun m!685047 () Bool)

(assert (=> start!64834 m!685047))

(declare-fun m!685049 () Bool)

(assert (=> b!731813 m!685049))

(assert (=> b!731813 m!685049))

(declare-fun m!685051 () Bool)

(assert (=> b!731813 m!685051))

(assert (=> b!731820 m!685049))

(assert (=> b!731820 m!685049))

(declare-fun m!685053 () Bool)

(assert (=> b!731820 m!685053))

(declare-fun m!685055 () Bool)

(assert (=> b!731808 m!685055))

(declare-fun m!685057 () Bool)

(assert (=> b!731815 m!685057))

(assert (=> b!731816 m!685049))

(assert (=> b!731816 m!685049))

(declare-fun m!685059 () Bool)

(assert (=> b!731816 m!685059))

(assert (=> b!731824 m!685049))

(assert (=> b!731824 m!685049))

(declare-fun m!685061 () Bool)

(assert (=> b!731824 m!685061))

(declare-fun m!685063 () Bool)

(assert (=> b!731818 m!685063))

(declare-fun m!685065 () Bool)

(assert (=> b!731809 m!685065))

(declare-fun m!685067 () Bool)

(assert (=> b!731809 m!685067))

(assert (=> b!731819 m!685049))

(assert (=> b!731819 m!685049))

(assert (=> b!731819 m!685059))

(assert (=> b!731811 m!685049))

(assert (=> b!731811 m!685049))

(declare-fun m!685069 () Bool)

(assert (=> b!731811 m!685069))

(declare-fun m!685071 () Bool)

(assert (=> b!731822 m!685071))

(declare-fun m!685073 () Bool)

(assert (=> b!731807 m!685073))

(assert (=> b!731826 m!685049))

(assert (=> b!731826 m!685049))

(declare-fun m!685075 () Bool)

(assert (=> b!731826 m!685075))

(assert (=> b!731826 m!685075))

(assert (=> b!731826 m!685049))

(declare-fun m!685077 () Bool)

(assert (=> b!731826 m!685077))

(declare-fun m!685079 () Bool)

(assert (=> b!731814 m!685079))

(declare-fun m!685081 () Bool)

(assert (=> b!731825 m!685081))

(declare-fun m!685083 () Bool)

(assert (=> b!731823 m!685083))

(declare-fun m!685085 () Bool)

(assert (=> b!731823 m!685085))

(declare-fun m!685087 () Bool)

(assert (=> b!731823 m!685087))

(declare-fun m!685089 () Bool)

(assert (=> b!731823 m!685089))

(assert (=> b!731823 m!685087))

(declare-fun m!685091 () Bool)

(assert (=> b!731823 m!685091))

(push 1)

(assert (not b!731815))

(assert (not b!731824))

(assert (not b!731822))

(assert (not b!731813))

(assert (not b!731820))

(assert (not b!731808))

(assert (not b!731807))

(assert (not b!731809))

(assert (not b!731825))

(assert (not b!731819))

(assert (not b!731814))

(assert (not start!64834))

(assert (not b!731811))

(assert (not b!731823))

(assert (not b!731826))

(assert (not b!731816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99739 () Bool)

(assert (=> d!99739 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731808 d!99739))

(declare-fun d!99741 () Bool)

(declare-fun lt!324380 () (_ BitVec 32))

(assert (=> d!99741 (and (bvsge lt!324380 #b00000000000000000000000000000000) (bvslt lt!324380 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99741 (= lt!324380 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99741 (validMask!0 mask!3328)))

(assert (=> d!99741 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!324380)))

(declare-fun bs!20945 () Bool)

(assert (= bs!20945 d!99741))

(declare-fun m!685197 () Bool)

(assert (=> bs!20945 m!685197))

(assert (=> bs!20945 m!685045))

(assert (=> b!731807 d!99741))

(declare-fun lt!324407 () SeekEntryResult!7325)

(declare-fun d!99743 () Bool)

(assert (=> d!99743 (and (or (is-Undefined!7325 lt!324407) (not (is-Found!7325 lt!324407)) (and (bvsge (index!31669 lt!324407) #b00000000000000000000000000000000) (bvslt (index!31669 lt!324407) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324407) (is-Found!7325 lt!324407) (not (is-MissingVacant!7325 lt!324407)) (not (= (index!31671 lt!324407) resIntermediateIndex!5)) (and (bvsge (index!31671 lt!324407) #b00000000000000000000000000000000) (bvslt (index!31671 lt!324407) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324407) (ite (is-Found!7325 lt!324407) (= (select (arr!19725 a!3186) (index!31669 lt!324407)) (select (arr!19725 a!3186) j!159)) (and (is-MissingVacant!7325 lt!324407) (= (index!31671 lt!324407) resIntermediateIndex!5) (= (select (arr!19725 a!3186) (index!31671 lt!324407)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!409619 () SeekEntryResult!7325)

(assert (=> d!99743 (= lt!324407 e!409619)))

(declare-fun c!80472 () Bool)

(assert (=> d!99743 (= c!80472 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!324408 () (_ BitVec 64))

(assert (=> d!99743 (= lt!324408 (select (arr!19725 a!3186) resIntermediateIndex!5))))

(assert (=> d!99743 (validMask!0 mask!3328)))

(assert (=> d!99743 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324407)))

(declare-fun b!732040 () Bool)

(assert (=> b!732040 (= e!409619 Undefined!7325)))

(declare-fun e!409618 () SeekEntryResult!7325)

(declare-fun b!732041 () Bool)

(assert (=> b!732041 (= e!409618 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732042 () Bool)

(assert (=> b!732042 (= e!409618 (MissingVacant!7325 resIntermediateIndex!5))))

(declare-fun b!732043 () Bool)

(declare-fun c!80471 () Bool)

(assert (=> b!732043 (= c!80471 (= lt!324408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409620 () SeekEntryResult!7325)

(assert (=> b!732043 (= e!409620 e!409618)))

(declare-fun b!732044 () Bool)

(assert (=> b!732044 (= e!409619 e!409620)))

(declare-fun c!80473 () Bool)

(assert (=> b!732044 (= c!80473 (= lt!324408 (select (arr!19725 a!3186) j!159)))))

(declare-fun b!732045 () Bool)

(assert (=> b!732045 (= e!409620 (Found!7325 resIntermediateIndex!5))))

(assert (= (and d!99743 c!80472) b!732040))

(assert (= (and d!99743 (not c!80472)) b!732044))

(assert (= (and b!732044 c!80473) b!732045))

(assert (= (and b!732044 (not c!80473)) b!732043))

(assert (= (and b!732043 c!80471) b!732042))

(assert (= (and b!732043 (not c!80471)) b!732041))

(declare-fun m!685241 () Bool)

(assert (=> d!99743 m!685241))

(declare-fun m!685243 () Bool)

(assert (=> d!99743 m!685243))

(assert (=> d!99743 m!685063))

(assert (=> d!99743 m!685045))

(declare-fun m!685245 () Bool)

(assert (=> b!732041 m!685245))

(assert (=> b!732041 m!685245))

(assert (=> b!732041 m!685049))

(declare-fun m!685247 () Bool)

(assert (=> b!732041 m!685247))

(assert (=> b!731820 d!99743))

(declare-fun d!99757 () Bool)

(declare-fun res!491869 () Bool)

(declare-fun e!409651 () Bool)

(assert (=> d!99757 (=> res!491869 e!409651)))

(assert (=> d!99757 (= res!491869 (bvsge j!159 (size!20146 a!3186)))))

(assert (=> d!99757 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409651)))

(declare-fun call!34854 () Bool)

(declare-fun bm!34851 () Bool)

(assert (=> bm!34851 (= call!34854 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732090 () Bool)

(declare-fun e!409653 () Bool)

(assert (=> b!732090 (= e!409651 e!409653)))

(declare-fun c!80488 () Bool)

(assert (=> b!732090 (= c!80488 (validKeyInArray!0 (select (arr!19725 a!3186) j!159)))))

(declare-fun b!732091 () Bool)

(assert (=> b!732091 (= e!409653 call!34854)))

(declare-fun b!732092 () Bool)

(declare-fun e!409652 () Bool)

(assert (=> b!732092 (= e!409652 call!34854)))

(declare-fun b!732093 () Bool)

(assert (=> b!732093 (= e!409653 e!409652)))

(declare-fun lt!324431 () (_ BitVec 64))

(assert (=> b!732093 (= lt!324431 (select (arr!19725 a!3186) j!159))))

(declare-fun lt!324432 () Unit!24968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41214 (_ BitVec 64) (_ BitVec 32)) Unit!24968)

(assert (=> b!732093 (= lt!324432 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324431 j!159))))

(assert (=> b!732093 (arrayContainsKey!0 a!3186 lt!324431 #b00000000000000000000000000000000)))

(declare-fun lt!324433 () Unit!24968)

(assert (=> b!732093 (= lt!324433 lt!324432)))

(declare-fun res!491870 () Bool)

(assert (=> b!732093 (= res!491870 (= (seekEntryOrOpen!0 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) (Found!7325 j!159)))))

(assert (=> b!732093 (=> (not res!491870) (not e!409652))))

(assert (= (and d!99757 (not res!491869)) b!732090))

(assert (= (and b!732090 c!80488) b!732093))

(assert (= (and b!732090 (not c!80488)) b!732091))

(assert (= (and b!732093 res!491870) b!732092))

(assert (= (or b!732092 b!732091) bm!34851))

(declare-fun m!685271 () Bool)

(assert (=> bm!34851 m!685271))

(assert (=> b!732090 m!685049))

(assert (=> b!732090 m!685049))

(assert (=> b!732090 m!685069))

(assert (=> b!732093 m!685049))

(declare-fun m!685273 () Bool)

(assert (=> b!732093 m!685273))

(declare-fun m!685275 () Bool)

(assert (=> b!732093 m!685275))

(assert (=> b!732093 m!685049))

(assert (=> b!732093 m!685061))

(assert (=> b!731809 d!99757))

(declare-fun d!99765 () Bool)

(assert (=> d!99765 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324438 () Unit!24968)

(declare-fun choose!38 (array!41214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24968)

(assert (=> d!99765 (= lt!324438 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99765 (validMask!0 mask!3328)))

(assert (=> d!99765 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324438)))

(declare-fun bs!20946 () Bool)

(assert (= bs!20946 d!99765))

(assert (=> bs!20946 m!685065))

(declare-fun m!685285 () Bool)

(assert (=> bs!20946 m!685285))

(assert (=> bs!20946 m!685045))

(assert (=> b!731809 d!99765))

(declare-fun d!99771 () Bool)

(declare-fun lt!324439 () SeekEntryResult!7325)

(assert (=> d!99771 (and (or (is-Undefined!7325 lt!324439) (not (is-Found!7325 lt!324439)) (and (bvsge (index!31669 lt!324439) #b00000000000000000000000000000000) (bvslt (index!31669 lt!324439) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324439) (is-Found!7325 lt!324439) (not (is-MissingVacant!7325 lt!324439)) (not (= (index!31671 lt!324439) resIntermediateIndex!5)) (and (bvsge (index!31671 lt!324439) #b00000000000000000000000000000000) (bvslt (index!31671 lt!324439) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324439) (ite (is-Found!7325 lt!324439) (= (select (arr!19725 a!3186) (index!31669 lt!324439)) (select (arr!19725 a!3186) j!159)) (and (is-MissingVacant!7325 lt!324439) (= (index!31671 lt!324439) resIntermediateIndex!5) (= (select (arr!19725 a!3186) (index!31671 lt!324439)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!409664 () SeekEntryResult!7325)

(assert (=> d!99771 (= lt!324439 e!409664)))

(declare-fun c!80493 () Bool)

(assert (=> d!99771 (= c!80493 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324440 () (_ BitVec 64))

(assert (=> d!99771 (= lt!324440 (select (arr!19725 a!3186) index!1321))))

(assert (=> d!99771 (validMask!0 mask!3328)))

(assert (=> d!99771 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324439)))

(declare-fun b!732109 () Bool)

(assert (=> b!732109 (= e!409664 Undefined!7325)))

(declare-fun b!732110 () Bool)

(declare-fun e!409663 () SeekEntryResult!7325)

(assert (=> b!732110 (= e!409663 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732111 () Bool)

(assert (=> b!732111 (= e!409663 (MissingVacant!7325 resIntermediateIndex!5))))

(declare-fun b!732112 () Bool)

(declare-fun c!80492 () Bool)

(assert (=> b!732112 (= c!80492 (= lt!324440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409665 () SeekEntryResult!7325)

(assert (=> b!732112 (= e!409665 e!409663)))

(declare-fun b!732113 () Bool)

(assert (=> b!732113 (= e!409664 e!409665)))

(declare-fun c!80494 () Bool)

(assert (=> b!732113 (= c!80494 (= lt!324440 (select (arr!19725 a!3186) j!159)))))

(declare-fun b!732114 () Bool)

(assert (=> b!732114 (= e!409665 (Found!7325 index!1321))))

(assert (= (and d!99771 c!80493) b!732109))

(assert (= (and d!99771 (not c!80493)) b!732113))

(assert (= (and b!732113 c!80494) b!732114))

(assert (= (and b!732113 (not c!80494)) b!732112))

(assert (= (and b!732112 c!80492) b!732111))

(assert (= (and b!732112 (not c!80492)) b!732110))

(declare-fun m!685287 () Bool)

(assert (=> d!99771 m!685287))

(declare-fun m!685289 () Bool)

(assert (=> d!99771 m!685289))

(declare-fun m!685291 () Bool)

(assert (=> d!99771 m!685291))

(assert (=> d!99771 m!685045))

(assert (=> b!732110 m!685073))

(assert (=> b!732110 m!685073))

(assert (=> b!732110 m!685049))

(declare-fun m!685293 () Bool)

(assert (=> b!732110 m!685293))

(assert (=> b!731819 d!99771))

(declare-fun b!732192 () Bool)

(declare-fun e!409712 () SeekEntryResult!7325)

(declare-fun lt!324474 () SeekEntryResult!7325)

(assert (=> b!732192 (= e!409712 (MissingZero!7325 (index!31670 lt!324474)))))

(declare-fun b!732193 () Bool)

(declare-fun e!409711 () SeekEntryResult!7325)

(assert (=> b!732193 (= e!409711 (Found!7325 (index!31670 lt!324474)))))

(declare-fun b!732194 () Bool)

(declare-fun e!409710 () SeekEntryResult!7325)

(assert (=> b!732194 (= e!409710 Undefined!7325)))

(declare-fun b!732195 () Bool)

(assert (=> b!732195 (= e!409712 (seekKeyOrZeroReturnVacant!0 (x!62655 lt!324474) (index!31670 lt!324474) (index!31670 lt!324474) (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99773 () Bool)

(declare-fun lt!324476 () SeekEntryResult!7325)

(assert (=> d!99773 (and (or (is-Undefined!7325 lt!324476) (not (is-Found!7325 lt!324476)) (and (bvsge (index!31669 lt!324476) #b00000000000000000000000000000000) (bvslt (index!31669 lt!324476) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324476) (is-Found!7325 lt!324476) (not (is-MissingZero!7325 lt!324476)) (and (bvsge (index!31668 lt!324476) #b00000000000000000000000000000000) (bvslt (index!31668 lt!324476) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324476) (is-Found!7325 lt!324476) (is-MissingZero!7325 lt!324476) (not (is-MissingVacant!7325 lt!324476)) (and (bvsge (index!31671 lt!324476) #b00000000000000000000000000000000) (bvslt (index!31671 lt!324476) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324476) (ite (is-Found!7325 lt!324476) (= (select (arr!19725 a!3186) (index!31669 lt!324476)) (select (arr!19725 a!3186) j!159)) (ite (is-MissingZero!7325 lt!324476) (= (select (arr!19725 a!3186) (index!31668 lt!324476)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7325 lt!324476) (= (select (arr!19725 a!3186) (index!31671 lt!324476)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99773 (= lt!324476 e!409710)))

(declare-fun c!80529 () Bool)

(assert (=> d!99773 (= c!80529 (and (is-Intermediate!7325 lt!324474) (undefined!8137 lt!324474)))))

(assert (=> d!99773 (= lt!324474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99773 (validMask!0 mask!3328)))

(assert (=> d!99773 (= (seekEntryOrOpen!0 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324476)))

(declare-fun b!732196 () Bool)

(assert (=> b!732196 (= e!409710 e!409711)))

(declare-fun lt!324475 () (_ BitVec 64))

(assert (=> b!732196 (= lt!324475 (select (arr!19725 a!3186) (index!31670 lt!324474)))))

(declare-fun c!80527 () Bool)

(assert (=> b!732196 (= c!80527 (= lt!324475 (select (arr!19725 a!3186) j!159)))))

(declare-fun b!732197 () Bool)

(declare-fun c!80528 () Bool)

(assert (=> b!732197 (= c!80528 (= lt!324475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732197 (= e!409711 e!409712)))

(assert (= (and d!99773 c!80529) b!732194))

(assert (= (and d!99773 (not c!80529)) b!732196))

(assert (= (and b!732196 c!80527) b!732193))

(assert (= (and b!732196 (not c!80527)) b!732197))

(assert (= (and b!732197 c!80528) b!732192))

(assert (= (and b!732197 (not c!80528)) b!732195))

(assert (=> b!732195 m!685049))

(declare-fun m!685329 () Bool)

(assert (=> b!732195 m!685329))

(assert (=> d!99773 m!685049))

(assert (=> d!99773 m!685075))

(declare-fun m!685331 () Bool)

(assert (=> d!99773 m!685331))

(assert (=> d!99773 m!685075))

(assert (=> d!99773 m!685049))

(assert (=> d!99773 m!685077))

(declare-fun m!685333 () Bool)

(assert (=> d!99773 m!685333))

(declare-fun m!685335 () Bool)

(assert (=> d!99773 m!685335))

(assert (=> d!99773 m!685045))

(declare-fun m!685337 () Bool)

(assert (=> b!732196 m!685337))

(assert (=> b!731824 d!99773))

(declare-fun b!732297 () Bool)

(declare-fun lt!324515 () SeekEntryResult!7325)

(assert (=> b!732297 (and (bvsge (index!31670 lt!324515) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324515) (size!20146 a!3186)))))

(declare-fun res!491932 () Bool)

(assert (=> b!732297 (= res!491932 (= (select (arr!19725 a!3186) (index!31670 lt!324515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409778 () Bool)

(assert (=> b!732297 (=> res!491932 e!409778)))

(declare-fun d!99799 () Bool)

(declare-fun e!409777 () Bool)

(assert (=> d!99799 e!409777))

(declare-fun c!80561 () Bool)

(assert (=> d!99799 (= c!80561 (and (is-Intermediate!7325 lt!324515) (undefined!8137 lt!324515)))))

(declare-fun e!409781 () SeekEntryResult!7325)

(assert (=> d!99799 (= lt!324515 e!409781)))

(declare-fun c!80560 () Bool)

(assert (=> d!99799 (= c!80560 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324516 () (_ BitVec 64))

(assert (=> d!99799 (= lt!324516 (select (arr!19725 a!3186) index!1321))))

(assert (=> d!99799 (validMask!0 mask!3328)))

(assert (=> d!99799 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324515)))

(declare-fun b!732298 () Bool)

(declare-fun e!409780 () SeekEntryResult!7325)

(assert (=> b!732298 (= e!409781 e!409780)))

(declare-fun c!80562 () Bool)

(assert (=> b!732298 (= c!80562 (or (= lt!324516 (select (arr!19725 a!3186) j!159)) (= (bvadd lt!324516 lt!324516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732299 () Bool)

(assert (=> b!732299 (and (bvsge (index!31670 lt!324515) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324515) (size!20146 a!3186)))))

(declare-fun res!491931 () Bool)

(assert (=> b!732299 (= res!491931 (= (select (arr!19725 a!3186) (index!31670 lt!324515)) (select (arr!19725 a!3186) j!159)))))

(assert (=> b!732299 (=> res!491931 e!409778)))

(declare-fun e!409779 () Bool)

(assert (=> b!732299 (= e!409779 e!409778)))

(declare-fun b!732300 () Bool)

(assert (=> b!732300 (= e!409780 (Intermediate!7325 false index!1321 x!1131))))

(declare-fun b!732301 () Bool)

(assert (=> b!732301 (= e!409780 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732302 () Bool)

(assert (=> b!732302 (= e!409777 e!409779)))

(declare-fun res!491933 () Bool)

(assert (=> b!732302 (= res!491933 (and (is-Intermediate!7325 lt!324515) (not (undefined!8137 lt!324515)) (bvslt (x!62655 lt!324515) #b01111111111111111111111111111110) (bvsge (x!62655 lt!324515) #b00000000000000000000000000000000) (bvsge (x!62655 lt!324515) x!1131)))))

(assert (=> b!732302 (=> (not res!491933) (not e!409779))))

(declare-fun b!732303 () Bool)

(assert (=> b!732303 (= e!409777 (bvsge (x!62655 lt!324515) #b01111111111111111111111111111110))))

(declare-fun b!732304 () Bool)

(assert (=> b!732304 (and (bvsge (index!31670 lt!324515) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324515) (size!20146 a!3186)))))

(assert (=> b!732304 (= e!409778 (= (select (arr!19725 a!3186) (index!31670 lt!324515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732305 () Bool)

(assert (=> b!732305 (= e!409781 (Intermediate!7325 true index!1321 x!1131))))

(assert (= (and d!99799 c!80560) b!732305))

(assert (= (and d!99799 (not c!80560)) b!732298))

(assert (= (and b!732298 c!80562) b!732300))

(assert (= (and b!732298 (not c!80562)) b!732301))

(assert (= (and d!99799 c!80561) b!732303))

(assert (= (and d!99799 (not c!80561)) b!732302))

(assert (= (and b!732302 res!491933) b!732299))

(assert (= (and b!732299 (not res!491931)) b!732297))

(assert (= (and b!732297 (not res!491932)) b!732304))

(declare-fun m!685413 () Bool)

(assert (=> b!732297 m!685413))

(assert (=> b!732299 m!685413))

(assert (=> b!732304 m!685413))

(assert (=> b!732301 m!685073))

(assert (=> b!732301 m!685073))

(assert (=> b!732301 m!685049))

(declare-fun m!685415 () Bool)

(assert (=> b!732301 m!685415))

(assert (=> d!99799 m!685291))

(assert (=> d!99799 m!685045))

(assert (=> b!731813 d!99799))

(declare-fun b!732306 () Bool)

(declare-fun lt!324517 () SeekEntryResult!7325)

(assert (=> b!732306 (and (bvsge (index!31670 lt!324517) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324517) (size!20146 lt!324307)))))

(declare-fun res!491935 () Bool)

(assert (=> b!732306 (= res!491935 (= (select (arr!19725 lt!324307) (index!31670 lt!324517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409783 () Bool)

(assert (=> b!732306 (=> res!491935 e!409783)))

(declare-fun d!99829 () Bool)

(declare-fun e!409782 () Bool)

(assert (=> d!99829 e!409782))

(declare-fun c!80564 () Bool)

(assert (=> d!99829 (= c!80564 (and (is-Intermediate!7325 lt!324517) (undefined!8137 lt!324517)))))

(declare-fun e!409786 () SeekEntryResult!7325)

(assert (=> d!99829 (= lt!324517 e!409786)))

(declare-fun c!80563 () Bool)

(assert (=> d!99829 (= c!80563 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324518 () (_ BitVec 64))

(assert (=> d!99829 (= lt!324518 (select (arr!19725 lt!324307) index!1321))))

(assert (=> d!99829 (validMask!0 mask!3328)))

(assert (=> d!99829 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324306 lt!324307 mask!3328) lt!324517)))

(declare-fun b!732307 () Bool)

(declare-fun e!409785 () SeekEntryResult!7325)

(assert (=> b!732307 (= e!409786 e!409785)))

(declare-fun c!80565 () Bool)

(assert (=> b!732307 (= c!80565 (or (= lt!324518 lt!324306) (= (bvadd lt!324518 lt!324518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732308 () Bool)

(assert (=> b!732308 (and (bvsge (index!31670 lt!324517) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324517) (size!20146 lt!324307)))))

(declare-fun res!491934 () Bool)

(assert (=> b!732308 (= res!491934 (= (select (arr!19725 lt!324307) (index!31670 lt!324517)) lt!324306))))

(assert (=> b!732308 (=> res!491934 e!409783)))

(declare-fun e!409784 () Bool)

(assert (=> b!732308 (= e!409784 e!409783)))

(declare-fun b!732309 () Bool)

(assert (=> b!732309 (= e!409785 (Intermediate!7325 false index!1321 x!1131))))

(declare-fun b!732310 () Bool)

(assert (=> b!732310 (= e!409785 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!324306 lt!324307 mask!3328))))

(declare-fun b!732311 () Bool)

(assert (=> b!732311 (= e!409782 e!409784)))

(declare-fun res!491936 () Bool)

(assert (=> b!732311 (= res!491936 (and (is-Intermediate!7325 lt!324517) (not (undefined!8137 lt!324517)) (bvslt (x!62655 lt!324517) #b01111111111111111111111111111110) (bvsge (x!62655 lt!324517) #b00000000000000000000000000000000) (bvsge (x!62655 lt!324517) x!1131)))))

(assert (=> b!732311 (=> (not res!491936) (not e!409784))))

(declare-fun b!732312 () Bool)

(assert (=> b!732312 (= e!409782 (bvsge (x!62655 lt!324517) #b01111111111111111111111111111110))))

(declare-fun b!732313 () Bool)

(assert (=> b!732313 (and (bvsge (index!31670 lt!324517) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324517) (size!20146 lt!324307)))))

(assert (=> b!732313 (= e!409783 (= (select (arr!19725 lt!324307) (index!31670 lt!324517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732314 () Bool)

(assert (=> b!732314 (= e!409786 (Intermediate!7325 true index!1321 x!1131))))

(assert (= (and d!99829 c!80563) b!732314))

(assert (= (and d!99829 (not c!80563)) b!732307))

(assert (= (and b!732307 c!80565) b!732309))

(assert (= (and b!732307 (not c!80565)) b!732310))

(assert (= (and d!99829 c!80564) b!732312))

(assert (= (and d!99829 (not c!80564)) b!732311))

(assert (= (and b!732311 res!491936) b!732308))

(assert (= (and b!732308 (not res!491934)) b!732306))

(assert (= (and b!732306 (not res!491935)) b!732313))

(declare-fun m!685417 () Bool)

(assert (=> b!732306 m!685417))

(assert (=> b!732308 m!685417))

(assert (=> b!732313 m!685417))

(assert (=> b!732310 m!685073))

(assert (=> b!732310 m!685073))

(declare-fun m!685419 () Bool)

(assert (=> b!732310 m!685419))

(declare-fun m!685421 () Bool)

(assert (=> d!99829 m!685421))

(assert (=> d!99829 m!685045))

(assert (=> b!731823 d!99829))

(declare-fun b!732315 () Bool)

(declare-fun lt!324519 () SeekEntryResult!7325)

(assert (=> b!732315 (and (bvsge (index!31670 lt!324519) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324519) (size!20146 lt!324307)))))

(declare-fun res!491938 () Bool)

(assert (=> b!732315 (= res!491938 (= (select (arr!19725 lt!324307) (index!31670 lt!324519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409788 () Bool)

(assert (=> b!732315 (=> res!491938 e!409788)))

(declare-fun d!99831 () Bool)

(declare-fun e!409787 () Bool)

(assert (=> d!99831 e!409787))

(declare-fun c!80567 () Bool)

(assert (=> d!99831 (= c!80567 (and (is-Intermediate!7325 lt!324519) (undefined!8137 lt!324519)))))

(declare-fun e!409791 () SeekEntryResult!7325)

(assert (=> d!99831 (= lt!324519 e!409791)))

(declare-fun c!80566 () Bool)

(assert (=> d!99831 (= c!80566 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324520 () (_ BitVec 64))

(assert (=> d!99831 (= lt!324520 (select (arr!19725 lt!324307) (toIndex!0 lt!324306 mask!3328)))))

(assert (=> d!99831 (validMask!0 mask!3328)))

(assert (=> d!99831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324306 mask!3328) lt!324306 lt!324307 mask!3328) lt!324519)))

(declare-fun b!732316 () Bool)

(declare-fun e!409790 () SeekEntryResult!7325)

(assert (=> b!732316 (= e!409791 e!409790)))

(declare-fun c!80568 () Bool)

(assert (=> b!732316 (= c!80568 (or (= lt!324520 lt!324306) (= (bvadd lt!324520 lt!324520) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732317 () Bool)

(assert (=> b!732317 (and (bvsge (index!31670 lt!324519) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324519) (size!20146 lt!324307)))))

(declare-fun res!491937 () Bool)

(assert (=> b!732317 (= res!491937 (= (select (arr!19725 lt!324307) (index!31670 lt!324519)) lt!324306))))

(assert (=> b!732317 (=> res!491937 e!409788)))

(declare-fun e!409789 () Bool)

(assert (=> b!732317 (= e!409789 e!409788)))

(declare-fun b!732318 () Bool)

(assert (=> b!732318 (= e!409790 (Intermediate!7325 false (toIndex!0 lt!324306 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732319 () Bool)

(assert (=> b!732319 (= e!409790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324306 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!324306 lt!324307 mask!3328))))

(declare-fun b!732320 () Bool)

(assert (=> b!732320 (= e!409787 e!409789)))

(declare-fun res!491939 () Bool)

(assert (=> b!732320 (= res!491939 (and (is-Intermediate!7325 lt!324519) (not (undefined!8137 lt!324519)) (bvslt (x!62655 lt!324519) #b01111111111111111111111111111110) (bvsge (x!62655 lt!324519) #b00000000000000000000000000000000) (bvsge (x!62655 lt!324519) #b00000000000000000000000000000000)))))

(assert (=> b!732320 (=> (not res!491939) (not e!409789))))

(declare-fun b!732321 () Bool)

(assert (=> b!732321 (= e!409787 (bvsge (x!62655 lt!324519) #b01111111111111111111111111111110))))

(declare-fun b!732322 () Bool)

(assert (=> b!732322 (and (bvsge (index!31670 lt!324519) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324519) (size!20146 lt!324307)))))

(assert (=> b!732322 (= e!409788 (= (select (arr!19725 lt!324307) (index!31670 lt!324519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732323 () Bool)

(assert (=> b!732323 (= e!409791 (Intermediate!7325 true (toIndex!0 lt!324306 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99831 c!80566) b!732323))

(assert (= (and d!99831 (not c!80566)) b!732316))

(assert (= (and b!732316 c!80568) b!732318))

(assert (= (and b!732316 (not c!80568)) b!732319))

(assert (= (and d!99831 c!80567) b!732321))

(assert (= (and d!99831 (not c!80567)) b!732320))

(assert (= (and b!732320 res!491939) b!732317))

(assert (= (and b!732317 (not res!491937)) b!732315))

(assert (= (and b!732315 (not res!491938)) b!732322))

(declare-fun m!685423 () Bool)

(assert (=> b!732315 m!685423))

(assert (=> b!732317 m!685423))

(assert (=> b!732322 m!685423))

(assert (=> b!732319 m!685087))

(declare-fun m!685425 () Bool)

(assert (=> b!732319 m!685425))

(assert (=> b!732319 m!685425))

(declare-fun m!685427 () Bool)

(assert (=> b!732319 m!685427))

(assert (=> d!99831 m!685087))

(declare-fun m!685429 () Bool)

(assert (=> d!99831 m!685429))

(assert (=> d!99831 m!685045))

(assert (=> b!731823 d!99831))

(declare-fun d!99833 () Bool)

(declare-fun lt!324526 () (_ BitVec 32))

(declare-fun lt!324525 () (_ BitVec 32))

(assert (=> d!99833 (= lt!324526 (bvmul (bvxor lt!324525 (bvlshr lt!324525 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99833 (= lt!324525 ((_ extract 31 0) (bvand (bvxor lt!324306 (bvlshr lt!324306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99833 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491940 (let ((h!14791 ((_ extract 31 0) (bvand (bvxor lt!324306 (bvlshr lt!324306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62669 (bvmul (bvxor h!14791 (bvlshr h!14791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62669 (bvlshr x!62669 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491940 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491940 #b00000000000000000000000000000000))))))

(assert (=> d!99833 (= (toIndex!0 lt!324306 mask!3328) (bvand (bvxor lt!324526 (bvlshr lt!324526 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731823 d!99833))

(declare-fun d!99835 () Bool)

(declare-fun res!491941 () Bool)

(declare-fun e!409792 () Bool)

(assert (=> d!99835 (=> res!491941 e!409792)))

(assert (=> d!99835 (= res!491941 (bvsge #b00000000000000000000000000000000 (size!20146 a!3186)))))

(assert (=> d!99835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409792)))

(declare-fun bm!34863 () Bool)

(declare-fun call!34866 () Bool)

(assert (=> bm!34863 (= call!34866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!732324 () Bool)

(declare-fun e!409794 () Bool)

(assert (=> b!732324 (= e!409792 e!409794)))

(declare-fun c!80569 () Bool)

(assert (=> b!732324 (= c!80569 (validKeyInArray!0 (select (arr!19725 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732325 () Bool)

(assert (=> b!732325 (= e!409794 call!34866)))

(declare-fun b!732326 () Bool)

(declare-fun e!409793 () Bool)

(assert (=> b!732326 (= e!409793 call!34866)))

(declare-fun b!732327 () Bool)

(assert (=> b!732327 (= e!409794 e!409793)))

(declare-fun lt!324527 () (_ BitVec 64))

(assert (=> b!732327 (= lt!324527 (select (arr!19725 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324528 () Unit!24968)

(assert (=> b!732327 (= lt!324528 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324527 #b00000000000000000000000000000000))))

(assert (=> b!732327 (arrayContainsKey!0 a!3186 lt!324527 #b00000000000000000000000000000000)))

(declare-fun lt!324529 () Unit!24968)

(assert (=> b!732327 (= lt!324529 lt!324528)))

(declare-fun res!491942 () Bool)

(assert (=> b!732327 (= res!491942 (= (seekEntryOrOpen!0 (select (arr!19725 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7325 #b00000000000000000000000000000000)))))

(assert (=> b!732327 (=> (not res!491942) (not e!409793))))

(assert (= (and d!99835 (not res!491941)) b!732324))

(assert (= (and b!732324 c!80569) b!732327))

(assert (= (and b!732324 (not c!80569)) b!732325))

(assert (= (and b!732327 res!491942) b!732326))

(assert (= (or b!732326 b!732325) bm!34863))

(declare-fun m!685431 () Bool)

(assert (=> bm!34863 m!685431))

(declare-fun m!685433 () Bool)

(assert (=> b!732324 m!685433))

(assert (=> b!732324 m!685433))

(declare-fun m!685435 () Bool)

(assert (=> b!732324 m!685435))

(assert (=> b!732327 m!685433))

(declare-fun m!685437 () Bool)

(assert (=> b!732327 m!685437))

(declare-fun m!685439 () Bool)

(assert (=> b!732327 m!685439))

(assert (=> b!732327 m!685433))

(declare-fun m!685441 () Bool)

(assert (=> b!732327 m!685441))

(assert (=> b!731822 d!99835))

(declare-fun d!99837 () Bool)

(assert (=> d!99837 (= (validKeyInArray!0 (select (arr!19725 a!3186) j!159)) (and (not (= (select (arr!19725 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19725 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731811 d!99837))

(declare-fun d!99839 () Bool)

(assert (=> d!99839 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64834 d!99839))

(declare-fun d!99841 () Bool)

(assert (=> d!99841 (= (array_inv!15521 a!3186) (bvsge (size!20146 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64834 d!99841))

(assert (=> b!731816 d!99771))

(declare-fun b!732328 () Bool)

(declare-fun lt!324530 () SeekEntryResult!7325)

(assert (=> b!732328 (and (bvsge (index!31670 lt!324530) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324530) (size!20146 a!3186)))))

(declare-fun res!491944 () Bool)

(assert (=> b!732328 (= res!491944 (= (select (arr!19725 a!3186) (index!31670 lt!324530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409796 () Bool)

(assert (=> b!732328 (=> res!491944 e!409796)))

(declare-fun d!99843 () Bool)

(declare-fun e!409795 () Bool)

(assert (=> d!99843 e!409795))

(declare-fun c!80571 () Bool)

(assert (=> d!99843 (= c!80571 (and (is-Intermediate!7325 lt!324530) (undefined!8137 lt!324530)))))

(declare-fun e!409799 () SeekEntryResult!7325)

(assert (=> d!99843 (= lt!324530 e!409799)))

(declare-fun c!80570 () Bool)

(assert (=> d!99843 (= c!80570 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324531 () (_ BitVec 64))

(assert (=> d!99843 (= lt!324531 (select (arr!19725 a!3186) (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328)))))

(assert (=> d!99843 (validMask!0 mask!3328)))

(assert (=> d!99843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) (select (arr!19725 a!3186) j!159) a!3186 mask!3328) lt!324530)))

(declare-fun b!732329 () Bool)

(declare-fun e!409798 () SeekEntryResult!7325)

(assert (=> b!732329 (= e!409799 e!409798)))

(declare-fun c!80572 () Bool)

(assert (=> b!732329 (= c!80572 (or (= lt!324531 (select (arr!19725 a!3186) j!159)) (= (bvadd lt!324531 lt!324531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732330 () Bool)

(assert (=> b!732330 (and (bvsge (index!31670 lt!324530) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324530) (size!20146 a!3186)))))

(declare-fun res!491943 () Bool)

(assert (=> b!732330 (= res!491943 (= (select (arr!19725 a!3186) (index!31670 lt!324530)) (select (arr!19725 a!3186) j!159)))))

(assert (=> b!732330 (=> res!491943 e!409796)))

(declare-fun e!409797 () Bool)

(assert (=> b!732330 (= e!409797 e!409796)))

(declare-fun b!732331 () Bool)

(assert (=> b!732331 (= e!409798 (Intermediate!7325 false (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!732332 () Bool)

(assert (=> b!732332 (= e!409798 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19725 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732333 () Bool)

(assert (=> b!732333 (= e!409795 e!409797)))

(declare-fun res!491945 () Bool)

(assert (=> b!732333 (= res!491945 (and (is-Intermediate!7325 lt!324530) (not (undefined!8137 lt!324530)) (bvslt (x!62655 lt!324530) #b01111111111111111111111111111110) (bvsge (x!62655 lt!324530) #b00000000000000000000000000000000) (bvsge (x!62655 lt!324530) #b00000000000000000000000000000000)))))

(assert (=> b!732333 (=> (not res!491945) (not e!409797))))

(declare-fun b!732334 () Bool)

(assert (=> b!732334 (= e!409795 (bvsge (x!62655 lt!324530) #b01111111111111111111111111111110))))

(declare-fun b!732335 () Bool)

(assert (=> b!732335 (and (bvsge (index!31670 lt!324530) #b00000000000000000000000000000000) (bvslt (index!31670 lt!324530) (size!20146 a!3186)))))

(assert (=> b!732335 (= e!409796 (= (select (arr!19725 a!3186) (index!31670 lt!324530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!732336 () Bool)

(assert (=> b!732336 (= e!409799 (Intermediate!7325 true (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99843 c!80570) b!732336))

(assert (= (and d!99843 (not c!80570)) b!732329))

(assert (= (and b!732329 c!80572) b!732331))

(assert (= (and b!732329 (not c!80572)) b!732332))

(assert (= (and d!99843 c!80571) b!732334))

(assert (= (and d!99843 (not c!80571)) b!732333))

(assert (= (and b!732333 res!491945) b!732330))

(assert (= (and b!732330 (not res!491943)) b!732328))

(assert (= (and b!732328 (not res!491944)) b!732335))

(declare-fun m!685443 () Bool)

(assert (=> b!732328 m!685443))

(assert (=> b!732330 m!685443))

(assert (=> b!732335 m!685443))

(assert (=> b!732332 m!685075))

(declare-fun m!685445 () Bool)

(assert (=> b!732332 m!685445))

(assert (=> b!732332 m!685445))

(assert (=> b!732332 m!685049))

(declare-fun m!685447 () Bool)

(assert (=> b!732332 m!685447))

(assert (=> d!99843 m!685075))

(declare-fun m!685449 () Bool)

(assert (=> d!99843 m!685449))

(assert (=> d!99843 m!685045))

(assert (=> b!731826 d!99843))

(declare-fun d!99845 () Bool)

(declare-fun lt!324533 () (_ BitVec 32))

(declare-fun lt!324532 () (_ BitVec 32))

(assert (=> d!99845 (= lt!324533 (bvmul (bvxor lt!324532 (bvlshr lt!324532 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99845 (= lt!324532 ((_ extract 31 0) (bvand (bvxor (select (arr!19725 a!3186) j!159) (bvlshr (select (arr!19725 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99845 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491940 (let ((h!14791 ((_ extract 31 0) (bvand (bvxor (select (arr!19725 a!3186) j!159) (bvlshr (select (arr!19725 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62669 (bvmul (bvxor h!14791 (bvlshr h!14791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62669 (bvlshr x!62669 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491940 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491940 #b00000000000000000000000000000000))))))

(assert (=> d!99845 (= (toIndex!0 (select (arr!19725 a!3186) j!159) mask!3328) (bvand (bvxor lt!324533 (bvlshr lt!324533 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731826 d!99845))

(declare-fun b!732347 () Bool)

(declare-fun e!409808 () Bool)

(declare-fun call!34869 () Bool)

(assert (=> b!732347 (= e!409808 call!34869)))

(declare-fun d!99847 () Bool)

(declare-fun res!491952 () Bool)

(declare-fun e!409809 () Bool)

(assert (=> d!99847 (=> res!491952 e!409809)))

(assert (=> d!99847 (= res!491952 (bvsge #b00000000000000000000000000000000 (size!20146 a!3186)))))

(assert (=> d!99847 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13724) e!409809)))

(declare-fun b!732348 () Bool)

(assert (=> b!732348 (= e!409808 call!34869)))

(declare-fun bm!34866 () Bool)

(declare-fun c!80575 () Bool)

(assert (=> bm!34866 (= call!34869 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80575 (Cons!13723 (select (arr!19725 a!3186) #b00000000000000000000000000000000) Nil!13724) Nil!13724)))))

(declare-fun b!732349 () Bool)

(declare-fun e!409810 () Bool)

(assert (=> b!732349 (= e!409810 e!409808)))

(assert (=> b!732349 (= c!80575 (validKeyInArray!0 (select (arr!19725 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732350 () Bool)

(declare-fun e!409811 () Bool)

(declare-fun contains!4056 (List!13727 (_ BitVec 64)) Bool)

(assert (=> b!732350 (= e!409811 (contains!4056 Nil!13724 (select (arr!19725 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!732351 () Bool)

(assert (=> b!732351 (= e!409809 e!409810)))

(declare-fun res!491954 () Bool)

(assert (=> b!732351 (=> (not res!491954) (not e!409810))))

(assert (=> b!732351 (= res!491954 (not e!409811))))

(declare-fun res!491953 () Bool)

(assert (=> b!732351 (=> (not res!491953) (not e!409811))))

(assert (=> b!732351 (= res!491953 (validKeyInArray!0 (select (arr!19725 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99847 (not res!491952)) b!732351))

(assert (= (and b!732351 res!491953) b!732350))

(assert (= (and b!732351 res!491954) b!732349))

(assert (= (and b!732349 c!80575) b!732347))

(assert (= (and b!732349 (not c!80575)) b!732348))

(assert (= (or b!732347 b!732348) bm!34866))

(assert (=> bm!34866 m!685433))

(declare-fun m!685451 () Bool)

(assert (=> bm!34866 m!685451))

(assert (=> b!732349 m!685433))

(assert (=> b!732349 m!685433))

(assert (=> b!732349 m!685435))

(assert (=> b!732350 m!685433))

(assert (=> b!732350 m!685433))

(declare-fun m!685453 () Bool)

(assert (=> b!732350 m!685453))

(assert (=> b!732351 m!685433))

(assert (=> b!732351 m!685433))

(assert (=> b!732351 m!685435))

(assert (=> b!731815 d!99847))

(declare-fun d!99849 () Bool)

(declare-fun res!491959 () Bool)

(declare-fun e!409816 () Bool)

(assert (=> d!99849 (=> res!491959 e!409816)))

(assert (=> d!99849 (= res!491959 (= (select (arr!19725 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99849 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!409816)))

(declare-fun b!732356 () Bool)

(declare-fun e!409817 () Bool)

(assert (=> b!732356 (= e!409816 e!409817)))

(declare-fun res!491960 () Bool)

(assert (=> b!732356 (=> (not res!491960) (not e!409817))))

(assert (=> b!732356 (= res!491960 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20146 a!3186)))))

(declare-fun b!732357 () Bool)

(assert (=> b!732357 (= e!409817 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99849 (not res!491959)) b!732356))

(assert (= (and b!732356 res!491960) b!732357))

(assert (=> d!99849 m!685433))

(declare-fun m!685455 () Bool)

(assert (=> b!732357 m!685455))

(assert (=> b!731825 d!99849))

(declare-fun b!732358 () Bool)

(declare-fun e!409820 () SeekEntryResult!7325)

(declare-fun lt!324534 () SeekEntryResult!7325)

(assert (=> b!732358 (= e!409820 (MissingZero!7325 (index!31670 lt!324534)))))

(declare-fun b!732359 () Bool)

(declare-fun e!409819 () SeekEntryResult!7325)

(assert (=> b!732359 (= e!409819 (Found!7325 (index!31670 lt!324534)))))

(declare-fun b!732360 () Bool)

(declare-fun e!409818 () SeekEntryResult!7325)

(assert (=> b!732360 (= e!409818 Undefined!7325)))

(declare-fun b!732361 () Bool)

(assert (=> b!732361 (= e!409820 (seekKeyOrZeroReturnVacant!0 (x!62655 lt!324534) (index!31670 lt!324534) (index!31670 lt!324534) k!2102 a!3186 mask!3328))))

(declare-fun d!99851 () Bool)

(declare-fun lt!324536 () SeekEntryResult!7325)

(assert (=> d!99851 (and (or (is-Undefined!7325 lt!324536) (not (is-Found!7325 lt!324536)) (and (bvsge (index!31669 lt!324536) #b00000000000000000000000000000000) (bvslt (index!31669 lt!324536) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324536) (is-Found!7325 lt!324536) (not (is-MissingZero!7325 lt!324536)) (and (bvsge (index!31668 lt!324536) #b00000000000000000000000000000000) (bvslt (index!31668 lt!324536) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324536) (is-Found!7325 lt!324536) (is-MissingZero!7325 lt!324536) (not (is-MissingVacant!7325 lt!324536)) (and (bvsge (index!31671 lt!324536) #b00000000000000000000000000000000) (bvslt (index!31671 lt!324536) (size!20146 a!3186)))) (or (is-Undefined!7325 lt!324536) (ite (is-Found!7325 lt!324536) (= (select (arr!19725 a!3186) (index!31669 lt!324536)) k!2102) (ite (is-MissingZero!7325 lt!324536) (= (select (arr!19725 a!3186) (index!31668 lt!324536)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7325 lt!324536) (= (select (arr!19725 a!3186) (index!31671 lt!324536)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99851 (= lt!324536 e!409818)))

(declare-fun c!80578 () Bool)

(assert (=> d!99851 (= c!80578 (and (is-Intermediate!7325 lt!324534) (undefined!8137 lt!324534)))))

(assert (=> d!99851 (= lt!324534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99851 (validMask!0 mask!3328)))

(assert (=> d!99851 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!324536)))

(declare-fun b!732362 () Bool)

(assert (=> b!732362 (= e!409818 e!409819)))

(declare-fun lt!324535 () (_ BitVec 64))

(assert (=> b!732362 (= lt!324535 (select (arr!19725 a!3186) (index!31670 lt!324534)))))

(declare-fun c!80576 () Bool)

(assert (=> b!732362 (= c!80576 (= lt!324535 k!2102))))

(declare-fun b!732363 () Bool)

(declare-fun c!80577 () Bool)

(assert (=> b!732363 (= c!80577 (= lt!324535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!732363 (= e!409819 e!409820)))

(assert (= (and d!99851 c!80578) b!732360))

(assert (= (and d!99851 (not c!80578)) b!732362))

(assert (= (and b!732362 c!80576) b!732359))

(assert (= (and b!732362 (not c!80576)) b!732363))

(assert (= (and b!732363 c!80577) b!732358))

(assert (= (and b!732363 (not c!80577)) b!732361))

(declare-fun m!685457 () Bool)

(assert (=> b!732361 m!685457))

(declare-fun m!685459 () Bool)

(assert (=> d!99851 m!685459))

(declare-fun m!685461 () Bool)

(assert (=> d!99851 m!685461))

(assert (=> d!99851 m!685459))

(declare-fun m!685463 () Bool)

(assert (=> d!99851 m!685463))

(declare-fun m!685465 () Bool)

(assert (=> d!99851 m!685465))

(declare-fun m!685467 () Bool)

(assert (=> d!99851 m!685467))

(assert (=> d!99851 m!685045))

(declare-fun m!685469 () Bool)

(assert (=> b!732362 m!685469))

(assert (=> b!731814 d!99851))

(push 1)

