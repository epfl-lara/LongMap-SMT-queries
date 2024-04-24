; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32384 () Bool)

(assert start!32384)

(declare-fun b!323103 () Bool)

(declare-fun res!176803 () Bool)

(declare-fun e!199797 () Bool)

(assert (=> b!323103 (=> (not res!176803) (not e!199797))))

(declare-datatypes ((array!16536 0))(
  ( (array!16537 (arr!7825 (Array (_ BitVec 32) (_ BitVec 64))) (size!8177 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16536)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16536 (_ BitVec 32)) Bool)

(assert (=> b!323103 (= res!176803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323104 () Bool)

(assert (=> b!323104 false))

(declare-datatypes ((Unit!9924 0))(
  ( (Unit!9925) )
))
(declare-fun lt!156602 () Unit!9924)

(declare-fun e!199794 () Unit!9924)

(assert (=> b!323104 (= lt!156602 e!199794)))

(declare-fun c!50781 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((SeekEntryResult!2921 0))(
  ( (MissingZero!2921 (index!13860 (_ BitVec 32))) (Found!2921 (index!13861 (_ BitVec 32))) (Intermediate!2921 (undefined!3733 Bool) (index!13862 (_ BitVec 32)) (x!32226 (_ BitVec 32))) (Undefined!2921) (MissingVacant!2921 (index!13863 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16536 (_ BitVec 32)) SeekEntryResult!2921)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323104 (= c!50781 ((_ is Intermediate!2921) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199795 () Unit!9924)

(declare-fun Unit!9926 () Unit!9924)

(assert (=> b!323104 (= e!199795 Unit!9926)))

(declare-fun b!323105 () Bool)

(declare-fun res!176796 () Bool)

(declare-fun e!199792 () Bool)

(assert (=> b!323105 (=> (not res!176796) (not e!199792))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323105 (= res!176796 (and (= (select (arr!7825 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8177 a!3305))))))

(declare-fun b!323106 () Bool)

(declare-fun Unit!9927 () Unit!9924)

(assert (=> b!323106 (= e!199794 Unit!9927)))

(assert (=> b!323106 false))

(declare-fun b!323107 () Bool)

(assert (=> b!323107 (= e!199792 (not true))))

(assert (=> b!323107 (= index!1840 resIndex!58)))

(declare-fun lt!156601 () Unit!9924)

(declare-fun e!199796 () Unit!9924)

(assert (=> b!323107 (= lt!156601 e!199796)))

(declare-fun c!50783 () Bool)

(assert (=> b!323107 (= c!50783 (not (= resIndex!58 index!1840)))))

(declare-fun b!323108 () Bool)

(assert (=> b!323108 (= e!199796 e!199795)))

(declare-fun c!50782 () Bool)

(assert (=> b!323108 (= c!50782 (or (= (select (arr!7825 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7825 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323109 () Bool)

(declare-fun res!176799 () Bool)

(assert (=> b!323109 (=> (not res!176799) (not e!199797))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16536 (_ BitVec 32)) SeekEntryResult!2921)

(assert (=> b!323109 (= res!176799 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2921 i!1250)))))

(declare-fun res!176798 () Bool)

(assert (=> start!32384 (=> (not res!176798) (not e!199797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32384 (= res!176798 (validMask!0 mask!3777))))

(assert (=> start!32384 e!199797))

(declare-fun array_inv!5775 (array!16536) Bool)

(assert (=> start!32384 (array_inv!5775 a!3305)))

(assert (=> start!32384 true))

(declare-fun b!323110 () Bool)

(declare-fun res!176802 () Bool)

(assert (=> b!323110 (=> (not res!176802) (not e!199797))))

(assert (=> b!323110 (= res!176802 (and (= (size!8177 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8177 a!3305))))))

(declare-fun b!323111 () Bool)

(assert (=> b!323111 (= e!199797 e!199792)))

(declare-fun res!176800 () Bool)

(assert (=> b!323111 (=> (not res!176800) (not e!199792))))

(declare-fun lt!156603 () SeekEntryResult!2921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323111 (= res!176800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156603))))

(assert (=> b!323111 (= lt!156603 (Intermediate!2921 false resIndex!58 resX!58))))

(declare-fun b!323112 () Bool)

(declare-fun res!176805 () Bool)

(assert (=> b!323112 (=> (not res!176805) (not e!199792))))

(assert (=> b!323112 (= res!176805 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156603))))

(declare-fun b!323113 () Bool)

(assert (=> b!323113 false))

(declare-fun Unit!9928 () Unit!9924)

(assert (=> b!323113 (= e!199795 Unit!9928)))

(declare-fun b!323114 () Bool)

(declare-fun Unit!9929 () Unit!9924)

(assert (=> b!323114 (= e!199796 Unit!9929)))

(declare-fun b!323115 () Bool)

(declare-fun res!176801 () Bool)

(assert (=> b!323115 (=> (not res!176801) (not e!199797))))

(declare-fun arrayContainsKey!0 (array!16536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323115 (= res!176801 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323116 () Bool)

(declare-fun res!176797 () Bool)

(assert (=> b!323116 (=> (not res!176797) (not e!199792))))

(assert (=> b!323116 (= res!176797 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7825 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323117 () Bool)

(declare-fun Unit!9930 () Unit!9924)

(assert (=> b!323117 (= e!199794 Unit!9930)))

(declare-fun b!323118 () Bool)

(declare-fun res!176804 () Bool)

(assert (=> b!323118 (=> (not res!176804) (not e!199797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323118 (= res!176804 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32384 res!176798) b!323110))

(assert (= (and b!323110 res!176802) b!323118))

(assert (= (and b!323118 res!176804) b!323115))

(assert (= (and b!323115 res!176801) b!323109))

(assert (= (and b!323109 res!176799) b!323103))

(assert (= (and b!323103 res!176803) b!323111))

(assert (= (and b!323111 res!176800) b!323105))

(assert (= (and b!323105 res!176796) b!323112))

(assert (= (and b!323112 res!176805) b!323116))

(assert (= (and b!323116 res!176797) b!323107))

(assert (= (and b!323107 c!50783) b!323108))

(assert (= (and b!323107 (not c!50783)) b!323114))

(assert (= (and b!323108 c!50782) b!323113))

(assert (= (and b!323108 (not c!50782)) b!323104))

(assert (= (and b!323104 c!50781) b!323117))

(assert (= (and b!323104 (not c!50781)) b!323106))

(declare-fun m!330847 () Bool)

(assert (=> b!323103 m!330847))

(declare-fun m!330849 () Bool)

(assert (=> b!323111 m!330849))

(assert (=> b!323111 m!330849))

(declare-fun m!330851 () Bool)

(assert (=> b!323111 m!330851))

(declare-fun m!330853 () Bool)

(assert (=> b!323118 m!330853))

(declare-fun m!330855 () Bool)

(assert (=> b!323108 m!330855))

(declare-fun m!330857 () Bool)

(assert (=> start!32384 m!330857))

(declare-fun m!330859 () Bool)

(assert (=> start!32384 m!330859))

(assert (=> b!323116 m!330855))

(declare-fun m!330861 () Bool)

(assert (=> b!323109 m!330861))

(declare-fun m!330863 () Bool)

(assert (=> b!323112 m!330863))

(declare-fun m!330865 () Bool)

(assert (=> b!323104 m!330865))

(assert (=> b!323104 m!330865))

(declare-fun m!330867 () Bool)

(assert (=> b!323104 m!330867))

(declare-fun m!330869 () Bool)

(assert (=> b!323115 m!330869))

(declare-fun m!330871 () Bool)

(assert (=> b!323105 m!330871))

(check-sat (not b!323118) (not b!323115) (not b!323104) (not b!323111) (not b!323103) (not b!323109) (not start!32384) (not b!323112))
(check-sat)
