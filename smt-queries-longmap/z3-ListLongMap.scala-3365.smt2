; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46232 () Bool)

(assert start!46232)

(declare-fun b!512059 () Bool)

(declare-fun res!312783 () Bool)

(declare-fun e!299097 () Bool)

(assert (=> b!512059 (=> (not res!312783) (not e!299097))))

(declare-datatypes ((array!32887 0))(
  ( (array!32888 (arr!15820 (Array (_ BitVec 32) (_ BitVec 64))) (size!16184 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32887)

(declare-datatypes ((List!9885 0))(
  ( (Nil!9882) (Cons!9881 (h!10761 (_ BitVec 64)) (t!16105 List!9885)) )
))
(declare-fun arrayNoDuplicates!0 (array!32887 (_ BitVec 32) List!9885) Bool)

(assert (=> b!512059 (= res!312783 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9882))))

(declare-fun b!512060 () Bool)

(declare-fun res!312781 () Bool)

(declare-fun e!299100 () Bool)

(assert (=> b!512060 (=> (not res!312781) (not e!299100))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512060 (= res!312781 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512061 () Bool)

(declare-fun res!312780 () Bool)

(assert (=> b!512061 (=> (not res!312780) (not e!299100))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512061 (= res!312780 (and (= (size!16184 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16184 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16184 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512062 () Bool)

(declare-fun e!299098 () Bool)

(assert (=> b!512062 (= e!299097 (not e!299098))))

(declare-fun res!312775 () Bool)

(assert (=> b!512062 (=> res!312775 e!299098)))

(declare-datatypes ((SeekEntryResult!4243 0))(
  ( (MissingZero!4243 (index!19160 (_ BitVec 32))) (Found!4243 (index!19161 (_ BitVec 32))) (Intermediate!4243 (undefined!5055 Bool) (index!19162 (_ BitVec 32)) (x!48255 (_ BitVec 32))) (Undefined!4243) (MissingVacant!4243 (index!19163 (_ BitVec 32))) )
))
(declare-fun lt!234402 () SeekEntryResult!4243)

(declare-fun lt!234401 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32887 (_ BitVec 32)) SeekEntryResult!4243)

(assert (=> b!512062 (= res!312775 (= lt!234402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234401 (select (store (arr!15820 a!3235) i!1204 k0!2280) j!176) (array!32888 (store (arr!15820 a!3235) i!1204 k0!2280) (size!16184 a!3235)) mask!3524)))))

(declare-fun lt!234404 () (_ BitVec 32))

(assert (=> b!512062 (= lt!234402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234404 (select (arr!15820 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512062 (= lt!234401 (toIndex!0 (select (store (arr!15820 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512062 (= lt!234404 (toIndex!0 (select (arr!15820 a!3235) j!176) mask!3524))))

(declare-fun lt!234403 () SeekEntryResult!4243)

(assert (=> b!512062 (= lt!234403 (Found!4243 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32887 (_ BitVec 32)) SeekEntryResult!4243)

(assert (=> b!512062 (= lt!234403 (seekEntryOrOpen!0 (select (arr!15820 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32887 (_ BitVec 32)) Bool)

(assert (=> b!512062 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15805 0))(
  ( (Unit!15806) )
))
(declare-fun lt!234406 () Unit!15805)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15805)

(assert (=> b!512062 (= lt!234406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512063 () Bool)

(assert (=> b!512063 (= e!299098 true)))

(assert (=> b!512063 (= lt!234403 Undefined!4243)))

(declare-fun b!512065 () Bool)

(declare-fun res!312782 () Bool)

(assert (=> b!512065 (=> (not res!312782) (not e!299100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512065 (= res!312782 (validKeyInArray!0 k0!2280))))

(declare-fun b!512066 () Bool)

(assert (=> b!512066 (= e!299100 e!299097)))

(declare-fun res!312777 () Bool)

(assert (=> b!512066 (=> (not res!312777) (not e!299097))))

(declare-fun lt!234405 () SeekEntryResult!4243)

(assert (=> b!512066 (= res!312777 (or (= lt!234405 (MissingZero!4243 i!1204)) (= lt!234405 (MissingVacant!4243 i!1204))))))

(assert (=> b!512066 (= lt!234405 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512067 () Bool)

(declare-fun res!312778 () Bool)

(assert (=> b!512067 (=> (not res!312778) (not e!299097))))

(assert (=> b!512067 (= res!312778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512068 () Bool)

(declare-fun res!312784 () Bool)

(assert (=> b!512068 (=> (not res!312784) (not e!299100))))

(assert (=> b!512068 (= res!312784 (validKeyInArray!0 (select (arr!15820 a!3235) j!176)))))

(declare-fun b!512064 () Bool)

(declare-fun res!312779 () Bool)

(assert (=> b!512064 (=> res!312779 e!299098)))

(get-info :version)

(assert (=> b!512064 (= res!312779 (or (not ((_ is Intermediate!4243) lt!234402)) (not (undefined!5055 lt!234402))))))

(declare-fun res!312776 () Bool)

(assert (=> start!46232 (=> (not res!312776) (not e!299100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46232 (= res!312776 (validMask!0 mask!3524))))

(assert (=> start!46232 e!299100))

(assert (=> start!46232 true))

(declare-fun array_inv!11679 (array!32887) Bool)

(assert (=> start!46232 (array_inv!11679 a!3235)))

(assert (= (and start!46232 res!312776) b!512061))

(assert (= (and b!512061 res!312780) b!512068))

(assert (= (and b!512068 res!312784) b!512065))

(assert (= (and b!512065 res!312782) b!512060))

(assert (= (and b!512060 res!312781) b!512066))

(assert (= (and b!512066 res!312777) b!512067))

(assert (= (and b!512067 res!312778) b!512059))

(assert (= (and b!512059 res!312783) b!512062))

(assert (= (and b!512062 (not res!312775)) b!512064))

(assert (= (and b!512064 (not res!312779)) b!512063))

(declare-fun m!493897 () Bool)

(assert (=> b!512060 m!493897))

(declare-fun m!493899 () Bool)

(assert (=> b!512065 m!493899))

(declare-fun m!493901 () Bool)

(assert (=> b!512062 m!493901))

(declare-fun m!493903 () Bool)

(assert (=> b!512062 m!493903))

(declare-fun m!493905 () Bool)

(assert (=> b!512062 m!493905))

(declare-fun m!493907 () Bool)

(assert (=> b!512062 m!493907))

(assert (=> b!512062 m!493905))

(declare-fun m!493909 () Bool)

(assert (=> b!512062 m!493909))

(assert (=> b!512062 m!493905))

(declare-fun m!493911 () Bool)

(assert (=> b!512062 m!493911))

(assert (=> b!512062 m!493903))

(declare-fun m!493913 () Bool)

(assert (=> b!512062 m!493913))

(assert (=> b!512062 m!493905))

(declare-fun m!493915 () Bool)

(assert (=> b!512062 m!493915))

(assert (=> b!512062 m!493903))

(declare-fun m!493917 () Bool)

(assert (=> b!512062 m!493917))

(declare-fun m!493919 () Bool)

(assert (=> b!512062 m!493919))

(declare-fun m!493921 () Bool)

(assert (=> b!512059 m!493921))

(assert (=> b!512068 m!493905))

(assert (=> b!512068 m!493905))

(declare-fun m!493923 () Bool)

(assert (=> b!512068 m!493923))

(declare-fun m!493925 () Bool)

(assert (=> b!512066 m!493925))

(declare-fun m!493927 () Bool)

(assert (=> start!46232 m!493927))

(declare-fun m!493929 () Bool)

(assert (=> start!46232 m!493929))

(declare-fun m!493931 () Bool)

(assert (=> b!512067 m!493931))

(check-sat (not b!512062) (not b!512067) (not b!512060) (not b!512066) (not b!512068) (not b!512059) (not start!46232) (not b!512065))
(check-sat)
