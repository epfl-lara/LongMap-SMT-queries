; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50760 () Bool)

(assert start!50760)

(declare-fun b!555253 () Bool)

(declare-fun e!320052 () Bool)

(declare-fun e!320054 () Bool)

(assert (=> b!555253 (= e!320052 e!320054)))

(declare-fun res!347665 () Bool)

(assert (=> b!555253 (=> (not res!347665) (not e!320054))))

(declare-datatypes ((SeekEntryResult!5251 0))(
  ( (MissingZero!5251 (index!23231 (_ BitVec 32))) (Found!5251 (index!23232 (_ BitVec 32))) (Intermediate!5251 (undefined!6063 Bool) (index!23233 (_ BitVec 32)) (x!52133 (_ BitVec 32))) (Undefined!5251) (MissingVacant!5251 (index!23234 (_ BitVec 32))) )
))
(declare-fun lt!252290 () SeekEntryResult!5251)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555253 (= res!347665 (or (= lt!252290 (MissingZero!5251 i!1132)) (= lt!252290 (MissingVacant!5251 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34985 0))(
  ( (array!34986 (arr!16802 (Array (_ BitVec 32) (_ BitVec 64))) (size!17166 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34985)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34985 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!555253 (= lt!252290 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555254 () Bool)

(declare-fun res!347667 () Bool)

(assert (=> b!555254 (=> (not res!347667) (not e!320054))))

(declare-datatypes ((List!10882 0))(
  ( (Nil!10879) (Cons!10878 (h!11863 (_ BitVec 64)) (t!17110 List!10882)) )
))
(declare-fun arrayNoDuplicates!0 (array!34985 (_ BitVec 32) List!10882) Bool)

(assert (=> b!555254 (= res!347667 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10879))))

(declare-fun b!555255 () Bool)

(declare-fun res!347668 () Bool)

(assert (=> b!555255 (=> (not res!347668) (not e!320052))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555255 (= res!347668 (validKeyInArray!0 (select (arr!16802 a!3118) j!142)))))

(declare-fun b!555256 () Bool)

(declare-fun res!347664 () Bool)

(assert (=> b!555256 (=> (not res!347664) (not e!320052))))

(declare-fun arrayContainsKey!0 (array!34985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555256 (= res!347664 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555257 () Bool)

(declare-fun res!347670 () Bool)

(assert (=> b!555257 (=> (not res!347670) (not e!320052))))

(assert (=> b!555257 (= res!347670 (and (= (size!17166 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17166 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17166 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555258 () Bool)

(declare-fun res!347666 () Bool)

(assert (=> b!555258 (=> (not res!347666) (not e!320054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34985 (_ BitVec 32)) Bool)

(assert (=> b!555258 (= res!347666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555252 () Bool)

(declare-fun res!347671 () Bool)

(assert (=> b!555252 (=> (not res!347671) (not e!320052))))

(assert (=> b!555252 (= res!347671 (validKeyInArray!0 k!1914))))

(declare-fun res!347669 () Bool)

(assert (=> start!50760 (=> (not res!347669) (not e!320052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50760 (= res!347669 (validMask!0 mask!3119))))

(assert (=> start!50760 e!320052))

(assert (=> start!50760 true))

(declare-fun array_inv!12598 (array!34985) Bool)

(assert (=> start!50760 (array_inv!12598 a!3118)))

(declare-fun b!555259 () Bool)

(declare-fun e!320055 () Bool)

(assert (=> b!555259 (= e!320054 e!320055)))

(declare-fun res!347672 () Bool)

(assert (=> b!555259 (=> (not res!347672) (not e!320055))))

(declare-fun lt!252295 () (_ BitVec 32))

(declare-fun lt!252291 () SeekEntryResult!5251)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34985 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!555259 (= res!347672 (= lt!252291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252295 (select (store (arr!16802 a!3118) i!1132 k!1914) j!142) (array!34986 (store (arr!16802 a!3118) i!1132 k!1914) (size!17166 a!3118)) mask!3119)))))

(declare-fun lt!252293 () (_ BitVec 32))

(assert (=> b!555259 (= lt!252291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252293 (select (arr!16802 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555259 (= lt!252295 (toIndex!0 (select (store (arr!16802 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555259 (= lt!252293 (toIndex!0 (select (arr!16802 a!3118) j!142) mask!3119))))

(declare-fun b!555260 () Bool)

(assert (=> b!555260 (= e!320055 (not true))))

(declare-fun lt!252292 () SeekEntryResult!5251)

(assert (=> b!555260 (and (= lt!252292 (Found!5251 j!142)) (or (undefined!6063 lt!252291) (not (is-Intermediate!5251 lt!252291)) (= (select (arr!16802 a!3118) (index!23233 lt!252291)) (select (arr!16802 a!3118) j!142)) (not (= (select (arr!16802 a!3118) (index!23233 lt!252291)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252292 (MissingZero!5251 (index!23233 lt!252291)))))))

(assert (=> b!555260 (= lt!252292 (seekEntryOrOpen!0 (select (arr!16802 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555260 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17276 0))(
  ( (Unit!17277) )
))
(declare-fun lt!252294 () Unit!17276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17276)

(assert (=> b!555260 (= lt!252294 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50760 res!347669) b!555257))

(assert (= (and b!555257 res!347670) b!555255))

(assert (= (and b!555255 res!347668) b!555252))

(assert (= (and b!555252 res!347671) b!555256))

(assert (= (and b!555256 res!347664) b!555253))

(assert (= (and b!555253 res!347665) b!555258))

(assert (= (and b!555258 res!347666) b!555254))

(assert (= (and b!555254 res!347667) b!555259))

(assert (= (and b!555259 res!347672) b!555260))

(declare-fun m!532861 () Bool)

(assert (=> start!50760 m!532861))

(declare-fun m!532863 () Bool)

(assert (=> start!50760 m!532863))

(declare-fun m!532865 () Bool)

(assert (=> b!555254 m!532865))

(declare-fun m!532867 () Bool)

(assert (=> b!555258 m!532867))

(declare-fun m!532869 () Bool)

(assert (=> b!555255 m!532869))

(assert (=> b!555255 m!532869))

(declare-fun m!532871 () Bool)

(assert (=> b!555255 m!532871))

(assert (=> b!555259 m!532869))

(declare-fun m!532873 () Bool)

(assert (=> b!555259 m!532873))

(assert (=> b!555259 m!532869))

(declare-fun m!532875 () Bool)

(assert (=> b!555259 m!532875))

(declare-fun m!532877 () Bool)

(assert (=> b!555259 m!532877))

(assert (=> b!555259 m!532875))

(declare-fun m!532879 () Bool)

(assert (=> b!555259 m!532879))

(assert (=> b!555259 m!532869))

(declare-fun m!532881 () Bool)

(assert (=> b!555259 m!532881))

(assert (=> b!555259 m!532875))

(declare-fun m!532883 () Bool)

(assert (=> b!555259 m!532883))

(declare-fun m!532885 () Bool)

(assert (=> b!555260 m!532885))

(assert (=> b!555260 m!532869))

(declare-fun m!532887 () Bool)

(assert (=> b!555260 m!532887))

(declare-fun m!532889 () Bool)

(assert (=> b!555260 m!532889))

(assert (=> b!555260 m!532869))

(declare-fun m!532891 () Bool)

(assert (=> b!555260 m!532891))

(declare-fun m!532893 () Bool)

(assert (=> b!555252 m!532893))

(declare-fun m!532895 () Bool)

(assert (=> b!555253 m!532895))

(declare-fun m!532897 () Bool)

(assert (=> b!555256 m!532897))

(push 1)

