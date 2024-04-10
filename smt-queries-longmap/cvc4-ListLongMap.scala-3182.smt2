; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44722 () Bool)

(assert start!44722)

(declare-fun b!490839 () Bool)

(declare-fun res!293778 () Bool)

(declare-fun e!288483 () Bool)

(assert (=> b!490839 (=> (not res!293778) (not e!288483))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31781 0))(
  ( (array!31782 (arr!15278 (Array (_ BitVec 32) (_ BitVec 64))) (size!15642 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31781)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490839 (= res!293778 (and (= (size!15642 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15642 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15642 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490840 () Bool)

(declare-fun res!293782 () Bool)

(assert (=> b!490840 (=> (not res!293782) (not e!288483))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490840 (= res!293782 (validKeyInArray!0 k!2280))))

(declare-fun b!490841 () Bool)

(declare-fun e!288486 () Bool)

(assert (=> b!490841 (= e!288486 true)))

(declare-datatypes ((SeekEntryResult!3745 0))(
  ( (MissingZero!3745 (index!17159 (_ BitVec 32))) (Found!3745 (index!17160 (_ BitVec 32))) (Intermediate!3745 (undefined!4557 Bool) (index!17161 (_ BitVec 32)) (x!46251 (_ BitVec 32))) (Undefined!3745) (MissingVacant!3745 (index!17162 (_ BitVec 32))) )
))
(declare-fun lt!221759 () SeekEntryResult!3745)

(declare-fun lt!221764 () array!31781)

(declare-fun lt!221762 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31781 (_ BitVec 32)) SeekEntryResult!3745)

(assert (=> b!490841 (= lt!221759 (seekEntryOrOpen!0 lt!221762 lt!221764 mask!3524))))

(declare-datatypes ((Unit!14436 0))(
  ( (Unit!14437) )
))
(declare-fun lt!221763 () Unit!14436)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31781 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14436)

(assert (=> b!490841 (= lt!221763 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490842 () Bool)

(declare-fun res!293779 () Bool)

(declare-fun e!288484 () Bool)

(assert (=> b!490842 (=> (not res!293779) (not e!288484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31781 (_ BitVec 32)) Bool)

(assert (=> b!490842 (= res!293779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490843 () Bool)

(declare-fun res!293780 () Bool)

(assert (=> b!490843 (=> (not res!293780) (not e!288483))))

(declare-fun arrayContainsKey!0 (array!31781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490843 (= res!293780 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490844 () Bool)

(assert (=> b!490844 (= e!288484 (not e!288486))))

(declare-fun res!293776 () Bool)

(assert (=> b!490844 (=> res!293776 e!288486)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31781 (_ BitVec 32)) SeekEntryResult!3745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490844 (= res!293776 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15278 a!3235) j!176) mask!3524) (select (arr!15278 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221762 mask!3524) lt!221762 lt!221764 mask!3524))))))

(assert (=> b!490844 (= lt!221762 (select (store (arr!15278 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490844 (= lt!221764 (array!31782 (store (arr!15278 a!3235) i!1204 k!2280) (size!15642 a!3235)))))

(assert (=> b!490844 (= lt!221759 (Found!3745 j!176))))

(assert (=> b!490844 (= lt!221759 (seekEntryOrOpen!0 (select (arr!15278 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490844 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221760 () Unit!14436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14436)

(assert (=> b!490844 (= lt!221760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293783 () Bool)

(assert (=> start!44722 (=> (not res!293783) (not e!288483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44722 (= res!293783 (validMask!0 mask!3524))))

(assert (=> start!44722 e!288483))

(assert (=> start!44722 true))

(declare-fun array_inv!11074 (array!31781) Bool)

(assert (=> start!44722 (array_inv!11074 a!3235)))

(declare-fun b!490845 () Bool)

(declare-fun res!293777 () Bool)

(assert (=> b!490845 (=> (not res!293777) (not e!288484))))

(declare-datatypes ((List!9436 0))(
  ( (Nil!9433) (Cons!9432 (h!10294 (_ BitVec 64)) (t!15664 List!9436)) )
))
(declare-fun arrayNoDuplicates!0 (array!31781 (_ BitVec 32) List!9436) Bool)

(assert (=> b!490845 (= res!293777 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9433))))

(declare-fun b!490846 () Bool)

(assert (=> b!490846 (= e!288483 e!288484)))

(declare-fun res!293775 () Bool)

(assert (=> b!490846 (=> (not res!293775) (not e!288484))))

(declare-fun lt!221761 () SeekEntryResult!3745)

(assert (=> b!490846 (= res!293775 (or (= lt!221761 (MissingZero!3745 i!1204)) (= lt!221761 (MissingVacant!3745 i!1204))))))

(assert (=> b!490846 (= lt!221761 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490847 () Bool)

(declare-fun res!293781 () Bool)

(assert (=> b!490847 (=> (not res!293781) (not e!288483))))

(assert (=> b!490847 (= res!293781 (validKeyInArray!0 (select (arr!15278 a!3235) j!176)))))

(assert (= (and start!44722 res!293783) b!490839))

(assert (= (and b!490839 res!293778) b!490847))

(assert (= (and b!490847 res!293781) b!490840))

(assert (= (and b!490840 res!293782) b!490843))

(assert (= (and b!490843 res!293780) b!490846))

(assert (= (and b!490846 res!293775) b!490842))

(assert (= (and b!490842 res!293779) b!490845))

(assert (= (and b!490845 res!293777) b!490844))

(assert (= (and b!490844 (not res!293776)) b!490841))

(declare-fun m!471137 () Bool)

(assert (=> b!490844 m!471137))

(declare-fun m!471139 () Bool)

(assert (=> b!490844 m!471139))

(declare-fun m!471141 () Bool)

(assert (=> b!490844 m!471141))

(declare-fun m!471143 () Bool)

(assert (=> b!490844 m!471143))

(declare-fun m!471145 () Bool)

(assert (=> b!490844 m!471145))

(declare-fun m!471147 () Bool)

(assert (=> b!490844 m!471147))

(declare-fun m!471149 () Bool)

(assert (=> b!490844 m!471149))

(assert (=> b!490844 m!471143))

(assert (=> b!490844 m!471141))

(assert (=> b!490844 m!471143))

(declare-fun m!471151 () Bool)

(assert (=> b!490844 m!471151))

(assert (=> b!490844 m!471143))

(declare-fun m!471153 () Bool)

(assert (=> b!490844 m!471153))

(declare-fun m!471155 () Bool)

(assert (=> b!490844 m!471155))

(assert (=> b!490844 m!471147))

(declare-fun m!471157 () Bool)

(assert (=> b!490841 m!471157))

(declare-fun m!471159 () Bool)

(assert (=> b!490841 m!471159))

(declare-fun m!471161 () Bool)

(assert (=> b!490846 m!471161))

(declare-fun m!471163 () Bool)

(assert (=> b!490845 m!471163))

(assert (=> b!490847 m!471143))

(assert (=> b!490847 m!471143))

(declare-fun m!471165 () Bool)

(assert (=> b!490847 m!471165))

(declare-fun m!471167 () Bool)

(assert (=> b!490840 m!471167))

(declare-fun m!471169 () Bool)

(assert (=> b!490842 m!471169))

(declare-fun m!471171 () Bool)

(assert (=> start!44722 m!471171))

(declare-fun m!471173 () Bool)

(assert (=> start!44722 m!471173))

(declare-fun m!471175 () Bool)

(assert (=> b!490843 m!471175))

(push 1)

