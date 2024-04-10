; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45066 () Bool)

(assert start!45066)

(declare-fun b!494636 () Bool)

(declare-fun e!290264 () Bool)

(declare-fun e!290263 () Bool)

(assert (=> b!494636 (= e!290264 (not e!290263))))

(declare-fun res!297212 () Bool)

(assert (=> b!494636 (=> res!297212 e!290263)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32011 0))(
  ( (array!32012 (arr!15390 (Array (_ BitVec 32) (_ BitVec 64))) (size!15754 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32011)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3857 0))(
  ( (MissingZero!3857 (index!17607 (_ BitVec 32))) (Found!3857 (index!17608 (_ BitVec 32))) (Intermediate!3857 (undefined!4669 Bool) (index!17609 (_ BitVec 32)) (x!46679 (_ BitVec 32))) (Undefined!3857) (MissingVacant!3857 (index!17610 (_ BitVec 32))) )
))
(declare-fun lt!223892 () SeekEntryResult!3857)

(declare-fun lt!223893 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32011 (_ BitVec 32)) SeekEntryResult!3857)

(assert (=> b!494636 (= res!297212 (= lt!223892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223893 (select (store (arr!15390 a!3235) i!1204 k!2280) j!176) (array!32012 (store (arr!15390 a!3235) i!1204 k!2280) (size!15754 a!3235)) mask!3524)))))

(declare-fun lt!223889 () (_ BitVec 32))

(assert (=> b!494636 (= lt!223892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223889 (select (arr!15390 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494636 (= lt!223893 (toIndex!0 (select (store (arr!15390 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494636 (= lt!223889 (toIndex!0 (select (arr!15390 a!3235) j!176) mask!3524))))

(declare-fun lt!223891 () SeekEntryResult!3857)

(assert (=> b!494636 (= lt!223891 (Found!3857 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32011 (_ BitVec 32)) SeekEntryResult!3857)

(assert (=> b!494636 (= lt!223891 (seekEntryOrOpen!0 (select (arr!15390 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32011 (_ BitVec 32)) Bool)

(assert (=> b!494636 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14660 0))(
  ( (Unit!14661) )
))
(declare-fun lt!223894 () Unit!14660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14660)

(assert (=> b!494636 (= lt!223894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494638 () Bool)

(assert (=> b!494638 (= e!290263 true)))

(assert (=> b!494638 (= lt!223891 Undefined!3857)))

(declare-fun b!494639 () Bool)

(declare-fun res!297207 () Bool)

(declare-fun e!290262 () Bool)

(assert (=> b!494639 (=> (not res!297207) (not e!290262))))

(declare-fun arrayContainsKey!0 (array!32011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494639 (= res!297207 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494640 () Bool)

(declare-fun res!297208 () Bool)

(assert (=> b!494640 (=> res!297208 e!290263)))

(assert (=> b!494640 (= res!297208 (or (not (is-Intermediate!3857 lt!223892)) (not (undefined!4669 lt!223892))))))

(declare-fun b!494641 () Bool)

(declare-fun res!297214 () Bool)

(assert (=> b!494641 (=> (not res!297214) (not e!290262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494641 (= res!297214 (validKeyInArray!0 k!2280))))

(declare-fun b!494642 () Bool)

(declare-fun res!297210 () Bool)

(assert (=> b!494642 (=> (not res!297210) (not e!290264))))

(declare-datatypes ((List!9548 0))(
  ( (Nil!9545) (Cons!9544 (h!10412 (_ BitVec 64)) (t!15776 List!9548)) )
))
(declare-fun arrayNoDuplicates!0 (array!32011 (_ BitVec 32) List!9548) Bool)

(assert (=> b!494642 (= res!297210 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9545))))

(declare-fun b!494643 () Bool)

(assert (=> b!494643 (= e!290262 e!290264)))

(declare-fun res!297209 () Bool)

(assert (=> b!494643 (=> (not res!297209) (not e!290264))))

(declare-fun lt!223890 () SeekEntryResult!3857)

(assert (=> b!494643 (= res!297209 (or (= lt!223890 (MissingZero!3857 i!1204)) (= lt!223890 (MissingVacant!3857 i!1204))))))

(assert (=> b!494643 (= lt!223890 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!297206 () Bool)

(assert (=> start!45066 (=> (not res!297206) (not e!290262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45066 (= res!297206 (validMask!0 mask!3524))))

(assert (=> start!45066 e!290262))

(assert (=> start!45066 true))

(declare-fun array_inv!11186 (array!32011) Bool)

(assert (=> start!45066 (array_inv!11186 a!3235)))

(declare-fun b!494637 () Bool)

(declare-fun res!297213 () Bool)

(assert (=> b!494637 (=> (not res!297213) (not e!290262))))

(assert (=> b!494637 (= res!297213 (and (= (size!15754 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15754 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15754 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494644 () Bool)

(declare-fun res!297211 () Bool)

(assert (=> b!494644 (=> (not res!297211) (not e!290262))))

(assert (=> b!494644 (= res!297211 (validKeyInArray!0 (select (arr!15390 a!3235) j!176)))))

(declare-fun b!494645 () Bool)

(declare-fun res!297215 () Bool)

(assert (=> b!494645 (=> (not res!297215) (not e!290264))))

(assert (=> b!494645 (= res!297215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45066 res!297206) b!494637))

(assert (= (and b!494637 res!297213) b!494644))

(assert (= (and b!494644 res!297211) b!494641))

(assert (= (and b!494641 res!297214) b!494639))

(assert (= (and b!494639 res!297207) b!494643))

(assert (= (and b!494643 res!297209) b!494645))

(assert (= (and b!494645 res!297215) b!494642))

(assert (= (and b!494642 res!297210) b!494636))

(assert (= (and b!494636 (not res!297212)) b!494640))

(assert (= (and b!494640 (not res!297208)) b!494638))

(declare-fun m!475719 () Bool)

(assert (=> b!494639 m!475719))

(declare-fun m!475721 () Bool)

(assert (=> start!45066 m!475721))

(declare-fun m!475723 () Bool)

(assert (=> start!45066 m!475723))

(declare-fun m!475725 () Bool)

(assert (=> b!494645 m!475725))

(declare-fun m!475727 () Bool)

(assert (=> b!494642 m!475727))

(declare-fun m!475729 () Bool)

(assert (=> b!494636 m!475729))

(declare-fun m!475731 () Bool)

(assert (=> b!494636 m!475731))

(declare-fun m!475733 () Bool)

(assert (=> b!494636 m!475733))

(declare-fun m!475735 () Bool)

(assert (=> b!494636 m!475735))

(assert (=> b!494636 m!475729))

(declare-fun m!475737 () Bool)

(assert (=> b!494636 m!475737))

(assert (=> b!494636 m!475729))

(declare-fun m!475739 () Bool)

(assert (=> b!494636 m!475739))

(assert (=> b!494636 m!475729))

(declare-fun m!475741 () Bool)

(assert (=> b!494636 m!475741))

(assert (=> b!494636 m!475735))

(declare-fun m!475743 () Bool)

(assert (=> b!494636 m!475743))

(assert (=> b!494636 m!475735))

(declare-fun m!475745 () Bool)

(assert (=> b!494636 m!475745))

(declare-fun m!475747 () Bool)

(assert (=> b!494636 m!475747))

(declare-fun m!475749 () Bool)

(assert (=> b!494641 m!475749))

(declare-fun m!475751 () Bool)

(assert (=> b!494643 m!475751))

(assert (=> b!494644 m!475729))

(assert (=> b!494644 m!475729))

(declare-fun m!475753 () Bool)

(assert (=> b!494644 m!475753))

(push 1)

