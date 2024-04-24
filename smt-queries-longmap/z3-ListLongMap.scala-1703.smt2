; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31242 () Bool)

(assert start!31242)

(declare-fun res!169780 () Bool)

(declare-fun e!195488 () Bool)

(assert (=> start!31242 (=> (not res!169780) (not e!195488))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31242 (= res!169780 (validMask!0 mask!3709))))

(assert (=> start!31242 e!195488))

(declare-datatypes ((array!16016 0))(
  ( (array!16017 (arr!7585 (Array (_ BitVec 32) (_ BitVec 64))) (size!7937 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16016)

(declare-fun array_inv!5535 (array!16016) Bool)

(assert (=> start!31242 (array_inv!5535 a!3293)))

(assert (=> start!31242 true))

(declare-fun b!313716 () Bool)

(declare-fun res!169783 () Bool)

(assert (=> b!313716 (=> (not res!169783) (not e!195488))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313716 (= res!169783 (validKeyInArray!0 k0!2441))))

(declare-fun b!313717 () Bool)

(declare-fun res!169781 () Bool)

(assert (=> b!313717 (=> (not res!169781) (not e!195488))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2690 0))(
  ( (MissingZero!2690 (index!12936 (_ BitVec 32))) (Found!2690 (index!12937 (_ BitVec 32))) (Intermediate!2690 (undefined!3502 Bool) (index!12938 (_ BitVec 32)) (x!31265 (_ BitVec 32))) (Undefined!2690) (MissingVacant!2690 (index!12939 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2690)

(assert (=> b!313717 (= res!169781 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2690 i!1240)))))

(declare-fun b!313718 () Bool)

(declare-fun res!169784 () Bool)

(assert (=> b!313718 (=> (not res!169784) (not e!195488))))

(declare-fun arrayContainsKey!0 (array!16016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313718 (= res!169784 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313719 () Bool)

(declare-fun res!169779 () Bool)

(assert (=> b!313719 (=> (not res!169779) (not e!195488))))

(assert (=> b!313719 (= res!169779 (and (= (size!7937 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7937 a!3293))))))

(declare-fun b!313720 () Bool)

(declare-fun res!169782 () Bool)

(assert (=> b!313720 (=> (not res!169782) (not e!195488))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313720 (= res!169782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2690 false resIndex!52 resX!52)))))

(declare-fun b!313721 () Bool)

(declare-fun res!169785 () Bool)

(assert (=> b!313721 (=> (not res!169785) (not e!195488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16016 (_ BitVec 32)) Bool)

(assert (=> b!313721 (= res!169785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313722 () Bool)

(assert (=> b!313722 (= e!195488 (or (bvslt resIndex!52 #b00000000000000000000000000000000) (bvsge resIndex!52 (size!7937 a!3293))))))

(assert (= (and start!31242 res!169780) b!313719))

(assert (= (and b!313719 res!169779) b!313716))

(assert (= (and b!313716 res!169783) b!313718))

(assert (= (and b!313718 res!169784) b!313717))

(assert (= (and b!313717 res!169781) b!313721))

(assert (= (and b!313721 res!169785) b!313720))

(assert (= (and b!313720 res!169782) b!313722))

(declare-fun m!323713 () Bool)

(assert (=> b!313718 m!323713))

(declare-fun m!323715 () Bool)

(assert (=> b!313721 m!323715))

(declare-fun m!323717 () Bool)

(assert (=> start!31242 m!323717))

(declare-fun m!323719 () Bool)

(assert (=> start!31242 m!323719))

(declare-fun m!323721 () Bool)

(assert (=> b!313717 m!323721))

(declare-fun m!323723 () Bool)

(assert (=> b!313720 m!323723))

(assert (=> b!313720 m!323723))

(declare-fun m!323725 () Bool)

(assert (=> b!313720 m!323725))

(declare-fun m!323727 () Bool)

(assert (=> b!313716 m!323727))

(check-sat (not b!313717) (not b!313718) (not b!313716) (not b!313721) (not b!313720) (not start!31242))
(check-sat)
(get-model)

(declare-fun d!68687 () Bool)

(declare-fun res!169832 () Bool)

(declare-fun e!195506 () Bool)

(assert (=> d!68687 (=> res!169832 e!195506)))

(assert (=> d!68687 (= res!169832 (= (select (arr!7585 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68687 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195506)))

(declare-fun b!313769 () Bool)

(declare-fun e!195507 () Bool)

(assert (=> b!313769 (= e!195506 e!195507)))

(declare-fun res!169833 () Bool)

(assert (=> b!313769 (=> (not res!169833) (not e!195507))))

(assert (=> b!313769 (= res!169833 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7937 a!3293)))))

(declare-fun b!313770 () Bool)

(assert (=> b!313770 (= e!195507 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68687 (not res!169832)) b!313769))

(assert (= (and b!313769 res!169833) b!313770))

(declare-fun m!323761 () Bool)

(assert (=> d!68687 m!323761))

(declare-fun m!323763 () Bool)

(assert (=> b!313770 m!323763))

(assert (=> b!313718 d!68687))

(declare-fun b!313825 () Bool)

(declare-fun lt!153724 () SeekEntryResult!2690)

(assert (=> b!313825 (and (bvsge (index!12938 lt!153724) #b00000000000000000000000000000000) (bvslt (index!12938 lt!153724) (size!7937 a!3293)))))

(declare-fun e!195539 () Bool)

(assert (=> b!313825 (= e!195539 (= (select (arr!7585 a!3293) (index!12938 lt!153724)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313826 () Bool)

(declare-fun e!195540 () SeekEntryResult!2690)

(assert (=> b!313826 (= e!195540 (Intermediate!2690 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313827 () Bool)

(assert (=> b!313827 (and (bvsge (index!12938 lt!153724) #b00000000000000000000000000000000) (bvslt (index!12938 lt!153724) (size!7937 a!3293)))))

(declare-fun res!169853 () Bool)

(assert (=> b!313827 (= res!169853 (= (select (arr!7585 a!3293) (index!12938 lt!153724)) k0!2441))))

(assert (=> b!313827 (=> res!169853 e!195539)))

(declare-fun e!195542 () Bool)

(assert (=> b!313827 (= e!195542 e!195539)))

(declare-fun b!313828 () Bool)

(declare-fun e!195538 () SeekEntryResult!2690)

(assert (=> b!313828 (= e!195538 (Intermediate!2690 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313829 () Bool)

(declare-fun e!195541 () Bool)

(assert (=> b!313829 (= e!195541 e!195542)))

(declare-fun res!169854 () Bool)

(get-info :version)

(assert (=> b!313829 (= res!169854 (and ((_ is Intermediate!2690) lt!153724) (not (undefined!3502 lt!153724)) (bvslt (x!31265 lt!153724) #b01111111111111111111111111111110) (bvsge (x!31265 lt!153724) #b00000000000000000000000000000000) (bvsge (x!31265 lt!153724) #b00000000000000000000000000000000)))))

(assert (=> b!313829 (=> (not res!169854) (not e!195542))))

(declare-fun b!313830 () Bool)

(assert (=> b!313830 (= e!195541 (bvsge (x!31265 lt!153724) #b01111111111111111111111111111110))))

(declare-fun b!313831 () Bool)

(assert (=> b!313831 (and (bvsge (index!12938 lt!153724) #b00000000000000000000000000000000) (bvslt (index!12938 lt!153724) (size!7937 a!3293)))))

(declare-fun res!169852 () Bool)

(assert (=> b!313831 (= res!169852 (= (select (arr!7585 a!3293) (index!12938 lt!153724)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313831 (=> res!169852 e!195539)))

(declare-fun d!68689 () Bool)

(assert (=> d!68689 e!195541))

(declare-fun c!49597 () Bool)

(assert (=> d!68689 (= c!49597 (and ((_ is Intermediate!2690) lt!153724) (undefined!3502 lt!153724)))))

(assert (=> d!68689 (= lt!153724 e!195538)))

(declare-fun c!49598 () Bool)

(assert (=> d!68689 (= c!49598 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153725 () (_ BitVec 64))

(assert (=> d!68689 (= lt!153725 (select (arr!7585 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68689 (validMask!0 mask!3709)))

(assert (=> d!68689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153724)))

(declare-fun b!313832 () Bool)

(assert (=> b!313832 (= e!195538 e!195540)))

(declare-fun c!49596 () Bool)

(assert (=> b!313832 (= c!49596 (or (= lt!153725 k0!2441) (= (bvadd lt!153725 lt!153725) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313833 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313833 (= e!195540 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68689 c!49598) b!313828))

(assert (= (and d!68689 (not c!49598)) b!313832))

(assert (= (and b!313832 c!49596) b!313826))

(assert (= (and b!313832 (not c!49596)) b!313833))

(assert (= (and d!68689 c!49597) b!313830))

(assert (= (and d!68689 (not c!49597)) b!313829))

(assert (= (and b!313829 res!169854) b!313827))

(assert (= (and b!313827 (not res!169853)) b!313831))

(assert (= (and b!313831 (not res!169852)) b!313825))

(declare-fun m!323765 () Bool)

(assert (=> b!313831 m!323765))

(assert (=> d!68689 m!323723))

(declare-fun m!323767 () Bool)

(assert (=> d!68689 m!323767))

(assert (=> d!68689 m!323717))

(assert (=> b!313825 m!323765))

(assert (=> b!313833 m!323723))

(declare-fun m!323773 () Bool)

(assert (=> b!313833 m!323773))

(assert (=> b!313833 m!323773))

(declare-fun m!323777 () Bool)

(assert (=> b!313833 m!323777))

(assert (=> b!313827 m!323765))

(assert (=> b!313720 d!68689))

(declare-fun d!68695 () Bool)

(declare-fun lt!153741 () (_ BitVec 32))

(declare-fun lt!153740 () (_ BitVec 32))

(assert (=> d!68695 (= lt!153741 (bvmul (bvxor lt!153740 (bvlshr lt!153740 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68695 (= lt!153740 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68695 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169858 (let ((h!5267 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31271 (bvmul (bvxor h!5267 (bvlshr h!5267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31271 (bvlshr x!31271 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169858 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169858 #b00000000000000000000000000000000))))))

(assert (=> d!68695 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153741 (bvlshr lt!153741 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313720 d!68695))

(declare-fun bm!25940 () Bool)

(declare-fun call!25943 () Bool)

(assert (=> bm!25940 (= call!25943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313866 () Bool)

(declare-fun e!195566 () Bool)

(assert (=> b!313866 (= e!195566 call!25943)))

(declare-fun b!313867 () Bool)

(declare-fun e!195565 () Bool)

(assert (=> b!313867 (= e!195566 e!195565)))

(declare-fun lt!153754 () (_ BitVec 64))

(assert (=> b!313867 (= lt!153754 (select (arr!7585 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9641 0))(
  ( (Unit!9642) )
))
(declare-fun lt!153755 () Unit!9641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16016 (_ BitVec 64) (_ BitVec 32)) Unit!9641)

(assert (=> b!313867 (= lt!153755 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153754 #b00000000000000000000000000000000))))

(assert (=> b!313867 (arrayContainsKey!0 a!3293 lt!153754 #b00000000000000000000000000000000)))

(declare-fun lt!153756 () Unit!9641)

(assert (=> b!313867 (= lt!153756 lt!153755)))

(declare-fun res!169875 () Bool)

(assert (=> b!313867 (= res!169875 (= (seekEntryOrOpen!0 (select (arr!7585 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2690 #b00000000000000000000000000000000)))))

(assert (=> b!313867 (=> (not res!169875) (not e!195565))))

(declare-fun b!313868 () Bool)

(assert (=> b!313868 (= e!195565 call!25943)))

(declare-fun b!313869 () Bool)

(declare-fun e!195567 () Bool)

(assert (=> b!313869 (= e!195567 e!195566)))

(declare-fun c!49607 () Bool)

(assert (=> b!313869 (= c!49607 (validKeyInArray!0 (select (arr!7585 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68703 () Bool)

(declare-fun res!169874 () Bool)

(assert (=> d!68703 (=> res!169874 e!195567)))

(assert (=> d!68703 (= res!169874 (bvsge #b00000000000000000000000000000000 (size!7937 a!3293)))))

(assert (=> d!68703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195567)))

(assert (= (and d!68703 (not res!169874)) b!313869))

(assert (= (and b!313869 c!49607) b!313867))

(assert (= (and b!313869 (not c!49607)) b!313866))

(assert (= (and b!313867 res!169875) b!313868))

(assert (= (or b!313868 b!313866) bm!25940))

(declare-fun m!323793 () Bool)

(assert (=> bm!25940 m!323793))

(assert (=> b!313867 m!323761))

(declare-fun m!323795 () Bool)

(assert (=> b!313867 m!323795))

(declare-fun m!323797 () Bool)

(assert (=> b!313867 m!323797))

(assert (=> b!313867 m!323761))

(declare-fun m!323799 () Bool)

(assert (=> b!313867 m!323799))

(assert (=> b!313869 m!323761))

(assert (=> b!313869 m!323761))

(declare-fun m!323801 () Bool)

(assert (=> b!313869 m!323801))

(assert (=> b!313721 d!68703))

(declare-fun d!68709 () Bool)

(assert (=> d!68709 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31242 d!68709))

(declare-fun d!68721 () Bool)

(assert (=> d!68721 (= (array_inv!5535 a!3293) (bvsge (size!7937 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31242 d!68721))

(declare-fun d!68723 () Bool)

(assert (=> d!68723 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313716 d!68723))

(declare-fun d!68725 () Bool)

(declare-fun lt!153787 () SeekEntryResult!2690)

(assert (=> d!68725 (and (or ((_ is Undefined!2690) lt!153787) (not ((_ is Found!2690) lt!153787)) (and (bvsge (index!12937 lt!153787) #b00000000000000000000000000000000) (bvslt (index!12937 lt!153787) (size!7937 a!3293)))) (or ((_ is Undefined!2690) lt!153787) ((_ is Found!2690) lt!153787) (not ((_ is MissingZero!2690) lt!153787)) (and (bvsge (index!12936 lt!153787) #b00000000000000000000000000000000) (bvslt (index!12936 lt!153787) (size!7937 a!3293)))) (or ((_ is Undefined!2690) lt!153787) ((_ is Found!2690) lt!153787) ((_ is MissingZero!2690) lt!153787) (not ((_ is MissingVacant!2690) lt!153787)) (and (bvsge (index!12939 lt!153787) #b00000000000000000000000000000000) (bvslt (index!12939 lt!153787) (size!7937 a!3293)))) (or ((_ is Undefined!2690) lt!153787) (ite ((_ is Found!2690) lt!153787) (= (select (arr!7585 a!3293) (index!12937 lt!153787)) k0!2441) (ite ((_ is MissingZero!2690) lt!153787) (= (select (arr!7585 a!3293) (index!12936 lt!153787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2690) lt!153787) (= (select (arr!7585 a!3293) (index!12939 lt!153787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195605 () SeekEntryResult!2690)

(assert (=> d!68725 (= lt!153787 e!195605)))

(declare-fun c!49634 () Bool)

(declare-fun lt!153789 () SeekEntryResult!2690)

(assert (=> d!68725 (= c!49634 (and ((_ is Intermediate!2690) lt!153789) (undefined!3502 lt!153789)))))

(assert (=> d!68725 (= lt!153789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68725 (validMask!0 mask!3709)))

(assert (=> d!68725 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153787)))

(declare-fun b!313930 () Bool)

(declare-fun e!195606 () SeekEntryResult!2690)

(assert (=> b!313930 (= e!195605 e!195606)))

(declare-fun lt!153788 () (_ BitVec 64))

(assert (=> b!313930 (= lt!153788 (select (arr!7585 a!3293) (index!12938 lt!153789)))))

(declare-fun c!49633 () Bool)

(assert (=> b!313930 (= c!49633 (= lt!153788 k0!2441))))

(declare-fun b!313931 () Bool)

(assert (=> b!313931 (= e!195606 (Found!2690 (index!12938 lt!153789)))))

(declare-fun b!313932 () Bool)

(declare-fun c!49632 () Bool)

(assert (=> b!313932 (= c!49632 (= lt!153788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195604 () SeekEntryResult!2690)

(assert (=> b!313932 (= e!195606 e!195604)))

(declare-fun b!313933 () Bool)

(assert (=> b!313933 (= e!195605 Undefined!2690)))

(declare-fun b!313934 () Bool)

(assert (=> b!313934 (= e!195604 (MissingZero!2690 (index!12938 lt!153789)))))

(declare-fun b!313935 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16016 (_ BitVec 32)) SeekEntryResult!2690)

(assert (=> b!313935 (= e!195604 (seekKeyOrZeroReturnVacant!0 (x!31265 lt!153789) (index!12938 lt!153789) (index!12938 lt!153789) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68725 c!49634) b!313933))

(assert (= (and d!68725 (not c!49634)) b!313930))

(assert (= (and b!313930 c!49633) b!313931))

(assert (= (and b!313930 (not c!49633)) b!313932))

(assert (= (and b!313932 c!49632) b!313934))

(assert (= (and b!313932 (not c!49632)) b!313935))

(assert (=> d!68725 m!323723))

(assert (=> d!68725 m!323725))

(assert (=> d!68725 m!323717))

(declare-fun m!323827 () Bool)

(assert (=> d!68725 m!323827))

(assert (=> d!68725 m!323723))

(declare-fun m!323829 () Bool)

(assert (=> d!68725 m!323829))

(declare-fun m!323831 () Bool)

(assert (=> d!68725 m!323831))

(declare-fun m!323833 () Bool)

(assert (=> b!313930 m!323833))

(declare-fun m!323835 () Bool)

(assert (=> b!313935 m!323835))

(assert (=> b!313717 d!68725))

(check-sat (not b!313935) (not d!68725) (not b!313869) (not b!313833) (not b!313770) (not b!313867) (not bm!25940) (not d!68689))
(check-sat)
