; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44382 () Bool)

(assert start!44382)

(declare-fun b!487797 () Bool)

(declare-fun res!291070 () Bool)

(declare-fun e!286994 () Bool)

(assert (=> b!487797 (=> (not res!291070) (not e!286994))))

(declare-datatypes ((array!31588 0))(
  ( (array!31589 (arr!15186 (Array (_ BitVec 32) (_ BitVec 64))) (size!15550 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31588)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487797 (= res!291070 (validKeyInArray!0 (select (arr!15186 a!3235) j!176)))))

(declare-fun b!487798 () Bool)

(declare-fun res!291072 () Bool)

(assert (=> b!487798 (=> (not res!291072) (not e!286994))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487798 (= res!291072 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487799 () Bool)

(declare-fun res!291076 () Bool)

(assert (=> b!487799 (=> (not res!291076) (not e!286994))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487799 (= res!291076 (and (= (size!15550 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15550 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15550 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487800 () Bool)

(declare-fun res!291073 () Bool)

(declare-fun e!286993 () Bool)

(assert (=> b!487800 (=> (not res!291073) (not e!286993))))

(declare-datatypes ((List!9344 0))(
  ( (Nil!9341) (Cons!9340 (h!10196 (_ BitVec 64)) (t!15572 List!9344)) )
))
(declare-fun arrayNoDuplicates!0 (array!31588 (_ BitVec 32) List!9344) Bool)

(assert (=> b!487800 (= res!291073 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9341))))

(declare-fun b!487801 () Bool)

(declare-fun res!291071 () Bool)

(assert (=> b!487801 (=> (not res!291071) (not e!286993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31588 (_ BitVec 32)) Bool)

(assert (=> b!487801 (= res!291071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291069 () Bool)

(assert (=> start!44382 (=> (not res!291069) (not e!286994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44382 (= res!291069 (validMask!0 mask!3524))))

(assert (=> start!44382 e!286994))

(assert (=> start!44382 true))

(declare-fun array_inv!10982 (array!31588) Bool)

(assert (=> start!44382 (array_inv!10982 a!3235)))

(declare-fun b!487802 () Bool)

(assert (=> b!487802 (= e!286993 (not true))))

(declare-fun lt!220161 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487802 (= lt!220161 (toIndex!0 (select (arr!15186 a!3235) j!176) mask!3524))))

(declare-fun e!286992 () Bool)

(assert (=> b!487802 e!286992))

(declare-fun res!291077 () Bool)

(assert (=> b!487802 (=> (not res!291077) (not e!286992))))

(assert (=> b!487802 (= res!291077 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14252 0))(
  ( (Unit!14253) )
))
(declare-fun lt!220160 () Unit!14252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14252)

(assert (=> b!487802 (= lt!220160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487803 () Bool)

(assert (=> b!487803 (= e!286994 e!286993)))

(declare-fun res!291075 () Bool)

(assert (=> b!487803 (=> (not res!291075) (not e!286993))))

(declare-datatypes ((SeekEntryResult!3653 0))(
  ( (MissingZero!3653 (index!16791 (_ BitVec 32))) (Found!3653 (index!16792 (_ BitVec 32))) (Intermediate!3653 (undefined!4465 Bool) (index!16793 (_ BitVec 32)) (x!45913 (_ BitVec 32))) (Undefined!3653) (MissingVacant!3653 (index!16794 (_ BitVec 32))) )
))
(declare-fun lt!220162 () SeekEntryResult!3653)

(assert (=> b!487803 (= res!291075 (or (= lt!220162 (MissingZero!3653 i!1204)) (= lt!220162 (MissingVacant!3653 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31588 (_ BitVec 32)) SeekEntryResult!3653)

(assert (=> b!487803 (= lt!220162 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487804 () Bool)

(assert (=> b!487804 (= e!286992 (= (seekEntryOrOpen!0 (select (arr!15186 a!3235) j!176) a!3235 mask!3524) (Found!3653 j!176)))))

(declare-fun b!487805 () Bool)

(declare-fun res!291074 () Bool)

(assert (=> b!487805 (=> (not res!291074) (not e!286994))))

(assert (=> b!487805 (= res!291074 (validKeyInArray!0 k!2280))))

(assert (= (and start!44382 res!291069) b!487799))

(assert (= (and b!487799 res!291076) b!487797))

(assert (= (and b!487797 res!291070) b!487805))

(assert (= (and b!487805 res!291074) b!487798))

(assert (= (and b!487798 res!291072) b!487803))

(assert (= (and b!487803 res!291075) b!487801))

(assert (= (and b!487801 res!291071) b!487800))

(assert (= (and b!487800 res!291073) b!487802))

(assert (= (and b!487802 res!291077) b!487804))

(declare-fun m!467583 () Bool)

(assert (=> b!487804 m!467583))

(assert (=> b!487804 m!467583))

(declare-fun m!467585 () Bool)

(assert (=> b!487804 m!467585))

(declare-fun m!467587 () Bool)

(assert (=> b!487798 m!467587))

(assert (=> b!487797 m!467583))

(assert (=> b!487797 m!467583))

(declare-fun m!467589 () Bool)

(assert (=> b!487797 m!467589))

(declare-fun m!467591 () Bool)

(assert (=> b!487805 m!467591))

(declare-fun m!467593 () Bool)

(assert (=> start!44382 m!467593))

(declare-fun m!467595 () Bool)

(assert (=> start!44382 m!467595))

(declare-fun m!467597 () Bool)

(assert (=> b!487800 m!467597))

(assert (=> b!487802 m!467583))

(assert (=> b!487802 m!467583))

(declare-fun m!467599 () Bool)

(assert (=> b!487802 m!467599))

(declare-fun m!467601 () Bool)

(assert (=> b!487802 m!467601))

(declare-fun m!467603 () Bool)

(assert (=> b!487802 m!467603))

(declare-fun m!467605 () Bool)

(assert (=> b!487801 m!467605))

(declare-fun m!467607 () Bool)

(assert (=> b!487803 m!467607))

(push 1)

(assert (not b!487800))

(assert (not b!487803))

(assert (not b!487801))

(assert (not start!44382))

(assert (not b!487804))

(assert (not b!487802))

(assert (not b!487805))

(assert (not b!487798))

(assert (not b!487797))

(check-sat)

(pop 1)

