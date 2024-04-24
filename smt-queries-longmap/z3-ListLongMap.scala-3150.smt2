; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44360 () Bool)

(assert start!44360)

(declare-fun b!487574 () Bool)

(declare-fun res!290902 () Bool)

(declare-fun e!286881 () Bool)

(assert (=> b!487574 (=> (not res!290902) (not e!286881))))

(declare-datatypes ((array!31567 0))(
  ( (array!31568 (arr!15175 (Array (_ BitVec 32) (_ BitVec 64))) (size!15539 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31567)

(declare-datatypes ((List!9240 0))(
  ( (Nil!9237) (Cons!9236 (h!10092 (_ BitVec 64)) (t!15460 List!9240)) )
))
(declare-fun arrayNoDuplicates!0 (array!31567 (_ BitVec 32) List!9240) Bool)

(assert (=> b!487574 (= res!290902 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9237))))

(declare-fun b!487575 () Bool)

(declare-fun res!290904 () Bool)

(declare-fun e!286882 () Bool)

(assert (=> b!487575 (=> (not res!290904) (not e!286882))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487575 (= res!290904 (and (= (size!15539 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15539 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15539 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487576 () Bool)

(declare-fun res!290907 () Bool)

(assert (=> b!487576 (=> (not res!290907) (not e!286882))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487576 (= res!290907 (validKeyInArray!0 k0!2280))))

(declare-fun b!487577 () Bool)

(declare-fun res!290903 () Bool)

(assert (=> b!487577 (=> (not res!290903) (not e!286882))))

(assert (=> b!487577 (= res!290903 (validKeyInArray!0 (select (arr!15175 a!3235) j!176)))))

(declare-fun b!487578 () Bool)

(assert (=> b!487578 (= e!286881 (not true))))

(declare-fun lt!220119 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487578 (= lt!220119 (toIndex!0 (select (arr!15175 a!3235) j!176) mask!3524))))

(declare-fun e!286883 () Bool)

(assert (=> b!487578 e!286883))

(declare-fun res!290905 () Bool)

(assert (=> b!487578 (=> (not res!290905) (not e!286883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31567 (_ BitVec 32)) Bool)

(assert (=> b!487578 (= res!290905 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14203 0))(
  ( (Unit!14204) )
))
(declare-fun lt!220118 () Unit!14203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14203)

(assert (=> b!487578 (= lt!220118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487579 () Bool)

(declare-fun res!290900 () Bool)

(assert (=> b!487579 (=> (not res!290900) (not e!286882))))

(declare-fun arrayContainsKey!0 (array!31567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487579 (= res!290900 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290906 () Bool)

(assert (=> start!44360 (=> (not res!290906) (not e!286882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44360 (= res!290906 (validMask!0 mask!3524))))

(assert (=> start!44360 e!286882))

(assert (=> start!44360 true))

(declare-fun array_inv!11034 (array!31567) Bool)

(assert (=> start!44360 (array_inv!11034 a!3235)))

(declare-fun b!487580 () Bool)

(declare-datatypes ((SeekEntryResult!3598 0))(
  ( (MissingZero!3598 (index!16571 (_ BitVec 32))) (Found!3598 (index!16572 (_ BitVec 32))) (Intermediate!3598 (undefined!4410 Bool) (index!16573 (_ BitVec 32)) (x!45839 (_ BitVec 32))) (Undefined!3598) (MissingVacant!3598 (index!16574 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31567 (_ BitVec 32)) SeekEntryResult!3598)

(assert (=> b!487580 (= e!286883 (= (seekEntryOrOpen!0 (select (arr!15175 a!3235) j!176) a!3235 mask!3524) (Found!3598 j!176)))))

(declare-fun b!487581 () Bool)

(declare-fun res!290908 () Bool)

(assert (=> b!487581 (=> (not res!290908) (not e!286881))))

(assert (=> b!487581 (= res!290908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487582 () Bool)

(assert (=> b!487582 (= e!286882 e!286881)))

(declare-fun res!290901 () Bool)

(assert (=> b!487582 (=> (not res!290901) (not e!286881))))

(declare-fun lt!220120 () SeekEntryResult!3598)

(assert (=> b!487582 (= res!290901 (or (= lt!220120 (MissingZero!3598 i!1204)) (= lt!220120 (MissingVacant!3598 i!1204))))))

(assert (=> b!487582 (= lt!220120 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44360 res!290906) b!487575))

(assert (= (and b!487575 res!290904) b!487577))

(assert (= (and b!487577 res!290903) b!487576))

(assert (= (and b!487576 res!290907) b!487579))

(assert (= (and b!487579 res!290900) b!487582))

(assert (= (and b!487582 res!290901) b!487581))

(assert (= (and b!487581 res!290908) b!487574))

(assert (= (and b!487574 res!290902) b!487578))

(assert (= (and b!487578 res!290905) b!487580))

(declare-fun m!467611 () Bool)

(assert (=> b!487574 m!467611))

(declare-fun m!467613 () Bool)

(assert (=> b!487576 m!467613))

(declare-fun m!467615 () Bool)

(assert (=> b!487578 m!467615))

(assert (=> b!487578 m!467615))

(declare-fun m!467617 () Bool)

(assert (=> b!487578 m!467617))

(declare-fun m!467619 () Bool)

(assert (=> b!487578 m!467619))

(declare-fun m!467621 () Bool)

(assert (=> b!487578 m!467621))

(assert (=> b!487577 m!467615))

(assert (=> b!487577 m!467615))

(declare-fun m!467623 () Bool)

(assert (=> b!487577 m!467623))

(declare-fun m!467625 () Bool)

(assert (=> b!487579 m!467625))

(declare-fun m!467627 () Bool)

(assert (=> b!487581 m!467627))

(declare-fun m!467629 () Bool)

(assert (=> b!487582 m!467629))

(declare-fun m!467631 () Bool)

(assert (=> start!44360 m!467631))

(declare-fun m!467633 () Bool)

(assert (=> start!44360 m!467633))

(assert (=> b!487580 m!467615))

(assert (=> b!487580 m!467615))

(declare-fun m!467635 () Bool)

(assert (=> b!487580 m!467635))

(check-sat (not start!44360) (not b!487574) (not b!487576) (not b!487578) (not b!487577) (not b!487580) (not b!487582) (not b!487581) (not b!487579))
(check-sat)
