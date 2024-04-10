; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26330 () Bool)

(assert start!26330)

(declare-fun b!272874 () Bool)

(declare-fun res!136865 () Bool)

(declare-fun e!175005 () Bool)

(assert (=> b!272874 (=> (not res!136865) (not e!175005))))

(declare-datatypes ((array!13427 0))(
  ( (array!13428 (arr!6363 (Array (_ BitVec 32) (_ BitVec 64))) (size!6715 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13427)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272874 (= res!136865 (and (= (size!6715 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6715 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6715 a!3325))))))

(declare-fun b!272875 () Bool)

(declare-fun res!136867 () Bool)

(declare-fun e!175006 () Bool)

(assert (=> b!272875 (=> (not res!136867) (not e!175006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13427 (_ BitVec 32)) Bool)

(assert (=> b!272875 (= res!136867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272876 () Bool)

(declare-fun e!175007 () Bool)

(assert (=> b!272876 (= e!175007 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136108 () array!13427)

(declare-datatypes ((SeekEntryResult!1521 0))(
  ( (MissingZero!1521 (index!8254 (_ BitVec 32))) (Found!1521 (index!8255 (_ BitVec 32))) (Intermediate!1521 (undefined!2333 Bool) (index!8256 (_ BitVec 32)) (x!26566 (_ BitVec 32))) (Undefined!1521) (MissingVacant!1521 (index!8257 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13427 (_ BitVec 32)) SeekEntryResult!1521)

(assert (=> b!272876 (= (seekEntryOrOpen!0 (select (arr!6363 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6363 a!3325) i!1267 k0!2581) startIndex!26) lt!136108 mask!3868))))

(declare-datatypes ((Unit!8529 0))(
  ( (Unit!8530) )
))
(declare-fun lt!136110 () Unit!8529)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8529)

(assert (=> b!272876 (= lt!136110 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4171 0))(
  ( (Nil!4168) (Cons!4167 (h!4834 (_ BitVec 64)) (t!9253 List!4171)) )
))
(declare-fun arrayNoDuplicates!0 (array!13427 (_ BitVec 32) List!4171) Bool)

(assert (=> b!272876 (arrayNoDuplicates!0 lt!136108 #b00000000000000000000000000000000 Nil!4168)))

(declare-fun lt!136111 () Unit!8529)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13427 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4171) Unit!8529)

(assert (=> b!272876 (= lt!136111 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4168))))

(declare-fun b!272877 () Bool)

(declare-fun res!136864 () Bool)

(assert (=> b!272877 (=> (not res!136864) (not e!175005))))

(declare-fun arrayContainsKey!0 (array!13427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272877 (= res!136864 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272878 () Bool)

(assert (=> b!272878 (= e!175005 e!175006)))

(declare-fun res!136866 () Bool)

(assert (=> b!272878 (=> (not res!136866) (not e!175006))))

(declare-fun lt!136109 () SeekEntryResult!1521)

(assert (=> b!272878 (= res!136866 (or (= lt!136109 (MissingZero!1521 i!1267)) (= lt!136109 (MissingVacant!1521 i!1267))))))

(assert (=> b!272878 (= lt!136109 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272879 () Bool)

(declare-fun res!136872 () Bool)

(assert (=> b!272879 (=> (not res!136872) (not e!175005))))

(assert (=> b!272879 (= res!136872 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4168))))

(declare-fun b!272880 () Bool)

(assert (=> b!272880 (= e!175006 e!175007)))

(declare-fun res!136869 () Bool)

(assert (=> b!272880 (=> (not res!136869) (not e!175007))))

(assert (=> b!272880 (= res!136869 (not (= startIndex!26 i!1267)))))

(assert (=> b!272880 (= lt!136108 (array!13428 (store (arr!6363 a!3325) i!1267 k0!2581) (size!6715 a!3325)))))

(declare-fun b!272881 () Bool)

(declare-fun res!136871 () Bool)

(assert (=> b!272881 (=> (not res!136871) (not e!175007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272881 (= res!136871 (validKeyInArray!0 (select (arr!6363 a!3325) startIndex!26)))))

(declare-fun b!272882 () Bool)

(declare-fun res!136868 () Bool)

(assert (=> b!272882 (=> (not res!136868) (not e!175005))))

(assert (=> b!272882 (= res!136868 (validKeyInArray!0 k0!2581))))

(declare-fun res!136870 () Bool)

(assert (=> start!26330 (=> (not res!136870) (not e!175005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26330 (= res!136870 (validMask!0 mask!3868))))

(assert (=> start!26330 e!175005))

(declare-fun array_inv!4326 (array!13427) Bool)

(assert (=> start!26330 (array_inv!4326 a!3325)))

(assert (=> start!26330 true))

(assert (= (and start!26330 res!136870) b!272874))

(assert (= (and b!272874 res!136865) b!272882))

(assert (= (and b!272882 res!136868) b!272879))

(assert (= (and b!272879 res!136872) b!272877))

(assert (= (and b!272877 res!136864) b!272878))

(assert (= (and b!272878 res!136866) b!272875))

(assert (= (and b!272875 res!136867) b!272880))

(assert (= (and b!272880 res!136869) b!272881))

(assert (= (and b!272881 res!136871) b!272876))

(declare-fun m!287933 () Bool)

(assert (=> b!272881 m!287933))

(assert (=> b!272881 m!287933))

(declare-fun m!287935 () Bool)

(assert (=> b!272881 m!287935))

(declare-fun m!287937 () Bool)

(assert (=> b!272877 m!287937))

(declare-fun m!287939 () Bool)

(assert (=> b!272878 m!287939))

(declare-fun m!287941 () Bool)

(assert (=> b!272882 m!287941))

(declare-fun m!287943 () Bool)

(assert (=> b!272880 m!287943))

(declare-fun m!287945 () Bool)

(assert (=> b!272875 m!287945))

(declare-fun m!287947 () Bool)

(assert (=> b!272876 m!287947))

(declare-fun m!287949 () Bool)

(assert (=> b!272876 m!287949))

(assert (=> b!272876 m!287947))

(assert (=> b!272876 m!287943))

(assert (=> b!272876 m!287933))

(declare-fun m!287951 () Bool)

(assert (=> b!272876 m!287951))

(assert (=> b!272876 m!287933))

(declare-fun m!287953 () Bool)

(assert (=> b!272876 m!287953))

(declare-fun m!287955 () Bool)

(assert (=> b!272876 m!287955))

(declare-fun m!287957 () Bool)

(assert (=> b!272876 m!287957))

(declare-fun m!287959 () Bool)

(assert (=> start!26330 m!287959))

(declare-fun m!287961 () Bool)

(assert (=> start!26330 m!287961))

(declare-fun m!287963 () Bool)

(assert (=> b!272879 m!287963))

(check-sat (not b!272879) (not b!272882) (not b!272878) (not b!272881) (not b!272875) (not start!26330) (not b!272876) (not b!272877))
(check-sat)
