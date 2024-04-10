; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101958 () Bool)

(assert start!101958)

(declare-fun res!815982 () Bool)

(declare-fun e!696967 () Bool)

(assert (=> start!101958 (=> (not res!815982) (not e!696967))))

(declare-datatypes ((array!79231 0))(
  ( (array!79232 (arr!38238 (Array (_ BitVec 32) (_ BitVec 64))) (size!38774 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79231)

(assert (=> start!101958 (= res!815982 (bvslt (size!38774 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101958 e!696967))

(declare-fun array_inv!29086 (array!79231) Bool)

(assert (=> start!101958 (array_inv!29086 a!3806)))

(assert (=> start!101958 true))

(declare-fun b!1227364 () Bool)

(declare-fun res!815977 () Bool)

(assert (=> b!1227364 (=> (not res!815977) (not e!696967))))

(declare-datatypes ((List!27011 0))(
  ( (Nil!27008) (Cons!27007 (h!28216 (_ BitVec 64)) (t!40474 List!27011)) )
))
(declare-fun acc!823 () List!27011)

(declare-fun noDuplicate!1670 (List!27011) Bool)

(assert (=> b!1227364 (= res!815977 (noDuplicate!1670 acc!823))))

(declare-fun b!1227365 () Bool)

(declare-fun res!815978 () Bool)

(assert (=> b!1227365 (=> (not res!815978) (not e!696967))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227365 (= res!815978 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38774 a!3806)) (bvslt from!3184 (size!38774 a!3806))))))

(declare-fun b!1227366 () Bool)

(declare-fun res!815976 () Bool)

(declare-fun e!696968 () Bool)

(assert (=> b!1227366 (=> res!815976 e!696968)))

(declare-fun subseq!477 (List!27011 List!27011) Bool)

(assert (=> b!1227366 (= res!815976 (not (subseq!477 Nil!27008 acc!823)))))

(declare-fun b!1227367 () Bool)

(declare-fun res!815988 () Bool)

(assert (=> b!1227367 (=> (not res!815988) (not e!696967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227367 (= res!815988 (validKeyInArray!0 (select (arr!38238 a!3806) from!3184)))))

(declare-fun b!1227368 () Bool)

(declare-fun res!815983 () Bool)

(assert (=> b!1227368 (=> res!815983 e!696968)))

(declare-fun contains!7073 (List!27011 (_ BitVec 64)) Bool)

(assert (=> b!1227368 (= res!815983 (contains!7073 Nil!27008 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227369 () Bool)

(declare-fun res!815987 () Bool)

(assert (=> b!1227369 (=> (not res!815987) (not e!696967))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1227369 (= res!815987 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227370 () Bool)

(declare-fun res!815979 () Bool)

(assert (=> b!1227370 (=> res!815979 e!696968)))

(assert (=> b!1227370 (= res!815979 (contains!7073 Nil!27008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227371 () Bool)

(declare-fun res!815980 () Bool)

(assert (=> b!1227371 (=> (not res!815980) (not e!696967))))

(assert (=> b!1227371 (= res!815980 (not (contains!7073 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227372 () Bool)

(assert (=> b!1227372 (= e!696967 (not e!696968))))

(declare-fun res!815986 () Bool)

(assert (=> b!1227372 (=> res!815986 e!696968)))

(assert (=> b!1227372 (= res!815986 (bvsgt from!3184 (size!38774 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79231 (_ BitVec 32) List!27011) Bool)

(assert (=> b!1227372 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27007 (select (arr!38238 a!3806) from!3184) acc!823))))

(declare-fun b!1227373 () Bool)

(declare-fun res!815985 () Bool)

(assert (=> b!1227373 (=> (not res!815985) (not e!696967))))

(declare-fun arrayContainsKey!0 (array!79231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227373 (= res!815985 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227374 () Bool)

(assert (=> b!1227374 (= e!696968 true)))

(declare-datatypes ((Unit!40642 0))(
  ( (Unit!40643) )
))
(declare-fun lt!558909 () Unit!40642)

(declare-fun noDuplicateSubseq!30 (List!27011 List!27011) Unit!40642)

(assert (=> b!1227374 (= lt!558909 (noDuplicateSubseq!30 Nil!27008 acc!823))))

(declare-fun b!1227375 () Bool)

(declare-fun res!815981 () Bool)

(assert (=> b!1227375 (=> (not res!815981) (not e!696967))))

(assert (=> b!1227375 (= res!815981 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227376 () Bool)

(declare-fun res!815984 () Bool)

(assert (=> b!1227376 (=> (not res!815984) (not e!696967))))

(assert (=> b!1227376 (= res!815984 (not (contains!7073 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101958 res!815982) b!1227369))

(assert (= (and b!1227369 res!815987) b!1227365))

(assert (= (and b!1227365 res!815978) b!1227364))

(assert (= (and b!1227364 res!815977) b!1227371))

(assert (= (and b!1227371 res!815980) b!1227376))

(assert (= (and b!1227376 res!815984) b!1227373))

(assert (= (and b!1227373 res!815985) b!1227375))

(assert (= (and b!1227375 res!815981) b!1227367))

(assert (= (and b!1227367 res!815988) b!1227372))

(assert (= (and b!1227372 (not res!815986)) b!1227370))

(assert (= (and b!1227370 (not res!815979)) b!1227368))

(assert (= (and b!1227368 (not res!815983)) b!1227366))

(assert (= (and b!1227366 (not res!815976)) b!1227374))

(declare-fun m!1132171 () Bool)

(assert (=> b!1227373 m!1132171))

(declare-fun m!1132173 () Bool)

(assert (=> b!1227370 m!1132173))

(declare-fun m!1132175 () Bool)

(assert (=> start!101958 m!1132175))

(declare-fun m!1132177 () Bool)

(assert (=> b!1227367 m!1132177))

(assert (=> b!1227367 m!1132177))

(declare-fun m!1132179 () Bool)

(assert (=> b!1227367 m!1132179))

(declare-fun m!1132181 () Bool)

(assert (=> b!1227366 m!1132181))

(declare-fun m!1132183 () Bool)

(assert (=> b!1227376 m!1132183))

(assert (=> b!1227372 m!1132177))

(declare-fun m!1132185 () Bool)

(assert (=> b!1227372 m!1132185))

(declare-fun m!1132187 () Bool)

(assert (=> b!1227374 m!1132187))

(declare-fun m!1132189 () Bool)

(assert (=> b!1227364 m!1132189))

(declare-fun m!1132191 () Bool)

(assert (=> b!1227369 m!1132191))

(declare-fun m!1132193 () Bool)

(assert (=> b!1227368 m!1132193))

(declare-fun m!1132195 () Bool)

(assert (=> b!1227371 m!1132195))

(declare-fun m!1132197 () Bool)

(assert (=> b!1227375 m!1132197))

(check-sat (not b!1227368) (not b!1227367) (not b!1227375) (not b!1227376) (not start!101958) (not b!1227370) (not b!1227366) (not b!1227364) (not b!1227371) (not b!1227369) (not b!1227374) (not b!1227373) (not b!1227372))
(check-sat)
