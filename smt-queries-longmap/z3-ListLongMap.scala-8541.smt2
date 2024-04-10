; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104204 () Bool)

(assert start!104204)

(declare-fun res!830809 () Bool)

(declare-fun e!706097 () Bool)

(assert (=> start!104204 (=> (not res!830809) (not e!706097))))

(declare-datatypes ((array!80153 0))(
  ( (array!80154 (arr!38661 (Array (_ BitVec 32) (_ BitVec 64))) (size!39197 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80153)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104204 (= res!830809 (and (bvslt (size!39197 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39197 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39197 a!3892))))))

(assert (=> start!104204 e!706097))

(declare-fun array_inv!29509 (array!80153) Bool)

(assert (=> start!104204 (array_inv!29509 a!3892)))

(assert (=> start!104204 true))

(declare-fun b!1245326 () Bool)

(assert (=> b!1245326 (= e!706097 false)))

(declare-fun lt!562895 () Bool)

(declare-datatypes ((List!27464 0))(
  ( (Nil!27461) (Cons!27460 (h!28669 (_ BitVec 64)) (t!40933 List!27464)) )
))
(declare-fun arrayNoDuplicates!0 (array!80153 (_ BitVec 32) List!27464) Bool)

(assert (=> b!1245326 (= lt!562895 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27461))))

(assert (= (and start!104204 res!830809) b!1245326))

(declare-fun m!1147405 () Bool)

(assert (=> start!104204 m!1147405))

(declare-fun m!1147407 () Bool)

(assert (=> b!1245326 m!1147407))

(check-sat (not start!104204) (not b!1245326))
