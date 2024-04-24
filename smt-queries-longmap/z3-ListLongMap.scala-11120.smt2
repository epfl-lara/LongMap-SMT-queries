; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130266 () Bool)

(assert start!130266)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101542 0))(
  ( (array!101543 (arr!48994 (Array (_ BitVec 32) (_ BitVec 64))) (size!49545 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101542)

(declare-fun b!1526730 () Bool)

(declare-fun e!851217 () Bool)

(declare-datatypes ((SeekEntryResult!13052 0))(
  ( (MissingZero!13052 (index!54603 (_ BitVec 32))) (Found!13052 (index!54604 (_ BitVec 32))) (Intermediate!13052 (undefined!13864 Bool) (index!54605 (_ BitVec 32)) (x!136503 (_ BitVec 32))) (Undefined!13052) (MissingVacant!13052 (index!54606 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13052)

(assert (=> b!1526730 (= e!851217 (= (seekEntry!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (Found!13052 j!70)))))

(declare-fun b!1526731 () Bool)

(declare-fun e!851220 () Bool)

(declare-fun e!851218 () Bool)

(assert (=> b!1526731 (= e!851220 (not e!851218))))

(declare-fun res!1043905 () Bool)

(assert (=> b!1526731 (=> res!1043905 e!851218)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526731 (= res!1043905 (or (not (= (select (arr!48994 a!2804) j!70) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48994 a!2804) index!487) (select (arr!48994 a!2804) j!70)) (not (= (select (arr!48994 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1526731 e!851217))

(declare-fun res!1043904 () Bool)

(assert (=> b!1526731 (=> (not res!1043904) (not e!851217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101542 (_ BitVec 32)) Bool)

(assert (=> b!1526731 (= res!1043904 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50923 0))(
  ( (Unit!50924) )
))
(declare-fun lt!661189 () Unit!50923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50923)

(assert (=> b!1526731 (= lt!661189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526732 () Bool)

(declare-fun res!1043899 () Bool)

(assert (=> b!1526732 (=> (not res!1043899) (not e!851220))))

(declare-fun lt!661191 () SeekEntryResult!13052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13052)

(assert (=> b!1526732 (= res!1043899 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661191))))

(declare-fun b!1526733 () Bool)

(declare-fun res!1043903 () Bool)

(declare-fun e!851221 () Bool)

(assert (=> b!1526733 (=> (not res!1043903) (not e!851221))))

(assert (=> b!1526733 (= res!1043903 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49545 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49545 a!2804))))))

(declare-fun b!1526734 () Bool)

(declare-fun res!1043901 () Bool)

(assert (=> b!1526734 (=> (not res!1043901) (not e!851221))))

(declare-datatypes ((List!35464 0))(
  ( (Nil!35461) (Cons!35460 (h!36905 (_ BitVec 64)) (t!50150 List!35464)) )
))
(declare-fun arrayNoDuplicates!0 (array!101542 (_ BitVec 32) List!35464) Bool)

(assert (=> b!1526734 (= res!1043901 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35461))))

(declare-fun b!1526735 () Bool)

(declare-fun res!1043897 () Bool)

(assert (=> b!1526735 (=> (not res!1043897) (not e!851221))))

(assert (=> b!1526735 (= res!1043897 (and (= (size!49545 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49545 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49545 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526736 () Bool)

(declare-fun res!1043900 () Bool)

(assert (=> b!1526736 (=> (not res!1043900) (not e!851221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526736 (= res!1043900 (validKeyInArray!0 (select (arr!48994 a!2804) j!70)))))

(declare-fun res!1043896 () Bool)

(assert (=> start!130266 (=> (not res!1043896) (not e!851221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130266 (= res!1043896 (validMask!0 mask!2512))))

(assert (=> start!130266 e!851221))

(assert (=> start!130266 true))

(declare-fun array_inv!38275 (array!101542) Bool)

(assert (=> start!130266 (array_inv!38275 a!2804)))

(declare-fun b!1526737 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13052)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101542 (_ BitVec 32)) SeekEntryResult!13052)

(assert (=> b!1526737 (= e!851218 (= (seekEntryOrOpen!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526738 () Bool)

(declare-fun res!1043898 () Bool)

(assert (=> b!1526738 (=> (not res!1043898) (not e!851220))))

(declare-fun lt!661190 () SeekEntryResult!13052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526738 (= res!1043898 (= lt!661190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)) mask!2512)))))

(declare-fun b!1526739 () Bool)

(declare-fun res!1043902 () Bool)

(assert (=> b!1526739 (=> (not res!1043902) (not e!851221))))

(assert (=> b!1526739 (= res!1043902 (validKeyInArray!0 (select (arr!48994 a!2804) i!961)))))

(declare-fun b!1526740 () Bool)

(declare-fun res!1043907 () Bool)

(assert (=> b!1526740 (=> (not res!1043907) (not e!851221))))

(assert (=> b!1526740 (= res!1043907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526741 () Bool)

(assert (=> b!1526741 (= e!851221 e!851220)))

(declare-fun res!1043906 () Bool)

(assert (=> b!1526741 (=> (not res!1043906) (not e!851220))))

(assert (=> b!1526741 (= res!1043906 (= lt!661190 lt!661191))))

(assert (=> b!1526741 (= lt!661191 (Intermediate!13052 false resIndex!21 resX!21))))

(assert (=> b!1526741 (= lt!661190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130266 res!1043896) b!1526735))

(assert (= (and b!1526735 res!1043897) b!1526739))

(assert (= (and b!1526739 res!1043902) b!1526736))

(assert (= (and b!1526736 res!1043900) b!1526740))

(assert (= (and b!1526740 res!1043907) b!1526734))

(assert (= (and b!1526734 res!1043901) b!1526733))

(assert (= (and b!1526733 res!1043903) b!1526741))

(assert (= (and b!1526741 res!1043906) b!1526732))

(assert (= (and b!1526732 res!1043899) b!1526738))

(assert (= (and b!1526738 res!1043898) b!1526731))

(assert (= (and b!1526731 res!1043904) b!1526730))

(assert (= (and b!1526731 (not res!1043905)) b!1526737))

(declare-fun m!1409623 () Bool)

(assert (=> b!1526740 m!1409623))

(declare-fun m!1409625 () Bool)

(assert (=> b!1526737 m!1409625))

(assert (=> b!1526737 m!1409625))

(declare-fun m!1409627 () Bool)

(assert (=> b!1526737 m!1409627))

(assert (=> b!1526737 m!1409625))

(declare-fun m!1409629 () Bool)

(assert (=> b!1526737 m!1409629))

(declare-fun m!1409631 () Bool)

(assert (=> b!1526734 m!1409631))

(declare-fun m!1409633 () Bool)

(assert (=> b!1526738 m!1409633))

(declare-fun m!1409635 () Bool)

(assert (=> b!1526738 m!1409635))

(assert (=> b!1526738 m!1409635))

(declare-fun m!1409637 () Bool)

(assert (=> b!1526738 m!1409637))

(assert (=> b!1526738 m!1409637))

(assert (=> b!1526738 m!1409635))

(declare-fun m!1409639 () Bool)

(assert (=> b!1526738 m!1409639))

(declare-fun m!1409641 () Bool)

(assert (=> b!1526739 m!1409641))

(assert (=> b!1526739 m!1409641))

(declare-fun m!1409643 () Bool)

(assert (=> b!1526739 m!1409643))

(assert (=> b!1526730 m!1409625))

(assert (=> b!1526730 m!1409625))

(declare-fun m!1409645 () Bool)

(assert (=> b!1526730 m!1409645))

(assert (=> b!1526731 m!1409625))

(declare-fun m!1409647 () Bool)

(assert (=> b!1526731 m!1409647))

(assert (=> b!1526731 m!1409633))

(declare-fun m!1409649 () Bool)

(assert (=> b!1526731 m!1409649))

(assert (=> b!1526731 m!1409635))

(declare-fun m!1409651 () Bool)

(assert (=> b!1526731 m!1409651))

(declare-fun m!1409653 () Bool)

(assert (=> start!130266 m!1409653))

(declare-fun m!1409655 () Bool)

(assert (=> start!130266 m!1409655))

(assert (=> b!1526741 m!1409625))

(assert (=> b!1526741 m!1409625))

(declare-fun m!1409657 () Bool)

(assert (=> b!1526741 m!1409657))

(assert (=> b!1526741 m!1409657))

(assert (=> b!1526741 m!1409625))

(declare-fun m!1409659 () Bool)

(assert (=> b!1526741 m!1409659))

(assert (=> b!1526732 m!1409625))

(assert (=> b!1526732 m!1409625))

(declare-fun m!1409661 () Bool)

(assert (=> b!1526732 m!1409661))

(assert (=> b!1526736 m!1409625))

(assert (=> b!1526736 m!1409625))

(declare-fun m!1409663 () Bool)

(assert (=> b!1526736 m!1409663))

(check-sat (not b!1526737) (not b!1526740) (not b!1526732) (not b!1526738) (not start!130266) (not b!1526741) (not b!1526730) (not b!1526739) (not b!1526736) (not b!1526731) (not b!1526734))
(check-sat)
(get-model)

(declare-fun b!1526832 () Bool)

(declare-fun e!851263 () SeekEntryResult!13052)

(declare-fun e!851265 () SeekEntryResult!13052)

(assert (=> b!1526832 (= e!851263 e!851265)))

(declare-fun c!140985 () Bool)

(declare-fun lt!661214 () (_ BitVec 64))

(assert (=> b!1526832 (= c!140985 (or (= lt!661214 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!661214 lt!661214) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1526833 () Bool)

(assert (=> b!1526833 (= e!851263 (Intermediate!13052 true (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1526834 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526834 (= e!851265 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)) mask!2512))))

(declare-fun b!1526835 () Bool)

(assert (=> b!1526835 (= e!851265 (Intermediate!13052 false (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1526836 () Bool)

(declare-fun lt!661215 () SeekEntryResult!13052)

(assert (=> b!1526836 (and (bvsge (index!54605 lt!661215) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661215) (size!49545 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)))))))

(declare-fun res!1043986 () Bool)

(assert (=> b!1526836 (= res!1043986 (= (select (arr!48994 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804))) (index!54605 lt!661215)) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!851264 () Bool)

(assert (=> b!1526836 (=> res!1043986 e!851264)))

(declare-fun e!851262 () Bool)

(assert (=> b!1526836 (= e!851262 e!851264)))

(declare-fun b!1526837 () Bool)

(declare-fun e!851266 () Bool)

(assert (=> b!1526837 (= e!851266 (bvsge (x!136503 lt!661215) #b01111111111111111111111111111110))))

(declare-fun b!1526838 () Bool)

(assert (=> b!1526838 (and (bvsge (index!54605 lt!661215) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661215) (size!49545 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)))))))

(assert (=> b!1526838 (= e!851264 (= (select (arr!48994 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804))) (index!54605 lt!661215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160019 () Bool)

(assert (=> d!160019 e!851266))

(declare-fun c!140984 () Bool)

(get-info :version)

(assert (=> d!160019 (= c!140984 (and ((_ is Intermediate!13052) lt!661215) (undefined!13864 lt!661215)))))

(assert (=> d!160019 (= lt!661215 e!851263)))

(declare-fun c!140986 () Bool)

(assert (=> d!160019 (= c!140986 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!160019 (= lt!661214 (select (arr!48994 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804))) (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!160019 (validMask!0 mask!2512)))

(assert (=> d!160019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)) mask!2512) lt!661215)))

(declare-fun b!1526839 () Bool)

(assert (=> b!1526839 (= e!851266 e!851262)))

(declare-fun res!1043988 () Bool)

(assert (=> b!1526839 (= res!1043988 (and ((_ is Intermediate!13052) lt!661215) (not (undefined!13864 lt!661215)) (bvslt (x!136503 lt!661215) #b01111111111111111111111111111110) (bvsge (x!136503 lt!661215) #b00000000000000000000000000000000) (bvsge (x!136503 lt!661215) #b00000000000000000000000000000000)))))

(assert (=> b!1526839 (=> (not res!1043988) (not e!851262))))

(declare-fun b!1526840 () Bool)

(assert (=> b!1526840 (and (bvsge (index!54605 lt!661215) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661215) (size!49545 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804)))))))

(declare-fun res!1043987 () Bool)

(assert (=> b!1526840 (= res!1043987 (= (select (arr!48994 (array!101543 (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49545 a!2804))) (index!54605 lt!661215)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526840 (=> res!1043987 e!851264)))

(assert (= (and d!160019 c!140986) b!1526833))

(assert (= (and d!160019 (not c!140986)) b!1526832))

(assert (= (and b!1526832 c!140985) b!1526835))

(assert (= (and b!1526832 (not c!140985)) b!1526834))

(assert (= (and d!160019 c!140984) b!1526837))

(assert (= (and d!160019 (not c!140984)) b!1526839))

(assert (= (and b!1526839 res!1043988) b!1526836))

(assert (= (and b!1526836 (not res!1043986)) b!1526840))

(assert (= (and b!1526840 (not res!1043987)) b!1526838))

(declare-fun m!1409749 () Bool)

(assert (=> b!1526836 m!1409749))

(assert (=> b!1526834 m!1409637))

(declare-fun m!1409751 () Bool)

(assert (=> b!1526834 m!1409751))

(assert (=> b!1526834 m!1409751))

(assert (=> b!1526834 m!1409635))

(declare-fun m!1409753 () Bool)

(assert (=> b!1526834 m!1409753))

(assert (=> b!1526840 m!1409749))

(assert (=> d!160019 m!1409637))

(declare-fun m!1409755 () Bool)

(assert (=> d!160019 m!1409755))

(assert (=> d!160019 m!1409653))

(assert (=> b!1526838 m!1409749))

(assert (=> b!1526738 d!160019))

(declare-fun d!160021 () Bool)

(declare-fun lt!661221 () (_ BitVec 32))

(declare-fun lt!661220 () (_ BitVec 32))

(assert (=> d!160021 (= lt!661221 (bvmul (bvxor lt!661220 (bvlshr lt!661220 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160021 (= lt!661220 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160021 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043989 (let ((h!36908 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136507 (bvmul (bvxor h!36908 (bvlshr h!36908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136507 (bvlshr x!136507 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043989 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043989 #b00000000000000000000000000000000))))))

(assert (=> d!160021 (= (toIndex!0 (select (store (arr!48994 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!661221 (bvlshr lt!661221 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1526738 d!160021))

(declare-fun b!1526841 () Bool)

(declare-fun e!851268 () SeekEntryResult!13052)

(declare-fun e!851270 () SeekEntryResult!13052)

(assert (=> b!1526841 (= e!851268 e!851270)))

(declare-fun c!140988 () Bool)

(declare-fun lt!661222 () (_ BitVec 64))

(assert (=> b!1526841 (= c!140988 (or (= lt!661222 (select (arr!48994 a!2804) j!70)) (= (bvadd lt!661222 lt!661222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1526842 () Bool)

(assert (=> b!1526842 (= e!851268 (Intermediate!13052 true index!487 x!534))))

(declare-fun b!1526843 () Bool)

(assert (=> b!1526843 (= e!851270 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526844 () Bool)

(assert (=> b!1526844 (= e!851270 (Intermediate!13052 false index!487 x!534))))

(declare-fun b!1526845 () Bool)

(declare-fun lt!661223 () SeekEntryResult!13052)

(assert (=> b!1526845 (and (bvsge (index!54605 lt!661223) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661223) (size!49545 a!2804)))))

(declare-fun res!1043990 () Bool)

(assert (=> b!1526845 (= res!1043990 (= (select (arr!48994 a!2804) (index!54605 lt!661223)) (select (arr!48994 a!2804) j!70)))))

(declare-fun e!851269 () Bool)

(assert (=> b!1526845 (=> res!1043990 e!851269)))

(declare-fun e!851267 () Bool)

(assert (=> b!1526845 (= e!851267 e!851269)))

(declare-fun b!1526846 () Bool)

(declare-fun e!851271 () Bool)

(assert (=> b!1526846 (= e!851271 (bvsge (x!136503 lt!661223) #b01111111111111111111111111111110))))

(declare-fun b!1526847 () Bool)

(assert (=> b!1526847 (and (bvsge (index!54605 lt!661223) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661223) (size!49545 a!2804)))))

(assert (=> b!1526847 (= e!851269 (= (select (arr!48994 a!2804) (index!54605 lt!661223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160025 () Bool)

(assert (=> d!160025 e!851271))

(declare-fun c!140987 () Bool)

(assert (=> d!160025 (= c!140987 (and ((_ is Intermediate!13052) lt!661223) (undefined!13864 lt!661223)))))

(assert (=> d!160025 (= lt!661223 e!851268)))

(declare-fun c!140989 () Bool)

(assert (=> d!160025 (= c!140989 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160025 (= lt!661222 (select (arr!48994 a!2804) index!487))))

(assert (=> d!160025 (validMask!0 mask!2512)))

(assert (=> d!160025 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661223)))

(declare-fun b!1526848 () Bool)

(assert (=> b!1526848 (= e!851271 e!851267)))

(declare-fun res!1043992 () Bool)

(assert (=> b!1526848 (= res!1043992 (and ((_ is Intermediate!13052) lt!661223) (not (undefined!13864 lt!661223)) (bvslt (x!136503 lt!661223) #b01111111111111111111111111111110) (bvsge (x!136503 lt!661223) #b00000000000000000000000000000000) (bvsge (x!136503 lt!661223) x!534)))))

(assert (=> b!1526848 (=> (not res!1043992) (not e!851267))))

(declare-fun b!1526849 () Bool)

(assert (=> b!1526849 (and (bvsge (index!54605 lt!661223) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661223) (size!49545 a!2804)))))

(declare-fun res!1043991 () Bool)

(assert (=> b!1526849 (= res!1043991 (= (select (arr!48994 a!2804) (index!54605 lt!661223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526849 (=> res!1043991 e!851269)))

(assert (= (and d!160025 c!140989) b!1526842))

(assert (= (and d!160025 (not c!140989)) b!1526841))

(assert (= (and b!1526841 c!140988) b!1526844))

(assert (= (and b!1526841 (not c!140988)) b!1526843))

(assert (= (and d!160025 c!140987) b!1526846))

(assert (= (and d!160025 (not c!140987)) b!1526848))

(assert (= (and b!1526848 res!1043992) b!1526845))

(assert (= (and b!1526845 (not res!1043990)) b!1526849))

(assert (= (and b!1526849 (not res!1043991)) b!1526847))

(declare-fun m!1409757 () Bool)

(assert (=> b!1526845 m!1409757))

(declare-fun m!1409759 () Bool)

(assert (=> b!1526843 m!1409759))

(assert (=> b!1526843 m!1409759))

(assert (=> b!1526843 m!1409625))

(declare-fun m!1409761 () Bool)

(assert (=> b!1526843 m!1409761))

(assert (=> b!1526849 m!1409757))

(assert (=> d!160025 m!1409649))

(assert (=> d!160025 m!1409653))

(assert (=> b!1526847 m!1409757))

(assert (=> b!1526732 d!160025))

(declare-fun b!1526911 () Bool)

(declare-fun e!851313 () SeekEntryResult!13052)

(declare-fun e!851311 () SeekEntryResult!13052)

(assert (=> b!1526911 (= e!851313 e!851311)))

(declare-fun lt!661259 () (_ BitVec 64))

(declare-fun lt!661257 () SeekEntryResult!13052)

(assert (=> b!1526911 (= lt!661259 (select (arr!48994 a!2804) (index!54605 lt!661257)))))

(declare-fun c!141012 () Bool)

(assert (=> b!1526911 (= c!141012 (= lt!661259 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1526912 () Bool)

(assert (=> b!1526912 (= e!851311 (Found!13052 (index!54605 lt!661257)))))

(declare-fun b!1526913 () Bool)

(declare-fun e!851312 () SeekEntryResult!13052)

(assert (=> b!1526913 (= e!851312 (MissingZero!13052 (index!54605 lt!661257)))))

(declare-fun b!1526914 () Bool)

(declare-fun c!141013 () Bool)

(assert (=> b!1526914 (= c!141013 (= lt!661259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526914 (= e!851311 e!851312)))

(declare-fun d!160027 () Bool)

(declare-fun lt!661258 () SeekEntryResult!13052)

(assert (=> d!160027 (and (or ((_ is Undefined!13052) lt!661258) (not ((_ is Found!13052) lt!661258)) (and (bvsge (index!54604 lt!661258) #b00000000000000000000000000000000) (bvslt (index!54604 lt!661258) (size!49545 a!2804)))) (or ((_ is Undefined!13052) lt!661258) ((_ is Found!13052) lt!661258) (not ((_ is MissingZero!13052) lt!661258)) (and (bvsge (index!54603 lt!661258) #b00000000000000000000000000000000) (bvslt (index!54603 lt!661258) (size!49545 a!2804)))) (or ((_ is Undefined!13052) lt!661258) ((_ is Found!13052) lt!661258) ((_ is MissingZero!13052) lt!661258) (not ((_ is MissingVacant!13052) lt!661258)) (and (bvsge (index!54606 lt!661258) #b00000000000000000000000000000000) (bvslt (index!54606 lt!661258) (size!49545 a!2804)))) (or ((_ is Undefined!13052) lt!661258) (ite ((_ is Found!13052) lt!661258) (= (select (arr!48994 a!2804) (index!54604 lt!661258)) (select (arr!48994 a!2804) j!70)) (ite ((_ is MissingZero!13052) lt!661258) (= (select (arr!48994 a!2804) (index!54603 lt!661258)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13052) lt!661258) (= (select (arr!48994 a!2804) (index!54606 lt!661258)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160027 (= lt!661258 e!851313)))

(declare-fun c!141014 () Bool)

(assert (=> d!160027 (= c!141014 (and ((_ is Intermediate!13052) lt!661257) (undefined!13864 lt!661257)))))

(assert (=> d!160027 (= lt!661257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160027 (validMask!0 mask!2512)))

(assert (=> d!160027 (= (seekEntryOrOpen!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661258)))

(declare-fun b!1526915 () Bool)

(assert (=> b!1526915 (= e!851313 Undefined!13052)))

(declare-fun b!1526916 () Bool)

(assert (=> b!1526916 (= e!851312 (seekKeyOrZeroReturnVacant!0 (x!136503 lt!661257) (index!54605 lt!661257) (index!54605 lt!661257) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160027 c!141014) b!1526915))

(assert (= (and d!160027 (not c!141014)) b!1526911))

(assert (= (and b!1526911 c!141012) b!1526912))

(assert (= (and b!1526911 (not c!141012)) b!1526914))

(assert (= (and b!1526914 c!141013) b!1526913))

(assert (= (and b!1526914 (not c!141013)) b!1526916))

(declare-fun m!1409797 () Bool)

(assert (=> b!1526911 m!1409797))

(assert (=> d!160027 m!1409657))

(assert (=> d!160027 m!1409625))

(assert (=> d!160027 m!1409659))

(declare-fun m!1409799 () Bool)

(assert (=> d!160027 m!1409799))

(declare-fun m!1409801 () Bool)

(assert (=> d!160027 m!1409801))

(assert (=> d!160027 m!1409625))

(assert (=> d!160027 m!1409657))

(declare-fun m!1409803 () Bool)

(assert (=> d!160027 m!1409803))

(assert (=> d!160027 m!1409653))

(assert (=> b!1526916 m!1409625))

(declare-fun m!1409805 () Bool)

(assert (=> b!1526916 m!1409805))

(assert (=> b!1526737 d!160027))

(declare-fun e!851341 () SeekEntryResult!13052)

(declare-fun b!1526965 () Bool)

(assert (=> b!1526965 (= e!851341 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(declare-fun lt!661273 () SeekEntryResult!13052)

(declare-fun d!160045 () Bool)

(assert (=> d!160045 (and (or ((_ is Undefined!13052) lt!661273) (not ((_ is Found!13052) lt!661273)) (and (bvsge (index!54604 lt!661273) #b00000000000000000000000000000000) (bvslt (index!54604 lt!661273) (size!49545 a!2804)))) (or ((_ is Undefined!13052) lt!661273) ((_ is Found!13052) lt!661273) (not ((_ is MissingVacant!13052) lt!661273)) (not (= (index!54606 lt!661273) index!487)) (and (bvsge (index!54606 lt!661273) #b00000000000000000000000000000000) (bvslt (index!54606 lt!661273) (size!49545 a!2804)))) (or ((_ is Undefined!13052) lt!661273) (ite ((_ is Found!13052) lt!661273) (= (select (arr!48994 a!2804) (index!54604 lt!661273)) (select (arr!48994 a!2804) j!70)) (and ((_ is MissingVacant!13052) lt!661273) (= (index!54606 lt!661273) index!487) (= (select (arr!48994 a!2804) (index!54606 lt!661273)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!851342 () SeekEntryResult!13052)

(assert (=> d!160045 (= lt!661273 e!851342)))

(declare-fun c!141034 () Bool)

(assert (=> d!160045 (= c!141034 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661272 () (_ BitVec 64))

(assert (=> d!160045 (= lt!661272 (select (arr!48994 a!2804) index!487))))

(assert (=> d!160045 (validMask!0 mask!2512)))

(assert (=> d!160045 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661273)))

(declare-fun b!1526966 () Bool)

(assert (=> b!1526966 (= e!851342 Undefined!13052)))

(declare-fun b!1526967 () Bool)

(declare-fun e!851340 () SeekEntryResult!13052)

(assert (=> b!1526967 (= e!851340 (Found!13052 index!487))))

(declare-fun b!1526968 () Bool)

(assert (=> b!1526968 (= e!851342 e!851340)))

(declare-fun c!141033 () Bool)

(assert (=> b!1526968 (= c!141033 (= lt!661272 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1526969 () Bool)

(declare-fun c!141035 () Bool)

(assert (=> b!1526969 (= c!141035 (= lt!661272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526969 (= e!851340 e!851341)))

(declare-fun b!1526970 () Bool)

(assert (=> b!1526970 (= e!851341 (MissingVacant!13052 index!487))))

(assert (= (and d!160045 c!141034) b!1526966))

(assert (= (and d!160045 (not c!141034)) b!1526968))

(assert (= (and b!1526968 c!141033) b!1526967))

(assert (= (and b!1526968 (not c!141033)) b!1526969))

(assert (= (and b!1526969 c!141035) b!1526970))

(assert (= (and b!1526969 (not c!141035)) b!1526965))

(assert (=> b!1526965 m!1409759))

(assert (=> b!1526965 m!1409759))

(assert (=> b!1526965 m!1409625))

(declare-fun m!1409807 () Bool)

(assert (=> b!1526965 m!1409807))

(declare-fun m!1409809 () Bool)

(assert (=> d!160045 m!1409809))

(declare-fun m!1409811 () Bool)

(assert (=> d!160045 m!1409811))

(assert (=> d!160045 m!1409649))

(assert (=> d!160045 m!1409653))

(assert (=> b!1526737 d!160045))

(declare-fun b!1527014 () Bool)

(declare-fun e!851372 () Bool)

(declare-fun e!851370 () Bool)

(assert (=> b!1527014 (= e!851372 e!851370)))

(declare-fun lt!661301 () (_ BitVec 64))

(assert (=> b!1527014 (= lt!661301 (select (arr!48994 a!2804) j!70))))

(declare-fun lt!661300 () Unit!50923)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101542 (_ BitVec 64) (_ BitVec 32)) Unit!50923)

(assert (=> b!1527014 (= lt!661300 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661301 j!70))))

(declare-fun arrayContainsKey!0 (array!101542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1527014 (arrayContainsKey!0 a!2804 lt!661301 #b00000000000000000000000000000000)))

(declare-fun lt!661302 () Unit!50923)

(assert (=> b!1527014 (= lt!661302 lt!661300)))

(declare-fun res!1044040 () Bool)

(assert (=> b!1527014 (= res!1044040 (= (seekEntryOrOpen!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) (Found!13052 j!70)))))

(assert (=> b!1527014 (=> (not res!1044040) (not e!851370))))

(declare-fun call!68571 () Bool)

(declare-fun bm!68568 () Bool)

(assert (=> bm!68568 (= call!68571 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!160047 () Bool)

(declare-fun res!1044041 () Bool)

(declare-fun e!851371 () Bool)

(assert (=> d!160047 (=> res!1044041 e!851371)))

(assert (=> d!160047 (= res!1044041 (bvsge j!70 (size!49545 a!2804)))))

(assert (=> d!160047 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!851371)))

(declare-fun b!1527015 () Bool)

(assert (=> b!1527015 (= e!851371 e!851372)))

(declare-fun c!141049 () Bool)

(assert (=> b!1527015 (= c!141049 (validKeyInArray!0 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1527016 () Bool)

(assert (=> b!1527016 (= e!851370 call!68571)))

(declare-fun b!1527017 () Bool)

(assert (=> b!1527017 (= e!851372 call!68571)))

(assert (= (and d!160047 (not res!1044041)) b!1527015))

(assert (= (and b!1527015 c!141049) b!1527014))

(assert (= (and b!1527015 (not c!141049)) b!1527017))

(assert (= (and b!1527014 res!1044040) b!1527016))

(assert (= (or b!1527016 b!1527017) bm!68568))

(assert (=> b!1527014 m!1409625))

(declare-fun m!1409835 () Bool)

(assert (=> b!1527014 m!1409835))

(declare-fun m!1409837 () Bool)

(assert (=> b!1527014 m!1409837))

(assert (=> b!1527014 m!1409625))

(assert (=> b!1527014 m!1409627))

(declare-fun m!1409839 () Bool)

(assert (=> bm!68568 m!1409839))

(assert (=> b!1527015 m!1409625))

(assert (=> b!1527015 m!1409625))

(assert (=> b!1527015 m!1409663))

(assert (=> b!1526731 d!160047))

(declare-fun d!160059 () Bool)

(assert (=> d!160059 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!661308 () Unit!50923)

(declare-fun choose!38 (array!101542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50923)

(assert (=> d!160059 (= lt!661308 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160059 (validMask!0 mask!2512)))

(assert (=> d!160059 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!661308)))

(declare-fun bs!43776 () Bool)

(assert (= bs!43776 d!160059))

(assert (=> bs!43776 m!1409651))

(declare-fun m!1409849 () Bool)

(assert (=> bs!43776 m!1409849))

(assert (=> bs!43776 m!1409653))

(assert (=> b!1526731 d!160059))

(declare-fun d!160065 () Bool)

(assert (=> d!160065 (= (validKeyInArray!0 (select (arr!48994 a!2804) j!70)) (and (not (= (select (arr!48994 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48994 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1526736 d!160065))

(declare-fun d!160067 () Bool)

(assert (=> d!160067 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130266 d!160067))

(declare-fun d!160075 () Bool)

(assert (=> d!160075 (= (array_inv!38275 a!2804) (bvsge (size!49545 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130266 d!160075))

(declare-fun b!1527043 () Bool)

(declare-fun e!851388 () SeekEntryResult!13052)

(declare-fun e!851390 () SeekEntryResult!13052)

(assert (=> b!1527043 (= e!851388 e!851390)))

(declare-fun c!141061 () Bool)

(declare-fun lt!661317 () (_ BitVec 64))

(assert (=> b!1527043 (= c!141061 (or (= lt!661317 (select (arr!48994 a!2804) j!70)) (= (bvadd lt!661317 lt!661317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1527044 () Bool)

(assert (=> b!1527044 (= e!851388 (Intermediate!13052 true (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527045 () Bool)

(assert (=> b!1527045 (= e!851390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527046 () Bool)

(assert (=> b!1527046 (= e!851390 (Intermediate!13052 false (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1527047 () Bool)

(declare-fun lt!661318 () SeekEntryResult!13052)

(assert (=> b!1527047 (and (bvsge (index!54605 lt!661318) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661318) (size!49545 a!2804)))))

(declare-fun res!1044048 () Bool)

(assert (=> b!1527047 (= res!1044048 (= (select (arr!48994 a!2804) (index!54605 lt!661318)) (select (arr!48994 a!2804) j!70)))))

(declare-fun e!851389 () Bool)

(assert (=> b!1527047 (=> res!1044048 e!851389)))

(declare-fun e!851387 () Bool)

(assert (=> b!1527047 (= e!851387 e!851389)))

(declare-fun b!1527048 () Bool)

(declare-fun e!851391 () Bool)

(assert (=> b!1527048 (= e!851391 (bvsge (x!136503 lt!661318) #b01111111111111111111111111111110))))

(declare-fun b!1527049 () Bool)

(assert (=> b!1527049 (and (bvsge (index!54605 lt!661318) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661318) (size!49545 a!2804)))))

(assert (=> b!1527049 (= e!851389 (= (select (arr!48994 a!2804) (index!54605 lt!661318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!160077 () Bool)

(assert (=> d!160077 e!851391))

(declare-fun c!141060 () Bool)

(assert (=> d!160077 (= c!141060 (and ((_ is Intermediate!13052) lt!661318) (undefined!13864 lt!661318)))))

(assert (=> d!160077 (= lt!661318 e!851388)))

(declare-fun c!141062 () Bool)

(assert (=> d!160077 (= c!141062 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!160077 (= lt!661317 (select (arr!48994 a!2804) (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512)))))

(assert (=> d!160077 (validMask!0 mask!2512)))

(assert (=> d!160077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661318)))

(declare-fun b!1527050 () Bool)

(assert (=> b!1527050 (= e!851391 e!851387)))

(declare-fun res!1044050 () Bool)

(assert (=> b!1527050 (= res!1044050 (and ((_ is Intermediate!13052) lt!661318) (not (undefined!13864 lt!661318)) (bvslt (x!136503 lt!661318) #b01111111111111111111111111111110) (bvsge (x!136503 lt!661318) #b00000000000000000000000000000000) (bvsge (x!136503 lt!661318) #b00000000000000000000000000000000)))))

(assert (=> b!1527050 (=> (not res!1044050) (not e!851387))))

(declare-fun b!1527051 () Bool)

(assert (=> b!1527051 (and (bvsge (index!54605 lt!661318) #b00000000000000000000000000000000) (bvslt (index!54605 lt!661318) (size!49545 a!2804)))))

(declare-fun res!1044049 () Bool)

(assert (=> b!1527051 (= res!1044049 (= (select (arr!48994 a!2804) (index!54605 lt!661318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1527051 (=> res!1044049 e!851389)))

(assert (= (and d!160077 c!141062) b!1527044))

(assert (= (and d!160077 (not c!141062)) b!1527043))

(assert (= (and b!1527043 c!141061) b!1527046))

(assert (= (and b!1527043 (not c!141061)) b!1527045))

(assert (= (and d!160077 c!141060) b!1527048))

(assert (= (and d!160077 (not c!141060)) b!1527050))

(assert (= (and b!1527050 res!1044050) b!1527047))

(assert (= (and b!1527047 (not res!1044048)) b!1527051))

(assert (= (and b!1527051 (not res!1044049)) b!1527049))

(declare-fun m!1409859 () Bool)

(assert (=> b!1527047 m!1409859))

(assert (=> b!1527045 m!1409657))

(declare-fun m!1409861 () Bool)

(assert (=> b!1527045 m!1409861))

(assert (=> b!1527045 m!1409861))

(assert (=> b!1527045 m!1409625))

(declare-fun m!1409863 () Bool)

(assert (=> b!1527045 m!1409863))

(assert (=> b!1527051 m!1409859))

(assert (=> d!160077 m!1409657))

(declare-fun m!1409865 () Bool)

(assert (=> d!160077 m!1409865))

(assert (=> d!160077 m!1409653))

(assert (=> b!1527049 m!1409859))

(assert (=> b!1526741 d!160077))

(declare-fun d!160079 () Bool)

(declare-fun lt!661320 () (_ BitVec 32))

(declare-fun lt!661319 () (_ BitVec 32))

(assert (=> d!160079 (= lt!661320 (bvmul (bvxor lt!661319 (bvlshr lt!661319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160079 (= lt!661319 ((_ extract 31 0) (bvand (bvxor (select (arr!48994 a!2804) j!70) (bvlshr (select (arr!48994 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160079 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043989 (let ((h!36908 ((_ extract 31 0) (bvand (bvxor (select (arr!48994 a!2804) j!70) (bvlshr (select (arr!48994 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136507 (bvmul (bvxor h!36908 (bvlshr h!36908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136507 (bvlshr x!136507 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043989 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043989 #b00000000000000000000000000000000))))))

(assert (=> d!160079 (= (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (bvand (bvxor lt!661320 (bvlshr lt!661320 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1526741 d!160079))

(declare-fun b!1527095 () Bool)

(declare-fun c!141082 () Bool)

(declare-fun lt!661352 () (_ BitVec 64))

(assert (=> b!1527095 (= c!141082 (= lt!661352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851416 () SeekEntryResult!13052)

(declare-fun e!851415 () SeekEntryResult!13052)

(assert (=> b!1527095 (= e!851416 e!851415)))

(declare-fun b!1527096 () Bool)

(declare-fun e!851417 () SeekEntryResult!13052)

(assert (=> b!1527096 (= e!851417 Undefined!13052)))

(declare-fun d!160081 () Bool)

(declare-fun lt!661353 () SeekEntryResult!13052)

(assert (=> d!160081 (and (or ((_ is MissingVacant!13052) lt!661353) (not ((_ is Found!13052) lt!661353)) (and (bvsge (index!54604 lt!661353) #b00000000000000000000000000000000) (bvslt (index!54604 lt!661353) (size!49545 a!2804)))) (not ((_ is MissingVacant!13052) lt!661353)) (or (not ((_ is Found!13052) lt!661353)) (= (select (arr!48994 a!2804) (index!54604 lt!661353)) (select (arr!48994 a!2804) j!70))))))

(assert (=> d!160081 (= lt!661353 e!851417)))

(declare-fun c!141083 () Bool)

(declare-fun lt!661354 () SeekEntryResult!13052)

(assert (=> d!160081 (= c!141083 (and ((_ is Intermediate!13052) lt!661354) (undefined!13864 lt!661354)))))

(assert (=> d!160081 (= lt!661354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48994 a!2804) j!70) mask!2512) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160081 (validMask!0 mask!2512)))

(assert (=> d!160081 (= (seekEntry!0 (select (arr!48994 a!2804) j!70) a!2804 mask!2512) lt!661353)))

(declare-fun b!1527097 () Bool)

(assert (=> b!1527097 (= e!851417 e!851416)))

(assert (=> b!1527097 (= lt!661352 (select (arr!48994 a!2804) (index!54605 lt!661354)))))

(declare-fun c!141084 () Bool)

(assert (=> b!1527097 (= c!141084 (= lt!661352 (select (arr!48994 a!2804) j!70)))))

(declare-fun b!1527098 () Bool)

(assert (=> b!1527098 (= e!851415 (MissingZero!13052 (index!54605 lt!661354)))))

(declare-fun b!1527099 () Bool)

(assert (=> b!1527099 (= e!851416 (Found!13052 (index!54605 lt!661354)))))

(declare-fun b!1527100 () Bool)

(declare-fun lt!661355 () SeekEntryResult!13052)

(assert (=> b!1527100 (= e!851415 (ite ((_ is MissingVacant!13052) lt!661355) (MissingZero!13052 (index!54606 lt!661355)) lt!661355))))

(assert (=> b!1527100 (= lt!661355 (seekKeyOrZeroReturnVacant!0 (x!136503 lt!661354) (index!54605 lt!661354) (index!54605 lt!661354) (select (arr!48994 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160081 c!141083) b!1527096))

(assert (= (and d!160081 (not c!141083)) b!1527097))

(assert (= (and b!1527097 c!141084) b!1527099))

(assert (= (and b!1527097 (not c!141084)) b!1527095))

(assert (= (and b!1527095 c!141082) b!1527098))

(assert (= (and b!1527095 (not c!141082)) b!1527100))

(declare-fun m!1409893 () Bool)

(assert (=> d!160081 m!1409893))

(assert (=> d!160081 m!1409625))

(assert (=> d!160081 m!1409657))

(assert (=> d!160081 m!1409657))

(assert (=> d!160081 m!1409625))

(assert (=> d!160081 m!1409659))

(assert (=> d!160081 m!1409653))

(declare-fun m!1409895 () Bool)

(assert (=> b!1527097 m!1409895))

(assert (=> b!1527100 m!1409625))

(declare-fun m!1409897 () Bool)

(assert (=> b!1527100 m!1409897))

(assert (=> b!1526730 d!160081))

(declare-fun b!1527101 () Bool)

(declare-fun e!851420 () Bool)

(declare-fun e!851418 () Bool)

(assert (=> b!1527101 (= e!851420 e!851418)))

(declare-fun lt!661357 () (_ BitVec 64))

(assert (=> b!1527101 (= lt!661357 (select (arr!48994 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661356 () Unit!50923)

(assert (=> b!1527101 (= lt!661356 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661357 #b00000000000000000000000000000000))))

(assert (=> b!1527101 (arrayContainsKey!0 a!2804 lt!661357 #b00000000000000000000000000000000)))

(declare-fun lt!661358 () Unit!50923)

(assert (=> b!1527101 (= lt!661358 lt!661356)))

(declare-fun res!1044056 () Bool)

(assert (=> b!1527101 (= res!1044056 (= (seekEntryOrOpen!0 (select (arr!48994 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13052 #b00000000000000000000000000000000)))))

(assert (=> b!1527101 (=> (not res!1044056) (not e!851418))))

(declare-fun bm!68571 () Bool)

(declare-fun call!68574 () Bool)

(assert (=> bm!68571 (= call!68574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!160097 () Bool)

(declare-fun res!1044057 () Bool)

(declare-fun e!851419 () Bool)

(assert (=> d!160097 (=> res!1044057 e!851419)))

(assert (=> d!160097 (= res!1044057 (bvsge #b00000000000000000000000000000000 (size!49545 a!2804)))))

(assert (=> d!160097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851419)))

(declare-fun b!1527102 () Bool)

(assert (=> b!1527102 (= e!851419 e!851420)))

(declare-fun c!141085 () Bool)

(assert (=> b!1527102 (= c!141085 (validKeyInArray!0 (select (arr!48994 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527103 () Bool)

(assert (=> b!1527103 (= e!851418 call!68574)))

(declare-fun b!1527104 () Bool)

(assert (=> b!1527104 (= e!851420 call!68574)))

(assert (= (and d!160097 (not res!1044057)) b!1527102))

(assert (= (and b!1527102 c!141085) b!1527101))

(assert (= (and b!1527102 (not c!141085)) b!1527104))

(assert (= (and b!1527101 res!1044056) b!1527103))

(assert (= (or b!1527103 b!1527104) bm!68571))

(declare-fun m!1409899 () Bool)

(assert (=> b!1527101 m!1409899))

(declare-fun m!1409901 () Bool)

(assert (=> b!1527101 m!1409901))

(declare-fun m!1409903 () Bool)

(assert (=> b!1527101 m!1409903))

(assert (=> b!1527101 m!1409899))

(declare-fun m!1409905 () Bool)

(assert (=> b!1527101 m!1409905))

(declare-fun m!1409907 () Bool)

(assert (=> bm!68571 m!1409907))

(assert (=> b!1527102 m!1409899))

(assert (=> b!1527102 m!1409899))

(declare-fun m!1409909 () Bool)

(assert (=> b!1527102 m!1409909))

(assert (=> b!1526740 d!160097))

(declare-fun bm!68576 () Bool)

(declare-fun call!68579 () Bool)

(declare-fun c!141093 () Bool)

(assert (=> bm!68576 (= call!68579 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141093 (Cons!35460 (select (arr!48994 a!2804) #b00000000000000000000000000000000) Nil!35461) Nil!35461)))))

(declare-fun b!1527131 () Bool)

(declare-fun e!851442 () Bool)

(assert (=> b!1527131 (= e!851442 call!68579)))

(declare-fun b!1527132 () Bool)

(assert (=> b!1527132 (= e!851442 call!68579)))

(declare-fun b!1527133 () Bool)

(declare-fun e!851441 () Bool)

(assert (=> b!1527133 (= e!851441 e!851442)))

(assert (=> b!1527133 (= c!141093 (validKeyInArray!0 (select (arr!48994 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527134 () Bool)

(declare-fun e!851443 () Bool)

(declare-fun contains!10040 (List!35464 (_ BitVec 64)) Bool)

(assert (=> b!1527134 (= e!851443 (contains!10040 Nil!35461 (select (arr!48994 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1527135 () Bool)

(declare-fun e!851440 () Bool)

(assert (=> b!1527135 (= e!851440 e!851441)))

(declare-fun res!1044070 () Bool)

(assert (=> b!1527135 (=> (not res!1044070) (not e!851441))))

(assert (=> b!1527135 (= res!1044070 (not e!851443))))

(declare-fun res!1044071 () Bool)

(assert (=> b!1527135 (=> (not res!1044071) (not e!851443))))

(assert (=> b!1527135 (= res!1044071 (validKeyInArray!0 (select (arr!48994 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!160099 () Bool)

(declare-fun res!1044072 () Bool)

(assert (=> d!160099 (=> res!1044072 e!851440)))

(assert (=> d!160099 (= res!1044072 (bvsge #b00000000000000000000000000000000 (size!49545 a!2804)))))

(assert (=> d!160099 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35461) e!851440)))

(assert (= (and d!160099 (not res!1044072)) b!1527135))

(assert (= (and b!1527135 res!1044071) b!1527134))

(assert (= (and b!1527135 res!1044070) b!1527133))

(assert (= (and b!1527133 c!141093) b!1527132))

(assert (= (and b!1527133 (not c!141093)) b!1527131))

(assert (= (or b!1527132 b!1527131) bm!68576))

(assert (=> bm!68576 m!1409899))

(declare-fun m!1409919 () Bool)

(assert (=> bm!68576 m!1409919))

(assert (=> b!1527133 m!1409899))

(assert (=> b!1527133 m!1409899))

(assert (=> b!1527133 m!1409909))

(assert (=> b!1527134 m!1409899))

(assert (=> b!1527134 m!1409899))

(declare-fun m!1409921 () Bool)

(assert (=> b!1527134 m!1409921))

(assert (=> b!1527135 m!1409899))

(assert (=> b!1527135 m!1409899))

(assert (=> b!1527135 m!1409909))

(assert (=> b!1526734 d!160099))

(declare-fun d!160103 () Bool)

(assert (=> d!160103 (= (validKeyInArray!0 (select (arr!48994 a!2804) i!961)) (and (not (= (select (arr!48994 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48994 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1526739 d!160103))

(check-sat (not b!1526916) (not d!160019) (not b!1527134) (not d!160059) (not b!1526843) (not b!1527100) (not d!160045) (not b!1527045) (not b!1527135) (not d!160077) (not d!160081) (not b!1527101) (not d!160025) (not bm!68568) (not b!1527014) (not bm!68571) (not b!1526965) (not b!1527102) (not d!160027) (not b!1527015) (not b!1527133) (not bm!68576) (not b!1526834))
(check-sat)
