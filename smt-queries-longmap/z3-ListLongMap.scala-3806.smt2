; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52178 () Bool)

(assert start!52178)

(declare-fun b!569453 () Bool)

(declare-fun res!359614 () Bool)

(declare-fun e!327534 () Bool)

(assert (=> b!569453 (=> (not res!359614) (not e!327534))))

(declare-datatypes ((array!35710 0))(
  ( (array!35711 (arr!17147 (Array (_ BitVec 32) (_ BitVec 64))) (size!17512 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35710)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35710 (_ BitVec 32)) Bool)

(assert (=> b!569453 (= res!359614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569454 () Bool)

(declare-fun res!359620 () Bool)

(declare-fun e!327532 () Bool)

(assert (=> b!569454 (=> (not res!359620) (not e!327532))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569454 (= res!359620 (and (= (size!17512 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17512 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17512 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359615 () Bool)

(assert (=> start!52178 (=> (not res!359615) (not e!327532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52178 (= res!359615 (validMask!0 mask!3119))))

(assert (=> start!52178 e!327532))

(assert (=> start!52178 true))

(declare-fun array_inv!13030 (array!35710) Bool)

(assert (=> start!52178 (array_inv!13030 a!3118)))

(declare-fun b!569455 () Bool)

(declare-fun res!359613 () Bool)

(assert (=> b!569455 (=> (not res!359613) (not e!327532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569455 (= res!359613 (validKeyInArray!0 (select (arr!17147 a!3118) j!142)))))

(declare-fun b!569456 () Bool)

(declare-fun e!327531 () Bool)

(assert (=> b!569456 (= e!327531 (not true))))

(declare-datatypes ((SeekEntryResult!5593 0))(
  ( (MissingZero!5593 (index!24599 (_ BitVec 32))) (Found!5593 (index!24600 (_ BitVec 32))) (Intermediate!5593 (undefined!6405 Bool) (index!24601 (_ BitVec 32)) (x!53479 (_ BitVec 32))) (Undefined!5593) (MissingVacant!5593 (index!24602 (_ BitVec 32))) )
))
(declare-fun lt!259502 () SeekEntryResult!5593)

(declare-fun lt!259500 () SeekEntryResult!5593)

(get-info :version)

(assert (=> b!569456 (and (= lt!259500 (Found!5593 j!142)) (or (undefined!6405 lt!259502) (not ((_ is Intermediate!5593) lt!259502)) (= (select (arr!17147 a!3118) (index!24601 lt!259502)) (select (arr!17147 a!3118) j!142)) (not (= (select (arr!17147 a!3118) (index!24601 lt!259502)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259500 (MissingZero!5593 (index!24601 lt!259502)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35710 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!569456 (= lt!259500 (seekEntryOrOpen!0 (select (arr!17147 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569456 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17874 0))(
  ( (Unit!17875) )
))
(declare-fun lt!259503 () Unit!17874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17874)

(assert (=> b!569456 (= lt!259503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569457 () Bool)

(assert (=> b!569457 (= e!327532 e!327534)))

(declare-fun res!359616 () Bool)

(assert (=> b!569457 (=> (not res!359616) (not e!327534))))

(declare-fun lt!259499 () SeekEntryResult!5593)

(assert (=> b!569457 (= res!359616 (or (= lt!259499 (MissingZero!5593 i!1132)) (= lt!259499 (MissingVacant!5593 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569457 (= lt!259499 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569458 () Bool)

(assert (=> b!569458 (= e!327534 e!327531)))

(declare-fun res!359621 () Bool)

(assert (=> b!569458 (=> (not res!359621) (not e!327531))))

(declare-fun lt!259501 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35710 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!569458 (= res!359621 (= lt!259502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259501 (select (store (arr!17147 a!3118) i!1132 k0!1914) j!142) (array!35711 (store (arr!17147 a!3118) i!1132 k0!1914) (size!17512 a!3118)) mask!3119)))))

(declare-fun lt!259504 () (_ BitVec 32))

(assert (=> b!569458 (= lt!259502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259504 (select (arr!17147 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569458 (= lt!259501 (toIndex!0 (select (store (arr!17147 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569458 (= lt!259504 (toIndex!0 (select (arr!17147 a!3118) j!142) mask!3119))))

(declare-fun b!569459 () Bool)

(declare-fun res!359618 () Bool)

(assert (=> b!569459 (=> (not res!359618) (not e!327534))))

(declare-datatypes ((List!11266 0))(
  ( (Nil!11263) (Cons!11262 (h!12283 (_ BitVec 64)) (t!17485 List!11266)) )
))
(declare-fun arrayNoDuplicates!0 (array!35710 (_ BitVec 32) List!11266) Bool)

(assert (=> b!569459 (= res!359618 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11263))))

(declare-fun b!569460 () Bool)

(declare-fun res!359619 () Bool)

(assert (=> b!569460 (=> (not res!359619) (not e!327532))))

(declare-fun arrayContainsKey!0 (array!35710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569460 (= res!359619 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569461 () Bool)

(declare-fun res!359617 () Bool)

(assert (=> b!569461 (=> (not res!359617) (not e!327532))))

(assert (=> b!569461 (= res!359617 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52178 res!359615) b!569454))

(assert (= (and b!569454 res!359620) b!569455))

(assert (= (and b!569455 res!359613) b!569461))

(assert (= (and b!569461 res!359617) b!569460))

(assert (= (and b!569460 res!359619) b!569457))

(assert (= (and b!569457 res!359616) b!569453))

(assert (= (and b!569453 res!359614) b!569459))

(assert (= (and b!569459 res!359618) b!569458))

(assert (= (and b!569458 res!359621) b!569456))

(declare-fun m!547799 () Bool)

(assert (=> b!569458 m!547799))

(declare-fun m!547801 () Bool)

(assert (=> b!569458 m!547801))

(assert (=> b!569458 m!547799))

(declare-fun m!547803 () Bool)

(assert (=> b!569458 m!547803))

(assert (=> b!569458 m!547799))

(declare-fun m!547805 () Bool)

(assert (=> b!569458 m!547805))

(declare-fun m!547807 () Bool)

(assert (=> b!569458 m!547807))

(assert (=> b!569458 m!547805))

(declare-fun m!547809 () Bool)

(assert (=> b!569458 m!547809))

(assert (=> b!569458 m!547805))

(declare-fun m!547811 () Bool)

(assert (=> b!569458 m!547811))

(declare-fun m!547813 () Bool)

(assert (=> b!569453 m!547813))

(declare-fun m!547815 () Bool)

(assert (=> start!52178 m!547815))

(declare-fun m!547817 () Bool)

(assert (=> start!52178 m!547817))

(declare-fun m!547819 () Bool)

(assert (=> b!569457 m!547819))

(assert (=> b!569456 m!547799))

(declare-fun m!547821 () Bool)

(assert (=> b!569456 m!547821))

(declare-fun m!547823 () Bool)

(assert (=> b!569456 m!547823))

(declare-fun m!547825 () Bool)

(assert (=> b!569456 m!547825))

(assert (=> b!569456 m!547799))

(declare-fun m!547827 () Bool)

(assert (=> b!569456 m!547827))

(declare-fun m!547829 () Bool)

(assert (=> b!569459 m!547829))

(assert (=> b!569455 m!547799))

(assert (=> b!569455 m!547799))

(declare-fun m!547831 () Bool)

(assert (=> b!569455 m!547831))

(declare-fun m!547833 () Bool)

(assert (=> b!569460 m!547833))

(declare-fun m!547835 () Bool)

(assert (=> b!569461 m!547835))

(check-sat (not b!569453) (not b!569458) (not start!52178) (not b!569456) (not b!569459) (not b!569457) (not b!569461) (not b!569455) (not b!569460))
(check-sat)
