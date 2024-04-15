; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52962 () Bool)

(assert start!52962)

(declare-fun b!576732 () Bool)

(declare-fun res!364909 () Bool)

(declare-fun e!331779 () Bool)

(assert (=> b!576732 (=> (not res!364909) (not e!331779))))

(declare-datatypes ((array!35994 0))(
  ( (array!35995 (arr!17276 (Array (_ BitVec 32) (_ BitVec 64))) (size!17641 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35994)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576732 (= res!364909 (validKeyInArray!0 (select (arr!17276 a!2986) j!136)))))

(declare-fun b!576733 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!576733 (= e!331779 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!576734 () Bool)

(declare-fun res!364907 () Bool)

(assert (=> b!576734 (=> (not res!364907) (not e!331779))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576734 (= res!364907 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!364906 () Bool)

(assert (=> start!52962 (=> (not res!364906) (not e!331779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52962 (= res!364906 (validMask!0 mask!3053))))

(assert (=> start!52962 e!331779))

(assert (=> start!52962 true))

(declare-fun array_inv!13159 (array!35994) Bool)

(assert (=> start!52962 (array_inv!13159 a!2986)))

(declare-fun b!576735 () Bool)

(declare-fun res!364908 () Bool)

(assert (=> b!576735 (=> (not res!364908) (not e!331779))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576735 (= res!364908 (and (= (size!17641 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17641 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17641 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576736 () Bool)

(declare-fun res!364910 () Bool)

(assert (=> b!576736 (=> (not res!364910) (not e!331779))))

(assert (=> b!576736 (= res!364910 (validKeyInArray!0 k0!1786))))

(assert (= (and start!52962 res!364906) b!576735))

(assert (= (and b!576735 res!364908) b!576732))

(assert (= (and b!576732 res!364909) b!576736))

(assert (= (and b!576736 res!364910) b!576734))

(assert (= (and b!576734 res!364907) b!576733))

(declare-fun m!555167 () Bool)

(assert (=> b!576732 m!555167))

(assert (=> b!576732 m!555167))

(declare-fun m!555169 () Bool)

(assert (=> b!576732 m!555169))

(declare-fun m!555171 () Bool)

(assert (=> b!576734 m!555171))

(declare-fun m!555173 () Bool)

(assert (=> start!52962 m!555173))

(declare-fun m!555175 () Bool)

(assert (=> start!52962 m!555175))

(declare-fun m!555177 () Bool)

(assert (=> b!576736 m!555177))

(check-sat (not b!576734) (not b!576736) (not start!52962) (not b!576732))
(check-sat)
