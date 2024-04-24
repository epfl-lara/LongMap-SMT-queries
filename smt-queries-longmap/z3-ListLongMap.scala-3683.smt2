; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50760 () Bool)

(assert start!50760)

(declare-fun b!554831 () Bool)

(declare-fun res!347144 () Bool)

(declare-fun e!319907 () Bool)

(assert (=> b!554831 (=> (not res!347144) (not e!319907))))

(declare-datatypes ((array!34932 0))(
  ( (array!34933 (arr!16774 (Array (_ BitVec 32) (_ BitVec 64))) (size!17138 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34932)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554831 (= res!347144 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554832 () Bool)

(declare-fun res!347141 () Bool)

(assert (=> b!554832 (=> (not res!347141) (not e!319907))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554832 (= res!347141 (validKeyInArray!0 (select (arr!16774 a!3118) j!142)))))

(declare-fun b!554833 () Bool)

(declare-fun e!319908 () Bool)

(assert (=> b!554833 (= e!319908 (not true))))

(declare-datatypes ((SeekEntryResult!5179 0))(
  ( (MissingZero!5179 (index!22943 (_ BitVec 32))) (Found!5179 (index!22944 (_ BitVec 32))) (Intermediate!5179 (undefined!5991 Bool) (index!22945 (_ BitVec 32)) (x!52008 (_ BitVec 32))) (Undefined!5179) (MissingVacant!5179 (index!22946 (_ BitVec 32))) )
))
(declare-fun lt!251987 () SeekEntryResult!5179)

(declare-fun lt!251991 () SeekEntryResult!5179)

(get-info :version)

(assert (=> b!554833 (and (= lt!251991 (Found!5179 j!142)) (or (undefined!5991 lt!251987) (not ((_ is Intermediate!5179) lt!251987)) (= (select (arr!16774 a!3118) (index!22945 lt!251987)) (select (arr!16774 a!3118) j!142)) (not (= (select (arr!16774 a!3118) (index!22945 lt!251987)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251991 (MissingZero!5179 (index!22945 lt!251987)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34932 (_ BitVec 32)) SeekEntryResult!5179)

(assert (=> b!554833 (= lt!251991 (seekEntryOrOpen!0 (select (arr!16774 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34932 (_ BitVec 32)) Bool)

(assert (=> b!554833 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17203 0))(
  ( (Unit!17204) )
))
(declare-fun lt!251992 () Unit!17203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17203)

(assert (=> b!554833 (= lt!251992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554834 () Bool)

(declare-fun e!319905 () Bool)

(assert (=> b!554834 (= e!319907 e!319905)))

(declare-fun res!347139 () Bool)

(assert (=> b!554834 (=> (not res!347139) (not e!319905))))

(declare-fun lt!251988 () SeekEntryResult!5179)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554834 (= res!347139 (or (= lt!251988 (MissingZero!5179 i!1132)) (= lt!251988 (MissingVacant!5179 i!1132))))))

(assert (=> b!554834 (= lt!251988 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554835 () Bool)

(declare-fun res!347142 () Bool)

(assert (=> b!554835 (=> (not res!347142) (not e!319907))))

(assert (=> b!554835 (= res!347142 (validKeyInArray!0 k0!1914))))

(declare-fun b!554836 () Bool)

(declare-fun res!347140 () Bool)

(assert (=> b!554836 (=> (not res!347140) (not e!319905))))

(declare-datatypes ((List!10761 0))(
  ( (Nil!10758) (Cons!10757 (h!11745 (_ BitVec 64)) (t!16981 List!10761)) )
))
(declare-fun arrayNoDuplicates!0 (array!34932 (_ BitVec 32) List!10761) Bool)

(assert (=> b!554836 (= res!347140 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10758))))

(declare-fun res!347145 () Bool)

(assert (=> start!50760 (=> (not res!347145) (not e!319907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50760 (= res!347145 (validMask!0 mask!3119))))

(assert (=> start!50760 e!319907))

(assert (=> start!50760 true))

(declare-fun array_inv!12633 (array!34932) Bool)

(assert (=> start!50760 (array_inv!12633 a!3118)))

(declare-fun b!554837 () Bool)

(declare-fun res!347143 () Bool)

(assert (=> b!554837 (=> (not res!347143) (not e!319905))))

(assert (=> b!554837 (= res!347143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554838 () Bool)

(assert (=> b!554838 (= e!319905 e!319908)))

(declare-fun res!347146 () Bool)

(assert (=> b!554838 (=> (not res!347146) (not e!319908))))

(declare-fun lt!251990 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34932 (_ BitVec 32)) SeekEntryResult!5179)

(assert (=> b!554838 (= res!347146 (= lt!251987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251990 (select (store (arr!16774 a!3118) i!1132 k0!1914) j!142) (array!34933 (store (arr!16774 a!3118) i!1132 k0!1914) (size!17138 a!3118)) mask!3119)))))

(declare-fun lt!251989 () (_ BitVec 32))

(assert (=> b!554838 (= lt!251987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251989 (select (arr!16774 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554838 (= lt!251990 (toIndex!0 (select (store (arr!16774 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554838 (= lt!251989 (toIndex!0 (select (arr!16774 a!3118) j!142) mask!3119))))

(declare-fun b!554839 () Bool)

(declare-fun res!347138 () Bool)

(assert (=> b!554839 (=> (not res!347138) (not e!319907))))

(assert (=> b!554839 (= res!347138 (and (= (size!17138 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17138 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17138 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50760 res!347145) b!554839))

(assert (= (and b!554839 res!347138) b!554832))

(assert (= (and b!554832 res!347141) b!554835))

(assert (= (and b!554835 res!347142) b!554831))

(assert (= (and b!554831 res!347144) b!554834))

(assert (= (and b!554834 res!347139) b!554837))

(assert (= (and b!554837 res!347143) b!554836))

(assert (= (and b!554836 res!347140) b!554838))

(assert (= (and b!554838 res!347146) b!554833))

(declare-fun m!532325 () Bool)

(assert (=> b!554837 m!532325))

(declare-fun m!532327 () Bool)

(assert (=> b!554838 m!532327))

(declare-fun m!532329 () Bool)

(assert (=> b!554838 m!532329))

(declare-fun m!532331 () Bool)

(assert (=> b!554838 m!532331))

(declare-fun m!532333 () Bool)

(assert (=> b!554838 m!532333))

(assert (=> b!554838 m!532331))

(assert (=> b!554838 m!532327))

(assert (=> b!554838 m!532331))

(declare-fun m!532335 () Bool)

(assert (=> b!554838 m!532335))

(declare-fun m!532337 () Bool)

(assert (=> b!554838 m!532337))

(assert (=> b!554838 m!532327))

(declare-fun m!532339 () Bool)

(assert (=> b!554838 m!532339))

(assert (=> b!554832 m!532331))

(assert (=> b!554832 m!532331))

(declare-fun m!532341 () Bool)

(assert (=> b!554832 m!532341))

(declare-fun m!532343 () Bool)

(assert (=> b!554835 m!532343))

(declare-fun m!532345 () Bool)

(assert (=> b!554833 m!532345))

(assert (=> b!554833 m!532331))

(declare-fun m!532347 () Bool)

(assert (=> b!554833 m!532347))

(declare-fun m!532349 () Bool)

(assert (=> b!554833 m!532349))

(assert (=> b!554833 m!532331))

(declare-fun m!532351 () Bool)

(assert (=> b!554833 m!532351))

(declare-fun m!532353 () Bool)

(assert (=> b!554834 m!532353))

(declare-fun m!532355 () Bool)

(assert (=> start!50760 m!532355))

(declare-fun m!532357 () Bool)

(assert (=> start!50760 m!532357))

(declare-fun m!532359 () Bool)

(assert (=> b!554836 m!532359))

(declare-fun m!532361 () Bool)

(assert (=> b!554831 m!532361))

(check-sat (not b!554835) (not start!50760) (not b!554838) (not b!554832) (not b!554834) (not b!554837) (not b!554836) (not b!554833) (not b!554831))
(check-sat)
