; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128466 () Bool)

(assert start!128466)

(declare-fun res!1026706 () Bool)

(declare-fun e!841891 () Bool)

(assert (=> start!128466 (=> (not res!1026706) (not e!841891))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128466 (= res!1026706 (validMask!0 mask!2512))))

(assert (=> start!128466 e!841891))

(assert (=> start!128466 true))

(declare-datatypes ((array!100478 0))(
  ( (array!100479 (arr!48482 (Array (_ BitVec 32) (_ BitVec 64))) (size!49032 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100478)

(declare-fun array_inv!37510 (array!100478) Bool)

(assert (=> start!128466 (array_inv!37510 a!2804)))

(declare-fun b!1506380 () Bool)

(declare-fun res!1026708 () Bool)

(assert (=> b!1506380 (=> (not res!1026708) (not e!841891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100478 (_ BitVec 32)) Bool)

(assert (=> b!1506380 (= res!1026708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506381 () Bool)

(declare-fun res!1026704 () Bool)

(assert (=> b!1506381 (=> (not res!1026704) (not e!841891))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506381 (= res!1026704 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49032 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49032 a!2804))))))

(declare-fun b!1506382 () Bool)

(declare-fun res!1026705 () Bool)

(assert (=> b!1506382 (=> (not res!1026705) (not e!841891))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506382 (= res!1026705 (validKeyInArray!0 (select (arr!48482 a!2804) i!961)))))

(declare-fun b!1506383 () Bool)

(declare-fun res!1026703 () Bool)

(assert (=> b!1506383 (=> (not res!1026703) (not e!841891))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506383 (= res!1026703 (validKeyInArray!0 (select (arr!48482 a!2804) j!70)))))

(declare-fun b!1506384 () Bool)

(assert (=> b!1506384 (= e!841891 false)))

(declare-fun lt!654226 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506384 (= lt!654226 (toIndex!0 (select (arr!48482 a!2804) j!70) mask!2512))))

(declare-fun b!1506385 () Bool)

(declare-fun res!1026707 () Bool)

(assert (=> b!1506385 (=> (not res!1026707) (not e!841891))))

(assert (=> b!1506385 (= res!1026707 (and (= (size!49032 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49032 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49032 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506386 () Bool)

(declare-fun res!1026709 () Bool)

(assert (=> b!1506386 (=> (not res!1026709) (not e!841891))))

(declare-datatypes ((List!34965 0))(
  ( (Nil!34962) (Cons!34961 (h!36361 (_ BitVec 64)) (t!49659 List!34965)) )
))
(declare-fun arrayNoDuplicates!0 (array!100478 (_ BitVec 32) List!34965) Bool)

(assert (=> b!1506386 (= res!1026709 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34962))))

(assert (= (and start!128466 res!1026706) b!1506385))

(assert (= (and b!1506385 res!1026707) b!1506382))

(assert (= (and b!1506382 res!1026705) b!1506383))

(assert (= (and b!1506383 res!1026703) b!1506380))

(assert (= (and b!1506380 res!1026708) b!1506386))

(assert (= (and b!1506386 res!1026709) b!1506381))

(assert (= (and b!1506381 res!1026704) b!1506384))

(declare-fun m!1389331 () Bool)

(assert (=> b!1506382 m!1389331))

(assert (=> b!1506382 m!1389331))

(declare-fun m!1389333 () Bool)

(assert (=> b!1506382 m!1389333))

(declare-fun m!1389335 () Bool)

(assert (=> b!1506384 m!1389335))

(assert (=> b!1506384 m!1389335))

(declare-fun m!1389337 () Bool)

(assert (=> b!1506384 m!1389337))

(declare-fun m!1389339 () Bool)

(assert (=> b!1506386 m!1389339))

(declare-fun m!1389341 () Bool)

(assert (=> b!1506380 m!1389341))

(declare-fun m!1389343 () Bool)

(assert (=> start!128466 m!1389343))

(declare-fun m!1389345 () Bool)

(assert (=> start!128466 m!1389345))

(assert (=> b!1506383 m!1389335))

(assert (=> b!1506383 m!1389335))

(declare-fun m!1389347 () Bool)

(assert (=> b!1506383 m!1389347))

(push 1)

(assert (not b!1506382))

(assert (not b!1506386))

(assert (not b!1506380))

(assert (not start!128466))

(assert (not b!1506384))

(assert (not b!1506383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

