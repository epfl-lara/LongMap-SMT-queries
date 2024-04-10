; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51358 () Bool)

(assert start!51358)

(declare-fun b!560672 () Bool)

(declare-fun res!351834 () Bool)

(declare-fun e!323048 () Bool)

(assert (=> b!560672 (=> (not res!351834) (not e!323048))))

(declare-datatypes ((array!35223 0))(
  ( (array!35224 (arr!16912 (Array (_ BitVec 32) (_ BitVec 64))) (size!17276 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35223)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560672 (= res!351834 (validKeyInArray!0 (select (arr!16912 a!3118) j!142)))))

(declare-fun b!560673 () Bool)

(declare-fun res!351835 () Bool)

(declare-fun e!323049 () Bool)

(assert (=> b!560673 (=> (not res!351835) (not e!323049))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35223 (_ BitVec 32)) Bool)

(assert (=> b!560673 (= res!351835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560674 () Bool)

(declare-fun e!323054 () Bool)

(declare-fun e!323050 () Bool)

(assert (=> b!560674 (= e!323054 e!323050)))

(declare-fun res!351836 () Bool)

(assert (=> b!560674 (=> (not res!351836) (not e!323050))))

(declare-datatypes ((SeekEntryResult!5361 0))(
  ( (MissingZero!5361 (index!23671 (_ BitVec 32))) (Found!5361 (index!23672 (_ BitVec 32))) (Intermediate!5361 (undefined!6173 Bool) (index!23673 (_ BitVec 32)) (x!52584 (_ BitVec 32))) (Undefined!5361) (MissingVacant!5361 (index!23674 (_ BitVec 32))) )
))
(declare-fun lt!254984 () SeekEntryResult!5361)

(declare-fun lt!254981 () SeekEntryResult!5361)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35223 (_ BitVec 32)) SeekEntryResult!5361)

(assert (=> b!560674 (= res!351836 (= lt!254981 (seekKeyOrZeroReturnVacant!0 (x!52584 lt!254984) (index!23673 lt!254984) (index!23673 lt!254984) (select (arr!16912 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560675 () Bool)

(assert (=> b!560675 (= e!323048 e!323049)))

(declare-fun res!351829 () Bool)

(assert (=> b!560675 (=> (not res!351829) (not e!323049))))

(declare-fun lt!254983 () SeekEntryResult!5361)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560675 (= res!351829 (or (= lt!254983 (MissingZero!5361 i!1132)) (= lt!254983 (MissingVacant!5361 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35223 (_ BitVec 32)) SeekEntryResult!5361)

(assert (=> b!560675 (= lt!254983 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560676 () Bool)

(declare-fun res!351833 () Bool)

(assert (=> b!560676 (=> (not res!351833) (not e!323048))))

(declare-fun arrayContainsKey!0 (array!35223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560676 (= res!351833 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560677 () Bool)

(declare-fun res!351827 () Bool)

(assert (=> b!560677 (=> (not res!351827) (not e!323048))))

(assert (=> b!560677 (= res!351827 (and (= (size!17276 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17276 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17276 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!351828 () Bool)

(assert (=> start!51358 (=> (not res!351828) (not e!323048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51358 (= res!351828 (validMask!0 mask!3119))))

(assert (=> start!51358 e!323048))

(assert (=> start!51358 true))

(declare-fun array_inv!12708 (array!35223) Bool)

(assert (=> start!51358 (array_inv!12708 a!3118)))

(declare-fun b!560678 () Bool)

(declare-fun e!323051 () Bool)

(declare-fun e!323053 () Bool)

(assert (=> b!560678 (= e!323051 e!323053)))

(declare-fun res!351832 () Bool)

(assert (=> b!560678 (=> res!351832 e!323053)))

(get-info :version)

(assert (=> b!560678 (= res!351832 (or (undefined!6173 lt!254984) (not ((_ is Intermediate!5361) lt!254984))))))

(declare-fun b!560679 () Bool)

(declare-fun e!323055 () Bool)

(assert (=> b!560679 (= e!323049 e!323055)))

(declare-fun res!351825 () Bool)

(assert (=> b!560679 (=> (not res!351825) (not e!323055))))

(declare-fun lt!254980 () (_ BitVec 32))

(declare-fun lt!254979 () (_ BitVec 64))

(declare-fun lt!254978 () array!35223)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35223 (_ BitVec 32)) SeekEntryResult!5361)

(assert (=> b!560679 (= res!351825 (= lt!254984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254980 lt!254979 lt!254978 mask!3119)))))

(declare-fun lt!254986 () (_ BitVec 32))

(assert (=> b!560679 (= lt!254984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254986 (select (arr!16912 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560679 (= lt!254980 (toIndex!0 lt!254979 mask!3119))))

(assert (=> b!560679 (= lt!254979 (select (store (arr!16912 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560679 (= lt!254986 (toIndex!0 (select (arr!16912 a!3118) j!142) mask!3119))))

(assert (=> b!560679 (= lt!254978 (array!35224 (store (arr!16912 a!3118) i!1132 k0!1914) (size!17276 a!3118)))))

(declare-fun b!560680 () Bool)

(assert (=> b!560680 (= e!323055 (not true))))

(assert (=> b!560680 e!323051))

(declare-fun res!351831 () Bool)

(assert (=> b!560680 (=> (not res!351831) (not e!323051))))

(assert (=> b!560680 (= res!351831 (= lt!254981 (Found!5361 j!142)))))

(assert (=> b!560680 (= lt!254981 (seekEntryOrOpen!0 (select (arr!16912 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560680 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17496 0))(
  ( (Unit!17497) )
))
(declare-fun lt!254982 () Unit!17496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17496)

(assert (=> b!560680 (= lt!254982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560681 () Bool)

(declare-fun res!351826 () Bool)

(assert (=> b!560681 (=> (not res!351826) (not e!323049))))

(declare-datatypes ((List!10992 0))(
  ( (Nil!10989) (Cons!10988 (h!11991 (_ BitVec 64)) (t!17220 List!10992)) )
))
(declare-fun arrayNoDuplicates!0 (array!35223 (_ BitVec 32) List!10992) Bool)

(assert (=> b!560681 (= res!351826 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10989))))

(declare-fun b!560682 () Bool)

(declare-fun res!351824 () Bool)

(assert (=> b!560682 (=> (not res!351824) (not e!323048))))

(assert (=> b!560682 (= res!351824 (validKeyInArray!0 k0!1914))))

(declare-fun b!560683 () Bool)

(assert (=> b!560683 (= e!323050 (= (seekEntryOrOpen!0 lt!254979 lt!254978 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52584 lt!254984) (index!23673 lt!254984) (index!23673 lt!254984) lt!254979 lt!254978 mask!3119)))))

(declare-fun b!560684 () Bool)

(assert (=> b!560684 (= e!323053 e!323054)))

(declare-fun res!351830 () Bool)

(assert (=> b!560684 (=> res!351830 e!323054)))

(declare-fun lt!254985 () (_ BitVec 64))

(assert (=> b!560684 (= res!351830 (or (= lt!254985 (select (arr!16912 a!3118) j!142)) (= lt!254985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560684 (= lt!254985 (select (arr!16912 a!3118) (index!23673 lt!254984)))))

(assert (= (and start!51358 res!351828) b!560677))

(assert (= (and b!560677 res!351827) b!560672))

(assert (= (and b!560672 res!351834) b!560682))

(assert (= (and b!560682 res!351824) b!560676))

(assert (= (and b!560676 res!351833) b!560675))

(assert (= (and b!560675 res!351829) b!560673))

(assert (= (and b!560673 res!351835) b!560681))

(assert (= (and b!560681 res!351826) b!560679))

(assert (= (and b!560679 res!351825) b!560680))

(assert (= (and b!560680 res!351831) b!560678))

(assert (= (and b!560678 (not res!351832)) b!560684))

(assert (= (and b!560684 (not res!351830)) b!560674))

(assert (= (and b!560674 res!351836) b!560683))

(declare-fun m!538469 () Bool)

(assert (=> b!560680 m!538469))

(assert (=> b!560680 m!538469))

(declare-fun m!538471 () Bool)

(assert (=> b!560680 m!538471))

(declare-fun m!538473 () Bool)

(assert (=> b!560680 m!538473))

(declare-fun m!538475 () Bool)

(assert (=> b!560680 m!538475))

(declare-fun m!538477 () Bool)

(assert (=> b!560673 m!538477))

(declare-fun m!538479 () Bool)

(assert (=> b!560683 m!538479))

(declare-fun m!538481 () Bool)

(assert (=> b!560683 m!538481))

(assert (=> b!560674 m!538469))

(assert (=> b!560674 m!538469))

(declare-fun m!538483 () Bool)

(assert (=> b!560674 m!538483))

(declare-fun m!538485 () Bool)

(assert (=> start!51358 m!538485))

(declare-fun m!538487 () Bool)

(assert (=> start!51358 m!538487))

(assert (=> b!560684 m!538469))

(declare-fun m!538489 () Bool)

(assert (=> b!560684 m!538489))

(declare-fun m!538491 () Bool)

(assert (=> b!560682 m!538491))

(assert (=> b!560672 m!538469))

(assert (=> b!560672 m!538469))

(declare-fun m!538493 () Bool)

(assert (=> b!560672 m!538493))

(declare-fun m!538495 () Bool)

(assert (=> b!560676 m!538495))

(declare-fun m!538497 () Bool)

(assert (=> b!560681 m!538497))

(assert (=> b!560679 m!538469))

(declare-fun m!538499 () Bool)

(assert (=> b!560679 m!538499))

(assert (=> b!560679 m!538469))

(declare-fun m!538501 () Bool)

(assert (=> b!560679 m!538501))

(declare-fun m!538503 () Bool)

(assert (=> b!560679 m!538503))

(assert (=> b!560679 m!538469))

(declare-fun m!538505 () Bool)

(assert (=> b!560679 m!538505))

(declare-fun m!538507 () Bool)

(assert (=> b!560679 m!538507))

(declare-fun m!538509 () Bool)

(assert (=> b!560679 m!538509))

(declare-fun m!538511 () Bool)

(assert (=> b!560675 m!538511))

(check-sat (not b!560683) (not b!560682) (not b!560675) (not b!560681) (not b!560672) (not start!51358) (not b!560679) (not b!560676) (not b!560674) (not b!560673) (not b!560680))
(check-sat)
