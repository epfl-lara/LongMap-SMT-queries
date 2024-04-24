; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49916 () Bool)

(assert start!49916)

(declare-fun b!547624 () Bool)

(declare-fun res!341096 () Bool)

(declare-fun e!316447 () Bool)

(assert (=> b!547624 (=> (not res!341096) (not e!316447))))

(declare-datatypes ((array!34528 0))(
  ( (array!34529 (arr!16585 (Array (_ BitVec 32) (_ BitVec 64))) (size!16949 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34528)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547624 (= res!341096 (validKeyInArray!0 (select (arr!16585 a!3118) j!142)))))

(declare-fun b!547625 () Bool)

(declare-fun e!316449 () Bool)

(declare-fun e!316448 () Bool)

(assert (=> b!547625 (= e!316449 e!316448)))

(declare-fun res!341097 () Bool)

(assert (=> b!547625 (=> res!341097 e!316448)))

(declare-datatypes ((List!10572 0))(
  ( (Nil!10569) (Cons!10568 (h!11538 (_ BitVec 64)) (t!16792 List!10572)) )
))
(declare-fun contains!2796 (List!10572 (_ BitVec 64)) Bool)

(assert (=> b!547625 (= res!341097 (contains!2796 Nil!10569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547626 () Bool)

(declare-fun res!341095 () Bool)

(assert (=> b!547626 (=> (not res!341095) (not e!316447))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547626 (= res!341095 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547627 () Bool)

(declare-fun res!341094 () Bool)

(assert (=> b!547627 (=> (not res!341094) (not e!316449))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34528 (_ BitVec 32)) Bool)

(assert (=> b!547627 (= res!341094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547628 () Bool)

(declare-fun res!341089 () Bool)

(assert (=> b!547628 (=> (not res!341089) (not e!316449))))

(declare-fun noDuplicate!226 (List!10572) Bool)

(assert (=> b!547628 (= res!341089 (noDuplicate!226 Nil!10569))))

(declare-fun b!547629 () Bool)

(declare-fun res!341090 () Bool)

(assert (=> b!547629 (=> (not res!341090) (not e!316447))))

(assert (=> b!547629 (= res!341090 (validKeyInArray!0 k0!1914))))

(declare-fun b!547630 () Bool)

(declare-fun res!341098 () Bool)

(assert (=> b!547630 (=> (not res!341098) (not e!316449))))

(assert (=> b!547630 (= res!341098 (and (bvsle #b00000000000000000000000000000000 (size!16949 a!3118)) (bvslt (size!16949 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547631 () Bool)

(declare-fun res!341093 () Bool)

(assert (=> b!547631 (=> (not res!341093) (not e!316447))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547631 (= res!341093 (and (= (size!16949 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16949 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16949 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!341092 () Bool)

(assert (=> start!49916 (=> (not res!341092) (not e!316447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49916 (= res!341092 (validMask!0 mask!3119))))

(assert (=> start!49916 e!316447))

(assert (=> start!49916 true))

(declare-fun array_inv!12444 (array!34528) Bool)

(assert (=> start!49916 (array_inv!12444 a!3118)))

(declare-fun b!547632 () Bool)

(assert (=> b!547632 (= e!316448 (contains!2796 Nil!10569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547633 () Bool)

(assert (=> b!547633 (= e!316447 e!316449)))

(declare-fun res!341091 () Bool)

(assert (=> b!547633 (=> (not res!341091) (not e!316449))))

(declare-datatypes ((SeekEntryResult!4990 0))(
  ( (MissingZero!4990 (index!22187 (_ BitVec 32))) (Found!4990 (index!22188 (_ BitVec 32))) (Intermediate!4990 (undefined!5802 Bool) (index!22189 (_ BitVec 32)) (x!51285 (_ BitVec 32))) (Undefined!4990) (MissingVacant!4990 (index!22190 (_ BitVec 32))) )
))
(declare-fun lt!249649 () SeekEntryResult!4990)

(assert (=> b!547633 (= res!341091 (or (= lt!249649 (MissingZero!4990 i!1132)) (= lt!249649 (MissingVacant!4990 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34528 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!547633 (= lt!249649 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!49916 res!341092) b!547631))

(assert (= (and b!547631 res!341093) b!547624))

(assert (= (and b!547624 res!341096) b!547629))

(assert (= (and b!547629 res!341090) b!547626))

(assert (= (and b!547626 res!341095) b!547633))

(assert (= (and b!547633 res!341091) b!547627))

(assert (= (and b!547627 res!341094) b!547630))

(assert (= (and b!547630 res!341098) b!547628))

(assert (= (and b!547628 res!341089) b!547625))

(assert (= (and b!547625 (not res!341097)) b!547632))

(declare-fun m!525043 () Bool)

(assert (=> b!547632 m!525043))

(declare-fun m!525045 () Bool)

(assert (=> b!547626 m!525045))

(declare-fun m!525047 () Bool)

(assert (=> b!547628 m!525047))

(declare-fun m!525049 () Bool)

(assert (=> b!547624 m!525049))

(assert (=> b!547624 m!525049))

(declare-fun m!525051 () Bool)

(assert (=> b!547624 m!525051))

(declare-fun m!525053 () Bool)

(assert (=> b!547633 m!525053))

(declare-fun m!525055 () Bool)

(assert (=> b!547629 m!525055))

(declare-fun m!525057 () Bool)

(assert (=> start!49916 m!525057))

(declare-fun m!525059 () Bool)

(assert (=> start!49916 m!525059))

(declare-fun m!525061 () Bool)

(assert (=> b!547627 m!525061))

(declare-fun m!525063 () Bool)

(assert (=> b!547625 m!525063))

(check-sat (not b!547628) (not b!547624) (not start!49916) (not b!547633) (not b!547632) (not b!547627) (not b!547629) (not b!547626) (not b!547625))
(check-sat)
(get-model)

(declare-fun d!82603 () Bool)

(declare-fun res!341163 () Bool)

(declare-fun e!316478 () Bool)

(assert (=> d!82603 (=> res!341163 e!316478)))

(get-info :version)

(assert (=> d!82603 (= res!341163 ((_ is Nil!10569) Nil!10569))))

(assert (=> d!82603 (= (noDuplicate!226 Nil!10569) e!316478)))

(declare-fun b!547698 () Bool)

(declare-fun e!316479 () Bool)

(assert (=> b!547698 (= e!316478 e!316479)))

(declare-fun res!341164 () Bool)

(assert (=> b!547698 (=> (not res!341164) (not e!316479))))

(assert (=> b!547698 (= res!341164 (not (contains!2796 (t!16792 Nil!10569) (h!11538 Nil!10569))))))

(declare-fun b!547699 () Bool)

(assert (=> b!547699 (= e!316479 (noDuplicate!226 (t!16792 Nil!10569)))))

(assert (= (and d!82603 (not res!341163)) b!547698))

(assert (= (and b!547698 res!341164) b!547699))

(declare-fun m!525109 () Bool)

(assert (=> b!547698 m!525109))

(declare-fun m!525111 () Bool)

(assert (=> b!547699 m!525111))

(assert (=> b!547628 d!82603))

(declare-fun d!82605 () Bool)

(assert (=> d!82605 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49916 d!82605))

(declare-fun d!82613 () Bool)

(assert (=> d!82613 (= (array_inv!12444 a!3118) (bvsge (size!16949 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49916 d!82613))

(declare-fun b!547748 () Bool)

(declare-fun e!316511 () SeekEntryResult!4990)

(assert (=> b!547748 (= e!316511 Undefined!4990)))

(declare-fun b!547749 () Bool)

(declare-fun e!316512 () SeekEntryResult!4990)

(assert (=> b!547749 (= e!316511 e!316512)))

(declare-fun lt!249681 () (_ BitVec 64))

(declare-fun lt!249680 () SeekEntryResult!4990)

(assert (=> b!547749 (= lt!249681 (select (arr!16585 a!3118) (index!22189 lt!249680)))))

(declare-fun c!63616 () Bool)

(assert (=> b!547749 (= c!63616 (= lt!249681 k0!1914))))

(declare-fun d!82615 () Bool)

(declare-fun lt!249682 () SeekEntryResult!4990)

(assert (=> d!82615 (and (or ((_ is Undefined!4990) lt!249682) (not ((_ is Found!4990) lt!249682)) (and (bvsge (index!22188 lt!249682) #b00000000000000000000000000000000) (bvslt (index!22188 lt!249682) (size!16949 a!3118)))) (or ((_ is Undefined!4990) lt!249682) ((_ is Found!4990) lt!249682) (not ((_ is MissingZero!4990) lt!249682)) (and (bvsge (index!22187 lt!249682) #b00000000000000000000000000000000) (bvslt (index!22187 lt!249682) (size!16949 a!3118)))) (or ((_ is Undefined!4990) lt!249682) ((_ is Found!4990) lt!249682) ((_ is MissingZero!4990) lt!249682) (not ((_ is MissingVacant!4990) lt!249682)) (and (bvsge (index!22190 lt!249682) #b00000000000000000000000000000000) (bvslt (index!22190 lt!249682) (size!16949 a!3118)))) (or ((_ is Undefined!4990) lt!249682) (ite ((_ is Found!4990) lt!249682) (= (select (arr!16585 a!3118) (index!22188 lt!249682)) k0!1914) (ite ((_ is MissingZero!4990) lt!249682) (= (select (arr!16585 a!3118) (index!22187 lt!249682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4990) lt!249682) (= (select (arr!16585 a!3118) (index!22190 lt!249682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82615 (= lt!249682 e!316511)))

(declare-fun c!63617 () Bool)

(assert (=> d!82615 (= c!63617 (and ((_ is Intermediate!4990) lt!249680) (undefined!5802 lt!249680)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34528 (_ BitVec 32)) SeekEntryResult!4990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82615 (= lt!249680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82615 (validMask!0 mask!3119)))

(assert (=> d!82615 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249682)))

(declare-fun b!547750 () Bool)

(declare-fun c!63615 () Bool)

(assert (=> b!547750 (= c!63615 (= lt!249681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316510 () SeekEntryResult!4990)

(assert (=> b!547750 (= e!316512 e!316510)))

(declare-fun b!547751 () Bool)

(assert (=> b!547751 (= e!316510 (MissingZero!4990 (index!22189 lt!249680)))))

(declare-fun b!547752 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34528 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!547752 (= e!316510 (seekKeyOrZeroReturnVacant!0 (x!51285 lt!249680) (index!22189 lt!249680) (index!22189 lt!249680) k0!1914 a!3118 mask!3119))))

(declare-fun b!547753 () Bool)

(assert (=> b!547753 (= e!316512 (Found!4990 (index!22189 lt!249680)))))

(assert (= (and d!82615 c!63617) b!547748))

(assert (= (and d!82615 (not c!63617)) b!547749))

(assert (= (and b!547749 c!63616) b!547753))

(assert (= (and b!547749 (not c!63616)) b!547750))

(assert (= (and b!547750 c!63615) b!547751))

(assert (= (and b!547750 (not c!63615)) b!547752))

(declare-fun m!525143 () Bool)

(assert (=> b!547749 m!525143))

(declare-fun m!525145 () Bool)

(assert (=> d!82615 m!525145))

(assert (=> d!82615 m!525057))

(declare-fun m!525147 () Bool)

(assert (=> d!82615 m!525147))

(declare-fun m!525149 () Bool)

(assert (=> d!82615 m!525149))

(declare-fun m!525151 () Bool)

(assert (=> d!82615 m!525151))

(declare-fun m!525153 () Bool)

(assert (=> d!82615 m!525153))

(assert (=> d!82615 m!525149))

(declare-fun m!525155 () Bool)

(assert (=> b!547752 m!525155))

(assert (=> b!547633 d!82615))

(declare-fun d!82631 () Bool)

(declare-fun lt!249685 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!228 (List!10572) (InoxSet (_ BitVec 64)))

(assert (=> d!82631 (= lt!249685 (select (content!228 Nil!10569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316523 () Bool)

(assert (=> d!82631 (= lt!249685 e!316523)))

(declare-fun res!341187 () Bool)

(assert (=> d!82631 (=> (not res!341187) (not e!316523))))

(assert (=> d!82631 (= res!341187 ((_ is Cons!10568) Nil!10569))))

(assert (=> d!82631 (= (contains!2796 Nil!10569 #b1000000000000000000000000000000000000000000000000000000000000000) lt!249685)))

(declare-fun b!547764 () Bool)

(declare-fun e!316524 () Bool)

(assert (=> b!547764 (= e!316523 e!316524)))

(declare-fun res!341188 () Bool)

(assert (=> b!547764 (=> res!341188 e!316524)))

(assert (=> b!547764 (= res!341188 (= (h!11538 Nil!10569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547765 () Bool)

(assert (=> b!547765 (= e!316524 (contains!2796 (t!16792 Nil!10569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82631 res!341187) b!547764))

(assert (= (and b!547764 (not res!341188)) b!547765))

(declare-fun m!525161 () Bool)

(assert (=> d!82631 m!525161))

(declare-fun m!525163 () Bool)

(assert (=> d!82631 m!525163))

(declare-fun m!525165 () Bool)

(assert (=> b!547765 m!525165))

(assert (=> b!547632 d!82631))

(declare-fun b!547774 () Bool)

(declare-fun e!316532 () Bool)

(declare-fun e!316533 () Bool)

(assert (=> b!547774 (= e!316532 e!316533)))

(declare-fun lt!249693 () (_ BitVec 64))

(assert (=> b!547774 (= lt!249693 (select (arr!16585 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16935 0))(
  ( (Unit!16936) )
))
(declare-fun lt!249694 () Unit!16935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34528 (_ BitVec 64) (_ BitVec 32)) Unit!16935)

(assert (=> b!547774 (= lt!249694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249693 #b00000000000000000000000000000000))))

(assert (=> b!547774 (arrayContainsKey!0 a!3118 lt!249693 #b00000000000000000000000000000000)))

(declare-fun lt!249692 () Unit!16935)

(assert (=> b!547774 (= lt!249692 lt!249694)))

(declare-fun res!341193 () Bool)

(assert (=> b!547774 (= res!341193 (= (seekEntryOrOpen!0 (select (arr!16585 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!4990 #b00000000000000000000000000000000)))))

(assert (=> b!547774 (=> (not res!341193) (not e!316533))))

(declare-fun b!547775 () Bool)

(declare-fun call!32175 () Bool)

(assert (=> b!547775 (= e!316533 call!32175)))

(declare-fun bm!32172 () Bool)

(assert (=> bm!32172 (= call!32175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547776 () Bool)

(declare-fun e!316531 () Bool)

(assert (=> b!547776 (= e!316531 e!316532)))

(declare-fun c!63620 () Bool)

(assert (=> b!547776 (= c!63620 (validKeyInArray!0 (select (arr!16585 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547777 () Bool)

(assert (=> b!547777 (= e!316532 call!32175)))

(declare-fun d!82635 () Bool)

(declare-fun res!341194 () Bool)

(assert (=> d!82635 (=> res!341194 e!316531)))

(assert (=> d!82635 (= res!341194 (bvsge #b00000000000000000000000000000000 (size!16949 a!3118)))))

(assert (=> d!82635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316531)))

(assert (= (and d!82635 (not res!341194)) b!547776))

(assert (= (and b!547776 c!63620) b!547774))

(assert (= (and b!547776 (not c!63620)) b!547777))

(assert (= (and b!547774 res!341193) b!547775))

(assert (= (or b!547775 b!547777) bm!32172))

(declare-fun m!525167 () Bool)

(assert (=> b!547774 m!525167))

(declare-fun m!525169 () Bool)

(assert (=> b!547774 m!525169))

(declare-fun m!525171 () Bool)

(assert (=> b!547774 m!525171))

(assert (=> b!547774 m!525167))

(declare-fun m!525173 () Bool)

(assert (=> b!547774 m!525173))

(declare-fun m!525175 () Bool)

(assert (=> bm!32172 m!525175))

(assert (=> b!547776 m!525167))

(assert (=> b!547776 m!525167))

(declare-fun m!525177 () Bool)

(assert (=> b!547776 m!525177))

(assert (=> b!547627 d!82635))

(declare-fun d!82641 () Bool)

(declare-fun res!341199 () Bool)

(declare-fun e!316544 () Bool)

(assert (=> d!82641 (=> res!341199 e!316544)))

(assert (=> d!82641 (= res!341199 (= (select (arr!16585 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82641 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316544)))

(declare-fun b!547794 () Bool)

(declare-fun e!316545 () Bool)

(assert (=> b!547794 (= e!316544 e!316545)))

(declare-fun res!341200 () Bool)

(assert (=> b!547794 (=> (not res!341200) (not e!316545))))

(assert (=> b!547794 (= res!341200 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16949 a!3118)))))

(declare-fun b!547795 () Bool)

(assert (=> b!547795 (= e!316545 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82641 (not res!341199)) b!547794))

(assert (= (and b!547794 res!341200) b!547795))

(assert (=> d!82641 m!525167))

(declare-fun m!525179 () Bool)

(assert (=> b!547795 m!525179))

(assert (=> b!547626 d!82641))

(declare-fun d!82643 () Bool)

(declare-fun lt!249701 () Bool)

(assert (=> d!82643 (= lt!249701 (select (content!228 Nil!10569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316546 () Bool)

(assert (=> d!82643 (= lt!249701 e!316546)))

(declare-fun res!341201 () Bool)

(assert (=> d!82643 (=> (not res!341201) (not e!316546))))

(assert (=> d!82643 (= res!341201 ((_ is Cons!10568) Nil!10569))))

(assert (=> d!82643 (= (contains!2796 Nil!10569 #b0000000000000000000000000000000000000000000000000000000000000000) lt!249701)))

(declare-fun b!547796 () Bool)

(declare-fun e!316547 () Bool)

(assert (=> b!547796 (= e!316546 e!316547)))

(declare-fun res!341202 () Bool)

(assert (=> b!547796 (=> res!341202 e!316547)))

(assert (=> b!547796 (= res!341202 (= (h!11538 Nil!10569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547797 () Bool)

(assert (=> b!547797 (= e!316547 (contains!2796 (t!16792 Nil!10569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82643 res!341201) b!547796))

(assert (= (and b!547796 (not res!341202)) b!547797))

(assert (=> d!82643 m!525161))

(declare-fun m!525181 () Bool)

(assert (=> d!82643 m!525181))

(declare-fun m!525183 () Bool)

(assert (=> b!547797 m!525183))

(assert (=> b!547625 d!82643))

(declare-fun d!82645 () Bool)

(assert (=> d!82645 (= (validKeyInArray!0 (select (arr!16585 a!3118) j!142)) (and (not (= (select (arr!16585 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16585 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547624 d!82645))

(declare-fun d!82647 () Bool)

(assert (=> d!82647 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547629 d!82647))

(check-sat (not b!547765) (not b!547795) (not bm!32172) (not b!547774) (not d!82643) (not b!547698) (not d!82615) (not b!547776) (not b!547752) (not b!547699) (not b!547797) (not d!82631))
(check-sat)
