; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52926 () Bool)

(assert start!52926)

(declare-fun b!576652 () Bool)

(declare-fun res!364785 () Bool)

(declare-fun e!331776 () Bool)

(assert (=> b!576652 (=> (not res!364785) (not e!331776))))

(declare-datatypes ((array!35961 0))(
  ( (array!35962 (arr!17260 (Array (_ BitVec 32) (_ BitVec 64))) (size!17624 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35961)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576652 (= res!364785 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576653 () Bool)

(declare-fun e!331774 () Bool)

(assert (=> b!576653 (= e!331776 e!331774)))

(declare-fun res!364780 () Bool)

(assert (=> b!576653 (=> (not res!364780) (not e!331774))))

(declare-datatypes ((SeekEntryResult!5665 0))(
  ( (MissingZero!5665 (index!24887 (_ BitVec 32))) (Found!5665 (index!24888 (_ BitVec 32))) (Intermediate!5665 (undefined!6477 Bool) (index!24889 (_ BitVec 32)) (x!53931 (_ BitVec 32))) (Undefined!5665) (MissingVacant!5665 (index!24890 (_ BitVec 32))) )
))
(declare-fun lt!263775 () SeekEntryResult!5665)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576653 (= res!364780 (or (= lt!263775 (MissingZero!5665 i!1132)) (= lt!263775 (MissingVacant!5665 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35961 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!576653 (= lt!263775 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576654 () Bool)

(declare-fun res!364783 () Bool)

(assert (=> b!576654 (=> (not res!364783) (not e!331774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35961 (_ BitVec 32)) Bool)

(assert (=> b!576654 (= res!364783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576656 () Bool)

(declare-fun res!364788 () Bool)

(assert (=> b!576656 (=> (not res!364788) (not e!331774))))

(declare-datatypes ((List!11247 0))(
  ( (Nil!11244) (Cons!11243 (h!12288 (_ BitVec 64)) (t!17467 List!11247)) )
))
(declare-fun arrayNoDuplicates!0 (array!35961 (_ BitVec 32) List!11247) Bool)

(assert (=> b!576656 (= res!364788 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11244))))

(declare-fun b!576657 () Bool)

(declare-fun res!364782 () Bool)

(assert (=> b!576657 (=> (not res!364782) (not e!331774))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35961 (_ BitVec 32)) SeekEntryResult!5665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576657 (= res!364782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17260 a!3118) j!142) mask!3119) (select (arr!17260 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17260 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17260 a!3118) i!1132 k0!1914) j!142) (array!35962 (store (arr!17260 a!3118) i!1132 k0!1914) (size!17624 a!3118)) mask!3119)))))

(declare-fun b!576658 () Bool)

(declare-fun res!364786 () Bool)

(assert (=> b!576658 (=> (not res!364786) (not e!331776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576658 (= res!364786 (validKeyInArray!0 (select (arr!17260 a!3118) j!142)))))

(declare-fun b!576659 () Bool)

(assert (=> b!576659 (= e!331774 (not true))))

(declare-fun e!331775 () Bool)

(assert (=> b!576659 e!331775))

(declare-fun res!364789 () Bool)

(assert (=> b!576659 (=> (not res!364789) (not e!331775))))

(assert (=> b!576659 (= res!364789 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18103 0))(
  ( (Unit!18104) )
))
(declare-fun lt!263776 () Unit!18103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18103)

(assert (=> b!576659 (= lt!263776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576660 () Bool)

(declare-fun res!364784 () Bool)

(assert (=> b!576660 (=> (not res!364784) (not e!331776))))

(assert (=> b!576660 (= res!364784 (validKeyInArray!0 k0!1914))))

(declare-fun b!576661 () Bool)

(assert (=> b!576661 (= e!331775 (= (seekEntryOrOpen!0 (select (arr!17260 a!3118) j!142) a!3118 mask!3119) (Found!5665 j!142)))))

(declare-fun b!576655 () Bool)

(declare-fun res!364781 () Bool)

(assert (=> b!576655 (=> (not res!364781) (not e!331776))))

(assert (=> b!576655 (= res!364781 (and (= (size!17624 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17624 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17624 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!364787 () Bool)

(assert (=> start!52926 (=> (not res!364787) (not e!331776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52926 (= res!364787 (validMask!0 mask!3119))))

(assert (=> start!52926 e!331776))

(assert (=> start!52926 true))

(declare-fun array_inv!13119 (array!35961) Bool)

(assert (=> start!52926 (array_inv!13119 a!3118)))

(assert (= (and start!52926 res!364787) b!576655))

(assert (= (and b!576655 res!364781) b!576658))

(assert (= (and b!576658 res!364786) b!576660))

(assert (= (and b!576660 res!364784) b!576652))

(assert (= (and b!576652 res!364785) b!576653))

(assert (= (and b!576653 res!364780) b!576654))

(assert (= (and b!576654 res!364783) b!576656))

(assert (= (and b!576656 res!364788) b!576657))

(assert (= (and b!576657 res!364782) b!576659))

(assert (= (and b!576659 res!364789) b!576661))

(declare-fun m!555755 () Bool)

(assert (=> b!576653 m!555755))

(declare-fun m!555757 () Bool)

(assert (=> b!576657 m!555757))

(declare-fun m!555759 () Bool)

(assert (=> b!576657 m!555759))

(assert (=> b!576657 m!555757))

(declare-fun m!555761 () Bool)

(assert (=> b!576657 m!555761))

(declare-fun m!555763 () Bool)

(assert (=> b!576657 m!555763))

(assert (=> b!576657 m!555761))

(declare-fun m!555765 () Bool)

(assert (=> b!576657 m!555765))

(assert (=> b!576657 m!555759))

(assert (=> b!576657 m!555757))

(declare-fun m!555767 () Bool)

(assert (=> b!576657 m!555767))

(declare-fun m!555769 () Bool)

(assert (=> b!576657 m!555769))

(assert (=> b!576657 m!555761))

(assert (=> b!576657 m!555763))

(assert (=> b!576658 m!555757))

(assert (=> b!576658 m!555757))

(declare-fun m!555771 () Bool)

(assert (=> b!576658 m!555771))

(declare-fun m!555773 () Bool)

(assert (=> b!576654 m!555773))

(declare-fun m!555775 () Bool)

(assert (=> start!52926 m!555775))

(declare-fun m!555777 () Bool)

(assert (=> start!52926 m!555777))

(assert (=> b!576661 m!555757))

(assert (=> b!576661 m!555757))

(declare-fun m!555779 () Bool)

(assert (=> b!576661 m!555779))

(declare-fun m!555781 () Bool)

(assert (=> b!576656 m!555781))

(declare-fun m!555783 () Bool)

(assert (=> b!576652 m!555783))

(declare-fun m!555785 () Bool)

(assert (=> b!576660 m!555785))

(declare-fun m!555787 () Bool)

(assert (=> b!576659 m!555787))

(declare-fun m!555789 () Bool)

(assert (=> b!576659 m!555789))

(check-sat (not b!576661) (not b!576656) (not b!576658) (not b!576660) (not b!576653) (not b!576652) (not b!576654) (not start!52926) (not b!576659) (not b!576657))
(check-sat)
