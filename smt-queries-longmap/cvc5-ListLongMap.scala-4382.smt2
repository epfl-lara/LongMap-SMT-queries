; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60320 () Bool)

(assert start!60320)

(declare-fun b!677454 () Bool)

(declare-fun res!443880 () Bool)

(declare-fun e!386186 () Bool)

(assert (=> b!677454 (=> (not res!443880) (not e!386186))))

(declare-datatypes ((array!39367 0))(
  ( (array!39368 (arr!18876 (Array (_ BitVec 32) (_ BitVec 64))) (size!19240 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39367)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12917 0))(
  ( (Nil!12914) (Cons!12913 (h!13958 (_ BitVec 64)) (t!19145 List!12917)) )
))
(declare-fun acc!681 () List!12917)

(declare-fun arrayNoDuplicates!0 (array!39367 (_ BitVec 32) List!12917) Bool)

(assert (=> b!677454 (= res!443880 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677455 () Bool)

(declare-fun e!386190 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3494 (List!12917 (_ BitVec 64)) Bool)

(assert (=> b!677455 (= e!386190 (not (contains!3494 acc!681 k!2843)))))

(declare-fun b!677456 () Bool)

(declare-fun e!386189 () Bool)

(assert (=> b!677456 (= e!386189 (contains!3494 acc!681 k!2843))))

(declare-fun b!677457 () Bool)

(declare-fun res!443889 () Bool)

(assert (=> b!677457 (=> (not res!443889) (not e!386186))))

(assert (=> b!677457 (= res!443889 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677458 () Bool)

(declare-fun res!443881 () Bool)

(assert (=> b!677458 (=> (not res!443881) (not e!386186))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677458 (= res!443881 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19240 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677459 () Bool)

(declare-fun res!443891 () Bool)

(assert (=> b!677459 (=> (not res!443891) (not e!386186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677459 (= res!443891 (validKeyInArray!0 k!2843))))

(declare-fun b!677460 () Bool)

(declare-fun res!443900 () Bool)

(assert (=> b!677460 (=> (not res!443900) (not e!386186))))

(declare-fun arrayContainsKey!0 (array!39367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677460 (= res!443900 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677461 () Bool)

(declare-fun e!386184 () Bool)

(assert (=> b!677461 (= e!386184 (not (contains!3494 acc!681 k!2843)))))

(declare-fun b!677462 () Bool)

(declare-fun e!386183 () Bool)

(assert (=> b!677462 (= e!386183 e!386190)))

(declare-fun res!443882 () Bool)

(assert (=> b!677462 (=> (not res!443882) (not e!386190))))

(assert (=> b!677462 (= res!443882 (bvsle from!3004 i!1382))))

(declare-fun b!677463 () Bool)

(assert (=> b!677463 (= e!386186 (not true))))

(assert (=> b!677463 (arrayNoDuplicates!0 (array!39368 (store (arr!18876 a!3626) i!1382 k!2843) (size!19240 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23772 0))(
  ( (Unit!23773) )
))
(declare-fun lt!312826 () Unit!23772)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12917) Unit!23772)

(assert (=> b!677463 (= lt!312826 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677464 () Bool)

(declare-fun res!443888 () Bool)

(assert (=> b!677464 (=> (not res!443888) (not e!386186))))

(declare-fun noDuplicate!741 (List!12917) Bool)

(assert (=> b!677464 (= res!443888 (noDuplicate!741 acc!681))))

(declare-fun b!677465 () Bool)

(declare-fun res!443894 () Bool)

(assert (=> b!677465 (=> (not res!443894) (not e!386186))))

(assert (=> b!677465 (= res!443894 (not (validKeyInArray!0 (select (arr!18876 a!3626) from!3004))))))

(declare-fun res!443884 () Bool)

(assert (=> start!60320 (=> (not res!443884) (not e!386186))))

(assert (=> start!60320 (= res!443884 (and (bvslt (size!19240 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19240 a!3626))))))

(assert (=> start!60320 e!386186))

(assert (=> start!60320 true))

(declare-fun array_inv!14672 (array!39367) Bool)

(assert (=> start!60320 (array_inv!14672 a!3626)))

(declare-fun b!677466 () Bool)

(declare-fun res!443899 () Bool)

(assert (=> b!677466 (=> (not res!443899) (not e!386186))))

(assert (=> b!677466 (= res!443899 (not (contains!3494 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677467 () Bool)

(declare-fun e!386188 () Bool)

(assert (=> b!677467 (= e!386188 (contains!3494 acc!681 k!2843))))

(declare-fun b!677468 () Bool)

(declare-fun res!443890 () Bool)

(assert (=> b!677468 (=> (not res!443890) (not e!386186))))

(assert (=> b!677468 (= res!443890 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12914))))

(declare-fun b!677469 () Bool)

(declare-fun res!443896 () Bool)

(assert (=> b!677469 (=> (not res!443896) (not e!386186))))

(assert (=> b!677469 (= res!443896 (not (contains!3494 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677470 () Bool)

(declare-fun res!443885 () Bool)

(assert (=> b!677470 (=> (not res!443885) (not e!386186))))

(declare-fun e!386187 () Bool)

(assert (=> b!677470 (= res!443885 e!386187)))

(declare-fun res!443887 () Bool)

(assert (=> b!677470 (=> res!443887 e!386187)))

(assert (=> b!677470 (= res!443887 e!386189)))

(declare-fun res!443898 () Bool)

(assert (=> b!677470 (=> (not res!443898) (not e!386189))))

(assert (=> b!677470 (= res!443898 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677471 () Bool)

(declare-fun res!443892 () Bool)

(assert (=> b!677471 (=> (not res!443892) (not e!386186))))

(assert (=> b!677471 (= res!443892 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677472 () Bool)

(declare-fun res!443883 () Bool)

(assert (=> b!677472 (=> (not res!443883) (not e!386186))))

(assert (=> b!677472 (= res!443883 e!386183)))

(declare-fun res!443893 () Bool)

(assert (=> b!677472 (=> res!443893 e!386183)))

(assert (=> b!677472 (= res!443893 e!386188)))

(declare-fun res!443895 () Bool)

(assert (=> b!677472 (=> (not res!443895) (not e!386188))))

(assert (=> b!677472 (= res!443895 (bvsgt from!3004 i!1382))))

(declare-fun b!677473 () Bool)

(declare-fun res!443886 () Bool)

(assert (=> b!677473 (=> (not res!443886) (not e!386186))))

(assert (=> b!677473 (= res!443886 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19240 a!3626))))))

(declare-fun b!677474 () Bool)

(assert (=> b!677474 (= e!386187 e!386184)))

(declare-fun res!443897 () Bool)

(assert (=> b!677474 (=> (not res!443897) (not e!386184))))

(assert (=> b!677474 (= res!443897 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60320 res!443884) b!677464))

(assert (= (and b!677464 res!443888) b!677469))

(assert (= (and b!677469 res!443896) b!677466))

(assert (= (and b!677466 res!443899) b!677472))

(assert (= (and b!677472 res!443895) b!677467))

(assert (= (and b!677472 (not res!443893)) b!677462))

(assert (= (and b!677462 res!443882) b!677455))

(assert (= (and b!677472 res!443883) b!677468))

(assert (= (and b!677468 res!443890) b!677471))

(assert (= (and b!677471 res!443892) b!677473))

(assert (= (and b!677473 res!443886) b!677459))

(assert (= (and b!677459 res!443891) b!677460))

(assert (= (and b!677460 res!443900) b!677458))

(assert (= (and b!677458 res!443881) b!677465))

(assert (= (and b!677465 res!443894) b!677457))

(assert (= (and b!677457 res!443889) b!677470))

(assert (= (and b!677470 res!443898) b!677456))

(assert (= (and b!677470 (not res!443887)) b!677474))

(assert (= (and b!677474 res!443897) b!677461))

(assert (= (and b!677470 res!443885) b!677454))

(assert (= (and b!677454 res!443880) b!677463))

(declare-fun m!643727 () Bool)

(assert (=> b!677465 m!643727))

(assert (=> b!677465 m!643727))

(declare-fun m!643729 () Bool)

(assert (=> b!677465 m!643729))

(declare-fun m!643731 () Bool)

(assert (=> b!677468 m!643731))

(declare-fun m!643733 () Bool)

(assert (=> b!677464 m!643733))

(declare-fun m!643735 () Bool)

(assert (=> b!677461 m!643735))

(declare-fun m!643737 () Bool)

(assert (=> b!677471 m!643737))

(assert (=> b!677455 m!643735))

(declare-fun m!643739 () Bool)

(assert (=> b!677466 m!643739))

(declare-fun m!643741 () Bool)

(assert (=> b!677454 m!643741))

(declare-fun m!643743 () Bool)

(assert (=> b!677460 m!643743))

(assert (=> b!677456 m!643735))

(declare-fun m!643745 () Bool)

(assert (=> b!677463 m!643745))

(declare-fun m!643747 () Bool)

(assert (=> b!677463 m!643747))

(declare-fun m!643749 () Bool)

(assert (=> b!677463 m!643749))

(assert (=> b!677467 m!643735))

(declare-fun m!643751 () Bool)

(assert (=> b!677459 m!643751))

(declare-fun m!643753 () Bool)

(assert (=> b!677469 m!643753))

(declare-fun m!643755 () Bool)

(assert (=> start!60320 m!643755))

(push 1)

(assert (not b!677459))

(assert (not b!677467))

(assert (not b!677456))

(assert (not b!677460))

(assert (not b!677463))

(assert (not start!60320))

(assert (not b!677471))

(assert (not b!677466))

(assert (not b!677469))

(assert (not b!677465))

(assert (not b!677468))

(assert (not b!677455))

(assert (not b!677454))

(assert (not b!677461))

(assert (not b!677464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

