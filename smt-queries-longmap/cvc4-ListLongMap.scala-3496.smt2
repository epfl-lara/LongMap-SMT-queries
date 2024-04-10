; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48496 () Bool)

(assert start!48496)

(declare-fun b!532739 () Bool)

(declare-fun res!328087 () Bool)

(declare-fun e!310113 () Bool)

(assert (=> b!532739 (=> (not res!328087) (not e!310113))))

(declare-datatypes ((array!33759 0))(
  ( (array!33760 (arr!16220 (Array (_ BitVec 32) (_ BitVec 64))) (size!16584 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33759)

(declare-datatypes ((List!10339 0))(
  ( (Nil!10336) (Cons!10335 (h!11275 (_ BitVec 64)) (t!16567 List!10339)) )
))
(declare-fun arrayNoDuplicates!0 (array!33759 (_ BitVec 32) List!10339) Bool)

(assert (=> b!532739 (= res!328087 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10336))))

(declare-fun b!532740 () Bool)

(declare-fun res!328085 () Bool)

(assert (=> b!532740 (=> (not res!328085) (not e!310113))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532740 (= res!328085 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16584 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16584 a!3154)) (= (select (arr!16220 a!3154) resIndex!32) (select (arr!16220 a!3154) j!147))))))

(declare-fun b!532742 () Bool)

(declare-fun res!328090 () Bool)

(declare-fun e!310112 () Bool)

(assert (=> b!532742 (=> (not res!328090) (not e!310112))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532742 (= res!328090 (validKeyInArray!0 k!1998))))

(declare-fun b!532743 () Bool)

(declare-fun res!328089 () Bool)

(assert (=> b!532743 (=> (not res!328089) (not e!310112))))

(declare-fun arrayContainsKey!0 (array!33759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532743 (= res!328089 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532744 () Bool)

(declare-fun res!328094 () Bool)

(assert (=> b!532744 (=> (not res!328094) (not e!310112))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532744 (= res!328094 (and (= (size!16584 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16584 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16584 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532745 () Bool)

(declare-fun lt!245271 () (_ BitVec 32))

(assert (=> b!532745 (= e!310113 (and (bvsge mask!3216 #b00000000000000000000000000000000) (or (bvslt lt!245271 #b00000000000000000000000000000000) (bvsge lt!245271 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532745 (= lt!245271 (toIndex!0 (select (arr!16220 a!3154) j!147) mask!3216))))

(declare-fun b!532746 () Bool)

(declare-fun res!328091 () Bool)

(assert (=> b!532746 (=> (not res!328091) (not e!310113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33759 (_ BitVec 32)) Bool)

(assert (=> b!532746 (= res!328091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328092 () Bool)

(assert (=> start!48496 (=> (not res!328092) (not e!310112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48496 (= res!328092 (validMask!0 mask!3216))))

(assert (=> start!48496 e!310112))

(assert (=> start!48496 true))

(declare-fun array_inv!12016 (array!33759) Bool)

(assert (=> start!48496 (array_inv!12016 a!3154)))

(declare-fun b!532741 () Bool)

(assert (=> b!532741 (= e!310112 e!310113)))

(declare-fun res!328086 () Bool)

(assert (=> b!532741 (=> (not res!328086) (not e!310113))))

(declare-datatypes ((SeekEntryResult!4678 0))(
  ( (MissingZero!4678 (index!20936 (_ BitVec 32))) (Found!4678 (index!20937 (_ BitVec 32))) (Intermediate!4678 (undefined!5490 Bool) (index!20938 (_ BitVec 32)) (x!49903 (_ BitVec 32))) (Undefined!4678) (MissingVacant!4678 (index!20939 (_ BitVec 32))) )
))
(declare-fun lt!245272 () SeekEntryResult!4678)

(assert (=> b!532741 (= res!328086 (or (= lt!245272 (MissingZero!4678 i!1153)) (= lt!245272 (MissingVacant!4678 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33759 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!532741 (= lt!245272 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532747 () Bool)

(declare-fun res!328093 () Bool)

(assert (=> b!532747 (=> (not res!328093) (not e!310113))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33759 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!532747 (= res!328093 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16220 a!3154) j!147) a!3154 mask!3216) (Intermediate!4678 false resIndex!32 resX!32)))))

(declare-fun b!532748 () Bool)

(declare-fun res!328088 () Bool)

(assert (=> b!532748 (=> (not res!328088) (not e!310112))))

(assert (=> b!532748 (= res!328088 (validKeyInArray!0 (select (arr!16220 a!3154) j!147)))))

(assert (= (and start!48496 res!328092) b!532744))

(assert (= (and b!532744 res!328094) b!532748))

(assert (= (and b!532748 res!328088) b!532742))

(assert (= (and b!532742 res!328090) b!532743))

(assert (= (and b!532743 res!328089) b!532741))

(assert (= (and b!532741 res!328086) b!532746))

(assert (= (and b!532746 res!328091) b!532739))

(assert (= (and b!532739 res!328087) b!532740))

(assert (= (and b!532740 res!328085) b!532747))

(assert (= (and b!532747 res!328093) b!532745))

(declare-fun m!512829 () Bool)

(assert (=> b!532740 m!512829))

(declare-fun m!512831 () Bool)

(assert (=> b!532740 m!512831))

(declare-fun m!512833 () Bool)

(assert (=> b!532739 m!512833))

(declare-fun m!512835 () Bool)

(assert (=> b!532743 m!512835))

(assert (=> b!532745 m!512831))

(assert (=> b!532745 m!512831))

(declare-fun m!512837 () Bool)

(assert (=> b!532745 m!512837))

(declare-fun m!512839 () Bool)

(assert (=> start!48496 m!512839))

(declare-fun m!512841 () Bool)

(assert (=> start!48496 m!512841))

(assert (=> b!532747 m!512831))

(assert (=> b!532747 m!512831))

(declare-fun m!512843 () Bool)

(assert (=> b!532747 m!512843))

(declare-fun m!512845 () Bool)

(assert (=> b!532746 m!512845))

(assert (=> b!532748 m!512831))

(assert (=> b!532748 m!512831))

(declare-fun m!512847 () Bool)

(assert (=> b!532748 m!512847))

(declare-fun m!512849 () Bool)

(assert (=> b!532741 m!512849))

(declare-fun m!512851 () Bool)

(assert (=> b!532742 m!512851))

(push 1)

(assert (not b!532743))

(assert (not b!532745))

(assert (not b!532746))

(assert (not b!532748))

(assert (not b!532742))

(assert (not b!532739))

(assert (not start!48496))

(assert (not b!532741))

(assert (not b!532747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!532827 () Bool)

(declare-fun e!310163 () SeekEntryResult!4678)

(declare-fun e!310162 () SeekEntryResult!4678)

(assert (=> b!532827 (= e!310163 e!310162)))

(declare-fun lt!245289 () (_ BitVec 64))

(declare-fun c!62663 () Bool)

(assert (=> b!532827 (= c!62663 (or (= lt!245289 (select (arr!16220 a!3154) j!147)) (= (bvadd lt!245289 lt!245289) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!532828 () Bool)

(declare-fun lt!245290 () SeekEntryResult!4678)

(assert (=> b!532828 (and (bvsge (index!20938 lt!245290) #b00000000000000000000000000000000) (bvslt (index!20938 lt!245290) (size!16584 a!3154)))))

(declare-fun res!328126 () Bool)

(assert (=> b!532828 (= res!328126 (= (select (arr!16220 a!3154) (index!20938 lt!245290)) (select (arr!16220 a!3154) j!147)))))

(declare-fun e!310160 () Bool)

(assert (=> b!532828 (=> res!328126 e!310160)))

(declare-fun e!310164 () Bool)

(assert (=> b!532828 (= e!310164 e!310160)))

(declare-fun b!532829 () Bool)

(assert (=> b!532829 (= e!310162 (Intermediate!4678 false index!1177 x!1030))))

(declare-fun b!532830 () Bool)

(assert (=> b!532830 (and (bvsge (index!20938 lt!245290) #b00000000000000000000000000000000) (bvslt (index!20938 lt!245290) (size!16584 a!3154)))))

(assert (=> b!532830 (= e!310160 (= (select (arr!16220 a!3154) (index!20938 lt!245290)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!532831 () Bool)

(assert (=> b!532831 (= e!310163 (Intermediate!4678 true index!1177 x!1030))))

(declare-fun d!81403 () Bool)

(declare-fun e!310161 () Bool)

(assert (=> d!81403 e!310161))

(declare-fun c!62661 () Bool)

(assert (=> d!81403 (= c!62661 (and (is-Intermediate!4678 lt!245290) (undefined!5490 lt!245290)))))

(assert (=> d!81403 (= lt!245290 e!310163)))

(declare-fun c!62662 () Bool)

(assert (=> d!81403 (= c!62662 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81403 (= lt!245289 (select (arr!16220 a!3154) index!1177))))

(assert (=> d!81403 (validMask!0 mask!3216)))

(assert (=> d!81403 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16220 a!3154) j!147) a!3154 mask!3216) lt!245290)))

(declare-fun b!532832 () Bool)

(assert (=> b!532832 (= e!310161 e!310164)))

(declare-fun res!328127 () Bool)

(assert (=> b!532832 (= res!328127 (and (is-Intermediate!4678 lt!245290) (not (undefined!5490 lt!245290)) (bvslt (x!49903 lt!245290) #b01111111111111111111111111111110) (bvsge (x!49903 lt!245290) #b00000000000000000000000000000000) (bvsge (x!49903 lt!245290) x!1030)))))

(assert (=> b!532832 (=> (not res!328127) (not e!310164))))

(declare-fun b!532833 () Bool)

(assert (=> b!532833 (= e!310161 (bvsge (x!49903 lt!245290) #b01111111111111111111111111111110))))

(declare-fun b!532834 () Bool)

(assert (=> b!532834 (and (bvsge (index!20938 lt!245290) #b00000000000000000000000000000000) (bvslt (index!20938 lt!245290) (size!16584 a!3154)))))

(declare-fun res!328125 () Bool)

(assert (=> b!532834 (= res!328125 (= (select (arr!16220 a!3154) (index!20938 lt!245290)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532834 (=> res!328125 e!310160)))

(declare-fun b!532835 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532835 (= e!310162 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16220 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!81403 c!62662) b!532831))

(assert (= (and d!81403 (not c!62662)) b!532827))

(assert (= (and b!532827 c!62663) b!532829))

(assert (= (and b!532827 (not c!62663)) b!532835))

(assert (= (and d!81403 c!62661) b!532833))

(assert (= (and d!81403 (not c!62661)) b!532832))

(assert (= (and b!532832 res!328127) b!532828))

(assert (= (and b!532828 (not res!328126)) b!532834))

(assert (= (and b!532834 (not res!328125)) b!532830))

(declare-fun m!512873 () Bool)

(assert (=> b!532835 m!512873))

(assert (=> b!532835 m!512873))

(assert (=> b!532835 m!512831))

(declare-fun m!512875 () Bool)

(assert (=> b!532835 m!512875))

(declare-fun m!512877 () Bool)

(assert (=> d!81403 m!512877))

(assert (=> d!81403 m!512839))

(declare-fun m!512879 () Bool)

(assert (=> b!532830 m!512879))

(assert (=> b!532834 m!512879))

(assert (=> b!532828 m!512879))

(assert (=> b!532747 d!81403))

(declare-fun d!81413 () Bool)

(assert (=> d!81413 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532742 d!81413))

(declare-fun d!81415 () Bool)

(assert (=> d!81415 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48496 d!81415))

(declare-fun d!81425 () Bool)

(assert (=> d!81425 (= (array_inv!12016 a!3154) (bvsge (size!16584 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48496 d!81425))

(declare-fun d!81427 () Bool)

(assert (=> d!81427 (= (validKeyInArray!0 (select (arr!16220 a!3154) j!147)) (and (not (= (select (arr!16220 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16220 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!532748 d!81427))

(declare-fun d!81429 () Bool)

(declare-fun res!328147 () Bool)

(declare-fun e!310190 () Bool)

(assert (=> d!81429 (=> res!328147 e!310190)))

(assert (=> d!81429 (= res!328147 (= (select (arr!16220 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81429 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!310190)))

(declare-fun b!532867 () Bool)

(declare-fun e!310191 () Bool)

(assert (=> b!532867 (= e!310190 e!310191)))

(declare-fun res!328148 () Bool)

(assert (=> b!532867 (=> (not res!328148) (not e!310191))))

(assert (=> b!532867 (= res!328148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16584 a!3154)))))

(declare-fun b!532868 () Bool)

(assert (=> b!532868 (= e!310191 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81429 (not res!328147)) b!532867))

(assert (= (and b!532867 res!328148) b!532868))

(declare-fun m!512891 () Bool)

(assert (=> d!81429 m!512891))

(declare-fun m!512893 () Bool)

(assert (=> b!532868 m!512893))

(assert (=> b!532743 d!81429))

(declare-fun bm!31985 () Bool)

(declare-fun call!31988 () Bool)

(declare-fun c!62678 () Bool)

(assert (=> bm!31985 (= call!31988 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62678 (Cons!10335 (select (arr!16220 a!3154) #b00000000000000000000000000000000) Nil!10336) Nil!10336)))))

(declare-fun b!532891 () Bool)

(declare-fun e!310209 () Bool)

(declare-fun e!310207 () Bool)

(assert (=> b!532891 (= e!310209 e!310207)))

(declare-fun res!328158 () Bool)

(assert (=> b!532891 (=> (not res!328158) (not e!310207))))

(declare-fun e!310206 () Bool)

(assert (=> b!532891 (= res!328158 (not e!310206))))

(declare-fun res!328156 () Bool)

(assert (=> b!532891 (=> (not res!328156) (not e!310206))))

(assert (=> b!532891 (= res!328156 (validKeyInArray!0 (select (arr!16220 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81431 () Bool)

(declare-fun res!328157 () Bool)

(assert (=> d!81431 (=> res!328157 e!310209)))

(assert (=> d!81431 (= res!328157 (bvsge #b00000000000000000000000000000000 (size!16584 a!3154)))))

(assert (=> d!81431 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10336) e!310209)))

(declare-fun b!532892 () Bool)

(declare-fun e!310208 () Bool)

(assert (=> b!532892 (= e!310208 call!31988)))

(declare-fun b!532893 () Bool)

(assert (=> b!532893 (= e!310208 call!31988)))

(declare-fun b!532894 () Bool)

(assert (=> b!532894 (= e!310207 e!310208)))

(assert (=> b!532894 (= c!62678 (validKeyInArray!0 (select (arr!16220 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532895 () Bool)

(declare-fun contains!2792 (List!10339 (_ BitVec 64)) Bool)

(assert (=> b!532895 (= e!310206 (contains!2792 Nil!10336 (select (arr!16220 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81431 (not res!328157)) b!532891))

(assert (= (and b!532891 res!328156) b!532895))

(assert (= (and b!532891 res!328158) b!532894))

(assert (= (and b!532894 c!62678) b!532893))

(assert (= (and b!532894 (not c!62678)) b!532892))

(assert (= (or b!532893 b!532892) bm!31985))

(assert (=> bm!31985 m!512891))

(declare-fun m!512899 () Bool)

(assert (=> bm!31985 m!512899))

(assert (=> b!532891 m!512891))

(assert (=> b!532891 m!512891))

(declare-fun m!512901 () Bool)

(assert (=> b!532891 m!512901))

(assert (=> b!532894 m!512891))

(assert (=> b!532894 m!512891))

(assert (=> b!532894 m!512901))

(assert (=> b!532895 m!512891))

(assert (=> b!532895 m!512891))

(declare-fun m!512903 () Bool)

(assert (=> b!532895 m!512903))

(assert (=> b!532739 d!81431))

(declare-fun d!81437 () Bool)

(declare-fun lt!245320 () (_ BitVec 32))

(declare-fun lt!245319 () (_ BitVec 32))

(assert (=> d!81437 (= lt!245320 (bvmul (bvxor lt!245319 (bvlshr lt!245319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81437 (= lt!245319 ((_ extract 31 0) (bvand (bvxor (select (arr!16220 a!3154) j!147) (bvlshr (select (arr!16220 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81437 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!328159 (let ((h!11277 ((_ extract 31 0) (bvand (bvxor (select (arr!16220 a!3154) j!147) (bvlshr (select (arr!16220 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49908 (bvmul (bvxor h!11277 (bvlshr h!11277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49908 (bvlshr x!49908 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!328159 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!328159 #b00000000000000000000000000000000))))))

(assert (=> d!81437 (= (toIndex!0 (select (arr!16220 a!3154) j!147) mask!3216) (bvand (bvxor lt!245320 (bvlshr lt!245320 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!532745 d!81437))

(declare-fun b!532928 () Bool)

(declare-fun e!310233 () Bool)

(declare-fun call!31991 () Bool)

(assert (=> b!532928 (= e!310233 call!31991)))

(declare-fun b!532929 () Bool)

(declare-fun e!310231 () Bool)

(assert (=> b!532929 (= e!310233 e!310231)))

(declare-fun lt!245340 () (_ BitVec 64))

(assert (=> b!532929 (= lt!245340 (select (arr!16220 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16846 0))(
  ( (Unit!16847) )
))
(declare-fun lt!245341 () Unit!16846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33759 (_ BitVec 64) (_ BitVec 32)) Unit!16846)

(assert (=> b!532929 (= lt!245341 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245340 #b00000000000000000000000000000000))))

(assert (=> b!532929 (arrayContainsKey!0 a!3154 lt!245340 #b00000000000000000000000000000000)))

(declare-fun lt!245339 () Unit!16846)

(assert (=> b!532929 (= lt!245339 lt!245341)))

(declare-fun res!328171 () Bool)

(assert (=> b!532929 (= res!328171 (= (seekEntryOrOpen!0 (select (arr!16220 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4678 #b00000000000000000000000000000000)))))

(assert (=> b!532929 (=> (not res!328171) (not e!310231))))

(declare-fun bm!31988 () Bool)

(assert (=> bm!31988 (= call!31991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81441 () Bool)

(declare-fun res!328172 () Bool)

(declare-fun e!310232 () Bool)

(assert (=> d!81441 (=> res!328172 e!310232)))

(assert (=> d!81441 (= res!328172 (bvsge #b00000000000000000000000000000000 (size!16584 a!3154)))))

(assert (=> d!81441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!310232)))

(declare-fun b!532930 () Bool)

(assert (=> b!532930 (= e!310232 e!310233)))

(declare-fun c!62690 () Bool)

(assert (=> b!532930 (= c!62690 (validKeyInArray!0 (select (arr!16220 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532931 () Bool)

(assert (=> b!532931 (= e!310231 call!31991)))

(assert (= (and d!81441 (not res!328172)) b!532930))

(assert (= (and b!532930 c!62690) b!532929))

(assert (= (and b!532930 (not c!62690)) b!532928))

(assert (= (and b!532929 res!328171) b!532931))

(assert (= (or b!532931 b!532928) bm!31988))

(assert (=> b!532929 m!512891))

(declare-fun m!512923 () Bool)

(assert (=> b!532929 m!512923))

(declare-fun m!512925 () Bool)

(assert (=> b!532929 m!512925))

(assert (=> b!532929 m!512891))

(declare-fun m!512927 () Bool)

(assert (=> b!532929 m!512927))

(declare-fun m!512929 () Bool)

(assert (=> bm!31988 m!512929))

(assert (=> b!532930 m!512891))

(assert (=> b!532930 m!512891))

(assert (=> b!532930 m!512901))

(assert (=> b!532746 d!81441))

(declare-fun b!532977 () Bool)

(declare-fun c!62706 () Bool)

(declare-fun lt!245362 () (_ BitVec 64))

(assert (=> b!532977 (= c!62706 (= lt!245362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!310266 () SeekEntryResult!4678)

(declare-fun e!310265 () SeekEntryResult!4678)

(assert (=> b!532977 (= e!310266 e!310265)))

(declare-fun b!532978 () Bool)

(declare-fun lt!245361 () SeekEntryResult!4678)

(assert (=> b!532978 (= e!310265 (MissingZero!4678 (index!20938 lt!245361)))))

(declare-fun b!532979 () Bool)

(declare-fun e!310264 () SeekEntryResult!4678)

(assert (=> b!532979 (= e!310264 e!310266)))

(assert (=> b!532979 (= lt!245362 (select (arr!16220 a!3154) (index!20938 lt!245361)))))

(declare-fun c!62708 () Bool)

(assert (=> b!532979 (= c!62708 (= lt!245362 k!1998))))

(declare-fun b!532980 () Bool)

(assert (=> b!532980 (= e!310266 (Found!4678 (index!20938 lt!245361)))))

(declare-fun d!81449 () Bool)

(declare-fun lt!245360 () SeekEntryResult!4678)

(assert (=> d!81449 (and (or (is-Undefined!4678 lt!245360) (not (is-Found!4678 lt!245360)) (and (bvsge (index!20937 lt!245360) #b00000000000000000000000000000000) (bvslt (index!20937 lt!245360) (size!16584 a!3154)))) (or (is-Undefined!4678 lt!245360) (is-Found!4678 lt!245360) (not (is-MissingZero!4678 lt!245360)) (and (bvsge (index!20936 lt!245360) #b00000000000000000000000000000000) (bvslt (index!20936 lt!245360) (size!16584 a!3154)))) (or (is-Undefined!4678 lt!245360) (is-Found!4678 lt!245360) (is-MissingZero!4678 lt!245360) (not (is-MissingVacant!4678 lt!245360)) (and (bvsge (index!20939 lt!245360) #b00000000000000000000000000000000) (bvslt (index!20939 lt!245360) (size!16584 a!3154)))) (or (is-Undefined!4678 lt!245360) (ite (is-Found!4678 lt!245360) (= (select (arr!16220 a!3154) (index!20937 lt!245360)) k!1998) (ite (is-MissingZero!4678 lt!245360) (= (select (arr!16220 a!3154) (index!20936 lt!245360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4678 lt!245360) (= (select (arr!16220 a!3154) (index!20939 lt!245360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81449 (= lt!245360 e!310264)))

(declare-fun c!62707 () Bool)

(assert (=> d!81449 (= c!62707 (and (is-Intermediate!4678 lt!245361) (undefined!5490 lt!245361)))))

(assert (=> d!81449 (= lt!245361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81449 (validMask!0 mask!3216)))

(assert (=> d!81449 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!245360)))

(declare-fun b!532981 () Bool)

(assert (=> b!532981 (= e!310264 Undefined!4678)))

(declare-fun b!532982 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33759 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!532982 (= e!310265 (seekKeyOrZeroReturnVacant!0 (x!49903 lt!245361) (index!20938 lt!245361) (index!20938 lt!245361) k!1998 a!3154 mask!3216))))

(assert (= (and d!81449 c!62707) b!532981))

(assert (= (and d!81449 (not c!62707)) b!532979))

(assert (= (and b!532979 c!62708) b!532980))

(assert (= (and b!532979 (not c!62708)) b!532977))

(assert (= (and b!532977 c!62706) b!532978))

(assert (= (and b!532977 (not c!62706)) b!532982))

(declare-fun m!512959 () Bool)

(assert (=> b!532979 m!512959))

(declare-fun m!512961 () Bool)

(assert (=> d!81449 m!512961))

(declare-fun m!512963 () Bool)

(assert (=> d!81449 m!512963))

(assert (=> d!81449 m!512961))

(declare-fun m!512965 () Bool)

(assert (=> d!81449 m!512965))

(assert (=> d!81449 m!512839))

(declare-fun m!512967 () Bool)

(assert (=> d!81449 m!512967))

(declare-fun m!512969 () Bool)

(assert (=> d!81449 m!512969))

(declare-fun m!512971 () Bool)

(assert (=> b!532982 m!512971))

(assert (=> b!532741 d!81449))

(push 1)

(assert (not b!532835))

(assert (not b!532895))

(assert (not b!532868))

(assert (not bm!31988))

(assert (not d!81449))

(assert (not bm!31985))

(assert (not b!532930))

(assert (not d!81403))

(assert (not b!532982))

(assert (not b!532929))

(assert (not b!532894))

(assert (not b!532891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

