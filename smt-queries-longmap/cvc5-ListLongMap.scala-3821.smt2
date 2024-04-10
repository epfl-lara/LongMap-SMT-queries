; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52412 () Bool)

(assert start!52412)

(declare-fun b!571997 () Bool)

(declare-fun e!329010 () Bool)

(assert (=> b!571997 (= e!329010 (not true))))

(declare-fun e!329009 () Bool)

(assert (=> b!571997 e!329009))

(declare-fun res!361509 () Bool)

(assert (=> b!571997 (=> (not res!361509) (not e!329009))))

(declare-datatypes ((SeekEntryResult!5642 0))(
  ( (MissingZero!5642 (index!24795 (_ BitVec 32))) (Found!5642 (index!24796 (_ BitVec 32))) (Intermediate!5642 (undefined!6454 Bool) (index!24797 (_ BitVec 32)) (x!53671 (_ BitVec 32))) (Undefined!5642) (MissingVacant!5642 (index!24798 (_ BitVec 32))) )
))
(declare-fun lt!260936 () SeekEntryResult!5642)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571997 (= res!361509 (= lt!260936 (Found!5642 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35809 0))(
  ( (array!35810 (arr!17193 (Array (_ BitVec 32) (_ BitVec 64))) (size!17557 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35809)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35809 (_ BitVec 32)) SeekEntryResult!5642)

(assert (=> b!571997 (= lt!260936 (seekEntryOrOpen!0 (select (arr!17193 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35809 (_ BitVec 32)) Bool)

(assert (=> b!571997 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17986 0))(
  ( (Unit!17987) )
))
(declare-fun lt!260937 () Unit!17986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17986)

(assert (=> b!571997 (= lt!260937 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571998 () Bool)

(declare-fun res!361507 () Bool)

(declare-fun e!329004 () Bool)

(assert (=> b!571998 (=> (not res!361507) (not e!329004))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571998 (= res!361507 (and (= (size!17557 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17557 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17557 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571999 () Bool)

(declare-fun e!329007 () Bool)

(assert (=> b!571999 (= e!329007 e!329010)))

(declare-fun res!361515 () Bool)

(assert (=> b!571999 (=> (not res!361515) (not e!329010))))

(declare-fun lt!260931 () array!35809)

(declare-fun lt!260935 () SeekEntryResult!5642)

(declare-fun lt!260932 () (_ BitVec 64))

(declare-fun lt!260933 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35809 (_ BitVec 32)) SeekEntryResult!5642)

(assert (=> b!571999 (= res!361515 (= lt!260935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260933 lt!260932 lt!260931 mask!3119)))))

(declare-fun lt!260930 () (_ BitVec 32))

(assert (=> b!571999 (= lt!260935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260930 (select (arr!17193 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571999 (= lt!260933 (toIndex!0 lt!260932 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!571999 (= lt!260932 (select (store (arr!17193 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571999 (= lt!260930 (toIndex!0 (select (arr!17193 a!3118) j!142) mask!3119))))

(assert (=> b!571999 (= lt!260931 (array!35810 (store (arr!17193 a!3118) i!1132 k!1914) (size!17557 a!3118)))))

(declare-fun b!572000 () Bool)

(declare-fun res!361513 () Bool)

(assert (=> b!572000 (=> (not res!361513) (not e!329004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572000 (= res!361513 (validKeyInArray!0 k!1914))))

(declare-fun b!572002 () Bool)

(assert (=> b!572002 (= e!329004 e!329007)))

(declare-fun res!361512 () Bool)

(assert (=> b!572002 (=> (not res!361512) (not e!329007))))

(declare-fun lt!260938 () SeekEntryResult!5642)

(assert (=> b!572002 (= res!361512 (or (= lt!260938 (MissingZero!5642 i!1132)) (= lt!260938 (MissingVacant!5642 i!1132))))))

(assert (=> b!572002 (= lt!260938 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572003 () Bool)

(declare-fun res!361516 () Bool)

(assert (=> b!572003 (=> (not res!361516) (not e!329007))))

(assert (=> b!572003 (= res!361516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572004 () Bool)

(declare-fun res!361510 () Bool)

(assert (=> b!572004 (=> (not res!361510) (not e!329004))))

(assert (=> b!572004 (= res!361510 (validKeyInArray!0 (select (arr!17193 a!3118) j!142)))))

(declare-fun b!572005 () Bool)

(declare-fun e!329006 () Bool)

(declare-fun e!329008 () Bool)

(assert (=> b!572005 (= e!329006 e!329008)))

(declare-fun res!361506 () Bool)

(assert (=> b!572005 (=> (not res!361506) (not e!329008))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35809 (_ BitVec 32)) SeekEntryResult!5642)

(assert (=> b!572005 (= res!361506 (= lt!260936 (seekKeyOrZeroReturnVacant!0 (x!53671 lt!260935) (index!24797 lt!260935) (index!24797 lt!260935) (select (arr!17193 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572006 () Bool)

(assert (=> b!572006 (= e!329008 (= (seekEntryOrOpen!0 lt!260932 lt!260931 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53671 lt!260935) (index!24797 lt!260935) (index!24797 lt!260935) lt!260932 lt!260931 mask!3119)))))

(declare-fun b!572007 () Bool)

(declare-fun e!329005 () Bool)

(assert (=> b!572007 (= e!329009 e!329005)))

(declare-fun res!361508 () Bool)

(assert (=> b!572007 (=> res!361508 e!329005)))

(assert (=> b!572007 (= res!361508 (or (undefined!6454 lt!260935) (not (is-Intermediate!5642 lt!260935))))))

(declare-fun res!361517 () Bool)

(assert (=> start!52412 (=> (not res!361517) (not e!329004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52412 (= res!361517 (validMask!0 mask!3119))))

(assert (=> start!52412 e!329004))

(assert (=> start!52412 true))

(declare-fun array_inv!12989 (array!35809) Bool)

(assert (=> start!52412 (array_inv!12989 a!3118)))

(declare-fun b!572001 () Bool)

(assert (=> b!572001 (= e!329005 e!329006)))

(declare-fun res!361511 () Bool)

(assert (=> b!572001 (=> res!361511 e!329006)))

(declare-fun lt!260934 () (_ BitVec 64))

(assert (=> b!572001 (= res!361511 (or (= lt!260934 (select (arr!17193 a!3118) j!142)) (= lt!260934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572001 (= lt!260934 (select (arr!17193 a!3118) (index!24797 lt!260935)))))

(declare-fun b!572008 () Bool)

(declare-fun res!361514 () Bool)

(assert (=> b!572008 (=> (not res!361514) (not e!329004))))

(declare-fun arrayContainsKey!0 (array!35809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572008 (= res!361514 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572009 () Bool)

(declare-fun res!361505 () Bool)

(assert (=> b!572009 (=> (not res!361505) (not e!329007))))

(declare-datatypes ((List!11273 0))(
  ( (Nil!11270) (Cons!11269 (h!12296 (_ BitVec 64)) (t!17501 List!11273)) )
))
(declare-fun arrayNoDuplicates!0 (array!35809 (_ BitVec 32) List!11273) Bool)

(assert (=> b!572009 (= res!361505 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11270))))

(assert (= (and start!52412 res!361517) b!571998))

(assert (= (and b!571998 res!361507) b!572004))

(assert (= (and b!572004 res!361510) b!572000))

(assert (= (and b!572000 res!361513) b!572008))

(assert (= (and b!572008 res!361514) b!572002))

(assert (= (and b!572002 res!361512) b!572003))

(assert (= (and b!572003 res!361516) b!572009))

(assert (= (and b!572009 res!361505) b!571999))

(assert (= (and b!571999 res!361515) b!571997))

(assert (= (and b!571997 res!361509) b!572007))

(assert (= (and b!572007 (not res!361508)) b!572001))

(assert (= (and b!572001 (not res!361511)) b!572005))

(assert (= (and b!572005 res!361506) b!572006))

(declare-fun m!550917 () Bool)

(assert (=> b!571999 m!550917))

(declare-fun m!550919 () Bool)

(assert (=> b!571999 m!550919))

(assert (=> b!571999 m!550917))

(declare-fun m!550921 () Bool)

(assert (=> b!571999 m!550921))

(declare-fun m!550923 () Bool)

(assert (=> b!571999 m!550923))

(declare-fun m!550925 () Bool)

(assert (=> b!571999 m!550925))

(declare-fun m!550927 () Bool)

(assert (=> b!571999 m!550927))

(assert (=> b!571999 m!550917))

(declare-fun m!550929 () Bool)

(assert (=> b!571999 m!550929))

(declare-fun m!550931 () Bool)

(assert (=> b!572006 m!550931))

(declare-fun m!550933 () Bool)

(assert (=> b!572006 m!550933))

(assert (=> b!572005 m!550917))

(assert (=> b!572005 m!550917))

(declare-fun m!550935 () Bool)

(assert (=> b!572005 m!550935))

(declare-fun m!550937 () Bool)

(assert (=> b!572002 m!550937))

(assert (=> b!571997 m!550917))

(assert (=> b!571997 m!550917))

(declare-fun m!550939 () Bool)

(assert (=> b!571997 m!550939))

(declare-fun m!550941 () Bool)

(assert (=> b!571997 m!550941))

(declare-fun m!550943 () Bool)

(assert (=> b!571997 m!550943))

(assert (=> b!572001 m!550917))

(declare-fun m!550945 () Bool)

(assert (=> b!572001 m!550945))

(declare-fun m!550947 () Bool)

(assert (=> b!572000 m!550947))

(assert (=> b!572004 m!550917))

(assert (=> b!572004 m!550917))

(declare-fun m!550949 () Bool)

(assert (=> b!572004 m!550949))

(declare-fun m!550951 () Bool)

(assert (=> start!52412 m!550951))

(declare-fun m!550953 () Bool)

(assert (=> start!52412 m!550953))

(declare-fun m!550955 () Bool)

(assert (=> b!572003 m!550955))

(declare-fun m!550957 () Bool)

(assert (=> b!572008 m!550957))

(declare-fun m!550959 () Bool)

(assert (=> b!572009 m!550959))

(push 1)

