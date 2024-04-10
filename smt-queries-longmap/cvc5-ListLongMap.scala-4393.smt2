; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60422 () Bool)

(assert start!60422)

(declare-fun b!678913 () Bool)

(declare-fun res!445303 () Bool)

(declare-fun e!386857 () Bool)

(assert (=> b!678913 (=> (not res!445303) (not e!386857))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678913 (= res!445303 (validKeyInArray!0 k!2843))))

(declare-fun b!678914 () Bool)

(assert (=> b!678914 (= e!386857 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39436 0))(
  ( (array!39437 (arr!18909 (Array (_ BitVec 32) (_ BitVec 64))) (size!19273 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39436)

(declare-fun arrayContainsKey!0 (array!39436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678914 (arrayContainsKey!0 (array!39437 (store (arr!18909 a!3626) i!1382 k!2843) (size!19273 a!3626)) k!2843 from!3004)))

(declare-fun b!678915 () Bool)

(declare-fun res!445300 () Bool)

(assert (=> b!678915 (=> (not res!445300) (not e!386857))))

(assert (=> b!678915 (= res!445300 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19273 a!3626))))))

(declare-fun b!678916 () Bool)

(declare-fun res!445299 () Bool)

(assert (=> b!678916 (=> (not res!445299) (not e!386857))))

(assert (=> b!678916 (= res!445299 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19273 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678917 () Bool)

(declare-fun e!386856 () Bool)

(declare-datatypes ((List!12950 0))(
  ( (Nil!12947) (Cons!12946 (h!13991 (_ BitVec 64)) (t!19178 List!12950)) )
))
(declare-fun acc!681 () List!12950)

(declare-fun contains!3527 (List!12950 (_ BitVec 64)) Bool)

(assert (=> b!678917 (= e!386856 (contains!3527 acc!681 k!2843))))

(declare-fun b!678918 () Bool)

(declare-fun res!445298 () Bool)

(assert (=> b!678918 (=> (not res!445298) (not e!386857))))

(declare-fun arrayNoDuplicates!0 (array!39436 (_ BitVec 32) List!12950) Bool)

(assert (=> b!678918 (= res!445298 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678920 () Bool)

(declare-fun res!445310 () Bool)

(assert (=> b!678920 (=> (not res!445310) (not e!386857))))

(assert (=> b!678920 (= res!445310 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678921 () Bool)

(declare-fun e!386855 () Bool)

(assert (=> b!678921 (= e!386855 (not (contains!3527 acc!681 k!2843)))))

(declare-fun b!678922 () Bool)

(declare-fun res!445304 () Bool)

(assert (=> b!678922 (=> (not res!445304) (not e!386857))))

(declare-fun e!386859 () Bool)

(assert (=> b!678922 (= res!445304 e!386859)))

(declare-fun res!445307 () Bool)

(assert (=> b!678922 (=> res!445307 e!386859)))

(assert (=> b!678922 (= res!445307 e!386856)))

(declare-fun res!445302 () Bool)

(assert (=> b!678922 (=> (not res!445302) (not e!386856))))

(assert (=> b!678922 (= res!445302 (bvsgt from!3004 i!1382))))

(declare-fun b!678923 () Bool)

(declare-fun res!445306 () Bool)

(assert (=> b!678923 (=> (not res!445306) (not e!386857))))

(assert (=> b!678923 (= res!445306 (not (contains!3527 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678924 () Bool)

(declare-fun res!445301 () Bool)

(assert (=> b!678924 (=> (not res!445301) (not e!386857))))

(assert (=> b!678924 (= res!445301 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12947))))

(declare-fun b!678925 () Bool)

(assert (=> b!678925 (= e!386859 e!386855)))

(declare-fun res!445305 () Bool)

(assert (=> b!678925 (=> (not res!445305) (not e!386855))))

(assert (=> b!678925 (= res!445305 (bvsle from!3004 i!1382))))

(declare-fun b!678926 () Bool)

(declare-fun res!445308 () Bool)

(assert (=> b!678926 (=> (not res!445308) (not e!386857))))

(assert (=> b!678926 (= res!445308 (not (contains!3527 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678919 () Bool)

(declare-fun res!445309 () Bool)

(assert (=> b!678919 (=> (not res!445309) (not e!386857))))

(declare-fun noDuplicate!774 (List!12950) Bool)

(assert (=> b!678919 (= res!445309 (noDuplicate!774 acc!681))))

(declare-fun res!445297 () Bool)

(assert (=> start!60422 (=> (not res!445297) (not e!386857))))

(assert (=> start!60422 (= res!445297 (and (bvslt (size!19273 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19273 a!3626))))))

(assert (=> start!60422 e!386857))

(assert (=> start!60422 true))

(declare-fun array_inv!14705 (array!39436) Bool)

(assert (=> start!60422 (array_inv!14705 a!3626)))

(assert (= (and start!60422 res!445297) b!678919))

(assert (= (and b!678919 res!445309) b!678923))

(assert (= (and b!678923 res!445306) b!678926))

(assert (= (and b!678926 res!445308) b!678922))

(assert (= (and b!678922 res!445302) b!678917))

(assert (= (and b!678922 (not res!445307)) b!678925))

(assert (= (and b!678925 res!445305) b!678921))

(assert (= (and b!678922 res!445304) b!678924))

(assert (= (and b!678924 res!445301) b!678918))

(assert (= (and b!678918 res!445298) b!678915))

(assert (= (and b!678915 res!445300) b!678913))

(assert (= (and b!678913 res!445303) b!678920))

(assert (= (and b!678920 res!445310) b!678916))

(assert (= (and b!678916 res!445299) b!678914))

(declare-fun m!644513 () Bool)

(assert (=> b!678917 m!644513))

(declare-fun m!644515 () Bool)

(assert (=> b!678919 m!644515))

(declare-fun m!644517 () Bool)

(assert (=> b!678926 m!644517))

(declare-fun m!644519 () Bool)

(assert (=> b!678914 m!644519))

(declare-fun m!644521 () Bool)

(assert (=> b!678914 m!644521))

(assert (=> b!678921 m!644513))

(declare-fun m!644523 () Bool)

(assert (=> b!678923 m!644523))

(declare-fun m!644525 () Bool)

(assert (=> b!678913 m!644525))

(declare-fun m!644527 () Bool)

(assert (=> b!678920 m!644527))

(declare-fun m!644529 () Bool)

(assert (=> b!678924 m!644529))

(declare-fun m!644531 () Bool)

(assert (=> b!678918 m!644531))

(declare-fun m!644533 () Bool)

(assert (=> start!60422 m!644533))

(push 1)

(assert (not b!678914))

(assert (not b!678913))

(assert (not b!678924))

(assert (not b!678923))

(assert (not b!678921))

(assert (not b!678918))

(assert (not b!678917))

(assert (not b!678926))

(assert (not b!678920))

(assert (not b!678919))

(assert (not start!60422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

