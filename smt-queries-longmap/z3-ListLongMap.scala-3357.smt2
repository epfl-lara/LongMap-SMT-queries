; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46182 () Bool)

(assert start!46182)

(declare-fun b!511130 () Bool)

(declare-fun res!311935 () Bool)

(declare-fun e!298676 () Bool)

(assert (=> b!511130 (=> (not res!311935) (not e!298676))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32846 0))(
  ( (array!32847 (arr!15800 (Array (_ BitVec 32) (_ BitVec 64))) (size!16165 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32846)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511130 (= res!311935 (and (= (size!16165 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16165 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16165 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511131 () Bool)

(declare-fun res!311939 () Bool)

(declare-fun e!298674 () Bool)

(assert (=> b!511131 (=> (not res!311939) (not e!298674))))

(declare-datatypes ((List!9997 0))(
  ( (Nil!9994) (Cons!9993 (h!10873 (_ BitVec 64)) (t!16216 List!9997)) )
))
(declare-fun arrayNoDuplicates!0 (array!32846 (_ BitVec 32) List!9997) Bool)

(assert (=> b!511131 (= res!311939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9994))))

(declare-fun b!511132 () Bool)

(declare-fun res!311933 () Bool)

(assert (=> b!511132 (=> (not res!311933) (not e!298674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32846 (_ BitVec 32)) Bool)

(assert (=> b!511132 (= res!311933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511133 () Bool)

(declare-fun res!311940 () Bool)

(declare-fun e!298677 () Bool)

(assert (=> b!511133 (=> res!311940 e!298677)))

(declare-datatypes ((SeekEntryResult!4264 0))(
  ( (MissingZero!4264 (index!19244 (_ BitVec 32))) (Found!4264 (index!19245 (_ BitVec 32))) (Intermediate!4264 (undefined!5076 Bool) (index!19246 (_ BitVec 32)) (x!48210 (_ BitVec 32))) (Undefined!4264) (MissingVacant!4264 (index!19247 (_ BitVec 32))) )
))
(declare-fun lt!233727 () SeekEntryResult!4264)

(get-info :version)

(assert (=> b!511133 (= res!311940 (or (not ((_ is Intermediate!4264) lt!233727)) (not (undefined!5076 lt!233727))))))

(declare-fun res!311942 () Bool)

(assert (=> start!46182 (=> (not res!311942) (not e!298676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46182 (= res!311942 (validMask!0 mask!3524))))

(assert (=> start!46182 e!298676))

(assert (=> start!46182 true))

(declare-fun array_inv!11683 (array!32846) Bool)

(assert (=> start!46182 (array_inv!11683 a!3235)))

(declare-fun b!511129 () Bool)

(declare-fun res!311938 () Bool)

(assert (=> b!511129 (=> (not res!311938) (not e!298676))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511129 (= res!311938 (validKeyInArray!0 k0!2280))))

(declare-fun b!511134 () Bool)

(declare-fun res!311937 () Bool)

(assert (=> b!511134 (=> (not res!311937) (not e!298676))))

(declare-fun arrayContainsKey!0 (array!32846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511134 (= res!311937 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511135 () Bool)

(assert (=> b!511135 (= e!298674 (not e!298677))))

(declare-fun res!311936 () Bool)

(assert (=> b!511135 (=> res!311936 e!298677)))

(declare-fun lt!233726 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32846 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!511135 (= res!311936 (= lt!233727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233726 (select (store (arr!15800 a!3235) i!1204 k0!2280) j!176) (array!32847 (store (arr!15800 a!3235) i!1204 k0!2280) (size!16165 a!3235)) mask!3524)))))

(declare-fun lt!233725 () (_ BitVec 32))

(assert (=> b!511135 (= lt!233727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233725 (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511135 (= lt!233726 (toIndex!0 (select (store (arr!15800 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511135 (= lt!233725 (toIndex!0 (select (arr!15800 a!3235) j!176) mask!3524))))

(declare-fun lt!233724 () SeekEntryResult!4264)

(assert (=> b!511135 (= lt!233724 (Found!4264 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32846 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!511135 (= lt!233724 (seekEntryOrOpen!0 (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511135 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15772 0))(
  ( (Unit!15773) )
))
(declare-fun lt!233723 () Unit!15772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15772)

(assert (=> b!511135 (= lt!233723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511136 () Bool)

(declare-fun res!311934 () Bool)

(assert (=> b!511136 (=> (not res!311934) (not e!298676))))

(assert (=> b!511136 (= res!311934 (validKeyInArray!0 (select (arr!15800 a!3235) j!176)))))

(declare-fun b!511137 () Bool)

(assert (=> b!511137 (= e!298677 true)))

(assert (=> b!511137 (= lt!233724 Undefined!4264)))

(declare-fun b!511138 () Bool)

(assert (=> b!511138 (= e!298676 e!298674)))

(declare-fun res!311941 () Bool)

(assert (=> b!511138 (=> (not res!311941) (not e!298674))))

(declare-fun lt!233728 () SeekEntryResult!4264)

(assert (=> b!511138 (= res!311941 (or (= lt!233728 (MissingZero!4264 i!1204)) (= lt!233728 (MissingVacant!4264 i!1204))))))

(assert (=> b!511138 (= lt!233728 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46182 res!311942) b!511130))

(assert (= (and b!511130 res!311935) b!511136))

(assert (= (and b!511136 res!311934) b!511129))

(assert (= (and b!511129 res!311938) b!511134))

(assert (= (and b!511134 res!311937) b!511138))

(assert (= (and b!511138 res!311941) b!511132))

(assert (= (and b!511132 res!311933) b!511131))

(assert (= (and b!511131 res!311939) b!511135))

(assert (= (and b!511135 (not res!311936)) b!511133))

(assert (= (and b!511133 (not res!311940)) b!511137))

(declare-fun m!492097 () Bool)

(assert (=> b!511129 m!492097))

(declare-fun m!492099 () Bool)

(assert (=> b!511135 m!492099))

(declare-fun m!492101 () Bool)

(assert (=> b!511135 m!492101))

(declare-fun m!492103 () Bool)

(assert (=> b!511135 m!492103))

(declare-fun m!492105 () Bool)

(assert (=> b!511135 m!492105))

(declare-fun m!492107 () Bool)

(assert (=> b!511135 m!492107))

(assert (=> b!511135 m!492105))

(declare-fun m!492109 () Bool)

(assert (=> b!511135 m!492109))

(assert (=> b!511135 m!492105))

(declare-fun m!492111 () Bool)

(assert (=> b!511135 m!492111))

(assert (=> b!511135 m!492103))

(declare-fun m!492113 () Bool)

(assert (=> b!511135 m!492113))

(assert (=> b!511135 m!492105))

(declare-fun m!492115 () Bool)

(assert (=> b!511135 m!492115))

(assert (=> b!511135 m!492103))

(declare-fun m!492117 () Bool)

(assert (=> b!511135 m!492117))

(declare-fun m!492119 () Bool)

(assert (=> b!511138 m!492119))

(declare-fun m!492121 () Bool)

(assert (=> start!46182 m!492121))

(declare-fun m!492123 () Bool)

(assert (=> start!46182 m!492123))

(declare-fun m!492125 () Bool)

(assert (=> b!511131 m!492125))

(declare-fun m!492127 () Bool)

(assert (=> b!511132 m!492127))

(assert (=> b!511136 m!492105))

(assert (=> b!511136 m!492105))

(declare-fun m!492129 () Bool)

(assert (=> b!511136 m!492129))

(declare-fun m!492131 () Bool)

(assert (=> b!511134 m!492131))

(check-sat (not start!46182) (not b!511129) (not b!511138) (not b!511131) (not b!511136) (not b!511135) (not b!511132) (not b!511134))
(check-sat)
