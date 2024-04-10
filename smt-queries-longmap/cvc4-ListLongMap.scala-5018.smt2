; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68622 () Bool)

(assert start!68622)

(declare-fun b!798540 () Bool)

(declare-fun e!442932 () Bool)

(declare-fun e!442934 () Bool)

(assert (=> b!798540 (= e!442932 e!442934)))

(declare-fun res!543063 () Bool)

(assert (=> b!798540 (=> (not res!543063) (not e!442934))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43412 0))(
  ( (array!43413 (arr!20786 (Array (_ BitVec 32) (_ BitVec 64))) (size!21207 (_ BitVec 32))) )
))
(declare-fun lt!356471 () array!43412)

(declare-fun lt!356470 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8377 0))(
  ( (MissingZero!8377 (index!35876 (_ BitVec 32))) (Found!8377 (index!35877 (_ BitVec 32))) (Intermediate!8377 (undefined!9189 Bool) (index!35878 (_ BitVec 32)) (x!66759 (_ BitVec 32))) (Undefined!8377) (MissingVacant!8377 (index!35879 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43412 (_ BitVec 32)) SeekEntryResult!8377)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43412 (_ BitVec 32)) SeekEntryResult!8377)

(assert (=> b!798540 (= res!543063 (= (seekEntryOrOpen!0 lt!356470 lt!356471 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356470 lt!356471 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43412)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798540 (= lt!356470 (select (store (arr!20786 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798540 (= lt!356471 (array!43413 (store (arr!20786 a!3170) i!1163 k!2044) (size!21207 a!3170)))))

(declare-fun res!543062 () Bool)

(declare-fun e!442933 () Bool)

(assert (=> start!68622 (=> (not res!543062) (not e!442933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68622 (= res!543062 (validMask!0 mask!3266))))

(assert (=> start!68622 e!442933))

(assert (=> start!68622 true))

(declare-fun array_inv!16582 (array!43412) Bool)

(assert (=> start!68622 (array_inv!16582 a!3170)))

(declare-fun b!798541 () Bool)

(assert (=> b!798541 (= e!442934 false)))

(declare-fun lt!356474 () SeekEntryResult!8377)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798541 (= lt!356474 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20786 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356472 () SeekEntryResult!8377)

(assert (=> b!798541 (= lt!356472 (seekEntryOrOpen!0 (select (arr!20786 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798542 () Bool)

(declare-fun res!543064 () Bool)

(assert (=> b!798542 (=> (not res!543064) (not e!442933))))

(declare-fun arrayContainsKey!0 (array!43412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798542 (= res!543064 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798543 () Bool)

(declare-fun res!543066 () Bool)

(assert (=> b!798543 (=> (not res!543066) (not e!442933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798543 (= res!543066 (validKeyInArray!0 k!2044))))

(declare-fun b!798544 () Bool)

(declare-fun res!543060 () Bool)

(assert (=> b!798544 (=> (not res!543060) (not e!442932))))

(assert (=> b!798544 (= res!543060 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21207 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20786 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21207 a!3170)) (= (select (arr!20786 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798545 () Bool)

(declare-fun res!543068 () Bool)

(assert (=> b!798545 (=> (not res!543068) (not e!442932))))

(declare-datatypes ((List!14749 0))(
  ( (Nil!14746) (Cons!14745 (h!15874 (_ BitVec 64)) (t!21064 List!14749)) )
))
(declare-fun arrayNoDuplicates!0 (array!43412 (_ BitVec 32) List!14749) Bool)

(assert (=> b!798545 (= res!543068 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14746))))

(declare-fun b!798546 () Bool)

(declare-fun res!543065 () Bool)

(assert (=> b!798546 (=> (not res!543065) (not e!442932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43412 (_ BitVec 32)) Bool)

(assert (=> b!798546 (= res!543065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798547 () Bool)

(declare-fun res!543067 () Bool)

(assert (=> b!798547 (=> (not res!543067) (not e!442933))))

(assert (=> b!798547 (= res!543067 (and (= (size!21207 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21207 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21207 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798548 () Bool)

(declare-fun res!543059 () Bool)

(assert (=> b!798548 (=> (not res!543059) (not e!442933))))

(assert (=> b!798548 (= res!543059 (validKeyInArray!0 (select (arr!20786 a!3170) j!153)))))

(declare-fun b!798549 () Bool)

(assert (=> b!798549 (= e!442933 e!442932)))

(declare-fun res!543061 () Bool)

(assert (=> b!798549 (=> (not res!543061) (not e!442932))))

(declare-fun lt!356473 () SeekEntryResult!8377)

(assert (=> b!798549 (= res!543061 (or (= lt!356473 (MissingZero!8377 i!1163)) (= lt!356473 (MissingVacant!8377 i!1163))))))

(assert (=> b!798549 (= lt!356473 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68622 res!543062) b!798547))

(assert (= (and b!798547 res!543067) b!798548))

(assert (= (and b!798548 res!543059) b!798543))

(assert (= (and b!798543 res!543066) b!798542))

(assert (= (and b!798542 res!543064) b!798549))

(assert (= (and b!798549 res!543061) b!798546))

(assert (= (and b!798546 res!543065) b!798545))

(assert (= (and b!798545 res!543068) b!798544))

(assert (= (and b!798544 res!543060) b!798540))

(assert (= (and b!798540 res!543063) b!798541))

(declare-fun m!739459 () Bool)

(assert (=> b!798540 m!739459))

(declare-fun m!739461 () Bool)

(assert (=> b!798540 m!739461))

(declare-fun m!739463 () Bool)

(assert (=> b!798540 m!739463))

(declare-fun m!739465 () Bool)

(assert (=> b!798540 m!739465))

(declare-fun m!739467 () Bool)

(assert (=> b!798546 m!739467))

(declare-fun m!739469 () Bool)

(assert (=> b!798549 m!739469))

(declare-fun m!739471 () Bool)

(assert (=> b!798542 m!739471))

(declare-fun m!739473 () Bool)

(assert (=> b!798544 m!739473))

(declare-fun m!739475 () Bool)

(assert (=> b!798544 m!739475))

(declare-fun m!739477 () Bool)

(assert (=> b!798545 m!739477))

(declare-fun m!739479 () Bool)

(assert (=> start!68622 m!739479))

(declare-fun m!739481 () Bool)

(assert (=> start!68622 m!739481))

(declare-fun m!739483 () Bool)

(assert (=> b!798543 m!739483))

(declare-fun m!739485 () Bool)

(assert (=> b!798548 m!739485))

(assert (=> b!798548 m!739485))

(declare-fun m!739487 () Bool)

(assert (=> b!798548 m!739487))

(assert (=> b!798541 m!739485))

(assert (=> b!798541 m!739485))

(declare-fun m!739489 () Bool)

(assert (=> b!798541 m!739489))

(assert (=> b!798541 m!739485))

(declare-fun m!739491 () Bool)

(assert (=> b!798541 m!739491))

(push 1)

(assert (not start!68622))

(assert (not b!798549))

(assert (not b!798545))

(assert (not b!798542))

(assert (not b!798540))

