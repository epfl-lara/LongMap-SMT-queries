; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50334 () Bool)

(assert start!50334)

(declare-fun b!550742 () Bool)

(declare-fun res!343705 () Bool)

(declare-fun e!317902 () Bool)

(assert (=> b!550742 (=> (not res!343705) (not e!317902))))

(declare-datatypes ((array!34730 0))(
  ( (array!34731 (arr!16679 (Array (_ BitVec 32) (_ BitVec 64))) (size!17043 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34730)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550742 (= res!343705 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550743 () Bool)

(declare-fun e!317901 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!550743 (= e!317901 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!317903 () Bool)

(assert (=> b!550743 e!317903))

(declare-fun res!343710 () Bool)

(assert (=> b!550743 (=> (not res!343710) (not e!317903))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34730 (_ BitVec 32)) Bool)

(assert (=> b!550743 (= res!343710 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17030 0))(
  ( (Unit!17031) )
))
(declare-fun lt!250612 () Unit!17030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17030)

(assert (=> b!550743 (= lt!250612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550744 () Bool)

(declare-fun res!343709 () Bool)

(assert (=> b!550744 (=> (not res!343709) (not e!317901))))

(assert (=> b!550744 (= res!343709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550746 () Bool)

(declare-fun res!343707 () Bool)

(assert (=> b!550746 (=> (not res!343707) (not e!317902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550746 (= res!343707 (validKeyInArray!0 k!1914))))

(declare-fun b!550747 () Bool)

(declare-fun res!343711 () Bool)

(assert (=> b!550747 (=> (not res!343711) (not e!317901))))

(declare-datatypes ((List!10759 0))(
  ( (Nil!10756) (Cons!10755 (h!11731 (_ BitVec 64)) (t!16987 List!10759)) )
))
(declare-fun arrayNoDuplicates!0 (array!34730 (_ BitVec 32) List!10759) Bool)

(assert (=> b!550747 (= res!343711 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10756))))

(declare-fun b!550748 () Bool)

(declare-fun res!343703 () Bool)

(assert (=> b!550748 (=> (not res!343703) (not e!317902))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550748 (= res!343703 (and (= (size!17043 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17043 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17043 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550749 () Bool)

(declare-fun res!343704 () Bool)

(assert (=> b!550749 (=> (not res!343704) (not e!317901))))

(declare-datatypes ((SeekEntryResult!5128 0))(
  ( (MissingZero!5128 (index!22739 (_ BitVec 32))) (Found!5128 (index!22740 (_ BitVec 32))) (Intermediate!5128 (undefined!5940 Bool) (index!22741 (_ BitVec 32)) (x!51664 (_ BitVec 32))) (Undefined!5128) (MissingVacant!5128 (index!22742 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34730 (_ BitVec 32)) SeekEntryResult!5128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550749 (= res!343704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16679 a!3118) j!142) mask!3119) (select (arr!16679 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16679 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16679 a!3118) i!1132 k!1914) j!142) (array!34731 (store (arr!16679 a!3118) i!1132 k!1914) (size!17043 a!3118)) mask!3119)))))

(declare-fun b!550750 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34730 (_ BitVec 32)) SeekEntryResult!5128)

(assert (=> b!550750 (= e!317903 (= (seekEntryOrOpen!0 (select (arr!16679 a!3118) j!142) a!3118 mask!3119) (Found!5128 j!142)))))

(declare-fun b!550751 () Bool)

(declare-fun res!343712 () Bool)

(assert (=> b!550751 (=> (not res!343712) (not e!317902))))

(assert (=> b!550751 (= res!343712 (validKeyInArray!0 (select (arr!16679 a!3118) j!142)))))

(declare-fun res!343708 () Bool)

(assert (=> start!50334 (=> (not res!343708) (not e!317902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50334 (= res!343708 (validMask!0 mask!3119))))

(assert (=> start!50334 e!317902))

(assert (=> start!50334 true))

(declare-fun array_inv!12475 (array!34730) Bool)

(assert (=> start!50334 (array_inv!12475 a!3118)))

(declare-fun b!550745 () Bool)

(assert (=> b!550745 (= e!317902 e!317901)))

(declare-fun res!343706 () Bool)

(assert (=> b!550745 (=> (not res!343706) (not e!317901))))

(declare-fun lt!250611 () SeekEntryResult!5128)

(assert (=> b!550745 (= res!343706 (or (= lt!250611 (MissingZero!5128 i!1132)) (= lt!250611 (MissingVacant!5128 i!1132))))))

(assert (=> b!550745 (= lt!250611 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50334 res!343708) b!550748))

(assert (= (and b!550748 res!343703) b!550751))

(assert (= (and b!550751 res!343712) b!550746))

(assert (= (and b!550746 res!343707) b!550742))

(assert (= (and b!550742 res!343705) b!550745))

(assert (= (and b!550745 res!343706) b!550744))

(assert (= (and b!550744 res!343709) b!550747))

(assert (= (and b!550747 res!343711) b!550749))

(assert (= (and b!550749 res!343704) b!550743))

(assert (= (and b!550743 res!343710) b!550750))

(declare-fun m!527733 () Bool)

(assert (=> b!550747 m!527733))

(declare-fun m!527735 () Bool)

(assert (=> b!550751 m!527735))

(assert (=> b!550751 m!527735))

(declare-fun m!527737 () Bool)

(assert (=> b!550751 m!527737))

(declare-fun m!527739 () Bool)

(assert (=> b!550743 m!527739))

(declare-fun m!527741 () Bool)

(assert (=> b!550743 m!527741))

(declare-fun m!527743 () Bool)

(assert (=> b!550744 m!527743))

(assert (=> b!550750 m!527735))

(assert (=> b!550750 m!527735))

(declare-fun m!527745 () Bool)

(assert (=> b!550750 m!527745))

(declare-fun m!527747 () Bool)

(assert (=> b!550745 m!527747))

(assert (=> b!550749 m!527735))

(declare-fun m!527749 () Bool)

(assert (=> b!550749 m!527749))

(assert (=> b!550749 m!527735))

(declare-fun m!527751 () Bool)

(assert (=> b!550749 m!527751))

(declare-fun m!527753 () Bool)

(assert (=> b!550749 m!527753))

(assert (=> b!550749 m!527751))

(declare-fun m!527755 () Bool)

(assert (=> b!550749 m!527755))

(assert (=> b!550749 m!527749))

(assert (=> b!550749 m!527735))

(declare-fun m!527757 () Bool)

(assert (=> b!550749 m!527757))

(declare-fun m!527759 () Bool)

(assert (=> b!550749 m!527759))

(assert (=> b!550749 m!527751))

(assert (=> b!550749 m!527753))

(declare-fun m!527761 () Bool)

(assert (=> start!50334 m!527761))

(declare-fun m!527763 () Bool)

(assert (=> start!50334 m!527763))

(declare-fun m!527765 () Bool)

(assert (=> b!550742 m!527765))

(declare-fun m!527767 () Bool)

(assert (=> b!550746 m!527767))

(push 1)

(assert (not b!550750))

(assert (not b!550743))

(assert (not b!550751))

