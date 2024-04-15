; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118026 () Bool)

(assert start!118026)

(declare-fun b!1382165 () Bool)

(declare-fun res!923800 () Bool)

(declare-fun e!783438 () Bool)

(assert (=> b!1382165 (=> (not res!923800) (not e!783438))))

(declare-datatypes ((array!94342 0))(
  ( (array!94343 (arr!45552 (Array (_ BitVec 32) (_ BitVec 64))) (size!46104 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94342)

(declare-datatypes ((List!32164 0))(
  ( (Nil!32161) (Cons!32160 (h!33369 (_ BitVec 64)) (t!46850 List!32164)) )
))
(declare-fun arrayNoDuplicates!0 (array!94342 (_ BitVec 32) List!32164) Bool)

(assert (=> b!1382165 (= res!923800 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32161))))

(declare-fun res!923801 () Bool)

(assert (=> start!118026 (=> (not res!923801) (not e!783438))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118026 (= res!923801 (validMask!0 mask!3034))))

(assert (=> start!118026 e!783438))

(assert (=> start!118026 true))

(declare-fun array_inv!34785 (array!94342) Bool)

(assert (=> start!118026 (array_inv!34785 a!2971)))

(declare-fun b!1382163 () Bool)

(declare-fun res!923799 () Bool)

(assert (=> b!1382163 (=> (not res!923799) (not e!783438))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382163 (= res!923799 (and (= (size!46104 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46104 a!2971))))))

(declare-fun b!1382166 () Bool)

(assert (=> b!1382166 (= e!783438 false)))

(declare-fun lt!608192 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94342 (_ BitVec 32)) Bool)

(assert (=> b!1382166 (= lt!608192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382164 () Bool)

(declare-fun res!923798 () Bool)

(assert (=> b!1382164 (=> (not res!923798) (not e!783438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382164 (= res!923798 (validKeyInArray!0 (select (arr!45552 a!2971) i!1094)))))

(assert (= (and start!118026 res!923801) b!1382163))

(assert (= (and b!1382163 res!923799) b!1382164))

(assert (= (and b!1382164 res!923798) b!1382165))

(assert (= (and b!1382165 res!923800) b!1382166))

(declare-fun m!1266867 () Bool)

(assert (=> b!1382165 m!1266867))

(declare-fun m!1266869 () Bool)

(assert (=> start!118026 m!1266869))

(declare-fun m!1266871 () Bool)

(assert (=> start!118026 m!1266871))

(declare-fun m!1266873 () Bool)

(assert (=> b!1382166 m!1266873))

(declare-fun m!1266875 () Bool)

(assert (=> b!1382164 m!1266875))

(assert (=> b!1382164 m!1266875))

(declare-fun m!1266877 () Bool)

(assert (=> b!1382164 m!1266877))

(push 1)

(assert (not start!118026))

(assert (not b!1382165))

(assert (not b!1382166))

(assert (not b!1382164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

