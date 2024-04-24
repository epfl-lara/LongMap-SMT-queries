; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59766 () Bool)

(assert start!59766)

(declare-fun b!659984 () Bool)

(declare-fun res!427944 () Bool)

(declare-fun e!379216 () Bool)

(assert (=> b!659984 (=> (not res!427944) (not e!379216))))

(declare-datatypes ((array!38781 0))(
  ( (array!38782 (arr!18583 (Array (_ BitVec 32) (_ BitVec 64))) (size!18947 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38781)

(assert (=> b!659984 (= res!427944 (bvsle #b00000000000000000000000000000000 (size!18947 a!3626)))))

(declare-fun b!659985 () Bool)

(declare-fun e!379218 () Bool)

(declare-datatypes ((List!12531 0))(
  ( (Nil!12528) (Cons!12527 (h!13575 (_ BitVec 64)) (t!18751 List!12531)) )
))
(declare-fun acc!681 () List!12531)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3183 (List!12531 (_ BitVec 64)) Bool)

(assert (=> b!659985 (= e!379218 (contains!3183 acc!681 k0!2843))))

(declare-fun b!659986 () Bool)

(declare-fun e!379214 () Bool)

(declare-fun e!379217 () Bool)

(assert (=> b!659986 (= e!379214 e!379217)))

(declare-fun res!427945 () Bool)

(assert (=> b!659986 (=> (not res!427945) (not e!379217))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659986 (= res!427945 (bvsle from!3004 i!1382))))

(declare-fun b!659987 () Bool)

(declare-fun res!427937 () Bool)

(assert (=> b!659987 (=> (not res!427937) (not e!379216))))

(assert (=> b!659987 (= res!427937 (not (contains!3183 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659988 () Bool)

(declare-fun res!427940 () Bool)

(assert (=> b!659988 (=> (not res!427940) (not e!379216))))

(assert (=> b!659988 (= res!427940 (not (contains!3183 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659990 () Bool)

(assert (=> b!659990 (= e!379217 (not (contains!3183 acc!681 k0!2843)))))

(declare-fun b!659991 () Bool)

(declare-fun res!427943 () Bool)

(assert (=> b!659991 (=> (not res!427943) (not e!379216))))

(declare-fun noDuplicate!457 (List!12531) Bool)

(assert (=> b!659991 (= res!427943 (noDuplicate!457 acc!681))))

(declare-fun b!659992 () Bool)

(assert (=> b!659992 (= e!379216 (not (noDuplicate!457 Nil!12528)))))

(declare-fun b!659989 () Bool)

(declare-fun res!427939 () Bool)

(assert (=> b!659989 (=> (not res!427939) (not e!379216))))

(assert (=> b!659989 (= res!427939 e!379214)))

(declare-fun res!427941 () Bool)

(assert (=> b!659989 (=> res!427941 e!379214)))

(assert (=> b!659989 (= res!427941 e!379218)))

(declare-fun res!427942 () Bool)

(assert (=> b!659989 (=> (not res!427942) (not e!379218))))

(assert (=> b!659989 (= res!427942 (bvsgt from!3004 i!1382))))

(declare-fun res!427938 () Bool)

(assert (=> start!59766 (=> (not res!427938) (not e!379216))))

(assert (=> start!59766 (= res!427938 (and (bvslt (size!18947 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18947 a!3626))))))

(assert (=> start!59766 e!379216))

(assert (=> start!59766 true))

(declare-fun array_inv!14442 (array!38781) Bool)

(assert (=> start!59766 (array_inv!14442 a!3626)))

(assert (= (and start!59766 res!427938) b!659991))

(assert (= (and b!659991 res!427943) b!659987))

(assert (= (and b!659987 res!427937) b!659988))

(assert (= (and b!659988 res!427940) b!659989))

(assert (= (and b!659989 res!427942) b!659985))

(assert (= (and b!659989 (not res!427941)) b!659986))

(assert (= (and b!659986 res!427945) b!659990))

(assert (= (and b!659989 res!427939) b!659984))

(assert (= (and b!659984 res!427944) b!659992))

(declare-fun m!633385 () Bool)

(assert (=> b!659990 m!633385))

(assert (=> b!659985 m!633385))

(declare-fun m!633387 () Bool)

(assert (=> b!659987 m!633387))

(declare-fun m!633389 () Bool)

(assert (=> b!659988 m!633389))

(declare-fun m!633391 () Bool)

(assert (=> b!659991 m!633391))

(declare-fun m!633393 () Bool)

(assert (=> b!659992 m!633393))

(declare-fun m!633395 () Bool)

(assert (=> start!59766 m!633395))

(check-sat (not b!659987) (not b!659990) (not b!659991) (not b!659988) (not b!659985) (not start!59766) (not b!659992))
(check-sat)
(get-model)

(declare-fun d!93247 () Bool)

(declare-fun res!428004 () Bool)

(declare-fun e!379253 () Bool)

(assert (=> d!93247 (=> res!428004 e!379253)))

(get-info :version)

(assert (=> d!93247 (= res!428004 ((_ is Nil!12528) acc!681))))

(assert (=> d!93247 (= (noDuplicate!457 acc!681) e!379253)))

(declare-fun b!660051 () Bool)

(declare-fun e!379254 () Bool)

(assert (=> b!660051 (= e!379253 e!379254)))

(declare-fun res!428005 () Bool)

(assert (=> b!660051 (=> (not res!428005) (not e!379254))))

(assert (=> b!660051 (= res!428005 (not (contains!3183 (t!18751 acc!681) (h!13575 acc!681))))))

(declare-fun b!660052 () Bool)

(assert (=> b!660052 (= e!379254 (noDuplicate!457 (t!18751 acc!681)))))

(assert (= (and d!93247 (not res!428004)) b!660051))

(assert (= (and b!660051 res!428005) b!660052))

(declare-fun m!633421 () Bool)

(assert (=> b!660051 m!633421))

(declare-fun m!633423 () Bool)

(assert (=> b!660052 m!633423))

(assert (=> b!659991 d!93247))

(declare-fun d!93249 () Bool)

(declare-fun lt!308815 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!256 (List!12531) (InoxSet (_ BitVec 64)))

(assert (=> d!93249 (= lt!308815 (select (content!256 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379260 () Bool)

(assert (=> d!93249 (= lt!308815 e!379260)))

(declare-fun res!428011 () Bool)

(assert (=> d!93249 (=> (not res!428011) (not e!379260))))

(assert (=> d!93249 (= res!428011 ((_ is Cons!12527) acc!681))))

(assert (=> d!93249 (= (contains!3183 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308815)))

(declare-fun b!660057 () Bool)

(declare-fun e!379259 () Bool)

(assert (=> b!660057 (= e!379260 e!379259)))

(declare-fun res!428010 () Bool)

(assert (=> b!660057 (=> res!428010 e!379259)))

(assert (=> b!660057 (= res!428010 (= (h!13575 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660058 () Bool)

(assert (=> b!660058 (= e!379259 (contains!3183 (t!18751 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93249 res!428011) b!660057))

(assert (= (and b!660057 (not res!428010)) b!660058))

(declare-fun m!633425 () Bool)

(assert (=> d!93249 m!633425))

(declare-fun m!633427 () Bool)

(assert (=> d!93249 m!633427))

(declare-fun m!633429 () Bool)

(assert (=> b!660058 m!633429))

(assert (=> b!659987 d!93249))

(declare-fun d!93251 () Bool)

(assert (=> d!93251 (= (array_inv!14442 a!3626) (bvsge (size!18947 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59766 d!93251))

(declare-fun d!93253 () Bool)

(declare-fun res!428012 () Bool)

(declare-fun e!379261 () Bool)

(assert (=> d!93253 (=> res!428012 e!379261)))

(assert (=> d!93253 (= res!428012 ((_ is Nil!12528) Nil!12528))))

(assert (=> d!93253 (= (noDuplicate!457 Nil!12528) e!379261)))

(declare-fun b!660059 () Bool)

(declare-fun e!379262 () Bool)

(assert (=> b!660059 (= e!379261 e!379262)))

(declare-fun res!428013 () Bool)

(assert (=> b!660059 (=> (not res!428013) (not e!379262))))

(assert (=> b!660059 (= res!428013 (not (contains!3183 (t!18751 Nil!12528) (h!13575 Nil!12528))))))

(declare-fun b!660060 () Bool)

(assert (=> b!660060 (= e!379262 (noDuplicate!457 (t!18751 Nil!12528)))))

(assert (= (and d!93253 (not res!428012)) b!660059))

(assert (= (and b!660059 res!428013) b!660060))

(declare-fun m!633431 () Bool)

(assert (=> b!660059 m!633431))

(declare-fun m!633433 () Bool)

(assert (=> b!660060 m!633433))

(assert (=> b!659992 d!93253))

(declare-fun d!93257 () Bool)

(declare-fun lt!308816 () Bool)

(assert (=> d!93257 (= lt!308816 (select (content!256 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379264 () Bool)

(assert (=> d!93257 (= lt!308816 e!379264)))

(declare-fun res!428015 () Bool)

(assert (=> d!93257 (=> (not res!428015) (not e!379264))))

(assert (=> d!93257 (= res!428015 ((_ is Cons!12527) acc!681))))

(assert (=> d!93257 (= (contains!3183 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308816)))

(declare-fun b!660061 () Bool)

(declare-fun e!379263 () Bool)

(assert (=> b!660061 (= e!379264 e!379263)))

(declare-fun res!428014 () Bool)

(assert (=> b!660061 (=> res!428014 e!379263)))

(assert (=> b!660061 (= res!428014 (= (h!13575 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660062 () Bool)

(assert (=> b!660062 (= e!379263 (contains!3183 (t!18751 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93257 res!428015) b!660061))

(assert (= (and b!660061 (not res!428014)) b!660062))

(assert (=> d!93257 m!633425))

(declare-fun m!633435 () Bool)

(assert (=> d!93257 m!633435))

(declare-fun m!633437 () Bool)

(assert (=> b!660062 m!633437))

(assert (=> b!659988 d!93257))

(declare-fun d!93259 () Bool)

(declare-fun lt!308817 () Bool)

(assert (=> d!93259 (= lt!308817 (select (content!256 acc!681) k0!2843))))

(declare-fun e!379266 () Bool)

(assert (=> d!93259 (= lt!308817 e!379266)))

(declare-fun res!428017 () Bool)

(assert (=> d!93259 (=> (not res!428017) (not e!379266))))

(assert (=> d!93259 (= res!428017 ((_ is Cons!12527) acc!681))))

(assert (=> d!93259 (= (contains!3183 acc!681 k0!2843) lt!308817)))

(declare-fun b!660063 () Bool)

(declare-fun e!379265 () Bool)

(assert (=> b!660063 (= e!379266 e!379265)))

(declare-fun res!428016 () Bool)

(assert (=> b!660063 (=> res!428016 e!379265)))

(assert (=> b!660063 (= res!428016 (= (h!13575 acc!681) k0!2843))))

(declare-fun b!660064 () Bool)

(assert (=> b!660064 (= e!379265 (contains!3183 (t!18751 acc!681) k0!2843))))

(assert (= (and d!93259 res!428017) b!660063))

(assert (= (and b!660063 (not res!428016)) b!660064))

(assert (=> d!93259 m!633425))

(declare-fun m!633439 () Bool)

(assert (=> d!93259 m!633439))

(declare-fun m!633441 () Bool)

(assert (=> b!660064 m!633441))

(assert (=> b!659985 d!93259))

(assert (=> b!659990 d!93259))

(check-sat (not b!660051) (not b!660062) (not b!660060) (not d!93257) (not b!660052) (not b!660058) (not b!660064) (not d!93249) (not b!660059) (not d!93259))
(check-sat)
