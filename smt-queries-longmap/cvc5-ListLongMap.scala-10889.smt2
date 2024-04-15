; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127554 () Bool)

(assert start!127554)

(declare-fun b!1498711 () Bool)

(declare-fun res!1019975 () Bool)

(declare-fun e!838980 () Bool)

(assert (=> b!1498711 (=> (not res!1019975) (not e!838980))))

(declare-datatypes ((array!99929 0))(
  ( (array!99930 (arr!48225 (Array (_ BitVec 32) (_ BitVec 64))) (size!48777 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99929)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99929 (_ BitVec 32)) Bool)

(assert (=> b!1498711 (= res!1019975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498712 () Bool)

(declare-fun res!1019981 () Bool)

(assert (=> b!1498712 (=> (not res!1019981) (not e!838980))))

(declare-datatypes ((List!34795 0))(
  ( (Nil!34792) (Cons!34791 (h!36189 (_ BitVec 64)) (t!49481 List!34795)) )
))
(declare-fun arrayNoDuplicates!0 (array!99929 (_ BitVec 32) List!34795) Bool)

(assert (=> b!1498712 (= res!1019981 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34792))))

(declare-fun b!1498713 () Bool)

(declare-fun res!1019978 () Bool)

(assert (=> b!1498713 (=> (not res!1019978) (not e!838980))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498713 (= res!1019978 (and (= (size!48777 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48777 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48777 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498714 () Bool)

(declare-fun res!1019979 () Bool)

(assert (=> b!1498714 (=> (not res!1019979) (not e!838980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498714 (= res!1019979 (validKeyInArray!0 (select (arr!48225 a!2850) i!996)))))

(declare-fun res!1019977 () Bool)

(assert (=> start!127554 (=> (not res!1019977) (not e!838980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127554 (= res!1019977 (validMask!0 mask!2661))))

(assert (=> start!127554 e!838980))

(assert (=> start!127554 true))

(declare-fun array_inv!37458 (array!99929) Bool)

(assert (=> start!127554 (array_inv!37458 a!2850)))

(declare-fun b!1498715 () Bool)

(declare-fun res!1019976 () Bool)

(assert (=> b!1498715 (=> (not res!1019976) (not e!838980))))

(assert (=> b!1498715 (= res!1019976 (validKeyInArray!0 (select (arr!48225 a!2850) j!87)))))

(declare-fun b!1498716 () Bool)

(assert (=> b!1498716 (= e!838980 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12456 0))(
  ( (MissingZero!12456 (index!52216 (_ BitVec 32))) (Found!12456 (index!52217 (_ BitVec 32))) (Intermediate!12456 (undefined!13268 Bool) (index!52218 (_ BitVec 32)) (x!133909 (_ BitVec 32))) (Undefined!12456) (MissingVacant!12456 (index!52219 (_ BitVec 32))) )
))
(declare-fun lt!652408 () SeekEntryResult!12456)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99929 (_ BitVec 32)) SeekEntryResult!12456)

(assert (=> b!1498716 (= lt!652408 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48225 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498717 () Bool)

(declare-fun res!1019980 () Bool)

(assert (=> b!1498717 (=> (not res!1019980) (not e!838980))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498717 (= res!1019980 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48777 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48777 a!2850)) (= (select (arr!48225 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48225 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48777 a!2850))))))

(assert (= (and start!127554 res!1019977) b!1498713))

(assert (= (and b!1498713 res!1019978) b!1498714))

(assert (= (and b!1498714 res!1019979) b!1498715))

(assert (= (and b!1498715 res!1019976) b!1498711))

(assert (= (and b!1498711 res!1019975) b!1498712))

(assert (= (and b!1498712 res!1019981) b!1498717))

(assert (= (and b!1498717 res!1019980) b!1498716))

(declare-fun m!1381333 () Bool)

(assert (=> b!1498712 m!1381333))

(declare-fun m!1381335 () Bool)

(assert (=> b!1498716 m!1381335))

(assert (=> b!1498716 m!1381335))

(declare-fun m!1381337 () Bool)

(assert (=> b!1498716 m!1381337))

(declare-fun m!1381339 () Bool)

(assert (=> b!1498711 m!1381339))

(declare-fun m!1381341 () Bool)

(assert (=> start!127554 m!1381341))

(declare-fun m!1381343 () Bool)

(assert (=> start!127554 m!1381343))

(assert (=> b!1498715 m!1381335))

(assert (=> b!1498715 m!1381335))

(declare-fun m!1381345 () Bool)

(assert (=> b!1498715 m!1381345))

(declare-fun m!1381347 () Bool)

(assert (=> b!1498717 m!1381347))

(declare-fun m!1381349 () Bool)

(assert (=> b!1498717 m!1381349))

(declare-fun m!1381351 () Bool)

(assert (=> b!1498717 m!1381351))

(declare-fun m!1381353 () Bool)

(assert (=> b!1498714 m!1381353))

(assert (=> b!1498714 m!1381353))

(declare-fun m!1381355 () Bool)

(assert (=> b!1498714 m!1381355))

(push 1)

(assert (not b!1498712))

(assert (not start!127554))

(assert (not b!1498714))

(assert (not b!1498711))

(assert (not b!1498716))

(assert (not b!1498715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

