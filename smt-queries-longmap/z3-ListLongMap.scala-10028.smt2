; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118274 () Bool)

(assert start!118274)

(declare-fun b!1383381 () Bool)

(declare-fun e!784073 () Bool)

(assert (=> b!1383381 (= e!784073 false)))

(declare-fun lt!608601 () Bool)

(declare-datatypes ((array!94577 0))(
  ( (array!94578 (arr!45666 (Array (_ BitVec 32) (_ BitVec 64))) (size!46216 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94577)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94577 (_ BitVec 32)) Bool)

(assert (=> b!1383381 (= lt!608601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!924970 () Bool)

(assert (=> start!118274 (=> (not res!924970) (not e!784073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118274 (= res!924970 (validMask!0 mask!2987))))

(assert (=> start!118274 e!784073))

(assert (=> start!118274 true))

(declare-fun array_inv!34694 (array!94577) Bool)

(assert (=> start!118274 (array_inv!34694 a!2938)))

(declare-fun b!1383378 () Bool)

(declare-fun res!924972 () Bool)

(assert (=> b!1383378 (=> (not res!924972) (not e!784073))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383378 (= res!924972 (and (= (size!46216 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46216 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46216 a!2938))))))

(declare-fun b!1383380 () Bool)

(declare-fun res!924973 () Bool)

(assert (=> b!1383380 (=> (not res!924973) (not e!784073))))

(declare-datatypes ((List!32194 0))(
  ( (Nil!32191) (Cons!32190 (h!33399 (_ BitVec 64)) (t!46888 List!32194)) )
))
(declare-fun arrayNoDuplicates!0 (array!94577 (_ BitVec 32) List!32194) Bool)

(assert (=> b!1383380 (= res!924973 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32191))))

(declare-fun b!1383379 () Bool)

(declare-fun res!924971 () Bool)

(assert (=> b!1383379 (=> (not res!924971) (not e!784073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383379 (= res!924971 (validKeyInArray!0 (select (arr!45666 a!2938) i!1065)))))

(assert (= (and start!118274 res!924970) b!1383378))

(assert (= (and b!1383378 res!924972) b!1383379))

(assert (= (and b!1383379 res!924971) b!1383380))

(assert (= (and b!1383380 res!924973) b!1383381))

(declare-fun m!1268481 () Bool)

(assert (=> b!1383381 m!1268481))

(declare-fun m!1268483 () Bool)

(assert (=> start!118274 m!1268483))

(declare-fun m!1268485 () Bool)

(assert (=> start!118274 m!1268485))

(declare-fun m!1268487 () Bool)

(assert (=> b!1383380 m!1268487))

(declare-fun m!1268489 () Bool)

(assert (=> b!1383379 m!1268489))

(assert (=> b!1383379 m!1268489))

(declare-fun m!1268491 () Bool)

(assert (=> b!1383379 m!1268491))

(check-sat (not start!118274) (not b!1383380) (not b!1383381) (not b!1383379))
