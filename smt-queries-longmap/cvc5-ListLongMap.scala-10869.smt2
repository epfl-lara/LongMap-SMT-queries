; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127386 () Bool)

(assert start!127386)

(declare-fun b!1497661 () Bool)

(declare-fun e!838656 () Bool)

(declare-datatypes ((array!99848 0))(
  ( (array!99849 (arr!48188 (Array (_ BitVec 32) (_ BitVec 64))) (size!48738 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99848)

(assert (=> b!1497661 (= e!838656 (bvsgt #b00000000000000000000000000000000 (size!48738 a!2850)))))

(declare-fun b!1497662 () Bool)

(declare-fun res!1018791 () Bool)

(assert (=> b!1497662 (=> (not res!1018791) (not e!838656))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497662 (= res!1018791 (and (= (size!48738 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48738 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48738 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497663 () Bool)

(declare-fun res!1018795 () Bool)

(assert (=> b!1497663 (=> (not res!1018795) (not e!838656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497663 (= res!1018795 (validKeyInArray!0 (select (arr!48188 a!2850) j!87)))))

(declare-fun res!1018792 () Bool)

(assert (=> start!127386 (=> (not res!1018792) (not e!838656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127386 (= res!1018792 (validMask!0 mask!2661))))

(assert (=> start!127386 e!838656))

(assert (=> start!127386 true))

(declare-fun array_inv!37216 (array!99848) Bool)

(assert (=> start!127386 (array_inv!37216 a!2850)))

(declare-fun b!1497664 () Bool)

(declare-fun res!1018794 () Bool)

(assert (=> b!1497664 (=> (not res!1018794) (not e!838656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99848 (_ BitVec 32)) Bool)

(assert (=> b!1497664 (= res!1018794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497665 () Bool)

(declare-fun res!1018793 () Bool)

(assert (=> b!1497665 (=> (not res!1018793) (not e!838656))))

(assert (=> b!1497665 (= res!1018793 (validKeyInArray!0 (select (arr!48188 a!2850) i!996)))))

(assert (= (and start!127386 res!1018792) b!1497662))

(assert (= (and b!1497662 res!1018791) b!1497665))

(assert (= (and b!1497665 res!1018793) b!1497663))

(assert (= (and b!1497663 res!1018795) b!1497664))

(assert (= (and b!1497664 res!1018794) b!1497661))

(declare-fun m!1380751 () Bool)

(assert (=> b!1497663 m!1380751))

(assert (=> b!1497663 m!1380751))

(declare-fun m!1380753 () Bool)

(assert (=> b!1497663 m!1380753))

(declare-fun m!1380755 () Bool)

(assert (=> start!127386 m!1380755))

(declare-fun m!1380757 () Bool)

(assert (=> start!127386 m!1380757))

(declare-fun m!1380759 () Bool)

(assert (=> b!1497664 m!1380759))

(declare-fun m!1380761 () Bool)

(assert (=> b!1497665 m!1380761))

(assert (=> b!1497665 m!1380761))

(declare-fun m!1380763 () Bool)

(assert (=> b!1497665 m!1380763))

(push 1)

(assert (not start!127386))

