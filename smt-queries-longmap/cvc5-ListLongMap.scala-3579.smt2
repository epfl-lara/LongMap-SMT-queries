; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49256 () Bool)

(assert start!49256)

(declare-fun b!542162 () Bool)

(declare-fun res!336785 () Bool)

(declare-fun e!313849 () Bool)

(assert (=> b!542162 (=> (not res!336785) (not e!313849))))

(declare-datatypes ((array!34263 0))(
  ( (array!34264 (arr!16464 (Array (_ BitVec 32) (_ BitVec 64))) (size!16828 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34263)

(declare-datatypes ((List!10490 0))(
  ( (Nil!10487) (Cons!10486 (h!11441 (_ BitVec 64)) (t!16710 List!10490)) )
))
(declare-fun arrayNoDuplicates!0 (array!34263 (_ BitVec 32) List!10490) Bool)

(assert (=> b!542162 (= res!336785 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10487))))

(declare-fun b!542163 () Bool)

(declare-fun e!313850 () Bool)

(assert (=> b!542163 (= e!313850 e!313849)))

(declare-fun res!336787 () Bool)

(assert (=> b!542163 (=> (not res!336787) (not e!313849))))

(declare-datatypes ((SeekEntryResult!4878 0))(
  ( (MissingZero!4878 (index!21736 (_ BitVec 32))) (Found!4878 (index!21737 (_ BitVec 32))) (Intermediate!4878 (undefined!5690 Bool) (index!21738 (_ BitVec 32)) (x!50794 (_ BitVec 32))) (Undefined!4878) (MissingVacant!4878 (index!21739 (_ BitVec 32))) )
))
(declare-fun lt!247882 () SeekEntryResult!4878)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542163 (= res!336787 (or (= lt!247882 (MissingZero!4878 i!1153)) (= lt!247882 (MissingVacant!4878 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34263 (_ BitVec 32)) SeekEntryResult!4878)

(assert (=> b!542163 (= lt!247882 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542164 () Bool)

(declare-fun e!313848 () Bool)

(assert (=> b!542164 (= e!313849 e!313848)))

(declare-fun res!336789 () Bool)

(assert (=> b!542164 (=> (not res!336789) (not e!313848))))

(declare-fun lt!247880 () SeekEntryResult!4878)

(declare-fun lt!247881 () SeekEntryResult!4878)

(assert (=> b!542164 (= res!336789 (= lt!247880 lt!247881))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542164 (= lt!247881 (Intermediate!4878 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34263 (_ BitVec 32)) SeekEntryResult!4878)

(assert (=> b!542164 (= lt!247880 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16464 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542165 () Bool)

(declare-fun res!336794 () Bool)

(assert (=> b!542165 (=> (not res!336794) (not e!313850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542165 (= res!336794 (validKeyInArray!0 (select (arr!16464 a!3154) j!147)))))

(declare-fun b!542166 () Bool)

(declare-fun res!336788 () Bool)

(assert (=> b!542166 (=> (not res!336788) (not e!313850))))

(declare-fun arrayContainsKey!0 (array!34263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542166 (= res!336788 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542167 () Bool)

(declare-fun res!336796 () Bool)

(assert (=> b!542167 (=> (not res!336796) (not e!313848))))

(assert (=> b!542167 (= res!336796 (and (not (= (select (arr!16464 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16464 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16464 a!3154) index!1177) (select (arr!16464 a!3154) j!147)) (= index!1177 resIndex!32)))))

(declare-fun b!542168 () Bool)

(declare-fun res!336793 () Bool)

(assert (=> b!542168 (=> (not res!336793) (not e!313850))))

(assert (=> b!542168 (= res!336793 (and (= (size!16828 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16828 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16828 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542169 () Bool)

(declare-fun res!336795 () Bool)

(assert (=> b!542169 (=> (not res!336795) (not e!313850))))

(assert (=> b!542169 (= res!336795 (validKeyInArray!0 k!1998))))

(declare-fun b!542170 () Bool)

(declare-fun res!336790 () Bool)

(assert (=> b!542170 (=> (not res!336790) (not e!313848))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542170 (= res!336790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) (select (arr!16464 a!3154) j!147) a!3154 mask!3216) lt!247880))))

(declare-fun b!542171 () Bool)

(declare-fun res!336791 () Bool)

(assert (=> b!542171 (=> (not res!336791) (not e!313849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34263 (_ BitVec 32)) Bool)

(assert (=> b!542171 (= res!336791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!336786 () Bool)

(assert (=> start!49256 (=> (not res!336786) (not e!313850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49256 (= res!336786 (validMask!0 mask!3216))))

(assert (=> start!49256 e!313850))

(assert (=> start!49256 true))

(declare-fun array_inv!12323 (array!34263) Bool)

(assert (=> start!49256 (array_inv!12323 a!3154)))

(declare-fun b!542172 () Bool)

(assert (=> b!542172 (= e!313848 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16464 a!3154) i!1153 k!1998) j!147) (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)) mask!3216) lt!247881)))))

(declare-fun b!542173 () Bool)

(declare-fun res!336792 () Bool)

(assert (=> b!542173 (=> (not res!336792) (not e!313849))))

(assert (=> b!542173 (= res!336792 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16828 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16828 a!3154)) (= (select (arr!16464 a!3154) resIndex!32) (select (arr!16464 a!3154) j!147))))))

(assert (= (and start!49256 res!336786) b!542168))

(assert (= (and b!542168 res!336793) b!542165))

(assert (= (and b!542165 res!336794) b!542169))

(assert (= (and b!542169 res!336795) b!542166))

(assert (= (and b!542166 res!336788) b!542163))

(assert (= (and b!542163 res!336787) b!542171))

(assert (= (and b!542171 res!336791) b!542162))

(assert (= (and b!542162 res!336785) b!542173))

(assert (= (and b!542173 res!336792) b!542164))

(assert (= (and b!542164 res!336789) b!542170))

(assert (= (and b!542170 res!336790) b!542167))

(assert (= (and b!542167 res!336796) b!542172))

(declare-fun m!520701 () Bool)

(assert (=> b!542164 m!520701))

(assert (=> b!542164 m!520701))

(declare-fun m!520703 () Bool)

(assert (=> b!542164 m!520703))

(declare-fun m!520705 () Bool)

(assert (=> b!542171 m!520705))

(declare-fun m!520707 () Bool)

(assert (=> b!542172 m!520707))

(declare-fun m!520709 () Bool)

(assert (=> b!542172 m!520709))

(assert (=> b!542172 m!520709))

(declare-fun m!520711 () Bool)

(assert (=> b!542172 m!520711))

(declare-fun m!520713 () Bool)

(assert (=> b!542166 m!520713))

(declare-fun m!520715 () Bool)

(assert (=> b!542167 m!520715))

(assert (=> b!542167 m!520701))

(declare-fun m!520717 () Bool)

(assert (=> b!542169 m!520717))

(declare-fun m!520719 () Bool)

(assert (=> b!542163 m!520719))

(assert (=> b!542170 m!520701))

(assert (=> b!542170 m!520701))

(declare-fun m!520721 () Bool)

(assert (=> b!542170 m!520721))

(assert (=> b!542170 m!520721))

(assert (=> b!542170 m!520701))

(declare-fun m!520723 () Bool)

(assert (=> b!542170 m!520723))

(assert (=> b!542165 m!520701))

(assert (=> b!542165 m!520701))

(declare-fun m!520725 () Bool)

(assert (=> b!542165 m!520725))

(declare-fun m!520727 () Bool)

(assert (=> b!542173 m!520727))

(assert (=> b!542173 m!520701))

(declare-fun m!520729 () Bool)

(assert (=> start!49256 m!520729))

(declare-fun m!520731 () Bool)

(assert (=> start!49256 m!520731))

(declare-fun m!520733 () Bool)

(assert (=> b!542162 m!520733))

(push 1)

(assert (not b!542166))

(assert (not b!542171))

(assert (not b!542165))

(assert (not b!542162))

(assert (not b!542170))

(assert (not b!542169))

(assert (not start!49256))

(assert (not b!542164))

(assert (not b!542163))

(assert (not b!542172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!542220 () Bool)

(declare-fun e!313882 () Bool)

(declare-fun call!32058 () Bool)

(assert (=> b!542220 (= e!313882 call!32058)))

(declare-fun b!542221 () Bool)

(declare-fun e!313881 () Bool)

(declare-fun e!313880 () Bool)

(assert (=> b!542221 (= e!313881 e!313880)))

(declare-fun res!336818 () Bool)

(assert (=> b!542221 (=> (not res!336818) (not e!313880))))

(declare-fun e!313883 () Bool)

(assert (=> b!542221 (= res!336818 (not e!313883))))

(declare-fun res!336817 () Bool)

(assert (=> b!542221 (=> (not res!336817) (not e!313883))))

(assert (=> b!542221 (= res!336817 (validKeyInArray!0 (select (arr!16464 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542222 () Bool)

(assert (=> b!542222 (= e!313880 e!313882)))

(declare-fun c!63020 () Bool)

(assert (=> b!542222 (= c!63020 (validKeyInArray!0 (select (arr!16464 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32055 () Bool)

(assert (=> bm!32055 (= call!32058 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63020 (Cons!10486 (select (arr!16464 a!3154) #b00000000000000000000000000000000) Nil!10487) Nil!10487)))))

(declare-fun b!542223 () Bool)

(declare-fun contains!2780 (List!10490 (_ BitVec 64)) Bool)

(assert (=> b!542223 (= e!313883 (contains!2780 Nil!10487 (select (arr!16464 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81933 () Bool)

(declare-fun res!336816 () Bool)

(assert (=> d!81933 (=> res!336816 e!313881)))

(assert (=> d!81933 (= res!336816 (bvsge #b00000000000000000000000000000000 (size!16828 a!3154)))))

(assert (=> d!81933 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10487) e!313881)))

(declare-fun b!542224 () Bool)

(assert (=> b!542224 (= e!313882 call!32058)))

(assert (= (and d!81933 (not res!336816)) b!542221))

(assert (= (and b!542221 res!336817) b!542223))

(assert (= (and b!542221 res!336818) b!542222))

(assert (= (and b!542222 c!63020) b!542224))

(assert (= (and b!542222 (not c!63020)) b!542220))

(assert (= (or b!542224 b!542220) bm!32055))

(declare-fun m!520751 () Bool)

(assert (=> b!542221 m!520751))

(assert (=> b!542221 m!520751))

(declare-fun m!520753 () Bool)

(assert (=> b!542221 m!520753))

(assert (=> b!542222 m!520751))

(assert (=> b!542222 m!520751))

(assert (=> b!542222 m!520753))

(assert (=> bm!32055 m!520751))

(declare-fun m!520755 () Bool)

(assert (=> bm!32055 m!520755))

(assert (=> b!542223 m!520751))

(assert (=> b!542223 m!520751))

(declare-fun m!520757 () Bool)

(assert (=> b!542223 m!520757))

(assert (=> b!542162 d!81933))

(declare-fun b!542285 () Bool)

(declare-fun e!313921 () SeekEntryResult!4878)

(declare-fun e!313919 () SeekEntryResult!4878)

(assert (=> b!542285 (= e!313921 e!313919)))

(declare-fun lt!247920 () (_ BitVec 64))

(declare-fun lt!247922 () SeekEntryResult!4878)

(assert (=> b!542285 (= lt!247920 (select (arr!16464 a!3154) (index!21738 lt!247922)))))

(declare-fun c!63043 () Bool)

(assert (=> b!542285 (= c!63043 (= lt!247920 k!1998))))

(declare-fun b!542286 () Bool)

(declare-fun e!313920 () SeekEntryResult!4878)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34263 (_ BitVec 32)) SeekEntryResult!4878)

(assert (=> b!542286 (= e!313920 (seekKeyOrZeroReturnVacant!0 (x!50794 lt!247922) (index!21738 lt!247922) (index!21738 lt!247922) k!1998 a!3154 mask!3216))))

(declare-fun b!542287 () Bool)

(assert (=> b!542287 (= e!313921 Undefined!4878)))

(declare-fun b!542289 () Bool)

(assert (=> b!542289 (= e!313920 (MissingZero!4878 (index!21738 lt!247922)))))

(declare-fun b!542290 () Bool)

(declare-fun c!63044 () Bool)

(assert (=> b!542290 (= c!63044 (= lt!247920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542290 (= e!313919 e!313920)))

(declare-fun b!542288 () Bool)

(assert (=> b!542288 (= e!313919 (Found!4878 (index!21738 lt!247922)))))

(declare-fun d!81943 () Bool)

(declare-fun lt!247921 () SeekEntryResult!4878)

(assert (=> d!81943 (and (or (is-Undefined!4878 lt!247921) (not (is-Found!4878 lt!247921)) (and (bvsge (index!21737 lt!247921) #b00000000000000000000000000000000) (bvslt (index!21737 lt!247921) (size!16828 a!3154)))) (or (is-Undefined!4878 lt!247921) (is-Found!4878 lt!247921) (not (is-MissingZero!4878 lt!247921)) (and (bvsge (index!21736 lt!247921) #b00000000000000000000000000000000) (bvslt (index!21736 lt!247921) (size!16828 a!3154)))) (or (is-Undefined!4878 lt!247921) (is-Found!4878 lt!247921) (is-MissingZero!4878 lt!247921) (not (is-MissingVacant!4878 lt!247921)) (and (bvsge (index!21739 lt!247921) #b00000000000000000000000000000000) (bvslt (index!21739 lt!247921) (size!16828 a!3154)))) (or (is-Undefined!4878 lt!247921) (ite (is-Found!4878 lt!247921) (= (select (arr!16464 a!3154) (index!21737 lt!247921)) k!1998) (ite (is-MissingZero!4878 lt!247921) (= (select (arr!16464 a!3154) (index!21736 lt!247921)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4878 lt!247921) (= (select (arr!16464 a!3154) (index!21739 lt!247921)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81943 (= lt!247921 e!313921)))

(declare-fun c!63042 () Bool)

(assert (=> d!81943 (= c!63042 (and (is-Intermediate!4878 lt!247922) (undefined!5690 lt!247922)))))

(assert (=> d!81943 (= lt!247922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81943 (validMask!0 mask!3216)))

(assert (=> d!81943 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247921)))

(assert (= (and d!81943 c!63042) b!542287))

(assert (= (and d!81943 (not c!63042)) b!542285))

(assert (= (and b!542285 c!63043) b!542288))

(assert (= (and b!542285 (not c!63043)) b!542290))

(assert (= (and b!542290 c!63044) b!542289))

(assert (= (and b!542290 (not c!63044)) b!542286))

(declare-fun m!520783 () Bool)

(assert (=> b!542285 m!520783))

(declare-fun m!520785 () Bool)

(assert (=> b!542286 m!520785))

(declare-fun m!520787 () Bool)

(assert (=> d!81943 m!520787))

(declare-fun m!520789 () Bool)

(assert (=> d!81943 m!520789))

(assert (=> d!81943 m!520787))

(declare-fun m!520791 () Bool)

(assert (=> d!81943 m!520791))

(declare-fun m!520793 () Bool)

(assert (=> d!81943 m!520793))

(declare-fun m!520795 () Bool)

(assert (=> d!81943 m!520795))

(assert (=> d!81943 m!520729))

(assert (=> b!542163 d!81943))

(declare-fun d!81951 () Bool)

(assert (=> d!81951 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!542169 d!81951))

(declare-fun b!542375 () Bool)

(declare-fun e!313983 () SeekEntryResult!4878)

(declare-fun e!313982 () SeekEntryResult!4878)

(assert (=> b!542375 (= e!313983 e!313982)))

(declare-fun c!63069 () Bool)

(declare-fun lt!247947 () (_ BitVec 64))

(assert (=> b!542375 (= c!63069 (or (= lt!247947 (select (arr!16464 a!3154) j!147)) (= (bvadd lt!247947 lt!247947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542376 () Bool)

(declare-fun e!313981 () Bool)

(declare-fun e!313979 () Bool)

(assert (=> b!542376 (= e!313981 e!313979)))

(declare-fun res!336875 () Bool)

(declare-fun lt!247948 () SeekEntryResult!4878)

(assert (=> b!542376 (= res!336875 (and (is-Intermediate!4878 lt!247948) (not (undefined!5690 lt!247948)) (bvslt (x!50794 lt!247948) #b01111111111111111111111111111110) (bvsge (x!50794 lt!247948) #b00000000000000000000000000000000) (bvsge (x!50794 lt!247948) x!1030)))))

(assert (=> b!542376 (=> (not res!336875) (not e!313979))))

(declare-fun b!542377 () Bool)

(assert (=> b!542377 (= e!313982 (Intermediate!4878 false index!1177 x!1030))))

(declare-fun b!542378 () Bool)

(assert (=> b!542378 (= e!313981 (bvsge (x!50794 lt!247948) #b01111111111111111111111111111110))))

(declare-fun b!542379 () Bool)

(assert (=> b!542379 (and (bvsge (index!21738 lt!247948) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247948) (size!16828 a!3154)))))

(declare-fun e!313980 () Bool)

(assert (=> b!542379 (= e!313980 (= (select (arr!16464 a!3154) (index!21738 lt!247948)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!81953 () Bool)

(assert (=> d!81953 e!313981))

(declare-fun c!63070 () Bool)

(assert (=> d!81953 (= c!63070 (and (is-Intermediate!4878 lt!247948) (undefined!5690 lt!247948)))))

(assert (=> d!81953 (= lt!247948 e!313983)))

(declare-fun c!63071 () Bool)

(assert (=> d!81953 (= c!63071 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81953 (= lt!247947 (select (arr!16464 a!3154) index!1177))))

(assert (=> d!81953 (validMask!0 mask!3216)))

(assert (=> d!81953 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16464 a!3154) j!147) a!3154 mask!3216) lt!247948)))

(declare-fun b!542380 () Bool)

(assert (=> b!542380 (and (bvsge (index!21738 lt!247948) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247948) (size!16828 a!3154)))))

(declare-fun res!336874 () Bool)

(assert (=> b!542380 (= res!336874 (= (select (arr!16464 a!3154) (index!21738 lt!247948)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542380 (=> res!336874 e!313980)))

(declare-fun b!542381 () Bool)

(assert (=> b!542381 (= e!313983 (Intermediate!4878 true index!1177 x!1030))))

(declare-fun b!542382 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542382 (= e!313982 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16464 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542383 () Bool)

(assert (=> b!542383 (and (bvsge (index!21738 lt!247948) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247948) (size!16828 a!3154)))))

(declare-fun res!336873 () Bool)

(assert (=> b!542383 (= res!336873 (= (select (arr!16464 a!3154) (index!21738 lt!247948)) (select (arr!16464 a!3154) j!147)))))

(assert (=> b!542383 (=> res!336873 e!313980)))

(assert (=> b!542383 (= e!313979 e!313980)))

(assert (= (and d!81953 c!63071) b!542381))

(assert (= (and d!81953 (not c!63071)) b!542375))

(assert (= (and b!542375 c!63069) b!542377))

(assert (= (and b!542375 (not c!63069)) b!542382))

(assert (= (and d!81953 c!63070) b!542378))

(assert (= (and d!81953 (not c!63070)) b!542376))

(assert (= (and b!542376 res!336875) b!542383))

(assert (= (and b!542383 (not res!336873)) b!542380))

(assert (= (and b!542380 (not res!336874)) b!542379))

(declare-fun m!520835 () Bool)

(assert (=> b!542382 m!520835))

(assert (=> b!542382 m!520835))

(assert (=> b!542382 m!520701))

(declare-fun m!520837 () Bool)

(assert (=> b!542382 m!520837))

(declare-fun m!520839 () Bool)

(assert (=> b!542380 m!520839))

(assert (=> b!542379 m!520839))

(assert (=> d!81953 m!520715))

(assert (=> d!81953 m!520729))

(assert (=> b!542383 m!520839))

(assert (=> b!542164 d!81953))

(declare-fun d!81969 () Bool)

(assert (=> d!81969 (= (validKeyInArray!0 (select (arr!16464 a!3154) j!147)) (and (not (= (select (arr!16464 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16464 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!542165 d!81969))

(declare-fun b!542384 () Bool)

(declare-fun e!313988 () SeekEntryResult!4878)

(declare-fun e!313987 () SeekEntryResult!4878)

(assert (=> b!542384 (= e!313988 e!313987)))

(declare-fun c!63072 () Bool)

(declare-fun lt!247949 () (_ BitVec 64))

(assert (=> b!542384 (= c!63072 (or (= lt!247949 (select (arr!16464 a!3154) j!147)) (= (bvadd lt!247949 lt!247949) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542385 () Bool)

(declare-fun e!313986 () Bool)

(declare-fun e!313984 () Bool)

(assert (=> b!542385 (= e!313986 e!313984)))

(declare-fun res!336878 () Bool)

(declare-fun lt!247950 () SeekEntryResult!4878)

(assert (=> b!542385 (= res!336878 (and (is-Intermediate!4878 lt!247950) (not (undefined!5690 lt!247950)) (bvslt (x!50794 lt!247950) #b01111111111111111111111111111110) (bvsge (x!50794 lt!247950) #b00000000000000000000000000000000) (bvsge (x!50794 lt!247950) #b00000000000000000000000000000000)))))

(assert (=> b!542385 (=> (not res!336878) (not e!313984))))

(declare-fun b!542386 () Bool)

(assert (=> b!542386 (= e!313987 (Intermediate!4878 false (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542387 () Bool)

(assert (=> b!542387 (= e!313986 (bvsge (x!50794 lt!247950) #b01111111111111111111111111111110))))

(declare-fun b!542388 () Bool)

(assert (=> b!542388 (and (bvsge (index!21738 lt!247950) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247950) (size!16828 a!3154)))))

(declare-fun e!313985 () Bool)

(assert (=> b!542388 (= e!313985 (= (select (arr!16464 a!3154) (index!21738 lt!247950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!81971 () Bool)

(assert (=> d!81971 e!313986))

(declare-fun c!63073 () Bool)

(assert (=> d!81971 (= c!63073 (and (is-Intermediate!4878 lt!247950) (undefined!5690 lt!247950)))))

(assert (=> d!81971 (= lt!247950 e!313988)))

(declare-fun c!63074 () Bool)

(assert (=> d!81971 (= c!63074 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81971 (= lt!247949 (select (arr!16464 a!3154) (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216)))))

(assert (=> d!81971 (validMask!0 mask!3216)))

(assert (=> d!81971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) (select (arr!16464 a!3154) j!147) a!3154 mask!3216) lt!247950)))

(declare-fun b!542389 () Bool)

(assert (=> b!542389 (and (bvsge (index!21738 lt!247950) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247950) (size!16828 a!3154)))))

(declare-fun res!336877 () Bool)

(assert (=> b!542389 (= res!336877 (= (select (arr!16464 a!3154) (index!21738 lt!247950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542389 (=> res!336877 e!313985)))

(declare-fun b!542390 () Bool)

(assert (=> b!542390 (= e!313988 (Intermediate!4878 true (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542391 () Bool)

(assert (=> b!542391 (= e!313987 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16464 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542392 () Bool)

(assert (=> b!542392 (and (bvsge (index!21738 lt!247950) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247950) (size!16828 a!3154)))))

(declare-fun res!336876 () Bool)

(assert (=> b!542392 (= res!336876 (= (select (arr!16464 a!3154) (index!21738 lt!247950)) (select (arr!16464 a!3154) j!147)))))

(assert (=> b!542392 (=> res!336876 e!313985)))

(assert (=> b!542392 (= e!313984 e!313985)))

(assert (= (and d!81971 c!63074) b!542390))

(assert (= (and d!81971 (not c!63074)) b!542384))

(assert (= (and b!542384 c!63072) b!542386))

(assert (= (and b!542384 (not c!63072)) b!542391))

(assert (= (and d!81971 c!63073) b!542387))

(assert (= (and d!81971 (not c!63073)) b!542385))

(assert (= (and b!542385 res!336878) b!542392))

(assert (= (and b!542392 (not res!336876)) b!542389))

(assert (= (and b!542389 (not res!336877)) b!542388))

(assert (=> b!542391 m!520721))

(declare-fun m!520841 () Bool)

(assert (=> b!542391 m!520841))

(assert (=> b!542391 m!520841))

(assert (=> b!542391 m!520701))

(declare-fun m!520843 () Bool)

(assert (=> b!542391 m!520843))

(declare-fun m!520845 () Bool)

(assert (=> b!542389 m!520845))

(assert (=> b!542388 m!520845))

(assert (=> d!81971 m!520721))

(declare-fun m!520847 () Bool)

(assert (=> d!81971 m!520847))

(assert (=> d!81971 m!520729))

(assert (=> b!542392 m!520845))

(assert (=> b!542170 d!81971))

(declare-fun d!81973 () Bool)

(declare-fun lt!247956 () (_ BitVec 32))

(declare-fun lt!247955 () (_ BitVec 32))

(assert (=> d!81973 (= lt!247956 (bvmul (bvxor lt!247955 (bvlshr lt!247955 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81973 (= lt!247955 ((_ extract 31 0) (bvand (bvxor (select (arr!16464 a!3154) j!147) (bvlshr (select (arr!16464 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81973 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336879 (let ((h!11443 ((_ extract 31 0) (bvand (bvxor (select (arr!16464 a!3154) j!147) (bvlshr (select (arr!16464 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50799 (bvmul (bvxor h!11443 (bvlshr h!11443 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50799 (bvlshr x!50799 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336879 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336879 #b00000000000000000000000000000000))))))

(assert (=> d!81973 (= (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) (bvand (bvxor lt!247956 (bvlshr lt!247956 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!542170 d!81973))

(declare-fun b!542413 () Bool)

(declare-fun e!314003 () Bool)

(declare-fun call!32070 () Bool)

(assert (=> b!542413 (= e!314003 call!32070)))

(declare-fun bm!32067 () Bool)

(assert (=> bm!32067 (= call!32070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81975 () Bool)

(declare-fun res!336884 () Bool)

(declare-fun e!314002 () Bool)

(assert (=> d!81975 (=> res!336884 e!314002)))

(assert (=> d!81975 (= res!336884 (bvsge #b00000000000000000000000000000000 (size!16828 a!3154)))))

(assert (=> d!81975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314002)))

(declare-fun b!542414 () Bool)

(declare-fun e!314001 () Bool)

(assert (=> b!542414 (= e!314001 call!32070)))

(declare-fun b!542415 () Bool)

(assert (=> b!542415 (= e!314003 e!314001)))

(declare-fun lt!247971 () (_ BitVec 64))

(assert (=> b!542415 (= lt!247971 (select (arr!16464 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16877 0))(
  ( (Unit!16878) )
))
(declare-fun lt!247969 () Unit!16877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34263 (_ BitVec 64) (_ BitVec 32)) Unit!16877)

(assert (=> b!542415 (= lt!247969 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247971 #b00000000000000000000000000000000))))

(assert (=> b!542415 (arrayContainsKey!0 a!3154 lt!247971 #b00000000000000000000000000000000)))

(declare-fun lt!247970 () Unit!16877)

(assert (=> b!542415 (= lt!247970 lt!247969)))

(declare-fun res!336885 () Bool)

(assert (=> b!542415 (= res!336885 (= (seekEntryOrOpen!0 (select (arr!16464 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4878 #b00000000000000000000000000000000)))))

(assert (=> b!542415 (=> (not res!336885) (not e!314001))))

(declare-fun b!542416 () Bool)

(assert (=> b!542416 (= e!314002 e!314003)))

(declare-fun c!63083 () Bool)

(assert (=> b!542416 (= c!63083 (validKeyInArray!0 (select (arr!16464 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81975 (not res!336884)) b!542416))

(assert (= (and b!542416 c!63083) b!542415))

(assert (= (and b!542416 (not c!63083)) b!542413))

(assert (= (and b!542415 res!336885) b!542414))

(assert (= (or b!542414 b!542413) bm!32067))

(declare-fun m!520849 () Bool)

(assert (=> bm!32067 m!520849))

(assert (=> b!542415 m!520751))

(declare-fun m!520851 () Bool)

(assert (=> b!542415 m!520851))

(declare-fun m!520853 () Bool)

(assert (=> b!542415 m!520853))

(assert (=> b!542415 m!520751))

(declare-fun m!520855 () Bool)

(assert (=> b!542415 m!520855))

(assert (=> b!542416 m!520751))

(assert (=> b!542416 m!520751))

(assert (=> b!542416 m!520753))

(assert (=> b!542171 d!81975))

(declare-fun d!81977 () Bool)

(assert (=> d!81977 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49256 d!81977))

(declare-fun d!81985 () Bool)

(assert (=> d!81985 (= (array_inv!12323 a!3154) (bvsge (size!16828 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49256 d!81985))

(declare-fun d!81987 () Bool)

(declare-fun res!336894 () Bool)

(declare-fun e!314016 () Bool)

(assert (=> d!81987 (=> res!336894 e!314016)))

(assert (=> d!81987 (= res!336894 (= (select (arr!16464 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81987 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!314016)))

(declare-fun b!542436 () Bool)

(declare-fun e!314017 () Bool)

(assert (=> b!542436 (= e!314016 e!314017)))

(declare-fun res!336895 () Bool)

(assert (=> b!542436 (=> (not res!336895) (not e!314017))))

(assert (=> b!542436 (= res!336895 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16828 a!3154)))))

(declare-fun b!542437 () Bool)

(assert (=> b!542437 (= e!314017 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81987 (not res!336894)) b!542436))

(assert (= (and b!542436 res!336895) b!542437))

(assert (=> d!81987 m!520751))

(declare-fun m!520879 () Bool)

(assert (=> b!542437 m!520879))

(assert (=> b!542166 d!81987))

(declare-fun b!542438 () Bool)

(declare-fun e!314022 () SeekEntryResult!4878)

(declare-fun e!314021 () SeekEntryResult!4878)

(assert (=> b!542438 (= e!314022 e!314021)))

(declare-fun c!63090 () Bool)

(declare-fun lt!247981 () (_ BitVec 64))

(assert (=> b!542438 (= c!63090 (or (= lt!247981 (select (store (arr!16464 a!3154) i!1153 k!1998) j!147)) (= (bvadd lt!247981 lt!247981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542439 () Bool)

(declare-fun e!314020 () Bool)

(declare-fun e!314018 () Bool)

(assert (=> b!542439 (= e!314020 e!314018)))

(declare-fun res!336898 () Bool)

(declare-fun lt!247982 () SeekEntryResult!4878)

(assert (=> b!542439 (= res!336898 (and (is-Intermediate!4878 lt!247982) (not (undefined!5690 lt!247982)) (bvslt (x!50794 lt!247982) #b01111111111111111111111111111110) (bvsge (x!50794 lt!247982) #b00000000000000000000000000000000) (bvsge (x!50794 lt!247982) x!1030)))))

(assert (=> b!542439 (=> (not res!336898) (not e!314018))))

(declare-fun b!542440 () Bool)

(assert (=> b!542440 (= e!314021 (Intermediate!4878 false index!1177 x!1030))))

(declare-fun b!542441 () Bool)

(assert (=> b!542441 (= e!314020 (bvsge (x!50794 lt!247982) #b01111111111111111111111111111110))))

(declare-fun b!542442 () Bool)

(assert (=> b!542442 (and (bvsge (index!21738 lt!247982) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247982) (size!16828 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)))))))

(declare-fun e!314019 () Bool)

(assert (=> b!542442 (= e!314019 (= (select (arr!16464 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154))) (index!21738 lt!247982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!81989 () Bool)

(assert (=> d!81989 e!314020))

(declare-fun c!63091 () Bool)

(assert (=> d!81989 (= c!63091 (and (is-Intermediate!4878 lt!247982) (undefined!5690 lt!247982)))))

(assert (=> d!81989 (= lt!247982 e!314022)))

(declare-fun c!63092 () Bool)

(assert (=> d!81989 (= c!63092 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81989 (= lt!247981 (select (arr!16464 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154))) index!1177))))

(assert (=> d!81989 (validMask!0 mask!3216)))

(assert (=> d!81989 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16464 a!3154) i!1153 k!1998) j!147) (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)) mask!3216) lt!247982)))

(declare-fun b!542443 () Bool)

(assert (=> b!542443 (and (bvsge (index!21738 lt!247982) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247982) (size!16828 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)))))))

(declare-fun res!336897 () Bool)

(assert (=> b!542443 (= res!336897 (= (select (arr!16464 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154))) (index!21738 lt!247982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542443 (=> res!336897 e!314019)))

(declare-fun b!542444 () Bool)

(assert (=> b!542444 (= e!314022 (Intermediate!4878 true index!1177 x!1030))))

(declare-fun b!542445 () Bool)

(assert (=> b!542445 (= e!314021 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (store (arr!16464 a!3154) i!1153 k!1998) j!147) (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)) mask!3216))))

(declare-fun b!542446 () Bool)

(assert (=> b!542446 (and (bvsge (index!21738 lt!247982) #b00000000000000000000000000000000) (bvslt (index!21738 lt!247982) (size!16828 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154)))))))

(declare-fun res!336896 () Bool)

(assert (=> b!542446 (= res!336896 (= (select (arr!16464 (array!34264 (store (arr!16464 a!3154) i!1153 k!1998) (size!16828 a!3154))) (index!21738 lt!247982)) (select (store (arr!16464 a!3154) i!1153 k!1998) j!147)))))

(assert (=> b!542446 (=> res!336896 e!314019)))

(assert (=> b!542446 (= e!314018 e!314019)))

(assert (= (and d!81989 c!63092) b!542444))

(assert (= (and d!81989 (not c!63092)) b!542438))

(assert (= (and b!542438 c!63090) b!542440))

(assert (= (and b!542438 (not c!63090)) b!542445))

(assert (= (and d!81989 c!63091) b!542441))

(assert (= (and d!81989 (not c!63091)) b!542439))

(assert (= (and b!542439 res!336898) b!542446))

(assert (= (and b!542446 (not res!336896)) b!542443))

(assert (= (and b!542443 (not res!336897)) b!542442))

(assert (=> b!542445 m!520835))

(assert (=> b!542445 m!520835))

(assert (=> b!542445 m!520709))

(declare-fun m!520881 () Bool)

(assert (=> b!542445 m!520881))

(declare-fun m!520883 () Bool)

(assert (=> b!542443 m!520883))

(assert (=> b!542442 m!520883))

(declare-fun m!520885 () Bool)

(assert (=> d!81989 m!520885))

(assert (=> d!81989 m!520729))

(assert (=> b!542446 m!520883))

(assert (=> b!542172 d!81989))

(push 1)

(assert (not b!542382))

(assert (not d!81943))

(assert (not d!81953))

(assert (not b!542223))

(assert (not bm!32067))

(assert (not b!542221))

(assert (not b!542391))

(assert (not bm!32055))

(assert (not b!542437))

(assert (not b!542415))

(assert (not b!542286))

(assert (not b!542416))

(assert (not d!81971))

(assert (not d!81989))

(assert (not b!542445))

(assert (not b!542222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

