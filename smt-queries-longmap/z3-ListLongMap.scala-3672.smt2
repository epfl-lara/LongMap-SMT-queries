; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50636 () Bool)

(assert start!50636)

(declare-fun b!553372 () Bool)

(declare-fun res!345928 () Bool)

(declare-fun e!319171 () Bool)

(assert (=> b!553372 (=> (not res!345928) (not e!319171))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34870 0))(
  ( (array!34871 (arr!16745 (Array (_ BitVec 32) (_ BitVec 64))) (size!17110 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34870)

(declare-datatypes ((SeekEntryResult!5191 0))(
  ( (MissingZero!5191 (index!22991 (_ BitVec 32))) (Found!5191 (index!22992 (_ BitVec 32))) (Intermediate!5191 (undefined!6003 Bool) (index!22993 (_ BitVec 32)) (x!51924 (_ BitVec 32))) (Undefined!5191) (MissingVacant!5191 (index!22994 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34870 (_ BitVec 32)) SeekEntryResult!5191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553372 (= res!345928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16745 a!3118) j!142) mask!3119) (select (arr!16745 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16745 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16745 a!3118) i!1132 k0!1914) j!142) (array!34871 (store (arr!16745 a!3118) i!1132 k0!1914) (size!17110 a!3118)) mask!3119)))))

(declare-fun b!553373 () Bool)

(declare-fun e!319173 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34870 (_ BitVec 32)) SeekEntryResult!5191)

(assert (=> b!553373 (= e!319173 (= (seekEntryOrOpen!0 (select (arr!16745 a!3118) j!142) a!3118 mask!3119) (Found!5191 j!142)))))

(declare-fun b!553374 () Bool)

(declare-fun res!345935 () Bool)

(declare-fun e!319172 () Bool)

(assert (=> b!553374 (=> (not res!345935) (not e!319172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553374 (= res!345935 (validKeyInArray!0 k0!1914))))

(declare-fun b!553375 () Bool)

(declare-fun res!345927 () Bool)

(assert (=> b!553375 (=> (not res!345927) (not e!319172))))

(assert (=> b!553375 (= res!345927 (validKeyInArray!0 (select (arr!16745 a!3118) j!142)))))

(declare-fun res!345926 () Bool)

(assert (=> start!50636 (=> (not res!345926) (not e!319172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50636 (= res!345926 (validMask!0 mask!3119))))

(assert (=> start!50636 e!319172))

(assert (=> start!50636 true))

(declare-fun array_inv!12628 (array!34870) Bool)

(assert (=> start!50636 (array_inv!12628 a!3118)))

(declare-fun b!553376 () Bool)

(declare-fun res!345934 () Bool)

(assert (=> b!553376 (=> (not res!345934) (not e!319171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34870 (_ BitVec 32)) Bool)

(assert (=> b!553376 (= res!345934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553377 () Bool)

(declare-fun res!345931 () Bool)

(assert (=> b!553377 (=> (not res!345931) (not e!319172))))

(declare-fun arrayContainsKey!0 (array!34870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553377 (= res!345931 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553378 () Bool)

(assert (=> b!553378 (= e!319172 e!319171)))

(declare-fun res!345930 () Bool)

(assert (=> b!553378 (=> (not res!345930) (not e!319171))))

(declare-fun lt!251320 () SeekEntryResult!5191)

(assert (=> b!553378 (= res!345930 (or (= lt!251320 (MissingZero!5191 i!1132)) (= lt!251320 (MissingVacant!5191 i!1132))))))

(assert (=> b!553378 (= lt!251320 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553379 () Bool)

(declare-fun res!345932 () Bool)

(assert (=> b!553379 (=> (not res!345932) (not e!319172))))

(assert (=> b!553379 (= res!345932 (and (= (size!17110 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17110 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17110 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553380 () Bool)

(declare-fun res!345933 () Bool)

(assert (=> b!553380 (=> (not res!345933) (not e!319171))))

(declare-datatypes ((List!10864 0))(
  ( (Nil!10861) (Cons!10860 (h!11845 (_ BitVec 64)) (t!17083 List!10864)) )
))
(declare-fun arrayNoDuplicates!0 (array!34870 (_ BitVec 32) List!10864) Bool)

(assert (=> b!553380 (= res!345933 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10861))))

(declare-fun b!553381 () Bool)

(assert (=> b!553381 (= e!319171 (not true))))

(assert (=> b!553381 e!319173))

(declare-fun res!345929 () Bool)

(assert (=> b!553381 (=> (not res!345929) (not e!319173))))

(assert (=> b!553381 (= res!345929 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17142 0))(
  ( (Unit!17143) )
))
(declare-fun lt!251319 () Unit!17142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> b!553381 (= lt!251319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50636 res!345926) b!553379))

(assert (= (and b!553379 res!345932) b!553375))

(assert (= (and b!553375 res!345927) b!553374))

(assert (= (and b!553374 res!345935) b!553377))

(assert (= (and b!553377 res!345931) b!553378))

(assert (= (and b!553378 res!345930) b!553376))

(assert (= (and b!553376 res!345934) b!553380))

(assert (= (and b!553380 res!345933) b!553372))

(assert (= (and b!553372 res!345928) b!553381))

(assert (= (and b!553381 res!345929) b!553373))

(declare-fun m!529997 () Bool)

(assert (=> b!553376 m!529997))

(declare-fun m!529999 () Bool)

(assert (=> b!553381 m!529999))

(declare-fun m!530001 () Bool)

(assert (=> b!553381 m!530001))

(declare-fun m!530003 () Bool)

(assert (=> b!553372 m!530003))

(declare-fun m!530005 () Bool)

(assert (=> b!553372 m!530005))

(assert (=> b!553372 m!530003))

(declare-fun m!530007 () Bool)

(assert (=> b!553372 m!530007))

(declare-fun m!530009 () Bool)

(assert (=> b!553372 m!530009))

(assert (=> b!553372 m!530007))

(declare-fun m!530011 () Bool)

(assert (=> b!553372 m!530011))

(assert (=> b!553372 m!530005))

(assert (=> b!553372 m!530003))

(declare-fun m!530013 () Bool)

(assert (=> b!553372 m!530013))

(declare-fun m!530015 () Bool)

(assert (=> b!553372 m!530015))

(assert (=> b!553372 m!530007))

(assert (=> b!553372 m!530009))

(assert (=> b!553373 m!530003))

(assert (=> b!553373 m!530003))

(declare-fun m!530017 () Bool)

(assert (=> b!553373 m!530017))

(declare-fun m!530019 () Bool)

(assert (=> start!50636 m!530019))

(declare-fun m!530021 () Bool)

(assert (=> start!50636 m!530021))

(declare-fun m!530023 () Bool)

(assert (=> b!553377 m!530023))

(declare-fun m!530025 () Bool)

(assert (=> b!553374 m!530025))

(declare-fun m!530027 () Bool)

(assert (=> b!553380 m!530027))

(declare-fun m!530029 () Bool)

(assert (=> b!553378 m!530029))

(assert (=> b!553375 m!530003))

(assert (=> b!553375 m!530003))

(declare-fun m!530031 () Bool)

(assert (=> b!553375 m!530031))

(check-sat (not b!553381) (not b!553372) (not b!553375) (not b!553373) (not b!553376) (not b!553378) (not b!553377) (not start!50636) (not b!553380) (not b!553374))
(check-sat)
