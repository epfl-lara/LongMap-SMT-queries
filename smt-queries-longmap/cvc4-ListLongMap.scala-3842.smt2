; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52866 () Bool)

(assert start!52866)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!576242 () Bool)

(declare-fun e!331562 () Bool)

(declare-datatypes ((array!35954 0))(
  ( (array!35955 (arr!17258 (Array (_ BitVec 32) (_ BitVec 64))) (size!17622 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35954)

(declare-datatypes ((SeekEntryResult!5707 0))(
  ( (MissingZero!5707 (index!25055 (_ BitVec 32))) (Found!5707 (index!25056 (_ BitVec 32))) (Intermediate!5707 (undefined!6519 Bool) (index!25057 (_ BitVec 32)) (x!53946 (_ BitVec 32))) (Undefined!5707) (MissingVacant!5707 (index!25058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35954 (_ BitVec 32)) SeekEntryResult!5707)

(assert (=> b!576242 (= e!331562 (= (seekEntryOrOpen!0 (select (arr!17258 a!3118) j!142) a!3118 mask!3119) (Found!5707 j!142)))))

(declare-fun b!576243 () Bool)

(declare-fun res!364481 () Bool)

(declare-fun e!331563 () Bool)

(assert (=> b!576243 (=> (not res!364481) (not e!331563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576243 (= res!364481 (validKeyInArray!0 (select (arr!17258 a!3118) j!142)))))

(declare-fun b!576244 () Bool)

(declare-fun res!364483 () Bool)

(declare-fun e!331561 () Bool)

(assert (=> b!576244 (=> (not res!364483) (not e!331561))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35954 (_ BitVec 32)) SeekEntryResult!5707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576244 (= res!364483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17258 a!3118) j!142) mask!3119) (select (arr!17258 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17258 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17258 a!3118) i!1132 k!1914) j!142) (array!35955 (store (arr!17258 a!3118) i!1132 k!1914) (size!17622 a!3118)) mask!3119)))))

(declare-fun b!576246 () Bool)

(declare-fun res!364479 () Bool)

(assert (=> b!576246 (=> (not res!364479) (not e!331563))))

(declare-fun arrayContainsKey!0 (array!35954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576246 (= res!364479 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576247 () Bool)

(declare-fun res!364478 () Bool)

(assert (=> b!576247 (=> (not res!364478) (not e!331561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35954 (_ BitVec 32)) Bool)

(assert (=> b!576247 (= res!364478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576248 () Bool)

(declare-fun res!364477 () Bool)

(assert (=> b!576248 (=> (not res!364477) (not e!331563))))

(assert (=> b!576248 (= res!364477 (and (= (size!17622 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17622 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17622 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576249 () Bool)

(declare-fun res!364475 () Bool)

(assert (=> b!576249 (=> (not res!364475) (not e!331563))))

(assert (=> b!576249 (= res!364475 (validKeyInArray!0 k!1914))))

(declare-fun b!576250 () Bool)

(assert (=> b!576250 (= e!331561 (not true))))

(assert (=> b!576250 e!331562))

(declare-fun res!364476 () Bool)

(assert (=> b!576250 (=> (not res!364476) (not e!331562))))

(assert (=> b!576250 (= res!364476 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18116 0))(
  ( (Unit!18117) )
))
(declare-fun lt!263623 () Unit!18116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18116)

(assert (=> b!576250 (= lt!263623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576251 () Bool)

(assert (=> b!576251 (= e!331563 e!331561)))

(declare-fun res!364484 () Bool)

(assert (=> b!576251 (=> (not res!364484) (not e!331561))))

(declare-fun lt!263622 () SeekEntryResult!5707)

(assert (=> b!576251 (= res!364484 (or (= lt!263622 (MissingZero!5707 i!1132)) (= lt!263622 (MissingVacant!5707 i!1132))))))

(assert (=> b!576251 (= lt!263622 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!364480 () Bool)

(assert (=> start!52866 (=> (not res!364480) (not e!331563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52866 (= res!364480 (validMask!0 mask!3119))))

(assert (=> start!52866 e!331563))

(assert (=> start!52866 true))

(declare-fun array_inv!13054 (array!35954) Bool)

(assert (=> start!52866 (array_inv!13054 a!3118)))

(declare-fun b!576245 () Bool)

(declare-fun res!364482 () Bool)

(assert (=> b!576245 (=> (not res!364482) (not e!331561))))

(declare-datatypes ((List!11338 0))(
  ( (Nil!11335) (Cons!11334 (h!12376 (_ BitVec 64)) (t!17566 List!11338)) )
))
(declare-fun arrayNoDuplicates!0 (array!35954 (_ BitVec 32) List!11338) Bool)

(assert (=> b!576245 (= res!364482 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11335))))

(assert (= (and start!52866 res!364480) b!576248))

(assert (= (and b!576248 res!364477) b!576243))

(assert (= (and b!576243 res!364481) b!576249))

(assert (= (and b!576249 res!364475) b!576246))

(assert (= (and b!576246 res!364479) b!576251))

(assert (= (and b!576251 res!364484) b!576247))

(assert (= (and b!576247 res!364478) b!576245))

(assert (= (and b!576245 res!364482) b!576244))

(assert (= (and b!576244 res!364483) b!576250))

(assert (= (and b!576250 res!364476) b!576242))

(declare-fun m!555165 () Bool)

(assert (=> b!576243 m!555165))

(assert (=> b!576243 m!555165))

(declare-fun m!555167 () Bool)

(assert (=> b!576243 m!555167))

(assert (=> b!576242 m!555165))

(assert (=> b!576242 m!555165))

(declare-fun m!555169 () Bool)

(assert (=> b!576242 m!555169))

(assert (=> b!576244 m!555165))

(declare-fun m!555171 () Bool)

(assert (=> b!576244 m!555171))

(assert (=> b!576244 m!555165))

(declare-fun m!555173 () Bool)

(assert (=> b!576244 m!555173))

(declare-fun m!555175 () Bool)

(assert (=> b!576244 m!555175))

(assert (=> b!576244 m!555173))

(declare-fun m!555177 () Bool)

(assert (=> b!576244 m!555177))

(assert (=> b!576244 m!555171))

(assert (=> b!576244 m!555165))

(declare-fun m!555179 () Bool)

(assert (=> b!576244 m!555179))

(declare-fun m!555181 () Bool)

(assert (=> b!576244 m!555181))

(assert (=> b!576244 m!555173))

(assert (=> b!576244 m!555175))

(declare-fun m!555183 () Bool)

(assert (=> b!576251 m!555183))

(declare-fun m!555185 () Bool)

(assert (=> start!52866 m!555185))

(declare-fun m!555187 () Bool)

(assert (=> start!52866 m!555187))

(declare-fun m!555189 () Bool)

(assert (=> b!576246 m!555189))

(declare-fun m!555191 () Bool)

(assert (=> b!576247 m!555191))

(declare-fun m!555193 () Bool)

(assert (=> b!576245 m!555193))

(declare-fun m!555195 () Bool)

(assert (=> b!576249 m!555195))

(declare-fun m!555197 () Bool)

(assert (=> b!576250 m!555197))

(declare-fun m!555199 () Bool)

(assert (=> b!576250 m!555199))

(push 1)

