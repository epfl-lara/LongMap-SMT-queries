; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68914 () Bool)

(assert start!68914)

(declare-fun b!803908 () Bool)

(declare-fun res!548573 () Bool)

(declare-fun e!445379 () Bool)

(assert (=> b!803908 (=> (not res!548573) (not e!445379))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43721 0))(
  ( (array!43722 (arr!20941 (Array (_ BitVec 32) (_ BitVec 64))) (size!21362 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43721)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!803908 (= res!548573 (and (= (size!21362 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21362 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21362 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803909 () Bool)

(declare-fun e!445380 () Bool)

(assert (=> b!803909 (= e!445379 e!445380)))

(declare-fun res!548571 () Bool)

(assert (=> b!803909 (=> (not res!548571) (not e!445380))))

(declare-datatypes ((SeekEntryResult!8529 0))(
  ( (MissingZero!8529 (index!36484 (_ BitVec 32))) (Found!8529 (index!36485 (_ BitVec 32))) (Intermediate!8529 (undefined!9341 Bool) (index!36486 (_ BitVec 32)) (x!67322 (_ BitVec 32))) (Undefined!8529) (MissingVacant!8529 (index!36487 (_ BitVec 32))) )
))
(declare-fun lt!359834 () SeekEntryResult!8529)

(assert (=> b!803909 (= res!548571 (or (= lt!359834 (MissingZero!8529 i!1163)) (= lt!359834 (MissingVacant!8529 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43721 (_ BitVec 32)) SeekEntryResult!8529)

(assert (=> b!803909 (= lt!359834 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803910 () Bool)

(declare-fun res!548567 () Bool)

(assert (=> b!803910 (=> (not res!548567) (not e!445380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43721 (_ BitVec 32)) Bool)

(assert (=> b!803910 (= res!548567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!803911 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803911 (= e!445380 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21362 a!3170)) (= vacantBefore!23 i!1163) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (size!21362 a!3170)))))))

(declare-fun b!803912 () Bool)

(declare-fun res!548572 () Bool)

(assert (=> b!803912 (=> (not res!548572) (not e!445379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803912 (= res!548572 (validKeyInArray!0 k!2044))))

(declare-fun res!548569 () Bool)

(assert (=> start!68914 (=> (not res!548569) (not e!445379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68914 (= res!548569 (validMask!0 mask!3266))))

(assert (=> start!68914 e!445379))

(assert (=> start!68914 true))

(declare-fun array_inv!16824 (array!43721) Bool)

(assert (=> start!68914 (array_inv!16824 a!3170)))

(declare-fun b!803913 () Bool)

(declare-fun res!548568 () Bool)

(assert (=> b!803913 (=> (not res!548568) (not e!445380))))

(declare-datatypes ((List!14943 0))(
  ( (Nil!14940) (Cons!14939 (h!16068 (_ BitVec 64)) (t!21249 List!14943)) )
))
(declare-fun arrayNoDuplicates!0 (array!43721 (_ BitVec 32) List!14943) Bool)

(assert (=> b!803913 (= res!548568 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14940))))

(declare-fun b!803914 () Bool)

(declare-fun res!548574 () Bool)

(assert (=> b!803914 (=> (not res!548574) (not e!445379))))

(assert (=> b!803914 (= res!548574 (validKeyInArray!0 (select (arr!20941 a!3170) j!153)))))

(declare-fun b!803915 () Bool)

(declare-fun res!548570 () Bool)

(assert (=> b!803915 (=> (not res!548570) (not e!445379))))

(declare-fun arrayContainsKey!0 (array!43721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803915 (= res!548570 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68914 res!548569) b!803908))

(assert (= (and b!803908 res!548573) b!803914))

(assert (= (and b!803914 res!548574) b!803912))

(assert (= (and b!803912 res!548572) b!803915))

(assert (= (and b!803915 res!548570) b!803909))

(assert (= (and b!803909 res!548571) b!803910))

(assert (= (and b!803910 res!548567) b!803913))

(assert (= (and b!803913 res!548568) b!803911))

(declare-fun m!745333 () Bool)

(assert (=> b!803915 m!745333))

(declare-fun m!745335 () Bool)

(assert (=> b!803914 m!745335))

(assert (=> b!803914 m!745335))

(declare-fun m!745337 () Bool)

(assert (=> b!803914 m!745337))

(declare-fun m!745339 () Bool)

(assert (=> b!803912 m!745339))

(declare-fun m!745341 () Bool)

(assert (=> start!68914 m!745341))

(declare-fun m!745343 () Bool)

(assert (=> start!68914 m!745343))

(declare-fun m!745345 () Bool)

(assert (=> b!803913 m!745345))

(declare-fun m!745347 () Bool)

(assert (=> b!803909 m!745347))

(declare-fun m!745349 () Bool)

(assert (=> b!803910 m!745349))

(push 1)

(assert (not b!803909))

(assert (not b!803915))

(assert (not b!803913))

(assert (not b!803910))

(assert (not b!803914))

(assert (not b!803912))

(assert (not start!68914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

