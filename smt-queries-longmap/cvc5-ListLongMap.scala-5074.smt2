; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68954 () Bool)

(assert start!68954)

(declare-fun b!804369 () Bool)

(declare-fun res!548892 () Bool)

(declare-fun e!445624 () Bool)

(assert (=> b!804369 (=> (not res!548892) (not e!445624))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804369 (= res!548892 (validKeyInArray!0 k!2044))))

(declare-fun b!804370 () Bool)

(declare-fun e!445623 () Bool)

(assert (=> b!804370 (= e!445623 false)))

(declare-fun lt!360133 () Bool)

(declare-datatypes ((array!43744 0))(
  ( (array!43745 (arr!20952 (Array (_ BitVec 32) (_ BitVec 64))) (size!21373 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43744)

(declare-datatypes ((List!14915 0))(
  ( (Nil!14912) (Cons!14911 (h!16040 (_ BitVec 64)) (t!21230 List!14915)) )
))
(declare-fun arrayNoDuplicates!0 (array!43744 (_ BitVec 32) List!14915) Bool)

(assert (=> b!804370 (= lt!360133 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14912))))

(declare-fun res!548888 () Bool)

(assert (=> start!68954 (=> (not res!548888) (not e!445624))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68954 (= res!548888 (validMask!0 mask!3266))))

(assert (=> start!68954 e!445624))

(assert (=> start!68954 true))

(declare-fun array_inv!16748 (array!43744) Bool)

(assert (=> start!68954 (array_inv!16748 a!3170)))

(declare-fun b!804371 () Bool)

(declare-fun res!548889 () Bool)

(assert (=> b!804371 (=> (not res!548889) (not e!445624))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804371 (= res!548889 (and (= (size!21373 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21373 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21373 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804372 () Bool)

(declare-fun res!548894 () Bool)

(assert (=> b!804372 (=> (not res!548894) (not e!445624))))

(declare-fun arrayContainsKey!0 (array!43744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804372 (= res!548894 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804373 () Bool)

(declare-fun res!548893 () Bool)

(assert (=> b!804373 (=> (not res!548893) (not e!445623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43744 (_ BitVec 32)) Bool)

(assert (=> b!804373 (= res!548893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804374 () Bool)

(declare-fun res!548891 () Bool)

(assert (=> b!804374 (=> (not res!548891) (not e!445624))))

(assert (=> b!804374 (= res!548891 (validKeyInArray!0 (select (arr!20952 a!3170) j!153)))))

(declare-fun b!804375 () Bool)

(assert (=> b!804375 (= e!445624 e!445623)))

(declare-fun res!548890 () Bool)

(assert (=> b!804375 (=> (not res!548890) (not e!445623))))

(declare-datatypes ((SeekEntryResult!8543 0))(
  ( (MissingZero!8543 (index!36540 (_ BitVec 32))) (Found!8543 (index!36541 (_ BitVec 32))) (Intermediate!8543 (undefined!9355 Bool) (index!36542 (_ BitVec 32)) (x!67373 (_ BitVec 32))) (Undefined!8543) (MissingVacant!8543 (index!36543 (_ BitVec 32))) )
))
(declare-fun lt!360134 () SeekEntryResult!8543)

(assert (=> b!804375 (= res!548890 (or (= lt!360134 (MissingZero!8543 i!1163)) (= lt!360134 (MissingVacant!8543 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43744 (_ BitVec 32)) SeekEntryResult!8543)

(assert (=> b!804375 (= lt!360134 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68954 res!548888) b!804371))

(assert (= (and b!804371 res!548889) b!804374))

(assert (= (and b!804374 res!548891) b!804369))

(assert (= (and b!804369 res!548892) b!804372))

(assert (= (and b!804372 res!548894) b!804375))

(assert (= (and b!804375 res!548890) b!804373))

(assert (= (and b!804373 res!548893) b!804370))

(declare-fun m!746255 () Bool)

(assert (=> b!804370 m!746255))

(declare-fun m!746257 () Bool)

(assert (=> b!804375 m!746257))

(declare-fun m!746259 () Bool)

(assert (=> start!68954 m!746259))

(declare-fun m!746261 () Bool)

(assert (=> start!68954 m!746261))

(declare-fun m!746263 () Bool)

(assert (=> b!804373 m!746263))

(declare-fun m!746265 () Bool)

(assert (=> b!804369 m!746265))

(declare-fun m!746267 () Bool)

(assert (=> b!804374 m!746267))

(assert (=> b!804374 m!746267))

(declare-fun m!746269 () Bool)

(assert (=> b!804374 m!746269))

(declare-fun m!746271 () Bool)

(assert (=> b!804372 m!746271))

(push 1)
