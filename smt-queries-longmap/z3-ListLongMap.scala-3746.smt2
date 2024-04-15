; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51458 () Bool)

(assert start!51458)

(declare-fun b!562547 () Bool)

(declare-fun e!324181 () Bool)

(declare-fun e!324182 () Bool)

(assert (=> b!562547 (= e!324181 e!324182)))

(declare-fun res!353851 () Bool)

(assert (=> b!562547 (=> res!353851 e!324182)))

(declare-datatypes ((SeekEntryResult!5413 0))(
  ( (MissingZero!5413 (index!23879 (_ BitVec 32))) (Found!5413 (index!23880 (_ BitVec 32))) (Intermediate!5413 (undefined!6225 Bool) (index!23881 (_ BitVec 32)) (x!52783 (_ BitVec 32))) (Undefined!5413) (MissingVacant!5413 (index!23882 (_ BitVec 32))) )
))
(declare-fun lt!256453 () SeekEntryResult!5413)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!256454 () (_ BitVec 64))

(declare-fun lt!256450 () SeekEntryResult!5413)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35332 0))(
  ( (array!35333 (arr!16967 (Array (_ BitVec 32) (_ BitVec 64))) (size!17332 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35332)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!256457 () SeekEntryResult!5413)

(assert (=> b!562547 (= res!353851 (or (bvslt (index!23881 lt!256457) #b00000000000000000000000000000000) (bvsge (index!23881 lt!256457) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52783 lt!256457) #b01111111111111111111111111111110) (bvslt (x!52783 lt!256457) #b00000000000000000000000000000000) (not (= lt!256454 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16967 a!3118) i!1132 k0!1914) (index!23881 lt!256457)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256450 lt!256453))))))

(declare-fun lt!256458 () SeekEntryResult!5413)

(declare-fun lt!256447 () SeekEntryResult!5413)

(assert (=> b!562547 (= lt!256458 lt!256447)))

(declare-fun lt!256455 () (_ BitVec 64))

(declare-fun lt!256448 () array!35332)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35332 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562547 (= lt!256447 (seekKeyOrZeroReturnVacant!0 (x!52783 lt!256457) (index!23881 lt!256457) (index!23881 lt!256457) lt!256455 lt!256448 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35332 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562547 (= lt!256458 (seekEntryOrOpen!0 lt!256455 lt!256448 mask!3119))))

(declare-fun lt!256452 () SeekEntryResult!5413)

(assert (=> b!562547 (= lt!256452 lt!256450)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562547 (= lt!256450 (seekKeyOrZeroReturnVacant!0 (x!52783 lt!256457) (index!23881 lt!256457) (index!23881 lt!256457) (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562548 () Bool)

(declare-fun e!324183 () Bool)

(declare-fun e!324184 () Bool)

(assert (=> b!562548 (= e!324183 e!324184)))

(declare-fun res!353847 () Bool)

(assert (=> b!562548 (=> (not res!353847) (not e!324184))))

(declare-fun lt!256446 () SeekEntryResult!5413)

(assert (=> b!562548 (= res!353847 (or (= lt!256446 (MissingZero!5413 i!1132)) (= lt!256446 (MissingVacant!5413 i!1132))))))

(assert (=> b!562548 (= lt!256446 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562549 () Bool)

(declare-fun e!324180 () Bool)

(declare-fun e!324186 () Bool)

(assert (=> b!562549 (= e!324180 (not e!324186))))

(declare-fun res!353842 () Bool)

(assert (=> b!562549 (=> res!353842 e!324186)))

(get-info :version)

(assert (=> b!562549 (= res!353842 (or (undefined!6225 lt!256457) (not ((_ is Intermediate!5413) lt!256457))))))

(assert (=> b!562549 (= lt!256452 lt!256453)))

(assert (=> b!562549 (= lt!256453 (Found!5413 j!142))))

(assert (=> b!562549 (= lt!256452 (seekEntryOrOpen!0 (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35332 (_ BitVec 32)) Bool)

(assert (=> b!562549 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17586 0))(
  ( (Unit!17587) )
))
(declare-fun lt!256449 () Unit!17586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17586)

(assert (=> b!562549 (= lt!256449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562550 () Bool)

(declare-fun res!353848 () Bool)

(assert (=> b!562550 (=> (not res!353848) (not e!324184))))

(declare-datatypes ((List!11086 0))(
  ( (Nil!11083) (Cons!11082 (h!12085 (_ BitVec 64)) (t!17305 List!11086)) )
))
(declare-fun arrayNoDuplicates!0 (array!35332 (_ BitVec 32) List!11086) Bool)

(assert (=> b!562550 (= res!353848 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11083))))

(declare-fun b!562551 () Bool)

(declare-fun res!353844 () Bool)

(assert (=> b!562551 (=> (not res!353844) (not e!324183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562551 (= res!353844 (validKeyInArray!0 (select (arr!16967 a!3118) j!142)))))

(declare-fun b!562552 () Bool)

(declare-fun res!353846 () Bool)

(assert (=> b!562552 (=> (not res!353846) (not e!324183))))

(assert (=> b!562552 (= res!353846 (and (= (size!17332 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17332 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17332 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562553 () Bool)

(declare-fun res!353841 () Bool)

(assert (=> b!562553 (=> (not res!353841) (not e!324183))))

(declare-fun arrayContainsKey!0 (array!35332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562553 (= res!353841 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!353849 () Bool)

(assert (=> start!51458 (=> (not res!353849) (not e!324183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51458 (= res!353849 (validMask!0 mask!3119))))

(assert (=> start!51458 e!324183))

(assert (=> start!51458 true))

(declare-fun array_inv!12850 (array!35332) Bool)

(assert (=> start!51458 (array_inv!12850 a!3118)))

(declare-fun b!562554 () Bool)

(declare-fun res!353852 () Bool)

(assert (=> b!562554 (=> (not res!353852) (not e!324183))))

(assert (=> b!562554 (= res!353852 (validKeyInArray!0 k0!1914))))

(declare-fun b!562555 () Bool)

(assert (=> b!562555 (= e!324184 e!324180)))

(declare-fun res!353843 () Bool)

(assert (=> b!562555 (=> (not res!353843) (not e!324180))))

(declare-fun lt!256451 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35332 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562555 (= res!353843 (= lt!256457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256451 lt!256455 lt!256448 mask!3119)))))

(declare-fun lt!256459 () (_ BitVec 32))

(assert (=> b!562555 (= lt!256457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256459 (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562555 (= lt!256451 (toIndex!0 lt!256455 mask!3119))))

(assert (=> b!562555 (= lt!256455 (select (store (arr!16967 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562555 (= lt!256459 (toIndex!0 (select (arr!16967 a!3118) j!142) mask!3119))))

(assert (=> b!562555 (= lt!256448 (array!35333 (store (arr!16967 a!3118) i!1132 k0!1914) (size!17332 a!3118)))))

(declare-fun b!562556 () Bool)

(assert (=> b!562556 (= e!324186 e!324181)))

(declare-fun res!353850 () Bool)

(assert (=> b!562556 (=> res!353850 e!324181)))

(assert (=> b!562556 (= res!353850 (or (= lt!256454 (select (arr!16967 a!3118) j!142)) (= lt!256454 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562556 (= lt!256454 (select (arr!16967 a!3118) (index!23881 lt!256457)))))

(declare-fun b!562557 () Bool)

(assert (=> b!562557 (= e!324182 true)))

(assert (=> b!562557 (= lt!256450 lt!256447)))

(declare-fun lt!256456 () Unit!17586)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35332 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17586)

(assert (=> b!562557 (= lt!256456 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52783 lt!256457) (index!23881 lt!256457) (index!23881 lt!256457) mask!3119))))

(declare-fun b!562558 () Bool)

(declare-fun res!353845 () Bool)

(assert (=> b!562558 (=> (not res!353845) (not e!324184))))

(assert (=> b!562558 (= res!353845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51458 res!353849) b!562552))

(assert (= (and b!562552 res!353846) b!562551))

(assert (= (and b!562551 res!353844) b!562554))

(assert (= (and b!562554 res!353852) b!562553))

(assert (= (and b!562553 res!353841) b!562548))

(assert (= (and b!562548 res!353847) b!562558))

(assert (= (and b!562558 res!353845) b!562550))

(assert (= (and b!562550 res!353848) b!562555))

(assert (= (and b!562555 res!353843) b!562549))

(assert (= (and b!562549 (not res!353842)) b!562556))

(assert (= (and b!562556 (not res!353850)) b!562547))

(assert (= (and b!562547 (not res!353851)) b!562557))

(declare-fun m!540209 () Bool)

(assert (=> b!562549 m!540209))

(assert (=> b!562549 m!540209))

(declare-fun m!540211 () Bool)

(assert (=> b!562549 m!540211))

(declare-fun m!540213 () Bool)

(assert (=> b!562549 m!540213))

(declare-fun m!540215 () Bool)

(assert (=> b!562549 m!540215))

(declare-fun m!540217 () Bool)

(assert (=> b!562550 m!540217))

(declare-fun m!540219 () Bool)

(assert (=> start!51458 m!540219))

(declare-fun m!540221 () Bool)

(assert (=> start!51458 m!540221))

(assert (=> b!562556 m!540209))

(declare-fun m!540223 () Bool)

(assert (=> b!562556 m!540223))

(assert (=> b!562551 m!540209))

(assert (=> b!562551 m!540209))

(declare-fun m!540225 () Bool)

(assert (=> b!562551 m!540225))

(declare-fun m!540227 () Bool)

(assert (=> b!562548 m!540227))

(declare-fun m!540229 () Bool)

(assert (=> b!562553 m!540229))

(declare-fun m!540231 () Bool)

(assert (=> b!562557 m!540231))

(declare-fun m!540233 () Bool)

(assert (=> b!562547 m!540233))

(assert (=> b!562547 m!540209))

(declare-fun m!540235 () Bool)

(assert (=> b!562547 m!540235))

(declare-fun m!540237 () Bool)

(assert (=> b!562547 m!540237))

(declare-fun m!540239 () Bool)

(assert (=> b!562547 m!540239))

(assert (=> b!562547 m!540209))

(declare-fun m!540241 () Bool)

(assert (=> b!562547 m!540241))

(assert (=> b!562555 m!540209))

(declare-fun m!540243 () Bool)

(assert (=> b!562555 m!540243))

(assert (=> b!562555 m!540209))

(declare-fun m!540245 () Bool)

(assert (=> b!562555 m!540245))

(assert (=> b!562555 m!540209))

(declare-fun m!540247 () Bool)

(assert (=> b!562555 m!540247))

(declare-fun m!540249 () Bool)

(assert (=> b!562555 m!540249))

(declare-fun m!540251 () Bool)

(assert (=> b!562555 m!540251))

(assert (=> b!562555 m!540235))

(declare-fun m!540253 () Bool)

(assert (=> b!562554 m!540253))

(declare-fun m!540255 () Bool)

(assert (=> b!562558 m!540255))

(check-sat (not b!562555) (not b!562548) (not b!562557) (not start!51458) (not b!562553) (not b!562551) (not b!562549) (not b!562547) (not b!562558) (not b!562554) (not b!562550))
(check-sat)
