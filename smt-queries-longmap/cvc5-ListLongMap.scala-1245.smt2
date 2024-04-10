; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26028 () Bool)

(assert start!26028)

(declare-fun b!268521 () Bool)

(declare-fun e!173426 () Bool)

(assert (=> b!268521 (= e!173426 false)))

(declare-fun lt!134905 () Bool)

(declare-datatypes ((array!13125 0))(
  ( (array!13126 (arr!6212 (Array (_ BitVec 32) (_ BitVec 64))) (size!6564 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13125)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13125 (_ BitVec 32)) Bool)

(assert (=> b!268521 (= lt!134905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268522 () Bool)

(declare-fun res!132803 () Bool)

(declare-fun e!173425 () Bool)

(assert (=> b!268522 (=> (not res!132803) (not e!173425))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268522 (= res!132803 (validKeyInArray!0 k!2581))))

(declare-fun b!268523 () Bool)

(assert (=> b!268523 (= e!173425 e!173426)))

(declare-fun res!132801 () Bool)

(assert (=> b!268523 (=> (not res!132801) (not e!173426))))

(declare-datatypes ((SeekEntryResult!1370 0))(
  ( (MissingZero!1370 (index!7650 (_ BitVec 32))) (Found!1370 (index!7651 (_ BitVec 32))) (Intermediate!1370 (undefined!2182 Bool) (index!7652 (_ BitVec 32)) (x!26015 (_ BitVec 32))) (Undefined!1370) (MissingVacant!1370 (index!7653 (_ BitVec 32))) )
))
(declare-fun lt!134904 () SeekEntryResult!1370)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268523 (= res!132801 (or (= lt!134904 (MissingZero!1370 i!1267)) (= lt!134904 (MissingVacant!1370 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13125 (_ BitVec 32)) SeekEntryResult!1370)

(assert (=> b!268523 (= lt!134904 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268524 () Bool)

(declare-fun res!132800 () Bool)

(assert (=> b!268524 (=> (not res!132800) (not e!173425))))

(declare-fun arrayContainsKey!0 (array!13125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268524 (= res!132800 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132802 () Bool)

(assert (=> start!26028 (=> (not res!132802) (not e!173425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26028 (= res!132802 (validMask!0 mask!3868))))

(assert (=> start!26028 e!173425))

(declare-fun array_inv!4175 (array!13125) Bool)

(assert (=> start!26028 (array_inv!4175 a!3325)))

(assert (=> start!26028 true))

(declare-fun b!268525 () Bool)

(declare-fun res!132804 () Bool)

(assert (=> b!268525 (=> (not res!132804) (not e!173425))))

(declare-datatypes ((List!4020 0))(
  ( (Nil!4017) (Cons!4016 (h!4683 (_ BitVec 64)) (t!9102 List!4020)) )
))
(declare-fun arrayNoDuplicates!0 (array!13125 (_ BitVec 32) List!4020) Bool)

(assert (=> b!268525 (= res!132804 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4017))))

(declare-fun b!268526 () Bool)

(declare-fun res!132799 () Bool)

(assert (=> b!268526 (=> (not res!132799) (not e!173425))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268526 (= res!132799 (and (= (size!6564 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6564 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6564 a!3325))))))

(assert (= (and start!26028 res!132802) b!268526))

(assert (= (and b!268526 res!132799) b!268522))

(assert (= (and b!268522 res!132803) b!268525))

(assert (= (and b!268525 res!132804) b!268524))

(assert (= (and b!268524 res!132800) b!268523))

(assert (= (and b!268523 res!132801) b!268521))

(declare-fun m!284631 () Bool)

(assert (=> b!268523 m!284631))

(declare-fun m!284633 () Bool)

(assert (=> b!268524 m!284633))

(declare-fun m!284635 () Bool)

(assert (=> b!268522 m!284635))

(declare-fun m!284637 () Bool)

(assert (=> b!268521 m!284637))

(declare-fun m!284639 () Bool)

(assert (=> b!268525 m!284639))

(declare-fun m!284641 () Bool)

(assert (=> start!26028 m!284641))

(declare-fun m!284643 () Bool)

(assert (=> start!26028 m!284643))

(push 1)

