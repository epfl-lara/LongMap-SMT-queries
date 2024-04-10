; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46080 () Bool)

(assert start!46080)

(declare-fun b!510378 () Bool)

(declare-fun e!298339 () Bool)

(declare-fun e!298340 () Bool)

(assert (=> b!510378 (= e!298339 e!298340)))

(declare-fun res!311231 () Bool)

(assert (=> b!510378 (=> (not res!311231) (not e!298340))))

(declare-datatypes ((SeekEntryResult!4241 0))(
  ( (MissingZero!4241 (index!19152 (_ BitVec 32))) (Found!4241 (index!19153 (_ BitVec 32))) (Intermediate!4241 (undefined!5053 Bool) (index!19154 (_ BitVec 32)) (x!48114 (_ BitVec 32))) (Undefined!4241) (MissingVacant!4241 (index!19155 (_ BitVec 32))) )
))
(declare-fun lt!233346 () SeekEntryResult!4241)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510378 (= res!311231 (or (= lt!233346 (MissingZero!4241 i!1204)) (= lt!233346 (MissingVacant!4241 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32791 0))(
  ( (array!32792 (arr!15774 (Array (_ BitVec 32) (_ BitVec 64))) (size!16138 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32791)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32791 (_ BitVec 32)) SeekEntryResult!4241)

(assert (=> b!510378 (= lt!233346 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510379 () Bool)

(declare-fun e!298338 () Bool)

(assert (=> b!510379 (= e!298340 (not e!298338))))

(declare-fun res!311230 () Bool)

(assert (=> b!510379 (=> res!311230 e!298338)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233344 () array!32791)

(declare-fun lt!233347 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32791 (_ BitVec 32)) SeekEntryResult!4241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510379 (= res!311230 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15774 a!3235) j!176) mask!3524) (select (arr!15774 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233347 mask!3524) lt!233347 lt!233344 mask!3524))))))

(assert (=> b!510379 (= lt!233347 (select (store (arr!15774 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510379 (= lt!233344 (array!32792 (store (arr!15774 a!3235) i!1204 k!2280) (size!16138 a!3235)))))

(declare-fun lt!233342 () SeekEntryResult!4241)

(assert (=> b!510379 (= lt!233342 (Found!4241 j!176))))

(assert (=> b!510379 (= lt!233342 (seekEntryOrOpen!0 (select (arr!15774 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32791 (_ BitVec 32)) Bool)

(assert (=> b!510379 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15740 0))(
  ( (Unit!15741) )
))
(declare-fun lt!233343 () Unit!15740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15740)

(assert (=> b!510379 (= lt!233343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!311223 () Bool)

(assert (=> start!46080 (=> (not res!311223) (not e!298339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46080 (= res!311223 (validMask!0 mask!3524))))

(assert (=> start!46080 e!298339))

(assert (=> start!46080 true))

(declare-fun array_inv!11570 (array!32791) Bool)

(assert (=> start!46080 (array_inv!11570 a!3235)))

(declare-fun b!510380 () Bool)

(assert (=> b!510380 (= e!298338 true)))

(assert (=> b!510380 (= lt!233342 (seekEntryOrOpen!0 lt!233347 lt!233344 mask!3524))))

(declare-fun lt!233345 () Unit!15740)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32791 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15740)

(assert (=> b!510380 (= lt!233345 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510381 () Bool)

(declare-fun res!311229 () Bool)

(assert (=> b!510381 (=> (not res!311229) (not e!298340))))

(declare-datatypes ((List!9932 0))(
  ( (Nil!9929) (Cons!9928 (h!10805 (_ BitVec 64)) (t!16160 List!9932)) )
))
(declare-fun arrayNoDuplicates!0 (array!32791 (_ BitVec 32) List!9932) Bool)

(assert (=> b!510381 (= res!311229 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9929))))

(declare-fun b!510382 () Bool)

(declare-fun res!311228 () Bool)

(assert (=> b!510382 (=> (not res!311228) (not e!298339))))

(declare-fun arrayContainsKey!0 (array!32791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510382 (= res!311228 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510383 () Bool)

(declare-fun res!311226 () Bool)

(assert (=> b!510383 (=> (not res!311226) (not e!298340))))

(assert (=> b!510383 (= res!311226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510384 () Bool)

(declare-fun res!311225 () Bool)

(assert (=> b!510384 (=> (not res!311225) (not e!298339))))

(assert (=> b!510384 (= res!311225 (and (= (size!16138 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16138 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16138 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510385 () Bool)

(declare-fun res!311224 () Bool)

(assert (=> b!510385 (=> (not res!311224) (not e!298339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510385 (= res!311224 (validKeyInArray!0 (select (arr!15774 a!3235) j!176)))))

(declare-fun b!510386 () Bool)

(declare-fun res!311227 () Bool)

(assert (=> b!510386 (=> (not res!311227) (not e!298339))))

(assert (=> b!510386 (= res!311227 (validKeyInArray!0 k!2280))))

(assert (= (and start!46080 res!311223) b!510384))

(assert (= (and b!510384 res!311225) b!510385))

(assert (= (and b!510385 res!311224) b!510386))

(assert (= (and b!510386 res!311227) b!510382))

(assert (= (and b!510382 res!311228) b!510378))

(assert (= (and b!510378 res!311231) b!510383))

(assert (= (and b!510383 res!311226) b!510381))

(assert (= (and b!510381 res!311229) b!510379))

(assert (= (and b!510379 (not res!311230)) b!510380))

(declare-fun m!491613 () Bool)

(assert (=> b!510380 m!491613))

(declare-fun m!491615 () Bool)

(assert (=> b!510380 m!491615))

(declare-fun m!491617 () Bool)

(assert (=> start!46080 m!491617))

(declare-fun m!491619 () Bool)

(assert (=> start!46080 m!491619))

(declare-fun m!491621 () Bool)

(assert (=> b!510382 m!491621))

(declare-fun m!491623 () Bool)

(assert (=> b!510381 m!491623))

(declare-fun m!491625 () Bool)

(assert (=> b!510379 m!491625))

(declare-fun m!491627 () Bool)

(assert (=> b!510379 m!491627))

(declare-fun m!491629 () Bool)

(assert (=> b!510379 m!491629))

(declare-fun m!491631 () Bool)

(assert (=> b!510379 m!491631))

(declare-fun m!491633 () Bool)

(assert (=> b!510379 m!491633))

(declare-fun m!491635 () Bool)

(assert (=> b!510379 m!491635))

(assert (=> b!510379 m!491631))

(declare-fun m!491637 () Bool)

(assert (=> b!510379 m!491637))

(assert (=> b!510379 m!491633))

(assert (=> b!510379 m!491631))

(declare-fun m!491639 () Bool)

(assert (=> b!510379 m!491639))

(declare-fun m!491641 () Bool)

(assert (=> b!510379 m!491641))

(assert (=> b!510379 m!491641))

(declare-fun m!491643 () Bool)

(assert (=> b!510379 m!491643))

(assert (=> b!510379 m!491631))

(assert (=> b!510385 m!491631))

(assert (=> b!510385 m!491631))

(declare-fun m!491645 () Bool)

(assert (=> b!510385 m!491645))

(declare-fun m!491647 () Bool)

(assert (=> b!510378 m!491647))

(declare-fun m!491649 () Bool)

(assert (=> b!510383 m!491649))

(declare-fun m!491651 () Bool)

(assert (=> b!510386 m!491651))

(push 1)

