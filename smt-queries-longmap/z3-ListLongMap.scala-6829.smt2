; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85956 () Bool)

(assert start!85956)

(declare-fun b!995865 () Bool)

(declare-fun res!666192 () Bool)

(declare-fun e!561896 () Bool)

(assert (=> b!995865 (=> (not res!666192) (not e!561896))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((array!62953 0))(
  ( (array!62954 (arr!30309 (Array (_ BitVec 32) (_ BitVec 64))) (size!30813 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62953)

(assert (=> b!995865 (= res!666192 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30813 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30813 a!3219))))))

(declare-fun b!995866 () Bool)

(declare-fun res!666189 () Bool)

(declare-fun e!561895 () Bool)

(assert (=> b!995866 (=> (not res!666189) (not e!561895))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995866 (= res!666189 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995867 () Bool)

(declare-fun res!666190 () Bool)

(assert (=> b!995867 (=> (not res!666190) (not e!561895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995867 (= res!666190 (validKeyInArray!0 k0!2224))))

(declare-fun b!995868 () Bool)

(declare-fun res!666193 () Bool)

(assert (=> b!995868 (=> (not res!666193) (not e!561895))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995868 (= res!666193 (validKeyInArray!0 (select (arr!30309 a!3219) j!170)))))

(declare-fun b!995869 () Bool)

(declare-fun res!666195 () Bool)

(assert (=> b!995869 (=> (not res!666195) (not e!561895))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995869 (= res!666195 (and (= (size!30813 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30813 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30813 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995870 () Bool)

(assert (=> b!995870 (= e!561895 e!561896)))

(declare-fun res!666196 () Bool)

(assert (=> b!995870 (=> (not res!666196) (not e!561896))))

(declare-datatypes ((SeekEntryResult!9266 0))(
  ( (MissingZero!9266 (index!39435 (_ BitVec 32))) (Found!9266 (index!39436 (_ BitVec 32))) (Intermediate!9266 (undefined!10078 Bool) (index!39437 (_ BitVec 32)) (x!86886 (_ BitVec 32))) (Undefined!9266) (MissingVacant!9266 (index!39438 (_ BitVec 32))) )
))
(declare-fun lt!440886 () SeekEntryResult!9266)

(assert (=> b!995870 (= res!666196 (or (= lt!440886 (MissingVacant!9266 i!1194)) (= lt!440886 (MissingZero!9266 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62953 (_ BitVec 32)) SeekEntryResult!9266)

(assert (=> b!995870 (= lt!440886 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995871 () Bool)

(declare-fun res!666191 () Bool)

(assert (=> b!995871 (=> (not res!666191) (not e!561896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62953 (_ BitVec 32)) Bool)

(assert (=> b!995871 (= res!666191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995872 () Bool)

(declare-fun res!666197 () Bool)

(assert (=> b!995872 (=> (not res!666197) (not e!561896))))

(declare-datatypes ((List!21051 0))(
  ( (Nil!21048) (Cons!21047 (h!22209 (_ BitVec 64)) (t!30043 List!21051)) )
))
(declare-fun arrayNoDuplicates!0 (array!62953 (_ BitVec 32) List!21051) Bool)

(assert (=> b!995872 (= res!666197 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21048))))

(declare-fun b!995864 () Bool)

(declare-fun lt!440887 () (_ BitVec 32))

(assert (=> b!995864 (= e!561896 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!440887 #b00000000000000000000000000000000) (bvsge lt!440887 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995864 (= lt!440887 (toIndex!0 (select (arr!30309 a!3219) j!170) mask!3464))))

(declare-fun res!666194 () Bool)

(assert (=> start!85956 (=> (not res!666194) (not e!561895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85956 (= res!666194 (validMask!0 mask!3464))))

(assert (=> start!85956 e!561895))

(declare-fun array_inv!23452 (array!62953) Bool)

(assert (=> start!85956 (array_inv!23452 a!3219)))

(assert (=> start!85956 true))

(assert (= (and start!85956 res!666194) b!995869))

(assert (= (and b!995869 res!666195) b!995868))

(assert (= (and b!995868 res!666193) b!995867))

(assert (= (and b!995867 res!666190) b!995866))

(assert (= (and b!995866 res!666189) b!995870))

(assert (= (and b!995870 res!666196) b!995871))

(assert (= (and b!995871 res!666191) b!995872))

(assert (= (and b!995872 res!666197) b!995865))

(assert (= (and b!995865 res!666192) b!995864))

(declare-fun m!922579 () Bool)

(assert (=> start!85956 m!922579))

(declare-fun m!922581 () Bool)

(assert (=> start!85956 m!922581))

(declare-fun m!922583 () Bool)

(assert (=> b!995866 m!922583))

(declare-fun m!922585 () Bool)

(assert (=> b!995872 m!922585))

(declare-fun m!922587 () Bool)

(assert (=> b!995871 m!922587))

(declare-fun m!922589 () Bool)

(assert (=> b!995868 m!922589))

(assert (=> b!995868 m!922589))

(declare-fun m!922591 () Bool)

(assert (=> b!995868 m!922591))

(declare-fun m!922593 () Bool)

(assert (=> b!995867 m!922593))

(assert (=> b!995864 m!922589))

(assert (=> b!995864 m!922589))

(declare-fun m!922595 () Bool)

(assert (=> b!995864 m!922595))

(declare-fun m!922597 () Bool)

(assert (=> b!995870 m!922597))

(check-sat (not b!995868) (not b!995870) (not b!995864) (not b!995871) (not b!995866) (not b!995872) (not b!995867) (not start!85956))
(check-sat)
(get-model)

(declare-fun d!118783 () Bool)

(assert (=> d!118783 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995867 d!118783))

(declare-fun d!118785 () Bool)

(assert (=> d!118785 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85956 d!118785))

(declare-fun d!118787 () Bool)

(assert (=> d!118787 (= (array_inv!23452 a!3219) (bvsge (size!30813 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85956 d!118787))

(declare-fun d!118789 () Bool)

(assert (=> d!118789 (= (validKeyInArray!0 (select (arr!30309 a!3219) j!170)) (and (not (= (select (arr!30309 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30309 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995868 d!118789))

(declare-fun d!118791 () Bool)

(declare-fun res!666256 () Bool)

(declare-fun e!561919 () Bool)

(assert (=> d!118791 (=> res!666256 e!561919)))

(assert (=> d!118791 (= res!666256 (= (select (arr!30309 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118791 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561919)))

(declare-fun b!995931 () Bool)

(declare-fun e!561920 () Bool)

(assert (=> b!995931 (= e!561919 e!561920)))

(declare-fun res!666257 () Bool)

(assert (=> b!995931 (=> (not res!666257) (not e!561920))))

(assert (=> b!995931 (= res!666257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30813 a!3219)))))

(declare-fun b!995932 () Bool)

(assert (=> b!995932 (= e!561920 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118791 (not res!666256)) b!995931))

(assert (= (and b!995931 res!666257) b!995932))

(declare-fun m!922639 () Bool)

(assert (=> d!118791 m!922639))

(declare-fun m!922641 () Bool)

(assert (=> b!995932 m!922641))

(assert (=> b!995866 d!118791))

(declare-fun b!995941 () Bool)

(declare-fun e!561929 () Bool)

(declare-fun e!561927 () Bool)

(assert (=> b!995941 (= e!561929 e!561927)))

(declare-fun c!100981 () Bool)

(assert (=> b!995941 (= c!100981 (validKeyInArray!0 (select (arr!30309 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995942 () Bool)

(declare-fun call!42199 () Bool)

(assert (=> b!995942 (= e!561927 call!42199)))

(declare-fun d!118793 () Bool)

(declare-fun res!666262 () Bool)

(assert (=> d!118793 (=> res!666262 e!561929)))

(assert (=> d!118793 (= res!666262 (bvsge #b00000000000000000000000000000000 (size!30813 a!3219)))))

(assert (=> d!118793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561929)))

(declare-fun b!995943 () Bool)

(declare-fun e!561928 () Bool)

(assert (=> b!995943 (= e!561927 e!561928)))

(declare-fun lt!440906 () (_ BitVec 64))

(assert (=> b!995943 (= lt!440906 (select (arr!30309 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32839 0))(
  ( (Unit!32840) )
))
(declare-fun lt!440908 () Unit!32839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62953 (_ BitVec 64) (_ BitVec 32)) Unit!32839)

(assert (=> b!995943 (= lt!440908 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440906 #b00000000000000000000000000000000))))

(assert (=> b!995943 (arrayContainsKey!0 a!3219 lt!440906 #b00000000000000000000000000000000)))

(declare-fun lt!440907 () Unit!32839)

(assert (=> b!995943 (= lt!440907 lt!440908)))

(declare-fun res!666263 () Bool)

(assert (=> b!995943 (= res!666263 (= (seekEntryOrOpen!0 (select (arr!30309 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9266 #b00000000000000000000000000000000)))))

(assert (=> b!995943 (=> (not res!666263) (not e!561928))))

(declare-fun b!995944 () Bool)

(assert (=> b!995944 (= e!561928 call!42199)))

(declare-fun bm!42196 () Bool)

(assert (=> bm!42196 (= call!42199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!118793 (not res!666262)) b!995941))

(assert (= (and b!995941 c!100981) b!995943))

(assert (= (and b!995941 (not c!100981)) b!995942))

(assert (= (and b!995943 res!666263) b!995944))

(assert (= (or b!995944 b!995942) bm!42196))

(assert (=> b!995941 m!922639))

(assert (=> b!995941 m!922639))

(declare-fun m!922643 () Bool)

(assert (=> b!995941 m!922643))

(assert (=> b!995943 m!922639))

(declare-fun m!922645 () Bool)

(assert (=> b!995943 m!922645))

(declare-fun m!922647 () Bool)

(assert (=> b!995943 m!922647))

(assert (=> b!995943 m!922639))

(declare-fun m!922649 () Bool)

(assert (=> b!995943 m!922649))

(declare-fun m!922651 () Bool)

(assert (=> bm!42196 m!922651))

(assert (=> b!995871 d!118793))

(declare-fun b!995970 () Bool)

(declare-fun e!561950 () Bool)

(declare-fun call!42205 () Bool)

(assert (=> b!995970 (= e!561950 call!42205)))

(declare-fun bm!42202 () Bool)

(declare-fun c!100987 () Bool)

(assert (=> bm!42202 (= call!42205 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100987 (Cons!21047 (select (arr!30309 a!3219) #b00000000000000000000000000000000) Nil!21048) Nil!21048)))))

(declare-fun b!995971 () Bool)

(assert (=> b!995971 (= e!561950 call!42205)))

(declare-fun b!995972 () Bool)

(declare-fun e!561952 () Bool)

(declare-fun contains!5838 (List!21051 (_ BitVec 64)) Bool)

(assert (=> b!995972 (= e!561952 (contains!5838 Nil!21048 (select (arr!30309 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118801 () Bool)

(declare-fun res!666281 () Bool)

(declare-fun e!561953 () Bool)

(assert (=> d!118801 (=> res!666281 e!561953)))

(assert (=> d!118801 (= res!666281 (bvsge #b00000000000000000000000000000000 (size!30813 a!3219)))))

(assert (=> d!118801 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21048) e!561953)))

(declare-fun b!995973 () Bool)

(declare-fun e!561951 () Bool)

(assert (=> b!995973 (= e!561951 e!561950)))

(assert (=> b!995973 (= c!100987 (validKeyInArray!0 (select (arr!30309 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995974 () Bool)

(assert (=> b!995974 (= e!561953 e!561951)))

(declare-fun res!666280 () Bool)

(assert (=> b!995974 (=> (not res!666280) (not e!561951))))

(assert (=> b!995974 (= res!666280 (not e!561952))))

(declare-fun res!666279 () Bool)

(assert (=> b!995974 (=> (not res!666279) (not e!561952))))

(assert (=> b!995974 (= res!666279 (validKeyInArray!0 (select (arr!30309 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!118801 (not res!666281)) b!995974))

(assert (= (and b!995974 res!666279) b!995972))

(assert (= (and b!995974 res!666280) b!995973))

(assert (= (and b!995973 c!100987) b!995970))

(assert (= (and b!995973 (not c!100987)) b!995971))

(assert (= (or b!995970 b!995971) bm!42202))

(assert (=> bm!42202 m!922639))

(declare-fun m!922661 () Bool)

(assert (=> bm!42202 m!922661))

(assert (=> b!995972 m!922639))

(assert (=> b!995972 m!922639))

(declare-fun m!922663 () Bool)

(assert (=> b!995972 m!922663))

(assert (=> b!995973 m!922639))

(assert (=> b!995973 m!922639))

(assert (=> b!995973 m!922643))

(assert (=> b!995974 m!922639))

(assert (=> b!995974 m!922639))

(assert (=> b!995974 m!922643))

(assert (=> b!995872 d!118801))

(declare-fun b!996020 () Bool)

(declare-fun e!561981 () SeekEntryResult!9266)

(declare-fun e!561982 () SeekEntryResult!9266)

(assert (=> b!996020 (= e!561981 e!561982)))

(declare-fun lt!440938 () (_ BitVec 64))

(declare-fun lt!440936 () SeekEntryResult!9266)

(assert (=> b!996020 (= lt!440938 (select (arr!30309 a!3219) (index!39437 lt!440936)))))

(declare-fun c!101008 () Bool)

(assert (=> b!996020 (= c!101008 (= lt!440938 k0!2224))))

(declare-fun b!996021 () Bool)

(declare-fun c!101007 () Bool)

(assert (=> b!996021 (= c!101007 (= lt!440938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561983 () SeekEntryResult!9266)

(assert (=> b!996021 (= e!561982 e!561983)))

(declare-fun b!996022 () Bool)

(assert (=> b!996022 (= e!561983 (MissingZero!9266 (index!39437 lt!440936)))))

(declare-fun d!118805 () Bool)

(declare-fun lt!440937 () SeekEntryResult!9266)

(get-info :version)

(assert (=> d!118805 (and (or ((_ is Undefined!9266) lt!440937) (not ((_ is Found!9266) lt!440937)) (and (bvsge (index!39436 lt!440937) #b00000000000000000000000000000000) (bvslt (index!39436 lt!440937) (size!30813 a!3219)))) (or ((_ is Undefined!9266) lt!440937) ((_ is Found!9266) lt!440937) (not ((_ is MissingZero!9266) lt!440937)) (and (bvsge (index!39435 lt!440937) #b00000000000000000000000000000000) (bvslt (index!39435 lt!440937) (size!30813 a!3219)))) (or ((_ is Undefined!9266) lt!440937) ((_ is Found!9266) lt!440937) ((_ is MissingZero!9266) lt!440937) (not ((_ is MissingVacant!9266) lt!440937)) (and (bvsge (index!39438 lt!440937) #b00000000000000000000000000000000) (bvslt (index!39438 lt!440937) (size!30813 a!3219)))) (or ((_ is Undefined!9266) lt!440937) (ite ((_ is Found!9266) lt!440937) (= (select (arr!30309 a!3219) (index!39436 lt!440937)) k0!2224) (ite ((_ is MissingZero!9266) lt!440937) (= (select (arr!30309 a!3219) (index!39435 lt!440937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9266) lt!440937) (= (select (arr!30309 a!3219) (index!39438 lt!440937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118805 (= lt!440937 e!561981)))

(declare-fun c!101006 () Bool)

(assert (=> d!118805 (= c!101006 (and ((_ is Intermediate!9266) lt!440936) (undefined!10078 lt!440936)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62953 (_ BitVec 32)) SeekEntryResult!9266)

(assert (=> d!118805 (= lt!440936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118805 (validMask!0 mask!3464)))

(assert (=> d!118805 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!440937)))

(declare-fun b!996023 () Bool)

(assert (=> b!996023 (= e!561982 (Found!9266 (index!39437 lt!440936)))))

(declare-fun b!996024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62953 (_ BitVec 32)) SeekEntryResult!9266)

(assert (=> b!996024 (= e!561983 (seekKeyOrZeroReturnVacant!0 (x!86886 lt!440936) (index!39437 lt!440936) (index!39437 lt!440936) k0!2224 a!3219 mask!3464))))

(declare-fun b!996025 () Bool)

(assert (=> b!996025 (= e!561981 Undefined!9266)))

(assert (= (and d!118805 c!101006) b!996025))

(assert (= (and d!118805 (not c!101006)) b!996020))

(assert (= (and b!996020 c!101008) b!996023))

(assert (= (and b!996020 (not c!101008)) b!996021))

(assert (= (and b!996021 c!101007) b!996022))

(assert (= (and b!996021 (not c!101007)) b!996024))

(declare-fun m!922687 () Bool)

(assert (=> b!996020 m!922687))

(declare-fun m!922689 () Bool)

(assert (=> d!118805 m!922689))

(assert (=> d!118805 m!922579))

(declare-fun m!922691 () Bool)

(assert (=> d!118805 m!922691))

(declare-fun m!922693 () Bool)

(assert (=> d!118805 m!922693))

(declare-fun m!922695 () Bool)

(assert (=> d!118805 m!922695))

(assert (=> d!118805 m!922695))

(declare-fun m!922697 () Bool)

(assert (=> d!118805 m!922697))

(declare-fun m!922699 () Bool)

(assert (=> b!996024 m!922699))

(assert (=> b!995870 d!118805))

(declare-fun d!118821 () Bool)

(declare-fun lt!440944 () (_ BitVec 32))

(declare-fun lt!440943 () (_ BitVec 32))

(assert (=> d!118821 (= lt!440944 (bvmul (bvxor lt!440943 (bvlshr lt!440943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!118821 (= lt!440943 ((_ extract 31 0) (bvand (bvxor (select (arr!30309 a!3219) j!170) (bvlshr (select (arr!30309 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!118821 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!666297 (let ((h!22214 ((_ extract 31 0) (bvand (bvxor (select (arr!30309 a!3219) j!170) (bvlshr (select (arr!30309 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!86891 (bvmul (bvxor h!22214 (bvlshr h!22214 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!86891 (bvlshr x!86891 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!666297 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!666297 #b00000000000000000000000000000000))))))

(assert (=> d!118821 (= (toIndex!0 (select (arr!30309 a!3219) j!170) mask!3464) (bvand (bvxor lt!440944 (bvlshr lt!440944 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!995864 d!118821))

(check-sat (not bm!42196) (not b!995932) (not b!995973) (not b!995941) (not bm!42202) (not b!995943) (not b!995972) (not b!996024) (not d!118805) (not b!995974))
(check-sat)
