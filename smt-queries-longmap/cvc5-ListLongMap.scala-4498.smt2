; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62456 () Bool)

(assert start!62456)

(declare-fun b!702140 () Bool)

(declare-fun res!465967 () Bool)

(declare-fun e!397472 () Bool)

(assert (=> b!702140 (=> (not res!465967) (not e!397472))))

(declare-datatypes ((List!13265 0))(
  ( (Nil!13262) (Cons!13261 (h!14306 (_ BitVec 64)) (t!19547 List!13265)) )
))
(declare-fun lt!317669 () List!13265)

(declare-datatypes ((array!40135 0))(
  ( (array!40136 (arr!19224 (Array (_ BitVec 32) (_ BitVec 64))) (size!19609 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40135)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40135 (_ BitVec 32) List!13265) Bool)

(assert (=> b!702140 (= res!465967 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317669))))

(declare-fun b!702141 () Bool)

(declare-fun res!465966 () Bool)

(declare-fun e!397474 () Bool)

(assert (=> b!702141 (=> (not res!465966) (not e!397474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702141 (= res!465966 (validKeyInArray!0 (select (arr!19224 a!3591) from!2969)))))

(declare-fun b!702142 () Bool)

(declare-fun res!465978 () Bool)

(assert (=> b!702142 (=> (not res!465978) (not e!397474))))

(declare-fun acc!652 () List!13265)

(declare-fun newAcc!49 () List!13265)

(declare-fun subseq!287 (List!13265 List!13265) Bool)

(assert (=> b!702142 (= res!465978 (subseq!287 acc!652 newAcc!49))))

(declare-fun b!702143 () Bool)

(declare-fun res!465952 () Bool)

(assert (=> b!702143 (=> (not res!465952) (not e!397472))))

(declare-fun lt!317668 () List!13265)

(declare-fun contains!3842 (List!13265 (_ BitVec 64)) Bool)

(assert (=> b!702143 (= res!465952 (not (contains!3842 lt!317668 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702144 () Bool)

(declare-fun res!465950 () Bool)

(assert (=> b!702144 (=> (not res!465950) (not e!397474))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!702144 (= res!465950 (validKeyInArray!0 k!2824))))

(declare-fun b!702145 () Bool)

(declare-fun res!465969 () Bool)

(assert (=> b!702145 (=> (not res!465969) (not e!397474))))

(declare-fun -!252 (List!13265 (_ BitVec 64)) List!13265)

(assert (=> b!702145 (= res!465969 (= (-!252 newAcc!49 k!2824) acc!652))))

(declare-fun b!702146 () Bool)

(declare-fun res!465963 () Bool)

(assert (=> b!702146 (=> (not res!465963) (not e!397472))))

(assert (=> b!702146 (= res!465963 (contains!3842 lt!317668 k!2824))))

(declare-fun b!702147 () Bool)

(declare-fun res!465961 () Bool)

(assert (=> b!702147 (=> (not res!465961) (not e!397472))))

(assert (=> b!702147 (= res!465961 (not (contains!3842 lt!317669 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702148 () Bool)

(declare-fun res!465972 () Bool)

(assert (=> b!702148 (=> (not res!465972) (not e!397472))))

(declare-fun arrayContainsKey!0 (array!40135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702148 (= res!465972 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702149 () Bool)

(declare-fun res!465968 () Bool)

(assert (=> b!702149 (=> (not res!465968) (not e!397474))))

(assert (=> b!702149 (= res!465968 (not (contains!3842 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702150 () Bool)

(declare-fun res!465964 () Bool)

(assert (=> b!702150 (=> (not res!465964) (not e!397474))))

(assert (=> b!702150 (= res!465964 (not (contains!3842 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702151 () Bool)

(declare-fun res!465975 () Bool)

(assert (=> b!702151 (=> (not res!465975) (not e!397472))))

(assert (=> b!702151 (= res!465975 (not (contains!3842 lt!317668 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702152 () Bool)

(declare-fun res!465973 () Bool)

(assert (=> b!702152 (=> (not res!465973) (not e!397474))))

(assert (=> b!702152 (= res!465973 (not (contains!3842 acc!652 k!2824)))))

(declare-fun b!702153 () Bool)

(declare-fun res!465955 () Bool)

(assert (=> b!702153 (=> (not res!465955) (not e!397472))))

(assert (=> b!702153 (= res!465955 (not (contains!3842 lt!317669 k!2824)))))

(declare-fun b!702154 () Bool)

(declare-fun res!465951 () Bool)

(assert (=> b!702154 (=> (not res!465951) (not e!397472))))

(declare-fun noDuplicate!1089 (List!13265) Bool)

(assert (=> b!702154 (= res!465951 (noDuplicate!1089 lt!317669))))

(declare-fun b!702155 () Bool)

(declare-fun res!465960 () Bool)

(assert (=> b!702155 (=> (not res!465960) (not e!397474))))

(assert (=> b!702155 (= res!465960 (noDuplicate!1089 acc!652))))

(declare-fun b!702156 () Bool)

(declare-fun res!465957 () Bool)

(assert (=> b!702156 (=> (not res!465957) (not e!397474))))

(assert (=> b!702156 (= res!465957 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19609 a!3591)))))

(declare-fun b!702157 () Bool)

(assert (=> b!702157 (= e!397474 e!397472)))

(declare-fun res!465977 () Bool)

(assert (=> b!702157 (=> (not res!465977) (not e!397472))))

(assert (=> b!702157 (= res!465977 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!485 (List!13265 (_ BitVec 64)) List!13265)

(assert (=> b!702157 (= lt!317668 ($colon$colon!485 newAcc!49 (select (arr!19224 a!3591) from!2969)))))

(assert (=> b!702157 (= lt!317669 ($colon$colon!485 acc!652 (select (arr!19224 a!3591) from!2969)))))

(declare-fun b!702158 () Bool)

(declare-fun res!465953 () Bool)

(assert (=> b!702158 (=> (not res!465953) (not e!397474))))

(assert (=> b!702158 (= res!465953 (contains!3842 newAcc!49 k!2824))))

(declare-fun b!702159 () Bool)

(declare-fun res!465976 () Bool)

(assert (=> b!702159 (=> (not res!465976) (not e!397474))))

(assert (=> b!702159 (= res!465976 (noDuplicate!1089 newAcc!49))))

(declare-fun b!702160 () Bool)

(declare-fun res!465974 () Bool)

(assert (=> b!702160 (=> (not res!465974) (not e!397474))))

(assert (=> b!702160 (= res!465974 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!702161 () Bool)

(declare-fun res!465970 () Bool)

(assert (=> b!702161 (=> (not res!465970) (not e!397474))))

(assert (=> b!702161 (= res!465970 (not (contains!3842 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702162 () Bool)

(declare-fun res!465956 () Bool)

(assert (=> b!702162 (=> (not res!465956) (not e!397472))))

(assert (=> b!702162 (= res!465956 (not (contains!3842 lt!317669 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702163 () Bool)

(assert (=> b!702163 (= e!397472 (not (bvsle from!2969 (size!19609 a!3591))))))

(assert (=> b!702163 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317668)))

(declare-datatypes ((Unit!24582 0))(
  ( (Unit!24583) )
))
(declare-fun lt!317670 () Unit!24582)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40135 (_ BitVec 64) (_ BitVec 32) List!13265 List!13265) Unit!24582)

(assert (=> b!702163 (= lt!317670 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317669 lt!317668))))

(declare-fun b!702164 () Bool)

(declare-fun res!465959 () Bool)

(assert (=> b!702164 (=> (not res!465959) (not e!397474))))

(assert (=> b!702164 (= res!465959 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702165 () Bool)

(declare-fun res!465965 () Bool)

(assert (=> b!702165 (=> (not res!465965) (not e!397474))))

(assert (=> b!702165 (= res!465965 (not (contains!3842 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702166 () Bool)

(declare-fun res!465962 () Bool)

(assert (=> b!702166 (=> (not res!465962) (not e!397472))))

(assert (=> b!702166 (= res!465962 (subseq!287 lt!317669 lt!317668))))

(declare-fun res!465954 () Bool)

(assert (=> start!62456 (=> (not res!465954) (not e!397474))))

(assert (=> start!62456 (= res!465954 (and (bvslt (size!19609 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19609 a!3591))))))

(assert (=> start!62456 e!397474))

(assert (=> start!62456 true))

(declare-fun array_inv!15020 (array!40135) Bool)

(assert (=> start!62456 (array_inv!15020 a!3591)))

(declare-fun b!702167 () Bool)

(declare-fun res!465958 () Bool)

(assert (=> b!702167 (=> (not res!465958) (not e!397472))))

(assert (=> b!702167 (= res!465958 (= (-!252 lt!317668 k!2824) lt!317669))))

(declare-fun b!702168 () Bool)

(declare-fun res!465971 () Bool)

(assert (=> b!702168 (=> (not res!465971) (not e!397472))))

(assert (=> b!702168 (= res!465971 (noDuplicate!1089 lt!317668))))

(assert (= (and start!62456 res!465954) b!702155))

(assert (= (and b!702155 res!465960) b!702159))

(assert (= (and b!702159 res!465976) b!702149))

(assert (= (and b!702149 res!465968) b!702165))

(assert (= (and b!702165 res!465965) b!702160))

(assert (= (and b!702160 res!465974) b!702152))

(assert (= (and b!702152 res!465973) b!702144))

(assert (= (and b!702144 res!465950) b!702164))

(assert (= (and b!702164 res!465959) b!702142))

(assert (= (and b!702142 res!465978) b!702158))

(assert (= (and b!702158 res!465953) b!702145))

(assert (= (and b!702145 res!465969) b!702150))

(assert (= (and b!702150 res!465964) b!702161))

(assert (= (and b!702161 res!465970) b!702156))

(assert (= (and b!702156 res!465957) b!702141))

(assert (= (and b!702141 res!465966) b!702157))

(assert (= (and b!702157 res!465977) b!702154))

(assert (= (and b!702154 res!465951) b!702168))

(assert (= (and b!702168 res!465971) b!702162))

(assert (= (and b!702162 res!465956) b!702147))

(assert (= (and b!702147 res!465961) b!702148))

(assert (= (and b!702148 res!465972) b!702153))

(assert (= (and b!702153 res!465955) b!702140))

(assert (= (and b!702140 res!465967) b!702166))

(assert (= (and b!702166 res!465962) b!702146))

(assert (= (and b!702146 res!465963) b!702167))

(assert (= (and b!702167 res!465958) b!702151))

(assert (= (and b!702151 res!465975) b!702143))

(assert (= (and b!702143 res!465952) b!702163))

(declare-fun m!661315 () Bool)

(assert (=> b!702160 m!661315))

(declare-fun m!661317 () Bool)

(assert (=> b!702151 m!661317))

(declare-fun m!661319 () Bool)

(assert (=> b!702162 m!661319))

(declare-fun m!661321 () Bool)

(assert (=> b!702166 m!661321))

(declare-fun m!661323 () Bool)

(assert (=> b!702141 m!661323))

(assert (=> b!702141 m!661323))

(declare-fun m!661325 () Bool)

(assert (=> b!702141 m!661325))

(declare-fun m!661327 () Bool)

(assert (=> b!702168 m!661327))

(declare-fun m!661329 () Bool)

(assert (=> b!702143 m!661329))

(declare-fun m!661331 () Bool)

(assert (=> b!702155 m!661331))

(declare-fun m!661333 () Bool)

(assert (=> b!702161 m!661333))

(declare-fun m!661335 () Bool)

(assert (=> b!702164 m!661335))

(declare-fun m!661337 () Bool)

(assert (=> b!702144 m!661337))

(declare-fun m!661339 () Bool)

(assert (=> b!702165 m!661339))

(declare-fun m!661341 () Bool)

(assert (=> b!702147 m!661341))

(declare-fun m!661343 () Bool)

(assert (=> b!702145 m!661343))

(assert (=> b!702157 m!661323))

(assert (=> b!702157 m!661323))

(declare-fun m!661345 () Bool)

(assert (=> b!702157 m!661345))

(assert (=> b!702157 m!661323))

(declare-fun m!661347 () Bool)

(assert (=> b!702157 m!661347))

(declare-fun m!661349 () Bool)

(assert (=> b!702148 m!661349))

(declare-fun m!661351 () Bool)

(assert (=> b!702152 m!661351))

(declare-fun m!661353 () Bool)

(assert (=> b!702158 m!661353))

(declare-fun m!661355 () Bool)

(assert (=> b!702140 m!661355))

(declare-fun m!661357 () Bool)

(assert (=> b!702159 m!661357))

(declare-fun m!661359 () Bool)

(assert (=> b!702167 m!661359))

(declare-fun m!661361 () Bool)

(assert (=> b!702146 m!661361))

(declare-fun m!661363 () Bool)

(assert (=> b!702153 m!661363))

(declare-fun m!661365 () Bool)

(assert (=> b!702163 m!661365))

(declare-fun m!661367 () Bool)

(assert (=> b!702163 m!661367))

(declare-fun m!661369 () Bool)

(assert (=> start!62456 m!661369))

(declare-fun m!661371 () Bool)

(assert (=> b!702150 m!661371))

(declare-fun m!661373 () Bool)

(assert (=> b!702142 m!661373))

(declare-fun m!661375 () Bool)

(assert (=> b!702149 m!661375))

(declare-fun m!661377 () Bool)

(assert (=> b!702154 m!661377))

(push 1)

