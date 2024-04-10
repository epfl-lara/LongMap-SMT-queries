; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44278 () Bool)

(assert start!44278)

(declare-fun b!486914 () Bool)

(declare-fun res!290305 () Bool)

(declare-fun e!286577 () Bool)

(assert (=> b!486914 (=> (not res!290305) (not e!286577))))

(declare-datatypes ((array!31529 0))(
  ( (array!31530 (arr!15158 (Array (_ BitVec 32) (_ BitVec 64))) (size!15522 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31529)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486914 (= res!290305 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486916 () Bool)

(declare-fun e!286578 () Bool)

(assert (=> b!486916 (= e!286578 false)))

(declare-fun lt!219891 () Bool)

(declare-datatypes ((List!9316 0))(
  ( (Nil!9313) (Cons!9312 (h!10168 (_ BitVec 64)) (t!15544 List!9316)) )
))
(declare-fun arrayNoDuplicates!0 (array!31529 (_ BitVec 32) List!9316) Bool)

(assert (=> b!486916 (= lt!219891 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9313))))

(declare-fun b!486917 () Bool)

(declare-fun res!290306 () Bool)

(assert (=> b!486917 (=> (not res!290306) (not e!286577))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486917 (= res!290306 (validKeyInArray!0 (select (arr!15158 a!3235) j!176)))))

(declare-fun b!486918 () Bool)

(declare-fun res!290304 () Bool)

(assert (=> b!486918 (=> (not res!290304) (not e!286578))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31529 (_ BitVec 32)) Bool)

(assert (=> b!486918 (= res!290304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486919 () Bool)

(assert (=> b!486919 (= e!286577 e!286578)))

(declare-fun res!290300 () Bool)

(assert (=> b!486919 (=> (not res!290300) (not e!286578))))

(declare-datatypes ((SeekEntryResult!3625 0))(
  ( (MissingZero!3625 (index!16679 (_ BitVec 32))) (Found!3625 (index!16680 (_ BitVec 32))) (Intermediate!3625 (undefined!4437 Bool) (index!16681 (_ BitVec 32)) (x!45805 (_ BitVec 32))) (Undefined!3625) (MissingVacant!3625 (index!16682 (_ BitVec 32))) )
))
(declare-fun lt!219892 () SeekEntryResult!3625)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486919 (= res!290300 (or (= lt!219892 (MissingZero!3625 i!1204)) (= lt!219892 (MissingVacant!3625 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31529 (_ BitVec 32)) SeekEntryResult!3625)

(assert (=> b!486919 (= lt!219892 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486920 () Bool)

(declare-fun res!290302 () Bool)

(assert (=> b!486920 (=> (not res!290302) (not e!286577))))

(assert (=> b!486920 (= res!290302 (validKeyInArray!0 k!2280))))

(declare-fun res!290303 () Bool)

(assert (=> start!44278 (=> (not res!290303) (not e!286577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44278 (= res!290303 (validMask!0 mask!3524))))

(assert (=> start!44278 e!286577))

(assert (=> start!44278 true))

(declare-fun array_inv!10954 (array!31529) Bool)

(assert (=> start!44278 (array_inv!10954 a!3235)))

(declare-fun b!486915 () Bool)

(declare-fun res!290301 () Bool)

(assert (=> b!486915 (=> (not res!290301) (not e!286577))))

(assert (=> b!486915 (= res!290301 (and (= (size!15522 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15522 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15522 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44278 res!290303) b!486915))

(assert (= (and b!486915 res!290301) b!486917))

(assert (= (and b!486917 res!290306) b!486920))

(assert (= (and b!486920 res!290302) b!486914))

(assert (= (and b!486914 res!290305) b!486919))

(assert (= (and b!486919 res!290300) b!486918))

(assert (= (and b!486918 res!290304) b!486916))

(declare-fun m!466785 () Bool)

(assert (=> b!486916 m!466785))

(declare-fun m!466787 () Bool)

(assert (=> b!486919 m!466787))

(declare-fun m!466789 () Bool)

(assert (=> b!486914 m!466789))

(declare-fun m!466791 () Bool)

(assert (=> start!44278 m!466791))

(declare-fun m!466793 () Bool)

(assert (=> start!44278 m!466793))

(declare-fun m!466795 () Bool)

(assert (=> b!486917 m!466795))

(assert (=> b!486917 m!466795))

(declare-fun m!466797 () Bool)

(assert (=> b!486917 m!466797))

(declare-fun m!466799 () Bool)

(assert (=> b!486920 m!466799))

(declare-fun m!466801 () Bool)

(assert (=> b!486918 m!466801))

(push 1)

