; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51378 () Bool)

(assert start!51378)

(declare-fun b!560365 () Bool)

(declare-fun e!322872 () Bool)

(assert (=> b!560365 (= e!322872 (not true))))

(declare-fun e!322865 () Bool)

(assert (=> b!560365 e!322865))

(declare-fun res!351423 () Bool)

(assert (=> b!560365 (=> (not res!351423) (not e!322865))))

(declare-datatypes ((SeekEntryResult!5299 0))(
  ( (MissingZero!5299 (index!23423 (_ BitVec 32))) (Found!5299 (index!23424 (_ BitVec 32))) (Intermediate!5299 (undefined!6111 Bool) (index!23425 (_ BitVec 32)) (x!52493 (_ BitVec 32))) (Undefined!5299) (MissingVacant!5299 (index!23426 (_ BitVec 32))) )
))
(declare-fun lt!254739 () SeekEntryResult!5299)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560365 (= res!351423 (= lt!254739 (Found!5299 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35190 0))(
  ( (array!35191 (arr!16894 (Array (_ BitVec 32) (_ BitVec 64))) (size!17258 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35190)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35190 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!560365 (= lt!254739 (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35190 (_ BitVec 32)) Bool)

(assert (=> b!560365 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17443 0))(
  ( (Unit!17444) )
))
(declare-fun lt!254744 () Unit!17443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17443)

(assert (=> b!560365 (= lt!254744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560366 () Bool)

(declare-fun e!322866 () Bool)

(declare-fun e!322870 () Bool)

(assert (=> b!560366 (= e!322866 e!322870)))

(declare-fun res!351417 () Bool)

(assert (=> b!560366 (=> (not res!351417) (not e!322870))))

(declare-fun lt!254746 () SeekEntryResult!5299)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560366 (= res!351417 (or (= lt!254746 (MissingZero!5299 i!1132)) (= lt!254746 (MissingVacant!5299 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!560366 (= lt!254746 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560367 () Bool)

(declare-fun res!351413 () Bool)

(assert (=> b!560367 (=> (not res!351413) (not e!322866))))

(declare-fun arrayContainsKey!0 (array!35190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560367 (= res!351413 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560368 () Bool)

(declare-fun res!351415 () Bool)

(assert (=> b!560368 (=> (not res!351415) (not e!322870))))

(declare-datatypes ((List!10881 0))(
  ( (Nil!10878) (Cons!10877 (h!11883 (_ BitVec 64)) (t!17101 List!10881)) )
))
(declare-fun arrayNoDuplicates!0 (array!35190 (_ BitVec 32) List!10881) Bool)

(assert (=> b!560368 (= res!351415 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10878))))

(declare-fun b!560369 () Bool)

(declare-fun res!351421 () Bool)

(assert (=> b!560369 (=> (not res!351421) (not e!322866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560369 (= res!351421 (validKeyInArray!0 (select (arr!16894 a!3118) j!142)))))

(declare-fun res!351414 () Bool)

(assert (=> start!51378 (=> (not res!351414) (not e!322866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51378 (= res!351414 (validMask!0 mask!3119))))

(assert (=> start!51378 e!322866))

(assert (=> start!51378 true))

(declare-fun array_inv!12753 (array!35190) Bool)

(assert (=> start!51378 (array_inv!12753 a!3118)))

(declare-fun b!560370 () Bool)

(declare-fun res!351418 () Bool)

(assert (=> b!560370 (=> (not res!351418) (not e!322866))))

(assert (=> b!560370 (= res!351418 (validKeyInArray!0 k0!1914))))

(declare-fun e!322871 () Bool)

(declare-fun b!560371 () Bool)

(declare-fun lt!254743 () (_ BitVec 64))

(declare-fun lt!254740 () array!35190)

(declare-fun lt!254745 () SeekEntryResult!5299)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35190 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!560371 (= e!322871 (= (seekEntryOrOpen!0 lt!254743 lt!254740 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52493 lt!254745) (index!23425 lt!254745) (index!23425 lt!254745) lt!254743 lt!254740 mask!3119)))))

(declare-fun b!560372 () Bool)

(assert (=> b!560372 (= e!322870 e!322872)))

(declare-fun res!351416 () Bool)

(assert (=> b!560372 (=> (not res!351416) (not e!322872))))

(declare-fun lt!254742 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35190 (_ BitVec 32)) SeekEntryResult!5299)

(assert (=> b!560372 (= res!351416 (= lt!254745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254742 lt!254743 lt!254740 mask!3119)))))

(declare-fun lt!254741 () (_ BitVec 32))

(assert (=> b!560372 (= lt!254745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254741 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560372 (= lt!254742 (toIndex!0 lt!254743 mask!3119))))

(assert (=> b!560372 (= lt!254743 (select (store (arr!16894 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560372 (= lt!254741 (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119))))

(assert (=> b!560372 (= lt!254740 (array!35191 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)))))

(declare-fun b!560373 () Bool)

(declare-fun e!322867 () Bool)

(declare-fun e!322869 () Bool)

(assert (=> b!560373 (= e!322867 e!322869)))

(declare-fun res!351412 () Bool)

(assert (=> b!560373 (=> res!351412 e!322869)))

(declare-fun lt!254738 () (_ BitVec 64))

(assert (=> b!560373 (= res!351412 (or (= lt!254738 (select (arr!16894 a!3118) j!142)) (= lt!254738 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560373 (= lt!254738 (select (arr!16894 a!3118) (index!23425 lt!254745)))))

(declare-fun b!560374 () Bool)

(assert (=> b!560374 (= e!322865 e!322867)))

(declare-fun res!351424 () Bool)

(assert (=> b!560374 (=> res!351424 e!322867)))

(get-info :version)

(assert (=> b!560374 (= res!351424 (or (undefined!6111 lt!254745) (not ((_ is Intermediate!5299) lt!254745))))))

(declare-fun b!560375 () Bool)

(declare-fun res!351422 () Bool)

(assert (=> b!560375 (=> (not res!351422) (not e!322866))))

(assert (=> b!560375 (= res!351422 (and (= (size!17258 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17258 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17258 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560376 () Bool)

(declare-fun res!351419 () Bool)

(assert (=> b!560376 (=> (not res!351419) (not e!322870))))

(assert (=> b!560376 (= res!351419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560377 () Bool)

(assert (=> b!560377 (= e!322869 e!322871)))

(declare-fun res!351420 () Bool)

(assert (=> b!560377 (=> (not res!351420) (not e!322871))))

(assert (=> b!560377 (= res!351420 (= lt!254739 (seekKeyOrZeroReturnVacant!0 (x!52493 lt!254745) (index!23425 lt!254745) (index!23425 lt!254745) (select (arr!16894 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51378 res!351414) b!560375))

(assert (= (and b!560375 res!351422) b!560369))

(assert (= (and b!560369 res!351421) b!560370))

(assert (= (and b!560370 res!351418) b!560367))

(assert (= (and b!560367 res!351413) b!560366))

(assert (= (and b!560366 res!351417) b!560376))

(assert (= (and b!560376 res!351419) b!560368))

(assert (= (and b!560368 res!351415) b!560372))

(assert (= (and b!560372 res!351416) b!560365))

(assert (= (and b!560365 res!351423) b!560374))

(assert (= (and b!560374 (not res!351424)) b!560373))

(assert (= (and b!560373 (not res!351412)) b!560377))

(assert (= (and b!560377 res!351420) b!560371))

(declare-fun m!538235 () Bool)

(assert (=> b!560366 m!538235))

(declare-fun m!538237 () Bool)

(assert (=> b!560370 m!538237))

(declare-fun m!538239 () Bool)

(assert (=> b!560372 m!538239))

(declare-fun m!538241 () Bool)

(assert (=> b!560372 m!538241))

(declare-fun m!538243 () Bool)

(assert (=> b!560372 m!538243))

(declare-fun m!538245 () Bool)

(assert (=> b!560372 m!538245))

(declare-fun m!538247 () Bool)

(assert (=> b!560372 m!538247))

(assert (=> b!560372 m!538239))

(declare-fun m!538249 () Bool)

(assert (=> b!560372 m!538249))

(assert (=> b!560372 m!538239))

(declare-fun m!538251 () Bool)

(assert (=> b!560372 m!538251))

(declare-fun m!538253 () Bool)

(assert (=> b!560368 m!538253))

(assert (=> b!560377 m!538239))

(assert (=> b!560377 m!538239))

(declare-fun m!538255 () Bool)

(assert (=> b!560377 m!538255))

(declare-fun m!538257 () Bool)

(assert (=> b!560367 m!538257))

(declare-fun m!538259 () Bool)

(assert (=> start!51378 m!538259))

(declare-fun m!538261 () Bool)

(assert (=> start!51378 m!538261))

(declare-fun m!538263 () Bool)

(assert (=> b!560376 m!538263))

(assert (=> b!560369 m!538239))

(assert (=> b!560369 m!538239))

(declare-fun m!538265 () Bool)

(assert (=> b!560369 m!538265))

(assert (=> b!560373 m!538239))

(declare-fun m!538267 () Bool)

(assert (=> b!560373 m!538267))

(declare-fun m!538269 () Bool)

(assert (=> b!560371 m!538269))

(declare-fun m!538271 () Bool)

(assert (=> b!560371 m!538271))

(assert (=> b!560365 m!538239))

(assert (=> b!560365 m!538239))

(declare-fun m!538273 () Bool)

(assert (=> b!560365 m!538273))

(declare-fun m!538275 () Bool)

(assert (=> b!560365 m!538275))

(declare-fun m!538277 () Bool)

(assert (=> b!560365 m!538277))

(check-sat (not b!560367) (not b!560372) (not b!560371) (not b!560368) (not b!560376) (not b!560370) (not b!560369) (not b!560365) (not b!560377) (not start!51378) (not b!560366))
(check-sat)
