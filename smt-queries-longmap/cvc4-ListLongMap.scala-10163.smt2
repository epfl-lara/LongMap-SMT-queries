; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119746 () Bool)

(assert start!119746)

(declare-fun b!1394989 () Bool)

(declare-fun res!934400 () Bool)

(declare-fun e!789753 () Bool)

(assert (=> b!1394989 (=> (not res!934400) (not e!789753))))

(declare-datatypes ((array!95428 0))(
  ( (array!95429 (arr!46072 (Array (_ BitVec 32) (_ BitVec 64))) (size!46622 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95428)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95428 (_ BitVec 32)) Bool)

(assert (=> b!1394989 (= res!934400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394990 () Bool)

(declare-fun res!934399 () Bool)

(assert (=> b!1394990 (=> (not res!934399) (not e!789753))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394990 (= res!934399 (and (= (size!46622 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46622 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46622 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394991 () Bool)

(declare-fun res!934404 () Bool)

(assert (=> b!1394991 (=> (not res!934404) (not e!789753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394991 (= res!934404 (validKeyInArray!0 (select (arr!46072 a!2901) j!112)))))

(declare-fun b!1394992 () Bool)

(declare-fun e!789755 () Bool)

(assert (=> b!1394992 (= e!789753 (not e!789755))))

(declare-fun res!934398 () Bool)

(assert (=> b!1394992 (=> res!934398 e!789755)))

(declare-datatypes ((SeekEntryResult!10389 0))(
  ( (MissingZero!10389 (index!43927 (_ BitVec 32))) (Found!10389 (index!43928 (_ BitVec 32))) (Intermediate!10389 (undefined!11201 Bool) (index!43929 (_ BitVec 32)) (x!125585 (_ BitVec 32))) (Undefined!10389) (MissingVacant!10389 (index!43930 (_ BitVec 32))) )
))
(declare-fun lt!612807 () SeekEntryResult!10389)

(assert (=> b!1394992 (= res!934398 (or (not (is-Intermediate!10389 lt!612807)) (undefined!11201 lt!612807)))))

(declare-fun e!789754 () Bool)

(assert (=> b!1394992 e!789754))

(declare-fun res!934397 () Bool)

(assert (=> b!1394992 (=> (not res!934397) (not e!789754))))

(assert (=> b!1394992 (= res!934397 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46782 0))(
  ( (Unit!46783) )
))
(declare-fun lt!612806 () Unit!46782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46782)

(assert (=> b!1394992 (= lt!612806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95428 (_ BitVec 32)) SeekEntryResult!10389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394992 (= lt!612807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) (select (arr!46072 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394993 () Bool)

(assert (=> b!1394993 (= e!789755 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1394994 () Bool)

(declare-fun res!934402 () Bool)

(assert (=> b!1394994 (=> res!934402 e!789755)))

(assert (=> b!1394994 (= res!934402 (= lt!612807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)) mask!2840)))))

(declare-fun res!934403 () Bool)

(assert (=> start!119746 (=> (not res!934403) (not e!789753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119746 (= res!934403 (validMask!0 mask!2840))))

(assert (=> start!119746 e!789753))

(assert (=> start!119746 true))

(declare-fun array_inv!35100 (array!95428) Bool)

(assert (=> start!119746 (array_inv!35100 a!2901)))

(declare-fun b!1394995 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95428 (_ BitVec 32)) SeekEntryResult!10389)

(assert (=> b!1394995 (= e!789754 (= (seekEntryOrOpen!0 (select (arr!46072 a!2901) j!112) a!2901 mask!2840) (Found!10389 j!112)))))

(declare-fun b!1394996 () Bool)

(declare-fun res!934405 () Bool)

(assert (=> b!1394996 (=> (not res!934405) (not e!789753))))

(declare-datatypes ((List!32591 0))(
  ( (Nil!32588) (Cons!32587 (h!33820 (_ BitVec 64)) (t!47285 List!32591)) )
))
(declare-fun arrayNoDuplicates!0 (array!95428 (_ BitVec 32) List!32591) Bool)

(assert (=> b!1394996 (= res!934405 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32588))))

(declare-fun b!1394997 () Bool)

(declare-fun res!934401 () Bool)

(assert (=> b!1394997 (=> (not res!934401) (not e!789753))))

(assert (=> b!1394997 (= res!934401 (validKeyInArray!0 (select (arr!46072 a!2901) i!1037)))))

(assert (= (and start!119746 res!934403) b!1394990))

(assert (= (and b!1394990 res!934399) b!1394997))

(assert (= (and b!1394997 res!934401) b!1394991))

(assert (= (and b!1394991 res!934404) b!1394989))

(assert (= (and b!1394989 res!934400) b!1394996))

(assert (= (and b!1394996 res!934405) b!1394992))

(assert (= (and b!1394992 res!934397) b!1394995))

(assert (= (and b!1394992 (not res!934398)) b!1394994))

(assert (= (and b!1394994 (not res!934402)) b!1394993))

(declare-fun m!1281509 () Bool)

(assert (=> b!1394996 m!1281509))

(declare-fun m!1281511 () Bool)

(assert (=> b!1394992 m!1281511))

(declare-fun m!1281513 () Bool)

(assert (=> b!1394992 m!1281513))

(assert (=> b!1394992 m!1281511))

(declare-fun m!1281515 () Bool)

(assert (=> b!1394992 m!1281515))

(assert (=> b!1394992 m!1281513))

(assert (=> b!1394992 m!1281511))

(declare-fun m!1281517 () Bool)

(assert (=> b!1394992 m!1281517))

(declare-fun m!1281519 () Bool)

(assert (=> b!1394992 m!1281519))

(declare-fun m!1281521 () Bool)

(assert (=> b!1394994 m!1281521))

(declare-fun m!1281523 () Bool)

(assert (=> b!1394994 m!1281523))

(assert (=> b!1394994 m!1281523))

(declare-fun m!1281525 () Bool)

(assert (=> b!1394994 m!1281525))

(assert (=> b!1394994 m!1281525))

(assert (=> b!1394994 m!1281523))

(declare-fun m!1281527 () Bool)

(assert (=> b!1394994 m!1281527))

(declare-fun m!1281529 () Bool)

(assert (=> b!1394997 m!1281529))

(assert (=> b!1394997 m!1281529))

(declare-fun m!1281531 () Bool)

(assert (=> b!1394997 m!1281531))

(declare-fun m!1281533 () Bool)

(assert (=> b!1394989 m!1281533))

(assert (=> b!1394995 m!1281511))

(assert (=> b!1394995 m!1281511))

(declare-fun m!1281535 () Bool)

(assert (=> b!1394995 m!1281535))

(declare-fun m!1281537 () Bool)

(assert (=> start!119746 m!1281537))

(declare-fun m!1281539 () Bool)

(assert (=> start!119746 m!1281539))

(assert (=> b!1394991 m!1281511))

(assert (=> b!1394991 m!1281511))

(declare-fun m!1281541 () Bool)

(assert (=> b!1394991 m!1281541))

(push 1)

(assert (not b!1394989))

(assert (not start!119746))

(assert (not b!1394997))

(assert (not b!1394991))

(assert (not b!1394996))

(assert (not b!1394994))

(assert (not b!1394992))

(assert (not b!1394995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1395082 () Bool)

(declare-fun e!789807 () SeekEntryResult!10389)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395082 (= e!789807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)) mask!2840))))

(declare-fun b!1395083 () Bool)

(declare-fun e!789808 () Bool)

(declare-fun e!789806 () Bool)

(assert (=> b!1395083 (= e!789808 e!789806)))

(declare-fun res!934439 () Bool)

(declare-fun lt!612840 () SeekEntryResult!10389)

(assert (=> b!1395083 (= res!934439 (and (is-Intermediate!10389 lt!612840) (not (undefined!11201 lt!612840)) (bvslt (x!125585 lt!612840) #b01111111111111111111111111111110) (bvsge (x!125585 lt!612840) #b00000000000000000000000000000000) (bvsge (x!125585 lt!612840) #b00000000000000000000000000000000)))))

(assert (=> b!1395083 (=> (not res!934439) (not e!789806))))

(declare-fun b!1395084 () Bool)

(assert (=> b!1395084 (and (bvsge (index!43929 lt!612840) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612840) (size!46622 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)))))))

(declare-fun res!934438 () Bool)

(assert (=> b!1395084 (= res!934438 (= (select (arr!46072 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901))) (index!43929 lt!612840)) (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!789805 () Bool)

(assert (=> b!1395084 (=> res!934438 e!789805)))

(assert (=> b!1395084 (= e!789806 e!789805)))

(declare-fun b!1395085 () Bool)

(assert (=> b!1395085 (and (bvsge (index!43929 lt!612840) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612840) (size!46622 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)))))))

(declare-fun res!934440 () Bool)

(assert (=> b!1395085 (= res!934440 (= (select (arr!46072 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901))) (index!43929 lt!612840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395085 (=> res!934440 e!789805)))

(declare-fun e!789809 () SeekEntryResult!10389)

(declare-fun b!1395086 () Bool)

(assert (=> b!1395086 (= e!789809 (Intermediate!10389 true (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395087 () Bool)

(assert (=> b!1395087 (= e!789808 (bvsge (x!125585 lt!612840) #b01111111111111111111111111111110))))

(declare-fun b!1395088 () Bool)

(assert (=> b!1395088 (= e!789807 (Intermediate!10389 false (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150641 () Bool)

(assert (=> d!150641 e!789808))

(declare-fun c!129775 () Bool)

(assert (=> d!150641 (= c!129775 (and (is-Intermediate!10389 lt!612840) (undefined!11201 lt!612840)))))

(assert (=> d!150641 (= lt!612840 e!789809)))

(declare-fun c!129776 () Bool)

(assert (=> d!150641 (= c!129776 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612839 () (_ BitVec 64))

(assert (=> d!150641 (= lt!612839 (select (arr!46072 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901))) (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150641 (validMask!0 mask!2840)))

(assert (=> d!150641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)) mask!2840) lt!612840)))

(declare-fun b!1395089 () Bool)

(assert (=> b!1395089 (and (bvsge (index!43929 lt!612840) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612840) (size!46622 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901)))))))

(assert (=> b!1395089 (= e!789805 (= (select (arr!46072 (array!95429 (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46622 a!2901))) (index!43929 lt!612840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395090 () Bool)

(assert (=> b!1395090 (= e!789809 e!789807)))

(declare-fun c!129777 () Bool)

(assert (=> b!1395090 (= c!129777 (or (= lt!612839 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612839 lt!612839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!150641 c!129776) b!1395086))

(assert (= (and d!150641 (not c!129776)) b!1395090))

(assert (= (and b!1395090 c!129777) b!1395088))

(assert (= (and b!1395090 (not c!129777)) b!1395082))

(assert (= (and d!150641 c!129775) b!1395087))

(assert (= (and d!150641 (not c!129775)) b!1395083))

(assert (= (and b!1395083 res!934439) b!1395084))

(assert (= (and b!1395084 (not res!934438)) b!1395085))

(assert (= (and b!1395085 (not res!934440)) b!1395089))

(assert (=> b!1395082 m!1281525))

(declare-fun m!1281571 () Bool)

(assert (=> b!1395082 m!1281571))

(assert (=> b!1395082 m!1281571))

(assert (=> b!1395082 m!1281523))

(declare-fun m!1281573 () Bool)

(assert (=> b!1395082 m!1281573))

(assert (=> d!150641 m!1281525))

(declare-fun m!1281575 () Bool)

(assert (=> d!150641 m!1281575))

(assert (=> d!150641 m!1281537))

(declare-fun m!1281577 () Bool)

(assert (=> b!1395085 m!1281577))

(assert (=> b!1395084 m!1281577))

(assert (=> b!1395089 m!1281577))

(assert (=> b!1394994 d!150641))

(declare-fun d!150649 () Bool)

(declare-fun lt!612852 () (_ BitVec 32))

(declare-fun lt!612851 () (_ BitVec 32))

(assert (=> d!150649 (= lt!612852 (bvmul (bvxor lt!612851 (bvlshr lt!612851 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150649 (= lt!612851 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150649 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934441 (let ((h!33823 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125591 (bvmul (bvxor h!33823 (bvlshr h!33823 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125591 (bvlshr x!125591 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934441 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934441 #b00000000000000000000000000000000))))))

(assert (=> d!150649 (= (toIndex!0 (select (store (arr!46072 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612852 (bvlshr lt!612852 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394994 d!150649))

(declare-fun bm!66806 () Bool)

(declare-fun call!66809 () Bool)

(assert (=> bm!66806 (= call!66809 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150653 () Bool)

(declare-fun res!934448 () Bool)

(declare-fun e!789821 () Bool)

(assert (=> d!150653 (=> res!934448 e!789821)))

(assert (=> d!150653 (= res!934448 (bvsge #b00000000000000000000000000000000 (size!46622 a!2901)))))

(assert (=> d!150653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789821)))

(declare-fun b!1395103 () Bool)

(declare-fun e!789820 () Bool)

(assert (=> b!1395103 (= e!789820 call!66809)))

(declare-fun b!1395104 () Bool)

(declare-fun e!789819 () Bool)

(assert (=> b!1395104 (= e!789819 call!66809)))

(declare-fun b!1395105 () Bool)

(assert (=> b!1395105 (= e!789820 e!789819)))

(declare-fun lt!612865 () (_ BitVec 64))

(assert (=> b!1395105 (= lt!612865 (select (arr!46072 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612867 () Unit!46782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95428 (_ BitVec 64) (_ BitVec 32)) Unit!46782)

(assert (=> b!1395105 (= lt!612867 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612865 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395105 (arrayContainsKey!0 a!2901 lt!612865 #b00000000000000000000000000000000)))

(declare-fun lt!612866 () Unit!46782)

(assert (=> b!1395105 (= lt!612866 lt!612867)))

(declare-fun res!934449 () Bool)

(assert (=> b!1395105 (= res!934449 (= (seekEntryOrOpen!0 (select (arr!46072 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10389 #b00000000000000000000000000000000)))))

(assert (=> b!1395105 (=> (not res!934449) (not e!789819))))

(declare-fun b!1395106 () Bool)

(assert (=> b!1395106 (= e!789821 e!789820)))

(declare-fun c!129781 () Bool)

(assert (=> b!1395106 (= c!129781 (validKeyInArray!0 (select (arr!46072 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150653 (not res!934448)) b!1395106))

(assert (= (and b!1395106 c!129781) b!1395105))

(assert (= (and b!1395106 (not c!129781)) b!1395103))

(assert (= (and b!1395105 res!934449) b!1395104))

(assert (= (or b!1395104 b!1395103) bm!66806))

(declare-fun m!1281587 () Bool)

(assert (=> bm!66806 m!1281587))

(declare-fun m!1281589 () Bool)

(assert (=> b!1395105 m!1281589))

(declare-fun m!1281591 () Bool)

(assert (=> b!1395105 m!1281591))

(declare-fun m!1281593 () Bool)

(assert (=> b!1395105 m!1281593))

(assert (=> b!1395105 m!1281589))

(declare-fun m!1281595 () Bool)

(assert (=> b!1395105 m!1281595))

(assert (=> b!1395106 m!1281589))

(assert (=> b!1395106 m!1281589))

(declare-fun m!1281597 () Bool)

(assert (=> b!1395106 m!1281597))

(assert (=> b!1394989 d!150653))

(declare-fun d!150663 () Bool)

(assert (=> d!150663 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119746 d!150663))

(declare-fun d!150677 () Bool)

(assert (=> d!150677 (= (array_inv!35100 a!2901) (bvsge (size!46622 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119746 d!150677))

(declare-fun b!1395206 () Bool)

(declare-fun e!789884 () SeekEntryResult!10389)

(assert (=> b!1395206 (= e!789884 Undefined!10389)))

(declare-fun lt!612907 () SeekEntryResult!10389)

(declare-fun b!1395207 () Bool)

(declare-fun e!789886 () SeekEntryResult!10389)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95428 (_ BitVec 32)) SeekEntryResult!10389)

(assert (=> b!1395207 (= e!789886 (seekKeyOrZeroReturnVacant!0 (x!125585 lt!612907) (index!43929 lt!612907) (index!43929 lt!612907) (select (arr!46072 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150681 () Bool)

(declare-fun lt!612905 () SeekEntryResult!10389)

(assert (=> d!150681 (and (or (is-Undefined!10389 lt!612905) (not (is-Found!10389 lt!612905)) (and (bvsge (index!43928 lt!612905) #b00000000000000000000000000000000) (bvslt (index!43928 lt!612905) (size!46622 a!2901)))) (or (is-Undefined!10389 lt!612905) (is-Found!10389 lt!612905) (not (is-MissingZero!10389 lt!612905)) (and (bvsge (index!43927 lt!612905) #b00000000000000000000000000000000) (bvslt (index!43927 lt!612905) (size!46622 a!2901)))) (or (is-Undefined!10389 lt!612905) (is-Found!10389 lt!612905) (is-MissingZero!10389 lt!612905) (not (is-MissingVacant!10389 lt!612905)) (and (bvsge (index!43930 lt!612905) #b00000000000000000000000000000000) (bvslt (index!43930 lt!612905) (size!46622 a!2901)))) (or (is-Undefined!10389 lt!612905) (ite (is-Found!10389 lt!612905) (= (select (arr!46072 a!2901) (index!43928 lt!612905)) (select (arr!46072 a!2901) j!112)) (ite (is-MissingZero!10389 lt!612905) (= (select (arr!46072 a!2901) (index!43927 lt!612905)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10389 lt!612905) (= (select (arr!46072 a!2901) (index!43930 lt!612905)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150681 (= lt!612905 e!789884)))

(declare-fun c!129820 () Bool)

(assert (=> d!150681 (= c!129820 (and (is-Intermediate!10389 lt!612907) (undefined!11201 lt!612907)))))

(assert (=> d!150681 (= lt!612907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) (select (arr!46072 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150681 (validMask!0 mask!2840)))

(assert (=> d!150681 (= (seekEntryOrOpen!0 (select (arr!46072 a!2901) j!112) a!2901 mask!2840) lt!612905)))

(declare-fun b!1395208 () Bool)

(declare-fun e!789885 () SeekEntryResult!10389)

(assert (=> b!1395208 (= e!789885 (Found!10389 (index!43929 lt!612907)))))

(declare-fun b!1395209 () Bool)

(assert (=> b!1395209 (= e!789884 e!789885)))

(declare-fun lt!612906 () (_ BitVec 64))

(assert (=> b!1395209 (= lt!612906 (select (arr!46072 a!2901) (index!43929 lt!612907)))))

(declare-fun c!129818 () Bool)

(assert (=> b!1395209 (= c!129818 (= lt!612906 (select (arr!46072 a!2901) j!112)))))

(declare-fun b!1395210 () Bool)

(declare-fun c!129819 () Bool)

(assert (=> b!1395210 (= c!129819 (= lt!612906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395210 (= e!789885 e!789886)))

(declare-fun b!1395211 () Bool)

(assert (=> b!1395211 (= e!789886 (MissingZero!10389 (index!43929 lt!612907)))))

(assert (= (and d!150681 c!129820) b!1395206))

(assert (= (and d!150681 (not c!129820)) b!1395209))

(assert (= (and b!1395209 c!129818) b!1395208))

(assert (= (and b!1395209 (not c!129818)) b!1395210))

(assert (= (and b!1395210 c!129819) b!1395211))

(assert (= (and b!1395210 (not c!129819)) b!1395207))

(assert (=> b!1395207 m!1281511))

(declare-fun m!1281647 () Bool)

(assert (=> b!1395207 m!1281647))

(declare-fun m!1281649 () Bool)

(assert (=> d!150681 m!1281649))

(declare-fun m!1281651 () Bool)

(assert (=> d!150681 m!1281651))

(declare-fun m!1281653 () Bool)

(assert (=> d!150681 m!1281653))

(assert (=> d!150681 m!1281511))

(assert (=> d!150681 m!1281513))

(assert (=> d!150681 m!1281513))

(assert (=> d!150681 m!1281511))

(assert (=> d!150681 m!1281517))

(assert (=> d!150681 m!1281537))

(declare-fun m!1281655 () Bool)

(assert (=> b!1395209 m!1281655))

(assert (=> b!1394995 d!150681))

(declare-fun b!1395226 () Bool)

(declare-fun e!789898 () Bool)

(declare-fun call!66822 () Bool)

(assert (=> b!1395226 (= e!789898 call!66822)))

(declare-fun b!1395227 () Bool)

(declare-fun e!789900 () Bool)

(declare-fun e!789899 () Bool)

(assert (=> b!1395227 (= e!789900 e!789899)))

(declare-fun res!934485 () Bool)

(assert (=> b!1395227 (=> (not res!934485) (not e!789899))))

(declare-fun e!789901 () Bool)

(assert (=> b!1395227 (= res!934485 (not e!789901))))

(declare-fun res!934486 () Bool)

(assert (=> b!1395227 (=> (not res!934486) (not e!789901))))

(assert (=> b!1395227 (= res!934486 (validKeyInArray!0 (select (arr!46072 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395228 () Bool)

(declare-fun contains!9776 (List!32591 (_ BitVec 64)) Bool)

(assert (=> b!1395228 (= e!789901 (contains!9776 Nil!32588 (select (arr!46072 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395229 () Bool)

(assert (=> b!1395229 (= e!789899 e!789898)))

(declare-fun c!129824 () Bool)

(assert (=> b!1395229 (= c!129824 (validKeyInArray!0 (select (arr!46072 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66819 () Bool)

(assert (=> bm!66819 (= call!66822 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129824 (Cons!32587 (select (arr!46072 a!2901) #b00000000000000000000000000000000) Nil!32588) Nil!32588)))))

(declare-fun b!1395230 () Bool)

(assert (=> b!1395230 (= e!789898 call!66822)))

(declare-fun d!150687 () Bool)

(declare-fun res!934487 () Bool)

(assert (=> d!150687 (=> res!934487 e!789900)))

(assert (=> d!150687 (= res!934487 (bvsge #b00000000000000000000000000000000 (size!46622 a!2901)))))

(assert (=> d!150687 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32588) e!789900)))

(assert (= (and d!150687 (not res!934487)) b!1395227))

(assert (= (and b!1395227 res!934486) b!1395228))

(assert (= (and b!1395227 res!934485) b!1395229))

(assert (= (and b!1395229 c!129824) b!1395226))

(assert (= (and b!1395229 (not c!129824)) b!1395230))

(assert (= (or b!1395226 b!1395230) bm!66819))

(assert (=> b!1395227 m!1281589))

(assert (=> b!1395227 m!1281589))

(assert (=> b!1395227 m!1281597))

(assert (=> b!1395228 m!1281589))

(assert (=> b!1395228 m!1281589))

(declare-fun m!1281663 () Bool)

(assert (=> b!1395228 m!1281663))

(assert (=> b!1395229 m!1281589))

(assert (=> b!1395229 m!1281589))

(assert (=> b!1395229 m!1281597))

(assert (=> bm!66819 m!1281589))

(declare-fun m!1281665 () Bool)

(assert (=> bm!66819 m!1281665))

(assert (=> b!1394996 d!150687))

(declare-fun d!150697 () Bool)

(assert (=> d!150697 (= (validKeyInArray!0 (select (arr!46072 a!2901) j!112)) (and (not (= (select (arr!46072 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46072 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394991 d!150697))

(declare-fun d!150699 () Bool)

(assert (=> d!150699 (= (validKeyInArray!0 (select (arr!46072 a!2901) i!1037)) (and (not (= (select (arr!46072 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46072 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394997 d!150699))

(declare-fun call!66823 () Bool)

(declare-fun bm!66820 () Bool)

(assert (=> bm!66820 (= call!66823 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150701 () Bool)

(declare-fun res!934488 () Bool)

(declare-fun e!789904 () Bool)

(assert (=> d!150701 (=> res!934488 e!789904)))

(assert (=> d!150701 (= res!934488 (bvsge j!112 (size!46622 a!2901)))))

(assert (=> d!150701 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789904)))

(declare-fun b!1395231 () Bool)

(declare-fun e!789903 () Bool)

(assert (=> b!1395231 (= e!789903 call!66823)))

(declare-fun b!1395232 () Bool)

(declare-fun e!789902 () Bool)

(assert (=> b!1395232 (= e!789902 call!66823)))

(declare-fun b!1395233 () Bool)

(assert (=> b!1395233 (= e!789903 e!789902)))

(declare-fun lt!612911 () (_ BitVec 64))

(assert (=> b!1395233 (= lt!612911 (select (arr!46072 a!2901) j!112))))

(declare-fun lt!612913 () Unit!46782)

(assert (=> b!1395233 (= lt!612913 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612911 j!112))))

(assert (=> b!1395233 (arrayContainsKey!0 a!2901 lt!612911 #b00000000000000000000000000000000)))

(declare-fun lt!612912 () Unit!46782)

(assert (=> b!1395233 (= lt!612912 lt!612913)))

(declare-fun res!934489 () Bool)

(assert (=> b!1395233 (= res!934489 (= (seekEntryOrOpen!0 (select (arr!46072 a!2901) j!112) a!2901 mask!2840) (Found!10389 j!112)))))

(assert (=> b!1395233 (=> (not res!934489) (not e!789902))))

(declare-fun b!1395234 () Bool)

(assert (=> b!1395234 (= e!789904 e!789903)))

(declare-fun c!129825 () Bool)

(assert (=> b!1395234 (= c!129825 (validKeyInArray!0 (select (arr!46072 a!2901) j!112)))))

(assert (= (and d!150701 (not res!934488)) b!1395234))

(assert (= (and b!1395234 c!129825) b!1395233))

(assert (= (and b!1395234 (not c!129825)) b!1395231))

(assert (= (and b!1395233 res!934489) b!1395232))

(assert (= (or b!1395232 b!1395231) bm!66820))

(declare-fun m!1281667 () Bool)

(assert (=> bm!66820 m!1281667))

(assert (=> b!1395233 m!1281511))

(declare-fun m!1281669 () Bool)

(assert (=> b!1395233 m!1281669))

(declare-fun m!1281671 () Bool)

(assert (=> b!1395233 m!1281671))

(assert (=> b!1395233 m!1281511))

(assert (=> b!1395233 m!1281535))

(assert (=> b!1395234 m!1281511))

(assert (=> b!1395234 m!1281511))

(assert (=> b!1395234 m!1281541))

(assert (=> b!1394992 d!150701))

(declare-fun d!150703 () Bool)

(assert (=> d!150703 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612923 () Unit!46782)

(declare-fun choose!38 (array!95428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46782)

(assert (=> d!150703 (= lt!612923 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150703 (validMask!0 mask!2840)))

(assert (=> d!150703 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612923)))

(declare-fun bs!40603 () Bool)

(assert (= bs!40603 d!150703))

(assert (=> bs!40603 m!1281519))

(declare-fun m!1281683 () Bool)

(assert (=> bs!40603 m!1281683))

(assert (=> bs!40603 m!1281537))

(assert (=> b!1394992 d!150703))

(declare-fun e!789912 () SeekEntryResult!10389)

(declare-fun b!1395244 () Bool)

(assert (=> b!1395244 (= e!789912 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46072 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395245 () Bool)

(declare-fun e!789913 () Bool)

(declare-fun e!789911 () Bool)

(assert (=> b!1395245 (= e!789913 e!789911)))

(declare-fun res!934494 () Bool)

(declare-fun lt!612925 () SeekEntryResult!10389)

(assert (=> b!1395245 (= res!934494 (and (is-Intermediate!10389 lt!612925) (not (undefined!11201 lt!612925)) (bvslt (x!125585 lt!612925) #b01111111111111111111111111111110) (bvsge (x!125585 lt!612925) #b00000000000000000000000000000000) (bvsge (x!125585 lt!612925) #b00000000000000000000000000000000)))))

(assert (=> b!1395245 (=> (not res!934494) (not e!789911))))

(declare-fun b!1395246 () Bool)

(assert (=> b!1395246 (and (bvsge (index!43929 lt!612925) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612925) (size!46622 a!2901)))))

(declare-fun res!934493 () Bool)

(assert (=> b!1395246 (= res!934493 (= (select (arr!46072 a!2901) (index!43929 lt!612925)) (select (arr!46072 a!2901) j!112)))))

(declare-fun e!789910 () Bool)

(assert (=> b!1395246 (=> res!934493 e!789910)))

(assert (=> b!1395246 (= e!789911 e!789910)))

(declare-fun b!1395247 () Bool)

(assert (=> b!1395247 (and (bvsge (index!43929 lt!612925) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612925) (size!46622 a!2901)))))

(declare-fun res!934495 () Bool)

(assert (=> b!1395247 (= res!934495 (= (select (arr!46072 a!2901) (index!43929 lt!612925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395247 (=> res!934495 e!789910)))

(declare-fun e!789914 () SeekEntryResult!10389)

(declare-fun b!1395248 () Bool)

(assert (=> b!1395248 (= e!789914 (Intermediate!10389 true (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395249 () Bool)

(assert (=> b!1395249 (= e!789913 (bvsge (x!125585 lt!612925) #b01111111111111111111111111111110))))

(declare-fun b!1395250 () Bool)

(assert (=> b!1395250 (= e!789912 (Intermediate!10389 false (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150709 () Bool)

(assert (=> d!150709 e!789913))

(declare-fun c!129829 () Bool)

(assert (=> d!150709 (= c!129829 (and (is-Intermediate!10389 lt!612925) (undefined!11201 lt!612925)))))

(assert (=> d!150709 (= lt!612925 e!789914)))

(declare-fun c!129830 () Bool)

(assert (=> d!150709 (= c!129830 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612924 () (_ BitVec 64))

(assert (=> d!150709 (= lt!612924 (select (arr!46072 a!2901) (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840)))))

(assert (=> d!150709 (validMask!0 mask!2840)))

(assert (=> d!150709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46072 a!2901) j!112) mask!2840) (select (arr!46072 a!2901) j!112) a!2901 mask!2840) lt!612925)))

(declare-fun b!1395251 () Bool)

(assert (=> b!1395251 (and (bvsge (index!43929 lt!612925) #b00000000000000000000000000000000) (bvslt (index!43929 lt!612925) (size!46622 a!2901)))))

(assert (=> b!1395251 (= e!789910 (= (select (arr!46072 a!2901) (index!43929 lt!612925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395252 () Bool)

(assert (=> b!1395252 (= e!789914 e!789912)))

(declare-fun c!129831 () Bool)

(assert (=> b!1395252 (= c!129831 (or (= lt!612924 (select (arr!46072 a!2901) j!112)) (= (bvadd lt!612924 lt!612924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!150709 c!129830) b!1395248))

(assert (= (and d!150709 (not c!129830)) b!1395252))

(assert (= (and b!1395252 c!129831) b!1395250))

