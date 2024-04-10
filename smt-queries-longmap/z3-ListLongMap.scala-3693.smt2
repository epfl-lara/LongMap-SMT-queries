; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50776 () Bool)

(assert start!50776)

(declare-fun b!555468 () Bool)

(declare-fun e!320149 () Bool)

(assert (=> b!555468 (= e!320149 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5259 0))(
  ( (MissingZero!5259 (index!23263 (_ BitVec 32))) (Found!5259 (index!23264 (_ BitVec 32))) (Intermediate!5259 (undefined!6071 Bool) (index!23265 (_ BitVec 32)) (x!52165 (_ BitVec 32))) (Undefined!5259) (MissingVacant!5259 (index!23266 (_ BitVec 32))) )
))
(declare-fun lt!252436 () SeekEntryResult!5259)

(declare-fun lt!252438 () SeekEntryResult!5259)

(declare-datatypes ((array!35001 0))(
  ( (array!35002 (arr!16810 (Array (_ BitVec 32) (_ BitVec 64))) (size!17174 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35001)

(get-info :version)

(assert (=> b!555468 (and (= lt!252438 (Found!5259 j!142)) (or (undefined!6071 lt!252436) (not ((_ is Intermediate!5259) lt!252436)) (= (select (arr!16810 a!3118) (index!23265 lt!252436)) (select (arr!16810 a!3118) j!142)) (not (= (select (arr!16810 a!3118) (index!23265 lt!252436)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252438 (MissingZero!5259 (index!23265 lt!252436)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35001 (_ BitVec 32)) SeekEntryResult!5259)

(assert (=> b!555468 (= lt!252438 (seekEntryOrOpen!0 (select (arr!16810 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35001 (_ BitVec 32)) Bool)

(assert (=> b!555468 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17292 0))(
  ( (Unit!17293) )
))
(declare-fun lt!252434 () Unit!17292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17292)

(assert (=> b!555468 (= lt!252434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555469 () Bool)

(declare-fun e!320150 () Bool)

(declare-fun e!320151 () Bool)

(assert (=> b!555469 (= e!320150 e!320151)))

(declare-fun res!347880 () Bool)

(assert (=> b!555469 (=> (not res!347880) (not e!320151))))

(declare-fun lt!252439 () SeekEntryResult!5259)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555469 (= res!347880 (or (= lt!252439 (MissingZero!5259 i!1132)) (= lt!252439 (MissingVacant!5259 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!555469 (= lt!252439 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555470 () Bool)

(declare-fun res!347881 () Bool)

(assert (=> b!555470 (=> (not res!347881) (not e!320151))))

(assert (=> b!555470 (= res!347881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555471 () Bool)

(declare-fun res!347882 () Bool)

(assert (=> b!555471 (=> (not res!347882) (not e!320150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555471 (= res!347882 (validKeyInArray!0 k0!1914))))

(declare-fun b!555472 () Bool)

(declare-fun res!347883 () Bool)

(assert (=> b!555472 (=> (not res!347883) (not e!320150))))

(declare-fun arrayContainsKey!0 (array!35001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555472 (= res!347883 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555473 () Bool)

(declare-fun res!347887 () Bool)

(assert (=> b!555473 (=> (not res!347887) (not e!320151))))

(declare-datatypes ((List!10890 0))(
  ( (Nil!10887) (Cons!10886 (h!11871 (_ BitVec 64)) (t!17118 List!10890)) )
))
(declare-fun arrayNoDuplicates!0 (array!35001 (_ BitVec 32) List!10890) Bool)

(assert (=> b!555473 (= res!347887 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10887))))

(declare-fun b!555474 () Bool)

(declare-fun res!347888 () Bool)

(assert (=> b!555474 (=> (not res!347888) (not e!320150))))

(assert (=> b!555474 (= res!347888 (validKeyInArray!0 (select (arr!16810 a!3118) j!142)))))

(declare-fun b!555475 () Bool)

(declare-fun res!347886 () Bool)

(assert (=> b!555475 (=> (not res!347886) (not e!320150))))

(assert (=> b!555475 (= res!347886 (and (= (size!17174 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17174 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17174 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347885 () Bool)

(assert (=> start!50776 (=> (not res!347885) (not e!320150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50776 (= res!347885 (validMask!0 mask!3119))))

(assert (=> start!50776 e!320150))

(assert (=> start!50776 true))

(declare-fun array_inv!12606 (array!35001) Bool)

(assert (=> start!50776 (array_inv!12606 a!3118)))

(declare-fun b!555476 () Bool)

(assert (=> b!555476 (= e!320151 e!320149)))

(declare-fun res!347884 () Bool)

(assert (=> b!555476 (=> (not res!347884) (not e!320149))))

(declare-fun lt!252437 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35001 (_ BitVec 32)) SeekEntryResult!5259)

(assert (=> b!555476 (= res!347884 (= lt!252436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252437 (select (store (arr!16810 a!3118) i!1132 k0!1914) j!142) (array!35002 (store (arr!16810 a!3118) i!1132 k0!1914) (size!17174 a!3118)) mask!3119)))))

(declare-fun lt!252435 () (_ BitVec 32))

(assert (=> b!555476 (= lt!252436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252435 (select (arr!16810 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555476 (= lt!252437 (toIndex!0 (select (store (arr!16810 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555476 (= lt!252435 (toIndex!0 (select (arr!16810 a!3118) j!142) mask!3119))))

(assert (= (and start!50776 res!347885) b!555475))

(assert (= (and b!555475 res!347886) b!555474))

(assert (= (and b!555474 res!347888) b!555471))

(assert (= (and b!555471 res!347882) b!555472))

(assert (= (and b!555472 res!347883) b!555469))

(assert (= (and b!555469 res!347880) b!555470))

(assert (= (and b!555470 res!347881) b!555473))

(assert (= (and b!555473 res!347887) b!555476))

(assert (= (and b!555476 res!347884) b!555468))

(declare-fun m!533165 () Bool)

(assert (=> b!555476 m!533165))

(declare-fun m!533167 () Bool)

(assert (=> b!555476 m!533167))

(assert (=> b!555476 m!533165))

(declare-fun m!533169 () Bool)

(assert (=> b!555476 m!533169))

(declare-fun m!533171 () Bool)

(assert (=> b!555476 m!533171))

(declare-fun m!533173 () Bool)

(assert (=> b!555476 m!533173))

(assert (=> b!555476 m!533171))

(declare-fun m!533175 () Bool)

(assert (=> b!555476 m!533175))

(assert (=> b!555476 m!533165))

(declare-fun m!533177 () Bool)

(assert (=> b!555476 m!533177))

(assert (=> b!555476 m!533171))

(declare-fun m!533179 () Bool)

(assert (=> b!555469 m!533179))

(declare-fun m!533181 () Bool)

(assert (=> b!555472 m!533181))

(declare-fun m!533183 () Bool)

(assert (=> b!555471 m!533183))

(declare-fun m!533185 () Bool)

(assert (=> start!50776 m!533185))

(declare-fun m!533187 () Bool)

(assert (=> start!50776 m!533187))

(declare-fun m!533189 () Bool)

(assert (=> b!555473 m!533189))

(declare-fun m!533191 () Bool)

(assert (=> b!555470 m!533191))

(assert (=> b!555474 m!533165))

(assert (=> b!555474 m!533165))

(declare-fun m!533193 () Bool)

(assert (=> b!555474 m!533193))

(assert (=> b!555468 m!533165))

(declare-fun m!533195 () Bool)

(assert (=> b!555468 m!533195))

(declare-fun m!533197 () Bool)

(assert (=> b!555468 m!533197))

(declare-fun m!533199 () Bool)

(assert (=> b!555468 m!533199))

(assert (=> b!555468 m!533165))

(declare-fun m!533201 () Bool)

(assert (=> b!555468 m!533201))

(check-sat (not b!555470) (not b!555472) (not b!555473) (not b!555468) (not start!50776) (not b!555471) (not b!555474) (not b!555476) (not b!555469))
(check-sat)
