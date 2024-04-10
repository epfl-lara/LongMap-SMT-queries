; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127964 () Bool)

(assert start!127964)

(declare-fun b!1503282 () Bool)

(declare-fun res!1024163 () Bool)

(declare-fun e!840577 () Bool)

(assert (=> b!1503282 (=> (not res!1024163) (not e!840577))))

(declare-datatypes ((array!100279 0))(
  ( (array!100280 (arr!48396 (Array (_ BitVec 32) (_ BitVec 64))) (size!48946 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100279)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100279 (_ BitVec 32)) Bool)

(assert (=> b!1503282 (= res!1024163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503283 () Bool)

(declare-fun res!1024160 () Bool)

(assert (=> b!1503283 (=> (not res!1024160) (not e!840577))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503283 (= res!1024160 (validKeyInArray!0 (select (arr!48396 a!2850) i!996)))))

(declare-fun b!1503284 () Bool)

(declare-fun res!1024164 () Bool)

(assert (=> b!1503284 (=> (not res!1024164) (not e!840577))))

(declare-datatypes ((List!34888 0))(
  ( (Nil!34885) (Cons!34884 (h!36281 (_ BitVec 64)) (t!49582 List!34888)) )
))
(declare-fun arrayNoDuplicates!0 (array!100279 (_ BitVec 32) List!34888) Bool)

(assert (=> b!1503284 (= res!1024164 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34885))))

(declare-fun b!1503285 () Bool)

(declare-fun res!1024168 () Bool)

(assert (=> b!1503285 (=> (not res!1024168) (not e!840577))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503285 (= res!1024168 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48946 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48946 a!2850)) (= (select (arr!48396 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48396 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48946 a!2850))))))

(declare-fun b!1503286 () Bool)

(declare-fun res!1024165 () Bool)

(assert (=> b!1503286 (=> (not res!1024165) (not e!840577))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503286 (= res!1024165 (not (= (select (arr!48396 a!2850) index!625) (select (arr!48396 a!2850) j!87))))))

(declare-fun b!1503287 () Bool)

(declare-fun res!1024167 () Bool)

(assert (=> b!1503287 (=> (not res!1024167) (not e!840577))))

(assert (=> b!1503287 (= res!1024167 (and (= (size!48946 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48946 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48946 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503288 () Bool)

(declare-fun res!1024166 () Bool)

(assert (=> b!1503288 (=> (not res!1024166) (not e!840577))))

(assert (=> b!1503288 (= res!1024166 (validKeyInArray!0 (select (arr!48396 a!2850) j!87)))))

(declare-fun b!1503289 () Bool)

(declare-fun res!1024161 () Bool)

(assert (=> b!1503289 (=> (not res!1024161) (not e!840577))))

(declare-datatypes ((SeekEntryResult!12594 0))(
  ( (MissingZero!12594 (index!52768 (_ BitVec 32))) (Found!12594 (index!52769 (_ BitVec 32))) (Intermediate!12594 (undefined!13406 Bool) (index!52770 (_ BitVec 32)) (x!134450 (_ BitVec 32))) (Undefined!12594) (MissingVacant!12594 (index!52771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100279 (_ BitVec 32)) SeekEntryResult!12594)

(assert (=> b!1503289 (= res!1024161 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48396 a!2850) j!87) a!2850 mask!2661) (Found!12594 j!87)))))

(declare-fun b!1503290 () Bool)

(assert (=> b!1503290 (= e!840577 false)))

(declare-fun lt!653509 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503290 (= lt!653509 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1024162 () Bool)

(assert (=> start!127964 (=> (not res!1024162) (not e!840577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127964 (= res!1024162 (validMask!0 mask!2661))))

(assert (=> start!127964 e!840577))

(assert (=> start!127964 true))

(declare-fun array_inv!37424 (array!100279) Bool)

(assert (=> start!127964 (array_inv!37424 a!2850)))

(assert (= (and start!127964 res!1024162) b!1503287))

(assert (= (and b!1503287 res!1024167) b!1503283))

(assert (= (and b!1503283 res!1024160) b!1503288))

(assert (= (and b!1503288 res!1024166) b!1503282))

(assert (= (and b!1503282 res!1024163) b!1503284))

(assert (= (and b!1503284 res!1024164) b!1503285))

(assert (= (and b!1503285 res!1024168) b!1503289))

(assert (= (and b!1503289 res!1024161) b!1503286))

(assert (= (and b!1503286 res!1024165) b!1503290))

(declare-fun m!1386527 () Bool)

(assert (=> b!1503286 m!1386527))

(declare-fun m!1386529 () Bool)

(assert (=> b!1503286 m!1386529))

(declare-fun m!1386531 () Bool)

(assert (=> b!1503282 m!1386531))

(declare-fun m!1386533 () Bool)

(assert (=> b!1503290 m!1386533))

(declare-fun m!1386535 () Bool)

(assert (=> b!1503283 m!1386535))

(assert (=> b!1503283 m!1386535))

(declare-fun m!1386537 () Bool)

(assert (=> b!1503283 m!1386537))

(declare-fun m!1386539 () Bool)

(assert (=> start!127964 m!1386539))

(declare-fun m!1386541 () Bool)

(assert (=> start!127964 m!1386541))

(assert (=> b!1503289 m!1386529))

(assert (=> b!1503289 m!1386529))

(declare-fun m!1386543 () Bool)

(assert (=> b!1503289 m!1386543))

(declare-fun m!1386545 () Bool)

(assert (=> b!1503285 m!1386545))

(declare-fun m!1386547 () Bool)

(assert (=> b!1503285 m!1386547))

(declare-fun m!1386549 () Bool)

(assert (=> b!1503285 m!1386549))

(assert (=> b!1503288 m!1386529))

(assert (=> b!1503288 m!1386529))

(declare-fun m!1386551 () Bool)

(assert (=> b!1503288 m!1386551))

(declare-fun m!1386553 () Bool)

(assert (=> b!1503284 m!1386553))

(check-sat (not b!1503289) (not start!127964) (not b!1503290) (not b!1503283) (not b!1503284) (not b!1503282) (not b!1503288))
