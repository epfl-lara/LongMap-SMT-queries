; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68280 () Bool)

(assert start!68280)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43070 0))(
  ( (array!43071 (arr!20615 (Array (_ BitVec 32) (_ BitVec 64))) (size!21036 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43070)

(declare-fun e!440675 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun b!793214 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793214 (= e!440675 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21036 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20615 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21036 a!3170)) (= (select (arr!20615 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793215 () Bool)

(declare-fun res!537736 () Bool)

(declare-fun e!440673 () Bool)

(assert (=> b!793215 (=> (not res!537736) (not e!440673))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793215 (= res!537736 (validKeyInArray!0 (select (arr!20615 a!3170) j!153)))))

(declare-fun b!793216 () Bool)

(declare-fun res!537739 () Bool)

(assert (=> b!793216 (=> (not res!537739) (not e!440673))))

(assert (=> b!793216 (= res!537739 (and (= (size!21036 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21036 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21036 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793217 () Bool)

(declare-fun res!537735 () Bool)

(assert (=> b!793217 (=> (not res!537735) (not e!440673))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793217 (= res!537735 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793218 () Bool)

(declare-fun res!537734 () Bool)

(assert (=> b!793218 (=> (not res!537734) (not e!440675))))

(declare-datatypes ((List!14578 0))(
  ( (Nil!14575) (Cons!14574 (h!15703 (_ BitVec 64)) (t!20893 List!14578)) )
))
(declare-fun arrayNoDuplicates!0 (array!43070 (_ BitVec 32) List!14578) Bool)

(assert (=> b!793218 (= res!537734 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14575))))

(declare-fun res!537740 () Bool)

(assert (=> start!68280 (=> (not res!537740) (not e!440673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68280 (= res!537740 (validMask!0 mask!3266))))

(assert (=> start!68280 e!440673))

(assert (=> start!68280 true))

(declare-fun array_inv!16411 (array!43070) Bool)

(assert (=> start!68280 (array_inv!16411 a!3170)))

(declare-fun b!793219 () Bool)

(declare-fun res!537733 () Bool)

(assert (=> b!793219 (=> (not res!537733) (not e!440675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43070 (_ BitVec 32)) Bool)

(assert (=> b!793219 (= res!537733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793220 () Bool)

(assert (=> b!793220 (= e!440673 e!440675)))

(declare-fun res!537737 () Bool)

(assert (=> b!793220 (=> (not res!537737) (not e!440675))))

(declare-datatypes ((SeekEntryResult!8206 0))(
  ( (MissingZero!8206 (index!35192 (_ BitVec 32))) (Found!8206 (index!35193 (_ BitVec 32))) (Intermediate!8206 (undefined!9018 Bool) (index!35194 (_ BitVec 32)) (x!66132 (_ BitVec 32))) (Undefined!8206) (MissingVacant!8206 (index!35195 (_ BitVec 32))) )
))
(declare-fun lt!353666 () SeekEntryResult!8206)

(assert (=> b!793220 (= res!537737 (or (= lt!353666 (MissingZero!8206 i!1163)) (= lt!353666 (MissingVacant!8206 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43070 (_ BitVec 32)) SeekEntryResult!8206)

(assert (=> b!793220 (= lt!353666 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793221 () Bool)

(declare-fun res!537738 () Bool)

(assert (=> b!793221 (=> (not res!537738) (not e!440673))))

(assert (=> b!793221 (= res!537738 (validKeyInArray!0 k!2044))))

(assert (= (and start!68280 res!537740) b!793216))

(assert (= (and b!793216 res!537739) b!793215))

(assert (= (and b!793215 res!537736) b!793221))

(assert (= (and b!793221 res!537738) b!793217))

(assert (= (and b!793217 res!537735) b!793220))

(assert (= (and b!793220 res!537737) b!793219))

(assert (= (and b!793219 res!537733) b!793218))

(assert (= (and b!793218 res!537734) b!793214))

(declare-fun m!733693 () Bool)

(assert (=> b!793221 m!733693))

(declare-fun m!733695 () Bool)

(assert (=> b!793220 m!733695))

(declare-fun m!733697 () Bool)

(assert (=> b!793218 m!733697))

(declare-fun m!733699 () Bool)

(assert (=> b!793217 m!733699))

(declare-fun m!733701 () Bool)

(assert (=> b!793219 m!733701))

(declare-fun m!733703 () Bool)

(assert (=> b!793214 m!733703))

(declare-fun m!733705 () Bool)

(assert (=> b!793214 m!733705))

(declare-fun m!733707 () Bool)

(assert (=> b!793215 m!733707))

(assert (=> b!793215 m!733707))

(declare-fun m!733709 () Bool)

(assert (=> b!793215 m!733709))

(declare-fun m!733711 () Bool)

(assert (=> start!68280 m!733711))

(declare-fun m!733713 () Bool)

(assert (=> start!68280 m!733713))

(push 1)

(assert (not b!793219))

(assert (not start!68280))

(assert (not b!793220))

(assert (not b!793217))

(assert (not b!793215))

(assert (not b!793221))

(assert (not b!793218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

