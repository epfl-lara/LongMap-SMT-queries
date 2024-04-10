; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127782 () Bool)

(assert start!127782)

(declare-fun res!1022842 () Bool)

(declare-fun e!840049 () Bool)

(assert (=> start!127782 (=> (not res!1022842) (not e!840049))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127782 (= res!1022842 (validMask!0 mask!2661))))

(assert (=> start!127782 e!840049))

(assert (=> start!127782 true))

(declare-datatypes ((array!100163 0))(
  ( (array!100164 (arr!48341 (Array (_ BitVec 32) (_ BitVec 64))) (size!48891 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100163)

(declare-fun array_inv!37369 (array!100163) Bool)

(assert (=> start!127782 (array_inv!37369 a!2850)))

(declare-fun b!1501762 () Bool)

(declare-fun res!1022839 () Bool)

(assert (=> b!1501762 (=> (not res!1022839) (not e!840049))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501762 (= res!1022839 (and (= (size!48891 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48891 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48891 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501763 () Bool)

(declare-fun res!1022840 () Bool)

(assert (=> b!1501763 (=> (not res!1022840) (not e!840049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501763 (= res!1022840 (validKeyInArray!0 (select (arr!48341 a!2850) i!996)))))

(declare-fun b!1501764 () Bool)

(declare-fun res!1022841 () Bool)

(assert (=> b!1501764 (=> (not res!1022841) (not e!840049))))

(assert (=> b!1501764 (= res!1022841 (validKeyInArray!0 (select (arr!48341 a!2850) j!87)))))

(declare-fun b!1501765 () Bool)

(declare-fun res!1022838 () Bool)

(assert (=> b!1501765 (=> (not res!1022838) (not e!840049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100163 (_ BitVec 32)) Bool)

(assert (=> b!1501765 (= res!1022838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501766 () Bool)

(assert (=> b!1501766 (= e!840049 false)))

(declare-fun lt!653257 () Bool)

(declare-datatypes ((List!34833 0))(
  ( (Nil!34830) (Cons!34829 (h!36226 (_ BitVec 64)) (t!49527 List!34833)) )
))
(declare-fun arrayNoDuplicates!0 (array!100163 (_ BitVec 32) List!34833) Bool)

(assert (=> b!1501766 (= lt!653257 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34830))))

(assert (= (and start!127782 res!1022842) b!1501762))

(assert (= (and b!1501762 res!1022839) b!1501763))

(assert (= (and b!1501763 res!1022840) b!1501764))

(assert (= (and b!1501764 res!1022841) b!1501765))

(assert (= (and b!1501765 res!1022838) b!1501766))

(declare-fun m!1385035 () Bool)

(assert (=> start!127782 m!1385035))

(declare-fun m!1385037 () Bool)

(assert (=> start!127782 m!1385037))

(declare-fun m!1385039 () Bool)

(assert (=> b!1501763 m!1385039))

(assert (=> b!1501763 m!1385039))

(declare-fun m!1385041 () Bool)

(assert (=> b!1501763 m!1385041))

(declare-fun m!1385043 () Bool)

(assert (=> b!1501765 m!1385043))

(declare-fun m!1385045 () Bool)

(assert (=> b!1501764 m!1385045))

(assert (=> b!1501764 m!1385045))

(declare-fun m!1385047 () Bool)

(assert (=> b!1501764 m!1385047))

(declare-fun m!1385049 () Bool)

(assert (=> b!1501766 m!1385049))

(push 1)

(assert (not b!1501765))

(assert (not b!1501764))

(assert (not b!1501766))

(assert (not start!127782))

(assert (not b!1501763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

