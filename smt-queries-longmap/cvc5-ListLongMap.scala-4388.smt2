; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60356 () Bool)

(assert start!60356)

(declare-fun b!678184 () Bool)

(declare-fun res!444617 () Bool)

(declare-fun e!386506 () Bool)

(assert (=> b!678184 (=> (not res!444617) (not e!386506))))

(declare-datatypes ((array!39403 0))(
  ( (array!39404 (arr!18894 (Array (_ BitVec 32) (_ BitVec 64))) (size!19258 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39403)

(declare-datatypes ((List!12935 0))(
  ( (Nil!12932) (Cons!12931 (h!13976 (_ BitVec 64)) (t!19163 List!12935)) )
))
(declare-fun arrayNoDuplicates!0 (array!39403 (_ BitVec 32) List!12935) Bool)

(assert (=> b!678184 (= res!444617 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12932))))

(declare-fun b!678185 () Bool)

(declare-fun res!444610 () Bool)

(assert (=> b!678185 (=> (not res!444610) (not e!386506))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!12935)

(assert (=> b!678185 (= res!444610 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678186 () Bool)

(declare-fun e!386505 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3512 (List!12935 (_ BitVec 64)) Bool)

(assert (=> b!678186 (= e!386505 (contains!3512 acc!681 k!2843))))

(declare-fun b!678187 () Bool)

(declare-fun e!386504 () Bool)

(declare-fun e!386507 () Bool)

(assert (=> b!678187 (= e!386504 e!386507)))

(declare-fun res!444616 () Bool)

(assert (=> b!678187 (=> (not res!444616) (not e!386507))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678187 (= res!444616 (bvsle from!3004 i!1382))))

(declare-fun b!678188 () Bool)

(assert (=> b!678188 (= e!386506 (= (select (arr!18894 a!3626) from!3004) k!2843))))

(declare-datatypes ((Unit!23784 0))(
  ( (Unit!23785) )
))
(declare-fun lt!312873 () Unit!23784)

(declare-fun e!386508 () Unit!23784)

(assert (=> b!678188 (= lt!312873 e!386508)))

(declare-fun c!77156 () Bool)

(assert (=> b!678188 (= c!77156 (= (select (arr!18894 a!3626) from!3004) k!2843))))

(declare-fun b!678189 () Bool)

(declare-fun res!444620 () Bool)

(assert (=> b!678189 (=> (not res!444620) (not e!386506))))

(assert (=> b!678189 (= res!444620 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19258 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!678190 () Bool)

(declare-fun Unit!23786 () Unit!23784)

(assert (=> b!678190 (= e!386508 Unit!23786)))

(declare-fun b!678191 () Bool)

(declare-fun res!444614 () Bool)

(assert (=> b!678191 (=> (not res!444614) (not e!386506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678191 (= res!444614 (validKeyInArray!0 k!2843))))

(declare-fun b!678192 () Bool)

(declare-fun res!444613 () Bool)

(assert (=> b!678192 (=> (not res!444613) (not e!386506))))

(assert (=> b!678192 (= res!444613 e!386504)))

(declare-fun res!444619 () Bool)

(assert (=> b!678192 (=> res!444619 e!386504)))

(assert (=> b!678192 (= res!444619 e!386505)))

(declare-fun res!444608 () Bool)

(assert (=> b!678192 (=> (not res!444608) (not e!386505))))

(assert (=> b!678192 (= res!444608 (bvsgt from!3004 i!1382))))

(declare-fun b!678193 () Bool)

(declare-fun res!444612 () Bool)

(assert (=> b!678193 (=> (not res!444612) (not e!386506))))

(declare-fun arrayContainsKey!0 (array!39403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678193 (= res!444612 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!444609 () Bool)

(assert (=> start!60356 (=> (not res!444609) (not e!386506))))

(assert (=> start!60356 (= res!444609 (and (bvslt (size!19258 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19258 a!3626))))))

(assert (=> start!60356 e!386506))

(assert (=> start!60356 true))

(declare-fun array_inv!14690 (array!39403) Bool)

(assert (=> start!60356 (array_inv!14690 a!3626)))

(declare-fun b!678194 () Bool)

(declare-fun res!444615 () Bool)

(assert (=> b!678194 (=> (not res!444615) (not e!386506))))

(declare-fun noDuplicate!759 (List!12935) Bool)

(assert (=> b!678194 (= res!444615 (noDuplicate!759 acc!681))))

(declare-fun b!678195 () Bool)

(assert (=> b!678195 (= e!386507 (not (contains!3512 acc!681 k!2843)))))

(declare-fun b!678196 () Bool)

(declare-fun Unit!23787 () Unit!23784)

(assert (=> b!678196 (= e!386508 Unit!23787)))

(assert (=> b!678196 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312874 () Unit!23784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39403 (_ BitVec 64) (_ BitVec 32)) Unit!23784)

(assert (=> b!678196 (= lt!312874 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!678196 false))

(declare-fun b!678197 () Bool)

(declare-fun res!444607 () Bool)

(assert (=> b!678197 (=> (not res!444607) (not e!386506))))

(assert (=> b!678197 (= res!444607 (not (contains!3512 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678198 () Bool)

(declare-fun res!444611 () Bool)

(assert (=> b!678198 (=> (not res!444611) (not e!386506))))

(assert (=> b!678198 (= res!444611 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19258 a!3626))))))

(declare-fun b!678199 () Bool)

(declare-fun res!444618 () Bool)

(assert (=> b!678199 (=> (not res!444618) (not e!386506))))

(assert (=> b!678199 (= res!444618 (validKeyInArray!0 (select (arr!18894 a!3626) from!3004)))))

(declare-fun b!678200 () Bool)

(declare-fun res!444606 () Bool)

(assert (=> b!678200 (=> (not res!444606) (not e!386506))))

(assert (=> b!678200 (= res!444606 (not (contains!3512 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60356 res!444609) b!678194))

(assert (= (and b!678194 res!444615) b!678200))

(assert (= (and b!678200 res!444606) b!678197))

(assert (= (and b!678197 res!444607) b!678192))

(assert (= (and b!678192 res!444608) b!678186))

(assert (= (and b!678192 (not res!444619)) b!678187))

(assert (= (and b!678187 res!444616) b!678195))

(assert (= (and b!678192 res!444613) b!678184))

(assert (= (and b!678184 res!444617) b!678185))

(assert (= (and b!678185 res!444610) b!678198))

(assert (= (and b!678198 res!444611) b!678191))

(assert (= (and b!678191 res!444614) b!678193))

(assert (= (and b!678193 res!444612) b!678189))

(assert (= (and b!678189 res!444620) b!678199))

(assert (= (and b!678199 res!444618) b!678188))

(assert (= (and b!678188 c!77156) b!678196))

(assert (= (and b!678188 (not c!77156)) b!678190))

(declare-fun m!644087 () Bool)

(assert (=> b!678185 m!644087))

(declare-fun m!644089 () Bool)

(assert (=> b!678191 m!644089))

(declare-fun m!644091 () Bool)

(assert (=> start!60356 m!644091))

(declare-fun m!644093 () Bool)

(assert (=> b!678197 m!644093))

(declare-fun m!644095 () Bool)

(assert (=> b!678200 m!644095))

(declare-fun m!644097 () Bool)

(assert (=> b!678195 m!644097))

(declare-fun m!644099 () Bool)

(assert (=> b!678193 m!644099))

(declare-fun m!644101 () Bool)

(assert (=> b!678199 m!644101))

(assert (=> b!678199 m!644101))

(declare-fun m!644103 () Bool)

(assert (=> b!678199 m!644103))

(declare-fun m!644105 () Bool)

(assert (=> b!678184 m!644105))

(assert (=> b!678188 m!644101))

(assert (=> b!678186 m!644097))

(declare-fun m!644107 () Bool)

(assert (=> b!678196 m!644107))

(declare-fun m!644109 () Bool)

(assert (=> b!678196 m!644109))

(declare-fun m!644111 () Bool)

(assert (=> b!678194 m!644111))

(push 1)

(assert (not b!678186))

(assert (not b!678184))

(assert (not b!678196))

(assert (not b!678191))

(assert (not b!678194))

(assert (not b!678199))

(assert (not b!678200))

(assert (not b!678197))

(assert (not b!678195))

(assert (not b!678193))

(assert (not start!60356))

(assert (not b!678185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

