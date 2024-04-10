; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118062 () Bool)

(assert start!118062)

(declare-fun b!1382436 () Bool)

(declare-fun res!924029 () Bool)

(declare-fun e!783572 () Bool)

(assert (=> b!1382436 (=> (not res!924029) (not e!783572))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94426 0))(
  ( (array!94427 (arr!45594 (Array (_ BitVec 32) (_ BitVec 64))) (size!46144 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94426)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382436 (= res!924029 (and (= (size!46144 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46144 a!2971))))))

(declare-fun b!1382439 () Bool)

(assert (=> b!1382439 (= e!783572 false)))

(declare-fun lt!608427 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94426 (_ BitVec 32)) Bool)

(assert (=> b!1382439 (= lt!608427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382437 () Bool)

(declare-fun res!924030 () Bool)

(assert (=> b!1382437 (=> (not res!924030) (not e!783572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382437 (= res!924030 (validKeyInArray!0 (select (arr!45594 a!2971) i!1094)))))

(declare-fun res!924028 () Bool)

(assert (=> start!118062 (=> (not res!924028) (not e!783572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118062 (= res!924028 (validMask!0 mask!3034))))

(assert (=> start!118062 e!783572))

(assert (=> start!118062 true))

(declare-fun array_inv!34622 (array!94426) Bool)

(assert (=> start!118062 (array_inv!34622 a!2971)))

(declare-fun b!1382438 () Bool)

(declare-fun res!924031 () Bool)

(assert (=> b!1382438 (=> (not res!924031) (not e!783572))))

(declare-datatypes ((List!32128 0))(
  ( (Nil!32125) (Cons!32124 (h!33333 (_ BitVec 64)) (t!46822 List!32128)) )
))
(declare-fun arrayNoDuplicates!0 (array!94426 (_ BitVec 32) List!32128) Bool)

(assert (=> b!1382438 (= res!924031 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32125))))

(assert (= (and start!118062 res!924028) b!1382436))

(assert (= (and b!1382436 res!924029) b!1382437))

(assert (= (and b!1382437 res!924030) b!1382438))

(assert (= (and b!1382438 res!924031) b!1382439))

(declare-fun m!1267575 () Bool)

(assert (=> b!1382439 m!1267575))

(declare-fun m!1267577 () Bool)

(assert (=> b!1382437 m!1267577))

(assert (=> b!1382437 m!1267577))

(declare-fun m!1267579 () Bool)

(assert (=> b!1382437 m!1267579))

(declare-fun m!1267581 () Bool)

(assert (=> start!118062 m!1267581))

(declare-fun m!1267583 () Bool)

(assert (=> start!118062 m!1267583))

(declare-fun m!1267585 () Bool)

(assert (=> b!1382438 m!1267585))

(check-sat (not start!118062) (not b!1382438) (not b!1382437) (not b!1382439))
(check-sat)
