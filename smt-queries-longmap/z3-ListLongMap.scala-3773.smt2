; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51680 () Bool)

(assert start!51680)

(declare-fun b!565102 () Bool)

(declare-fun res!356216 () Bool)

(declare-fun e!325359 () Bool)

(assert (=> b!565102 (=> (not res!356216) (not e!325359))))

(declare-datatypes ((array!35497 0))(
  ( (array!35498 (arr!17048 (Array (_ BitVec 32) (_ BitVec 64))) (size!17413 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35497)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565102 (= res!356216 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!325361 () Bool)

(declare-fun b!565103 () Bool)

(declare-datatypes ((SeekEntryResult!5494 0))(
  ( (MissingZero!5494 (index!24203 (_ BitVec 32))) (Found!5494 (index!24204 (_ BitVec 32))) (Intermediate!5494 (undefined!6306 Bool) (index!24205 (_ BitVec 32)) (x!53086 (_ BitVec 32))) (Undefined!5494) (MissingVacant!5494 (index!24206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35497 (_ BitVec 32)) SeekEntryResult!5494)

(assert (=> b!565103 (= e!325361 (= (seekEntryOrOpen!0 (select (arr!17048 a!3118) j!142) a!3118 mask!3119) (Found!5494 j!142)))))

(declare-fun b!565104 () Bool)

(declare-fun res!356219 () Bool)

(declare-fun e!325362 () Bool)

(assert (=> b!565104 (=> (not res!356219) (not e!325362))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35497 (_ BitVec 32)) SeekEntryResult!5494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565104 (= res!356219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17048 a!3118) j!142) mask!3119) (select (arr!17048 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17048 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17048 a!3118) i!1132 k0!1914) j!142) (array!35498 (store (arr!17048 a!3118) i!1132 k0!1914) (size!17413 a!3118)) mask!3119)))))

(declare-fun b!565105 () Bool)

(declare-fun res!356222 () Bool)

(assert (=> b!565105 (=> (not res!356222) (not e!325362))))

(declare-datatypes ((List!11167 0))(
  ( (Nil!11164) (Cons!11163 (h!12169 (_ BitVec 64)) (t!17386 List!11167)) )
))
(declare-fun arrayNoDuplicates!0 (array!35497 (_ BitVec 32) List!11167) Bool)

(assert (=> b!565105 (= res!356222 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11164))))

(declare-fun b!565106 () Bool)

(declare-fun res!356218 () Bool)

(assert (=> b!565106 (=> (not res!356218) (not e!325362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35497 (_ BitVec 32)) Bool)

(assert (=> b!565106 (= res!356218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565107 () Bool)

(declare-fun res!356214 () Bool)

(assert (=> b!565107 (=> (not res!356214) (not e!325359))))

(assert (=> b!565107 (= res!356214 (and (= (size!17413 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17413 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17413 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!356213 () Bool)

(assert (=> start!51680 (=> (not res!356213) (not e!325359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51680 (= res!356213 (validMask!0 mask!3119))))

(assert (=> start!51680 e!325359))

(assert (=> start!51680 true))

(declare-fun array_inv!12931 (array!35497) Bool)

(assert (=> start!51680 (array_inv!12931 a!3118)))

(declare-fun b!565108 () Bool)

(declare-fun res!356217 () Bool)

(assert (=> b!565108 (=> (not res!356217) (not e!325359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565108 (= res!356217 (validKeyInArray!0 (select (arr!17048 a!3118) j!142)))))

(declare-fun b!565109 () Bool)

(assert (=> b!565109 (= e!325362 (not true))))

(assert (=> b!565109 e!325361))

(declare-fun res!356221 () Bool)

(assert (=> b!565109 (=> (not res!356221) (not e!325361))))

(assert (=> b!565109 (= res!356221 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17676 0))(
  ( (Unit!17677) )
))
(declare-fun lt!257640 () Unit!17676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17676)

(assert (=> b!565109 (= lt!257640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565110 () Bool)

(assert (=> b!565110 (= e!325359 e!325362)))

(declare-fun res!356220 () Bool)

(assert (=> b!565110 (=> (not res!356220) (not e!325362))))

(declare-fun lt!257641 () SeekEntryResult!5494)

(assert (=> b!565110 (= res!356220 (or (= lt!257641 (MissingZero!5494 i!1132)) (= lt!257641 (MissingVacant!5494 i!1132))))))

(assert (=> b!565110 (= lt!257641 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565111 () Bool)

(declare-fun res!356215 () Bool)

(assert (=> b!565111 (=> (not res!356215) (not e!325359))))

(assert (=> b!565111 (= res!356215 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51680 res!356213) b!565107))

(assert (= (and b!565107 res!356214) b!565108))

(assert (= (and b!565108 res!356217) b!565111))

(assert (= (and b!565111 res!356215) b!565102))

(assert (= (and b!565102 res!356216) b!565110))

(assert (= (and b!565110 res!356220) b!565106))

(assert (= (and b!565106 res!356218) b!565105))

(assert (= (and b!565105 res!356222) b!565104))

(assert (= (and b!565104 res!356219) b!565109))

(assert (= (and b!565109 res!356221) b!565103))

(declare-fun m!543047 () Bool)

(assert (=> b!565111 m!543047))

(declare-fun m!543049 () Bool)

(assert (=> b!565102 m!543049))

(declare-fun m!543051 () Bool)

(assert (=> b!565104 m!543051))

(declare-fun m!543053 () Bool)

(assert (=> b!565104 m!543053))

(assert (=> b!565104 m!543051))

(declare-fun m!543055 () Bool)

(assert (=> b!565104 m!543055))

(declare-fun m!543057 () Bool)

(assert (=> b!565104 m!543057))

(assert (=> b!565104 m!543055))

(declare-fun m!543059 () Bool)

(assert (=> b!565104 m!543059))

(assert (=> b!565104 m!543053))

(assert (=> b!565104 m!543051))

(declare-fun m!543061 () Bool)

(assert (=> b!565104 m!543061))

(declare-fun m!543063 () Bool)

(assert (=> b!565104 m!543063))

(assert (=> b!565104 m!543055))

(assert (=> b!565104 m!543057))

(assert (=> b!565108 m!543051))

(assert (=> b!565108 m!543051))

(declare-fun m!543065 () Bool)

(assert (=> b!565108 m!543065))

(declare-fun m!543067 () Bool)

(assert (=> b!565109 m!543067))

(declare-fun m!543069 () Bool)

(assert (=> b!565109 m!543069))

(declare-fun m!543071 () Bool)

(assert (=> start!51680 m!543071))

(declare-fun m!543073 () Bool)

(assert (=> start!51680 m!543073))

(assert (=> b!565103 m!543051))

(assert (=> b!565103 m!543051))

(declare-fun m!543075 () Bool)

(assert (=> b!565103 m!543075))

(declare-fun m!543077 () Bool)

(assert (=> b!565106 m!543077))

(declare-fun m!543079 () Bool)

(assert (=> b!565105 m!543079))

(declare-fun m!543081 () Bool)

(assert (=> b!565110 m!543081))

(check-sat (not b!565105) (not b!565109) (not b!565104) (not b!565111) (not b!565103) (not b!565106) (not start!51680) (not b!565108) (not b!565102) (not b!565110))
(check-sat)
