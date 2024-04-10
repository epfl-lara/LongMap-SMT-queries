; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128176 () Bool)

(assert start!128176)

(declare-fun b!1504909 () Bool)

(declare-fun res!1025502 () Bool)

(declare-fun e!841165 () Bool)

(assert (=> b!1504909 (=> (not res!1025502) (not e!841165))))

(declare-datatypes ((array!100374 0))(
  ( (array!100375 (arr!48439 (Array (_ BitVec 32) (_ BitVec 64))) (size!48989 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100374)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1504909 (= res!1025502 (and (= (size!48989 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48989 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48989 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504910 () Bool)

(declare-fun res!1025508 () Bool)

(assert (=> b!1504910 (=> (not res!1025508) (not e!841165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100374 (_ BitVec 32)) Bool)

(assert (=> b!1504910 (= res!1025508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504911 () Bool)

(declare-fun res!1025505 () Bool)

(declare-fun e!841167 () Bool)

(assert (=> b!1504911 (=> (not res!1025505) (not e!841167))))

(declare-fun lt!653840 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12637 0))(
  ( (MissingZero!12637 (index!52940 (_ BitVec 32))) (Found!12637 (index!52941 (_ BitVec 32))) (Intermediate!12637 (undefined!13449 Bool) (index!52942 (_ BitVec 32)) (x!134623 (_ BitVec 32))) (Undefined!12637) (MissingVacant!12637 (index!52943 (_ BitVec 32))) )
))
(declare-fun lt!653842 () SeekEntryResult!12637)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100374 (_ BitVec 32)) SeekEntryResult!12637)

(assert (=> b!1504911 (= res!1025505 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653840 vacantBefore!10 (select (arr!48439 a!2850) j!87) a!2850 mask!2661) lt!653842))))

(declare-fun b!1504912 () Bool)

(declare-fun res!1025503 () Bool)

(assert (=> b!1504912 (=> (not res!1025503) (not e!841165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504912 (= res!1025503 (validKeyInArray!0 (select (arr!48439 a!2850) i!996)))))

(declare-fun b!1504913 () Bool)

(declare-fun res!1025509 () Bool)

(assert (=> b!1504913 (=> (not res!1025509) (not e!841165))))

(declare-datatypes ((List!34931 0))(
  ( (Nil!34928) (Cons!34927 (h!36324 (_ BitVec 64)) (t!49625 List!34931)) )
))
(declare-fun arrayNoDuplicates!0 (array!100374 (_ BitVec 32) List!34931) Bool)

(assert (=> b!1504913 (= res!1025509 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34928))))

(declare-fun b!1504914 () Bool)

(declare-fun res!1025504 () Bool)

(assert (=> b!1504914 (=> (not res!1025504) (not e!841165))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504914 (= res!1025504 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48989 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48989 a!2850)) (= (select (arr!48439 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48439 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48989 a!2850))))))

(declare-fun b!1504915 () Bool)

(assert (=> b!1504915 (= e!841167 (not true))))

(assert (=> b!1504915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653840 vacantAfter!10 (select (store (arr!48439 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100375 (store (arr!48439 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48989 a!2850)) mask!2661) lt!653842)))

(declare-datatypes ((Unit!50280 0))(
  ( (Unit!50281) )
))
(declare-fun lt!653841 () Unit!50280)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50280)

(assert (=> b!1504915 (= lt!653841 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653840 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504916 () Bool)

(declare-fun e!841168 () Bool)

(assert (=> b!1504916 (= e!841165 e!841168)))

(declare-fun res!1025507 () Bool)

(assert (=> b!1504916 (=> (not res!1025507) (not e!841168))))

(assert (=> b!1504916 (= res!1025507 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48439 a!2850) j!87) a!2850 mask!2661) lt!653842))))

(assert (=> b!1504916 (= lt!653842 (Found!12637 j!87))))

(declare-fun res!1025501 () Bool)

(assert (=> start!128176 (=> (not res!1025501) (not e!841165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128176 (= res!1025501 (validMask!0 mask!2661))))

(assert (=> start!128176 e!841165))

(assert (=> start!128176 true))

(declare-fun array_inv!37467 (array!100374) Bool)

(assert (=> start!128176 (array_inv!37467 a!2850)))

(declare-fun b!1504917 () Bool)

(declare-fun res!1025499 () Bool)

(assert (=> b!1504917 (=> (not res!1025499) (not e!841165))))

(assert (=> b!1504917 (= res!1025499 (validKeyInArray!0 (select (arr!48439 a!2850) j!87)))))

(declare-fun b!1504918 () Bool)

(declare-fun res!1025500 () Bool)

(assert (=> b!1504918 (=> (not res!1025500) (not e!841168))))

(assert (=> b!1504918 (= res!1025500 (not (= (select (arr!48439 a!2850) index!625) (select (arr!48439 a!2850) j!87))))))

(declare-fun b!1504919 () Bool)

(assert (=> b!1504919 (= e!841168 e!841167)))

(declare-fun res!1025506 () Bool)

(assert (=> b!1504919 (=> (not res!1025506) (not e!841167))))

(assert (=> b!1504919 (= res!1025506 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653840 #b00000000000000000000000000000000) (bvslt lt!653840 (size!48989 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504919 (= lt!653840 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128176 res!1025501) b!1504909))

(assert (= (and b!1504909 res!1025502) b!1504912))

(assert (= (and b!1504912 res!1025503) b!1504917))

(assert (= (and b!1504917 res!1025499) b!1504910))

(assert (= (and b!1504910 res!1025508) b!1504913))

(assert (= (and b!1504913 res!1025509) b!1504914))

(assert (= (and b!1504914 res!1025504) b!1504916))

(assert (= (and b!1504916 res!1025507) b!1504918))

(assert (= (and b!1504918 res!1025500) b!1504919))

(assert (= (and b!1504919 res!1025506) b!1504911))

(assert (= (and b!1504911 res!1025505) b!1504915))

(declare-fun m!1388005 () Bool)

(assert (=> b!1504919 m!1388005))

(declare-fun m!1388007 () Bool)

(assert (=> b!1504914 m!1388007))

(declare-fun m!1388009 () Bool)

(assert (=> b!1504914 m!1388009))

(declare-fun m!1388011 () Bool)

(assert (=> b!1504914 m!1388011))

(declare-fun m!1388013 () Bool)

(assert (=> b!1504917 m!1388013))

(assert (=> b!1504917 m!1388013))

(declare-fun m!1388015 () Bool)

(assert (=> b!1504917 m!1388015))

(declare-fun m!1388017 () Bool)

(assert (=> start!128176 m!1388017))

(declare-fun m!1388019 () Bool)

(assert (=> start!128176 m!1388019))

(assert (=> b!1504911 m!1388013))

(assert (=> b!1504911 m!1388013))

(declare-fun m!1388021 () Bool)

(assert (=> b!1504911 m!1388021))

(declare-fun m!1388023 () Bool)

(assert (=> b!1504912 m!1388023))

(assert (=> b!1504912 m!1388023))

(declare-fun m!1388025 () Bool)

(assert (=> b!1504912 m!1388025))

(assert (=> b!1504916 m!1388013))

(assert (=> b!1504916 m!1388013))

(declare-fun m!1388027 () Bool)

(assert (=> b!1504916 m!1388027))

(assert (=> b!1504915 m!1388009))

(declare-fun m!1388029 () Bool)

(assert (=> b!1504915 m!1388029))

(assert (=> b!1504915 m!1388029))

(declare-fun m!1388031 () Bool)

(assert (=> b!1504915 m!1388031))

(declare-fun m!1388033 () Bool)

(assert (=> b!1504915 m!1388033))

(declare-fun m!1388035 () Bool)

(assert (=> b!1504918 m!1388035))

(assert (=> b!1504918 m!1388013))

(declare-fun m!1388037 () Bool)

(assert (=> b!1504913 m!1388037))

(declare-fun m!1388039 () Bool)

(assert (=> b!1504910 m!1388039))

(push 1)

(assert (not b!1504915))

(assert (not b!1504913))

(assert (not b!1504919))

