; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27150 () Bool)

(assert start!27150)

(declare-fun res!143949 () Bool)

(declare-fun e!178701 () Bool)

(assert (=> start!27150 (=> (not res!143949) (not e!178701))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27150 (= res!143949 (validMask!0 mask!3868))))

(assert (=> start!27150 e!178701))

(declare-datatypes ((array!13967 0))(
  ( (array!13968 (arr!6625 (Array (_ BitVec 32) (_ BitVec 64))) (size!6977 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13967)

(declare-fun array_inv!4575 (array!13967) Bool)

(assert (=> start!27150 (array_inv!4575 a!3325)))

(assert (=> start!27150 true))

(declare-fun b!280898 () Bool)

(declare-fun res!143942 () Bool)

(assert (=> b!280898 (=> (not res!143942) (not e!178701))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280898 (= res!143942 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280899 () Bool)

(declare-fun res!143941 () Bool)

(assert (=> b!280899 (=> (not res!143941) (not e!178701))))

(declare-datatypes ((List!4346 0))(
  ( (Nil!4343) (Cons!4342 (h!5012 (_ BitVec 64)) (t!9420 List!4346)) )
))
(declare-fun arrayNoDuplicates!0 (array!13967 (_ BitVec 32) List!4346) Bool)

(assert (=> b!280899 (= res!143941 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4343))))

(declare-fun b!280900 () Bool)

(declare-fun res!143944 () Bool)

(declare-fun e!178702 () Bool)

(assert (=> b!280900 (=> (not res!143944) (not e!178702))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280900 (= res!143944 (not (= startIndex!26 i!1267)))))

(declare-fun b!280901 () Bool)

(declare-fun res!143947 () Bool)

(assert (=> b!280901 (=> (not res!143947) (not e!178702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13967 (_ BitVec 32)) Bool)

(assert (=> b!280901 (= res!143947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280902 () Bool)

(declare-fun res!143945 () Bool)

(assert (=> b!280902 (=> (not res!143945) (not e!178702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280902 (= res!143945 (validKeyInArray!0 (select (arr!6625 a!3325) startIndex!26)))))

(declare-fun b!280903 () Bool)

(declare-fun res!143943 () Bool)

(assert (=> b!280903 (=> (not res!143943) (not e!178701))))

(assert (=> b!280903 (= res!143943 (and (= (size!6977 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6977 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6977 a!3325))))))

(declare-fun b!280904 () Bool)

(assert (=> b!280904 (= e!178702 (not true))))

(assert (=> b!280904 (arrayNoDuplicates!0 (array!13968 (store (arr!6625 a!3325) i!1267 k0!2581) (size!6977 a!3325)) #b00000000000000000000000000000000 Nil!4343)))

(declare-datatypes ((Unit!8826 0))(
  ( (Unit!8827) )
))
(declare-fun lt!138977 () Unit!8826)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13967 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4346) Unit!8826)

(assert (=> b!280904 (= lt!138977 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4343))))

(declare-fun b!280905 () Bool)

(assert (=> b!280905 (= e!178701 e!178702)))

(declare-fun res!143948 () Bool)

(assert (=> b!280905 (=> (not res!143948) (not e!178702))))

(declare-datatypes ((SeekEntryResult!1748 0))(
  ( (MissingZero!1748 (index!9162 (_ BitVec 32))) (Found!1748 (index!9163 (_ BitVec 32))) (Intermediate!1748 (undefined!2560 Bool) (index!9164 (_ BitVec 32)) (x!27506 (_ BitVec 32))) (Undefined!1748) (MissingVacant!1748 (index!9165 (_ BitVec 32))) )
))
(declare-fun lt!138978 () SeekEntryResult!1748)

(assert (=> b!280905 (= res!143948 (or (= lt!138978 (MissingZero!1748 i!1267)) (= lt!138978 (MissingVacant!1748 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13967 (_ BitVec 32)) SeekEntryResult!1748)

(assert (=> b!280905 (= lt!138978 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280906 () Bool)

(declare-fun res!143946 () Bool)

(assert (=> b!280906 (=> (not res!143946) (not e!178701))))

(assert (=> b!280906 (= res!143946 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27150 res!143949) b!280903))

(assert (= (and b!280903 res!143943) b!280906))

(assert (= (and b!280906 res!143946) b!280899))

(assert (= (and b!280899 res!143941) b!280898))

(assert (= (and b!280898 res!143942) b!280905))

(assert (= (and b!280905 res!143948) b!280901))

(assert (= (and b!280901 res!143947) b!280900))

(assert (= (and b!280900 res!143944) b!280902))

(assert (= (and b!280902 res!143945) b!280904))

(declare-fun m!295445 () Bool)

(assert (=> b!280901 m!295445))

(declare-fun m!295447 () Bool)

(assert (=> b!280898 m!295447))

(declare-fun m!295449 () Bool)

(assert (=> b!280902 m!295449))

(assert (=> b!280902 m!295449))

(declare-fun m!295451 () Bool)

(assert (=> b!280902 m!295451))

(declare-fun m!295453 () Bool)

(assert (=> b!280899 m!295453))

(declare-fun m!295455 () Bool)

(assert (=> b!280905 m!295455))

(declare-fun m!295457 () Bool)

(assert (=> b!280904 m!295457))

(declare-fun m!295459 () Bool)

(assert (=> b!280904 m!295459))

(declare-fun m!295461 () Bool)

(assert (=> b!280904 m!295461))

(declare-fun m!295463 () Bool)

(assert (=> start!27150 m!295463))

(declare-fun m!295465 () Bool)

(assert (=> start!27150 m!295465))

(declare-fun m!295467 () Bool)

(assert (=> b!280906 m!295467))

(check-sat (not b!280901) (not b!280906) (not start!27150) (not b!280899) (not b!280898) (not b!280905) (not b!280902) (not b!280904))
(check-sat)
