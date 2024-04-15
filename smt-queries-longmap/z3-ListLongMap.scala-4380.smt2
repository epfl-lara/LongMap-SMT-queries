; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60296 () Bool)

(assert start!60296)

(declare-fun b!676780 () Bool)

(declare-fun res!443371 () Bool)

(declare-fun e!385851 () Bool)

(assert (=> b!676780 (=> (not res!443371) (not e!385851))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676780 (= res!443371 (validKeyInArray!0 k0!2843))))

(declare-fun b!676781 () Bool)

(declare-fun e!385853 () Bool)

(declare-datatypes ((List!12949 0))(
  ( (Nil!12946) (Cons!12945 (h!13990 (_ BitVec 64)) (t!19168 List!12949)) )
))
(declare-fun acc!681 () List!12949)

(declare-fun contains!3471 (List!12949 (_ BitVec 64)) Bool)

(assert (=> b!676781 (= e!385853 (contains!3471 acc!681 k0!2843))))

(declare-fun b!676782 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39354 0))(
  ( (array!39355 (arr!18869 (Array (_ BitVec 32) (_ BitVec 64))) (size!19234 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39354)

(assert (=> b!676782 (= e!385851 (not (bvsle from!3004 (size!19234 a!3626))))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39354 (_ BitVec 32) List!12949) Bool)

(assert (=> b!676782 (arrayNoDuplicates!0 (array!39355 (store (arr!18869 a!3626) i!1382 k0!2843) (size!19234 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23738 0))(
  ( (Unit!23739) )
))
(declare-fun lt!312552 () Unit!23738)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12949) Unit!23738)

(assert (=> b!676782 (= lt!312552 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676783 () Bool)

(declare-fun res!443373 () Bool)

(assert (=> b!676783 (=> (not res!443373) (not e!385851))))

(assert (=> b!676783 (= res!443373 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676784 () Bool)

(declare-fun e!385849 () Bool)

(assert (=> b!676784 (= e!385849 (contains!3471 acc!681 k0!2843))))

(declare-fun b!676785 () Bool)

(declare-fun e!385852 () Bool)

(assert (=> b!676785 (= e!385852 (not (contains!3471 acc!681 k0!2843)))))

(declare-fun b!676786 () Bool)

(declare-fun e!385850 () Bool)

(assert (=> b!676786 (= e!385850 (not (contains!3471 acc!681 k0!2843)))))

(declare-fun b!676787 () Bool)

(declare-fun res!443380 () Bool)

(assert (=> b!676787 (=> (not res!443380) (not e!385851))))

(declare-fun e!385854 () Bool)

(assert (=> b!676787 (= res!443380 e!385854)))

(declare-fun res!443383 () Bool)

(assert (=> b!676787 (=> res!443383 e!385854)))

(assert (=> b!676787 (= res!443383 e!385849)))

(declare-fun res!443384 () Bool)

(assert (=> b!676787 (=> (not res!443384) (not e!385849))))

(assert (=> b!676787 (= res!443384 (bvsgt from!3004 i!1382))))

(declare-fun b!676788 () Bool)

(declare-fun res!443382 () Bool)

(assert (=> b!676788 (=> (not res!443382) (not e!385851))))

(assert (=> b!676788 (= res!443382 (not (contains!3471 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676789 () Bool)

(declare-fun res!443377 () Bool)

(assert (=> b!676789 (=> (not res!443377) (not e!385851))))

(assert (=> b!676789 (= res!443377 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19234 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676791 () Bool)

(declare-fun res!443368 () Bool)

(assert (=> b!676791 (=> (not res!443368) (not e!385851))))

(assert (=> b!676791 (= res!443368 (not (validKeyInArray!0 (select (arr!18869 a!3626) from!3004))))))

(declare-fun b!676792 () Bool)

(declare-fun res!443376 () Bool)

(assert (=> b!676792 (=> (not res!443376) (not e!385851))))

(declare-fun arrayContainsKey!0 (array!39354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676792 (= res!443376 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676793 () Bool)

(declare-fun res!443367 () Bool)

(assert (=> b!676793 (=> (not res!443367) (not e!385851))))

(assert (=> b!676793 (= res!443367 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19234 a!3626))))))

(declare-fun b!676794 () Bool)

(declare-fun res!443369 () Bool)

(assert (=> b!676794 (=> (not res!443369) (not e!385851))))

(assert (=> b!676794 (= res!443369 (not (contains!3471 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676795 () Bool)

(declare-fun res!443379 () Bool)

(assert (=> b!676795 (=> (not res!443379) (not e!385851))))

(assert (=> b!676795 (= res!443379 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12946))))

(declare-fun b!676796 () Bool)

(assert (=> b!676796 (= e!385854 e!385852)))

(declare-fun res!443372 () Bool)

(assert (=> b!676796 (=> (not res!443372) (not e!385852))))

(assert (=> b!676796 (= res!443372 (bvsle from!3004 i!1382))))

(declare-fun b!676797 () Bool)

(declare-fun e!385855 () Bool)

(assert (=> b!676797 (= e!385855 e!385850)))

(declare-fun res!443381 () Bool)

(assert (=> b!676797 (=> (not res!443381) (not e!385850))))

(assert (=> b!676797 (= res!443381 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676798 () Bool)

(declare-fun res!443374 () Bool)

(assert (=> b!676798 (=> (not res!443374) (not e!385851))))

(assert (=> b!676798 (= res!443374 e!385855)))

(declare-fun res!443378 () Bool)

(assert (=> b!676798 (=> res!443378 e!385855)))

(assert (=> b!676798 (= res!443378 e!385853)))

(declare-fun res!443370 () Bool)

(assert (=> b!676798 (=> (not res!443370) (not e!385853))))

(assert (=> b!676798 (= res!443370 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!443385 () Bool)

(assert (=> start!60296 (=> (not res!443385) (not e!385851))))

(assert (=> start!60296 (= res!443385 (and (bvslt (size!19234 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19234 a!3626))))))

(assert (=> start!60296 e!385851))

(assert (=> start!60296 true))

(declare-fun array_inv!14752 (array!39354) Bool)

(assert (=> start!60296 (array_inv!14752 a!3626)))

(declare-fun b!676790 () Bool)

(declare-fun res!443366 () Bool)

(assert (=> b!676790 (=> (not res!443366) (not e!385851))))

(declare-fun noDuplicate!740 (List!12949) Bool)

(assert (=> b!676790 (= res!443366 (noDuplicate!740 acc!681))))

(declare-fun b!676799 () Bool)

(declare-fun res!443375 () Bool)

(assert (=> b!676799 (=> (not res!443375) (not e!385851))))

(assert (=> b!676799 (= res!443375 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676800 () Bool)

(declare-fun res!443386 () Bool)

(assert (=> b!676800 (=> (not res!443386) (not e!385851))))

(assert (=> b!676800 (= res!443386 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!60296 res!443385) b!676790))

(assert (= (and b!676790 res!443366) b!676788))

(assert (= (and b!676788 res!443382) b!676794))

(assert (= (and b!676794 res!443369) b!676787))

(assert (= (and b!676787 res!443384) b!676784))

(assert (= (and b!676787 (not res!443383)) b!676796))

(assert (= (and b!676796 res!443372) b!676785))

(assert (= (and b!676787 res!443380) b!676795))

(assert (= (and b!676795 res!443379) b!676799))

(assert (= (and b!676799 res!443375) b!676793))

(assert (= (and b!676793 res!443367) b!676780))

(assert (= (and b!676780 res!443371) b!676792))

(assert (= (and b!676792 res!443376) b!676789))

(assert (= (and b!676789 res!443377) b!676791))

(assert (= (and b!676791 res!443368) b!676783))

(assert (= (and b!676783 res!443373) b!676798))

(assert (= (and b!676798 res!443370) b!676781))

(assert (= (and b!676798 (not res!443378)) b!676797))

(assert (= (and b!676797 res!443381) b!676786))

(assert (= (and b!676798 res!443374) b!676800))

(assert (= (and b!676800 res!443386) b!676782))

(declare-fun m!642765 () Bool)

(assert (=> b!676794 m!642765))

(declare-fun m!642767 () Bool)

(assert (=> b!676800 m!642767))

(declare-fun m!642769 () Bool)

(assert (=> b!676786 m!642769))

(declare-fun m!642771 () Bool)

(assert (=> b!676788 m!642771))

(declare-fun m!642773 () Bool)

(assert (=> b!676780 m!642773))

(assert (=> b!676781 m!642769))

(declare-fun m!642775 () Bool)

(assert (=> b!676799 m!642775))

(assert (=> b!676784 m!642769))

(declare-fun m!642777 () Bool)

(assert (=> b!676791 m!642777))

(assert (=> b!676791 m!642777))

(declare-fun m!642779 () Bool)

(assert (=> b!676791 m!642779))

(declare-fun m!642781 () Bool)

(assert (=> b!676795 m!642781))

(declare-fun m!642783 () Bool)

(assert (=> b!676792 m!642783))

(declare-fun m!642785 () Bool)

(assert (=> b!676790 m!642785))

(declare-fun m!642787 () Bool)

(assert (=> start!60296 m!642787))

(assert (=> b!676785 m!642769))

(declare-fun m!642789 () Bool)

(assert (=> b!676782 m!642789))

(declare-fun m!642791 () Bool)

(assert (=> b!676782 m!642791))

(declare-fun m!642793 () Bool)

(assert (=> b!676782 m!642793))

(check-sat (not b!676800) (not b!676788) (not b!676790) (not b!676799) (not b!676792) (not start!60296) (not b!676794) (not b!676786) (not b!676795) (not b!676781) (not b!676780) (not b!676791) (not b!676785) (not b!676784) (not b!676782))
(check-sat)
