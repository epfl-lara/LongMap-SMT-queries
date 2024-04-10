; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26684 () Bool)

(assert start!26684)

(declare-fun b!276950 () Bool)

(declare-fun e!176854 () Bool)

(declare-fun e!176855 () Bool)

(assert (=> b!276950 (= e!176854 e!176855)))

(declare-fun res!140945 () Bool)

(assert (=> b!276950 (=> (not res!140945) (not e!176855))))

(declare-datatypes ((SeekEntryResult!1698 0))(
  ( (MissingZero!1698 (index!8962 (_ BitVec 32))) (Found!1698 (index!8963 (_ BitVec 32))) (Intermediate!1698 (undefined!2510 Bool) (index!8964 (_ BitVec 32)) (x!27215 (_ BitVec 32))) (Undefined!1698) (MissingVacant!1698 (index!8965 (_ BitVec 32))) )
))
(declare-fun lt!137794 () SeekEntryResult!1698)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276950 (= res!140945 (or (= lt!137794 (MissingZero!1698 i!1267)) (= lt!137794 (MissingVacant!1698 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!13781 0))(
  ( (array!13782 (arr!6540 (Array (_ BitVec 32) (_ BitVec 64))) (size!6892 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13781)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13781 (_ BitVec 32)) SeekEntryResult!1698)

(assert (=> b!276950 (= lt!137794 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276951 () Bool)

(declare-fun res!140946 () Bool)

(assert (=> b!276951 (=> (not res!140946) (not e!176854))))

(declare-datatypes ((List!4348 0))(
  ( (Nil!4345) (Cons!4344 (h!5011 (_ BitVec 64)) (t!9430 List!4348)) )
))
(declare-fun arrayNoDuplicates!0 (array!13781 (_ BitVec 32) List!4348) Bool)

(assert (=> b!276951 (= res!140946 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4345))))

(declare-fun b!276952 () Bool)

(declare-fun res!140941 () Bool)

(assert (=> b!276952 (=> (not res!140941) (not e!176854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276952 (= res!140941 (validKeyInArray!0 k0!2581))))

(declare-fun b!276953 () Bool)

(declare-fun res!140944 () Bool)

(assert (=> b!276953 (=> (not res!140944) (not e!176854))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276953 (= res!140944 (and (= (size!6892 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6892 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6892 a!3325))))))

(declare-fun b!276954 () Bool)

(declare-fun res!140942 () Bool)

(assert (=> b!276954 (=> (not res!140942) (not e!176855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13781 (_ BitVec 32)) Bool)

(assert (=> b!276954 (= res!140942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276955 () Bool)

(assert (=> b!276955 (= e!176855 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6892 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!6892 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!6892 a!3325) startIndex!26))))))

(declare-fun res!140940 () Bool)

(assert (=> start!26684 (=> (not res!140940) (not e!176854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26684 (= res!140940 (validMask!0 mask!3868))))

(assert (=> start!26684 e!176854))

(declare-fun array_inv!4503 (array!13781) Bool)

(assert (=> start!26684 (array_inv!4503 a!3325)))

(assert (=> start!26684 true))

(declare-fun b!276956 () Bool)

(declare-fun res!140943 () Bool)

(assert (=> b!276956 (=> (not res!140943) (not e!176854))))

(declare-fun arrayContainsKey!0 (array!13781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276956 (= res!140943 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26684 res!140940) b!276953))

(assert (= (and b!276953 res!140944) b!276952))

(assert (= (and b!276952 res!140941) b!276951))

(assert (= (and b!276951 res!140946) b!276956))

(assert (= (and b!276956 res!140943) b!276950))

(assert (= (and b!276950 res!140945) b!276954))

(assert (= (and b!276954 res!140942) b!276955))

(declare-fun m!292163 () Bool)

(assert (=> b!276956 m!292163))

(declare-fun m!292165 () Bool)

(assert (=> b!276950 m!292165))

(declare-fun m!292167 () Bool)

(assert (=> b!276954 m!292167))

(declare-fun m!292169 () Bool)

(assert (=> b!276952 m!292169))

(declare-fun m!292171 () Bool)

(assert (=> b!276951 m!292171))

(declare-fun m!292173 () Bool)

(assert (=> start!26684 m!292173))

(declare-fun m!292175 () Bool)

(assert (=> start!26684 m!292175))

(check-sat (not b!276952) (not b!276950) (not b!276954) (not start!26684) (not b!276956) (not b!276951))
(check-sat)
