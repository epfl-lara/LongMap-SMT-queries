; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50828 () Bool)

(assert start!50828)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!556199 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!320471 () Bool)

(declare-datatypes ((array!35053 0))(
  ( (array!35054 (arr!16836 (Array (_ BitVec 32) (_ BitVec 64))) (size!17200 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35053)

(declare-datatypes ((SeekEntryResult!5285 0))(
  ( (MissingZero!5285 (index!23367 (_ BitVec 32))) (Found!5285 (index!23368 (_ BitVec 32))) (Intermediate!5285 (undefined!6097 Bool) (index!23369 (_ BitVec 32)) (x!52263 (_ BitVec 32))) (Undefined!5285) (MissingVacant!5285 (index!23370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35053 (_ BitVec 32)) SeekEntryResult!5285)

(assert (=> b!556199 (= e!320471 (= (seekEntryOrOpen!0 (select (arr!16836 a!3118) j!142) a!3118 mask!3119) (Found!5285 j!142)))))

(declare-fun b!556200 () Bool)

(declare-fun res!348611 () Bool)

(declare-fun e!320469 () Bool)

(assert (=> b!556200 (=> (not res!348611) (not e!320469))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556200 (= res!348611 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556201 () Bool)

(declare-fun res!348620 () Bool)

(declare-fun e!320470 () Bool)

(assert (=> b!556201 (=> (not res!348620) (not e!320470))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35053 (_ BitVec 32)) SeekEntryResult!5285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556201 (= res!348620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16836 a!3118) j!142) mask!3119) (select (arr!16836 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16836 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16836 a!3118) i!1132 k!1914) j!142) (array!35054 (store (arr!16836 a!3118) i!1132 k!1914) (size!17200 a!3118)) mask!3119)))))

(declare-fun res!348612 () Bool)

(assert (=> start!50828 (=> (not res!348612) (not e!320469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50828 (= res!348612 (validMask!0 mask!3119))))

(assert (=> start!50828 e!320469))

(assert (=> start!50828 true))

(declare-fun array_inv!12632 (array!35053) Bool)

(assert (=> start!50828 (array_inv!12632 a!3118)))

(declare-fun b!556202 () Bool)

(declare-fun res!348619 () Bool)

(assert (=> b!556202 (=> (not res!348619) (not e!320470))))

(declare-datatypes ((List!10916 0))(
  ( (Nil!10913) (Cons!10912 (h!11897 (_ BitVec 64)) (t!17144 List!10916)) )
))
(declare-fun arrayNoDuplicates!0 (array!35053 (_ BitVec 32) List!10916) Bool)

(assert (=> b!556202 (= res!348619 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10913))))

(declare-fun b!556203 () Bool)

(declare-fun res!348618 () Bool)

(assert (=> b!556203 (=> (not res!348618) (not e!320469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556203 (= res!348618 (validKeyInArray!0 k!1914))))

(declare-fun b!556204 () Bool)

(declare-fun res!348617 () Bool)

(assert (=> b!556204 (=> (not res!348617) (not e!320469))))

(assert (=> b!556204 (= res!348617 (validKeyInArray!0 (select (arr!16836 a!3118) j!142)))))

(declare-fun b!556205 () Bool)

(assert (=> b!556205 (= e!320470 (not true))))

(assert (=> b!556205 e!320471))

(declare-fun res!348613 () Bool)

(assert (=> b!556205 (=> (not res!348613) (not e!320471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35053 (_ BitVec 32)) Bool)

(assert (=> b!556205 (= res!348613 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17344 0))(
  ( (Unit!17345) )
))
(declare-fun lt!252813 () Unit!17344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17344)

(assert (=> b!556205 (= lt!252813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556206 () Bool)

(assert (=> b!556206 (= e!320469 e!320470)))

(declare-fun res!348614 () Bool)

(assert (=> b!556206 (=> (not res!348614) (not e!320470))))

(declare-fun lt!252814 () SeekEntryResult!5285)

(assert (=> b!556206 (= res!348614 (or (= lt!252814 (MissingZero!5285 i!1132)) (= lt!252814 (MissingVacant!5285 i!1132))))))

(assert (=> b!556206 (= lt!252814 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556207 () Bool)

(declare-fun res!348616 () Bool)

(assert (=> b!556207 (=> (not res!348616) (not e!320470))))

(assert (=> b!556207 (= res!348616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556208 () Bool)

(declare-fun res!348615 () Bool)

(assert (=> b!556208 (=> (not res!348615) (not e!320469))))

(assert (=> b!556208 (= res!348615 (and (= (size!17200 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17200 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17200 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50828 res!348612) b!556208))

(assert (= (and b!556208 res!348615) b!556204))

(assert (= (and b!556204 res!348617) b!556203))

(assert (= (and b!556203 res!348618) b!556200))

(assert (= (and b!556200 res!348611) b!556206))

(assert (= (and b!556206 res!348614) b!556207))

(assert (= (and b!556207 res!348616) b!556202))

(assert (= (and b!556202 res!348619) b!556201))

(assert (= (and b!556201 res!348620) b!556205))

(assert (= (and b!556205 res!348613) b!556199))

(declare-fun m!534141 () Bool)

(assert (=> b!556206 m!534141))

(declare-fun m!534143 () Bool)

(assert (=> b!556204 m!534143))

(assert (=> b!556204 m!534143))

(declare-fun m!534145 () Bool)

(assert (=> b!556204 m!534145))

(declare-fun m!534147 () Bool)

(assert (=> b!556207 m!534147))

(assert (=> b!556201 m!534143))

(declare-fun m!534149 () Bool)

(assert (=> b!556201 m!534149))

(assert (=> b!556201 m!534143))

(declare-fun m!534151 () Bool)

(assert (=> b!556201 m!534151))

(declare-fun m!534153 () Bool)

(assert (=> b!556201 m!534153))

(assert (=> b!556201 m!534151))

(declare-fun m!534155 () Bool)

(assert (=> b!556201 m!534155))

(assert (=> b!556201 m!534149))

(assert (=> b!556201 m!534143))

(declare-fun m!534157 () Bool)

(assert (=> b!556201 m!534157))

(declare-fun m!534159 () Bool)

(assert (=> b!556201 m!534159))

(assert (=> b!556201 m!534151))

(assert (=> b!556201 m!534153))

(assert (=> b!556199 m!534143))

(assert (=> b!556199 m!534143))

(declare-fun m!534161 () Bool)

(assert (=> b!556199 m!534161))

(declare-fun m!534163 () Bool)

(assert (=> b!556202 m!534163))

(declare-fun m!534165 () Bool)

(assert (=> b!556205 m!534165))

(declare-fun m!534167 () Bool)

(assert (=> b!556205 m!534167))

(declare-fun m!534169 () Bool)

(assert (=> b!556203 m!534169))

(declare-fun m!534171 () Bool)

(assert (=> start!50828 m!534171))

(declare-fun m!534173 () Bool)

(assert (=> start!50828 m!534173))

(declare-fun m!534175 () Bool)

(assert (=> b!556200 m!534175))

(push 1)

