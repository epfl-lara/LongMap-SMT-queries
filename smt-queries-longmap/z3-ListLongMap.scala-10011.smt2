; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118316 () Bool)

(assert start!118316)

(declare-fun res!924832 () Bool)

(declare-fun e!784539 () Bool)

(assert (=> start!118316 (=> (not res!924832) (not e!784539))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118316 (= res!924832 (validMask!0 mask!2987))))

(assert (=> start!118316 e!784539))

(assert (=> start!118316 true))

(declare-datatypes ((array!94576 0))(
  ( (array!94577 (arr!45667 (Array (_ BitVec 32) (_ BitVec 64))) (size!46218 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94576)

(declare-fun array_inv!34948 (array!94576) Bool)

(assert (=> start!118316 (array_inv!34948 a!2938)))

(declare-fun b!1384027 () Bool)

(declare-fun res!924831 () Bool)

(assert (=> b!1384027 (=> (not res!924831) (not e!784539))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384027 (= res!924831 (and (= (size!46218 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46218 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46218 a!2938))))))

(declare-fun b!1384028 () Bool)

(declare-fun res!924830 () Bool)

(assert (=> b!1384028 (=> (not res!924830) (not e!784539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384028 (= res!924830 (validKeyInArray!0 (select (arr!45667 a!2938) i!1065)))))

(declare-fun b!1384029 () Bool)

(assert (=> b!1384029 (= e!784539 (bvsgt #b00000000000000000000000000000000 (size!46218 a!2938)))))

(assert (= (and start!118316 res!924832) b!1384027))

(assert (= (and b!1384027 res!924831) b!1384028))

(assert (= (and b!1384028 res!924830) b!1384029))

(declare-fun m!1269483 () Bool)

(assert (=> start!118316 m!1269483))

(declare-fun m!1269485 () Bool)

(assert (=> start!118316 m!1269485))

(declare-fun m!1269487 () Bool)

(assert (=> b!1384028 m!1269487))

(assert (=> b!1384028 m!1269487))

(declare-fun m!1269489 () Bool)

(assert (=> b!1384028 m!1269489))

(check-sat (not b!1384028) (not start!118316))
(check-sat)
