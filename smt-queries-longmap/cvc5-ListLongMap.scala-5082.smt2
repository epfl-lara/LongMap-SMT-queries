; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69002 () Bool)

(assert start!69002)

(declare-fun b!804969 () Bool)

(declare-fun res!549488 () Bool)

(declare-fun e!445862 () Bool)

(assert (=> b!804969 (=> (not res!549488) (not e!445862))))

(declare-datatypes ((array!43792 0))(
  ( (array!43793 (arr!20976 (Array (_ BitVec 32) (_ BitVec 64))) (size!21397 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43792)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804969 (= res!549488 (validKeyInArray!0 (select (arr!20976 a!3170) j!153)))))

(declare-fun res!549491 () Bool)

(assert (=> start!69002 (=> (not res!549491) (not e!445862))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69002 (= res!549491 (validMask!0 mask!3266))))

(assert (=> start!69002 e!445862))

(assert (=> start!69002 true))

(declare-fun array_inv!16772 (array!43792) Bool)

(assert (=> start!69002 (array_inv!16772 a!3170)))

(declare-fun b!804970 () Bool)

(declare-fun e!445860 () Bool)

(declare-fun e!445861 () Bool)

(assert (=> b!804970 (= e!445860 e!445861)))

(declare-fun res!549494 () Bool)

(assert (=> b!804970 (=> (not res!549494) (not e!445861))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360391 () array!43792)

(declare-fun lt!360392 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8567 0))(
  ( (MissingZero!8567 (index!36636 (_ BitVec 32))) (Found!8567 (index!36637 (_ BitVec 32))) (Intermediate!8567 (undefined!9379 Bool) (index!36638 (_ BitVec 32)) (x!67461 (_ BitVec 32))) (Undefined!8567) (MissingVacant!8567 (index!36639 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43792 (_ BitVec 32)) SeekEntryResult!8567)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43792 (_ BitVec 32)) SeekEntryResult!8567)

(assert (=> b!804970 (= res!549494 (= (seekEntryOrOpen!0 lt!360392 lt!360391 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360392 lt!360391 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804970 (= lt!360392 (select (store (arr!20976 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804970 (= lt!360391 (array!43793 (store (arr!20976 a!3170) i!1163 k!2044) (size!21397 a!3170)))))

(declare-fun b!804971 () Bool)

(declare-fun res!549490 () Bool)

(assert (=> b!804971 (=> (not res!549490) (not e!445862))))

(declare-fun arrayContainsKey!0 (array!43792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804971 (= res!549490 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804972 () Bool)

(declare-fun res!549489 () Bool)

(assert (=> b!804972 (=> (not res!549489) (not e!445860))))

(declare-datatypes ((List!14939 0))(
  ( (Nil!14936) (Cons!14935 (h!16064 (_ BitVec 64)) (t!21254 List!14939)) )
))
(declare-fun arrayNoDuplicates!0 (array!43792 (_ BitVec 32) List!14939) Bool)

(assert (=> b!804972 (= res!549489 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14936))))

(declare-fun b!804973 () Bool)

(declare-fun res!549493 () Bool)

(assert (=> b!804973 (=> (not res!549493) (not e!445862))))

(assert (=> b!804973 (= res!549493 (and (= (size!21397 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21397 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21397 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804974 () Bool)

(declare-fun res!549496 () Bool)

(assert (=> b!804974 (=> (not res!549496) (not e!445862))))

(assert (=> b!804974 (= res!549496 (validKeyInArray!0 k!2044))))

(declare-fun b!804975 () Bool)

(declare-fun res!549495 () Bool)

(assert (=> b!804975 (=> (not res!549495) (not e!445860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43792 (_ BitVec 32)) Bool)

(assert (=> b!804975 (= res!549495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804976 () Bool)

(assert (=> b!804976 (= e!445861 false)))

(declare-fun lt!360394 () SeekEntryResult!8567)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804976 (= lt!360394 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20976 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360393 () SeekEntryResult!8567)

(assert (=> b!804976 (= lt!360393 (seekEntryOrOpen!0 (select (arr!20976 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804977 () Bool)

(declare-fun res!549492 () Bool)

(assert (=> b!804977 (=> (not res!549492) (not e!445860))))

(assert (=> b!804977 (= res!549492 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21397 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20976 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21397 a!3170)) (= (select (arr!20976 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804978 () Bool)

(assert (=> b!804978 (= e!445862 e!445860)))

(declare-fun res!549497 () Bool)

(assert (=> b!804978 (=> (not res!549497) (not e!445860))))

(declare-fun lt!360395 () SeekEntryResult!8567)

(assert (=> b!804978 (= res!549497 (or (= lt!360395 (MissingZero!8567 i!1163)) (= lt!360395 (MissingVacant!8567 i!1163))))))

(assert (=> b!804978 (= lt!360395 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69002 res!549491) b!804973))

(assert (= (and b!804973 res!549493) b!804969))

(assert (= (and b!804969 res!549488) b!804974))

(assert (= (and b!804974 res!549496) b!804971))

(assert (= (and b!804971 res!549490) b!804978))

(assert (= (and b!804978 res!549497) b!804975))

(assert (= (and b!804975 res!549495) b!804972))

(assert (= (and b!804972 res!549489) b!804977))

(assert (= (and b!804977 res!549492) b!804970))

(assert (= (and b!804970 res!549494) b!804976))

(declare-fun m!746855 () Bool)

(assert (=> b!804970 m!746855))

(declare-fun m!746857 () Bool)

(assert (=> b!804970 m!746857))

(declare-fun m!746859 () Bool)

(assert (=> b!804970 m!746859))

(declare-fun m!746861 () Bool)

(assert (=> b!804970 m!746861))

(declare-fun m!746863 () Bool)

(assert (=> b!804971 m!746863))

(declare-fun m!746865 () Bool)

(assert (=> b!804976 m!746865))

(assert (=> b!804976 m!746865))

(declare-fun m!746867 () Bool)

(assert (=> b!804976 m!746867))

(assert (=> b!804976 m!746865))

(declare-fun m!746869 () Bool)

(assert (=> b!804976 m!746869))

(declare-fun m!746871 () Bool)

(assert (=> b!804978 m!746871))

(declare-fun m!746873 () Bool)

(assert (=> b!804972 m!746873))

(declare-fun m!746875 () Bool)

(assert (=> b!804975 m!746875))

(declare-fun m!746877 () Bool)

(assert (=> b!804977 m!746877))

(declare-fun m!746879 () Bool)

(assert (=> b!804977 m!746879))

(declare-fun m!746881 () Bool)

(assert (=> start!69002 m!746881))

(declare-fun m!746883 () Bool)

(assert (=> start!69002 m!746883))

(declare-fun m!746885 () Bool)

(assert (=> b!804974 m!746885))

(assert (=> b!804969 m!746865))

(assert (=> b!804969 m!746865))

(declare-fun m!746887 () Bool)

(assert (=> b!804969 m!746887))

(push 1)

