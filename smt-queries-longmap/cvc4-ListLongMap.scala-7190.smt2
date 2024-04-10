; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92158 () Bool)

(assert start!92158)

(declare-fun res!697228 () Bool)

(declare-fun e!594365 () Bool)

(assert (=> start!92158 (=> (not res!697228) (not e!594365))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66001 0))(
  ( (array!66002 (arr!31743 (Array (_ BitVec 32) (_ BitVec 64))) (size!32279 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66001)

(assert (=> start!92158 (= res!697228 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32279 a!3488)) (bvslt (size!32279 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32279 a!3488))))))

(assert (=> start!92158 e!594365))

(assert (=> start!92158 true))

(declare-fun array_inv!24523 (array!66001) Bool)

(assert (=> start!92158 (array_inv!24523 a!3488)))

(declare-fun b!1048065 () Bool)

(declare-fun res!697227 () Bool)

(assert (=> b!1048065 (=> (not res!697227) (not e!594365))))

(declare-datatypes ((List!22055 0))(
  ( (Nil!22052) (Cons!22051 (h!23260 (_ BitVec 64)) (t!31362 List!22055)) )
))
(declare-fun noDuplicate!1490 (List!22055) Bool)

(assert (=> b!1048065 (= res!697227 (noDuplicate!1490 Nil!22052))))

(declare-fun b!1048066 () Bool)

(declare-fun e!594366 () Bool)

(assert (=> b!1048066 (= e!594365 e!594366)))

(declare-fun res!697229 () Bool)

(assert (=> b!1048066 (=> res!697229 e!594366)))

(declare-fun contains!6102 (List!22055 (_ BitVec 64)) Bool)

(assert (=> b!1048066 (= res!697229 (contains!6102 Nil!22052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048067 () Bool)

(assert (=> b!1048067 (= e!594366 (contains!6102 Nil!22052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92158 res!697228) b!1048065))

(assert (= (and b!1048065 res!697227) b!1048066))

(assert (= (and b!1048066 (not res!697229)) b!1048067))

(declare-fun m!969093 () Bool)

(assert (=> start!92158 m!969093))

(declare-fun m!969095 () Bool)

(assert (=> b!1048065 m!969095))

(declare-fun m!969097 () Bool)

(assert (=> b!1048066 m!969097))

(declare-fun m!969099 () Bool)

(assert (=> b!1048067 m!969099))

(push 1)

(assert (not b!1048066))

(assert (not start!92158))

(assert (not b!1048067))

(assert (not b!1048065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127629 () Bool)

(declare-fun lt!463109 () Bool)

(declare-fun content!528 (List!22055) (Set (_ BitVec 64)))

(assert (=> d!127629 (= lt!463109 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!528 Nil!22052)))))

(declare-fun e!594401 () Bool)

(assert (=> d!127629 (= lt!463109 e!594401)))

(declare-fun res!697262 () Bool)

(assert (=> d!127629 (=> (not res!697262) (not e!594401))))

(assert (=> d!127629 (= res!697262 (is-Cons!22051 Nil!22052))))

(assert (=> d!127629 (= (contains!6102 Nil!22052 #b0000000000000000000000000000000000000000000000000000000000000000) lt!463109)))

(declare-fun b!1048100 () Bool)

(declare-fun e!594400 () Bool)

(assert (=> b!1048100 (= e!594401 e!594400)))

(declare-fun res!697263 () Bool)

(assert (=> b!1048100 (=> res!697263 e!594400)))

(assert (=> b!1048100 (= res!697263 (= (h!23260 Nil!22052) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048101 () Bool)

(assert (=> b!1048101 (= e!594400 (contains!6102 (t!31362 Nil!22052) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127629 res!697262) b!1048100))

