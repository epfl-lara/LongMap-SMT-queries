; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51522 () Bool)

(assert start!51522)

(declare-fun b!563675 () Bool)

(declare-fun res!354835 () Bool)

(declare-fun e!324787 () Bool)

(assert (=> b!563675 (=> (not res!354835) (not e!324787))))

(declare-datatypes ((array!35387 0))(
  ( (array!35388 (arr!16994 (Array (_ BitVec 32) (_ BitVec 64))) (size!17358 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35387)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35387 (_ BitVec 32)) Bool)

(assert (=> b!563675 (= res!354835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563676 () Bool)

(declare-fun res!354833 () Bool)

(declare-fun e!324788 () Bool)

(assert (=> b!563676 (=> (not res!354833) (not e!324788))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563676 (= res!354833 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563677 () Bool)

(declare-fun res!354829 () Bool)

(assert (=> b!563677 (=> (not res!354829) (not e!324788))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563677 (= res!354829 (and (= (size!17358 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17358 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17358 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563678 () Bool)

(assert (=> b!563678 (= e!324787 (not true))))

(declare-fun e!324786 () Bool)

(assert (=> b!563678 e!324786))

(declare-fun res!354828 () Bool)

(assert (=> b!563678 (=> (not res!354828) (not e!324786))))

(assert (=> b!563678 (= res!354828 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17660 0))(
  ( (Unit!17661) )
))
(declare-fun lt!257280 () Unit!17660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17660)

(assert (=> b!563678 (= lt!257280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563679 () Bool)

(declare-fun res!354831 () Bool)

(assert (=> b!563679 (=> (not res!354831) (not e!324787))))

(declare-datatypes ((List!11074 0))(
  ( (Nil!11071) (Cons!11070 (h!12073 (_ BitVec 64)) (t!17302 List!11074)) )
))
(declare-fun arrayNoDuplicates!0 (array!35387 (_ BitVec 32) List!11074) Bool)

(assert (=> b!563679 (= res!354831 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11071))))

(declare-fun res!354832 () Bool)

(assert (=> start!51522 (=> (not res!354832) (not e!324788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51522 (= res!354832 (validMask!0 mask!3119))))

(assert (=> start!51522 e!324788))

(assert (=> start!51522 true))

(declare-fun array_inv!12790 (array!35387) Bool)

(assert (=> start!51522 (array_inv!12790 a!3118)))

(declare-fun b!563680 () Bool)

(declare-fun res!354834 () Bool)

(assert (=> b!563680 (=> (not res!354834) (not e!324788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563680 (= res!354834 (validKeyInArray!0 (select (arr!16994 a!3118) j!142)))))

(declare-fun b!563681 () Bool)

(declare-datatypes ((SeekEntryResult!5443 0))(
  ( (MissingZero!5443 (index!23999 (_ BitVec 32))) (Found!5443 (index!24000 (_ BitVec 32))) (Intermediate!5443 (undefined!6255 Bool) (index!24001 (_ BitVec 32)) (x!52882 (_ BitVec 32))) (Undefined!5443) (MissingVacant!5443 (index!24002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35387 (_ BitVec 32)) SeekEntryResult!5443)

(assert (=> b!563681 (= e!324786 (= (seekEntryOrOpen!0 (select (arr!16994 a!3118) j!142) a!3118 mask!3119) (Found!5443 j!142)))))

(declare-fun b!563682 () Bool)

(assert (=> b!563682 (= e!324788 e!324787)))

(declare-fun res!354827 () Bool)

(assert (=> b!563682 (=> (not res!354827) (not e!324787))))

(declare-fun lt!257281 () SeekEntryResult!5443)

(assert (=> b!563682 (= res!354827 (or (= lt!257281 (MissingZero!5443 i!1132)) (= lt!257281 (MissingVacant!5443 i!1132))))))

(assert (=> b!563682 (= lt!257281 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563683 () Bool)

(declare-fun res!354830 () Bool)

(assert (=> b!563683 (=> (not res!354830) (not e!324787))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35387 (_ BitVec 32)) SeekEntryResult!5443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563683 (= res!354830 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16994 a!3118) j!142) mask!3119) (select (arr!16994 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16994 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16994 a!3118) i!1132 k!1914) j!142) (array!35388 (store (arr!16994 a!3118) i!1132 k!1914) (size!17358 a!3118)) mask!3119)))))

(declare-fun b!563684 () Bool)

(declare-fun res!354836 () Bool)

(assert (=> b!563684 (=> (not res!354836) (not e!324788))))

(assert (=> b!563684 (= res!354836 (validKeyInArray!0 k!1914))))

(assert (= (and start!51522 res!354832) b!563677))

(assert (= (and b!563677 res!354829) b!563680))

(assert (= (and b!563680 res!354834) b!563684))

(assert (= (and b!563684 res!354836) b!563676))

(assert (= (and b!563676 res!354833) b!563682))

(assert (= (and b!563682 res!354827) b!563675))

(assert (= (and b!563675 res!354835) b!563679))

(assert (= (and b!563679 res!354831) b!563683))

(assert (= (and b!563683 res!354830) b!563678))

(assert (= (and b!563678 res!354828) b!563681))

(declare-fun m!542067 () Bool)

(assert (=> start!51522 m!542067))

(declare-fun m!542069 () Bool)

(assert (=> start!51522 m!542069))

(declare-fun m!542071 () Bool)

(assert (=> b!563678 m!542071))

(declare-fun m!542073 () Bool)

(assert (=> b!563678 m!542073))

(declare-fun m!542075 () Bool)

(assert (=> b!563683 m!542075))

(declare-fun m!542077 () Bool)

(assert (=> b!563683 m!542077))

(assert (=> b!563683 m!542075))

(declare-fun m!542079 () Bool)

(assert (=> b!563683 m!542079))

(declare-fun m!542081 () Bool)

(assert (=> b!563683 m!542081))

(assert (=> b!563683 m!542079))

(declare-fun m!542083 () Bool)

(assert (=> b!563683 m!542083))

(assert (=> b!563683 m!542077))

(assert (=> b!563683 m!542075))

(declare-fun m!542085 () Bool)

(assert (=> b!563683 m!542085))

(declare-fun m!542087 () Bool)

(assert (=> b!563683 m!542087))

(assert (=> b!563683 m!542079))

(assert (=> b!563683 m!542081))

(assert (=> b!563681 m!542075))

(assert (=> b!563681 m!542075))

(declare-fun m!542089 () Bool)

(assert (=> b!563681 m!542089))

(declare-fun m!542091 () Bool)

(assert (=> b!563676 m!542091))

(declare-fun m!542093 () Bool)

(assert (=> b!563684 m!542093))

(declare-fun m!542095 () Bool)

(assert (=> b!563679 m!542095))

(assert (=> b!563680 m!542075))

(assert (=> b!563680 m!542075))

(declare-fun m!542097 () Bool)

(assert (=> b!563680 m!542097))

(declare-fun m!542099 () Bool)

(assert (=> b!563682 m!542099))

(declare-fun m!542101 () Bool)

(assert (=> b!563675 m!542101))

(push 1)

