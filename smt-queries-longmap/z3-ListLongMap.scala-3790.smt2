; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51960 () Bool)

(assert start!51960)

(declare-fun b!567703 () Bool)

(declare-fun res!358185 () Bool)

(declare-fun e!326675 () Bool)

(assert (=> b!567703 (=> (not res!358185) (not e!326675))))

(declare-datatypes ((array!35601 0))(
  ( (array!35602 (arr!17095 (Array (_ BitVec 32) (_ BitVec 64))) (size!17459 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35601)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35601 (_ BitVec 32)) Bool)

(assert (=> b!567703 (= res!358185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!358184 () Bool)

(declare-fun e!326676 () Bool)

(assert (=> start!51960 (=> (not res!358184) (not e!326676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51960 (= res!358184 (validMask!0 mask!3119))))

(assert (=> start!51960 e!326676))

(assert (=> start!51960 true))

(declare-fun array_inv!12954 (array!35601) Bool)

(assert (=> start!51960 (array_inv!12954 a!3118)))

(declare-fun b!567704 () Bool)

(declare-fun res!358189 () Bool)

(assert (=> b!567704 (=> (not res!358189) (not e!326676))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567704 (= res!358189 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!567705 () Bool)

(declare-fun e!326674 () Bool)

(declare-datatypes ((SeekEntryResult!5500 0))(
  ( (MissingZero!5500 (index!24227 (_ BitVec 32))) (Found!5500 (index!24228 (_ BitVec 32))) (Intermediate!5500 (undefined!6312 Bool) (index!24229 (_ BitVec 32)) (x!53248 (_ BitVec 32))) (Undefined!5500) (MissingVacant!5500 (index!24230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35601 (_ BitVec 32)) SeekEntryResult!5500)

(assert (=> b!567705 (= e!326674 (= (seekEntryOrOpen!0 (select (arr!17095 a!3118) j!142) a!3118 mask!3119) (Found!5500 j!142)))))

(declare-fun b!567706 () Bool)

(declare-fun res!358188 () Bool)

(assert (=> b!567706 (=> (not res!358188) (not e!326675))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35601 (_ BitVec 32)) SeekEntryResult!5500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567706 (= res!358188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17095 a!3118) j!142) mask!3119) (select (arr!17095 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17095 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17095 a!3118) i!1132 k0!1914) j!142) (array!35602 (store (arr!17095 a!3118) i!1132 k0!1914) (size!17459 a!3118)) mask!3119)))))

(declare-fun b!567707 () Bool)

(declare-fun res!358191 () Bool)

(assert (=> b!567707 (=> (not res!358191) (not e!326676))))

(assert (=> b!567707 (= res!358191 (and (= (size!17459 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17459 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17459 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567708 () Bool)

(declare-fun res!358190 () Bool)

(assert (=> b!567708 (=> (not res!358190) (not e!326676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567708 (= res!358190 (validKeyInArray!0 k0!1914))))

(declare-fun b!567709 () Bool)

(declare-fun res!358187 () Bool)

(assert (=> b!567709 (=> (not res!358187) (not e!326676))))

(assert (=> b!567709 (= res!358187 (validKeyInArray!0 (select (arr!17095 a!3118) j!142)))))

(declare-fun b!567710 () Bool)

(assert (=> b!567710 (= e!326676 e!326675)))

(declare-fun res!358192 () Bool)

(assert (=> b!567710 (=> (not res!358192) (not e!326675))))

(declare-fun lt!258640 () SeekEntryResult!5500)

(assert (=> b!567710 (= res!358192 (or (= lt!258640 (MissingZero!5500 i!1132)) (= lt!258640 (MissingVacant!5500 i!1132))))))

(assert (=> b!567710 (= lt!258640 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567711 () Bool)

(declare-fun res!358186 () Bool)

(assert (=> b!567711 (=> (not res!358186) (not e!326675))))

(declare-datatypes ((List!11082 0))(
  ( (Nil!11079) (Cons!11078 (h!12093 (_ BitVec 64)) (t!17302 List!11082)) )
))
(declare-fun arrayNoDuplicates!0 (array!35601 (_ BitVec 32) List!11082) Bool)

(assert (=> b!567711 (= res!358186 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11079))))

(declare-fun b!567712 () Bool)

(assert (=> b!567712 (= e!326675 (not true))))

(assert (=> b!567712 e!326674))

(declare-fun res!358183 () Bool)

(assert (=> b!567712 (=> (not res!358183) (not e!326674))))

(assert (=> b!567712 (= res!358183 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17773 0))(
  ( (Unit!17774) )
))
(declare-fun lt!258639 () Unit!17773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17773)

(assert (=> b!567712 (= lt!258639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51960 res!358184) b!567707))

(assert (= (and b!567707 res!358191) b!567709))

(assert (= (and b!567709 res!358187) b!567708))

(assert (= (and b!567708 res!358190) b!567704))

(assert (= (and b!567704 res!358189) b!567710))

(assert (= (and b!567710 res!358192) b!567703))

(assert (= (and b!567703 res!358185) b!567711))

(assert (= (and b!567711 res!358186) b!567706))

(assert (= (and b!567706 res!358188) b!567712))

(assert (= (and b!567712 res!358183) b!567705))

(declare-fun m!546443 () Bool)

(assert (=> b!567705 m!546443))

(assert (=> b!567705 m!546443))

(declare-fun m!546445 () Bool)

(assert (=> b!567705 m!546445))

(assert (=> b!567706 m!546443))

(declare-fun m!546447 () Bool)

(assert (=> b!567706 m!546447))

(assert (=> b!567706 m!546443))

(declare-fun m!546449 () Bool)

(assert (=> b!567706 m!546449))

(declare-fun m!546451 () Bool)

(assert (=> b!567706 m!546451))

(assert (=> b!567706 m!546449))

(declare-fun m!546453 () Bool)

(assert (=> b!567706 m!546453))

(assert (=> b!567706 m!546447))

(assert (=> b!567706 m!546443))

(declare-fun m!546455 () Bool)

(assert (=> b!567706 m!546455))

(declare-fun m!546457 () Bool)

(assert (=> b!567706 m!546457))

(assert (=> b!567706 m!546449))

(assert (=> b!567706 m!546451))

(declare-fun m!546459 () Bool)

(assert (=> b!567712 m!546459))

(declare-fun m!546461 () Bool)

(assert (=> b!567712 m!546461))

(assert (=> b!567709 m!546443))

(assert (=> b!567709 m!546443))

(declare-fun m!546463 () Bool)

(assert (=> b!567709 m!546463))

(declare-fun m!546465 () Bool)

(assert (=> start!51960 m!546465))

(declare-fun m!546467 () Bool)

(assert (=> start!51960 m!546467))

(declare-fun m!546469 () Bool)

(assert (=> b!567711 m!546469))

(declare-fun m!546471 () Bool)

(assert (=> b!567703 m!546471))

(declare-fun m!546473 () Bool)

(assert (=> b!567710 m!546473))

(declare-fun m!546475 () Bool)

(assert (=> b!567708 m!546475))

(declare-fun m!546477 () Bool)

(assert (=> b!567704 m!546477))

(check-sat (not b!567704) (not b!567703) (not b!567708) (not start!51960) (not b!567710) (not b!567711) (not b!567706) (not b!567709) (not b!567705) (not b!567712))
(check-sat)
