; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52230 () Bool)

(assert start!52230)

(declare-fun b!569843 () Bool)

(declare-fun e!327800 () Bool)

(assert (=> b!569843 (= e!327800 (not true))))

(declare-datatypes ((SeekEntryResult!5545 0))(
  ( (MissingZero!5545 (index!24407 (_ BitVec 32))) (Found!5545 (index!24408 (_ BitVec 32))) (Intermediate!5545 (undefined!6357 Bool) (index!24409 (_ BitVec 32)) (x!53431 (_ BitVec 32))) (Undefined!5545) (MissingVacant!5545 (index!24410 (_ BitVec 32))) )
))
(declare-fun lt!259794 () SeekEntryResult!5545)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259790 () SeekEntryResult!5545)

(declare-datatypes ((array!35700 0))(
  ( (array!35701 (arr!17140 (Array (_ BitVec 32) (_ BitVec 64))) (size!17504 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35700)

(get-info :version)

(assert (=> b!569843 (and (= lt!259794 (Found!5545 j!142)) (or (undefined!6357 lt!259790) (not ((_ is Intermediate!5545) lt!259790)) (= (select (arr!17140 a!3118) (index!24409 lt!259790)) (select (arr!17140 a!3118) j!142)) (not (= (select (arr!17140 a!3118) (index!24409 lt!259790)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259794 (MissingZero!5545 (index!24409 lt!259790)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35700 (_ BitVec 32)) SeekEntryResult!5545)

(assert (=> b!569843 (= lt!259794 (seekEntryOrOpen!0 (select (arr!17140 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35700 (_ BitVec 32)) Bool)

(assert (=> b!569843 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17863 0))(
  ( (Unit!17864) )
))
(declare-fun lt!259793 () Unit!17863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17863)

(assert (=> b!569843 (= lt!259793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569844 () Bool)

(declare-fun e!327798 () Bool)

(declare-fun e!327801 () Bool)

(assert (=> b!569844 (= e!327798 e!327801)))

(declare-fun res!359756 () Bool)

(assert (=> b!569844 (=> (not res!359756) (not e!327801))))

(declare-fun lt!259792 () SeekEntryResult!5545)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569844 (= res!359756 (or (= lt!259792 (MissingZero!5545 i!1132)) (= lt!259792 (MissingVacant!5545 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569844 (= lt!259792 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569845 () Bool)

(declare-fun res!359759 () Bool)

(assert (=> b!569845 (=> (not res!359759) (not e!327798))))

(declare-fun arrayContainsKey!0 (array!35700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569845 (= res!359759 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569847 () Bool)

(assert (=> b!569847 (= e!327801 e!327800)))

(declare-fun res!359757 () Bool)

(assert (=> b!569847 (=> (not res!359757) (not e!327800))))

(declare-fun lt!259795 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35700 (_ BitVec 32)) SeekEntryResult!5545)

(assert (=> b!569847 (= res!359757 (= lt!259790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259795 (select (store (arr!17140 a!3118) i!1132 k0!1914) j!142) (array!35701 (store (arr!17140 a!3118) i!1132 k0!1914) (size!17504 a!3118)) mask!3119)))))

(declare-fun lt!259791 () (_ BitVec 32))

(assert (=> b!569847 (= lt!259790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259791 (select (arr!17140 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569847 (= lt!259795 (toIndex!0 (select (store (arr!17140 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569847 (= lt!259791 (toIndex!0 (select (arr!17140 a!3118) j!142) mask!3119))))

(declare-fun b!569848 () Bool)

(declare-fun res!359758 () Bool)

(assert (=> b!569848 (=> (not res!359758) (not e!327801))))

(declare-datatypes ((List!11127 0))(
  ( (Nil!11124) (Cons!11123 (h!12147 (_ BitVec 64)) (t!17347 List!11127)) )
))
(declare-fun arrayNoDuplicates!0 (array!35700 (_ BitVec 32) List!11127) Bool)

(assert (=> b!569848 (= res!359758 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11124))))

(declare-fun b!569849 () Bool)

(declare-fun res!359762 () Bool)

(assert (=> b!569849 (=> (not res!359762) (not e!327798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569849 (= res!359762 (validKeyInArray!0 (select (arr!17140 a!3118) j!142)))))

(declare-fun b!569846 () Bool)

(declare-fun res!359760 () Bool)

(assert (=> b!569846 (=> (not res!359760) (not e!327801))))

(assert (=> b!569846 (= res!359760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359764 () Bool)

(assert (=> start!52230 (=> (not res!359764) (not e!327798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52230 (= res!359764 (validMask!0 mask!3119))))

(assert (=> start!52230 e!327798))

(assert (=> start!52230 true))

(declare-fun array_inv!12999 (array!35700) Bool)

(assert (=> start!52230 (array_inv!12999 a!3118)))

(declare-fun b!569850 () Bool)

(declare-fun res!359763 () Bool)

(assert (=> b!569850 (=> (not res!359763) (not e!327798))))

(assert (=> b!569850 (= res!359763 (validKeyInArray!0 k0!1914))))

(declare-fun b!569851 () Bool)

(declare-fun res!359761 () Bool)

(assert (=> b!569851 (=> (not res!359761) (not e!327798))))

(assert (=> b!569851 (= res!359761 (and (= (size!17504 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17504 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17504 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52230 res!359764) b!569851))

(assert (= (and b!569851 res!359761) b!569849))

(assert (= (and b!569849 res!359762) b!569850))

(assert (= (and b!569850 res!359763) b!569845))

(assert (= (and b!569845 res!359759) b!569844))

(assert (= (and b!569844 res!359756) b!569846))

(assert (= (and b!569846 res!359760) b!569848))

(assert (= (and b!569848 res!359758) b!569847))

(assert (= (and b!569847 res!359757) b!569843))

(declare-fun m!548795 () Bool)

(assert (=> b!569848 m!548795))

(declare-fun m!548797 () Bool)

(assert (=> b!569845 m!548797))

(declare-fun m!548799 () Bool)

(assert (=> b!569846 m!548799))

(declare-fun m!548801 () Bool)

(assert (=> b!569850 m!548801))

(declare-fun m!548803 () Bool)

(assert (=> b!569849 m!548803))

(assert (=> b!569849 m!548803))

(declare-fun m!548805 () Bool)

(assert (=> b!569849 m!548805))

(declare-fun m!548807 () Bool)

(assert (=> start!52230 m!548807))

(declare-fun m!548809 () Bool)

(assert (=> start!52230 m!548809))

(assert (=> b!569843 m!548803))

(declare-fun m!548811 () Bool)

(assert (=> b!569843 m!548811))

(declare-fun m!548813 () Bool)

(assert (=> b!569843 m!548813))

(declare-fun m!548815 () Bool)

(assert (=> b!569843 m!548815))

(assert (=> b!569843 m!548803))

(declare-fun m!548817 () Bool)

(assert (=> b!569843 m!548817))

(declare-fun m!548819 () Bool)

(assert (=> b!569844 m!548819))

(assert (=> b!569847 m!548803))

(declare-fun m!548821 () Bool)

(assert (=> b!569847 m!548821))

(assert (=> b!569847 m!548803))

(assert (=> b!569847 m!548803))

(declare-fun m!548823 () Bool)

(assert (=> b!569847 m!548823))

(declare-fun m!548825 () Bool)

(assert (=> b!569847 m!548825))

(declare-fun m!548827 () Bool)

(assert (=> b!569847 m!548827))

(assert (=> b!569847 m!548825))

(declare-fun m!548829 () Bool)

(assert (=> b!569847 m!548829))

(assert (=> b!569847 m!548825))

(declare-fun m!548831 () Bool)

(assert (=> b!569847 m!548831))

(check-sat (not b!569846) (not b!569849) (not b!569848) (not b!569850) (not start!52230) (not b!569847) (not b!569843) (not b!569845) (not b!569844))
(check-sat)
