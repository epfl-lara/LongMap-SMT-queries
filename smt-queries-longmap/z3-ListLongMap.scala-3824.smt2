; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52432 () Bool)

(assert start!52432)

(declare-fun b!572387 () Bool)

(declare-fun res!361903 () Bool)

(declare-fun e!329244 () Bool)

(assert (=> b!572387 (=> (not res!361903) (not e!329244))))

(declare-datatypes ((array!35829 0))(
  ( (array!35830 (arr!17203 (Array (_ BitVec 32) (_ BitVec 64))) (size!17567 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35829)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572387 (= res!361903 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572388 () Bool)

(declare-fun res!361904 () Bool)

(declare-fun e!329250 () Bool)

(assert (=> b!572388 (=> (not res!361904) (not e!329250))))

(declare-datatypes ((List!11283 0))(
  ( (Nil!11280) (Cons!11279 (h!12306 (_ BitVec 64)) (t!17511 List!11283)) )
))
(declare-fun arrayNoDuplicates!0 (array!35829 (_ BitVec 32) List!11283) Bool)

(assert (=> b!572388 (= res!361904 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11280))))

(declare-fun b!572389 () Bool)

(declare-fun res!361902 () Bool)

(assert (=> b!572389 (=> (not res!361902) (not e!329244))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572389 (= res!361902 (and (= (size!17567 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17567 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17567 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572390 () Bool)

(declare-fun res!361900 () Bool)

(assert (=> b!572390 (=> (not res!361900) (not e!329244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572390 (= res!361900 (validKeyInArray!0 k0!1914))))

(declare-fun b!572391 () Bool)

(declare-fun e!329249 () Bool)

(assert (=> b!572391 (= e!329249 (not true))))

(declare-fun e!329243 () Bool)

(assert (=> b!572391 e!329243))

(declare-fun res!361898 () Bool)

(assert (=> b!572391 (=> (not res!361898) (not e!329243))))

(declare-datatypes ((SeekEntryResult!5652 0))(
  ( (MissingZero!5652 (index!24835 (_ BitVec 32))) (Found!5652 (index!24836 (_ BitVec 32))) (Intermediate!5652 (undefined!6464 Bool) (index!24837 (_ BitVec 32)) (x!53705 (_ BitVec 32))) (Undefined!5652) (MissingVacant!5652 (index!24838 (_ BitVec 32))) )
))
(declare-fun lt!261203 () SeekEntryResult!5652)

(assert (=> b!572391 (= res!361898 (= lt!261203 (Found!5652 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35829 (_ BitVec 32)) SeekEntryResult!5652)

(assert (=> b!572391 (= lt!261203 (seekEntryOrOpen!0 (select (arr!17203 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35829 (_ BitVec 32)) Bool)

(assert (=> b!572391 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18006 0))(
  ( (Unit!18007) )
))
(declare-fun lt!261201 () Unit!18006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18006)

(assert (=> b!572391 (= lt!261201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!361899 () Bool)

(assert (=> start!52432 (=> (not res!361899) (not e!329244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52432 (= res!361899 (validMask!0 mask!3119))))

(assert (=> start!52432 e!329244))

(assert (=> start!52432 true))

(declare-fun array_inv!12999 (array!35829) Bool)

(assert (=> start!52432 (array_inv!12999 a!3118)))

(declare-fun b!572392 () Bool)

(declare-fun e!329245 () Bool)

(declare-fun e!329247 () Bool)

(assert (=> b!572392 (= e!329245 e!329247)))

(declare-fun res!361901 () Bool)

(assert (=> b!572392 (=> res!361901 e!329247)))

(declare-fun lt!261200 () (_ BitVec 64))

(assert (=> b!572392 (= res!361901 (or (= lt!261200 (select (arr!17203 a!3118) j!142)) (= lt!261200 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!261207 () SeekEntryResult!5652)

(assert (=> b!572392 (= lt!261200 (select (arr!17203 a!3118) (index!24837 lt!261207)))))

(declare-fun b!572393 () Bool)

(assert (=> b!572393 (= e!329250 e!329249)))

(declare-fun res!361897 () Bool)

(assert (=> b!572393 (=> (not res!361897) (not e!329249))))

(declare-fun lt!261202 () (_ BitVec 32))

(declare-fun lt!261205 () (_ BitVec 64))

(declare-fun lt!261208 () array!35829)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35829 (_ BitVec 32)) SeekEntryResult!5652)

(assert (=> b!572393 (= res!361897 (= lt!261207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261202 lt!261205 lt!261208 mask!3119)))))

(declare-fun lt!261206 () (_ BitVec 32))

(assert (=> b!572393 (= lt!261207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261206 (select (arr!17203 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572393 (= lt!261202 (toIndex!0 lt!261205 mask!3119))))

(assert (=> b!572393 (= lt!261205 (select (store (arr!17203 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572393 (= lt!261206 (toIndex!0 (select (arr!17203 a!3118) j!142) mask!3119))))

(assert (=> b!572393 (= lt!261208 (array!35830 (store (arr!17203 a!3118) i!1132 k0!1914) (size!17567 a!3118)))))

(declare-fun b!572394 () Bool)

(declare-fun res!361895 () Bool)

(assert (=> b!572394 (=> (not res!361895) (not e!329250))))

(assert (=> b!572394 (= res!361895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572395 () Bool)

(declare-fun res!361896 () Bool)

(assert (=> b!572395 (=> (not res!361896) (not e!329244))))

(assert (=> b!572395 (= res!361896 (validKeyInArray!0 (select (arr!17203 a!3118) j!142)))))

(declare-fun b!572396 () Bool)

(assert (=> b!572396 (= e!329244 e!329250)))

(declare-fun res!361907 () Bool)

(assert (=> b!572396 (=> (not res!361907) (not e!329250))))

(declare-fun lt!261204 () SeekEntryResult!5652)

(assert (=> b!572396 (= res!361907 (or (= lt!261204 (MissingZero!5652 i!1132)) (= lt!261204 (MissingVacant!5652 i!1132))))))

(assert (=> b!572396 (= lt!261204 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572397 () Bool)

(assert (=> b!572397 (= e!329243 e!329245)))

(declare-fun res!361905 () Bool)

(assert (=> b!572397 (=> res!361905 e!329245)))

(get-info :version)

(assert (=> b!572397 (= res!361905 (or (undefined!6464 lt!261207) (not ((_ is Intermediate!5652) lt!261207))))))

(declare-fun e!329248 () Bool)

(declare-fun b!572398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35829 (_ BitVec 32)) SeekEntryResult!5652)

(assert (=> b!572398 (= e!329248 (= (seekEntryOrOpen!0 lt!261205 lt!261208 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53705 lt!261207) (index!24837 lt!261207) (index!24837 lt!261207) lt!261205 lt!261208 mask!3119)))))

(declare-fun b!572399 () Bool)

(assert (=> b!572399 (= e!329247 e!329248)))

(declare-fun res!361906 () Bool)

(assert (=> b!572399 (=> (not res!361906) (not e!329248))))

(assert (=> b!572399 (= res!361906 (= lt!261203 (seekKeyOrZeroReturnVacant!0 (x!53705 lt!261207) (index!24837 lt!261207) (index!24837 lt!261207) (select (arr!17203 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52432 res!361899) b!572389))

(assert (= (and b!572389 res!361902) b!572395))

(assert (= (and b!572395 res!361896) b!572390))

(assert (= (and b!572390 res!361900) b!572387))

(assert (= (and b!572387 res!361903) b!572396))

(assert (= (and b!572396 res!361907) b!572394))

(assert (= (and b!572394 res!361895) b!572388))

(assert (= (and b!572388 res!361904) b!572393))

(assert (= (and b!572393 res!361897) b!572391))

(assert (= (and b!572391 res!361898) b!572397))

(assert (= (and b!572397 (not res!361905)) b!572392))

(assert (= (and b!572392 (not res!361901)) b!572399))

(assert (= (and b!572399 res!361906) b!572398))

(declare-fun m!551357 () Bool)

(assert (=> b!572399 m!551357))

(assert (=> b!572399 m!551357))

(declare-fun m!551359 () Bool)

(assert (=> b!572399 m!551359))

(assert (=> b!572391 m!551357))

(assert (=> b!572391 m!551357))

(declare-fun m!551361 () Bool)

(assert (=> b!572391 m!551361))

(declare-fun m!551363 () Bool)

(assert (=> b!572391 m!551363))

(declare-fun m!551365 () Bool)

(assert (=> b!572391 m!551365))

(declare-fun m!551367 () Bool)

(assert (=> b!572398 m!551367))

(declare-fun m!551369 () Bool)

(assert (=> b!572398 m!551369))

(declare-fun m!551371 () Bool)

(assert (=> b!572388 m!551371))

(declare-fun m!551373 () Bool)

(assert (=> b!572390 m!551373))

(assert (=> b!572392 m!551357))

(declare-fun m!551375 () Bool)

(assert (=> b!572392 m!551375))

(declare-fun m!551377 () Bool)

(assert (=> b!572396 m!551377))

(assert (=> b!572393 m!551357))

(declare-fun m!551379 () Bool)

(assert (=> b!572393 m!551379))

(assert (=> b!572393 m!551357))

(declare-fun m!551381 () Bool)

(assert (=> b!572393 m!551381))

(declare-fun m!551383 () Bool)

(assert (=> b!572393 m!551383))

(assert (=> b!572393 m!551357))

(declare-fun m!551385 () Bool)

(assert (=> b!572393 m!551385))

(declare-fun m!551387 () Bool)

(assert (=> b!572393 m!551387))

(declare-fun m!551389 () Bool)

(assert (=> b!572393 m!551389))

(assert (=> b!572395 m!551357))

(assert (=> b!572395 m!551357))

(declare-fun m!551391 () Bool)

(assert (=> b!572395 m!551391))

(declare-fun m!551393 () Bool)

(assert (=> b!572394 m!551393))

(declare-fun m!551395 () Bool)

(assert (=> start!52432 m!551395))

(declare-fun m!551397 () Bool)

(assert (=> start!52432 m!551397))

(declare-fun m!551399 () Bool)

(assert (=> b!572387 m!551399))

(check-sat (not b!572388) (not b!572387) (not b!572399) (not b!572393) (not b!572398) (not b!572390) (not b!572391) (not b!572396) (not start!52432) (not b!572394) (not b!572395))
(check-sat)
