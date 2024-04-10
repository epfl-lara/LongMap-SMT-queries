; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26732 () Bool)

(assert start!26732)

(declare-fun b!277658 () Bool)

(declare-fun e!177138 () Bool)

(declare-fun e!177139 () Bool)

(assert (=> b!277658 (= e!177138 e!177139)))

(declare-fun res!141518 () Bool)

(assert (=> b!277658 (=> (not res!141518) (not e!177139))))

(declare-datatypes ((SeekEntryResult!1722 0))(
  ( (MissingZero!1722 (index!9058 (_ BitVec 32))) (Found!1722 (index!9059 (_ BitVec 32))) (Intermediate!1722 (undefined!2534 Bool) (index!9060 (_ BitVec 32)) (x!27303 (_ BitVec 32))) (Undefined!1722) (MissingVacant!1722 (index!9061 (_ BitVec 32))) )
))
(declare-fun lt!138004 () SeekEntryResult!1722)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277658 (= res!141518 (or (= lt!138004 (MissingZero!1722 i!1267)) (= lt!138004 (MissingVacant!1722 i!1267))))))

(declare-datatypes ((array!13829 0))(
  ( (array!13830 (arr!6564 (Array (_ BitVec 32) (_ BitVec 64))) (size!6916 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13829)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13829 (_ BitVec 32)) SeekEntryResult!1722)

(assert (=> b!277658 (= lt!138004 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277659 () Bool)

(assert (=> b!277659 (= e!177139 false)))

(declare-datatypes ((Unit!8767 0))(
  ( (Unit!8768) )
))
(declare-fun lt!138003 () Unit!8767)

(declare-fun e!177137 () Unit!8767)

(assert (=> b!277659 (= lt!138003 e!177137)))

(declare-fun c!45624 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277659 (= c!45624 (bvslt startIndex!26 (bvsub (size!6916 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277660 () Bool)

(declare-fun lt!138002 () Unit!8767)

(assert (=> b!277660 (= e!177137 lt!138002)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8767)

(assert (=> b!277660 (= lt!138002 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13829 (_ BitVec 32)) Bool)

(assert (=> b!277660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13830 (store (arr!6564 a!3325) i!1267 k0!2581) (size!6916 a!3325)) mask!3868)))

(declare-fun b!277662 () Bool)

(declare-fun res!141513 () Bool)

(assert (=> b!277662 (=> (not res!141513) (not e!177138))))

(assert (=> b!277662 (= res!141513 (and (= (size!6916 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6916 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6916 a!3325))))))

(declare-fun b!277663 () Bool)

(declare-fun res!141516 () Bool)

(assert (=> b!277663 (=> (not res!141516) (not e!177138))))

(declare-datatypes ((List!4372 0))(
  ( (Nil!4369) (Cons!4368 (h!5035 (_ BitVec 64)) (t!9454 List!4372)) )
))
(declare-fun arrayNoDuplicates!0 (array!13829 (_ BitVec 32) List!4372) Bool)

(assert (=> b!277663 (= res!141516 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4369))))

(declare-fun b!277664 () Bool)

(declare-fun Unit!8769 () Unit!8767)

(assert (=> b!277664 (= e!177137 Unit!8769)))

(declare-fun b!277665 () Bool)

(declare-fun res!141512 () Bool)

(assert (=> b!277665 (=> (not res!141512) (not e!177139))))

(assert (=> b!277665 (= res!141512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277661 () Bool)

(declare-fun res!141519 () Bool)

(assert (=> b!277661 (=> (not res!141519) (not e!177139))))

(assert (=> b!277661 (= res!141519 (= startIndex!26 i!1267))))

(declare-fun res!141514 () Bool)

(assert (=> start!26732 (=> (not res!141514) (not e!177138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26732 (= res!141514 (validMask!0 mask!3868))))

(assert (=> start!26732 e!177138))

(declare-fun array_inv!4527 (array!13829) Bool)

(assert (=> start!26732 (array_inv!4527 a!3325)))

(assert (=> start!26732 true))

(declare-fun b!277666 () Bool)

(declare-fun res!141517 () Bool)

(assert (=> b!277666 (=> (not res!141517) (not e!177138))))

(declare-fun arrayContainsKey!0 (array!13829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277666 (= res!141517 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277667 () Bool)

(declare-fun res!141515 () Bool)

(assert (=> b!277667 (=> (not res!141515) (not e!177138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277667 (= res!141515 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26732 res!141514) b!277662))

(assert (= (and b!277662 res!141513) b!277667))

(assert (= (and b!277667 res!141515) b!277663))

(assert (= (and b!277663 res!141516) b!277666))

(assert (= (and b!277666 res!141517) b!277658))

(assert (= (and b!277658 res!141518) b!277665))

(assert (= (and b!277665 res!141512) b!277661))

(assert (= (and b!277661 res!141519) b!277659))

(assert (= (and b!277659 c!45624) b!277660))

(assert (= (and b!277659 (not c!45624)) b!277664))

(declare-fun m!292631 () Bool)

(assert (=> b!277667 m!292631))

(declare-fun m!292633 () Bool)

(assert (=> b!277660 m!292633))

(declare-fun m!292635 () Bool)

(assert (=> b!277660 m!292635))

(declare-fun m!292637 () Bool)

(assert (=> b!277660 m!292637))

(declare-fun m!292639 () Bool)

(assert (=> b!277666 m!292639))

(declare-fun m!292641 () Bool)

(assert (=> b!277663 m!292641))

(declare-fun m!292643 () Bool)

(assert (=> start!26732 m!292643))

(declare-fun m!292645 () Bool)

(assert (=> start!26732 m!292645))

(declare-fun m!292647 () Bool)

(assert (=> b!277658 m!292647))

(declare-fun m!292649 () Bool)

(assert (=> b!277665 m!292649))

(check-sat (not b!277660) (not b!277663) (not b!277665) (not start!26732) (not b!277667) (not b!277666) (not b!277658))
(check-sat)
