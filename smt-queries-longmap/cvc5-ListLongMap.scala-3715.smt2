; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51086 () Bool)

(assert start!51086)

(declare-fun b!558289 () Bool)

(declare-fun res!350156 () Bool)

(declare-fun e!321621 () Bool)

(assert (=> b!558289 (=> (not res!350156) (not e!321621))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35140 0))(
  ( (array!35141 (arr!16875 (Array (_ BitVec 32) (_ BitVec 64))) (size!17239 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35140)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558289 (= res!350156 (and (= (size!17239 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17239 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17239 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558290 () Bool)

(declare-fun e!321620 () Bool)

(assert (=> b!558290 (= e!321620 (not true))))

(declare-fun e!321618 () Bool)

(assert (=> b!558290 e!321618))

(declare-fun res!350160 () Bool)

(assert (=> b!558290 (=> (not res!350160) (not e!321618))))

(declare-datatypes ((SeekEntryResult!5324 0))(
  ( (MissingZero!5324 (index!23523 (_ BitVec 32))) (Found!5324 (index!23524 (_ BitVec 32))) (Intermediate!5324 (undefined!6136 Bool) (index!23525 (_ BitVec 32)) (x!52424 (_ BitVec 32))) (Undefined!5324) (MissingVacant!5324 (index!23526 (_ BitVec 32))) )
))
(declare-fun lt!253696 () SeekEntryResult!5324)

(assert (=> b!558290 (= res!350160 (= lt!253696 (Found!5324 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35140 (_ BitVec 32)) SeekEntryResult!5324)

(assert (=> b!558290 (= lt!253696 (seekEntryOrOpen!0 (select (arr!16875 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35140 (_ BitVec 32)) Bool)

(assert (=> b!558290 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17422 0))(
  ( (Unit!17423) )
))
(declare-fun lt!253698 () Unit!17422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17422)

(assert (=> b!558290 (= lt!253698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558291 () Bool)

(declare-fun e!321616 () Bool)

(assert (=> b!558291 (= e!321616 e!321620)))

(declare-fun res!350159 () Bool)

(assert (=> b!558291 (=> (not res!350159) (not e!321620))))

(declare-fun lt!253699 () SeekEntryResult!5324)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!253697 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35140 (_ BitVec 32)) SeekEntryResult!5324)

(assert (=> b!558291 (= res!350159 (= lt!253699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253697 (select (store (arr!16875 a!3118) i!1132 k!1914) j!142) (array!35141 (store (arr!16875 a!3118) i!1132 k!1914) (size!17239 a!3118)) mask!3119)))))

(declare-fun lt!253695 () (_ BitVec 32))

(assert (=> b!558291 (= lt!253699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253695 (select (arr!16875 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558291 (= lt!253697 (toIndex!0 (select (store (arr!16875 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558291 (= lt!253695 (toIndex!0 (select (arr!16875 a!3118) j!142) mask!3119))))

(declare-fun b!558292 () Bool)

(declare-fun res!350155 () Bool)

(assert (=> b!558292 (=> (not res!350155) (not e!321621))))

(declare-fun arrayContainsKey!0 (array!35140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558292 (= res!350155 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558293 () Bool)

(declare-fun res!350158 () Bool)

(assert (=> b!558293 (=> (not res!350158) (not e!321621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558293 (= res!350158 (validKeyInArray!0 k!1914))))

(declare-fun b!558294 () Bool)

(declare-fun e!321617 () Bool)

(assert (=> b!558294 (= e!321618 e!321617)))

(declare-fun res!350154 () Bool)

(assert (=> b!558294 (=> res!350154 e!321617)))

(assert (=> b!558294 (= res!350154 (or (undefined!6136 lt!253699) (not (is-Intermediate!5324 lt!253699)) (= (select (arr!16875 a!3118) (index!23525 lt!253699)) (select (arr!16875 a!3118) j!142)) (= (select (arr!16875 a!3118) (index!23525 lt!253699)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558295 () Bool)

(declare-fun res!350152 () Bool)

(assert (=> b!558295 (=> (not res!350152) (not e!321616))))

(assert (=> b!558295 (= res!350152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558296 () Bool)

(declare-fun res!350162 () Bool)

(assert (=> b!558296 (=> (not res!350162) (not e!321616))))

(declare-datatypes ((List!10955 0))(
  ( (Nil!10952) (Cons!10951 (h!11945 (_ BitVec 64)) (t!17183 List!10955)) )
))
(declare-fun arrayNoDuplicates!0 (array!35140 (_ BitVec 32) List!10955) Bool)

(assert (=> b!558296 (= res!350162 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10952))))

(declare-fun b!558297 () Bool)

(declare-fun res!350157 () Bool)

(assert (=> b!558297 (=> (not res!350157) (not e!321621))))

(assert (=> b!558297 (= res!350157 (validKeyInArray!0 (select (arr!16875 a!3118) j!142)))))

(declare-fun res!350153 () Bool)

(assert (=> start!51086 (=> (not res!350153) (not e!321621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51086 (= res!350153 (validMask!0 mask!3119))))

(assert (=> start!51086 e!321621))

(assert (=> start!51086 true))

(declare-fun array_inv!12671 (array!35140) Bool)

(assert (=> start!51086 (array_inv!12671 a!3118)))

(declare-fun b!558298 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35140 (_ BitVec 32)) SeekEntryResult!5324)

(assert (=> b!558298 (= e!321617 (= lt!253696 (seekKeyOrZeroReturnVacant!0 (x!52424 lt!253699) (index!23525 lt!253699) (index!23525 lt!253699) (select (arr!16875 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558299 () Bool)

(assert (=> b!558299 (= e!321621 e!321616)))

(declare-fun res!350161 () Bool)

(assert (=> b!558299 (=> (not res!350161) (not e!321616))))

(declare-fun lt!253694 () SeekEntryResult!5324)

(assert (=> b!558299 (= res!350161 (or (= lt!253694 (MissingZero!5324 i!1132)) (= lt!253694 (MissingVacant!5324 i!1132))))))

(assert (=> b!558299 (= lt!253694 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!51086 res!350153) b!558289))

(assert (= (and b!558289 res!350156) b!558297))

(assert (= (and b!558297 res!350157) b!558293))

(assert (= (and b!558293 res!350158) b!558292))

(assert (= (and b!558292 res!350155) b!558299))

(assert (= (and b!558299 res!350161) b!558295))

(assert (= (and b!558295 res!350152) b!558296))

(assert (= (and b!558296 res!350162) b!558291))

(assert (= (and b!558291 res!350159) b!558290))

(assert (= (and b!558290 res!350160) b!558294))

(assert (= (and b!558294 (not res!350154)) b!558298))

(declare-fun m!536235 () Bool)

(assert (=> b!558299 m!536235))

(declare-fun m!536237 () Bool)

(assert (=> b!558290 m!536237))

(assert (=> b!558290 m!536237))

(declare-fun m!536239 () Bool)

(assert (=> b!558290 m!536239))

(declare-fun m!536241 () Bool)

(assert (=> b!558290 m!536241))

(declare-fun m!536243 () Bool)

(assert (=> b!558290 m!536243))

(declare-fun m!536245 () Bool)

(assert (=> b!558293 m!536245))

(assert (=> b!558297 m!536237))

(assert (=> b!558297 m!536237))

(declare-fun m!536247 () Bool)

(assert (=> b!558297 m!536247))

(assert (=> b!558298 m!536237))

(assert (=> b!558298 m!536237))

(declare-fun m!536249 () Bool)

(assert (=> b!558298 m!536249))

(declare-fun m!536251 () Bool)

(assert (=> b!558295 m!536251))

(declare-fun m!536253 () Bool)

(assert (=> b!558296 m!536253))

(declare-fun m!536255 () Bool)

(assert (=> start!51086 m!536255))

(declare-fun m!536257 () Bool)

(assert (=> start!51086 m!536257))

(declare-fun m!536259 () Bool)

(assert (=> b!558294 m!536259))

(assert (=> b!558294 m!536237))

(assert (=> b!558291 m!536237))

(declare-fun m!536261 () Bool)

(assert (=> b!558291 m!536261))

(assert (=> b!558291 m!536237))

(declare-fun m!536263 () Bool)

(assert (=> b!558291 m!536263))

(assert (=> b!558291 m!536263))

(declare-fun m!536265 () Bool)

(assert (=> b!558291 m!536265))

(declare-fun m!536267 () Bool)

(assert (=> b!558291 m!536267))

(assert (=> b!558291 m!536237))

(declare-fun m!536269 () Bool)

(assert (=> b!558291 m!536269))

(assert (=> b!558291 m!536263))

(declare-fun m!536271 () Bool)

(assert (=> b!558291 m!536271))

(declare-fun m!536273 () Bool)

(assert (=> b!558292 m!536273))

(push 1)

