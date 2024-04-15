; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45972 () Bool)

(assert start!45972)

(declare-fun b!508812 () Bool)

(declare-fun e!297591 () Bool)

(assert (=> b!508812 (= e!297591 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4189 0))(
  ( (MissingZero!4189 (index!18944 (_ BitVec 32))) (Found!4189 (index!18945 (_ BitVec 32))) (Intermediate!4189 (undefined!5001 Bool) (index!18946 (_ BitVec 32)) (x!47929 (_ BitVec 32))) (Undefined!4189) (MissingVacant!4189 (index!18947 (_ BitVec 32))) )
))
(declare-fun lt!232247 () SeekEntryResult!4189)

(declare-fun lt!232244 () (_ BitVec 32))

(declare-datatypes ((array!32693 0))(
  ( (array!32694 (arr!15725 (Array (_ BitVec 32) (_ BitVec 64))) (size!16090 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32693)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32693 (_ BitVec 32)) SeekEntryResult!4189)

(assert (=> b!508812 (= lt!232247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232244 (select (store (arr!15725 a!3235) i!1204 k0!2280) j!176) (array!32694 (store (arr!15725 a!3235) i!1204 k0!2280) (size!16090 a!3235)) mask!3524))))

(declare-fun lt!232249 () SeekEntryResult!4189)

(declare-fun lt!232248 () (_ BitVec 32))

(assert (=> b!508812 (= lt!232249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232248 (select (arr!15725 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508812 (= lt!232244 (toIndex!0 (select (store (arr!15725 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508812 (= lt!232248 (toIndex!0 (select (arr!15725 a!3235) j!176) mask!3524))))

(declare-fun e!297588 () Bool)

(assert (=> b!508812 e!297588))

(declare-fun res!309801 () Bool)

(assert (=> b!508812 (=> (not res!309801) (not e!297588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32693 (_ BitVec 32)) Bool)

(assert (=> b!508812 (= res!309801 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15622 0))(
  ( (Unit!15623) )
))
(declare-fun lt!232246 () Unit!15622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15622)

(assert (=> b!508812 (= lt!232246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508813 () Bool)

(declare-fun res!309804 () Bool)

(declare-fun e!297590 () Bool)

(assert (=> b!508813 (=> (not res!309804) (not e!297590))))

(assert (=> b!508813 (= res!309804 (and (= (size!16090 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16090 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16090 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508814 () Bool)

(declare-fun res!309805 () Bool)

(assert (=> b!508814 (=> (not res!309805) (not e!297590))))

(declare-fun arrayContainsKey!0 (array!32693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508814 (= res!309805 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508815 () Bool)

(declare-fun res!309800 () Bool)

(assert (=> b!508815 (=> (not res!309800) (not e!297591))))

(declare-datatypes ((List!9922 0))(
  ( (Nil!9919) (Cons!9918 (h!10795 (_ BitVec 64)) (t!16141 List!9922)) )
))
(declare-fun arrayNoDuplicates!0 (array!32693 (_ BitVec 32) List!9922) Bool)

(assert (=> b!508815 (= res!309800 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9919))))

(declare-fun b!508816 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32693 (_ BitVec 32)) SeekEntryResult!4189)

(assert (=> b!508816 (= e!297588 (= (seekEntryOrOpen!0 (select (arr!15725 a!3235) j!176) a!3235 mask!3524) (Found!4189 j!176)))))

(declare-fun b!508817 () Bool)

(declare-fun res!309799 () Bool)

(assert (=> b!508817 (=> (not res!309799) (not e!297590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508817 (= res!309799 (validKeyInArray!0 (select (arr!15725 a!3235) j!176)))))

(declare-fun b!508811 () Bool)

(assert (=> b!508811 (= e!297590 e!297591)))

(declare-fun res!309798 () Bool)

(assert (=> b!508811 (=> (not res!309798) (not e!297591))))

(declare-fun lt!232245 () SeekEntryResult!4189)

(assert (=> b!508811 (= res!309798 (or (= lt!232245 (MissingZero!4189 i!1204)) (= lt!232245 (MissingVacant!4189 i!1204))))))

(assert (=> b!508811 (= lt!232245 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!309806 () Bool)

(assert (=> start!45972 (=> (not res!309806) (not e!297590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45972 (= res!309806 (validMask!0 mask!3524))))

(assert (=> start!45972 e!297590))

(assert (=> start!45972 true))

(declare-fun array_inv!11608 (array!32693) Bool)

(assert (=> start!45972 (array_inv!11608 a!3235)))

(declare-fun b!508818 () Bool)

(declare-fun res!309802 () Bool)

(assert (=> b!508818 (=> (not res!309802) (not e!297591))))

(assert (=> b!508818 (= res!309802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508819 () Bool)

(declare-fun res!309803 () Bool)

(assert (=> b!508819 (=> (not res!309803) (not e!297590))))

(assert (=> b!508819 (= res!309803 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45972 res!309806) b!508813))

(assert (= (and b!508813 res!309804) b!508817))

(assert (= (and b!508817 res!309799) b!508819))

(assert (= (and b!508819 res!309803) b!508814))

(assert (= (and b!508814 res!309805) b!508811))

(assert (= (and b!508811 res!309798) b!508818))

(assert (= (and b!508818 res!309802) b!508815))

(assert (= (and b!508815 res!309800) b!508812))

(assert (= (and b!508812 res!309801) b!508816))

(declare-fun m!489097 () Bool)

(assert (=> b!508811 m!489097))

(declare-fun m!489099 () Bool)

(assert (=> start!45972 m!489099))

(declare-fun m!489101 () Bool)

(assert (=> start!45972 m!489101))

(declare-fun m!489103 () Bool)

(assert (=> b!508819 m!489103))

(declare-fun m!489105 () Bool)

(assert (=> b!508812 m!489105))

(declare-fun m!489107 () Bool)

(assert (=> b!508812 m!489107))

(declare-fun m!489109 () Bool)

(assert (=> b!508812 m!489109))

(declare-fun m!489111 () Bool)

(assert (=> b!508812 m!489111))

(declare-fun m!489113 () Bool)

(assert (=> b!508812 m!489113))

(assert (=> b!508812 m!489111))

(declare-fun m!489115 () Bool)

(assert (=> b!508812 m!489115))

(assert (=> b!508812 m!489109))

(declare-fun m!489117 () Bool)

(assert (=> b!508812 m!489117))

(assert (=> b!508812 m!489109))

(declare-fun m!489119 () Bool)

(assert (=> b!508812 m!489119))

(assert (=> b!508812 m!489111))

(declare-fun m!489121 () Bool)

(assert (=> b!508812 m!489121))

(assert (=> b!508816 m!489111))

(assert (=> b!508816 m!489111))

(declare-fun m!489123 () Bool)

(assert (=> b!508816 m!489123))

(declare-fun m!489125 () Bool)

(assert (=> b!508818 m!489125))

(declare-fun m!489127 () Bool)

(assert (=> b!508814 m!489127))

(assert (=> b!508817 m!489111))

(assert (=> b!508817 m!489111))

(declare-fun m!489129 () Bool)

(assert (=> b!508817 m!489129))

(declare-fun m!489131 () Bool)

(assert (=> b!508815 m!489131))

(check-sat (not b!508816) (not b!508818) (not b!508817) (not b!508811) (not b!508815) (not b!508814) (not b!508812) (not b!508819) (not start!45972))
(check-sat)
