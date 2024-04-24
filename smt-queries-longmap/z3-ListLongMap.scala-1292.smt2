; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26310 () Bool)

(assert start!26310)

(declare-fun b!272651 () Bool)

(declare-fun res!136621 () Bool)

(declare-fun e!174933 () Bool)

(assert (=> b!272651 (=> (not res!136621) (not e!174933))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272651 (= res!136621 (not (= startIndex!26 i!1267)))))

(declare-fun b!272652 () Bool)

(declare-fun res!136618 () Bool)

(declare-fun e!174935 () Bool)

(assert (=> b!272652 (=> (not res!136618) (not e!174935))))

(declare-datatypes ((array!13406 0))(
  ( (array!13407 (arr!6352 (Array (_ BitVec 32) (_ BitVec 64))) (size!6704 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13406)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272652 (= res!136618 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272653 () Bool)

(declare-fun res!136617 () Bool)

(assert (=> b!272653 (=> (not res!136617) (not e!174935))))

(declare-datatypes ((List!4073 0))(
  ( (Nil!4070) (Cons!4069 (h!4736 (_ BitVec 64)) (t!9147 List!4073)) )
))
(declare-fun arrayNoDuplicates!0 (array!13406 (_ BitVec 32) List!4073) Bool)

(assert (=> b!272653 (= res!136617 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4070))))

(declare-fun b!272654 () Bool)

(declare-fun res!136616 () Bool)

(assert (=> b!272654 (=> (not res!136616) (not e!174935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272654 (= res!136616 (validKeyInArray!0 k0!2581))))

(declare-fun b!272655 () Bool)

(declare-fun res!136620 () Bool)

(assert (=> b!272655 (=> (not res!136620) (not e!174933))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13406 (_ BitVec 32)) Bool)

(assert (=> b!272655 (= res!136620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272656 () Bool)

(assert (=> b!272656 (= e!174933 (not true))))

(assert (=> b!272656 (arrayNoDuplicates!0 (array!13407 (store (arr!6352 a!3325) i!1267 k0!2581) (size!6704 a!3325)) #b00000000000000000000000000000000 Nil!4070)))

(declare-datatypes ((Unit!8489 0))(
  ( (Unit!8490) )
))
(declare-fun lt!136097 () Unit!8489)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13406 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4073) Unit!8489)

(assert (=> b!272656 (= lt!136097 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4070))))

(declare-fun b!272657 () Bool)

(declare-fun res!136623 () Bool)

(assert (=> b!272657 (=> (not res!136623) (not e!174935))))

(assert (=> b!272657 (= res!136623 (and (= (size!6704 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6704 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6704 a!3325))))))

(declare-fun b!272658 () Bool)

(assert (=> b!272658 (= e!174935 e!174933)))

(declare-fun res!136622 () Bool)

(assert (=> b!272658 (=> (not res!136622) (not e!174933))))

(declare-datatypes ((SeekEntryResult!1475 0))(
  ( (MissingZero!1475 (index!8070 (_ BitVec 32))) (Found!1475 (index!8071 (_ BitVec 32))) (Intermediate!1475 (undefined!2287 Bool) (index!8072 (_ BitVec 32)) (x!26496 (_ BitVec 32))) (Undefined!1475) (MissingVacant!1475 (index!8073 (_ BitVec 32))) )
))
(declare-fun lt!136098 () SeekEntryResult!1475)

(assert (=> b!272658 (= res!136622 (or (= lt!136098 (MissingZero!1475 i!1267)) (= lt!136098 (MissingVacant!1475 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13406 (_ BitVec 32)) SeekEntryResult!1475)

(assert (=> b!272658 (= lt!136098 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272659 () Bool)

(declare-fun res!136619 () Bool)

(assert (=> b!272659 (=> (not res!136619) (not e!174933))))

(assert (=> b!272659 (= res!136619 (validKeyInArray!0 (select (arr!6352 a!3325) startIndex!26)))))

(declare-fun res!136615 () Bool)

(assert (=> start!26310 (=> (not res!136615) (not e!174935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26310 (= res!136615 (validMask!0 mask!3868))))

(assert (=> start!26310 e!174935))

(declare-fun array_inv!4302 (array!13406) Bool)

(assert (=> start!26310 (array_inv!4302 a!3325)))

(assert (=> start!26310 true))

(assert (= (and start!26310 res!136615) b!272657))

(assert (= (and b!272657 res!136623) b!272654))

(assert (= (and b!272654 res!136616) b!272653))

(assert (= (and b!272653 res!136617) b!272652))

(assert (= (and b!272652 res!136618) b!272658))

(assert (= (and b!272658 res!136622) b!272655))

(assert (= (and b!272655 res!136620) b!272651))

(assert (= (and b!272651 res!136621) b!272659))

(assert (= (and b!272659 res!136619) b!272656))

(declare-fun m!287891 () Bool)

(assert (=> b!272654 m!287891))

(declare-fun m!287893 () Bool)

(assert (=> b!272655 m!287893))

(declare-fun m!287895 () Bool)

(assert (=> b!272659 m!287895))

(assert (=> b!272659 m!287895))

(declare-fun m!287897 () Bool)

(assert (=> b!272659 m!287897))

(declare-fun m!287899 () Bool)

(assert (=> b!272658 m!287899))

(declare-fun m!287901 () Bool)

(assert (=> b!272653 m!287901))

(declare-fun m!287903 () Bool)

(assert (=> start!26310 m!287903))

(declare-fun m!287905 () Bool)

(assert (=> start!26310 m!287905))

(declare-fun m!287907 () Bool)

(assert (=> b!272656 m!287907))

(declare-fun m!287909 () Bool)

(assert (=> b!272656 m!287909))

(declare-fun m!287911 () Bool)

(assert (=> b!272656 m!287911))

(declare-fun m!287913 () Bool)

(assert (=> b!272652 m!287913))

(check-sat (not b!272658) (not b!272654) (not start!26310) (not b!272655) (not b!272652) (not b!272659) (not b!272653) (not b!272656))
(check-sat)
