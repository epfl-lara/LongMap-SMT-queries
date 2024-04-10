; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69000 () Bool)

(assert start!69000)

(declare-fun b!804939 () Bool)

(declare-fun res!549458 () Bool)

(declare-fun e!445849 () Bool)

(assert (=> b!804939 (=> (not res!549458) (not e!445849))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43790 0))(
  ( (array!43791 (arr!20975 (Array (_ BitVec 32) (_ BitVec 64))) (size!21396 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43790)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804939 (= res!549458 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21396 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20975 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21396 a!3170)) (= (select (arr!20975 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804940 () Bool)

(declare-fun e!445847 () Bool)

(assert (=> b!804940 (= e!445847 e!445849)))

(declare-fun res!549459 () Bool)

(assert (=> b!804940 (=> (not res!549459) (not e!445849))))

(declare-datatypes ((SeekEntryResult!8566 0))(
  ( (MissingZero!8566 (index!36632 (_ BitVec 32))) (Found!8566 (index!36633 (_ BitVec 32))) (Intermediate!8566 (undefined!9378 Bool) (index!36634 (_ BitVec 32)) (x!67452 (_ BitVec 32))) (Undefined!8566) (MissingVacant!8566 (index!36635 (_ BitVec 32))) )
))
(declare-fun lt!360376 () SeekEntryResult!8566)

(assert (=> b!804940 (= res!549459 (or (= lt!360376 (MissingZero!8566 i!1163)) (= lt!360376 (MissingVacant!8566 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43790 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!804940 (= lt!360376 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804941 () Bool)

(declare-fun res!549465 () Bool)

(assert (=> b!804941 (=> (not res!549465) (not e!445847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804941 (= res!549465 (validKeyInArray!0 k!2044))))

(declare-fun res!549466 () Bool)

(assert (=> start!69000 (=> (not res!549466) (not e!445847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69000 (= res!549466 (validMask!0 mask!3266))))

(assert (=> start!69000 e!445847))

(assert (=> start!69000 true))

(declare-fun array_inv!16771 (array!43790) Bool)

(assert (=> start!69000 (array_inv!16771 a!3170)))

(declare-fun b!804942 () Bool)

(declare-fun res!549460 () Bool)

(assert (=> b!804942 (=> (not res!549460) (not e!445849))))

(declare-datatypes ((List!14938 0))(
  ( (Nil!14935) (Cons!14934 (h!16063 (_ BitVec 64)) (t!21253 List!14938)) )
))
(declare-fun arrayNoDuplicates!0 (array!43790 (_ BitVec 32) List!14938) Bool)

(assert (=> b!804942 (= res!549460 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14935))))

(declare-fun b!804943 () Bool)

(declare-fun res!549461 () Bool)

(assert (=> b!804943 (=> (not res!549461) (not e!445847))))

(declare-fun arrayContainsKey!0 (array!43790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804943 (= res!549461 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804944 () Bool)

(declare-fun res!549463 () Bool)

(assert (=> b!804944 (=> (not res!549463) (not e!445847))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804944 (= res!549463 (and (= (size!21396 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21396 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21396 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804945 () Bool)

(declare-fun res!549467 () Bool)

(assert (=> b!804945 (=> (not res!549467) (not e!445849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43790 (_ BitVec 32)) Bool)

(assert (=> b!804945 (= res!549467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804946 () Bool)

(declare-fun e!445850 () Bool)

(assert (=> b!804946 (= e!445849 e!445850)))

(declare-fun res!549462 () Bool)

(assert (=> b!804946 (=> (not res!549462) (not e!445850))))

(declare-fun lt!360380 () (_ BitVec 64))

(declare-fun lt!360377 () array!43790)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43790 (_ BitVec 32)) SeekEntryResult!8566)

(assert (=> b!804946 (= res!549462 (= (seekEntryOrOpen!0 lt!360380 lt!360377 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360380 lt!360377 mask!3266)))))

(assert (=> b!804946 (= lt!360380 (select (store (arr!20975 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804946 (= lt!360377 (array!43791 (store (arr!20975 a!3170) i!1163 k!2044) (size!21396 a!3170)))))

(declare-fun b!804947 () Bool)

(assert (=> b!804947 (= e!445850 false)))

(declare-fun lt!360378 () SeekEntryResult!8566)

(assert (=> b!804947 (= lt!360378 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20975 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360379 () SeekEntryResult!8566)

(assert (=> b!804947 (= lt!360379 (seekEntryOrOpen!0 (select (arr!20975 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804948 () Bool)

(declare-fun res!549464 () Bool)

(assert (=> b!804948 (=> (not res!549464) (not e!445847))))

(assert (=> b!804948 (= res!549464 (validKeyInArray!0 (select (arr!20975 a!3170) j!153)))))

(assert (= (and start!69000 res!549466) b!804944))

(assert (= (and b!804944 res!549463) b!804948))

(assert (= (and b!804948 res!549464) b!804941))

(assert (= (and b!804941 res!549465) b!804943))

(assert (= (and b!804943 res!549461) b!804940))

(assert (= (and b!804940 res!549459) b!804945))

(assert (= (and b!804945 res!549467) b!804942))

(assert (= (and b!804942 res!549460) b!804939))

(assert (= (and b!804939 res!549458) b!804946))

(assert (= (and b!804946 res!549462) b!804947))

(declare-fun m!746821 () Bool)

(assert (=> b!804940 m!746821))

(declare-fun m!746823 () Bool)

(assert (=> b!804946 m!746823))

(declare-fun m!746825 () Bool)

(assert (=> b!804946 m!746825))

(declare-fun m!746827 () Bool)

(assert (=> b!804946 m!746827))

(declare-fun m!746829 () Bool)

(assert (=> b!804946 m!746829))

(declare-fun m!746831 () Bool)

(assert (=> b!804942 m!746831))

(declare-fun m!746833 () Bool)

(assert (=> b!804945 m!746833))

(declare-fun m!746835 () Bool)

(assert (=> start!69000 m!746835))

(declare-fun m!746837 () Bool)

(assert (=> start!69000 m!746837))

(declare-fun m!746839 () Bool)

(assert (=> b!804943 m!746839))

(declare-fun m!746841 () Bool)

(assert (=> b!804941 m!746841))

(declare-fun m!746843 () Bool)

(assert (=> b!804947 m!746843))

(assert (=> b!804947 m!746843))

(declare-fun m!746845 () Bool)

(assert (=> b!804947 m!746845))

(assert (=> b!804947 m!746843))

(declare-fun m!746847 () Bool)

(assert (=> b!804947 m!746847))

(assert (=> b!804948 m!746843))

(assert (=> b!804948 m!746843))

(declare-fun m!746849 () Bool)

(assert (=> b!804948 m!746849))

(declare-fun m!746851 () Bool)

(assert (=> b!804939 m!746851))

(declare-fun m!746853 () Bool)

(assert (=> b!804939 m!746853))

(push 1)

(assert (not b!804948))

(assert (not start!69000))

(assert (not b!804945))

(assert (not b!804942))

(assert (not b!804946))

(assert (not b!804940))

(assert (not b!804947))

(assert (not b!804941))

(assert (not b!804943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

