; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46230 () Bool)

(assert start!46230)

(declare-fun b!511849 () Bool)

(declare-fun res!312660 () Bool)

(declare-fun e!298963 () Bool)

(assert (=> b!511849 (=> (not res!312660) (not e!298963))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32894 0))(
  ( (array!32895 (arr!15824 (Array (_ BitVec 32) (_ BitVec 64))) (size!16189 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32894)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511849 (= res!312660 (and (= (size!16189 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16189 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16189 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511850 () Bool)

(declare-fun e!298964 () Bool)

(assert (=> b!511850 (= e!298963 e!298964)))

(declare-fun res!312655 () Bool)

(assert (=> b!511850 (=> (not res!312655) (not e!298964))))

(declare-datatypes ((SeekEntryResult!4288 0))(
  ( (MissingZero!4288 (index!19340 (_ BitVec 32))) (Found!4288 (index!19341 (_ BitVec 32))) (Intermediate!4288 (undefined!5100 Bool) (index!19342 (_ BitVec 32)) (x!48298 (_ BitVec 32))) (Undefined!4288) (MissingVacant!4288 (index!19343 (_ BitVec 32))) )
))
(declare-fun lt!234156 () SeekEntryResult!4288)

(assert (=> b!511850 (= res!312655 (or (= lt!234156 (MissingZero!4288 i!1204)) (= lt!234156 (MissingVacant!4288 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32894 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!511850 (= lt!234156 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511851 () Bool)

(declare-fun res!312653 () Bool)

(declare-fun e!298962 () Bool)

(assert (=> b!511851 (=> res!312653 e!298962)))

(declare-fun lt!234155 () SeekEntryResult!4288)

(get-info :version)

(assert (=> b!511851 (= res!312653 (or (not ((_ is Intermediate!4288) lt!234155)) (not (undefined!5100 lt!234155))))))

(declare-fun b!511852 () Bool)

(declare-fun res!312654 () Bool)

(assert (=> b!511852 (=> (not res!312654) (not e!298964))))

(declare-datatypes ((List!10021 0))(
  ( (Nil!10018) (Cons!10017 (h!10897 (_ BitVec 64)) (t!16240 List!10021)) )
))
(declare-fun arrayNoDuplicates!0 (array!32894 (_ BitVec 32) List!10021) Bool)

(assert (=> b!511852 (= res!312654 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10018))))

(declare-fun b!511853 () Bool)

(declare-fun res!312661 () Bool)

(assert (=> b!511853 (=> (not res!312661) (not e!298964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32894 (_ BitVec 32)) Bool)

(assert (=> b!511853 (= res!312661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511854 () Bool)

(declare-fun res!312658 () Bool)

(assert (=> b!511854 (=> (not res!312658) (not e!298963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511854 (= res!312658 (validKeyInArray!0 (select (arr!15824 a!3235) j!176)))))

(declare-fun res!312657 () Bool)

(assert (=> start!46230 (=> (not res!312657) (not e!298963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46230 (= res!312657 (validMask!0 mask!3524))))

(assert (=> start!46230 e!298963))

(assert (=> start!46230 true))

(declare-fun array_inv!11707 (array!32894) Bool)

(assert (=> start!46230 (array_inv!11707 a!3235)))

(declare-fun b!511855 () Bool)

(assert (=> b!511855 (= e!298964 (not e!298962))))

(declare-fun res!312656 () Bool)

(assert (=> b!511855 (=> res!312656 e!298962)))

(declare-fun lt!234158 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32894 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!511855 (= res!312656 (= lt!234155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234158 (select (store (arr!15824 a!3235) i!1204 k0!2280) j!176) (array!32895 (store (arr!15824 a!3235) i!1204 k0!2280) (size!16189 a!3235)) mask!3524)))))

(declare-fun lt!234159 () (_ BitVec 32))

(assert (=> b!511855 (= lt!234155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234159 (select (arr!15824 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511855 (= lt!234158 (toIndex!0 (select (store (arr!15824 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511855 (= lt!234159 (toIndex!0 (select (arr!15824 a!3235) j!176) mask!3524))))

(declare-fun lt!234160 () SeekEntryResult!4288)

(assert (=> b!511855 (= lt!234160 (Found!4288 j!176))))

(assert (=> b!511855 (= lt!234160 (seekEntryOrOpen!0 (select (arr!15824 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511855 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15820 0))(
  ( (Unit!15821) )
))
(declare-fun lt!234157 () Unit!15820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15820)

(assert (=> b!511855 (= lt!234157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511856 () Bool)

(assert (=> b!511856 (= e!298962 true)))

(assert (=> b!511856 (= lt!234160 Undefined!4288)))

(declare-fun b!511857 () Bool)

(declare-fun res!312659 () Bool)

(assert (=> b!511857 (=> (not res!312659) (not e!298963))))

(assert (=> b!511857 (= res!312659 (validKeyInArray!0 k0!2280))))

(declare-fun b!511858 () Bool)

(declare-fun res!312662 () Bool)

(assert (=> b!511858 (=> (not res!312662) (not e!298963))))

(declare-fun arrayContainsKey!0 (array!32894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511858 (= res!312662 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46230 res!312657) b!511849))

(assert (= (and b!511849 res!312660) b!511854))

(assert (= (and b!511854 res!312658) b!511857))

(assert (= (and b!511857 res!312659) b!511858))

(assert (= (and b!511858 res!312662) b!511850))

(assert (= (and b!511850 res!312655) b!511853))

(assert (= (and b!511853 res!312661) b!511852))

(assert (= (and b!511852 res!312654) b!511855))

(assert (= (and b!511855 (not res!312656)) b!511851))

(assert (= (and b!511851 (not res!312653)) b!511856))

(declare-fun m!492961 () Bool)

(assert (=> b!511854 m!492961))

(assert (=> b!511854 m!492961))

(declare-fun m!492963 () Bool)

(assert (=> b!511854 m!492963))

(declare-fun m!492965 () Bool)

(assert (=> b!511853 m!492965))

(declare-fun m!492967 () Bool)

(assert (=> b!511850 m!492967))

(declare-fun m!492969 () Bool)

(assert (=> start!46230 m!492969))

(declare-fun m!492971 () Bool)

(assert (=> start!46230 m!492971))

(declare-fun m!492973 () Bool)

(assert (=> b!511857 m!492973))

(declare-fun m!492975 () Bool)

(assert (=> b!511852 m!492975))

(declare-fun m!492977 () Bool)

(assert (=> b!511858 m!492977))

(declare-fun m!492979 () Bool)

(assert (=> b!511855 m!492979))

(declare-fun m!492981 () Bool)

(assert (=> b!511855 m!492981))

(declare-fun m!492983 () Bool)

(assert (=> b!511855 m!492983))

(assert (=> b!511855 m!492961))

(declare-fun m!492985 () Bool)

(assert (=> b!511855 m!492985))

(assert (=> b!511855 m!492961))

(assert (=> b!511855 m!492961))

(declare-fun m!492987 () Bool)

(assert (=> b!511855 m!492987))

(assert (=> b!511855 m!492983))

(declare-fun m!492989 () Bool)

(assert (=> b!511855 m!492989))

(assert (=> b!511855 m!492961))

(declare-fun m!492991 () Bool)

(assert (=> b!511855 m!492991))

(declare-fun m!492993 () Bool)

(assert (=> b!511855 m!492993))

(assert (=> b!511855 m!492983))

(declare-fun m!492995 () Bool)

(assert (=> b!511855 m!492995))

(check-sat (not b!511852) (not b!511857) (not start!46230) (not b!511853) (not b!511858) (not b!511850) (not b!511854) (not b!511855))
(check-sat)
