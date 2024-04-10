; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44380 () Bool)

(assert start!44380)

(declare-fun b!487770 () Bool)

(declare-fun res!291048 () Bool)

(declare-fun e!286982 () Bool)

(assert (=> b!487770 (=> (not res!291048) (not e!286982))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31586 0))(
  ( (array!31587 (arr!15185 (Array (_ BitVec 32) (_ BitVec 64))) (size!15549 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31586)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487770 (= res!291048 (and (= (size!15549 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15549 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15549 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487771 () Bool)

(declare-fun res!291042 () Bool)

(declare-fun e!286981 () Bool)

(assert (=> b!487771 (=> (not res!291042) (not e!286981))))

(declare-datatypes ((List!9343 0))(
  ( (Nil!9340) (Cons!9339 (h!10195 (_ BitVec 64)) (t!15571 List!9343)) )
))
(declare-fun arrayNoDuplicates!0 (array!31586 (_ BitVec 32) List!9343) Bool)

(assert (=> b!487771 (= res!291042 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9340))))

(declare-fun b!487772 () Bool)

(declare-fun res!291045 () Bool)

(assert (=> b!487772 (=> (not res!291045) (not e!286982))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487772 (= res!291045 (validKeyInArray!0 k!2280))))

(declare-fun b!487773 () Bool)

(declare-fun res!291049 () Bool)

(assert (=> b!487773 (=> (not res!291049) (not e!286982))))

(assert (=> b!487773 (= res!291049 (validKeyInArray!0 (select (arr!15185 a!3235) j!176)))))

(declare-fun b!487774 () Bool)

(declare-fun res!291043 () Bool)

(assert (=> b!487774 (=> (not res!291043) (not e!286982))))

(declare-fun arrayContainsKey!0 (array!31586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487774 (= res!291043 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487775 () Bool)

(declare-fun e!286983 () Bool)

(declare-datatypes ((SeekEntryResult!3652 0))(
  ( (MissingZero!3652 (index!16787 (_ BitVec 32))) (Found!3652 (index!16788 (_ BitVec 32))) (Intermediate!3652 (undefined!4464 Bool) (index!16789 (_ BitVec 32)) (x!45904 (_ BitVec 32))) (Undefined!3652) (MissingVacant!3652 (index!16790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31586 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> b!487775 (= e!286983 (= (seekEntryOrOpen!0 (select (arr!15185 a!3235) j!176) a!3235 mask!3524) (Found!3652 j!176)))))

(declare-fun res!291044 () Bool)

(assert (=> start!44380 (=> (not res!291044) (not e!286982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44380 (= res!291044 (validMask!0 mask!3524))))

(assert (=> start!44380 e!286982))

(assert (=> start!44380 true))

(declare-fun array_inv!10981 (array!31586) Bool)

(assert (=> start!44380 (array_inv!10981 a!3235)))

(declare-fun b!487776 () Bool)

(assert (=> b!487776 (= e!286981 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220151 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487776 (= lt!220151 (toIndex!0 (select (arr!15185 a!3235) j!176) mask!3524))))

(assert (=> b!487776 e!286983))

(declare-fun res!291046 () Bool)

(assert (=> b!487776 (=> (not res!291046) (not e!286983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31586 (_ BitVec 32)) Bool)

(assert (=> b!487776 (= res!291046 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14250 0))(
  ( (Unit!14251) )
))
(declare-fun lt!220153 () Unit!14250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14250)

(assert (=> b!487776 (= lt!220153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487777 () Bool)

(assert (=> b!487777 (= e!286982 e!286981)))

(declare-fun res!291050 () Bool)

(assert (=> b!487777 (=> (not res!291050) (not e!286981))))

(declare-fun lt!220152 () SeekEntryResult!3652)

(assert (=> b!487777 (= res!291050 (or (= lt!220152 (MissingZero!3652 i!1204)) (= lt!220152 (MissingVacant!3652 i!1204))))))

(assert (=> b!487777 (= lt!220152 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487778 () Bool)

(declare-fun res!291047 () Bool)

(assert (=> b!487778 (=> (not res!291047) (not e!286981))))

(assert (=> b!487778 (= res!291047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44380 res!291044) b!487770))

(assert (= (and b!487770 res!291048) b!487773))

(assert (= (and b!487773 res!291049) b!487772))

(assert (= (and b!487772 res!291045) b!487774))

(assert (= (and b!487774 res!291043) b!487777))

(assert (= (and b!487777 res!291050) b!487778))

(assert (= (and b!487778 res!291047) b!487771))

(assert (= (and b!487771 res!291042) b!487776))

(assert (= (and b!487776 res!291046) b!487775))

(declare-fun m!467557 () Bool)

(assert (=> b!487772 m!467557))

(declare-fun m!467559 () Bool)

(assert (=> b!487778 m!467559))

(declare-fun m!467561 () Bool)

(assert (=> b!487773 m!467561))

(assert (=> b!487773 m!467561))

(declare-fun m!467563 () Bool)

(assert (=> b!487773 m!467563))

(declare-fun m!467565 () Bool)

(assert (=> b!487771 m!467565))

(assert (=> b!487776 m!467561))

(assert (=> b!487776 m!467561))

(declare-fun m!467567 () Bool)

(assert (=> b!487776 m!467567))

(declare-fun m!467569 () Bool)

(assert (=> b!487776 m!467569))

(declare-fun m!467571 () Bool)

(assert (=> b!487776 m!467571))

(declare-fun m!467573 () Bool)

(assert (=> b!487777 m!467573))

(declare-fun m!467575 () Bool)

(assert (=> b!487774 m!467575))

(declare-fun m!467577 () Bool)

(assert (=> start!44380 m!467577))

(declare-fun m!467579 () Bool)

(assert (=> start!44380 m!467579))

(assert (=> b!487775 m!467561))

(assert (=> b!487775 m!467561))

(declare-fun m!467581 () Bool)

(assert (=> b!487775 m!467581))

(push 1)

