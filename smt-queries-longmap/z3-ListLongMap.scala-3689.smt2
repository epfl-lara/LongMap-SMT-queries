; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50752 () Bool)

(assert start!50752)

(declare-fun b!555144 () Bool)

(declare-fun res!347560 () Bool)

(declare-fun e!320005 () Bool)

(assert (=> b!555144 (=> (not res!347560) (not e!320005))))

(declare-datatypes ((array!34977 0))(
  ( (array!34978 (arr!16798 (Array (_ BitVec 32) (_ BitVec 64))) (size!17162 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34977)

(declare-datatypes ((List!10878 0))(
  ( (Nil!10875) (Cons!10874 (h!11859 (_ BitVec 64)) (t!17106 List!10878)) )
))
(declare-fun arrayNoDuplicates!0 (array!34977 (_ BitVec 32) List!10878) Bool)

(assert (=> b!555144 (= res!347560 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10875))))

(declare-fun res!347563 () Bool)

(declare-fun e!320006 () Bool)

(assert (=> start!50752 (=> (not res!347563) (not e!320006))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50752 (= res!347563 (validMask!0 mask!3119))))

(assert (=> start!50752 e!320006))

(assert (=> start!50752 true))

(declare-fun array_inv!12594 (array!34977) Bool)

(assert (=> start!50752 (array_inv!12594 a!3118)))

(declare-fun b!555145 () Bool)

(declare-fun res!347556 () Bool)

(assert (=> b!555145 (=> (not res!347556) (not e!320006))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555145 (= res!347556 (validKeyInArray!0 k0!1914))))

(declare-fun b!555146 () Bool)

(declare-fun res!347558 () Bool)

(assert (=> b!555146 (=> (not res!347558) (not e!320005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34977 (_ BitVec 32)) Bool)

(assert (=> b!555146 (= res!347558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555147 () Bool)

(declare-fun e!320004 () Bool)

(assert (=> b!555147 (= e!320004 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5247 0))(
  ( (MissingZero!5247 (index!23215 (_ BitVec 32))) (Found!5247 (index!23216 (_ BitVec 32))) (Intermediate!5247 (undefined!6059 Bool) (index!23217 (_ BitVec 32)) (x!52121 (_ BitVec 32))) (Undefined!5247) (MissingVacant!5247 (index!23218 (_ BitVec 32))) )
))
(declare-fun lt!252222 () SeekEntryResult!5247)

(declare-fun lt!252221 () SeekEntryResult!5247)

(get-info :version)

(assert (=> b!555147 (and (= lt!252222 (Found!5247 j!142)) (or (undefined!6059 lt!252221) (not ((_ is Intermediate!5247) lt!252221)) (= (select (arr!16798 a!3118) (index!23217 lt!252221)) (select (arr!16798 a!3118) j!142)) (not (= (select (arr!16798 a!3118) (index!23217 lt!252221)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252222 (MissingZero!5247 (index!23217 lt!252221)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34977 (_ BitVec 32)) SeekEntryResult!5247)

(assert (=> b!555147 (= lt!252222 (seekEntryOrOpen!0 (select (arr!16798 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555147 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17268 0))(
  ( (Unit!17269) )
))
(declare-fun lt!252219 () Unit!17268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17268)

(assert (=> b!555147 (= lt!252219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555148 () Bool)

(declare-fun res!347557 () Bool)

(assert (=> b!555148 (=> (not res!347557) (not e!320006))))

(assert (=> b!555148 (= res!347557 (validKeyInArray!0 (select (arr!16798 a!3118) j!142)))))

(declare-fun b!555149 () Bool)

(assert (=> b!555149 (= e!320006 e!320005)))

(declare-fun res!347559 () Bool)

(assert (=> b!555149 (=> (not res!347559) (not e!320005))))

(declare-fun lt!252218 () SeekEntryResult!5247)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555149 (= res!347559 (or (= lt!252218 (MissingZero!5247 i!1132)) (= lt!252218 (MissingVacant!5247 i!1132))))))

(assert (=> b!555149 (= lt!252218 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555150 () Bool)

(declare-fun res!347562 () Bool)

(assert (=> b!555150 (=> (not res!347562) (not e!320006))))

(declare-fun arrayContainsKey!0 (array!34977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555150 (= res!347562 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555151 () Bool)

(declare-fun res!347561 () Bool)

(assert (=> b!555151 (=> (not res!347561) (not e!320006))))

(assert (=> b!555151 (= res!347561 (and (= (size!17162 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17162 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17162 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555152 () Bool)

(assert (=> b!555152 (= e!320005 e!320004)))

(declare-fun res!347564 () Bool)

(assert (=> b!555152 (=> (not res!347564) (not e!320004))))

(declare-fun lt!252223 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34977 (_ BitVec 32)) SeekEntryResult!5247)

(assert (=> b!555152 (= res!347564 (= lt!252221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252223 (select (store (arr!16798 a!3118) i!1132 k0!1914) j!142) (array!34978 (store (arr!16798 a!3118) i!1132 k0!1914) (size!17162 a!3118)) mask!3119)))))

(declare-fun lt!252220 () (_ BitVec 32))

(assert (=> b!555152 (= lt!252221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252220 (select (arr!16798 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555152 (= lt!252223 (toIndex!0 (select (store (arr!16798 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555152 (= lt!252220 (toIndex!0 (select (arr!16798 a!3118) j!142) mask!3119))))

(assert (= (and start!50752 res!347563) b!555151))

(assert (= (and b!555151 res!347561) b!555148))

(assert (= (and b!555148 res!347557) b!555145))

(assert (= (and b!555145 res!347556) b!555150))

(assert (= (and b!555150 res!347562) b!555149))

(assert (= (and b!555149 res!347559) b!555146))

(assert (= (and b!555146 res!347558) b!555144))

(assert (= (and b!555144 res!347560) b!555152))

(assert (= (and b!555152 res!347564) b!555147))

(declare-fun m!532709 () Bool)

(assert (=> b!555147 m!532709))

(declare-fun m!532711 () Bool)

(assert (=> b!555147 m!532711))

(declare-fun m!532713 () Bool)

(assert (=> b!555147 m!532713))

(declare-fun m!532715 () Bool)

(assert (=> b!555147 m!532715))

(assert (=> b!555147 m!532709))

(declare-fun m!532717 () Bool)

(assert (=> b!555147 m!532717))

(assert (=> b!555152 m!532709))

(declare-fun m!532719 () Bool)

(assert (=> b!555152 m!532719))

(assert (=> b!555152 m!532709))

(declare-fun m!532721 () Bool)

(assert (=> b!555152 m!532721))

(assert (=> b!555152 m!532721))

(declare-fun m!532723 () Bool)

(assert (=> b!555152 m!532723))

(declare-fun m!532725 () Bool)

(assert (=> b!555152 m!532725))

(assert (=> b!555152 m!532709))

(declare-fun m!532727 () Bool)

(assert (=> b!555152 m!532727))

(assert (=> b!555152 m!532721))

(declare-fun m!532729 () Bool)

(assert (=> b!555152 m!532729))

(assert (=> b!555148 m!532709))

(assert (=> b!555148 m!532709))

(declare-fun m!532731 () Bool)

(assert (=> b!555148 m!532731))

(declare-fun m!532733 () Bool)

(assert (=> b!555150 m!532733))

(declare-fun m!532735 () Bool)

(assert (=> b!555146 m!532735))

(declare-fun m!532737 () Bool)

(assert (=> b!555149 m!532737))

(declare-fun m!532739 () Bool)

(assert (=> b!555144 m!532739))

(declare-fun m!532741 () Bool)

(assert (=> start!50752 m!532741))

(declare-fun m!532743 () Bool)

(assert (=> start!50752 m!532743))

(declare-fun m!532745 () Bool)

(assert (=> b!555145 m!532745))

(check-sat (not b!555147) (not b!555146) (not start!50752) (not b!555149) (not b!555150) (not b!555145) (not b!555152) (not b!555144) (not b!555148))
(check-sat)
