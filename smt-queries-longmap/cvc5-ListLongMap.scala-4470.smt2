; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62266 () Bool)

(assert start!62266)

(declare-fun b!697032 () Bool)

(declare-fun e!396343 () Bool)

(declare-datatypes ((List!13085 0))(
  ( (Nil!13082) (Cons!13081 (h!14129 (_ BitVec 64)) (t!19359 List!13085)) )
))
(declare-fun acc!681 () List!13085)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3737 (List!13085 (_ BitVec 64)) Bool)

(assert (=> b!697032 (= e!396343 (contains!3737 acc!681 k!2843))))

(declare-fun b!697033 () Bool)

(declare-fun res!460849 () Bool)

(declare-fun e!396342 () Bool)

(assert (=> b!697033 (=> (not res!460849) (not e!396342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697033 (= res!460849 (validKeyInArray!0 k!2843))))

(declare-fun b!697034 () Bool)

(declare-fun res!460844 () Bool)

(assert (=> b!697034 (=> (not res!460844) (not e!396342))))

(declare-datatypes ((array!39961 0))(
  ( (array!39962 (arr!19137 (Array (_ BitVec 32) (_ BitVec 64))) (size!19520 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39961)

(declare-fun arrayNoDuplicates!0 (array!39961 (_ BitVec 32) List!13085) Bool)

(assert (=> b!697034 (= res!460844 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13082))))

(declare-fun b!697035 () Bool)

(declare-fun res!460842 () Bool)

(assert (=> b!697035 (=> (not res!460842) (not e!396342))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!697035 (= res!460842 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19520 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697036 () Bool)

(declare-fun e!396346 () Bool)

(declare-fun e!396347 () Bool)

(assert (=> b!697036 (= e!396346 e!396347)))

(declare-fun res!460858 () Bool)

(assert (=> b!697036 (=> (not res!460858) (not e!396347))))

(assert (=> b!697036 (= res!460858 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697037 () Bool)

(declare-fun res!460853 () Bool)

(assert (=> b!697037 (=> (not res!460853) (not e!396342))))

(assert (=> b!697037 (= res!460853 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19520 a!3626))))))

(declare-fun b!697038 () Bool)

(assert (=> b!697038 (= e!396342 false)))

(declare-fun lt!317230 () Bool)

(assert (=> b!697038 (= lt!317230 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun res!460847 () Bool)

(assert (=> start!62266 (=> (not res!460847) (not e!396342))))

(assert (=> start!62266 (= res!460847 (and (bvslt (size!19520 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19520 a!3626))))))

(assert (=> start!62266 e!396342))

(assert (=> start!62266 true))

(declare-fun array_inv!14996 (array!39961) Bool)

(assert (=> start!62266 (array_inv!14996 a!3626)))

(declare-fun b!697039 () Bool)

(declare-fun e!396348 () Bool)

(assert (=> b!697039 (= e!396348 (not (contains!3737 acc!681 k!2843)))))

(declare-fun b!697040 () Bool)

(declare-fun res!460855 () Bool)

(assert (=> b!697040 (=> (not res!460855) (not e!396342))))

(assert (=> b!697040 (= res!460855 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697041 () Bool)

(declare-fun e!396344 () Bool)

(assert (=> b!697041 (= e!396344 (contains!3737 acc!681 k!2843))))

(declare-fun b!697042 () Bool)

(declare-fun res!460845 () Bool)

(assert (=> b!697042 (=> (not res!460845) (not e!396342))))

(declare-fun noDuplicate!1011 (List!13085) Bool)

(assert (=> b!697042 (= res!460845 (noDuplicate!1011 acc!681))))

(declare-fun b!697043 () Bool)

(declare-fun res!460848 () Bool)

(assert (=> b!697043 (=> (not res!460848) (not e!396342))))

(assert (=> b!697043 (= res!460848 (not (contains!3737 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697044 () Bool)

(declare-fun res!460851 () Bool)

(assert (=> b!697044 (=> (not res!460851) (not e!396342))))

(assert (=> b!697044 (= res!460851 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697045 () Bool)

(declare-fun res!460840 () Bool)

(assert (=> b!697045 (=> (not res!460840) (not e!396342))))

(assert (=> b!697045 (= res!460840 (not (validKeyInArray!0 (select (arr!19137 a!3626) from!3004))))))

(declare-fun b!697046 () Bool)

(assert (=> b!697046 (= e!396347 (not (contains!3737 acc!681 k!2843)))))

(declare-fun b!697047 () Bool)

(declare-fun e!396345 () Bool)

(assert (=> b!697047 (= e!396345 e!396348)))

(declare-fun res!460841 () Bool)

(assert (=> b!697047 (=> (not res!460841) (not e!396348))))

(assert (=> b!697047 (= res!460841 (bvsle from!3004 i!1382))))

(declare-fun b!697048 () Bool)

(declare-fun res!460839 () Bool)

(assert (=> b!697048 (=> (not res!460839) (not e!396342))))

(assert (=> b!697048 (= res!460839 e!396346)))

(declare-fun res!460852 () Bool)

(assert (=> b!697048 (=> res!460852 e!396346)))

(assert (=> b!697048 (= res!460852 e!396343)))

(declare-fun res!460857 () Bool)

(assert (=> b!697048 (=> (not res!460857) (not e!396343))))

(assert (=> b!697048 (= res!460857 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697049 () Bool)

(declare-fun res!460850 () Bool)

(assert (=> b!697049 (=> (not res!460850) (not e!396342))))

(assert (=> b!697049 (= res!460850 e!396345)))

(declare-fun res!460843 () Bool)

(assert (=> b!697049 (=> res!460843 e!396345)))

(assert (=> b!697049 (= res!460843 e!396344)))

(declare-fun res!460846 () Bool)

(assert (=> b!697049 (=> (not res!460846) (not e!396344))))

(assert (=> b!697049 (= res!460846 (bvsgt from!3004 i!1382))))

(declare-fun b!697050 () Bool)

(declare-fun res!460856 () Bool)

(assert (=> b!697050 (=> (not res!460856) (not e!396342))))

(declare-fun arrayContainsKey!0 (array!39961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697050 (= res!460856 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697051 () Bool)

(declare-fun res!460854 () Bool)

(assert (=> b!697051 (=> (not res!460854) (not e!396342))))

(assert (=> b!697051 (= res!460854 (not (contains!3737 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62266 res!460847) b!697042))

(assert (= (and b!697042 res!460845) b!697051))

(assert (= (and b!697051 res!460854) b!697043))

(assert (= (and b!697043 res!460848) b!697049))

(assert (= (and b!697049 res!460846) b!697041))

(assert (= (and b!697049 (not res!460843)) b!697047))

(assert (= (and b!697047 res!460841) b!697039))

(assert (= (and b!697049 res!460850) b!697034))

(assert (= (and b!697034 res!460844) b!697040))

(assert (= (and b!697040 res!460855) b!697037))

(assert (= (and b!697037 res!460853) b!697033))

(assert (= (and b!697033 res!460849) b!697050))

(assert (= (and b!697050 res!460856) b!697035))

(assert (= (and b!697035 res!460842) b!697045))

(assert (= (and b!697045 res!460840) b!697044))

(assert (= (and b!697044 res!460851) b!697048))

(assert (= (and b!697048 res!460857) b!697032))

(assert (= (and b!697048 (not res!460852)) b!697036))

(assert (= (and b!697036 res!460858) b!697046))

(assert (= (and b!697048 res!460839) b!697038))

(declare-fun m!658285 () Bool)

(assert (=> b!697034 m!658285))

(declare-fun m!658287 () Bool)

(assert (=> b!697050 m!658287))

(declare-fun m!658289 () Bool)

(assert (=> b!697038 m!658289))

(declare-fun m!658291 () Bool)

(assert (=> b!697042 m!658291))

(declare-fun m!658293 () Bool)

(assert (=> b!697046 m!658293))

(declare-fun m!658295 () Bool)

(assert (=> b!697045 m!658295))

(assert (=> b!697045 m!658295))

(declare-fun m!658297 () Bool)

(assert (=> b!697045 m!658297))

(declare-fun m!658299 () Bool)

(assert (=> b!697043 m!658299))

(assert (=> b!697041 m!658293))

(assert (=> b!697039 m!658293))

(assert (=> b!697032 m!658293))

(declare-fun m!658301 () Bool)

(assert (=> b!697051 m!658301))

(declare-fun m!658303 () Bool)

(assert (=> start!62266 m!658303))

(declare-fun m!658305 () Bool)

(assert (=> b!697040 m!658305))

(declare-fun m!658307 () Bool)

(assert (=> b!697033 m!658307))

(push 1)

(assert (not b!697039))

(assert (not b!697050))

(assert (not b!697045))

(assert (not b!697041))

(assert (not start!62266))

(assert (not b!697033))

(assert (not b!697034))

(assert (not b!697032))

(assert (not b!697040))

(assert (not b!697046))

(assert (not b!697038))

(assert (not b!697043))

(assert (not b!697051))

(assert (not b!697042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

