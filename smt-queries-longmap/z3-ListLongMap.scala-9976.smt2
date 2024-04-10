; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117794 () Bool)

(assert start!117794)

(declare-fun res!922856 () Bool)

(declare-fun e!782936 () Bool)

(assert (=> start!117794 (=> (not res!922856) (not e!782936))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117794 (= res!922856 (validMask!0 mask!3034))))

(assert (=> start!117794 e!782936))

(assert (=> start!117794 true))

(declare-datatypes ((array!94246 0))(
  ( (array!94247 (arr!45510 (Array (_ BitVec 32) (_ BitVec 64))) (size!46060 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94246)

(declare-fun array_inv!34538 (array!94246) Bool)

(assert (=> start!117794 (array_inv!34538 a!2971)))

(declare-fun b!1381228 () Bool)

(declare-fun res!922858 () Bool)

(assert (=> b!1381228 (=> (not res!922858) (not e!782936))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381228 (= res!922858 (and (= (size!46060 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46060 a!2971))))))

(declare-fun b!1381229 () Bool)

(declare-fun res!922857 () Bool)

(assert (=> b!1381229 (=> (not res!922857) (not e!782936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381229 (= res!922857 (validKeyInArray!0 (select (arr!45510 a!2971) i!1094)))))

(declare-fun b!1381230 () Bool)

(assert (=> b!1381230 (= e!782936 (bvsgt #b00000000000000000000000000000000 (size!46060 a!2971)))))

(assert (= (and start!117794 res!922856) b!1381228))

(assert (= (and b!1381228 res!922858) b!1381229))

(assert (= (and b!1381229 res!922857) b!1381230))

(declare-fun m!1266437 () Bool)

(assert (=> start!117794 m!1266437))

(declare-fun m!1266439 () Bool)

(assert (=> start!117794 m!1266439))

(declare-fun m!1266441 () Bool)

(assert (=> b!1381229 m!1266441))

(assert (=> b!1381229 m!1266441))

(declare-fun m!1266443 () Bool)

(assert (=> b!1381229 m!1266443))

(check-sat (not b!1381229) (not start!117794))
(check-sat)
