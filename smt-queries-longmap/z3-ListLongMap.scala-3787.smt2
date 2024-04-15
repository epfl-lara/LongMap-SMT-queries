; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51884 () Bool)

(assert start!51884)

(declare-fun b!566962 () Bool)

(declare-fun res!357694 () Bool)

(declare-fun e!326263 () Bool)

(assert (=> b!566962 (=> (not res!357694) (not e!326263))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35587 0))(
  ( (array!35588 (arr!17090 (Array (_ BitVec 32) (_ BitVec 64))) (size!17455 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35587)

(declare-datatypes ((SeekEntryResult!5536 0))(
  ( (MissingZero!5536 (index!24371 (_ BitVec 32))) (Found!5536 (index!24372 (_ BitVec 32))) (Intermediate!5536 (undefined!6348 Bool) (index!24373 (_ BitVec 32)) (x!53252 (_ BitVec 32))) (Undefined!5536) (MissingVacant!5536 (index!24374 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35587 (_ BitVec 32)) SeekEntryResult!5536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566962 (= res!357694 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17090 a!3118) j!142) mask!3119) (select (arr!17090 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17090 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17090 a!3118) i!1132 k0!1914) j!142) (array!35588 (store (arr!17090 a!3118) i!1132 k0!1914) (size!17455 a!3118)) mask!3119)))))

(declare-fun b!566963 () Bool)

(declare-fun res!357691 () Bool)

(declare-fun e!326265 () Bool)

(assert (=> b!566963 (=> (not res!357691) (not e!326265))))

(assert (=> b!566963 (= res!357691 (and (= (size!17455 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17455 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17455 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566964 () Bool)

(declare-fun res!357696 () Bool)

(assert (=> b!566964 (=> (not res!357696) (not e!326263))))

(declare-datatypes ((List!11209 0))(
  ( (Nil!11206) (Cons!11205 (h!12217 (_ BitVec 64)) (t!17428 List!11209)) )
))
(declare-fun arrayNoDuplicates!0 (array!35587 (_ BitVec 32) List!11209) Bool)

(assert (=> b!566964 (= res!357696 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11206))))

(declare-fun b!566965 () Bool)

(declare-fun res!357697 () Bool)

(assert (=> b!566965 (=> (not res!357697) (not e!326263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35587 (_ BitVec 32)) Bool)

(assert (=> b!566965 (= res!357697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566966 () Bool)

(declare-fun e!326262 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35587 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!566966 (= e!326262 (= (seekEntryOrOpen!0 (select (arr!17090 a!3118) j!142) a!3118 mask!3119) (Found!5536 j!142)))))

(declare-fun b!566967 () Bool)

(assert (=> b!566967 (= e!326265 e!326263)))

(declare-fun res!357698 () Bool)

(assert (=> b!566967 (=> (not res!357698) (not e!326263))))

(declare-fun lt!258240 () SeekEntryResult!5536)

(assert (=> b!566967 (= res!357698 (or (= lt!258240 (MissingZero!5536 i!1132)) (= lt!258240 (MissingVacant!5536 i!1132))))))

(assert (=> b!566967 (= lt!258240 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566968 () Bool)

(declare-fun res!357692 () Bool)

(assert (=> b!566968 (=> (not res!357692) (not e!326265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566968 (= res!357692 (validKeyInArray!0 k0!1914))))

(declare-fun b!566969 () Bool)

(declare-fun res!357693 () Bool)

(assert (=> b!566969 (=> (not res!357693) (not e!326265))))

(declare-fun arrayContainsKey!0 (array!35587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566969 (= res!357693 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357695 () Bool)

(assert (=> start!51884 (=> (not res!357695) (not e!326265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51884 (= res!357695 (validMask!0 mask!3119))))

(assert (=> start!51884 e!326265))

(assert (=> start!51884 true))

(declare-fun array_inv!12973 (array!35587) Bool)

(assert (=> start!51884 (array_inv!12973 a!3118)))

(declare-fun b!566970 () Bool)

(declare-fun res!357690 () Bool)

(assert (=> b!566970 (=> (not res!357690) (not e!326265))))

(assert (=> b!566970 (= res!357690 (validKeyInArray!0 (select (arr!17090 a!3118) j!142)))))

(declare-fun b!566971 () Bool)

(assert (=> b!566971 (= e!326263 (not true))))

(assert (=> b!566971 e!326262))

(declare-fun res!357689 () Bool)

(assert (=> b!566971 (=> (not res!357689) (not e!326262))))

(assert (=> b!566971 (= res!357689 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17760 0))(
  ( (Unit!17761) )
))
(declare-fun lt!258241 () Unit!17760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17760)

(assert (=> b!566971 (= lt!258241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51884 res!357695) b!566963))

(assert (= (and b!566963 res!357691) b!566970))

(assert (= (and b!566970 res!357690) b!566968))

(assert (= (and b!566968 res!357692) b!566969))

(assert (= (and b!566969 res!357693) b!566967))

(assert (= (and b!566967 res!357698) b!566965))

(assert (= (and b!566965 res!357697) b!566964))

(assert (= (and b!566964 res!357696) b!566962))

(assert (= (and b!566962 res!357694) b!566971))

(assert (= (and b!566971 res!357689) b!566966))

(declare-fun m!545009 () Bool)

(assert (=> b!566971 m!545009))

(declare-fun m!545011 () Bool)

(assert (=> b!566971 m!545011))

(declare-fun m!545013 () Bool)

(assert (=> start!51884 m!545013))

(declare-fun m!545015 () Bool)

(assert (=> start!51884 m!545015))

(declare-fun m!545017 () Bool)

(assert (=> b!566962 m!545017))

(declare-fun m!545019 () Bool)

(assert (=> b!566962 m!545019))

(assert (=> b!566962 m!545017))

(declare-fun m!545021 () Bool)

(assert (=> b!566962 m!545021))

(declare-fun m!545023 () Bool)

(assert (=> b!566962 m!545023))

(assert (=> b!566962 m!545021))

(declare-fun m!545025 () Bool)

(assert (=> b!566962 m!545025))

(assert (=> b!566962 m!545019))

(assert (=> b!566962 m!545017))

(declare-fun m!545027 () Bool)

(assert (=> b!566962 m!545027))

(declare-fun m!545029 () Bool)

(assert (=> b!566962 m!545029))

(assert (=> b!566962 m!545021))

(assert (=> b!566962 m!545023))

(declare-fun m!545031 () Bool)

(assert (=> b!566967 m!545031))

(declare-fun m!545033 () Bool)

(assert (=> b!566969 m!545033))

(declare-fun m!545035 () Bool)

(assert (=> b!566964 m!545035))

(assert (=> b!566966 m!545017))

(assert (=> b!566966 m!545017))

(declare-fun m!545037 () Bool)

(assert (=> b!566966 m!545037))

(declare-fun m!545039 () Bool)

(assert (=> b!566968 m!545039))

(assert (=> b!566970 m!545017))

(assert (=> b!566970 m!545017))

(declare-fun m!545041 () Bool)

(assert (=> b!566970 m!545041))

(declare-fun m!545043 () Bool)

(assert (=> b!566965 m!545043))

(check-sat (not b!566970) (not b!566965) (not b!566968) (not b!566966) (not b!566971) (not start!51884) (not b!566969) (not b!566967) (not b!566962) (not b!566964))
(check-sat)
