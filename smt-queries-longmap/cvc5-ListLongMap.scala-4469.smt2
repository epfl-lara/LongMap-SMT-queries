; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62260 () Bool)

(assert start!62260)

(declare-fun b!696852 () Bool)

(declare-fun res!460661 () Bool)

(declare-fun e!396273 () Bool)

(assert (=> b!696852 (=> (not res!460661) (not e!396273))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39955 0))(
  ( (array!39956 (arr!19134 (Array (_ BitVec 32) (_ BitVec 64))) (size!19517 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39955)

(assert (=> b!696852 (= res!460661 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19517 a!3626))))))

(declare-fun b!696853 () Bool)

(assert (=> b!696853 (= e!396273 false)))

(declare-fun lt!317221 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13082 0))(
  ( (Nil!13079) (Cons!13078 (h!14126 (_ BitVec 64)) (t!19356 List!13082)) )
))
(declare-fun acc!681 () List!13082)

(declare-fun arrayNoDuplicates!0 (array!39955 (_ BitVec 32) List!13082) Bool)

(assert (=> b!696853 (= lt!317221 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696854 () Bool)

(declare-fun res!460674 () Bool)

(assert (=> b!696854 (=> (not res!460674) (not e!396273))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696854 (= res!460674 (validKeyInArray!0 k!2843))))

(declare-fun b!696855 () Bool)

(declare-fun e!396272 () Bool)

(declare-fun contains!3734 (List!13082 (_ BitVec 64)) Bool)

(assert (=> b!696855 (= e!396272 (contains!3734 acc!681 k!2843))))

(declare-fun b!696856 () Bool)

(declare-fun res!460675 () Bool)

(assert (=> b!696856 (=> (not res!460675) (not e!396273))))

(assert (=> b!696856 (= res!460675 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13079))))

(declare-fun res!460669 () Bool)

(assert (=> start!62260 (=> (not res!460669) (not e!396273))))

(assert (=> start!62260 (= res!460669 (and (bvslt (size!19517 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19517 a!3626))))))

(assert (=> start!62260 e!396273))

(assert (=> start!62260 true))

(declare-fun array_inv!14993 (array!39955) Bool)

(assert (=> start!62260 (array_inv!14993 a!3626)))

(declare-fun b!696857 () Bool)

(declare-fun e!396271 () Bool)

(assert (=> b!696857 (= e!396271 (contains!3734 acc!681 k!2843))))

(declare-fun b!696858 () Bool)

(declare-fun res!460673 () Bool)

(assert (=> b!696858 (=> (not res!460673) (not e!396273))))

(assert (=> b!696858 (= res!460673 (not (contains!3734 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696859 () Bool)

(declare-fun res!460672 () Bool)

(assert (=> b!696859 (=> (not res!460672) (not e!396273))))

(declare-fun e!396275 () Bool)

(assert (=> b!696859 (= res!460672 e!396275)))

(declare-fun res!460670 () Bool)

(assert (=> b!696859 (=> res!460670 e!396275)))

(assert (=> b!696859 (= res!460670 e!396271)))

(declare-fun res!460662 () Bool)

(assert (=> b!696859 (=> (not res!460662) (not e!396271))))

(assert (=> b!696859 (= res!460662 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696860 () Bool)

(declare-fun res!460659 () Bool)

(assert (=> b!696860 (=> (not res!460659) (not e!396273))))

(declare-fun noDuplicate!1008 (List!13082) Bool)

(assert (=> b!696860 (= res!460659 (noDuplicate!1008 acc!681))))

(declare-fun b!696861 () Bool)

(declare-fun e!396276 () Bool)

(assert (=> b!696861 (= e!396276 (not (contains!3734 acc!681 k!2843)))))

(declare-fun b!696862 () Bool)

(declare-fun res!460668 () Bool)

(assert (=> b!696862 (=> (not res!460668) (not e!396273))))

(assert (=> b!696862 (= res!460668 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19517 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696863 () Bool)

(declare-fun e!396269 () Bool)

(assert (=> b!696863 (= e!396269 e!396276)))

(declare-fun res!460663 () Bool)

(assert (=> b!696863 (=> (not res!460663) (not e!396276))))

(assert (=> b!696863 (= res!460663 (bvsle from!3004 i!1382))))

(declare-fun b!696864 () Bool)

(declare-fun res!460660 () Bool)

(assert (=> b!696864 (=> (not res!460660) (not e!396273))))

(assert (=> b!696864 (= res!460660 e!396269)))

(declare-fun res!460664 () Bool)

(assert (=> b!696864 (=> res!460664 e!396269)))

(assert (=> b!696864 (= res!460664 e!396272)))

(declare-fun res!460677 () Bool)

(assert (=> b!696864 (=> (not res!460677) (not e!396272))))

(assert (=> b!696864 (= res!460677 (bvsgt from!3004 i!1382))))

(declare-fun b!696865 () Bool)

(declare-fun e!396270 () Bool)

(assert (=> b!696865 (= e!396275 e!396270)))

(declare-fun res!460667 () Bool)

(assert (=> b!696865 (=> (not res!460667) (not e!396270))))

(assert (=> b!696865 (= res!460667 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696866 () Bool)

(declare-fun res!460678 () Bool)

(assert (=> b!696866 (=> (not res!460678) (not e!396273))))

(assert (=> b!696866 (= res!460678 (not (validKeyInArray!0 (select (arr!19134 a!3626) from!3004))))))

(declare-fun b!696867 () Bool)

(declare-fun res!460665 () Bool)

(assert (=> b!696867 (=> (not res!460665) (not e!396273))))

(assert (=> b!696867 (= res!460665 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696868 () Bool)

(declare-fun res!460666 () Bool)

(assert (=> b!696868 (=> (not res!460666) (not e!396273))))

(declare-fun arrayContainsKey!0 (array!39955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696868 (= res!460666 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696869 () Bool)

(declare-fun res!460676 () Bool)

(assert (=> b!696869 (=> (not res!460676) (not e!396273))))

(assert (=> b!696869 (= res!460676 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696870 () Bool)

(declare-fun res!460671 () Bool)

(assert (=> b!696870 (=> (not res!460671) (not e!396273))))

(assert (=> b!696870 (= res!460671 (not (contains!3734 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696871 () Bool)

(assert (=> b!696871 (= e!396270 (not (contains!3734 acc!681 k!2843)))))

(assert (= (and start!62260 res!460669) b!696860))

(assert (= (and b!696860 res!460659) b!696870))

(assert (= (and b!696870 res!460671) b!696858))

(assert (= (and b!696858 res!460673) b!696864))

(assert (= (and b!696864 res!460677) b!696855))

(assert (= (and b!696864 (not res!460664)) b!696863))

(assert (= (and b!696863 res!460663) b!696861))

(assert (= (and b!696864 res!460660) b!696856))

(assert (= (and b!696856 res!460675) b!696869))

(assert (= (and b!696869 res!460676) b!696852))

(assert (= (and b!696852 res!460661) b!696854))

(assert (= (and b!696854 res!460674) b!696868))

(assert (= (and b!696868 res!460666) b!696862))

(assert (= (and b!696862 res!460668) b!696866))

(assert (= (and b!696866 res!460678) b!696867))

(assert (= (and b!696867 res!460665) b!696859))

(assert (= (and b!696859 res!460662) b!696857))

(assert (= (and b!696859 (not res!460670)) b!696865))

(assert (= (and b!696865 res!460667) b!696871))

(assert (= (and b!696859 res!460672) b!696853))

(declare-fun m!658213 () Bool)

(assert (=> b!696855 m!658213))

(declare-fun m!658215 () Bool)

(assert (=> b!696854 m!658215))

(declare-fun m!658217 () Bool)

(assert (=> b!696853 m!658217))

(declare-fun m!658219 () Bool)

(assert (=> start!62260 m!658219))

(assert (=> b!696871 m!658213))

(declare-fun m!658221 () Bool)

(assert (=> b!696858 m!658221))

(declare-fun m!658223 () Bool)

(assert (=> b!696860 m!658223))

(declare-fun m!658225 () Bool)

(assert (=> b!696868 m!658225))

(declare-fun m!658227 () Bool)

(assert (=> b!696866 m!658227))

(assert (=> b!696866 m!658227))

(declare-fun m!658229 () Bool)

(assert (=> b!696866 m!658229))

(declare-fun m!658231 () Bool)

(assert (=> b!696869 m!658231))

(assert (=> b!696857 m!658213))

(declare-fun m!658233 () Bool)

(assert (=> b!696856 m!658233))

(assert (=> b!696861 m!658213))

(declare-fun m!658235 () Bool)

(assert (=> b!696870 m!658235))

(push 1)

(assert (not b!696855))

(assert (not b!696858))

(assert (not b!696857))

(assert (not b!696868))

(assert (not b!696861))

(assert (not b!696866))

(assert (not b!696853))

(assert (not b!696854))

(assert (not b!696869))

(assert (not b!696870))

(assert (not b!696871))

(assert (not b!696856))

(assert (not b!696860))

(assert (not start!62260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

