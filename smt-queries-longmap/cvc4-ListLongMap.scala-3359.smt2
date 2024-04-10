; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46210 () Bool)

(assert start!46210)

(declare-fun b!511640 () Bool)

(declare-fun res!312311 () Bool)

(declare-fun e!298946 () Bool)

(assert (=> b!511640 (=> (not res!312311) (not e!298946))))

(declare-datatypes ((array!32864 0))(
  ( (array!32865 (arr!15809 (Array (_ BitVec 32) (_ BitVec 64))) (size!16173 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32864)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511640 (= res!312311 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511641 () Bool)

(declare-fun e!298947 () Bool)

(assert (=> b!511641 (= e!298946 e!298947)))

(declare-fun res!312308 () Bool)

(assert (=> b!511641 (=> (not res!312308) (not e!298947))))

(declare-datatypes ((SeekEntryResult!4276 0))(
  ( (MissingZero!4276 (index!19292 (_ BitVec 32))) (Found!4276 (index!19293 (_ BitVec 32))) (Intermediate!4276 (undefined!5088 Bool) (index!19294 (_ BitVec 32)) (x!48243 (_ BitVec 32))) (Undefined!4276) (MissingVacant!4276 (index!19295 (_ BitVec 32))) )
))
(declare-fun lt!234102 () SeekEntryResult!4276)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511641 (= res!312308 (or (= lt!234102 (MissingZero!4276 i!1204)) (= lt!234102 (MissingVacant!4276 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32864 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!511641 (= lt!234102 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511642 () Bool)

(declare-fun res!312309 () Bool)

(assert (=> b!511642 (=> (not res!312309) (not e!298947))))

(declare-datatypes ((List!9967 0))(
  ( (Nil!9964) (Cons!9963 (h!10843 (_ BitVec 64)) (t!16195 List!9967)) )
))
(declare-fun arrayNoDuplicates!0 (array!32864 (_ BitVec 32) List!9967) Bool)

(assert (=> b!511642 (= res!312309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9964))))

(declare-fun b!511643 () Bool)

(declare-fun res!312305 () Bool)

(declare-fun e!298944 () Bool)

(assert (=> b!511643 (=> res!312305 e!298944)))

(declare-fun lt!234103 () SeekEntryResult!4276)

(assert (=> b!511643 (= res!312305 (or (not (is-Intermediate!4276 lt!234103)) (not (undefined!5088 lt!234103))))))

(declare-fun b!511644 () Bool)

(assert (=> b!511644 (= e!298944 (bvsle #b00000000000000000000000000000000 (size!16173 a!3235)))))

(declare-fun lt!234105 () SeekEntryResult!4276)

(assert (=> b!511644 (= lt!234105 Undefined!4276)))

(declare-fun res!312306 () Bool)

(assert (=> start!46210 (=> (not res!312306) (not e!298946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46210 (= res!312306 (validMask!0 mask!3524))))

(assert (=> start!46210 e!298946))

(assert (=> start!46210 true))

(declare-fun array_inv!11605 (array!32864) Bool)

(assert (=> start!46210 (array_inv!11605 a!3235)))

(declare-fun b!511645 () Bool)

(declare-fun res!312303 () Bool)

(assert (=> b!511645 (=> (not res!312303) (not e!298947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32864 (_ BitVec 32)) Bool)

(assert (=> b!511645 (= res!312303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511646 () Bool)

(assert (=> b!511646 (= e!298947 (not e!298944))))

(declare-fun res!312302 () Bool)

(assert (=> b!511646 (=> res!312302 e!298944)))

(declare-fun lt!234106 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32864 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!511646 (= res!312302 (= lt!234103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234106 (select (store (arr!15809 a!3235) i!1204 k!2280) j!176) (array!32865 (store (arr!15809 a!3235) i!1204 k!2280) (size!16173 a!3235)) mask!3524)))))

(declare-fun lt!234101 () (_ BitVec 32))

(assert (=> b!511646 (= lt!234103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234101 (select (arr!15809 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511646 (= lt!234106 (toIndex!0 (select (store (arr!15809 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511646 (= lt!234101 (toIndex!0 (select (arr!15809 a!3235) j!176) mask!3524))))

(assert (=> b!511646 (= lt!234105 (Found!4276 j!176))))

(assert (=> b!511646 (= lt!234105 (seekEntryOrOpen!0 (select (arr!15809 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511646 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15810 0))(
  ( (Unit!15811) )
))
(declare-fun lt!234104 () Unit!15810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15810)

(assert (=> b!511646 (= lt!234104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511647 () Bool)

(declare-fun res!312304 () Bool)

(assert (=> b!511647 (=> (not res!312304) (not e!298946))))

(assert (=> b!511647 (= res!312304 (and (= (size!16173 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16173 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16173 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511648 () Bool)

(declare-fun res!312310 () Bool)

(assert (=> b!511648 (=> (not res!312310) (not e!298946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511648 (= res!312310 (validKeyInArray!0 (select (arr!15809 a!3235) j!176)))))

(declare-fun b!511649 () Bool)

(declare-fun res!312307 () Bool)

(assert (=> b!511649 (=> (not res!312307) (not e!298946))))

(assert (=> b!511649 (= res!312307 (validKeyInArray!0 k!2280))))

(assert (= (and start!46210 res!312306) b!511647))

(assert (= (and b!511647 res!312304) b!511648))

(assert (= (and b!511648 res!312310) b!511649))

(assert (= (and b!511649 res!312307) b!511640))

(assert (= (and b!511640 res!312311) b!511641))

(assert (= (and b!511641 res!312308) b!511645))

(assert (= (and b!511645 res!312303) b!511642))

(assert (= (and b!511642 res!312309) b!511646))

(assert (= (and b!511646 (not res!312302)) b!511643))

(assert (= (and b!511643 (not res!312305)) b!511644))

(declare-fun m!493137 () Bool)

(assert (=> b!511645 m!493137))

(declare-fun m!493139 () Bool)

(assert (=> start!46210 m!493139))

(declare-fun m!493141 () Bool)

(assert (=> start!46210 m!493141))

(declare-fun m!493143 () Bool)

(assert (=> b!511642 m!493143))

(declare-fun m!493145 () Bool)

(assert (=> b!511640 m!493145))

(declare-fun m!493147 () Bool)

(assert (=> b!511649 m!493147))

(declare-fun m!493149 () Bool)

(assert (=> b!511648 m!493149))

(assert (=> b!511648 m!493149))

(declare-fun m!493151 () Bool)

(assert (=> b!511648 m!493151))

(declare-fun m!493153 () Bool)

(assert (=> b!511641 m!493153))

(declare-fun m!493155 () Bool)

(assert (=> b!511646 m!493155))

(declare-fun m!493157 () Bool)

(assert (=> b!511646 m!493157))

(declare-fun m!493159 () Bool)

(assert (=> b!511646 m!493159))

(assert (=> b!511646 m!493149))

(declare-fun m!493161 () Bool)

(assert (=> b!511646 m!493161))

(assert (=> b!511646 m!493149))

(declare-fun m!493163 () Bool)

(assert (=> b!511646 m!493163))

(assert (=> b!511646 m!493149))

(declare-fun m!493165 () Bool)

(assert (=> b!511646 m!493165))

(assert (=> b!511646 m!493159))

(declare-fun m!493167 () Bool)

(assert (=> b!511646 m!493167))

(assert (=> b!511646 m!493149))

(declare-fun m!493169 () Bool)

(assert (=> b!511646 m!493169))

(assert (=> b!511646 m!493159))

(declare-fun m!493171 () Bool)

(assert (=> b!511646 m!493171))

(push 1)

