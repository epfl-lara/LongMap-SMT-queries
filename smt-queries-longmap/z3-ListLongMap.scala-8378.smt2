; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101866 () Bool)

(assert start!101866)

(declare-fun b!1226778 () Bool)

(declare-fun res!815482 () Bool)

(declare-fun e!696617 () Bool)

(assert (=> b!1226778 (=> (not res!815482) (not e!696617))))

(declare-datatypes ((List!27066 0))(
  ( (Nil!27063) (Cons!27062 (h!28271 (_ BitVec 64)) (t!40520 List!27066)) )
))
(declare-fun acc!823 () List!27066)

(declare-fun noDuplicate!1681 (List!27066) Bool)

(assert (=> b!1226778 (= res!815482 (noDuplicate!1681 acc!823))))

(declare-fun b!1226779 () Bool)

(declare-fun res!815481 () Bool)

(assert (=> b!1226779 (=> (not res!815481) (not e!696617))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79132 0))(
  ( (array!79133 (arr!38192 (Array (_ BitVec 32) (_ BitVec 64))) (size!38730 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79132)

(assert (=> b!1226779 (= res!815481 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38730 a!3806)) (bvslt from!3184 (size!38730 a!3806))))))

(declare-fun b!1226780 () Bool)

(declare-fun res!815478 () Bool)

(assert (=> b!1226780 (=> (not res!815478) (not e!696617))))

(declare-fun contains!7038 (List!27066 (_ BitVec 64)) Bool)

(assert (=> b!1226780 (= res!815478 (not (contains!7038 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815477 () Bool)

(assert (=> start!101866 (=> (not res!815477) (not e!696617))))

(assert (=> start!101866 (= res!815477 (bvslt (size!38730 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101866 e!696617))

(declare-fun array_inv!29175 (array!79132) Bool)

(assert (=> start!101866 (array_inv!29175 a!3806)))

(assert (=> start!101866 true))

(declare-fun b!1226781 () Bool)

(assert (=> b!1226781 (= e!696617 (not (noDuplicate!1681 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823))))))

(declare-fun b!1226782 () Bool)

(declare-fun res!815480 () Bool)

(assert (=> b!1226782 (=> (not res!815480) (not e!696617))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226782 (= res!815480 (validKeyInArray!0 k0!2913))))

(declare-fun b!1226783 () Bool)

(declare-fun res!815475 () Bool)

(assert (=> b!1226783 (=> (not res!815475) (not e!696617))))

(assert (=> b!1226783 (= res!815475 (validKeyInArray!0 (select (arr!38192 a!3806) from!3184)))))

(declare-fun b!1226784 () Bool)

(declare-fun res!815476 () Bool)

(assert (=> b!1226784 (=> (not res!815476) (not e!696617))))

(assert (=> b!1226784 (= res!815476 (not (contains!7038 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226785 () Bool)

(declare-fun res!815474 () Bool)

(assert (=> b!1226785 (=> (not res!815474) (not e!696617))))

(declare-fun arrayContainsKey!0 (array!79132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226785 (= res!815474 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226786 () Bool)

(declare-fun res!815479 () Bool)

(assert (=> b!1226786 (=> (not res!815479) (not e!696617))))

(declare-fun arrayNoDuplicates!0 (array!79132 (_ BitVec 32) List!27066) Bool)

(assert (=> b!1226786 (= res!815479 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226787 () Bool)

(declare-fun res!815483 () Bool)

(assert (=> b!1226787 (=> (not res!815483) (not e!696617))))

(assert (=> b!1226787 (= res!815483 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (= (and start!101866 res!815477) b!1226782))

(assert (= (and b!1226782 res!815480) b!1226779))

(assert (= (and b!1226779 res!815481) b!1226778))

(assert (= (and b!1226778 res!815482) b!1226780))

(assert (= (and b!1226780 res!815478) b!1226784))

(assert (= (and b!1226784 res!815476) b!1226785))

(assert (= (and b!1226785 res!815474) b!1226786))

(assert (= (and b!1226786 res!815479) b!1226783))

(assert (= (and b!1226783 res!815475) b!1226787))

(assert (= (and b!1226787 res!815483) b!1226781))

(declare-fun m!1131261 () Bool)

(assert (=> b!1226782 m!1131261))

(declare-fun m!1131263 () Bool)

(assert (=> b!1226785 m!1131263))

(declare-fun m!1131265 () Bool)

(assert (=> b!1226781 m!1131265))

(declare-fun m!1131267 () Bool)

(assert (=> b!1226781 m!1131267))

(declare-fun m!1131269 () Bool)

(assert (=> b!1226780 m!1131269))

(declare-fun m!1131271 () Bool)

(assert (=> b!1226786 m!1131271))

(assert (=> b!1226783 m!1131265))

(assert (=> b!1226783 m!1131265))

(declare-fun m!1131273 () Bool)

(assert (=> b!1226783 m!1131273))

(declare-fun m!1131275 () Bool)

(assert (=> b!1226778 m!1131275))

(declare-fun m!1131277 () Bool)

(assert (=> b!1226784 m!1131277))

(declare-fun m!1131279 () Bool)

(assert (=> start!101866 m!1131279))

(check-sat (not b!1226782) (not b!1226785) (not b!1226778) (not start!101866) (not b!1226784) (not b!1226783) (not b!1226786) (not b!1226781) (not b!1226780))
(check-sat)
(get-model)

(declare-fun d!133911 () Bool)

(declare-fun res!815548 () Bool)

(declare-fun e!696634 () Bool)

(assert (=> d!133911 (=> res!815548 e!696634)))

(get-info :version)

(assert (=> d!133911 (= res!815548 ((_ is Nil!27063) (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823)))))

(assert (=> d!133911 (= (noDuplicate!1681 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823)) e!696634)))

(declare-fun b!1226852 () Bool)

(declare-fun e!696635 () Bool)

(assert (=> b!1226852 (= e!696634 e!696635)))

(declare-fun res!815549 () Bool)

(assert (=> b!1226852 (=> (not res!815549) (not e!696635))))

(assert (=> b!1226852 (= res!815549 (not (contains!7038 (t!40520 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823)) (h!28271 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823)))))))

(declare-fun b!1226853 () Bool)

(assert (=> b!1226853 (= e!696635 (noDuplicate!1681 (t!40520 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823))))))

(assert (= (and d!133911 (not res!815548)) b!1226852))

(assert (= (and b!1226852 res!815549) b!1226853))

(declare-fun m!1131321 () Bool)

(assert (=> b!1226852 m!1131321))

(declare-fun m!1131323 () Bool)

(assert (=> b!1226853 m!1131323))

(assert (=> b!1226781 d!133911))

(declare-fun b!1226870 () Bool)

(declare-fun e!696650 () Bool)

(declare-fun call!60771 () Bool)

(assert (=> b!1226870 (= e!696650 call!60771)))

(declare-fun b!1226871 () Bool)

(assert (=> b!1226871 (= e!696650 call!60771)))

(declare-fun b!1226872 () Bool)

(declare-fun e!696651 () Bool)

(assert (=> b!1226872 (= e!696651 (contains!7038 acc!823 (select (arr!38192 a!3806) from!3184)))))

(declare-fun b!1226873 () Bool)

(declare-fun e!696653 () Bool)

(declare-fun e!696652 () Bool)

(assert (=> b!1226873 (= e!696653 e!696652)))

(declare-fun res!815562 () Bool)

(assert (=> b!1226873 (=> (not res!815562) (not e!696652))))

(assert (=> b!1226873 (= res!815562 (not e!696651))))

(declare-fun res!815564 () Bool)

(assert (=> b!1226873 (=> (not res!815564) (not e!696651))))

(assert (=> b!1226873 (= res!815564 (validKeyInArray!0 (select (arr!38192 a!3806) from!3184)))))

(declare-fun c!120517 () Bool)

(declare-fun bm!60768 () Bool)

(assert (=> bm!60768 (= call!60771 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120517 (Cons!27062 (select (arr!38192 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!133913 () Bool)

(declare-fun res!815563 () Bool)

(assert (=> d!133913 (=> res!815563 e!696653)))

(assert (=> d!133913 (= res!815563 (bvsge from!3184 (size!38730 a!3806)))))

(assert (=> d!133913 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696653)))

(declare-fun b!1226874 () Bool)

(assert (=> b!1226874 (= e!696652 e!696650)))

(assert (=> b!1226874 (= c!120517 (validKeyInArray!0 (select (arr!38192 a!3806) from!3184)))))

(assert (= (and d!133913 (not res!815563)) b!1226873))

(assert (= (and b!1226873 res!815564) b!1226872))

(assert (= (and b!1226873 res!815562) b!1226874))

(assert (= (and b!1226874 c!120517) b!1226871))

(assert (= (and b!1226874 (not c!120517)) b!1226870))

(assert (= (or b!1226871 b!1226870) bm!60768))

(assert (=> b!1226872 m!1131265))

(assert (=> b!1226872 m!1131265))

(declare-fun m!1131331 () Bool)

(assert (=> b!1226872 m!1131331))

(assert (=> b!1226873 m!1131265))

(assert (=> b!1226873 m!1131265))

(assert (=> b!1226873 m!1131273))

(assert (=> bm!60768 m!1131265))

(declare-fun m!1131333 () Bool)

(assert (=> bm!60768 m!1131333))

(assert (=> b!1226874 m!1131265))

(assert (=> b!1226874 m!1131265))

(assert (=> b!1226874 m!1131273))

(assert (=> b!1226786 d!133913))

(declare-fun d!133925 () Bool)

(declare-fun lt!558692 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!548 (List!27066) (InoxSet (_ BitVec 64)))

(assert (=> d!133925 (= lt!558692 (select (content!548 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696676 () Bool)

(assert (=> d!133925 (= lt!558692 e!696676)))

(declare-fun res!815586 () Bool)

(assert (=> d!133925 (=> (not res!815586) (not e!696676))))

(assert (=> d!133925 (= res!815586 ((_ is Cons!27062) acc!823))))

(assert (=> d!133925 (= (contains!7038 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558692)))

(declare-fun b!1226899 () Bool)

(declare-fun e!696677 () Bool)

(assert (=> b!1226899 (= e!696676 e!696677)))

(declare-fun res!815585 () Bool)

(assert (=> b!1226899 (=> res!815585 e!696677)))

(assert (=> b!1226899 (= res!815585 (= (h!28271 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226900 () Bool)

(assert (=> b!1226900 (= e!696677 (contains!7038 (t!40520 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133925 res!815586) b!1226899))

(assert (= (and b!1226899 (not res!815585)) b!1226900))

(declare-fun m!1131341 () Bool)

(assert (=> d!133925 m!1131341))

(declare-fun m!1131343 () Bool)

(assert (=> d!133925 m!1131343))

(declare-fun m!1131345 () Bool)

(assert (=> b!1226900 m!1131345))

(assert (=> b!1226780 d!133925))

(declare-fun d!133929 () Bool)

(assert (=> d!133929 (= (array_inv!29175 a!3806) (bvsge (size!38730 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101866 d!133929))

(declare-fun d!133933 () Bool)

(declare-fun res!815600 () Bool)

(declare-fun e!696692 () Bool)

(assert (=> d!133933 (=> res!815600 e!696692)))

(assert (=> d!133933 (= res!815600 (= (select (arr!38192 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!133933 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696692)))

(declare-fun b!1226916 () Bool)

(declare-fun e!696693 () Bool)

(assert (=> b!1226916 (= e!696692 e!696693)))

(declare-fun res!815601 () Bool)

(assert (=> b!1226916 (=> (not res!815601) (not e!696693))))

(assert (=> b!1226916 (= res!815601 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38730 a!3806)))))

(declare-fun b!1226917 () Bool)

(assert (=> b!1226917 (= e!696693 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!133933 (not res!815600)) b!1226916))

(assert (= (and b!1226916 res!815601) b!1226917))

(declare-fun m!1131363 () Bool)

(assert (=> d!133933 m!1131363))

(declare-fun m!1131365 () Bool)

(assert (=> b!1226917 m!1131365))

(assert (=> b!1226785 d!133933))

(declare-fun d!133945 () Bool)

(declare-fun lt!558695 () Bool)

(assert (=> d!133945 (= lt!558695 (select (content!548 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696696 () Bool)

(assert (=> d!133945 (= lt!558695 e!696696)))

(declare-fun res!815605 () Bool)

(assert (=> d!133945 (=> (not res!815605) (not e!696696))))

(assert (=> d!133945 (= res!815605 ((_ is Cons!27062) acc!823))))

(assert (=> d!133945 (= (contains!7038 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558695)))

(declare-fun b!1226920 () Bool)

(declare-fun e!696697 () Bool)

(assert (=> b!1226920 (= e!696696 e!696697)))

(declare-fun res!815604 () Bool)

(assert (=> b!1226920 (=> res!815604 e!696697)))

(assert (=> b!1226920 (= res!815604 (= (h!28271 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226921 () Bool)

(assert (=> b!1226921 (= e!696697 (contains!7038 (t!40520 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133945 res!815605) b!1226920))

(assert (= (and b!1226920 (not res!815604)) b!1226921))

(assert (=> d!133945 m!1131341))

(declare-fun m!1131371 () Bool)

(assert (=> d!133945 m!1131371))

(declare-fun m!1131373 () Bool)

(assert (=> b!1226921 m!1131373))

(assert (=> b!1226784 d!133945))

(declare-fun d!133949 () Bool)

(declare-fun res!815606 () Bool)

(declare-fun e!696698 () Bool)

(assert (=> d!133949 (=> res!815606 e!696698)))

(assert (=> d!133949 (= res!815606 ((_ is Nil!27063) acc!823))))

(assert (=> d!133949 (= (noDuplicate!1681 acc!823) e!696698)))

(declare-fun b!1226922 () Bool)

(declare-fun e!696699 () Bool)

(assert (=> b!1226922 (= e!696698 e!696699)))

(declare-fun res!815607 () Bool)

(assert (=> b!1226922 (=> (not res!815607) (not e!696699))))

(assert (=> b!1226922 (= res!815607 (not (contains!7038 (t!40520 acc!823) (h!28271 acc!823))))))

(declare-fun b!1226923 () Bool)

(assert (=> b!1226923 (= e!696699 (noDuplicate!1681 (t!40520 acc!823)))))

(assert (= (and d!133949 (not res!815606)) b!1226922))

(assert (= (and b!1226922 res!815607) b!1226923))

(declare-fun m!1131375 () Bool)

(assert (=> b!1226922 m!1131375))

(declare-fun m!1131377 () Bool)

(assert (=> b!1226923 m!1131377))

(assert (=> b!1226778 d!133949))

(declare-fun d!133951 () Bool)

(assert (=> d!133951 (= (validKeyInArray!0 (select (arr!38192 a!3806) from!3184)) (and (not (= (select (arr!38192 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38192 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226783 d!133951))

(declare-fun d!133953 () Bool)

(assert (=> d!133953 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226782 d!133953))

(check-sat (not b!1226917) (not b!1226852) (not b!1226853) (not b!1226874) (not bm!60768) (not b!1226921) (not d!133925) (not b!1226923) (not b!1226872) (not b!1226873) (not d!133945) (not b!1226900) (not b!1226922))
(check-sat)
