; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60330 () Bool)

(assert start!60330)

(declare-fun b!677769 () Bool)

(declare-fun e!386308 () Bool)

(declare-fun e!386309 () Bool)

(assert (=> b!677769 (= e!386308 e!386309)))

(declare-fun res!444204 () Bool)

(assert (=> b!677769 (=> (not res!444204) (not e!386309))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677769 (= res!444204 (bvsle from!3004 i!1382))))

(declare-fun b!677770 () Bool)

(declare-fun res!444199 () Bool)

(declare-fun e!386307 () Bool)

(assert (=> b!677770 (=> (not res!444199) (not e!386307))))

(declare-datatypes ((array!39377 0))(
  ( (array!39378 (arr!18881 (Array (_ BitVec 32) (_ BitVec 64))) (size!19245 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39377)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677770 (= res!444199 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677771 () Bool)

(declare-fun res!444206 () Bool)

(assert (=> b!677771 (=> (not res!444206) (not e!386307))))

(declare-fun e!386306 () Bool)

(assert (=> b!677771 (= res!444206 e!386306)))

(declare-fun res!444211 () Bool)

(assert (=> b!677771 (=> res!444211 e!386306)))

(declare-fun e!386310 () Bool)

(assert (=> b!677771 (= res!444211 e!386310)))

(declare-fun res!444214 () Bool)

(assert (=> b!677771 (=> (not res!444214) (not e!386310))))

(assert (=> b!677771 (= res!444214 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677773 () Bool)

(declare-fun res!444208 () Bool)

(assert (=> b!677773 (=> (not res!444208) (not e!386307))))

(declare-datatypes ((List!12922 0))(
  ( (Nil!12919) (Cons!12918 (h!13963 (_ BitVec 64)) (t!19150 List!12922)) )
))
(declare-fun acc!681 () List!12922)

(declare-fun arrayNoDuplicates!0 (array!39377 (_ BitVec 32) List!12922) Bool)

(assert (=> b!677773 (= res!444208 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677774 () Bool)

(declare-fun res!444212 () Bool)

(assert (=> b!677774 (=> (not res!444212) (not e!386307))))

(assert (=> b!677774 (= res!444212 e!386308)))

(declare-fun res!444207 () Bool)

(assert (=> b!677774 (=> res!444207 e!386308)))

(declare-fun e!386304 () Bool)

(assert (=> b!677774 (= res!444207 e!386304)))

(declare-fun res!444209 () Bool)

(assert (=> b!677774 (=> (not res!444209) (not e!386304))))

(assert (=> b!677774 (= res!444209 (bvsgt from!3004 i!1382))))

(declare-fun b!677775 () Bool)

(assert (=> b!677775 (= e!386307 (not true))))

(assert (=> b!677775 (arrayNoDuplicates!0 (array!39378 (store (arr!18881 a!3626) i!1382 k!2843) (size!19245 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23782 0))(
  ( (Unit!23783) )
))
(declare-fun lt!312841 () Unit!23782)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12922) Unit!23782)

(assert (=> b!677775 (= lt!312841 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677776 () Bool)

(declare-fun contains!3499 (List!12922 (_ BitVec 64)) Bool)

(assert (=> b!677776 (= e!386304 (contains!3499 acc!681 k!2843))))

(declare-fun b!677777 () Bool)

(assert (=> b!677777 (= e!386310 (contains!3499 acc!681 k!2843))))

(declare-fun b!677778 () Bool)

(declare-fun res!444205 () Bool)

(assert (=> b!677778 (=> (not res!444205) (not e!386307))))

(assert (=> b!677778 (= res!444205 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677779 () Bool)

(declare-fun e!386305 () Bool)

(assert (=> b!677779 (= e!386306 e!386305)))

(declare-fun res!444198 () Bool)

(assert (=> b!677779 (=> (not res!444198) (not e!386305))))

(assert (=> b!677779 (= res!444198 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677780 () Bool)

(assert (=> b!677780 (= e!386305 (not (contains!3499 acc!681 k!2843)))))

(declare-fun b!677781 () Bool)

(declare-fun res!444210 () Bool)

(assert (=> b!677781 (=> (not res!444210) (not e!386307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677781 (= res!444210 (validKeyInArray!0 k!2843))))

(declare-fun b!677782 () Bool)

(declare-fun res!444200 () Bool)

(assert (=> b!677782 (=> (not res!444200) (not e!386307))))

(assert (=> b!677782 (= res!444200 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19245 a!3626))))))

(declare-fun b!677783 () Bool)

(declare-fun res!444201 () Bool)

(assert (=> b!677783 (=> (not res!444201) (not e!386307))))

(assert (=> b!677783 (= res!444201 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19245 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677784 () Bool)

(declare-fun res!444215 () Bool)

(assert (=> b!677784 (=> (not res!444215) (not e!386307))))

(assert (=> b!677784 (= res!444215 (not (contains!3499 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677785 () Bool)

(declare-fun res!444195 () Bool)

(assert (=> b!677785 (=> (not res!444195) (not e!386307))))

(assert (=> b!677785 (= res!444195 (not (validKeyInArray!0 (select (arr!18881 a!3626) from!3004))))))

(declare-fun b!677786 () Bool)

(declare-fun res!444203 () Bool)

(assert (=> b!677786 (=> (not res!444203) (not e!386307))))

(assert (=> b!677786 (= res!444203 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12919))))

(declare-fun b!677787 () Bool)

(declare-fun res!444196 () Bool)

(assert (=> b!677787 (=> (not res!444196) (not e!386307))))

(declare-fun noDuplicate!746 (List!12922) Bool)

(assert (=> b!677787 (= res!444196 (noDuplicate!746 acc!681))))

(declare-fun b!677772 () Bool)

(declare-fun res!444202 () Bool)

(assert (=> b!677772 (=> (not res!444202) (not e!386307))))

(assert (=> b!677772 (= res!444202 (not (contains!3499 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444197 () Bool)

(assert (=> start!60330 (=> (not res!444197) (not e!386307))))

(assert (=> start!60330 (= res!444197 (and (bvslt (size!19245 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19245 a!3626))))))

(assert (=> start!60330 e!386307))

(assert (=> start!60330 true))

(declare-fun array_inv!14677 (array!39377) Bool)

(assert (=> start!60330 (array_inv!14677 a!3626)))

(declare-fun b!677788 () Bool)

(declare-fun res!444213 () Bool)

(assert (=> b!677788 (=> (not res!444213) (not e!386307))))

(assert (=> b!677788 (= res!444213 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677789 () Bool)

(assert (=> b!677789 (= e!386309 (not (contains!3499 acc!681 k!2843)))))

(assert (= (and start!60330 res!444197) b!677787))

(assert (= (and b!677787 res!444196) b!677784))

(assert (= (and b!677784 res!444215) b!677772))

(assert (= (and b!677772 res!444202) b!677774))

(assert (= (and b!677774 res!444209) b!677776))

(assert (= (and b!677774 (not res!444207)) b!677769))

(assert (= (and b!677769 res!444204) b!677789))

(assert (= (and b!677774 res!444212) b!677786))

(assert (= (and b!677786 res!444203) b!677778))

(assert (= (and b!677778 res!444205) b!677782))

(assert (= (and b!677782 res!444200) b!677781))

(assert (= (and b!677781 res!444210) b!677770))

(assert (= (and b!677770 res!444199) b!677783))

(assert (= (and b!677783 res!444201) b!677785))

(assert (= (and b!677785 res!444195) b!677788))

(assert (= (and b!677788 res!444213) b!677771))

(assert (= (and b!677771 res!444214) b!677777))

(assert (= (and b!677771 (not res!444211)) b!677779))

(assert (= (and b!677779 res!444198) b!677780))

(assert (= (and b!677771 res!444206) b!677773))

(assert (= (and b!677773 res!444208) b!677775))

(declare-fun m!643877 () Bool)

(assert (=> b!677775 m!643877))

(declare-fun m!643879 () Bool)

(assert (=> b!677775 m!643879))

(declare-fun m!643881 () Bool)

(assert (=> b!677775 m!643881))

(declare-fun m!643883 () Bool)

(assert (=> b!677786 m!643883))

(declare-fun m!643885 () Bool)

(assert (=> b!677785 m!643885))

(assert (=> b!677785 m!643885))

(declare-fun m!643887 () Bool)

(assert (=> b!677785 m!643887))

(declare-fun m!643889 () Bool)

(assert (=> b!677789 m!643889))

(declare-fun m!643891 () Bool)

(assert (=> b!677784 m!643891))

(declare-fun m!643893 () Bool)

(assert (=> start!60330 m!643893))

(assert (=> b!677776 m!643889))

(declare-fun m!643895 () Bool)

(assert (=> b!677787 m!643895))

(declare-fun m!643897 () Bool)

(assert (=> b!677781 m!643897))

(assert (=> b!677777 m!643889))

(declare-fun m!643899 () Bool)

(assert (=> b!677773 m!643899))

(declare-fun m!643901 () Bool)

(assert (=> b!677772 m!643901))

(assert (=> b!677780 m!643889))

(declare-fun m!643903 () Bool)

(assert (=> b!677770 m!643903))

(declare-fun m!643905 () Bool)

(assert (=> b!677778 m!643905))

(push 1)

(assert (not b!677773))

(assert (not b!677781))

(assert (not b!677777))

(assert (not b!677772))

(assert (not b!677780))

(assert (not b!677776))

(assert (not b!677786))

(assert (not b!677770))

(assert (not b!677784))

(assert (not b!677787))

(assert (not b!677775))

(assert (not b!677785))

(assert (not start!60330))

(assert (not b!677789))

