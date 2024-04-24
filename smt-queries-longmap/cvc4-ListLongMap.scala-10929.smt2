; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128176 () Bool)

(assert start!128176)

(declare-fun b!1504264 () Bool)

(declare-fun res!1024069 () Bool)

(declare-fun e!841445 () Bool)

(assert (=> b!1504264 (=> (not res!1024069) (not e!841445))))

(declare-datatypes ((array!100338 0))(
  ( (array!100339 (arr!48422 (Array (_ BitVec 32) (_ BitVec 64))) (size!48973 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100338)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504264 (= res!1024069 (validKeyInArray!0 (select (arr!48422 a!2850) i!996)))))

(declare-fun b!1504265 () Bool)

(declare-fun res!1024071 () Bool)

(assert (=> b!1504265 (=> (not res!1024071) (not e!841445))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504265 (= res!1024071 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48973 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48973 a!2850)) (= (select (arr!48422 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48422 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48973 a!2850))))))

(declare-fun b!1504266 () Bool)

(declare-fun res!1024067 () Bool)

(assert (=> b!1504266 (=> (not res!1024067) (not e!841445))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100338 (_ BitVec 32)) Bool)

(assert (=> b!1504266 (= res!1024067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504267 () Bool)

(assert (=> b!1504267 (= e!841445 false)))

(declare-datatypes ((SeekEntryResult!12513 0))(
  ( (MissingZero!12513 (index!52444 (_ BitVec 32))) (Found!12513 (index!52445 (_ BitVec 32))) (Intermediate!12513 (undefined!13325 Bool) (index!52446 (_ BitVec 32)) (x!134331 (_ BitVec 32))) (Undefined!12513) (MissingVacant!12513 (index!52447 (_ BitVec 32))) )
))
(declare-fun lt!654042 () SeekEntryResult!12513)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100338 (_ BitVec 32)) SeekEntryResult!12513)

(assert (=> b!1504267 (= lt!654042 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48422 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504268 () Bool)

(declare-fun res!1024068 () Bool)

(assert (=> b!1504268 (=> (not res!1024068) (not e!841445))))

(declare-datatypes ((List!34901 0))(
  ( (Nil!34898) (Cons!34897 (h!36309 (_ BitVec 64)) (t!49587 List!34901)) )
))
(declare-fun arrayNoDuplicates!0 (array!100338 (_ BitVec 32) List!34901) Bool)

(assert (=> b!1504268 (= res!1024068 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34898))))

(declare-fun res!1024070 () Bool)

(assert (=> start!128176 (=> (not res!1024070) (not e!841445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128176 (= res!1024070 (validMask!0 mask!2661))))

(assert (=> start!128176 e!841445))

(assert (=> start!128176 true))

(declare-fun array_inv!37703 (array!100338) Bool)

(assert (=> start!128176 (array_inv!37703 a!2850)))

(declare-fun b!1504269 () Bool)

(declare-fun res!1024073 () Bool)

(assert (=> b!1504269 (=> (not res!1024073) (not e!841445))))

(assert (=> b!1504269 (= res!1024073 (and (= (size!48973 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48973 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48973 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504270 () Bool)

(declare-fun res!1024072 () Bool)

(assert (=> b!1504270 (=> (not res!1024072) (not e!841445))))

(assert (=> b!1504270 (= res!1024072 (validKeyInArray!0 (select (arr!48422 a!2850) j!87)))))

(assert (= (and start!128176 res!1024070) b!1504269))

(assert (= (and b!1504269 res!1024073) b!1504264))

(assert (= (and b!1504264 res!1024069) b!1504270))

(assert (= (and b!1504270 res!1024072) b!1504266))

(assert (= (and b!1504266 res!1024067) b!1504268))

(assert (= (and b!1504268 res!1024068) b!1504265))

(assert (= (and b!1504265 res!1024071) b!1504267))

(declare-fun m!1387473 () Bool)

(assert (=> b!1504270 m!1387473))

(assert (=> b!1504270 m!1387473))

(declare-fun m!1387475 () Bool)

(assert (=> b!1504270 m!1387475))

(declare-fun m!1387477 () Bool)

(assert (=> b!1504268 m!1387477))

(declare-fun m!1387479 () Bool)

(assert (=> b!1504266 m!1387479))

(declare-fun m!1387481 () Bool)

(assert (=> start!128176 m!1387481))

(declare-fun m!1387483 () Bool)

(assert (=> start!128176 m!1387483))

(assert (=> b!1504267 m!1387473))

(assert (=> b!1504267 m!1387473))

(declare-fun m!1387485 () Bool)

(assert (=> b!1504267 m!1387485))

(declare-fun m!1387487 () Bool)

(assert (=> b!1504264 m!1387487))

(assert (=> b!1504264 m!1387487))

(declare-fun m!1387489 () Bool)

(assert (=> b!1504264 m!1387489))

(declare-fun m!1387491 () Bool)

(assert (=> b!1504265 m!1387491))

(declare-fun m!1387493 () Bool)

(assert (=> b!1504265 m!1387493))

(declare-fun m!1387495 () Bool)

(assert (=> b!1504265 m!1387495))

(push 1)

(assert (not start!128176))

(assert (not b!1504267))

(assert (not b!1504268))

(assert (not b!1504264))

(assert (not b!1504266))

(assert (not b!1504270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

