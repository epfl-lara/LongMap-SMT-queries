; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45954 () Bool)

(assert start!45954)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!297583 () Bool)

(declare-datatypes ((array!32665 0))(
  ( (array!32666 (arr!15711 (Array (_ BitVec 32) (_ BitVec 64))) (size!16075 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32665)

(declare-fun b!508677 () Bool)

(declare-datatypes ((SeekEntryResult!4178 0))(
  ( (MissingZero!4178 (index!18900 (_ BitVec 32))) (Found!4178 (index!18901 (_ BitVec 32))) (Intermediate!4178 (undefined!4990 Bool) (index!18902 (_ BitVec 32)) (x!47883 (_ BitVec 32))) (Undefined!4178) (MissingVacant!4178 (index!18903 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32665 (_ BitVec 32)) SeekEntryResult!4178)

(assert (=> b!508677 (= e!297583 (= (seekEntryOrOpen!0 (select (arr!15711 a!3235) j!176) a!3235 mask!3524) (Found!4178 j!176)))))

(declare-fun b!508678 () Bool)

(declare-fun res!309529 () Bool)

(declare-fun e!297585 () Bool)

(assert (=> b!508678 (=> (not res!309529) (not e!297585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32665 (_ BitVec 32)) Bool)

(assert (=> b!508678 (= res!309529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508679 () Bool)

(declare-fun res!309528 () Bool)

(declare-fun e!297582 () Bool)

(assert (=> b!508679 (=> (not res!309528) (not e!297582))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508679 (= res!309528 (validKeyInArray!0 k!2280))))

(declare-fun b!508680 () Bool)

(declare-fun res!309530 () Bool)

(assert (=> b!508680 (=> (not res!309530) (not e!297582))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508680 (= res!309530 (and (= (size!16075 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16075 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16075 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508681 () Bool)

(declare-fun res!309525 () Bool)

(assert (=> b!508681 (=> (not res!309525) (not e!297582))))

(assert (=> b!508681 (= res!309525 (validKeyInArray!0 (select (arr!15711 a!3235) j!176)))))

(declare-fun b!508682 () Bool)

(assert (=> b!508682 (= e!297585 (not true))))

(assert (=> b!508682 e!297583))

(declare-fun res!309523 () Bool)

(assert (=> b!508682 (=> (not res!309523) (not e!297583))))

(assert (=> b!508682 (= res!309523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15614 0))(
  ( (Unit!15615) )
))
(declare-fun lt!232327 () Unit!15614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15614)

(assert (=> b!508682 (= lt!232327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!309527 () Bool)

(assert (=> start!45954 (=> (not res!309527) (not e!297582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45954 (= res!309527 (validMask!0 mask!3524))))

(assert (=> start!45954 e!297582))

(assert (=> start!45954 true))

(declare-fun array_inv!11507 (array!32665) Bool)

(assert (=> start!45954 (array_inv!11507 a!3235)))

(declare-fun b!508683 () Bool)

(declare-fun res!309524 () Bool)

(assert (=> b!508683 (=> (not res!309524) (not e!297585))))

(declare-datatypes ((List!9869 0))(
  ( (Nil!9866) (Cons!9865 (h!10742 (_ BitVec 64)) (t!16097 List!9869)) )
))
(declare-fun arrayNoDuplicates!0 (array!32665 (_ BitVec 32) List!9869) Bool)

(assert (=> b!508683 (= res!309524 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9866))))

(declare-fun b!508684 () Bool)

(declare-fun res!309526 () Bool)

(assert (=> b!508684 (=> (not res!309526) (not e!297582))))

(declare-fun arrayContainsKey!0 (array!32665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508684 (= res!309526 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508685 () Bool)

(assert (=> b!508685 (= e!297582 e!297585)))

(declare-fun res!309522 () Bool)

(assert (=> b!508685 (=> (not res!309522) (not e!297585))))

(declare-fun lt!232326 () SeekEntryResult!4178)

(assert (=> b!508685 (= res!309522 (or (= lt!232326 (MissingZero!4178 i!1204)) (= lt!232326 (MissingVacant!4178 i!1204))))))

(assert (=> b!508685 (= lt!232326 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45954 res!309527) b!508680))

(assert (= (and b!508680 res!309530) b!508681))

(assert (= (and b!508681 res!309525) b!508679))

(assert (= (and b!508679 res!309528) b!508684))

(assert (= (and b!508684 res!309526) b!508685))

(assert (= (and b!508685 res!309522) b!508678))

(assert (= (and b!508678 res!309529) b!508683))

(assert (= (and b!508683 res!309524) b!508682))

(assert (= (and b!508682 res!309523) b!508677))

(declare-fun m!489429 () Bool)

(assert (=> b!508678 m!489429))

(declare-fun m!489431 () Bool)

(assert (=> b!508677 m!489431))

(assert (=> b!508677 m!489431))

(declare-fun m!489433 () Bool)

(assert (=> b!508677 m!489433))

(declare-fun m!489435 () Bool)

(assert (=> b!508684 m!489435))

(assert (=> b!508681 m!489431))

(assert (=> b!508681 m!489431))

(declare-fun m!489437 () Bool)

(assert (=> b!508681 m!489437))

(declare-fun m!489439 () Bool)

(assert (=> start!45954 m!489439))

(declare-fun m!489441 () Bool)

(assert (=> start!45954 m!489441))

(declare-fun m!489443 () Bool)

(assert (=> b!508685 m!489443))

(declare-fun m!489445 () Bool)

(assert (=> b!508683 m!489445))

(declare-fun m!489447 () Bool)

(assert (=> b!508682 m!489447))

(declare-fun m!489449 () Bool)

(assert (=> b!508682 m!489449))

(declare-fun m!489451 () Bool)

(assert (=> b!508679 m!489451))

(push 1)

