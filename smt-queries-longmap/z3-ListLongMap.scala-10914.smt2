; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128048 () Bool)

(assert start!128048)

(declare-fun b!1503009 () Bool)

(declare-fun res!1022904 () Bool)

(declare-fun e!840968 () Bool)

(assert (=> b!1503009 (=> (not res!1022904) (not e!840968))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100243 0))(
  ( (array!100244 (arr!48376 (Array (_ BitVec 32) (_ BitVec 64))) (size!48927 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100243)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503009 (= res!1022904 (and (= (size!48927 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48927 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48927 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503010 () Bool)

(declare-fun res!1022908 () Bool)

(assert (=> b!1503010 (=> (not res!1022908) (not e!840968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503010 (= res!1022908 (validKeyInArray!0 (select (arr!48376 a!2850) j!87)))))

(declare-fun b!1503011 () Bool)

(declare-fun res!1022903 () Bool)

(assert (=> b!1503011 (=> (not res!1022903) (not e!840968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100243 (_ BitVec 32)) Bool)

(assert (=> b!1503011 (= res!1022903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503012 () Bool)

(declare-fun res!1022909 () Bool)

(assert (=> b!1503012 (=> (not res!1022909) (not e!840968))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503012 (= res!1022909 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48927 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48927 a!2850)) (= (select (arr!48376 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48927 a!2850))))))

(declare-fun b!1503013 () Bool)

(declare-fun e!840966 () Bool)

(assert (=> b!1503013 (= e!840966 (not true))))

(declare-fun lt!653765 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12479 0))(
  ( (MissingZero!12479 (index!52308 (_ BitVec 32))) (Found!12479 (index!52309 (_ BitVec 32))) (Intermediate!12479 (undefined!13291 Bool) (index!52310 (_ BitVec 32)) (x!134174 (_ BitVec 32))) (Undefined!12479) (MissingVacant!12479 (index!52311 (_ BitVec 32))) )
))
(declare-fun lt!653764 () SeekEntryResult!12479)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100243 (_ BitVec 32)) SeekEntryResult!12479)

(assert (=> b!1503013 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653765 vacantAfter!10 (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100244 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48927 a!2850)) mask!2661) lt!653764)))

(declare-datatypes ((Unit!50149 0))(
  ( (Unit!50150) )
))
(declare-fun lt!653766 () Unit!50149)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50149)

(assert (=> b!1503013 (= lt!653766 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653765 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun res!1022906 () Bool)

(assert (=> start!128048 (=> (not res!1022906) (not e!840968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128048 (= res!1022906 (validMask!0 mask!2661))))

(assert (=> start!128048 e!840968))

(assert (=> start!128048 true))

(declare-fun array_inv!37657 (array!100243) Bool)

(assert (=> start!128048 (array_inv!37657 a!2850)))

(declare-fun b!1503014 () Bool)

(declare-fun res!1022911 () Bool)

(assert (=> b!1503014 (=> (not res!1022911) (not e!840968))))

(declare-datatypes ((List!34855 0))(
  ( (Nil!34852) (Cons!34851 (h!36263 (_ BitVec 64)) (t!49541 List!34855)) )
))
(declare-fun arrayNoDuplicates!0 (array!100243 (_ BitVec 32) List!34855) Bool)

(assert (=> b!1503014 (= res!1022911 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34852))))

(declare-fun b!1503015 () Bool)

(declare-fun res!1022905 () Bool)

(declare-fun e!840967 () Bool)

(assert (=> b!1503015 (=> (not res!1022905) (not e!840967))))

(assert (=> b!1503015 (= res!1022905 (not (= (select (arr!48376 a!2850) index!625) (select (arr!48376 a!2850) j!87))))))

(declare-fun b!1503016 () Bool)

(assert (=> b!1503016 (= e!840967 e!840966)))

(declare-fun res!1022907 () Bool)

(assert (=> b!1503016 (=> (not res!1022907) (not e!840966))))

(assert (=> b!1503016 (= res!1022907 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653765 #b00000000000000000000000000000000) (bvslt lt!653765 (size!48927 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503016 (= lt!653765 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503017 () Bool)

(declare-fun res!1022902 () Bool)

(assert (=> b!1503017 (=> (not res!1022902) (not e!840968))))

(assert (=> b!1503017 (= res!1022902 (validKeyInArray!0 (select (arr!48376 a!2850) i!996)))))

(declare-fun b!1503018 () Bool)

(declare-fun res!1022910 () Bool)

(assert (=> b!1503018 (=> (not res!1022910) (not e!840966))))

(assert (=> b!1503018 (= res!1022910 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653765 vacantBefore!10 (select (arr!48376 a!2850) j!87) a!2850 mask!2661) lt!653764))))

(declare-fun b!1503019 () Bool)

(assert (=> b!1503019 (= e!840968 e!840967)))

(declare-fun res!1022912 () Bool)

(assert (=> b!1503019 (=> (not res!1022912) (not e!840967))))

(assert (=> b!1503019 (= res!1022912 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48376 a!2850) j!87) a!2850 mask!2661) lt!653764))))

(assert (=> b!1503019 (= lt!653764 (Found!12479 j!87))))

(assert (= (and start!128048 res!1022906) b!1503009))

(assert (= (and b!1503009 res!1022904) b!1503017))

(assert (= (and b!1503017 res!1022902) b!1503010))

(assert (= (and b!1503010 res!1022908) b!1503011))

(assert (= (and b!1503011 res!1022903) b!1503014))

(assert (= (and b!1503014 res!1022911) b!1503012))

(assert (= (and b!1503012 res!1022909) b!1503019))

(assert (= (and b!1503019 res!1022912) b!1503015))

(assert (= (and b!1503015 res!1022905) b!1503016))

(assert (= (and b!1503016 res!1022907) b!1503018))

(assert (= (and b!1503018 res!1022910) b!1503013))

(declare-fun m!1386169 () Bool)

(assert (=> b!1503014 m!1386169))

(declare-fun m!1386171 () Bool)

(assert (=> b!1503015 m!1386171))

(declare-fun m!1386173 () Bool)

(assert (=> b!1503015 m!1386173))

(declare-fun m!1386175 () Bool)

(assert (=> b!1503012 m!1386175))

(declare-fun m!1386177 () Bool)

(assert (=> b!1503012 m!1386177))

(declare-fun m!1386179 () Bool)

(assert (=> b!1503012 m!1386179))

(assert (=> b!1503013 m!1386177))

(declare-fun m!1386181 () Bool)

(assert (=> b!1503013 m!1386181))

(assert (=> b!1503013 m!1386181))

(declare-fun m!1386183 () Bool)

(assert (=> b!1503013 m!1386183))

(declare-fun m!1386185 () Bool)

(assert (=> b!1503013 m!1386185))

(declare-fun m!1386187 () Bool)

(assert (=> start!128048 m!1386187))

(declare-fun m!1386189 () Bool)

(assert (=> start!128048 m!1386189))

(declare-fun m!1386191 () Bool)

(assert (=> b!1503017 m!1386191))

(assert (=> b!1503017 m!1386191))

(declare-fun m!1386193 () Bool)

(assert (=> b!1503017 m!1386193))

(declare-fun m!1386195 () Bool)

(assert (=> b!1503011 m!1386195))

(assert (=> b!1503010 m!1386173))

(assert (=> b!1503010 m!1386173))

(declare-fun m!1386197 () Bool)

(assert (=> b!1503010 m!1386197))

(assert (=> b!1503018 m!1386173))

(assert (=> b!1503018 m!1386173))

(declare-fun m!1386199 () Bool)

(assert (=> b!1503018 m!1386199))

(declare-fun m!1386201 () Bool)

(assert (=> b!1503016 m!1386201))

(assert (=> b!1503019 m!1386173))

(assert (=> b!1503019 m!1386173))

(declare-fun m!1386203 () Bool)

(assert (=> b!1503019 m!1386203))

(check-sat (not start!128048) (not b!1503013) (not b!1503011) (not b!1503010) (not b!1503016) (not b!1503018) (not b!1503019) (not b!1503014) (not b!1503017))
(check-sat)
