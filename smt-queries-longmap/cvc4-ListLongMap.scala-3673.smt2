; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50658 () Bool)

(assert start!50658)

(declare-fun b!553793 () Bool)

(declare-fun res!346213 () Bool)

(declare-fun e!319406 () Bool)

(assert (=> b!553793 (=> (not res!346213) (not e!319406))))

(declare-datatypes ((array!34883 0))(
  ( (array!34884 (arr!16751 (Array (_ BitVec 32) (_ BitVec 64))) (size!17115 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34883)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553793 (= res!346213 (validKeyInArray!0 (select (arr!16751 a!3118) j!142)))))

(declare-fun b!553794 () Bool)

(declare-fun e!319405 () Bool)

(assert (=> b!553794 (= e!319405 (not true))))

(declare-fun e!319407 () Bool)

(assert (=> b!553794 e!319407))

(declare-fun res!346206 () Bool)

(assert (=> b!553794 (=> (not res!346206) (not e!319407))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34883 (_ BitVec 32)) Bool)

(assert (=> b!553794 (= res!346206 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17174 0))(
  ( (Unit!17175) )
))
(declare-fun lt!251583 () Unit!17174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17174)

(assert (=> b!553794 (= lt!251583 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553796 () Bool)

(declare-fun res!346207 () Bool)

(assert (=> b!553796 (=> (not res!346207) (not e!319406))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553796 (= res!346207 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553797 () Bool)

(assert (=> b!553797 (= e!319406 e!319405)))

(declare-fun res!346210 () Bool)

(assert (=> b!553797 (=> (not res!346210) (not e!319405))))

(declare-datatypes ((SeekEntryResult!5200 0))(
  ( (MissingZero!5200 (index!23027 (_ BitVec 32))) (Found!5200 (index!23028 (_ BitVec 32))) (Intermediate!5200 (undefined!6012 Bool) (index!23029 (_ BitVec 32)) (x!51946 (_ BitVec 32))) (Undefined!5200) (MissingVacant!5200 (index!23030 (_ BitVec 32))) )
))
(declare-fun lt!251584 () SeekEntryResult!5200)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553797 (= res!346210 (or (= lt!251584 (MissingZero!5200 i!1132)) (= lt!251584 (MissingVacant!5200 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34883 (_ BitVec 32)) SeekEntryResult!5200)

(assert (=> b!553797 (= lt!251584 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553798 () Bool)

(declare-fun res!346211 () Bool)

(assert (=> b!553798 (=> (not res!346211) (not e!319405))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34883 (_ BitVec 32)) SeekEntryResult!5200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553798 (= res!346211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16751 a!3118) j!142) mask!3119) (select (arr!16751 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16751 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16751 a!3118) i!1132 k!1914) j!142) (array!34884 (store (arr!16751 a!3118) i!1132 k!1914) (size!17115 a!3118)) mask!3119)))))

(declare-fun b!553795 () Bool)

(declare-fun res!346209 () Bool)

(assert (=> b!553795 (=> (not res!346209) (not e!319405))))

(declare-datatypes ((List!10831 0))(
  ( (Nil!10828) (Cons!10827 (h!11812 (_ BitVec 64)) (t!17059 List!10831)) )
))
(declare-fun arrayNoDuplicates!0 (array!34883 (_ BitVec 32) List!10831) Bool)

(assert (=> b!553795 (= res!346209 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10828))))

(declare-fun res!346212 () Bool)

(assert (=> start!50658 (=> (not res!346212) (not e!319406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50658 (= res!346212 (validMask!0 mask!3119))))

(assert (=> start!50658 e!319406))

(assert (=> start!50658 true))

(declare-fun array_inv!12547 (array!34883) Bool)

(assert (=> start!50658 (array_inv!12547 a!3118)))

(declare-fun b!553799 () Bool)

(declare-fun res!346214 () Bool)

(assert (=> b!553799 (=> (not res!346214) (not e!319406))))

(assert (=> b!553799 (= res!346214 (validKeyInArray!0 k!1914))))

(declare-fun b!553800 () Bool)

(declare-fun res!346208 () Bool)

(assert (=> b!553800 (=> (not res!346208) (not e!319405))))

(assert (=> b!553800 (= res!346208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553801 () Bool)

(declare-fun res!346205 () Bool)

(assert (=> b!553801 (=> (not res!346205) (not e!319406))))

(assert (=> b!553801 (= res!346205 (and (= (size!17115 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17115 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17115 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553802 () Bool)

(assert (=> b!553802 (= e!319407 (= (seekEntryOrOpen!0 (select (arr!16751 a!3118) j!142) a!3118 mask!3119) (Found!5200 j!142)))))

(assert (= (and start!50658 res!346212) b!553801))

(assert (= (and b!553801 res!346205) b!553793))

(assert (= (and b!553793 res!346213) b!553799))

(assert (= (and b!553799 res!346214) b!553796))

(assert (= (and b!553796 res!346207) b!553797))

(assert (= (and b!553797 res!346210) b!553800))

(assert (= (and b!553800 res!346208) b!553795))

(assert (= (and b!553795 res!346209) b!553798))

(assert (= (and b!553798 res!346211) b!553794))

(assert (= (and b!553794 res!346206) b!553802))

(declare-fun m!530949 () Bool)

(assert (=> b!553794 m!530949))

(declare-fun m!530951 () Bool)

(assert (=> b!553794 m!530951))

(declare-fun m!530953 () Bool)

(assert (=> start!50658 m!530953))

(declare-fun m!530955 () Bool)

(assert (=> start!50658 m!530955))

(declare-fun m!530957 () Bool)

(assert (=> b!553797 m!530957))

(declare-fun m!530959 () Bool)

(assert (=> b!553796 m!530959))

(declare-fun m!530961 () Bool)

(assert (=> b!553802 m!530961))

(assert (=> b!553802 m!530961))

(declare-fun m!530963 () Bool)

(assert (=> b!553802 m!530963))

(declare-fun m!530965 () Bool)

(assert (=> b!553799 m!530965))

(declare-fun m!530967 () Bool)

(assert (=> b!553800 m!530967))

(assert (=> b!553798 m!530961))

(declare-fun m!530969 () Bool)

(assert (=> b!553798 m!530969))

(assert (=> b!553798 m!530961))

(declare-fun m!530971 () Bool)

(assert (=> b!553798 m!530971))

(declare-fun m!530973 () Bool)

(assert (=> b!553798 m!530973))

(assert (=> b!553798 m!530971))

(declare-fun m!530975 () Bool)

(assert (=> b!553798 m!530975))

(assert (=> b!553798 m!530969))

(assert (=> b!553798 m!530961))

(declare-fun m!530977 () Bool)

(assert (=> b!553798 m!530977))

(declare-fun m!530979 () Bool)

(assert (=> b!553798 m!530979))

(assert (=> b!553798 m!530971))

(assert (=> b!553798 m!530973))

(assert (=> b!553793 m!530961))

(assert (=> b!553793 m!530961))

(declare-fun m!530981 () Bool)

(assert (=> b!553793 m!530981))

(declare-fun m!530983 () Bool)

(assert (=> b!553795 m!530983))

(push 1)

