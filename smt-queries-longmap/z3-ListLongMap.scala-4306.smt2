; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59922 () Bool)

(assert start!59922)

(declare-fun b!662200 () Bool)

(declare-fun res!430131 () Bool)

(declare-fun e!380282 () Bool)

(assert (=> b!662200 (=> (not res!430131) (not e!380282))))

(declare-datatypes ((array!38907 0))(
  ( (array!38908 (arr!18643 (Array (_ BitVec 32) (_ BitVec 64))) (size!19007 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38907)

(declare-datatypes ((List!12591 0))(
  ( (Nil!12588) (Cons!12587 (h!13635 (_ BitVec 64)) (t!18811 List!12591)) )
))
(declare-fun arrayNoDuplicates!0 (array!38907 (_ BitVec 32) List!12591) Bool)

(assert (=> b!662200 (= res!430131 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12588))))

(declare-fun b!662201 () Bool)

(declare-fun res!430148 () Bool)

(assert (=> b!662201 (=> (not res!430148) (not e!380282))))

(declare-fun acc!681 () List!12591)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662201 (= res!430148 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662202 () Bool)

(declare-fun res!430150 () Bool)

(assert (=> b!662202 (=> (not res!430150) (not e!380282))))

(declare-fun e!380278 () Bool)

(assert (=> b!662202 (= res!430150 e!380278)))

(declare-fun res!430144 () Bool)

(assert (=> b!662202 (=> res!430144 e!380278)))

(declare-fun e!380279 () Bool)

(assert (=> b!662202 (= res!430144 e!380279)))

(declare-fun res!430140 () Bool)

(assert (=> b!662202 (=> (not res!430140) (not e!380279))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662202 (= res!430140 (bvsgt from!3004 i!1382))))

(declare-fun b!662203 () Bool)

(declare-fun res!430133 () Bool)

(declare-fun e!380280 () Bool)

(assert (=> b!662203 (=> res!430133 e!380280)))

(declare-fun lt!308990 () List!12591)

(declare-fun subseq!5 (List!12591 List!12591) Bool)

(assert (=> b!662203 (= res!430133 (not (subseq!5 acc!681 lt!308990)))))

(declare-fun b!662204 () Bool)

(declare-fun res!430142 () Bool)

(assert (=> b!662204 (=> res!430142 e!380280)))

(declare-fun contains!3243 (List!12591 (_ BitVec 64)) Bool)

(assert (=> b!662204 (= res!430142 (contains!3243 lt!308990 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!430146 () Bool)

(assert (=> start!59922 (=> (not res!430146) (not e!380282))))

(assert (=> start!59922 (= res!430146 (and (bvslt (size!19007 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19007 a!3626))))))

(assert (=> start!59922 e!380282))

(assert (=> start!59922 true))

(declare-fun array_inv!14502 (array!38907) Bool)

(assert (=> start!59922 (array_inv!14502 a!3626)))

(declare-fun b!662205 () Bool)

(declare-fun e!380281 () Bool)

(assert (=> b!662205 (= e!380282 (not e!380281))))

(declare-fun res!430134 () Bool)

(assert (=> b!662205 (=> res!430134 e!380281)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662205 (= res!430134 (not (validKeyInArray!0 (select (arr!18643 a!3626) from!3004))))))

(declare-datatypes ((Unit!22965 0))(
  ( (Unit!22966) )
))
(declare-fun lt!308987 () Unit!22965)

(declare-fun e!380283 () Unit!22965)

(assert (=> b!662205 (= lt!308987 e!380283)))

(declare-fun c!76403 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662205 (= c!76403 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662205 (arrayContainsKey!0 (array!38908 (store (arr!18643 a!3626) i!1382 k0!2843) (size!19007 a!3626)) k0!2843 from!3004)))

(declare-fun b!662206 () Bool)

(declare-fun e!380277 () Bool)

(assert (=> b!662206 (= e!380278 e!380277)))

(declare-fun res!430143 () Bool)

(assert (=> b!662206 (=> (not res!430143) (not e!380277))))

(assert (=> b!662206 (= res!430143 (bvsle from!3004 i!1382))))

(declare-fun b!662207 () Bool)

(declare-fun res!430136 () Bool)

(assert (=> b!662207 (=> res!430136 e!380280)))

(assert (=> b!662207 (= res!430136 (contains!3243 lt!308990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662208 () Bool)

(declare-fun res!430147 () Bool)

(assert (=> b!662208 (=> (not res!430147) (not e!380282))))

(assert (=> b!662208 (= res!430147 (not (contains!3243 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662209 () Bool)

(declare-fun Unit!22967 () Unit!22965)

(assert (=> b!662209 (= e!380283 Unit!22967)))

(declare-fun b!662210 () Bool)

(assert (=> b!662210 (= e!380281 e!380280)))

(declare-fun res!430132 () Bool)

(assert (=> b!662210 (=> res!430132 e!380280)))

(assert (=> b!662210 (= res!430132 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!134 (List!12591 (_ BitVec 64)) List!12591)

(assert (=> b!662210 (= lt!308990 ($colon$colon!134 acc!681 (select (arr!18643 a!3626) from!3004)))))

(assert (=> b!662210 (subseq!5 acc!681 acc!681)))

(declare-fun lt!308989 () Unit!22965)

(declare-fun lemmaListSubSeqRefl!0 (List!12591) Unit!22965)

(assert (=> b!662210 (= lt!308989 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662211 () Bool)

(assert (=> b!662211 (= e!380279 (contains!3243 acc!681 k0!2843))))

(declare-fun b!662212 () Bool)

(declare-fun res!430138 () Bool)

(assert (=> b!662212 (=> (not res!430138) (not e!380282))))

(assert (=> b!662212 (= res!430138 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662213 () Bool)

(declare-fun res!430145 () Bool)

(assert (=> b!662213 (=> (not res!430145) (not e!380282))))

(assert (=> b!662213 (= res!430145 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19007 a!3626))))))

(declare-fun b!662214 () Bool)

(declare-fun res!430137 () Bool)

(assert (=> b!662214 (=> res!430137 e!380280)))

(declare-fun noDuplicate!517 (List!12591) Bool)

(assert (=> b!662214 (= res!430137 (not (noDuplicate!517 lt!308990)))))

(declare-fun b!662215 () Bool)

(declare-fun res!430141 () Bool)

(assert (=> b!662215 (=> (not res!430141) (not e!380282))))

(assert (=> b!662215 (= res!430141 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19007 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662216 () Bool)

(assert (=> b!662216 (= e!380277 (not (contains!3243 acc!681 k0!2843)))))

(declare-fun b!662217 () Bool)

(declare-fun res!430139 () Bool)

(assert (=> b!662217 (=> (not res!430139) (not e!380282))))

(assert (=> b!662217 (= res!430139 (noDuplicate!517 acc!681))))

(declare-fun b!662218 () Bool)

(declare-fun res!430135 () Bool)

(assert (=> b!662218 (=> (not res!430135) (not e!380282))))

(assert (=> b!662218 (= res!430135 (validKeyInArray!0 k0!2843))))

(declare-fun b!662219 () Bool)

(assert (=> b!662219 (= e!380280 true)))

(declare-fun lt!308991 () Bool)

(assert (=> b!662219 (= lt!308991 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308990))))

(declare-fun lt!308988 () Unit!22965)

(declare-fun noDuplicateSubseq!5 (List!12591 List!12591) Unit!22965)

(assert (=> b!662219 (= lt!308988 (noDuplicateSubseq!5 acc!681 lt!308990))))

(declare-fun b!662220 () Bool)

(declare-fun Unit!22968 () Unit!22965)

(assert (=> b!662220 (= e!380283 Unit!22968)))

(declare-fun lt!308992 () Unit!22965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38907 (_ BitVec 64) (_ BitVec 32)) Unit!22965)

(assert (=> b!662220 (= lt!308992 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662220 false))

(declare-fun b!662221 () Bool)

(declare-fun res!430149 () Bool)

(assert (=> b!662221 (=> (not res!430149) (not e!380282))))

(assert (=> b!662221 (= res!430149 (not (contains!3243 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59922 res!430146) b!662217))

(assert (= (and b!662217 res!430139) b!662208))

(assert (= (and b!662208 res!430147) b!662221))

(assert (= (and b!662221 res!430149) b!662202))

(assert (= (and b!662202 res!430140) b!662211))

(assert (= (and b!662202 (not res!430144)) b!662206))

(assert (= (and b!662206 res!430143) b!662216))

(assert (= (and b!662202 res!430150) b!662200))

(assert (= (and b!662200 res!430131) b!662201))

(assert (= (and b!662201 res!430148) b!662213))

(assert (= (and b!662213 res!430145) b!662218))

(assert (= (and b!662218 res!430135) b!662212))

(assert (= (and b!662212 res!430138) b!662215))

(assert (= (and b!662215 res!430141) b!662205))

(assert (= (and b!662205 c!76403) b!662220))

(assert (= (and b!662205 (not c!76403)) b!662209))

(assert (= (and b!662205 (not res!430134)) b!662210))

(assert (= (and b!662210 (not res!430132)) b!662214))

(assert (= (and b!662214 (not res!430137)) b!662207))

(assert (= (and b!662207 (not res!430136)) b!662204))

(assert (= (and b!662204 (not res!430142)) b!662203))

(assert (= (and b!662203 (not res!430133)) b!662219))

(declare-fun m!634639 () Bool)

(assert (=> start!59922 m!634639))

(declare-fun m!634641 () Bool)

(assert (=> b!662218 m!634641))

(declare-fun m!634643 () Bool)

(assert (=> b!662217 m!634643))

(declare-fun m!634645 () Bool)

(assert (=> b!662210 m!634645))

(assert (=> b!662210 m!634645))

(declare-fun m!634647 () Bool)

(assert (=> b!662210 m!634647))

(declare-fun m!634649 () Bool)

(assert (=> b!662210 m!634649))

(declare-fun m!634651 () Bool)

(assert (=> b!662210 m!634651))

(declare-fun m!634653 () Bool)

(assert (=> b!662204 m!634653))

(declare-fun m!634655 () Bool)

(assert (=> b!662221 m!634655))

(declare-fun m!634657 () Bool)

(assert (=> b!662214 m!634657))

(declare-fun m!634659 () Bool)

(assert (=> b!662212 m!634659))

(assert (=> b!662205 m!634645))

(declare-fun m!634661 () Bool)

(assert (=> b!662205 m!634661))

(declare-fun m!634663 () Bool)

(assert (=> b!662205 m!634663))

(assert (=> b!662205 m!634645))

(declare-fun m!634665 () Bool)

(assert (=> b!662205 m!634665))

(declare-fun m!634667 () Bool)

(assert (=> b!662205 m!634667))

(declare-fun m!634669 () Bool)

(assert (=> b!662219 m!634669))

(declare-fun m!634671 () Bool)

(assert (=> b!662219 m!634671))

(declare-fun m!634673 () Bool)

(assert (=> b!662201 m!634673))

(declare-fun m!634675 () Bool)

(assert (=> b!662220 m!634675))

(declare-fun m!634677 () Bool)

(assert (=> b!662200 m!634677))

(declare-fun m!634679 () Bool)

(assert (=> b!662216 m!634679))

(assert (=> b!662211 m!634679))

(declare-fun m!634681 () Bool)

(assert (=> b!662208 m!634681))

(declare-fun m!634683 () Bool)

(assert (=> b!662207 m!634683))

(declare-fun m!634685 () Bool)

(assert (=> b!662203 m!634685))

(check-sat (not b!662204) (not b!662214) (not b!662221) (not b!662200) (not b!662219) (not b!662205) (not b!662217) (not b!662203) (not b!662218) (not b!662220) (not b!662216) (not start!59922) (not b!662211) (not b!662212) (not b!662201) (not b!662208) (not b!662207) (not b!662210))
(check-sat)
