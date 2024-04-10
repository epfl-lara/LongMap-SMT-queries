; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46234 () Bool)

(assert start!46234)

(declare-fun b!512000 () Bool)

(declare-fun res!312669 () Bool)

(declare-fun e!299090 () Bool)

(assert (=> b!512000 (=> (not res!312669) (not e!299090))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512000 (= res!312669 (validKeyInArray!0 k!2280))))

(declare-fun b!512001 () Bool)

(declare-fun res!312671 () Bool)

(assert (=> b!512001 (=> (not res!312671) (not e!299090))))

(declare-datatypes ((array!32888 0))(
  ( (array!32889 (arr!15821 (Array (_ BitVec 32) (_ BitVec 64))) (size!16185 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32888)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512001 (= res!312671 (validKeyInArray!0 (select (arr!15821 a!3235) j!176)))))

(declare-fun b!512002 () Bool)

(declare-fun res!312666 () Bool)

(declare-fun e!299088 () Bool)

(assert (=> b!512002 (=> (not res!312666) (not e!299088))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32888 (_ BitVec 32)) Bool)

(assert (=> b!512002 (= res!312666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512003 () Bool)

(declare-fun res!312662 () Bool)

(declare-fun e!299089 () Bool)

(assert (=> b!512003 (=> res!312662 e!299089)))

(declare-datatypes ((SeekEntryResult!4288 0))(
  ( (MissingZero!4288 (index!19340 (_ BitVec 32))) (Found!4288 (index!19341 (_ BitVec 32))) (Intermediate!4288 (undefined!5100 Bool) (index!19342 (_ BitVec 32)) (x!48287 (_ BitVec 32))) (Undefined!4288) (MissingVacant!4288 (index!19343 (_ BitVec 32))) )
))
(declare-fun lt!234321 () SeekEntryResult!4288)

(assert (=> b!512003 (= res!312662 (or (not (is-Intermediate!4288 lt!234321)) (not (undefined!5100 lt!234321))))))

(declare-fun b!512004 () Bool)

(assert (=> b!512004 (= e!299090 e!299088)))

(declare-fun res!312665 () Bool)

(assert (=> b!512004 (=> (not res!312665) (not e!299088))))

(declare-fun lt!234318 () SeekEntryResult!4288)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512004 (= res!312665 (or (= lt!234318 (MissingZero!4288 i!1204)) (= lt!234318 (MissingVacant!4288 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32888 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!512004 (= lt!234318 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512005 () Bool)

(declare-fun res!312667 () Bool)

(assert (=> b!512005 (=> (not res!312667) (not e!299088))))

(declare-datatypes ((List!9979 0))(
  ( (Nil!9976) (Cons!9975 (h!10855 (_ BitVec 64)) (t!16207 List!9979)) )
))
(declare-fun arrayNoDuplicates!0 (array!32888 (_ BitVec 32) List!9979) Bool)

(assert (=> b!512005 (= res!312667 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9976))))

(declare-fun b!512006 () Bool)

(declare-fun res!312668 () Bool)

(assert (=> b!512006 (=> (not res!312668) (not e!299090))))

(assert (=> b!512006 (= res!312668 (and (= (size!16185 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16185 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16185 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!312663 () Bool)

(assert (=> start!46234 (=> (not res!312663) (not e!299090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46234 (= res!312663 (validMask!0 mask!3524))))

(assert (=> start!46234 e!299090))

(assert (=> start!46234 true))

(declare-fun array_inv!11617 (array!32888) Bool)

(assert (=> start!46234 (array_inv!11617 a!3235)))

(declare-fun b!512007 () Bool)

(declare-fun res!312670 () Bool)

(assert (=> b!512007 (=> (not res!312670) (not e!299090))))

(declare-fun arrayContainsKey!0 (array!32888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512007 (= res!312670 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512008 () Bool)

(assert (=> b!512008 (= e!299089 true)))

(declare-fun lt!234322 () SeekEntryResult!4288)

(assert (=> b!512008 (= lt!234322 Undefined!4288)))

(declare-fun b!512009 () Bool)

(assert (=> b!512009 (= e!299088 (not e!299089))))

(declare-fun res!312664 () Bool)

(assert (=> b!512009 (=> res!312664 e!299089)))

(declare-fun lt!234320 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32888 (_ BitVec 32)) SeekEntryResult!4288)

(assert (=> b!512009 (= res!312664 (= lt!234321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234320 (select (store (arr!15821 a!3235) i!1204 k!2280) j!176) (array!32889 (store (arr!15821 a!3235) i!1204 k!2280) (size!16185 a!3235)) mask!3524)))))

(declare-fun lt!234319 () (_ BitVec 32))

(assert (=> b!512009 (= lt!234321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234319 (select (arr!15821 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512009 (= lt!234320 (toIndex!0 (select (store (arr!15821 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512009 (= lt!234319 (toIndex!0 (select (arr!15821 a!3235) j!176) mask!3524))))

(assert (=> b!512009 (= lt!234322 (Found!4288 j!176))))

(assert (=> b!512009 (= lt!234322 (seekEntryOrOpen!0 (select (arr!15821 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512009 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15834 0))(
  ( (Unit!15835) )
))
(declare-fun lt!234317 () Unit!15834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15834)

(assert (=> b!512009 (= lt!234317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46234 res!312663) b!512006))

(assert (= (and b!512006 res!312668) b!512001))

(assert (= (and b!512001 res!312671) b!512000))

(assert (= (and b!512000 res!312669) b!512007))

(assert (= (and b!512007 res!312670) b!512004))

(assert (= (and b!512004 res!312665) b!512002))

(assert (= (and b!512002 res!312666) b!512005))

(assert (= (and b!512005 res!312667) b!512009))

(assert (= (and b!512009 (not res!312664)) b!512003))

(assert (= (and b!512003 (not res!312662)) b!512008))

(declare-fun m!493569 () Bool)

(assert (=> b!512002 m!493569))

(declare-fun m!493571 () Bool)

(assert (=> b!512000 m!493571))

(declare-fun m!493573 () Bool)

(assert (=> b!512004 m!493573))

(declare-fun m!493575 () Bool)

(assert (=> start!46234 m!493575))

(declare-fun m!493577 () Bool)

(assert (=> start!46234 m!493577))

(declare-fun m!493579 () Bool)

(assert (=> b!512009 m!493579))

(declare-fun m!493581 () Bool)

(assert (=> b!512009 m!493581))

(declare-fun m!493583 () Bool)

(assert (=> b!512009 m!493583))

(assert (=> b!512009 m!493579))

(declare-fun m!493585 () Bool)

(assert (=> b!512009 m!493585))

(declare-fun m!493587 () Bool)

(assert (=> b!512009 m!493587))

(assert (=> b!512009 m!493585))

(declare-fun m!493589 () Bool)

(assert (=> b!512009 m!493589))

(assert (=> b!512009 m!493585))

(declare-fun m!493591 () Bool)

(assert (=> b!512009 m!493591))

(assert (=> b!512009 m!493579))

(declare-fun m!493593 () Bool)

(assert (=> b!512009 m!493593))

(assert (=> b!512009 m!493585))

(declare-fun m!493595 () Bool)

(assert (=> b!512009 m!493595))

(declare-fun m!493597 () Bool)

(assert (=> b!512009 m!493597))

(declare-fun m!493599 () Bool)

(assert (=> b!512005 m!493599))

(assert (=> b!512001 m!493585))

(assert (=> b!512001 m!493585))

(declare-fun m!493601 () Bool)

(assert (=> b!512001 m!493601))

(declare-fun m!493603 () Bool)

(assert (=> b!512007 m!493603))

(push 1)

