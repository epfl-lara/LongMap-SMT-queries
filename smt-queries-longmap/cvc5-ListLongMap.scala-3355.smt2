; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46122 () Bool)

(assert start!46122)

(declare-fun b!510945 () Bool)

(declare-fun e!298590 () Bool)

(declare-fun e!298593 () Bool)

(assert (=> b!510945 (= e!298590 e!298593)))

(declare-fun res!311795 () Bool)

(assert (=> b!510945 (=> (not res!311795) (not e!298593))))

(declare-datatypes ((SeekEntryResult!4262 0))(
  ( (MissingZero!4262 (index!19236 (_ BitVec 32))) (Found!4262 (index!19237 (_ BitVec 32))) (Intermediate!4262 (undefined!5074 Bool) (index!19238 (_ BitVec 32)) (x!48191 (_ BitVec 32))) (Undefined!4262) (MissingVacant!4262 (index!19239 (_ BitVec 32))) )
))
(declare-fun lt!233720 () SeekEntryResult!4262)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510945 (= res!311795 (or (= lt!233720 (MissingZero!4262 i!1204)) (= lt!233720 (MissingVacant!4262 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32833 0))(
  ( (array!32834 (arr!15795 (Array (_ BitVec 32) (_ BitVec 64))) (size!16159 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32833)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32833 (_ BitVec 32)) SeekEntryResult!4262)

(assert (=> b!510945 (= lt!233720 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510946 () Bool)

(declare-fun res!311791 () Bool)

(assert (=> b!510946 (=> (not res!311791) (not e!298590))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510946 (= res!311791 (validKeyInArray!0 (select (arr!15795 a!3235) j!176)))))

(declare-fun b!510947 () Bool)

(assert (=> b!510947 (= e!298593 (not true))))

(declare-fun lt!233724 () SeekEntryResult!4262)

(declare-fun lt!233723 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32833 (_ BitVec 32)) SeekEntryResult!4262)

(assert (=> b!510947 (= lt!233724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233723 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (array!32834 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)) mask!3524))))

(declare-fun lt!233722 () (_ BitVec 32))

(declare-fun lt!233725 () SeekEntryResult!4262)

(assert (=> b!510947 (= lt!233725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233722 (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510947 (= lt!233723 (toIndex!0 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510947 (= lt!233722 (toIndex!0 (select (arr!15795 a!3235) j!176) mask!3524))))

(declare-fun e!298591 () Bool)

(assert (=> b!510947 e!298591))

(declare-fun res!311798 () Bool)

(assert (=> b!510947 (=> (not res!311798) (not e!298591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32833 (_ BitVec 32)) Bool)

(assert (=> b!510947 (= res!311798 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15782 0))(
  ( (Unit!15783) )
))
(declare-fun lt!233721 () Unit!15782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15782)

(assert (=> b!510947 (= lt!233721 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510948 () Bool)

(declare-fun res!311794 () Bool)

(assert (=> b!510948 (=> (not res!311794) (not e!298590))))

(assert (=> b!510948 (= res!311794 (and (= (size!16159 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16159 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16159 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510949 () Bool)

(declare-fun res!311793 () Bool)

(assert (=> b!510949 (=> (not res!311793) (not e!298593))))

(assert (=> b!510949 (= res!311793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510950 () Bool)

(assert (=> b!510950 (= e!298591 (= (seekEntryOrOpen!0 (select (arr!15795 a!3235) j!176) a!3235 mask!3524) (Found!4262 j!176)))))

(declare-fun b!510952 () Bool)

(declare-fun res!311792 () Bool)

(assert (=> b!510952 (=> (not res!311792) (not e!298590))))

(declare-fun arrayContainsKey!0 (array!32833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510952 (= res!311792 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510953 () Bool)

(declare-fun res!311796 () Bool)

(assert (=> b!510953 (=> (not res!311796) (not e!298593))))

(declare-datatypes ((List!9953 0))(
  ( (Nil!9950) (Cons!9949 (h!10826 (_ BitVec 64)) (t!16181 List!9953)) )
))
(declare-fun arrayNoDuplicates!0 (array!32833 (_ BitVec 32) List!9953) Bool)

(assert (=> b!510953 (= res!311796 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9950))))

(declare-fun b!510951 () Bool)

(declare-fun res!311790 () Bool)

(assert (=> b!510951 (=> (not res!311790) (not e!298590))))

(assert (=> b!510951 (= res!311790 (validKeyInArray!0 k!2280))))

(declare-fun res!311797 () Bool)

(assert (=> start!46122 (=> (not res!311797) (not e!298590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46122 (= res!311797 (validMask!0 mask!3524))))

(assert (=> start!46122 e!298590))

(assert (=> start!46122 true))

(declare-fun array_inv!11591 (array!32833) Bool)

(assert (=> start!46122 (array_inv!11591 a!3235)))

(assert (= (and start!46122 res!311797) b!510948))

(assert (= (and b!510948 res!311794) b!510946))

(assert (= (and b!510946 res!311791) b!510951))

(assert (= (and b!510951 res!311790) b!510952))

(assert (= (and b!510952 res!311792) b!510945))

(assert (= (and b!510945 res!311795) b!510949))

(assert (= (and b!510949 res!311793) b!510953))

(assert (= (and b!510953 res!311796) b!510947))

(assert (= (and b!510947 res!311798) b!510950))

(declare-fun m!492429 () Bool)

(assert (=> b!510949 m!492429))

(declare-fun m!492431 () Bool)

(assert (=> b!510950 m!492431))

(assert (=> b!510950 m!492431))

(declare-fun m!492433 () Bool)

(assert (=> b!510950 m!492433))

(declare-fun m!492435 () Bool)

(assert (=> b!510952 m!492435))

(declare-fun m!492437 () Bool)

(assert (=> start!46122 m!492437))

(declare-fun m!492439 () Bool)

(assert (=> start!46122 m!492439))

(declare-fun m!492441 () Bool)

(assert (=> b!510951 m!492441))

(assert (=> b!510946 m!492431))

(assert (=> b!510946 m!492431))

(declare-fun m!492443 () Bool)

(assert (=> b!510946 m!492443))

(declare-fun m!492445 () Bool)

(assert (=> b!510947 m!492445))

(declare-fun m!492447 () Bool)

(assert (=> b!510947 m!492447))

(declare-fun m!492449 () Bool)

(assert (=> b!510947 m!492449))

(declare-fun m!492451 () Bool)

(assert (=> b!510947 m!492451))

(assert (=> b!510947 m!492447))

(assert (=> b!510947 m!492431))

(declare-fun m!492453 () Bool)

(assert (=> b!510947 m!492453))

(assert (=> b!510947 m!492431))

(assert (=> b!510947 m!492431))

(declare-fun m!492455 () Bool)

(assert (=> b!510947 m!492455))

(declare-fun m!492457 () Bool)

(assert (=> b!510947 m!492457))

(assert (=> b!510947 m!492447))

(declare-fun m!492459 () Bool)

(assert (=> b!510947 m!492459))

(declare-fun m!492461 () Bool)

(assert (=> b!510953 m!492461))

(declare-fun m!492463 () Bool)

(assert (=> b!510945 m!492463))

(push 1)

