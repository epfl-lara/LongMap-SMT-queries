; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45242 () Bool)

(assert start!45242)

(declare-fun b!496816 () Bool)

(declare-fun res!299208 () Bool)

(declare-fun e!291294 () Bool)

(assert (=> b!496816 (=> res!299208 e!291294)))

(declare-datatypes ((SeekEntryResult!3915 0))(
  ( (MissingZero!3915 (index!17839 (_ BitVec 32))) (Found!3915 (index!17840 (_ BitVec 32))) (Intermediate!3915 (undefined!4727 Bool) (index!17841 (_ BitVec 32)) (x!46895 (_ BitVec 32))) (Undefined!3915) (MissingVacant!3915 (index!17842 (_ BitVec 32))) )
))
(declare-fun lt!224913 () SeekEntryResult!3915)

(get-info :version)

(assert (=> b!496816 (= res!299208 (or (undefined!4727 lt!224913) (not ((_ is Intermediate!3915) lt!224913))))))

(declare-fun b!496817 () Bool)

(declare-fun e!291295 () Bool)

(assert (=> b!496817 (= e!291295 (not e!291294))))

(declare-fun res!299206 () Bool)

(assert (=> b!496817 (=> res!299206 e!291294)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32130 0))(
  ( (array!32131 (arr!15448 (Array (_ BitVec 32) (_ BitVec 64))) (size!15812 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32130)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224917 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32130 (_ BitVec 32)) SeekEntryResult!3915)

(assert (=> b!496817 (= res!299206 (= lt!224913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224917 (select (store (arr!15448 a!3235) i!1204 k0!2280) j!176) (array!32131 (store (arr!15448 a!3235) i!1204 k0!2280) (size!15812 a!3235)) mask!3524)))))

(declare-fun lt!224915 () (_ BitVec 32))

(assert (=> b!496817 (= lt!224913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224915 (select (arr!15448 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496817 (= lt!224917 (toIndex!0 (select (store (arr!15448 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496817 (= lt!224915 (toIndex!0 (select (arr!15448 a!3235) j!176) mask!3524))))

(declare-fun e!291297 () Bool)

(assert (=> b!496817 e!291297))

(declare-fun res!299213 () Bool)

(assert (=> b!496817 (=> (not res!299213) (not e!291297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32130 (_ BitVec 32)) Bool)

(assert (=> b!496817 (= res!299213 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14776 0))(
  ( (Unit!14777) )
))
(declare-fun lt!224916 () Unit!14776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14776)

(assert (=> b!496817 (= lt!224916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496818 () Bool)

(declare-fun res!299203 () Bool)

(assert (=> b!496818 (=> (not res!299203) (not e!291295))))

(declare-datatypes ((List!9606 0))(
  ( (Nil!9603) (Cons!9602 (h!10473 (_ BitVec 64)) (t!15834 List!9606)) )
))
(declare-fun arrayNoDuplicates!0 (array!32130 (_ BitVec 32) List!9606) Bool)

(assert (=> b!496818 (= res!299203 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9603))))

(declare-fun b!496819 () Bool)

(declare-fun res!299207 () Bool)

(assert (=> b!496819 (=> (not res!299207) (not e!291295))))

(assert (=> b!496819 (= res!299207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496820 () Bool)

(declare-fun res!299204 () Bool)

(declare-fun e!291293 () Bool)

(assert (=> b!496820 (=> (not res!299204) (not e!291293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496820 (= res!299204 (validKeyInArray!0 k0!2280))))

(declare-fun b!496821 () Bool)

(assert (=> b!496821 (= e!291294 true)))

(assert (=> b!496821 (and (bvslt (x!46895 lt!224913) #b01111111111111111111111111111110) (or (= (select (arr!15448 a!3235) (index!17841 lt!224913)) (select (arr!15448 a!3235) j!176)) (= (select (arr!15448 a!3235) (index!17841 lt!224913)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15448 a!3235) (index!17841 lt!224913)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496822 () Bool)

(declare-fun res!299212 () Bool)

(assert (=> b!496822 (=> (not res!299212) (not e!291293))))

(assert (=> b!496822 (= res!299212 (validKeyInArray!0 (select (arr!15448 a!3235) j!176)))))

(declare-fun b!496823 () Bool)

(declare-fun res!299211 () Bool)

(assert (=> b!496823 (=> (not res!299211) (not e!291293))))

(declare-fun arrayContainsKey!0 (array!32130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496823 (= res!299211 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299210 () Bool)

(assert (=> start!45242 (=> (not res!299210) (not e!291293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45242 (= res!299210 (validMask!0 mask!3524))))

(assert (=> start!45242 e!291293))

(assert (=> start!45242 true))

(declare-fun array_inv!11244 (array!32130) Bool)

(assert (=> start!45242 (array_inv!11244 a!3235)))

(declare-fun b!496824 () Bool)

(assert (=> b!496824 (= e!291293 e!291295)))

(declare-fun res!299205 () Bool)

(assert (=> b!496824 (=> (not res!299205) (not e!291295))))

(declare-fun lt!224914 () SeekEntryResult!3915)

(assert (=> b!496824 (= res!299205 (or (= lt!224914 (MissingZero!3915 i!1204)) (= lt!224914 (MissingVacant!3915 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32130 (_ BitVec 32)) SeekEntryResult!3915)

(assert (=> b!496824 (= lt!224914 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496825 () Bool)

(assert (=> b!496825 (= e!291297 (= (seekEntryOrOpen!0 (select (arr!15448 a!3235) j!176) a!3235 mask!3524) (Found!3915 j!176)))))

(declare-fun b!496826 () Bool)

(declare-fun res!299209 () Bool)

(assert (=> b!496826 (=> (not res!299209) (not e!291293))))

(assert (=> b!496826 (= res!299209 (and (= (size!15812 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15812 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15812 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45242 res!299210) b!496826))

(assert (= (and b!496826 res!299209) b!496822))

(assert (= (and b!496822 res!299212) b!496820))

(assert (= (and b!496820 res!299204) b!496823))

(assert (= (and b!496823 res!299211) b!496824))

(assert (= (and b!496824 res!299205) b!496819))

(assert (= (and b!496819 res!299207) b!496818))

(assert (= (and b!496818 res!299203) b!496817))

(assert (= (and b!496817 res!299213) b!496825))

(assert (= (and b!496817 (not res!299206)) b!496816))

(assert (= (and b!496816 (not res!299208)) b!496821))

(declare-fun m!478109 () Bool)

(assert (=> start!45242 m!478109))

(declare-fun m!478111 () Bool)

(assert (=> start!45242 m!478111))

(declare-fun m!478113 () Bool)

(assert (=> b!496817 m!478113))

(declare-fun m!478115 () Bool)

(assert (=> b!496817 m!478115))

(declare-fun m!478117 () Bool)

(assert (=> b!496817 m!478117))

(assert (=> b!496817 m!478117))

(declare-fun m!478119 () Bool)

(assert (=> b!496817 m!478119))

(declare-fun m!478121 () Bool)

(assert (=> b!496817 m!478121))

(declare-fun m!478123 () Bool)

(assert (=> b!496817 m!478123))

(assert (=> b!496817 m!478121))

(declare-fun m!478125 () Bool)

(assert (=> b!496817 m!478125))

(assert (=> b!496817 m!478117))

(declare-fun m!478127 () Bool)

(assert (=> b!496817 m!478127))

(assert (=> b!496817 m!478121))

(declare-fun m!478129 () Bool)

(assert (=> b!496817 m!478129))

(declare-fun m!478131 () Bool)

(assert (=> b!496824 m!478131))

(assert (=> b!496822 m!478121))

(assert (=> b!496822 m!478121))

(declare-fun m!478133 () Bool)

(assert (=> b!496822 m!478133))

(declare-fun m!478135 () Bool)

(assert (=> b!496823 m!478135))

(declare-fun m!478137 () Bool)

(assert (=> b!496819 m!478137))

(declare-fun m!478139 () Bool)

(assert (=> b!496821 m!478139))

(assert (=> b!496821 m!478121))

(declare-fun m!478141 () Bool)

(assert (=> b!496818 m!478141))

(declare-fun m!478143 () Bool)

(assert (=> b!496820 m!478143))

(assert (=> b!496825 m!478121))

(assert (=> b!496825 m!478121))

(declare-fun m!478145 () Bool)

(assert (=> b!496825 m!478145))

(check-sat (not b!496819) (not b!496818) (not b!496817) (not b!496823) (not b!496824) (not b!496822) (not b!496820) (not start!45242) (not b!496825))
