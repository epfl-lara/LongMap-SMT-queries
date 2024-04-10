; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45798 () Bool)

(assert start!45798)

(declare-fun res!307914 () Bool)

(declare-fun e!296696 () Bool)

(assert (=> start!45798 (=> (not res!307914) (not e!296696))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45798 (= res!307914 (validMask!0 mask!3524))))

(assert (=> start!45798 e!296696))

(assert (=> start!45798 true))

(declare-datatypes ((array!32554 0))(
  ( (array!32555 (arr!15657 (Array (_ BitVec 32) (_ BitVec 64))) (size!16021 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32554)

(declare-fun array_inv!11453 (array!32554) Bool)

(assert (=> start!45798 (array_inv!11453 a!3235)))

(declare-fun b!506950 () Bool)

(declare-fun res!307917 () Bool)

(assert (=> b!506950 (=> (not res!307917) (not e!296696))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506950 (= res!307917 (validKeyInArray!0 (select (arr!15657 a!3235) j!176)))))

(declare-fun b!506951 () Bool)

(declare-fun e!296698 () Bool)

(declare-fun e!296699 () Bool)

(assert (=> b!506951 (= e!296698 e!296699)))

(declare-fun res!307913 () Bool)

(assert (=> b!506951 (=> res!307913 e!296699)))

(declare-fun lt!231373 () Bool)

(declare-datatypes ((SeekEntryResult!4124 0))(
  ( (MissingZero!4124 (index!18684 (_ BitVec 32))) (Found!4124 (index!18685 (_ BitVec 32))) (Intermediate!4124 (undefined!4936 Bool) (index!18686 (_ BitVec 32)) (x!47685 (_ BitVec 32))) (Undefined!4124) (MissingVacant!4124 (index!18687 (_ BitVec 32))) )
))
(declare-fun lt!231375 () SeekEntryResult!4124)

(assert (=> b!506951 (= res!307913 (or (and (not lt!231373) (undefined!4936 lt!231375)) (and (not lt!231373) (not (undefined!4936 lt!231375)))))))

(assert (=> b!506951 (= lt!231373 (not (is-Intermediate!4124 lt!231375)))))

(declare-fun b!506952 () Bool)

(declare-fun res!307915 () Bool)

(assert (=> b!506952 (=> (not res!307915) (not e!296696))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506952 (= res!307915 (and (= (size!16021 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16021 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16021 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506953 () Bool)

(declare-fun e!296695 () Bool)

(assert (=> b!506953 (= e!296696 e!296695)))

(declare-fun res!307916 () Bool)

(assert (=> b!506953 (=> (not res!307916) (not e!296695))))

(declare-fun lt!231374 () SeekEntryResult!4124)

(assert (=> b!506953 (= res!307916 (or (= lt!231374 (MissingZero!4124 i!1204)) (= lt!231374 (MissingVacant!4124 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32554 (_ BitVec 32)) SeekEntryResult!4124)

(assert (=> b!506953 (= lt!231374 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506954 () Bool)

(declare-fun res!307909 () Bool)

(assert (=> b!506954 (=> (not res!307909) (not e!296695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32554 (_ BitVec 32)) Bool)

(assert (=> b!506954 (= res!307909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506955 () Bool)

(declare-fun res!307919 () Bool)

(assert (=> b!506955 (=> (not res!307919) (not e!296695))))

(declare-datatypes ((List!9815 0))(
  ( (Nil!9812) (Cons!9811 (h!10688 (_ BitVec 64)) (t!16043 List!9815)) )
))
(declare-fun arrayNoDuplicates!0 (array!32554 (_ BitVec 32) List!9815) Bool)

(assert (=> b!506955 (= res!307919 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9812))))

(declare-fun b!506956 () Bool)

(declare-fun res!307918 () Bool)

(assert (=> b!506956 (=> (not res!307918) (not e!296696))))

(assert (=> b!506956 (= res!307918 (validKeyInArray!0 k!2280))))

(declare-fun b!506957 () Bool)

(assert (=> b!506957 (= e!296695 (not e!296698))))

(declare-fun res!307911 () Bool)

(assert (=> b!506957 (=> res!307911 e!296698)))

(declare-fun lt!231372 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32554 (_ BitVec 32)) SeekEntryResult!4124)

(assert (=> b!506957 (= res!307911 (= lt!231375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231372 (select (store (arr!15657 a!3235) i!1204 k!2280) j!176) (array!32555 (store (arr!15657 a!3235) i!1204 k!2280) (size!16021 a!3235)) mask!3524)))))

(declare-fun lt!231371 () (_ BitVec 32))

(assert (=> b!506957 (= lt!231375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231371 (select (arr!15657 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506957 (= lt!231372 (toIndex!0 (select (store (arr!15657 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506957 (= lt!231371 (toIndex!0 (select (arr!15657 a!3235) j!176) mask!3524))))

(declare-fun e!296697 () Bool)

(assert (=> b!506957 e!296697))

(declare-fun res!307910 () Bool)

(assert (=> b!506957 (=> (not res!307910) (not e!296697))))

(assert (=> b!506957 (= res!307910 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15536 0))(
  ( (Unit!15537) )
))
(declare-fun lt!231376 () Unit!15536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15536)

(assert (=> b!506957 (= lt!231376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506958 () Bool)

(assert (=> b!506958 (= e!296699 true)))

(assert (=> b!506958 false))

(declare-fun b!506959 () Bool)

(assert (=> b!506959 (= e!296697 (= (seekEntryOrOpen!0 (select (arr!15657 a!3235) j!176) a!3235 mask!3524) (Found!4124 j!176)))))

(declare-fun b!506960 () Bool)

(declare-fun res!307912 () Bool)

(assert (=> b!506960 (=> (not res!307912) (not e!296696))))

(declare-fun arrayContainsKey!0 (array!32554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506960 (= res!307912 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45798 res!307914) b!506952))

(assert (= (and b!506952 res!307915) b!506950))

(assert (= (and b!506950 res!307917) b!506956))

(assert (= (and b!506956 res!307918) b!506960))

(assert (= (and b!506960 res!307912) b!506953))

(assert (= (and b!506953 res!307916) b!506954))

(assert (= (and b!506954 res!307909) b!506955))

(assert (= (and b!506955 res!307919) b!506957))

(assert (= (and b!506957 res!307910) b!506959))

(assert (= (and b!506957 (not res!307911)) b!506951))

(assert (= (and b!506951 (not res!307913)) b!506958))

(declare-fun m!487659 () Bool)

(assert (=> b!506950 m!487659))

(assert (=> b!506950 m!487659))

(declare-fun m!487661 () Bool)

(assert (=> b!506950 m!487661))

(declare-fun m!487663 () Bool)

(assert (=> b!506955 m!487663))

(declare-fun m!487665 () Bool)

(assert (=> b!506954 m!487665))

(declare-fun m!487667 () Bool)

(assert (=> start!45798 m!487667))

(declare-fun m!487669 () Bool)

(assert (=> start!45798 m!487669))

(declare-fun m!487671 () Bool)

(assert (=> b!506953 m!487671))

(assert (=> b!506959 m!487659))

(assert (=> b!506959 m!487659))

(declare-fun m!487673 () Bool)

(assert (=> b!506959 m!487673))

(declare-fun m!487675 () Bool)

(assert (=> b!506956 m!487675))

(declare-fun m!487677 () Bool)

(assert (=> b!506960 m!487677))

(declare-fun m!487679 () Bool)

(assert (=> b!506957 m!487679))

(declare-fun m!487681 () Bool)

(assert (=> b!506957 m!487681))

(declare-fun m!487683 () Bool)

(assert (=> b!506957 m!487683))

(assert (=> b!506957 m!487659))

(declare-fun m!487685 () Bool)

(assert (=> b!506957 m!487685))

(assert (=> b!506957 m!487659))

(declare-fun m!487687 () Bool)

(assert (=> b!506957 m!487687))

(assert (=> b!506957 m!487683))

(declare-fun m!487689 () Bool)

(assert (=> b!506957 m!487689))

(assert (=> b!506957 m!487659))

(declare-fun m!487691 () Bool)

(assert (=> b!506957 m!487691))

(assert (=> b!506957 m!487683))

(declare-fun m!487693 () Bool)

(assert (=> b!506957 m!487693))

(push 1)

