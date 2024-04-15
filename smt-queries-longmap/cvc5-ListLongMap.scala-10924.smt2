; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127764 () Bool)

(assert start!127764)

(declare-fun res!1022937 () Bool)

(declare-fun e!839933 () Bool)

(assert (=> start!127764 (=> (not res!1022937) (not e!839933))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127764 (= res!1022937 (validMask!0 mask!2661))))

(assert (=> start!127764 e!839933))

(assert (=> start!127764 true))

(declare-datatypes ((array!100139 0))(
  ( (array!100140 (arr!48330 (Array (_ BitVec 32) (_ BitVec 64))) (size!48882 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100139)

(declare-fun array_inv!37563 (array!100139) Bool)

(assert (=> start!127764 (array_inv!37563 a!2850)))

(declare-fun b!1501672 () Bool)

(declare-fun res!1022940 () Bool)

(assert (=> b!1501672 (=> (not res!1022940) (not e!839933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100139 (_ BitVec 32)) Bool)

(assert (=> b!1501672 (= res!1022940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501673 () Bool)

(assert (=> b!1501673 (= e!839933 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12549 0))(
  ( (MissingZero!12549 (index!52588 (_ BitVec 32))) (Found!12549 (index!52589 (_ BitVec 32))) (Intermediate!12549 (undefined!13361 Bool) (index!52590 (_ BitVec 32)) (x!134282 (_ BitVec 32))) (Undefined!12549) (MissingVacant!12549 (index!52591 (_ BitVec 32))) )
))
(declare-fun lt!653020 () SeekEntryResult!12549)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100139 (_ BitVec 32)) SeekEntryResult!12549)

(assert (=> b!1501673 (= lt!653020 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48330 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501674 () Bool)

(declare-fun res!1022938 () Bool)

(assert (=> b!1501674 (=> (not res!1022938) (not e!839933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501674 (= res!1022938 (validKeyInArray!0 (select (arr!48330 a!2850) j!87)))))

(declare-fun b!1501675 () Bool)

(declare-fun res!1022936 () Bool)

(assert (=> b!1501675 (=> (not res!1022936) (not e!839933))))

(declare-datatypes ((List!34900 0))(
  ( (Nil!34897) (Cons!34896 (h!36294 (_ BitVec 64)) (t!49586 List!34900)) )
))
(declare-fun arrayNoDuplicates!0 (array!100139 (_ BitVec 32) List!34900) Bool)

(assert (=> b!1501675 (= res!1022936 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34897))))

(declare-fun b!1501676 () Bool)

(declare-fun res!1022942 () Bool)

(assert (=> b!1501676 (=> (not res!1022942) (not e!839933))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501676 (= res!1022942 (validKeyInArray!0 (select (arr!48330 a!2850) i!996)))))

(declare-fun b!1501677 () Bool)

(declare-fun res!1022939 () Bool)

(assert (=> b!1501677 (=> (not res!1022939) (not e!839933))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501677 (= res!1022939 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48882 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48882 a!2850)) (= (select (arr!48330 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48330 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48882 a!2850))))))

(declare-fun b!1501678 () Bool)

(declare-fun res!1022941 () Bool)

(assert (=> b!1501678 (=> (not res!1022941) (not e!839933))))

(assert (=> b!1501678 (= res!1022941 (and (= (size!48882 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48882 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48882 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127764 res!1022937) b!1501678))

(assert (= (and b!1501678 res!1022941) b!1501676))

(assert (= (and b!1501676 res!1022942) b!1501674))

(assert (= (and b!1501674 res!1022938) b!1501672))

(assert (= (and b!1501672 res!1022940) b!1501675))

(assert (= (and b!1501675 res!1022936) b!1501677))

(assert (= (and b!1501677 res!1022939) b!1501673))

(declare-fun m!1384405 () Bool)

(assert (=> b!1501676 m!1384405))

(assert (=> b!1501676 m!1384405))

(declare-fun m!1384407 () Bool)

(assert (=> b!1501676 m!1384407))

(declare-fun m!1384409 () Bool)

(assert (=> start!127764 m!1384409))

(declare-fun m!1384411 () Bool)

(assert (=> start!127764 m!1384411))

(declare-fun m!1384413 () Bool)

(assert (=> b!1501675 m!1384413))

(declare-fun m!1384415 () Bool)

(assert (=> b!1501674 m!1384415))

(assert (=> b!1501674 m!1384415))

(declare-fun m!1384417 () Bool)

(assert (=> b!1501674 m!1384417))

(declare-fun m!1384419 () Bool)

(assert (=> b!1501677 m!1384419))

(declare-fun m!1384421 () Bool)

(assert (=> b!1501677 m!1384421))

(declare-fun m!1384423 () Bool)

(assert (=> b!1501677 m!1384423))

(assert (=> b!1501673 m!1384415))

(assert (=> b!1501673 m!1384415))

(declare-fun m!1384425 () Bool)

(assert (=> b!1501673 m!1384425))

(declare-fun m!1384427 () Bool)

(assert (=> b!1501672 m!1384427))

(push 1)

(assert (not b!1501672))

(assert (not start!127764))

(assert (not b!1501674))

(assert (not b!1501675))

(assert (not b!1501673))

(assert (not b!1501676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

