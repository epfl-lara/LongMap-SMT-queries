; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92836 () Bool)

(assert start!92836)

(declare-fun b!1054133 () Bool)

(declare-fun e!598841 () Bool)

(declare-fun e!598839 () Bool)

(assert (=> b!1054133 (= e!598841 e!598839)))

(declare-fun res!703159 () Bool)

(assert (=> b!1054133 (=> res!703159 e!598839)))

(declare-fun lt!465159 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054133 (= res!703159 (bvsle lt!465159 i!1381))))

(declare-fun b!1054134 () Bool)

(declare-fun res!703163 () Bool)

(declare-fun e!598842 () Bool)

(assert (=> b!1054134 (=> (not res!703163) (not e!598842))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054134 (= res!703163 (validKeyInArray!0 k0!2747))))

(declare-fun res!703165 () Bool)

(assert (=> start!92836 (=> (not res!703165) (not e!598842))))

(declare-datatypes ((array!66437 0))(
  ( (array!66438 (arr!31950 (Array (_ BitVec 32) (_ BitVec 64))) (size!32488 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66437)

(assert (=> start!92836 (= res!703165 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32488 a!3488)) (bvslt (size!32488 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92836 e!598842))

(assert (=> start!92836 true))

(declare-fun array_inv!24733 (array!66437) Bool)

(assert (=> start!92836 (array_inv!24733 a!3488)))

(declare-fun b!1054135 () Bool)

(declare-fun e!598843 () Bool)

(declare-fun e!598840 () Bool)

(assert (=> b!1054135 (= e!598843 e!598840)))

(declare-fun res!703157 () Bool)

(assert (=> b!1054135 (=> (not res!703157) (not e!598840))))

(assert (=> b!1054135 (= res!703157 (not (= lt!465159 i!1381)))))

(declare-fun lt!465158 () array!66437)

(declare-fun arrayScanForKey!0 (array!66437 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054135 (= lt!465159 (arrayScanForKey!0 lt!465158 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054136 () Bool)

(declare-fun res!703161 () Bool)

(assert (=> b!1054136 (=> (not res!703161) (not e!598842))))

(assert (=> b!1054136 (= res!703161 (= (select (arr!31950 a!3488) i!1381) k0!2747))))

(declare-fun b!1054137 () Bool)

(declare-fun res!703158 () Bool)

(assert (=> b!1054137 (=> (not res!703158) (not e!598842))))

(declare-datatypes ((List!22321 0))(
  ( (Nil!22318) (Cons!22317 (h!23526 (_ BitVec 64)) (t!31619 List!22321)) )
))
(declare-fun arrayNoDuplicates!0 (array!66437 (_ BitVec 32) List!22321) Bool)

(assert (=> b!1054137 (= res!703158 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22318))))

(declare-fun b!1054138 () Bool)

(declare-fun e!598845 () Bool)

(assert (=> b!1054138 (= e!598845 true)))

(assert (=> b!1054138 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22318)))

(declare-datatypes ((Unit!34391 0))(
  ( (Unit!34392) )
))
(declare-fun lt!465160 () Unit!34391)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66437 (_ BitVec 32) (_ BitVec 32)) Unit!34391)

(assert (=> b!1054138 (= lt!465160 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054139 () Bool)

(assert (=> b!1054139 (= e!598842 e!598843)))

(declare-fun res!703160 () Bool)

(assert (=> b!1054139 (=> (not res!703160) (not e!598843))))

(declare-fun arrayContainsKey!0 (array!66437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054139 (= res!703160 (arrayContainsKey!0 lt!465158 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054139 (= lt!465158 (array!66438 (store (arr!31950 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32488 a!3488)))))

(declare-fun b!1054140 () Bool)

(assert (=> b!1054140 (= e!598839 (arrayContainsKey!0 a!3488 k0!2747 lt!465159))))

(declare-fun b!1054141 () Bool)

(assert (=> b!1054141 (= e!598840 (not e!598845))))

(declare-fun res!703164 () Bool)

(assert (=> b!1054141 (=> res!703164 e!598845)))

(assert (=> b!1054141 (= res!703164 (bvsle lt!465159 i!1381))))

(assert (=> b!1054141 e!598841))

(declare-fun res!703162 () Bool)

(assert (=> b!1054141 (=> (not res!703162) (not e!598841))))

(assert (=> b!1054141 (= res!703162 (= (select (store (arr!31950 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465159) k0!2747))))

(assert (= (and start!92836 res!703165) b!1054137))

(assert (= (and b!1054137 res!703158) b!1054134))

(assert (= (and b!1054134 res!703163) b!1054136))

(assert (= (and b!1054136 res!703161) b!1054139))

(assert (= (and b!1054139 res!703160) b!1054135))

(assert (= (and b!1054135 res!703157) b!1054141))

(assert (= (and b!1054141 res!703162) b!1054133))

(assert (= (and b!1054133 (not res!703159)) b!1054140))

(assert (= (and b!1054141 (not res!703164)) b!1054138))

(declare-fun m!973765 () Bool)

(assert (=> b!1054135 m!973765))

(declare-fun m!973767 () Bool)

(assert (=> b!1054136 m!973767))

(declare-fun m!973769 () Bool)

(assert (=> b!1054139 m!973769))

(declare-fun m!973771 () Bool)

(assert (=> b!1054139 m!973771))

(assert (=> b!1054141 m!973771))

(declare-fun m!973773 () Bool)

(assert (=> b!1054141 m!973773))

(declare-fun m!973775 () Bool)

(assert (=> b!1054134 m!973775))

(declare-fun m!973777 () Bool)

(assert (=> start!92836 m!973777))

(declare-fun m!973779 () Bool)

(assert (=> b!1054140 m!973779))

(declare-fun m!973781 () Bool)

(assert (=> b!1054137 m!973781))

(declare-fun m!973783 () Bool)

(assert (=> b!1054138 m!973783))

(declare-fun m!973785 () Bool)

(assert (=> b!1054138 m!973785))

(check-sat (not b!1054137) (not b!1054139) (not start!92836) (not b!1054138) (not b!1054135) (not b!1054134) (not b!1054140))
(check-sat)
