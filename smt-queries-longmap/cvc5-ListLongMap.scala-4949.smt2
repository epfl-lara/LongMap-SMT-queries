; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68082 () Bool)

(assert start!68082)

(declare-fun b!791972 () Bool)

(declare-fun res!536707 () Bool)

(declare-fun e!440060 () Bool)

(assert (=> b!791972 (=> (not res!536707) (not e!440060))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791972 (= res!536707 (validKeyInArray!0 k!2044))))

(declare-fun b!791973 () Bool)

(declare-fun res!536710 () Bool)

(assert (=> b!791973 (=> (not res!536710) (not e!440060))))

(declare-datatypes ((array!42985 0))(
  ( (array!42986 (arr!20577 (Array (_ BitVec 32) (_ BitVec 64))) (size!20998 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42985)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791973 (= res!536710 (validKeyInArray!0 (select (arr!20577 a!3170) j!153)))))

(declare-fun b!791974 () Bool)

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8168 0))(
  ( (MissingZero!8168 (index!35040 (_ BitVec 32))) (Found!8168 (index!35041 (_ BitVec 32))) (Intermediate!8168 (undefined!8980 Bool) (index!35042 (_ BitVec 32)) (x!65998 (_ BitVec 32))) (Undefined!8168) (MissingVacant!8168 (index!35043 (_ BitVec 32))) )
))
(declare-fun lt!353342 () SeekEntryResult!8168)

(assert (=> b!791974 (= e!440060 (and (or (= lt!353342 (MissingZero!8168 i!1163)) (= lt!353342 (MissingVacant!8168 i!1163))) (bvsgt #b00000000000000000000000000000000 (size!20998 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42985 (_ BitVec 32)) SeekEntryResult!8168)

(assert (=> b!791974 (= lt!353342 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791975 () Bool)

(declare-fun res!536711 () Bool)

(assert (=> b!791975 (=> (not res!536711) (not e!440060))))

(declare-fun arrayContainsKey!0 (array!42985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791975 (= res!536711 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536709 () Bool)

(assert (=> start!68082 (=> (not res!536709) (not e!440060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68082 (= res!536709 (validMask!0 mask!3266))))

(assert (=> start!68082 e!440060))

(assert (=> start!68082 true))

(declare-fun array_inv!16373 (array!42985) Bool)

(assert (=> start!68082 (array_inv!16373 a!3170)))

(declare-fun b!791976 () Bool)

(declare-fun res!536708 () Bool)

(assert (=> b!791976 (=> (not res!536708) (not e!440060))))

(assert (=> b!791976 (= res!536708 (and (= (size!20998 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20998 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20998 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68082 res!536709) b!791976))

(assert (= (and b!791976 res!536708) b!791973))

(assert (= (and b!791973 res!536710) b!791972))

(assert (= (and b!791972 res!536707) b!791975))

(assert (= (and b!791975 res!536711) b!791974))

(declare-fun m!732671 () Bool)

(assert (=> b!791975 m!732671))

(declare-fun m!732673 () Bool)

(assert (=> b!791974 m!732673))

(declare-fun m!732675 () Bool)

(assert (=> b!791973 m!732675))

(assert (=> b!791973 m!732675))

(declare-fun m!732677 () Bool)

(assert (=> b!791973 m!732677))

(declare-fun m!732679 () Bool)

(assert (=> start!68082 m!732679))

(declare-fun m!732681 () Bool)

(assert (=> start!68082 m!732681))

(declare-fun m!732683 () Bool)

(assert (=> b!791972 m!732683))

(push 1)

(assert (not start!68082))

(assert (not b!791973))

(assert (not b!791975))

(assert (not b!791974))

(assert (not b!791972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

