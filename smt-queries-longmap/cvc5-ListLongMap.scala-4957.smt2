; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68252 () Bool)

(assert start!68252)

(declare-fun b!792889 () Bool)

(declare-fun e!440548 () Bool)

(declare-fun e!440549 () Bool)

(assert (=> b!792889 (= e!440548 e!440549)))

(declare-fun res!537415 () Bool)

(assert (=> b!792889 (=> (not res!537415) (not e!440549))))

(declare-datatypes ((SeekEntryResult!8192 0))(
  ( (MissingZero!8192 (index!35136 (_ BitVec 32))) (Found!8192 (index!35137 (_ BitVec 32))) (Intermediate!8192 (undefined!9004 Bool) (index!35138 (_ BitVec 32)) (x!66086 (_ BitVec 32))) (Undefined!8192) (MissingVacant!8192 (index!35139 (_ BitVec 32))) )
))
(declare-fun lt!353606 () SeekEntryResult!8192)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792889 (= res!537415 (or (= lt!353606 (MissingZero!8192 i!1163)) (= lt!353606 (MissingVacant!8192 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43042 0))(
  ( (array!43043 (arr!20601 (Array (_ BitVec 32) (_ BitVec 64))) (size!21022 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43042)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43042 (_ BitVec 32)) SeekEntryResult!8192)

(assert (=> b!792889 (= lt!353606 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792890 () Bool)

(declare-fun res!537416 () Bool)

(assert (=> b!792890 (=> (not res!537416) (not e!440548))))

(declare-fun arrayContainsKey!0 (array!43042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792890 (= res!537416 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792891 () Bool)

(declare-fun res!537408 () Bool)

(assert (=> b!792891 (=> (not res!537408) (not e!440549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43042 (_ BitVec 32)) Bool)

(assert (=> b!792891 (= res!537408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792892 () Bool)

(declare-fun res!537413 () Bool)

(assert (=> b!792892 (=> (not res!537413) (not e!440548))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792892 (= res!537413 (and (= (size!21022 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21022 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21022 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792893 () Bool)

(declare-fun res!537414 () Bool)

(assert (=> b!792893 (=> (not res!537414) (not e!440549))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792893 (= res!537414 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21022 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20601 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21022 a!3170)) (= (select (arr!20601 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792894 () Bool)

(declare-fun res!537410 () Bool)

(assert (=> b!792894 (=> (not res!537410) (not e!440548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792894 (= res!537410 (validKeyInArray!0 k!2044))))

(declare-fun b!792895 () Bool)

(assert (=> b!792895 (= e!440549 (not (validKeyInArray!0 (select (store (arr!20601 a!3170) i!1163 k!2044) j!153))))))

(declare-fun b!792896 () Bool)

(declare-fun res!537411 () Bool)

(assert (=> b!792896 (=> (not res!537411) (not e!440549))))

(declare-datatypes ((List!14564 0))(
  ( (Nil!14561) (Cons!14560 (h!15689 (_ BitVec 64)) (t!20879 List!14564)) )
))
(declare-fun arrayNoDuplicates!0 (array!43042 (_ BitVec 32) List!14564) Bool)

(assert (=> b!792896 (= res!537411 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14561))))

(declare-fun res!537412 () Bool)

(assert (=> start!68252 (=> (not res!537412) (not e!440548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68252 (= res!537412 (validMask!0 mask!3266))))

(assert (=> start!68252 e!440548))

(assert (=> start!68252 true))

(declare-fun array_inv!16397 (array!43042) Bool)

(assert (=> start!68252 (array_inv!16397 a!3170)))

(declare-fun b!792897 () Bool)

(declare-fun res!537409 () Bool)

(assert (=> b!792897 (=> (not res!537409) (not e!440548))))

(assert (=> b!792897 (= res!537409 (validKeyInArray!0 (select (arr!20601 a!3170) j!153)))))

(assert (= (and start!68252 res!537412) b!792892))

(assert (= (and b!792892 res!537413) b!792897))

(assert (= (and b!792897 res!537409) b!792894))

(assert (= (and b!792894 res!537410) b!792890))

(assert (= (and b!792890 res!537416) b!792889))

(assert (= (and b!792889 res!537415) b!792891))

(assert (= (and b!792891 res!537408) b!792896))

(assert (= (and b!792896 res!537411) b!792893))

(assert (= (and b!792893 res!537414) b!792895))

(declare-fun m!733391 () Bool)

(assert (=> b!792889 m!733391))

(declare-fun m!733393 () Bool)

(assert (=> b!792890 m!733393))

(declare-fun m!733395 () Bool)

(assert (=> start!68252 m!733395))

(declare-fun m!733397 () Bool)

(assert (=> start!68252 m!733397))

(declare-fun m!733399 () Bool)

(assert (=> b!792896 m!733399))

(declare-fun m!733401 () Bool)

(assert (=> b!792895 m!733401))

(declare-fun m!733403 () Bool)

(assert (=> b!792895 m!733403))

(assert (=> b!792895 m!733403))

(declare-fun m!733405 () Bool)

(assert (=> b!792895 m!733405))

(declare-fun m!733407 () Bool)

(assert (=> b!792893 m!733407))

(declare-fun m!733409 () Bool)

(assert (=> b!792893 m!733409))

(declare-fun m!733411 () Bool)

(assert (=> b!792894 m!733411))

(declare-fun m!733413 () Bool)

(assert (=> b!792891 m!733413))

(declare-fun m!733415 () Bool)

(assert (=> b!792897 m!733415))

(assert (=> b!792897 m!733415))

(declare-fun m!733417 () Bool)

(assert (=> b!792897 m!733417))

(push 1)

(assert (not b!792894))

(assert (not b!792897))

(assert (not b!792891))

(assert (not b!792889))

(assert (not start!68252))

(assert (not b!792890))

(assert (not b!792896))

(assert (not b!792895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

