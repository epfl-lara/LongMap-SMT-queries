; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129598 () Bool)

(assert start!129598)

(declare-fun b!1521388 () Bool)

(declare-fun res!1040612 () Bool)

(declare-fun e!848515 () Bool)

(assert (=> b!1521388 (=> (not res!1040612) (not e!848515))))

(declare-datatypes ((array!101273 0))(
  ( (array!101274 (arr!48869 (Array (_ BitVec 32) (_ BitVec 64))) (size!49419 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101273)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521388 (= res!1040612 (validKeyInArray!0 (select (arr!48869 a!2804) j!70)))))

(declare-fun res!1040616 () Bool)

(assert (=> start!129598 (=> (not res!1040616) (not e!848515))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129598 (= res!1040616 (validMask!0 mask!2512))))

(assert (=> start!129598 e!848515))

(assert (=> start!129598 true))

(declare-fun array_inv!37897 (array!101273) Bool)

(assert (=> start!129598 (array_inv!37897 a!2804)))

(declare-fun b!1521389 () Bool)

(declare-fun res!1040617 () Bool)

(assert (=> b!1521389 (=> (not res!1040617) (not e!848515))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13034 0))(
  ( (MissingZero!13034 (index!54531 (_ BitVec 32))) (Found!13034 (index!54532 (_ BitVec 32))) (Intermediate!13034 (undefined!13846 Bool) (index!54533 (_ BitVec 32)) (x!136230 (_ BitVec 32))) (Undefined!13034) (MissingVacant!13034 (index!54534 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101273 (_ BitVec 32)) SeekEntryResult!13034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521389 (= res!1040617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48869 a!2804) j!70) mask!2512) (select (arr!48869 a!2804) j!70) a!2804 mask!2512) (Intermediate!13034 false resIndex!21 resX!21)))))

(declare-fun b!1521390 () Bool)

(declare-fun res!1040615 () Bool)

(assert (=> b!1521390 (=> (not res!1040615) (not e!848515))))

(declare-datatypes ((List!35352 0))(
  ( (Nil!35349) (Cons!35348 (h!36769 (_ BitVec 64)) (t!50046 List!35352)) )
))
(declare-fun arrayNoDuplicates!0 (array!101273 (_ BitVec 32) List!35352) Bool)

(assert (=> b!1521390 (= res!1040615 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35349))))

(declare-fun b!1521391 () Bool)

(declare-fun res!1040610 () Bool)

(assert (=> b!1521391 (=> (not res!1040610) (not e!848515))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521391 (= res!1040610 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49419 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49419 a!2804))))))

(declare-fun b!1521392 () Bool)

(declare-fun res!1040614 () Bool)

(assert (=> b!1521392 (=> (not res!1040614) (not e!848515))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521392 (= res!1040614 (and (= (size!49419 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49419 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49419 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521393 () Bool)

(declare-fun res!1040611 () Bool)

(assert (=> b!1521393 (=> (not res!1040611) (not e!848515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101273 (_ BitVec 32)) Bool)

(assert (=> b!1521393 (= res!1040611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521394 () Bool)

(declare-fun res!1040613 () Bool)

(assert (=> b!1521394 (=> (not res!1040613) (not e!848515))))

(assert (=> b!1521394 (= res!1040613 (validKeyInArray!0 (select (arr!48869 a!2804) i!961)))))

(declare-fun b!1521395 () Bool)

(assert (=> b!1521395 (= e!848515 false)))

(declare-fun lt!659344 () SeekEntryResult!13034)

(assert (=> b!1521395 (= lt!659344 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48869 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129598 res!1040616) b!1521392))

(assert (= (and b!1521392 res!1040614) b!1521394))

(assert (= (and b!1521394 res!1040613) b!1521388))

(assert (= (and b!1521388 res!1040612) b!1521393))

(assert (= (and b!1521393 res!1040611) b!1521390))

(assert (= (and b!1521390 res!1040615) b!1521391))

(assert (= (and b!1521391 res!1040610) b!1521389))

(assert (= (and b!1521389 res!1040617) b!1521395))

(declare-fun m!1404485 () Bool)

(assert (=> b!1521390 m!1404485))

(declare-fun m!1404487 () Bool)

(assert (=> b!1521388 m!1404487))

(assert (=> b!1521388 m!1404487))

(declare-fun m!1404489 () Bool)

(assert (=> b!1521388 m!1404489))

(declare-fun m!1404491 () Bool)

(assert (=> b!1521393 m!1404491))

(assert (=> b!1521389 m!1404487))

(assert (=> b!1521389 m!1404487))

(declare-fun m!1404493 () Bool)

(assert (=> b!1521389 m!1404493))

(assert (=> b!1521389 m!1404493))

(assert (=> b!1521389 m!1404487))

(declare-fun m!1404495 () Bool)

(assert (=> b!1521389 m!1404495))

(assert (=> b!1521395 m!1404487))

(assert (=> b!1521395 m!1404487))

(declare-fun m!1404497 () Bool)

(assert (=> b!1521395 m!1404497))

(declare-fun m!1404499 () Bool)

(assert (=> start!129598 m!1404499))

(declare-fun m!1404501 () Bool)

(assert (=> start!129598 m!1404501))

(declare-fun m!1404503 () Bool)

(assert (=> b!1521394 m!1404503))

(assert (=> b!1521394 m!1404503))

(declare-fun m!1404505 () Bool)

(assert (=> b!1521394 m!1404505))

(push 1)

(assert (not b!1521388))

(assert (not b!1521393))

(assert (not b!1521390))

(assert (not start!129598))

(assert (not b!1521394))

(assert (not b!1521389))

(assert (not b!1521395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

