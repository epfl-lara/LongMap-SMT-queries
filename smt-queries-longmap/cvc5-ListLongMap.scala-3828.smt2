; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52454 () Bool)

(assert start!52454)

(declare-fun b!572816 () Bool)

(declare-fun e!329511 () Bool)

(declare-fun e!329508 () Bool)

(assert (=> b!572816 (= e!329511 e!329508)))

(declare-fun res!362333 () Bool)

(assert (=> b!572816 (=> (not res!362333) (not e!329508))))

(declare-datatypes ((SeekEntryResult!5663 0))(
  ( (MissingZero!5663 (index!24879 (_ BitVec 32))) (Found!5663 (index!24880 (_ BitVec 32))) (Intermediate!5663 (undefined!6475 Bool) (index!24881 (_ BitVec 32)) (x!53748 (_ BitVec 32))) (Undefined!5663) (MissingVacant!5663 (index!24882 (_ BitVec 32))) )
))
(declare-fun lt!261502 () SeekEntryResult!5663)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572816 (= res!362333 (or (= lt!261502 (MissingZero!5663 i!1132)) (= lt!261502 (MissingVacant!5663 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35851 0))(
  ( (array!35852 (arr!17214 (Array (_ BitVec 32) (_ BitVec 64))) (size!17578 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35851)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35851 (_ BitVec 32)) SeekEntryResult!5663)

(assert (=> b!572816 (= lt!261502 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572817 () Bool)

(declare-fun res!362329 () Bool)

(assert (=> b!572817 (=> (not res!362329) (not e!329511))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572817 (= res!362329 (validKeyInArray!0 (select (arr!17214 a!3118) j!142)))))

(declare-fun b!572818 () Bool)

(declare-fun e!329513 () Bool)

(declare-fun e!329509 () Bool)

(assert (=> b!572818 (= e!329513 e!329509)))

(declare-fun res!362332 () Bool)

(assert (=> b!572818 (=> res!362332 e!329509)))

(declare-fun lt!261503 () (_ BitVec 64))

(assert (=> b!572818 (= res!362332 (or (= lt!261503 (select (arr!17214 a!3118) j!142)) (= lt!261503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!261497 () SeekEntryResult!5663)

(assert (=> b!572818 (= lt!261503 (select (arr!17214 a!3118) (index!24881 lt!261497)))))

(declare-fun b!572820 () Bool)

(declare-fun e!329514 () Bool)

(assert (=> b!572820 (= e!329509 e!329514)))

(declare-fun res!362334 () Bool)

(assert (=> b!572820 (=> (not res!362334) (not e!329514))))

(declare-fun lt!261504 () SeekEntryResult!5663)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35851 (_ BitVec 32)) SeekEntryResult!5663)

(assert (=> b!572820 (= res!362334 (= lt!261504 (seekKeyOrZeroReturnVacant!0 (x!53748 lt!261497) (index!24881 lt!261497) (index!24881 lt!261497) (select (arr!17214 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!261501 () array!35851)

(declare-fun lt!261500 () (_ BitVec 64))

(declare-fun b!572821 () Bool)

(assert (=> b!572821 (= e!329514 (= (seekEntryOrOpen!0 lt!261500 lt!261501 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53748 lt!261497) (index!24881 lt!261497) (index!24881 lt!261497) lt!261500 lt!261501 mask!3119)))))

(declare-fun b!572822 () Bool)

(declare-fun res!362324 () Bool)

(assert (=> b!572822 (=> (not res!362324) (not e!329511))))

(declare-fun arrayContainsKey!0 (array!35851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572822 (= res!362324 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572823 () Bool)

(declare-fun res!362335 () Bool)

(assert (=> b!572823 (=> (not res!362335) (not e!329508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35851 (_ BitVec 32)) Bool)

(assert (=> b!572823 (= res!362335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572824 () Bool)

(declare-fun e!329512 () Bool)

(assert (=> b!572824 (= e!329508 e!329512)))

(declare-fun res!362336 () Bool)

(assert (=> b!572824 (=> (not res!362336) (not e!329512))))

(declare-fun lt!261499 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35851 (_ BitVec 32)) SeekEntryResult!5663)

(assert (=> b!572824 (= res!362336 (= lt!261497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261499 lt!261500 lt!261501 mask!3119)))))

(declare-fun lt!261505 () (_ BitVec 32))

(assert (=> b!572824 (= lt!261497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261505 (select (arr!17214 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572824 (= lt!261499 (toIndex!0 lt!261500 mask!3119))))

(assert (=> b!572824 (= lt!261500 (select (store (arr!17214 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572824 (= lt!261505 (toIndex!0 (select (arr!17214 a!3118) j!142) mask!3119))))

(assert (=> b!572824 (= lt!261501 (array!35852 (store (arr!17214 a!3118) i!1132 k!1914) (size!17578 a!3118)))))

(declare-fun b!572825 () Bool)

(declare-fun res!362327 () Bool)

(assert (=> b!572825 (=> (not res!362327) (not e!329508))))

(declare-datatypes ((List!11294 0))(
  ( (Nil!11291) (Cons!11290 (h!12317 (_ BitVec 64)) (t!17522 List!11294)) )
))
(declare-fun arrayNoDuplicates!0 (array!35851 (_ BitVec 32) List!11294) Bool)

(assert (=> b!572825 (= res!362327 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11291))))

(declare-fun b!572826 () Bool)

(declare-fun res!362331 () Bool)

(assert (=> b!572826 (=> (not res!362331) (not e!329511))))

(assert (=> b!572826 (= res!362331 (and (= (size!17578 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17578 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17578 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!362325 () Bool)

(assert (=> start!52454 (=> (not res!362325) (not e!329511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52454 (= res!362325 (validMask!0 mask!3119))))

(assert (=> start!52454 e!329511))

(assert (=> start!52454 true))

(declare-fun array_inv!13010 (array!35851) Bool)

(assert (=> start!52454 (array_inv!13010 a!3118)))

(declare-fun b!572819 () Bool)

(declare-fun e!329507 () Bool)

(assert (=> b!572819 (= e!329507 e!329513)))

(declare-fun res!362330 () Bool)

(assert (=> b!572819 (=> res!362330 e!329513)))

(assert (=> b!572819 (= res!362330 (or (undefined!6475 lt!261497) (not (is-Intermediate!5663 lt!261497))))))

(declare-fun b!572827 () Bool)

(assert (=> b!572827 (= e!329512 (not true))))

(assert (=> b!572827 e!329507))

(declare-fun res!362328 () Bool)

(assert (=> b!572827 (=> (not res!362328) (not e!329507))))

(assert (=> b!572827 (= res!362328 (= lt!261504 (Found!5663 j!142)))))

(assert (=> b!572827 (= lt!261504 (seekEntryOrOpen!0 (select (arr!17214 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572827 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18028 0))(
  ( (Unit!18029) )
))
(declare-fun lt!261498 () Unit!18028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18028)

(assert (=> b!572827 (= lt!261498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572828 () Bool)

(declare-fun res!362326 () Bool)

(assert (=> b!572828 (=> (not res!362326) (not e!329511))))

(assert (=> b!572828 (= res!362326 (validKeyInArray!0 k!1914))))

(assert (= (and start!52454 res!362325) b!572826))

(assert (= (and b!572826 res!362331) b!572817))

(assert (= (and b!572817 res!362329) b!572828))

(assert (= (and b!572828 res!362326) b!572822))

(assert (= (and b!572822 res!362324) b!572816))

(assert (= (and b!572816 res!362333) b!572823))

(assert (= (and b!572823 res!362335) b!572825))

(assert (= (and b!572825 res!362327) b!572824))

(assert (= (and b!572824 res!362336) b!572827))

(assert (= (and b!572827 res!362328) b!572819))

(assert (= (and b!572819 (not res!362330)) b!572818))

(assert (= (and b!572818 (not res!362332)) b!572820))

(assert (= (and b!572820 res!362334) b!572821))

(declare-fun m!551841 () Bool)

(assert (=> b!572827 m!551841))

(assert (=> b!572827 m!551841))

(declare-fun m!551843 () Bool)

(assert (=> b!572827 m!551843))

(declare-fun m!551845 () Bool)

(assert (=> b!572827 m!551845))

(declare-fun m!551847 () Bool)

(assert (=> b!572827 m!551847))

(declare-fun m!551849 () Bool)

(assert (=> start!52454 m!551849))

(declare-fun m!551851 () Bool)

(assert (=> start!52454 m!551851))

(assert (=> b!572818 m!551841))

(declare-fun m!551853 () Bool)

(assert (=> b!572818 m!551853))

(assert (=> b!572820 m!551841))

(assert (=> b!572820 m!551841))

(declare-fun m!551855 () Bool)

(assert (=> b!572820 m!551855))

(declare-fun m!551857 () Bool)

(assert (=> b!572823 m!551857))

(declare-fun m!551859 () Bool)

(assert (=> b!572825 m!551859))

(assert (=> b!572824 m!551841))

(declare-fun m!551861 () Bool)

(assert (=> b!572824 m!551861))

(declare-fun m!551863 () Bool)

(assert (=> b!572824 m!551863))

(assert (=> b!572824 m!551841))

(declare-fun m!551865 () Bool)

(assert (=> b!572824 m!551865))

(assert (=> b!572824 m!551841))

(declare-fun m!551867 () Bool)

(assert (=> b!572824 m!551867))

(declare-fun m!551869 () Bool)

(assert (=> b!572824 m!551869))

(declare-fun m!551871 () Bool)

(assert (=> b!572824 m!551871))

(assert (=> b!572817 m!551841))

(assert (=> b!572817 m!551841))

(declare-fun m!551873 () Bool)

(assert (=> b!572817 m!551873))

(declare-fun m!551875 () Bool)

(assert (=> b!572822 m!551875))

(declare-fun m!551877 () Bool)

(assert (=> b!572816 m!551877))

(declare-fun m!551879 () Bool)

(assert (=> b!572828 m!551879))

(declare-fun m!551881 () Bool)

(assert (=> b!572821 m!551881))

(declare-fun m!551883 () Bool)

(assert (=> b!572821 m!551883))

(push 1)

