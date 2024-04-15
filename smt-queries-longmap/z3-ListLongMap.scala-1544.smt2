; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29180 () Bool)

(assert start!29180)

(declare-fun b!296031 () Bool)

(declare-fun e!187100 () Bool)

(declare-fun e!187098 () Bool)

(assert (=> b!296031 (= e!187100 e!187098)))

(declare-fun res!155971 () Bool)

(assert (=> b!296031 (=> (not res!155971) (not e!187098))))

(declare-fun lt!146875 () Bool)

(assert (=> b!296031 (= res!155971 lt!146875)))

(declare-datatypes ((SeekEntryResult!2252 0))(
  ( (MissingZero!2252 (index!11178 (_ BitVec 32))) (Found!2252 (index!11179 (_ BitVec 32))) (Intermediate!2252 (undefined!3064 Bool) (index!11180 (_ BitVec 32)) (x!29404 (_ BitVec 32))) (Undefined!2252) (MissingVacant!2252 (index!11181 (_ BitVec 32))) )
))
(declare-fun lt!146876 () SeekEntryResult!2252)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146872 () (_ BitVec 32))

(declare-datatypes ((array!14986 0))(
  ( (array!14987 (arr!7104 (Array (_ BitVec 32) (_ BitVec 64))) (size!7457 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14986)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14986 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!296031 (= lt!146876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146872 k0!2524 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)) mask!3809))))

(declare-fun lt!146877 () SeekEntryResult!2252)

(assert (=> b!296031 (= lt!146877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146872 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296031 (= lt!146872 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296032 () Bool)

(declare-fun e!187102 () Bool)

(assert (=> b!296032 (= e!187102 (not (or (not (= lt!146877 (Intermediate!2252 false (index!11180 lt!146877) (x!29404 lt!146877)))) (bvsle #b00000000000000000000000000000000 (x!29404 lt!146877)))))))

(assert (=> b!296032 (and (= (select (arr!7104 a!3312) (index!11180 lt!146877)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11180 lt!146877) i!1256))))

(declare-fun b!296033 () Bool)

(declare-fun res!155970 () Bool)

(declare-fun e!187099 () Bool)

(assert (=> b!296033 (=> (not res!155970) (not e!187099))))

(declare-fun arrayContainsKey!0 (array!14986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296033 (= res!155970 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296034 () Bool)

(assert (=> b!296034 (= e!187099 e!187100)))

(declare-fun res!155969 () Bool)

(assert (=> b!296034 (=> (not res!155969) (not e!187100))))

(declare-fun lt!146873 () SeekEntryResult!2252)

(assert (=> b!296034 (= res!155969 (or lt!146875 (= lt!146873 (MissingVacant!2252 i!1256))))))

(assert (=> b!296034 (= lt!146875 (= lt!146873 (MissingZero!2252 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14986 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!296034 (= lt!146873 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296035 () Bool)

(declare-fun res!155967 () Bool)

(assert (=> b!296035 (=> (not res!155967) (not e!187100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14986 (_ BitVec 32)) Bool)

(assert (=> b!296035 (= res!155967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155974 () Bool)

(assert (=> start!29180 (=> (not res!155974) (not e!187099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29180 (= res!155974 (validMask!0 mask!3809))))

(assert (=> start!29180 e!187099))

(assert (=> start!29180 true))

(declare-fun array_inv!5076 (array!14986) Bool)

(assert (=> start!29180 (array_inv!5076 a!3312)))

(declare-fun b!296036 () Bool)

(declare-fun res!155973 () Bool)

(assert (=> b!296036 (=> (not res!155973) (not e!187099))))

(assert (=> b!296036 (= res!155973 (and (= (size!7457 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7457 a!3312))))))

(declare-fun b!296037 () Bool)

(assert (=> b!296037 (= e!187098 e!187102)))

(declare-fun res!155972 () Bool)

(assert (=> b!296037 (=> (not res!155972) (not e!187102))))

(declare-fun lt!146874 () Bool)

(assert (=> b!296037 (= res!155972 (and (or lt!146874 (not (undefined!3064 lt!146877))) (or lt!146874 (not (= (select (arr!7104 a!3312) (index!11180 lt!146877)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146874 (not (= (select (arr!7104 a!3312) (index!11180 lt!146877)) k0!2524))) (not lt!146874)))))

(get-info :version)

(assert (=> b!296037 (= lt!146874 (not ((_ is Intermediate!2252) lt!146877)))))

(declare-fun b!296038 () Bool)

(declare-fun res!155968 () Bool)

(assert (=> b!296038 (=> (not res!155968) (not e!187099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296038 (= res!155968 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29180 res!155974) b!296036))

(assert (= (and b!296036 res!155973) b!296038))

(assert (= (and b!296038 res!155968) b!296033))

(assert (= (and b!296033 res!155970) b!296034))

(assert (= (and b!296034 res!155969) b!296035))

(assert (= (and b!296035 res!155967) b!296031))

(assert (= (and b!296031 res!155971) b!296037))

(assert (= (and b!296037 res!155972) b!296032))

(declare-fun m!308619 () Bool)

(assert (=> b!296031 m!308619))

(declare-fun m!308621 () Bool)

(assert (=> b!296031 m!308621))

(declare-fun m!308623 () Bool)

(assert (=> b!296031 m!308623))

(declare-fun m!308625 () Bool)

(assert (=> b!296031 m!308625))

(declare-fun m!308627 () Bool)

(assert (=> b!296035 m!308627))

(declare-fun m!308629 () Bool)

(assert (=> b!296038 m!308629))

(declare-fun m!308631 () Bool)

(assert (=> b!296037 m!308631))

(declare-fun m!308633 () Bool)

(assert (=> b!296033 m!308633))

(assert (=> b!296032 m!308631))

(declare-fun m!308635 () Bool)

(assert (=> start!29180 m!308635))

(declare-fun m!308637 () Bool)

(assert (=> start!29180 m!308637))

(declare-fun m!308639 () Bool)

(assert (=> b!296034 m!308639))

(check-sat (not b!296035) (not b!296031) (not b!296034) (not b!296038) (not b!296033) (not start!29180))
(check-sat)
(get-model)

(declare-fun d!66847 () Bool)

(declare-fun res!156028 () Bool)

(declare-fun e!187139 () Bool)

(assert (=> d!66847 (=> res!156028 e!187139)))

(assert (=> d!66847 (= res!156028 (bvsge #b00000000000000000000000000000000 (size!7457 a!3312)))))

(assert (=> d!66847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187139)))

(declare-fun b!296095 () Bool)

(declare-fun e!187140 () Bool)

(declare-fun call!25712 () Bool)

(assert (=> b!296095 (= e!187140 call!25712)))

(declare-fun b!296096 () Bool)

(assert (=> b!296096 (= e!187139 e!187140)))

(declare-fun c!47612 () Bool)

(assert (=> b!296096 (= c!47612 (validKeyInArray!0 (select (arr!7104 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296097 () Bool)

(declare-fun e!187141 () Bool)

(assert (=> b!296097 (= e!187140 e!187141)))

(declare-fun lt!146922 () (_ BitVec 64))

(assert (=> b!296097 (= lt!146922 (select (arr!7104 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9178 0))(
  ( (Unit!9179) )
))
(declare-fun lt!146921 () Unit!9178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14986 (_ BitVec 64) (_ BitVec 32)) Unit!9178)

(assert (=> b!296097 (= lt!146921 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146922 #b00000000000000000000000000000000))))

(assert (=> b!296097 (arrayContainsKey!0 a!3312 lt!146922 #b00000000000000000000000000000000)))

(declare-fun lt!146920 () Unit!9178)

(assert (=> b!296097 (= lt!146920 lt!146921)))

(declare-fun res!156027 () Bool)

(assert (=> b!296097 (= res!156027 (= (seekEntryOrOpen!0 (select (arr!7104 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2252 #b00000000000000000000000000000000)))))

(assert (=> b!296097 (=> (not res!156027) (not e!187141))))

(declare-fun b!296098 () Bool)

(assert (=> b!296098 (= e!187141 call!25712)))

(declare-fun bm!25709 () Bool)

(assert (=> bm!25709 (= call!25712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66847 (not res!156028)) b!296096))

(assert (= (and b!296096 c!47612) b!296097))

(assert (= (and b!296096 (not c!47612)) b!296095))

(assert (= (and b!296097 res!156027) b!296098))

(assert (= (or b!296098 b!296095) bm!25709))

(declare-fun m!308685 () Bool)

(assert (=> b!296096 m!308685))

(assert (=> b!296096 m!308685))

(declare-fun m!308687 () Bool)

(assert (=> b!296096 m!308687))

(assert (=> b!296097 m!308685))

(declare-fun m!308689 () Bool)

(assert (=> b!296097 m!308689))

(declare-fun m!308691 () Bool)

(assert (=> b!296097 m!308691))

(assert (=> b!296097 m!308685))

(declare-fun m!308693 () Bool)

(assert (=> b!296097 m!308693))

(declare-fun m!308695 () Bool)

(assert (=> bm!25709 m!308695))

(assert (=> b!296035 d!66847))

(declare-fun b!296121 () Bool)

(declare-fun e!187160 () SeekEntryResult!2252)

(assert (=> b!296121 (= e!187160 Undefined!2252)))

(declare-fun d!66849 () Bool)

(declare-fun lt!146931 () SeekEntryResult!2252)

(assert (=> d!66849 (and (or ((_ is Undefined!2252) lt!146931) (not ((_ is Found!2252) lt!146931)) (and (bvsge (index!11179 lt!146931) #b00000000000000000000000000000000) (bvslt (index!11179 lt!146931) (size!7457 a!3312)))) (or ((_ is Undefined!2252) lt!146931) ((_ is Found!2252) lt!146931) (not ((_ is MissingZero!2252) lt!146931)) (and (bvsge (index!11178 lt!146931) #b00000000000000000000000000000000) (bvslt (index!11178 lt!146931) (size!7457 a!3312)))) (or ((_ is Undefined!2252) lt!146931) ((_ is Found!2252) lt!146931) ((_ is MissingZero!2252) lt!146931) (not ((_ is MissingVacant!2252) lt!146931)) (and (bvsge (index!11181 lt!146931) #b00000000000000000000000000000000) (bvslt (index!11181 lt!146931) (size!7457 a!3312)))) (or ((_ is Undefined!2252) lt!146931) (ite ((_ is Found!2252) lt!146931) (= (select (arr!7104 a!3312) (index!11179 lt!146931)) k0!2524) (ite ((_ is MissingZero!2252) lt!146931) (= (select (arr!7104 a!3312) (index!11178 lt!146931)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2252) lt!146931) (= (select (arr!7104 a!3312) (index!11181 lt!146931)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66849 (= lt!146931 e!187160)))

(declare-fun c!47619 () Bool)

(declare-fun lt!146929 () SeekEntryResult!2252)

(assert (=> d!66849 (= c!47619 (and ((_ is Intermediate!2252) lt!146929) (undefined!3064 lt!146929)))))

(assert (=> d!66849 (= lt!146929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66849 (validMask!0 mask!3809)))

(assert (=> d!66849 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146931)))

(declare-fun b!296122 () Bool)

(declare-fun e!187158 () SeekEntryResult!2252)

(assert (=> b!296122 (= e!187160 e!187158)))

(declare-fun lt!146930 () (_ BitVec 64))

(assert (=> b!296122 (= lt!146930 (select (arr!7104 a!3312) (index!11180 lt!146929)))))

(declare-fun c!47621 () Bool)

(assert (=> b!296122 (= c!47621 (= lt!146930 k0!2524))))

(declare-fun b!296123 () Bool)

(declare-fun e!187159 () SeekEntryResult!2252)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14986 (_ BitVec 32)) SeekEntryResult!2252)

(assert (=> b!296123 (= e!187159 (seekKeyOrZeroReturnVacant!0 (x!29404 lt!146929) (index!11180 lt!146929) (index!11180 lt!146929) k0!2524 a!3312 mask!3809))))

(declare-fun b!296124 () Bool)

(declare-fun c!47620 () Bool)

(assert (=> b!296124 (= c!47620 (= lt!146930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296124 (= e!187158 e!187159)))

(declare-fun b!296125 () Bool)

(assert (=> b!296125 (= e!187159 (MissingZero!2252 (index!11180 lt!146929)))))

(declare-fun b!296126 () Bool)

(assert (=> b!296126 (= e!187158 (Found!2252 (index!11180 lt!146929)))))

(assert (= (and d!66849 c!47619) b!296121))

(assert (= (and d!66849 (not c!47619)) b!296122))

(assert (= (and b!296122 c!47621) b!296126))

(assert (= (and b!296122 (not c!47621)) b!296124))

(assert (= (and b!296124 c!47620) b!296125))

(assert (= (and b!296124 (not c!47620)) b!296123))

(declare-fun m!308705 () Bool)

(assert (=> d!66849 m!308705))

(assert (=> d!66849 m!308625))

(declare-fun m!308707 () Bool)

(assert (=> d!66849 m!308707))

(assert (=> d!66849 m!308625))

(declare-fun m!308709 () Bool)

(assert (=> d!66849 m!308709))

(declare-fun m!308711 () Bool)

(assert (=> d!66849 m!308711))

(assert (=> d!66849 m!308635))

(declare-fun m!308713 () Bool)

(assert (=> b!296122 m!308713))

(declare-fun m!308715 () Bool)

(assert (=> b!296123 m!308715))

(assert (=> b!296034 d!66849))

(declare-fun d!66865 () Bool)

(declare-fun res!156045 () Bool)

(declare-fun e!187167 () Bool)

(assert (=> d!66865 (=> res!156045 e!187167)))

(assert (=> d!66865 (= res!156045 (= (select (arr!7104 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66865 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187167)))

(declare-fun b!296133 () Bool)

(declare-fun e!187168 () Bool)

(assert (=> b!296133 (= e!187167 e!187168)))

(declare-fun res!156046 () Bool)

(assert (=> b!296133 (=> (not res!156046) (not e!187168))))

(assert (=> b!296133 (= res!156046 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7457 a!3312)))))

(declare-fun b!296134 () Bool)

(assert (=> b!296134 (= e!187168 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66865 (not res!156045)) b!296133))

(assert (= (and b!296133 res!156046) b!296134))

(assert (=> d!66865 m!308685))

(declare-fun m!308717 () Bool)

(assert (=> b!296134 m!308717))

(assert (=> b!296033 d!66865))

(declare-fun d!66867 () Bool)

(assert (=> d!66867 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296038 d!66867))

(declare-fun d!66869 () Bool)

(assert (=> d!66869 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29180 d!66869))

(declare-fun d!66871 () Bool)

(assert (=> d!66871 (= (array_inv!5076 a!3312) (bvsge (size!7457 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29180 d!66871))

(declare-fun b!296209 () Bool)

(declare-fun e!187211 () SeekEntryResult!2252)

(assert (=> b!296209 (= e!187211 (Intermediate!2252 false lt!146872 #b00000000000000000000000000000000))))

(declare-fun b!296210 () Bool)

(declare-fun e!187215 () Bool)

(declare-fun e!187214 () Bool)

(assert (=> b!296210 (= e!187215 e!187214)))

(declare-fun res!156066 () Bool)

(declare-fun lt!146965 () SeekEntryResult!2252)

(assert (=> b!296210 (= res!156066 (and ((_ is Intermediate!2252) lt!146965) (not (undefined!3064 lt!146965)) (bvslt (x!29404 lt!146965) #b01111111111111111111111111111110) (bvsge (x!29404 lt!146965) #b00000000000000000000000000000000) (bvsge (x!29404 lt!146965) #b00000000000000000000000000000000)))))

(assert (=> b!296210 (=> (not res!156066) (not e!187214))))

(declare-fun b!296211 () Bool)

(declare-fun e!187213 () SeekEntryResult!2252)

(assert (=> b!296211 (= e!187213 e!187211)))

(declare-fun c!47650 () Bool)

(declare-fun lt!146964 () (_ BitVec 64))

(assert (=> b!296211 (= c!47650 (or (= lt!146964 k0!2524) (= (bvadd lt!146964 lt!146964) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66873 () Bool)

(assert (=> d!66873 e!187215))

(declare-fun c!47652 () Bool)

(assert (=> d!66873 (= c!47652 (and ((_ is Intermediate!2252) lt!146965) (undefined!3064 lt!146965)))))

(assert (=> d!66873 (= lt!146965 e!187213)))

(declare-fun c!47651 () Bool)

(assert (=> d!66873 (= c!47651 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66873 (= lt!146964 (select (arr!7104 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312))) lt!146872))))

(assert (=> d!66873 (validMask!0 mask!3809)))

(assert (=> d!66873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146872 k0!2524 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)) mask!3809) lt!146965)))

(declare-fun b!296212 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296212 (= e!187211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146872 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)) mask!3809))))

(declare-fun b!296213 () Bool)

(assert (=> b!296213 (and (bvsge (index!11180 lt!146965) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146965) (size!7457 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)))))))

(declare-fun e!187212 () Bool)

(assert (=> b!296213 (= e!187212 (= (select (arr!7104 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312))) (index!11180 lt!146965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296214 () Bool)

(assert (=> b!296214 (and (bvsge (index!11180 lt!146965) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146965) (size!7457 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)))))))

(declare-fun res!156065 () Bool)

(assert (=> b!296214 (= res!156065 (= (select (arr!7104 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312))) (index!11180 lt!146965)) k0!2524))))

(assert (=> b!296214 (=> res!156065 e!187212)))

(assert (=> b!296214 (= e!187214 e!187212)))

(declare-fun b!296215 () Bool)

(assert (=> b!296215 (= e!187213 (Intermediate!2252 true lt!146872 #b00000000000000000000000000000000))))

(declare-fun b!296216 () Bool)

(assert (=> b!296216 (and (bvsge (index!11180 lt!146965) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146965) (size!7457 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312)))))))

(declare-fun res!156067 () Bool)

(assert (=> b!296216 (= res!156067 (= (select (arr!7104 (array!14987 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7457 a!3312))) (index!11180 lt!146965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296216 (=> res!156067 e!187212)))

(declare-fun b!296217 () Bool)

(assert (=> b!296217 (= e!187215 (bvsge (x!29404 lt!146965) #b01111111111111111111111111111110))))

(assert (= (and d!66873 c!47651) b!296215))

(assert (= (and d!66873 (not c!47651)) b!296211))

(assert (= (and b!296211 c!47650) b!296209))

(assert (= (and b!296211 (not c!47650)) b!296212))

(assert (= (and d!66873 c!47652) b!296217))

(assert (= (and d!66873 (not c!47652)) b!296210))

(assert (= (and b!296210 res!156066) b!296214))

(assert (= (and b!296214 (not res!156065)) b!296216))

(assert (= (and b!296216 (not res!156067)) b!296213))

(declare-fun m!308741 () Bool)

(assert (=> b!296216 m!308741))

(assert (=> b!296213 m!308741))

(declare-fun m!308743 () Bool)

(assert (=> b!296212 m!308743))

(assert (=> b!296212 m!308743))

(declare-fun m!308745 () Bool)

(assert (=> b!296212 m!308745))

(assert (=> b!296214 m!308741))

(declare-fun m!308747 () Bool)

(assert (=> d!66873 m!308747))

(assert (=> d!66873 m!308635))

(assert (=> b!296031 d!66873))

(declare-fun b!296222 () Bool)

(declare-fun e!187218 () SeekEntryResult!2252)

(assert (=> b!296222 (= e!187218 (Intermediate!2252 false lt!146872 #b00000000000000000000000000000000))))

(declare-fun b!296223 () Bool)

(declare-fun e!187222 () Bool)

(declare-fun e!187221 () Bool)

(assert (=> b!296223 (= e!187222 e!187221)))

(declare-fun res!156069 () Bool)

(declare-fun lt!146967 () SeekEntryResult!2252)

(assert (=> b!296223 (= res!156069 (and ((_ is Intermediate!2252) lt!146967) (not (undefined!3064 lt!146967)) (bvslt (x!29404 lt!146967) #b01111111111111111111111111111110) (bvsge (x!29404 lt!146967) #b00000000000000000000000000000000) (bvsge (x!29404 lt!146967) #b00000000000000000000000000000000)))))

(assert (=> b!296223 (=> (not res!156069) (not e!187221))))

(declare-fun b!296224 () Bool)

(declare-fun e!187220 () SeekEntryResult!2252)

(assert (=> b!296224 (= e!187220 e!187218)))

(declare-fun c!47655 () Bool)

(declare-fun lt!146966 () (_ BitVec 64))

(assert (=> b!296224 (= c!47655 (or (= lt!146966 k0!2524) (= (bvadd lt!146966 lt!146966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66879 () Bool)

(assert (=> d!66879 e!187222))

(declare-fun c!47657 () Bool)

(assert (=> d!66879 (= c!47657 (and ((_ is Intermediate!2252) lt!146967) (undefined!3064 lt!146967)))))

(assert (=> d!66879 (= lt!146967 e!187220)))

(declare-fun c!47656 () Bool)

(assert (=> d!66879 (= c!47656 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66879 (= lt!146966 (select (arr!7104 a!3312) lt!146872))))

(assert (=> d!66879 (validMask!0 mask!3809)))

(assert (=> d!66879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146872 k0!2524 a!3312 mask!3809) lt!146967)))

(declare-fun b!296225 () Bool)

(assert (=> b!296225 (= e!187218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146872 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!296226 () Bool)

(assert (=> b!296226 (and (bvsge (index!11180 lt!146967) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146967) (size!7457 a!3312)))))

(declare-fun e!187219 () Bool)

(assert (=> b!296226 (= e!187219 (= (select (arr!7104 a!3312) (index!11180 lt!146967)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296227 () Bool)

(assert (=> b!296227 (and (bvsge (index!11180 lt!146967) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146967) (size!7457 a!3312)))))

(declare-fun res!156068 () Bool)

(assert (=> b!296227 (= res!156068 (= (select (arr!7104 a!3312) (index!11180 lt!146967)) k0!2524))))

(assert (=> b!296227 (=> res!156068 e!187219)))

(assert (=> b!296227 (= e!187221 e!187219)))

(declare-fun b!296228 () Bool)

(assert (=> b!296228 (= e!187220 (Intermediate!2252 true lt!146872 #b00000000000000000000000000000000))))

(declare-fun b!296229 () Bool)

(assert (=> b!296229 (and (bvsge (index!11180 lt!146967) #b00000000000000000000000000000000) (bvslt (index!11180 lt!146967) (size!7457 a!3312)))))

(declare-fun res!156070 () Bool)

(assert (=> b!296229 (= res!156070 (= (select (arr!7104 a!3312) (index!11180 lt!146967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296229 (=> res!156070 e!187219)))

(declare-fun b!296230 () Bool)

(assert (=> b!296230 (= e!187222 (bvsge (x!29404 lt!146967) #b01111111111111111111111111111110))))

(assert (= (and d!66879 c!47656) b!296228))

(assert (= (and d!66879 (not c!47656)) b!296224))

(assert (= (and b!296224 c!47655) b!296222))

(assert (= (and b!296224 (not c!47655)) b!296225))

(assert (= (and d!66879 c!47657) b!296230))

(assert (= (and d!66879 (not c!47657)) b!296223))

(assert (= (and b!296223 res!156069) b!296227))

(assert (= (and b!296227 (not res!156068)) b!296229))

(assert (= (and b!296229 (not res!156070)) b!296226))

(declare-fun m!308749 () Bool)

(assert (=> b!296229 m!308749))

(assert (=> b!296226 m!308749))

(assert (=> b!296225 m!308743))

(assert (=> b!296225 m!308743))

(declare-fun m!308751 () Bool)

(assert (=> b!296225 m!308751))

(assert (=> b!296227 m!308749))

(declare-fun m!308753 () Bool)

(assert (=> d!66879 m!308753))

(assert (=> d!66879 m!308635))

(assert (=> b!296031 d!66879))

(declare-fun d!66881 () Bool)

(declare-fun lt!146980 () (_ BitVec 32))

(declare-fun lt!146979 () (_ BitVec 32))

(assert (=> d!66881 (= lt!146980 (bvmul (bvxor lt!146979 (bvlshr lt!146979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66881 (= lt!146979 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66881 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156074 (let ((h!5260 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29409 (bvmul (bvxor h!5260 (bvlshr h!5260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29409 (bvlshr x!29409 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156074 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156074 #b00000000000000000000000000000000))))))

(assert (=> d!66881 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146980 (bvlshr lt!146980 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296031 d!66881))

(check-sat (not bm!25709) (not d!66879) (not b!296096) (not b!296212) (not b!296123) (not d!66873) (not b!296097) (not b!296134) (not b!296225) (not d!66849))
(check-sat)
