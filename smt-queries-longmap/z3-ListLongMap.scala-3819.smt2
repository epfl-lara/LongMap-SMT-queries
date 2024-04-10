; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52402 () Bool)

(assert start!52402)

(declare-fun b!571802 () Bool)

(declare-fun res!361315 () Bool)

(declare-fun e!328888 () Bool)

(assert (=> b!571802 (=> (not res!361315) (not e!328888))))

(declare-datatypes ((array!35799 0))(
  ( (array!35800 (arr!17188 (Array (_ BitVec 32) (_ BitVec 64))) (size!17552 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35799)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571802 (= res!361315 (validKeyInArray!0 (select (arr!17188 a!3118) j!142)))))

(declare-fun b!571803 () Bool)

(declare-fun e!328885 () Bool)

(declare-fun e!328887 () Bool)

(assert (=> b!571803 (= e!328885 e!328887)))

(declare-fun res!361314 () Bool)

(assert (=> b!571803 (=> (not res!361314) (not e!328887))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5637 0))(
  ( (MissingZero!5637 (index!24775 (_ BitVec 32))) (Found!5637 (index!24776 (_ BitVec 32))) (Intermediate!5637 (undefined!6449 Bool) (index!24777 (_ BitVec 32)) (x!53650 (_ BitVec 32))) (Undefined!5637) (MissingVacant!5637 (index!24778 (_ BitVec 32))) )
))
(declare-fun lt!260800 () SeekEntryResult!5637)

(declare-fun lt!260801 () SeekEntryResult!5637)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35799 (_ BitVec 32)) SeekEntryResult!5637)

(assert (=> b!571803 (= res!361314 (= lt!260801 (seekKeyOrZeroReturnVacant!0 (x!53650 lt!260800) (index!24777 lt!260800) (index!24777 lt!260800) (select (arr!17188 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571804 () Bool)

(declare-fun e!328883 () Bool)

(declare-fun e!328886 () Bool)

(assert (=> b!571804 (= e!328883 e!328886)))

(declare-fun res!361320 () Bool)

(assert (=> b!571804 (=> res!361320 e!328886)))

(get-info :version)

(assert (=> b!571804 (= res!361320 (or (undefined!6449 lt!260800) (not ((_ is Intermediate!5637) lt!260800))))))

(declare-fun b!571805 () Bool)

(declare-fun e!328889 () Bool)

(declare-fun e!328890 () Bool)

(assert (=> b!571805 (= e!328889 e!328890)))

(declare-fun res!361316 () Bool)

(assert (=> b!571805 (=> (not res!361316) (not e!328890))))

(declare-fun lt!260799 () array!35799)

(declare-fun lt!260795 () (_ BitVec 64))

(declare-fun lt!260797 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35799 (_ BitVec 32)) SeekEntryResult!5637)

(assert (=> b!571805 (= res!361316 (= lt!260800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260797 lt!260795 lt!260799 mask!3119)))))

(declare-fun lt!260796 () (_ BitVec 32))

(assert (=> b!571805 (= lt!260800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260796 (select (arr!17188 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571805 (= lt!260797 (toIndex!0 lt!260795 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571805 (= lt!260795 (select (store (arr!17188 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571805 (= lt!260796 (toIndex!0 (select (arr!17188 a!3118) j!142) mask!3119))))

(assert (=> b!571805 (= lt!260799 (array!35800 (store (arr!17188 a!3118) i!1132 k0!1914) (size!17552 a!3118)))))

(declare-fun b!571806 () Bool)

(assert (=> b!571806 (= e!328888 e!328889)))

(declare-fun res!361318 () Bool)

(assert (=> b!571806 (=> (not res!361318) (not e!328889))))

(declare-fun lt!260803 () SeekEntryResult!5637)

(assert (=> b!571806 (= res!361318 (or (= lt!260803 (MissingZero!5637 i!1132)) (= lt!260803 (MissingVacant!5637 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35799 (_ BitVec 32)) SeekEntryResult!5637)

(assert (=> b!571806 (= lt!260803 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571807 () Bool)

(assert (=> b!571807 (= e!328887 (= (seekEntryOrOpen!0 lt!260795 lt!260799 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53650 lt!260800) (index!24777 lt!260800) (index!24777 lt!260800) lt!260795 lt!260799 mask!3119)))))

(declare-fun res!361319 () Bool)

(assert (=> start!52402 (=> (not res!361319) (not e!328888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52402 (= res!361319 (validMask!0 mask!3119))))

(assert (=> start!52402 e!328888))

(assert (=> start!52402 true))

(declare-fun array_inv!12984 (array!35799) Bool)

(assert (=> start!52402 (array_inv!12984 a!3118)))

(declare-fun b!571808 () Bool)

(declare-fun res!361313 () Bool)

(assert (=> b!571808 (=> (not res!361313) (not e!328888))))

(assert (=> b!571808 (= res!361313 (and (= (size!17552 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17552 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17552 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571809 () Bool)

(assert (=> b!571809 (= e!328886 e!328885)))

(declare-fun res!361317 () Bool)

(assert (=> b!571809 (=> res!361317 e!328885)))

(declare-fun lt!260798 () (_ BitVec 64))

(assert (=> b!571809 (= res!361317 (or (= lt!260798 (select (arr!17188 a!3118) j!142)) (= lt!260798 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571809 (= lt!260798 (select (arr!17188 a!3118) (index!24777 lt!260800)))))

(declare-fun b!571810 () Bool)

(declare-fun res!361322 () Bool)

(assert (=> b!571810 (=> (not res!361322) (not e!328888))))

(declare-fun arrayContainsKey!0 (array!35799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571810 (= res!361322 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571811 () Bool)

(declare-fun res!361311 () Bool)

(assert (=> b!571811 (=> (not res!361311) (not e!328888))))

(assert (=> b!571811 (= res!361311 (validKeyInArray!0 k0!1914))))

(declare-fun b!571812 () Bool)

(assert (=> b!571812 (= e!328890 (not true))))

(assert (=> b!571812 e!328883))

(declare-fun res!361312 () Bool)

(assert (=> b!571812 (=> (not res!361312) (not e!328883))))

(assert (=> b!571812 (= res!361312 (= lt!260801 (Found!5637 j!142)))))

(assert (=> b!571812 (= lt!260801 (seekEntryOrOpen!0 (select (arr!17188 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35799 (_ BitVec 32)) Bool)

(assert (=> b!571812 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17976 0))(
  ( (Unit!17977) )
))
(declare-fun lt!260802 () Unit!17976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17976)

(assert (=> b!571812 (= lt!260802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571813 () Bool)

(declare-fun res!361321 () Bool)

(assert (=> b!571813 (=> (not res!361321) (not e!328889))))

(assert (=> b!571813 (= res!361321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571814 () Bool)

(declare-fun res!361310 () Bool)

(assert (=> b!571814 (=> (not res!361310) (not e!328889))))

(declare-datatypes ((List!11268 0))(
  ( (Nil!11265) (Cons!11264 (h!12291 (_ BitVec 64)) (t!17496 List!11268)) )
))
(declare-fun arrayNoDuplicates!0 (array!35799 (_ BitVec 32) List!11268) Bool)

(assert (=> b!571814 (= res!361310 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11265))))

(assert (= (and start!52402 res!361319) b!571808))

(assert (= (and b!571808 res!361313) b!571802))

(assert (= (and b!571802 res!361315) b!571811))

(assert (= (and b!571811 res!361311) b!571810))

(assert (= (and b!571810 res!361322) b!571806))

(assert (= (and b!571806 res!361318) b!571813))

(assert (= (and b!571813 res!361321) b!571814))

(assert (= (and b!571814 res!361310) b!571805))

(assert (= (and b!571805 res!361316) b!571812))

(assert (= (and b!571812 res!361312) b!571804))

(assert (= (and b!571804 (not res!361320)) b!571809))

(assert (= (and b!571809 (not res!361317)) b!571803))

(assert (= (and b!571803 res!361314) b!571807))

(declare-fun m!550697 () Bool)

(assert (=> b!571811 m!550697))

(declare-fun m!550699 () Bool)

(assert (=> b!571813 m!550699))

(declare-fun m!550701 () Bool)

(assert (=> b!571802 m!550701))

(assert (=> b!571802 m!550701))

(declare-fun m!550703 () Bool)

(assert (=> b!571802 m!550703))

(declare-fun m!550705 () Bool)

(assert (=> start!52402 m!550705))

(declare-fun m!550707 () Bool)

(assert (=> start!52402 m!550707))

(assert (=> b!571805 m!550701))

(declare-fun m!550709 () Bool)

(assert (=> b!571805 m!550709))

(assert (=> b!571805 m!550701))

(declare-fun m!550711 () Bool)

(assert (=> b!571805 m!550711))

(declare-fun m!550713 () Bool)

(assert (=> b!571805 m!550713))

(assert (=> b!571805 m!550701))

(declare-fun m!550715 () Bool)

(assert (=> b!571805 m!550715))

(declare-fun m!550717 () Bool)

(assert (=> b!571805 m!550717))

(declare-fun m!550719 () Bool)

(assert (=> b!571805 m!550719))

(assert (=> b!571809 m!550701))

(declare-fun m!550721 () Bool)

(assert (=> b!571809 m!550721))

(declare-fun m!550723 () Bool)

(assert (=> b!571806 m!550723))

(assert (=> b!571812 m!550701))

(assert (=> b!571812 m!550701))

(declare-fun m!550725 () Bool)

(assert (=> b!571812 m!550725))

(declare-fun m!550727 () Bool)

(assert (=> b!571812 m!550727))

(declare-fun m!550729 () Bool)

(assert (=> b!571812 m!550729))

(assert (=> b!571803 m!550701))

(assert (=> b!571803 m!550701))

(declare-fun m!550731 () Bool)

(assert (=> b!571803 m!550731))

(declare-fun m!550733 () Bool)

(assert (=> b!571814 m!550733))

(declare-fun m!550735 () Bool)

(assert (=> b!571810 m!550735))

(declare-fun m!550737 () Bool)

(assert (=> b!571807 m!550737))

(declare-fun m!550739 () Bool)

(assert (=> b!571807 m!550739))

(check-sat (not b!571810) (not b!571806) (not b!571805) (not b!571803) (not b!571811) (not start!52402) (not b!571813) (not b!571807) (not b!571802) (not b!571812) (not b!571814))
(check-sat)
