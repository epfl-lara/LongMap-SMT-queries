; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44724 () Bool)

(assert start!44724)

(declare-fun b!490866 () Bool)

(declare-fun res!293810 () Bool)

(declare-fun e!288496 () Bool)

(assert (=> b!490866 (=> (not res!293810) (not e!288496))))

(declare-datatypes ((array!31783 0))(
  ( (array!31784 (arr!15279 (Array (_ BitVec 32) (_ BitVec 64))) (size!15643 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31783)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31783 (_ BitVec 32)) Bool)

(assert (=> b!490866 (= res!293810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490867 () Bool)

(declare-fun res!293807 () Bool)

(declare-fun e!288497 () Bool)

(assert (=> b!490867 (=> (not res!293807) (not e!288497))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490867 (= res!293807 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490868 () Bool)

(declare-fun res!293806 () Bool)

(assert (=> b!490868 (=> (not res!293806) (not e!288497))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490868 (= res!293806 (validKeyInArray!0 (select (arr!15279 a!3235) j!176)))))

(declare-fun b!490869 () Bool)

(declare-fun res!293808 () Bool)

(assert (=> b!490869 (=> (not res!293808) (not e!288496))))

(declare-datatypes ((List!9437 0))(
  ( (Nil!9434) (Cons!9433 (h!10295 (_ BitVec 64)) (t!15665 List!9437)) )
))
(declare-fun arrayNoDuplicates!0 (array!31783 (_ BitVec 32) List!9437) Bool)

(assert (=> b!490869 (= res!293808 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9434))))

(declare-fun res!293802 () Bool)

(assert (=> start!44724 (=> (not res!293802) (not e!288497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44724 (= res!293802 (validMask!0 mask!3524))))

(assert (=> start!44724 e!288497))

(assert (=> start!44724 true))

(declare-fun array_inv!11075 (array!31783) Bool)

(assert (=> start!44724 (array_inv!11075 a!3235)))

(declare-fun b!490870 () Bool)

(assert (=> b!490870 (= e!288497 e!288496)))

(declare-fun res!293803 () Bool)

(assert (=> b!490870 (=> (not res!293803) (not e!288496))))

(declare-datatypes ((SeekEntryResult!3746 0))(
  ( (MissingZero!3746 (index!17163 (_ BitVec 32))) (Found!3746 (index!17164 (_ BitVec 32))) (Intermediate!3746 (undefined!4558 Bool) (index!17165 (_ BitVec 32)) (x!46260 (_ BitVec 32))) (Undefined!3746) (MissingVacant!3746 (index!17166 (_ BitVec 32))) )
))
(declare-fun lt!221778 () SeekEntryResult!3746)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490870 (= res!293803 (or (= lt!221778 (MissingZero!3746 i!1204)) (= lt!221778 (MissingVacant!3746 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31783 (_ BitVec 32)) SeekEntryResult!3746)

(assert (=> b!490870 (= lt!221778 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490871 () Bool)

(declare-fun e!288498 () Bool)

(assert (=> b!490871 (= e!288498 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!221777 () SeekEntryResult!3746)

(declare-fun lt!221782 () (_ BitVec 64))

(declare-fun lt!221779 () array!31783)

(assert (=> b!490871 (= lt!221777 (seekEntryOrOpen!0 lt!221782 lt!221779 mask!3524))))

(declare-datatypes ((Unit!14438 0))(
  ( (Unit!14439) )
))
(declare-fun lt!221781 () Unit!14438)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31783 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14438)

(assert (=> b!490871 (= lt!221781 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490872 () Bool)

(declare-fun res!293805 () Bool)

(assert (=> b!490872 (=> (not res!293805) (not e!288497))))

(assert (=> b!490872 (= res!293805 (validKeyInArray!0 k!2280))))

(declare-fun b!490873 () Bool)

(declare-fun res!293804 () Bool)

(assert (=> b!490873 (=> (not res!293804) (not e!288497))))

(assert (=> b!490873 (= res!293804 (and (= (size!15643 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15643 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15643 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490874 () Bool)

(assert (=> b!490874 (= e!288496 (not e!288498))))

(declare-fun res!293809 () Bool)

(assert (=> b!490874 (=> res!293809 e!288498)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31783 (_ BitVec 32)) SeekEntryResult!3746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490874 (= res!293809 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15279 a!3235) j!176) mask!3524) (select (arr!15279 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221782 mask!3524) lt!221782 lt!221779 mask!3524))))))

(assert (=> b!490874 (= lt!221782 (select (store (arr!15279 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490874 (= lt!221779 (array!31784 (store (arr!15279 a!3235) i!1204 k!2280) (size!15643 a!3235)))))

(assert (=> b!490874 (= lt!221777 (Found!3746 j!176))))

(assert (=> b!490874 (= lt!221777 (seekEntryOrOpen!0 (select (arr!15279 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490874 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221780 () Unit!14438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14438)

(assert (=> b!490874 (= lt!221780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44724 res!293802) b!490873))

(assert (= (and b!490873 res!293804) b!490868))

(assert (= (and b!490868 res!293806) b!490872))

(assert (= (and b!490872 res!293805) b!490867))

(assert (= (and b!490867 res!293807) b!490870))

(assert (= (and b!490870 res!293803) b!490866))

(assert (= (and b!490866 res!293810) b!490869))

(assert (= (and b!490869 res!293808) b!490874))

(assert (= (and b!490874 (not res!293809)) b!490871))

(declare-fun m!471177 () Bool)

(assert (=> b!490867 m!471177))

(declare-fun m!471179 () Bool)

(assert (=> b!490874 m!471179))

(declare-fun m!471181 () Bool)

(assert (=> b!490874 m!471181))

(declare-fun m!471183 () Bool)

(assert (=> b!490874 m!471183))

(declare-fun m!471185 () Bool)

(assert (=> b!490874 m!471185))

(declare-fun m!471187 () Bool)

(assert (=> b!490874 m!471187))

(declare-fun m!471189 () Bool)

(assert (=> b!490874 m!471189))

(declare-fun m!471191 () Bool)

(assert (=> b!490874 m!471191))

(assert (=> b!490874 m!471187))

(assert (=> b!490874 m!471185))

(assert (=> b!490874 m!471187))

(declare-fun m!471193 () Bool)

(assert (=> b!490874 m!471193))

(assert (=> b!490874 m!471191))

(declare-fun m!471195 () Bool)

(assert (=> b!490874 m!471195))

(assert (=> b!490874 m!471187))

(declare-fun m!471197 () Bool)

(assert (=> b!490874 m!471197))

(declare-fun m!471199 () Bool)

(assert (=> b!490866 m!471199))

(declare-fun m!471201 () Bool)

(assert (=> b!490869 m!471201))

(declare-fun m!471203 () Bool)

(assert (=> start!44724 m!471203))

(declare-fun m!471205 () Bool)

(assert (=> start!44724 m!471205))

(assert (=> b!490868 m!471187))

(assert (=> b!490868 m!471187))

(declare-fun m!471207 () Bool)

(assert (=> b!490868 m!471207))

(declare-fun m!471209 () Bool)

(assert (=> b!490871 m!471209))

(declare-fun m!471211 () Bool)

(assert (=> b!490871 m!471211))

(declare-fun m!471213 () Bool)

(assert (=> b!490870 m!471213))

(declare-fun m!471215 () Bool)

(assert (=> b!490872 m!471215))

(push 1)

