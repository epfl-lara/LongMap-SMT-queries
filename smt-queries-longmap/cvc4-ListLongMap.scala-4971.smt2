; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68340 () Bool)

(assert start!68340)

(declare-fun b!794004 () Bool)

(declare-fun e!440960 () Bool)

(declare-fun e!440962 () Bool)

(assert (=> b!794004 (= e!440960 e!440962)))

(declare-fun res!538527 () Bool)

(assert (=> b!794004 (=> (not res!538527) (not e!440962))))

(declare-datatypes ((SeekEntryResult!8236 0))(
  ( (MissingZero!8236 (index!35312 (_ BitVec 32))) (Found!8236 (index!35313 (_ BitVec 32))) (Intermediate!8236 (undefined!9048 Bool) (index!35314 (_ BitVec 32)) (x!66242 (_ BitVec 32))) (Undefined!8236) (MissingVacant!8236 (index!35315 (_ BitVec 32))) )
))
(declare-fun lt!353944 () SeekEntryResult!8236)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794004 (= res!538527 (or (= lt!353944 (MissingZero!8236 i!1163)) (= lt!353944 (MissingVacant!8236 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43130 0))(
  ( (array!43131 (arr!20645 (Array (_ BitVec 32) (_ BitVec 64))) (size!21066 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43130)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43130 (_ BitVec 32)) SeekEntryResult!8236)

(assert (=> b!794004 (= lt!353944 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794005 () Bool)

(declare-fun res!538531 () Bool)

(assert (=> b!794005 (=> (not res!538531) (not e!440962))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794005 (= res!538531 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21066 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20645 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21066 a!3170)) (= (select (arr!20645 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794006 () Bool)

(declare-fun e!440961 () Bool)

(assert (=> b!794006 (= e!440961 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794007 () Bool)

(declare-fun res!538523 () Bool)

(assert (=> b!794007 (=> (not res!538523) (not e!440960))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794007 (= res!538523 (and (= (size!21066 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21066 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21066 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!538526 () Bool)

(assert (=> start!68340 (=> (not res!538526) (not e!440960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68340 (= res!538526 (validMask!0 mask!3266))))

(assert (=> start!68340 e!440960))

(assert (=> start!68340 true))

(declare-fun array_inv!16441 (array!43130) Bool)

(assert (=> start!68340 (array_inv!16441 a!3170)))

(declare-fun b!794008 () Bool)

(declare-fun res!538529 () Bool)

(assert (=> b!794008 (=> (not res!538529) (not e!440962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43130 (_ BitVec 32)) Bool)

(assert (=> b!794008 (= res!538529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794009 () Bool)

(declare-fun res!538530 () Bool)

(assert (=> b!794009 (=> (not res!538530) (not e!440960))))

(declare-fun arrayContainsKey!0 (array!43130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794009 (= res!538530 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794010 () Bool)

(declare-fun res!538524 () Bool)

(assert (=> b!794010 (=> (not res!538524) (not e!440962))))

(declare-datatypes ((List!14608 0))(
  ( (Nil!14605) (Cons!14604 (h!15733 (_ BitVec 64)) (t!20923 List!14608)) )
))
(declare-fun arrayNoDuplicates!0 (array!43130 (_ BitVec 32) List!14608) Bool)

(assert (=> b!794010 (= res!538524 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14605))))

(declare-fun b!794011 () Bool)

(assert (=> b!794011 (= e!440962 e!440961)))

(declare-fun res!538528 () Bool)

(assert (=> b!794011 (=> (not res!538528) (not e!440961))))

(declare-fun lt!353945 () (_ BitVec 64))

(declare-fun lt!353943 () array!43130)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43130 (_ BitVec 32)) SeekEntryResult!8236)

(assert (=> b!794011 (= res!538528 (= (seekEntryOrOpen!0 lt!353945 lt!353943 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353945 lt!353943 mask!3266)))))

(assert (=> b!794011 (= lt!353945 (select (store (arr!20645 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794011 (= lt!353943 (array!43131 (store (arr!20645 a!3170) i!1163 k!2044) (size!21066 a!3170)))))

(declare-fun b!794012 () Bool)

(declare-fun res!538525 () Bool)

(assert (=> b!794012 (=> (not res!538525) (not e!440960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794012 (= res!538525 (validKeyInArray!0 (select (arr!20645 a!3170) j!153)))))

(declare-fun b!794013 () Bool)

(declare-fun res!538532 () Bool)

(assert (=> b!794013 (=> (not res!538532) (not e!440960))))

(assert (=> b!794013 (= res!538532 (validKeyInArray!0 k!2044))))

(assert (= (and start!68340 res!538526) b!794007))

(assert (= (and b!794007 res!538523) b!794012))

(assert (= (and b!794012 res!538525) b!794013))

(assert (= (and b!794013 res!538532) b!794009))

(assert (= (and b!794009 res!538530) b!794004))

(assert (= (and b!794004 res!538527) b!794008))

(assert (= (and b!794008 res!538529) b!794010))

(assert (= (and b!794010 res!538524) b!794005))

(assert (= (and b!794005 res!538531) b!794011))

(assert (= (and b!794011 res!538528) b!794006))

(declare-fun m!734513 () Bool)

(assert (=> b!794011 m!734513))

(declare-fun m!734515 () Bool)

(assert (=> b!794011 m!734515))

(declare-fun m!734517 () Bool)

(assert (=> b!794011 m!734517))

(declare-fun m!734519 () Bool)

(assert (=> b!794011 m!734519))

(declare-fun m!734521 () Bool)

(assert (=> start!68340 m!734521))

(declare-fun m!734523 () Bool)

(assert (=> start!68340 m!734523))

(declare-fun m!734525 () Bool)

(assert (=> b!794009 m!734525))

(declare-fun m!734527 () Bool)

(assert (=> b!794012 m!734527))

(assert (=> b!794012 m!734527))

(declare-fun m!734529 () Bool)

(assert (=> b!794012 m!734529))

(declare-fun m!734531 () Bool)

(assert (=> b!794004 m!734531))

(declare-fun m!734533 () Bool)

(assert (=> b!794013 m!734533))

(declare-fun m!734535 () Bool)

(assert (=> b!794008 m!734535))

(declare-fun m!734537 () Bool)

(assert (=> b!794005 m!734537))

(declare-fun m!734539 () Bool)

(assert (=> b!794005 m!734539))

(declare-fun m!734541 () Bool)

(assert (=> b!794010 m!734541))

(push 1)

(assert (not b!794013))

(assert (not b!794010))

(assert (not b!794009))

(assert (not b!794012))

(assert (not b!794004))

(assert (not b!794011))

(assert (not start!68340))

(assert (not b!794008))

