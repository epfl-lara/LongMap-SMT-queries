; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128418 () Bool)

(assert start!128418)

(declare-fun b!1506174 () Bool)

(declare-fun e!841791 () Bool)

(assert (=> b!1506174 (= e!841791 false)))

(declare-fun lt!654163 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100463 0))(
  ( (array!100464 (arr!48476 (Array (_ BitVec 32) (_ BitVec 64))) (size!49026 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506174 (= lt!654163 (toIndex!0 (select (arr!48476 a!2804) j!70) mask!2512))))

(declare-fun b!1506175 () Bool)

(declare-fun res!1026532 () Bool)

(assert (=> b!1506175 (=> (not res!1026532) (not e!841791))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506175 (= res!1026532 (validKeyInArray!0 (select (arr!48476 a!2804) i!961)))))

(declare-fun b!1506176 () Bool)

(declare-fun res!1026529 () Bool)

(assert (=> b!1506176 (=> (not res!1026529) (not e!841791))))

(declare-datatypes ((List!34959 0))(
  ( (Nil!34956) (Cons!34955 (h!36352 (_ BitVec 64)) (t!49653 List!34959)) )
))
(declare-fun arrayNoDuplicates!0 (array!100463 (_ BitVec 32) List!34959) Bool)

(assert (=> b!1506176 (= res!1026529 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34956))))

(declare-fun b!1506177 () Bool)

(declare-fun res!1026534 () Bool)

(assert (=> b!1506177 (=> (not res!1026534) (not e!841791))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506177 (= res!1026534 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49026 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49026 a!2804))))))

(declare-fun b!1506173 () Bool)

(declare-fun res!1026530 () Bool)

(assert (=> b!1506173 (=> (not res!1026530) (not e!841791))))

(assert (=> b!1506173 (= res!1026530 (validKeyInArray!0 (select (arr!48476 a!2804) j!70)))))

(declare-fun res!1026531 () Bool)

(assert (=> start!128418 (=> (not res!1026531) (not e!841791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128418 (= res!1026531 (validMask!0 mask!2512))))

(assert (=> start!128418 e!841791))

(assert (=> start!128418 true))

(declare-fun array_inv!37504 (array!100463) Bool)

(assert (=> start!128418 (array_inv!37504 a!2804)))

(declare-fun b!1506178 () Bool)

(declare-fun res!1026535 () Bool)

(assert (=> b!1506178 (=> (not res!1026535) (not e!841791))))

(assert (=> b!1506178 (= res!1026535 (and (= (size!49026 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49026 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49026 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506179 () Bool)

(declare-fun res!1026533 () Bool)

(assert (=> b!1506179 (=> (not res!1026533) (not e!841791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100463 (_ BitVec 32)) Bool)

(assert (=> b!1506179 (= res!1026533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128418 res!1026531) b!1506178))

(assert (= (and b!1506178 res!1026535) b!1506175))

(assert (= (and b!1506175 res!1026532) b!1506173))

(assert (= (and b!1506173 res!1026530) b!1506179))

(assert (= (and b!1506179 res!1026533) b!1506176))

(assert (= (and b!1506176 res!1026529) b!1506177))

(assert (= (and b!1506177 res!1026534) b!1506174))

(declare-fun m!1389175 () Bool)

(assert (=> b!1506179 m!1389175))

(declare-fun m!1389177 () Bool)

(assert (=> b!1506176 m!1389177))

(declare-fun m!1389179 () Bool)

(assert (=> b!1506175 m!1389179))

(assert (=> b!1506175 m!1389179))

(declare-fun m!1389181 () Bool)

(assert (=> b!1506175 m!1389181))

(declare-fun m!1389183 () Bool)

(assert (=> b!1506174 m!1389183))

(assert (=> b!1506174 m!1389183))

(declare-fun m!1389185 () Bool)

(assert (=> b!1506174 m!1389185))

(declare-fun m!1389187 () Bool)

(assert (=> start!128418 m!1389187))

(declare-fun m!1389189 () Bool)

(assert (=> start!128418 m!1389189))

(assert (=> b!1506173 m!1389183))

(assert (=> b!1506173 m!1389183))

(declare-fun m!1389191 () Bool)

(assert (=> b!1506173 m!1389191))

(push 1)

(assert (not start!128418))

(assert (not b!1506173))

(assert (not b!1506174))

(assert (not b!1506175))

(assert (not b!1506176))

(assert (not b!1506179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

