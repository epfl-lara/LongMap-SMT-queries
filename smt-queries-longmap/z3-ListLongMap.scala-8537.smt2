; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104368 () Bool)

(assert start!104368)

(declare-fun res!831122 () Bool)

(declare-fun e!706732 () Bool)

(assert (=> start!104368 (=> (not res!831122) (not e!706732))))

(declare-datatypes ((array!80155 0))(
  ( (array!80156 (arr!38660 (Array (_ BitVec 32) (_ BitVec 64))) (size!39197 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80155)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104368 (= res!831122 (and (bvslt (size!39197 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39197 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39197 a!3892))))))

(assert (=> start!104368 e!706732))

(declare-fun array_inv!29598 (array!80155) Bool)

(assert (=> start!104368 (array_inv!29598 a!3892)))

(assert (=> start!104368 true))

(declare-fun b!1246391 () Bool)

(declare-fun res!831123 () Bool)

(assert (=> b!1246391 (=> (not res!831123) (not e!706732))))

(declare-datatypes ((List!27476 0))(
  ( (Nil!27473) (Cons!27472 (h!28690 (_ BitVec 64)) (t!40937 List!27476)) )
))
(declare-fun arrayNoDuplicates!0 (array!80155 (_ BitVec 32) List!27476) Bool)

(assert (=> b!1246391 (= res!831123 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27473))))

(declare-fun b!1246392 () Bool)

(declare-fun res!831121 () Bool)

(assert (=> b!1246392 (=> (not res!831121) (not e!706732))))

(assert (=> b!1246392 (= res!831121 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1246393 () Bool)

(declare-fun noDuplicate!2035 (List!27476) Bool)

(assert (=> b!1246393 (= e!706732 (not (noDuplicate!2035 Nil!27473)))))

(assert (= (and start!104368 res!831122) b!1246391))

(assert (= (and b!1246391 res!831123) b!1246392))

(assert (= (and b!1246392 res!831121) b!1246393))

(declare-fun m!1148851 () Bool)

(assert (=> start!104368 m!1148851))

(declare-fun m!1148853 () Bool)

(assert (=> b!1246391 m!1148853))

(declare-fun m!1148855 () Bool)

(assert (=> b!1246393 m!1148855))

(check-sat (not b!1246391) (not start!104368) (not b!1246393))
(check-sat)
(get-model)

(declare-fun b!1246422 () Bool)

(declare-fun e!706754 () Bool)

(declare-fun call!61526 () Bool)

(assert (=> b!1246422 (= e!706754 call!61526)))

(declare-fun b!1246423 () Bool)

(assert (=> b!1246423 (= e!706754 call!61526)))

(declare-fun b!1246424 () Bool)

(declare-fun e!706753 () Bool)

(declare-fun e!706756 () Bool)

(assert (=> b!1246424 (= e!706753 e!706756)))

(declare-fun res!831149 () Bool)

(assert (=> b!1246424 (=> (not res!831149) (not e!706756))))

(declare-fun e!706755 () Bool)

(assert (=> b!1246424 (= res!831149 (not e!706755))))

(declare-fun res!831148 () Bool)

(assert (=> b!1246424 (=> (not res!831148) (not e!706755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246424 (= res!831148 (validKeyInArray!0 (select (arr!38660 a!3892) from!3270)))))

(declare-fun d!137749 () Bool)

(declare-fun res!831150 () Bool)

(assert (=> d!137749 (=> res!831150 e!706753)))

(assert (=> d!137749 (= res!831150 (bvsge from!3270 (size!39197 a!3892)))))

(assert (=> d!137749 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27473) e!706753)))

(declare-fun b!1246425 () Bool)

(declare-fun contains!7471 (List!27476 (_ BitVec 64)) Bool)

(assert (=> b!1246425 (= e!706755 (contains!7471 Nil!27473 (select (arr!38660 a!3892) from!3270)))))

(declare-fun b!1246426 () Bool)

(assert (=> b!1246426 (= e!706756 e!706754)))

(declare-fun c!122329 () Bool)

(assert (=> b!1246426 (= c!122329 (validKeyInArray!0 (select (arr!38660 a!3892) from!3270)))))

(declare-fun bm!61523 () Bool)

(assert (=> bm!61523 (= call!61526 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122329 (Cons!27472 (select (arr!38660 a!3892) from!3270) Nil!27473) Nil!27473)))))

(assert (= (and d!137749 (not res!831150)) b!1246424))

(assert (= (and b!1246424 res!831148) b!1246425))

(assert (= (and b!1246424 res!831149) b!1246426))

(assert (= (and b!1246426 c!122329) b!1246422))

(assert (= (and b!1246426 (not c!122329)) b!1246423))

(assert (= (or b!1246422 b!1246423) bm!61523))

(declare-fun m!1148869 () Bool)

(assert (=> b!1246424 m!1148869))

(assert (=> b!1246424 m!1148869))

(declare-fun m!1148871 () Bool)

(assert (=> b!1246424 m!1148871))

(assert (=> b!1246425 m!1148869))

(assert (=> b!1246425 m!1148869))

(declare-fun m!1148873 () Bool)

(assert (=> b!1246425 m!1148873))

(assert (=> b!1246426 m!1148869))

(assert (=> b!1246426 m!1148869))

(assert (=> b!1246426 m!1148871))

(assert (=> bm!61523 m!1148869))

(declare-fun m!1148875 () Bool)

(assert (=> bm!61523 m!1148875))

(assert (=> b!1246391 d!137749))

(declare-fun d!137759 () Bool)

(assert (=> d!137759 (= (array_inv!29598 a!3892) (bvsge (size!39197 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104368 d!137759))

(declare-fun d!137761 () Bool)

(declare-fun res!831167 () Bool)

(declare-fun e!706777 () Bool)

(assert (=> d!137761 (=> res!831167 e!706777)))

(get-info :version)

(assert (=> d!137761 (= res!831167 ((_ is Nil!27473) Nil!27473))))

(assert (=> d!137761 (= (noDuplicate!2035 Nil!27473) e!706777)))

(declare-fun b!1246451 () Bool)

(declare-fun e!706778 () Bool)

(assert (=> b!1246451 (= e!706777 e!706778)))

(declare-fun res!831168 () Bool)

(assert (=> b!1246451 (=> (not res!831168) (not e!706778))))

(assert (=> b!1246451 (= res!831168 (not (contains!7471 (t!40937 Nil!27473) (h!28690 Nil!27473))))))

(declare-fun b!1246452 () Bool)

(assert (=> b!1246452 (= e!706778 (noDuplicate!2035 (t!40937 Nil!27473)))))

(assert (= (and d!137761 (not res!831167)) b!1246451))

(assert (= (and b!1246451 res!831168) b!1246452))

(declare-fun m!1148877 () Bool)

(assert (=> b!1246451 m!1148877))

(declare-fun m!1148879 () Bool)

(assert (=> b!1246452 m!1148879))

(assert (=> b!1246393 d!137761))

(check-sat (not b!1246452) (not bm!61523) (not b!1246426) (not b!1246425) (not b!1246424) (not b!1246451))
(check-sat)
