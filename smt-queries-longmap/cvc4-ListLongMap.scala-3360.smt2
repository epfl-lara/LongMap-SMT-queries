; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46216 () Bool)

(assert start!46216)

(declare-fun b!511730 () Bool)

(declare-fun res!312392 () Bool)

(declare-fun e!298982 () Bool)

(assert (=> b!511730 (=> (not res!312392) (not e!298982))))

(declare-datatypes ((array!32870 0))(
  ( (array!32871 (arr!15812 (Array (_ BitVec 32) (_ BitVec 64))) (size!16176 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32870)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32870 (_ BitVec 32)) Bool)

(assert (=> b!511730 (= res!312392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511731 () Bool)

(declare-fun res!312396 () Bool)

(declare-fun e!298981 () Bool)

(assert (=> b!511731 (=> (not res!312396) (not e!298981))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511731 (= res!312396 (and (= (size!16176 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16176 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16176 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511732 () Bool)

(declare-fun res!312400 () Bool)

(assert (=> b!511732 (=> (not res!312400) (not e!298982))))

(declare-datatypes ((List!9970 0))(
  ( (Nil!9967) (Cons!9966 (h!10846 (_ BitVec 64)) (t!16198 List!9970)) )
))
(declare-fun arrayNoDuplicates!0 (array!32870 (_ BitVec 32) List!9970) Bool)

(assert (=> b!511732 (= res!312400 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9967))))

(declare-fun b!511733 () Bool)

(declare-fun e!298983 () Bool)

(assert (=> b!511733 (= e!298982 (not e!298983))))

(declare-fun res!312398 () Bool)

(assert (=> b!511733 (=> res!312398 e!298983)))

(declare-datatypes ((SeekEntryResult!4279 0))(
  ( (MissingZero!4279 (index!19304 (_ BitVec 32))) (Found!4279 (index!19305 (_ BitVec 32))) (Intermediate!4279 (undefined!5091 Bool) (index!19306 (_ BitVec 32)) (x!48254 (_ BitVec 32))) (Undefined!4279) (MissingVacant!4279 (index!19307 (_ BitVec 32))) )
))
(declare-fun lt!234158 () SeekEntryResult!4279)

(declare-fun lt!234157 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32870 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!511733 (= res!312398 (= lt!234158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234157 (select (store (arr!15812 a!3235) i!1204 k!2280) j!176) (array!32871 (store (arr!15812 a!3235) i!1204 k!2280) (size!16176 a!3235)) mask!3524)))))

(declare-fun lt!234156 () (_ BitVec 32))

(assert (=> b!511733 (= lt!234158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234156 (select (arr!15812 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511733 (= lt!234157 (toIndex!0 (select (store (arr!15812 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511733 (= lt!234156 (toIndex!0 (select (arr!15812 a!3235) j!176) mask!3524))))

(declare-fun lt!234160 () SeekEntryResult!4279)

(assert (=> b!511733 (= lt!234160 (Found!4279 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32870 (_ BitVec 32)) SeekEntryResult!4279)

(assert (=> b!511733 (= lt!234160 (seekEntryOrOpen!0 (select (arr!15812 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511733 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15816 0))(
  ( (Unit!15817) )
))
(declare-fun lt!234155 () Unit!15816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15816)

(assert (=> b!511733 (= lt!234155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!312401 () Bool)

(assert (=> start!46216 (=> (not res!312401) (not e!298981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46216 (= res!312401 (validMask!0 mask!3524))))

(assert (=> start!46216 e!298981))

(assert (=> start!46216 true))

(declare-fun array_inv!11608 (array!32870) Bool)

(assert (=> start!46216 (array_inv!11608 a!3235)))

(declare-fun b!511734 () Bool)

(declare-fun res!312393 () Bool)

(assert (=> b!511734 (=> (not res!312393) (not e!298981))))

(declare-fun arrayContainsKey!0 (array!32870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511734 (= res!312393 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511735 () Bool)

(declare-fun res!312394 () Bool)

(assert (=> b!511735 (=> (not res!312394) (not e!298981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511735 (= res!312394 (validKeyInArray!0 (select (arr!15812 a!3235) j!176)))))

(declare-fun b!511736 () Bool)

(assert (=> b!511736 (= e!298983 (or (bvsgt #b00000000000000000000000000000000 (size!16176 a!3235)) (bvsle j!176 (size!16176 a!3235))))))

(assert (=> b!511736 (= lt!234160 Undefined!4279)))

(declare-fun b!511737 () Bool)

(declare-fun res!312395 () Bool)

(assert (=> b!511737 (=> res!312395 e!298983)))

(assert (=> b!511737 (= res!312395 (or (not (is-Intermediate!4279 lt!234158)) (not (undefined!5091 lt!234158))))))

(declare-fun b!511738 () Bool)

(assert (=> b!511738 (= e!298981 e!298982)))

(declare-fun res!312399 () Bool)

(assert (=> b!511738 (=> (not res!312399) (not e!298982))))

(declare-fun lt!234159 () SeekEntryResult!4279)

(assert (=> b!511738 (= res!312399 (or (= lt!234159 (MissingZero!4279 i!1204)) (= lt!234159 (MissingVacant!4279 i!1204))))))

(assert (=> b!511738 (= lt!234159 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511739 () Bool)

(declare-fun res!312397 () Bool)

(assert (=> b!511739 (=> (not res!312397) (not e!298981))))

(assert (=> b!511739 (= res!312397 (validKeyInArray!0 k!2280))))

(assert (= (and start!46216 res!312401) b!511731))

(assert (= (and b!511731 res!312396) b!511735))

(assert (= (and b!511735 res!312394) b!511739))

(assert (= (and b!511739 res!312397) b!511734))

(assert (= (and b!511734 res!312393) b!511738))

(assert (= (and b!511738 res!312399) b!511730))

(assert (= (and b!511730 res!312392) b!511732))

(assert (= (and b!511732 res!312400) b!511733))

(assert (= (and b!511733 (not res!312398)) b!511737))

(assert (= (and b!511737 (not res!312395)) b!511736))

(declare-fun m!493245 () Bool)

(assert (=> b!511730 m!493245))

(declare-fun m!493247 () Bool)

(assert (=> b!511735 m!493247))

(assert (=> b!511735 m!493247))

(declare-fun m!493249 () Bool)

(assert (=> b!511735 m!493249))

(declare-fun m!493251 () Bool)

(assert (=> b!511734 m!493251))

(declare-fun m!493253 () Bool)

(assert (=> b!511738 m!493253))

(declare-fun m!493255 () Bool)

(assert (=> start!46216 m!493255))

(declare-fun m!493257 () Bool)

(assert (=> start!46216 m!493257))

(declare-fun m!493259 () Bool)

(assert (=> b!511733 m!493259))

(assert (=> b!511733 m!493247))

(declare-fun m!493261 () Bool)

(assert (=> b!511733 m!493261))

(declare-fun m!493263 () Bool)

(assert (=> b!511733 m!493263))

(declare-fun m!493265 () Bool)

(assert (=> b!511733 m!493265))

(assert (=> b!511733 m!493265))

(declare-fun m!493267 () Bool)

(assert (=> b!511733 m!493267))

(assert (=> b!511733 m!493247))

(declare-fun m!493269 () Bool)

(assert (=> b!511733 m!493269))

(assert (=> b!511733 m!493247))

(declare-fun m!493271 () Bool)

(assert (=> b!511733 m!493271))

(assert (=> b!511733 m!493247))

(declare-fun m!493273 () Bool)

(assert (=> b!511733 m!493273))

(assert (=> b!511733 m!493265))

(declare-fun m!493275 () Bool)

(assert (=> b!511733 m!493275))

(declare-fun m!493277 () Bool)

(assert (=> b!511732 m!493277))

(declare-fun m!493279 () Bool)

(assert (=> b!511739 m!493279))

(push 1)

