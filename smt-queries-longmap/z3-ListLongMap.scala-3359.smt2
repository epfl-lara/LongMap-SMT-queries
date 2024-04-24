; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46196 () Bool)

(assert start!46196)

(declare-fun b!511519 () Bool)

(declare-fun res!312236 () Bool)

(declare-fun e!298882 () Bool)

(assert (=> b!511519 (=> (not res!312236) (not e!298882))))

(declare-datatypes ((array!32851 0))(
  ( (array!32852 (arr!15802 (Array (_ BitVec 32) (_ BitVec 64))) (size!16166 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32851)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32851 (_ BitVec 32)) Bool)

(assert (=> b!511519 (= res!312236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511520 () Bool)

(declare-fun res!312244 () Bool)

(declare-fun e!298881 () Bool)

(assert (=> b!511520 (=> (not res!312244) (not e!298881))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511520 (= res!312244 (validKeyInArray!0 k0!2280))))

(declare-fun b!511521 () Bool)

(declare-fun res!312243 () Bool)

(assert (=> b!511521 (=> (not res!312243) (not e!298881))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511521 (= res!312243 (and (= (size!16166 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16166 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16166 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511522 () Bool)

(assert (=> b!511522 (= e!298881 e!298882)))

(declare-fun res!312235 () Bool)

(assert (=> b!511522 (=> (not res!312235) (not e!298882))))

(declare-datatypes ((SeekEntryResult!4225 0))(
  ( (MissingZero!4225 (index!19088 (_ BitVec 32))) (Found!4225 (index!19089 (_ BitVec 32))) (Intermediate!4225 (undefined!5037 Bool) (index!19090 (_ BitVec 32)) (x!48189 (_ BitVec 32))) (Undefined!4225) (MissingVacant!4225 (index!19091 (_ BitVec 32))) )
))
(declare-fun lt!234079 () SeekEntryResult!4225)

(assert (=> b!511522 (= res!312235 (or (= lt!234079 (MissingZero!4225 i!1204)) (= lt!234079 (MissingVacant!4225 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32851 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!511522 (= lt!234079 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511523 () Bool)

(declare-fun e!298883 () Bool)

(assert (=> b!511523 (= e!298883 (bvsle #b00000000000000000000000000000000 (size!16166 a!3235)))))

(declare-fun lt!234082 () SeekEntryResult!4225)

(assert (=> b!511523 (= lt!234082 Undefined!4225)))

(declare-fun b!511524 () Bool)

(declare-fun res!312242 () Bool)

(assert (=> b!511524 (=> (not res!312242) (not e!298882))))

(declare-datatypes ((List!9867 0))(
  ( (Nil!9864) (Cons!9863 (h!10743 (_ BitVec 64)) (t!16087 List!9867)) )
))
(declare-fun arrayNoDuplicates!0 (array!32851 (_ BitVec 32) List!9867) Bool)

(assert (=> b!511524 (= res!312242 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9864))))

(declare-fun res!312239 () Bool)

(assert (=> start!46196 (=> (not res!312239) (not e!298881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46196 (= res!312239 (validMask!0 mask!3524))))

(assert (=> start!46196 e!298881))

(assert (=> start!46196 true))

(declare-fun array_inv!11661 (array!32851) Bool)

(assert (=> start!46196 (array_inv!11661 a!3235)))

(declare-fun b!511525 () Bool)

(assert (=> b!511525 (= e!298882 (not e!298883))))

(declare-fun res!312237 () Bool)

(assert (=> b!511525 (=> res!312237 e!298883)))

(declare-fun lt!234081 () SeekEntryResult!4225)

(declare-fun lt!234078 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32851 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!511525 (= res!312237 (= lt!234081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234078 (select (store (arr!15802 a!3235) i!1204 k0!2280) j!176) (array!32852 (store (arr!15802 a!3235) i!1204 k0!2280) (size!16166 a!3235)) mask!3524)))))

(declare-fun lt!234077 () (_ BitVec 32))

(assert (=> b!511525 (= lt!234081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234077 (select (arr!15802 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511525 (= lt!234078 (toIndex!0 (select (store (arr!15802 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511525 (= lt!234077 (toIndex!0 (select (arr!15802 a!3235) j!176) mask!3524))))

(assert (=> b!511525 (= lt!234082 (Found!4225 j!176))))

(assert (=> b!511525 (= lt!234082 (seekEntryOrOpen!0 (select (arr!15802 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511525 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15769 0))(
  ( (Unit!15770) )
))
(declare-fun lt!234080 () Unit!15769)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15769)

(assert (=> b!511525 (= lt!234080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511526 () Bool)

(declare-fun res!312241 () Bool)

(assert (=> b!511526 (=> res!312241 e!298883)))

(get-info :version)

(assert (=> b!511526 (= res!312241 (or (not ((_ is Intermediate!4225) lt!234081)) (not (undefined!5037 lt!234081))))))

(declare-fun b!511527 () Bool)

(declare-fun res!312238 () Bool)

(assert (=> b!511527 (=> (not res!312238) (not e!298881))))

(declare-fun arrayContainsKey!0 (array!32851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511527 (= res!312238 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511528 () Bool)

(declare-fun res!312240 () Bool)

(assert (=> b!511528 (=> (not res!312240) (not e!298881))))

(assert (=> b!511528 (= res!312240 (validKeyInArray!0 (select (arr!15802 a!3235) j!176)))))

(assert (= (and start!46196 res!312239) b!511521))

(assert (= (and b!511521 res!312243) b!511528))

(assert (= (and b!511528 res!312240) b!511520))

(assert (= (and b!511520 res!312244) b!511527))

(assert (= (and b!511527 res!312238) b!511522))

(assert (= (and b!511522 res!312235) b!511519))

(assert (= (and b!511519 res!312236) b!511524))

(assert (= (and b!511524 res!312242) b!511525))

(assert (= (and b!511525 (not res!312237)) b!511526))

(assert (= (and b!511526 (not res!312241)) b!511523))

(declare-fun m!493249 () Bool)

(assert (=> b!511519 m!493249))

(declare-fun m!493251 () Bool)

(assert (=> b!511525 m!493251))

(declare-fun m!493253 () Bool)

(assert (=> b!511525 m!493253))

(declare-fun m!493255 () Bool)

(assert (=> b!511525 m!493255))

(declare-fun m!493257 () Bool)

(assert (=> b!511525 m!493257))

(declare-fun m!493259 () Bool)

(assert (=> b!511525 m!493259))

(assert (=> b!511525 m!493257))

(declare-fun m!493261 () Bool)

(assert (=> b!511525 m!493261))

(assert (=> b!511525 m!493255))

(declare-fun m!493263 () Bool)

(assert (=> b!511525 m!493263))

(assert (=> b!511525 m!493255))

(declare-fun m!493265 () Bool)

(assert (=> b!511525 m!493265))

(assert (=> b!511525 m!493257))

(declare-fun m!493267 () Bool)

(assert (=> b!511525 m!493267))

(assert (=> b!511525 m!493257))

(declare-fun m!493269 () Bool)

(assert (=> b!511525 m!493269))

(declare-fun m!493271 () Bool)

(assert (=> b!511524 m!493271))

(declare-fun m!493273 () Bool)

(assert (=> b!511520 m!493273))

(declare-fun m!493275 () Bool)

(assert (=> b!511527 m!493275))

(assert (=> b!511528 m!493257))

(assert (=> b!511528 m!493257))

(declare-fun m!493277 () Bool)

(assert (=> b!511528 m!493277))

(declare-fun m!493279 () Bool)

(assert (=> b!511522 m!493279))

(declare-fun m!493281 () Bool)

(assert (=> start!46196 m!493281))

(declare-fun m!493283 () Bool)

(assert (=> start!46196 m!493283))

(check-sat (not start!46196) (not b!511519) (not b!511522) (not b!511520) (not b!511527) (not b!511525) (not b!511524) (not b!511528))
(check-sat)
