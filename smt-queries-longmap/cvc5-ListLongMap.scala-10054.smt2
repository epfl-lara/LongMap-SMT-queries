; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118674 () Bool)

(assert start!118674)

(declare-fun b!1386671 () Bool)

(declare-fun res!927132 () Bool)

(declare-fun e!785799 () Bool)

(assert (=> b!1386671 (=> (not res!927132) (not e!785799))))

(declare-datatypes ((array!94848 0))(
  ( (array!94849 (arr!45798 (Array (_ BitVec 32) (_ BitVec 64))) (size!46349 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94848)

(declare-datatypes ((List!32313 0))(
  ( (Nil!32310) (Cons!32309 (h!33527 (_ BitVec 64)) (t!46999 List!32313)) )
))
(declare-fun arrayNoDuplicates!0 (array!94848 (_ BitVec 32) List!32313) Bool)

(assert (=> b!1386671 (= res!927132 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32310))))

(declare-fun b!1386670 () Bool)

(declare-fun res!927133 () Bool)

(assert (=> b!1386670 (=> (not res!927133) (not e!785799))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386670 (= res!927133 (validKeyInArray!0 (select (arr!45798 a!2938) i!1065)))))

(declare-fun res!927131 () Bool)

(assert (=> start!118674 (=> (not res!927131) (not e!785799))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118674 (= res!927131 (validMask!0 mask!2987))))

(assert (=> start!118674 e!785799))

(assert (=> start!118674 true))

(declare-fun array_inv!35079 (array!94848) Bool)

(assert (=> start!118674 (array_inv!35079 a!2938)))

(declare-fun b!1386672 () Bool)

(assert (=> b!1386672 (= e!785799 false)))

(declare-fun lt!609705 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94848 (_ BitVec 32)) Bool)

(assert (=> b!1386672 (= lt!609705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386669 () Bool)

(declare-fun res!927130 () Bool)

(assert (=> b!1386669 (=> (not res!927130) (not e!785799))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386669 (= res!927130 (and (= (size!46349 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46349 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46349 a!2938))))))

(assert (= (and start!118674 res!927131) b!1386669))

(assert (= (and b!1386669 res!927130) b!1386670))

(assert (= (and b!1386670 res!927133) b!1386671))

(assert (= (and b!1386671 res!927132) b!1386672))

(declare-fun m!1272285 () Bool)

(assert (=> b!1386671 m!1272285))

(declare-fun m!1272287 () Bool)

(assert (=> b!1386670 m!1272287))

(assert (=> b!1386670 m!1272287))

(declare-fun m!1272289 () Bool)

(assert (=> b!1386670 m!1272289))

(declare-fun m!1272291 () Bool)

(assert (=> start!118674 m!1272291))

(declare-fun m!1272293 () Bool)

(assert (=> start!118674 m!1272293))

(declare-fun m!1272295 () Bool)

(assert (=> b!1386672 m!1272295))

(push 1)

(assert (not start!118674))

(assert (not b!1386671))

(assert (not b!1386672))

(assert (not b!1386670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

