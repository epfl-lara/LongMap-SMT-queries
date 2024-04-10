; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104126 () Bool)

(assert start!104126)

(declare-fun res!830574 () Bool)

(declare-fun e!705848 () Bool)

(assert (=> start!104126 (=> (not res!830574) (not e!705848))))

(declare-datatypes ((array!80111 0))(
  ( (array!80112 (arr!38643 (Array (_ BitVec 32) (_ BitVec 64))) (size!39179 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80111)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104126 (= res!830574 (and (bvslt (size!39179 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39179 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39179 a!3892))))))

(assert (=> start!104126 e!705848))

(declare-fun array_inv!29491 (array!80111) Bool)

(assert (=> start!104126 (array_inv!29491 a!3892)))

(assert (=> start!104126 true))

(declare-fun b!1245055 () Bool)

(declare-fun res!830575 () Bool)

(assert (=> b!1245055 (=> (not res!830575) (not e!705848))))

(declare-datatypes ((List!27446 0))(
  ( (Nil!27443) (Cons!27442 (h!28651 (_ BitVec 64)) (t!40915 List!27446)) )
))
(declare-fun arrayNoDuplicates!0 (array!80111 (_ BitVec 32) List!27446) Bool)

(assert (=> b!1245055 (= res!830575 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27443))))

(declare-fun b!1245056 () Bool)

(assert (=> b!1245056 (= e!705848 (and (= from!3270 newFrom!287) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104126 res!830574) b!1245055))

(assert (= (and b!1245055 res!830575) b!1245056))

(declare-fun m!1147207 () Bool)

(assert (=> start!104126 m!1147207))

(declare-fun m!1147209 () Bool)

(assert (=> b!1245055 m!1147209))

(check-sat (not start!104126) (not b!1245055))
