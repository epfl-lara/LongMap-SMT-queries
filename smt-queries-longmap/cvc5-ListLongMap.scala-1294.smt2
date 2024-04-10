; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26322 () Bool)

(assert start!26322)

(declare-fun b!272766 () Bool)

(declare-fun res!136760 () Bool)

(declare-fun e!174964 () Bool)

(assert (=> b!272766 (=> (not res!136760) (not e!174964))))

(declare-datatypes ((array!13419 0))(
  ( (array!13420 (arr!6359 (Array (_ BitVec 32) (_ BitVec 64))) (size!6711 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13419)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13419 (_ BitVec 32)) Bool)

(assert (=> b!272766 (= res!136760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272767 () Bool)

(declare-fun res!136757 () Bool)

(declare-fun e!174963 () Bool)

(assert (=> b!272767 (=> (not res!136757) (not e!174963))))

(declare-datatypes ((List!4167 0))(
  ( (Nil!4164) (Cons!4163 (h!4830 (_ BitVec 64)) (t!9249 List!4167)) )
))
(declare-fun arrayNoDuplicates!0 (array!13419 (_ BitVec 32) List!4167) Bool)

(assert (=> b!272767 (= res!136757 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4164))))

(declare-fun b!272768 () Bool)

(declare-fun res!136764 () Bool)

(assert (=> b!272768 (=> (not res!136764) (not e!174964))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272768 (= res!136764 (validKeyInArray!0 (select (arr!6359 a!3325) startIndex!26)))))

(declare-fun res!136758 () Bool)

(assert (=> start!26322 (=> (not res!136758) (not e!174963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26322 (= res!136758 (validMask!0 mask!3868))))

(assert (=> start!26322 e!174963))

(declare-fun array_inv!4322 (array!13419) Bool)

(assert (=> start!26322 (array_inv!4322 a!3325)))

(assert (=> start!26322 true))

(declare-fun b!272769 () Bool)

(declare-fun res!136756 () Bool)

(assert (=> b!272769 (=> (not res!136756) (not e!174963))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272769 (= res!136756 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272770 () Bool)

(assert (=> b!272770 (= e!174964 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272770 (arrayNoDuplicates!0 (array!13420 (store (arr!6359 a!3325) i!1267 k!2581) (size!6711 a!3325)) #b00000000000000000000000000000000 Nil!4164)))

(declare-datatypes ((Unit!8521 0))(
  ( (Unit!8522) )
))
(declare-fun lt!136075 () Unit!8521)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4167) Unit!8521)

(assert (=> b!272770 (= lt!136075 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4164))))

(declare-fun b!272771 () Bool)

(declare-fun res!136759 () Bool)

(assert (=> b!272771 (=> (not res!136759) (not e!174963))))

(assert (=> b!272771 (= res!136759 (and (= (size!6711 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6711 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6711 a!3325))))))

(declare-fun b!272772 () Bool)

(assert (=> b!272772 (= e!174963 e!174964)))

(declare-fun res!136763 () Bool)

(assert (=> b!272772 (=> (not res!136763) (not e!174964))))

(declare-datatypes ((SeekEntryResult!1517 0))(
  ( (MissingZero!1517 (index!8238 (_ BitVec 32))) (Found!1517 (index!8239 (_ BitVec 32))) (Intermediate!1517 (undefined!2329 Bool) (index!8240 (_ BitVec 32)) (x!26554 (_ BitVec 32))) (Undefined!1517) (MissingVacant!1517 (index!8241 (_ BitVec 32))) )
))
(declare-fun lt!136074 () SeekEntryResult!1517)

(assert (=> b!272772 (= res!136763 (or (= lt!136074 (MissingZero!1517 i!1267)) (= lt!136074 (MissingVacant!1517 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13419 (_ BitVec 32)) SeekEntryResult!1517)

(assert (=> b!272772 (= lt!136074 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272773 () Bool)

(declare-fun res!136761 () Bool)

(assert (=> b!272773 (=> (not res!136761) (not e!174963))))

(assert (=> b!272773 (= res!136761 (validKeyInArray!0 k!2581))))

(declare-fun b!272774 () Bool)

(declare-fun res!136762 () Bool)

(assert (=> b!272774 (=> (not res!136762) (not e!174964))))

(assert (=> b!272774 (= res!136762 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26322 res!136758) b!272771))

(assert (= (and b!272771 res!136759) b!272773))

(assert (= (and b!272773 res!136761) b!272767))

(assert (= (and b!272767 res!136757) b!272769))

(assert (= (and b!272769 res!136756) b!272772))

(assert (= (and b!272772 res!136763) b!272766))

(assert (= (and b!272766 res!136760) b!272774))

(assert (= (and b!272774 res!136762) b!272768))

(assert (= (and b!272768 res!136764) b!272770))

(declare-fun m!287829 () Bool)

(assert (=> start!26322 m!287829))

(declare-fun m!287831 () Bool)

(assert (=> start!26322 m!287831))

(declare-fun m!287833 () Bool)

(assert (=> b!272772 m!287833))

(declare-fun m!287835 () Bool)

(assert (=> b!272766 m!287835))

(declare-fun m!287837 () Bool)

(assert (=> b!272769 m!287837))

(declare-fun m!287839 () Bool)

(assert (=> b!272770 m!287839))

(declare-fun m!287841 () Bool)

(assert (=> b!272770 m!287841))

(declare-fun m!287843 () Bool)

(assert (=> b!272770 m!287843))

(declare-fun m!287845 () Bool)

(assert (=> b!272768 m!287845))

(assert (=> b!272768 m!287845))

(declare-fun m!287847 () Bool)

(assert (=> b!272768 m!287847))

(declare-fun m!287849 () Bool)

(assert (=> b!272773 m!287849))

(declare-fun m!287851 () Bool)

(assert (=> b!272767 m!287851))

(push 1)

