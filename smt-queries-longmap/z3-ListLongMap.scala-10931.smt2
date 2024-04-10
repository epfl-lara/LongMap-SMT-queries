; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127886 () Bool)

(assert start!127886)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100234 0))(
  ( (array!100235 (arr!48375 (Array (_ BitVec 32) (_ BitVec 64))) (size!48925 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100234)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12573 0))(
  ( (MissingZero!12573 (index!52684 (_ BitVec 32))) (Found!12573 (index!52685 (_ BitVec 32))) (Intermediate!12573 (undefined!13385 Bool) (index!52686 (_ BitVec 32)) (x!134370 (_ BitVec 32))) (Undefined!12573) (MissingVacant!12573 (index!52687 (_ BitVec 32))) )
))
(declare-fun lt!653395 () SeekEntryResult!12573)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun e!840347 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun b!1502562 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100234 (_ BitVec 32)) SeekEntryResult!12573)

(assert (=> b!1502562 (= e!840347 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850)) mask!2661) lt!653395)))))

(declare-fun b!1502563 () Bool)

(declare-fun res!1023551 () Bool)

(declare-fun e!840349 () Bool)

(assert (=> b!1502563 (=> (not res!1023551) (not e!840349))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1502563 (= res!1023551 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48925 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48925 a!2850)) (= (select (arr!48375 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48925 a!2850))))))

(declare-fun b!1502564 () Bool)

(declare-fun res!1023555 () Bool)

(assert (=> b!1502564 (=> (not res!1023555) (not e!840349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502564 (= res!1023555 (validKeyInArray!0 (select (arr!48375 a!2850) i!996)))))

(declare-fun b!1502565 () Bool)

(declare-fun res!1023549 () Bool)

(assert (=> b!1502565 (=> (not res!1023549) (not e!840349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100234 (_ BitVec 32)) Bool)

(assert (=> b!1502565 (= res!1023549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502566 () Bool)

(declare-fun res!1023552 () Bool)

(assert (=> b!1502566 (=> (not res!1023552) (not e!840347))))

(assert (=> b!1502566 (= res!1023552 (and (= (select (arr!48375 a!2850) index!625) (select (arr!48375 a!2850) j!87)) (= j!87 index!625)))))

(declare-fun b!1502567 () Bool)

(declare-fun res!1023553 () Bool)

(assert (=> b!1502567 (=> (not res!1023553) (not e!840349))))

(declare-datatypes ((List!34867 0))(
  ( (Nil!34864) (Cons!34863 (h!36260 (_ BitVec 64)) (t!49561 List!34867)) )
))
(declare-fun arrayNoDuplicates!0 (array!100234 (_ BitVec 32) List!34867) Bool)

(assert (=> b!1502567 (= res!1023553 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34864))))

(declare-fun b!1502568 () Bool)

(declare-fun res!1023556 () Bool)

(assert (=> b!1502568 (=> (not res!1023556) (not e!840349))))

(assert (=> b!1502568 (= res!1023556 (validKeyInArray!0 (select (arr!48375 a!2850) j!87)))))

(declare-fun b!1502569 () Bool)

(declare-fun res!1023554 () Bool)

(assert (=> b!1502569 (=> (not res!1023554) (not e!840349))))

(assert (=> b!1502569 (= res!1023554 (and (= (size!48925 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48925 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48925 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1023548 () Bool)

(assert (=> start!127886 (=> (not res!1023548) (not e!840349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127886 (= res!1023548 (validMask!0 mask!2661))))

(assert (=> start!127886 e!840349))

(assert (=> start!127886 true))

(declare-fun array_inv!37403 (array!100234) Bool)

(assert (=> start!127886 (array_inv!37403 a!2850)))

(declare-fun b!1502570 () Bool)

(assert (=> b!1502570 (= e!840349 e!840347)))

(declare-fun res!1023550 () Bool)

(assert (=> b!1502570 (=> (not res!1023550) (not e!840347))))

(assert (=> b!1502570 (= res!1023550 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48375 a!2850) j!87) a!2850 mask!2661) lt!653395))))

(assert (=> b!1502570 (= lt!653395 (Found!12573 j!87))))

(assert (= (and start!127886 res!1023548) b!1502569))

(assert (= (and b!1502569 res!1023554) b!1502564))

(assert (= (and b!1502564 res!1023555) b!1502568))

(assert (= (and b!1502568 res!1023556) b!1502565))

(assert (= (and b!1502565 res!1023549) b!1502567))

(assert (= (and b!1502567 res!1023553) b!1502563))

(assert (= (and b!1502563 res!1023551) b!1502570))

(assert (= (and b!1502570 res!1023550) b!1502566))

(assert (= (and b!1502566 res!1023552) b!1502562))

(declare-fun m!1385839 () Bool)

(assert (=> b!1502563 m!1385839))

(declare-fun m!1385841 () Bool)

(assert (=> b!1502563 m!1385841))

(declare-fun m!1385843 () Bool)

(assert (=> b!1502563 m!1385843))

(declare-fun m!1385845 () Bool)

(assert (=> b!1502564 m!1385845))

(assert (=> b!1502564 m!1385845))

(declare-fun m!1385847 () Bool)

(assert (=> b!1502564 m!1385847))

(declare-fun m!1385849 () Bool)

(assert (=> b!1502568 m!1385849))

(assert (=> b!1502568 m!1385849))

(declare-fun m!1385851 () Bool)

(assert (=> b!1502568 m!1385851))

(declare-fun m!1385853 () Bool)

(assert (=> b!1502567 m!1385853))

(declare-fun m!1385855 () Bool)

(assert (=> b!1502566 m!1385855))

(assert (=> b!1502566 m!1385849))

(assert (=> b!1502562 m!1385841))

(declare-fun m!1385857 () Bool)

(assert (=> b!1502562 m!1385857))

(assert (=> b!1502562 m!1385857))

(declare-fun m!1385859 () Bool)

(assert (=> b!1502562 m!1385859))

(declare-fun m!1385861 () Bool)

(assert (=> start!127886 m!1385861))

(declare-fun m!1385863 () Bool)

(assert (=> start!127886 m!1385863))

(declare-fun m!1385865 () Bool)

(assert (=> b!1502565 m!1385865))

(assert (=> b!1502570 m!1385849))

(assert (=> b!1502570 m!1385849))

(declare-fun m!1385867 () Bool)

(assert (=> b!1502570 m!1385867))

(check-sat (not start!127886) (not b!1502564) (not b!1502568) (not b!1502565) (not b!1502562) (not b!1502570) (not b!1502567))
(check-sat)
(get-model)

(declare-fun d!157707 () Bool)

(assert (=> d!157707 (= (validKeyInArray!0 (select (arr!48375 a!2850) i!996)) (and (not (= (select (arr!48375 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48375 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502564 d!157707))

(declare-fun d!157709 () Bool)

(assert (=> d!157709 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127886 d!157709))

(declare-fun d!157711 () Bool)

(assert (=> d!157711 (= (array_inv!37403 a!2850) (bvsge (size!48925 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127886 d!157711))

(declare-fun d!157713 () Bool)

(assert (=> d!157713 (= (validKeyInArray!0 (select (arr!48375 a!2850) j!87)) (and (not (= (select (arr!48375 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48375 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502568 d!157713))

(declare-fun b!1502620 () Bool)

(declare-fun e!840374 () SeekEntryResult!12573)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502620 (= e!840374 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850)) mask!2661))))

(declare-fun b!1502621 () Bool)

(declare-fun e!840373 () SeekEntryResult!12573)

(assert (=> b!1502621 (= e!840373 Undefined!12573)))

(declare-fun b!1502622 () Bool)

(assert (=> b!1502622 (= e!840374 (MissingVacant!12573 vacantAfter!10))))

(declare-fun b!1502623 () Bool)

(declare-fun e!840375 () SeekEntryResult!12573)

(assert (=> b!1502623 (= e!840375 (Found!12573 index!625))))

(declare-fun b!1502624 () Bool)

(assert (=> b!1502624 (= e!840373 e!840375)))

(declare-fun lt!653403 () (_ BitVec 64))

(declare-fun c!139050 () Bool)

(assert (=> b!1502624 (= c!139050 (= lt!653403 (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun lt!653404 () SeekEntryResult!12573)

(declare-fun d!157715 () Bool)

(get-info :version)

(assert (=> d!157715 (and (or ((_ is Undefined!12573) lt!653404) (not ((_ is Found!12573) lt!653404)) (and (bvsge (index!52685 lt!653404) #b00000000000000000000000000000000) (bvslt (index!52685 lt!653404) (size!48925 (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850)))))) (or ((_ is Undefined!12573) lt!653404) ((_ is Found!12573) lt!653404) (not ((_ is MissingVacant!12573) lt!653404)) (not (= (index!52687 lt!653404) vacantAfter!10)) (and (bvsge (index!52687 lt!653404) #b00000000000000000000000000000000) (bvslt (index!52687 lt!653404) (size!48925 (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850)))))) (or ((_ is Undefined!12573) lt!653404) (ite ((_ is Found!12573) lt!653404) (= (select (arr!48375 (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850))) (index!52685 lt!653404)) (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)) (and ((_ is MissingVacant!12573) lt!653404) (= (index!52687 lt!653404) vacantAfter!10) (= (select (arr!48375 (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850))) (index!52687 lt!653404)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157715 (= lt!653404 e!840373)))

(declare-fun c!139049 () Bool)

(assert (=> d!157715 (= c!139049 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157715 (= lt!653403 (select (arr!48375 (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850))) index!625))))

(assert (=> d!157715 (validMask!0 mask!2661)))

(assert (=> d!157715 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100235 (store (arr!48375 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48925 a!2850)) mask!2661) lt!653404)))

(declare-fun b!1502625 () Bool)

(declare-fun c!139051 () Bool)

(assert (=> b!1502625 (= c!139051 (= lt!653403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1502625 (= e!840375 e!840374)))

(assert (= (and d!157715 c!139049) b!1502621))

(assert (= (and d!157715 (not c!139049)) b!1502624))

(assert (= (and b!1502624 c!139050) b!1502623))

(assert (= (and b!1502624 (not c!139050)) b!1502625))

(assert (= (and b!1502625 c!139051) b!1502622))

(assert (= (and b!1502625 (not c!139051)) b!1502620))

(declare-fun m!1385899 () Bool)

(assert (=> b!1502620 m!1385899))

(assert (=> b!1502620 m!1385899))

(assert (=> b!1502620 m!1385857))

(declare-fun m!1385901 () Bool)

(assert (=> b!1502620 m!1385901))

(declare-fun m!1385903 () Bool)

(assert (=> d!157715 m!1385903))

(declare-fun m!1385905 () Bool)

(assert (=> d!157715 m!1385905))

(declare-fun m!1385907 () Bool)

(assert (=> d!157715 m!1385907))

(assert (=> d!157715 m!1385861))

(assert (=> b!1502562 d!157715))

(declare-fun b!1502656 () Bool)

(declare-fun e!840400 () Bool)

(declare-fun call!68094 () Bool)

(assert (=> b!1502656 (= e!840400 call!68094)))

(declare-fun b!1502657 () Bool)

(assert (=> b!1502657 (= e!840400 call!68094)))

(declare-fun b!1502658 () Bool)

(declare-fun e!840401 () Bool)

(assert (=> b!1502658 (= e!840401 e!840400)))

(declare-fun c!139058 () Bool)

(assert (=> b!1502658 (= c!139058 (validKeyInArray!0 (select (arr!48375 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502659 () Bool)

(declare-fun e!840403 () Bool)

(declare-fun contains!9944 (List!34867 (_ BitVec 64)) Bool)

(assert (=> b!1502659 (= e!840403 (contains!9944 Nil!34864 (select (arr!48375 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68091 () Bool)

(assert (=> bm!68091 (= call!68094 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139058 (Cons!34863 (select (arr!48375 a!2850) #b00000000000000000000000000000000) Nil!34864) Nil!34864)))))

(declare-fun d!157721 () Bool)

(declare-fun res!1023610 () Bool)

(declare-fun e!840402 () Bool)

(assert (=> d!157721 (=> res!1023610 e!840402)))

(assert (=> d!157721 (= res!1023610 (bvsge #b00000000000000000000000000000000 (size!48925 a!2850)))))

(assert (=> d!157721 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34864) e!840402)))

(declare-fun b!1502660 () Bool)

(assert (=> b!1502660 (= e!840402 e!840401)))

(declare-fun res!1023608 () Bool)

(assert (=> b!1502660 (=> (not res!1023608) (not e!840401))))

(assert (=> b!1502660 (= res!1023608 (not e!840403))))

(declare-fun res!1023609 () Bool)

(assert (=> b!1502660 (=> (not res!1023609) (not e!840403))))

(assert (=> b!1502660 (= res!1023609 (validKeyInArray!0 (select (arr!48375 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157721 (not res!1023610)) b!1502660))

(assert (= (and b!1502660 res!1023609) b!1502659))

(assert (= (and b!1502660 res!1023608) b!1502658))

(assert (= (and b!1502658 c!139058) b!1502657))

(assert (= (and b!1502658 (not c!139058)) b!1502656))

(assert (= (or b!1502657 b!1502656) bm!68091))

(declare-fun m!1385925 () Bool)

(assert (=> b!1502658 m!1385925))

(assert (=> b!1502658 m!1385925))

(declare-fun m!1385927 () Bool)

(assert (=> b!1502658 m!1385927))

(assert (=> b!1502659 m!1385925))

(assert (=> b!1502659 m!1385925))

(declare-fun m!1385929 () Bool)

(assert (=> b!1502659 m!1385929))

(assert (=> bm!68091 m!1385925))

(declare-fun m!1385931 () Bool)

(assert (=> bm!68091 m!1385931))

(assert (=> b!1502660 m!1385925))

(assert (=> b!1502660 m!1385925))

(assert (=> b!1502660 m!1385927))

(assert (=> b!1502567 d!157721))

(declare-fun b!1502661 () Bool)

(declare-fun e!840405 () SeekEntryResult!12573)

(assert (=> b!1502661 (= e!840405 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48375 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502662 () Bool)

(declare-fun e!840404 () SeekEntryResult!12573)

(assert (=> b!1502662 (= e!840404 Undefined!12573)))

(declare-fun b!1502663 () Bool)

(assert (=> b!1502663 (= e!840405 (MissingVacant!12573 vacantBefore!10))))

(declare-fun b!1502664 () Bool)

(declare-fun e!840406 () SeekEntryResult!12573)

(assert (=> b!1502664 (= e!840406 (Found!12573 index!625))))

(declare-fun b!1502665 () Bool)

(assert (=> b!1502665 (= e!840404 e!840406)))

(declare-fun c!139060 () Bool)

(declare-fun lt!653405 () (_ BitVec 64))

(assert (=> b!1502665 (= c!139060 (= lt!653405 (select (arr!48375 a!2850) j!87)))))

(declare-fun d!157731 () Bool)

(declare-fun lt!653406 () SeekEntryResult!12573)

(assert (=> d!157731 (and (or ((_ is Undefined!12573) lt!653406) (not ((_ is Found!12573) lt!653406)) (and (bvsge (index!52685 lt!653406) #b00000000000000000000000000000000) (bvslt (index!52685 lt!653406) (size!48925 a!2850)))) (or ((_ is Undefined!12573) lt!653406) ((_ is Found!12573) lt!653406) (not ((_ is MissingVacant!12573) lt!653406)) (not (= (index!52687 lt!653406) vacantBefore!10)) (and (bvsge (index!52687 lt!653406) #b00000000000000000000000000000000) (bvslt (index!52687 lt!653406) (size!48925 a!2850)))) (or ((_ is Undefined!12573) lt!653406) (ite ((_ is Found!12573) lt!653406) (= (select (arr!48375 a!2850) (index!52685 lt!653406)) (select (arr!48375 a!2850) j!87)) (and ((_ is MissingVacant!12573) lt!653406) (= (index!52687 lt!653406) vacantBefore!10) (= (select (arr!48375 a!2850) (index!52687 lt!653406)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157731 (= lt!653406 e!840404)))

(declare-fun c!139059 () Bool)

(assert (=> d!157731 (= c!139059 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157731 (= lt!653405 (select (arr!48375 a!2850) index!625))))

(assert (=> d!157731 (validMask!0 mask!2661)))

(assert (=> d!157731 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48375 a!2850) j!87) a!2850 mask!2661) lt!653406)))

(declare-fun b!1502666 () Bool)

(declare-fun c!139061 () Bool)

(assert (=> b!1502666 (= c!139061 (= lt!653405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1502666 (= e!840406 e!840405)))

(assert (= (and d!157731 c!139059) b!1502662))

(assert (= (and d!157731 (not c!139059)) b!1502665))

(assert (= (and b!1502665 c!139060) b!1502664))

(assert (= (and b!1502665 (not c!139060)) b!1502666))

(assert (= (and b!1502666 c!139061) b!1502663))

(assert (= (and b!1502666 (not c!139061)) b!1502661))

(assert (=> b!1502661 m!1385899))

(assert (=> b!1502661 m!1385899))

(assert (=> b!1502661 m!1385849))

(declare-fun m!1385933 () Bool)

(assert (=> b!1502661 m!1385933))

(declare-fun m!1385935 () Bool)

(assert (=> d!157731 m!1385935))

(declare-fun m!1385937 () Bool)

(assert (=> d!157731 m!1385937))

(assert (=> d!157731 m!1385855))

(assert (=> d!157731 m!1385861))

(assert (=> b!1502570 d!157731))

(declare-fun b!1502699 () Bool)

(declare-fun e!840429 () Bool)

(declare-fun e!840428 () Bool)

(assert (=> b!1502699 (= e!840429 e!840428)))

(declare-fun c!139073 () Bool)

(assert (=> b!1502699 (= c!139073 (validKeyInArray!0 (select (arr!48375 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68097 () Bool)

(declare-fun call!68100 () Bool)

(assert (=> bm!68097 (= call!68100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1502700 () Bool)

(declare-fun e!840430 () Bool)

(assert (=> b!1502700 (= e!840430 call!68100)))

(declare-fun d!157733 () Bool)

(declare-fun res!1023621 () Bool)

(assert (=> d!157733 (=> res!1023621 e!840429)))

(assert (=> d!157733 (= res!1023621 (bvsge #b00000000000000000000000000000000 (size!48925 a!2850)))))

(assert (=> d!157733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840429)))

(declare-fun b!1502701 () Bool)

(assert (=> b!1502701 (= e!840428 call!68100)))

(declare-fun b!1502702 () Bool)

(assert (=> b!1502702 (= e!840428 e!840430)))

(declare-fun lt!653426 () (_ BitVec 64))

(assert (=> b!1502702 (= lt!653426 (select (arr!48375 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50258 0))(
  ( (Unit!50259) )
))
(declare-fun lt!653427 () Unit!50258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100234 (_ BitVec 64) (_ BitVec 32)) Unit!50258)

(assert (=> b!1502702 (= lt!653427 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653426 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1502702 (arrayContainsKey!0 a!2850 lt!653426 #b00000000000000000000000000000000)))

(declare-fun lt!653428 () Unit!50258)

(assert (=> b!1502702 (= lt!653428 lt!653427)))

(declare-fun res!1023622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100234 (_ BitVec 32)) SeekEntryResult!12573)

(assert (=> b!1502702 (= res!1023622 (= (seekEntryOrOpen!0 (select (arr!48375 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12573 #b00000000000000000000000000000000)))))

(assert (=> b!1502702 (=> (not res!1023622) (not e!840430))))

(assert (= (and d!157733 (not res!1023621)) b!1502699))

(assert (= (and b!1502699 c!139073) b!1502702))

(assert (= (and b!1502699 (not c!139073)) b!1502701))

(assert (= (and b!1502702 res!1023622) b!1502700))

(assert (= (or b!1502700 b!1502701) bm!68097))

(assert (=> b!1502699 m!1385925))

(assert (=> b!1502699 m!1385925))

(assert (=> b!1502699 m!1385927))

(declare-fun m!1385947 () Bool)

(assert (=> bm!68097 m!1385947))

(assert (=> b!1502702 m!1385925))

(declare-fun m!1385949 () Bool)

(assert (=> b!1502702 m!1385949))

(declare-fun m!1385951 () Bool)

(assert (=> b!1502702 m!1385951))

(assert (=> b!1502702 m!1385925))

(declare-fun m!1385953 () Bool)

(assert (=> b!1502702 m!1385953))

(assert (=> b!1502565 d!157733))

(check-sat (not b!1502661) (not b!1502699) (not b!1502658) (not b!1502660) (not bm!68097) (not d!157715) (not b!1502620) (not b!1502659) (not bm!68091) (not d!157731) (not b!1502702))
(check-sat)
