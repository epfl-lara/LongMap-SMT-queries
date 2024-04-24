; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92430 () Bool)

(assert start!92430)

(declare-fun b!1049480 () Bool)

(declare-fun res!697841 () Bool)

(declare-fun e!595312 () Bool)

(assert (=> b!1049480 (=> (not res!697841) (not e!595312))))

(declare-datatypes ((array!66073 0))(
  ( (array!66074 (arr!31771 (Array (_ BitVec 32) (_ BitVec 64))) (size!32308 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66073)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049480 (= res!697841 (= (select (arr!31771 a!3488) i!1381) k0!2747))))

(declare-fun b!1049481 () Bool)

(declare-fun res!697837 () Bool)

(assert (=> b!1049481 (=> (not res!697837) (not e!595312))))

(declare-datatypes ((List!22053 0))(
  ( (Nil!22050) (Cons!22049 (h!23267 (_ BitVec 64)) (t!31352 List!22053)) )
))
(declare-fun arrayNoDuplicates!0 (array!66073 (_ BitVec 32) List!22053) Bool)

(assert (=> b!1049481 (= res!697837 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22050))))

(declare-fun b!1049482 () Bool)

(declare-fun res!697840 () Bool)

(assert (=> b!1049482 (=> (not res!697840) (not e!595312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049482 (= res!697840 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049483 () Bool)

(declare-fun res!697838 () Bool)

(assert (=> b!1049483 (=> (not res!697838) (not e!595312))))

(declare-fun arrayContainsKey!0 (array!66073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049483 (= res!697838 (arrayContainsKey!0 (array!66074 (store (arr!31771 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32308 a!3488)) k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!697839 () Bool)

(assert (=> start!92430 (=> (not res!697839) (not e!595312))))

(assert (=> start!92430 (= res!697839 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32308 a!3488)) (bvslt (size!32308 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92430 e!595312))

(assert (=> start!92430 true))

(declare-fun array_inv!24553 (array!66073) Bool)

(assert (=> start!92430 (array_inv!24553 a!3488)))

(declare-fun b!1049484 () Bool)

(assert (=> b!1049484 (= e!595312 (bvsge #b00000000000000000000000000000000 (size!32308 a!3488)))))

(assert (= (and start!92430 res!697839) b!1049481))

(assert (= (and b!1049481 res!697837) b!1049482))

(assert (= (and b!1049482 res!697840) b!1049480))

(assert (= (and b!1049480 res!697841) b!1049483))

(assert (= (and b!1049483 res!697838) b!1049484))

(declare-fun m!970859 () Bool)

(assert (=> b!1049482 m!970859))

(declare-fun m!970861 () Bool)

(assert (=> b!1049481 m!970861))

(declare-fun m!970863 () Bool)

(assert (=> start!92430 m!970863))

(declare-fun m!970865 () Bool)

(assert (=> b!1049480 m!970865))

(declare-fun m!970867 () Bool)

(assert (=> b!1049483 m!970867))

(declare-fun m!970869 () Bool)

(assert (=> b!1049483 m!970869))

(check-sat (not start!92430) (not b!1049482) (not b!1049483) (not b!1049481))
(check-sat)
