; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52512 () Bool)

(assert start!52512)

(declare-fun b!573250 () Bool)

(declare-fun res!362656 () Bool)

(declare-fun e!329782 () Bool)

(assert (=> b!573250 (=> (not res!362656) (not e!329782))))

(declare-datatypes ((array!35856 0))(
  ( (array!35857 (arr!17215 (Array (_ BitVec 32) (_ BitVec 64))) (size!17579 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35856)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573250 (= res!362656 (validKeyInArray!0 (select (arr!17215 a!3118) j!142)))))

(declare-fun e!329784 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!573251 () Bool)

(declare-datatypes ((SeekEntryResult!5620 0))(
  ( (MissingZero!5620 (index!24707 (_ BitVec 32))) (Found!5620 (index!24708 (_ BitVec 32))) (Intermediate!5620 (undefined!6432 Bool) (index!24709 (_ BitVec 32)) (x!53724 (_ BitVec 32))) (Undefined!5620) (MissingVacant!5620 (index!24710 (_ BitVec 32))) )
))
(declare-fun lt!261771 () SeekEntryResult!5620)

(get-info :version)

(assert (=> b!573251 (= e!329784 (not (or (undefined!6432 lt!261771) (not ((_ is Intermediate!5620) lt!261771)) (let ((bdg!17961 (select (arr!17215 a!3118) (index!24709 lt!261771)))) (or (= bdg!17961 (select (arr!17215 a!3118) j!142)) (= bdg!17961 #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!24709 lt!261771) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261771) (bvadd #b00000000000000000000000000000001 mask!3119))))))))))

(declare-fun e!329787 () Bool)

(assert (=> b!573251 e!329787))

(declare-fun res!362665 () Bool)

(assert (=> b!573251 (=> (not res!362665) (not e!329787))))

(declare-fun lt!261775 () SeekEntryResult!5620)

(assert (=> b!573251 (= res!362665 (= lt!261775 (Found!5620 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35856 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!573251 (= lt!261775 (seekEntryOrOpen!0 (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35856 (_ BitVec 32)) Bool)

(assert (=> b!573251 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18013 0))(
  ( (Unit!18014) )
))
(declare-fun lt!261778 () Unit!18013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18013)

(assert (=> b!573251 (= lt!261778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573252 () Bool)

(declare-fun res!362658 () Bool)

(assert (=> b!573252 (=> (not res!362658) (not e!329782))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573252 (= res!362658 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573253 () Bool)

(declare-fun e!329786 () Bool)

(declare-fun e!329785 () Bool)

(assert (=> b!573253 (= e!329786 e!329785)))

(declare-fun res!362662 () Bool)

(assert (=> b!573253 (=> res!362662 e!329785)))

(declare-fun lt!261774 () (_ BitVec 64))

(assert (=> b!573253 (= res!362662 (or (= lt!261774 (select (arr!17215 a!3118) j!142)) (= lt!261774 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573253 (= lt!261774 (select (arr!17215 a!3118) (index!24709 lt!261771)))))

(declare-fun b!573254 () Bool)

(declare-fun e!329781 () Bool)

(assert (=> b!573254 (= e!329781 e!329784)))

(declare-fun res!362653 () Bool)

(assert (=> b!573254 (=> (not res!362653) (not e!329784))))

(declare-fun lt!261777 () (_ BitVec 64))

(declare-fun lt!261773 () array!35856)

(declare-fun lt!261776 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35856 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!573254 (= res!362653 (= lt!261771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261776 lt!261777 lt!261773 mask!3119)))))

(declare-fun lt!261770 () (_ BitVec 32))

(assert (=> b!573254 (= lt!261771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261770 (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573254 (= lt!261776 (toIndex!0 lt!261777 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573254 (= lt!261777 (select (store (arr!17215 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573254 (= lt!261770 (toIndex!0 (select (arr!17215 a!3118) j!142) mask!3119))))

(assert (=> b!573254 (= lt!261773 (array!35857 (store (arr!17215 a!3118) i!1132 k0!1914) (size!17579 a!3118)))))

(declare-fun e!329783 () Bool)

(declare-fun b!573255 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35856 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!573255 (= e!329783 (= (seekEntryOrOpen!0 lt!261777 lt!261773 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261771) (index!24709 lt!261771) (index!24709 lt!261771) lt!261777 lt!261773 mask!3119)))))

(declare-fun b!573256 () Bool)

(declare-fun res!362654 () Bool)

(assert (=> b!573256 (=> (not res!362654) (not e!329781))))

(assert (=> b!573256 (= res!362654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573257 () Bool)

(declare-fun res!362664 () Bool)

(assert (=> b!573257 (=> (not res!362664) (not e!329781))))

(declare-datatypes ((List!11202 0))(
  ( (Nil!11199) (Cons!11198 (h!12228 (_ BitVec 64)) (t!17422 List!11202)) )
))
(declare-fun arrayNoDuplicates!0 (array!35856 (_ BitVec 32) List!11202) Bool)

(assert (=> b!573257 (= res!362664 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11199))))

(declare-fun res!362660 () Bool)

(assert (=> start!52512 (=> (not res!362660) (not e!329782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52512 (= res!362660 (validMask!0 mask!3119))))

(assert (=> start!52512 e!329782))

(assert (=> start!52512 true))

(declare-fun array_inv!13074 (array!35856) Bool)

(assert (=> start!52512 (array_inv!13074 a!3118)))

(declare-fun b!573258 () Bool)

(declare-fun res!362655 () Bool)

(assert (=> b!573258 (=> (not res!362655) (not e!329782))))

(assert (=> b!573258 (= res!362655 (validKeyInArray!0 k0!1914))))

(declare-fun b!573259 () Bool)

(assert (=> b!573259 (= e!329785 e!329783)))

(declare-fun res!362661 () Bool)

(assert (=> b!573259 (=> (not res!362661) (not e!329783))))

(assert (=> b!573259 (= res!362661 (= lt!261775 (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261771) (index!24709 lt!261771) (index!24709 lt!261771) (select (arr!17215 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573260 () Bool)

(assert (=> b!573260 (= e!329787 e!329786)))

(declare-fun res!362663 () Bool)

(assert (=> b!573260 (=> res!362663 e!329786)))

(assert (=> b!573260 (= res!362663 (or (undefined!6432 lt!261771) (not ((_ is Intermediate!5620) lt!261771))))))

(declare-fun b!573261 () Bool)

(declare-fun res!362657 () Bool)

(assert (=> b!573261 (=> (not res!362657) (not e!329782))))

(assert (=> b!573261 (= res!362657 (and (= (size!17579 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17579 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17579 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573262 () Bool)

(assert (=> b!573262 (= e!329782 e!329781)))

(declare-fun res!362659 () Bool)

(assert (=> b!573262 (=> (not res!362659) (not e!329781))))

(declare-fun lt!261772 () SeekEntryResult!5620)

(assert (=> b!573262 (= res!362659 (or (= lt!261772 (MissingZero!5620 i!1132)) (= lt!261772 (MissingVacant!5620 i!1132))))))

(assert (=> b!573262 (= lt!261772 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52512 res!362660) b!573261))

(assert (= (and b!573261 res!362657) b!573250))

(assert (= (and b!573250 res!362656) b!573258))

(assert (= (and b!573258 res!362655) b!573252))

(assert (= (and b!573252 res!362658) b!573262))

(assert (= (and b!573262 res!362659) b!573256))

(assert (= (and b!573256 res!362654) b!573257))

(assert (= (and b!573257 res!362664) b!573254))

(assert (= (and b!573254 res!362653) b!573251))

(assert (= (and b!573251 res!362665) b!573260))

(assert (= (and b!573260 (not res!362663)) b!573253))

(assert (= (and b!573253 (not res!362662)) b!573259))

(assert (= (and b!573259 res!362661) b!573255))

(declare-fun m!552443 () Bool)

(assert (=> start!52512 m!552443))

(declare-fun m!552445 () Bool)

(assert (=> start!52512 m!552445))

(declare-fun m!552447 () Bool)

(assert (=> b!573256 m!552447))

(declare-fun m!552449 () Bool)

(assert (=> b!573253 m!552449))

(declare-fun m!552451 () Bool)

(assert (=> b!573253 m!552451))

(assert (=> b!573259 m!552449))

(assert (=> b!573259 m!552449))

(declare-fun m!552453 () Bool)

(assert (=> b!573259 m!552453))

(declare-fun m!552455 () Bool)

(assert (=> b!573252 m!552455))

(assert (=> b!573251 m!552451))

(assert (=> b!573251 m!552449))

(declare-fun m!552457 () Bool)

(assert (=> b!573251 m!552457))

(declare-fun m!552459 () Bool)

(assert (=> b!573251 m!552459))

(assert (=> b!573251 m!552449))

(declare-fun m!552461 () Bool)

(assert (=> b!573251 m!552461))

(declare-fun m!552463 () Bool)

(assert (=> b!573257 m!552463))

(assert (=> b!573250 m!552449))

(assert (=> b!573250 m!552449))

(declare-fun m!552465 () Bool)

(assert (=> b!573250 m!552465))

(declare-fun m!552467 () Bool)

(assert (=> b!573255 m!552467))

(declare-fun m!552469 () Bool)

(assert (=> b!573255 m!552469))

(assert (=> b!573254 m!552449))

(declare-fun m!552471 () Bool)

(assert (=> b!573254 m!552471))

(assert (=> b!573254 m!552449))

(declare-fun m!552473 () Bool)

(assert (=> b!573254 m!552473))

(declare-fun m!552475 () Bool)

(assert (=> b!573254 m!552475))

(assert (=> b!573254 m!552449))

(declare-fun m!552477 () Bool)

(assert (=> b!573254 m!552477))

(declare-fun m!552479 () Bool)

(assert (=> b!573254 m!552479))

(declare-fun m!552481 () Bool)

(assert (=> b!573254 m!552481))

(declare-fun m!552483 () Bool)

(assert (=> b!573262 m!552483))

(declare-fun m!552485 () Bool)

(assert (=> b!573258 m!552485))

(check-sat (not b!573255) (not b!573257) (not b!573254) (not b!573258) (not b!573251) (not b!573252) (not b!573256) (not start!52512) (not b!573259) (not b!573262) (not b!573250))
(check-sat)
(get-model)

(declare-fun d!84959 () Bool)

(declare-fun e!329846 () Bool)

(assert (=> d!84959 e!329846))

(declare-fun c!65664 () Bool)

(declare-fun lt!261838 () SeekEntryResult!5620)

(assert (=> d!84959 (= c!65664 (and ((_ is Intermediate!5620) lt!261838) (undefined!6432 lt!261838)))))

(declare-fun e!329849 () SeekEntryResult!5620)

(assert (=> d!84959 (= lt!261838 e!329849)))

(declare-fun c!65665 () Bool)

(assert (=> d!84959 (= c!65665 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!261837 () (_ BitVec 64))

(assert (=> d!84959 (= lt!261837 (select (arr!17215 lt!261773) lt!261776))))

(assert (=> d!84959 (validMask!0 mask!3119)))

(assert (=> d!84959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261776 lt!261777 lt!261773 mask!3119) lt!261838)))

(declare-fun b!573359 () Bool)

(assert (=> b!573359 (= e!329849 (Intermediate!5620 true lt!261776 #b00000000000000000000000000000000))))

(declare-fun b!573360 () Bool)

(assert (=> b!573360 (and (bvsge (index!24709 lt!261838) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261838) (size!17579 lt!261773)))))

(declare-fun res!362751 () Bool)

(assert (=> b!573360 (= res!362751 (= (select (arr!17215 lt!261773) (index!24709 lt!261838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329850 () Bool)

(assert (=> b!573360 (=> res!362751 e!329850)))

(declare-fun b!573361 () Bool)

(assert (=> b!573361 (and (bvsge (index!24709 lt!261838) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261838) (size!17579 lt!261773)))))

(declare-fun res!362750 () Bool)

(assert (=> b!573361 (= res!362750 (= (select (arr!17215 lt!261773) (index!24709 lt!261838)) lt!261777))))

(assert (=> b!573361 (=> res!362750 e!329850)))

(declare-fun e!329848 () Bool)

(assert (=> b!573361 (= e!329848 e!329850)))

(declare-fun b!573362 () Bool)

(assert (=> b!573362 (and (bvsge (index!24709 lt!261838) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261838) (size!17579 lt!261773)))))

(assert (=> b!573362 (= e!329850 (= (select (arr!17215 lt!261773) (index!24709 lt!261838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573363 () Bool)

(assert (=> b!573363 (= e!329846 (bvsge (x!53724 lt!261838) #b01111111111111111111111111111110))))

(declare-fun b!573364 () Bool)

(declare-fun e!329847 () SeekEntryResult!5620)

(assert (=> b!573364 (= e!329847 (Intermediate!5620 false lt!261776 #b00000000000000000000000000000000))))

(declare-fun b!573365 () Bool)

(assert (=> b!573365 (= e!329846 e!329848)))

(declare-fun res!362752 () Bool)

(assert (=> b!573365 (= res!362752 (and ((_ is Intermediate!5620) lt!261838) (not (undefined!6432 lt!261838)) (bvslt (x!53724 lt!261838) #b01111111111111111111111111111110) (bvsge (x!53724 lt!261838) #b00000000000000000000000000000000) (bvsge (x!53724 lt!261838) #b00000000000000000000000000000000)))))

(assert (=> b!573365 (=> (not res!362752) (not e!329848))))

(declare-fun b!573366 () Bool)

(assert (=> b!573366 (= e!329849 e!329847)))

(declare-fun c!65666 () Bool)

(assert (=> b!573366 (= c!65666 (or (= lt!261837 lt!261777) (= (bvadd lt!261837 lt!261837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573367 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573367 (= e!329847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261776 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!261777 lt!261773 mask!3119))))

(assert (= (and d!84959 c!65665) b!573359))

(assert (= (and d!84959 (not c!65665)) b!573366))

(assert (= (and b!573366 c!65666) b!573364))

(assert (= (and b!573366 (not c!65666)) b!573367))

(assert (= (and d!84959 c!65664) b!573363))

(assert (= (and d!84959 (not c!65664)) b!573365))

(assert (= (and b!573365 res!362752) b!573361))

(assert (= (and b!573361 (not res!362750)) b!573360))

(assert (= (and b!573360 (not res!362751)) b!573362))

(declare-fun m!552575 () Bool)

(assert (=> d!84959 m!552575))

(assert (=> d!84959 m!552443))

(declare-fun m!552577 () Bool)

(assert (=> b!573362 m!552577))

(assert (=> b!573361 m!552577))

(declare-fun m!552579 () Bool)

(assert (=> b!573367 m!552579))

(assert (=> b!573367 m!552579))

(declare-fun m!552581 () Bool)

(assert (=> b!573367 m!552581))

(assert (=> b!573360 m!552577))

(assert (=> b!573254 d!84959))

(declare-fun d!84961 () Bool)

(declare-fun e!329851 () Bool)

(assert (=> d!84961 e!329851))

(declare-fun c!65667 () Bool)

(declare-fun lt!261840 () SeekEntryResult!5620)

(assert (=> d!84961 (= c!65667 (and ((_ is Intermediate!5620) lt!261840) (undefined!6432 lt!261840)))))

(declare-fun e!329854 () SeekEntryResult!5620)

(assert (=> d!84961 (= lt!261840 e!329854)))

(declare-fun c!65668 () Bool)

(assert (=> d!84961 (= c!65668 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!261839 () (_ BitVec 64))

(assert (=> d!84961 (= lt!261839 (select (arr!17215 a!3118) lt!261770))))

(assert (=> d!84961 (validMask!0 mask!3119)))

(assert (=> d!84961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261770 (select (arr!17215 a!3118) j!142) a!3118 mask!3119) lt!261840)))

(declare-fun b!573368 () Bool)

(assert (=> b!573368 (= e!329854 (Intermediate!5620 true lt!261770 #b00000000000000000000000000000000))))

(declare-fun b!573369 () Bool)

(assert (=> b!573369 (and (bvsge (index!24709 lt!261840) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261840) (size!17579 a!3118)))))

(declare-fun res!362754 () Bool)

(assert (=> b!573369 (= res!362754 (= (select (arr!17215 a!3118) (index!24709 lt!261840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329855 () Bool)

(assert (=> b!573369 (=> res!362754 e!329855)))

(declare-fun b!573370 () Bool)

(assert (=> b!573370 (and (bvsge (index!24709 lt!261840) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261840) (size!17579 a!3118)))))

(declare-fun res!362753 () Bool)

(assert (=> b!573370 (= res!362753 (= (select (arr!17215 a!3118) (index!24709 lt!261840)) (select (arr!17215 a!3118) j!142)))))

(assert (=> b!573370 (=> res!362753 e!329855)))

(declare-fun e!329853 () Bool)

(assert (=> b!573370 (= e!329853 e!329855)))

(declare-fun b!573371 () Bool)

(assert (=> b!573371 (and (bvsge (index!24709 lt!261840) #b00000000000000000000000000000000) (bvslt (index!24709 lt!261840) (size!17579 a!3118)))))

(assert (=> b!573371 (= e!329855 (= (select (arr!17215 a!3118) (index!24709 lt!261840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573372 () Bool)

(assert (=> b!573372 (= e!329851 (bvsge (x!53724 lt!261840) #b01111111111111111111111111111110))))

(declare-fun b!573373 () Bool)

(declare-fun e!329852 () SeekEntryResult!5620)

(assert (=> b!573373 (= e!329852 (Intermediate!5620 false lt!261770 #b00000000000000000000000000000000))))

(declare-fun b!573374 () Bool)

(assert (=> b!573374 (= e!329851 e!329853)))

(declare-fun res!362755 () Bool)

(assert (=> b!573374 (= res!362755 (and ((_ is Intermediate!5620) lt!261840) (not (undefined!6432 lt!261840)) (bvslt (x!53724 lt!261840) #b01111111111111111111111111111110) (bvsge (x!53724 lt!261840) #b00000000000000000000000000000000) (bvsge (x!53724 lt!261840) #b00000000000000000000000000000000)))))

(assert (=> b!573374 (=> (not res!362755) (not e!329853))))

(declare-fun b!573375 () Bool)

(assert (=> b!573375 (= e!329854 e!329852)))

(declare-fun c!65669 () Bool)

(assert (=> b!573375 (= c!65669 (or (= lt!261839 (select (arr!17215 a!3118) j!142)) (= (bvadd lt!261839 lt!261839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573376 () Bool)

(assert (=> b!573376 (= e!329852 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261770 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84961 c!65668) b!573368))

(assert (= (and d!84961 (not c!65668)) b!573375))

(assert (= (and b!573375 c!65669) b!573373))

(assert (= (and b!573375 (not c!65669)) b!573376))

(assert (= (and d!84961 c!65667) b!573372))

(assert (= (and d!84961 (not c!65667)) b!573374))

(assert (= (and b!573374 res!362755) b!573370))

(assert (= (and b!573370 (not res!362753)) b!573369))

(assert (= (and b!573369 (not res!362754)) b!573371))

(declare-fun m!552583 () Bool)

(assert (=> d!84961 m!552583))

(assert (=> d!84961 m!552443))

(declare-fun m!552585 () Bool)

(assert (=> b!573371 m!552585))

(assert (=> b!573370 m!552585))

(declare-fun m!552587 () Bool)

(assert (=> b!573376 m!552587))

(assert (=> b!573376 m!552587))

(assert (=> b!573376 m!552449))

(declare-fun m!552589 () Bool)

(assert (=> b!573376 m!552589))

(assert (=> b!573369 m!552585))

(assert (=> b!573254 d!84961))

(declare-fun d!84963 () Bool)

(declare-fun lt!261846 () (_ BitVec 32))

(declare-fun lt!261845 () (_ BitVec 32))

(assert (=> d!84963 (= lt!261846 (bvmul (bvxor lt!261845 (bvlshr lt!261845 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84963 (= lt!261845 ((_ extract 31 0) (bvand (bvxor lt!261777 (bvlshr lt!261777 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84963 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362756 (let ((h!12231 ((_ extract 31 0) (bvand (bvxor lt!261777 (bvlshr lt!261777 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53728 (bvmul (bvxor h!12231 (bvlshr h!12231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53728 (bvlshr x!53728 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362756 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362756 #b00000000000000000000000000000000))))))

(assert (=> d!84963 (= (toIndex!0 lt!261777 mask!3119) (bvand (bvxor lt!261846 (bvlshr lt!261846 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573254 d!84963))

(declare-fun d!84965 () Bool)

(declare-fun lt!261848 () (_ BitVec 32))

(declare-fun lt!261847 () (_ BitVec 32))

(assert (=> d!84965 (= lt!261848 (bvmul (bvxor lt!261847 (bvlshr lt!261847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84965 (= lt!261847 ((_ extract 31 0) (bvand (bvxor (select (arr!17215 a!3118) j!142) (bvlshr (select (arr!17215 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84965 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362756 (let ((h!12231 ((_ extract 31 0) (bvand (bvxor (select (arr!17215 a!3118) j!142) (bvlshr (select (arr!17215 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53728 (bvmul (bvxor h!12231 (bvlshr h!12231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53728 (bvlshr x!53728 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362756 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362756 #b00000000000000000000000000000000))))))

(assert (=> d!84965 (= (toIndex!0 (select (arr!17215 a!3118) j!142) mask!3119) (bvand (bvxor lt!261848 (bvlshr lt!261848 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573254 d!84965))

(declare-fun b!573389 () Bool)

(declare-fun e!329863 () SeekEntryResult!5620)

(assert (=> b!573389 (= e!329863 (MissingVacant!5620 (index!24709 lt!261771)))))

(declare-fun lt!261853 () SeekEntryResult!5620)

(declare-fun d!84969 () Bool)

(assert (=> d!84969 (and (or ((_ is Undefined!5620) lt!261853) (not ((_ is Found!5620) lt!261853)) (and (bvsge (index!24708 lt!261853) #b00000000000000000000000000000000) (bvslt (index!24708 lt!261853) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261853) ((_ is Found!5620) lt!261853) (not ((_ is MissingVacant!5620) lt!261853)) (not (= (index!24710 lt!261853) (index!24709 lt!261771))) (and (bvsge (index!24710 lt!261853) #b00000000000000000000000000000000) (bvslt (index!24710 lt!261853) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261853) (ite ((_ is Found!5620) lt!261853) (= (select (arr!17215 a!3118) (index!24708 lt!261853)) (select (arr!17215 a!3118) j!142)) (and ((_ is MissingVacant!5620) lt!261853) (= (index!24710 lt!261853) (index!24709 lt!261771)) (= (select (arr!17215 a!3118) (index!24710 lt!261853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!329864 () SeekEntryResult!5620)

(assert (=> d!84969 (= lt!261853 e!329864)))

(declare-fun c!65676 () Bool)

(assert (=> d!84969 (= c!65676 (bvsge (x!53724 lt!261771) #b01111111111111111111111111111110))))

(declare-fun lt!261854 () (_ BitVec 64))

(assert (=> d!84969 (= lt!261854 (select (arr!17215 a!3118) (index!24709 lt!261771)))))

(assert (=> d!84969 (validMask!0 mask!3119)))

(assert (=> d!84969 (= (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261771) (index!24709 lt!261771) (index!24709 lt!261771) (select (arr!17215 a!3118) j!142) a!3118 mask!3119) lt!261853)))

(declare-fun b!573390 () Bool)

(declare-fun e!329862 () SeekEntryResult!5620)

(assert (=> b!573390 (= e!329862 (Found!5620 (index!24709 lt!261771)))))

(declare-fun b!573391 () Bool)

(assert (=> b!573391 (= e!329863 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53724 lt!261771) #b00000000000000000000000000000001) (nextIndex!0 (index!24709 lt!261771) (bvadd (x!53724 lt!261771) #b00000000000000000000000000000001) mask!3119) (index!24709 lt!261771) (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573392 () Bool)

(declare-fun c!65678 () Bool)

(assert (=> b!573392 (= c!65678 (= lt!261854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573392 (= e!329862 e!329863)))

(declare-fun b!573393 () Bool)

(assert (=> b!573393 (= e!329864 e!329862)))

(declare-fun c!65677 () Bool)

(assert (=> b!573393 (= c!65677 (= lt!261854 (select (arr!17215 a!3118) j!142)))))

(declare-fun b!573394 () Bool)

(assert (=> b!573394 (= e!329864 Undefined!5620)))

(assert (= (and d!84969 c!65676) b!573394))

(assert (= (and d!84969 (not c!65676)) b!573393))

(assert (= (and b!573393 c!65677) b!573390))

(assert (= (and b!573393 (not c!65677)) b!573392))

(assert (= (and b!573392 c!65678) b!573389))

(assert (= (and b!573392 (not c!65678)) b!573391))

(declare-fun m!552591 () Bool)

(assert (=> d!84969 m!552591))

(declare-fun m!552593 () Bool)

(assert (=> d!84969 m!552593))

(assert (=> d!84969 m!552451))

(assert (=> d!84969 m!552443))

(declare-fun m!552595 () Bool)

(assert (=> b!573391 m!552595))

(assert (=> b!573391 m!552595))

(assert (=> b!573391 m!552449))

(declare-fun m!552597 () Bool)

(assert (=> b!573391 m!552597))

(assert (=> b!573259 d!84969))

(declare-fun d!84973 () Bool)

(assert (=> d!84973 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52512 d!84973))

(declare-fun d!84979 () Bool)

(assert (=> d!84979 (= (array_inv!13074 a!3118) (bvsge (size!17579 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52512 d!84979))

(declare-fun d!84981 () Bool)

(declare-fun res!362767 () Bool)

(declare-fun e!329884 () Bool)

(assert (=> d!84981 (=> res!362767 e!329884)))

(assert (=> d!84981 (= res!362767 (= (select (arr!17215 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84981 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!329884)))

(declare-fun b!573423 () Bool)

(declare-fun e!329885 () Bool)

(assert (=> b!573423 (= e!329884 e!329885)))

(declare-fun res!362768 () Bool)

(assert (=> b!573423 (=> (not res!362768) (not e!329885))))

(assert (=> b!573423 (= res!362768 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17579 a!3118)))))

(declare-fun b!573424 () Bool)

(assert (=> b!573424 (= e!329885 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84981 (not res!362767)) b!573423))

(assert (= (and b!573423 res!362768) b!573424))

(declare-fun m!552615 () Bool)

(assert (=> d!84981 m!552615))

(declare-fun m!552617 () Bool)

(assert (=> b!573424 m!552617))

(assert (=> b!573252 d!84981))

(declare-fun bm!32631 () Bool)

(declare-fun call!32634 () Bool)

(declare-fun c!65693 () Bool)

(assert (=> bm!32631 (= call!32634 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65693 (Cons!11198 (select (arr!17215 a!3118) #b00000000000000000000000000000000) Nil!11199) Nil!11199)))))

(declare-fun d!84983 () Bool)

(declare-fun res!362783 () Bool)

(declare-fun e!329903 () Bool)

(assert (=> d!84983 (=> res!362783 e!329903)))

(assert (=> d!84983 (= res!362783 (bvsge #b00000000000000000000000000000000 (size!17579 a!3118)))))

(assert (=> d!84983 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11199) e!329903)))

(declare-fun b!573447 () Bool)

(declare-fun e!329906 () Bool)

(declare-fun e!329904 () Bool)

(assert (=> b!573447 (= e!329906 e!329904)))

(assert (=> b!573447 (= c!65693 (validKeyInArray!0 (select (arr!17215 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573448 () Bool)

(assert (=> b!573448 (= e!329904 call!32634)))

(declare-fun b!573449 () Bool)

(declare-fun e!329905 () Bool)

(declare-fun contains!2855 (List!11202 (_ BitVec 64)) Bool)

(assert (=> b!573449 (= e!329905 (contains!2855 Nil!11199 (select (arr!17215 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573450 () Bool)

(assert (=> b!573450 (= e!329903 e!329906)))

(declare-fun res!362782 () Bool)

(assert (=> b!573450 (=> (not res!362782) (not e!329906))))

(assert (=> b!573450 (= res!362782 (not e!329905))))

(declare-fun res!362781 () Bool)

(assert (=> b!573450 (=> (not res!362781) (not e!329905))))

(assert (=> b!573450 (= res!362781 (validKeyInArray!0 (select (arr!17215 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573451 () Bool)

(assert (=> b!573451 (= e!329904 call!32634)))

(assert (= (and d!84983 (not res!362783)) b!573450))

(assert (= (and b!573450 res!362781) b!573449))

(assert (= (and b!573450 res!362782) b!573447))

(assert (= (and b!573447 c!65693) b!573448))

(assert (= (and b!573447 (not c!65693)) b!573451))

(assert (= (or b!573448 b!573451) bm!32631))

(assert (=> bm!32631 m!552615))

(declare-fun m!552629 () Bool)

(assert (=> bm!32631 m!552629))

(assert (=> b!573447 m!552615))

(assert (=> b!573447 m!552615))

(declare-fun m!552631 () Bool)

(assert (=> b!573447 m!552631))

(assert (=> b!573449 m!552615))

(assert (=> b!573449 m!552615))

(declare-fun m!552633 () Bool)

(assert (=> b!573449 m!552633))

(assert (=> b!573450 m!552615))

(assert (=> b!573450 m!552615))

(assert (=> b!573450 m!552631))

(assert (=> b!573257 d!84983))

(declare-fun d!84987 () Bool)

(assert (=> d!84987 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573258 d!84987))

(declare-fun b!573490 () Bool)

(declare-fun e!329928 () Bool)

(declare-fun call!32637 () Bool)

(assert (=> b!573490 (= e!329928 call!32637)))

(declare-fun b!573491 () Bool)

(declare-fun e!329929 () Bool)

(assert (=> b!573491 (= e!329929 call!32637)))

(declare-fun b!573492 () Bool)

(declare-fun e!329930 () Bool)

(assert (=> b!573492 (= e!329930 e!329928)))

(declare-fun c!65711 () Bool)

(assert (=> b!573492 (= c!65711 (validKeyInArray!0 (select (arr!17215 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573493 () Bool)

(assert (=> b!573493 (= e!329928 e!329929)))

(declare-fun lt!261892 () (_ BitVec 64))

(assert (=> b!573493 (= lt!261892 (select (arr!17215 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261890 () Unit!18013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35856 (_ BitVec 64) (_ BitVec 32)) Unit!18013)

(assert (=> b!573493 (= lt!261890 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261892 #b00000000000000000000000000000000))))

(assert (=> b!573493 (arrayContainsKey!0 a!3118 lt!261892 #b00000000000000000000000000000000)))

(declare-fun lt!261891 () Unit!18013)

(assert (=> b!573493 (= lt!261891 lt!261890)))

(declare-fun res!362788 () Bool)

(assert (=> b!573493 (= res!362788 (= (seekEntryOrOpen!0 (select (arr!17215 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5620 #b00000000000000000000000000000000)))))

(assert (=> b!573493 (=> (not res!362788) (not e!329929))))

(declare-fun bm!32634 () Bool)

(assert (=> bm!32634 (= call!32637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84989 () Bool)

(declare-fun res!362789 () Bool)

(assert (=> d!84989 (=> res!362789 e!329930)))

(assert (=> d!84989 (= res!362789 (bvsge #b00000000000000000000000000000000 (size!17579 a!3118)))))

(assert (=> d!84989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329930)))

(assert (= (and d!84989 (not res!362789)) b!573492))

(assert (= (and b!573492 c!65711) b!573493))

(assert (= (and b!573492 (not c!65711)) b!573490))

(assert (= (and b!573493 res!362788) b!573491))

(assert (= (or b!573491 b!573490) bm!32634))

(assert (=> b!573492 m!552615))

(assert (=> b!573492 m!552615))

(assert (=> b!573492 m!552631))

(assert (=> b!573493 m!552615))

(declare-fun m!552663 () Bool)

(assert (=> b!573493 m!552663))

(declare-fun m!552665 () Bool)

(assert (=> b!573493 m!552665))

(assert (=> b!573493 m!552615))

(declare-fun m!552667 () Bool)

(assert (=> b!573493 m!552667))

(declare-fun m!552669 () Bool)

(assert (=> bm!32634 m!552669))

(assert (=> b!573256 d!84989))

(declare-fun b!573546 () Bool)

(declare-fun c!65732 () Bool)

(declare-fun lt!261925 () (_ BitVec 64))

(assert (=> b!573546 (= c!65732 (= lt!261925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329964 () SeekEntryResult!5620)

(declare-fun e!329966 () SeekEntryResult!5620)

(assert (=> b!573546 (= e!329964 e!329966)))

(declare-fun b!573547 () Bool)

(declare-fun e!329965 () SeekEntryResult!5620)

(assert (=> b!573547 (= e!329965 e!329964)))

(declare-fun lt!261924 () SeekEntryResult!5620)

(assert (=> b!573547 (= lt!261925 (select (arr!17215 a!3118) (index!24709 lt!261924)))))

(declare-fun c!65733 () Bool)

(assert (=> b!573547 (= c!65733 (= lt!261925 k0!1914))))

(declare-fun d!84997 () Bool)

(declare-fun lt!261923 () SeekEntryResult!5620)

(assert (=> d!84997 (and (or ((_ is Undefined!5620) lt!261923) (not ((_ is Found!5620) lt!261923)) (and (bvsge (index!24708 lt!261923) #b00000000000000000000000000000000) (bvslt (index!24708 lt!261923) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261923) ((_ is Found!5620) lt!261923) (not ((_ is MissingZero!5620) lt!261923)) (and (bvsge (index!24707 lt!261923) #b00000000000000000000000000000000) (bvslt (index!24707 lt!261923) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261923) ((_ is Found!5620) lt!261923) ((_ is MissingZero!5620) lt!261923) (not ((_ is MissingVacant!5620) lt!261923)) (and (bvsge (index!24710 lt!261923) #b00000000000000000000000000000000) (bvslt (index!24710 lt!261923) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261923) (ite ((_ is Found!5620) lt!261923) (= (select (arr!17215 a!3118) (index!24708 lt!261923)) k0!1914) (ite ((_ is MissingZero!5620) lt!261923) (= (select (arr!17215 a!3118) (index!24707 lt!261923)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5620) lt!261923) (= (select (arr!17215 a!3118) (index!24710 lt!261923)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84997 (= lt!261923 e!329965)))

(declare-fun c!65731 () Bool)

(assert (=> d!84997 (= c!65731 (and ((_ is Intermediate!5620) lt!261924) (undefined!6432 lt!261924)))))

(assert (=> d!84997 (= lt!261924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84997 (validMask!0 mask!3119)))

(assert (=> d!84997 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!261923)))

(declare-fun b!573548 () Bool)

(assert (=> b!573548 (= e!329966 (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261924) (index!24709 lt!261924) (index!24709 lt!261924) k0!1914 a!3118 mask!3119))))

(declare-fun b!573549 () Bool)

(assert (=> b!573549 (= e!329966 (MissingZero!5620 (index!24709 lt!261924)))))

(declare-fun b!573550 () Bool)

(assert (=> b!573550 (= e!329965 Undefined!5620)))

(declare-fun b!573551 () Bool)

(assert (=> b!573551 (= e!329964 (Found!5620 (index!24709 lt!261924)))))

(assert (= (and d!84997 c!65731) b!573550))

(assert (= (and d!84997 (not c!65731)) b!573547))

(assert (= (and b!573547 c!65733) b!573551))

(assert (= (and b!573547 (not c!65733)) b!573546))

(assert (= (and b!573546 c!65732) b!573549))

(assert (= (and b!573546 (not c!65732)) b!573548))

(declare-fun m!552701 () Bool)

(assert (=> b!573547 m!552701))

(declare-fun m!552703 () Bool)

(assert (=> d!84997 m!552703))

(declare-fun m!552705 () Bool)

(assert (=> d!84997 m!552705))

(declare-fun m!552707 () Bool)

(assert (=> d!84997 m!552707))

(assert (=> d!84997 m!552703))

(assert (=> d!84997 m!552443))

(declare-fun m!552709 () Bool)

(assert (=> d!84997 m!552709))

(declare-fun m!552711 () Bool)

(assert (=> d!84997 m!552711))

(declare-fun m!552713 () Bool)

(assert (=> b!573548 m!552713))

(assert (=> b!573262 d!84997))

(declare-fun b!573562 () Bool)

(declare-fun c!65737 () Bool)

(declare-fun lt!261931 () (_ BitVec 64))

(assert (=> b!573562 (= c!65737 (= lt!261931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329975 () SeekEntryResult!5620)

(declare-fun e!329977 () SeekEntryResult!5620)

(assert (=> b!573562 (= e!329975 e!329977)))

(declare-fun b!573563 () Bool)

(declare-fun e!329976 () SeekEntryResult!5620)

(assert (=> b!573563 (= e!329976 e!329975)))

(declare-fun lt!261930 () SeekEntryResult!5620)

(assert (=> b!573563 (= lt!261931 (select (arr!17215 a!3118) (index!24709 lt!261930)))))

(declare-fun c!65738 () Bool)

(assert (=> b!573563 (= c!65738 (= lt!261931 (select (arr!17215 a!3118) j!142)))))

(declare-fun d!85011 () Bool)

(declare-fun lt!261929 () SeekEntryResult!5620)

(assert (=> d!85011 (and (or ((_ is Undefined!5620) lt!261929) (not ((_ is Found!5620) lt!261929)) (and (bvsge (index!24708 lt!261929) #b00000000000000000000000000000000) (bvslt (index!24708 lt!261929) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261929) ((_ is Found!5620) lt!261929) (not ((_ is MissingZero!5620) lt!261929)) (and (bvsge (index!24707 lt!261929) #b00000000000000000000000000000000) (bvslt (index!24707 lt!261929) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261929) ((_ is Found!5620) lt!261929) ((_ is MissingZero!5620) lt!261929) (not ((_ is MissingVacant!5620) lt!261929)) (and (bvsge (index!24710 lt!261929) #b00000000000000000000000000000000) (bvslt (index!24710 lt!261929) (size!17579 a!3118)))) (or ((_ is Undefined!5620) lt!261929) (ite ((_ is Found!5620) lt!261929) (= (select (arr!17215 a!3118) (index!24708 lt!261929)) (select (arr!17215 a!3118) j!142)) (ite ((_ is MissingZero!5620) lt!261929) (= (select (arr!17215 a!3118) (index!24707 lt!261929)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5620) lt!261929) (= (select (arr!17215 a!3118) (index!24710 lt!261929)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85011 (= lt!261929 e!329976)))

(declare-fun c!65736 () Bool)

(assert (=> d!85011 (= c!65736 (and ((_ is Intermediate!5620) lt!261930) (undefined!6432 lt!261930)))))

(assert (=> d!85011 (= lt!261930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17215 a!3118) j!142) mask!3119) (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85011 (validMask!0 mask!3119)))

(assert (=> d!85011 (= (seekEntryOrOpen!0 (select (arr!17215 a!3118) j!142) a!3118 mask!3119) lt!261929)))

(declare-fun b!573564 () Bool)

(assert (=> b!573564 (= e!329977 (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261930) (index!24709 lt!261930) (index!24709 lt!261930) (select (arr!17215 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573565 () Bool)

(assert (=> b!573565 (= e!329977 (MissingZero!5620 (index!24709 lt!261930)))))

(declare-fun b!573566 () Bool)

(assert (=> b!573566 (= e!329976 Undefined!5620)))

(declare-fun b!573567 () Bool)

(assert (=> b!573567 (= e!329975 (Found!5620 (index!24709 lt!261930)))))

(assert (= (and d!85011 c!65736) b!573566))

(assert (= (and d!85011 (not c!65736)) b!573563))

(assert (= (and b!573563 c!65738) b!573567))

(assert (= (and b!573563 (not c!65738)) b!573562))

(assert (= (and b!573562 c!65737) b!573565))

(assert (= (and b!573562 (not c!65737)) b!573564))

(declare-fun m!552717 () Bool)

(assert (=> b!573563 m!552717))

(assert (=> d!85011 m!552473))

(assert (=> d!85011 m!552449))

(declare-fun m!552719 () Bool)

(assert (=> d!85011 m!552719))

(declare-fun m!552721 () Bool)

(assert (=> d!85011 m!552721))

(assert (=> d!85011 m!552449))

(assert (=> d!85011 m!552473))

(assert (=> d!85011 m!552443))

(declare-fun m!552723 () Bool)

(assert (=> d!85011 m!552723))

(declare-fun m!552725 () Bool)

(assert (=> d!85011 m!552725))

(assert (=> b!573564 m!552449))

(declare-fun m!552727 () Bool)

(assert (=> b!573564 m!552727))

(assert (=> b!573251 d!85011))

(declare-fun b!573568 () Bool)

(declare-fun e!329978 () Bool)

(declare-fun call!32644 () Bool)

(assert (=> b!573568 (= e!329978 call!32644)))

(declare-fun b!573569 () Bool)

(declare-fun e!329979 () Bool)

(assert (=> b!573569 (= e!329979 call!32644)))

(declare-fun b!573570 () Bool)

(declare-fun e!329980 () Bool)

(assert (=> b!573570 (= e!329980 e!329978)))

(declare-fun c!65739 () Bool)

(assert (=> b!573570 (= c!65739 (validKeyInArray!0 (select (arr!17215 a!3118) j!142)))))

(declare-fun b!573571 () Bool)

(assert (=> b!573571 (= e!329978 e!329979)))

(declare-fun lt!261934 () (_ BitVec 64))

(assert (=> b!573571 (= lt!261934 (select (arr!17215 a!3118) j!142))))

(declare-fun lt!261932 () Unit!18013)

(assert (=> b!573571 (= lt!261932 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261934 j!142))))

(assert (=> b!573571 (arrayContainsKey!0 a!3118 lt!261934 #b00000000000000000000000000000000)))

(declare-fun lt!261933 () Unit!18013)

(assert (=> b!573571 (= lt!261933 lt!261932)))

(declare-fun res!362810 () Bool)

(assert (=> b!573571 (= res!362810 (= (seekEntryOrOpen!0 (select (arr!17215 a!3118) j!142) a!3118 mask!3119) (Found!5620 j!142)))))

(assert (=> b!573571 (=> (not res!362810) (not e!329979))))

(declare-fun bm!32641 () Bool)

(assert (=> bm!32641 (= call!32644 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85015 () Bool)

(declare-fun res!362811 () Bool)

(assert (=> d!85015 (=> res!362811 e!329980)))

(assert (=> d!85015 (= res!362811 (bvsge j!142 (size!17579 a!3118)))))

(assert (=> d!85015 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329980)))

(assert (= (and d!85015 (not res!362811)) b!573570))

(assert (= (and b!573570 c!65739) b!573571))

(assert (= (and b!573570 (not c!65739)) b!573568))

(assert (= (and b!573571 res!362810) b!573569))

(assert (= (or b!573569 b!573568) bm!32641))

(assert (=> b!573570 m!552449))

(assert (=> b!573570 m!552449))

(assert (=> b!573570 m!552465))

(assert (=> b!573571 m!552449))

(declare-fun m!552729 () Bool)

(assert (=> b!573571 m!552729))

(declare-fun m!552731 () Bool)

(assert (=> b!573571 m!552731))

(assert (=> b!573571 m!552449))

(assert (=> b!573571 m!552461))

(declare-fun m!552733 () Bool)

(assert (=> bm!32641 m!552733))

(assert (=> b!573251 d!85015))

(declare-fun d!85017 () Bool)

(assert (=> d!85017 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261940 () Unit!18013)

(declare-fun choose!38 (array!35856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18013)

(assert (=> d!85017 (= lt!261940 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85017 (validMask!0 mask!3119)))

(assert (=> d!85017 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261940)))

(declare-fun bs!17776 () Bool)

(assert (= bs!17776 d!85017))

(assert (=> bs!17776 m!552457))

(declare-fun m!552749 () Bool)

(assert (=> bs!17776 m!552749))

(assert (=> bs!17776 m!552443))

(assert (=> b!573251 d!85017))

(declare-fun d!85023 () Bool)

(assert (=> d!85023 (= (validKeyInArray!0 (select (arr!17215 a!3118) j!142)) (and (not (= (select (arr!17215 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17215 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573250 d!85023))

(declare-fun b!573581 () Bool)

(declare-fun c!65743 () Bool)

(declare-fun lt!261943 () (_ BitVec 64))

(assert (=> b!573581 (= c!65743 (= lt!261943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329988 () SeekEntryResult!5620)

(declare-fun e!329990 () SeekEntryResult!5620)

(assert (=> b!573581 (= e!329988 e!329990)))

(declare-fun b!573582 () Bool)

(declare-fun e!329989 () SeekEntryResult!5620)

(assert (=> b!573582 (= e!329989 e!329988)))

(declare-fun lt!261942 () SeekEntryResult!5620)

(assert (=> b!573582 (= lt!261943 (select (arr!17215 lt!261773) (index!24709 lt!261942)))))

(declare-fun c!65744 () Bool)

(assert (=> b!573582 (= c!65744 (= lt!261943 lt!261777))))

(declare-fun d!85025 () Bool)

(declare-fun lt!261941 () SeekEntryResult!5620)

(assert (=> d!85025 (and (or ((_ is Undefined!5620) lt!261941) (not ((_ is Found!5620) lt!261941)) (and (bvsge (index!24708 lt!261941) #b00000000000000000000000000000000) (bvslt (index!24708 lt!261941) (size!17579 lt!261773)))) (or ((_ is Undefined!5620) lt!261941) ((_ is Found!5620) lt!261941) (not ((_ is MissingZero!5620) lt!261941)) (and (bvsge (index!24707 lt!261941) #b00000000000000000000000000000000) (bvslt (index!24707 lt!261941) (size!17579 lt!261773)))) (or ((_ is Undefined!5620) lt!261941) ((_ is Found!5620) lt!261941) ((_ is MissingZero!5620) lt!261941) (not ((_ is MissingVacant!5620) lt!261941)) (and (bvsge (index!24710 lt!261941) #b00000000000000000000000000000000) (bvslt (index!24710 lt!261941) (size!17579 lt!261773)))) (or ((_ is Undefined!5620) lt!261941) (ite ((_ is Found!5620) lt!261941) (= (select (arr!17215 lt!261773) (index!24708 lt!261941)) lt!261777) (ite ((_ is MissingZero!5620) lt!261941) (= (select (arr!17215 lt!261773) (index!24707 lt!261941)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5620) lt!261941) (= (select (arr!17215 lt!261773) (index!24710 lt!261941)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85025 (= lt!261941 e!329989)))

(declare-fun c!65742 () Bool)

(assert (=> d!85025 (= c!65742 (and ((_ is Intermediate!5620) lt!261942) (undefined!6432 lt!261942)))))

(assert (=> d!85025 (= lt!261942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261777 mask!3119) lt!261777 lt!261773 mask!3119))))

(assert (=> d!85025 (validMask!0 mask!3119)))

(assert (=> d!85025 (= (seekEntryOrOpen!0 lt!261777 lt!261773 mask!3119) lt!261941)))

(declare-fun b!573583 () Bool)

(assert (=> b!573583 (= e!329990 (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261942) (index!24709 lt!261942) (index!24709 lt!261942) lt!261777 lt!261773 mask!3119))))

(declare-fun b!573584 () Bool)

(assert (=> b!573584 (= e!329990 (MissingZero!5620 (index!24709 lt!261942)))))

(declare-fun b!573585 () Bool)

(assert (=> b!573585 (= e!329989 Undefined!5620)))

(declare-fun b!573586 () Bool)

(assert (=> b!573586 (= e!329988 (Found!5620 (index!24709 lt!261942)))))

(assert (= (and d!85025 c!65742) b!573585))

(assert (= (and d!85025 (not c!65742)) b!573582))

(assert (= (and b!573582 c!65744) b!573586))

(assert (= (and b!573582 (not c!65744)) b!573581))

(assert (= (and b!573581 c!65743) b!573584))

(assert (= (and b!573581 (not c!65743)) b!573583))

(declare-fun m!552751 () Bool)

(assert (=> b!573582 m!552751))

(assert (=> d!85025 m!552475))

(declare-fun m!552753 () Bool)

(assert (=> d!85025 m!552753))

(declare-fun m!552755 () Bool)

(assert (=> d!85025 m!552755))

(assert (=> d!85025 m!552475))

(assert (=> d!85025 m!552443))

(declare-fun m!552757 () Bool)

(assert (=> d!85025 m!552757))

(declare-fun m!552759 () Bool)

(assert (=> d!85025 m!552759))

(declare-fun m!552761 () Bool)

(assert (=> b!573583 m!552761))

(assert (=> b!573255 d!85025))

(declare-fun b!573587 () Bool)

(declare-fun e!329992 () SeekEntryResult!5620)

(assert (=> b!573587 (= e!329992 (MissingVacant!5620 (index!24709 lt!261771)))))

(declare-fun d!85027 () Bool)

(declare-fun lt!261944 () SeekEntryResult!5620)

(assert (=> d!85027 (and (or ((_ is Undefined!5620) lt!261944) (not ((_ is Found!5620) lt!261944)) (and (bvsge (index!24708 lt!261944) #b00000000000000000000000000000000) (bvslt (index!24708 lt!261944) (size!17579 lt!261773)))) (or ((_ is Undefined!5620) lt!261944) ((_ is Found!5620) lt!261944) (not ((_ is MissingVacant!5620) lt!261944)) (not (= (index!24710 lt!261944) (index!24709 lt!261771))) (and (bvsge (index!24710 lt!261944) #b00000000000000000000000000000000) (bvslt (index!24710 lt!261944) (size!17579 lt!261773)))) (or ((_ is Undefined!5620) lt!261944) (ite ((_ is Found!5620) lt!261944) (= (select (arr!17215 lt!261773) (index!24708 lt!261944)) lt!261777) (and ((_ is MissingVacant!5620) lt!261944) (= (index!24710 lt!261944) (index!24709 lt!261771)) (= (select (arr!17215 lt!261773) (index!24710 lt!261944)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!329993 () SeekEntryResult!5620)

(assert (=> d!85027 (= lt!261944 e!329993)))

(declare-fun c!65745 () Bool)

(assert (=> d!85027 (= c!65745 (bvsge (x!53724 lt!261771) #b01111111111111111111111111111110))))

(declare-fun lt!261945 () (_ BitVec 64))

(assert (=> d!85027 (= lt!261945 (select (arr!17215 lt!261773) (index!24709 lt!261771)))))

(assert (=> d!85027 (validMask!0 mask!3119)))

(assert (=> d!85027 (= (seekKeyOrZeroReturnVacant!0 (x!53724 lt!261771) (index!24709 lt!261771) (index!24709 lt!261771) lt!261777 lt!261773 mask!3119) lt!261944)))

(declare-fun b!573588 () Bool)

(declare-fun e!329991 () SeekEntryResult!5620)

(assert (=> b!573588 (= e!329991 (Found!5620 (index!24709 lt!261771)))))

(declare-fun b!573589 () Bool)

(assert (=> b!573589 (= e!329992 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53724 lt!261771) #b00000000000000000000000000000001) (nextIndex!0 (index!24709 lt!261771) (bvadd (x!53724 lt!261771) #b00000000000000000000000000000001) mask!3119) (index!24709 lt!261771) lt!261777 lt!261773 mask!3119))))

(declare-fun b!573590 () Bool)

(declare-fun c!65747 () Bool)

(assert (=> b!573590 (= c!65747 (= lt!261945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573590 (= e!329991 e!329992)))

(declare-fun b!573591 () Bool)

(assert (=> b!573591 (= e!329993 e!329991)))

(declare-fun c!65746 () Bool)

(assert (=> b!573591 (= c!65746 (= lt!261945 lt!261777))))

(declare-fun b!573592 () Bool)

(assert (=> b!573592 (= e!329993 Undefined!5620)))

(assert (= (and d!85027 c!65745) b!573592))

(assert (= (and d!85027 (not c!65745)) b!573591))

(assert (= (and b!573591 c!65746) b!573588))

(assert (= (and b!573591 (not c!65746)) b!573590))

(assert (= (and b!573590 c!65747) b!573587))

(assert (= (and b!573590 (not c!65747)) b!573589))

(declare-fun m!552763 () Bool)

(assert (=> d!85027 m!552763))

(declare-fun m!552765 () Bool)

(assert (=> d!85027 m!552765))

(declare-fun m!552767 () Bool)

(assert (=> d!85027 m!552767))

(assert (=> d!85027 m!552443))

(assert (=> b!573589 m!552595))

(assert (=> b!573589 m!552595))

(declare-fun m!552769 () Bool)

(assert (=> b!573589 m!552769))

(assert (=> b!573255 d!85027))

(check-sat (not b!573571) (not bm!32641) (not bm!32634) (not b!573447) (not d!85027) (not b!573548) (not b!573376) (not b!573449) (not b!573367) (not d!84997) (not bm!32631) (not b!573493) (not b!573450) (not b!573492) (not d!85025) (not d!85011) (not d!84959) (not b!573391) (not d!85017) (not b!573583) (not b!573424) (not d!84961) (not b!573570) (not b!573564) (not d!84969) (not b!573589))
(check-sat)
