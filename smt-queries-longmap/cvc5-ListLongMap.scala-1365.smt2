; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26748 () Bool)

(assert start!26748)

(declare-fun b!277898 () Bool)

(declare-datatypes ((Unit!8791 0))(
  ( (Unit!8792) )
))
(declare-fun e!177254 () Unit!8791)

(declare-fun lt!138118 () Unit!8791)

(assert (=> b!277898 (= e!177254 lt!138118)))

(declare-datatypes ((array!13845 0))(
  ( (array!13846 (arr!6572 (Array (_ BitVec 32) (_ BitVec 64))) (size!6924 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13845)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8791)

(assert (=> b!277898 (= lt!138118 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138114 () array!13845)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13845 (_ BitVec 32)) Bool)

(assert (=> b!277898 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138114 mask!3868)))

(declare-fun b!277899 () Bool)

(declare-fun e!177257 () Bool)

(assert (=> b!277899 (= e!177257 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138114 mask!3868)))))

(declare-datatypes ((SeekEntryResult!1730 0))(
  ( (MissingZero!1730 (index!9090 (_ BitVec 32))) (Found!1730 (index!9091 (_ BitVec 32))) (Intermediate!1730 (undefined!2542 Bool) (index!9092 (_ BitVec 32)) (x!27335 (_ BitVec 32))) (Undefined!1730) (MissingVacant!1730 (index!9093 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13845 (_ BitVec 32)) SeekEntryResult!1730)

(assert (=> b!277899 (= (seekEntryOrOpen!0 k!2581 lt!138114 mask!3868) (Found!1730 i!1267))))

(declare-fun lt!138116 () Unit!8791)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8791)

(assert (=> b!277899 (= lt!138116 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138115 () Unit!8791)

(assert (=> b!277899 (= lt!138115 e!177254)))

(declare-fun c!45648 () Bool)

(assert (=> b!277899 (= c!45648 (bvslt startIndex!26 (bvsub (size!6924 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277900 () Bool)

(declare-fun e!177255 () Bool)

(assert (=> b!277900 (= e!177255 e!177257)))

(declare-fun res!141707 () Bool)

(assert (=> b!277900 (=> (not res!141707) (not e!177257))))

(assert (=> b!277900 (= res!141707 (= startIndex!26 i!1267))))

(assert (=> b!277900 (= lt!138114 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)))))

(declare-fun b!277901 () Bool)

(declare-fun res!141706 () Bool)

(declare-fun e!177256 () Bool)

(assert (=> b!277901 (=> (not res!141706) (not e!177256))))

(assert (=> b!277901 (= res!141706 (and (= (size!6924 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6924 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6924 a!3325))))))

(declare-fun b!277902 () Bool)

(assert (=> b!277902 (= e!177256 e!177255)))

(declare-fun res!141709 () Bool)

(assert (=> b!277902 (=> (not res!141709) (not e!177255))))

(declare-fun lt!138117 () SeekEntryResult!1730)

(assert (=> b!277902 (= res!141709 (or (= lt!138117 (MissingZero!1730 i!1267)) (= lt!138117 (MissingVacant!1730 i!1267))))))

(assert (=> b!277902 (= lt!138117 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277903 () Bool)

(declare-fun res!141708 () Bool)

(assert (=> b!277903 (=> (not res!141708) (not e!177256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277903 (= res!141708 (validKeyInArray!0 k!2581))))

(declare-fun b!277904 () Bool)

(declare-fun Unit!8793 () Unit!8791)

(assert (=> b!277904 (= e!177254 Unit!8793)))

(declare-fun res!141705 () Bool)

(assert (=> start!26748 (=> (not res!141705) (not e!177256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26748 (= res!141705 (validMask!0 mask!3868))))

(assert (=> start!26748 e!177256))

(declare-fun array_inv!4535 (array!13845) Bool)

(assert (=> start!26748 (array_inv!4535 a!3325)))

(assert (=> start!26748 true))

(declare-fun b!277905 () Bool)

(declare-fun res!141710 () Bool)

(assert (=> b!277905 (=> (not res!141710) (not e!177255))))

(assert (=> b!277905 (= res!141710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277906 () Bool)

(declare-fun res!141711 () Bool)

(assert (=> b!277906 (=> (not res!141711) (not e!177256))))

(declare-datatypes ((List!4380 0))(
  ( (Nil!4377) (Cons!4376 (h!5043 (_ BitVec 64)) (t!9462 List!4380)) )
))
(declare-fun arrayNoDuplicates!0 (array!13845 (_ BitVec 32) List!4380) Bool)

(assert (=> b!277906 (= res!141711 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4377))))

(declare-fun b!277907 () Bool)

(declare-fun res!141704 () Bool)

(assert (=> b!277907 (=> (not res!141704) (not e!177256))))

(declare-fun arrayContainsKey!0 (array!13845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277907 (= res!141704 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26748 res!141705) b!277901))

(assert (= (and b!277901 res!141706) b!277903))

(assert (= (and b!277903 res!141708) b!277906))

(assert (= (and b!277906 res!141711) b!277907))

(assert (= (and b!277907 res!141704) b!277902))

(assert (= (and b!277902 res!141709) b!277905))

(assert (= (and b!277905 res!141710) b!277900))

(assert (= (and b!277900 res!141707) b!277899))

(assert (= (and b!277899 c!45648) b!277898))

(assert (= (and b!277899 (not c!45648)) b!277904))

(declare-fun m!292815 () Bool)

(assert (=> b!277899 m!292815))

(declare-fun m!292817 () Bool)

(assert (=> b!277899 m!292817))

(declare-fun m!292819 () Bool)

(assert (=> b!277899 m!292819))

(declare-fun m!292821 () Bool)

(assert (=> b!277903 m!292821))

(declare-fun m!292823 () Bool)

(assert (=> b!277902 m!292823))

(declare-fun m!292825 () Bool)

(assert (=> b!277900 m!292825))

(declare-fun m!292827 () Bool)

(assert (=> b!277907 m!292827))

(declare-fun m!292829 () Bool)

(assert (=> b!277906 m!292829))

(declare-fun m!292831 () Bool)

(assert (=> b!277898 m!292831))

(declare-fun m!292833 () Bool)

(assert (=> b!277898 m!292833))

(declare-fun m!292835 () Bool)

(assert (=> start!26748 m!292835))

(declare-fun m!292837 () Bool)

(assert (=> start!26748 m!292837))

(declare-fun m!292839 () Bool)

(assert (=> b!277905 m!292839))

(push 1)

(assert (not b!277907))

(assert (not b!277898))

(assert (not b!277903))

(assert (not start!26748))

(assert (not b!277905))

(assert (not b!277902))

(assert (not b!277906))

(assert (not b!277899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!277999 () Bool)

(declare-fun e!177317 () Bool)

(declare-fun contains!1961 (List!4380 (_ BitVec 64)) Bool)

(assert (=> b!277999 (= e!177317 (contains!1961 Nil!4377 (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278000 () Bool)

(declare-fun e!177316 () Bool)

(declare-fun e!177314 () Bool)

(assert (=> b!278000 (= e!177316 e!177314)))

(declare-fun res!141781 () Bool)

(assert (=> b!278000 (=> (not res!141781) (not e!177314))))

(assert (=> b!278000 (= res!141781 (not e!177317))))

(declare-fun res!141782 () Bool)

(assert (=> b!278000 (=> (not res!141782) (not e!177317))))

(assert (=> b!278000 (= res!141782 (validKeyInArray!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64705 () Bool)

(declare-fun res!141783 () Bool)

(assert (=> d!64705 (=> res!141783 e!177316)))

(assert (=> d!64705 (= res!141783 (bvsge #b00000000000000000000000000000000 (size!6924 a!3325)))))

(assert (=> d!64705 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4377) e!177316)))

(declare-fun b!278001 () Bool)

(declare-fun e!177315 () Bool)

(declare-fun call!25354 () Bool)

(assert (=> b!278001 (= e!177315 call!25354)))

(declare-fun bm!25351 () Bool)

(declare-fun c!45660 () Bool)

(assert (=> bm!25351 (= call!25354 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45660 (Cons!4376 (select (arr!6572 a!3325) #b00000000000000000000000000000000) Nil!4377) Nil!4377)))))

(declare-fun b!278002 () Bool)

(assert (=> b!278002 (= e!177315 call!25354)))

(declare-fun b!278003 () Bool)

(assert (=> b!278003 (= e!177314 e!177315)))

(assert (=> b!278003 (= c!45660 (validKeyInArray!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64705 (not res!141783)) b!278000))

(assert (= (and b!278000 res!141782) b!277999))

(assert (= (and b!278000 res!141781) b!278003))

(assert (= (and b!278003 c!45660) b!278001))

(assert (= (and b!278003 (not c!45660)) b!278002))

(assert (= (or b!278001 b!278002) bm!25351))

(declare-fun m!292913 () Bool)

(assert (=> b!277999 m!292913))

(assert (=> b!277999 m!292913))

(declare-fun m!292915 () Bool)

(assert (=> b!277999 m!292915))

(assert (=> b!278000 m!292913))

(assert (=> b!278000 m!292913))

(declare-fun m!292917 () Bool)

(assert (=> b!278000 m!292917))

(assert (=> bm!25351 m!292913))

(declare-fun m!292919 () Bool)

(assert (=> bm!25351 m!292919))

(assert (=> b!278003 m!292913))

(assert (=> b!278003 m!292913))

(assert (=> b!278003 m!292917))

(assert (=> b!277906 d!64705))

(declare-fun b!278032 () Bool)

(declare-fun e!177339 () Bool)

(declare-fun e!177338 () Bool)

(assert (=> b!278032 (= e!177339 e!177338)))

(declare-fun lt!138187 () (_ BitVec 64))

(assert (=> b!278032 (= lt!138187 (select (arr!6572 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!138186 () Unit!8791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13845 (_ BitVec 64) (_ BitVec 32)) Unit!8791)

(assert (=> b!278032 (= lt!138186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138187 #b00000000000000000000000000000000))))

(assert (=> b!278032 (arrayContainsKey!0 a!3325 lt!138187 #b00000000000000000000000000000000)))

(declare-fun lt!138185 () Unit!8791)

(assert (=> b!278032 (= lt!138185 lt!138186)))

(declare-fun res!141796 () Bool)

(assert (=> b!278032 (= res!141796 (= (seekEntryOrOpen!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1730 #b00000000000000000000000000000000)))))

(assert (=> b!278032 (=> (not res!141796) (not e!177338))))

(declare-fun bm!25358 () Bool)

(declare-fun call!25361 () Bool)

(assert (=> bm!25358 (= call!25361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278033 () Bool)

(declare-fun e!177340 () Bool)

(assert (=> b!278033 (= e!177340 e!177339)))

(declare-fun c!45669 () Bool)

(assert (=> b!278033 (= c!45669 (validKeyInArray!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64709 () Bool)

(declare-fun res!141797 () Bool)

(assert (=> d!64709 (=> res!141797 e!177340)))

(assert (=> d!64709 (= res!141797 (bvsge #b00000000000000000000000000000000 (size!6924 a!3325)))))

(assert (=> d!64709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177340)))

(declare-fun b!278034 () Bool)

(assert (=> b!278034 (= e!177339 call!25361)))

(declare-fun b!278035 () Bool)

(assert (=> b!278035 (= e!177338 call!25361)))

(assert (= (and d!64709 (not res!141797)) b!278033))

(assert (= (and b!278033 c!45669) b!278032))

(assert (= (and b!278033 (not c!45669)) b!278034))

(assert (= (and b!278032 res!141796) b!278035))

(assert (= (or b!278035 b!278034) bm!25358))

(assert (=> b!278032 m!292913))

(declare-fun m!292945 () Bool)

(assert (=> b!278032 m!292945))

(declare-fun m!292947 () Bool)

(assert (=> b!278032 m!292947))

(assert (=> b!278032 m!292913))

(declare-fun m!292949 () Bool)

(assert (=> b!278032 m!292949))

(declare-fun m!292951 () Bool)

(assert (=> bm!25358 m!292951))

(assert (=> b!278033 m!292913))

(assert (=> b!278033 m!292913))

(assert (=> b!278033 m!292917))

(assert (=> b!277905 d!64709))

(declare-fun d!64715 () Bool)

(assert (=> d!64715 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26748 d!64715))

(declare-fun d!64723 () Bool)

(assert (=> d!64723 (= (array_inv!4535 a!3325) (bvsge (size!6924 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26748 d!64723))

(declare-fun b!278060 () Bool)

(declare-fun e!177355 () Bool)

(declare-fun e!177354 () Bool)

(assert (=> b!278060 (= e!177355 e!177354)))

(declare-fun lt!138199 () (_ BitVec 64))

(assert (=> b!278060 (= lt!138199 (select (arr!6572 lt!138114) startIndex!26))))

(declare-fun lt!138198 () Unit!8791)

(assert (=> b!278060 (= lt!138198 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138199 startIndex!26))))

(assert (=> b!278060 (arrayContainsKey!0 lt!138114 lt!138199 #b00000000000000000000000000000000)))

(declare-fun lt!138197 () Unit!8791)

(assert (=> b!278060 (= lt!138197 lt!138198)))

(declare-fun res!141800 () Bool)

(assert (=> b!278060 (= res!141800 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) startIndex!26) lt!138114 mask!3868) (Found!1730 startIndex!26)))))

(assert (=> b!278060 (=> (not res!141800) (not e!177354))))

(declare-fun call!25363 () Bool)

(declare-fun bm!25360 () Bool)

(assert (=> bm!25360 (= call!25363 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138114 mask!3868))))

(declare-fun b!278061 () Bool)

(declare-fun e!177356 () Bool)

(assert (=> b!278061 (= e!177356 e!177355)))

(declare-fun c!45681 () Bool)

(assert (=> b!278061 (= c!45681 (validKeyInArray!0 (select (arr!6572 lt!138114) startIndex!26)))))

(declare-fun d!64725 () Bool)

(declare-fun res!141801 () Bool)

(assert (=> d!64725 (=> res!141801 e!177356)))

(assert (=> d!64725 (= res!141801 (bvsge startIndex!26 (size!6924 lt!138114)))))

(assert (=> d!64725 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138114 mask!3868) e!177356)))

(declare-fun b!278062 () Bool)

(assert (=> b!278062 (= e!177355 call!25363)))

(declare-fun b!278063 () Bool)

(assert (=> b!278063 (= e!177354 call!25363)))

(assert (= (and d!64725 (not res!141801)) b!278061))

(assert (= (and b!278061 c!45681) b!278060))

(assert (= (and b!278061 (not c!45681)) b!278062))

(assert (= (and b!278060 res!141800) b!278063))

(assert (= (or b!278063 b!278062) bm!25360))

(declare-fun m!292991 () Bool)

(assert (=> b!278060 m!292991))

(declare-fun m!292993 () Bool)

(assert (=> b!278060 m!292993))

(declare-fun m!292995 () Bool)

(assert (=> b!278060 m!292995))

(assert (=> b!278060 m!292991))

(declare-fun m!292997 () Bool)

(assert (=> b!278060 m!292997))

(declare-fun m!292999 () Bool)

(assert (=> bm!25360 m!292999))

(assert (=> b!278061 m!292991))

(assert (=> b!278061 m!292991))

(declare-fun m!293001 () Bool)

(assert (=> b!278061 m!293001))

(assert (=> b!277899 d!64725))

(declare-fun b!278132 () Bool)

(declare-fun e!177405 () SeekEntryResult!1730)

(assert (=> b!278132 (= e!177405 Undefined!1730)))

(declare-fun d!64727 () Bool)

(declare-fun lt!138230 () SeekEntryResult!1730)

(assert (=> d!64727 (and (or (is-Undefined!1730 lt!138230) (not (is-Found!1730 lt!138230)) (and (bvsge (index!9091 lt!138230) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138230) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138230) (is-Found!1730 lt!138230) (not (is-MissingZero!1730 lt!138230)) (and (bvsge (index!9090 lt!138230) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138230) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138230) (is-Found!1730 lt!138230) (is-MissingZero!1730 lt!138230) (not (is-MissingVacant!1730 lt!138230)) (and (bvsge (index!9093 lt!138230) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138230) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138230) (ite (is-Found!1730 lt!138230) (= (select (arr!6572 lt!138114) (index!9091 lt!138230)) k!2581) (ite (is-MissingZero!1730 lt!138230) (= (select (arr!6572 lt!138114) (index!9090 lt!138230)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138230) (= (select (arr!6572 lt!138114) (index!9093 lt!138230)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64727 (= lt!138230 e!177405)))

(declare-fun c!45702 () Bool)

(declare-fun lt!138231 () SeekEntryResult!1730)

(assert (=> d!64727 (= c!45702 (and (is-Intermediate!1730 lt!138231) (undefined!2542 lt!138231)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13845 (_ BitVec 32)) SeekEntryResult!1730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64727 (= lt!138231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 lt!138114 mask!3868))))

(assert (=> d!64727 (validMask!0 mask!3868)))

(assert (=> d!64727 (= (seekEntryOrOpen!0 k!2581 lt!138114 mask!3868) lt!138230)))

(declare-fun b!278133 () Bool)

(declare-fun c!45703 () Bool)

(declare-fun lt!138232 () (_ BitVec 64))

(assert (=> b!278133 (= c!45703 (= lt!138232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177406 () SeekEntryResult!1730)

(declare-fun e!177407 () SeekEntryResult!1730)

(assert (=> b!278133 (= e!177406 e!177407)))

(declare-fun b!278134 () Bool)

(assert (=> b!278134 (= e!177405 e!177406)))

(assert (=> b!278134 (= lt!138232 (select (arr!6572 lt!138114) (index!9092 lt!138231)))))

(declare-fun c!45704 () Bool)

(assert (=> b!278134 (= c!45704 (= lt!138232 k!2581))))

(declare-fun b!278135 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13845 (_ BitVec 32)) SeekEntryResult!1730)

(assert (=> b!278135 (= e!177407 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138231) (index!9092 lt!138231) (index!9092 lt!138231) k!2581 lt!138114 mask!3868))))

(declare-fun b!278136 () Bool)

(assert (=> b!278136 (= e!177406 (Found!1730 (index!9092 lt!138231)))))

(declare-fun b!278137 () Bool)

(assert (=> b!278137 (= e!177407 (MissingZero!1730 (index!9092 lt!138231)))))

(assert (= (and d!64727 c!45702) b!278132))

(assert (= (and d!64727 (not c!45702)) b!278134))

(assert (= (and b!278134 c!45704) b!278136))

(assert (= (and b!278134 (not c!45704)) b!278133))

(assert (= (and b!278133 c!45703) b!278137))

(assert (= (and b!278133 (not c!45703)) b!278135))

(declare-fun m!293057 () Bool)

(assert (=> d!64727 m!293057))

(declare-fun m!293059 () Bool)

(assert (=> d!64727 m!293059))

(declare-fun m!293061 () Bool)

(assert (=> d!64727 m!293061))

(assert (=> d!64727 m!292835))

(declare-fun m!293063 () Bool)

(assert (=> d!64727 m!293063))

(assert (=> d!64727 m!293057))

(declare-fun m!293065 () Bool)

(assert (=> d!64727 m!293065))

(declare-fun m!293067 () Bool)

(assert (=> b!278134 m!293067))

(declare-fun m!293069 () Bool)

(assert (=> b!278135 m!293069))

(assert (=> b!277899 d!64727))

(declare-fun d!64745 () Bool)

(declare-fun e!177410 () Bool)

(assert (=> d!64745 e!177410))

(declare-fun res!141832 () Bool)

(assert (=> d!64745 (=> (not res!141832) (not e!177410))))

(assert (=> d!64745 (= res!141832 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6924 a!3325))))))

(declare-fun lt!138235 () Unit!8791)

(declare-fun choose!8 (array!13845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8791)

(assert (=> d!64745 (= lt!138235 (choose!8 a!3325 i!1267 k!2581 mask!3868))))

(assert (=> d!64745 (validMask!0 mask!3868)))

(assert (=> d!64745 (= (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868) lt!138235)))

(declare-fun b!278140 () Bool)

(assert (=> b!278140 (= e!177410 (= (seekEntryOrOpen!0 k!2581 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868) (Found!1730 i!1267)))))

(assert (= (and d!64745 res!141832) b!278140))

(declare-fun m!293071 () Bool)

(assert (=> d!64745 m!293071))

(assert (=> d!64745 m!292835))

(assert (=> b!278140 m!292825))

(declare-fun m!293073 () Bool)

(assert (=> b!278140 m!293073))

(assert (=> b!277899 d!64745))

(declare-fun d!64751 () Bool)

(assert (=> d!64751 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277903 d!64751))

(declare-fun d!64755 () Bool)

(declare-fun e!177428 () Bool)

(assert (=> d!64755 e!177428))

(declare-fun res!141844 () Bool)

(assert (=> d!64755 (=> (not res!141844) (not e!177428))))

(assert (=> d!64755 (= res!141844 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6924 a!3325))))))

(declare-fun lt!138241 () Unit!8791)

(declare-fun choose!98 (array!13845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8791)

(assert (=> d!64755 (= lt!138241 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!64755 (validMask!0 mask!3868)))

(assert (=> d!64755 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!138241)))

(declare-fun b!278164 () Bool)

(assert (=> b!278164 (= e!177428 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868))))

(assert (= (and d!64755 res!141844) b!278164))

(declare-fun m!293091 () Bool)

(assert (=> d!64755 m!293091))

(assert (=> d!64755 m!292835))

(assert (=> b!278164 m!292825))

(declare-fun m!293093 () Bool)

(assert (=> b!278164 m!293093))

(assert (=> b!277898 d!64755))

(declare-fun b!278165 () Bool)

(declare-fun e!177430 () Bool)

(declare-fun e!177429 () Bool)

(assert (=> b!278165 (= e!177430 e!177429)))

(declare-fun lt!138244 () (_ BitVec 64))

(assert (=> b!278165 (= lt!138244 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138243 () Unit!8791)

(assert (=> b!278165 (= lt!138243 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138244 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278165 (arrayContainsKey!0 lt!138114 lt!138244 #b00000000000000000000000000000000)))

(declare-fun lt!138242 () Unit!8791)

(assert (=> b!278165 (= lt!138242 lt!138243)))

(declare-fun res!141845 () Bool)

(assert (=> b!278165 (= res!141845 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138114 mask!3868) (Found!1730 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278165 (=> (not res!141845) (not e!177429))))

(declare-fun call!25372 () Bool)

(declare-fun bm!25369 () Bool)

(assert (=> bm!25369 (= call!25372 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138114 mask!3868))))

(declare-fun b!278166 () Bool)

(declare-fun e!177431 () Bool)

(assert (=> b!278166 (= e!177431 e!177430)))

(declare-fun c!45711 () Bool)

(assert (=> b!278166 (= c!45711 (validKeyInArray!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun d!64757 () Bool)

(declare-fun res!141846 () Bool)

(assert (=> d!64757 (=> res!141846 e!177431)))

(assert (=> d!64757 (= res!141846 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6924 lt!138114)))))

(assert (=> d!64757 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138114 mask!3868) e!177431)))

(declare-fun b!278167 () Bool)

(assert (=> b!278167 (= e!177430 call!25372)))

(declare-fun b!278168 () Bool)

(assert (=> b!278168 (= e!177429 call!25372)))

(assert (= (and d!64757 (not res!141846)) b!278166))

(assert (= (and b!278166 c!45711) b!278165))

(assert (= (and b!278166 (not c!45711)) b!278167))

(assert (= (and b!278165 res!141845) b!278168))

(assert (= (or b!278168 b!278167) bm!25369))

(declare-fun m!293095 () Bool)

(assert (=> b!278165 m!293095))

(declare-fun m!293097 () Bool)

(assert (=> b!278165 m!293097))

(declare-fun m!293099 () Bool)

(assert (=> b!278165 m!293099))

(assert (=> b!278165 m!293095))

(declare-fun m!293101 () Bool)

(assert (=> b!278165 m!293101))

(declare-fun m!293103 () Bool)

(assert (=> bm!25369 m!293103))

(assert (=> b!278166 m!293095))

(assert (=> b!278166 m!293095))

(declare-fun m!293105 () Bool)

(assert (=> b!278166 m!293105))

(assert (=> b!277898 d!64757))

(declare-fun d!64759 () Bool)

(declare-fun res!141851 () Bool)

(declare-fun e!177436 () Bool)

(assert (=> d!64759 (=> res!141851 e!177436)))

(assert (=> d!64759 (= res!141851 (= (select (arr!6572 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!64759 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!177436)))

(declare-fun b!278173 () Bool)

(declare-fun e!177437 () Bool)

(assert (=> b!278173 (= e!177436 e!177437)))

(declare-fun res!141852 () Bool)

(assert (=> b!278173 (=> (not res!141852) (not e!177437))))

(assert (=> b!278173 (= res!141852 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 a!3325)))))

(declare-fun b!278174 () Bool)

(assert (=> b!278174 (= e!177437 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64759 (not res!141851)) b!278173))

(assert (= (and b!278173 res!141852) b!278174))

(assert (=> d!64759 m!292913))

(declare-fun m!293107 () Bool)

(assert (=> b!278174 m!293107))

(assert (=> b!277907 d!64759))

(declare-fun b!278175 () Bool)

(declare-fun e!177438 () SeekEntryResult!1730)

(assert (=> b!278175 (= e!177438 Undefined!1730)))

(declare-fun d!64761 () Bool)

(declare-fun lt!138245 () SeekEntryResult!1730)

(assert (=> d!64761 (and (or (is-Undefined!1730 lt!138245) (not (is-Found!1730 lt!138245)) (and (bvsge (index!9091 lt!138245) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138245) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138245) (is-Found!1730 lt!138245) (not (is-MissingZero!1730 lt!138245)) (and (bvsge (index!9090 lt!138245) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138245) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138245) (is-Found!1730 lt!138245) (is-MissingZero!1730 lt!138245) (not (is-MissingVacant!1730 lt!138245)) (and (bvsge (index!9093 lt!138245) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138245) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138245) (ite (is-Found!1730 lt!138245) (= (select (arr!6572 a!3325) (index!9091 lt!138245)) k!2581) (ite (is-MissingZero!1730 lt!138245) (= (select (arr!6572 a!3325) (index!9090 lt!138245)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138245) (= (select (arr!6572 a!3325) (index!9093 lt!138245)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64761 (= lt!138245 e!177438)))

(declare-fun c!45712 () Bool)

(declare-fun lt!138246 () SeekEntryResult!1730)

(assert (=> d!64761 (= c!45712 (and (is-Intermediate!1730 lt!138246) (undefined!2542 lt!138246)))))

(assert (=> d!64761 (= lt!138246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!64761 (validMask!0 mask!3868)))

(assert (=> d!64761 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138245)))

(declare-fun b!278176 () Bool)

(declare-fun c!45713 () Bool)

(declare-fun lt!138247 () (_ BitVec 64))

(assert (=> b!278176 (= c!45713 (= lt!138247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177439 () SeekEntryResult!1730)

(declare-fun e!177440 () SeekEntryResult!1730)

(assert (=> b!278176 (= e!177439 e!177440)))

(declare-fun b!278177 () Bool)

(assert (=> b!278177 (= e!177438 e!177439)))

(assert (=> b!278177 (= lt!138247 (select (arr!6572 a!3325) (index!9092 lt!138246)))))

(declare-fun c!45714 () Bool)

(assert (=> b!278177 (= c!45714 (= lt!138247 k!2581))))

(declare-fun b!278178 () Bool)

(assert (=> b!278178 (= e!177440 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138246) (index!9092 lt!138246) (index!9092 lt!138246) k!2581 a!3325 mask!3868))))

(declare-fun b!278179 () Bool)

(assert (=> b!278179 (= e!177439 (Found!1730 (index!9092 lt!138246)))))

(declare-fun b!278180 () Bool)

(assert (=> b!278180 (= e!177440 (MissingZero!1730 (index!9092 lt!138246)))))

(assert (= (and d!64761 c!45712) b!278175))

(assert (= (and d!64761 (not c!45712)) b!278177))

(assert (= (and b!278177 c!45714) b!278179))

(assert (= (and b!278177 (not c!45714)) b!278176))

(assert (= (and b!278176 c!45713) b!278180))

(assert (= (and b!278176 (not c!45713)) b!278178))

(assert (=> d!64761 m!293057))

(declare-fun m!293109 () Bool)

(assert (=> d!64761 m!293109))

(declare-fun m!293111 () Bool)

(assert (=> d!64761 m!293111))

(assert (=> d!64761 m!292835))

(declare-fun m!293113 () Bool)

(assert (=> d!64761 m!293113))

(assert (=> d!64761 m!293057))

(declare-fun m!293115 () Bool)

(assert (=> d!64761 m!293115))

(declare-fun m!293117 () Bool)

(assert (=> b!278177 m!293117))

(declare-fun m!293119 () Bool)

(assert (=> b!278178 m!293119))

(assert (=> b!277902 d!64761))

(push 1)

(assert (not d!64761))

(assert (not b!278033))

(assert (not d!64755))

(assert (not bm!25358))

(assert (not b!278061))

(assert (not b!278032))

(assert (not b!278174))

(assert (not b!278165))

(assert (not d!64745))

(assert (not bm!25360))

(assert (not b!278000))

(assert (not b!278166))

(assert (not d!64727))

(assert (not b!278135))

(assert (not b!278003))

(assert (not b!278060))

(assert (not b!278178))

(assert (not b!277999))

(assert (not b!278140))

(assert (not b!278164))

(assert (not bm!25369))

(assert (not bm!25351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!278252 () Bool)

(declare-fun e!177482 () SeekEntryResult!1730)

(assert (=> b!278252 (= e!177482 Undefined!1730)))

(declare-fun d!64787 () Bool)

(declare-fun lt!138278 () SeekEntryResult!1730)

(assert (=> d!64787 (and (or (is-Undefined!1730 lt!138278) (not (is-Found!1730 lt!138278)) (and (bvsge (index!9091 lt!138278) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138278) (size!6924 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)))))) (or (is-Undefined!1730 lt!138278) (is-Found!1730 lt!138278) (not (is-MissingZero!1730 lt!138278)) (and (bvsge (index!9090 lt!138278) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138278) (size!6924 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)))))) (or (is-Undefined!1730 lt!138278) (is-Found!1730 lt!138278) (is-MissingZero!1730 lt!138278) (not (is-MissingVacant!1730 lt!138278)) (and (bvsge (index!9093 lt!138278) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138278) (size!6924 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)))))) (or (is-Undefined!1730 lt!138278) (ite (is-Found!1730 lt!138278) (= (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (index!9091 lt!138278)) k!2581) (ite (is-MissingZero!1730 lt!138278) (= (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (index!9090 lt!138278)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138278) (= (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (index!9093 lt!138278)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64787 (= lt!138278 e!177482)))

(declare-fun c!45742 () Bool)

(declare-fun lt!138279 () SeekEntryResult!1730)

(assert (=> d!64787 (= c!45742 (and (is-Intermediate!1730 lt!138279) (undefined!2542 lt!138279)))))

(assert (=> d!64787 (= lt!138279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868))))

(assert (=> d!64787 (validMask!0 mask!3868)))

(assert (=> d!64787 (= (seekEntryOrOpen!0 k!2581 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868) lt!138278)))

(declare-fun b!278253 () Bool)

(declare-fun c!45743 () Bool)

(declare-fun lt!138280 () (_ BitVec 64))

(assert (=> b!278253 (= c!45743 (= lt!138280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177483 () SeekEntryResult!1730)

(declare-fun e!177484 () SeekEntryResult!1730)

(assert (=> b!278253 (= e!177483 e!177484)))

(declare-fun b!278254 () Bool)

(assert (=> b!278254 (= e!177482 e!177483)))

(assert (=> b!278254 (= lt!138280 (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (index!9092 lt!138279)))))

(declare-fun c!45744 () Bool)

(assert (=> b!278254 (= c!45744 (= lt!138280 k!2581))))

(declare-fun b!278255 () Bool)

(assert (=> b!278255 (= e!177484 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138279) (index!9092 lt!138279) (index!9092 lt!138279) k!2581 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868))))

(declare-fun b!278256 () Bool)

(assert (=> b!278256 (= e!177483 (Found!1730 (index!9092 lt!138279)))))

(declare-fun b!278257 () Bool)

(assert (=> b!278257 (= e!177484 (MissingZero!1730 (index!9092 lt!138279)))))

(assert (= (and d!64787 c!45742) b!278252))

(assert (= (and d!64787 (not c!45742)) b!278254))

(assert (= (and b!278254 c!45744) b!278256))

(assert (= (and b!278254 (not c!45744)) b!278253))

(assert (= (and b!278253 c!45743) b!278257))

(assert (= (and b!278253 (not c!45743)) b!278255))

(assert (=> d!64787 m!293057))

(declare-fun m!293203 () Bool)

(assert (=> d!64787 m!293203))

(declare-fun m!293205 () Bool)

(assert (=> d!64787 m!293205))

(assert (=> d!64787 m!292835))

(declare-fun m!293207 () Bool)

(assert (=> d!64787 m!293207))

(assert (=> d!64787 m!293057))

(declare-fun m!293209 () Bool)

(assert (=> d!64787 m!293209))

(declare-fun m!293211 () Bool)

(assert (=> b!278254 m!293211))

(declare-fun m!293213 () Bool)

(assert (=> b!278255 m!293213))

(assert (=> b!278140 d!64787))

(declare-fun d!64789 () Bool)

(assert (=> d!64789 (arrayContainsKey!0 a!3325 lt!138187 #b00000000000000000000000000000000)))

(declare-fun lt!138292 () Unit!8791)

(declare-fun choose!13 (array!13845 (_ BitVec 64) (_ BitVec 32)) Unit!8791)

(assert (=> d!64789 (= lt!138292 (choose!13 a!3325 lt!138187 #b00000000000000000000000000000000))))

(assert (=> d!64789 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64789 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138187 #b00000000000000000000000000000000) lt!138292)))

(declare-fun bs!9914 () Bool)

(assert (= bs!9914 d!64789))

(assert (=> bs!9914 m!292947))

(declare-fun m!293223 () Bool)

(assert (=> bs!9914 m!293223))

(assert (=> b!278032 d!64789))

(declare-fun d!64797 () Bool)

(declare-fun res!141876 () Bool)

(declare-fun e!177492 () Bool)

(assert (=> d!64797 (=> res!141876 e!177492)))

(assert (=> d!64797 (= res!141876 (= (select (arr!6572 a!3325) #b00000000000000000000000000000000) lt!138187))))

(assert (=> d!64797 (= (arrayContainsKey!0 a!3325 lt!138187 #b00000000000000000000000000000000) e!177492)))

(declare-fun b!278269 () Bool)

(declare-fun e!177493 () Bool)

(assert (=> b!278269 (= e!177492 e!177493)))

(declare-fun res!141877 () Bool)

(assert (=> b!278269 (=> (not res!141877) (not e!177493))))

(assert (=> b!278269 (= res!141877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 a!3325)))))

(declare-fun b!278270 () Bool)

(assert (=> b!278270 (= e!177493 (arrayContainsKey!0 a!3325 lt!138187 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64797 (not res!141876)) b!278269))

(assert (= (and b!278269 res!141877) b!278270))

(assert (=> d!64797 m!292913))

(declare-fun m!293229 () Bool)

(assert (=> b!278270 m!293229))

(assert (=> b!278032 d!64797))

(declare-fun b!278277 () Bool)

(declare-fun e!177497 () SeekEntryResult!1730)

(assert (=> b!278277 (= e!177497 Undefined!1730)))

(declare-fun d!64801 () Bool)

(declare-fun lt!138296 () SeekEntryResult!1730)

(assert (=> d!64801 (and (or (is-Undefined!1730 lt!138296) (not (is-Found!1730 lt!138296)) (and (bvsge (index!9091 lt!138296) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138296) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138296) (is-Found!1730 lt!138296) (not (is-MissingZero!1730 lt!138296)) (and (bvsge (index!9090 lt!138296) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138296) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138296) (is-Found!1730 lt!138296) (is-MissingZero!1730 lt!138296) (not (is-MissingVacant!1730 lt!138296)) (and (bvsge (index!9093 lt!138296) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138296) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138296) (ite (is-Found!1730 lt!138296) (= (select (arr!6572 a!3325) (index!9091 lt!138296)) (select (arr!6572 a!3325) #b00000000000000000000000000000000)) (ite (is-MissingZero!1730 lt!138296) (= (select (arr!6572 a!3325) (index!9090 lt!138296)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138296) (= (select (arr!6572 a!3325) (index!9093 lt!138296)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64801 (= lt!138296 e!177497)))

(declare-fun c!45751 () Bool)

(declare-fun lt!138297 () SeekEntryResult!1730)

(assert (=> d!64801 (= c!45751 (and (is-Intermediate!1730 lt!138297) (undefined!2542 lt!138297)))))

(assert (=> d!64801 (= lt!138297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6572 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!64801 (validMask!0 mask!3868)))

(assert (=> d!64801 (= (seekEntryOrOpen!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!138296)))

(declare-fun b!278278 () Bool)

(declare-fun c!45752 () Bool)

(declare-fun lt!138298 () (_ BitVec 64))

(assert (=> b!278278 (= c!45752 (= lt!138298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177498 () SeekEntryResult!1730)

(declare-fun e!177499 () SeekEntryResult!1730)

(assert (=> b!278278 (= e!177498 e!177499)))

(declare-fun b!278279 () Bool)

(assert (=> b!278279 (= e!177497 e!177498)))

(assert (=> b!278279 (= lt!138298 (select (arr!6572 a!3325) (index!9092 lt!138297)))))

(declare-fun c!45753 () Bool)

(assert (=> b!278279 (= c!45753 (= lt!138298 (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278280 () Bool)

(assert (=> b!278280 (= e!177499 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138297) (index!9092 lt!138297) (index!9092 lt!138297) (select (arr!6572 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!278281 () Bool)

(assert (=> b!278281 (= e!177498 (Found!1730 (index!9092 lt!138297)))))

(declare-fun b!278282 () Bool)

(assert (=> b!278282 (= e!177499 (MissingZero!1730 (index!9092 lt!138297)))))

(assert (= (and d!64801 c!45751) b!278277))

(assert (= (and d!64801 (not c!45751)) b!278279))

(assert (= (and b!278279 c!45753) b!278281))

(assert (= (and b!278279 (not c!45753)) b!278278))

(assert (= (and b!278278 c!45752) b!278282))

(assert (= (and b!278278 (not c!45752)) b!278280))

(assert (=> d!64801 m!292913))

(declare-fun m!293245 () Bool)

(assert (=> d!64801 m!293245))

(declare-fun m!293247 () Bool)

(assert (=> d!64801 m!293247))

(declare-fun m!293249 () Bool)

(assert (=> d!64801 m!293249))

(assert (=> d!64801 m!292835))

(declare-fun m!293251 () Bool)

(assert (=> d!64801 m!293251))

(assert (=> d!64801 m!293245))

(assert (=> d!64801 m!292913))

(declare-fun m!293253 () Bool)

(assert (=> d!64801 m!293253))

(declare-fun m!293255 () Bool)

(assert (=> b!278279 m!293255))

(assert (=> b!278280 m!292913))

(declare-fun m!293257 () Bool)

(assert (=> b!278280 m!293257))

(assert (=> b!278032 d!64801))

(declare-fun d!64805 () Bool)

(assert (=> d!64805 (= (validKeyInArray!0 (select (arr!6572 lt!138114) startIndex!26)) (and (not (= (select (arr!6572 lt!138114) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6572 lt!138114) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278061 d!64805))

(declare-fun b!278283 () Bool)

(declare-fun e!177501 () Bool)

(declare-fun e!177500 () Bool)

(assert (=> b!278283 (= e!177501 e!177500)))

(declare-fun lt!138301 () (_ BitVec 64))

(assert (=> b!278283 (= lt!138301 (select (arr!6572 lt!138114) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138300 () Unit!8791)

(assert (=> b!278283 (= lt!138300 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138301 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278283 (arrayContainsKey!0 lt!138114 lt!138301 #b00000000000000000000000000000000)))

(declare-fun lt!138299 () Unit!8791)

(assert (=> b!278283 (= lt!138299 lt!138300)))

(declare-fun res!141878 () Bool)

(assert (=> b!278283 (= res!141878 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!138114 mask!3868) (Found!1730 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278283 (=> (not res!141878) (not e!177500))))

(declare-fun call!25376 () Bool)

(declare-fun bm!25373 () Bool)

(assert (=> bm!25373 (= call!25376 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138114 mask!3868))))

(declare-fun b!278284 () Bool)

(declare-fun e!177502 () Bool)

(assert (=> b!278284 (= e!177502 e!177501)))

(declare-fun c!45754 () Bool)

(assert (=> b!278284 (= c!45754 (validKeyInArray!0 (select (arr!6572 lt!138114) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun d!64807 () Bool)

(declare-fun res!141879 () Bool)

(assert (=> d!64807 (=> res!141879 e!177502)))

(assert (=> d!64807 (= res!141879 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!6924 lt!138114)))))

(assert (=> d!64807 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138114 mask!3868) e!177502)))

(declare-fun b!278285 () Bool)

(assert (=> b!278285 (= e!177501 call!25376)))

(declare-fun b!278286 () Bool)

(assert (=> b!278286 (= e!177500 call!25376)))

(assert (= (and d!64807 (not res!141879)) b!278284))

(assert (= (and b!278284 c!45754) b!278283))

(assert (= (and b!278284 (not c!45754)) b!278285))

(assert (= (and b!278283 res!141878) b!278286))

(assert (= (or b!278286 b!278285) bm!25373))

(declare-fun m!293259 () Bool)

(assert (=> b!278283 m!293259))

(declare-fun m!293261 () Bool)

(assert (=> b!278283 m!293261))

(declare-fun m!293263 () Bool)

(assert (=> b!278283 m!293263))

(assert (=> b!278283 m!293259))

(declare-fun m!293265 () Bool)

(assert (=> b!278283 m!293265))

(declare-fun m!293267 () Bool)

(assert (=> bm!25373 m!293267))

(assert (=> b!278284 m!293259))

(assert (=> b!278284 m!293259))

(declare-fun m!293269 () Bool)

(assert (=> b!278284 m!293269))

(assert (=> bm!25360 d!64807))

(declare-fun d!64809 () Bool)

(declare-fun res!141880 () Bool)

(declare-fun e!177503 () Bool)

(assert (=> d!64809 (=> res!141880 e!177503)))

(assert (=> d!64809 (= res!141880 (= (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!64809 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!177503)))

(declare-fun b!278287 () Bool)

(declare-fun e!177504 () Bool)

(assert (=> b!278287 (= e!177503 e!177504)))

(declare-fun res!141881 () Bool)

(assert (=> b!278287 (=> (not res!141881) (not e!177504))))

(assert (=> b!278287 (= res!141881 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6924 a!3325)))))

(declare-fun b!278288 () Bool)

(assert (=> b!278288 (= e!177504 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64809 (not res!141880)) b!278287))

(assert (= (and b!278287 res!141881) b!278288))

(declare-fun m!293271 () Bool)

(assert (=> d!64809 m!293271))

(declare-fun m!293273 () Bool)

(assert (=> b!278288 m!293273))

(assert (=> b!278174 d!64809))

(declare-fun b!278338 () Bool)

(declare-fun lt!138319 () SeekEntryResult!1730)

(assert (=> b!278338 (and (bvsge (index!9092 lt!138319) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138319) (size!6924 a!3325)))))

(declare-fun res!141904 () Bool)

(assert (=> b!278338 (= res!141904 (= (select (arr!6572 a!3325) (index!9092 lt!138319)) k!2581))))

(declare-fun e!177542 () Bool)

(assert (=> b!278338 (=> res!141904 e!177542)))

(declare-fun e!177540 () Bool)

(assert (=> b!278338 (= e!177540 e!177542)))

(declare-fun b!278339 () Bool)

(declare-fun e!177541 () SeekEntryResult!1730)

(assert (=> b!278339 (= e!177541 (Intermediate!1730 true (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278340 () Bool)

(assert (=> b!278340 (and (bvsge (index!9092 lt!138319) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138319) (size!6924 a!3325)))))

(declare-fun res!141903 () Bool)

(assert (=> b!278340 (= res!141903 (= (select (arr!6572 a!3325) (index!9092 lt!138319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278340 (=> res!141903 e!177542)))

(declare-fun b!278341 () Bool)

(declare-fun e!177539 () Bool)

(assert (=> b!278341 (= e!177539 e!177540)))

(declare-fun res!141905 () Bool)

(assert (=> b!278341 (= res!141905 (and (is-Intermediate!1730 lt!138319) (not (undefined!2542 lt!138319)) (bvslt (x!27335 lt!138319) #b01111111111111111111111111111110) (bvsge (x!27335 lt!138319) #b00000000000000000000000000000000) (bvsge (x!27335 lt!138319) #b00000000000000000000000000000000)))))

(assert (=> b!278341 (=> (not res!141905) (not e!177540))))

(declare-fun b!278342 () Bool)

(assert (=> b!278342 (= e!177539 (bvsge (x!27335 lt!138319) #b01111111111111111111111111111110))))

(declare-fun b!278343 () Bool)

(declare-fun e!177538 () SeekEntryResult!1730)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!278343 (= e!177538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k!2581 a!3325 mask!3868))))

(declare-fun b!278344 () Bool)

(assert (=> b!278344 (= e!177538 (Intermediate!1730 false (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278345 () Bool)

(assert (=> b!278345 (and (bvsge (index!9092 lt!138319) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138319) (size!6924 a!3325)))))

(assert (=> b!278345 (= e!177542 (= (select (arr!6572 a!3325) (index!9092 lt!138319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!64811 () Bool)

(assert (=> d!64811 e!177539))

(declare-fun c!45771 () Bool)

(assert (=> d!64811 (= c!45771 (and (is-Intermediate!1730 lt!138319) (undefined!2542 lt!138319)))))

(assert (=> d!64811 (= lt!138319 e!177541)))

(declare-fun c!45770 () Bool)

(assert (=> d!64811 (= c!45770 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!138318 () (_ BitVec 64))

(assert (=> d!64811 (= lt!138318 (select (arr!6572 a!3325) (toIndex!0 k!2581 mask!3868)))))

(assert (=> d!64811 (validMask!0 mask!3868)))

(assert (=> d!64811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868) lt!138319)))

(declare-fun b!278346 () Bool)

(assert (=> b!278346 (= e!177541 e!177538)))

(declare-fun c!45769 () Bool)

(assert (=> b!278346 (= c!45769 (or (= lt!138318 k!2581) (= (bvadd lt!138318 lt!138318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!64811 c!45770) b!278339))

(assert (= (and d!64811 (not c!45770)) b!278346))

(assert (= (and b!278346 c!45769) b!278344))

(assert (= (and b!278346 (not c!45769)) b!278343))

(assert (= (and d!64811 c!45771) b!278342))

(assert (= (and d!64811 (not c!45771)) b!278341))

(assert (= (and b!278341 res!141905) b!278338))

(assert (= (and b!278338 (not res!141904)) b!278340))

(assert (= (and b!278340 (not res!141903)) b!278345))

(declare-fun m!293325 () Bool)

(assert (=> b!278338 m!293325))

(assert (=> b!278340 m!293325))

(assert (=> b!278343 m!293057))

(declare-fun m!293327 () Bool)

(assert (=> b!278343 m!293327))

(assert (=> b!278343 m!293327))

(declare-fun m!293329 () Bool)

(assert (=> b!278343 m!293329))

(assert (=> d!64811 m!293057))

(declare-fun m!293331 () Bool)

(assert (=> d!64811 m!293331))

(assert (=> d!64811 m!292835))

(assert (=> b!278345 m!293325))

(assert (=> d!64761 d!64811))

(declare-fun d!64833 () Bool)

(declare-fun lt!138325 () (_ BitVec 32))

(declare-fun lt!138324 () (_ BitVec 32))

(assert (=> d!64833 (= lt!138325 (bvmul (bvxor lt!138324 (bvlshr lt!138324 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!64833 (= lt!138324 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!64833 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!141906 (let ((h!5047 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27342 (bvmul (bvxor h!5047 (bvlshr h!5047 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27342 (bvlshr x!27342 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!141906 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!141906 #b00000000000000000000000000000000))))))

(assert (=> d!64833 (= (toIndex!0 k!2581 mask!3868) (bvand (bvxor lt!138325 (bvlshr lt!138325 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!64761 d!64833))

(assert (=> d!64761 d!64715))

(declare-fun d!64835 () Bool)

(assert (=> d!64835 (= (validKeyInArray!0 (select (arr!6572 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6572 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6572 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278033 d!64835))

(assert (=> b!278000 d!64835))

(declare-fun d!64837 () Bool)

(assert (=> d!64837 (= (validKeyInArray!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26))) (and (not (= (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278166 d!64837))

(declare-fun d!64839 () Bool)

(assert (=> d!64839 (= (seekEntryOrOpen!0 k!2581 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868) (Found!1730 i!1267))))

(assert (=> d!64839 true))

(declare-fun _$54!20 () Unit!8791)

(assert (=> d!64839 (= (choose!8 a!3325 i!1267 k!2581 mask!3868) _$54!20)))

(declare-fun bs!9918 () Bool)

(assert (= bs!9918 d!64839))

(assert (=> bs!9918 m!292825))

(assert (=> bs!9918 m!293073))

(assert (=> d!64745 d!64839))

(assert (=> d!64745 d!64715))

(declare-fun b!278347 () Bool)

(declare-fun e!177544 () Bool)

(declare-fun e!177543 () Bool)

(assert (=> b!278347 (= e!177544 e!177543)))

(declare-fun lt!138328 () (_ BitVec 64))

(assert (=> b!278347 (= lt!138328 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!138327 () Unit!8791)

(assert (=> b!278347 (= lt!138327 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!278347 (arrayContainsKey!0 a!3325 lt!138328 #b00000000000000000000000000000000)))

(declare-fun lt!138326 () Unit!8791)

(assert (=> b!278347 (= lt!138326 lt!138327)))

(declare-fun res!141907 () Bool)

(assert (=> b!278347 (= res!141907 (= (seekEntryOrOpen!0 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!278347 (=> (not res!141907) (not e!177543))))

(declare-fun bm!25376 () Bool)

(declare-fun call!25379 () Bool)

(assert (=> bm!25376 (= call!25379 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278348 () Bool)

(declare-fun e!177545 () Bool)

(assert (=> b!278348 (= e!177545 e!177544)))

(declare-fun c!45772 () Bool)

(assert (=> b!278348 (= c!45772 (validKeyInArray!0 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64841 () Bool)

(declare-fun res!141908 () Bool)

(assert (=> d!64841 (=> res!141908 e!177545)))

(assert (=> d!64841 (= res!141908 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 a!3325)))))

(assert (=> d!64841 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!177545)))

(declare-fun b!278349 () Bool)

(assert (=> b!278349 (= e!177544 call!25379)))

(declare-fun b!278350 () Bool)

(assert (=> b!278350 (= e!177543 call!25379)))

(assert (= (and d!64841 (not res!141908)) b!278348))

(assert (= (and b!278348 c!45772) b!278347))

(assert (= (and b!278348 (not c!45772)) b!278349))

(assert (= (and b!278347 res!141907) b!278350))

(assert (= (or b!278350 b!278349) bm!25376))

(assert (=> b!278347 m!293271))

(declare-fun m!293333 () Bool)

(assert (=> b!278347 m!293333))

(declare-fun m!293335 () Bool)

(assert (=> b!278347 m!293335))

(assert (=> b!278347 m!293271))

(declare-fun m!293337 () Bool)

(assert (=> b!278347 m!293337))

(declare-fun m!293339 () Bool)

(assert (=> bm!25376 m!293339))

(assert (=> b!278348 m!293271))

(assert (=> b!278348 m!293271))

(declare-fun m!293341 () Bool)

(assert (=> b!278348 m!293341))

(assert (=> bm!25358 d!64841))

(declare-fun d!64843 () Bool)

(declare-fun lt!138331 () Bool)

(declare-fun content!185 (List!4380) (Set (_ BitVec 64)))

(assert (=> d!64843 (= lt!138331 (set.member (select (arr!6572 a!3325) #b00000000000000000000000000000000) (content!185 Nil!4377)))))

(declare-fun e!177550 () Bool)

(assert (=> d!64843 (= lt!138331 e!177550)))

(declare-fun res!141913 () Bool)

(assert (=> d!64843 (=> (not res!141913) (not e!177550))))

(assert (=> d!64843 (= res!141913 (is-Cons!4376 Nil!4377))))

(assert (=> d!64843 (= (contains!1961 Nil!4377 (select (arr!6572 a!3325) #b00000000000000000000000000000000)) lt!138331)))

(declare-fun b!278355 () Bool)

(declare-fun e!177551 () Bool)

(assert (=> b!278355 (= e!177550 e!177551)))

(declare-fun res!141914 () Bool)

(assert (=> b!278355 (=> res!141914 e!177551)))

(assert (=> b!278355 (= res!141914 (= (h!5043 Nil!4377) (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278356 () Bool)

(assert (=> b!278356 (= e!177551 (contains!1961 (t!9462 Nil!4377) (select (arr!6572 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64843 res!141913) b!278355))

(assert (= (and b!278355 (not res!141914)) b!278356))

(declare-fun m!293343 () Bool)

(assert (=> d!64843 m!293343))

(assert (=> d!64843 m!292913))

(declare-fun m!293345 () Bool)

(assert (=> d!64843 m!293345))

(assert (=> b!278356 m!292913))

(declare-fun m!293347 () Bool)

(assert (=> b!278356 m!293347))

(assert (=> b!277999 d!64843))

(declare-fun b!278357 () Bool)

(declare-fun e!177553 () Bool)

(declare-fun e!177552 () Bool)

(assert (=> b!278357 (= e!177553 e!177552)))

(declare-fun lt!138334 () (_ BitVec 64))

(assert (=> b!278357 (= lt!138334 (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138333 () Unit!8791)

(assert (=> b!278357 (= lt!138333 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) lt!138334 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278357 (arrayContainsKey!0 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) lt!138334 #b00000000000000000000000000000000)))

(declare-fun lt!138332 () Unit!8791)

(assert (=> b!278357 (= lt!138332 lt!138333)))

(declare-fun res!141915 () Bool)

(assert (=> b!278357 (= res!141915 (= (seekEntryOrOpen!0 (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)) (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868) (Found!1730 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278357 (=> (not res!141915) (not e!177552))))

(declare-fun bm!25377 () Bool)

(declare-fun call!25380 () Bool)

(assert (=> bm!25377 (= call!25380 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868))))

(declare-fun b!278358 () Bool)

(declare-fun e!177554 () Bool)

(assert (=> b!278358 (= e!177554 e!177553)))

(declare-fun c!45773 () Bool)

(assert (=> b!278358 (= c!45773 (validKeyInArray!0 (select (arr!6572 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun d!64845 () Bool)

(declare-fun res!141916 () Bool)

(assert (=> d!64845 (=> res!141916 e!177554)))

(assert (=> d!64845 (= res!141916 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6924 (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)))))))

(assert (=> d!64845 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868) e!177554)))

(declare-fun b!278359 () Bool)

(assert (=> b!278359 (= e!177553 call!25380)))

(declare-fun b!278360 () Bool)

(assert (=> b!278360 (= e!177552 call!25380)))

(assert (= (and d!64845 (not res!141916)) b!278358))

(assert (= (and b!278358 c!45773) b!278357))

(assert (= (and b!278358 (not c!45773)) b!278359))

(assert (= (and b!278357 res!141915) b!278360))

(assert (= (or b!278360 b!278359) bm!25377))

(declare-fun m!293349 () Bool)

(assert (=> b!278357 m!293349))

(declare-fun m!293351 () Bool)

(assert (=> b!278357 m!293351))

(declare-fun m!293353 () Bool)

(assert (=> b!278357 m!293353))

(assert (=> b!278357 m!293349))

(declare-fun m!293355 () Bool)

(assert (=> b!278357 m!293355))

(declare-fun m!293357 () Bool)

(assert (=> bm!25377 m!293357))

(assert (=> b!278358 m!293349))

(assert (=> b!278358 m!293349))

(declare-fun m!293359 () Bool)

(assert (=> b!278358 m!293359))

(assert (=> b!278164 d!64845))

(declare-fun d!64847 () Bool)

(assert (=> d!64847 (arrayContainsKey!0 lt!138114 lt!138244 #b00000000000000000000000000000000)))

(declare-fun lt!138335 () Unit!8791)

(assert (=> d!64847 (= lt!138335 (choose!13 lt!138114 lt!138244 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> d!64847 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))

(assert (=> d!64847 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138244 (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138335)))

(declare-fun bs!9919 () Bool)

(assert (= bs!9919 d!64847))

(assert (=> bs!9919 m!293099))

(declare-fun m!293361 () Bool)

(assert (=> bs!9919 m!293361))

(assert (=> b!278165 d!64847))

(declare-fun d!64849 () Bool)

(declare-fun res!141917 () Bool)

(declare-fun e!177555 () Bool)

(assert (=> d!64849 (=> res!141917 e!177555)))

(assert (=> d!64849 (= res!141917 (= (select (arr!6572 lt!138114) #b00000000000000000000000000000000) lt!138244))))

(assert (=> d!64849 (= (arrayContainsKey!0 lt!138114 lt!138244 #b00000000000000000000000000000000) e!177555)))

(declare-fun b!278361 () Bool)

(declare-fun e!177556 () Bool)

(assert (=> b!278361 (= e!177555 e!177556)))

(declare-fun res!141918 () Bool)

(assert (=> b!278361 (=> (not res!141918) (not e!177556))))

(assert (=> b!278361 (= res!141918 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 lt!138114)))))

(declare-fun b!278362 () Bool)

(assert (=> b!278362 (= e!177556 (arrayContainsKey!0 lt!138114 lt!138244 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64849 (not res!141917)) b!278361))

(assert (= (and b!278361 res!141918) b!278362))

(declare-fun m!293363 () Bool)

(assert (=> d!64849 m!293363))

(declare-fun m!293365 () Bool)

(assert (=> b!278362 m!293365))

(assert (=> b!278165 d!64849))

(declare-fun b!278363 () Bool)

(declare-fun e!177557 () SeekEntryResult!1730)

(assert (=> b!278363 (= e!177557 Undefined!1730)))

(declare-fun d!64851 () Bool)

(declare-fun lt!138336 () SeekEntryResult!1730)

(assert (=> d!64851 (and (or (is-Undefined!1730 lt!138336) (not (is-Found!1730 lt!138336)) (and (bvsge (index!9091 lt!138336) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138336) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138336) (is-Found!1730 lt!138336) (not (is-MissingZero!1730 lt!138336)) (and (bvsge (index!9090 lt!138336) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138336) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138336) (is-Found!1730 lt!138336) (is-MissingZero!1730 lt!138336) (not (is-MissingVacant!1730 lt!138336)) (and (bvsge (index!9093 lt!138336) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138336) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138336) (ite (is-Found!1730 lt!138336) (= (select (arr!6572 lt!138114) (index!9091 lt!138336)) (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26))) (ite (is-MissingZero!1730 lt!138336) (= (select (arr!6572 lt!138114) (index!9090 lt!138336)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138336) (= (select (arr!6572 lt!138114) (index!9093 lt!138336)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64851 (= lt!138336 e!177557)))

(declare-fun c!45774 () Bool)

(declare-fun lt!138337 () SeekEntryResult!1730)

(assert (=> d!64851 (= c!45774 (and (is-Intermediate!1730 lt!138337) (undefined!2542 lt!138337)))))

(assert (=> d!64851 (= lt!138337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) mask!3868) (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138114 mask!3868))))

(assert (=> d!64851 (validMask!0 mask!3868)))

(assert (=> d!64851 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138114 mask!3868) lt!138336)))

(declare-fun b!278364 () Bool)

(declare-fun c!45775 () Bool)

(declare-fun lt!138338 () (_ BitVec 64))

(assert (=> b!278364 (= c!45775 (= lt!138338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177558 () SeekEntryResult!1730)

(declare-fun e!177559 () SeekEntryResult!1730)

(assert (=> b!278364 (= e!177558 e!177559)))

(declare-fun b!278365 () Bool)

(assert (=> b!278365 (= e!177557 e!177558)))

(assert (=> b!278365 (= lt!138338 (select (arr!6572 lt!138114) (index!9092 lt!138337)))))

(declare-fun c!45776 () Bool)

(assert (=> b!278365 (= c!45776 (= lt!138338 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!278366 () Bool)

(assert (=> b!278366 (= e!177559 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138337) (index!9092 lt!138337) (index!9092 lt!138337) (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138114 mask!3868))))

(declare-fun b!278367 () Bool)

(assert (=> b!278367 (= e!177558 (Found!1730 (index!9092 lt!138337)))))

(declare-fun b!278368 () Bool)

(assert (=> b!278368 (= e!177559 (MissingZero!1730 (index!9092 lt!138337)))))

(assert (= (and d!64851 c!45774) b!278363))

(assert (= (and d!64851 (not c!45774)) b!278365))

(assert (= (and b!278365 c!45776) b!278367))

(assert (= (and b!278365 (not c!45776)) b!278364))

(assert (= (and b!278364 c!45775) b!278368))

(assert (= (and b!278364 (not c!45775)) b!278366))

(assert (=> d!64851 m!293095))

(declare-fun m!293367 () Bool)

(assert (=> d!64851 m!293367))

(declare-fun m!293369 () Bool)

(assert (=> d!64851 m!293369))

(declare-fun m!293371 () Bool)

(assert (=> d!64851 m!293371))

(assert (=> d!64851 m!292835))

(declare-fun m!293373 () Bool)

(assert (=> d!64851 m!293373))

(assert (=> d!64851 m!293367))

(assert (=> d!64851 m!293095))

(declare-fun m!293375 () Bool)

(assert (=> d!64851 m!293375))

(declare-fun m!293377 () Bool)

(assert (=> b!278365 m!293377))

(assert (=> b!278366 m!293095))

(declare-fun m!293379 () Bool)

(assert (=> b!278366 m!293379))

(assert (=> b!278165 d!64851))

(declare-fun b!278369 () Bool)

(declare-fun e!177561 () Bool)

(declare-fun e!177560 () Bool)

(assert (=> b!278369 (= e!177561 e!177560)))

(declare-fun lt!138341 () (_ BitVec 64))

(assert (=> b!278369 (= lt!138341 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138340 () Unit!8791)

(assert (=> b!278369 (= lt!138340 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138341 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278369 (arrayContainsKey!0 lt!138114 lt!138341 #b00000000000000000000000000000000)))

(declare-fun lt!138339 () Unit!8791)

(assert (=> b!278369 (= lt!138339 lt!138340)))

(declare-fun res!141919 () Bool)

(assert (=> b!278369 (= res!141919 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)) lt!138114 mask!3868) (Found!1730 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278369 (=> (not res!141919) (not e!177560))))

(declare-fun bm!25378 () Bool)

(declare-fun call!25381 () Bool)

(assert (=> bm!25378 (= call!25381 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138114 mask!3868))))

(declare-fun b!278370 () Bool)

(declare-fun e!177562 () Bool)

(assert (=> b!278370 (= e!177562 e!177561)))

(declare-fun c!45777 () Bool)

(assert (=> b!278370 (= c!45777 (validKeyInArray!0 (select (arr!6572 lt!138114) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun d!64853 () Bool)

(declare-fun res!141920 () Bool)

(assert (=> d!64853 (=> res!141920 e!177562)))

(assert (=> d!64853 (= res!141920 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (size!6924 lt!138114)))))

(assert (=> d!64853 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138114 mask!3868) e!177562)))

(declare-fun b!278371 () Bool)

(assert (=> b!278371 (= e!177561 call!25381)))

(declare-fun b!278372 () Bool)

(assert (=> b!278372 (= e!177560 call!25381)))

(assert (= (and d!64853 (not res!141920)) b!278370))

(assert (= (and b!278370 c!45777) b!278369))

(assert (= (and b!278370 (not c!45777)) b!278371))

(assert (= (and b!278369 res!141919) b!278372))

(assert (= (or b!278372 b!278371) bm!25378))

(declare-fun m!293381 () Bool)

(assert (=> b!278369 m!293381))

(declare-fun m!293383 () Bool)

(assert (=> b!278369 m!293383))

(declare-fun m!293385 () Bool)

(assert (=> b!278369 m!293385))

(assert (=> b!278369 m!293381))

(declare-fun m!293387 () Bool)

(assert (=> b!278369 m!293387))

(declare-fun m!293389 () Bool)

(assert (=> bm!25378 m!293389))

(assert (=> b!278370 m!293381))

(assert (=> b!278370 m!293381))

(declare-fun m!293391 () Bool)

(assert (=> b!278370 m!293391))

(assert (=> bm!25369 d!64853))

(declare-fun b!278385 () Bool)

(declare-fun e!177569 () SeekEntryResult!1730)

(assert (=> b!278385 (= e!177569 (Found!1730 (index!9092 lt!138246)))))

(declare-fun b!278386 () Bool)

(declare-fun e!177571 () SeekEntryResult!1730)

(assert (=> b!278386 (= e!177571 Undefined!1730)))

(declare-fun b!278387 () Bool)

(declare-fun c!45786 () Bool)

(declare-fun lt!138347 () (_ BitVec 64))

(assert (=> b!278387 (= c!45786 (= lt!138347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177570 () SeekEntryResult!1730)

(assert (=> b!278387 (= e!177569 e!177570)))

(declare-fun b!278388 () Bool)

(assert (=> b!278388 (= e!177571 e!177569)))

(declare-fun c!45784 () Bool)

(assert (=> b!278388 (= c!45784 (= lt!138347 k!2581))))

(declare-fun b!278389 () Bool)

(assert (=> b!278389 (= e!177570 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27335 lt!138246) #b00000000000000000000000000000001) (nextIndex!0 (index!9092 lt!138246) (x!27335 lt!138246) mask!3868) (index!9092 lt!138246) k!2581 a!3325 mask!3868))))

(declare-fun lt!138346 () SeekEntryResult!1730)

(declare-fun d!64855 () Bool)

(assert (=> d!64855 (and (or (is-Undefined!1730 lt!138346) (not (is-Found!1730 lt!138346)) (and (bvsge (index!9091 lt!138346) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138346) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138346) (is-Found!1730 lt!138346) (not (is-MissingVacant!1730 lt!138346)) (not (= (index!9093 lt!138346) (index!9092 lt!138246))) (and (bvsge (index!9093 lt!138346) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138346) (size!6924 a!3325)))) (or (is-Undefined!1730 lt!138346) (ite (is-Found!1730 lt!138346) (= (select (arr!6572 a!3325) (index!9091 lt!138346)) k!2581) (and (is-MissingVacant!1730 lt!138346) (= (index!9093 lt!138346) (index!9092 lt!138246)) (= (select (arr!6572 a!3325) (index!9093 lt!138346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64855 (= lt!138346 e!177571)))

(declare-fun c!45785 () Bool)

(assert (=> d!64855 (= c!45785 (bvsge (x!27335 lt!138246) #b01111111111111111111111111111110))))

(assert (=> d!64855 (= lt!138347 (select (arr!6572 a!3325) (index!9092 lt!138246)))))

(assert (=> d!64855 (validMask!0 mask!3868)))

(assert (=> d!64855 (= (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138246) (index!9092 lt!138246) (index!9092 lt!138246) k!2581 a!3325 mask!3868) lt!138346)))

(declare-fun b!278390 () Bool)

(assert (=> b!278390 (= e!177570 (MissingVacant!1730 (index!9092 lt!138246)))))

(assert (= (and d!64855 c!45785) b!278386))

(assert (= (and d!64855 (not c!45785)) b!278388))

(assert (= (and b!278388 c!45784) b!278385))

(assert (= (and b!278388 (not c!45784)) b!278387))

(assert (= (and b!278387 c!45786) b!278390))

(assert (= (and b!278387 (not c!45786)) b!278389))

(declare-fun m!293393 () Bool)

(assert (=> b!278389 m!293393))

(assert (=> b!278389 m!293393))

(declare-fun m!293395 () Bool)

(assert (=> b!278389 m!293395))

(declare-fun m!293397 () Bool)

(assert (=> d!64855 m!293397))

(declare-fun m!293399 () Bool)

(assert (=> d!64855 m!293399))

(assert (=> d!64855 m!293117))

(assert (=> d!64855 m!292835))

(assert (=> b!278178 d!64855))

(declare-fun b!278391 () Bool)

(declare-fun e!177575 () Bool)

(assert (=> b!278391 (= e!177575 (contains!1961 (ite c!45660 (Cons!4376 (select (arr!6572 a!3325) #b00000000000000000000000000000000) Nil!4377) Nil!4377) (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278392 () Bool)

(declare-fun e!177574 () Bool)

(declare-fun e!177572 () Bool)

(assert (=> b!278392 (= e!177574 e!177572)))

(declare-fun res!141921 () Bool)

(assert (=> b!278392 (=> (not res!141921) (not e!177572))))

(assert (=> b!278392 (= res!141921 (not e!177575))))

(declare-fun res!141922 () Bool)

(assert (=> b!278392 (=> (not res!141922) (not e!177575))))

(assert (=> b!278392 (= res!141922 (validKeyInArray!0 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64857 () Bool)

(declare-fun res!141923 () Bool)

(assert (=> d!64857 (=> res!141923 e!177574)))

(assert (=> d!64857 (= res!141923 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 a!3325)))))

(assert (=> d!64857 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45660 (Cons!4376 (select (arr!6572 a!3325) #b00000000000000000000000000000000) Nil!4377) Nil!4377)) e!177574)))

(declare-fun b!278393 () Bool)

(declare-fun e!177573 () Bool)

(declare-fun call!25382 () Bool)

(assert (=> b!278393 (= e!177573 call!25382)))

(declare-fun bm!25379 () Bool)

(declare-fun c!45787 () Bool)

(assert (=> bm!25379 (= call!25382 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45787 (Cons!4376 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45660 (Cons!4376 (select (arr!6572 a!3325) #b00000000000000000000000000000000) Nil!4377) Nil!4377)) (ite c!45660 (Cons!4376 (select (arr!6572 a!3325) #b00000000000000000000000000000000) Nil!4377) Nil!4377))))))

(declare-fun b!278394 () Bool)

(assert (=> b!278394 (= e!177573 call!25382)))

(declare-fun b!278395 () Bool)

(assert (=> b!278395 (= e!177572 e!177573)))

(assert (=> b!278395 (= c!45787 (validKeyInArray!0 (select (arr!6572 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!64857 (not res!141923)) b!278392))

(assert (= (and b!278392 res!141922) b!278391))

(assert (= (and b!278392 res!141921) b!278395))

(assert (= (and b!278395 c!45787) b!278393))

(assert (= (and b!278395 (not c!45787)) b!278394))

(assert (= (or b!278393 b!278394) bm!25379))

(assert (=> b!278391 m!293271))

(assert (=> b!278391 m!293271))

(declare-fun m!293401 () Bool)

(assert (=> b!278391 m!293401))

(assert (=> b!278392 m!293271))

(assert (=> b!278392 m!293271))

(assert (=> b!278392 m!293341))

(assert (=> bm!25379 m!293271))

(declare-fun m!293403 () Bool)

(assert (=> bm!25379 m!293403))

(assert (=> b!278395 m!293271))

(assert (=> b!278395 m!293271))

(assert (=> b!278395 m!293341))

(assert (=> bm!25351 d!64857))

(declare-fun b!278396 () Bool)

(declare-fun lt!138349 () SeekEntryResult!1730)

(assert (=> b!278396 (and (bvsge (index!9092 lt!138349) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138349) (size!6924 lt!138114)))))

(declare-fun res!141925 () Bool)

(assert (=> b!278396 (= res!141925 (= (select (arr!6572 lt!138114) (index!9092 lt!138349)) k!2581))))

(declare-fun e!177580 () Bool)

(assert (=> b!278396 (=> res!141925 e!177580)))

(declare-fun e!177578 () Bool)

(assert (=> b!278396 (= e!177578 e!177580)))

(declare-fun b!278397 () Bool)

(declare-fun e!177579 () SeekEntryResult!1730)

(assert (=> b!278397 (= e!177579 (Intermediate!1730 true (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278398 () Bool)

(assert (=> b!278398 (and (bvsge (index!9092 lt!138349) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138349) (size!6924 lt!138114)))))

(declare-fun res!141924 () Bool)

(assert (=> b!278398 (= res!141924 (= (select (arr!6572 lt!138114) (index!9092 lt!138349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278398 (=> res!141924 e!177580)))

(declare-fun b!278399 () Bool)

(declare-fun e!177577 () Bool)

(assert (=> b!278399 (= e!177577 e!177578)))

(declare-fun res!141926 () Bool)

(assert (=> b!278399 (= res!141926 (and (is-Intermediate!1730 lt!138349) (not (undefined!2542 lt!138349)) (bvslt (x!27335 lt!138349) #b01111111111111111111111111111110) (bvsge (x!27335 lt!138349) #b00000000000000000000000000000000) (bvsge (x!27335 lt!138349) #b00000000000000000000000000000000)))))

(assert (=> b!278399 (=> (not res!141926) (not e!177578))))

(declare-fun b!278400 () Bool)

(assert (=> b!278400 (= e!177577 (bvsge (x!27335 lt!138349) #b01111111111111111111111111111110))))

(declare-fun e!177576 () SeekEntryResult!1730)

(declare-fun b!278401 () Bool)

(assert (=> b!278401 (= e!177576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k!2581 lt!138114 mask!3868))))

(declare-fun b!278402 () Bool)

(assert (=> b!278402 (= e!177576 (Intermediate!1730 false (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278403 () Bool)

(assert (=> b!278403 (and (bvsge (index!9092 lt!138349) #b00000000000000000000000000000000) (bvslt (index!9092 lt!138349) (size!6924 lt!138114)))))

(assert (=> b!278403 (= e!177580 (= (select (arr!6572 lt!138114) (index!9092 lt!138349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!64859 () Bool)

(assert (=> d!64859 e!177577))

(declare-fun c!45790 () Bool)

(assert (=> d!64859 (= c!45790 (and (is-Intermediate!1730 lt!138349) (undefined!2542 lt!138349)))))

(assert (=> d!64859 (= lt!138349 e!177579)))

(declare-fun c!45789 () Bool)

(assert (=> d!64859 (= c!45789 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!138348 () (_ BitVec 64))

(assert (=> d!64859 (= lt!138348 (select (arr!6572 lt!138114) (toIndex!0 k!2581 mask!3868)))))

(assert (=> d!64859 (validMask!0 mask!3868)))

(assert (=> d!64859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 lt!138114 mask!3868) lt!138349)))

(declare-fun b!278404 () Bool)

(assert (=> b!278404 (= e!177579 e!177576)))

(declare-fun c!45788 () Bool)

(assert (=> b!278404 (= c!45788 (or (= lt!138348 k!2581) (= (bvadd lt!138348 lt!138348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!64859 c!45789) b!278397))

(assert (= (and d!64859 (not c!45789)) b!278404))

(assert (= (and b!278404 c!45788) b!278402))

(assert (= (and b!278404 (not c!45788)) b!278401))

(assert (= (and d!64859 c!45790) b!278400))

(assert (= (and d!64859 (not c!45790)) b!278399))

(assert (= (and b!278399 res!141926) b!278396))

(assert (= (and b!278396 (not res!141925)) b!278398))

(assert (= (and b!278398 (not res!141924)) b!278403))

(declare-fun m!293405 () Bool)

(assert (=> b!278396 m!293405))

(assert (=> b!278398 m!293405))

(assert (=> b!278401 m!293057))

(assert (=> b!278401 m!293327))

(assert (=> b!278401 m!293327))

(declare-fun m!293407 () Bool)

(assert (=> b!278401 m!293407))

(assert (=> d!64859 m!293057))

(declare-fun m!293409 () Bool)

(assert (=> d!64859 m!293409))

(assert (=> d!64859 m!292835))

(assert (=> b!278403 m!293405))

(assert (=> d!64727 d!64859))

(assert (=> d!64727 d!64833))

(assert (=> d!64727 d!64715))

(declare-fun d!64861 () Bool)

(assert (=> d!64861 (arrayContainsKey!0 lt!138114 lt!138199 #b00000000000000000000000000000000)))

(declare-fun lt!138350 () Unit!8791)

(assert (=> d!64861 (= lt!138350 (choose!13 lt!138114 lt!138199 startIndex!26))))

(assert (=> d!64861 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!64861 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138114 lt!138199 startIndex!26) lt!138350)))

(declare-fun bs!9920 () Bool)

(assert (= bs!9920 d!64861))

(assert (=> bs!9920 m!292995))

(declare-fun m!293411 () Bool)

(assert (=> bs!9920 m!293411))

(assert (=> b!278060 d!64861))

(declare-fun d!64863 () Bool)

(declare-fun res!141927 () Bool)

(declare-fun e!177581 () Bool)

(assert (=> d!64863 (=> res!141927 e!177581)))

(assert (=> d!64863 (= res!141927 (= (select (arr!6572 lt!138114) #b00000000000000000000000000000000) lt!138199))))

(assert (=> d!64863 (= (arrayContainsKey!0 lt!138114 lt!138199 #b00000000000000000000000000000000) e!177581)))

(declare-fun b!278405 () Bool)

(declare-fun e!177582 () Bool)

(assert (=> b!278405 (= e!177581 e!177582)))

(declare-fun res!141928 () Bool)

(assert (=> b!278405 (=> (not res!141928) (not e!177582))))

(assert (=> b!278405 (= res!141928 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6924 lt!138114)))))

(declare-fun b!278406 () Bool)

(assert (=> b!278406 (= e!177582 (arrayContainsKey!0 lt!138114 lt!138199 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64863 (not res!141927)) b!278405))

(assert (= (and b!278405 res!141928) b!278406))

(assert (=> d!64863 m!293363))

(declare-fun m!293413 () Bool)

(assert (=> b!278406 m!293413))

(assert (=> b!278060 d!64863))

(declare-fun b!278407 () Bool)

(declare-fun e!177583 () SeekEntryResult!1730)

(assert (=> b!278407 (= e!177583 Undefined!1730)))

(declare-fun d!64865 () Bool)

(declare-fun lt!138351 () SeekEntryResult!1730)

(assert (=> d!64865 (and (or (is-Undefined!1730 lt!138351) (not (is-Found!1730 lt!138351)) (and (bvsge (index!9091 lt!138351) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138351) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138351) (is-Found!1730 lt!138351) (not (is-MissingZero!1730 lt!138351)) (and (bvsge (index!9090 lt!138351) #b00000000000000000000000000000000) (bvslt (index!9090 lt!138351) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138351) (is-Found!1730 lt!138351) (is-MissingZero!1730 lt!138351) (not (is-MissingVacant!1730 lt!138351)) (and (bvsge (index!9093 lt!138351) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138351) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138351) (ite (is-Found!1730 lt!138351) (= (select (arr!6572 lt!138114) (index!9091 lt!138351)) (select (arr!6572 lt!138114) startIndex!26)) (ite (is-MissingZero!1730 lt!138351) (= (select (arr!6572 lt!138114) (index!9090 lt!138351)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1730 lt!138351) (= (select (arr!6572 lt!138114) (index!9093 lt!138351)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64865 (= lt!138351 e!177583)))

(declare-fun c!45791 () Bool)

(declare-fun lt!138352 () SeekEntryResult!1730)

(assert (=> d!64865 (= c!45791 (and (is-Intermediate!1730 lt!138352) (undefined!2542 lt!138352)))))

(assert (=> d!64865 (= lt!138352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6572 lt!138114) startIndex!26) mask!3868) (select (arr!6572 lt!138114) startIndex!26) lt!138114 mask!3868))))

(assert (=> d!64865 (validMask!0 mask!3868)))

(assert (=> d!64865 (= (seekEntryOrOpen!0 (select (arr!6572 lt!138114) startIndex!26) lt!138114 mask!3868) lt!138351)))

(declare-fun b!278408 () Bool)

(declare-fun c!45792 () Bool)

(declare-fun lt!138353 () (_ BitVec 64))

(assert (=> b!278408 (= c!45792 (= lt!138353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177584 () SeekEntryResult!1730)

(declare-fun e!177585 () SeekEntryResult!1730)

(assert (=> b!278408 (= e!177584 e!177585)))

(declare-fun b!278409 () Bool)

(assert (=> b!278409 (= e!177583 e!177584)))

(assert (=> b!278409 (= lt!138353 (select (arr!6572 lt!138114) (index!9092 lt!138352)))))

(declare-fun c!45793 () Bool)

(assert (=> b!278409 (= c!45793 (= lt!138353 (select (arr!6572 lt!138114) startIndex!26)))))

(declare-fun b!278410 () Bool)

(assert (=> b!278410 (= e!177585 (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138352) (index!9092 lt!138352) (index!9092 lt!138352) (select (arr!6572 lt!138114) startIndex!26) lt!138114 mask!3868))))

(declare-fun b!278411 () Bool)

(assert (=> b!278411 (= e!177584 (Found!1730 (index!9092 lt!138352)))))

(declare-fun b!278412 () Bool)

(assert (=> b!278412 (= e!177585 (MissingZero!1730 (index!9092 lt!138352)))))

(assert (= (and d!64865 c!45791) b!278407))

(assert (= (and d!64865 (not c!45791)) b!278409))

(assert (= (and b!278409 c!45793) b!278411))

(assert (= (and b!278409 (not c!45793)) b!278408))

(assert (= (and b!278408 c!45792) b!278412))

(assert (= (and b!278408 (not c!45792)) b!278410))

(assert (=> d!64865 m!292991))

(declare-fun m!293415 () Bool)

(assert (=> d!64865 m!293415))

(declare-fun m!293417 () Bool)

(assert (=> d!64865 m!293417))

(declare-fun m!293419 () Bool)

(assert (=> d!64865 m!293419))

(assert (=> d!64865 m!292835))

(declare-fun m!293421 () Bool)

(assert (=> d!64865 m!293421))

(assert (=> d!64865 m!293415))

(assert (=> d!64865 m!292991))

(declare-fun m!293423 () Bool)

(assert (=> d!64865 m!293423))

(declare-fun m!293425 () Bool)

(assert (=> b!278409 m!293425))

(assert (=> b!278410 m!292991))

(declare-fun m!293427 () Bool)

(assert (=> b!278410 m!293427))

(assert (=> b!278060 d!64865))

(declare-fun b!278413 () Bool)

(declare-fun e!177586 () SeekEntryResult!1730)

(assert (=> b!278413 (= e!177586 (Found!1730 (index!9092 lt!138231)))))

(declare-fun b!278414 () Bool)

(declare-fun e!177588 () SeekEntryResult!1730)

(assert (=> b!278414 (= e!177588 Undefined!1730)))

(declare-fun b!278415 () Bool)

(declare-fun c!45796 () Bool)

(declare-fun lt!138355 () (_ BitVec 64))

(assert (=> b!278415 (= c!45796 (= lt!138355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177587 () SeekEntryResult!1730)

(assert (=> b!278415 (= e!177586 e!177587)))

(declare-fun b!278416 () Bool)

(assert (=> b!278416 (= e!177588 e!177586)))

(declare-fun c!45794 () Bool)

(assert (=> b!278416 (= c!45794 (= lt!138355 k!2581))))

(declare-fun b!278417 () Bool)

(assert (=> b!278417 (= e!177587 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27335 lt!138231) #b00000000000000000000000000000001) (nextIndex!0 (index!9092 lt!138231) (x!27335 lt!138231) mask!3868) (index!9092 lt!138231) k!2581 lt!138114 mask!3868))))

(declare-fun d!64867 () Bool)

(declare-fun lt!138354 () SeekEntryResult!1730)

(assert (=> d!64867 (and (or (is-Undefined!1730 lt!138354) (not (is-Found!1730 lt!138354)) (and (bvsge (index!9091 lt!138354) #b00000000000000000000000000000000) (bvslt (index!9091 lt!138354) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138354) (is-Found!1730 lt!138354) (not (is-MissingVacant!1730 lt!138354)) (not (= (index!9093 lt!138354) (index!9092 lt!138231))) (and (bvsge (index!9093 lt!138354) #b00000000000000000000000000000000) (bvslt (index!9093 lt!138354) (size!6924 lt!138114)))) (or (is-Undefined!1730 lt!138354) (ite (is-Found!1730 lt!138354) (= (select (arr!6572 lt!138114) (index!9091 lt!138354)) k!2581) (and (is-MissingVacant!1730 lt!138354) (= (index!9093 lt!138354) (index!9092 lt!138231)) (= (select (arr!6572 lt!138114) (index!9093 lt!138354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64867 (= lt!138354 e!177588)))

(declare-fun c!45795 () Bool)

(assert (=> d!64867 (= c!45795 (bvsge (x!27335 lt!138231) #b01111111111111111111111111111110))))

(assert (=> d!64867 (= lt!138355 (select (arr!6572 lt!138114) (index!9092 lt!138231)))))

(assert (=> d!64867 (validMask!0 mask!3868)))

(assert (=> d!64867 (= (seekKeyOrZeroReturnVacant!0 (x!27335 lt!138231) (index!9092 lt!138231) (index!9092 lt!138231) k!2581 lt!138114 mask!3868) lt!138354)))

(declare-fun b!278418 () Bool)

(assert (=> b!278418 (= e!177587 (MissingVacant!1730 (index!9092 lt!138231)))))

(assert (= (and d!64867 c!45795) b!278414))

(assert (= (and d!64867 (not c!45795)) b!278416))

(assert (= (and b!278416 c!45794) b!278413))

(assert (= (and b!278416 (not c!45794)) b!278415))

(assert (= (and b!278415 c!45796) b!278418))

(assert (= (and b!278415 (not c!45796)) b!278417))

(declare-fun m!293429 () Bool)

(assert (=> b!278417 m!293429))

(assert (=> b!278417 m!293429))

(declare-fun m!293431 () Bool)

(assert (=> b!278417 m!293431))

(declare-fun m!293433 () Bool)

(assert (=> d!64867 m!293433))

(declare-fun m!293435 () Bool)

(assert (=> d!64867 m!293435))

(assert (=> d!64867 m!293067))

(assert (=> d!64867 m!292835))

(assert (=> b!278135 d!64867))

(assert (=> b!278003 d!64835))

(declare-fun d!64869 () Bool)

(assert (=> d!64869 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13846 (store (arr!6572 a!3325) i!1267 k!2581) (size!6924 a!3325)) mask!3868)))

(assert (=> d!64869 true))

(declare-fun _$55!36 () Unit!8791)

(assert (=> d!64869 (= (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) _$55!36)))

(declare-fun bs!9921 () Bool)

(assert (= bs!9921 d!64869))

(assert (=> bs!9921 m!292825))

(assert (=> bs!9921 m!293093))

(assert (=> d!64755 d!64869))

(assert (=> d!64755 d!64715))

(push 1)

(assert (not bm!25377))

(assert (not d!64867))

(assert (not b!278401))

(assert (not bm!25379))

(assert (not b!278280))

(assert (not b!278348))

(assert (not d!64847))

(assert (not d!64843))

(assert (not d!64859))

(assert (not b!278417))

(assert (not b!278255))

(assert (not b!278284))

(assert (not d!64787))

(assert (not b!278391))

(assert (not b!278389))

(assert (not d!64865))

(assert (not b!278370))

(assert (not b!278288))

(assert (not b!278270))

(assert (not b!278395))

(assert (not b!278362))

(assert (not bm!25376))

(assert (not b!278366))

(assert (not d!64869))

(assert (not b!278369))

(assert (not b!278356))

(assert (not b!278283))

(assert (not d!64851))

(assert (not b!278358))

(assert (not bm!25373))

(assert (not b!278406))

(assert (not b!278347))

(assert (not b!278343))

(assert (not b!278410))

(assert (not d!64855))

(assert (not d!64839))

(assert (not d!64801))

(assert (not bm!25378))

(assert (not d!64789))

(assert (not d!64811))

(assert (not b!278357))

(assert (not d!64861))

(assert (not b!278392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

