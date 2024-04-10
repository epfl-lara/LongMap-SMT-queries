; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52188 () Bool)

(assert start!52188)

(declare-fun b!569697 () Bool)

(declare-fun e!327693 () Bool)

(declare-fun e!327694 () Bool)

(assert (=> b!569697 (= e!327693 e!327694)))

(declare-fun res!359718 () Bool)

(assert (=> b!569697 (=> (not res!359718) (not e!327694))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5596 0))(
  ( (MissingZero!5596 (index!24611 (_ BitVec 32))) (Found!5596 (index!24612 (_ BitVec 32))) (Intermediate!5596 (undefined!6408 Bool) (index!24613 (_ BitVec 32)) (x!53479 (_ BitVec 32))) (Undefined!5596) (MissingVacant!5596 (index!24614 (_ BitVec 32))) )
))
(declare-fun lt!259719 () SeekEntryResult!5596)

(declare-fun lt!259715 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35711 0))(
  ( (array!35712 (arr!17147 (Array (_ BitVec 32) (_ BitVec 64))) (size!17511 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35711 (_ BitVec 32)) SeekEntryResult!5596)

(assert (=> b!569697 (= res!359718 (= lt!259719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259715 (select (store (arr!17147 a!3118) i!1132 k!1914) j!142) (array!35712 (store (arr!17147 a!3118) i!1132 k!1914) (size!17511 a!3118)) mask!3119)))))

(declare-fun lt!259718 () (_ BitVec 32))

(assert (=> b!569697 (= lt!259719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259718 (select (arr!17147 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569697 (= lt!259715 (toIndex!0 (select (store (arr!17147 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569697 (= lt!259718 (toIndex!0 (select (arr!17147 a!3118) j!142) mask!3119))))

(declare-fun b!569698 () Bool)

(declare-fun res!359723 () Bool)

(declare-fun e!327695 () Bool)

(assert (=> b!569698 (=> (not res!359723) (not e!327695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569698 (= res!359723 (validKeyInArray!0 k!1914))))

(declare-fun b!569699 () Bool)

(declare-fun res!359719 () Bool)

(assert (=> b!569699 (=> (not res!359719) (not e!327693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35711 (_ BitVec 32)) Bool)

(assert (=> b!569699 (= res!359719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569700 () Bool)

(assert (=> b!569700 (= e!327694 (not true))))

(declare-fun lt!259717 () SeekEntryResult!5596)

(assert (=> b!569700 (and (= lt!259717 (Found!5596 j!142)) (or (undefined!6408 lt!259719) (not (is-Intermediate!5596 lt!259719)) (= (select (arr!17147 a!3118) (index!24613 lt!259719)) (select (arr!17147 a!3118) j!142)) (not (= (select (arr!17147 a!3118) (index!24613 lt!259719)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259717 (MissingZero!5596 (index!24613 lt!259719)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35711 (_ BitVec 32)) SeekEntryResult!5596)

(assert (=> b!569700 (= lt!259717 (seekEntryOrOpen!0 (select (arr!17147 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569700 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17894 0))(
  ( (Unit!17895) )
))
(declare-fun lt!259716 () Unit!17894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17894)

(assert (=> b!569700 (= lt!259716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359717 () Bool)

(assert (=> start!52188 (=> (not res!359717) (not e!327695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52188 (= res!359717 (validMask!0 mask!3119))))

(assert (=> start!52188 e!327695))

(assert (=> start!52188 true))

(declare-fun array_inv!12943 (array!35711) Bool)

(assert (=> start!52188 (array_inv!12943 a!3118)))

(declare-fun b!569701 () Bool)

(declare-fun res!359721 () Bool)

(assert (=> b!569701 (=> (not res!359721) (not e!327695))))

(declare-fun arrayContainsKey!0 (array!35711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569701 (= res!359721 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569702 () Bool)

(declare-fun res!359715 () Bool)

(assert (=> b!569702 (=> (not res!359715) (not e!327695))))

(assert (=> b!569702 (= res!359715 (validKeyInArray!0 (select (arr!17147 a!3118) j!142)))))

(declare-fun b!569703 () Bool)

(declare-fun res!359720 () Bool)

(assert (=> b!569703 (=> (not res!359720) (not e!327695))))

(assert (=> b!569703 (= res!359720 (and (= (size!17511 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17511 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17511 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569704 () Bool)

(assert (=> b!569704 (= e!327695 e!327693)))

(declare-fun res!359716 () Bool)

(assert (=> b!569704 (=> (not res!359716) (not e!327693))))

(declare-fun lt!259720 () SeekEntryResult!5596)

(assert (=> b!569704 (= res!359716 (or (= lt!259720 (MissingZero!5596 i!1132)) (= lt!259720 (MissingVacant!5596 i!1132))))))

(assert (=> b!569704 (= lt!259720 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569705 () Bool)

(declare-fun res!359722 () Bool)

(assert (=> b!569705 (=> (not res!359722) (not e!327693))))

(declare-datatypes ((List!11227 0))(
  ( (Nil!11224) (Cons!11223 (h!12244 (_ BitVec 64)) (t!17455 List!11227)) )
))
(declare-fun arrayNoDuplicates!0 (array!35711 (_ BitVec 32) List!11227) Bool)

(assert (=> b!569705 (= res!359722 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11224))))

(assert (= (and start!52188 res!359717) b!569703))

(assert (= (and b!569703 res!359720) b!569702))

(assert (= (and b!569702 res!359715) b!569698))

(assert (= (and b!569698 res!359723) b!569701))

(assert (= (and b!569701 res!359721) b!569704))

(assert (= (and b!569704 res!359716) b!569699))

(assert (= (and b!569699 res!359719) b!569705))

(assert (= (and b!569705 res!359722) b!569697))

(assert (= (and b!569697 res!359718) b!569700))

(declare-fun m!548533 () Bool)

(assert (=> b!569699 m!548533))

(declare-fun m!548535 () Bool)

(assert (=> b!569704 m!548535))

(declare-fun m!548537 () Bool)

(assert (=> b!569702 m!548537))

(assert (=> b!569702 m!548537))

(declare-fun m!548539 () Bool)

(assert (=> b!569702 m!548539))

(declare-fun m!548541 () Bool)

(assert (=> b!569701 m!548541))

(declare-fun m!548543 () Bool)

(assert (=> b!569700 m!548543))

(assert (=> b!569700 m!548537))

(declare-fun m!548545 () Bool)

(assert (=> b!569700 m!548545))

(declare-fun m!548547 () Bool)

(assert (=> b!569700 m!548547))

(assert (=> b!569700 m!548537))

(declare-fun m!548549 () Bool)

(assert (=> b!569700 m!548549))

(declare-fun m!548551 () Bool)

(assert (=> b!569698 m!548551))

(declare-fun m!548553 () Bool)

(assert (=> start!52188 m!548553))

(declare-fun m!548555 () Bool)

(assert (=> start!52188 m!548555))

(declare-fun m!548557 () Bool)

(assert (=> b!569705 m!548557))

(assert (=> b!569697 m!548537))

(declare-fun m!548559 () Bool)

(assert (=> b!569697 m!548559))

(declare-fun m!548561 () Bool)

(assert (=> b!569697 m!548561))

(declare-fun m!548563 () Bool)

(assert (=> b!569697 m!548563))

(assert (=> b!569697 m!548537))

(assert (=> b!569697 m!548561))

(assert (=> b!569697 m!548537))

(declare-fun m!548565 () Bool)

(assert (=> b!569697 m!548565))

(declare-fun m!548567 () Bool)

(assert (=> b!569697 m!548567))

(assert (=> b!569697 m!548561))

(declare-fun m!548569 () Bool)

(assert (=> b!569697 m!548569))

(push 1)

