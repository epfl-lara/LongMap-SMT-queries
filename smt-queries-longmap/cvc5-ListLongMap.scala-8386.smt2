; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102232 () Bool)

(assert start!102232)

(declare-fun b!1229392 () Bool)

(declare-fun res!817223 () Bool)

(declare-fun e!697968 () Bool)

(assert (=> b!1229392 (=> (not res!817223) (not e!697968))))

(declare-datatypes ((array!79305 0))(
  ( (array!79306 (arr!38269 (Array (_ BitVec 32) (_ BitVec 64))) (size!38806 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79305)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229392 (= res!817223 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(declare-fun b!1229393 () Bool)

(declare-fun res!817229 () Bool)

(assert (=> b!1229393 (=> (not res!817229) (not e!697968))))

(declare-datatypes ((List!27055 0))(
  ( (Nil!27052) (Cons!27051 (h!28269 (_ BitVec 64)) (t!40510 List!27055)) )
))
(declare-fun acc!823 () List!27055)

(declare-fun arrayNoDuplicates!0 (array!79305 (_ BitVec 32) List!27055) Bool)

(assert (=> b!1229393 (= res!817229 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229394 () Bool)

(declare-fun res!817226 () Bool)

(assert (=> b!1229394 (=> (not res!817226) (not e!697968))))

(declare-fun contains!7126 (List!27055 (_ BitVec 64)) Bool)

(assert (=> b!1229394 (= res!817226 (not (contains!7126 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229395 () Bool)

(declare-fun res!817224 () Bool)

(declare-fun e!697969 () Bool)

(assert (=> b!1229395 (=> res!817224 e!697969)))

(declare-fun subseq!496 (List!27055 List!27055) Bool)

(assert (=> b!1229395 (= res!817224 (not (subseq!496 Nil!27052 acc!823)))))

(declare-fun b!1229396 () Bool)

(declare-fun res!817234 () Bool)

(assert (=> b!1229396 (=> (not res!817234) (not e!697968))))

(declare-fun noDuplicate!1707 (List!27055) Bool)

(assert (=> b!1229396 (= res!817234 (noDuplicate!1707 acc!823))))

(declare-fun res!817233 () Bool)

(assert (=> start!102232 (=> (not res!817233) (not e!697968))))

(assert (=> start!102232 (= res!817233 (bvslt (size!38806 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102232 e!697968))

(declare-fun array_inv!29207 (array!79305) Bool)

(assert (=> start!102232 (array_inv!29207 a!3806)))

(assert (=> start!102232 true))

(declare-fun b!1229397 () Bool)

(declare-fun res!817232 () Bool)

(assert (=> b!1229397 (=> (not res!817232) (not e!697968))))

(assert (=> b!1229397 (= res!817232 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38806 a!3806)) (bvslt from!3184 (size!38806 a!3806))))))

(declare-fun b!1229398 () Bool)

(declare-fun res!817227 () Bool)

(assert (=> b!1229398 (=> (not res!817227) (not e!697968))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1229398 (= res!817227 (validKeyInArray!0 k!2913))))

(declare-fun b!1229399 () Bool)

(declare-fun res!817225 () Bool)

(assert (=> b!1229399 (=> res!817225 e!697969)))

(assert (=> b!1229399 (= res!817225 (contains!7126 Nil!27052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229400 () Bool)

(declare-fun res!817231 () Bool)

(assert (=> b!1229400 (=> (not res!817231) (not e!697968))))

(declare-fun arrayContainsKey!0 (array!79305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229400 (= res!817231 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229401 () Bool)

(assert (=> b!1229401 (= e!697968 (not e!697969))))

(declare-fun res!817235 () Bool)

(assert (=> b!1229401 (=> res!817235 e!697969)))

(assert (=> b!1229401 (= res!817235 (bvsgt from!3184 (size!38806 a!3806)))))

(assert (=> b!1229401 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27051 (select (arr!38269 a!3806) from!3184) acc!823))))

(declare-fun b!1229402 () Bool)

(declare-fun res!817228 () Bool)

(assert (=> b!1229402 (=> res!817228 e!697969)))

(assert (=> b!1229402 (= res!817228 (contains!7126 Nil!27052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229403 () Bool)

(assert (=> b!1229403 (= e!697969 true)))

(declare-datatypes ((Unit!40653 0))(
  ( (Unit!40654) )
))
(declare-fun lt!559446 () Unit!40653)

(declare-fun noDuplicateSubseq!49 (List!27055 List!27055) Unit!40653)

(assert (=> b!1229403 (= lt!559446 (noDuplicateSubseq!49 Nil!27052 acc!823))))

(declare-fun b!1229404 () Bool)

(declare-fun res!817230 () Bool)

(assert (=> b!1229404 (=> (not res!817230) (not e!697968))))

(assert (=> b!1229404 (= res!817230 (not (contains!7126 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102232 res!817233) b!1229398))

(assert (= (and b!1229398 res!817227) b!1229397))

(assert (= (and b!1229397 res!817232) b!1229396))

(assert (= (and b!1229396 res!817234) b!1229394))

(assert (= (and b!1229394 res!817226) b!1229404))

(assert (= (and b!1229404 res!817230) b!1229400))

(assert (= (and b!1229400 res!817231) b!1229393))

(assert (= (and b!1229393 res!817229) b!1229392))

(assert (= (and b!1229392 res!817223) b!1229401))

(assert (= (and b!1229401 (not res!817235)) b!1229402))

(assert (= (and b!1229402 (not res!817228)) b!1229399))

(assert (= (and b!1229399 (not res!817225)) b!1229395))

(assert (= (and b!1229395 (not res!817224)) b!1229403))

(declare-fun m!1134293 () Bool)

(assert (=> b!1229400 m!1134293))

(declare-fun m!1134295 () Bool)

(assert (=> b!1229402 m!1134295))

(declare-fun m!1134297 () Bool)

(assert (=> b!1229393 m!1134297))

(declare-fun m!1134299 () Bool)

(assert (=> b!1229404 m!1134299))

(declare-fun m!1134301 () Bool)

(assert (=> b!1229396 m!1134301))

(declare-fun m!1134303 () Bool)

(assert (=> b!1229395 m!1134303))

(declare-fun m!1134305 () Bool)

(assert (=> b!1229394 m!1134305))

(declare-fun m!1134307 () Bool)

(assert (=> b!1229392 m!1134307))

(assert (=> b!1229392 m!1134307))

(declare-fun m!1134309 () Bool)

(assert (=> b!1229392 m!1134309))

(declare-fun m!1134311 () Bool)

(assert (=> b!1229398 m!1134311))

(declare-fun m!1134313 () Bool)

(assert (=> start!102232 m!1134313))

(assert (=> b!1229401 m!1134307))

(declare-fun m!1134315 () Bool)

(assert (=> b!1229401 m!1134315))

(declare-fun m!1134317 () Bool)

(assert (=> b!1229399 m!1134317))

(declare-fun m!1134319 () Bool)

(assert (=> b!1229403 m!1134319))

(push 1)

(assert (not b!1229404))

(assert (not b!1229394))

(assert (not b!1229402))

(assert (not b!1229392))

(assert (not start!102232))

(assert (not b!1229396))

(assert (not b!1229395))

(assert (not b!1229399))

(assert (not b!1229398))

(assert (not b!1229400))

(assert (not b!1229393))

(assert (not b!1229401))

(assert (not b!1229403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

