; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50166 () Bool)

(assert start!50166)

(declare-fun res!342240 () Bool)

(declare-fun e!317217 () Bool)

(assert (=> start!50166 (=> (not res!342240) (not e!317217))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50166 (= res!342240 (validMask!0 mask!3119))))

(assert (=> start!50166 e!317217))

(assert (=> start!50166 true))

(declare-datatypes ((array!34611 0))(
  ( (array!34612 (arr!16621 (Array (_ BitVec 32) (_ BitVec 64))) (size!16985 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34611)

(declare-fun array_inv!12480 (array!34611) Bool)

(assert (=> start!50166 (array_inv!12480 a!3118)))

(declare-fun b!549111 () Bool)

(declare-fun res!342242 () Bool)

(declare-fun e!317216 () Bool)

(assert (=> b!549111 (=> (not res!342242) (not e!317216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34611 (_ BitVec 32)) Bool)

(assert (=> b!549111 (= res!342242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549112 () Bool)

(assert (=> b!549112 (= e!317217 e!317216)))

(declare-fun res!342244 () Bool)

(assert (=> b!549112 (=> (not res!342244) (not e!317216))))

(declare-datatypes ((SeekEntryResult!5026 0))(
  ( (MissingZero!5026 (index!22331 (_ BitVec 32))) (Found!5026 (index!22332 (_ BitVec 32))) (Intermediate!5026 (undefined!5838 Bool) (index!22333 (_ BitVec 32)) (x!51420 (_ BitVec 32))) (Undefined!5026) (MissingVacant!5026 (index!22334 (_ BitVec 32))) )
))
(declare-fun lt!250069 () SeekEntryResult!5026)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549112 (= res!342244 (or (= lt!250069 (MissingZero!5026 i!1132)) (= lt!250069 (MissingVacant!5026 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34611 (_ BitVec 32)) SeekEntryResult!5026)

(assert (=> b!549112 (= lt!250069 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549113 () Bool)

(declare-fun res!342239 () Bool)

(assert (=> b!549113 (=> (not res!342239) (not e!317217))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549113 (= res!342239 (validKeyInArray!0 (select (arr!16621 a!3118) j!142)))))

(declare-fun b!549114 () Bool)

(declare-fun res!342241 () Bool)

(assert (=> b!549114 (=> (not res!342241) (not e!317217))))

(assert (=> b!549114 (= res!342241 (and (= (size!16985 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16985 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16985 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549115 () Bool)

(declare-fun res!342238 () Bool)

(assert (=> b!549115 (=> (not res!342238) (not e!317217))))

(declare-fun arrayContainsKey!0 (array!34611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549115 (= res!342238 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549116 () Bool)

(declare-fun res!342243 () Bool)

(assert (=> b!549116 (=> (not res!342243) (not e!317216))))

(declare-datatypes ((List!10608 0))(
  ( (Nil!10605) (Cons!10604 (h!11577 (_ BitVec 64)) (t!16828 List!10608)) )
))
(declare-fun arrayNoDuplicates!0 (array!34611 (_ BitVec 32) List!10608) Bool)

(assert (=> b!549116 (= res!342243 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10605))))

(declare-fun b!549117 () Bool)

(assert (=> b!549117 (= e!317216 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!250068 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549117 (= lt!250068 (toIndex!0 (select (store (arr!16621 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549118 () Bool)

(declare-fun res!342237 () Bool)

(assert (=> b!549118 (=> (not res!342237) (not e!317217))))

(assert (=> b!549118 (= res!342237 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50166 res!342240) b!549114))

(assert (= (and b!549114 res!342241) b!549113))

(assert (= (and b!549113 res!342239) b!549118))

(assert (= (and b!549118 res!342237) b!549115))

(assert (= (and b!549115 res!342238) b!549112))

(assert (= (and b!549112 res!342244) b!549111))

(assert (= (and b!549111 res!342242) b!549116))

(assert (= (and b!549116 res!342243) b!549117))

(declare-fun m!526157 () Bool)

(assert (=> b!549116 m!526157))

(declare-fun m!526159 () Bool)

(assert (=> b!549111 m!526159))

(declare-fun m!526161 () Bool)

(assert (=> b!549115 m!526161))

(declare-fun m!526163 () Bool)

(assert (=> b!549117 m!526163))

(declare-fun m!526165 () Bool)

(assert (=> b!549117 m!526165))

(assert (=> b!549117 m!526165))

(declare-fun m!526167 () Bool)

(assert (=> b!549117 m!526167))

(declare-fun m!526169 () Bool)

(assert (=> b!549112 m!526169))

(declare-fun m!526171 () Bool)

(assert (=> b!549118 m!526171))

(declare-fun m!526173 () Bool)

(assert (=> start!50166 m!526173))

(declare-fun m!526175 () Bool)

(assert (=> start!50166 m!526175))

(declare-fun m!526177 () Bool)

(assert (=> b!549113 m!526177))

(assert (=> b!549113 m!526177))

(declare-fun m!526179 () Bool)

(assert (=> b!549113 m!526179))

(check-sat (not b!549117) (not b!549113) (not start!50166) (not b!549118) (not b!549115) (not b!549112) (not b!549116) (not b!549111))
(check-sat)
