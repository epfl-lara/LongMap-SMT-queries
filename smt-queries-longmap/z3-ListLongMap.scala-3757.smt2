; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51538 () Bool)

(assert start!51538)

(declare-fun b!563920 () Bool)

(declare-fun res!355073 () Bool)

(declare-fun e!324905 () Bool)

(assert (=> b!563920 (=> (not res!355073) (not e!324905))))

(declare-datatypes ((array!35403 0))(
  ( (array!35404 (arr!17002 (Array (_ BitVec 32) (_ BitVec 64))) (size!17366 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35403)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563920 (= res!355073 (validKeyInArray!0 (select (arr!17002 a!3118) j!142)))))

(declare-fun b!563921 () Bool)

(declare-fun e!324906 () Bool)

(declare-fun e!324901 () Bool)

(assert (=> b!563921 (= e!324906 (not e!324901))))

(declare-fun res!355082 () Bool)

(assert (=> b!563921 (=> res!355082 e!324901)))

(declare-fun lt!257385 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5451 0))(
  ( (MissingZero!5451 (index!24031 (_ BitVec 32))) (Found!5451 (index!24032 (_ BitVec 32))) (Intermediate!5451 (undefined!6263 Bool) (index!24033 (_ BitVec 32)) (x!52914 (_ BitVec 32))) (Undefined!5451) (MissingVacant!5451 (index!24034 (_ BitVec 32))) )
))
(declare-fun lt!257386 () SeekEntryResult!5451)

(assert (=> b!563921 (= res!355082 (or (and (not lt!257385) (undefined!6263 lt!257386)) (and (not lt!257385) (not (undefined!6263 lt!257386))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!563921 (= lt!257385 (not ((_ is Intermediate!5451) lt!257386)))))

(declare-fun e!324902 () Bool)

(assert (=> b!563921 e!324902))

(declare-fun res!355081 () Bool)

(assert (=> b!563921 (=> (not res!355081) (not e!324902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35403 (_ BitVec 32)) Bool)

(assert (=> b!563921 (= res!355081 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17676 0))(
  ( (Unit!17677) )
))
(declare-fun lt!257389 () Unit!17676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17676)

(assert (=> b!563921 (= lt!257389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563922 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35403 (_ BitVec 32)) SeekEntryResult!5451)

(assert (=> b!563922 (= e!324902 (= (seekEntryOrOpen!0 (select (arr!17002 a!3118) j!142) a!3118 mask!3119) (Found!5451 j!142)))))

(declare-fun res!355075 () Bool)

(assert (=> start!51538 (=> (not res!355075) (not e!324905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51538 (= res!355075 (validMask!0 mask!3119))))

(assert (=> start!51538 e!324905))

(assert (=> start!51538 true))

(declare-fun array_inv!12798 (array!35403) Bool)

(assert (=> start!51538 (array_inv!12798 a!3118)))

(declare-fun b!563923 () Bool)

(declare-fun e!324903 () Bool)

(assert (=> b!563923 (= e!324905 e!324903)))

(declare-fun res!355074 () Bool)

(assert (=> b!563923 (=> (not res!355074) (not e!324903))))

(declare-fun lt!257388 () SeekEntryResult!5451)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563923 (= res!355074 (or (= lt!257388 (MissingZero!5451 i!1132)) (= lt!257388 (MissingVacant!5451 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!563923 (= lt!257388 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563924 () Bool)

(declare-fun res!355079 () Bool)

(assert (=> b!563924 (=> (not res!355079) (not e!324903))))

(assert (=> b!563924 (= res!355079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563925 () Bool)

(declare-fun res!355077 () Bool)

(assert (=> b!563925 (=> (not res!355077) (not e!324903))))

(declare-datatypes ((List!11082 0))(
  ( (Nil!11079) (Cons!11078 (h!12081 (_ BitVec 64)) (t!17310 List!11082)) )
))
(declare-fun arrayNoDuplicates!0 (array!35403 (_ BitVec 32) List!11082) Bool)

(assert (=> b!563925 (= res!355077 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11079))))

(declare-fun b!563926 () Bool)

(declare-fun res!355076 () Bool)

(assert (=> b!563926 (=> (not res!355076) (not e!324905))))

(assert (=> b!563926 (= res!355076 (validKeyInArray!0 k0!1914))))

(declare-fun b!563927 () Bool)

(declare-fun res!355078 () Bool)

(assert (=> b!563927 (=> (not res!355078) (not e!324905))))

(assert (=> b!563927 (= res!355078 (and (= (size!17366 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17366 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17366 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563928 () Bool)

(assert (=> b!563928 (= e!324901 (validKeyInArray!0 (select (store (arr!17002 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!563929 () Bool)

(declare-fun res!355080 () Bool)

(assert (=> b!563929 (=> (not res!355080) (not e!324905))))

(declare-fun arrayContainsKey!0 (array!35403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563929 (= res!355080 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563930 () Bool)

(assert (=> b!563930 (= e!324903 e!324906)))

(declare-fun res!355072 () Bool)

(assert (=> b!563930 (=> (not res!355072) (not e!324906))))

(declare-fun lt!257387 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35403 (_ BitVec 32)) SeekEntryResult!5451)

(assert (=> b!563930 (= res!355072 (= lt!257386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257387 (select (store (arr!17002 a!3118) i!1132 k0!1914) j!142) (array!35404 (store (arr!17002 a!3118) i!1132 k0!1914) (size!17366 a!3118)) mask!3119)))))

(declare-fun lt!257384 () (_ BitVec 32))

(assert (=> b!563930 (= lt!257386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257384 (select (arr!17002 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563930 (= lt!257387 (toIndex!0 (select (store (arr!17002 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563930 (= lt!257384 (toIndex!0 (select (arr!17002 a!3118) j!142) mask!3119))))

(assert (= (and start!51538 res!355075) b!563927))

(assert (= (and b!563927 res!355078) b!563920))

(assert (= (and b!563920 res!355073) b!563926))

(assert (= (and b!563926 res!355076) b!563929))

(assert (= (and b!563929 res!355080) b!563923))

(assert (= (and b!563923 res!355074) b!563924))

(assert (= (and b!563924 res!355079) b!563925))

(assert (= (and b!563925 res!355077) b!563930))

(assert (= (and b!563930 res!355072) b!563921))

(assert (= (and b!563921 res!355081) b!563922))

(assert (= (and b!563921 (not res!355082)) b!563928))

(declare-fun m!542357 () Bool)

(assert (=> b!563920 m!542357))

(assert (=> b!563920 m!542357))

(declare-fun m!542359 () Bool)

(assert (=> b!563920 m!542359))

(declare-fun m!542361 () Bool)

(assert (=> b!563924 m!542361))

(declare-fun m!542363 () Bool)

(assert (=> b!563929 m!542363))

(declare-fun m!542365 () Bool)

(assert (=> b!563928 m!542365))

(declare-fun m!542367 () Bool)

(assert (=> b!563928 m!542367))

(assert (=> b!563928 m!542367))

(declare-fun m!542369 () Bool)

(assert (=> b!563928 m!542369))

(declare-fun m!542371 () Bool)

(assert (=> b!563926 m!542371))

(assert (=> b!563922 m!542357))

(assert (=> b!563922 m!542357))

(declare-fun m!542373 () Bool)

(assert (=> b!563922 m!542373))

(declare-fun m!542375 () Bool)

(assert (=> b!563921 m!542375))

(declare-fun m!542377 () Bool)

(assert (=> b!563921 m!542377))

(declare-fun m!542379 () Bool)

(assert (=> b!563925 m!542379))

(assert (=> b!563930 m!542357))

(declare-fun m!542381 () Bool)

(assert (=> b!563930 m!542381))

(assert (=> b!563930 m!542367))

(declare-fun m!542383 () Bool)

(assert (=> b!563930 m!542383))

(assert (=> b!563930 m!542357))

(assert (=> b!563930 m!542367))

(assert (=> b!563930 m!542365))

(assert (=> b!563930 m!542357))

(declare-fun m!542385 () Bool)

(assert (=> b!563930 m!542385))

(assert (=> b!563930 m!542367))

(declare-fun m!542387 () Bool)

(assert (=> b!563930 m!542387))

(declare-fun m!542389 () Bool)

(assert (=> start!51538 m!542389))

(declare-fun m!542391 () Bool)

(assert (=> start!51538 m!542391))

(declare-fun m!542393 () Bool)

(assert (=> b!563923 m!542393))

(check-sat (not b!563924) (not b!563921) (not b!563928) (not b!563926) (not b!563920) (not b!563923) (not b!563929) (not b!563922) (not b!563925) (not start!51538) (not b!563930))
(check-sat)
