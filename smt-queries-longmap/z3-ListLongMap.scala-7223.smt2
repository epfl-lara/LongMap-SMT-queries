; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92634 () Bool)

(assert start!92634)

(declare-fun b!1051894 () Bool)

(declare-fun res!700220 () Bool)

(declare-fun e!597044 () Bool)

(assert (=> b!1051894 (=> (not res!700220) (not e!597044))))

(declare-datatypes ((array!66250 0))(
  ( (array!66251 (arr!31858 (Array (_ BitVec 32) (_ BitVec 64))) (size!32395 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66250)

(declare-datatypes ((List!22140 0))(
  ( (Nil!22137) (Cons!22136 (h!23354 (_ BitVec 64)) (t!31439 List!22140)) )
))
(declare-fun arrayNoDuplicates!0 (array!66250 (_ BitVec 32) List!22140) Bool)

(assert (=> b!1051894 (= res!700220 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22137))))

(declare-fun b!1051895 () Bool)

(declare-fun e!597046 () Bool)

(assert (=> b!1051895 (= e!597044 e!597046)))

(declare-fun res!700215 () Bool)

(assert (=> b!1051895 (=> (not res!700215) (not e!597046))))

(declare-fun lt!464530 () array!66250)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051895 (= res!700215 (arrayContainsKey!0 lt!464530 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051895 (= lt!464530 (array!66251 (store (arr!31858 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32395 a!3488)))))

(declare-fun b!1051896 () Bool)

(declare-fun e!597043 () Bool)

(assert (=> b!1051896 (= e!597043 (not true))))

(declare-fun lt!464531 () (_ BitVec 32))

(assert (=> b!1051896 (= (select (store (arr!31858 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464531) k0!2747)))

(declare-fun b!1051897 () Bool)

(assert (=> b!1051897 (= e!597046 e!597043)))

(declare-fun res!700218 () Bool)

(assert (=> b!1051897 (=> (not res!700218) (not e!597043))))

(assert (=> b!1051897 (= res!700218 (not (= lt!464531 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66250 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051897 (= lt!464531 (arrayScanForKey!0 lt!464530 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700217 () Bool)

(assert (=> start!92634 (=> (not res!700217) (not e!597044))))

(assert (=> start!92634 (= res!700217 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32395 a!3488)) (bvslt (size!32395 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92634 e!597044))

(assert (=> start!92634 true))

(declare-fun array_inv!24640 (array!66250) Bool)

(assert (=> start!92634 (array_inv!24640 a!3488)))

(declare-fun b!1051898 () Bool)

(declare-fun res!700216 () Bool)

(assert (=> b!1051898 (=> (not res!700216) (not e!597044))))

(assert (=> b!1051898 (= res!700216 (= (select (arr!31858 a!3488) i!1381) k0!2747))))

(declare-fun b!1051899 () Bool)

(declare-fun res!700219 () Bool)

(assert (=> b!1051899 (=> (not res!700219) (not e!597044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051899 (= res!700219 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92634 res!700217) b!1051894))

(assert (= (and b!1051894 res!700220) b!1051899))

(assert (= (and b!1051899 res!700219) b!1051898))

(assert (= (and b!1051898 res!700216) b!1051895))

(assert (= (and b!1051895 res!700215) b!1051897))

(assert (= (and b!1051897 res!700218) b!1051896))

(declare-fun m!972929 () Bool)

(assert (=> b!1051898 m!972929))

(declare-fun m!972931 () Bool)

(assert (=> start!92634 m!972931))

(declare-fun m!972933 () Bool)

(assert (=> b!1051896 m!972933))

(declare-fun m!972935 () Bool)

(assert (=> b!1051896 m!972935))

(declare-fun m!972937 () Bool)

(assert (=> b!1051895 m!972937))

(assert (=> b!1051895 m!972933))

(declare-fun m!972939 () Bool)

(assert (=> b!1051899 m!972939))

(declare-fun m!972941 () Bool)

(assert (=> b!1051894 m!972941))

(declare-fun m!972943 () Bool)

(assert (=> b!1051897 m!972943))

(check-sat (not b!1051899) (not b!1051894) (not b!1051895) (not start!92634) (not b!1051897))
(check-sat)
