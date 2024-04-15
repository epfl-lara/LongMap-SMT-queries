; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127932 () Bool)

(assert start!127932)

(declare-fun b!1503155 () Bool)

(declare-fun res!1024223 () Bool)

(declare-fun e!840420 () Bool)

(assert (=> b!1503155 (=> (not res!1024223) (not e!840420))))

(declare-datatypes ((array!100241 0))(
  ( (array!100242 (arr!48378 (Array (_ BitVec 32) (_ BitVec 64))) (size!48930 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100241)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100241 (_ BitVec 32)) Bool)

(assert (=> b!1503155 (= res!1024223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503156 () Bool)

(declare-fun res!1024222 () Bool)

(assert (=> b!1503156 (=> (not res!1024222) (not e!840420))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503156 (= res!1024222 (validKeyInArray!0 (select (arr!48378 a!2850) j!87)))))

(declare-fun res!1024225 () Bool)

(assert (=> start!127932 (=> (not res!1024225) (not e!840420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127932 (= res!1024225 (validMask!0 mask!2661))))

(assert (=> start!127932 e!840420))

(assert (=> start!127932 true))

(declare-fun array_inv!37611 (array!100241) Bool)

(assert (=> start!127932 (array_inv!37611 a!2850)))

(declare-fun b!1503157 () Bool)

(declare-fun res!1024227 () Bool)

(assert (=> b!1503157 (=> (not res!1024227) (not e!840420))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503157 (= res!1024227 (validKeyInArray!0 (select (arr!48378 a!2850) i!996)))))

(declare-fun b!1503158 () Bool)

(declare-fun res!1024224 () Bool)

(assert (=> b!1503158 (=> (not res!1024224) (not e!840420))))

(assert (=> b!1503158 (= res!1024224 (and (= (size!48930 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48930 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48930 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503159 () Bool)

(declare-fun res!1024229 () Bool)

(assert (=> b!1503159 (=> (not res!1024229) (not e!840420))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12597 0))(
  ( (MissingZero!12597 (index!52780 (_ BitVec 32))) (Found!12597 (index!52781 (_ BitVec 32))) (Intermediate!12597 (undefined!13409 Bool) (index!52782 (_ BitVec 32)) (x!134464 (_ BitVec 32))) (Undefined!12597) (MissingVacant!12597 (index!52783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100241 (_ BitVec 32)) SeekEntryResult!12597)

(assert (=> b!1503159 (= res!1024229 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48378 a!2850) j!87) a!2850 mask!2661) (Found!12597 j!87)))))

(declare-fun b!1503160 () Bool)

(declare-fun res!1024228 () Bool)

(assert (=> b!1503160 (=> (not res!1024228) (not e!840420))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503160 (= res!1024228 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48930 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48930 a!2850)) (= (select (arr!48378 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48378 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48930 a!2850))))))

(declare-fun b!1503161 () Bool)

(declare-fun res!1024221 () Bool)

(assert (=> b!1503161 (=> (not res!1024221) (not e!840420))))

(declare-datatypes ((List!34948 0))(
  ( (Nil!34945) (Cons!34944 (h!36342 (_ BitVec 64)) (t!49634 List!34948)) )
))
(declare-fun arrayNoDuplicates!0 (array!100241 (_ BitVec 32) List!34948) Bool)

(assert (=> b!1503161 (= res!1024221 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34945))))

(declare-fun b!1503162 () Bool)

(declare-fun res!1024226 () Bool)

(assert (=> b!1503162 (=> (not res!1024226) (not e!840420))))

(assert (=> b!1503162 (= res!1024226 (not (= (select (arr!48378 a!2850) index!625) (select (arr!48378 a!2850) j!87))))))

(declare-fun b!1503163 () Bool)

(assert (=> b!1503163 (= e!840420 false)))

(declare-fun lt!653251 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503163 (= lt!653251 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127932 res!1024225) b!1503158))

(assert (= (and b!1503158 res!1024224) b!1503157))

(assert (= (and b!1503157 res!1024227) b!1503156))

(assert (= (and b!1503156 res!1024222) b!1503155))

(assert (= (and b!1503155 res!1024223) b!1503161))

(assert (= (and b!1503161 res!1024221) b!1503160))

(assert (= (and b!1503160 res!1024228) b!1503159))

(assert (= (and b!1503159 res!1024229) b!1503162))

(assert (= (and b!1503162 res!1024226) b!1503163))

(declare-fun m!1385853 () Bool)

(assert (=> b!1503159 m!1385853))

(assert (=> b!1503159 m!1385853))

(declare-fun m!1385855 () Bool)

(assert (=> b!1503159 m!1385855))

(assert (=> b!1503156 m!1385853))

(assert (=> b!1503156 m!1385853))

(declare-fun m!1385857 () Bool)

(assert (=> b!1503156 m!1385857))

(declare-fun m!1385859 () Bool)

(assert (=> b!1503155 m!1385859))

(declare-fun m!1385861 () Bool)

(assert (=> b!1503163 m!1385861))

(declare-fun m!1385863 () Bool)

(assert (=> b!1503157 m!1385863))

(assert (=> b!1503157 m!1385863))

(declare-fun m!1385865 () Bool)

(assert (=> b!1503157 m!1385865))

(declare-fun m!1385867 () Bool)

(assert (=> b!1503160 m!1385867))

(declare-fun m!1385869 () Bool)

(assert (=> b!1503160 m!1385869))

(declare-fun m!1385871 () Bool)

(assert (=> b!1503160 m!1385871))

(declare-fun m!1385873 () Bool)

(assert (=> b!1503161 m!1385873))

(declare-fun m!1385875 () Bool)

(assert (=> start!127932 m!1385875))

(declare-fun m!1385877 () Bool)

(assert (=> start!127932 m!1385877))

(declare-fun m!1385879 () Bool)

(assert (=> b!1503162 m!1385879))

(assert (=> b!1503162 m!1385853))

(push 1)

(assert (not b!1503156))

(assert (not start!127932))

(assert (not b!1503157))

(assert (not b!1503159))

(assert (not b!1503163))

(assert (not b!1503161))

(assert (not b!1503155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

