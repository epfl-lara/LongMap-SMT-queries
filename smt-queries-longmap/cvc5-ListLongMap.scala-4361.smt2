; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60194 () Bool)

(assert start!60194)

(declare-fun b!673198 () Bool)

(declare-datatypes ((Unit!23664 0))(
  ( (Unit!23665) )
))
(declare-fun e!384464 () Unit!23664)

(declare-fun Unit!23666 () Unit!23664)

(assert (=> b!673198 (= e!384464 Unit!23666)))

(declare-datatypes ((array!39241 0))(
  ( (array!39242 (arr!18813 (Array (_ BitVec 32) (_ BitVec 64))) (size!19177 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39241)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673198 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312428 () Unit!23664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39241 (_ BitVec 64) (_ BitVec 32)) Unit!23664)

(assert (=> b!673198 (= lt!312428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673198 false))

(declare-fun b!673199 () Bool)

(declare-fun res!439775 () Bool)

(declare-fun e!384465 () Bool)

(assert (=> b!673199 (=> (not res!439775) (not e!384465))))

(declare-datatypes ((List!12854 0))(
  ( (Nil!12851) (Cons!12850 (h!13895 (_ BitVec 64)) (t!19082 List!12854)) )
))
(declare-fun arrayNoDuplicates!0 (array!39241 (_ BitVec 32) List!12854) Bool)

(assert (=> b!673199 (= res!439775 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12851))))

(declare-fun b!673200 () Bool)

(declare-fun res!439780 () Bool)

(assert (=> b!673200 (=> (not res!439780) (not e!384465))))

(declare-fun acc!681 () List!12854)

(declare-fun contains!3431 (List!12854 (_ BitVec 64)) Bool)

(assert (=> b!673200 (= res!439780 (not (contains!3431 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673201 () Bool)

(declare-fun res!439769 () Bool)

(assert (=> b!673201 (=> (not res!439769) (not e!384465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673201 (= res!439769 (validKeyInArray!0 k!2843))))

(declare-fun b!673202 () Bool)

(declare-fun res!439778 () Bool)

(assert (=> b!673202 (=> (not res!439778) (not e!384465))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673202 (= res!439778 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19177 a!3626))))))

(declare-fun b!673203 () Bool)

(declare-fun e!384462 () Bool)

(declare-fun e!384468 () Bool)

(assert (=> b!673203 (= e!384462 e!384468)))

(declare-fun res!439782 () Bool)

(assert (=> b!673203 (=> (not res!439782) (not e!384468))))

(assert (=> b!673203 (= res!439782 (bvsle from!3004 i!1382))))

(declare-fun b!673204 () Bool)

(declare-fun res!439783 () Bool)

(declare-fun e!384461 () Bool)

(assert (=> b!673204 (=> (not res!439783) (not e!384461))))

(declare-fun e!384469 () Bool)

(assert (=> b!673204 (= res!439783 e!384469)))

(declare-fun res!439777 () Bool)

(assert (=> b!673204 (=> res!439777 e!384469)))

(declare-fun e!384470 () Bool)

(assert (=> b!673204 (= res!439777 e!384470)))

(declare-fun res!439779 () Bool)

(assert (=> b!673204 (=> (not res!439779) (not e!384470))))

(assert (=> b!673204 (= res!439779 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!439768 () Bool)

(assert (=> start!60194 (=> (not res!439768) (not e!384465))))

(assert (=> start!60194 (= res!439768 (and (bvslt (size!19177 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19177 a!3626))))))

(assert (=> start!60194 e!384465))

(assert (=> start!60194 true))

(declare-fun array_inv!14609 (array!39241) Bool)

(assert (=> start!60194 (array_inv!14609 a!3626)))

(declare-fun b!673205 () Bool)

(declare-fun e!384467 () Bool)

(assert (=> b!673205 (= e!384465 e!384467)))

(declare-fun res!439774 () Bool)

(assert (=> b!673205 (=> (not res!439774) (not e!384467))))

(assert (=> b!673205 (= res!439774 (not (= (select (arr!18813 a!3626) from!3004) k!2843)))))

(declare-fun lt!312430 () Unit!23664)

(assert (=> b!673205 (= lt!312430 e!384464)))

(declare-fun c!77084 () Bool)

(assert (=> b!673205 (= c!77084 (= (select (arr!18813 a!3626) from!3004) k!2843))))

(declare-fun b!673206 () Bool)

(declare-fun res!439767 () Bool)

(assert (=> b!673206 (=> (not res!439767) (not e!384465))))

(assert (=> b!673206 (= res!439767 (validKeyInArray!0 (select (arr!18813 a!3626) from!3004)))))

(declare-fun b!673207 () Bool)

(declare-fun res!439770 () Bool)

(assert (=> b!673207 (=> (not res!439770) (not e!384465))))

(assert (=> b!673207 (= res!439770 e!384462)))

(declare-fun res!439784 () Bool)

(assert (=> b!673207 (=> res!439784 e!384462)))

(declare-fun e!384466 () Bool)

(assert (=> b!673207 (= res!439784 e!384466)))

(declare-fun res!439781 () Bool)

(assert (=> b!673207 (=> (not res!439781) (not e!384466))))

(assert (=> b!673207 (= res!439781 (bvsgt from!3004 i!1382))))

(declare-fun b!673208 () Bool)

(declare-fun res!439787 () Bool)

(assert (=> b!673208 (=> (not res!439787) (not e!384465))))

(assert (=> b!673208 (= res!439787 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673209 () Bool)

(declare-fun res!439765 () Bool)

(assert (=> b!673209 (=> (not res!439765) (not e!384461))))

(declare-fun lt!312427 () List!12854)

(declare-fun noDuplicate!678 (List!12854) Bool)

(assert (=> b!673209 (= res!439765 (noDuplicate!678 lt!312427))))

(declare-fun b!673210 () Bool)

(declare-fun res!439772 () Bool)

(assert (=> b!673210 (=> (not res!439772) (not e!384465))))

(assert (=> b!673210 (= res!439772 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673211 () Bool)

(assert (=> b!673211 (= e!384466 (contains!3431 acc!681 k!2843))))

(declare-fun b!673212 () Bool)

(assert (=> b!673212 (= e!384468 (not (contains!3431 acc!681 k!2843)))))

(declare-fun b!673213 () Bool)

(declare-fun e!384471 () Bool)

(assert (=> b!673213 (= e!384471 (not (contains!3431 lt!312427 k!2843)))))

(declare-fun b!673214 () Bool)

(declare-fun res!439776 () Bool)

(assert (=> b!673214 (=> (not res!439776) (not e!384465))))

(assert (=> b!673214 (= res!439776 (not (contains!3431 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673215 () Bool)

(declare-fun res!439771 () Bool)

(assert (=> b!673215 (=> (not res!439771) (not e!384461))))

(assert (=> b!673215 (= res!439771 (not (contains!3431 lt!312427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673216 () Bool)

(declare-fun Unit!23667 () Unit!23664)

(assert (=> b!673216 (= e!384464 Unit!23667)))

(declare-fun b!673217 () Bool)

(declare-fun res!439785 () Bool)

(assert (=> b!673217 (=> (not res!439785) (not e!384465))))

(assert (=> b!673217 (= res!439785 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19177 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673218 () Bool)

(assert (=> b!673218 (= e!384461 false)))

(declare-fun lt!312429 () Bool)

(assert (=> b!673218 (= lt!312429 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312427))))

(declare-fun b!673219 () Bool)

(assert (=> b!673219 (= e!384467 e!384461)))

(declare-fun res!439786 () Bool)

(assert (=> b!673219 (=> (not res!439786) (not e!384461))))

(assert (=> b!673219 (= res!439786 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!281 (List!12854 (_ BitVec 64)) List!12854)

(assert (=> b!673219 (= lt!312427 ($colon$colon!281 acc!681 (select (arr!18813 a!3626) from!3004)))))

(declare-fun b!673220 () Bool)

(declare-fun res!439773 () Bool)

(assert (=> b!673220 (=> (not res!439773) (not e!384461))))

(assert (=> b!673220 (= res!439773 (not (contains!3431 lt!312427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673221 () Bool)

(assert (=> b!673221 (= e!384469 e!384471)))

(declare-fun res!439766 () Bool)

(assert (=> b!673221 (=> (not res!439766) (not e!384471))))

(assert (=> b!673221 (= res!439766 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673222 () Bool)

(declare-fun res!439764 () Bool)

(assert (=> b!673222 (=> (not res!439764) (not e!384465))))

(assert (=> b!673222 (= res!439764 (noDuplicate!678 acc!681))))

(declare-fun b!673223 () Bool)

(assert (=> b!673223 (= e!384470 (contains!3431 lt!312427 k!2843))))

(assert (= (and start!60194 res!439768) b!673222))

(assert (= (and b!673222 res!439764) b!673200))

(assert (= (and b!673200 res!439780) b!673214))

(assert (= (and b!673214 res!439776) b!673207))

(assert (= (and b!673207 res!439781) b!673211))

(assert (= (and b!673207 (not res!439784)) b!673203))

(assert (= (and b!673203 res!439782) b!673212))

(assert (= (and b!673207 res!439770) b!673199))

(assert (= (and b!673199 res!439775) b!673208))

(assert (= (and b!673208 res!439787) b!673202))

(assert (= (and b!673202 res!439778) b!673201))

(assert (= (and b!673201 res!439769) b!673210))

(assert (= (and b!673210 res!439772) b!673217))

(assert (= (and b!673217 res!439785) b!673206))

(assert (= (and b!673206 res!439767) b!673205))

(assert (= (and b!673205 c!77084) b!673198))

(assert (= (and b!673205 (not c!77084)) b!673216))

(assert (= (and b!673205 res!439774) b!673219))

(assert (= (and b!673219 res!439786) b!673209))

(assert (= (and b!673209 res!439765) b!673220))

(assert (= (and b!673220 res!439773) b!673215))

(assert (= (and b!673215 res!439771) b!673204))

(assert (= (and b!673204 res!439779) b!673223))

(assert (= (and b!673204 (not res!439777)) b!673221))

(assert (= (and b!673221 res!439766) b!673213))

(assert (= (and b!673204 res!439783) b!673218))

(declare-fun m!641771 () Bool)

(assert (=> b!673212 m!641771))

(declare-fun m!641773 () Bool)

(assert (=> b!673222 m!641773))

(declare-fun m!641775 () Bool)

(assert (=> b!673201 m!641775))

(declare-fun m!641777 () Bool)

(assert (=> b!673200 m!641777))

(declare-fun m!641779 () Bool)

(assert (=> b!673198 m!641779))

(declare-fun m!641781 () Bool)

(assert (=> b!673198 m!641781))

(declare-fun m!641783 () Bool)

(assert (=> b!673213 m!641783))

(declare-fun m!641785 () Bool)

(assert (=> b!673208 m!641785))

(declare-fun m!641787 () Bool)

(assert (=> b!673210 m!641787))

(declare-fun m!641789 () Bool)

(assert (=> b!673219 m!641789))

(assert (=> b!673219 m!641789))

(declare-fun m!641791 () Bool)

(assert (=> b!673219 m!641791))

(assert (=> b!673223 m!641783))

(assert (=> b!673206 m!641789))

(assert (=> b!673206 m!641789))

(declare-fun m!641793 () Bool)

(assert (=> b!673206 m!641793))

(declare-fun m!641795 () Bool)

(assert (=> b!673214 m!641795))

(declare-fun m!641797 () Bool)

(assert (=> b!673218 m!641797))

(declare-fun m!641799 () Bool)

(assert (=> b!673199 m!641799))

(declare-fun m!641801 () Bool)

(assert (=> b!673209 m!641801))

(assert (=> b!673205 m!641789))

(assert (=> b!673211 m!641771))

(declare-fun m!641803 () Bool)

(assert (=> b!673220 m!641803))

(declare-fun m!641805 () Bool)

(assert (=> b!673215 m!641805))

(declare-fun m!641807 () Bool)

(assert (=> start!60194 m!641807))

(push 1)

