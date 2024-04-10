; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50130 () Bool)

(assert start!50130)

(declare-fun b!549031 () Bool)

(declare-fun res!342269 () Bool)

(declare-fun e!317131 () Bool)

(assert (=> b!549031 (=> (not res!342269) (not e!317131))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549031 (= res!342269 (validKeyInArray!0 k!1914))))

(declare-fun b!549032 () Bool)

(declare-fun e!317133 () Bool)

(assert (=> b!549032 (= e!317133 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34628 0))(
  ( (array!34629 (arr!16631 (Array (_ BitVec 32) (_ BitVec 64))) (size!16995 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34628)

(declare-fun lt!249988 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549032 (= lt!249988 (toIndex!0 (select (store (arr!16631 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!549033 () Bool)

(declare-fun res!342263 () Bool)

(assert (=> b!549033 (=> (not res!342263) (not e!317133))))

(declare-datatypes ((List!10711 0))(
  ( (Nil!10708) (Cons!10707 (h!11677 (_ BitVec 64)) (t!16939 List!10711)) )
))
(declare-fun arrayNoDuplicates!0 (array!34628 (_ BitVec 32) List!10711) Bool)

(assert (=> b!549033 (= res!342263 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10708))))

(declare-fun b!549034 () Bool)

(declare-fun res!342266 () Bool)

(assert (=> b!549034 (=> (not res!342266) (not e!317131))))

(assert (=> b!549034 (= res!342266 (and (= (size!16995 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16995 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16995 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549035 () Bool)

(assert (=> b!549035 (= e!317131 e!317133)))

(declare-fun res!342267 () Bool)

(assert (=> b!549035 (=> (not res!342267) (not e!317133))))

(declare-datatypes ((SeekEntryResult!5080 0))(
  ( (MissingZero!5080 (index!22547 (_ BitVec 32))) (Found!5080 (index!22548 (_ BitVec 32))) (Intermediate!5080 (undefined!5892 Bool) (index!22549 (_ BitVec 32)) (x!51479 (_ BitVec 32))) (Undefined!5080) (MissingVacant!5080 (index!22550 (_ BitVec 32))) )
))
(declare-fun lt!249987 () SeekEntryResult!5080)

(assert (=> b!549035 (= res!342267 (or (= lt!249987 (MissingZero!5080 i!1132)) (= lt!249987 (MissingVacant!5080 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34628 (_ BitVec 32)) SeekEntryResult!5080)

(assert (=> b!549035 (= lt!249987 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549036 () Bool)

(declare-fun res!342264 () Bool)

(assert (=> b!549036 (=> (not res!342264) (not e!317133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34628 (_ BitVec 32)) Bool)

(assert (=> b!549036 (= res!342264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!342262 () Bool)

(assert (=> start!50130 (=> (not res!342262) (not e!317131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50130 (= res!342262 (validMask!0 mask!3119))))

(assert (=> start!50130 e!317131))

(assert (=> start!50130 true))

(declare-fun array_inv!12427 (array!34628) Bool)

(assert (=> start!50130 (array_inv!12427 a!3118)))

(declare-fun b!549037 () Bool)

(declare-fun res!342265 () Bool)

(assert (=> b!549037 (=> (not res!342265) (not e!317131))))

(assert (=> b!549037 (= res!342265 (validKeyInArray!0 (select (arr!16631 a!3118) j!142)))))

(declare-fun b!549038 () Bool)

(declare-fun res!342268 () Bool)

(assert (=> b!549038 (=> (not res!342268) (not e!317131))))

(declare-fun arrayContainsKey!0 (array!34628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549038 (= res!342268 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50130 res!342262) b!549034))

(assert (= (and b!549034 res!342266) b!549037))

(assert (= (and b!549037 res!342265) b!549031))

(assert (= (and b!549031 res!342269) b!549038))

(assert (= (and b!549038 res!342268) b!549035))

(assert (= (and b!549035 res!342267) b!549036))

(assert (= (and b!549036 res!342264) b!549033))

(assert (= (and b!549033 res!342263) b!549032))

(declare-fun m!525939 () Bool)

(assert (=> b!549035 m!525939))

(declare-fun m!525941 () Bool)

(assert (=> b!549038 m!525941))

(declare-fun m!525943 () Bool)

(assert (=> b!549037 m!525943))

(assert (=> b!549037 m!525943))

(declare-fun m!525945 () Bool)

(assert (=> b!549037 m!525945))

(declare-fun m!525947 () Bool)

(assert (=> b!549032 m!525947))

(declare-fun m!525949 () Bool)

(assert (=> b!549032 m!525949))

(assert (=> b!549032 m!525949))

(declare-fun m!525951 () Bool)

(assert (=> b!549032 m!525951))

(declare-fun m!525953 () Bool)

(assert (=> start!50130 m!525953))

(declare-fun m!525955 () Bool)

(assert (=> start!50130 m!525955))

(declare-fun m!525957 () Bool)

(assert (=> b!549036 m!525957))

(declare-fun m!525959 () Bool)

(assert (=> b!549033 m!525959))

(declare-fun m!525961 () Bool)

(assert (=> b!549031 m!525961))

(push 1)

(assert (not b!549038))

(assert (not b!549035))

