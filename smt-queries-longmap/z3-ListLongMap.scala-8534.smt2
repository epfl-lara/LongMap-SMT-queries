; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104096 () Bool)

(assert start!104096)

(declare-fun b!1244938 () Bool)

(declare-fun e!705750 () Bool)

(declare-datatypes ((List!27443 0))(
  ( (Nil!27440) (Cons!27439 (h!28648 (_ BitVec 64)) (t!40912 List!27443)) )
))
(declare-fun contains!7436 (List!27443 (_ BitVec 64)) Bool)

(assert (=> b!1244938 (= e!705750 (contains!7436 Nil!27440 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244939 () Bool)

(declare-fun e!705748 () Bool)

(assert (=> b!1244939 (= e!705748 e!705750)))

(declare-fun res!830479 () Bool)

(assert (=> b!1244939 (=> res!830479 e!705750)))

(assert (=> b!1244939 (= res!830479 (contains!7436 Nil!27440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!830475 () Bool)

(assert (=> start!104096 (=> (not res!830475) (not e!705748))))

(declare-datatypes ((array!80102 0))(
  ( (array!80103 (arr!38640 (Array (_ BitVec 32) (_ BitVec 64))) (size!39176 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80102)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104096 (= res!830475 (and (bvslt (size!39176 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39176 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39176 a!3892))))))

(assert (=> start!104096 e!705748))

(declare-fun array_inv!29488 (array!80102) Bool)

(assert (=> start!104096 (array_inv!29488 a!3892)))

(assert (=> start!104096 true))

(declare-fun b!1244940 () Bool)

(declare-fun res!830476 () Bool)

(assert (=> b!1244940 (=> (not res!830476) (not e!705748))))

(declare-fun arrayNoDuplicates!0 (array!80102 (_ BitVec 32) List!27443) Bool)

(assert (=> b!1244940 (= res!830476 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27440))))

(declare-fun b!1244941 () Bool)

(declare-fun res!830477 () Bool)

(assert (=> b!1244941 (=> (not res!830477) (not e!705748))))

(declare-fun noDuplicate!2015 (List!27443) Bool)

(assert (=> b!1244941 (= res!830477 (noDuplicate!2015 Nil!27440))))

(declare-fun b!1244942 () Bool)

(declare-fun res!830478 () Bool)

(assert (=> b!1244942 (=> (not res!830478) (not e!705748))))

(assert (=> b!1244942 (= res!830478 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39176 a!3892)) (= newFrom!287 (size!39176 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104096 res!830475) b!1244940))

(assert (= (and b!1244940 res!830476) b!1244942))

(assert (= (and b!1244942 res!830478) b!1244941))

(assert (= (and b!1244941 res!830477) b!1244939))

(assert (= (and b!1244939 (not res!830479)) b!1244938))

(declare-fun m!1147117 () Bool)

(assert (=> b!1244941 m!1147117))

(declare-fun m!1147119 () Bool)

(assert (=> b!1244939 m!1147119))

(declare-fun m!1147121 () Bool)

(assert (=> b!1244940 m!1147121))

(declare-fun m!1147123 () Bool)

(assert (=> start!104096 m!1147123))

(declare-fun m!1147125 () Bool)

(assert (=> b!1244938 m!1147125))

(check-sat (not b!1244938) (not start!104096) (not b!1244940) (not b!1244939) (not b!1244941))
(check-sat)
(get-model)

(declare-fun d!137271 () Bool)

(declare-fun lt!562858 () Bool)

(define-sort InoxSet (T) (Array T Bool))

