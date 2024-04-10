; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44874 () Bool)

(assert start!44874)

(declare-fun b!492418 () Bool)

(declare-fun res!295177 () Bool)

(declare-fun e!289269 () Bool)

(assert (=> b!492418 (=> (not res!295177) (not e!289269))))

(declare-datatypes ((array!31876 0))(
  ( (array!31877 (arr!15324 (Array (_ BitVec 32) (_ BitVec 64))) (size!15688 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31876)

(declare-datatypes ((List!9482 0))(
  ( (Nil!9479) (Cons!9478 (h!10343 (_ BitVec 64)) (t!15710 List!9482)) )
))
(declare-fun arrayNoDuplicates!0 (array!31876 (_ BitVec 32) List!9482) Bool)

(assert (=> b!492418 (= res!295177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9479))))

(declare-fun b!492419 () Bool)

(declare-fun res!295174 () Bool)

(declare-fun e!289266 () Bool)

(assert (=> b!492419 (=> (not res!295174) (not e!289266))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492419 (= res!295174 (and (= (size!15688 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15688 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15688 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492420 () Bool)

(assert (=> b!492420 (= e!289269 (not true))))

(declare-datatypes ((SeekEntryResult!3791 0))(
  ( (MissingZero!3791 (index!17343 (_ BitVec 32))) (Found!3791 (index!17344 (_ BitVec 32))) (Intermediate!3791 (undefined!4603 Bool) (index!17345 (_ BitVec 32)) (x!46431 (_ BitVec 32))) (Undefined!3791) (MissingVacant!3791 (index!17346 (_ BitVec 32))) )
))
(declare-fun lt!222609 () SeekEntryResult!3791)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!222612 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31876 (_ BitVec 32)) SeekEntryResult!3791)

(assert (=> b!492420 (= lt!222609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222612 (select (store (arr!15324 a!3235) i!1204 k!2280) j!176) (array!31877 (store (arr!15324 a!3235) i!1204 k!2280) (size!15688 a!3235)) mask!3524))))

(declare-fun lt!222610 () (_ BitVec 32))

(declare-fun lt!222613 () SeekEntryResult!3791)

(assert (=> b!492420 (= lt!222613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222610 (select (arr!15324 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492420 (= lt!222612 (toIndex!0 (select (store (arr!15324 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!492420 (= lt!222610 (toIndex!0 (select (arr!15324 a!3235) j!176) mask!3524))))

(declare-fun e!289267 () Bool)

(assert (=> b!492420 e!289267))

(declare-fun res!295172 () Bool)

(assert (=> b!492420 (=> (not res!295172) (not e!289267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31876 (_ BitVec 32)) Bool)

(assert (=> b!492420 (= res!295172 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14528 0))(
  ( (Unit!14529) )
))
(declare-fun lt!222608 () Unit!14528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14528)

(assert (=> b!492420 (= lt!222608 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492421 () Bool)

(declare-fun res!295170 () Bool)

(assert (=> b!492421 (=> (not res!295170) (not e!289266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492421 (= res!295170 (validKeyInArray!0 (select (arr!15324 a!3235) j!176)))))

(declare-fun b!492422 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31876 (_ BitVec 32)) SeekEntryResult!3791)

(assert (=> b!492422 (= e!289267 (= (seekEntryOrOpen!0 (select (arr!15324 a!3235) j!176) a!3235 mask!3524) (Found!3791 j!176)))))

(declare-fun b!492423 () Bool)

(declare-fun res!295178 () Bool)

(assert (=> b!492423 (=> (not res!295178) (not e!289266))))

(declare-fun arrayContainsKey!0 (array!31876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492423 (= res!295178 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295176 () Bool)

(assert (=> start!44874 (=> (not res!295176) (not e!289266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44874 (= res!295176 (validMask!0 mask!3524))))

(assert (=> start!44874 e!289266))

(assert (=> start!44874 true))

(declare-fun array_inv!11120 (array!31876) Bool)

(assert (=> start!44874 (array_inv!11120 a!3235)))

(declare-fun b!492417 () Bool)

(declare-fun res!295175 () Bool)

(assert (=> b!492417 (=> (not res!295175) (not e!289266))))

(assert (=> b!492417 (= res!295175 (validKeyInArray!0 k!2280))))

(declare-fun b!492424 () Bool)

(assert (=> b!492424 (= e!289266 e!289269)))

(declare-fun res!295171 () Bool)

(assert (=> b!492424 (=> (not res!295171) (not e!289269))))

(declare-fun lt!222611 () SeekEntryResult!3791)

(assert (=> b!492424 (= res!295171 (or (= lt!222611 (MissingZero!3791 i!1204)) (= lt!222611 (MissingVacant!3791 i!1204))))))

(assert (=> b!492424 (= lt!222611 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492425 () Bool)

(declare-fun res!295173 () Bool)

(assert (=> b!492425 (=> (not res!295173) (not e!289269))))

(assert (=> b!492425 (= res!295173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44874 res!295176) b!492419))

(assert (= (and b!492419 res!295174) b!492421))

(assert (= (and b!492421 res!295170) b!492417))

(assert (= (and b!492417 res!295175) b!492423))

(assert (= (and b!492423 res!295178) b!492424))

(assert (= (and b!492424 res!295171) b!492425))

(assert (= (and b!492425 res!295173) b!492418))

(assert (= (and b!492418 res!295177) b!492420))

(assert (= (and b!492420 res!295172) b!492422))

(declare-fun m!473139 () Bool)

(assert (=> start!44874 m!473139))

(declare-fun m!473141 () Bool)

(assert (=> start!44874 m!473141))

(declare-fun m!473143 () Bool)

(assert (=> b!492422 m!473143))

(assert (=> b!492422 m!473143))

(declare-fun m!473145 () Bool)

(assert (=> b!492422 m!473145))

(declare-fun m!473147 () Bool)

(assert (=> b!492425 m!473147))

(assert (=> b!492421 m!473143))

(assert (=> b!492421 m!473143))

(declare-fun m!473149 () Bool)

(assert (=> b!492421 m!473149))

(declare-fun m!473151 () Bool)

(assert (=> b!492417 m!473151))

(declare-fun m!473153 () Bool)

(assert (=> b!492418 m!473153))

(declare-fun m!473155 () Bool)

(assert (=> b!492420 m!473155))

(declare-fun m!473157 () Bool)

(assert (=> b!492420 m!473157))

(assert (=> b!492420 m!473143))

(declare-fun m!473159 () Bool)

(assert (=> b!492420 m!473159))

(assert (=> b!492420 m!473143))

(declare-fun m!473161 () Bool)

(assert (=> b!492420 m!473161))

(declare-fun m!473163 () Bool)

(assert (=> b!492420 m!473163))

(assert (=> b!492420 m!473157))

(declare-fun m!473165 () Bool)

(assert (=> b!492420 m!473165))

(assert (=> b!492420 m!473143))

(declare-fun m!473167 () Bool)

(assert (=> b!492420 m!473167))

(assert (=> b!492420 m!473157))

(declare-fun m!473169 () Bool)

(assert (=> b!492420 m!473169))

(declare-fun m!473171 () Bool)

(assert (=> b!492424 m!473171))

(declare-fun m!473173 () Bool)

(assert (=> b!492423 m!473173))

(push 1)

