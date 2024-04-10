; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52430 () Bool)

(assert start!52430)

(declare-fun b!572348 () Bool)

(declare-fun e!329223 () Bool)

(assert (=> b!572348 (= e!329223 (not true))))

(declare-fun e!329224 () Bool)

(assert (=> b!572348 e!329224))

(declare-fun res!361858 () Bool)

(assert (=> b!572348 (=> (not res!361858) (not e!329224))))

(declare-datatypes ((SeekEntryResult!5651 0))(
  ( (MissingZero!5651 (index!24831 (_ BitVec 32))) (Found!5651 (index!24832 (_ BitVec 32))) (Intermediate!5651 (undefined!6463 Bool) (index!24833 (_ BitVec 32)) (x!53704 (_ BitVec 32))) (Undefined!5651) (MissingVacant!5651 (index!24834 (_ BitVec 32))) )
))
(declare-fun lt!261173 () SeekEntryResult!5651)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572348 (= res!361858 (= lt!261173 (Found!5651 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35827 0))(
  ( (array!35828 (arr!17202 (Array (_ BitVec 32) (_ BitVec 64))) (size!17566 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35827)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35827 (_ BitVec 32)) SeekEntryResult!5651)

(assert (=> b!572348 (= lt!261173 (seekEntryOrOpen!0 (select (arr!17202 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35827 (_ BitVec 32)) Bool)

(assert (=> b!572348 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18004 0))(
  ( (Unit!18005) )
))
(declare-fun lt!261181 () Unit!18004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18004)

(assert (=> b!572348 (= lt!261181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572349 () Bool)

(declare-fun res!361861 () Bool)

(declare-fun e!329220 () Bool)

(assert (=> b!572349 (=> (not res!361861) (not e!329220))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572349 (= res!361861 (and (= (size!17566 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17566 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17566 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572350 () Bool)

(declare-fun e!329225 () Bool)

(declare-fun e!329222 () Bool)

(assert (=> b!572350 (= e!329225 e!329222)))

(declare-fun res!361865 () Bool)

(assert (=> b!572350 (=> res!361865 e!329222)))

(declare-fun lt!261179 () (_ BitVec 64))

(assert (=> b!572350 (= res!361865 (or (= lt!261179 (select (arr!17202 a!3118) j!142)) (= lt!261179 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!261176 () SeekEntryResult!5651)

(assert (=> b!572350 (= lt!261179 (select (arr!17202 a!3118) (index!24833 lt!261176)))))

(declare-fun b!572351 () Bool)

(declare-fun e!329226 () Bool)

(assert (=> b!572351 (= e!329220 e!329226)))

(declare-fun res!361857 () Bool)

(assert (=> b!572351 (=> (not res!361857) (not e!329226))))

(declare-fun lt!261175 () SeekEntryResult!5651)

(assert (=> b!572351 (= res!361857 (or (= lt!261175 (MissingZero!5651 i!1132)) (= lt!261175 (MissingVacant!5651 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!572351 (= lt!261175 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572352 () Bool)

(assert (=> b!572352 (= e!329226 e!329223)))

(declare-fun res!361868 () Bool)

(assert (=> b!572352 (=> (not res!361868) (not e!329223))))

(declare-fun lt!261180 () (_ BitVec 64))

(declare-fun lt!261178 () (_ BitVec 32))

(declare-fun lt!261177 () array!35827)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35827 (_ BitVec 32)) SeekEntryResult!5651)

(assert (=> b!572352 (= res!361868 (= lt!261176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261178 lt!261180 lt!261177 mask!3119)))))

(declare-fun lt!261174 () (_ BitVec 32))

(assert (=> b!572352 (= lt!261176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261174 (select (arr!17202 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572352 (= lt!261178 (toIndex!0 lt!261180 mask!3119))))

(assert (=> b!572352 (= lt!261180 (select (store (arr!17202 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572352 (= lt!261174 (toIndex!0 (select (arr!17202 a!3118) j!142) mask!3119))))

(assert (=> b!572352 (= lt!261177 (array!35828 (store (arr!17202 a!3118) i!1132 k!1914) (size!17566 a!3118)))))

(declare-fun b!572353 () Bool)

(declare-fun e!329221 () Bool)

(assert (=> b!572353 (= e!329222 e!329221)))

(declare-fun res!361867 () Bool)

(assert (=> b!572353 (=> (not res!361867) (not e!329221))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35827 (_ BitVec 32)) SeekEntryResult!5651)

(assert (=> b!572353 (= res!361867 (= lt!261173 (seekKeyOrZeroReturnVacant!0 (x!53704 lt!261176) (index!24833 lt!261176) (index!24833 lt!261176) (select (arr!17202 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572354 () Bool)

(declare-fun res!361856 () Bool)

(assert (=> b!572354 (=> (not res!361856) (not e!329220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572354 (= res!361856 (validKeyInArray!0 k!1914))))

(declare-fun b!572355 () Bool)

(assert (=> b!572355 (= e!329221 (= (seekEntryOrOpen!0 lt!261180 lt!261177 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53704 lt!261176) (index!24833 lt!261176) (index!24833 lt!261176) lt!261180 lt!261177 mask!3119)))))

(declare-fun b!572356 () Bool)

(declare-fun res!361859 () Bool)

(assert (=> b!572356 (=> (not res!361859) (not e!329226))))

(declare-datatypes ((List!11282 0))(
  ( (Nil!11279) (Cons!11278 (h!12305 (_ BitVec 64)) (t!17510 List!11282)) )
))
(declare-fun arrayNoDuplicates!0 (array!35827 (_ BitVec 32) List!11282) Bool)

(assert (=> b!572356 (= res!361859 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11279))))

(declare-fun b!572357 () Bool)

(declare-fun res!361862 () Bool)

(assert (=> b!572357 (=> (not res!361862) (not e!329226))))

(assert (=> b!572357 (= res!361862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572358 () Bool)

(assert (=> b!572358 (= e!329224 e!329225)))

(declare-fun res!361860 () Bool)

(assert (=> b!572358 (=> res!361860 e!329225)))

(assert (=> b!572358 (= res!361860 (or (undefined!6463 lt!261176) (not (is-Intermediate!5651 lt!261176))))))

(declare-fun b!572359 () Bool)

(declare-fun res!361863 () Bool)

(assert (=> b!572359 (=> (not res!361863) (not e!329220))))

(assert (=> b!572359 (= res!361863 (validKeyInArray!0 (select (arr!17202 a!3118) j!142)))))

(declare-fun res!361866 () Bool)

(assert (=> start!52430 (=> (not res!361866) (not e!329220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52430 (= res!361866 (validMask!0 mask!3119))))

(assert (=> start!52430 e!329220))

(assert (=> start!52430 true))

(declare-fun array_inv!12998 (array!35827) Bool)

(assert (=> start!52430 (array_inv!12998 a!3118)))

(declare-fun b!572360 () Bool)

(declare-fun res!361864 () Bool)

(assert (=> b!572360 (=> (not res!361864) (not e!329220))))

(declare-fun arrayContainsKey!0 (array!35827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572360 (= res!361864 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52430 res!361866) b!572349))

(assert (= (and b!572349 res!361861) b!572359))

(assert (= (and b!572359 res!361863) b!572354))

(assert (= (and b!572354 res!361856) b!572360))

(assert (= (and b!572360 res!361864) b!572351))

(assert (= (and b!572351 res!361857) b!572357))

(assert (= (and b!572357 res!361862) b!572356))

(assert (= (and b!572356 res!361859) b!572352))

(assert (= (and b!572352 res!361868) b!572348))

(assert (= (and b!572348 res!361858) b!572358))

(assert (= (and b!572358 (not res!361860)) b!572350))

(assert (= (and b!572350 (not res!361865)) b!572353))

(assert (= (and b!572353 res!361867) b!572355))

(declare-fun m!551313 () Bool)

(assert (=> b!572354 m!551313))

(declare-fun m!551315 () Bool)

(assert (=> b!572348 m!551315))

(assert (=> b!572348 m!551315))

(declare-fun m!551317 () Bool)

(assert (=> b!572348 m!551317))

(declare-fun m!551319 () Bool)

(assert (=> b!572348 m!551319))

(declare-fun m!551321 () Bool)

(assert (=> b!572348 m!551321))

(declare-fun m!551323 () Bool)

(assert (=> b!572355 m!551323))

(declare-fun m!551325 () Bool)

(assert (=> b!572355 m!551325))

(declare-fun m!551327 () Bool)

(assert (=> b!572356 m!551327))

(assert (=> b!572353 m!551315))

(assert (=> b!572353 m!551315))

(declare-fun m!551329 () Bool)

(assert (=> b!572353 m!551329))

(assert (=> b!572359 m!551315))

(assert (=> b!572359 m!551315))

(declare-fun m!551331 () Bool)

(assert (=> b!572359 m!551331))

(assert (=> b!572350 m!551315))

(declare-fun m!551333 () Bool)

(assert (=> b!572350 m!551333))

(assert (=> b!572352 m!551315))

(declare-fun m!551335 () Bool)

(assert (=> b!572352 m!551335))

(declare-fun m!551337 () Bool)

(assert (=> b!572352 m!551337))

(declare-fun m!551339 () Bool)

(assert (=> b!572352 m!551339))

(assert (=> b!572352 m!551315))

(declare-fun m!551341 () Bool)

(assert (=> b!572352 m!551341))

(assert (=> b!572352 m!551315))

(declare-fun m!551343 () Bool)

(assert (=> b!572352 m!551343))

(declare-fun m!551345 () Bool)

(assert (=> b!572352 m!551345))

(declare-fun m!551347 () Bool)

(assert (=> start!52430 m!551347))

(declare-fun m!551349 () Bool)

(assert (=> start!52430 m!551349))

(declare-fun m!551351 () Bool)

(assert (=> b!572360 m!551351))

(declare-fun m!551353 () Bool)

(assert (=> b!572351 m!551353))

(declare-fun m!551355 () Bool)

(assert (=> b!572357 m!551355))

(push 1)

