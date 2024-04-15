; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118904 () Bool)

(assert start!118904)

(declare-fun res!928894 () Bool)

(declare-fun e!786596 () Bool)

(assert (=> start!118904 (=> (not res!928894) (not e!786596))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118904 (= res!928894 (validMask!0 mask!2840))))

(assert (=> start!118904 e!786596))

(assert (=> start!118904 true))

(declare-datatypes ((array!94914 0))(
  ( (array!94915 (arr!45829 (Array (_ BitVec 32) (_ BitVec 64))) (size!46381 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94914)

(declare-fun array_inv!35062 (array!94914) Bool)

(assert (=> start!118904 (array_inv!35062 a!2901)))

(declare-fun b!1388572 () Bool)

(declare-datatypes ((List!32426 0))(
  ( (Nil!32423) (Cons!32422 (h!33637 (_ BitVec 64)) (t!47112 List!32426)) )
))
(declare-fun noDuplicate!2622 (List!32426) Bool)

(assert (=> b!1388572 (= e!786596 (not (noDuplicate!2622 Nil!32423)))))

(declare-fun b!1388573 () Bool)

(declare-fun res!928890 () Bool)

(assert (=> b!1388573 (=> (not res!928890) (not e!786596))))

(assert (=> b!1388573 (= res!928890 (and (bvsle #b00000000000000000000000000000000 (size!46381 a!2901)) (bvslt (size!46381 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388574 () Bool)

(declare-fun res!928889 () Bool)

(assert (=> b!1388574 (=> (not res!928889) (not e!786596))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388574 (= res!928889 (validKeyInArray!0 (select (arr!45829 a!2901) i!1037)))))

(declare-fun b!1388575 () Bool)

(declare-fun res!928892 () Bool)

(assert (=> b!1388575 (=> (not res!928892) (not e!786596))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388575 (= res!928892 (validKeyInArray!0 (select (arr!45829 a!2901) j!112)))))

(declare-fun b!1388576 () Bool)

(declare-fun res!928891 () Bool)

(assert (=> b!1388576 (=> (not res!928891) (not e!786596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94914 (_ BitVec 32)) Bool)

(assert (=> b!1388576 (= res!928891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388577 () Bool)

(declare-fun res!928893 () Bool)

(assert (=> b!1388577 (=> (not res!928893) (not e!786596))))

(assert (=> b!1388577 (= res!928893 (and (= (size!46381 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46381 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46381 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!118904 res!928894) b!1388577))

(assert (= (and b!1388577 res!928893) b!1388574))

(assert (= (and b!1388574 res!928889) b!1388575))

(assert (= (and b!1388575 res!928892) b!1388576))

(assert (= (and b!1388576 res!928891) b!1388573))

(assert (= (and b!1388573 res!928890) b!1388572))

(declare-fun m!1273861 () Bool)

(assert (=> b!1388576 m!1273861))

(declare-fun m!1273863 () Bool)

(assert (=> b!1388575 m!1273863))

(assert (=> b!1388575 m!1273863))

(declare-fun m!1273865 () Bool)

(assert (=> b!1388575 m!1273865))

(declare-fun m!1273867 () Bool)

(assert (=> b!1388572 m!1273867))

(declare-fun m!1273869 () Bool)

(assert (=> b!1388574 m!1273869))

(assert (=> b!1388574 m!1273869))

(declare-fun m!1273871 () Bool)

(assert (=> b!1388574 m!1273871))

(declare-fun m!1273873 () Bool)

(assert (=> start!118904 m!1273873))

(declare-fun m!1273875 () Bool)

(assert (=> start!118904 m!1273875))

(check-sat (not b!1388572) (not b!1388574) (not b!1388575) (not b!1388576) (not start!118904))
(check-sat)
(get-model)

(declare-fun d!149855 () Bool)

(assert (=> d!149855 (= (validKeyInArray!0 (select (arr!45829 a!2901) i!1037)) (and (not (= (select (arr!45829 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45829 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388574 d!149855))

(declare-fun d!149857 () Bool)

(assert (=> d!149857 (= (validKeyInArray!0 (select (arr!45829 a!2901) j!112)) (and (not (= (select (arr!45829 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45829 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388575 d!149857))

(declare-fun b!1388636 () Bool)

(declare-fun e!786629 () Bool)

(declare-fun call!66628 () Bool)

(assert (=> b!1388636 (= e!786629 call!66628)))

(declare-fun b!1388637 () Bool)

(declare-fun e!786628 () Bool)

(assert (=> b!1388637 (= e!786628 e!786629)))

(declare-fun c!129291 () Bool)

(assert (=> b!1388637 (= c!129291 (validKeyInArray!0 (select (arr!45829 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!149859 () Bool)

(declare-fun res!928946 () Bool)

(assert (=> d!149859 (=> res!928946 e!786628)))

(assert (=> d!149859 (= res!928946 (bvsge #b00000000000000000000000000000000 (size!46381 a!2901)))))

(assert (=> d!149859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786628)))

(declare-fun bm!66625 () Bool)

(assert (=> bm!66625 (= call!66628 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388638 () Bool)

(declare-fun e!786627 () Bool)

(assert (=> b!1388638 (= e!786627 call!66628)))

(declare-fun b!1388639 () Bool)

(assert (=> b!1388639 (= e!786629 e!786627)))

(declare-fun lt!610208 () (_ BitVec 64))

(assert (=> b!1388639 (= lt!610208 (select (arr!45829 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46257 0))(
  ( (Unit!46258) )
))
(declare-fun lt!610207 () Unit!46257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94914 (_ BitVec 64) (_ BitVec 32)) Unit!46257)

(assert (=> b!1388639 (= lt!610207 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610208 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388639 (arrayContainsKey!0 a!2901 lt!610208 #b00000000000000000000000000000000)))

(declare-fun lt!610206 () Unit!46257)

(assert (=> b!1388639 (= lt!610206 lt!610207)))

(declare-fun res!928945 () Bool)

(declare-datatypes ((SeekEntryResult!10190 0))(
  ( (MissingZero!10190 (index!43131 (_ BitVec 32))) (Found!10190 (index!43132 (_ BitVec 32))) (Intermediate!10190 (undefined!11002 Bool) (index!43133 (_ BitVec 32)) (x!124774 (_ BitVec 32))) (Undefined!10190) (MissingVacant!10190 (index!43134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94914 (_ BitVec 32)) SeekEntryResult!10190)

(assert (=> b!1388639 (= res!928945 (= (seekEntryOrOpen!0 (select (arr!45829 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10190 #b00000000000000000000000000000000)))))

(assert (=> b!1388639 (=> (not res!928945) (not e!786627))))

(assert (= (and d!149859 (not res!928946)) b!1388637))

(assert (= (and b!1388637 c!129291) b!1388639))

(assert (= (and b!1388637 (not c!129291)) b!1388636))

(assert (= (and b!1388639 res!928945) b!1388638))

(assert (= (or b!1388638 b!1388636) bm!66625))

(declare-fun m!1273913 () Bool)

(assert (=> b!1388637 m!1273913))

(assert (=> b!1388637 m!1273913))

(declare-fun m!1273915 () Bool)

(assert (=> b!1388637 m!1273915))

(declare-fun m!1273917 () Bool)

(assert (=> bm!66625 m!1273917))

(assert (=> b!1388639 m!1273913))

(declare-fun m!1273919 () Bool)

(assert (=> b!1388639 m!1273919))

(declare-fun m!1273921 () Bool)

(assert (=> b!1388639 m!1273921))

(assert (=> b!1388639 m!1273913))

(declare-fun m!1273923 () Bool)

(assert (=> b!1388639 m!1273923))

(assert (=> b!1388576 d!149859))

(declare-fun d!149871 () Bool)

(declare-fun res!928957 () Bool)

(declare-fun e!786643 () Bool)

(assert (=> d!149871 (=> res!928957 e!786643)))

(get-info :version)

(assert (=> d!149871 (= res!928957 ((_ is Nil!32423) Nil!32423))))

(assert (=> d!149871 (= (noDuplicate!2622 Nil!32423) e!786643)))

(declare-fun b!1388656 () Bool)

(declare-fun e!786644 () Bool)

(assert (=> b!1388656 (= e!786643 e!786644)))

(declare-fun res!928958 () Bool)

(assert (=> b!1388656 (=> (not res!928958) (not e!786644))))

(declare-fun contains!9713 (List!32426 (_ BitVec 64)) Bool)

(assert (=> b!1388656 (= res!928958 (not (contains!9713 (t!47112 Nil!32423) (h!33637 Nil!32423))))))

(declare-fun b!1388657 () Bool)

(assert (=> b!1388657 (= e!786644 (noDuplicate!2622 (t!47112 Nil!32423)))))

(assert (= (and d!149871 (not res!928957)) b!1388656))

(assert (= (and b!1388656 res!928958) b!1388657))

(declare-fun m!1273937 () Bool)

(assert (=> b!1388656 m!1273937))

(declare-fun m!1273939 () Bool)

(assert (=> b!1388657 m!1273939))

(assert (=> b!1388572 d!149871))

(declare-fun d!149875 () Bool)

(assert (=> d!149875 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118904 d!149875))

(declare-fun d!149883 () Bool)

(assert (=> d!149883 (= (array_inv!35062 a!2901) (bvsge (size!46381 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118904 d!149883))

(check-sat (not b!1388639) (not b!1388637) (not b!1388656) (not b!1388657) (not bm!66625))
(check-sat)
