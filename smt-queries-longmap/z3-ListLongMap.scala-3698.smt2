; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50806 () Bool)

(assert start!50806)

(declare-fun res!348286 () Bool)

(declare-fun e!320330 () Bool)

(assert (=> start!50806 (=> (not res!348286) (not e!320330))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50806 (= res!348286 (validMask!0 mask!3119))))

(assert (=> start!50806 e!320330))

(assert (=> start!50806 true))

(declare-datatypes ((array!35031 0))(
  ( (array!35032 (arr!16825 (Array (_ BitVec 32) (_ BitVec 64))) (size!17189 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35031)

(declare-fun array_inv!12621 (array!35031) Bool)

(assert (=> start!50806 (array_inv!12621 a!3118)))

(declare-fun b!555873 () Bool)

(declare-fun e!320331 () Bool)

(assert (=> b!555873 (= e!320330 e!320331)))

(declare-fun res!348291 () Bool)

(assert (=> b!555873 (=> (not res!348291) (not e!320331))))

(declare-datatypes ((SeekEntryResult!5274 0))(
  ( (MissingZero!5274 (index!23323 (_ BitVec 32))) (Found!5274 (index!23324 (_ BitVec 32))) (Intermediate!5274 (undefined!6086 Bool) (index!23325 (_ BitVec 32)) (x!52220 (_ BitVec 32))) (Undefined!5274) (MissingVacant!5274 (index!23326 (_ BitVec 32))) )
))
(declare-fun lt!252705 () SeekEntryResult!5274)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555873 (= res!348291 (or (= lt!252705 (MissingZero!5274 i!1132)) (= lt!252705 (MissingVacant!5274 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35031 (_ BitVec 32)) SeekEntryResult!5274)

(assert (=> b!555873 (= lt!252705 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555874 () Bool)

(declare-fun res!348290 () Bool)

(assert (=> b!555874 (=> (not res!348290) (not e!320330))))

(declare-fun arrayContainsKey!0 (array!35031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555874 (= res!348290 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555875 () Bool)

(declare-fun e!320329 () Bool)

(assert (=> b!555875 (= e!320329 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252708 () SeekEntryResult!5274)

(declare-fun lt!252709 () SeekEntryResult!5274)

(get-info :version)

(assert (=> b!555875 (and (= lt!252708 (Found!5274 j!142)) (or (undefined!6086 lt!252709) (not ((_ is Intermediate!5274) lt!252709)) (= (select (arr!16825 a!3118) (index!23325 lt!252709)) (select (arr!16825 a!3118) j!142)) (not (= (select (arr!16825 a!3118) (index!23325 lt!252709)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252708 (MissingZero!5274 (index!23325 lt!252709)))))))

(assert (=> b!555875 (= lt!252708 (seekEntryOrOpen!0 (select (arr!16825 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35031 (_ BitVec 32)) Bool)

(assert (=> b!555875 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17322 0))(
  ( (Unit!17323) )
))
(declare-fun lt!252706 () Unit!17322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17322)

(assert (=> b!555875 (= lt!252706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555876 () Bool)

(declare-fun res!348287 () Bool)

(assert (=> b!555876 (=> (not res!348287) (not e!320330))))

(assert (=> b!555876 (= res!348287 (and (= (size!17189 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17189 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17189 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555877 () Bool)

(declare-fun res!348285 () Bool)

(assert (=> b!555877 (=> (not res!348285) (not e!320331))))

(assert (=> b!555877 (= res!348285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555878 () Bool)

(declare-fun res!348288 () Bool)

(assert (=> b!555878 (=> (not res!348288) (not e!320331))))

(declare-datatypes ((List!10905 0))(
  ( (Nil!10902) (Cons!10901 (h!11886 (_ BitVec 64)) (t!17133 List!10905)) )
))
(declare-fun arrayNoDuplicates!0 (array!35031 (_ BitVec 32) List!10905) Bool)

(assert (=> b!555878 (= res!348288 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10902))))

(declare-fun b!555879 () Bool)

(declare-fun res!348293 () Bool)

(assert (=> b!555879 (=> (not res!348293) (not e!320330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555879 (= res!348293 (validKeyInArray!0 k0!1914))))

(declare-fun b!555880 () Bool)

(declare-fun res!348289 () Bool)

(assert (=> b!555880 (=> (not res!348289) (not e!320330))))

(assert (=> b!555880 (= res!348289 (validKeyInArray!0 (select (arr!16825 a!3118) j!142)))))

(declare-fun b!555881 () Bool)

(assert (=> b!555881 (= e!320331 e!320329)))

(declare-fun res!348292 () Bool)

(assert (=> b!555881 (=> (not res!348292) (not e!320329))))

(declare-fun lt!252704 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35031 (_ BitVec 32)) SeekEntryResult!5274)

(assert (=> b!555881 (= res!348292 (= lt!252709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252704 (select (store (arr!16825 a!3118) i!1132 k0!1914) j!142) (array!35032 (store (arr!16825 a!3118) i!1132 k0!1914) (size!17189 a!3118)) mask!3119)))))

(declare-fun lt!252707 () (_ BitVec 32))

(assert (=> b!555881 (= lt!252709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252707 (select (arr!16825 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555881 (= lt!252704 (toIndex!0 (select (store (arr!16825 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555881 (= lt!252707 (toIndex!0 (select (arr!16825 a!3118) j!142) mask!3119))))

(assert (= (and start!50806 res!348286) b!555876))

(assert (= (and b!555876 res!348287) b!555880))

(assert (= (and b!555880 res!348289) b!555879))

(assert (= (and b!555879 res!348293) b!555874))

(assert (= (and b!555874 res!348290) b!555873))

(assert (= (and b!555873 res!348291) b!555877))

(assert (= (and b!555877 res!348285) b!555878))

(assert (= (and b!555878 res!348288) b!555881))

(assert (= (and b!555881 res!348292) b!555875))

(declare-fun m!533735 () Bool)

(assert (=> b!555880 m!533735))

(assert (=> b!555880 m!533735))

(declare-fun m!533737 () Bool)

(assert (=> b!555880 m!533737))

(declare-fun m!533739 () Bool)

(assert (=> b!555877 m!533739))

(declare-fun m!533741 () Bool)

(assert (=> b!555879 m!533741))

(assert (=> b!555875 m!533735))

(declare-fun m!533743 () Bool)

(assert (=> b!555875 m!533743))

(declare-fun m!533745 () Bool)

(assert (=> b!555875 m!533745))

(declare-fun m!533747 () Bool)

(assert (=> b!555875 m!533747))

(assert (=> b!555875 m!533735))

(declare-fun m!533749 () Bool)

(assert (=> b!555875 m!533749))

(declare-fun m!533751 () Bool)

(assert (=> start!50806 m!533751))

(declare-fun m!533753 () Bool)

(assert (=> start!50806 m!533753))

(declare-fun m!533755 () Bool)

(assert (=> b!555874 m!533755))

(declare-fun m!533757 () Bool)

(assert (=> b!555878 m!533757))

(assert (=> b!555881 m!533735))

(declare-fun m!533759 () Bool)

(assert (=> b!555881 m!533759))

(declare-fun m!533761 () Bool)

(assert (=> b!555881 m!533761))

(declare-fun m!533763 () Bool)

(assert (=> b!555881 m!533763))

(assert (=> b!555881 m!533735))

(declare-fun m!533765 () Bool)

(assert (=> b!555881 m!533765))

(assert (=> b!555881 m!533735))

(assert (=> b!555881 m!533761))

(declare-fun m!533767 () Bool)

(assert (=> b!555881 m!533767))

(assert (=> b!555881 m!533761))

(declare-fun m!533769 () Bool)

(assert (=> b!555881 m!533769))

(declare-fun m!533771 () Bool)

(assert (=> b!555873 m!533771))

(check-sat (not b!555873) (not b!555877) (not b!555880) (not b!555874) (not b!555881) (not b!555875) (not b!555878) (not b!555879) (not start!50806))
(check-sat)
