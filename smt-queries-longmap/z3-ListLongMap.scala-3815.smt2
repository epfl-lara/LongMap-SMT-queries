; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52298 () Bool)

(assert start!52298)

(declare-fun b!570648 () Bool)

(declare-fun res!360572 () Bool)

(declare-fun e!328174 () Bool)

(assert (=> b!570648 (=> (not res!360572) (not e!328174))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570648 (= res!360572 (validKeyInArray!0 k0!1914))))

(declare-fun b!570649 () Bool)

(declare-fun e!328171 () Bool)

(assert (=> b!570649 (= e!328174 e!328171)))

(declare-fun res!360578 () Bool)

(assert (=> b!570649 (=> (not res!360578) (not e!328171))))

(declare-datatypes ((SeekEntryResult!5620 0))(
  ( (MissingZero!5620 (index!24707 (_ BitVec 32))) (Found!5620 (index!24708 (_ BitVec 32))) (Intermediate!5620 (undefined!6432 Bool) (index!24709 (_ BitVec 32)) (x!53587 (_ BitVec 32))) (Undefined!5620) (MissingVacant!5620 (index!24710 (_ BitVec 32))) )
))
(declare-fun lt!260062 () SeekEntryResult!5620)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570649 (= res!360578 (or (= lt!260062 (MissingZero!5620 i!1132)) (= lt!260062 (MissingVacant!5620 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35767 0))(
  ( (array!35768 (arr!17174 (Array (_ BitVec 32) (_ BitVec 64))) (size!17539 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35767)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35767 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570649 (= lt!260062 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570650 () Bool)

(declare-fun res!360576 () Bool)

(assert (=> b!570650 (=> (not res!360576) (not e!328171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35767 (_ BitVec 32)) Bool)

(assert (=> b!570650 (= res!360576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!360573 () Bool)

(assert (=> start!52298 (=> (not res!360573) (not e!328174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52298 (= res!360573 (validMask!0 mask!3119))))

(assert (=> start!52298 e!328174))

(assert (=> start!52298 true))

(declare-fun array_inv!13057 (array!35767) Bool)

(assert (=> start!52298 (array_inv!13057 a!3118)))

(declare-fun b!570651 () Bool)

(declare-fun res!360579 () Bool)

(assert (=> b!570651 (=> (not res!360579) (not e!328171))))

(declare-datatypes ((List!11293 0))(
  ( (Nil!11290) (Cons!11289 (h!12313 (_ BitVec 64)) (t!17512 List!11293)) )
))
(declare-fun arrayNoDuplicates!0 (array!35767 (_ BitVec 32) List!11293) Bool)

(assert (=> b!570651 (= res!360579 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11290))))

(declare-fun b!570652 () Bool)

(declare-fun res!360581 () Bool)

(assert (=> b!570652 (=> (not res!360581) (not e!328174))))

(declare-fun arrayContainsKey!0 (array!35767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570652 (= res!360581 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570653 () Bool)

(declare-fun res!360580 () Bool)

(assert (=> b!570653 (=> (not res!360580) (not e!328174))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570653 (= res!360580 (validKeyInArray!0 (select (arr!17174 a!3118) j!142)))))

(declare-fun b!570654 () Bool)

(declare-fun e!328175 () Bool)

(assert (=> b!570654 (= e!328175 (not true))))

(declare-fun e!328172 () Bool)

(assert (=> b!570654 e!328172))

(declare-fun res!360574 () Bool)

(assert (=> b!570654 (=> (not res!360574) (not e!328172))))

(declare-fun lt!260063 () SeekEntryResult!5620)

(assert (=> b!570654 (= res!360574 (= lt!260063 (Found!5620 j!142)))))

(assert (=> b!570654 (= lt!260063 (seekEntryOrOpen!0 (select (arr!17174 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570654 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17928 0))(
  ( (Unit!17929) )
))
(declare-fun lt!260061 () Unit!17928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17928)

(assert (=> b!570654 (= lt!260061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570655 () Bool)

(assert (=> b!570655 (= e!328171 e!328175)))

(declare-fun res!360571 () Bool)

(assert (=> b!570655 (=> (not res!360571) (not e!328175))))

(declare-fun lt!260060 () SeekEntryResult!5620)

(declare-fun lt!260064 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35767 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570655 (= res!360571 (= lt!260060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260064 (select (store (arr!17174 a!3118) i!1132 k0!1914) j!142) (array!35768 (store (arr!17174 a!3118) i!1132 k0!1914) (size!17539 a!3118)) mask!3119)))))

(declare-fun lt!260065 () (_ BitVec 32))

(assert (=> b!570655 (= lt!260060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260065 (select (arr!17174 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570655 (= lt!260064 (toIndex!0 (select (store (arr!17174 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570655 (= lt!260065 (toIndex!0 (select (arr!17174 a!3118) j!142) mask!3119))))

(declare-fun b!570656 () Bool)

(declare-fun res!360577 () Bool)

(assert (=> b!570656 (=> (not res!360577) (not e!328174))))

(assert (=> b!570656 (= res!360577 (and (= (size!17539 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17539 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17539 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570657 () Bool)

(declare-fun e!328176 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35767 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570657 (= e!328176 (= lt!260063 (seekKeyOrZeroReturnVacant!0 (x!53587 lt!260060) (index!24709 lt!260060) (index!24709 lt!260060) (select (arr!17174 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570658 () Bool)

(assert (=> b!570658 (= e!328172 e!328176)))

(declare-fun res!360575 () Bool)

(assert (=> b!570658 (=> res!360575 e!328176)))

(get-info :version)

(assert (=> b!570658 (= res!360575 (or (undefined!6432 lt!260060) (not ((_ is Intermediate!5620) lt!260060)) (= (select (arr!17174 a!3118) (index!24709 lt!260060)) (select (arr!17174 a!3118) j!142)) (= (select (arr!17174 a!3118) (index!24709 lt!260060)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52298 res!360573) b!570656))

(assert (= (and b!570656 res!360577) b!570653))

(assert (= (and b!570653 res!360580) b!570648))

(assert (= (and b!570648 res!360572) b!570652))

(assert (= (and b!570652 res!360581) b!570649))

(assert (= (and b!570649 res!360578) b!570650))

(assert (= (and b!570650 res!360576) b!570651))

(assert (= (and b!570651 res!360579) b!570655))

(assert (= (and b!570655 res!360571) b!570654))

(assert (= (and b!570654 res!360574) b!570658))

(assert (= (and b!570658 (not res!360575)) b!570657))

(declare-fun m!549077 () Bool)

(assert (=> b!570655 m!549077))

(declare-fun m!549079 () Bool)

(assert (=> b!570655 m!549079))

(assert (=> b!570655 m!549077))

(declare-fun m!549081 () Bool)

(assert (=> b!570655 m!549081))

(assert (=> b!570655 m!549077))

(declare-fun m!549083 () Bool)

(assert (=> b!570655 m!549083))

(assert (=> b!570655 m!549081))

(declare-fun m!549085 () Bool)

(assert (=> b!570655 m!549085))

(declare-fun m!549087 () Bool)

(assert (=> b!570655 m!549087))

(assert (=> b!570655 m!549081))

(declare-fun m!549089 () Bool)

(assert (=> b!570655 m!549089))

(declare-fun m!549091 () Bool)

(assert (=> b!570650 m!549091))

(declare-fun m!549093 () Bool)

(assert (=> b!570652 m!549093))

(declare-fun m!549095 () Bool)

(assert (=> start!52298 m!549095))

(declare-fun m!549097 () Bool)

(assert (=> start!52298 m!549097))

(assert (=> b!570657 m!549077))

(assert (=> b!570657 m!549077))

(declare-fun m!549099 () Bool)

(assert (=> b!570657 m!549099))

(declare-fun m!549101 () Bool)

(assert (=> b!570648 m!549101))

(declare-fun m!549103 () Bool)

(assert (=> b!570651 m!549103))

(assert (=> b!570654 m!549077))

(assert (=> b!570654 m!549077))

(declare-fun m!549105 () Bool)

(assert (=> b!570654 m!549105))

(declare-fun m!549107 () Bool)

(assert (=> b!570654 m!549107))

(declare-fun m!549109 () Bool)

(assert (=> b!570654 m!549109))

(assert (=> b!570653 m!549077))

(assert (=> b!570653 m!549077))

(declare-fun m!549111 () Bool)

(assert (=> b!570653 m!549111))

(declare-fun m!549113 () Bool)

(assert (=> b!570649 m!549113))

(declare-fun m!549115 () Bool)

(assert (=> b!570658 m!549115))

(assert (=> b!570658 m!549077))

(check-sat (not b!570654) (not b!570648) (not b!570649) (not b!570655) (not b!570653) (not b!570657) (not b!570651) (not start!52298) (not b!570650) (not b!570652))
(check-sat)
