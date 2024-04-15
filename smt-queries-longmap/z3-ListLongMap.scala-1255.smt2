; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26090 () Bool)

(assert start!26090)

(declare-fun b!268923 () Bool)

(declare-fun res!133250 () Bool)

(declare-fun e!173596 () Bool)

(assert (=> b!268923 (=> (not res!133250) (not e!173596))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268923 (= res!133250 (validKeyInArray!0 k0!2581))))

(declare-fun b!268924 () Bool)

(declare-fun e!173597 () Bool)

(assert (=> b!268924 (= e!173597 false)))

(declare-datatypes ((Unit!8259 0))(
  ( (Unit!8260) )
))
(declare-fun lt!134906 () Unit!8259)

(declare-fun e!173598 () Unit!8259)

(assert (=> b!268924 (= lt!134906 e!173598)))

(declare-fun c!45388 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13176 0))(
  ( (array!13177 (arr!6237 (Array (_ BitVec 32) (_ BitVec 64))) (size!6590 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13176)

(assert (=> b!268924 (= c!45388 (bvslt startIndex!26 (bvsub (size!6590 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!268925 () Bool)

(declare-fun Unit!8261 () Unit!8259)

(assert (=> b!268925 (= e!173598 Unit!8261)))

(declare-fun b!268926 () Bool)

(declare-fun res!133249 () Bool)

(assert (=> b!268926 (=> (not res!133249) (not e!173597))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268926 (= res!133249 (= startIndex!26 i!1267))))

(declare-fun b!268927 () Bool)

(declare-fun res!133248 () Bool)

(assert (=> b!268927 (=> (not res!133248) (not e!173596))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268927 (= res!133248 (and (= (size!6590 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6590 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6590 a!3325))))))

(declare-fun b!268928 () Bool)

(declare-fun res!133252 () Bool)

(assert (=> b!268928 (=> (not res!133252) (not e!173596))))

(declare-fun arrayContainsKey!0 (array!13176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268928 (= res!133252 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133253 () Bool)

(assert (=> start!26090 (=> (not res!133253) (not e!173596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26090 (= res!133253 (validMask!0 mask!3868))))

(assert (=> start!26090 e!173596))

(declare-fun array_inv!4209 (array!13176) Bool)

(assert (=> start!26090 (array_inv!4209 a!3325)))

(assert (=> start!26090 true))

(declare-fun b!268922 () Bool)

(declare-fun res!133251 () Bool)

(assert (=> b!268922 (=> (not res!133251) (not e!173597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13176 (_ BitVec 32)) Bool)

(assert (=> b!268922 (= res!133251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268929 () Bool)

(declare-fun lt!134905 () Unit!8259)

(assert (=> b!268929 (= e!173598 lt!134905)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8259)

(assert (=> b!268929 (= lt!134905 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!268929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13177 (store (arr!6237 a!3325) i!1267 k0!2581) (size!6590 a!3325)) mask!3868)))

(declare-fun b!268930 () Bool)

(assert (=> b!268930 (= e!173596 e!173597)))

(declare-fun res!133255 () Bool)

(assert (=> b!268930 (=> (not res!133255) (not e!173597))))

(declare-datatypes ((SeekEntryResult!1394 0))(
  ( (MissingZero!1394 (index!7746 (_ BitVec 32))) (Found!1394 (index!7747 (_ BitVec 32))) (Intermediate!1394 (undefined!2206 Bool) (index!7748 (_ BitVec 32)) (x!26118 (_ BitVec 32))) (Undefined!1394) (MissingVacant!1394 (index!7749 (_ BitVec 32))) )
))
(declare-fun lt!134907 () SeekEntryResult!1394)

(assert (=> b!268930 (= res!133255 (or (= lt!134907 (MissingZero!1394 i!1267)) (= lt!134907 (MissingVacant!1394 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13176 (_ BitVec 32)) SeekEntryResult!1394)

(assert (=> b!268930 (= lt!134907 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268931 () Bool)

(declare-fun res!133254 () Bool)

(assert (=> b!268931 (=> (not res!133254) (not e!173596))))

(declare-datatypes ((List!4018 0))(
  ( (Nil!4015) (Cons!4014 (h!4681 (_ BitVec 64)) (t!9091 List!4018)) )
))
(declare-fun arrayNoDuplicates!0 (array!13176 (_ BitVec 32) List!4018) Bool)

(assert (=> b!268931 (= res!133254 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4015))))

(assert (= (and start!26090 res!133253) b!268927))

(assert (= (and b!268927 res!133248) b!268923))

(assert (= (and b!268923 res!133250) b!268931))

(assert (= (and b!268931 res!133254) b!268928))

(assert (= (and b!268928 res!133252) b!268930))

(assert (= (and b!268930 res!133255) b!268922))

(assert (= (and b!268922 res!133251) b!268926))

(assert (= (and b!268926 res!133249) b!268924))

(assert (= (and b!268924 c!45388) b!268929))

(assert (= (and b!268924 (not c!45388)) b!268925))

(declare-fun m!284459 () Bool)

(assert (=> b!268929 m!284459))

(declare-fun m!284461 () Bool)

(assert (=> b!268929 m!284461))

(declare-fun m!284463 () Bool)

(assert (=> b!268929 m!284463))

(declare-fun m!284465 () Bool)

(assert (=> b!268923 m!284465))

(declare-fun m!284467 () Bool)

(assert (=> start!26090 m!284467))

(declare-fun m!284469 () Bool)

(assert (=> start!26090 m!284469))

(declare-fun m!284471 () Bool)

(assert (=> b!268931 m!284471))

(declare-fun m!284473 () Bool)

(assert (=> b!268930 m!284473))

(declare-fun m!284475 () Bool)

(assert (=> b!268922 m!284475))

(declare-fun m!284477 () Bool)

(assert (=> b!268928 m!284477))

(check-sat (not b!268923) (not b!268929) (not b!268928) (not start!26090) (not b!268931) (not b!268922) (not b!268930))
(check-sat)
