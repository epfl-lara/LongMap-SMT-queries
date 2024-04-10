; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26118 () Bool)

(assert start!26118)

(declare-fun b!269519 () Bool)

(declare-fun res!133705 () Bool)

(declare-fun e!173876 () Bool)

(assert (=> b!269519 (=> (not res!133705) (not e!173876))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269519 (= res!133705 (validKeyInArray!0 k!2581))))

(declare-fun b!269520 () Bool)

(declare-datatypes ((Unit!8350 0))(
  ( (Unit!8351) )
))
(declare-fun e!173879 () Unit!8350)

(declare-fun lt!135223 () Unit!8350)

(assert (=> b!269520 (= e!173879 lt!135223)))

(declare-datatypes ((array!13215 0))(
  ( (array!13216 (arr!6257 (Array (_ BitVec 32) (_ BitVec 64))) (size!6609 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13215)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13215 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8350)

(assert (=> b!269520 (= lt!135223 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13215 (_ BitVec 32)) Bool)

(assert (=> b!269520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13216 (store (arr!6257 a!3325) i!1267 k!2581) (size!6609 a!3325)) mask!3868)))

(declare-fun b!269521 () Bool)

(declare-fun res!133708 () Bool)

(assert (=> b!269521 (=> (not res!133708) (not e!173876))))

(declare-datatypes ((List!4065 0))(
  ( (Nil!4062) (Cons!4061 (h!4728 (_ BitVec 64)) (t!9147 List!4065)) )
))
(declare-fun arrayNoDuplicates!0 (array!13215 (_ BitVec 32) List!4065) Bool)

(assert (=> b!269521 (= res!133708 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4062))))

(declare-fun b!269522 () Bool)

(declare-fun e!173878 () Bool)

(assert (=> b!269522 (= e!173878 false)))

(declare-fun lt!135221 () Unit!8350)

(assert (=> b!269522 (= lt!135221 e!173879)))

(declare-fun c!45459 () Bool)

(assert (=> b!269522 (= c!45459 (bvslt startIndex!26 (bvsub (size!6609 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!133709 () Bool)

(assert (=> start!26118 (=> (not res!133709) (not e!173876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26118 (= res!133709 (validMask!0 mask!3868))))

(assert (=> start!26118 e!173876))

(declare-fun array_inv!4220 (array!13215) Bool)

(assert (=> start!26118 (array_inv!4220 a!3325)))

(assert (=> start!26118 true))

(declare-fun b!269523 () Bool)

(assert (=> b!269523 (= e!173876 e!173878)))

(declare-fun res!133707 () Bool)

(assert (=> b!269523 (=> (not res!133707) (not e!173878))))

(declare-datatypes ((SeekEntryResult!1415 0))(
  ( (MissingZero!1415 (index!7830 (_ BitVec 32))) (Found!1415 (index!7831 (_ BitVec 32))) (Intermediate!1415 (undefined!2227 Bool) (index!7832 (_ BitVec 32)) (x!26180 (_ BitVec 32))) (Undefined!1415) (MissingVacant!1415 (index!7833 (_ BitVec 32))) )
))
(declare-fun lt!135222 () SeekEntryResult!1415)

(assert (=> b!269523 (= res!133707 (or (= lt!135222 (MissingZero!1415 i!1267)) (= lt!135222 (MissingVacant!1415 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13215 (_ BitVec 32)) SeekEntryResult!1415)

(assert (=> b!269523 (= lt!135222 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269524 () Bool)

(declare-fun res!133703 () Bool)

(assert (=> b!269524 (=> (not res!133703) (not e!173876))))

(assert (=> b!269524 (= res!133703 (and (= (size!6609 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6609 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6609 a!3325))))))

(declare-fun b!269525 () Bool)

(declare-fun res!133706 () Bool)

(assert (=> b!269525 (=> (not res!133706) (not e!173876))))

(declare-fun arrayContainsKey!0 (array!13215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269525 (= res!133706 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269526 () Bool)

(declare-fun Unit!8352 () Unit!8350)

(assert (=> b!269526 (= e!173879 Unit!8352)))

(declare-fun b!269527 () Bool)

(declare-fun res!133710 () Bool)

(assert (=> b!269527 (=> (not res!133710) (not e!173878))))

(assert (=> b!269527 (= res!133710 (= startIndex!26 i!1267))))

(declare-fun b!269528 () Bool)

(declare-fun res!133704 () Bool)

(assert (=> b!269528 (=> (not res!133704) (not e!173878))))

(assert (=> b!269528 (= res!133704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26118 res!133709) b!269524))

(assert (= (and b!269524 res!133703) b!269519))

(assert (= (and b!269519 res!133705) b!269521))

(assert (= (and b!269521 res!133708) b!269525))

(assert (= (and b!269525 res!133706) b!269523))

(assert (= (and b!269523 res!133707) b!269528))

(assert (= (and b!269528 res!133704) b!269527))

(assert (= (and b!269527 res!133710) b!269522))

(assert (= (and b!269522 c!45459) b!269520))

(assert (= (and b!269522 (not c!45459)) b!269526))

(declare-fun m!285351 () Bool)

(assert (=> b!269523 m!285351))

(declare-fun m!285353 () Bool)

(assert (=> b!269528 m!285353))

(declare-fun m!285355 () Bool)

(assert (=> start!26118 m!285355))

(declare-fun m!285357 () Bool)

(assert (=> start!26118 m!285357))

(declare-fun m!285359 () Bool)

(assert (=> b!269521 m!285359))

(declare-fun m!285361 () Bool)

(assert (=> b!269520 m!285361))

(declare-fun m!285363 () Bool)

(assert (=> b!269520 m!285363))

(declare-fun m!285365 () Bool)

(assert (=> b!269520 m!285365))

(declare-fun m!285367 () Bool)

(assert (=> b!269525 m!285367))

(declare-fun m!285369 () Bool)

(assert (=> b!269519 m!285369))

(push 1)

