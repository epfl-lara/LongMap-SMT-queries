; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45442 () Bool)

(assert start!45442)

(declare-fun b!499908 () Bool)

(declare-fun e!292923 () Bool)

(assert (=> b!499908 (= e!292923 false)))

(declare-fun b!499909 () Bool)

(declare-fun res!301810 () Bool)

(declare-fun e!292922 () Bool)

(assert (=> b!499909 (=> (not res!301810) (not e!292922))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32267 0))(
  ( (array!32268 (arr!15515 (Array (_ BitVec 32) (_ BitVec 64))) (size!15879 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32267)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499909 (= res!301810 (and (= (size!15879 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15879 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15879 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499910 () Bool)

(declare-fun e!292920 () Bool)

(assert (=> b!499910 (= e!292920 true)))

(declare-fun lt!226765 () (_ BitVec 32))

(declare-fun lt!226760 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3982 0))(
  ( (MissingZero!3982 (index!18110 (_ BitVec 32))) (Found!3982 (index!18111 (_ BitVec 32))) (Intermediate!3982 (undefined!4794 Bool) (index!18112 (_ BitVec 32)) (x!47147 (_ BitVec 32))) (Undefined!3982) (MissingVacant!3982 (index!18113 (_ BitVec 32))) )
))
(declare-fun lt!226768 () SeekEntryResult!3982)

(declare-fun lt!226767 () array!32267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32267 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!499910 (= lt!226768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226765 lt!226760 lt!226767 mask!3524))))

(declare-fun b!499911 () Bool)

(declare-fun e!292921 () Bool)

(declare-fun e!292924 () Bool)

(assert (=> b!499911 (= e!292921 (not e!292924))))

(declare-fun res!301820 () Bool)

(assert (=> b!499911 (=> res!301820 e!292924)))

(declare-fun lt!226766 () (_ BitVec 32))

(declare-fun lt!226762 () SeekEntryResult!3982)

(assert (=> b!499911 (= res!301820 (= lt!226762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226766 lt!226760 lt!226767 mask!3524)))))

(assert (=> b!499911 (= lt!226762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226765 (select (arr!15515 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499911 (= lt!226766 (toIndex!0 lt!226760 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!499911 (= lt!226760 (select (store (arr!15515 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499911 (= lt!226765 (toIndex!0 (select (arr!15515 a!3235) j!176) mask!3524))))

(assert (=> b!499911 (= lt!226767 (array!32268 (store (arr!15515 a!3235) i!1204 k!2280) (size!15879 a!3235)))))

(declare-fun e!292926 () Bool)

(assert (=> b!499911 e!292926))

(declare-fun res!301812 () Bool)

(assert (=> b!499911 (=> (not res!301812) (not e!292926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32267 (_ BitVec 32)) Bool)

(assert (=> b!499911 (= res!301812 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15004 0))(
  ( (Unit!15005) )
))
(declare-fun lt!226763 () Unit!15004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15004)

(assert (=> b!499911 (= lt!226763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499912 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32267 (_ BitVec 32)) SeekEntryResult!3982)

(assert (=> b!499912 (= e!292926 (= (seekEntryOrOpen!0 (select (arr!15515 a!3235) j!176) a!3235 mask!3524) (Found!3982 j!176)))))

(declare-fun b!499914 () Bool)

(declare-fun e!292925 () Unit!15004)

(declare-fun Unit!15006 () Unit!15004)

(assert (=> b!499914 (= e!292925 Unit!15006)))

(declare-fun lt!226764 () Unit!15004)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15004)

(assert (=> b!499914 (= lt!226764 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226765 #b00000000000000000000000000000000 (index!18112 lt!226762) (x!47147 lt!226762) mask!3524))))

(declare-fun res!301819 () Bool)

(assert (=> b!499914 (= res!301819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226765 lt!226760 lt!226767 mask!3524) (Intermediate!3982 false (index!18112 lt!226762) (x!47147 lt!226762))))))

(assert (=> b!499914 (=> (not res!301819) (not e!292923))))

(assert (=> b!499914 e!292923))

(declare-fun b!499915 () Bool)

(assert (=> b!499915 (= e!292922 e!292921)))

(declare-fun res!301815 () Bool)

(assert (=> b!499915 (=> (not res!301815) (not e!292921))))

(declare-fun lt!226759 () SeekEntryResult!3982)

(assert (=> b!499915 (= res!301815 (or (= lt!226759 (MissingZero!3982 i!1204)) (= lt!226759 (MissingVacant!3982 i!1204))))))

(assert (=> b!499915 (= lt!226759 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499916 () Bool)

(declare-fun res!301814 () Bool)

(assert (=> b!499916 (=> (not res!301814) (not e!292922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499916 (= res!301814 (validKeyInArray!0 (select (arr!15515 a!3235) j!176)))))

(declare-fun b!499917 () Bool)

(declare-fun res!301817 () Bool)

(assert (=> b!499917 (=> (not res!301817) (not e!292921))))

(declare-datatypes ((List!9673 0))(
  ( (Nil!9670) (Cons!9669 (h!10543 (_ BitVec 64)) (t!15901 List!9673)) )
))
(declare-fun arrayNoDuplicates!0 (array!32267 (_ BitVec 32) List!9673) Bool)

(assert (=> b!499917 (= res!301817 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9670))))

(declare-fun b!499918 () Bool)

(declare-fun res!301813 () Bool)

(assert (=> b!499918 (=> (not res!301813) (not e!292922))))

(declare-fun arrayContainsKey!0 (array!32267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499918 (= res!301813 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499919 () Bool)

(declare-fun res!301816 () Bool)

(assert (=> b!499919 (=> res!301816 e!292924)))

(assert (=> b!499919 (= res!301816 (or (undefined!4794 lt!226762) (not (is-Intermediate!3982 lt!226762))))))

(declare-fun b!499920 () Bool)

(assert (=> b!499920 (= e!292924 e!292920)))

(declare-fun res!301809 () Bool)

(assert (=> b!499920 (=> res!301809 e!292920)))

(assert (=> b!499920 (= res!301809 (or (bvsgt #b00000000000000000000000000000000 (x!47147 lt!226762)) (bvsgt (x!47147 lt!226762) #b01111111111111111111111111111110) (bvslt lt!226765 #b00000000000000000000000000000000) (bvsge lt!226765 (size!15879 a!3235)) (bvslt (index!18112 lt!226762) #b00000000000000000000000000000000) (bvsge (index!18112 lt!226762) (size!15879 a!3235)) (not (= lt!226762 (Intermediate!3982 false (index!18112 lt!226762) (x!47147 lt!226762))))))))

(assert (=> b!499920 (and (or (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226761 () Unit!15004)

(assert (=> b!499920 (= lt!226761 e!292925)))

(declare-fun c!59327 () Bool)

(assert (=> b!499920 (= c!59327 (= (select (arr!15515 a!3235) (index!18112 lt!226762)) (select (arr!15515 a!3235) j!176)))))

(assert (=> b!499920 (and (bvslt (x!47147 lt!226762) #b01111111111111111111111111111110) (or (= (select (arr!15515 a!3235) (index!18112 lt!226762)) (select (arr!15515 a!3235) j!176)) (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15515 a!3235) (index!18112 lt!226762)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!301811 () Bool)

(assert (=> start!45442 (=> (not res!301811) (not e!292922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45442 (= res!301811 (validMask!0 mask!3524))))

(assert (=> start!45442 e!292922))

(assert (=> start!45442 true))

(declare-fun array_inv!11311 (array!32267) Bool)

(assert (=> start!45442 (array_inv!11311 a!3235)))

(declare-fun b!499913 () Bool)

(declare-fun res!301808 () Bool)

(assert (=> b!499913 (=> (not res!301808) (not e!292922))))

(assert (=> b!499913 (= res!301808 (validKeyInArray!0 k!2280))))

(declare-fun b!499921 () Bool)

(declare-fun Unit!15007 () Unit!15004)

(assert (=> b!499921 (= e!292925 Unit!15007)))

(declare-fun b!499922 () Bool)

(declare-fun res!301818 () Bool)

(assert (=> b!499922 (=> (not res!301818) (not e!292921))))

(assert (=> b!499922 (= res!301818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45442 res!301811) b!499909))

(assert (= (and b!499909 res!301810) b!499916))

(assert (= (and b!499916 res!301814) b!499913))

(assert (= (and b!499913 res!301808) b!499918))

(assert (= (and b!499918 res!301813) b!499915))

(assert (= (and b!499915 res!301815) b!499922))

(assert (= (and b!499922 res!301818) b!499917))

(assert (= (and b!499917 res!301817) b!499911))

(assert (= (and b!499911 res!301812) b!499912))

(assert (= (and b!499911 (not res!301820)) b!499919))

(assert (= (and b!499919 (not res!301816)) b!499920))

(assert (= (and b!499920 c!59327) b!499914))

(assert (= (and b!499920 (not c!59327)) b!499921))

(assert (= (and b!499914 res!301819) b!499908))

(assert (= (and b!499920 (not res!301809)) b!499910))

(declare-fun m!481077 () Bool)

(assert (=> b!499922 m!481077))

(declare-fun m!481079 () Bool)

(assert (=> b!499916 m!481079))

(assert (=> b!499916 m!481079))

(declare-fun m!481081 () Bool)

(assert (=> b!499916 m!481081))

(assert (=> b!499912 m!481079))

(assert (=> b!499912 m!481079))

(declare-fun m!481083 () Bool)

(assert (=> b!499912 m!481083))

(declare-fun m!481085 () Bool)

(assert (=> start!45442 m!481085))

(declare-fun m!481087 () Bool)

(assert (=> start!45442 m!481087))

(declare-fun m!481089 () Bool)

(assert (=> b!499913 m!481089))

(declare-fun m!481091 () Bool)

(assert (=> b!499920 m!481091))

(assert (=> b!499920 m!481079))

(declare-fun m!481093 () Bool)

(assert (=> b!499910 m!481093))

(declare-fun m!481095 () Bool)

(assert (=> b!499918 m!481095))

(declare-fun m!481097 () Bool)

(assert (=> b!499915 m!481097))

(declare-fun m!481099 () Bool)

(assert (=> b!499917 m!481099))

(declare-fun m!481101 () Bool)

(assert (=> b!499914 m!481101))

(assert (=> b!499914 m!481093))

(declare-fun m!481103 () Bool)

(assert (=> b!499911 m!481103))

(declare-fun m!481105 () Bool)

(assert (=> b!499911 m!481105))

(declare-fun m!481107 () Bool)

(assert (=> b!499911 m!481107))

(declare-fun m!481109 () Bool)

(assert (=> b!499911 m!481109))

(assert (=> b!499911 m!481079))

(declare-fun m!481111 () Bool)

(assert (=> b!499911 m!481111))

(assert (=> b!499911 m!481079))

(declare-fun m!481113 () Bool)

(assert (=> b!499911 m!481113))

(declare-fun m!481115 () Bool)

(assert (=> b!499911 m!481115))

(assert (=> b!499911 m!481079))

(declare-fun m!481117 () Bool)

(assert (=> b!499911 m!481117))

(push 1)

