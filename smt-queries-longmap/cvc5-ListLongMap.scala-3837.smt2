; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52772 () Bool)

(assert start!52772)

(declare-fun b!575373 () Bool)

(declare-fun e!331060 () Bool)

(declare-fun e!331064 () Bool)

(assert (=> b!575373 (= e!331060 e!331064)))

(declare-fun res!363798 () Bool)

(assert (=> b!575373 (=> res!363798 e!331064)))

(declare-datatypes ((SeekEntryResult!5690 0))(
  ( (MissingZero!5690 (index!24987 (_ BitVec 32))) (Found!5690 (index!24988 (_ BitVec 32))) (Intermediate!5690 (undefined!6502 Bool) (index!24989 (_ BitVec 32)) (x!53883 (_ BitVec 32))) (Undefined!5690) (MissingVacant!5690 (index!24990 (_ BitVec 32))) )
))
(declare-fun lt!262948 () SeekEntryResult!5690)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35917 0))(
  ( (array!35918 (arr!17241 (Array (_ BitVec 32) (_ BitVec 64))) (size!17605 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35917)

(declare-fun lt!262960 () SeekEntryResult!5690)

(declare-fun lt!262953 () (_ BitVec 64))

(declare-fun lt!262954 () SeekEntryResult!5690)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!575373 (= res!363798 (or (bvslt (index!24989 lt!262948) #b00000000000000000000000000000000) (bvsge (index!24989 lt!262948) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53883 lt!262948) #b01111111111111111111111111111110) (bvslt (x!53883 lt!262948) #b00000000000000000000000000000000) (not (= lt!262953 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17241 a!3118) i!1132 k!1914) (index!24989 lt!262948)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262960 lt!262954))))))

(declare-fun lt!262959 () SeekEntryResult!5690)

(declare-fun lt!262957 () SeekEntryResult!5690)

(assert (=> b!575373 (= lt!262959 lt!262957)))

(declare-fun lt!262947 () (_ BitVec 64))

(declare-fun lt!262958 () array!35917)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35917 (_ BitVec 32)) SeekEntryResult!5690)

(assert (=> b!575373 (= lt!262957 (seekKeyOrZeroReturnVacant!0 (x!53883 lt!262948) (index!24989 lt!262948) (index!24989 lt!262948) lt!262947 lt!262958 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35917 (_ BitVec 32)) SeekEntryResult!5690)

(assert (=> b!575373 (= lt!262959 (seekEntryOrOpen!0 lt!262947 lt!262958 mask!3119))))

(declare-fun lt!262951 () SeekEntryResult!5690)

(assert (=> b!575373 (= lt!262951 lt!262960)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575373 (= lt!262960 (seekKeyOrZeroReturnVacant!0 (x!53883 lt!262948) (index!24989 lt!262948) (index!24989 lt!262948) (select (arr!17241 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363793 () Bool)

(declare-fun e!331063 () Bool)

(assert (=> start!52772 (=> (not res!363793) (not e!331063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52772 (= res!363793 (validMask!0 mask!3119))))

(assert (=> start!52772 e!331063))

(assert (=> start!52772 true))

(declare-fun array_inv!13037 (array!35917) Bool)

(assert (=> start!52772 (array_inv!13037 a!3118)))

(declare-fun b!575374 () Bool)

(declare-fun res!363799 () Bool)

(declare-fun e!331059 () Bool)

(assert (=> b!575374 (=> (not res!363799) (not e!331059))))

(declare-datatypes ((List!11321 0))(
  ( (Nil!11318) (Cons!11317 (h!12356 (_ BitVec 64)) (t!17549 List!11321)) )
))
(declare-fun arrayNoDuplicates!0 (array!35917 (_ BitVec 32) List!11321) Bool)

(assert (=> b!575374 (= res!363799 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11318))))

(declare-fun b!575375 () Bool)

(declare-fun res!363795 () Bool)

(assert (=> b!575375 (=> (not res!363795) (not e!331063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575375 (= res!363795 (validKeyInArray!0 (select (arr!17241 a!3118) j!142)))))

(declare-fun b!575376 () Bool)

(assert (=> b!575376 (= e!331063 e!331059)))

(declare-fun res!363800 () Bool)

(assert (=> b!575376 (=> (not res!363800) (not e!331059))))

(declare-fun lt!262956 () SeekEntryResult!5690)

(assert (=> b!575376 (= res!363800 (or (= lt!262956 (MissingZero!5690 i!1132)) (= lt!262956 (MissingVacant!5690 i!1132))))))

(assert (=> b!575376 (= lt!262956 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575377 () Bool)

(declare-fun e!331061 () Bool)

(assert (=> b!575377 (= e!331061 e!331060)))

(declare-fun res!363791 () Bool)

(assert (=> b!575377 (=> res!363791 e!331060)))

(assert (=> b!575377 (= res!363791 (or (= lt!262953 (select (arr!17241 a!3118) j!142)) (= lt!262953 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575377 (= lt!262953 (select (arr!17241 a!3118) (index!24989 lt!262948)))))

(declare-fun b!575378 () Bool)

(declare-fun res!363792 () Bool)

(assert (=> b!575378 (=> (not res!363792) (not e!331063))))

(declare-fun arrayContainsKey!0 (array!35917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575378 (= res!363792 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575379 () Bool)

(declare-fun e!331065 () Bool)

(assert (=> b!575379 (= e!331059 e!331065)))

(declare-fun res!363790 () Bool)

(assert (=> b!575379 (=> (not res!363790) (not e!331065))))

(declare-fun lt!262952 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35917 (_ BitVec 32)) SeekEntryResult!5690)

(assert (=> b!575379 (= res!363790 (= lt!262948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262952 lt!262947 lt!262958 mask!3119)))))

(declare-fun lt!262949 () (_ BitVec 32))

(assert (=> b!575379 (= lt!262948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262949 (select (arr!17241 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575379 (= lt!262952 (toIndex!0 lt!262947 mask!3119))))

(assert (=> b!575379 (= lt!262947 (select (store (arr!17241 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575379 (= lt!262949 (toIndex!0 (select (arr!17241 a!3118) j!142) mask!3119))))

(assert (=> b!575379 (= lt!262958 (array!35918 (store (arr!17241 a!3118) i!1132 k!1914) (size!17605 a!3118)))))

(declare-fun b!575380 () Bool)

(declare-fun res!363797 () Bool)

(assert (=> b!575380 (=> (not res!363797) (not e!331059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35917 (_ BitVec 32)) Bool)

(assert (=> b!575380 (= res!363797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575381 () Bool)

(assert (=> b!575381 (= e!331065 (not e!331061))))

(declare-fun res!363789 () Bool)

(assert (=> b!575381 (=> res!363789 e!331061)))

(assert (=> b!575381 (= res!363789 (or (undefined!6502 lt!262948) (not (is-Intermediate!5690 lt!262948))))))

(assert (=> b!575381 (= lt!262951 lt!262954)))

(assert (=> b!575381 (= lt!262954 (Found!5690 j!142))))

(assert (=> b!575381 (= lt!262951 (seekEntryOrOpen!0 (select (arr!17241 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575381 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18082 0))(
  ( (Unit!18083) )
))
(declare-fun lt!262950 () Unit!18082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18082)

(assert (=> b!575381 (= lt!262950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575382 () Bool)

(declare-fun res!363796 () Bool)

(assert (=> b!575382 (=> (not res!363796) (not e!331063))))

(assert (=> b!575382 (= res!363796 (and (= (size!17605 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17605 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17605 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575383 () Bool)

(assert (=> b!575383 (= e!331064 true)))

(assert (=> b!575383 (= lt!262960 lt!262957)))

(declare-fun lt!262955 () Unit!18082)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35917 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18082)

(assert (=> b!575383 (= lt!262955 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53883 lt!262948) (index!24989 lt!262948) (index!24989 lt!262948) mask!3119))))

(declare-fun b!575384 () Bool)

(declare-fun res!363794 () Bool)

(assert (=> b!575384 (=> (not res!363794) (not e!331063))))

(assert (=> b!575384 (= res!363794 (validKeyInArray!0 k!1914))))

(assert (= (and start!52772 res!363793) b!575382))

(assert (= (and b!575382 res!363796) b!575375))

(assert (= (and b!575375 res!363795) b!575384))

(assert (= (and b!575384 res!363794) b!575378))

(assert (= (and b!575378 res!363792) b!575376))

(assert (= (and b!575376 res!363800) b!575380))

(assert (= (and b!575380 res!363797) b!575374))

(assert (= (and b!575374 res!363799) b!575379))

(assert (= (and b!575379 res!363790) b!575381))

(assert (= (and b!575381 (not res!363789)) b!575377))

(assert (= (and b!575377 (not res!363791)) b!575373))

(assert (= (and b!575373 (not res!363798)) b!575383))

(declare-fun m!554205 () Bool)

(assert (=> b!575383 m!554205))

(declare-fun m!554207 () Bool)

(assert (=> b!575374 m!554207))

(declare-fun m!554209 () Bool)

(assert (=> b!575375 m!554209))

(assert (=> b!575375 m!554209))

(declare-fun m!554211 () Bool)

(assert (=> b!575375 m!554211))

(assert (=> b!575381 m!554209))

(assert (=> b!575381 m!554209))

(declare-fun m!554213 () Bool)

(assert (=> b!575381 m!554213))

(declare-fun m!554215 () Bool)

(assert (=> b!575381 m!554215))

(declare-fun m!554217 () Bool)

(assert (=> b!575381 m!554217))

(assert (=> b!575377 m!554209))

(declare-fun m!554219 () Bool)

(assert (=> b!575377 m!554219))

(declare-fun m!554221 () Bool)

(assert (=> start!52772 m!554221))

(declare-fun m!554223 () Bool)

(assert (=> start!52772 m!554223))

(assert (=> b!575379 m!554209))

(declare-fun m!554225 () Bool)

(assert (=> b!575379 m!554225))

(assert (=> b!575379 m!554209))

(declare-fun m!554227 () Bool)

(assert (=> b!575379 m!554227))

(declare-fun m!554229 () Bool)

(assert (=> b!575379 m!554229))

(declare-fun m!554231 () Bool)

(assert (=> b!575379 m!554231))

(assert (=> b!575379 m!554209))

(declare-fun m!554233 () Bool)

(assert (=> b!575379 m!554233))

(declare-fun m!554235 () Bool)

(assert (=> b!575379 m!554235))

(declare-fun m!554237 () Bool)

(assert (=> b!575378 m!554237))

(declare-fun m!554239 () Bool)

(assert (=> b!575373 m!554239))

(assert (=> b!575373 m!554209))

(declare-fun m!554241 () Bool)

(assert (=> b!575373 m!554241))

(declare-fun m!554243 () Bool)

(assert (=> b!575373 m!554243))

(assert (=> b!575373 m!554209))

(declare-fun m!554245 () Bool)

(assert (=> b!575373 m!554245))

(assert (=> b!575373 m!554235))

(declare-fun m!554247 () Bool)

(assert (=> b!575376 m!554247))

(declare-fun m!554249 () Bool)

(assert (=> b!575384 m!554249))

(declare-fun m!554251 () Bool)

(assert (=> b!575380 m!554251))

(push 1)

