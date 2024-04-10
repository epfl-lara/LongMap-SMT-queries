; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68612 () Bool)

(assert start!68612)

(declare-fun b!798383 () Bool)

(declare-fun res!542912 () Bool)

(declare-fun e!442867 () Bool)

(assert (=> b!798383 (=> (not res!542912) (not e!442867))))

(declare-datatypes ((array!43402 0))(
  ( (array!43403 (arr!20781 (Array (_ BitVec 32) (_ BitVec 64))) (size!21202 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43402)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798383 (= res!542912 (and (= (size!21202 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21202 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21202 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798384 () Bool)

(declare-fun res!542911 () Bool)

(assert (=> b!798384 (=> (not res!542911) (not e!442867))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798384 (= res!542911 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798385 () Bool)

(declare-fun e!442865 () Bool)

(declare-fun e!442866 () Bool)

(assert (=> b!798385 (= e!442865 e!442866)))

(declare-fun res!542904 () Bool)

(assert (=> b!798385 (=> (not res!542904) (not e!442866))))

(declare-datatypes ((SeekEntryResult!8372 0))(
  ( (MissingZero!8372 (index!35856 (_ BitVec 32))) (Found!8372 (index!35857 (_ BitVec 32))) (Intermediate!8372 (undefined!9184 Bool) (index!35858 (_ BitVec 32)) (x!66746 (_ BitVec 32))) (Undefined!8372) (MissingVacant!8372 (index!35859 (_ BitVec 32))) )
))
(declare-fun lt!356383 () SeekEntryResult!8372)

(declare-fun lt!356381 () SeekEntryResult!8372)

(assert (=> b!798385 (= res!542904 (= lt!356383 lt!356381))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356387 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!356385 () array!43402)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43402 (_ BitVec 32)) SeekEntryResult!8372)

(assert (=> b!798385 (= lt!356381 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356387 lt!356385 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43402 (_ BitVec 32)) SeekEntryResult!8372)

(assert (=> b!798385 (= lt!356383 (seekEntryOrOpen!0 lt!356387 lt!356385 mask!3266))))

(assert (=> b!798385 (= lt!356387 (select (store (arr!20781 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798385 (= lt!356385 (array!43403 (store (arr!20781 a!3170) i!1163 k!2044) (size!21202 a!3170)))))

(declare-fun res!542910 () Bool)

(assert (=> start!68612 (=> (not res!542910) (not e!442867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68612 (= res!542910 (validMask!0 mask!3266))))

(assert (=> start!68612 e!442867))

(assert (=> start!68612 true))

(declare-fun array_inv!16577 (array!43402) Bool)

(assert (=> start!68612 (array_inv!16577 a!3170)))

(declare-fun b!798386 () Bool)

(declare-fun e!442868 () Bool)

(assert (=> b!798386 (= e!442866 e!442868)))

(declare-fun res!542908 () Bool)

(assert (=> b!798386 (=> (not res!542908) (not e!442868))))

(declare-fun lt!356386 () SeekEntryResult!8372)

(declare-fun lt!356382 () SeekEntryResult!8372)

(assert (=> b!798386 (= res!542908 (and (= lt!356386 lt!356382) (= lt!356382 (Found!8372 j!153)) (= (select (arr!20781 a!3170) index!1236) (select (arr!20781 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798386 (= lt!356382 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20781 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798386 (= lt!356386 (seekEntryOrOpen!0 (select (arr!20781 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798387 () Bool)

(declare-fun res!542909 () Bool)

(assert (=> b!798387 (=> (not res!542909) (not e!442865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43402 (_ BitVec 32)) Bool)

(assert (=> b!798387 (= res!542909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798388 () Bool)

(declare-fun res!542905 () Bool)

(assert (=> b!798388 (=> (not res!542905) (not e!442865))))

(assert (=> b!798388 (= res!542905 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21202 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20781 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21202 a!3170)) (= (select (arr!20781 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798389 () Bool)

(assert (=> b!798389 (= e!442868 (not true))))

(assert (=> b!798389 (= lt!356381 (Found!8372 index!1236))))

(declare-fun b!798390 () Bool)

(declare-fun res!542903 () Bool)

(assert (=> b!798390 (=> (not res!542903) (not e!442867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798390 (= res!542903 (validKeyInArray!0 (select (arr!20781 a!3170) j!153)))))

(declare-fun b!798391 () Bool)

(declare-fun res!542907 () Bool)

(assert (=> b!798391 (=> (not res!542907) (not e!442867))))

(assert (=> b!798391 (= res!542907 (validKeyInArray!0 k!2044))))

(declare-fun b!798392 () Bool)

(assert (=> b!798392 (= e!442867 e!442865)))

(declare-fun res!542902 () Bool)

(assert (=> b!798392 (=> (not res!542902) (not e!442865))))

(declare-fun lt!356384 () SeekEntryResult!8372)

(assert (=> b!798392 (= res!542902 (or (= lt!356384 (MissingZero!8372 i!1163)) (= lt!356384 (MissingVacant!8372 i!1163))))))

(assert (=> b!798392 (= lt!356384 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798393 () Bool)

(declare-fun res!542906 () Bool)

(assert (=> b!798393 (=> (not res!542906) (not e!442865))))

(declare-datatypes ((List!14744 0))(
  ( (Nil!14741) (Cons!14740 (h!15869 (_ BitVec 64)) (t!21059 List!14744)) )
))
(declare-fun arrayNoDuplicates!0 (array!43402 (_ BitVec 32) List!14744) Bool)

(assert (=> b!798393 (= res!542906 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14741))))

(assert (= (and start!68612 res!542910) b!798383))

(assert (= (and b!798383 res!542912) b!798390))

(assert (= (and b!798390 res!542903) b!798391))

(assert (= (and b!798391 res!542907) b!798384))

(assert (= (and b!798384 res!542911) b!798392))

(assert (= (and b!798392 res!542902) b!798387))

(assert (= (and b!798387 res!542909) b!798393))

(assert (= (and b!798393 res!542906) b!798388))

(assert (= (and b!798388 res!542905) b!798385))

(assert (= (and b!798385 res!542904) b!798386))

(assert (= (and b!798386 res!542908) b!798389))

(declare-fun m!739283 () Bool)

(assert (=> b!798385 m!739283))

(declare-fun m!739285 () Bool)

(assert (=> b!798385 m!739285))

(declare-fun m!739287 () Bool)

(assert (=> b!798385 m!739287))

(declare-fun m!739289 () Bool)

(assert (=> b!798385 m!739289))

(declare-fun m!739291 () Bool)

(assert (=> b!798386 m!739291))

(declare-fun m!739293 () Bool)

(assert (=> b!798386 m!739293))

(assert (=> b!798386 m!739293))

(declare-fun m!739295 () Bool)

(assert (=> b!798386 m!739295))

(assert (=> b!798386 m!739293))

(declare-fun m!739297 () Bool)

(assert (=> b!798386 m!739297))

(declare-fun m!739299 () Bool)

(assert (=> start!68612 m!739299))

(declare-fun m!739301 () Bool)

(assert (=> start!68612 m!739301))

(declare-fun m!739303 () Bool)

(assert (=> b!798384 m!739303))

(declare-fun m!739305 () Bool)

(assert (=> b!798391 m!739305))

(declare-fun m!739307 () Bool)

(assert (=> b!798387 m!739307))

(declare-fun m!739309 () Bool)

(assert (=> b!798388 m!739309))

(declare-fun m!739311 () Bool)

(assert (=> b!798388 m!739311))

(declare-fun m!739313 () Bool)

(assert (=> b!798392 m!739313))

(declare-fun m!739315 () Bool)

(assert (=> b!798393 m!739315))

(assert (=> b!798390 m!739293))

(assert (=> b!798390 m!739293))

(declare-fun m!739317 () Bool)

(assert (=> b!798390 m!739317))

(push 1)

