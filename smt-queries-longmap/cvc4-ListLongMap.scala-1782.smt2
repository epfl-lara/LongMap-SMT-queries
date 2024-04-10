; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32396 () Bool)

(assert start!32396)

(declare-fun b!323108 () Bool)

(assert (=> b!323108 false))

(declare-datatypes ((Unit!9955 0))(
  ( (Unit!9956) )
))
(declare-fun lt!156575 () Unit!9955)

(declare-fun e!199808 () Unit!9955)

(assert (=> b!323108 (= lt!156575 e!199808)))

(declare-datatypes ((array!16535 0))(
  ( (array!16536 (arr!7825 (Array (_ BitVec 32) (_ BitVec 64))) (size!8177 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16535)

(declare-fun c!50797 () Bool)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2956 0))(
  ( (MissingZero!2956 (index!14000 (_ BitVec 32))) (Found!2956 (index!14001 (_ BitVec 32))) (Intermediate!2956 (undefined!3768 Bool) (index!14002 (_ BitVec 32)) (x!32256 (_ BitVec 32))) (Undefined!2956) (MissingVacant!2956 (index!14003 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16535 (_ BitVec 32)) SeekEntryResult!2956)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323108 (= c!50797 (is-Intermediate!2956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199810 () Unit!9955)

(declare-fun Unit!9957 () Unit!9955)

(assert (=> b!323108 (= e!199810 Unit!9957)))

(declare-fun b!323109 () Bool)

(declare-fun e!199811 () Unit!9955)

(assert (=> b!323109 (= e!199811 e!199810)))

(declare-fun c!50798 () Bool)

(assert (=> b!323109 (= c!50798 (or (= (select (arr!7825 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7825 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323110 () Bool)

(declare-fun res!176771 () Bool)

(declare-fun e!199812 () Bool)

(assert (=> b!323110 (=> (not res!176771) (not e!199812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16535 (_ BitVec 32)) Bool)

(assert (=> b!323110 (= res!176771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323111 () Bool)

(declare-fun res!176772 () Bool)

(assert (=> b!323111 (=> (not res!176772) (not e!199812))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323111 (= res!176772 (and (= (size!8177 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8177 a!3305))))))

(declare-fun b!323112 () Bool)

(declare-fun e!199809 () Bool)

(assert (=> b!323112 (= e!199812 e!199809)))

(declare-fun res!176778 () Bool)

(assert (=> b!323112 (=> (not res!176778) (not e!199809))))

(declare-fun lt!156576 () SeekEntryResult!2956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323112 (= res!176778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156576))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323112 (= lt!156576 (Intermediate!2956 false resIndex!58 resX!58))))

(declare-fun b!323113 () Bool)

(assert (=> b!323113 (= e!199809 (not true))))

(assert (=> b!323113 (= index!1840 resIndex!58)))

(declare-fun lt!156574 () Unit!9955)

(assert (=> b!323113 (= lt!156574 e!199811)))

(declare-fun c!50799 () Bool)

(assert (=> b!323113 (= c!50799 (not (= resIndex!58 index!1840)))))

(declare-fun res!176776 () Bool)

(assert (=> start!32396 (=> (not res!176776) (not e!199812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32396 (= res!176776 (validMask!0 mask!3777))))

(assert (=> start!32396 e!199812))

(declare-fun array_inv!5788 (array!16535) Bool)

(assert (=> start!32396 (array_inv!5788 a!3305)))

(assert (=> start!32396 true))

(declare-fun b!323114 () Bool)

(declare-fun res!176770 () Bool)

(assert (=> b!323114 (=> (not res!176770) (not e!199812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323114 (= res!176770 (validKeyInArray!0 k!2497))))

(declare-fun b!323115 () Bool)

(declare-fun res!176769 () Bool)

(assert (=> b!323115 (=> (not res!176769) (not e!199809))))

(assert (=> b!323115 (= res!176769 (and (= (select (arr!7825 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8177 a!3305))))))

(declare-fun b!323116 () Bool)

(declare-fun res!176775 () Bool)

(assert (=> b!323116 (=> (not res!176775) (not e!199812))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16535 (_ BitVec 32)) SeekEntryResult!2956)

(assert (=> b!323116 (= res!176775 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2956 i!1250)))))

(declare-fun b!323117 () Bool)

(declare-fun Unit!9958 () Unit!9955)

(assert (=> b!323117 (= e!199808 Unit!9958)))

(declare-fun b!323118 () Bool)

(declare-fun res!176774 () Bool)

(assert (=> b!323118 (=> (not res!176774) (not e!199809))))

(assert (=> b!323118 (= res!176774 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156576))))

(declare-fun b!323119 () Bool)

(declare-fun Unit!9959 () Unit!9955)

(assert (=> b!323119 (= e!199808 Unit!9959)))

(assert (=> b!323119 false))

(declare-fun b!323120 () Bool)

(assert (=> b!323120 false))

(declare-fun Unit!9960 () Unit!9955)

(assert (=> b!323120 (= e!199810 Unit!9960)))

(declare-fun b!323121 () Bool)

(declare-fun res!176777 () Bool)

(assert (=> b!323121 (=> (not res!176777) (not e!199812))))

(declare-fun arrayContainsKey!0 (array!16535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323121 (= res!176777 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323122 () Bool)

(declare-fun res!176773 () Bool)

(assert (=> b!323122 (=> (not res!176773) (not e!199809))))

(assert (=> b!323122 (= res!176773 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7825 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323123 () Bool)

(declare-fun Unit!9961 () Unit!9955)

(assert (=> b!323123 (= e!199811 Unit!9961)))

(assert (= (and start!32396 res!176776) b!323111))

(assert (= (and b!323111 res!176772) b!323114))

(assert (= (and b!323114 res!176770) b!323121))

(assert (= (and b!323121 res!176777) b!323116))

(assert (= (and b!323116 res!176775) b!323110))

(assert (= (and b!323110 res!176771) b!323112))

(assert (= (and b!323112 res!176778) b!323115))

(assert (= (and b!323115 res!176769) b!323118))

(assert (= (and b!323118 res!176774) b!323122))

(assert (= (and b!323122 res!176773) b!323113))

(assert (= (and b!323113 c!50799) b!323109))

(assert (= (and b!323113 (not c!50799)) b!323123))

(assert (= (and b!323109 c!50798) b!323120))

(assert (= (and b!323109 (not c!50798)) b!323108))

(assert (= (and b!323108 c!50797) b!323117))

(assert (= (and b!323108 (not c!50797)) b!323119))

(declare-fun m!330639 () Bool)

(assert (=> b!323121 m!330639))

(declare-fun m!330641 () Bool)

(assert (=> b!323115 m!330641))

(declare-fun m!330643 () Bool)

(assert (=> b!323118 m!330643))

(declare-fun m!330645 () Bool)

(assert (=> start!32396 m!330645))

(declare-fun m!330647 () Bool)

(assert (=> start!32396 m!330647))

(declare-fun m!330649 () Bool)

(assert (=> b!323114 m!330649))

(declare-fun m!330651 () Bool)

(assert (=> b!323108 m!330651))

(assert (=> b!323108 m!330651))

(declare-fun m!330653 () Bool)

(assert (=> b!323108 m!330653))

(declare-fun m!330655 () Bool)

(assert (=> b!323122 m!330655))

(declare-fun m!330657 () Bool)

(assert (=> b!323112 m!330657))

(assert (=> b!323112 m!330657))

(declare-fun m!330659 () Bool)

(assert (=> b!323112 m!330659))

(assert (=> b!323109 m!330655))

(declare-fun m!330661 () Bool)

(assert (=> b!323116 m!330661))

(declare-fun m!330663 () Bool)

(assert (=> b!323110 m!330663))

(push 1)

