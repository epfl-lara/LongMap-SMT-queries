; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92198 () Bool)

(assert start!92198)

(declare-fun b!1048180 () Bool)

(declare-fun e!594475 () Bool)

(declare-datatypes ((array!66026 0))(
  ( (array!66027 (arr!31754 (Array (_ BitVec 32) (_ BitVec 64))) (size!32290 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66026)

(assert (=> b!1048180 (= e!594475 (bvsge #b00000000000000000000000000000000 (size!32290 a!3488)))))

(declare-fun b!1048181 () Bool)

(declare-fun res!697345 () Bool)

(assert (=> b!1048181 (=> (not res!697345) (not e!594475))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048181 (= res!697345 (arrayContainsKey!0 (array!66027 (store (arr!31754 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32290 a!3488)) k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!697342 () Bool)

(assert (=> start!92198 (=> (not res!697342) (not e!594475))))

(assert (=> start!92198 (= res!697342 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32290 a!3488)) (bvslt (size!32290 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92198 e!594475))

(assert (=> start!92198 true))

(declare-fun array_inv!24534 (array!66026) Bool)

(assert (=> start!92198 (array_inv!24534 a!3488)))

(declare-fun b!1048182 () Bool)

(declare-fun res!697344 () Bool)

(assert (=> b!1048182 (=> (not res!697344) (not e!594475))))

(declare-datatypes ((List!22066 0))(
  ( (Nil!22063) (Cons!22062 (h!23271 (_ BitVec 64)) (t!31373 List!22066)) )
))
(declare-fun arrayNoDuplicates!0 (array!66026 (_ BitVec 32) List!22066) Bool)

(assert (=> b!1048182 (= res!697344 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22063))))

(declare-fun b!1048183 () Bool)

(declare-fun res!697343 () Bool)

(assert (=> b!1048183 (=> (not res!697343) (not e!594475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048183 (= res!697343 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048184 () Bool)

(declare-fun res!697346 () Bool)

(assert (=> b!1048184 (=> (not res!697346) (not e!594475))))

(assert (=> b!1048184 (= res!697346 (= (select (arr!31754 a!3488) i!1381) k0!2747))))

(assert (= (and start!92198 res!697342) b!1048182))

(assert (= (and b!1048182 res!697344) b!1048183))

(assert (= (and b!1048183 res!697343) b!1048184))

(assert (= (and b!1048184 res!697346) b!1048181))

(assert (= (and b!1048181 res!697345) b!1048180))

(declare-fun m!969203 () Bool)

(assert (=> b!1048181 m!969203))

(declare-fun m!969205 () Bool)

(assert (=> b!1048181 m!969205))

(declare-fun m!969207 () Bool)

(assert (=> b!1048184 m!969207))

(declare-fun m!969209 () Bool)

(assert (=> b!1048182 m!969209))

(declare-fun m!969211 () Bool)

(assert (=> b!1048183 m!969211))

(declare-fun m!969213 () Bool)

(assert (=> start!92198 m!969213))

(check-sat (not b!1048182) (not b!1048183) (not b!1048181) (not start!92198))
(check-sat)
