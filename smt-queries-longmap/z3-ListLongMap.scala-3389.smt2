; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46736 () Bool)

(assert start!46736)

(declare-fun b!516111 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33049 0))(
  ( (array!33050 (arr!15892 (Array (_ BitVec 32) (_ BitVec 64))) (size!16256 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33049)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!301243 () Bool)

(declare-datatypes ((SeekEntryResult!4315 0))(
  ( (MissingZero!4315 (index!19448 (_ BitVec 32))) (Found!4315 (index!19449 (_ BitVec 32))) (Intermediate!4315 (undefined!5127 Bool) (index!19450 (_ BitVec 32)) (x!48555 (_ BitVec 32))) (Undefined!4315) (MissingVacant!4315 (index!19451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33049 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!516111 (= e!301243 (= (seekEntryOrOpen!0 (select (arr!15892 a!3235) j!176) a!3235 mask!3524) (Found!4315 j!176)))))

(declare-fun b!516112 () Bool)

(declare-fun res!315732 () Bool)

(declare-fun e!301242 () Bool)

(assert (=> b!516112 (=> res!315732 e!301242)))

(declare-fun lt!236310 () SeekEntryResult!4315)

(get-info :version)

(assert (=> b!516112 (= res!315732 (or (undefined!5127 lt!236310) (not ((_ is Intermediate!4315) lt!236310))))))

(declare-fun b!516113 () Bool)

(declare-fun e!301241 () Bool)

(assert (=> b!516113 (= e!301241 (not e!301242))))

(declare-fun res!315735 () Bool)

(assert (=> b!516113 (=> res!315735 e!301242)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236307 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33049 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!516113 (= res!315735 (= lt!236310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236307 (select (store (arr!15892 a!3235) i!1204 k0!2280) j!176) (array!33050 (store (arr!15892 a!3235) i!1204 k0!2280) (size!16256 a!3235)) mask!3524)))))

(declare-fun lt!236309 () (_ BitVec 32))

(assert (=> b!516113 (= lt!236310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236309 (select (arr!15892 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516113 (= lt!236307 (toIndex!0 (select (store (arr!15892 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516113 (= lt!236309 (toIndex!0 (select (arr!15892 a!3235) j!176) mask!3524))))

(assert (=> b!516113 e!301243))

(declare-fun res!315730 () Bool)

(assert (=> b!516113 (=> (not res!315730) (not e!301243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33049 (_ BitVec 32)) Bool)

(assert (=> b!516113 (= res!315730 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15949 0))(
  ( (Unit!15950) )
))
(declare-fun lt!236308 () Unit!15949)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15949)

(assert (=> b!516113 (= lt!236308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516114 () Bool)

(declare-fun res!315736 () Bool)

(declare-fun e!301245 () Bool)

(assert (=> b!516114 (=> (not res!315736) (not e!301245))))

(assert (=> b!516114 (= res!315736 (and (= (size!16256 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16256 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16256 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315739 () Bool)

(assert (=> start!46736 (=> (not res!315739) (not e!301245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46736 (= res!315739 (validMask!0 mask!3524))))

(assert (=> start!46736 e!301245))

(assert (=> start!46736 true))

(declare-fun array_inv!11751 (array!33049) Bool)

(assert (=> start!46736 (array_inv!11751 a!3235)))

(declare-fun b!516115 () Bool)

(assert (=> b!516115 (= e!301245 e!301241)))

(declare-fun res!315733 () Bool)

(assert (=> b!516115 (=> (not res!315733) (not e!301241))))

(declare-fun lt!236311 () SeekEntryResult!4315)

(assert (=> b!516115 (= res!315733 (or (= lt!236311 (MissingZero!4315 i!1204)) (= lt!236311 (MissingVacant!4315 i!1204))))))

(assert (=> b!516115 (= lt!236311 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516116 () Bool)

(declare-fun res!315737 () Bool)

(assert (=> b!516116 (=> (not res!315737) (not e!301245))))

(declare-fun arrayContainsKey!0 (array!33049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516116 (= res!315737 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516117 () Bool)

(assert (=> b!516117 (= e!301242 true)))

(assert (=> b!516117 (and (bvslt (x!48555 lt!236310) #b01111111111111111111111111111110) (or (= (select (arr!15892 a!3235) (index!19450 lt!236310)) (select (arr!15892 a!3235) j!176)) (= (select (arr!15892 a!3235) (index!19450 lt!236310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15892 a!3235) (index!19450 lt!236310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516118 () Bool)

(declare-fun res!315738 () Bool)

(assert (=> b!516118 (=> (not res!315738) (not e!301245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516118 (= res!315738 (validKeyInArray!0 (select (arr!15892 a!3235) j!176)))))

(declare-fun b!516119 () Bool)

(declare-fun res!315734 () Bool)

(assert (=> b!516119 (=> (not res!315734) (not e!301241))))

(assert (=> b!516119 (= res!315734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516120 () Bool)

(declare-fun res!315729 () Bool)

(assert (=> b!516120 (=> (not res!315729) (not e!301241))))

(declare-datatypes ((List!9957 0))(
  ( (Nil!9954) (Cons!9953 (h!10851 (_ BitVec 64)) (t!16177 List!9957)) )
))
(declare-fun arrayNoDuplicates!0 (array!33049 (_ BitVec 32) List!9957) Bool)

(assert (=> b!516120 (= res!315729 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9954))))

(declare-fun b!516121 () Bool)

(declare-fun res!315731 () Bool)

(assert (=> b!516121 (=> (not res!315731) (not e!301245))))

(assert (=> b!516121 (= res!315731 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46736 res!315739) b!516114))

(assert (= (and b!516114 res!315736) b!516118))

(assert (= (and b!516118 res!315738) b!516121))

(assert (= (and b!516121 res!315731) b!516116))

(assert (= (and b!516116 res!315737) b!516115))

(assert (= (and b!516115 res!315733) b!516119))

(assert (= (and b!516119 res!315734) b!516120))

(assert (= (and b!516120 res!315729) b!516113))

(assert (= (and b!516113 res!315730) b!516111))

(assert (= (and b!516113 (not res!315735)) b!516112))

(assert (= (and b!516112 (not res!315732)) b!516117))

(declare-fun m!497803 () Bool)

(assert (=> b!516115 m!497803))

(declare-fun m!497805 () Bool)

(assert (=> start!46736 m!497805))

(declare-fun m!497807 () Bool)

(assert (=> start!46736 m!497807))

(declare-fun m!497809 () Bool)

(assert (=> b!516111 m!497809))

(assert (=> b!516111 m!497809))

(declare-fun m!497811 () Bool)

(assert (=> b!516111 m!497811))

(assert (=> b!516118 m!497809))

(assert (=> b!516118 m!497809))

(declare-fun m!497813 () Bool)

(assert (=> b!516118 m!497813))

(declare-fun m!497815 () Bool)

(assert (=> b!516120 m!497815))

(declare-fun m!497817 () Bool)

(assert (=> b!516117 m!497817))

(assert (=> b!516117 m!497809))

(declare-fun m!497819 () Bool)

(assert (=> b!516119 m!497819))

(declare-fun m!497821 () Bool)

(assert (=> b!516113 m!497821))

(declare-fun m!497823 () Bool)

(assert (=> b!516113 m!497823))

(declare-fun m!497825 () Bool)

(assert (=> b!516113 m!497825))

(assert (=> b!516113 m!497825))

(declare-fun m!497827 () Bool)

(assert (=> b!516113 m!497827))

(assert (=> b!516113 m!497809))

(declare-fun m!497829 () Bool)

(assert (=> b!516113 m!497829))

(assert (=> b!516113 m!497809))

(declare-fun m!497831 () Bool)

(assert (=> b!516113 m!497831))

(assert (=> b!516113 m!497809))

(declare-fun m!497833 () Bool)

(assert (=> b!516113 m!497833))

(assert (=> b!516113 m!497825))

(declare-fun m!497835 () Bool)

(assert (=> b!516113 m!497835))

(declare-fun m!497837 () Bool)

(assert (=> b!516116 m!497837))

(declare-fun m!497839 () Bool)

(assert (=> b!516121 m!497839))

(check-sat (not b!516121) (not b!516119) (not start!46736) (not b!516120) (not b!516115) (not b!516116) (not b!516111) (not b!516113) (not b!516118))
(check-sat)
