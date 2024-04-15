; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31296 () Bool)

(assert start!31296)

(declare-fun b!313750 () Bool)

(declare-fun res!169793 () Bool)

(declare-fun e!195485 () Bool)

(assert (=> b!313750 (=> (not res!169793) (not e!195485))))

(declare-datatypes ((array!16016 0))(
  ( (array!16017 (arr!7584 (Array (_ BitVec 32) (_ BitVec 64))) (size!7937 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16016)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313750 (= res!169793 (and (= (size!7937 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7937 a!3293))))))

(declare-fun b!313751 () Bool)

(declare-fun res!169786 () Bool)

(declare-fun e!195484 () Bool)

(assert (=> b!313751 (=> (not res!169786) (not e!195484))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!313751 (= res!169786 (and (= (select (arr!7584 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7937 a!3293))))))

(declare-fun b!313752 () Bool)

(declare-fun res!169791 () Bool)

(assert (=> b!313752 (=> (not res!169791) (not e!195485))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2723 0))(
  ( (MissingZero!2723 (index!13068 (_ BitVec 32))) (Found!2723 (index!13069 (_ BitVec 32))) (Intermediate!2723 (undefined!3535 Bool) (index!13070 (_ BitVec 32)) (x!31310 (_ BitVec 32))) (Undefined!2723) (MissingVacant!2723 (index!13071 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2723)

(assert (=> b!313752 (= res!169791 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2723 i!1240)))))

(declare-fun b!313753 () Bool)

(assert (=> b!313753 (= e!195484 (bvslt (bvsub #b01111111111111111111111111111110 x!1427) #b00000000000000000000000000000000))))

(declare-fun b!313754 () Bool)

(assert (=> b!313754 (= e!195485 e!195484)))

(declare-fun res!169792 () Bool)

(assert (=> b!313754 (=> (not res!169792) (not e!195484))))

(declare-fun lt!153551 () SeekEntryResult!2723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313754 (= res!169792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153551))))

(assert (=> b!313754 (= lt!153551 (Intermediate!2723 false resIndex!52 resX!52))))

(declare-fun b!313755 () Bool)

(declare-fun res!169794 () Bool)

(assert (=> b!313755 (=> (not res!169794) (not e!195484))))

(assert (=> b!313755 (= res!169794 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153551))))

(declare-fun b!313756 () Bool)

(declare-fun res!169787 () Bool)

(assert (=> b!313756 (=> (not res!169787) (not e!195485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16016 (_ BitVec 32)) Bool)

(assert (=> b!313756 (= res!169787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313757 () Bool)

(declare-fun res!169790 () Bool)

(assert (=> b!313757 (=> (not res!169790) (not e!195485))))

(declare-fun arrayContainsKey!0 (array!16016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313757 (= res!169790 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313758 () Bool)

(declare-fun res!169788 () Bool)

(assert (=> b!313758 (=> (not res!169788) (not e!195485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313758 (= res!169788 (validKeyInArray!0 k0!2441))))

(declare-fun res!169789 () Bool)

(assert (=> start!31296 (=> (not res!169789) (not e!195485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31296 (= res!169789 (validMask!0 mask!3709))))

(assert (=> start!31296 e!195485))

(declare-fun array_inv!5556 (array!16016) Bool)

(assert (=> start!31296 (array_inv!5556 a!3293)))

(assert (=> start!31296 true))

(assert (= (and start!31296 res!169789) b!313750))

(assert (= (and b!313750 res!169793) b!313758))

(assert (= (and b!313758 res!169788) b!313757))

(assert (= (and b!313757 res!169790) b!313752))

(assert (= (and b!313752 res!169791) b!313756))

(assert (= (and b!313756 res!169787) b!313754))

(assert (= (and b!313754 res!169792) b!313751))

(assert (= (and b!313751 res!169786) b!313755))

(assert (= (and b!313755 res!169794) b!313753))

(declare-fun m!322987 () Bool)

(assert (=> b!313758 m!322987))

(declare-fun m!322989 () Bool)

(assert (=> b!313757 m!322989))

(declare-fun m!322991 () Bool)

(assert (=> b!313756 m!322991))

(declare-fun m!322993 () Bool)

(assert (=> b!313751 m!322993))

(declare-fun m!322995 () Bool)

(assert (=> start!31296 m!322995))

(declare-fun m!322997 () Bool)

(assert (=> start!31296 m!322997))

(declare-fun m!322999 () Bool)

(assert (=> b!313752 m!322999))

(declare-fun m!323001 () Bool)

(assert (=> b!313755 m!323001))

(declare-fun m!323003 () Bool)

(assert (=> b!313754 m!323003))

(assert (=> b!313754 m!323003))

(declare-fun m!323005 () Bool)

(assert (=> b!313754 m!323005))

(check-sat (not start!31296) (not b!313757) (not b!313754) (not b!313752) (not b!313758) (not b!313756) (not b!313755))
(check-sat)
(get-model)

(declare-fun b!313831 () Bool)

(declare-fun e!195515 () SeekEntryResult!2723)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313831 (= e!195515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68503 () Bool)

(declare-fun e!195517 () Bool)

(assert (=> d!68503 e!195517))

(declare-fun c!49599 () Bool)

(declare-fun lt!153563 () SeekEntryResult!2723)

(get-info :version)

(assert (=> d!68503 (= c!49599 (and ((_ is Intermediate!2723) lt!153563) (undefined!3535 lt!153563)))))

(declare-fun e!195518 () SeekEntryResult!2723)

(assert (=> d!68503 (= lt!153563 e!195518)))

(declare-fun c!49600 () Bool)

(assert (=> d!68503 (= c!49600 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153562 () (_ BitVec 64))

(assert (=> d!68503 (= lt!153562 (select (arr!7584 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68503 (validMask!0 mask!3709)))

(assert (=> d!68503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153563)))

(declare-fun b!313832 () Bool)

(assert (=> b!313832 (and (bvsge (index!13070 lt!153563) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153563) (size!7937 a!3293)))))

(declare-fun e!195516 () Bool)

(assert (=> b!313832 (= e!195516 (= (select (arr!7584 a!3293) (index!13070 lt!153563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313833 () Bool)

(assert (=> b!313833 (= e!195518 (Intermediate!2723 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313834 () Bool)

(declare-fun e!195514 () Bool)

(assert (=> b!313834 (= e!195517 e!195514)))

(declare-fun res!169856 () Bool)

(assert (=> b!313834 (= res!169856 (and ((_ is Intermediate!2723) lt!153563) (not (undefined!3535 lt!153563)) (bvslt (x!31310 lt!153563) #b01111111111111111111111111111110) (bvsge (x!31310 lt!153563) #b00000000000000000000000000000000) (bvsge (x!31310 lt!153563) #b00000000000000000000000000000000)))))

(assert (=> b!313834 (=> (not res!169856) (not e!195514))))

(declare-fun b!313835 () Bool)

(assert (=> b!313835 (and (bvsge (index!13070 lt!153563) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153563) (size!7937 a!3293)))))

(declare-fun res!169857 () Bool)

(assert (=> b!313835 (= res!169857 (= (select (arr!7584 a!3293) (index!13070 lt!153563)) k0!2441))))

(assert (=> b!313835 (=> res!169857 e!195516)))

(assert (=> b!313835 (= e!195514 e!195516)))

(declare-fun b!313836 () Bool)

(assert (=> b!313836 (and (bvsge (index!13070 lt!153563) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153563) (size!7937 a!3293)))))

(declare-fun res!169855 () Bool)

(assert (=> b!313836 (= res!169855 (= (select (arr!7584 a!3293) (index!13070 lt!153563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313836 (=> res!169855 e!195516)))

(declare-fun b!313837 () Bool)

(assert (=> b!313837 (= e!195515 (Intermediate!2723 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313838 () Bool)

(assert (=> b!313838 (= e!195518 e!195515)))

(declare-fun c!49601 () Bool)

(assert (=> b!313838 (= c!49601 (or (= lt!153562 k0!2441) (= (bvadd lt!153562 lt!153562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313839 () Bool)

(assert (=> b!313839 (= e!195517 (bvsge (x!31310 lt!153563) #b01111111111111111111111111111110))))

(assert (= (and d!68503 c!49600) b!313833))

(assert (= (and d!68503 (not c!49600)) b!313838))

(assert (= (and b!313838 c!49601) b!313837))

(assert (= (and b!313838 (not c!49601)) b!313831))

(assert (= (and d!68503 c!49599) b!313839))

(assert (= (and d!68503 (not c!49599)) b!313834))

(assert (= (and b!313834 res!169856) b!313835))

(assert (= (and b!313835 (not res!169857)) b!313836))

(assert (= (and b!313836 (not res!169855)) b!313832))

(declare-fun m!323047 () Bool)

(assert (=> b!313835 m!323047))

(assert (=> b!313832 m!323047))

(assert (=> d!68503 m!323003))

(declare-fun m!323049 () Bool)

(assert (=> d!68503 m!323049))

(assert (=> d!68503 m!322995))

(assert (=> b!313836 m!323047))

(assert (=> b!313831 m!323003))

(declare-fun m!323051 () Bool)

(assert (=> b!313831 m!323051))

(assert (=> b!313831 m!323051))

(declare-fun m!323053 () Bool)

(assert (=> b!313831 m!323053))

(assert (=> b!313754 d!68503))

(declare-fun d!68511 () Bool)

(declare-fun lt!153578 () (_ BitVec 32))

(declare-fun lt!153577 () (_ BitVec 32))

(assert (=> d!68511 (= lt!153578 (bvmul (bvxor lt!153577 (bvlshr lt!153577 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68511 (= lt!153577 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68511 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169858 (let ((h!5326 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31314 (bvmul (bvxor h!5326 (bvlshr h!5326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31314 (bvlshr x!31314 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169858 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169858 #b00000000000000000000000000000000))))))

(assert (=> d!68511 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153578 (bvlshr lt!153578 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313754 d!68511))

(declare-fun b!313872 () Bool)

(declare-fun e!195541 () Bool)

(declare-fun e!195542 () Bool)

(assert (=> b!313872 (= e!195541 e!195542)))

(declare-fun c!49613 () Bool)

(assert (=> b!313872 (= c!49613 (validKeyInArray!0 (select (arr!7584 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313873 () Bool)

(declare-fun e!195540 () Bool)

(assert (=> b!313873 (= e!195542 e!195540)))

(declare-fun lt!153587 () (_ BitVec 64))

(assert (=> b!313873 (= lt!153587 (select (arr!7584 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9649 0))(
  ( (Unit!9650) )
))
(declare-fun lt!153585 () Unit!9649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16016 (_ BitVec 64) (_ BitVec 32)) Unit!9649)

(assert (=> b!313873 (= lt!153585 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153587 #b00000000000000000000000000000000))))

(assert (=> b!313873 (arrayContainsKey!0 a!3293 lt!153587 #b00000000000000000000000000000000)))

(declare-fun lt!153586 () Unit!9649)

(assert (=> b!313873 (= lt!153586 lt!153585)))

(declare-fun res!169870 () Bool)

(assert (=> b!313873 (= res!169870 (= (seekEntryOrOpen!0 (select (arr!7584 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2723 #b00000000000000000000000000000000)))))

(assert (=> b!313873 (=> (not res!169870) (not e!195540))))

(declare-fun d!68515 () Bool)

(declare-fun res!169869 () Bool)

(assert (=> d!68515 (=> res!169869 e!195541)))

(assert (=> d!68515 (= res!169869 (bvsge #b00000000000000000000000000000000 (size!7937 a!3293)))))

(assert (=> d!68515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195541)))

(declare-fun bm!25937 () Bool)

(declare-fun call!25940 () Bool)

(assert (=> bm!25937 (= call!25940 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313874 () Bool)

(assert (=> b!313874 (= e!195540 call!25940)))

(declare-fun b!313875 () Bool)

(assert (=> b!313875 (= e!195542 call!25940)))

(assert (= (and d!68515 (not res!169869)) b!313872))

(assert (= (and b!313872 c!49613) b!313873))

(assert (= (and b!313872 (not c!49613)) b!313875))

(assert (= (and b!313873 res!169870) b!313874))

(assert (= (or b!313874 b!313875) bm!25937))

(declare-fun m!323069 () Bool)

(assert (=> b!313872 m!323069))

(assert (=> b!313872 m!323069))

(declare-fun m!323071 () Bool)

(assert (=> b!313872 m!323071))

(assert (=> b!313873 m!323069))

(declare-fun m!323073 () Bool)

(assert (=> b!313873 m!323073))

(declare-fun m!323075 () Bool)

(assert (=> b!313873 m!323075))

(assert (=> b!313873 m!323069))

(declare-fun m!323077 () Bool)

(assert (=> b!313873 m!323077))

(declare-fun m!323079 () Bool)

(assert (=> bm!25937 m!323079))

(assert (=> b!313756 d!68515))

(declare-fun d!68523 () Bool)

(assert (=> d!68523 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31296 d!68523))

(declare-fun d!68527 () Bool)

(assert (=> d!68527 (= (array_inv!5556 a!3293) (bvsge (size!7937 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31296 d!68527))

(declare-fun b!313930 () Bool)

(declare-fun e!195574 () SeekEntryResult!2723)

(assert (=> b!313930 (= e!195574 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68529 () Bool)

(declare-fun e!195576 () Bool)

(assert (=> d!68529 e!195576))

(declare-fun c!49632 () Bool)

(declare-fun lt!153601 () SeekEntryResult!2723)

(assert (=> d!68529 (= c!49632 (and ((_ is Intermediate!2723) lt!153601) (undefined!3535 lt!153601)))))

(declare-fun e!195577 () SeekEntryResult!2723)

(assert (=> d!68529 (= lt!153601 e!195577)))

(declare-fun c!49633 () Bool)

(assert (=> d!68529 (= c!49633 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153600 () (_ BitVec 64))

(assert (=> d!68529 (= lt!153600 (select (arr!7584 a!3293) index!1781))))

(assert (=> d!68529 (validMask!0 mask!3709)))

(assert (=> d!68529 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153601)))

(declare-fun b!313931 () Bool)

(assert (=> b!313931 (and (bvsge (index!13070 lt!153601) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153601) (size!7937 a!3293)))))

(declare-fun e!195575 () Bool)

(assert (=> b!313931 (= e!195575 (= (select (arr!7584 a!3293) (index!13070 lt!153601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313932 () Bool)

(assert (=> b!313932 (= e!195577 (Intermediate!2723 true index!1781 x!1427))))

(declare-fun b!313933 () Bool)

(declare-fun e!195573 () Bool)

(assert (=> b!313933 (= e!195576 e!195573)))

(declare-fun res!169890 () Bool)

(assert (=> b!313933 (= res!169890 (and ((_ is Intermediate!2723) lt!153601) (not (undefined!3535 lt!153601)) (bvslt (x!31310 lt!153601) #b01111111111111111111111111111110) (bvsge (x!31310 lt!153601) #b00000000000000000000000000000000) (bvsge (x!31310 lt!153601) x!1427)))))

(assert (=> b!313933 (=> (not res!169890) (not e!195573))))

(declare-fun b!313934 () Bool)

(assert (=> b!313934 (and (bvsge (index!13070 lt!153601) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153601) (size!7937 a!3293)))))

(declare-fun res!169891 () Bool)

(assert (=> b!313934 (= res!169891 (= (select (arr!7584 a!3293) (index!13070 lt!153601)) k0!2441))))

(assert (=> b!313934 (=> res!169891 e!195575)))

(assert (=> b!313934 (= e!195573 e!195575)))

(declare-fun b!313935 () Bool)

(assert (=> b!313935 (and (bvsge (index!13070 lt!153601) #b00000000000000000000000000000000) (bvslt (index!13070 lt!153601) (size!7937 a!3293)))))

(declare-fun res!169889 () Bool)

(assert (=> b!313935 (= res!169889 (= (select (arr!7584 a!3293) (index!13070 lt!153601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313935 (=> res!169889 e!195575)))

(declare-fun b!313936 () Bool)

(assert (=> b!313936 (= e!195574 (Intermediate!2723 false index!1781 x!1427))))

(declare-fun b!313937 () Bool)

(assert (=> b!313937 (= e!195577 e!195574)))

(declare-fun c!49634 () Bool)

(assert (=> b!313937 (= c!49634 (or (= lt!153600 k0!2441) (= (bvadd lt!153600 lt!153600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313938 () Bool)

(assert (=> b!313938 (= e!195576 (bvsge (x!31310 lt!153601) #b01111111111111111111111111111110))))

(assert (= (and d!68529 c!49633) b!313932))

(assert (= (and d!68529 (not c!49633)) b!313937))

(assert (= (and b!313937 c!49634) b!313936))

(assert (= (and b!313937 (not c!49634)) b!313930))

(assert (= (and d!68529 c!49632) b!313938))

(assert (= (and d!68529 (not c!49632)) b!313933))

(assert (= (and b!313933 res!169890) b!313934))

(assert (= (and b!313934 (not res!169891)) b!313935))

(assert (= (and b!313935 (not res!169889)) b!313931))

(declare-fun m!323097 () Bool)

(assert (=> b!313934 m!323097))

(assert (=> b!313931 m!323097))

(declare-fun m!323099 () Bool)

(assert (=> d!68529 m!323099))

(assert (=> d!68529 m!322995))

(assert (=> b!313935 m!323097))

(declare-fun m!323101 () Bool)

(assert (=> b!313930 m!323101))

(assert (=> b!313930 m!323101))

(declare-fun m!323103 () Bool)

(assert (=> b!313930 m!323103))

(assert (=> b!313755 d!68529))

(declare-fun d!68537 () Bool)

(declare-fun res!169900 () Bool)

(declare-fun e!195587 () Bool)

(assert (=> d!68537 (=> res!169900 e!195587)))

(assert (=> d!68537 (= res!169900 (= (select (arr!7584 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68537 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195587)))

(declare-fun b!313952 () Bool)

(declare-fun e!195588 () Bool)

(assert (=> b!313952 (= e!195587 e!195588)))

(declare-fun res!169901 () Bool)

(assert (=> b!313952 (=> (not res!169901) (not e!195588))))

(assert (=> b!313952 (= res!169901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7937 a!3293)))))

(declare-fun b!313953 () Bool)

(assert (=> b!313953 (= e!195588 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68537 (not res!169900)) b!313952))

(assert (= (and b!313952 res!169901) b!313953))

(assert (=> d!68537 m!323069))

(declare-fun m!323113 () Bool)

(assert (=> b!313953 m!323113))

(assert (=> b!313757 d!68537))

(declare-fun b!313990 () Bool)

(declare-fun lt!153636 () SeekEntryResult!2723)

(declare-fun e!195614 () SeekEntryResult!2723)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2723)

(assert (=> b!313990 (= e!195614 (seekKeyOrZeroReturnVacant!0 (x!31310 lt!153636) (index!13070 lt!153636) (index!13070 lt!153636) k0!2441 a!3293 mask!3709))))

(declare-fun d!68541 () Bool)

(declare-fun lt!153635 () SeekEntryResult!2723)

(assert (=> d!68541 (and (or ((_ is Undefined!2723) lt!153635) (not ((_ is Found!2723) lt!153635)) (and (bvsge (index!13069 lt!153635) #b00000000000000000000000000000000) (bvslt (index!13069 lt!153635) (size!7937 a!3293)))) (or ((_ is Undefined!2723) lt!153635) ((_ is Found!2723) lt!153635) (not ((_ is MissingZero!2723) lt!153635)) (and (bvsge (index!13068 lt!153635) #b00000000000000000000000000000000) (bvslt (index!13068 lt!153635) (size!7937 a!3293)))) (or ((_ is Undefined!2723) lt!153635) ((_ is Found!2723) lt!153635) ((_ is MissingZero!2723) lt!153635) (not ((_ is MissingVacant!2723) lt!153635)) (and (bvsge (index!13071 lt!153635) #b00000000000000000000000000000000) (bvslt (index!13071 lt!153635) (size!7937 a!3293)))) (or ((_ is Undefined!2723) lt!153635) (ite ((_ is Found!2723) lt!153635) (= (select (arr!7584 a!3293) (index!13069 lt!153635)) k0!2441) (ite ((_ is MissingZero!2723) lt!153635) (= (select (arr!7584 a!3293) (index!13068 lt!153635)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2723) lt!153635) (= (select (arr!7584 a!3293) (index!13071 lt!153635)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195615 () SeekEntryResult!2723)

(assert (=> d!68541 (= lt!153635 e!195615)))

(declare-fun c!49652 () Bool)

(assert (=> d!68541 (= c!49652 (and ((_ is Intermediate!2723) lt!153636) (undefined!3535 lt!153636)))))

(assert (=> d!68541 (= lt!153636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68541 (validMask!0 mask!3709)))

(assert (=> d!68541 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153635)))

(declare-fun b!313991 () Bool)

(assert (=> b!313991 (= e!195614 (MissingZero!2723 (index!13070 lt!153636)))))

(declare-fun b!313992 () Bool)

(assert (=> b!313992 (= e!195615 Undefined!2723)))

(declare-fun b!313993 () Bool)

(declare-fun e!195613 () SeekEntryResult!2723)

(assert (=> b!313993 (= e!195615 e!195613)))

(declare-fun lt!153634 () (_ BitVec 64))

(assert (=> b!313993 (= lt!153634 (select (arr!7584 a!3293) (index!13070 lt!153636)))))

(declare-fun c!49651 () Bool)

(assert (=> b!313993 (= c!49651 (= lt!153634 k0!2441))))

(declare-fun b!313994 () Bool)

(assert (=> b!313994 (= e!195613 (Found!2723 (index!13070 lt!153636)))))

(declare-fun b!313995 () Bool)

(declare-fun c!49650 () Bool)

(assert (=> b!313995 (= c!49650 (= lt!153634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313995 (= e!195613 e!195614)))

(assert (= (and d!68541 c!49652) b!313992))

(assert (= (and d!68541 (not c!49652)) b!313993))

(assert (= (and b!313993 c!49651) b!313994))

(assert (= (and b!313993 (not c!49651)) b!313995))

(assert (= (and b!313995 c!49650) b!313991))

(assert (= (and b!313995 (not c!49650)) b!313990))

(declare-fun m!323137 () Bool)

(assert (=> b!313990 m!323137))

(declare-fun m!323139 () Bool)

(assert (=> d!68541 m!323139))

(declare-fun m!323141 () Bool)

(assert (=> d!68541 m!323141))

(assert (=> d!68541 m!323003))

(declare-fun m!323143 () Bool)

(assert (=> d!68541 m!323143))

(assert (=> d!68541 m!322995))

(assert (=> d!68541 m!323003))

(assert (=> d!68541 m!323005))

(declare-fun m!323145 () Bool)

(assert (=> b!313993 m!323145))

(assert (=> b!313752 d!68541))

(declare-fun d!68547 () Bool)

(assert (=> d!68547 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313758 d!68547))

(check-sat (not d!68541) (not b!313953) (not b!313872) (not b!313831) (not bm!25937) (not b!313873) (not b!313990) (not b!313930) (not d!68503) (not d!68529))
(check-sat)
