; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44644 () Bool)

(assert start!44644)

(declare-fun b!489786 () Bool)

(declare-fun res!292722 () Bool)

(declare-fun e!288016 () Bool)

(assert (=> b!489786 (=> (not res!292722) (not e!288016))))

(declare-datatypes ((array!31703 0))(
  ( (array!31704 (arr!15239 (Array (_ BitVec 32) (_ BitVec 64))) (size!15603 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31703)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31703 (_ BitVec 32)) Bool)

(assert (=> b!489786 (= res!292722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489787 () Bool)

(assert (=> b!489787 (= e!288016 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221060 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3706 0))(
  ( (MissingZero!3706 (index!17003 (_ BitVec 32))) (Found!3706 (index!17004 (_ BitVec 32))) (Intermediate!3706 (undefined!4518 Bool) (index!17005 (_ BitVec 32)) (x!46108 (_ BitVec 32))) (Undefined!3706) (MissingVacant!3706 (index!17006 (_ BitVec 32))) )
))
(declare-fun lt!221059 () SeekEntryResult!3706)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31703 (_ BitVec 32)) SeekEntryResult!3706)

(assert (=> b!489787 (= lt!221059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221060 (select (store (arr!15239 a!3235) i!1204 k!2280) j!176) (array!31704 (store (arr!15239 a!3235) i!1204 k!2280) (size!15603 a!3235)) mask!3524))))

(declare-fun lt!221061 () SeekEntryResult!3706)

(declare-fun lt!221062 () (_ BitVec 32))

(assert (=> b!489787 (= lt!221061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221062 (select (arr!15239 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489787 (= lt!221060 (toIndex!0 (select (store (arr!15239 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489787 (= lt!221062 (toIndex!0 (select (arr!15239 a!3235) j!176) mask!3524))))

(declare-fun e!288018 () Bool)

(assert (=> b!489787 e!288018))

(declare-fun res!292727 () Bool)

(assert (=> b!489787 (=> (not res!292727) (not e!288018))))

(assert (=> b!489787 (= res!292727 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14358 0))(
  ( (Unit!14359) )
))
(declare-fun lt!221058 () Unit!14358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14358)

(assert (=> b!489787 (= lt!221058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489788 () Bool)

(declare-fun e!288017 () Bool)

(assert (=> b!489788 (= e!288017 e!288016)))

(declare-fun res!292730 () Bool)

(assert (=> b!489788 (=> (not res!292730) (not e!288016))))

(declare-fun lt!221057 () SeekEntryResult!3706)

(assert (=> b!489788 (= res!292730 (or (= lt!221057 (MissingZero!3706 i!1204)) (= lt!221057 (MissingVacant!3706 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31703 (_ BitVec 32)) SeekEntryResult!3706)

(assert (=> b!489788 (= lt!221057 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489790 () Bool)

(declare-fun res!292725 () Bool)

(assert (=> b!489790 (=> (not res!292725) (not e!288017))))

(declare-fun arrayContainsKey!0 (array!31703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489790 (= res!292725 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489791 () Bool)

(assert (=> b!489791 (= e!288018 (= (seekEntryOrOpen!0 (select (arr!15239 a!3235) j!176) a!3235 mask!3524) (Found!3706 j!176)))))

(declare-fun b!489792 () Bool)

(declare-fun res!292729 () Bool)

(assert (=> b!489792 (=> (not res!292729) (not e!288017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489792 (= res!292729 (validKeyInArray!0 (select (arr!15239 a!3235) j!176)))))

(declare-fun b!489789 () Bool)

(declare-fun res!292723 () Bool)

(assert (=> b!489789 (=> (not res!292723) (not e!288016))))

(declare-datatypes ((List!9397 0))(
  ( (Nil!9394) (Cons!9393 (h!10255 (_ BitVec 64)) (t!15625 List!9397)) )
))
(declare-fun arrayNoDuplicates!0 (array!31703 (_ BitVec 32) List!9397) Bool)

(assert (=> b!489789 (= res!292723 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9394))))

(declare-fun res!292726 () Bool)

(assert (=> start!44644 (=> (not res!292726) (not e!288017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44644 (= res!292726 (validMask!0 mask!3524))))

(assert (=> start!44644 e!288017))

(assert (=> start!44644 true))

(declare-fun array_inv!11035 (array!31703) Bool)

(assert (=> start!44644 (array_inv!11035 a!3235)))

(declare-fun b!489793 () Bool)

(declare-fun res!292728 () Bool)

(assert (=> b!489793 (=> (not res!292728) (not e!288017))))

(assert (=> b!489793 (= res!292728 (and (= (size!15603 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15603 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15603 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489794 () Bool)

(declare-fun res!292724 () Bool)

(assert (=> b!489794 (=> (not res!292724) (not e!288017))))

(assert (=> b!489794 (= res!292724 (validKeyInArray!0 k!2280))))

(assert (= (and start!44644 res!292726) b!489793))

(assert (= (and b!489793 res!292728) b!489792))

(assert (= (and b!489792 res!292729) b!489794))

(assert (= (and b!489794 res!292724) b!489790))

(assert (= (and b!489790 res!292725) b!489788))

(assert (= (and b!489788 res!292730) b!489786))

(assert (= (and b!489786 res!292722) b!489789))

(assert (= (and b!489789 res!292723) b!489787))

(assert (= (and b!489787 res!292727) b!489791))

(declare-fun m!469677 () Bool)

(assert (=> b!489792 m!469677))

(assert (=> b!489792 m!469677))

(declare-fun m!469679 () Bool)

(assert (=> b!489792 m!469679))

(declare-fun m!469681 () Bool)

(assert (=> b!489790 m!469681))

(declare-fun m!469683 () Bool)

(assert (=> b!489786 m!469683))

(assert (=> b!489791 m!469677))

(assert (=> b!489791 m!469677))

(declare-fun m!469685 () Bool)

(assert (=> b!489791 m!469685))

(declare-fun m!469687 () Bool)

(assert (=> b!489794 m!469687))

(declare-fun m!469689 () Bool)

(assert (=> start!44644 m!469689))

(declare-fun m!469691 () Bool)

(assert (=> start!44644 m!469691))

(declare-fun m!469693 () Bool)

(assert (=> b!489787 m!469693))

(declare-fun m!469695 () Bool)

(assert (=> b!489787 m!469695))

(assert (=> b!489787 m!469677))

(declare-fun m!469697 () Bool)

(assert (=> b!489787 m!469697))

(assert (=> b!489787 m!469695))

(declare-fun m!469699 () Bool)

(assert (=> b!489787 m!469699))

(assert (=> b!489787 m!469677))

(declare-fun m!469701 () Bool)

(assert (=> b!489787 m!469701))

(assert (=> b!489787 m!469695))

(declare-fun m!469703 () Bool)

(assert (=> b!489787 m!469703))

(assert (=> b!489787 m!469677))

(declare-fun m!469705 () Bool)

(assert (=> b!489787 m!469705))

(declare-fun m!469707 () Bool)

(assert (=> b!489787 m!469707))

(declare-fun m!469709 () Bool)

(assert (=> b!489789 m!469709))

(declare-fun m!469711 () Bool)

(assert (=> b!489788 m!469711))

(push 1)

