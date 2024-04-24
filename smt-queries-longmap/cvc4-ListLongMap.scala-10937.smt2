; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128260 () Bool)

(assert start!128260)

(declare-fun b!1505033 () Bool)

(declare-fun res!1024735 () Bool)

(declare-fun e!841694 () Bool)

(assert (=> b!1505033 (=> (not res!1024735) (not e!841694))))

(declare-datatypes ((array!100389 0))(
  ( (array!100390 (arr!48446 (Array (_ BitVec 32) (_ BitVec 64))) (size!48997 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100389)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100389 (_ BitVec 32)) Bool)

(assert (=> b!1505033 (= res!1024735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505035 () Bool)

(declare-fun res!1024740 () Bool)

(assert (=> b!1505035 (=> (not res!1024740) (not e!841694))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505035 (= res!1024740 (and (= (size!48997 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48997 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48997 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505036 () Bool)

(declare-fun res!1024739 () Bool)

(assert (=> b!1505036 (=> (not res!1024739) (not e!841694))))

(declare-datatypes ((List!34925 0))(
  ( (Nil!34922) (Cons!34921 (h!36333 (_ BitVec 64)) (t!49611 List!34925)) )
))
(declare-fun arrayNoDuplicates!0 (array!100389 (_ BitVec 32) List!34925) Bool)

(assert (=> b!1505036 (= res!1024739 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34922))))

(declare-fun b!1505037 () Bool)

(declare-fun res!1024734 () Bool)

(assert (=> b!1505037 (=> (not res!1024734) (not e!841694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505037 (= res!1024734 (validKeyInArray!0 (select (arr!48446 a!2850) i!996)))))

(declare-fun b!1505038 () Bool)

(declare-fun res!1024742 () Bool)

(assert (=> b!1505038 (=> (not res!1024742) (not e!841694))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1505038 (= res!1024742 (not (= (select (arr!48446 a!2850) index!625) (select (arr!48446 a!2850) j!87))))))

(declare-fun b!1505039 () Bool)

(declare-fun res!1024737 () Bool)

(assert (=> b!1505039 (=> (not res!1024737) (not e!841694))))

(assert (=> b!1505039 (= res!1024737 (validKeyInArray!0 (select (arr!48446 a!2850) j!87)))))

(declare-fun b!1505040 () Bool)

(assert (=> b!1505040 (= e!841694 false)))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!654163 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505040 (= lt!654163 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505041 () Bool)

(declare-fun res!1024738 () Bool)

(assert (=> b!1505041 (=> (not res!1024738) (not e!841694))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12537 0))(
  ( (MissingZero!12537 (index!52540 (_ BitVec 32))) (Found!12537 (index!52541 (_ BitVec 32))) (Intermediate!12537 (undefined!13349 Bool) (index!52542 (_ BitVec 32)) (x!134422 (_ BitVec 32))) (Undefined!12537) (MissingVacant!12537 (index!52543 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100389 (_ BitVec 32)) SeekEntryResult!12537)

(assert (=> b!1505041 (= res!1024738 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48446 a!2850) j!87) a!2850 mask!2661) (Found!12537 j!87)))))

(declare-fun b!1505034 () Bool)

(declare-fun res!1024736 () Bool)

(assert (=> b!1505034 (=> (not res!1024736) (not e!841694))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505034 (= res!1024736 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48997 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48997 a!2850)) (= (select (arr!48446 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48446 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48997 a!2850))))))

(declare-fun res!1024741 () Bool)

(assert (=> start!128260 (=> (not res!1024741) (not e!841694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128260 (= res!1024741 (validMask!0 mask!2661))))

(assert (=> start!128260 e!841694))

(assert (=> start!128260 true))

(declare-fun array_inv!37727 (array!100389) Bool)

(assert (=> start!128260 (array_inv!37727 a!2850)))

(assert (= (and start!128260 res!1024741) b!1505035))

(assert (= (and b!1505035 res!1024740) b!1505037))

(assert (= (and b!1505037 res!1024734) b!1505039))

(assert (= (and b!1505039 res!1024737) b!1505033))

(assert (= (and b!1505033 res!1024735) b!1505036))

(assert (= (and b!1505036 res!1024739) b!1505034))

(assert (= (and b!1505034 res!1024736) b!1505041))

(assert (= (and b!1505041 res!1024738) b!1505038))

(assert (= (and b!1505038 res!1024742) b!1505040))

(declare-fun m!1388215 () Bool)

(assert (=> start!128260 m!1388215))

(declare-fun m!1388217 () Bool)

(assert (=> start!128260 m!1388217))

(declare-fun m!1388219 () Bool)

(assert (=> b!1505033 m!1388219))

(declare-fun m!1388221 () Bool)

(assert (=> b!1505039 m!1388221))

(assert (=> b!1505039 m!1388221))

(declare-fun m!1388223 () Bool)

(assert (=> b!1505039 m!1388223))

(declare-fun m!1388225 () Bool)

(assert (=> b!1505040 m!1388225))

(assert (=> b!1505041 m!1388221))

(assert (=> b!1505041 m!1388221))

(declare-fun m!1388227 () Bool)

(assert (=> b!1505041 m!1388227))

(declare-fun m!1388229 () Bool)

(assert (=> b!1505037 m!1388229))

(assert (=> b!1505037 m!1388229))

(declare-fun m!1388231 () Bool)

(assert (=> b!1505037 m!1388231))

(declare-fun m!1388233 () Bool)

(assert (=> b!1505038 m!1388233))

(assert (=> b!1505038 m!1388221))

(declare-fun m!1388235 () Bool)

(assert (=> b!1505036 m!1388235))

(declare-fun m!1388237 () Bool)

(assert (=> b!1505034 m!1388237))

(declare-fun m!1388239 () Bool)

(assert (=> b!1505034 m!1388239))

(declare-fun m!1388241 () Bool)

(assert (=> b!1505034 m!1388241))

(push 1)

(assert (not b!1505037))

(assert (not b!1505039))

(assert (not b!1505033))

(assert (not b!1505036))

(assert (not start!128260))

(assert (not b!1505041))

(assert (not b!1505040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

