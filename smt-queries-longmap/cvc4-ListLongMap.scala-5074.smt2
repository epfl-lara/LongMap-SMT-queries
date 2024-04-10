; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68958 () Bool)

(assert start!68958)

(declare-fun b!804411 () Bool)

(declare-fun res!548934 () Bool)

(declare-fun e!445643 () Bool)

(assert (=> b!804411 (=> (not res!548934) (not e!445643))))

(declare-datatypes ((array!43748 0))(
  ( (array!43749 (arr!20954 (Array (_ BitVec 32) (_ BitVec 64))) (size!21375 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43748)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804411 (= res!548934 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804413 () Bool)

(declare-fun res!548931 () Bool)

(assert (=> b!804413 (=> (not res!548931) (not e!445643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804413 (= res!548931 (validKeyInArray!0 k!2044))))

(declare-fun b!804414 () Bool)

(declare-fun e!445642 () Bool)

(assert (=> b!804414 (= e!445642 false)))

(declare-fun lt!360145 () Bool)

(declare-datatypes ((List!14917 0))(
  ( (Nil!14914) (Cons!14913 (h!16042 (_ BitVec 64)) (t!21232 List!14917)) )
))
(declare-fun arrayNoDuplicates!0 (array!43748 (_ BitVec 32) List!14917) Bool)

(assert (=> b!804414 (= lt!360145 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14914))))

(declare-fun b!804415 () Bool)

(assert (=> b!804415 (= e!445643 e!445642)))

(declare-fun res!548930 () Bool)

(assert (=> b!804415 (=> (not res!548930) (not e!445642))))

(declare-datatypes ((SeekEntryResult!8545 0))(
  ( (MissingZero!8545 (index!36548 (_ BitVec 32))) (Found!8545 (index!36549 (_ BitVec 32))) (Intermediate!8545 (undefined!9357 Bool) (index!36550 (_ BitVec 32)) (x!67375 (_ BitVec 32))) (Undefined!8545) (MissingVacant!8545 (index!36551 (_ BitVec 32))) )
))
(declare-fun lt!360146 () SeekEntryResult!8545)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804415 (= res!548930 (or (= lt!360146 (MissingZero!8545 i!1163)) (= lt!360146 (MissingVacant!8545 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43748 (_ BitVec 32)) SeekEntryResult!8545)

(assert (=> b!804415 (= lt!360146 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!548933 () Bool)

(assert (=> start!68958 (=> (not res!548933) (not e!445643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68958 (= res!548933 (validMask!0 mask!3266))))

(assert (=> start!68958 e!445643))

(assert (=> start!68958 true))

(declare-fun array_inv!16750 (array!43748) Bool)

(assert (=> start!68958 (array_inv!16750 a!3170)))

(declare-fun b!804412 () Bool)

(declare-fun res!548936 () Bool)

(assert (=> b!804412 (=> (not res!548936) (not e!445643))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804412 (= res!548936 (validKeyInArray!0 (select (arr!20954 a!3170) j!153)))))

(declare-fun b!804416 () Bool)

(declare-fun res!548932 () Bool)

(assert (=> b!804416 (=> (not res!548932) (not e!445643))))

(assert (=> b!804416 (= res!548932 (and (= (size!21375 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21375 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21375 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804417 () Bool)

(declare-fun res!548935 () Bool)

(assert (=> b!804417 (=> (not res!548935) (not e!445642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43748 (_ BitVec 32)) Bool)

(assert (=> b!804417 (= res!548935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68958 res!548933) b!804416))

(assert (= (and b!804416 res!548932) b!804412))

(assert (= (and b!804412 res!548936) b!804413))

(assert (= (and b!804413 res!548931) b!804411))

(assert (= (and b!804411 res!548934) b!804415))

(assert (= (and b!804415 res!548930) b!804417))

(assert (= (and b!804417 res!548935) b!804414))

(declare-fun m!746291 () Bool)

(assert (=> b!804411 m!746291))

(declare-fun m!746293 () Bool)

(assert (=> b!804417 m!746293))

(declare-fun m!746295 () Bool)

(assert (=> b!804414 m!746295))

(declare-fun m!746297 () Bool)

(assert (=> b!804415 m!746297))

(declare-fun m!746299 () Bool)

(assert (=> start!68958 m!746299))

(declare-fun m!746301 () Bool)

(assert (=> start!68958 m!746301))

(declare-fun m!746303 () Bool)

(assert (=> b!804413 m!746303))

(declare-fun m!746305 () Bool)

(assert (=> b!804412 m!746305))

(assert (=> b!804412 m!746305))

(declare-fun m!746307 () Bool)

(assert (=> b!804412 m!746307))

(push 1)

(assert (not b!804415))

(assert (not b!804417))

(assert (not b!804412))

(assert (not start!68958))

(assert (not b!804414))

(assert (not b!804411))

