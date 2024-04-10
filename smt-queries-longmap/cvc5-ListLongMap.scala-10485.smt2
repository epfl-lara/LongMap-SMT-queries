; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123288 () Bool)

(assert start!123288)

(declare-fun e!807310 () Bool)

(declare-fun b!1429878 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97449 0))(
  ( (array!97450 (arr!47036 (Array (_ BitVec 32) (_ BitVec 64))) (size!47586 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97449)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11315 0))(
  ( (MissingZero!11315 (index!47652 (_ BitVec 32))) (Found!11315 (index!47653 (_ BitVec 32))) (Intermediate!11315 (undefined!12127 Bool) (index!47654 (_ BitVec 32)) (x!129285 (_ BitVec 32))) (Undefined!11315) (MissingVacant!11315 (index!47655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97449 (_ BitVec 32)) SeekEntryResult!11315)

(assert (=> b!1429878 (= e!807310 (= (seekEntryOrOpen!0 (select (arr!47036 a!2831) j!81) a!2831 mask!2608) (Found!11315 j!81)))))

(declare-fun b!1429879 () Bool)

(declare-fun e!807311 () Bool)

(declare-fun e!807307 () Bool)

(assert (=> b!1429879 (= e!807311 e!807307)))

(declare-fun res!964510 () Bool)

(assert (=> b!1429879 (=> (not res!964510) (not e!807307))))

(declare-fun lt!629535 () SeekEntryResult!11315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97449 (_ BitVec 32)) SeekEntryResult!11315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429879 (= res!964510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) (select (arr!47036 a!2831) j!81) a!2831 mask!2608) lt!629535))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429879 (= lt!629535 (Intermediate!11315 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429881 () Bool)

(declare-fun res!964517 () Bool)

(assert (=> b!1429881 (=> (not res!964517) (not e!807311))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429881 (= res!964517 (validKeyInArray!0 (select (arr!47036 a!2831) i!982)))))

(declare-fun b!1429882 () Bool)

(declare-fun res!964514 () Bool)

(assert (=> b!1429882 (=> (not res!964514) (not e!807311))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429882 (= res!964514 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47586 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47586 a!2831))))))

(declare-fun b!1429883 () Bool)

(declare-fun res!964516 () Bool)

(assert (=> b!1429883 (=> (not res!964516) (not e!807311))))

(assert (=> b!1429883 (= res!964516 (validKeyInArray!0 (select (arr!47036 a!2831) j!81)))))

(declare-fun b!1429884 () Bool)

(declare-fun e!807308 () Bool)

(assert (=> b!1429884 (= e!807307 e!807308)))

(declare-fun res!964507 () Bool)

(assert (=> b!1429884 (=> (not res!964507) (not e!807308))))

(declare-fun lt!629536 () array!97449)

(declare-fun lt!629534 () SeekEntryResult!11315)

(declare-fun lt!629538 () (_ BitVec 64))

(assert (=> b!1429884 (= res!964507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629538 mask!2608) lt!629538 lt!629536 mask!2608) lt!629534))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1429884 (= lt!629534 (Intermediate!11315 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429884 (= lt!629538 (select (store (arr!47036 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429884 (= lt!629536 (array!97450 (store (arr!47036 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47586 a!2831)))))

(declare-fun b!1429885 () Bool)

(declare-fun res!964509 () Bool)

(assert (=> b!1429885 (=> (not res!964509) (not e!807308))))

(assert (=> b!1429885 (= res!964509 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429886 () Bool)

(declare-fun res!964513 () Bool)

(assert (=> b!1429886 (=> (not res!964513) (not e!807311))))

(declare-datatypes ((List!33546 0))(
  ( (Nil!33543) (Cons!33542 (h!34856 (_ BitVec 64)) (t!48240 List!33546)) )
))
(declare-fun arrayNoDuplicates!0 (array!97449 (_ BitVec 32) List!33546) Bool)

(assert (=> b!1429886 (= res!964513 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33543))))

(declare-fun b!1429887 () Bool)

(declare-fun res!964511 () Bool)

(assert (=> b!1429887 (=> (not res!964511) (not e!807308))))

(assert (=> b!1429887 (= res!964511 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47036 a!2831) j!81) a!2831 mask!2608) lt!629535))))

(declare-fun b!1429888 () Bool)

(assert (=> b!1429888 (= e!807308 (not (or (= (select (arr!47036 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47036 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47036 a!2831) index!585) (select (arr!47036 a!2831) j!81)) (not (= (select (store (arr!47036 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13))))))

(assert (=> b!1429888 e!807310))

(declare-fun res!964519 () Bool)

(assert (=> b!1429888 (=> (not res!964519) (not e!807310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97449 (_ BitVec 32)) Bool)

(assert (=> b!1429888 (= res!964519 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48376 0))(
  ( (Unit!48377) )
))
(declare-fun lt!629537 () Unit!48376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48376)

(assert (=> b!1429888 (= lt!629537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429889 () Bool)

(declare-fun res!964518 () Bool)

(assert (=> b!1429889 (=> (not res!964518) (not e!807308))))

(assert (=> b!1429889 (= res!964518 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629538 lt!629536 mask!2608) lt!629534))))

(declare-fun b!1429890 () Bool)

(declare-fun res!964508 () Bool)

(assert (=> b!1429890 (=> (not res!964508) (not e!807311))))

(assert (=> b!1429890 (= res!964508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!964512 () Bool)

(assert (=> start!123288 (=> (not res!964512) (not e!807311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123288 (= res!964512 (validMask!0 mask!2608))))

(assert (=> start!123288 e!807311))

(assert (=> start!123288 true))

(declare-fun array_inv!36064 (array!97449) Bool)

(assert (=> start!123288 (array_inv!36064 a!2831)))

(declare-fun b!1429880 () Bool)

(declare-fun res!964515 () Bool)

(assert (=> b!1429880 (=> (not res!964515) (not e!807311))))

(assert (=> b!1429880 (= res!964515 (and (= (size!47586 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47586 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47586 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123288 res!964512) b!1429880))

(assert (= (and b!1429880 res!964515) b!1429881))

(assert (= (and b!1429881 res!964517) b!1429883))

(assert (= (and b!1429883 res!964516) b!1429890))

(assert (= (and b!1429890 res!964508) b!1429886))

(assert (= (and b!1429886 res!964513) b!1429882))

(assert (= (and b!1429882 res!964514) b!1429879))

(assert (= (and b!1429879 res!964510) b!1429884))

(assert (= (and b!1429884 res!964507) b!1429887))

(assert (= (and b!1429887 res!964511) b!1429889))

(assert (= (and b!1429889 res!964518) b!1429885))

(assert (= (and b!1429885 res!964509) b!1429888))

(assert (= (and b!1429888 res!964519) b!1429878))

(declare-fun m!1319967 () Bool)

(assert (=> b!1429879 m!1319967))

(assert (=> b!1429879 m!1319967))

(declare-fun m!1319969 () Bool)

(assert (=> b!1429879 m!1319969))

(assert (=> b!1429879 m!1319969))

(assert (=> b!1429879 m!1319967))

(declare-fun m!1319971 () Bool)

(assert (=> b!1429879 m!1319971))

(assert (=> b!1429878 m!1319967))

(assert (=> b!1429878 m!1319967))

(declare-fun m!1319973 () Bool)

(assert (=> b!1429878 m!1319973))

(declare-fun m!1319975 () Bool)

(assert (=> b!1429889 m!1319975))

(declare-fun m!1319977 () Bool)

(assert (=> b!1429888 m!1319977))

(declare-fun m!1319979 () Bool)

(assert (=> b!1429888 m!1319979))

(declare-fun m!1319981 () Bool)

(assert (=> b!1429888 m!1319981))

(declare-fun m!1319983 () Bool)

(assert (=> b!1429888 m!1319983))

(assert (=> b!1429888 m!1319967))

(declare-fun m!1319985 () Bool)

(assert (=> b!1429888 m!1319985))

(assert (=> b!1429883 m!1319967))

(assert (=> b!1429883 m!1319967))

(declare-fun m!1319987 () Bool)

(assert (=> b!1429883 m!1319987))

(declare-fun m!1319989 () Bool)

(assert (=> b!1429884 m!1319989))

(assert (=> b!1429884 m!1319989))

(declare-fun m!1319991 () Bool)

(assert (=> b!1429884 m!1319991))

(assert (=> b!1429884 m!1319977))

(declare-fun m!1319993 () Bool)

(assert (=> b!1429884 m!1319993))

(declare-fun m!1319995 () Bool)

(assert (=> b!1429881 m!1319995))

(assert (=> b!1429881 m!1319995))

(declare-fun m!1319997 () Bool)

(assert (=> b!1429881 m!1319997))

(declare-fun m!1319999 () Bool)

(assert (=> start!123288 m!1319999))

(declare-fun m!1320001 () Bool)

(assert (=> start!123288 m!1320001))

(declare-fun m!1320003 () Bool)

(assert (=> b!1429886 m!1320003))

(declare-fun m!1320005 () Bool)

(assert (=> b!1429890 m!1320005))

(assert (=> b!1429887 m!1319967))

(assert (=> b!1429887 m!1319967))

(declare-fun m!1320007 () Bool)

(assert (=> b!1429887 m!1320007))

(push 1)

(assert (not b!1429883))

(assert (not b!1429881))

(assert (not b!1429878))

(assert (not b!1429879))

(assert (not start!123288))

(assert (not b!1429887))

(assert (not b!1429884))

(assert (not b!1429889))

(assert (not b!1429886))

(assert (not b!1429888))

(assert (not b!1429890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1430059 () Bool)

(declare-fun e!807398 () SeekEntryResult!11315)

(declare-fun e!807399 () SeekEntryResult!11315)

(assert (=> b!1430059 (= e!807398 e!807399)))

(declare-fun c!132208 () Bool)

(declare-fun lt!629601 () (_ BitVec 64))

(assert (=> b!1430059 (= c!132208 (or (= lt!629601 lt!629538) (= (bvadd lt!629601 lt!629601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430060 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430060 (= e!807399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629538 lt!629536 mask!2608))))

(declare-fun b!1430061 () Bool)

(declare-fun lt!629600 () SeekEntryResult!11315)

(assert (=> b!1430061 (and (bvsge (index!47654 lt!629600) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629600) (size!47586 lt!629536)))))

(declare-fun res!964628 () Bool)

(assert (=> b!1430061 (= res!964628 (= (select (arr!47036 lt!629536) (index!47654 lt!629600)) lt!629538))))

(declare-fun e!807400 () Bool)

(assert (=> b!1430061 (=> res!964628 e!807400)))

(declare-fun e!807401 () Bool)

(assert (=> b!1430061 (= e!807401 e!807400)))

(declare-fun b!1430062 () Bool)

(assert (=> b!1430062 (= e!807399 (Intermediate!11315 false index!585 x!605))))

(declare-fun b!1430063 () Bool)

(declare-fun e!807397 () Bool)

(assert (=> b!1430063 (= e!807397 (bvsge (x!129285 lt!629600) #b01111111111111111111111111111110))))

(declare-fun b!1430064 () Bool)

(assert (=> b!1430064 (= e!807397 e!807401)))

(declare-fun res!964629 () Bool)

(assert (=> b!1430064 (= res!964629 (and (is-Intermediate!11315 lt!629600) (not (undefined!12127 lt!629600)) (bvslt (x!129285 lt!629600) #b01111111111111111111111111111110) (bvsge (x!129285 lt!629600) #b00000000000000000000000000000000) (bvsge (x!129285 lt!629600) x!605)))))

(assert (=> b!1430064 (=> (not res!964629) (not e!807401))))

(declare-fun b!1430065 () Bool)

(assert (=> b!1430065 (and (bvsge (index!47654 lt!629600) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629600) (size!47586 lt!629536)))))

(assert (=> b!1430065 (= e!807400 (= (select (arr!47036 lt!629536) (index!47654 lt!629600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430066 () Bool)

(assert (=> b!1430066 (= e!807398 (Intermediate!11315 true index!585 x!605))))

(declare-fun d!153585 () Bool)

(assert (=> d!153585 e!807397))

(declare-fun c!132210 () Bool)

(assert (=> d!153585 (= c!132210 (and (is-Intermediate!11315 lt!629600) (undefined!12127 lt!629600)))))

(assert (=> d!153585 (= lt!629600 e!807398)))

(declare-fun c!132209 () Bool)

(assert (=> d!153585 (= c!132209 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153585 (= lt!629601 (select (arr!47036 lt!629536) index!585))))

(assert (=> d!153585 (validMask!0 mask!2608)))

(assert (=> d!153585 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629538 lt!629536 mask!2608) lt!629600)))

(declare-fun b!1430067 () Bool)

(assert (=> b!1430067 (and (bvsge (index!47654 lt!629600) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629600) (size!47586 lt!629536)))))

(declare-fun res!964630 () Bool)

(assert (=> b!1430067 (= res!964630 (= (select (arr!47036 lt!629536) (index!47654 lt!629600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430067 (=> res!964630 e!807400)))

(assert (= (and d!153585 c!132209) b!1430066))

(assert (= (and d!153585 (not c!132209)) b!1430059))

(assert (= (and b!1430059 c!132208) b!1430062))

(assert (= (and b!1430059 (not c!132208)) b!1430060))

(assert (= (and d!153585 c!132210) b!1430063))

(assert (= (and d!153585 (not c!132210)) b!1430064))

(assert (= (and b!1430064 res!964629) b!1430061))

(assert (= (and b!1430061 (not res!964628)) b!1430067))

(assert (= (and b!1430067 (not res!964630)) b!1430065))

(declare-fun m!1320127 () Bool)

(assert (=> b!1430065 m!1320127))

(assert (=> b!1430067 m!1320127))

(declare-fun m!1320129 () Bool)

(assert (=> d!153585 m!1320129))

(assert (=> d!153585 m!1319999))

(declare-fun m!1320131 () Bool)

(assert (=> b!1430060 m!1320131))

(assert (=> b!1430060 m!1320131))

(declare-fun m!1320133 () Bool)

(assert (=> b!1430060 m!1320133))

(assert (=> b!1430061 m!1320127))

(assert (=> b!1429889 d!153585))

(declare-fun d!153591 () Bool)

(assert (=> d!153591 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123288 d!153591))

(declare-fun d!153595 () Bool)

(assert (=> d!153595 (= (array_inv!36064 a!2831) (bvsge (size!47586 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123288 d!153595))

(declare-fun b!1430154 () Bool)

(declare-fun e!807454 () SeekEntryResult!11315)

(declare-fun lt!629653 () SeekEntryResult!11315)

(assert (=> b!1430154 (= e!807454 (MissingZero!11315 (index!47654 lt!629653)))))

(declare-fun d!153597 () Bool)

(declare-fun lt!629654 () SeekEntryResult!11315)

(assert (=> d!153597 (and (or (is-Undefined!11315 lt!629654) (not (is-Found!11315 lt!629654)) (and (bvsge (index!47653 lt!629654) #b00000000000000000000000000000000) (bvslt (index!47653 lt!629654) (size!47586 a!2831)))) (or (is-Undefined!11315 lt!629654) (is-Found!11315 lt!629654) (not (is-MissingZero!11315 lt!629654)) (and (bvsge (index!47652 lt!629654) #b00000000000000000000000000000000) (bvslt (index!47652 lt!629654) (size!47586 a!2831)))) (or (is-Undefined!11315 lt!629654) (is-Found!11315 lt!629654) (is-MissingZero!11315 lt!629654) (not (is-MissingVacant!11315 lt!629654)) (and (bvsge (index!47655 lt!629654) #b00000000000000000000000000000000) (bvslt (index!47655 lt!629654) (size!47586 a!2831)))) (or (is-Undefined!11315 lt!629654) (ite (is-Found!11315 lt!629654) (= (select (arr!47036 a!2831) (index!47653 lt!629654)) (select (arr!47036 a!2831) j!81)) (ite (is-MissingZero!11315 lt!629654) (= (select (arr!47036 a!2831) (index!47652 lt!629654)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11315 lt!629654) (= (select (arr!47036 a!2831) (index!47655 lt!629654)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!807453 () SeekEntryResult!11315)

(assert (=> d!153597 (= lt!629654 e!807453)))

(declare-fun c!132240 () Bool)

(assert (=> d!153597 (= c!132240 (and (is-Intermediate!11315 lt!629653) (undefined!12127 lt!629653)))))

(assert (=> d!153597 (= lt!629653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) (select (arr!47036 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153597 (validMask!0 mask!2608)))

(assert (=> d!153597 (= (seekEntryOrOpen!0 (select (arr!47036 a!2831) j!81) a!2831 mask!2608) lt!629654)))

(declare-fun b!1430155 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97449 (_ BitVec 32)) SeekEntryResult!11315)

(assert (=> b!1430155 (= e!807454 (seekKeyOrZeroReturnVacant!0 (x!129285 lt!629653) (index!47654 lt!629653) (index!47654 lt!629653) (select (arr!47036 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430156 () Bool)

(assert (=> b!1430156 (= e!807453 Undefined!11315)))

(declare-fun b!1430157 () Bool)

(declare-fun c!132241 () Bool)

(declare-fun lt!629652 () (_ BitVec 64))

(assert (=> b!1430157 (= c!132241 (= lt!629652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807455 () SeekEntryResult!11315)

(assert (=> b!1430157 (= e!807455 e!807454)))

(declare-fun b!1430158 () Bool)

(assert (=> b!1430158 (= e!807455 (Found!11315 (index!47654 lt!629653)))))

(declare-fun b!1430159 () Bool)

(assert (=> b!1430159 (= e!807453 e!807455)))

(assert (=> b!1430159 (= lt!629652 (select (arr!47036 a!2831) (index!47654 lt!629653)))))

(declare-fun c!132242 () Bool)

(assert (=> b!1430159 (= c!132242 (= lt!629652 (select (arr!47036 a!2831) j!81)))))

(assert (= (and d!153597 c!132240) b!1430156))

(assert (= (and d!153597 (not c!132240)) b!1430159))

(assert (= (and b!1430159 c!132242) b!1430158))

(assert (= (and b!1430159 (not c!132242)) b!1430157))

(assert (= (and b!1430157 c!132241) b!1430154))

(assert (= (and b!1430157 (not c!132241)) b!1430155))

(assert (=> d!153597 m!1319969))

(assert (=> d!153597 m!1319967))

(assert (=> d!153597 m!1319971))

(declare-fun m!1320191 () Bool)

(assert (=> d!153597 m!1320191))

(declare-fun m!1320193 () Bool)

(assert (=> d!153597 m!1320193))

(assert (=> d!153597 m!1319967))

(assert (=> d!153597 m!1319969))

(assert (=> d!153597 m!1319999))

(declare-fun m!1320195 () Bool)

(assert (=> d!153597 m!1320195))

(assert (=> b!1430155 m!1319967))

(declare-fun m!1320197 () Bool)

(assert (=> b!1430155 m!1320197))

(declare-fun m!1320199 () Bool)

(assert (=> b!1430159 m!1320199))

(assert (=> b!1429878 d!153597))

(declare-fun b!1430169 () Bool)

(declare-fun e!807462 () SeekEntryResult!11315)

(declare-fun e!807463 () SeekEntryResult!11315)

(assert (=> b!1430169 (= e!807462 e!807463)))

(declare-fun c!132246 () Bool)

(declare-fun lt!629658 () (_ BitVec 64))

(assert (=> b!1430169 (= c!132246 (or (= lt!629658 (select (arr!47036 a!2831) j!81)) (= (bvadd lt!629658 lt!629658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430170 () Bool)

(assert (=> b!1430170 (= e!807463 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47036 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430171 () Bool)

(declare-fun lt!629657 () SeekEntryResult!11315)

(assert (=> b!1430171 (and (bvsge (index!47654 lt!629657) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629657) (size!47586 a!2831)))))

(declare-fun res!964664 () Bool)

(assert (=> b!1430171 (= res!964664 (= (select (arr!47036 a!2831) (index!47654 lt!629657)) (select (arr!47036 a!2831) j!81)))))

(declare-fun e!807464 () Bool)

(assert (=> b!1430171 (=> res!964664 e!807464)))

(declare-fun e!807465 () Bool)

(assert (=> b!1430171 (= e!807465 e!807464)))

(declare-fun b!1430172 () Bool)

(assert (=> b!1430172 (= e!807463 (Intermediate!11315 false (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430173 () Bool)

(declare-fun e!807461 () Bool)

(assert (=> b!1430173 (= e!807461 (bvsge (x!129285 lt!629657) #b01111111111111111111111111111110))))

(declare-fun b!1430174 () Bool)

(assert (=> b!1430174 (= e!807461 e!807465)))

(declare-fun res!964665 () Bool)

(assert (=> b!1430174 (= res!964665 (and (is-Intermediate!11315 lt!629657) (not (undefined!12127 lt!629657)) (bvslt (x!129285 lt!629657) #b01111111111111111111111111111110) (bvsge (x!129285 lt!629657) #b00000000000000000000000000000000) (bvsge (x!129285 lt!629657) #b00000000000000000000000000000000)))))

(assert (=> b!1430174 (=> (not res!964665) (not e!807465))))

(declare-fun b!1430175 () Bool)

(assert (=> b!1430175 (and (bvsge (index!47654 lt!629657) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629657) (size!47586 a!2831)))))

(assert (=> b!1430175 (= e!807464 (= (select (arr!47036 a!2831) (index!47654 lt!629657)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430176 () Bool)

(assert (=> b!1430176 (= e!807462 (Intermediate!11315 true (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153627 () Bool)

(assert (=> d!153627 e!807461))

(declare-fun c!132248 () Bool)

(assert (=> d!153627 (= c!132248 (and (is-Intermediate!11315 lt!629657) (undefined!12127 lt!629657)))))

(assert (=> d!153627 (= lt!629657 e!807462)))

(declare-fun c!132247 () Bool)

(assert (=> d!153627 (= c!132247 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153627 (= lt!629658 (select (arr!47036 a!2831) (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608)))))

(assert (=> d!153627 (validMask!0 mask!2608)))

(assert (=> d!153627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) (select (arr!47036 a!2831) j!81) a!2831 mask!2608) lt!629657)))

(declare-fun b!1430177 () Bool)

(assert (=> b!1430177 (and (bvsge (index!47654 lt!629657) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629657) (size!47586 a!2831)))))

(declare-fun res!964666 () Bool)

(assert (=> b!1430177 (= res!964666 (= (select (arr!47036 a!2831) (index!47654 lt!629657)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430177 (=> res!964666 e!807464)))

(assert (= (and d!153627 c!132247) b!1430176))

(assert (= (and d!153627 (not c!132247)) b!1430169))

(assert (= (and b!1430169 c!132246) b!1430172))

(assert (= (and b!1430169 (not c!132246)) b!1430170))

(assert (= (and d!153627 c!132248) b!1430173))

(assert (= (and d!153627 (not c!132248)) b!1430174))

(assert (= (and b!1430174 res!964665) b!1430171))

(assert (= (and b!1430171 (not res!964664)) b!1430177))

(assert (= (and b!1430177 (not res!964666)) b!1430175))

(declare-fun m!1320207 () Bool)

(assert (=> b!1430175 m!1320207))

(assert (=> b!1430177 m!1320207))

(assert (=> d!153627 m!1319969))

(declare-fun m!1320209 () Bool)

(assert (=> d!153627 m!1320209))

(assert (=> d!153627 m!1319999))

(assert (=> b!1430170 m!1319969))

(declare-fun m!1320211 () Bool)

(assert (=> b!1430170 m!1320211))

(assert (=> b!1430170 m!1320211))

(assert (=> b!1430170 m!1319967))

(declare-fun m!1320213 () Bool)

(assert (=> b!1430170 m!1320213))

(assert (=> b!1430171 m!1320207))

(assert (=> b!1429879 d!153627))

(declare-fun d!153633 () Bool)

(declare-fun lt!629664 () (_ BitVec 32))

(declare-fun lt!629663 () (_ BitVec 32))

(assert (=> d!153633 (= lt!629664 (bvmul (bvxor lt!629663 (bvlshr lt!629663 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153633 (= lt!629663 ((_ extract 31 0) (bvand (bvxor (select (arr!47036 a!2831) j!81) (bvlshr (select (arr!47036 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153633 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964667 (let ((h!34861 ((_ extract 31 0) (bvand (bvxor (select (arr!47036 a!2831) j!81) (bvlshr (select (arr!47036 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129293 (bvmul (bvxor h!34861 (bvlshr h!34861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129293 (bvlshr x!129293 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964667 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964667 #b00000000000000000000000000000000))))))

(assert (=> d!153633 (= (toIndex!0 (select (arr!47036 a!2831) j!81) mask!2608) (bvand (bvxor lt!629664 (bvlshr lt!629664 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429879 d!153633))

(declare-fun b!1430188 () Bool)

(declare-fun e!807475 () SeekEntryResult!11315)

(declare-fun e!807476 () SeekEntryResult!11315)

(assert (=> b!1430188 (= e!807475 e!807476)))

(declare-fun c!132251 () Bool)

(declare-fun lt!629666 () (_ BitVec 64))

(assert (=> b!1430188 (= c!132251 (or (= lt!629666 lt!629538) (= (bvadd lt!629666 lt!629666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430189 () Bool)

(assert (=> b!1430189 (= e!807476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629538 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629538 lt!629536 mask!2608))))

(declare-fun b!1430190 () Bool)

(declare-fun lt!629665 () SeekEntryResult!11315)

(assert (=> b!1430190 (and (bvsge (index!47654 lt!629665) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629665) (size!47586 lt!629536)))))

(declare-fun res!964674 () Bool)

(assert (=> b!1430190 (= res!964674 (= (select (arr!47036 lt!629536) (index!47654 lt!629665)) lt!629538))))

(declare-fun e!807477 () Bool)

(assert (=> b!1430190 (=> res!964674 e!807477)))

(declare-fun e!807478 () Bool)

(assert (=> b!1430190 (= e!807478 e!807477)))

(declare-fun b!1430191 () Bool)

(assert (=> b!1430191 (= e!807476 (Intermediate!11315 false (toIndex!0 lt!629538 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430192 () Bool)

(declare-fun e!807474 () Bool)

(assert (=> b!1430192 (= e!807474 (bvsge (x!129285 lt!629665) #b01111111111111111111111111111110))))

(declare-fun b!1430193 () Bool)

(assert (=> b!1430193 (= e!807474 e!807478)))

(declare-fun res!964675 () Bool)

(assert (=> b!1430193 (= res!964675 (and (is-Intermediate!11315 lt!629665) (not (undefined!12127 lt!629665)) (bvslt (x!129285 lt!629665) #b01111111111111111111111111111110) (bvsge (x!129285 lt!629665) #b00000000000000000000000000000000) (bvsge (x!129285 lt!629665) #b00000000000000000000000000000000)))))

(assert (=> b!1430193 (=> (not res!964675) (not e!807478))))

(declare-fun b!1430194 () Bool)

(assert (=> b!1430194 (and (bvsge (index!47654 lt!629665) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629665) (size!47586 lt!629536)))))

(assert (=> b!1430194 (= e!807477 (= (select (arr!47036 lt!629536) (index!47654 lt!629665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430195 () Bool)

(assert (=> b!1430195 (= e!807475 (Intermediate!11315 true (toIndex!0 lt!629538 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153635 () Bool)

(assert (=> d!153635 e!807474))

(declare-fun c!132253 () Bool)

(assert (=> d!153635 (= c!132253 (and (is-Intermediate!11315 lt!629665) (undefined!12127 lt!629665)))))

(assert (=> d!153635 (= lt!629665 e!807475)))

(declare-fun c!132252 () Bool)

(assert (=> d!153635 (= c!132252 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153635 (= lt!629666 (select (arr!47036 lt!629536) (toIndex!0 lt!629538 mask!2608)))))

(assert (=> d!153635 (validMask!0 mask!2608)))

(assert (=> d!153635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629538 mask!2608) lt!629538 lt!629536 mask!2608) lt!629665)))

(declare-fun b!1430196 () Bool)

(assert (=> b!1430196 (and (bvsge (index!47654 lt!629665) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629665) (size!47586 lt!629536)))))

(declare-fun res!964676 () Bool)

(assert (=> b!1430196 (= res!964676 (= (select (arr!47036 lt!629536) (index!47654 lt!629665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430196 (=> res!964676 e!807477)))

(assert (= (and d!153635 c!132252) b!1430195))

(assert (= (and d!153635 (not c!132252)) b!1430188))

(assert (= (and b!1430188 c!132251) b!1430191))

(assert (= (and b!1430188 (not c!132251)) b!1430189))

(assert (= (and d!153635 c!132253) b!1430192))

(assert (= (and d!153635 (not c!132253)) b!1430193))

(assert (= (and b!1430193 res!964675) b!1430190))

(assert (= (and b!1430190 (not res!964674)) b!1430196))

(assert (= (and b!1430196 (not res!964676)) b!1430194))

(declare-fun m!1320215 () Bool)

(assert (=> b!1430194 m!1320215))

(assert (=> b!1430196 m!1320215))

(assert (=> d!153635 m!1319989))

(declare-fun m!1320217 () Bool)

(assert (=> d!153635 m!1320217))

(assert (=> d!153635 m!1319999))

(assert (=> b!1430189 m!1319989))

(declare-fun m!1320219 () Bool)

(assert (=> b!1430189 m!1320219))

(assert (=> b!1430189 m!1320219))

(declare-fun m!1320221 () Bool)

(assert (=> b!1430189 m!1320221))

(assert (=> b!1430190 m!1320215))

(assert (=> b!1429884 d!153635))

(declare-fun d!153637 () Bool)

(declare-fun lt!629668 () (_ BitVec 32))

(declare-fun lt!629667 () (_ BitVec 32))

(assert (=> d!153637 (= lt!629668 (bvmul (bvxor lt!629667 (bvlshr lt!629667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153637 (= lt!629667 ((_ extract 31 0) (bvand (bvxor lt!629538 (bvlshr lt!629538 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153637 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!964667 (let ((h!34861 ((_ extract 31 0) (bvand (bvxor lt!629538 (bvlshr lt!629538 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129293 (bvmul (bvxor h!34861 (bvlshr h!34861 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129293 (bvlshr x!129293 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!964667 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!964667 #b00000000000000000000000000000000))))))

(assert (=> d!153637 (= (toIndex!0 lt!629538 mask!2608) (bvand (bvxor lt!629668 (bvlshr lt!629668 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429884 d!153637))

(declare-fun d!153639 () Bool)

(assert (=> d!153639 (= (validKeyInArray!0 (select (arr!47036 a!2831) j!81)) (and (not (= (select (arr!47036 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47036 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429883 d!153639))

(declare-fun b!1430228 () Bool)

(declare-fun e!807501 () Bool)

(declare-fun e!807500 () Bool)

(assert (=> b!1430228 (= e!807501 e!807500)))

(declare-fun lt!629681 () (_ BitVec 64))

(assert (=> b!1430228 (= lt!629681 (select (arr!47036 a!2831) j!81))))

(declare-fun lt!629682 () Unit!48376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97449 (_ BitVec 64) (_ BitVec 32)) Unit!48376)

(assert (=> b!1430228 (= lt!629682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629681 j!81))))

(declare-fun arrayContainsKey!0 (array!97449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430228 (arrayContainsKey!0 a!2831 lt!629681 #b00000000000000000000000000000000)))

(declare-fun lt!629683 () Unit!48376)

(assert (=> b!1430228 (= lt!629683 lt!629682)))

(declare-fun res!964690 () Bool)

(assert (=> b!1430228 (= res!964690 (= (seekEntryOrOpen!0 (select (arr!47036 a!2831) j!81) a!2831 mask!2608) (Found!11315 j!81)))))

(assert (=> b!1430228 (=> (not res!964690) (not e!807500))))

(declare-fun b!1430229 () Bool)

(declare-fun call!67422 () Bool)

(assert (=> b!1430229 (= e!807501 call!67422)))

(declare-fun d!153641 () Bool)

(declare-fun res!964691 () Bool)

(declare-fun e!807499 () Bool)

(assert (=> d!153641 (=> res!964691 e!807499)))

(assert (=> d!153641 (= res!964691 (bvsge j!81 (size!47586 a!2831)))))

(assert (=> d!153641 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807499)))

(declare-fun bm!67419 () Bool)

(assert (=> bm!67419 (= call!67422 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430230 () Bool)

(assert (=> b!1430230 (= e!807499 e!807501)))

(declare-fun c!132263 () Bool)

(assert (=> b!1430230 (= c!132263 (validKeyInArray!0 (select (arr!47036 a!2831) j!81)))))

(declare-fun b!1430231 () Bool)

(assert (=> b!1430231 (= e!807500 call!67422)))

(assert (= (and d!153641 (not res!964691)) b!1430230))

(assert (= (and b!1430230 c!132263) b!1430228))

(assert (= (and b!1430230 (not c!132263)) b!1430229))

(assert (= (and b!1430228 res!964690) b!1430231))

(assert (= (or b!1430231 b!1430229) bm!67419))

(assert (=> b!1430228 m!1319967))

(declare-fun m!1320241 () Bool)

(assert (=> b!1430228 m!1320241))

(declare-fun m!1320243 () Bool)

(assert (=> b!1430228 m!1320243))

(assert (=> b!1430228 m!1319967))

(assert (=> b!1430228 m!1319973))

(declare-fun m!1320245 () Bool)

(assert (=> bm!67419 m!1320245))

(assert (=> b!1430230 m!1319967))

(assert (=> b!1430230 m!1319967))

(assert (=> b!1430230 m!1319987))

(assert (=> b!1429888 d!153641))

(declare-fun d!153651 () Bool)

(assert (=> d!153651 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629686 () Unit!48376)

(declare-fun choose!38 (array!97449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48376)

(assert (=> d!153651 (= lt!629686 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153651 (validMask!0 mask!2608)))

(assert (=> d!153651 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629686)))

(declare-fun bs!41662 () Bool)

(assert (= bs!41662 d!153651))

(assert (=> bs!41662 m!1319983))

(declare-fun m!1320247 () Bool)

(assert (=> bs!41662 m!1320247))

(assert (=> bs!41662 m!1319999))

(assert (=> b!1429888 d!153651))

(declare-fun d!153653 () Bool)

(assert (=> d!153653 (= (validKeyInArray!0 (select (arr!47036 a!2831) i!982)) (and (not (= (select (arr!47036 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47036 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429881 d!153653))

(declare-fun b!1430242 () Bool)

(declare-fun e!807511 () Bool)

(declare-fun call!67425 () Bool)

(assert (=> b!1430242 (= e!807511 call!67425)))

(declare-fun b!1430243 () Bool)

(declare-fun e!807513 () Bool)

(declare-fun e!807512 () Bool)

(assert (=> b!1430243 (= e!807513 e!807512)))

(declare-fun res!964700 () Bool)

(assert (=> b!1430243 (=> (not res!964700) (not e!807512))))

(declare-fun e!807510 () Bool)

(assert (=> b!1430243 (= res!964700 (not e!807510))))

(declare-fun res!964698 () Bool)

(assert (=> b!1430243 (=> (not res!964698) (not e!807510))))

(assert (=> b!1430243 (= res!964698 (validKeyInArray!0 (select (arr!47036 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153655 () Bool)

(declare-fun res!964699 () Bool)

(assert (=> d!153655 (=> res!964699 e!807513)))

(assert (=> d!153655 (= res!964699 (bvsge #b00000000000000000000000000000000 (size!47586 a!2831)))))

(assert (=> d!153655 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33543) e!807513)))

(declare-fun b!1430244 () Bool)

(declare-fun contains!9859 (List!33546 (_ BitVec 64)) Bool)

(assert (=> b!1430244 (= e!807510 (contains!9859 Nil!33543 (select (arr!47036 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430245 () Bool)

(assert (=> b!1430245 (= e!807512 e!807511)))

(declare-fun c!132266 () Bool)

(assert (=> b!1430245 (= c!132266 (validKeyInArray!0 (select (arr!47036 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67422 () Bool)

(assert (=> bm!67422 (= call!67425 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132266 (Cons!33542 (select (arr!47036 a!2831) #b00000000000000000000000000000000) Nil!33543) Nil!33543)))))

(declare-fun b!1430246 () Bool)

(assert (=> b!1430246 (= e!807511 call!67425)))

(assert (= (and d!153655 (not res!964699)) b!1430243))

(assert (= (and b!1430243 res!964698) b!1430244))

(assert (= (and b!1430243 res!964700) b!1430245))

(assert (= (and b!1430245 c!132266) b!1430246))

(assert (= (and b!1430245 (not c!132266)) b!1430242))

(assert (= (or b!1430246 b!1430242) bm!67422))

(declare-fun m!1320249 () Bool)

(assert (=> b!1430243 m!1320249))

(assert (=> b!1430243 m!1320249))

(declare-fun m!1320251 () Bool)

(assert (=> b!1430243 m!1320251))

(assert (=> b!1430244 m!1320249))

(assert (=> b!1430244 m!1320249))

(declare-fun m!1320253 () Bool)

(assert (=> b!1430244 m!1320253))

(assert (=> b!1430245 m!1320249))

(assert (=> b!1430245 m!1320249))

(assert (=> b!1430245 m!1320251))

(assert (=> bm!67422 m!1320249))

(declare-fun m!1320255 () Bool)

(assert (=> bm!67422 m!1320255))

(assert (=> b!1429886 d!153655))

(declare-fun b!1430247 () Bool)

(declare-fun e!807515 () SeekEntryResult!11315)

(declare-fun e!807516 () SeekEntryResult!11315)

(assert (=> b!1430247 (= e!807515 e!807516)))

(declare-fun lt!629688 () (_ BitVec 64))

(declare-fun c!132267 () Bool)

(assert (=> b!1430247 (= c!132267 (or (= lt!629688 (select (arr!47036 a!2831) j!81)) (= (bvadd lt!629688 lt!629688) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430248 () Bool)

(assert (=> b!1430248 (= e!807516 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47036 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430249 () Bool)

(declare-fun lt!629687 () SeekEntryResult!11315)

(assert (=> b!1430249 (and (bvsge (index!47654 lt!629687) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629687) (size!47586 a!2831)))))

(declare-fun res!964701 () Bool)

(assert (=> b!1430249 (= res!964701 (= (select (arr!47036 a!2831) (index!47654 lt!629687)) (select (arr!47036 a!2831) j!81)))))

(declare-fun e!807517 () Bool)

(assert (=> b!1430249 (=> res!964701 e!807517)))

(declare-fun e!807518 () Bool)

(assert (=> b!1430249 (= e!807518 e!807517)))

(declare-fun b!1430250 () Bool)

(assert (=> b!1430250 (= e!807516 (Intermediate!11315 false index!585 x!605))))

(declare-fun b!1430251 () Bool)

(declare-fun e!807514 () Bool)

(assert (=> b!1430251 (= e!807514 (bvsge (x!129285 lt!629687) #b01111111111111111111111111111110))))

(declare-fun b!1430252 () Bool)

(assert (=> b!1430252 (= e!807514 e!807518)))

(declare-fun res!964702 () Bool)

(assert (=> b!1430252 (= res!964702 (and (is-Intermediate!11315 lt!629687) (not (undefined!12127 lt!629687)) (bvslt (x!129285 lt!629687) #b01111111111111111111111111111110) (bvsge (x!129285 lt!629687) #b00000000000000000000000000000000) (bvsge (x!129285 lt!629687) x!605)))))

(assert (=> b!1430252 (=> (not res!964702) (not e!807518))))

(declare-fun b!1430253 () Bool)

(assert (=> b!1430253 (and (bvsge (index!47654 lt!629687) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629687) (size!47586 a!2831)))))

(assert (=> b!1430253 (= e!807517 (= (select (arr!47036 a!2831) (index!47654 lt!629687)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430254 () Bool)

(assert (=> b!1430254 (= e!807515 (Intermediate!11315 true index!585 x!605))))

(declare-fun d!153657 () Bool)

(assert (=> d!153657 e!807514))

(declare-fun c!132269 () Bool)

(assert (=> d!153657 (= c!132269 (and (is-Intermediate!11315 lt!629687) (undefined!12127 lt!629687)))))

(assert (=> d!153657 (= lt!629687 e!807515)))

(declare-fun c!132268 () Bool)

(assert (=> d!153657 (= c!132268 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153657 (= lt!629688 (select (arr!47036 a!2831) index!585))))

(assert (=> d!153657 (validMask!0 mask!2608)))

(assert (=> d!153657 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47036 a!2831) j!81) a!2831 mask!2608) lt!629687)))

(declare-fun b!1430255 () Bool)

(assert (=> b!1430255 (and (bvsge (index!47654 lt!629687) #b00000000000000000000000000000000) (bvslt (index!47654 lt!629687) (size!47586 a!2831)))))

(declare-fun res!964703 () Bool)

(assert (=> b!1430255 (= res!964703 (= (select (arr!47036 a!2831) (index!47654 lt!629687)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430255 (=> res!964703 e!807517)))

(assert (= (and d!153657 c!132268) b!1430254))

(assert (= (and d!153657 (not c!132268)) b!1430247))

(assert (= (and b!1430247 c!132267) b!1430250))

(assert (= (and b!1430247 (not c!132267)) b!1430248))

(assert (= (and d!153657 c!132269) b!1430251))

(assert (= (and d!153657 (not c!132269)) b!1430252))

(assert (= (and b!1430252 res!964702) b!1430249))

(assert (= (and b!1430249 (not res!964701)) b!1430255))

(assert (= (and b!1430255 (not res!964703)) b!1430253))

(declare-fun m!1320257 () Bool)

(assert (=> b!1430253 m!1320257))

(assert (=> b!1430255 m!1320257))

(assert (=> d!153657 m!1319981))

(assert (=> d!153657 m!1319999))

(assert (=> b!1430248 m!1320131))

(assert (=> b!1430248 m!1320131))

(assert (=> b!1430248 m!1319967))

(declare-fun m!1320259 () Bool)

(assert (=> b!1430248 m!1320259))

(assert (=> b!1430249 m!1320257))

(assert (=> b!1429887 d!153657))

(declare-fun b!1430268 () Bool)

(declare-fun e!807527 () Bool)

(declare-fun e!807526 () Bool)

(assert (=> b!1430268 (= e!807527 e!807526)))

(declare-fun lt!629695 () (_ BitVec 64))

(assert (=> b!1430268 (= lt!629695 (select (arr!47036 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629696 () Unit!48376)

(assert (=> b!1430268 (= lt!629696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629695 #b00000000000000000000000000000000))))

(assert (=> b!1430268 (arrayContainsKey!0 a!2831 lt!629695 #b00000000000000000000000000000000)))

(declare-fun lt!629697 () Unit!48376)

(assert (=> b!1430268 (= lt!629697 lt!629696)))

(declare-fun res!964704 () Bool)

(assert (=> b!1430268 (= res!964704 (= (seekEntryOrOpen!0 (select (arr!47036 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11315 #b00000000000000000000000000000000)))))

(assert (=> b!1430268 (=> (not res!964704) (not e!807526))))

(declare-fun b!1430269 () Bool)

(declare-fun call!67426 () Bool)

(assert (=> b!1430269 (= e!807527 call!67426)))

(declare-fun d!153659 () Bool)

(declare-fun res!964705 () Bool)

(declare-fun e!807525 () Bool)

(assert (=> d!153659 (=> res!964705 e!807525)))

(assert (=> d!153659 (= res!964705 (bvsge #b00000000000000000000000000000000 (size!47586 a!2831)))))

(assert (=> d!153659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807525)))

(declare-fun bm!67423 () Bool)

(assert (=> bm!67423 (= call!67426 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430270 () Bool)

(assert (=> b!1430270 (= e!807525 e!807527)))

(declare-fun c!132276 () Bool)

(assert (=> b!1430270 (= c!132276 (validKeyInArray!0 (select (arr!47036 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430271 () Bool)

(assert (=> b!1430271 (= e!807526 call!67426)))

(assert (= (and d!153659 (not res!964705)) b!1430270))

(assert (= (and b!1430270 c!132276) b!1430268))

(assert (= (and b!1430270 (not c!132276)) b!1430269))

(assert (= (and b!1430268 res!964704) b!1430271))

(assert (= (or b!1430271 b!1430269) bm!67423))

(assert (=> b!1430268 m!1320249))

(declare-fun m!1320261 () Bool)

(assert (=> b!1430268 m!1320261))

(declare-fun m!1320263 () Bool)

(assert (=> b!1430268 m!1320263))

(assert (=> b!1430268 m!1320249))

(declare-fun m!1320265 () Bool)

(assert (=> b!1430268 m!1320265))

(declare-fun m!1320267 () Bool)

(assert (=> bm!67423 m!1320267))

(assert (=> b!1430270 m!1320249))

(assert (=> b!1430270 m!1320249))

(assert (=> b!1430270 m!1320251))

(assert (=> b!1429890 d!153659))

(push 1)

