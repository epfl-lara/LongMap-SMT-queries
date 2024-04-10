; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68336 () Bool)

(assert start!68336)

(declare-fun res!538467 () Bool)

(declare-fun e!440939 () Bool)

(assert (=> start!68336 (=> (not res!538467) (not e!440939))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68336 (= res!538467 (validMask!0 mask!3266))))

(assert (=> start!68336 e!440939))

(assert (=> start!68336 true))

(declare-datatypes ((array!43126 0))(
  ( (array!43127 (arr!20643 (Array (_ BitVec 32) (_ BitVec 64))) (size!21064 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43126)

(declare-fun array_inv!16439 (array!43126) Bool)

(assert (=> start!68336 (array_inv!16439 a!3170)))

(declare-fun b!793944 () Bool)

(declare-fun res!538469 () Bool)

(assert (=> b!793944 (=> (not res!538469) (not e!440939))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793944 (= res!538469 (and (= (size!21064 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21064 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21064 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793945 () Bool)

(declare-fun e!440937 () Bool)

(declare-fun e!440936 () Bool)

(assert (=> b!793945 (= e!440937 e!440936)))

(declare-fun res!538471 () Bool)

(assert (=> b!793945 (=> (not res!538471) (not e!440936))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353926 () array!43126)

(declare-fun lt!353927 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8234 0))(
  ( (MissingZero!8234 (index!35304 (_ BitVec 32))) (Found!8234 (index!35305 (_ BitVec 32))) (Intermediate!8234 (undefined!9046 Bool) (index!35306 (_ BitVec 32)) (x!66240 (_ BitVec 32))) (Undefined!8234) (MissingVacant!8234 (index!35307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43126 (_ BitVec 32)) SeekEntryResult!8234)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43126 (_ BitVec 32)) SeekEntryResult!8234)

(assert (=> b!793945 (= res!538471 (= (seekEntryOrOpen!0 lt!353927 lt!353926 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353927 lt!353926 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!793945 (= lt!353927 (select (store (arr!20643 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793945 (= lt!353926 (array!43127 (store (arr!20643 a!3170) i!1163 k!2044) (size!21064 a!3170)))))

(declare-fun b!793946 () Bool)

(declare-fun res!538463 () Bool)

(assert (=> b!793946 (=> (not res!538463) (not e!440939))))

(declare-fun arrayContainsKey!0 (array!43126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793946 (= res!538463 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793947 () Bool)

(declare-fun res!538468 () Bool)

(assert (=> b!793947 (=> (not res!538468) (not e!440939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793947 (= res!538468 (validKeyInArray!0 k!2044))))

(declare-fun b!793948 () Bool)

(declare-fun res!538465 () Bool)

(assert (=> b!793948 (=> (not res!538465) (not e!440937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43126 (_ BitVec 32)) Bool)

(assert (=> b!793948 (= res!538465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793949 () Bool)

(assert (=> b!793949 (= e!440936 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!793950 () Bool)

(declare-fun res!538466 () Bool)

(assert (=> b!793950 (=> (not res!538466) (not e!440939))))

(assert (=> b!793950 (= res!538466 (validKeyInArray!0 (select (arr!20643 a!3170) j!153)))))

(declare-fun b!793951 () Bool)

(declare-fun res!538464 () Bool)

(assert (=> b!793951 (=> (not res!538464) (not e!440937))))

(declare-datatypes ((List!14606 0))(
  ( (Nil!14603) (Cons!14602 (h!15731 (_ BitVec 64)) (t!20921 List!14606)) )
))
(declare-fun arrayNoDuplicates!0 (array!43126 (_ BitVec 32) List!14606) Bool)

(assert (=> b!793951 (= res!538464 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14603))))

(declare-fun b!793952 () Bool)

(declare-fun res!538470 () Bool)

(assert (=> b!793952 (=> (not res!538470) (not e!440937))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793952 (= res!538470 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21064 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20643 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21064 a!3170)) (= (select (arr!20643 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793953 () Bool)

(assert (=> b!793953 (= e!440939 e!440937)))

(declare-fun res!538472 () Bool)

(assert (=> b!793953 (=> (not res!538472) (not e!440937))))

(declare-fun lt!353925 () SeekEntryResult!8234)

(assert (=> b!793953 (= res!538472 (or (= lt!353925 (MissingZero!8234 i!1163)) (= lt!353925 (MissingVacant!8234 i!1163))))))

(assert (=> b!793953 (= lt!353925 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68336 res!538467) b!793944))

(assert (= (and b!793944 res!538469) b!793950))

(assert (= (and b!793950 res!538466) b!793947))

(assert (= (and b!793947 res!538468) b!793946))

(assert (= (and b!793946 res!538463) b!793953))

(assert (= (and b!793953 res!538472) b!793948))

(assert (= (and b!793948 res!538465) b!793951))

(assert (= (and b!793951 res!538464) b!793952))

(assert (= (and b!793952 res!538470) b!793945))

(assert (= (and b!793945 res!538471) b!793949))

(declare-fun m!734453 () Bool)

(assert (=> b!793953 m!734453))

(declare-fun m!734455 () Bool)

(assert (=> b!793948 m!734455))

(declare-fun m!734457 () Bool)

(assert (=> b!793947 m!734457))

(declare-fun m!734459 () Bool)

(assert (=> b!793945 m!734459))

(declare-fun m!734461 () Bool)

(assert (=> b!793945 m!734461))

(declare-fun m!734463 () Bool)

(assert (=> b!793945 m!734463))

(declare-fun m!734465 () Bool)

(assert (=> b!793945 m!734465))

(declare-fun m!734467 () Bool)

(assert (=> b!793946 m!734467))

(declare-fun m!734469 () Bool)

(assert (=> start!68336 m!734469))

(declare-fun m!734471 () Bool)

(assert (=> start!68336 m!734471))

(declare-fun m!734473 () Bool)

(assert (=> b!793950 m!734473))

(assert (=> b!793950 m!734473))

(declare-fun m!734475 () Bool)

(assert (=> b!793950 m!734475))

(declare-fun m!734477 () Bool)

(assert (=> b!793951 m!734477))

(declare-fun m!734479 () Bool)

(assert (=> b!793952 m!734479))

(declare-fun m!734481 () Bool)

(assert (=> b!793952 m!734481))

(push 1)

