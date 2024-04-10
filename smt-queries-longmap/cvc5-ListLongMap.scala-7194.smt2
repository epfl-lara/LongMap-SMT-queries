; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92196 () Bool)

(assert start!92196)

(declare-fun b!1048165 () Bool)

(declare-fun e!594468 () Bool)

(declare-datatypes ((array!66024 0))(
  ( (array!66025 (arr!31753 (Array (_ BitVec 32) (_ BitVec 64))) (size!32289 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66024)

(assert (=> b!1048165 (= e!594468 (bvsge #b00000000000000000000000000000000 (size!32289 a!3488)))))

(declare-fun b!1048166 () Bool)

(declare-fun res!697328 () Bool)

(assert (=> b!1048166 (=> (not res!697328) (not e!594468))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048166 (= res!697328 (arrayContainsKey!0 (array!66025 (store (arr!31753 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32289 a!3488)) k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048167 () Bool)

(declare-fun res!697329 () Bool)

(assert (=> b!1048167 (=> (not res!697329) (not e!594468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048167 (= res!697329 (validKeyInArray!0 k!2747))))

(declare-fun res!697331 () Bool)

(assert (=> start!92196 (=> (not res!697331) (not e!594468))))

(assert (=> start!92196 (= res!697331 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32289 a!3488)) (bvslt (size!32289 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92196 e!594468))

(assert (=> start!92196 true))

(declare-fun array_inv!24533 (array!66024) Bool)

(assert (=> start!92196 (array_inv!24533 a!3488)))

(declare-fun b!1048168 () Bool)

(declare-fun res!697330 () Bool)

(assert (=> b!1048168 (=> (not res!697330) (not e!594468))))

(declare-datatypes ((List!22065 0))(
  ( (Nil!22062) (Cons!22061 (h!23270 (_ BitVec 64)) (t!31372 List!22065)) )
))
(declare-fun arrayNoDuplicates!0 (array!66024 (_ BitVec 32) List!22065) Bool)

(assert (=> b!1048168 (= res!697330 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22062))))

(declare-fun b!1048169 () Bool)

(declare-fun res!697327 () Bool)

(assert (=> b!1048169 (=> (not res!697327) (not e!594468))))

(assert (=> b!1048169 (= res!697327 (= (select (arr!31753 a!3488) i!1381) k!2747))))

(assert (= (and start!92196 res!697331) b!1048168))

(assert (= (and b!1048168 res!697330) b!1048167))

(assert (= (and b!1048167 res!697329) b!1048169))

(assert (= (and b!1048169 res!697327) b!1048166))

(assert (= (and b!1048166 res!697328) b!1048165))

(declare-fun m!969191 () Bool)

(assert (=> b!1048166 m!969191))

(declare-fun m!969193 () Bool)

(assert (=> b!1048166 m!969193))

(declare-fun m!969195 () Bool)

(assert (=> b!1048168 m!969195))

(declare-fun m!969197 () Bool)

(assert (=> start!92196 m!969197))

(declare-fun m!969199 () Bool)

(assert (=> b!1048169 m!969199))

(declare-fun m!969201 () Bool)

(assert (=> b!1048167 m!969201))

(push 1)

(assert (not b!1048168))

(assert (not b!1048166))

(assert (not start!92196))

