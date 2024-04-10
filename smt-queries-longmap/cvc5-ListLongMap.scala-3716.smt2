; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51092 () Bool)

(assert start!51092)

(declare-fun res!350253 () Bool)

(declare-fun e!321675 () Bool)

(assert (=> start!51092 (=> (not res!350253) (not e!321675))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51092 (= res!350253 (validMask!0 mask!3119))))

(assert (=> start!51092 e!321675))

(assert (=> start!51092 true))

(declare-datatypes ((array!35146 0))(
  ( (array!35147 (arr!16878 (Array (_ BitVec 32) (_ BitVec 64))) (size!17242 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35146)

(declare-fun array_inv!12674 (array!35146) Bool)

(assert (=> start!51092 (array_inv!12674 a!3118)))

(declare-fun b!558388 () Bool)

(declare-fun res!350261 () Bool)

(assert (=> b!558388 (=> (not res!350261) (not e!321675))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558388 (= res!350261 (validKeyInArray!0 k!1914))))

(declare-fun b!558389 () Bool)

(declare-datatypes ((SeekEntryResult!5327 0))(
  ( (MissingZero!5327 (index!23535 (_ BitVec 32))) (Found!5327 (index!23536 (_ BitVec 32))) (Intermediate!5327 (undefined!6139 Bool) (index!23537 (_ BitVec 32)) (x!52435 (_ BitVec 32))) (Undefined!5327) (MissingVacant!5327 (index!23538 (_ BitVec 32))) )
))
(declare-fun lt!253749 () SeekEntryResult!5327)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!321670 () Bool)

(assert (=> b!558389 (= e!321670 (not (or (undefined!6139 lt!253749) (not (is-Intermediate!5327 lt!253749)) (= (select (arr!16878 a!3118) (index!23537 lt!253749)) (select (arr!16878 a!3118) j!142)) (= (select (arr!16878 a!3118) (index!23537 lt!253749)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!321671 () Bool)

(assert (=> b!558389 e!321671))

(declare-fun res!350259 () Bool)

(assert (=> b!558389 (=> (not res!350259) (not e!321671))))

(declare-fun lt!253752 () SeekEntryResult!5327)

(assert (=> b!558389 (= res!350259 (= lt!253752 (Found!5327 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35146 (_ BitVec 32)) SeekEntryResult!5327)

(assert (=> b!558389 (= lt!253752 (seekEntryOrOpen!0 (select (arr!16878 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35146 (_ BitVec 32)) Bool)

(assert (=> b!558389 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17428 0))(
  ( (Unit!17429) )
))
(declare-fun lt!253750 () Unit!17428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17428)

(assert (=> b!558389 (= lt!253750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558390 () Bool)

(declare-fun e!321673 () Bool)

(assert (=> b!558390 (= e!321675 e!321673)))

(declare-fun res!350254 () Bool)

(assert (=> b!558390 (=> (not res!350254) (not e!321673))))

(declare-fun lt!253753 () SeekEntryResult!5327)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558390 (= res!350254 (or (= lt!253753 (MissingZero!5327 i!1132)) (= lt!253753 (MissingVacant!5327 i!1132))))))

(assert (=> b!558390 (= lt!253753 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558391 () Bool)

(declare-fun res!350256 () Bool)

(assert (=> b!558391 (=> (not res!350256) (not e!321673))))

(declare-datatypes ((List!10958 0))(
  ( (Nil!10955) (Cons!10954 (h!11948 (_ BitVec 64)) (t!17186 List!10958)) )
))
(declare-fun arrayNoDuplicates!0 (array!35146 (_ BitVec 32) List!10958) Bool)

(assert (=> b!558391 (= res!350256 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10955))))

(declare-fun b!558392 () Bool)

(declare-fun e!321672 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35146 (_ BitVec 32)) SeekEntryResult!5327)

(assert (=> b!558392 (= e!321672 (= lt!253752 (seekKeyOrZeroReturnVacant!0 (x!52435 lt!253749) (index!23537 lt!253749) (index!23537 lt!253749) (select (arr!16878 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558393 () Bool)

(declare-fun res!350252 () Bool)

(assert (=> b!558393 (=> (not res!350252) (not e!321675))))

(assert (=> b!558393 (= res!350252 (and (= (size!17242 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17242 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17242 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558394 () Bool)

(assert (=> b!558394 (= e!321673 e!321670)))

(declare-fun res!350258 () Bool)

(assert (=> b!558394 (=> (not res!350258) (not e!321670))))

(declare-fun lt!253748 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35146 (_ BitVec 32)) SeekEntryResult!5327)

(assert (=> b!558394 (= res!350258 (= lt!253749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253748 (select (store (arr!16878 a!3118) i!1132 k!1914) j!142) (array!35147 (store (arr!16878 a!3118) i!1132 k!1914) (size!17242 a!3118)) mask!3119)))))

(declare-fun lt!253751 () (_ BitVec 32))

(assert (=> b!558394 (= lt!253749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253751 (select (arr!16878 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558394 (= lt!253748 (toIndex!0 (select (store (arr!16878 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558394 (= lt!253751 (toIndex!0 (select (arr!16878 a!3118) j!142) mask!3119))))

(declare-fun b!558395 () Bool)

(declare-fun res!350257 () Bool)

(assert (=> b!558395 (=> (not res!350257) (not e!321675))))

(declare-fun arrayContainsKey!0 (array!35146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558395 (= res!350257 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558396 () Bool)

(declare-fun res!350251 () Bool)

(assert (=> b!558396 (=> (not res!350251) (not e!321675))))

(assert (=> b!558396 (= res!350251 (validKeyInArray!0 (select (arr!16878 a!3118) j!142)))))

(declare-fun b!558397 () Bool)

(assert (=> b!558397 (= e!321671 e!321672)))

(declare-fun res!350255 () Bool)

(assert (=> b!558397 (=> res!350255 e!321672)))

(assert (=> b!558397 (= res!350255 (or (undefined!6139 lt!253749) (not (is-Intermediate!5327 lt!253749)) (= (select (arr!16878 a!3118) (index!23537 lt!253749)) (select (arr!16878 a!3118) j!142)) (= (select (arr!16878 a!3118) (index!23537 lt!253749)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558398 () Bool)

(declare-fun res!350260 () Bool)

(assert (=> b!558398 (=> (not res!350260) (not e!321673))))

(assert (=> b!558398 (= res!350260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51092 res!350253) b!558393))

(assert (= (and b!558393 res!350252) b!558396))

(assert (= (and b!558396 res!350251) b!558388))

(assert (= (and b!558388 res!350261) b!558395))

(assert (= (and b!558395 res!350257) b!558390))

(assert (= (and b!558390 res!350254) b!558398))

(assert (= (and b!558398 res!350260) b!558391))

(assert (= (and b!558391 res!350256) b!558394))

(assert (= (and b!558394 res!350258) b!558389))

(assert (= (and b!558389 res!350259) b!558397))

(assert (= (and b!558397 (not res!350255)) b!558392))

(declare-fun m!536355 () Bool)

(assert (=> start!51092 m!536355))

(declare-fun m!536357 () Bool)

(assert (=> start!51092 m!536357))

(declare-fun m!536359 () Bool)

(assert (=> b!558391 m!536359))

(declare-fun m!536361 () Bool)

(assert (=> b!558392 m!536361))

(assert (=> b!558392 m!536361))

(declare-fun m!536363 () Bool)

(assert (=> b!558392 m!536363))

(declare-fun m!536365 () Bool)

(assert (=> b!558397 m!536365))

(assert (=> b!558397 m!536361))

(assert (=> b!558396 m!536361))

(assert (=> b!558396 m!536361))

(declare-fun m!536367 () Bool)

(assert (=> b!558396 m!536367))

(declare-fun m!536369 () Bool)

(assert (=> b!558395 m!536369))

(assert (=> b!558394 m!536361))

(declare-fun m!536371 () Bool)

(assert (=> b!558394 m!536371))

(assert (=> b!558394 m!536361))

(declare-fun m!536373 () Bool)

(assert (=> b!558394 m!536373))

(declare-fun m!536375 () Bool)

(assert (=> b!558394 m!536375))

(assert (=> b!558394 m!536373))

(declare-fun m!536377 () Bool)

(assert (=> b!558394 m!536377))

(assert (=> b!558394 m!536361))

(declare-fun m!536379 () Bool)

(assert (=> b!558394 m!536379))

(assert (=> b!558394 m!536373))

(declare-fun m!536381 () Bool)

(assert (=> b!558394 m!536381))

(assert (=> b!558389 m!536361))

(declare-fun m!536383 () Bool)

(assert (=> b!558389 m!536383))

(declare-fun m!536385 () Bool)

(assert (=> b!558389 m!536385))

(assert (=> b!558389 m!536365))

(assert (=> b!558389 m!536361))

(declare-fun m!536387 () Bool)

(assert (=> b!558389 m!536387))

(declare-fun m!536389 () Bool)

(assert (=> b!558388 m!536389))

(declare-fun m!536391 () Bool)

(assert (=> b!558390 m!536391))

(declare-fun m!536393 () Bool)

(assert (=> b!558398 m!536393))

(push 1)

