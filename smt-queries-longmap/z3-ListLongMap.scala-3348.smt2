; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46068 () Bool)

(assert start!46068)

(declare-fun res!311095 () Bool)

(declare-fun e!298164 () Bool)

(assert (=> start!46068 (=> (not res!311095) (not e!298164))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46068 (= res!311095 (validMask!0 mask!3524))))

(assert (=> start!46068 e!298164))

(assert (=> start!46068 true))

(declare-datatypes ((array!32789 0))(
  ( (array!32790 (arr!15773 (Array (_ BitVec 32) (_ BitVec 64))) (size!16138 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32789)

(declare-fun array_inv!11656 (array!32789) Bool)

(assert (=> start!46068 (array_inv!11656 a!3235)))

(declare-fun b!510107 () Bool)

(declare-fun res!311101 () Bool)

(assert (=> b!510107 (=> (not res!311101) (not e!298164))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510107 (= res!311101 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510108 () Bool)

(declare-fun res!311099 () Bool)

(declare-fun e!298166 () Bool)

(assert (=> b!510108 (=> (not res!311099) (not e!298166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32789 (_ BitVec 32)) Bool)

(assert (=> b!510108 (= res!311099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510109 () Bool)

(declare-fun res!311102 () Bool)

(assert (=> b!510109 (=> (not res!311102) (not e!298164))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510109 (= res!311102 (and (= (size!16138 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16138 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16138 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510110 () Bool)

(declare-fun res!311098 () Bool)

(assert (=> b!510110 (=> (not res!311098) (not e!298164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510110 (= res!311098 (validKeyInArray!0 (select (arr!15773 a!3235) j!176)))))

(declare-fun b!510111 () Bool)

(assert (=> b!510111 (= e!298164 e!298166)))

(declare-fun res!311097 () Bool)

(assert (=> b!510111 (=> (not res!311097) (not e!298166))))

(declare-datatypes ((SeekEntryResult!4237 0))(
  ( (MissingZero!4237 (index!19136 (_ BitVec 32))) (Found!4237 (index!19137 (_ BitVec 32))) (Intermediate!4237 (undefined!5049 Bool) (index!19138 (_ BitVec 32)) (x!48105 (_ BitVec 32))) (Undefined!4237) (MissingVacant!4237 (index!19139 (_ BitVec 32))) )
))
(declare-fun lt!233112 () SeekEntryResult!4237)

(assert (=> b!510111 (= res!311097 (or (= lt!233112 (MissingZero!4237 i!1204)) (= lt!233112 (MissingVacant!4237 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32789 (_ BitVec 32)) SeekEntryResult!4237)

(assert (=> b!510111 (= lt!233112 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510112 () Bool)

(declare-fun e!298165 () Bool)

(assert (=> b!510112 (= e!298165 true)))

(declare-fun lt!233109 () (_ BitVec 64))

(declare-fun lt!233111 () array!32789)

(declare-fun lt!233110 () SeekEntryResult!4237)

(assert (=> b!510112 (= lt!233110 (seekEntryOrOpen!0 lt!233109 lt!233111 mask!3524))))

(declare-datatypes ((Unit!15718 0))(
  ( (Unit!15719) )
))
(declare-fun lt!233108 () Unit!15718)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15718)

(assert (=> b!510112 (= lt!233108 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510113 () Bool)

(declare-fun res!311094 () Bool)

(assert (=> b!510113 (=> (not res!311094) (not e!298164))))

(assert (=> b!510113 (= res!311094 (validKeyInArray!0 k0!2280))))

(declare-fun b!510114 () Bool)

(assert (=> b!510114 (= e!298166 (not e!298165))))

(declare-fun res!311100 () Bool)

(assert (=> b!510114 (=> res!311100 e!298165)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32789 (_ BitVec 32)) SeekEntryResult!4237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510114 (= res!311100 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15773 a!3235) j!176) mask!3524) (select (arr!15773 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233109 mask!3524) lt!233109 lt!233111 mask!3524))))))

(assert (=> b!510114 (= lt!233109 (select (store (arr!15773 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510114 (= lt!233111 (array!32790 (store (arr!15773 a!3235) i!1204 k0!2280) (size!16138 a!3235)))))

(assert (=> b!510114 (= lt!233110 (Found!4237 j!176))))

(assert (=> b!510114 (= lt!233110 (seekEntryOrOpen!0 (select (arr!15773 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510114 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233113 () Unit!15718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15718)

(assert (=> b!510114 (= lt!233113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510115 () Bool)

(declare-fun res!311096 () Bool)

(assert (=> b!510115 (=> (not res!311096) (not e!298166))))

(declare-datatypes ((List!9970 0))(
  ( (Nil!9967) (Cons!9966 (h!10843 (_ BitVec 64)) (t!16189 List!9970)) )
))
(declare-fun arrayNoDuplicates!0 (array!32789 (_ BitVec 32) List!9970) Bool)

(assert (=> b!510115 (= res!311096 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9967))))

(assert (= (and start!46068 res!311095) b!510109))

(assert (= (and b!510109 res!311102) b!510110))

(assert (= (and b!510110 res!311098) b!510113))

(assert (= (and b!510113 res!311094) b!510107))

(assert (= (and b!510107 res!311101) b!510111))

(assert (= (and b!510111 res!311097) b!510108))

(assert (= (and b!510108 res!311099) b!510115))

(assert (= (and b!510115 res!311096) b!510114))

(assert (= (and b!510114 (not res!311100)) b!510112))

(declare-fun m!490861 () Bool)

(assert (=> b!510112 m!490861))

(declare-fun m!490863 () Bool)

(assert (=> b!510112 m!490863))

(declare-fun m!490865 () Bool)

(assert (=> b!510108 m!490865))

(declare-fun m!490867 () Bool)

(assert (=> b!510115 m!490867))

(declare-fun m!490869 () Bool)

(assert (=> b!510110 m!490869))

(assert (=> b!510110 m!490869))

(declare-fun m!490871 () Bool)

(assert (=> b!510110 m!490871))

(declare-fun m!490873 () Bool)

(assert (=> start!46068 m!490873))

(declare-fun m!490875 () Bool)

(assert (=> start!46068 m!490875))

(declare-fun m!490877 () Bool)

(assert (=> b!510111 m!490877))

(declare-fun m!490879 () Bool)

(assert (=> b!510107 m!490879))

(declare-fun m!490881 () Bool)

(assert (=> b!510114 m!490881))

(declare-fun m!490883 () Bool)

(assert (=> b!510114 m!490883))

(declare-fun m!490885 () Bool)

(assert (=> b!510114 m!490885))

(declare-fun m!490887 () Bool)

(assert (=> b!510114 m!490887))

(declare-fun m!490889 () Bool)

(assert (=> b!510114 m!490889))

(assert (=> b!510114 m!490869))

(declare-fun m!490891 () Bool)

(assert (=> b!510114 m!490891))

(assert (=> b!510114 m!490883))

(declare-fun m!490893 () Bool)

(assert (=> b!510114 m!490893))

(assert (=> b!510114 m!490869))

(assert (=> b!510114 m!490889))

(assert (=> b!510114 m!490869))

(declare-fun m!490895 () Bool)

(assert (=> b!510114 m!490895))

(assert (=> b!510114 m!490869))

(declare-fun m!490897 () Bool)

(assert (=> b!510114 m!490897))

(declare-fun m!490899 () Bool)

(assert (=> b!510113 m!490899))

(check-sat (not b!510114) (not b!510110) (not b!510115) (not start!46068) (not b!510112) (not b!510108) (not b!510111) (not b!510107) (not b!510113))
(check-sat)
