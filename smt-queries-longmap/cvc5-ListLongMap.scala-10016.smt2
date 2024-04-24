; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118416 () Bool)

(assert start!118416)

(declare-fun res!925081 () Bool)

(declare-fun e!784711 () Bool)

(assert (=> start!118416 (=> (not res!925081) (not e!784711))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118416 (= res!925081 (validMask!0 mask!2987))))

(assert (=> start!118416 e!784711))

(assert (=> start!118416 true))

(declare-datatypes ((array!94617 0))(
  ( (array!94618 (arr!45684 (Array (_ BitVec 32) (_ BitVec 64))) (size!46235 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94617)

(declare-fun array_inv!34965 (array!94617) Bool)

(assert (=> start!118416 (array_inv!34965 a!2938)))

(declare-fun b!1384276 () Bool)

(declare-fun res!925080 () Bool)

(assert (=> b!1384276 (=> (not res!925080) (not e!784711))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384276 (= res!925080 (and (= (size!46235 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46235 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46235 a!2938))))))

(declare-fun b!1384277 () Bool)

(declare-fun res!925079 () Bool)

(assert (=> b!1384277 (=> (not res!925079) (not e!784711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384277 (= res!925079 (validKeyInArray!0 (select (arr!45684 a!2938) i!1065)))))

(declare-fun b!1384278 () Bool)

(assert (=> b!1384278 (= e!784711 false)))

(declare-fun lt!608985 () Bool)

(declare-datatypes ((List!32199 0))(
  ( (Nil!32196) (Cons!32195 (h!33413 (_ BitVec 64)) (t!46885 List!32199)) )
))
(declare-fun arrayNoDuplicates!0 (array!94617 (_ BitVec 32) List!32199) Bool)

(assert (=> b!1384278 (= lt!608985 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32196))))

(assert (= (and start!118416 res!925081) b!1384276))

(assert (= (and b!1384276 res!925080) b!1384277))

(assert (= (and b!1384277 res!925079) b!1384278))

(declare-fun m!1269707 () Bool)

(assert (=> start!118416 m!1269707))

(declare-fun m!1269709 () Bool)

(assert (=> start!118416 m!1269709))

(declare-fun m!1269711 () Bool)

(assert (=> b!1384277 m!1269711))

(assert (=> b!1384277 m!1269711))

(declare-fun m!1269713 () Bool)

(assert (=> b!1384277 m!1269713))

(declare-fun m!1269715 () Bool)

(assert (=> b!1384278 m!1269715))

(push 1)

(assert (not b!1384277))

(assert (not start!118416))

(assert (not b!1384278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

