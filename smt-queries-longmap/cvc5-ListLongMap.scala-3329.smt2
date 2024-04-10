; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45966 () Bool)

(assert start!45966)

(declare-fun b!508839 () Bool)

(declare-fun res!309691 () Bool)

(declare-fun e!297654 () Bool)

(assert (=> b!508839 (=> (not res!309691) (not e!297654))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508839 (= res!309691 (validKeyInArray!0 k!2280))))

(declare-fun b!508840 () Bool)

(declare-fun e!297656 () Bool)

(assert (=> b!508840 (= e!297656 (not true))))

(declare-fun e!297655 () Bool)

(assert (=> b!508840 e!297655))

(declare-fun res!309688 () Bool)

(assert (=> b!508840 (=> (not res!309688) (not e!297655))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32677 0))(
  ( (array!32678 (arr!15717 (Array (_ BitVec 32) (_ BitVec 64))) (size!16081 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32677)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32677 (_ BitVec 32)) Bool)

(assert (=> b!508840 (= res!309688 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15626 0))(
  ( (Unit!15627) )
))
(declare-fun lt!232371 () Unit!15626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15626)

(assert (=> b!508840 (= lt!232371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508841 () Bool)

(declare-fun res!309687 () Bool)

(assert (=> b!508841 (=> (not res!309687) (not e!297654))))

(assert (=> b!508841 (= res!309687 (validKeyInArray!0 (select (arr!15717 a!3235) j!176)))))

(declare-fun res!309689 () Bool)

(assert (=> start!45966 (=> (not res!309689) (not e!297654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45966 (= res!309689 (validMask!0 mask!3524))))

(assert (=> start!45966 e!297654))

(assert (=> start!45966 true))

(declare-fun array_inv!11513 (array!32677) Bool)

(assert (=> start!45966 (array_inv!11513 a!3235)))

(declare-fun b!508842 () Bool)

(declare-fun res!309686 () Bool)

(assert (=> b!508842 (=> (not res!309686) (not e!297656))))

(declare-datatypes ((List!9875 0))(
  ( (Nil!9872) (Cons!9871 (h!10748 (_ BitVec 64)) (t!16103 List!9875)) )
))
(declare-fun arrayNoDuplicates!0 (array!32677 (_ BitVec 32) List!9875) Bool)

(assert (=> b!508842 (= res!309686 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9872))))

(declare-fun b!508843 () Bool)

(declare-fun res!309692 () Bool)

(assert (=> b!508843 (=> (not res!309692) (not e!297654))))

(declare-fun arrayContainsKey!0 (array!32677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508843 (= res!309692 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508844 () Bool)

(declare-fun res!309690 () Bool)

(assert (=> b!508844 (=> (not res!309690) (not e!297654))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508844 (= res!309690 (and (= (size!16081 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16081 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16081 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508845 () Bool)

(declare-fun res!309684 () Bool)

(assert (=> b!508845 (=> (not res!309684) (not e!297656))))

(assert (=> b!508845 (= res!309684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508846 () Bool)

(declare-datatypes ((SeekEntryResult!4184 0))(
  ( (MissingZero!4184 (index!18924 (_ BitVec 32))) (Found!4184 (index!18925 (_ BitVec 32))) (Intermediate!4184 (undefined!4996 Bool) (index!18926 (_ BitVec 32)) (x!47905 (_ BitVec 32))) (Undefined!4184) (MissingVacant!4184 (index!18927 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32677 (_ BitVec 32)) SeekEntryResult!4184)

(assert (=> b!508846 (= e!297655 (= (seekEntryOrOpen!0 (select (arr!15717 a!3235) j!176) a!3235 mask!3524) (Found!4184 j!176)))))

(declare-fun b!508847 () Bool)

(assert (=> b!508847 (= e!297654 e!297656)))

(declare-fun res!309685 () Bool)

(assert (=> b!508847 (=> (not res!309685) (not e!297656))))

(declare-fun lt!232372 () SeekEntryResult!4184)

(assert (=> b!508847 (= res!309685 (or (= lt!232372 (MissingZero!4184 i!1204)) (= lt!232372 (MissingVacant!4184 i!1204))))))

(assert (=> b!508847 (= lt!232372 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45966 res!309689) b!508844))

(assert (= (and b!508844 res!309690) b!508841))

(assert (= (and b!508841 res!309687) b!508839))

(assert (= (and b!508839 res!309691) b!508843))

(assert (= (and b!508843 res!309692) b!508847))

(assert (= (and b!508847 res!309685) b!508845))

(assert (= (and b!508845 res!309684) b!508842))

(assert (= (and b!508842 res!309686) b!508840))

(assert (= (and b!508840 res!309688) b!508846))

(declare-fun m!489579 () Bool)

(assert (=> b!508839 m!489579))

(declare-fun m!489581 () Bool)

(assert (=> b!508841 m!489581))

(assert (=> b!508841 m!489581))

(declare-fun m!489583 () Bool)

(assert (=> b!508841 m!489583))

(declare-fun m!489585 () Bool)

(assert (=> b!508842 m!489585))

(declare-fun m!489587 () Bool)

(assert (=> b!508840 m!489587))

(declare-fun m!489589 () Bool)

(assert (=> b!508840 m!489589))

(declare-fun m!489591 () Bool)

(assert (=> b!508843 m!489591))

(declare-fun m!489593 () Bool)

(assert (=> start!45966 m!489593))

(declare-fun m!489595 () Bool)

(assert (=> start!45966 m!489595))

(declare-fun m!489597 () Bool)

(assert (=> b!508847 m!489597))

(assert (=> b!508846 m!489581))

(assert (=> b!508846 m!489581))

(declare-fun m!489599 () Bool)

(assert (=> b!508846 m!489599))

(declare-fun m!489601 () Bool)

(assert (=> b!508845 m!489601))

(push 1)

