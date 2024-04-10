; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62214 () Bool)

(assert start!62214)

(declare-fun b!696988 () Bool)

(declare-fun e!396279 () Bool)

(declare-datatypes ((List!13186 0))(
  ( (Nil!13183) (Cons!13182 (h!14227 (_ BitVec 64)) (t!19468 List!13186)) )
))
(declare-fun acc!681 () List!13186)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3763 (List!13186 (_ BitVec 64)) Bool)

(assert (=> b!696988 (= e!396279 (contains!3763 acc!681 k!2843))))

(declare-fun b!696989 () Bool)

(declare-fun res!460923 () Bool)

(declare-fun e!396277 () Bool)

(assert (=> b!696989 (=> (not res!460923) (not e!396277))))

(declare-datatypes ((array!39971 0))(
  ( (array!39972 (arr!19145 (Array (_ BitVec 32) (_ BitVec 64))) (size!19530 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39971)

(declare-fun arrayNoDuplicates!0 (array!39971 (_ BitVec 32) List!13186) Bool)

(assert (=> b!696989 (= res!460923 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13183))))

(declare-fun b!696990 () Bool)

(declare-fun e!396276 () Bool)

(assert (=> b!696990 (= e!396276 (not (contains!3763 acc!681 k!2843)))))

(declare-fun b!696991 () Bool)

(declare-fun res!460918 () Bool)

(assert (=> b!696991 (=> (not res!460918) (not e!396277))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696991 (= res!460918 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696992 () Bool)

(declare-fun res!460913 () Bool)

(assert (=> b!696992 (=> (not res!460913) (not e!396277))))

(declare-fun e!396273 () Bool)

(assert (=> b!696992 (= res!460913 e!396273)))

(declare-fun res!460916 () Bool)

(assert (=> b!696992 (=> res!460916 e!396273)))

(declare-fun e!396278 () Bool)

(assert (=> b!696992 (= res!460916 e!396278)))

(declare-fun res!460911 () Bool)

(assert (=> b!696992 (=> (not res!460911) (not e!396278))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696992 (= res!460911 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696993 () Bool)

(declare-fun res!460910 () Bool)

(assert (=> b!696993 (=> (not res!460910) (not e!396277))))

(declare-fun noDuplicate!1010 (List!13186) Bool)

(assert (=> b!696993 (= res!460910 (noDuplicate!1010 acc!681))))

(declare-fun res!460907 () Bool)

(assert (=> start!62214 (=> (not res!460907) (not e!396277))))

(assert (=> start!62214 (= res!460907 (and (bvslt (size!19530 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19530 a!3626))))))

(assert (=> start!62214 e!396277))

(assert (=> start!62214 true))

(declare-fun array_inv!14941 (array!39971) Bool)

(assert (=> start!62214 (array_inv!14941 a!3626)))

(declare-fun b!696994 () Bool)

(declare-fun res!460908 () Bool)

(assert (=> b!696994 (=> (not res!460908) (not e!396277))))

(assert (=> b!696994 (= res!460908 (not (contains!3763 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696995 () Bool)

(declare-fun res!460912 () Bool)

(assert (=> b!696995 (=> (not res!460912) (not e!396277))))

(assert (=> b!696995 (= res!460912 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696996 () Bool)

(declare-fun res!460914 () Bool)

(assert (=> b!696996 (=> (not res!460914) (not e!396277))))

(declare-fun e!396274 () Bool)

(assert (=> b!696996 (= res!460914 e!396274)))

(declare-fun res!460906 () Bool)

(assert (=> b!696996 (=> res!460906 e!396274)))

(assert (=> b!696996 (= res!460906 e!396279)))

(declare-fun res!460909 () Bool)

(assert (=> b!696996 (=> (not res!460909) (not e!396279))))

(assert (=> b!696996 (= res!460909 (bvsgt from!3004 i!1382))))

(declare-fun b!696997 () Bool)

(declare-fun res!460924 () Bool)

(assert (=> b!696997 (=> (not res!460924) (not e!396277))))

(assert (=> b!696997 (= res!460924 (not (contains!3763 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696998 () Bool)

(declare-fun res!460919 () Bool)

(assert (=> b!696998 (=> (not res!460919) (not e!396277))))

(assert (=> b!696998 (= res!460919 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19530 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696999 () Bool)

(assert (=> b!696999 (= e!396278 (contains!3763 acc!681 k!2843))))

(declare-fun b!697000 () Bool)

(assert (=> b!697000 (= e!396277 false)))

(declare-fun lt!317137 () Bool)

(assert (=> b!697000 (= lt!317137 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697001 () Bool)

(declare-fun res!460915 () Bool)

(assert (=> b!697001 (=> (not res!460915) (not e!396277))))

(declare-fun arrayContainsKey!0 (array!39971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697001 (= res!460915 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697002 () Bool)

(declare-fun res!460921 () Bool)

(assert (=> b!697002 (=> (not res!460921) (not e!396277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697002 (= res!460921 (not (validKeyInArray!0 (select (arr!19145 a!3626) from!3004))))))

(declare-fun b!697003 () Bool)

(assert (=> b!697003 (= e!396274 e!396276)))

(declare-fun res!460925 () Bool)

(assert (=> b!697003 (=> (not res!460925) (not e!396276))))

(assert (=> b!697003 (= res!460925 (bvsle from!3004 i!1382))))

(declare-fun b!697004 () Bool)

(declare-fun res!460920 () Bool)

(assert (=> b!697004 (=> (not res!460920) (not e!396277))))

(assert (=> b!697004 (= res!460920 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19530 a!3626))))))

(declare-fun b!697005 () Bool)

(declare-fun e!396275 () Bool)

(assert (=> b!697005 (= e!396275 (not (contains!3763 acc!681 k!2843)))))

(declare-fun b!697006 () Bool)

(declare-fun res!460917 () Bool)

(assert (=> b!697006 (=> (not res!460917) (not e!396277))))

(assert (=> b!697006 (= res!460917 (validKeyInArray!0 k!2843))))

(declare-fun b!697007 () Bool)

(assert (=> b!697007 (= e!396273 e!396275)))

(declare-fun res!460922 () Bool)

(assert (=> b!697007 (=> (not res!460922) (not e!396275))))

(assert (=> b!697007 (= res!460922 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62214 res!460907) b!696993))

(assert (= (and b!696993 res!460910) b!696997))

(assert (= (and b!696997 res!460924) b!696994))

(assert (= (and b!696994 res!460908) b!696996))

(assert (= (and b!696996 res!460909) b!696988))

(assert (= (and b!696996 (not res!460906)) b!697003))

(assert (= (and b!697003 res!460925) b!696990))

(assert (= (and b!696996 res!460914) b!696989))

(assert (= (and b!696989 res!460923) b!696995))

(assert (= (and b!696995 res!460912) b!697004))

(assert (= (and b!697004 res!460920) b!697006))

(assert (= (and b!697006 res!460917) b!697001))

(assert (= (and b!697001 res!460915) b!696998))

(assert (= (and b!696998 res!460919) b!697002))

(assert (= (and b!697002 res!460921) b!696991))

(assert (= (and b!696991 res!460918) b!696992))

(assert (= (and b!696992 res!460911) b!696999))

(assert (= (and b!696992 (not res!460916)) b!697007))

(assert (= (and b!697007 res!460922) b!697005))

(assert (= (and b!696992 res!460913) b!697000))

(declare-fun m!657659 () Bool)

(assert (=> b!696997 m!657659))

(declare-fun m!657661 () Bool)

(assert (=> b!697001 m!657661))

(declare-fun m!657663 () Bool)

(assert (=> b!697005 m!657663))

(assert (=> b!696990 m!657663))

(assert (=> b!696988 m!657663))

(declare-fun m!657665 () Bool)

(assert (=> start!62214 m!657665))

(declare-fun m!657667 () Bool)

(assert (=> b!697006 m!657667))

(assert (=> b!696999 m!657663))

(declare-fun m!657669 () Bool)

(assert (=> b!696989 m!657669))

(declare-fun m!657671 () Bool)

(assert (=> b!696994 m!657671))

(declare-fun m!657673 () Bool)

(assert (=> b!697000 m!657673))

(declare-fun m!657675 () Bool)

(assert (=> b!696995 m!657675))

(declare-fun m!657677 () Bool)

(assert (=> b!697002 m!657677))

(assert (=> b!697002 m!657677))

(declare-fun m!657679 () Bool)

(assert (=> b!697002 m!657679))

(declare-fun m!657681 () Bool)

(assert (=> b!696993 m!657681))

(push 1)

(assert (not b!696994))

(assert (not b!697005))

(assert (not b!696993))

(assert (not b!697002))

(assert (not b!696997))

(assert (not b!697001))

(assert (not b!696995))

(assert (not b!696989))

(assert (not b!696999))

(assert (not b!697006))

(assert (not b!696990))

(assert (not b!696988))

(assert (not b!697000))

(assert (not start!62214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

