; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68948 () Bool)

(assert start!68948)

(declare-fun res!548929 () Bool)

(declare-fun e!445534 () Bool)

(assert (=> start!68948 (=> (not res!548929) (not e!445534))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68948 (= res!548929 (validMask!0 mask!3266))))

(assert (=> start!68948 e!445534))

(assert (=> start!68948 true))

(declare-datatypes ((array!43755 0))(
  ( (array!43756 (arr!20958 (Array (_ BitVec 32) (_ BitVec 64))) (size!21379 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43755)

(declare-fun array_inv!16841 (array!43755) Bool)

(assert (=> start!68948 (array_inv!16841 a!3170)))

(declare-fun b!804266 () Bool)

(declare-fun e!445532 () Bool)

(assert (=> b!804266 (= e!445532 false)))

(declare-fun lt!359936 () Bool)

(declare-datatypes ((List!14960 0))(
  ( (Nil!14957) (Cons!14956 (h!16085 (_ BitVec 64)) (t!21266 List!14960)) )
))
(declare-fun arrayNoDuplicates!0 (array!43755 (_ BitVec 32) List!14960) Bool)

(assert (=> b!804266 (= lt!359936 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14957))))

(declare-fun b!804267 () Bool)

(declare-fun res!548931 () Bool)

(assert (=> b!804267 (=> (not res!548931) (not e!445534))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804267 (= res!548931 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804268 () Bool)

(declare-fun res!548928 () Bool)

(assert (=> b!804268 (=> (not res!548928) (not e!445534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804268 (= res!548928 (validKeyInArray!0 k!2044))))

(declare-fun b!804269 () Bool)

(assert (=> b!804269 (= e!445534 e!445532)))

(declare-fun res!548926 () Bool)

(assert (=> b!804269 (=> (not res!548926) (not e!445532))))

(declare-datatypes ((SeekEntryResult!8546 0))(
  ( (MissingZero!8546 (index!36552 (_ BitVec 32))) (Found!8546 (index!36553 (_ BitVec 32))) (Intermediate!8546 (undefined!9358 Bool) (index!36554 (_ BitVec 32)) (x!67387 (_ BitVec 32))) (Undefined!8546) (MissingVacant!8546 (index!36555 (_ BitVec 32))) )
))
(declare-fun lt!359935 () SeekEntryResult!8546)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804269 (= res!548926 (or (= lt!359935 (MissingZero!8546 i!1163)) (= lt!359935 (MissingVacant!8546 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43755 (_ BitVec 32)) SeekEntryResult!8546)

(assert (=> b!804269 (= lt!359935 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804270 () Bool)

(declare-fun res!548930 () Bool)

(assert (=> b!804270 (=> (not res!548930) (not e!445534))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804270 (= res!548930 (and (= (size!21379 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21379 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21379 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804271 () Bool)

(declare-fun res!548925 () Bool)

(assert (=> b!804271 (=> (not res!548925) (not e!445532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43755 (_ BitVec 32)) Bool)

(assert (=> b!804271 (= res!548925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804272 () Bool)

(declare-fun res!548927 () Bool)

(assert (=> b!804272 (=> (not res!548927) (not e!445534))))

(assert (=> b!804272 (= res!548927 (validKeyInArray!0 (select (arr!20958 a!3170) j!153)))))

(assert (= (and start!68948 res!548929) b!804270))

(assert (= (and b!804270 res!548930) b!804272))

(assert (= (and b!804272 res!548927) b!804268))

(assert (= (and b!804268 res!548928) b!804267))

(assert (= (and b!804267 res!548931) b!804269))

(assert (= (and b!804269 res!548926) b!804271))

(assert (= (and b!804271 res!548925) b!804266))

(declare-fun m!745639 () Bool)

(assert (=> start!68948 m!745639))

(declare-fun m!745641 () Bool)

(assert (=> start!68948 m!745641))

(declare-fun m!745643 () Bool)

(assert (=> b!804269 m!745643))

(declare-fun m!745645 () Bool)

(assert (=> b!804271 m!745645))

(declare-fun m!745647 () Bool)

(assert (=> b!804267 m!745647))

(declare-fun m!745649 () Bool)

(assert (=> b!804266 m!745649))

(declare-fun m!745651 () Bool)

(assert (=> b!804268 m!745651))

(declare-fun m!745653 () Bool)

(assert (=> b!804272 m!745653))

(assert (=> b!804272 m!745653))

(declare-fun m!745655 () Bool)

(assert (=> b!804272 m!745655))

(push 1)

(assert (not b!804269))

(assert (not b!804271))

(assert (not b!804267))

(assert (not b!804268))

(assert (not b!804272))

(assert (not start!68948))

(assert (not b!804266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

