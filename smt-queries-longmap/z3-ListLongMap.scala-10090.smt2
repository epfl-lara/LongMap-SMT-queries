; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118880 () Bool)

(assert start!118880)

(declare-fun b!1388585 () Bool)

(declare-fun res!928873 () Bool)

(declare-fun e!786596 () Bool)

(assert (=> b!1388585 (=> (not res!928873) (not e!786596))))

(declare-datatypes ((array!94958 0))(
  ( (array!94959 (arr!45852 (Array (_ BitVec 32) (_ BitVec 64))) (size!46402 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94958)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388585 (= res!928873 (validKeyInArray!0 (select (arr!45852 a!2901) j!112)))))

(declare-fun b!1388586 () Bool)

(assert (=> b!1388586 (= e!786596 (and (bvsle #b00000000000000000000000000000000 (size!46402 a!2901)) (bvsge (size!46402 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388588 () Bool)

(declare-fun res!928870 () Bool)

(assert (=> b!1388588 (=> (not res!928870) (not e!786596))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94958 (_ BitVec 32)) Bool)

(assert (=> b!1388588 (= res!928870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388589 () Bool)

(declare-fun res!928872 () Bool)

(assert (=> b!1388589 (=> (not res!928872) (not e!786596))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388589 (= res!928872 (validKeyInArray!0 (select (arr!45852 a!2901) i!1037)))))

(declare-fun res!928869 () Bool)

(assert (=> start!118880 (=> (not res!928869) (not e!786596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118880 (= res!928869 (validMask!0 mask!2840))))

(assert (=> start!118880 e!786596))

(assert (=> start!118880 true))

(declare-fun array_inv!34880 (array!94958) Bool)

(assert (=> start!118880 (array_inv!34880 a!2901)))

(declare-fun b!1388587 () Bool)

(declare-fun res!928871 () Bool)

(assert (=> b!1388587 (=> (not res!928871) (not e!786596))))

(assert (=> b!1388587 (= res!928871 (and (= (size!46402 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46402 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46402 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!118880 res!928869) b!1388587))

(assert (= (and b!1388587 res!928871) b!1388589))

(assert (= (and b!1388589 res!928872) b!1388585))

(assert (= (and b!1388585 res!928873) b!1388588))

(assert (= (and b!1388588 res!928870) b!1388586))

(declare-fun m!1274333 () Bool)

(assert (=> b!1388585 m!1274333))

(assert (=> b!1388585 m!1274333))

(declare-fun m!1274335 () Bool)

(assert (=> b!1388585 m!1274335))

(declare-fun m!1274337 () Bool)

(assert (=> b!1388588 m!1274337))

(declare-fun m!1274339 () Bool)

(assert (=> b!1388589 m!1274339))

(assert (=> b!1388589 m!1274339))

(declare-fun m!1274341 () Bool)

(assert (=> b!1388589 m!1274341))

(declare-fun m!1274343 () Bool)

(assert (=> start!118880 m!1274343))

(declare-fun m!1274345 () Bool)

(assert (=> start!118880 m!1274345))

(check-sat (not b!1388588) (not b!1388589) (not b!1388585) (not start!118880))
(check-sat)
(get-model)

(declare-fun b!1388613 () Bool)

(declare-fun e!786609 () Bool)

(declare-fun e!786610 () Bool)

(assert (=> b!1388613 (= e!786609 e!786610)))

(declare-fun c!129303 () Bool)

(assert (=> b!1388613 (= c!129303 (validKeyInArray!0 (select (arr!45852 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388614 () Bool)

(declare-fun e!786611 () Bool)

(declare-fun call!66637 () Bool)

(assert (=> b!1388614 (= e!786611 call!66637)))

(declare-fun d!149949 () Bool)

(declare-fun res!928893 () Bool)

(assert (=> d!149949 (=> res!928893 e!786609)))

(assert (=> d!149949 (= res!928893 (bvsge #b00000000000000000000000000000000 (size!46402 a!2901)))))

(assert (=> d!149949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786609)))

(declare-fun b!1388615 () Bool)

(assert (=> b!1388615 (= e!786610 call!66637)))

(declare-fun bm!66634 () Bool)

(assert (=> bm!66634 (= call!66637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388616 () Bool)

(assert (=> b!1388616 (= e!786610 e!786611)))

(declare-fun lt!610363 () (_ BitVec 64))

(assert (=> b!1388616 (= lt!610363 (select (arr!45852 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46406 0))(
  ( (Unit!46407) )
))
(declare-fun lt!610365 () Unit!46406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94958 (_ BitVec 64) (_ BitVec 32)) Unit!46406)

(assert (=> b!1388616 (= lt!610365 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610363 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388616 (arrayContainsKey!0 a!2901 lt!610363 #b00000000000000000000000000000000)))

(declare-fun lt!610364 () Unit!46406)

(assert (=> b!1388616 (= lt!610364 lt!610365)))

(declare-fun res!928894 () Bool)

(declare-datatypes ((SeekEntryResult!10188 0))(
  ( (MissingZero!10188 (index!43123 (_ BitVec 32))) (Found!10188 (index!43124 (_ BitVec 32))) (Intermediate!10188 (undefined!11000 Bool) (index!43125 (_ BitVec 32)) (x!124767 (_ BitVec 32))) (Undefined!10188) (MissingVacant!10188 (index!43126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94958 (_ BitVec 32)) SeekEntryResult!10188)

(assert (=> b!1388616 (= res!928894 (= (seekEntryOrOpen!0 (select (arr!45852 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10188 #b00000000000000000000000000000000)))))

(assert (=> b!1388616 (=> (not res!928894) (not e!786611))))

(assert (= (and d!149949 (not res!928893)) b!1388613))

(assert (= (and b!1388613 c!129303) b!1388616))

(assert (= (and b!1388613 (not c!129303)) b!1388615))

(assert (= (and b!1388616 res!928894) b!1388614))

(assert (= (or b!1388614 b!1388615) bm!66634))

(declare-fun m!1274361 () Bool)

(assert (=> b!1388613 m!1274361))

(assert (=> b!1388613 m!1274361))

(declare-fun m!1274363 () Bool)

(assert (=> b!1388613 m!1274363))

(declare-fun m!1274365 () Bool)

(assert (=> bm!66634 m!1274365))

(assert (=> b!1388616 m!1274361))

(declare-fun m!1274367 () Bool)

(assert (=> b!1388616 m!1274367))

(declare-fun m!1274369 () Bool)

(assert (=> b!1388616 m!1274369))

(assert (=> b!1388616 m!1274361))

(declare-fun m!1274371 () Bool)

(assert (=> b!1388616 m!1274371))

(assert (=> b!1388588 d!149949))

(declare-fun d!149961 () Bool)

(assert (=> d!149961 (= (validKeyInArray!0 (select (arr!45852 a!2901) i!1037)) (and (not (= (select (arr!45852 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45852 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388589 d!149961))

(declare-fun d!149963 () Bool)

(assert (=> d!149963 (= (validKeyInArray!0 (select (arr!45852 a!2901) j!112)) (and (not (= (select (arr!45852 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45852 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388585 d!149963))

(declare-fun d!149965 () Bool)

(assert (=> d!149965 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118880 d!149965))

(declare-fun d!149975 () Bool)

(assert (=> d!149975 (= (array_inv!34880 a!2901) (bvsge (size!46402 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118880 d!149975))

(check-sat (not bm!66634) (not b!1388616) (not b!1388613))
(check-sat)
