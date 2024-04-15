; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49116 () Bool)

(assert start!49116)

(declare-fun b!540987 () Bool)

(declare-fun res!336018 () Bool)

(declare-fun e!313236 () Bool)

(assert (=> b!540987 (=> (not res!336018) (not e!313236))))

(declare-datatypes ((array!34236 0))(
  ( (array!34237 (arr!16454 (Array (_ BitVec 32) (_ BitVec 64))) (size!16819 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34236)

(declare-datatypes ((List!10612 0))(
  ( (Nil!10609) (Cons!10608 (h!11557 (_ BitVec 64)) (t!16831 List!10612)) )
))
(declare-fun arrayNoDuplicates!0 (array!34236 (_ BitVec 32) List!10612) Bool)

(assert (=> b!540987 (= res!336018 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10609))))

(declare-fun res!336022 () Bool)

(declare-fun e!313237 () Bool)

(assert (=> start!49116 (=> (not res!336022) (not e!313237))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49116 (= res!336022 (validMask!0 mask!3216))))

(assert (=> start!49116 e!313237))

(assert (=> start!49116 true))

(declare-fun array_inv!12337 (array!34236) Bool)

(assert (=> start!49116 (array_inv!12337 a!3154)))

(declare-fun b!540988 () Bool)

(declare-fun e!313238 () Bool)

(assert (=> b!540988 (= e!313236 e!313238)))

(declare-fun res!336020 () Bool)

(assert (=> b!540988 (=> (not res!336020) (not e!313238))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4909 0))(
  ( (MissingZero!4909 (index!21860 (_ BitVec 32))) (Found!4909 (index!21861 (_ BitVec 32))) (Intermediate!4909 (undefined!5721 Bool) (index!21862 (_ BitVec 32)) (x!50779 (_ BitVec 32))) (Undefined!4909) (MissingVacant!4909 (index!21863 (_ BitVec 32))) )
))
(declare-fun lt!247350 () SeekEntryResult!4909)

(assert (=> b!540988 (= res!336020 (= lt!247350 (Intermediate!4909 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34236 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!540988 (= lt!247350 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16454 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540989 () Bool)

(declare-fun res!336019 () Bool)

(assert (=> b!540989 (=> (not res!336019) (not e!313237))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540989 (= res!336019 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540990 () Bool)

(assert (=> b!540990 (= e!313237 e!313236)))

(declare-fun res!336017 () Bool)

(assert (=> b!540990 (=> (not res!336017) (not e!313236))))

(declare-fun lt!247351 () SeekEntryResult!4909)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540990 (= res!336017 (or (= lt!247351 (MissingZero!4909 i!1153)) (= lt!247351 (MissingVacant!4909 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34236 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!540990 (= lt!247351 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540991 () Bool)

(assert (=> b!540991 (= e!313238 (and (not (= (select (arr!16454 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16454 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16454 a!3154) index!1177) (select (arr!16454 a!3154) j!147)) (not (= index!1177 resIndex!32))))))

(declare-fun b!540992 () Bool)

(declare-fun res!336021 () Bool)

(assert (=> b!540992 (=> (not res!336021) (not e!313237))))

(assert (=> b!540992 (= res!336021 (and (= (size!16819 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16819 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16819 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540993 () Bool)

(declare-fun res!336023 () Bool)

(assert (=> b!540993 (=> (not res!336023) (not e!313236))))

(assert (=> b!540993 (= res!336023 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16819 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16819 a!3154)) (= (select (arr!16454 a!3154) resIndex!32) (select (arr!16454 a!3154) j!147))))))

(declare-fun b!540994 () Bool)

(declare-fun res!336016 () Bool)

(assert (=> b!540994 (=> (not res!336016) (not e!313237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540994 (= res!336016 (validKeyInArray!0 (select (arr!16454 a!3154) j!147)))))

(declare-fun b!540995 () Bool)

(declare-fun res!336025 () Bool)

(assert (=> b!540995 (=> (not res!336025) (not e!313236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34236 (_ BitVec 32)) Bool)

(assert (=> b!540995 (= res!336025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540996 () Bool)

(declare-fun res!336026 () Bool)

(assert (=> b!540996 (=> (not res!336026) (not e!313238))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540996 (= res!336026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) (select (arr!16454 a!3154) j!147) a!3154 mask!3216) lt!247350))))

(declare-fun b!540997 () Bool)

(declare-fun res!336024 () Bool)

(assert (=> b!540997 (=> (not res!336024) (not e!313237))))

(assert (=> b!540997 (= res!336024 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49116 res!336022) b!540992))

(assert (= (and b!540992 res!336021) b!540994))

(assert (= (and b!540994 res!336016) b!540997))

(assert (= (and b!540997 res!336024) b!540989))

(assert (= (and b!540989 res!336019) b!540990))

(assert (= (and b!540990 res!336017) b!540995))

(assert (= (and b!540995 res!336025) b!540987))

(assert (= (and b!540987 res!336018) b!540993))

(assert (= (and b!540993 res!336023) b!540988))

(assert (= (and b!540988 res!336020) b!540996))

(assert (= (and b!540996 res!336026) b!540991))

(declare-fun m!519103 () Bool)

(assert (=> b!540988 m!519103))

(assert (=> b!540988 m!519103))

(declare-fun m!519105 () Bool)

(assert (=> b!540988 m!519105))

(assert (=> b!540996 m!519103))

(assert (=> b!540996 m!519103))

(declare-fun m!519107 () Bool)

(assert (=> b!540996 m!519107))

(assert (=> b!540996 m!519107))

(assert (=> b!540996 m!519103))

(declare-fun m!519109 () Bool)

(assert (=> b!540996 m!519109))

(declare-fun m!519111 () Bool)

(assert (=> b!540987 m!519111))

(declare-fun m!519113 () Bool)

(assert (=> b!540990 m!519113))

(declare-fun m!519115 () Bool)

(assert (=> b!540993 m!519115))

(assert (=> b!540993 m!519103))

(declare-fun m!519117 () Bool)

(assert (=> b!540989 m!519117))

(declare-fun m!519119 () Bool)

(assert (=> b!540997 m!519119))

(declare-fun m!519121 () Bool)

(assert (=> b!540991 m!519121))

(assert (=> b!540991 m!519103))

(declare-fun m!519123 () Bool)

(assert (=> b!540995 m!519123))

(declare-fun m!519125 () Bool)

(assert (=> start!49116 m!519125))

(declare-fun m!519127 () Bool)

(assert (=> start!49116 m!519127))

(assert (=> b!540994 m!519103))

(assert (=> b!540994 m!519103))

(declare-fun m!519129 () Bool)

(assert (=> b!540994 m!519129))

(check-sat (not b!540995) (not b!540989) (not b!540987) (not start!49116) (not b!540997) (not b!540988) (not b!540996) (not b!540994) (not b!540990))
(check-sat)
(get-model)

(declare-fun d!81541 () Bool)

(assert (=> d!81541 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49116 d!81541))

(declare-fun d!81543 () Bool)

(assert (=> d!81543 (= (array_inv!12337 a!3154) (bvsge (size!16819 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49116 d!81543))

(declare-fun b!541098 () Bool)

(declare-fun e!313291 () Bool)

(declare-fun lt!247368 () SeekEntryResult!4909)

(assert (=> b!541098 (= e!313291 (bvsge (x!50779 lt!247368) #b01111111111111111111111111111110))))

(declare-fun b!541099 () Bool)

(declare-fun e!313292 () Bool)

(assert (=> b!541099 (= e!313291 e!313292)))

(declare-fun res!336112 () Bool)

(get-info :version)

(assert (=> b!541099 (= res!336112 (and ((_ is Intermediate!4909) lt!247368) (not (undefined!5721 lt!247368)) (bvslt (x!50779 lt!247368) #b01111111111111111111111111111110) (bvsge (x!50779 lt!247368) #b00000000000000000000000000000000) (bvsge (x!50779 lt!247368) x!1030)))))

(assert (=> b!541099 (=> (not res!336112) (not e!313292))))

(declare-fun b!541100 () Bool)

(declare-fun e!313289 () SeekEntryResult!4909)

(assert (=> b!541100 (= e!313289 (Intermediate!4909 true index!1177 x!1030))))

(declare-fun b!541101 () Bool)

(declare-fun e!313290 () SeekEntryResult!4909)

(assert (=> b!541101 (= e!313290 (Intermediate!4909 false index!1177 x!1030))))

(declare-fun b!541102 () Bool)

(assert (=> b!541102 (and (bvsge (index!21862 lt!247368) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247368) (size!16819 a!3154)))))

(declare-fun res!336113 () Bool)

(assert (=> b!541102 (= res!336113 (= (select (arr!16454 a!3154) (index!21862 lt!247368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313288 () Bool)

(assert (=> b!541102 (=> res!336113 e!313288)))

(declare-fun b!541103 () Bool)

(assert (=> b!541103 (and (bvsge (index!21862 lt!247368) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247368) (size!16819 a!3154)))))

(declare-fun res!336111 () Bool)

(assert (=> b!541103 (= res!336111 (= (select (arr!16454 a!3154) (index!21862 lt!247368)) (select (arr!16454 a!3154) j!147)))))

(assert (=> b!541103 (=> res!336111 e!313288)))

(assert (=> b!541103 (= e!313292 e!313288)))

(declare-fun b!541105 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541105 (= e!313290 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16454 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541106 () Bool)

(assert (=> b!541106 (and (bvsge (index!21862 lt!247368) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247368) (size!16819 a!3154)))))

(assert (=> b!541106 (= e!313288 (= (select (arr!16454 a!3154) (index!21862 lt!247368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541104 () Bool)

(assert (=> b!541104 (= e!313289 e!313290)))

(declare-fun lt!247369 () (_ BitVec 64))

(declare-fun c!62808 () Bool)

(assert (=> b!541104 (= c!62808 (or (= lt!247369 (select (arr!16454 a!3154) j!147)) (= (bvadd lt!247369 lt!247369) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!81545 () Bool)

(assert (=> d!81545 e!313291))

(declare-fun c!62809 () Bool)

(assert (=> d!81545 (= c!62809 (and ((_ is Intermediate!4909) lt!247368) (undefined!5721 lt!247368)))))

(assert (=> d!81545 (= lt!247368 e!313289)))

(declare-fun c!62810 () Bool)

(assert (=> d!81545 (= c!62810 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81545 (= lt!247369 (select (arr!16454 a!3154) index!1177))))

(assert (=> d!81545 (validMask!0 mask!3216)))

(assert (=> d!81545 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16454 a!3154) j!147) a!3154 mask!3216) lt!247368)))

(assert (= (and d!81545 c!62810) b!541100))

(assert (= (and d!81545 (not c!62810)) b!541104))

(assert (= (and b!541104 c!62808) b!541101))

(assert (= (and b!541104 (not c!62808)) b!541105))

(assert (= (and d!81545 c!62809) b!541098))

(assert (= (and d!81545 (not c!62809)) b!541099))

(assert (= (and b!541099 res!336112) b!541103))

(assert (= (and b!541103 (not res!336111)) b!541102))

(assert (= (and b!541102 (not res!336113)) b!541106))

(declare-fun m!519191 () Bool)

(assert (=> b!541102 m!519191))

(assert (=> d!81545 m!519121))

(assert (=> d!81545 m!519125))

(assert (=> b!541106 m!519191))

(declare-fun m!519193 () Bool)

(assert (=> b!541105 m!519193))

(assert (=> b!541105 m!519193))

(assert (=> b!541105 m!519103))

(declare-fun m!519195 () Bool)

(assert (=> b!541105 m!519195))

(assert (=> b!541103 m!519191))

(assert (=> b!540988 d!81545))

(declare-fun bm!32011 () Bool)

(declare-fun call!32014 () Bool)

(declare-fun c!62814 () Bool)

(assert (=> bm!32011 (= call!32014 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62814 (Cons!10608 (select (arr!16454 a!3154) #b00000000000000000000000000000000) Nil!10609) Nil!10609)))))

(declare-fun b!541122 () Bool)

(declare-fun e!313305 () Bool)

(assert (=> b!541122 (= e!313305 call!32014)))

(declare-fun b!541123 () Bool)

(declare-fun e!313308 () Bool)

(declare-fun e!313306 () Bool)

(assert (=> b!541123 (= e!313308 e!313306)))

(declare-fun res!336124 () Bool)

(assert (=> b!541123 (=> (not res!336124) (not e!313306))))

(declare-fun e!313307 () Bool)

(assert (=> b!541123 (= res!336124 (not e!313307))))

(declare-fun res!336125 () Bool)

(assert (=> b!541123 (=> (not res!336125) (not e!313307))))

(assert (=> b!541123 (= res!336125 (validKeyInArray!0 (select (arr!16454 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81561 () Bool)

(declare-fun res!336123 () Bool)

(assert (=> d!81561 (=> res!336123 e!313308)))

(assert (=> d!81561 (= res!336123 (bvsge #b00000000000000000000000000000000 (size!16819 a!3154)))))

(assert (=> d!81561 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10609) e!313308)))

(declare-fun b!541124 () Bool)

(declare-fun contains!2779 (List!10612 (_ BitVec 64)) Bool)

(assert (=> b!541124 (= e!313307 (contains!2779 Nil!10609 (select (arr!16454 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541125 () Bool)

(assert (=> b!541125 (= e!313305 call!32014)))

(declare-fun b!541126 () Bool)

(assert (=> b!541126 (= e!313306 e!313305)))

(assert (=> b!541126 (= c!62814 (validKeyInArray!0 (select (arr!16454 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81561 (not res!336123)) b!541123))

(assert (= (and b!541123 res!336125) b!541124))

(assert (= (and b!541123 res!336124) b!541126))

(assert (= (and b!541126 c!62814) b!541125))

(assert (= (and b!541126 (not c!62814)) b!541122))

(assert (= (or b!541125 b!541122) bm!32011))

(declare-fun m!519205 () Bool)

(assert (=> bm!32011 m!519205))

(declare-fun m!519207 () Bool)

(assert (=> bm!32011 m!519207))

(assert (=> b!541123 m!519205))

(assert (=> b!541123 m!519205))

(declare-fun m!519209 () Bool)

(assert (=> b!541123 m!519209))

(assert (=> b!541124 m!519205))

(assert (=> b!541124 m!519205))

(declare-fun m!519211 () Bool)

(assert (=> b!541124 m!519211))

(assert (=> b!541126 m!519205))

(assert (=> b!541126 m!519205))

(assert (=> b!541126 m!519209))

(assert (=> b!540987 d!81561))

(declare-fun d!81565 () Bool)

(assert (=> d!81565 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540997 d!81565))

(declare-fun b!541127 () Bool)

(declare-fun e!313312 () Bool)

(declare-fun lt!247370 () SeekEntryResult!4909)

(assert (=> b!541127 (= e!313312 (bvsge (x!50779 lt!247370) #b01111111111111111111111111111110))))

(declare-fun b!541128 () Bool)

(declare-fun e!313313 () Bool)

(assert (=> b!541128 (= e!313312 e!313313)))

(declare-fun res!336127 () Bool)

(assert (=> b!541128 (= res!336127 (and ((_ is Intermediate!4909) lt!247370) (not (undefined!5721 lt!247370)) (bvslt (x!50779 lt!247370) #b01111111111111111111111111111110) (bvsge (x!50779 lt!247370) #b00000000000000000000000000000000) (bvsge (x!50779 lt!247370) #b00000000000000000000000000000000)))))

(assert (=> b!541128 (=> (not res!336127) (not e!313313))))

(declare-fun b!541129 () Bool)

(declare-fun e!313310 () SeekEntryResult!4909)

(assert (=> b!541129 (= e!313310 (Intermediate!4909 true (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541130 () Bool)

(declare-fun e!313311 () SeekEntryResult!4909)

(assert (=> b!541130 (= e!313311 (Intermediate!4909 false (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541131 () Bool)

(assert (=> b!541131 (and (bvsge (index!21862 lt!247370) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247370) (size!16819 a!3154)))))

(declare-fun res!336128 () Bool)

(assert (=> b!541131 (= res!336128 (= (select (arr!16454 a!3154) (index!21862 lt!247370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313309 () Bool)

(assert (=> b!541131 (=> res!336128 e!313309)))

(declare-fun b!541132 () Bool)

(assert (=> b!541132 (and (bvsge (index!21862 lt!247370) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247370) (size!16819 a!3154)))))

(declare-fun res!336126 () Bool)

(assert (=> b!541132 (= res!336126 (= (select (arr!16454 a!3154) (index!21862 lt!247370)) (select (arr!16454 a!3154) j!147)))))

(assert (=> b!541132 (=> res!336126 e!313309)))

(assert (=> b!541132 (= e!313313 e!313309)))

(declare-fun b!541134 () Bool)

(assert (=> b!541134 (= e!313311 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16454 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541135 () Bool)

(assert (=> b!541135 (and (bvsge (index!21862 lt!247370) #b00000000000000000000000000000000) (bvslt (index!21862 lt!247370) (size!16819 a!3154)))))

(assert (=> b!541135 (= e!313309 (= (select (arr!16454 a!3154) (index!21862 lt!247370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541133 () Bool)

(assert (=> b!541133 (= e!313310 e!313311)))

(declare-fun c!62815 () Bool)

(declare-fun lt!247371 () (_ BitVec 64))

(assert (=> b!541133 (= c!62815 (or (= lt!247371 (select (arr!16454 a!3154) j!147)) (= (bvadd lt!247371 lt!247371) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!81567 () Bool)

(assert (=> d!81567 e!313312))

(declare-fun c!62816 () Bool)

(assert (=> d!81567 (= c!62816 (and ((_ is Intermediate!4909) lt!247370) (undefined!5721 lt!247370)))))

(assert (=> d!81567 (= lt!247370 e!313310)))

(declare-fun c!62817 () Bool)

(assert (=> d!81567 (= c!62817 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81567 (= lt!247371 (select (arr!16454 a!3154) (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216)))))

(assert (=> d!81567 (validMask!0 mask!3216)))

(assert (=> d!81567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) (select (arr!16454 a!3154) j!147) a!3154 mask!3216) lt!247370)))

(assert (= (and d!81567 c!62817) b!541129))

(assert (= (and d!81567 (not c!62817)) b!541133))

(assert (= (and b!541133 c!62815) b!541130))

(assert (= (and b!541133 (not c!62815)) b!541134))

(assert (= (and d!81567 c!62816) b!541127))

(assert (= (and d!81567 (not c!62816)) b!541128))

(assert (= (and b!541128 res!336127) b!541132))

(assert (= (and b!541132 (not res!336126)) b!541131))

(assert (= (and b!541131 (not res!336128)) b!541135))

(declare-fun m!519213 () Bool)

(assert (=> b!541131 m!519213))

(assert (=> d!81567 m!519107))

(declare-fun m!519215 () Bool)

(assert (=> d!81567 m!519215))

(assert (=> d!81567 m!519125))

(assert (=> b!541135 m!519213))

(assert (=> b!541134 m!519107))

(declare-fun m!519217 () Bool)

(assert (=> b!541134 m!519217))

(assert (=> b!541134 m!519217))

(assert (=> b!541134 m!519103))

(declare-fun m!519219 () Bool)

(assert (=> b!541134 m!519219))

(assert (=> b!541132 m!519213))

(assert (=> b!540996 d!81567))

(declare-fun d!81569 () Bool)

(declare-fun lt!247381 () (_ BitVec 32))

(declare-fun lt!247380 () (_ BitVec 32))

(assert (=> d!81569 (= lt!247381 (bvmul (bvxor lt!247380 (bvlshr lt!247380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81569 (= lt!247380 ((_ extract 31 0) (bvand (bvxor (select (arr!16454 a!3154) j!147) (bvlshr (select (arr!16454 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81569 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336129 (let ((h!11560 ((_ extract 31 0) (bvand (bvxor (select (arr!16454 a!3154) j!147) (bvlshr (select (arr!16454 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50783 (bvmul (bvxor h!11560 (bvlshr h!11560 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50783 (bvlshr x!50783 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336129 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336129 #b00000000000000000000000000000000))))))

(assert (=> d!81569 (= (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) (bvand (bvxor lt!247381 (bvlshr lt!247381 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!540996 d!81569))

(declare-fun bm!32014 () Bool)

(declare-fun call!32017 () Bool)

(assert (=> bm!32014 (= call!32017 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!541198 () Bool)

(declare-fun e!313352 () Bool)

(assert (=> b!541198 (= e!313352 call!32017)))

(declare-fun b!541199 () Bool)

(declare-fun e!313351 () Bool)

(assert (=> b!541199 (= e!313351 e!313352)))

(declare-fun c!62838 () Bool)

(assert (=> b!541199 (= c!62838 (validKeyInArray!0 (select (arr!16454 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81571 () Bool)

(declare-fun res!336153 () Bool)

(assert (=> d!81571 (=> res!336153 e!313351)))

(assert (=> d!81571 (= res!336153 (bvsge #b00000000000000000000000000000000 (size!16819 a!3154)))))

(assert (=> d!81571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313351)))

(declare-fun b!541200 () Bool)

(declare-fun e!313350 () Bool)

(assert (=> b!541200 (= e!313350 call!32017)))

(declare-fun b!541201 () Bool)

(assert (=> b!541201 (= e!313352 e!313350)))

(declare-fun lt!247396 () (_ BitVec 64))

(assert (=> b!541201 (= lt!247396 (select (arr!16454 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16878 0))(
  ( (Unit!16879) )
))
(declare-fun lt!247397 () Unit!16878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34236 (_ BitVec 64) (_ BitVec 32)) Unit!16878)

(assert (=> b!541201 (= lt!247397 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247396 #b00000000000000000000000000000000))))

(assert (=> b!541201 (arrayContainsKey!0 a!3154 lt!247396 #b00000000000000000000000000000000)))

(declare-fun lt!247398 () Unit!16878)

(assert (=> b!541201 (= lt!247398 lt!247397)))

(declare-fun res!336152 () Bool)

(assert (=> b!541201 (= res!336152 (= (seekEntryOrOpen!0 (select (arr!16454 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4909 #b00000000000000000000000000000000)))))

(assert (=> b!541201 (=> (not res!336152) (not e!313350))))

(assert (= (and d!81571 (not res!336153)) b!541199))

(assert (= (and b!541199 c!62838) b!541201))

(assert (= (and b!541199 (not c!62838)) b!541198))

(assert (= (and b!541201 res!336152) b!541200))

(assert (= (or b!541200 b!541198) bm!32014))

(declare-fun m!519233 () Bool)

(assert (=> bm!32014 m!519233))

(assert (=> b!541199 m!519205))

(assert (=> b!541199 m!519205))

(assert (=> b!541199 m!519209))

(assert (=> b!541201 m!519205))

(declare-fun m!519235 () Bool)

(assert (=> b!541201 m!519235))

(declare-fun m!519237 () Bool)

(assert (=> b!541201 m!519237))

(assert (=> b!541201 m!519205))

(declare-fun m!519239 () Bool)

(assert (=> b!541201 m!519239))

(assert (=> b!540995 d!81571))

(declare-fun b!541238 () Bool)

(declare-fun e!313378 () SeekEntryResult!4909)

(assert (=> b!541238 (= e!313378 Undefined!4909)))

(declare-fun b!541239 () Bool)

(declare-fun e!313377 () SeekEntryResult!4909)

(declare-fun lt!247425 () SeekEntryResult!4909)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34236 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!541239 (= e!313377 (seekKeyOrZeroReturnVacant!0 (x!50779 lt!247425) (index!21862 lt!247425) (index!21862 lt!247425) k0!1998 a!3154 mask!3216))))

(declare-fun b!541240 () Bool)

(declare-fun c!62851 () Bool)

(declare-fun lt!247424 () (_ BitVec 64))

(assert (=> b!541240 (= c!62851 (= lt!247424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313379 () SeekEntryResult!4909)

(assert (=> b!541240 (= e!313379 e!313377)))

(declare-fun b!541241 () Bool)

(assert (=> b!541241 (= e!313377 (MissingZero!4909 (index!21862 lt!247425)))))

(declare-fun d!81577 () Bool)

(declare-fun lt!247423 () SeekEntryResult!4909)

(assert (=> d!81577 (and (or ((_ is Undefined!4909) lt!247423) (not ((_ is Found!4909) lt!247423)) (and (bvsge (index!21861 lt!247423) #b00000000000000000000000000000000) (bvslt (index!21861 lt!247423) (size!16819 a!3154)))) (or ((_ is Undefined!4909) lt!247423) ((_ is Found!4909) lt!247423) (not ((_ is MissingZero!4909) lt!247423)) (and (bvsge (index!21860 lt!247423) #b00000000000000000000000000000000) (bvslt (index!21860 lt!247423) (size!16819 a!3154)))) (or ((_ is Undefined!4909) lt!247423) ((_ is Found!4909) lt!247423) ((_ is MissingZero!4909) lt!247423) (not ((_ is MissingVacant!4909) lt!247423)) (and (bvsge (index!21863 lt!247423) #b00000000000000000000000000000000) (bvslt (index!21863 lt!247423) (size!16819 a!3154)))) (or ((_ is Undefined!4909) lt!247423) (ite ((_ is Found!4909) lt!247423) (= (select (arr!16454 a!3154) (index!21861 lt!247423)) k0!1998) (ite ((_ is MissingZero!4909) lt!247423) (= (select (arr!16454 a!3154) (index!21860 lt!247423)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4909) lt!247423) (= (select (arr!16454 a!3154) (index!21863 lt!247423)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81577 (= lt!247423 e!313378)))

(declare-fun c!62853 () Bool)

(assert (=> d!81577 (= c!62853 (and ((_ is Intermediate!4909) lt!247425) (undefined!5721 lt!247425)))))

(assert (=> d!81577 (= lt!247425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81577 (validMask!0 mask!3216)))

(assert (=> d!81577 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247423)))

(declare-fun b!541242 () Bool)

(assert (=> b!541242 (= e!313379 (Found!4909 (index!21862 lt!247425)))))

(declare-fun b!541243 () Bool)

(assert (=> b!541243 (= e!313378 e!313379)))

(assert (=> b!541243 (= lt!247424 (select (arr!16454 a!3154) (index!21862 lt!247425)))))

(declare-fun c!62852 () Bool)

(assert (=> b!541243 (= c!62852 (= lt!247424 k0!1998))))

(assert (= (and d!81577 c!62853) b!541238))

(assert (= (and d!81577 (not c!62853)) b!541243))

(assert (= (and b!541243 c!62852) b!541242))

(assert (= (and b!541243 (not c!62852)) b!541240))

(assert (= (and b!541240 c!62851) b!541241))

(assert (= (and b!541240 (not c!62851)) b!541239))

(declare-fun m!519259 () Bool)

(assert (=> b!541239 m!519259))

(assert (=> d!81577 m!519125))

(declare-fun m!519261 () Bool)

(assert (=> d!81577 m!519261))

(declare-fun m!519263 () Bool)

(assert (=> d!81577 m!519263))

(declare-fun m!519265 () Bool)

(assert (=> d!81577 m!519265))

(assert (=> d!81577 m!519261))

(declare-fun m!519267 () Bool)

(assert (=> d!81577 m!519267))

(declare-fun m!519269 () Bool)

(assert (=> d!81577 m!519269))

(declare-fun m!519271 () Bool)

(assert (=> b!541243 m!519271))

(assert (=> b!540990 d!81577))

(declare-fun d!81587 () Bool)

(declare-fun res!336170 () Bool)

(declare-fun e!313390 () Bool)

(assert (=> d!81587 (=> res!336170 e!313390)))

(assert (=> d!81587 (= res!336170 (= (select (arr!16454 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81587 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313390)))

(declare-fun b!541260 () Bool)

(declare-fun e!313391 () Bool)

(assert (=> b!541260 (= e!313390 e!313391)))

(declare-fun res!336171 () Bool)

(assert (=> b!541260 (=> (not res!336171) (not e!313391))))

(assert (=> b!541260 (= res!336171 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16819 a!3154)))))

(declare-fun b!541261 () Bool)

(assert (=> b!541261 (= e!313391 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81587 (not res!336170)) b!541260))

(assert (= (and b!541260 res!336171) b!541261))

(assert (=> d!81587 m!519205))

(declare-fun m!519273 () Bool)

(assert (=> b!541261 m!519273))

(assert (=> b!540989 d!81587))

(declare-fun d!81591 () Bool)

(assert (=> d!81591 (= (validKeyInArray!0 (select (arr!16454 a!3154) j!147)) (and (not (= (select (arr!16454 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16454 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540994 d!81591))

(check-sat (not bm!32011) (not b!541201) (not d!81577) (not d!81545) (not b!541105) (not d!81567) (not b!541134) (not b!541261) (not b!541239) (not b!541123) (not bm!32014) (not b!541124) (not b!541126) (not b!541199))
(check-sat)
