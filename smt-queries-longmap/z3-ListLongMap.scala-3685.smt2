; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50772 () Bool)

(assert start!50772)

(declare-fun b!554994 () Bool)

(declare-fun res!347304 () Bool)

(declare-fun e!319977 () Bool)

(assert (=> b!554994 (=> (not res!347304) (not e!319977))))

(declare-datatypes ((array!34944 0))(
  ( (array!34945 (arr!16780 (Array (_ BitVec 32) (_ BitVec 64))) (size!17144 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34944)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554994 (= res!347304 (validKeyInArray!0 (select (arr!16780 a!3118) j!142)))))

(declare-fun b!554995 () Bool)

(declare-fun res!347301 () Bool)

(assert (=> b!554995 (=> (not res!347301) (not e!319977))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!554995 (= res!347301 (validKeyInArray!0 k0!1914))))

(declare-fun b!554996 () Bool)

(declare-fun e!319978 () Bool)

(assert (=> b!554996 (= e!319977 e!319978)))

(declare-fun res!347308 () Bool)

(assert (=> b!554996 (=> (not res!347308) (not e!319978))))

(declare-datatypes ((SeekEntryResult!5185 0))(
  ( (MissingZero!5185 (index!22967 (_ BitVec 32))) (Found!5185 (index!22968 (_ BitVec 32))) (Intermediate!5185 (undefined!5997 Bool) (index!22969 (_ BitVec 32)) (x!52030 (_ BitVec 32))) (Undefined!5185) (MissingVacant!5185 (index!22970 (_ BitVec 32))) )
))
(declare-fun lt!252095 () SeekEntryResult!5185)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554996 (= res!347308 (or (= lt!252095 (MissingZero!5185 i!1132)) (= lt!252095 (MissingVacant!5185 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34944 (_ BitVec 32)) SeekEntryResult!5185)

(assert (=> b!554996 (= lt!252095 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554997 () Bool)

(declare-fun res!347300 () Bool)

(assert (=> b!554997 (=> (not res!347300) (not e!319977))))

(assert (=> b!554997 (= res!347300 (and (= (size!17144 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17144 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17144 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554998 () Bool)

(declare-fun res!347306 () Bool)

(assert (=> b!554998 (=> (not res!347306) (not e!319978))))

(declare-datatypes ((List!10767 0))(
  ( (Nil!10764) (Cons!10763 (h!11751 (_ BitVec 64)) (t!16987 List!10767)) )
))
(declare-fun arrayNoDuplicates!0 (array!34944 (_ BitVec 32) List!10767) Bool)

(assert (=> b!554998 (= res!347306 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10764))))

(declare-fun b!554999 () Bool)

(declare-fun e!319979 () Bool)

(assert (=> b!554999 (= e!319978 e!319979)))

(declare-fun res!347302 () Bool)

(assert (=> b!554999 (=> (not res!347302) (not e!319979))))

(declare-fun lt!252099 () (_ BitVec 32))

(declare-fun lt!252096 () SeekEntryResult!5185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34944 (_ BitVec 32)) SeekEntryResult!5185)

(assert (=> b!554999 (= res!347302 (= lt!252096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252099 (select (store (arr!16780 a!3118) i!1132 k0!1914) j!142) (array!34945 (store (arr!16780 a!3118) i!1132 k0!1914) (size!17144 a!3118)) mask!3119)))))

(declare-fun lt!252098 () (_ BitVec 32))

(assert (=> b!554999 (= lt!252096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252098 (select (arr!16780 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554999 (= lt!252099 (toIndex!0 (select (store (arr!16780 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554999 (= lt!252098 (toIndex!0 (select (arr!16780 a!3118) j!142) mask!3119))))

(declare-fun b!555000 () Bool)

(declare-fun res!347303 () Bool)

(assert (=> b!555000 (=> (not res!347303) (not e!319977))))

(declare-fun arrayContainsKey!0 (array!34944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555000 (= res!347303 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555001 () Bool)

(get-info :version)

(assert (=> b!555001 (= e!319979 (not (or (undefined!5997 lt!252096) (not ((_ is Intermediate!5185) lt!252096)) (= (select (arr!16780 a!3118) (index!22969 lt!252096)) (select (arr!16780 a!3118) j!142)) (not (= (select (arr!16780 a!3118) (index!22969 lt!252096)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17144 a!3118)))))))

(declare-fun lt!252100 () SeekEntryResult!5185)

(assert (=> b!555001 (and (= lt!252100 (Found!5185 j!142)) (or (undefined!5997 lt!252096) (not ((_ is Intermediate!5185) lt!252096)) (= (select (arr!16780 a!3118) (index!22969 lt!252096)) (select (arr!16780 a!3118) j!142)) (not (= (select (arr!16780 a!3118) (index!22969 lt!252096)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252100 (MissingZero!5185 (index!22969 lt!252096)))))))

(assert (=> b!555001 (= lt!252100 (seekEntryOrOpen!0 (select (arr!16780 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34944 (_ BitVec 32)) Bool)

(assert (=> b!555001 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17215 0))(
  ( (Unit!17216) )
))
(declare-fun lt!252097 () Unit!17215)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17215)

(assert (=> b!555001 (= lt!252097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554993 () Bool)

(declare-fun res!347307 () Bool)

(assert (=> b!554993 (=> (not res!347307) (not e!319978))))

(assert (=> b!554993 (= res!347307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347305 () Bool)

(assert (=> start!50772 (=> (not res!347305) (not e!319977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50772 (= res!347305 (validMask!0 mask!3119))))

(assert (=> start!50772 e!319977))

(assert (=> start!50772 true))

(declare-fun array_inv!12639 (array!34944) Bool)

(assert (=> start!50772 (array_inv!12639 a!3118)))

(assert (= (and start!50772 res!347305) b!554997))

(assert (= (and b!554997 res!347300) b!554994))

(assert (= (and b!554994 res!347304) b!554995))

(assert (= (and b!554995 res!347301) b!555000))

(assert (= (and b!555000 res!347303) b!554996))

(assert (= (and b!554996 res!347308) b!554993))

(assert (= (and b!554993 res!347307) b!554998))

(assert (= (and b!554998 res!347306) b!554999))

(assert (= (and b!554999 res!347302) b!555001))

(declare-fun m!532553 () Bool)

(assert (=> b!554999 m!532553))

(declare-fun m!532555 () Bool)

(assert (=> b!554999 m!532555))

(assert (=> b!554999 m!532553))

(assert (=> b!554999 m!532553))

(declare-fun m!532557 () Bool)

(assert (=> b!554999 m!532557))

(declare-fun m!532559 () Bool)

(assert (=> b!554999 m!532559))

(assert (=> b!554999 m!532559))

(declare-fun m!532561 () Bool)

(assert (=> b!554999 m!532561))

(declare-fun m!532563 () Bool)

(assert (=> b!554999 m!532563))

(assert (=> b!554999 m!532559))

(declare-fun m!532565 () Bool)

(assert (=> b!554999 m!532565))

(declare-fun m!532567 () Bool)

(assert (=> b!554993 m!532567))

(declare-fun m!532569 () Bool)

(assert (=> b!554998 m!532569))

(declare-fun m!532571 () Bool)

(assert (=> b!554995 m!532571))

(declare-fun m!532573 () Bool)

(assert (=> b!554996 m!532573))

(declare-fun m!532575 () Bool)

(assert (=> b!555001 m!532575))

(declare-fun m!532577 () Bool)

(assert (=> b!555001 m!532577))

(assert (=> b!555001 m!532553))

(declare-fun m!532579 () Bool)

(assert (=> b!555001 m!532579))

(declare-fun m!532581 () Bool)

(assert (=> b!555001 m!532581))

(assert (=> b!555001 m!532553))

(declare-fun m!532583 () Bool)

(assert (=> b!555000 m!532583))

(declare-fun m!532585 () Bool)

(assert (=> start!50772 m!532585))

(declare-fun m!532587 () Bool)

(assert (=> start!50772 m!532587))

(assert (=> b!554994 m!532553))

(assert (=> b!554994 m!532553))

(declare-fun m!532589 () Bool)

(assert (=> b!554994 m!532589))

(check-sat (not b!554998) (not b!554995) (not b!554996) (not b!554999) (not b!555001) (not b!555000) (not start!50772) (not b!554993) (not b!554994))
(check-sat)
