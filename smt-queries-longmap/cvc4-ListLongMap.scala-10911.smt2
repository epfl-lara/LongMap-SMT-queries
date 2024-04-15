; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127684 () Bool)

(assert start!127684)

(declare-fun b!1500595 () Bool)

(declare-fun res!1021864 () Bool)

(declare-fun e!839536 () Bool)

(assert (=> b!1500595 (=> (not res!1021864) (not e!839536))))

(declare-datatypes ((array!100059 0))(
  ( (array!100060 (arr!48290 (Array (_ BitVec 32) (_ BitVec 64))) (size!48842 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100059)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100059 (_ BitVec 32)) Bool)

(assert (=> b!1500595 (= res!1021864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500596 () Bool)

(declare-fun res!1021865 () Bool)

(assert (=> b!1500596 (=> (not res!1021865) (not e!839536))))

(declare-datatypes ((List!34860 0))(
  ( (Nil!34857) (Cons!34856 (h!36254 (_ BitVec 64)) (t!49546 List!34860)) )
))
(declare-fun arrayNoDuplicates!0 (array!100059 (_ BitVec 32) List!34860) Bool)

(assert (=> b!1500596 (= res!1021865 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34857))))

(declare-fun res!1021859 () Bool)

(assert (=> start!127684 (=> (not res!1021859) (not e!839536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127684 (= res!1021859 (validMask!0 mask!2661))))

(assert (=> start!127684 e!839536))

(assert (=> start!127684 true))

(declare-fun array_inv!37523 (array!100059) Bool)

(assert (=> start!127684 (array_inv!37523 a!2850)))

(declare-fun b!1500597 () Bool)

(declare-fun res!1021860 () Bool)

(assert (=> b!1500597 (=> (not res!1021860) (not e!839536))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12521 0))(
  ( (MissingZero!12521 (index!52476 (_ BitVec 32))) (Found!12521 (index!52477 (_ BitVec 32))) (Intermediate!12521 (undefined!13333 Bool) (index!52478 (_ BitVec 32)) (x!134150 (_ BitVec 32))) (Undefined!12521) (MissingVacant!12521 (index!52479 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100059 (_ BitVec 32)) SeekEntryResult!12521)

(assert (=> b!1500597 (= res!1021860 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48290 a!2850) j!87) a!2850 mask!2661) (Found!12521 j!87)))))

(declare-fun b!1500598 () Bool)

(declare-fun e!839538 () Bool)

(assert (=> b!1500598 (= e!839538 false)))

(declare-fun lt!652752 () (_ BitVec 32))

(declare-fun lt!652753 () SeekEntryResult!12521)

(assert (=> b!1500598 (= lt!652753 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652752 vacantBefore!10 (select (arr!48290 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500599 () Bool)

(declare-fun res!1021863 () Bool)

(assert (=> b!1500599 (=> (not res!1021863) (not e!839536))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500599 (= res!1021863 (validKeyInArray!0 (select (arr!48290 a!2850) i!996)))))

(declare-fun b!1500600 () Bool)

(declare-fun res!1021866 () Bool)

(assert (=> b!1500600 (=> (not res!1021866) (not e!839536))))

(assert (=> b!1500600 (= res!1021866 (validKeyInArray!0 (select (arr!48290 a!2850) j!87)))))

(declare-fun b!1500601 () Bool)

(declare-fun res!1021862 () Bool)

(assert (=> b!1500601 (=> (not res!1021862) (not e!839536))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500601 (= res!1021862 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48842 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48842 a!2850)) (= (select (arr!48290 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48290 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48842 a!2850))))))

(declare-fun b!1500602 () Bool)

(declare-fun res!1021868 () Bool)

(assert (=> b!1500602 (=> (not res!1021868) (not e!839536))))

(assert (=> b!1500602 (= res!1021868 (not (= (select (arr!48290 a!2850) index!625) (select (arr!48290 a!2850) j!87))))))

(declare-fun b!1500603 () Bool)

(declare-fun res!1021867 () Bool)

(assert (=> b!1500603 (=> (not res!1021867) (not e!839536))))

(assert (=> b!1500603 (= res!1021867 (and (= (size!48842 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48842 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48842 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500604 () Bool)

(assert (=> b!1500604 (= e!839536 e!839538)))

(declare-fun res!1021861 () Bool)

(assert (=> b!1500604 (=> (not res!1021861) (not e!839538))))

(assert (=> b!1500604 (= res!1021861 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652752 #b00000000000000000000000000000000) (bvslt lt!652752 (size!48842 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500604 (= lt!652752 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127684 res!1021859) b!1500603))

(assert (= (and b!1500603 res!1021867) b!1500599))

(assert (= (and b!1500599 res!1021863) b!1500600))

(assert (= (and b!1500600 res!1021866) b!1500595))

(assert (= (and b!1500595 res!1021864) b!1500596))

(assert (= (and b!1500596 res!1021865) b!1500601))

(assert (= (and b!1500601 res!1021862) b!1500597))

(assert (= (and b!1500597 res!1021860) b!1500602))

(assert (= (and b!1500602 res!1021868) b!1500604))

(assert (= (and b!1500604 res!1021861) b!1500598))

(declare-fun m!1383235 () Bool)

(assert (=> b!1500597 m!1383235))

(assert (=> b!1500597 m!1383235))

(declare-fun m!1383237 () Bool)

(assert (=> b!1500597 m!1383237))

(declare-fun m!1383239 () Bool)

(assert (=> b!1500604 m!1383239))

(declare-fun m!1383241 () Bool)

(assert (=> b!1500602 m!1383241))

(assert (=> b!1500602 m!1383235))

(declare-fun m!1383243 () Bool)

(assert (=> b!1500595 m!1383243))

(declare-fun m!1383245 () Bool)

(assert (=> start!127684 m!1383245))

(declare-fun m!1383247 () Bool)

(assert (=> start!127684 m!1383247))

(assert (=> b!1500598 m!1383235))

(assert (=> b!1500598 m!1383235))

(declare-fun m!1383249 () Bool)

(assert (=> b!1500598 m!1383249))

(declare-fun m!1383251 () Bool)

(assert (=> b!1500596 m!1383251))

(assert (=> b!1500600 m!1383235))

(assert (=> b!1500600 m!1383235))

(declare-fun m!1383253 () Bool)

(assert (=> b!1500600 m!1383253))

(declare-fun m!1383255 () Bool)

(assert (=> b!1500601 m!1383255))

(declare-fun m!1383257 () Bool)

(assert (=> b!1500601 m!1383257))

(declare-fun m!1383259 () Bool)

(assert (=> b!1500601 m!1383259))

(declare-fun m!1383261 () Bool)

(assert (=> b!1500599 m!1383261))

(assert (=> b!1500599 m!1383261))

(declare-fun m!1383263 () Bool)

(assert (=> b!1500599 m!1383263))

(push 1)

(assert (not b!1500599))

(assert (not b!1500597))

(assert (not start!127684))

(assert (not b!1500596))

(assert (not b!1500598))

(assert (not b!1500595))

(assert (not b!1500600))

(assert (not b!1500604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

