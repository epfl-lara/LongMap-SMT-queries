; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68968 () Bool)

(assert start!68968)

(declare-fun b!804516 () Bool)

(declare-fun res!549041 () Bool)

(declare-fun e!445687 () Bool)

(assert (=> b!804516 (=> (not res!549041) (not e!445687))))

(declare-datatypes ((array!43758 0))(
  ( (array!43759 (arr!20959 (Array (_ BitVec 32) (_ BitVec 64))) (size!21380 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43758)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804516 (= res!549041 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804517 () Bool)

(declare-fun res!549040 () Bool)

(assert (=> b!804517 (=> (not res!549040) (not e!445687))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804517 (= res!549040 (validKeyInArray!0 (select (arr!20959 a!3170) j!153)))))

(declare-fun b!804518 () Bool)

(declare-fun res!549039 () Bool)

(assert (=> b!804518 (=> (not res!549039) (not e!445687))))

(assert (=> b!804518 (= res!549039 (validKeyInArray!0 k0!2044))))

(declare-fun res!549036 () Bool)

(assert (=> start!68968 (=> (not res!549036) (not e!445687))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68968 (= res!549036 (validMask!0 mask!3266))))

(assert (=> start!68968 e!445687))

(assert (=> start!68968 true))

(declare-fun array_inv!16755 (array!43758) Bool)

(assert (=> start!68968 (array_inv!16755 a!3170)))

(declare-fun b!804519 () Bool)

(declare-fun e!445686 () Bool)

(assert (=> b!804519 (= e!445686 false)))

(declare-fun lt!360175 () Bool)

(declare-datatypes ((List!14922 0))(
  ( (Nil!14919) (Cons!14918 (h!16047 (_ BitVec 64)) (t!21237 List!14922)) )
))
(declare-fun arrayNoDuplicates!0 (array!43758 (_ BitVec 32) List!14922) Bool)

(assert (=> b!804519 (= lt!360175 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14919))))

(declare-fun b!804520 () Bool)

(assert (=> b!804520 (= e!445687 e!445686)))

(declare-fun res!549038 () Bool)

(assert (=> b!804520 (=> (not res!549038) (not e!445686))))

(declare-datatypes ((SeekEntryResult!8550 0))(
  ( (MissingZero!8550 (index!36568 (_ BitVec 32))) (Found!8550 (index!36569 (_ BitVec 32))) (Intermediate!8550 (undefined!9362 Bool) (index!36570 (_ BitVec 32)) (x!67396 (_ BitVec 32))) (Undefined!8550) (MissingVacant!8550 (index!36571 (_ BitVec 32))) )
))
(declare-fun lt!360176 () SeekEntryResult!8550)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804520 (= res!549038 (or (= lt!360176 (MissingZero!8550 i!1163)) (= lt!360176 (MissingVacant!8550 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43758 (_ BitVec 32)) SeekEntryResult!8550)

(assert (=> b!804520 (= lt!360176 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804521 () Bool)

(declare-fun res!549035 () Bool)

(assert (=> b!804521 (=> (not res!549035) (not e!445686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43758 (_ BitVec 32)) Bool)

(assert (=> b!804521 (= res!549035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804522 () Bool)

(declare-fun res!549037 () Bool)

(assert (=> b!804522 (=> (not res!549037) (not e!445687))))

(assert (=> b!804522 (= res!549037 (and (= (size!21380 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21380 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21380 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68968 res!549036) b!804522))

(assert (= (and b!804522 res!549037) b!804517))

(assert (= (and b!804517 res!549040) b!804518))

(assert (= (and b!804518 res!549039) b!804516))

(assert (= (and b!804516 res!549041) b!804520))

(assert (= (and b!804520 res!549038) b!804521))

(assert (= (and b!804521 res!549035) b!804519))

(declare-fun m!746381 () Bool)

(assert (=> b!804516 m!746381))

(declare-fun m!746383 () Bool)

(assert (=> b!804518 m!746383))

(declare-fun m!746385 () Bool)

(assert (=> b!804521 m!746385))

(declare-fun m!746387 () Bool)

(assert (=> b!804520 m!746387))

(declare-fun m!746389 () Bool)

(assert (=> b!804517 m!746389))

(assert (=> b!804517 m!746389))

(declare-fun m!746391 () Bool)

(assert (=> b!804517 m!746391))

(declare-fun m!746393 () Bool)

(assert (=> start!68968 m!746393))

(declare-fun m!746395 () Bool)

(assert (=> start!68968 m!746395))

(declare-fun m!746397 () Bool)

(assert (=> b!804519 m!746397))

(check-sat (not b!804519) (not b!804520) (not start!68968) (not b!804516) (not b!804521) (not b!804517) (not b!804518))
(check-sat)
