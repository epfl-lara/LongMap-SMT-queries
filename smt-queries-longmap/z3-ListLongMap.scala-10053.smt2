; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118448 () Bool)

(assert start!118448)

(declare-fun b!1385225 () Bool)

(declare-fun res!926522 () Bool)

(declare-fun e!784890 () Bool)

(assert (=> b!1385225 (=> (not res!926522) (not e!784890))))

(declare-datatypes ((array!94677 0))(
  ( (array!94678 (arr!45715 (Array (_ BitVec 32) (_ BitVec 64))) (size!46267 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94677)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385225 (= res!926522 (validKeyInArray!0 (select (arr!45715 a!2938) i!1065)))))

(declare-fun b!1385226 () Bool)

(declare-fun res!926521 () Bool)

(assert (=> b!1385226 (=> (not res!926521) (not e!784890))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385226 (= res!926521 (and (= (size!46267 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46267 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46267 a!2938))))))

(declare-fun b!1385227 () Bool)

(assert (=> b!1385227 (= e!784890 (bvslt (bvsub (size!46267 a!2938) startIndex!16) #b00000000000000000000000000000000))))

(declare-fun res!926520 () Bool)

(assert (=> start!118448 (=> (not res!926520) (not e!784890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118448 (= res!926520 (validMask!0 mask!2987))))

(assert (=> start!118448 e!784890))

(assert (=> start!118448 true))

(declare-fun array_inv!34948 (array!94677) Bool)

(assert (=> start!118448 (array_inv!34948 a!2938)))

(declare-fun b!1385228 () Bool)

(declare-fun res!926518 () Bool)

(assert (=> b!1385228 (=> (not res!926518) (not e!784890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94677 (_ BitVec 32)) Bool)

(assert (=> b!1385228 (= res!926518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385229 () Bool)

(declare-fun res!926519 () Bool)

(assert (=> b!1385229 (=> (not res!926519) (not e!784890))))

(declare-datatypes ((List!32321 0))(
  ( (Nil!32318) (Cons!32317 (h!33526 (_ BitVec 64)) (t!47007 List!32321)) )
))
(declare-fun arrayNoDuplicates!0 (array!94677 (_ BitVec 32) List!32321) Bool)

(assert (=> b!1385229 (= res!926519 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32318))))

(assert (= (and start!118448 res!926520) b!1385226))

(assert (= (and b!1385226 res!926521) b!1385225))

(assert (= (and b!1385225 res!926522) b!1385229))

(assert (= (and b!1385229 res!926519) b!1385228))

(assert (= (and b!1385228 res!926518) b!1385227))

(declare-fun m!1270089 () Bool)

(assert (=> b!1385225 m!1270089))

(assert (=> b!1385225 m!1270089))

(declare-fun m!1270091 () Bool)

(assert (=> b!1385225 m!1270091))

(declare-fun m!1270093 () Bool)

(assert (=> start!118448 m!1270093))

(declare-fun m!1270095 () Bool)

(assert (=> start!118448 m!1270095))

(declare-fun m!1270097 () Bool)

(assert (=> b!1385228 m!1270097))

(declare-fun m!1270099 () Bool)

(assert (=> b!1385229 m!1270099))

(check-sat (not b!1385228) (not start!118448) (not b!1385225) (not b!1385229))
(check-sat)
