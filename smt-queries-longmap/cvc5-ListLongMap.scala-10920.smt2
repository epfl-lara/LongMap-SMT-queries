; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128088 () Bool)

(assert start!128088)

(declare-fun b!1503630 () Bool)

(declare-fun res!1023523 () Bool)

(declare-fun e!841200 () Bool)

(assert (=> b!1503630 (=> (not res!1023523) (not e!841200))))

(declare-datatypes ((array!100283 0))(
  ( (array!100284 (arr!48396 (Array (_ BitVec 32) (_ BitVec 64))) (size!48947 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100283)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100283 (_ BitVec 32)) Bool)

(assert (=> b!1503630 (= res!1023523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503631 () Bool)

(declare-fun res!1023527 () Bool)

(assert (=> b!1503631 (=> (not res!1023527) (not e!841200))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503631 (= res!1023527 (and (= (size!48947 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48947 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48947 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503632 () Bool)

(declare-fun res!1023525 () Bool)

(assert (=> b!1503632 (=> (not res!1023525) (not e!841200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503632 (= res!1023525 (validKeyInArray!0 (select (arr!48396 a!2850) j!87)))))

(declare-fun b!1503633 () Bool)

(assert (=> b!1503633 (= e!841200 false)))

(declare-fun lt!653928 () Bool)

(declare-datatypes ((List!34875 0))(
  ( (Nil!34872) (Cons!34871 (h!36283 (_ BitVec 64)) (t!49561 List!34875)) )
))
(declare-fun arrayNoDuplicates!0 (array!100283 (_ BitVec 32) List!34875) Bool)

(assert (=> b!1503633 (= lt!653928 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34872))))

(declare-fun b!1503634 () Bool)

(declare-fun res!1023524 () Bool)

(assert (=> b!1503634 (=> (not res!1023524) (not e!841200))))

(assert (=> b!1503634 (= res!1023524 (validKeyInArray!0 (select (arr!48396 a!2850) i!996)))))

(declare-fun res!1023526 () Bool)

(assert (=> start!128088 (=> (not res!1023526) (not e!841200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128088 (= res!1023526 (validMask!0 mask!2661))))

(assert (=> start!128088 e!841200))

(assert (=> start!128088 true))

(declare-fun array_inv!37677 (array!100283) Bool)

(assert (=> start!128088 (array_inv!37677 a!2850)))

(assert (= (and start!128088 res!1023526) b!1503631))

(assert (= (and b!1503631 res!1023527) b!1503634))

(assert (= (and b!1503634 res!1023524) b!1503632))

(assert (= (and b!1503632 res!1023525) b!1503630))

(assert (= (and b!1503630 res!1023523) b!1503633))

(declare-fun m!1386855 () Bool)

(assert (=> b!1503632 m!1386855))

(assert (=> b!1503632 m!1386855))

(declare-fun m!1386857 () Bool)

(assert (=> b!1503632 m!1386857))

(declare-fun m!1386859 () Bool)

(assert (=> start!128088 m!1386859))

(declare-fun m!1386861 () Bool)

(assert (=> start!128088 m!1386861))

(declare-fun m!1386863 () Bool)

(assert (=> b!1503634 m!1386863))

(assert (=> b!1503634 m!1386863))

(declare-fun m!1386865 () Bool)

(assert (=> b!1503634 m!1386865))

(declare-fun m!1386867 () Bool)

(assert (=> b!1503630 m!1386867))

(declare-fun m!1386869 () Bool)

(assert (=> b!1503633 m!1386869))

(push 1)

(assert (not b!1503633))

(assert (not start!128088))

(assert (not b!1503630))

(assert (not b!1503632))

(assert (not b!1503634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

