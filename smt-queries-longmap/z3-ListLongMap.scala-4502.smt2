; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62468 () Bool)

(assert start!62468)

(declare-fun b!702874 () Bool)

(declare-fun res!466853 () Bool)

(declare-fun e!397397 () Bool)

(assert (=> b!702874 (=> (not res!466853) (not e!397397))))

(declare-datatypes ((List!13315 0))(
  ( (Nil!13312) (Cons!13311 (h!14356 (_ BitVec 64)) (t!19588 List!13315)) )
))
(declare-fun acc!652 () List!13315)

(declare-fun newAcc!49 () List!13315)

(declare-fun subseq!299 (List!13315 List!13315) Bool)

(assert (=> b!702874 (= res!466853 (subseq!299 acc!652 newAcc!49))))

(declare-fun res!466851 () Bool)

(assert (=> start!62468 (=> (not res!466851) (not e!397397))))

(declare-datatypes ((array!40158 0))(
  ( (array!40159 (arr!19235 (Array (_ BitVec 32) (_ BitVec 64))) (size!19617 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40158)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62468 (= res!466851 (and (bvslt (size!19617 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19617 a!3591))))))

(assert (=> start!62468 e!397397))

(assert (=> start!62468 true))

(declare-fun array_inv!15118 (array!40158) Bool)

(assert (=> start!62468 (array_inv!15118 a!3591)))

(declare-fun b!702875 () Bool)

(declare-fun res!466849 () Bool)

(assert (=> b!702875 (=> (not res!466849) (not e!397397))))

(declare-fun contains!3837 (List!13315 (_ BitVec 64)) Bool)

(assert (=> b!702875 (= res!466849 (not (contains!3837 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702876 () Bool)

(assert (=> b!702876 (= e!397397 false)))

(declare-fun lt!317520 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40158 (_ BitVec 32) List!13315) Bool)

(assert (=> b!702876 (= lt!317520 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!702877 () Bool)

(declare-fun res!466858 () Bool)

(assert (=> b!702877 (=> (not res!466858) (not e!397397))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702877 (= res!466858 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702878 () Bool)

(declare-fun res!466857 () Bool)

(assert (=> b!702878 (=> (not res!466857) (not e!397397))))

(assert (=> b!702878 (= res!466857 (not (contains!3837 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702879 () Bool)

(declare-fun res!466856 () Bool)

(assert (=> b!702879 (=> (not res!466856) (not e!397397))))

(assert (=> b!702879 (= res!466856 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702880 () Bool)

(declare-fun res!466844 () Bool)

(assert (=> b!702880 (=> (not res!466844) (not e!397397))))

(declare-fun noDuplicate!1106 (List!13315) Bool)

(assert (=> b!702880 (= res!466844 (noDuplicate!1106 newAcc!49))))

(declare-fun b!702881 () Bool)

(declare-fun res!466847 () Bool)

(assert (=> b!702881 (=> (not res!466847) (not e!397397))))

(assert (=> b!702881 (= res!466847 (not (contains!3837 acc!652 k0!2824)))))

(declare-fun b!702882 () Bool)

(declare-fun res!466861 () Bool)

(assert (=> b!702882 (=> (not res!466861) (not e!397397))))

(assert (=> b!702882 (= res!466861 (not (contains!3837 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702883 () Bool)

(declare-fun res!466854 () Bool)

(assert (=> b!702883 (=> (not res!466854) (not e!397397))))

(assert (=> b!702883 (= res!466854 (not (contains!3837 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702884 () Bool)

(declare-fun res!466850 () Bool)

(assert (=> b!702884 (=> (not res!466850) (not e!397397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702884 (= res!466850 (not (validKeyInArray!0 (select (arr!19235 a!3591) from!2969))))))

(declare-fun b!702885 () Bool)

(declare-fun res!466855 () Bool)

(assert (=> b!702885 (=> (not res!466855) (not e!397397))))

(assert (=> b!702885 (= res!466855 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702886 () Bool)

(declare-fun res!466860 () Bool)

(assert (=> b!702886 (=> (not res!466860) (not e!397397))))

(assert (=> b!702886 (= res!466860 (validKeyInArray!0 k0!2824))))

(declare-fun b!702887 () Bool)

(declare-fun res!466845 () Bool)

(assert (=> b!702887 (=> (not res!466845) (not e!397397))))

(assert (=> b!702887 (= res!466845 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!702888 () Bool)

(declare-fun res!466846 () Bool)

(assert (=> b!702888 (=> (not res!466846) (not e!397397))))

(assert (=> b!702888 (= res!466846 (contains!3837 newAcc!49 k0!2824))))

(declare-fun b!702889 () Bool)

(declare-fun res!466852 () Bool)

(assert (=> b!702889 (=> (not res!466852) (not e!397397))))

(assert (=> b!702889 (= res!466852 (noDuplicate!1106 acc!652))))

(declare-fun b!702890 () Bool)

(declare-fun res!466848 () Bool)

(assert (=> b!702890 (=> (not res!466848) (not e!397397))))

(assert (=> b!702890 (= res!466848 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19617 a!3591)))))

(declare-fun b!702891 () Bool)

(declare-fun res!466859 () Bool)

(assert (=> b!702891 (=> (not res!466859) (not e!397397))))

(declare-fun -!264 (List!13315 (_ BitVec 64)) List!13315)

(assert (=> b!702891 (= res!466859 (= (-!264 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62468 res!466851) b!702889))

(assert (= (and b!702889 res!466852) b!702880))

(assert (= (and b!702880 res!466844) b!702882))

(assert (= (and b!702882 res!466861) b!702883))

(assert (= (and b!702883 res!466854) b!702879))

(assert (= (and b!702879 res!466856) b!702881))

(assert (= (and b!702881 res!466847) b!702886))

(assert (= (and b!702886 res!466860) b!702885))

(assert (= (and b!702885 res!466855) b!702874))

(assert (= (and b!702874 res!466853) b!702888))

(assert (= (and b!702888 res!466846) b!702891))

(assert (= (and b!702891 res!466859) b!702878))

(assert (= (and b!702878 res!466857) b!702875))

(assert (= (and b!702875 res!466849) b!702890))

(assert (= (and b!702890 res!466848) b!702884))

(assert (= (and b!702884 res!466850) b!702887))

(assert (= (and b!702887 res!466845) b!702877))

(assert (= (and b!702877 res!466858) b!702876))

(declare-fun m!661323 () Bool)

(assert (=> b!702888 m!661323))

(declare-fun m!661325 () Bool)

(assert (=> b!702886 m!661325))

(declare-fun m!661327 () Bool)

(assert (=> b!702889 m!661327))

(declare-fun m!661329 () Bool)

(assert (=> b!702881 m!661329))

(declare-fun m!661331 () Bool)

(assert (=> b!702882 m!661331))

(declare-fun m!661333 () Bool)

(assert (=> b!702884 m!661333))

(assert (=> b!702884 m!661333))

(declare-fun m!661335 () Bool)

(assert (=> b!702884 m!661335))

(declare-fun m!661337 () Bool)

(assert (=> b!702880 m!661337))

(declare-fun m!661339 () Bool)

(assert (=> b!702883 m!661339))

(declare-fun m!661341 () Bool)

(assert (=> b!702875 m!661341))

(declare-fun m!661343 () Bool)

(assert (=> b!702876 m!661343))

(declare-fun m!661345 () Bool)

(assert (=> b!702879 m!661345))

(declare-fun m!661347 () Bool)

(assert (=> b!702878 m!661347))

(declare-fun m!661349 () Bool)

(assert (=> b!702885 m!661349))

(declare-fun m!661351 () Bool)

(assert (=> b!702877 m!661351))

(declare-fun m!661353 () Bool)

(assert (=> b!702874 m!661353))

(declare-fun m!661355 () Bool)

(assert (=> b!702891 m!661355))

(declare-fun m!661357 () Bool)

(assert (=> start!62468 m!661357))

(check-sat (not b!702884) (not b!702885) (not b!702888) (not b!702880) (not start!62468) (not b!702876) (not b!702891) (not b!702889) (not b!702877) (not b!702874) (not b!702883) (not b!702878) (not b!702886) (not b!702882) (not b!702881) (not b!702875) (not b!702879))
(check-sat)
