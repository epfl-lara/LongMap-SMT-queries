; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50818 () Bool)

(assert start!50818)

(declare-fun b!556049 () Bool)

(declare-fun res!348468 () Bool)

(declare-fun e!320405 () Bool)

(assert (=> b!556049 (=> (not res!348468) (not e!320405))))

(declare-datatypes ((array!35043 0))(
  ( (array!35044 (arr!16831 (Array (_ BitVec 32) (_ BitVec 64))) (size!17195 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35043)

(declare-datatypes ((List!10911 0))(
  ( (Nil!10908) (Cons!10907 (h!11892 (_ BitVec 64)) (t!17139 List!10911)) )
))
(declare-fun arrayNoDuplicates!0 (array!35043 (_ BitVec 32) List!10911) Bool)

(assert (=> b!556049 (= res!348468 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10908))))

(declare-fun b!556050 () Bool)

(declare-fun res!348465 () Bool)

(declare-fun e!320406 () Bool)

(assert (=> b!556050 (=> (not res!348465) (not e!320406))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556050 (= res!348465 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556051 () Bool)

(declare-fun res!348461 () Bool)

(assert (=> b!556051 (=> (not res!348461) (not e!320406))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556051 (= res!348461 (validKeyInArray!0 (select (arr!16831 a!3118) j!142)))))

(declare-fun b!556052 () Bool)

(declare-fun res!348469 () Bool)

(assert (=> b!556052 (=> (not res!348469) (not e!320405))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35043 (_ BitVec 32)) Bool)

(assert (=> b!556052 (= res!348469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556053 () Bool)

(declare-fun e!320408 () Bool)

(assert (=> b!556053 (= e!320405 e!320408)))

(declare-fun res!348464 () Bool)

(assert (=> b!556053 (=> (not res!348464) (not e!320408))))

(declare-datatypes ((SeekEntryResult!5280 0))(
  ( (MissingZero!5280 (index!23347 (_ BitVec 32))) (Found!5280 (index!23348 (_ BitVec 32))) (Intermediate!5280 (undefined!6092 Bool) (index!23349 (_ BitVec 32)) (x!52242 (_ BitVec 32))) (Undefined!5280) (MissingVacant!5280 (index!23350 (_ BitVec 32))) )
))
(declare-fun lt!252771 () SeekEntryResult!5280)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!252774 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35043 (_ BitVec 32)) SeekEntryResult!5280)

(assert (=> b!556053 (= res!348464 (= lt!252771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252774 (select (store (arr!16831 a!3118) i!1132 k0!1914) j!142) (array!35044 (store (arr!16831 a!3118) i!1132 k0!1914) (size!17195 a!3118)) mask!3119)))))

(declare-fun lt!252772 () (_ BitVec 32))

(assert (=> b!556053 (= lt!252771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252772 (select (arr!16831 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556053 (= lt!252774 (toIndex!0 (select (store (arr!16831 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556053 (= lt!252772 (toIndex!0 (select (arr!16831 a!3118) j!142) mask!3119))))

(declare-fun b!556054 () Bool)

(get-info :version)

(assert (=> b!556054 (= e!320408 (not (or (not ((_ is Intermediate!5280) lt!252771)) (undefined!6092 lt!252771) (= (select (arr!16831 a!3118) (index!23349 lt!252771)) (select (arr!16831 a!3118) j!142)) (= (select (arr!16831 a!3118) (index!23349 lt!252771)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320407 () Bool)

(assert (=> b!556054 e!320407))

(declare-fun res!348463 () Bool)

(assert (=> b!556054 (=> (not res!348463) (not e!320407))))

(assert (=> b!556054 (= res!348463 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17334 0))(
  ( (Unit!17335) )
))
(declare-fun lt!252775 () Unit!17334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17334)

(assert (=> b!556054 (= lt!252775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556055 () Bool)

(declare-fun res!348462 () Bool)

(assert (=> b!556055 (=> (not res!348462) (not e!320406))))

(assert (=> b!556055 (= res!348462 (validKeyInArray!0 k0!1914))))

(declare-fun b!556056 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35043 (_ BitVec 32)) SeekEntryResult!5280)

(assert (=> b!556056 (= e!320407 (= (seekEntryOrOpen!0 (select (arr!16831 a!3118) j!142) a!3118 mask!3119) (Found!5280 j!142)))))

(declare-fun res!348470 () Bool)

(assert (=> start!50818 (=> (not res!348470) (not e!320406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50818 (= res!348470 (validMask!0 mask!3119))))

(assert (=> start!50818 e!320406))

(assert (=> start!50818 true))

(declare-fun array_inv!12627 (array!35043) Bool)

(assert (=> start!50818 (array_inv!12627 a!3118)))

(declare-fun b!556057 () Bool)

(assert (=> b!556057 (= e!320406 e!320405)))

(declare-fun res!348466 () Bool)

(assert (=> b!556057 (=> (not res!348466) (not e!320405))))

(declare-fun lt!252773 () SeekEntryResult!5280)

(assert (=> b!556057 (= res!348466 (or (= lt!252773 (MissingZero!5280 i!1132)) (= lt!252773 (MissingVacant!5280 i!1132))))))

(assert (=> b!556057 (= lt!252773 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556058 () Bool)

(declare-fun res!348467 () Bool)

(assert (=> b!556058 (=> (not res!348467) (not e!320406))))

(assert (=> b!556058 (= res!348467 (and (= (size!17195 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17195 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17195 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50818 res!348470) b!556058))

(assert (= (and b!556058 res!348467) b!556051))

(assert (= (and b!556051 res!348461) b!556055))

(assert (= (and b!556055 res!348462) b!556050))

(assert (= (and b!556050 res!348465) b!556057))

(assert (= (and b!556057 res!348466) b!556052))

(assert (= (and b!556052 res!348469) b!556049))

(assert (= (and b!556049 res!348468) b!556053))

(assert (= (and b!556053 res!348464) b!556054))

(assert (= (and b!556054 res!348463) b!556056))

(declare-fun m!533957 () Bool)

(assert (=> b!556055 m!533957))

(declare-fun m!533959 () Bool)

(assert (=> b!556052 m!533959))

(declare-fun m!533961 () Bool)

(assert (=> b!556054 m!533961))

(declare-fun m!533963 () Bool)

(assert (=> b!556054 m!533963))

(declare-fun m!533965 () Bool)

(assert (=> b!556054 m!533965))

(declare-fun m!533967 () Bool)

(assert (=> b!556054 m!533967))

(declare-fun m!533969 () Bool)

(assert (=> start!50818 m!533969))

(declare-fun m!533971 () Bool)

(assert (=> start!50818 m!533971))

(assert (=> b!556053 m!533963))

(declare-fun m!533973 () Bool)

(assert (=> b!556053 m!533973))

(assert (=> b!556053 m!533963))

(declare-fun m!533975 () Bool)

(assert (=> b!556053 m!533975))

(assert (=> b!556053 m!533975))

(declare-fun m!533977 () Bool)

(assert (=> b!556053 m!533977))

(declare-fun m!533979 () Bool)

(assert (=> b!556053 m!533979))

(assert (=> b!556053 m!533963))

(declare-fun m!533981 () Bool)

(assert (=> b!556053 m!533981))

(assert (=> b!556053 m!533975))

(declare-fun m!533983 () Bool)

(assert (=> b!556053 m!533983))

(declare-fun m!533985 () Bool)

(assert (=> b!556049 m!533985))

(assert (=> b!556056 m!533963))

(assert (=> b!556056 m!533963))

(declare-fun m!533987 () Bool)

(assert (=> b!556056 m!533987))

(declare-fun m!533989 () Bool)

(assert (=> b!556057 m!533989))

(assert (=> b!556051 m!533963))

(assert (=> b!556051 m!533963))

(declare-fun m!533991 () Bool)

(assert (=> b!556051 m!533991))

(declare-fun m!533993 () Bool)

(assert (=> b!556050 m!533993))

(check-sat (not b!556054) (not b!556049) (not b!556050) (not b!556051) (not b!556056) (not b!556052) (not b!556057) (not start!50818) (not b!556053) (not b!556055))
(check-sat)
