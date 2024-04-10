; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46000 () Bool)

(assert start!46000)

(declare-fun res!310143 () Bool)

(declare-fun e!297858 () Bool)

(assert (=> start!46000 (=> (not res!310143) (not e!297858))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46000 (= res!310143 (validMask!0 mask!3524))))

(assert (=> start!46000 e!297858))

(assert (=> start!46000 true))

(declare-datatypes ((array!32711 0))(
  ( (array!32712 (arr!15734 (Array (_ BitVec 32) (_ BitVec 64))) (size!16098 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32711)

(declare-fun array_inv!11530 (array!32711) Bool)

(assert (=> start!46000 (array_inv!11530 a!3235)))

(declare-fun b!509298 () Bool)

(declare-fun res!310150 () Bool)

(assert (=> b!509298 (=> (not res!310150) (not e!297858))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509298 (= res!310150 (and (= (size!16098 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16098 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16098 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509299 () Bool)

(declare-fun e!297861 () Bool)

(assert (=> b!509299 (= e!297861 (not true))))

(declare-fun lt!232624 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4201 0))(
  ( (MissingZero!4201 (index!18992 (_ BitVec 32))) (Found!4201 (index!18993 (_ BitVec 32))) (Intermediate!4201 (undefined!5013 Bool) (index!18994 (_ BitVec 32)) (x!47962 (_ BitVec 32))) (Undefined!4201) (MissingVacant!4201 (index!18995 (_ BitVec 32))) )
))
(declare-fun lt!232625 () SeekEntryResult!4201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32711 (_ BitVec 32)) SeekEntryResult!4201)

(assert (=> b!509299 (= lt!232625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232624 (select (store (arr!15734 a!3235) i!1204 k!2280) j!176) (array!32712 (store (arr!15734 a!3235) i!1204 k!2280) (size!16098 a!3235)) mask!3524))))

(declare-fun lt!232623 () SeekEntryResult!4201)

(declare-fun lt!232622 () (_ BitVec 32))

(assert (=> b!509299 (= lt!232623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232622 (select (arr!15734 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509299 (= lt!232624 (toIndex!0 (select (store (arr!15734 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509299 (= lt!232622 (toIndex!0 (select (arr!15734 a!3235) j!176) mask!3524))))

(declare-fun e!297860 () Bool)

(assert (=> b!509299 e!297860))

(declare-fun res!310147 () Bool)

(assert (=> b!509299 (=> (not res!310147) (not e!297860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32711 (_ BitVec 32)) Bool)

(assert (=> b!509299 (= res!310147 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15660 0))(
  ( (Unit!15661) )
))
(declare-fun lt!232626 () Unit!15660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15660)

(assert (=> b!509299 (= lt!232626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509300 () Bool)

(declare-fun res!310146 () Bool)

(assert (=> b!509300 (=> (not res!310146) (not e!297861))))

(assert (=> b!509300 (= res!310146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32711 (_ BitVec 32)) SeekEntryResult!4201)

(assert (=> b!509301 (= e!297860 (= (seekEntryOrOpen!0 (select (arr!15734 a!3235) j!176) a!3235 mask!3524) (Found!4201 j!176)))))

(declare-fun b!509302 () Bool)

(declare-fun res!310144 () Bool)

(assert (=> b!509302 (=> (not res!310144) (not e!297858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509302 (= res!310144 (validKeyInArray!0 k!2280))))

(declare-fun b!509303 () Bool)

(assert (=> b!509303 (= e!297858 e!297861)))

(declare-fun res!310149 () Bool)

(assert (=> b!509303 (=> (not res!310149) (not e!297861))))

(declare-fun lt!232627 () SeekEntryResult!4201)

(assert (=> b!509303 (= res!310149 (or (= lt!232627 (MissingZero!4201 i!1204)) (= lt!232627 (MissingVacant!4201 i!1204))))))

(assert (=> b!509303 (= lt!232627 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509304 () Bool)

(declare-fun res!310148 () Bool)

(assert (=> b!509304 (=> (not res!310148) (not e!297858))))

(assert (=> b!509304 (= res!310148 (validKeyInArray!0 (select (arr!15734 a!3235) j!176)))))

(declare-fun b!509305 () Bool)

(declare-fun res!310151 () Bool)

(assert (=> b!509305 (=> (not res!310151) (not e!297861))))

(declare-datatypes ((List!9892 0))(
  ( (Nil!9889) (Cons!9888 (h!10765 (_ BitVec 64)) (t!16120 List!9892)) )
))
(declare-fun arrayNoDuplicates!0 (array!32711 (_ BitVec 32) List!9892) Bool)

(assert (=> b!509305 (= res!310151 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9889))))

(declare-fun b!509306 () Bool)

(declare-fun res!310145 () Bool)

(assert (=> b!509306 (=> (not res!310145) (not e!297858))))

(declare-fun arrayContainsKey!0 (array!32711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509306 (= res!310145 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46000 res!310143) b!509298))

(assert (= (and b!509298 res!310150) b!509304))

(assert (= (and b!509304 res!310148) b!509302))

(assert (= (and b!509302 res!310144) b!509306))

(assert (= (and b!509306 res!310145) b!509303))

(assert (= (and b!509303 res!310149) b!509300))

(assert (= (and b!509300 res!310146) b!509305))

(assert (= (and b!509305 res!310151) b!509299))

(assert (= (and b!509299 res!310147) b!509301))

(declare-fun m!490137 () Bool)

(assert (=> b!509301 m!490137))

(assert (=> b!509301 m!490137))

(declare-fun m!490139 () Bool)

(assert (=> b!509301 m!490139))

(declare-fun m!490141 () Bool)

(assert (=> b!509302 m!490141))

(assert (=> b!509304 m!490137))

(assert (=> b!509304 m!490137))

(declare-fun m!490143 () Bool)

(assert (=> b!509304 m!490143))

(declare-fun m!490145 () Bool)

(assert (=> b!509305 m!490145))

(declare-fun m!490147 () Bool)

(assert (=> b!509303 m!490147))

(declare-fun m!490149 () Bool)

(assert (=> b!509300 m!490149))

(declare-fun m!490151 () Bool)

(assert (=> b!509299 m!490151))

(declare-fun m!490153 () Bool)

(assert (=> b!509299 m!490153))

(declare-fun m!490155 () Bool)

(assert (=> b!509299 m!490155))

(assert (=> b!509299 m!490137))

(declare-fun m!490157 () Bool)

(assert (=> b!509299 m!490157))

(assert (=> b!509299 m!490155))

(declare-fun m!490159 () Bool)

(assert (=> b!509299 m!490159))

(assert (=> b!509299 m!490155))

(declare-fun m!490161 () Bool)

(assert (=> b!509299 m!490161))

(assert (=> b!509299 m!490137))

(declare-fun m!490163 () Bool)

(assert (=> b!509299 m!490163))

(assert (=> b!509299 m!490137))

(declare-fun m!490165 () Bool)

(assert (=> b!509299 m!490165))

(declare-fun m!490167 () Bool)

(assert (=> b!509306 m!490167))

(declare-fun m!490169 () Bool)

(assert (=> start!46000 m!490169))

(declare-fun m!490171 () Bool)

(assert (=> start!46000 m!490171))

(push 1)

