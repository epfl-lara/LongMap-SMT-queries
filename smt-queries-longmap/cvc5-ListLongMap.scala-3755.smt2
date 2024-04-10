; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51524 () Bool)

(assert start!51524)

(declare-fun b!563705 () Bool)

(declare-fun e!324803 () Bool)

(declare-fun e!324801 () Bool)

(assert (=> b!563705 (= e!324803 e!324801)))

(declare-fun res!354861 () Bool)

(assert (=> b!563705 (=> (not res!354861) (not e!324801))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!257296 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5444 0))(
  ( (MissingZero!5444 (index!24003 (_ BitVec 32))) (Found!5444 (index!24004 (_ BitVec 32))) (Intermediate!5444 (undefined!6256 Bool) (index!24005 (_ BitVec 32)) (x!52891 (_ BitVec 32))) (Undefined!5444) (MissingVacant!5444 (index!24006 (_ BitVec 32))) )
))
(declare-fun lt!257294 () SeekEntryResult!5444)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35389 0))(
  ( (array!35390 (arr!16995 (Array (_ BitVec 32) (_ BitVec 64))) (size!17359 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35389 (_ BitVec 32)) SeekEntryResult!5444)

(assert (=> b!563705 (= res!354861 (= lt!257294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257296 (select (store (arr!16995 a!3118) i!1132 k!1914) j!142) (array!35390 (store (arr!16995 a!3118) i!1132 k!1914) (size!17359 a!3118)) mask!3119)))))

(declare-fun lt!257299 () (_ BitVec 32))

(assert (=> b!563705 (= lt!257294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257299 (select (arr!16995 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563705 (= lt!257296 (toIndex!0 (select (store (arr!16995 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563705 (= lt!257299 (toIndex!0 (select (arr!16995 a!3118) j!142) mask!3119))))

(declare-fun b!563706 () Bool)

(declare-fun lt!257295 () Bool)

(assert (=> b!563706 (= e!324801 (not (or (and (not lt!257295) (undefined!6256 lt!257294)) (and (not lt!257295) (not (undefined!6256 lt!257294))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!563706 (= lt!257295 (not (is-Intermediate!5444 lt!257294)))))

(declare-fun e!324804 () Bool)

(assert (=> b!563706 e!324804))

(declare-fun res!354864 () Bool)

(assert (=> b!563706 (=> (not res!354864) (not e!324804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35389 (_ BitVec 32)) Bool)

(assert (=> b!563706 (= res!354864 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17662 0))(
  ( (Unit!17663) )
))
(declare-fun lt!257297 () Unit!17662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17662)

(assert (=> b!563706 (= lt!257297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!354859 () Bool)

(declare-fun e!324800 () Bool)

(assert (=> start!51524 (=> (not res!354859) (not e!324800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51524 (= res!354859 (validMask!0 mask!3119))))

(assert (=> start!51524 e!324800))

(assert (=> start!51524 true))

(declare-fun array_inv!12791 (array!35389) Bool)

(assert (=> start!51524 (array_inv!12791 a!3118)))

(declare-fun b!563707 () Bool)

(declare-fun res!354865 () Bool)

(assert (=> b!563707 (=> (not res!354865) (not e!324800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563707 (= res!354865 (validKeyInArray!0 (select (arr!16995 a!3118) j!142)))))

(declare-fun b!563708 () Bool)

(declare-fun res!354866 () Bool)

(assert (=> b!563708 (=> (not res!354866) (not e!324800))))

(declare-fun arrayContainsKey!0 (array!35389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563708 (= res!354866 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563709 () Bool)

(declare-fun res!354860 () Bool)

(assert (=> b!563709 (=> (not res!354860) (not e!324803))))

(declare-datatypes ((List!11075 0))(
  ( (Nil!11072) (Cons!11071 (h!12074 (_ BitVec 64)) (t!17303 List!11075)) )
))
(declare-fun arrayNoDuplicates!0 (array!35389 (_ BitVec 32) List!11075) Bool)

(assert (=> b!563709 (= res!354860 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11072))))

(declare-fun b!563710 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35389 (_ BitVec 32)) SeekEntryResult!5444)

(assert (=> b!563710 (= e!324804 (= (seekEntryOrOpen!0 (select (arr!16995 a!3118) j!142) a!3118 mask!3119) (Found!5444 j!142)))))

(declare-fun b!563711 () Bool)

(declare-fun res!354863 () Bool)

(assert (=> b!563711 (=> (not res!354863) (not e!324800))))

(assert (=> b!563711 (= res!354863 (and (= (size!17359 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17359 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17359 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563712 () Bool)

(declare-fun res!354858 () Bool)

(assert (=> b!563712 (=> (not res!354858) (not e!324800))))

(assert (=> b!563712 (= res!354858 (validKeyInArray!0 k!1914))))

(declare-fun b!563713 () Bool)

(assert (=> b!563713 (= e!324800 e!324803)))

(declare-fun res!354857 () Bool)

(assert (=> b!563713 (=> (not res!354857) (not e!324803))))

(declare-fun lt!257298 () SeekEntryResult!5444)

(assert (=> b!563713 (= res!354857 (or (= lt!257298 (MissingZero!5444 i!1132)) (= lt!257298 (MissingVacant!5444 i!1132))))))

(assert (=> b!563713 (= lt!257298 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563714 () Bool)

(declare-fun res!354862 () Bool)

(assert (=> b!563714 (=> (not res!354862) (not e!324803))))

(assert (=> b!563714 (= res!354862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51524 res!354859) b!563711))

(assert (= (and b!563711 res!354863) b!563707))

(assert (= (and b!563707 res!354865) b!563712))

(assert (= (and b!563712 res!354858) b!563708))

(assert (= (and b!563708 res!354866) b!563713))

(assert (= (and b!563713 res!354857) b!563714))

(assert (= (and b!563714 res!354862) b!563709))

(assert (= (and b!563709 res!354860) b!563705))

(assert (= (and b!563705 res!354861) b!563706))

(assert (= (and b!563706 res!354864) b!563710))

(declare-fun m!542103 () Bool)

(assert (=> b!563708 m!542103))

(declare-fun m!542105 () Bool)

(assert (=> b!563714 m!542105))

(declare-fun m!542107 () Bool)

(assert (=> b!563713 m!542107))

(declare-fun m!542109 () Bool)

(assert (=> b!563712 m!542109))

(declare-fun m!542111 () Bool)

(assert (=> b!563705 m!542111))

(declare-fun m!542113 () Bool)

(assert (=> b!563705 m!542113))

(assert (=> b!563705 m!542111))

(declare-fun m!542115 () Bool)

(assert (=> b!563705 m!542115))

(assert (=> b!563705 m!542111))

(declare-fun m!542117 () Bool)

(assert (=> b!563705 m!542117))

(declare-fun m!542119 () Bool)

(assert (=> b!563705 m!542119))

(declare-fun m!542121 () Bool)

(assert (=> b!563705 m!542121))

(assert (=> b!563705 m!542119))

(declare-fun m!542123 () Bool)

(assert (=> b!563705 m!542123))

(assert (=> b!563705 m!542119))

(declare-fun m!542125 () Bool)

(assert (=> start!51524 m!542125))

(declare-fun m!542127 () Bool)

(assert (=> start!51524 m!542127))

(declare-fun m!542129 () Bool)

(assert (=> b!563706 m!542129))

(declare-fun m!542131 () Bool)

(assert (=> b!563706 m!542131))

(assert (=> b!563710 m!542111))

(assert (=> b!563710 m!542111))

(declare-fun m!542133 () Bool)

(assert (=> b!563710 m!542133))

(assert (=> b!563707 m!542111))

(assert (=> b!563707 m!542111))

(declare-fun m!542135 () Bool)

(assert (=> b!563707 m!542135))

(declare-fun m!542137 () Bool)

(assert (=> b!563709 m!542137))

(push 1)

