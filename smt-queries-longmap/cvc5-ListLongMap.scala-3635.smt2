; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50186 () Bool)

(assert start!50186)

(declare-fun b!549280 () Bool)

(declare-fun res!342426 () Bool)

(declare-fun e!317277 () Bool)

(assert (=> b!549280 (=> (not res!342426) (not e!317277))))

(declare-datatypes ((array!34639 0))(
  ( (array!34640 (arr!16635 (Array (_ BitVec 32) (_ BitVec 64))) (size!16999 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34639)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549280 (= res!342426 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549281 () Bool)

(declare-fun e!317276 () Bool)

(assert (=> b!549281 (= e!317276 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!250084 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549281 (= lt!250084 (toIndex!0 (select (store (arr!16635 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!549282 () Bool)

(declare-fun res!342431 () Bool)

(assert (=> b!549282 (=> (not res!342431) (not e!317277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549282 (= res!342431 (validKeyInArray!0 (select (arr!16635 a!3118) j!142)))))

(declare-fun b!549283 () Bool)

(declare-fun res!342429 () Bool)

(assert (=> b!549283 (=> (not res!342429) (not e!317277))))

(assert (=> b!549283 (= res!342429 (validKeyInArray!0 k!1914))))

(declare-fun b!549284 () Bool)

(declare-fun res!342425 () Bool)

(assert (=> b!549284 (=> (not res!342425) (not e!317277))))

(assert (=> b!549284 (= res!342425 (and (= (size!16999 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16999 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16999 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549285 () Bool)

(declare-fun res!342427 () Bool)

(assert (=> b!549285 (=> (not res!342427) (not e!317276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34639 (_ BitVec 32)) Bool)

(assert (=> b!549285 (= res!342427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549287 () Bool)

(assert (=> b!549287 (= e!317277 e!317276)))

(declare-fun res!342428 () Bool)

(assert (=> b!549287 (=> (not res!342428) (not e!317276))))

(declare-datatypes ((SeekEntryResult!5084 0))(
  ( (MissingZero!5084 (index!22563 (_ BitVec 32))) (Found!5084 (index!22564 (_ BitVec 32))) (Intermediate!5084 (undefined!5896 Bool) (index!22565 (_ BitVec 32)) (x!51502 (_ BitVec 32))) (Undefined!5084) (MissingVacant!5084 (index!22566 (_ BitVec 32))) )
))
(declare-fun lt!250083 () SeekEntryResult!5084)

(assert (=> b!549287 (= res!342428 (or (= lt!250083 (MissingZero!5084 i!1132)) (= lt!250083 (MissingVacant!5084 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34639 (_ BitVec 32)) SeekEntryResult!5084)

(assert (=> b!549287 (= lt!250083 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!342430 () Bool)

(assert (=> start!50186 (=> (not res!342430) (not e!317277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50186 (= res!342430 (validMask!0 mask!3119))))

(assert (=> start!50186 e!317277))

(assert (=> start!50186 true))

(declare-fun array_inv!12431 (array!34639) Bool)

(assert (=> start!50186 (array_inv!12431 a!3118)))

(declare-fun b!549286 () Bool)

(declare-fun res!342424 () Bool)

(assert (=> b!549286 (=> (not res!342424) (not e!317276))))

(declare-datatypes ((List!10715 0))(
  ( (Nil!10712) (Cons!10711 (h!11684 (_ BitVec 64)) (t!16943 List!10715)) )
))
(declare-fun arrayNoDuplicates!0 (array!34639 (_ BitVec 32) List!10715) Bool)

(assert (=> b!549286 (= res!342424 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10712))))

(assert (= (and start!50186 res!342430) b!549284))

(assert (= (and b!549284 res!342425) b!549282))

(assert (= (and b!549282 res!342431) b!549283))

(assert (= (and b!549283 res!342429) b!549280))

(assert (= (and b!549280 res!342426) b!549287))

(assert (= (and b!549287 res!342428) b!549285))

(assert (= (and b!549285 res!342427) b!549286))

(assert (= (and b!549286 res!342424) b!549281))

(declare-fun m!526131 () Bool)

(assert (=> start!50186 m!526131))

(declare-fun m!526133 () Bool)

(assert (=> start!50186 m!526133))

(declare-fun m!526135 () Bool)

(assert (=> b!549283 m!526135))

(declare-fun m!526137 () Bool)

(assert (=> b!549287 m!526137))

(declare-fun m!526139 () Bool)

(assert (=> b!549280 m!526139))

(declare-fun m!526141 () Bool)

(assert (=> b!549286 m!526141))

(declare-fun m!526143 () Bool)

(assert (=> b!549282 m!526143))

(assert (=> b!549282 m!526143))

(declare-fun m!526145 () Bool)

(assert (=> b!549282 m!526145))

(declare-fun m!526147 () Bool)

(assert (=> b!549281 m!526147))

(declare-fun m!526149 () Bool)

(assert (=> b!549281 m!526149))

(assert (=> b!549281 m!526149))

(declare-fun m!526151 () Bool)

(assert (=> b!549281 m!526151))

(declare-fun m!526153 () Bool)

(assert (=> b!549285 m!526153))

(push 1)

