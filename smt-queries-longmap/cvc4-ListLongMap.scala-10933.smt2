; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128236 () Bool)

(assert start!128236)

(declare-fun b!1504709 () Bool)

(declare-fun res!1024414 () Bool)

(declare-fun e!841622 () Bool)

(assert (=> b!1504709 (=> (not res!1024414) (not e!841622))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100365 0))(
  ( (array!100366 (arr!48434 (Array (_ BitVec 32) (_ BitVec 64))) (size!48985 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100365)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504709 (= res!1024414 (and (= (size!48985 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48985 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48985 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504710 () Bool)

(declare-fun res!1024415 () Bool)

(assert (=> b!1504710 (=> (not res!1024415) (not e!841622))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504710 (= res!1024415 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48985 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48985 a!2850)) (= (select (arr!48434 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48434 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48985 a!2850))))))

(declare-fun b!1504711 () Bool)

(declare-fun res!1024417 () Bool)

(assert (=> b!1504711 (=> (not res!1024417) (not e!841622))))

(declare-datatypes ((List!34913 0))(
  ( (Nil!34910) (Cons!34909 (h!36321 (_ BitVec 64)) (t!49599 List!34913)) )
))
(declare-fun arrayNoDuplicates!0 (array!100365 (_ BitVec 32) List!34913) Bool)

(assert (=> b!1504711 (= res!1024417 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34910))))

(declare-fun b!1504712 () Bool)

(declare-fun res!1024413 () Bool)

(assert (=> b!1504712 (=> (not res!1024413) (not e!841622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504712 (= res!1024413 (validKeyInArray!0 (select (arr!48434 a!2850) j!87)))))

(declare-fun b!1504714 () Bool)

(declare-fun res!1024410 () Bool)

(assert (=> b!1504714 (=> (not res!1024410) (not e!841622))))

(assert (=> b!1504714 (= res!1024410 (not (= (select (arr!48434 a!2850) index!625) (select (arr!48434 a!2850) j!87))))))

(declare-fun b!1504715 () Bool)

(assert (=> b!1504715 (= e!841622 false)))

(declare-fun lt!654127 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504715 (= lt!654127 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1504716 () Bool)

(declare-fun res!1024416 () Bool)

(assert (=> b!1504716 (=> (not res!1024416) (not e!841622))))

(declare-datatypes ((SeekEntryResult!12525 0))(
  ( (MissingZero!12525 (index!52492 (_ BitVec 32))) (Found!12525 (index!52493 (_ BitVec 32))) (Intermediate!12525 (undefined!13337 Bool) (index!52494 (_ BitVec 32)) (x!134378 (_ BitVec 32))) (Undefined!12525) (MissingVacant!12525 (index!52495 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100365 (_ BitVec 32)) SeekEntryResult!12525)

(assert (=> b!1504716 (= res!1024416 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48434 a!2850) j!87) a!2850 mask!2661) (Found!12525 j!87)))))

(declare-fun b!1504717 () Bool)

(declare-fun res!1024411 () Bool)

(assert (=> b!1504717 (=> (not res!1024411) (not e!841622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100365 (_ BitVec 32)) Bool)

(assert (=> b!1504717 (= res!1024411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024418 () Bool)

(assert (=> start!128236 (=> (not res!1024418) (not e!841622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128236 (= res!1024418 (validMask!0 mask!2661))))

(assert (=> start!128236 e!841622))

(assert (=> start!128236 true))

(declare-fun array_inv!37715 (array!100365) Bool)

(assert (=> start!128236 (array_inv!37715 a!2850)))

(declare-fun b!1504713 () Bool)

(declare-fun res!1024412 () Bool)

(assert (=> b!1504713 (=> (not res!1024412) (not e!841622))))

(assert (=> b!1504713 (= res!1024412 (validKeyInArray!0 (select (arr!48434 a!2850) i!996)))))

(assert (= (and start!128236 res!1024418) b!1504709))

(assert (= (and b!1504709 res!1024414) b!1504713))

(assert (= (and b!1504713 res!1024412) b!1504712))

(assert (= (and b!1504712 res!1024413) b!1504717))

(assert (= (and b!1504717 res!1024411) b!1504711))

(assert (= (and b!1504711 res!1024417) b!1504710))

(assert (= (and b!1504710 res!1024415) b!1504716))

(assert (= (and b!1504716 res!1024416) b!1504714))

(assert (= (and b!1504714 res!1024410) b!1504715))

(declare-fun m!1387879 () Bool)

(assert (=> b!1504715 m!1387879))

(declare-fun m!1387881 () Bool)

(assert (=> start!128236 m!1387881))

(declare-fun m!1387883 () Bool)

(assert (=> start!128236 m!1387883))

(declare-fun m!1387885 () Bool)

(assert (=> b!1504716 m!1387885))

(assert (=> b!1504716 m!1387885))

(declare-fun m!1387887 () Bool)

(assert (=> b!1504716 m!1387887))

(declare-fun m!1387889 () Bool)

(assert (=> b!1504714 m!1387889))

(assert (=> b!1504714 m!1387885))

(declare-fun m!1387891 () Bool)

(assert (=> b!1504717 m!1387891))

(assert (=> b!1504712 m!1387885))

(assert (=> b!1504712 m!1387885))

(declare-fun m!1387893 () Bool)

(assert (=> b!1504712 m!1387893))

(declare-fun m!1387895 () Bool)

(assert (=> b!1504713 m!1387895))

(assert (=> b!1504713 m!1387895))

(declare-fun m!1387897 () Bool)

(assert (=> b!1504713 m!1387897))

(declare-fun m!1387899 () Bool)

(assert (=> b!1504711 m!1387899))

(declare-fun m!1387901 () Bool)

(assert (=> b!1504710 m!1387901))

(declare-fun m!1387903 () Bool)

(assert (=> b!1504710 m!1387903))

(declare-fun m!1387905 () Bool)

(assert (=> b!1504710 m!1387905))

(push 1)

(assert (not b!1504715))

(assert (not b!1504711))

(assert (not start!128236))

(assert (not b!1504713))

(assert (not b!1504717))

(assert (not b!1504716))

(assert (not b!1504712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

