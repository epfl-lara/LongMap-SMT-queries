; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32390 () Bool)

(assert start!32390)

(declare-fun b!323025 () Bool)

(declare-fun e!199708 () Bool)

(declare-fun e!199705 () Bool)

(assert (=> b!323025 (= e!199708 e!199705)))

(declare-fun res!176762 () Bool)

(assert (=> b!323025 (=> (not res!176762) (not e!199705))))

(declare-datatypes ((array!16533 0))(
  ( (array!16534 (arr!7824 (Array (_ BitVec 32) (_ BitVec 64))) (size!8177 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16533)

(declare-datatypes ((SeekEntryResult!2954 0))(
  ( (MissingZero!2954 (index!13992 (_ BitVec 32))) (Found!2954 (index!13993 (_ BitVec 32))) (Intermediate!2954 (undefined!3766 Bool) (index!13994 (_ BitVec 32)) (x!32265 (_ BitVec 32))) (Undefined!2954) (MissingVacant!2954 (index!13995 (_ BitVec 32))) )
))
(declare-fun lt!156375 () SeekEntryResult!2954)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16533 (_ BitVec 32)) SeekEntryResult!2954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323025 (= res!176762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156375))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323025 (= lt!156375 (Intermediate!2954 false resIndex!58 resX!58))))

(declare-fun b!323026 () Bool)

(declare-fun res!176767 () Bool)

(assert (=> b!323026 (=> (not res!176767) (not e!199708))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16533 (_ BitVec 32)) SeekEntryResult!2954)

(assert (=> b!323026 (= res!176767 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2954 i!1250)))))

(declare-fun res!176769 () Bool)

(assert (=> start!32390 (=> (not res!176769) (not e!199708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32390 (= res!176769 (validMask!0 mask!3777))))

(assert (=> start!32390 e!199708))

(declare-fun array_inv!5796 (array!16533) Bool)

(assert (=> start!32390 (array_inv!5796 a!3305)))

(assert (=> start!32390 true))

(declare-fun b!323027 () Bool)

(declare-datatypes ((Unit!9947 0))(
  ( (Unit!9948) )
))
(declare-fun e!199707 () Unit!9947)

(declare-fun Unit!9949 () Unit!9947)

(assert (=> b!323027 (= e!199707 Unit!9949)))

(assert (=> b!323027 false))

(declare-fun b!323028 () Bool)

(declare-fun res!176764 () Bool)

(assert (=> b!323028 (=> (not res!176764) (not e!199705))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323028 (= res!176764 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156375))))

(declare-fun b!323029 () Bool)

(assert (=> b!323029 false))

(declare-fun lt!156376 () Unit!9947)

(assert (=> b!323029 (= lt!156376 e!199707)))

(declare-fun c!50760 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323029 (= c!50760 ((_ is Intermediate!2954) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199704 () Unit!9947)

(declare-fun Unit!9950 () Unit!9947)

(assert (=> b!323029 (= e!199704 Unit!9950)))

(declare-fun b!323030 () Bool)

(declare-fun res!176760 () Bool)

(assert (=> b!323030 (=> (not res!176760) (not e!199705))))

(assert (=> b!323030 (= res!176760 (and (= (select (arr!7824 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8177 a!3305))))))

(declare-fun b!323031 () Bool)

(declare-fun e!199709 () Unit!9947)

(declare-fun Unit!9951 () Unit!9947)

(assert (=> b!323031 (= e!199709 Unit!9951)))

(declare-fun b!323032 () Bool)

(declare-fun res!176763 () Bool)

(assert (=> b!323032 (=> (not res!176763) (not e!199708))))

(assert (=> b!323032 (= res!176763 (and (= (size!8177 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8177 a!3305))))))

(declare-fun b!323033 () Bool)

(assert (=> b!323033 false))

(declare-fun Unit!9952 () Unit!9947)

(assert (=> b!323033 (= e!199704 Unit!9952)))

(declare-fun b!323034 () Bool)

(declare-fun Unit!9953 () Unit!9947)

(assert (=> b!323034 (= e!199707 Unit!9953)))

(declare-fun b!323035 () Bool)

(declare-fun res!176768 () Bool)

(assert (=> b!323035 (=> (not res!176768) (not e!199708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16533 (_ BitVec 32)) Bool)

(assert (=> b!323035 (= res!176768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323036 () Bool)

(assert (=> b!323036 (= e!199705 (not (or (not (= (select (arr!7824 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!323036 (= index!1840 resIndex!58)))

(declare-fun lt!156377 () Unit!9947)

(assert (=> b!323036 (= lt!156377 e!199709)))

(declare-fun c!50762 () Bool)

(assert (=> b!323036 (= c!50762 (not (= resIndex!58 index!1840)))))

(declare-fun b!323037 () Bool)

(assert (=> b!323037 (= e!199709 e!199704)))

(declare-fun c!50761 () Bool)

(assert (=> b!323037 (= c!50761 (or (= (select (arr!7824 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7824 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323038 () Bool)

(declare-fun res!176761 () Bool)

(assert (=> b!323038 (=> (not res!176761) (not e!199708))))

(declare-fun arrayContainsKey!0 (array!16533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323038 (= res!176761 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323039 () Bool)

(declare-fun res!176766 () Bool)

(assert (=> b!323039 (=> (not res!176766) (not e!199708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323039 (= res!176766 (validKeyInArray!0 k0!2497))))

(declare-fun b!323040 () Bool)

(declare-fun res!176765 () Bool)

(assert (=> b!323040 (=> (not res!176765) (not e!199705))))

(assert (=> b!323040 (= res!176765 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7824 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(assert (= (and start!32390 res!176769) b!323032))

(assert (= (and b!323032 res!176763) b!323039))

(assert (= (and b!323039 res!176766) b!323038))

(assert (= (and b!323038 res!176761) b!323026))

(assert (= (and b!323026 res!176767) b!323035))

(assert (= (and b!323035 res!176768) b!323025))

(assert (= (and b!323025 res!176762) b!323030))

(assert (= (and b!323030 res!176760) b!323028))

(assert (= (and b!323028 res!176764) b!323040))

(assert (= (and b!323040 res!176765) b!323036))

(assert (= (and b!323036 c!50762) b!323037))

(assert (= (and b!323036 (not c!50762)) b!323031))

(assert (= (and b!323037 c!50761) b!323033))

(assert (= (and b!323037 (not c!50761)) b!323029))

(assert (= (and b!323029 c!50760) b!323034))

(assert (= (and b!323029 (not c!50760)) b!323027))

(declare-fun m!330013 () Bool)

(assert (=> start!32390 m!330013))

(declare-fun m!330015 () Bool)

(assert (=> start!32390 m!330015))

(declare-fun m!330017 () Bool)

(assert (=> b!323039 m!330017))

(declare-fun m!330019 () Bool)

(assert (=> b!323029 m!330019))

(assert (=> b!323029 m!330019))

(declare-fun m!330021 () Bool)

(assert (=> b!323029 m!330021))

(declare-fun m!330023 () Bool)

(assert (=> b!323038 m!330023))

(declare-fun m!330025 () Bool)

(assert (=> b!323040 m!330025))

(declare-fun m!330027 () Bool)

(assert (=> b!323026 m!330027))

(declare-fun m!330029 () Bool)

(assert (=> b!323025 m!330029))

(assert (=> b!323025 m!330029))

(declare-fun m!330031 () Bool)

(assert (=> b!323025 m!330031))

(declare-fun m!330033 () Bool)

(assert (=> b!323030 m!330033))

(assert (=> b!323036 m!330025))

(declare-fun m!330035 () Bool)

(assert (=> b!323028 m!330035))

(declare-fun m!330037 () Bool)

(assert (=> b!323035 m!330037))

(assert (=> b!323037 m!330025))

(check-sat (not start!32390) (not b!323029) (not b!323039) (not b!323025) (not b!323038) (not b!323026) (not b!323035) (not b!323028))
(check-sat)
