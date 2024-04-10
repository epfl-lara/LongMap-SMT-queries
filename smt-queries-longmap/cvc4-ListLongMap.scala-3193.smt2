; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44788 () Bool)

(assert start!44788)

(declare-fun b!491747 () Bool)

(declare-fun res!294692 () Bool)

(declare-fun e!288899 () Bool)

(assert (=> b!491747 (=> (not res!294692) (not e!288899))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31847 0))(
  ( (array!31848 (arr!15311 (Array (_ BitVec 32) (_ BitVec 64))) (size!15675 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31847)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491747 (= res!294692 (and (= (size!15675 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15675 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15675 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491748 () Bool)

(declare-fun res!294685 () Bool)

(assert (=> b!491748 (=> (not res!294685) (not e!288899))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491748 (= res!294685 (validKeyInArray!0 k!2280))))

(declare-fun b!491750 () Bool)

(declare-fun res!294691 () Bool)

(assert (=> b!491750 (=> (not res!294691) (not e!288899))))

(declare-fun arrayContainsKey!0 (array!31847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491750 (= res!294691 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491751 () Bool)

(declare-fun e!288900 () Bool)

(declare-fun e!288897 () Bool)

(assert (=> b!491751 (= e!288900 (not e!288897))))

(declare-fun res!294687 () Bool)

(assert (=> b!491751 (=> res!294687 e!288897)))

(declare-fun lt!222356 () (_ BitVec 64))

(declare-fun lt!222357 () array!31847)

(declare-datatypes ((SeekEntryResult!3778 0))(
  ( (MissingZero!3778 (index!17291 (_ BitVec 32))) (Found!3778 (index!17292 (_ BitVec 32))) (Intermediate!3778 (undefined!4590 Bool) (index!17293 (_ BitVec 32)) (x!46372 (_ BitVec 32))) (Undefined!3778) (MissingVacant!3778 (index!17294 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31847 (_ BitVec 32)) SeekEntryResult!3778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491751 (= res!294687 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15311 a!3235) j!176) mask!3524) (select (arr!15311 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222356 mask!3524) lt!222356 lt!222357 mask!3524))))))

(assert (=> b!491751 (= lt!222356 (select (store (arr!15311 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491751 (= lt!222357 (array!31848 (store (arr!15311 a!3235) i!1204 k!2280) (size!15675 a!3235)))))

(declare-fun lt!222358 () SeekEntryResult!3778)

(assert (=> b!491751 (= lt!222358 (Found!3778 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31847 (_ BitVec 32)) SeekEntryResult!3778)

(assert (=> b!491751 (= lt!222358 (seekEntryOrOpen!0 (select (arr!15311 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31847 (_ BitVec 32)) Bool)

(assert (=> b!491751 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14502 0))(
  ( (Unit!14503) )
))
(declare-fun lt!222353 () Unit!14502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14502)

(assert (=> b!491751 (= lt!222353 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491752 () Bool)

(declare-fun e!288898 () Bool)

(assert (=> b!491752 (= e!288897 e!288898)))

(declare-fun res!294690 () Bool)

(assert (=> b!491752 (=> res!294690 e!288898)))

(assert (=> b!491752 (= res!294690 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491752 (= lt!222358 (seekEntryOrOpen!0 lt!222356 lt!222357 mask!3524))))

(declare-fun lt!222354 () Unit!14502)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14502)

(assert (=> b!491752 (= lt!222354 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491753 () Bool)

(declare-fun res!294688 () Bool)

(assert (=> b!491753 (=> (not res!294688) (not e!288900))))

(declare-datatypes ((List!9469 0))(
  ( (Nil!9466) (Cons!9465 (h!10327 (_ BitVec 64)) (t!15697 List!9469)) )
))
(declare-fun arrayNoDuplicates!0 (array!31847 (_ BitVec 32) List!9469) Bool)

(assert (=> b!491753 (= res!294688 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9466))))

(declare-fun b!491754 () Bool)

(assert (=> b!491754 (= e!288898 (validKeyInArray!0 lt!222356))))

(declare-fun res!294686 () Bool)

(assert (=> start!44788 (=> (not res!294686) (not e!288899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44788 (= res!294686 (validMask!0 mask!3524))))

(assert (=> start!44788 e!288899))

(assert (=> start!44788 true))

(declare-fun array_inv!11107 (array!31847) Bool)

(assert (=> start!44788 (array_inv!11107 a!3235)))

(declare-fun b!491749 () Bool)

(assert (=> b!491749 (= e!288899 e!288900)))

(declare-fun res!294683 () Bool)

(assert (=> b!491749 (=> (not res!294683) (not e!288900))))

(declare-fun lt!222355 () SeekEntryResult!3778)

(assert (=> b!491749 (= res!294683 (or (= lt!222355 (MissingZero!3778 i!1204)) (= lt!222355 (MissingVacant!3778 i!1204))))))

(assert (=> b!491749 (= lt!222355 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491755 () Bool)

(declare-fun res!294684 () Bool)

(assert (=> b!491755 (=> (not res!294684) (not e!288900))))

(assert (=> b!491755 (= res!294684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491756 () Bool)

(declare-fun res!294689 () Bool)

(assert (=> b!491756 (=> (not res!294689) (not e!288899))))

(assert (=> b!491756 (= res!294689 (validKeyInArray!0 (select (arr!15311 a!3235) j!176)))))

(assert (= (and start!44788 res!294686) b!491747))

(assert (= (and b!491747 res!294692) b!491756))

(assert (= (and b!491756 res!294689) b!491748))

(assert (= (and b!491748 res!294685) b!491750))

(assert (= (and b!491750 res!294691) b!491749))

(assert (= (and b!491749 res!294683) b!491755))

(assert (= (and b!491755 res!294684) b!491753))

(assert (= (and b!491753 res!294688) b!491751))

(assert (= (and b!491751 (not res!294687)) b!491752))

(assert (= (and b!491752 (not res!294690)) b!491754))

(declare-fun m!472467 () Bool)

(assert (=> b!491752 m!472467))

(declare-fun m!472469 () Bool)

(assert (=> b!491752 m!472469))

(declare-fun m!472471 () Bool)

(assert (=> b!491755 m!472471))

(declare-fun m!472473 () Bool)

(assert (=> b!491750 m!472473))

(declare-fun m!472475 () Bool)

(assert (=> b!491748 m!472475))

(declare-fun m!472477 () Bool)

(assert (=> b!491749 m!472477))

(declare-fun m!472479 () Bool)

(assert (=> b!491754 m!472479))

(declare-fun m!472481 () Bool)

(assert (=> start!44788 m!472481))

(declare-fun m!472483 () Bool)

(assert (=> start!44788 m!472483))

(declare-fun m!472485 () Bool)

(assert (=> b!491751 m!472485))

(declare-fun m!472487 () Bool)

(assert (=> b!491751 m!472487))

(declare-fun m!472489 () Bool)

(assert (=> b!491751 m!472489))

(declare-fun m!472491 () Bool)

(assert (=> b!491751 m!472491))

(declare-fun m!472493 () Bool)

(assert (=> b!491751 m!472493))

(declare-fun m!472495 () Bool)

(assert (=> b!491751 m!472495))

(declare-fun m!472497 () Bool)

(assert (=> b!491751 m!472497))

(declare-fun m!472499 () Bool)

(assert (=> b!491751 m!472499))

(assert (=> b!491751 m!472485))

(assert (=> b!491751 m!472497))

(assert (=> b!491751 m!472495))

(assert (=> b!491751 m!472497))

(declare-fun m!472501 () Bool)

(assert (=> b!491751 m!472501))

(assert (=> b!491751 m!472497))

(declare-fun m!472503 () Bool)

(assert (=> b!491751 m!472503))

(declare-fun m!472505 () Bool)

(assert (=> b!491753 m!472505))

(assert (=> b!491756 m!472497))

(assert (=> b!491756 m!472497))

(declare-fun m!472507 () Bool)

(assert (=> b!491756 m!472507))

(push 1)

(assert (not start!44788))

(assert (not b!491750))

(assert (not b!491754))

(assert (not b!491756))

(assert (not b!491755))

(assert (not b!491751))

(assert (not b!491749))

(assert (not b!491752))

(assert (not b!491753))

(assert (not b!491748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

