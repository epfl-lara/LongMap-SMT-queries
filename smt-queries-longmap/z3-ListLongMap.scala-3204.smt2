; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44960 () Bool)

(assert start!44960)

(declare-fun b!493151 () Bool)

(declare-fun res!295781 () Bool)

(declare-fun e!289649 () Bool)

(assert (=> b!493151 (=> (not res!295781) (not e!289649))))

(declare-datatypes ((array!31906 0))(
  ( (array!31907 (arr!15337 (Array (_ BitVec 32) (_ BitVec 64))) (size!15701 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31906)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31906 (_ BitVec 32)) Bool)

(assert (=> b!493151 (= res!295781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!289648 () Bool)

(declare-fun b!493152 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3760 0))(
  ( (MissingZero!3760 (index!17219 (_ BitVec 32))) (Found!3760 (index!17220 (_ BitVec 32))) (Intermediate!3760 (undefined!4572 Bool) (index!17221 (_ BitVec 32)) (x!46451 (_ BitVec 32))) (Undefined!3760) (MissingVacant!3760 (index!17222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31906 (_ BitVec 32)) SeekEntryResult!3760)

(assert (=> b!493152 (= e!289648 (= (seekEntryOrOpen!0 (select (arr!15337 a!3235) j!176) a!3235 mask!3524) (Found!3760 j!176)))))

(declare-fun res!295777 () Bool)

(declare-fun e!289647 () Bool)

(assert (=> start!44960 (=> (not res!295777) (not e!289647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44960 (= res!295777 (validMask!0 mask!3524))))

(assert (=> start!44960 e!289647))

(assert (=> start!44960 true))

(declare-fun array_inv!11196 (array!31906) Bool)

(assert (=> start!44960 (array_inv!11196 a!3235)))

(declare-fun b!493153 () Bool)

(declare-fun res!295778 () Bool)

(assert (=> b!493153 (=> (not res!295778) (not e!289647))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493153 (= res!295778 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493154 () Bool)

(declare-fun res!295783 () Bool)

(assert (=> b!493154 (=> (not res!295783) (not e!289647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493154 (= res!295783 (validKeyInArray!0 (select (arr!15337 a!3235) j!176)))))

(declare-fun b!493155 () Bool)

(declare-fun res!295775 () Bool)

(assert (=> b!493155 (=> (not res!295775) (not e!289647))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493155 (= res!295775 (and (= (size!15701 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15701 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15701 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493156 () Bool)

(declare-fun res!295780 () Bool)

(assert (=> b!493156 (=> (not res!295780) (not e!289647))))

(assert (=> b!493156 (= res!295780 (validKeyInArray!0 k0!2280))))

(declare-fun b!493157 () Bool)

(assert (=> b!493157 (= e!289649 (not true))))

(declare-fun lt!223038 () (_ BitVec 32))

(declare-fun lt!223041 () SeekEntryResult!3760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31906 (_ BitVec 32)) SeekEntryResult!3760)

(assert (=> b!493157 (= lt!223041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223038 (select (store (arr!15337 a!3235) i!1204 k0!2280) j!176) (array!31907 (store (arr!15337 a!3235) i!1204 k0!2280) (size!15701 a!3235)) mask!3524))))

(declare-fun lt!223040 () SeekEntryResult!3760)

(declare-fun lt!223039 () (_ BitVec 32))

(assert (=> b!493157 (= lt!223040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223039 (select (arr!15337 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493157 (= lt!223038 (toIndex!0 (select (store (arr!15337 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493157 (= lt!223039 (toIndex!0 (select (arr!15337 a!3235) j!176) mask!3524))))

(assert (=> b!493157 e!289648))

(declare-fun res!295776 () Bool)

(assert (=> b!493157 (=> (not res!295776) (not e!289648))))

(assert (=> b!493157 (= res!295776 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14527 0))(
  ( (Unit!14528) )
))
(declare-fun lt!223042 () Unit!14527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14527)

(assert (=> b!493157 (= lt!223042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493158 () Bool)

(declare-fun res!295782 () Bool)

(assert (=> b!493158 (=> (not res!295782) (not e!289649))))

(declare-datatypes ((List!9402 0))(
  ( (Nil!9399) (Cons!9398 (h!10266 (_ BitVec 64)) (t!15622 List!9402)) )
))
(declare-fun arrayNoDuplicates!0 (array!31906 (_ BitVec 32) List!9402) Bool)

(assert (=> b!493158 (= res!295782 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9399))))

(declare-fun b!493159 () Bool)

(assert (=> b!493159 (= e!289647 e!289649)))

(declare-fun res!295779 () Bool)

(assert (=> b!493159 (=> (not res!295779) (not e!289649))))

(declare-fun lt!223037 () SeekEntryResult!3760)

(assert (=> b!493159 (= res!295779 (or (= lt!223037 (MissingZero!3760 i!1204)) (= lt!223037 (MissingVacant!3760 i!1204))))))

(assert (=> b!493159 (= lt!223037 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44960 res!295777) b!493155))

(assert (= (and b!493155 res!295775) b!493154))

(assert (= (and b!493154 res!295783) b!493156))

(assert (= (and b!493156 res!295780) b!493153))

(assert (= (and b!493153 res!295778) b!493159))

(assert (= (and b!493159 res!295779) b!493151))

(assert (= (and b!493151 res!295781) b!493158))

(assert (= (and b!493158 res!295782) b!493157))

(assert (= (and b!493157 res!295776) b!493152))

(declare-fun m!474175 () Bool)

(assert (=> start!44960 m!474175))

(declare-fun m!474177 () Bool)

(assert (=> start!44960 m!474177))

(declare-fun m!474179 () Bool)

(assert (=> b!493153 m!474179))

(declare-fun m!474181 () Bool)

(assert (=> b!493154 m!474181))

(assert (=> b!493154 m!474181))

(declare-fun m!474183 () Bool)

(assert (=> b!493154 m!474183))

(declare-fun m!474185 () Bool)

(assert (=> b!493151 m!474185))

(declare-fun m!474187 () Bool)

(assert (=> b!493156 m!474187))

(declare-fun m!474189 () Bool)

(assert (=> b!493158 m!474189))

(declare-fun m!474191 () Bool)

(assert (=> b!493157 m!474191))

(declare-fun m!474193 () Bool)

(assert (=> b!493157 m!474193))

(declare-fun m!474195 () Bool)

(assert (=> b!493157 m!474195))

(declare-fun m!474197 () Bool)

(assert (=> b!493157 m!474197))

(assert (=> b!493157 m!474193))

(assert (=> b!493157 m!474181))

(declare-fun m!474199 () Bool)

(assert (=> b!493157 m!474199))

(assert (=> b!493157 m!474181))

(declare-fun m!474201 () Bool)

(assert (=> b!493157 m!474201))

(assert (=> b!493157 m!474181))

(declare-fun m!474203 () Bool)

(assert (=> b!493157 m!474203))

(assert (=> b!493157 m!474193))

(declare-fun m!474205 () Bool)

(assert (=> b!493157 m!474205))

(declare-fun m!474207 () Bool)

(assert (=> b!493159 m!474207))

(assert (=> b!493152 m!474181))

(assert (=> b!493152 m!474181))

(declare-fun m!474209 () Bool)

(assert (=> b!493152 m!474209))

(check-sat (not b!493158) (not b!493153) (not b!493152) (not b!493157) (not b!493151) (not start!44960) (not b!493156) (not b!493154) (not b!493159))
(check-sat)
