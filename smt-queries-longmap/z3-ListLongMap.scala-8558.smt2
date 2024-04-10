; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104502 () Bool)

(assert start!104502)

(declare-fun res!832050 () Bool)

(declare-fun e!707165 () Bool)

(assert (=> start!104502 (=> (not res!832050) (not e!707165))))

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((array!80273 0))(
  ( (array!80274 (arr!38712 (Array (_ BitVec 32) (_ BitVec 64))) (size!39248 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80273)

(assert (=> start!104502 (= res!832050 (and (bvslt (size!39248 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39248 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39248 a!3892))))))

(assert (=> start!104502 e!707165))

(declare-fun array_inv!29560 (array!80273) Bool)

(assert (=> start!104502 (array_inv!29560 a!3892)))

(assert (=> start!104502 true))

(declare-fun b!1246834 () Bool)

(declare-fun res!832049 () Bool)

(assert (=> b!1246834 (=> (not res!832049) (not e!707165))))

(declare-datatypes ((List!27515 0))(
  ( (Nil!27512) (Cons!27511 (h!28720 (_ BitVec 64)) (t!40984 List!27515)) )
))
(declare-fun arrayNoDuplicates!0 (array!80273 (_ BitVec 32) List!27515) Bool)

(assert (=> b!1246834 (= res!832049 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27512))))

(declare-fun b!1246835 () Bool)

(declare-fun res!832051 () Bool)

(assert (=> b!1246835 (=> (not res!832051) (not e!707165))))

(assert (=> b!1246835 (= res!832051 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39248 a!3892)) (= newFrom!287 (size!39248 a!3892))))))

(declare-fun b!1246836 () Bool)

(assert (=> b!1246836 (= e!707165 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27512)))))

(assert (= (and start!104502 res!832050) b!1246834))

(assert (= (and b!1246834 res!832049) b!1246835))

(assert (= (and b!1246835 res!832051) b!1246836))

(declare-fun m!1148561 () Bool)

(assert (=> start!104502 m!1148561))

(declare-fun m!1148563 () Bool)

(assert (=> b!1246834 m!1148563))

(declare-fun m!1148565 () Bool)

(assert (=> b!1246836 m!1148565))

(check-sat (not b!1246834) (not start!104502) (not b!1246836))
(check-sat)
(get-model)

(declare-fun b!1246877 () Bool)

(declare-fun e!707196 () Bool)

(declare-fun contains!7462 (List!27515 (_ BitVec 64)) Bool)

(assert (=> b!1246877 (= e!707196 (contains!7462 Nil!27512 (select (arr!38712 a!3892) from!3270)))))

(declare-fun b!1246878 () Bool)

(declare-fun e!707199 () Bool)

(declare-fun call!61546 () Bool)

(assert (=> b!1246878 (= e!707199 call!61546)))

(declare-fun b!1246879 () Bool)

(declare-fun e!707198 () Bool)

(declare-fun e!707197 () Bool)

(assert (=> b!1246879 (= e!707198 e!707197)))

(declare-fun res!832080 () Bool)

(assert (=> b!1246879 (=> (not res!832080) (not e!707197))))

(assert (=> b!1246879 (= res!832080 (not e!707196))))

(declare-fun res!832079 () Bool)

(assert (=> b!1246879 (=> (not res!832079) (not e!707196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246879 (= res!832079 (validKeyInArray!0 (select (arr!38712 a!3892) from!3270)))))

(declare-fun bm!61543 () Bool)

(declare-fun c!122083 () Bool)

(assert (=> bm!61543 (= call!61546 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122083 (Cons!27511 (select (arr!38712 a!3892) from!3270) Nil!27512) Nil!27512)))))

(declare-fun b!1246880 () Bool)

(assert (=> b!1246880 (= e!707199 call!61546)))

(declare-fun d!137691 () Bool)

(declare-fun res!832081 () Bool)

(assert (=> d!137691 (=> res!832081 e!707198)))

(assert (=> d!137691 (= res!832081 (bvsge from!3270 (size!39248 a!3892)))))

(assert (=> d!137691 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27512) e!707198)))

(declare-fun b!1246876 () Bool)

(assert (=> b!1246876 (= e!707197 e!707199)))

(assert (=> b!1246876 (= c!122083 (validKeyInArray!0 (select (arr!38712 a!3892) from!3270)))))

(assert (= (and d!137691 (not res!832081)) b!1246879))

(assert (= (and b!1246879 res!832079) b!1246877))

(assert (= (and b!1246879 res!832080) b!1246876))

(assert (= (and b!1246876 c!122083) b!1246880))

(assert (= (and b!1246876 (not c!122083)) b!1246878))

(assert (= (or b!1246880 b!1246878) bm!61543))

(declare-fun m!1148573 () Bool)

(assert (=> b!1246877 m!1148573))

(assert (=> b!1246877 m!1148573))

(declare-fun m!1148575 () Bool)

(assert (=> b!1246877 m!1148575))

(assert (=> b!1246879 m!1148573))

(assert (=> b!1246879 m!1148573))

(declare-fun m!1148577 () Bool)

(assert (=> b!1246879 m!1148577))

(assert (=> bm!61543 m!1148573))

(declare-fun m!1148579 () Bool)

(assert (=> bm!61543 m!1148579))

(assert (=> b!1246876 m!1148573))

(assert (=> b!1246876 m!1148573))

(assert (=> b!1246876 m!1148577))

(assert (=> b!1246834 d!137691))

(declare-fun d!137697 () Bool)

(assert (=> d!137697 (= (array_inv!29560 a!3892) (bvsge (size!39248 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104502 d!137697))

(declare-fun b!1246892 () Bool)

(declare-fun e!707208 () Bool)

(assert (=> b!1246892 (= e!707208 (contains!7462 Nil!27512 (select (arr!38712 a!3892) newFrom!287)))))

(declare-fun b!1246893 () Bool)

(declare-fun e!707211 () Bool)

(declare-fun call!61549 () Bool)

(assert (=> b!1246893 (= e!707211 call!61549)))

(declare-fun b!1246894 () Bool)

(declare-fun e!707210 () Bool)

(declare-fun e!707209 () Bool)

(assert (=> b!1246894 (= e!707210 e!707209)))

(declare-fun res!832089 () Bool)

(assert (=> b!1246894 (=> (not res!832089) (not e!707209))))

(assert (=> b!1246894 (= res!832089 (not e!707208))))

(declare-fun res!832088 () Bool)

(assert (=> b!1246894 (=> (not res!832088) (not e!707208))))

(assert (=> b!1246894 (= res!832088 (validKeyInArray!0 (select (arr!38712 a!3892) newFrom!287)))))

(declare-fun bm!61546 () Bool)

(declare-fun c!122086 () Bool)

(assert (=> bm!61546 (= call!61549 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122086 (Cons!27511 (select (arr!38712 a!3892) newFrom!287) Nil!27512) Nil!27512)))))

(declare-fun b!1246895 () Bool)

(assert (=> b!1246895 (= e!707211 call!61549)))

(declare-fun d!137701 () Bool)

(declare-fun res!832090 () Bool)

(assert (=> d!137701 (=> res!832090 e!707210)))

(assert (=> d!137701 (= res!832090 (bvsge newFrom!287 (size!39248 a!3892)))))

(assert (=> d!137701 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27512) e!707210)))

(declare-fun b!1246891 () Bool)

(assert (=> b!1246891 (= e!707209 e!707211)))

(assert (=> b!1246891 (= c!122086 (validKeyInArray!0 (select (arr!38712 a!3892) newFrom!287)))))

(assert (= (and d!137701 (not res!832090)) b!1246894))

(assert (= (and b!1246894 res!832088) b!1246892))

(assert (= (and b!1246894 res!832089) b!1246891))

(assert (= (and b!1246891 c!122086) b!1246895))

(assert (= (and b!1246891 (not c!122086)) b!1246893))

(assert (= (or b!1246895 b!1246893) bm!61546))

(declare-fun m!1148595 () Bool)

(assert (=> b!1246892 m!1148595))

(assert (=> b!1246892 m!1148595))

(declare-fun m!1148599 () Bool)

(assert (=> b!1246892 m!1148599))

(assert (=> b!1246894 m!1148595))

(assert (=> b!1246894 m!1148595))

(declare-fun m!1148601 () Bool)

(assert (=> b!1246894 m!1148601))

(assert (=> bm!61546 m!1148595))

(declare-fun m!1148603 () Bool)

(assert (=> bm!61546 m!1148603))

(assert (=> b!1246891 m!1148595))

(assert (=> b!1246891 m!1148595))

(assert (=> b!1246891 m!1148601))

(assert (=> b!1246836 d!137701))

(check-sat (not b!1246894) (not b!1246879) (not b!1246891) (not b!1246892) (not b!1246877) (not b!1246876) (not bm!61546) (not bm!61543))
(check-sat)
