; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68140 () Bool)

(assert start!68140)

(declare-fun b!792305 () Bool)

(declare-fun e!440225 () Bool)

(declare-fun e!440224 () Bool)

(assert (=> b!792305 (= e!440225 e!440224)))

(declare-fun res!536969 () Bool)

(assert (=> b!792305 (=> (not res!536969) (not e!440224))))

(declare-datatypes ((SeekEntryResult!8179 0))(
  ( (MissingZero!8179 (index!35084 (_ BitVec 32))) (Found!8179 (index!35085 (_ BitVec 32))) (Intermediate!8179 (undefined!8991 Bool) (index!35086 (_ BitVec 32)) (x!66033 (_ BitVec 32))) (Undefined!8179) (MissingVacant!8179 (index!35087 (_ BitVec 32))) )
))
(declare-fun lt!353429 () SeekEntryResult!8179)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792305 (= res!536969 (or (= lt!353429 (MissingZero!8179 i!1163)) (= lt!353429 (MissingVacant!8179 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43010 0))(
  ( (array!43011 (arr!20588 (Array (_ BitVec 32) (_ BitVec 64))) (size!21009 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43010)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43010 (_ BitVec 32)) SeekEntryResult!8179)

(assert (=> b!792305 (= lt!353429 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!536971 () Bool)

(assert (=> start!68140 (=> (not res!536971) (not e!440225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68140 (= res!536971 (validMask!0 mask!3266))))

(assert (=> start!68140 e!440225))

(assert (=> start!68140 true))

(declare-fun array_inv!16384 (array!43010) Bool)

(assert (=> start!68140 (array_inv!16384 a!3170)))

(declare-fun b!792306 () Bool)

(declare-fun res!536968 () Bool)

(assert (=> b!792306 (=> (not res!536968) (not e!440225))))

(declare-fun arrayContainsKey!0 (array!43010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792306 (= res!536968 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792307 () Bool)

(declare-datatypes ((List!14551 0))(
  ( (Nil!14548) (Cons!14547 (h!15676 (_ BitVec 64)) (t!20866 List!14551)) )
))
(declare-fun noDuplicate!1286 (List!14551) Bool)

(assert (=> b!792307 (= e!440224 (not (noDuplicate!1286 Nil!14548)))))

(declare-fun b!792308 () Bool)

(declare-fun res!536974 () Bool)

(assert (=> b!792308 (=> (not res!536974) (not e!440225))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792308 (= res!536974 (validKeyInArray!0 (select (arr!20588 a!3170) j!153)))))

(declare-fun b!792309 () Bool)

(declare-fun res!536975 () Bool)

(assert (=> b!792309 (=> (not res!536975) (not e!440225))))

(assert (=> b!792309 (= res!536975 (validKeyInArray!0 k!2044))))

(declare-fun b!792310 () Bool)

(declare-fun res!536972 () Bool)

(assert (=> b!792310 (=> (not res!536972) (not e!440224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43010 (_ BitVec 32)) Bool)

(assert (=> b!792310 (= res!536972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792311 () Bool)

(declare-fun res!536970 () Bool)

(assert (=> b!792311 (=> (not res!536970) (not e!440225))))

(assert (=> b!792311 (= res!536970 (and (= (size!21009 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21009 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21009 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792312 () Bool)

(declare-fun res!536973 () Bool)

(assert (=> b!792312 (=> (not res!536973) (not e!440224))))

(assert (=> b!792312 (= res!536973 (and (bvsle #b00000000000000000000000000000000 (size!21009 a!3170)) (bvslt (size!21009 a!3170) #b01111111111111111111111111111111)))))

(assert (= (and start!68140 res!536971) b!792311))

(assert (= (and b!792311 res!536970) b!792308))

(assert (= (and b!792308 res!536974) b!792309))

(assert (= (and b!792309 res!536975) b!792306))

(assert (= (and b!792306 res!536968) b!792305))

(assert (= (and b!792305 res!536969) b!792310))

(assert (= (and b!792310 res!536972) b!792312))

(assert (= (and b!792312 res!536973) b!792307))

(declare-fun m!732929 () Bool)

(assert (=> b!792308 m!732929))

(assert (=> b!792308 m!732929))

(declare-fun m!732931 () Bool)

(assert (=> b!792308 m!732931))

(declare-fun m!732933 () Bool)

(assert (=> b!792307 m!732933))

(declare-fun m!732935 () Bool)

(assert (=> b!792310 m!732935))

(declare-fun m!732937 () Bool)

(assert (=> b!792305 m!732937))

(declare-fun m!732939 () Bool)

(assert (=> b!792309 m!732939))

(declare-fun m!732941 () Bool)

(assert (=> start!68140 m!732941))

(declare-fun m!732943 () Bool)

(assert (=> start!68140 m!732943))

(declare-fun m!732945 () Bool)

(assert (=> b!792306 m!732945))

(push 1)

(assert (not b!792310))

(assert (not b!792305))

(assert (not b!792308))

(assert (not b!792307))

(assert (not start!68140))

(assert (not b!792309))

(assert (not b!792306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

