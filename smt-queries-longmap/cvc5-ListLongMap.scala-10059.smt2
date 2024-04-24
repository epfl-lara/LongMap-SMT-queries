; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118704 () Bool)

(assert start!118704)

(declare-fun res!927312 () Bool)

(declare-fun e!785889 () Bool)

(assert (=> start!118704 (=> (not res!927312) (not e!785889))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118704 (= res!927312 (validMask!0 mask!2987))))

(assert (=> start!118704 e!785889))

(assert (=> start!118704 true))

(declare-datatypes ((array!94878 0))(
  ( (array!94879 (arr!45813 (Array (_ BitVec 32) (_ BitVec 64))) (size!46364 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94878)

(declare-fun array_inv!35094 (array!94878) Bool)

(assert (=> start!118704 (array_inv!35094 a!2938)))

(declare-fun b!1386849 () Bool)

(declare-fun res!927311 () Bool)

(assert (=> b!1386849 (=> (not res!927311) (not e!785889))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386849 (= res!927311 (and (= (size!46364 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46364 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46364 a!2938))))))

(declare-fun b!1386850 () Bool)

(declare-fun res!927313 () Bool)

(assert (=> b!1386850 (=> (not res!927313) (not e!785889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386850 (= res!927313 (validKeyInArray!0 (select (arr!45813 a!2938) i!1065)))))

(declare-fun b!1386852 () Bool)

(assert (=> b!1386852 (= e!785889 false)))

(declare-fun lt!609750 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94878 (_ BitVec 32)) Bool)

(assert (=> b!1386852 (= lt!609750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386851 () Bool)

(declare-fun res!927310 () Bool)

(assert (=> b!1386851 (=> (not res!927310) (not e!785889))))

(declare-datatypes ((List!32328 0))(
  ( (Nil!32325) (Cons!32324 (h!33542 (_ BitVec 64)) (t!47014 List!32328)) )
))
(declare-fun arrayNoDuplicates!0 (array!94878 (_ BitVec 32) List!32328) Bool)

(assert (=> b!1386851 (= res!927310 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32325))))

(assert (= (and start!118704 res!927312) b!1386849))

(assert (= (and b!1386849 res!927311) b!1386850))

(assert (= (and b!1386850 res!927313) b!1386851))

(assert (= (and b!1386851 res!927310) b!1386852))

(declare-fun m!1272465 () Bool)

(assert (=> start!118704 m!1272465))

(declare-fun m!1272467 () Bool)

(assert (=> start!118704 m!1272467))

(declare-fun m!1272469 () Bool)

(assert (=> b!1386850 m!1272469))

(assert (=> b!1386850 m!1272469))

(declare-fun m!1272471 () Bool)

(assert (=> b!1386850 m!1272471))

(declare-fun m!1272473 () Bool)

(assert (=> b!1386852 m!1272473))

(declare-fun m!1272475 () Bool)

(assert (=> b!1386851 m!1272475))

(push 1)

(assert (not start!118704))

(assert (not b!1386851))

(assert (not b!1386850))

(assert (not b!1386852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

