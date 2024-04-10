; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44876 () Bool)

(assert start!44876)

(declare-fun b!492444 () Bool)

(declare-fun res!295204 () Bool)

(declare-fun e!289279 () Bool)

(assert (=> b!492444 (=> (not res!295204) (not e!289279))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492444 (= res!295204 (validKeyInArray!0 k0!2280))))

(declare-fun b!492445 () Bool)

(declare-fun e!289280 () Bool)

(assert (=> b!492445 (= e!289279 e!289280)))

(declare-fun res!295198 () Bool)

(assert (=> b!492445 (=> (not res!295198) (not e!289280))))

(declare-datatypes ((SeekEntryResult!3792 0))(
  ( (MissingZero!3792 (index!17347 (_ BitVec 32))) (Found!3792 (index!17348 (_ BitVec 32))) (Intermediate!3792 (undefined!4604 Bool) (index!17349 (_ BitVec 32)) (x!46432 (_ BitVec 32))) (Undefined!3792) (MissingVacant!3792 (index!17350 (_ BitVec 32))) )
))
(declare-fun lt!222626 () SeekEntryResult!3792)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492445 (= res!295198 (or (= lt!222626 (MissingZero!3792 i!1204)) (= lt!222626 (MissingVacant!3792 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31878 0))(
  ( (array!31879 (arr!15325 (Array (_ BitVec 32) (_ BitVec 64))) (size!15689 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31878)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31878 (_ BitVec 32)) SeekEntryResult!3792)

(assert (=> b!492445 (= lt!222626 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!295202 () Bool)

(assert (=> start!44876 (=> (not res!295202) (not e!289279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44876 (= res!295202 (validMask!0 mask!3524))))

(assert (=> start!44876 e!289279))

(assert (=> start!44876 true))

(declare-fun array_inv!11121 (array!31878) Bool)

(assert (=> start!44876 (array_inv!11121 a!3235)))

(declare-fun b!492446 () Bool)

(declare-fun res!295203 () Bool)

(assert (=> b!492446 (=> (not res!295203) (not e!289279))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492446 (= res!295203 (and (= (size!15689 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15689 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15689 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492447 () Bool)

(declare-fun res!295197 () Bool)

(assert (=> b!492447 (=> (not res!295197) (not e!289279))))

(declare-fun arrayContainsKey!0 (array!31878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492447 (= res!295197 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!289278 () Bool)

(declare-fun b!492448 () Bool)

(assert (=> b!492448 (= e!289278 (= (seekEntryOrOpen!0 (select (arr!15325 a!3235) j!176) a!3235 mask!3524) (Found!3792 j!176)))))

(declare-fun b!492449 () Bool)

(declare-fun res!295205 () Bool)

(assert (=> b!492449 (=> (not res!295205) (not e!289280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31878 (_ BitVec 32)) Bool)

(assert (=> b!492449 (= res!295205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492450 () Bool)

(declare-fun res!295201 () Bool)

(assert (=> b!492450 (=> (not res!295201) (not e!289279))))

(assert (=> b!492450 (= res!295201 (validKeyInArray!0 (select (arr!15325 a!3235) j!176)))))

(declare-fun b!492451 () Bool)

(assert (=> b!492451 (= e!289280 (not true))))

(declare-fun lt!222627 () SeekEntryResult!3792)

(declare-fun lt!222631 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31878 (_ BitVec 32)) SeekEntryResult!3792)

(assert (=> b!492451 (= lt!222627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222631 (select (store (arr!15325 a!3235) i!1204 k0!2280) j!176) (array!31879 (store (arr!15325 a!3235) i!1204 k0!2280) (size!15689 a!3235)) mask!3524))))

(declare-fun lt!222630 () SeekEntryResult!3792)

(declare-fun lt!222629 () (_ BitVec 32))

(assert (=> b!492451 (= lt!222630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222629 (select (arr!15325 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492451 (= lt!222631 (toIndex!0 (select (store (arr!15325 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492451 (= lt!222629 (toIndex!0 (select (arr!15325 a!3235) j!176) mask!3524))))

(assert (=> b!492451 e!289278))

(declare-fun res!295200 () Bool)

(assert (=> b!492451 (=> (not res!295200) (not e!289278))))

(assert (=> b!492451 (= res!295200 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14530 0))(
  ( (Unit!14531) )
))
(declare-fun lt!222628 () Unit!14530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14530)

(assert (=> b!492451 (= lt!222628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492452 () Bool)

(declare-fun res!295199 () Bool)

(assert (=> b!492452 (=> (not res!295199) (not e!289280))))

(declare-datatypes ((List!9483 0))(
  ( (Nil!9480) (Cons!9479 (h!10344 (_ BitVec 64)) (t!15711 List!9483)) )
))
(declare-fun arrayNoDuplicates!0 (array!31878 (_ BitVec 32) List!9483) Bool)

(assert (=> b!492452 (= res!295199 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9480))))

(assert (= (and start!44876 res!295202) b!492446))

(assert (= (and b!492446 res!295203) b!492450))

(assert (= (and b!492450 res!295201) b!492444))

(assert (= (and b!492444 res!295204) b!492447))

(assert (= (and b!492447 res!295197) b!492445))

(assert (= (and b!492445 res!295198) b!492449))

(assert (= (and b!492449 res!295205) b!492452))

(assert (= (and b!492452 res!295199) b!492451))

(assert (= (and b!492451 res!295200) b!492448))

(declare-fun m!473175 () Bool)

(assert (=> b!492448 m!473175))

(assert (=> b!492448 m!473175))

(declare-fun m!473177 () Bool)

(assert (=> b!492448 m!473177))

(declare-fun m!473179 () Bool)

(assert (=> start!44876 m!473179))

(declare-fun m!473181 () Bool)

(assert (=> start!44876 m!473181))

(declare-fun m!473183 () Bool)

(assert (=> b!492449 m!473183))

(declare-fun m!473185 () Bool)

(assert (=> b!492451 m!473185))

(declare-fun m!473187 () Bool)

(assert (=> b!492451 m!473187))

(declare-fun m!473189 () Bool)

(assert (=> b!492451 m!473189))

(declare-fun m!473191 () Bool)

(assert (=> b!492451 m!473191))

(assert (=> b!492451 m!473185))

(assert (=> b!492451 m!473175))

(declare-fun m!473193 () Bool)

(assert (=> b!492451 m!473193))

(assert (=> b!492451 m!473175))

(declare-fun m!473195 () Bool)

(assert (=> b!492451 m!473195))

(assert (=> b!492451 m!473175))

(declare-fun m!473197 () Bool)

(assert (=> b!492451 m!473197))

(assert (=> b!492451 m!473185))

(declare-fun m!473199 () Bool)

(assert (=> b!492451 m!473199))

(declare-fun m!473201 () Bool)

(assert (=> b!492452 m!473201))

(assert (=> b!492450 m!473175))

(assert (=> b!492450 m!473175))

(declare-fun m!473203 () Bool)

(assert (=> b!492450 m!473203))

(declare-fun m!473205 () Bool)

(assert (=> b!492444 m!473205))

(declare-fun m!473207 () Bool)

(assert (=> b!492445 m!473207))

(declare-fun m!473209 () Bool)

(assert (=> b!492447 m!473209))

(check-sat (not b!492448) (not b!492449) (not b!492451) (not start!44876) (not b!492447) (not b!492445) (not b!492450) (not b!492452) (not b!492444))
(check-sat)
