; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128272 () Bool)

(assert start!128272)

(declare-fun b!1505195 () Bool)

(declare-fun res!1024898 () Bool)

(declare-fun e!841731 () Bool)

(assert (=> b!1505195 (=> (not res!1024898) (not e!841731))))

(declare-datatypes ((array!100401 0))(
  ( (array!100402 (arr!48452 (Array (_ BitVec 32) (_ BitVec 64))) (size!49003 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100401)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505195 (= res!1024898 (validKeyInArray!0 (select (arr!48452 a!2850) j!87)))))

(declare-fun b!1505196 () Bool)

(declare-fun res!1024903 () Bool)

(assert (=> b!1505196 (=> (not res!1024903) (not e!841731))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12543 0))(
  ( (MissingZero!12543 (index!52564 (_ BitVec 32))) (Found!12543 (index!52565 (_ BitVec 32))) (Intermediate!12543 (undefined!13355 Bool) (index!52566 (_ BitVec 32)) (x!134444 (_ BitVec 32))) (Undefined!12543) (MissingVacant!12543 (index!52567 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100401 (_ BitVec 32)) SeekEntryResult!12543)

(assert (=> b!1505196 (= res!1024903 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48452 a!2850) j!87) a!2850 mask!2661) (Found!12543 j!87)))))

(declare-fun b!1505198 () Bool)

(declare-fun res!1024901 () Bool)

(assert (=> b!1505198 (=> (not res!1024901) (not e!841731))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1505198 (= res!1024901 (and (= (size!49003 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49003 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49003 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505199 () Bool)

(declare-fun res!1024897 () Bool)

(assert (=> b!1505199 (=> (not res!1024897) (not e!841731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100401 (_ BitVec 32)) Bool)

(assert (=> b!1505199 (= res!1024897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505200 () Bool)

(declare-fun res!1024904 () Bool)

(assert (=> b!1505200 (=> (not res!1024904) (not e!841731))))

(assert (=> b!1505200 (= res!1024904 (not (= (select (arr!48452 a!2850) index!625) (select (arr!48452 a!2850) j!87))))))

(declare-fun b!1505201 () Bool)

(declare-fun res!1024900 () Bool)

(assert (=> b!1505201 (=> (not res!1024900) (not e!841731))))

(declare-datatypes ((List!34931 0))(
  ( (Nil!34928) (Cons!34927 (h!36339 (_ BitVec 64)) (t!49617 List!34931)) )
))
(declare-fun arrayNoDuplicates!0 (array!100401 (_ BitVec 32) List!34931) Bool)

(assert (=> b!1505201 (= res!1024900 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34928))))

(declare-fun b!1505202 () Bool)

(assert (=> b!1505202 (= e!841731 false)))

(declare-fun lt!654181 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505202 (= lt!654181 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505203 () Bool)

(declare-fun res!1024896 () Bool)

(assert (=> b!1505203 (=> (not res!1024896) (not e!841731))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505203 (= res!1024896 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49003 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49003 a!2850)) (= (select (arr!48452 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48452 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49003 a!2850))))))

(declare-fun res!1024902 () Bool)

(assert (=> start!128272 (=> (not res!1024902) (not e!841731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128272 (= res!1024902 (validMask!0 mask!2661))))

(assert (=> start!128272 e!841731))

(assert (=> start!128272 true))

(declare-fun array_inv!37733 (array!100401) Bool)

(assert (=> start!128272 (array_inv!37733 a!2850)))

(declare-fun b!1505197 () Bool)

(declare-fun res!1024899 () Bool)

(assert (=> b!1505197 (=> (not res!1024899) (not e!841731))))

(assert (=> b!1505197 (= res!1024899 (validKeyInArray!0 (select (arr!48452 a!2850) i!996)))))

(assert (= (and start!128272 res!1024902) b!1505198))

(assert (= (and b!1505198 res!1024901) b!1505197))

(assert (= (and b!1505197 res!1024899) b!1505195))

(assert (= (and b!1505195 res!1024898) b!1505199))

(assert (= (and b!1505199 res!1024897) b!1505201))

(assert (= (and b!1505201 res!1024900) b!1505203))

(assert (= (and b!1505203 res!1024896) b!1505196))

(assert (= (and b!1505196 res!1024903) b!1505200))

(assert (= (and b!1505200 res!1024904) b!1505202))

(declare-fun m!1388383 () Bool)

(assert (=> b!1505197 m!1388383))

(assert (=> b!1505197 m!1388383))

(declare-fun m!1388385 () Bool)

(assert (=> b!1505197 m!1388385))

(declare-fun m!1388387 () Bool)

(assert (=> b!1505199 m!1388387))

(declare-fun m!1388389 () Bool)

(assert (=> b!1505196 m!1388389))

(assert (=> b!1505196 m!1388389))

(declare-fun m!1388391 () Bool)

(assert (=> b!1505196 m!1388391))

(declare-fun m!1388393 () Bool)

(assert (=> start!128272 m!1388393))

(declare-fun m!1388395 () Bool)

(assert (=> start!128272 m!1388395))

(declare-fun m!1388397 () Bool)

(assert (=> b!1505201 m!1388397))

(declare-fun m!1388399 () Bool)

(assert (=> b!1505200 m!1388399))

(assert (=> b!1505200 m!1388389))

(declare-fun m!1388401 () Bool)

(assert (=> b!1505203 m!1388401))

(declare-fun m!1388403 () Bool)

(assert (=> b!1505203 m!1388403))

(declare-fun m!1388405 () Bool)

(assert (=> b!1505203 m!1388405))

(declare-fun m!1388407 () Bool)

(assert (=> b!1505202 m!1388407))

(assert (=> b!1505195 m!1388389))

(assert (=> b!1505195 m!1388389))

(declare-fun m!1388409 () Bool)

(assert (=> b!1505195 m!1388409))

(push 1)

(assert (not start!128272))

(assert (not b!1505195))

(assert (not b!1505202))

(assert (not b!1505197))

(assert (not b!1505199))

(assert (not b!1505201))

(assert (not b!1505196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

