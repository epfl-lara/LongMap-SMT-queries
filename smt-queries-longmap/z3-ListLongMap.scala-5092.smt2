; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69326 () Bool)

(assert start!69326)

(declare-fun b!807326 () Bool)

(declare-fun res!550905 () Bool)

(declare-fun e!447164 () Bool)

(assert (=> b!807326 (=> (not res!550905) (not e!447164))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43858 0))(
  ( (array!43859 (arr!21001 (Array (_ BitVec 32) (_ BitVec 64))) (size!21421 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43858)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807326 (= res!550905 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21421 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21001 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21421 a!3170)) (= (select (arr!21001 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807327 () Bool)

(declare-fun res!550910 () Bool)

(assert (=> b!807327 (=> (not res!550910) (not e!447164))))

(declare-datatypes ((List!14871 0))(
  ( (Nil!14868) (Cons!14867 (h!16002 (_ BitVec 64)) (t!21178 List!14871)) )
))
(declare-fun arrayNoDuplicates!0 (array!43858 (_ BitVec 32) List!14871) Bool)

(assert (=> b!807327 (= res!550910 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14868))))

(declare-fun res!550906 () Bool)

(declare-fun e!447163 () Bool)

(assert (=> start!69326 (=> (not res!550906) (not e!447163))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69326 (= res!550906 (validMask!0 mask!3266))))

(assert (=> start!69326 e!447163))

(assert (=> start!69326 true))

(declare-fun array_inv!16860 (array!43858) Bool)

(assert (=> start!69326 (array_inv!16860 a!3170)))

(declare-fun b!807328 () Bool)

(declare-fun res!550903 () Bool)

(assert (=> b!807328 (=> (not res!550903) (not e!447164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43858 (_ BitVec 32)) Bool)

(assert (=> b!807328 (= res!550903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807329 () Bool)

(declare-fun res!550901 () Bool)

(assert (=> b!807329 (=> (not res!550901) (not e!447163))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807329 (= res!550901 (and (= (size!21421 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21421 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21421 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807330 () Bool)

(declare-fun res!550911 () Bool)

(assert (=> b!807330 (=> (not res!550911) (not e!447163))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807330 (= res!550911 (validKeyInArray!0 k0!2044))))

(declare-fun b!807331 () Bool)

(declare-fun res!550907 () Bool)

(assert (=> b!807331 (=> (not res!550907) (not e!447163))))

(assert (=> b!807331 (= res!550907 (validKeyInArray!0 (select (arr!21001 a!3170) j!153)))))

(declare-fun b!807332 () Bool)

(assert (=> b!807332 (= e!447163 e!447164)))

(declare-fun res!550908 () Bool)

(assert (=> b!807332 (=> (not res!550908) (not e!447164))))

(declare-datatypes ((SeekEntryResult!8548 0))(
  ( (MissingZero!8548 (index!36560 (_ BitVec 32))) (Found!8548 (index!36561 (_ BitVec 32))) (Intermediate!8548 (undefined!9360 Bool) (index!36562 (_ BitVec 32)) (x!67542 (_ BitVec 32))) (Undefined!8548) (MissingVacant!8548 (index!36563 (_ BitVec 32))) )
))
(declare-fun lt!361496 () SeekEntryResult!8548)

(assert (=> b!807332 (= res!550908 (or (= lt!361496 (MissingZero!8548 i!1163)) (= lt!361496 (MissingVacant!8548 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43858 (_ BitVec 32)) SeekEntryResult!8548)

(assert (=> b!807332 (= lt!361496 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807333 () Bool)

(declare-fun e!447162 () Bool)

(assert (=> b!807333 (= e!447164 e!447162)))

(declare-fun res!550904 () Bool)

(assert (=> b!807333 (=> (not res!550904) (not e!447162))))

(declare-fun lt!361495 () SeekEntryResult!8548)

(declare-fun lt!361498 () SeekEntryResult!8548)

(assert (=> b!807333 (= res!550904 (= lt!361495 lt!361498))))

(declare-fun lt!361493 () array!43858)

(declare-fun lt!361497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43858 (_ BitVec 32)) SeekEntryResult!8548)

(assert (=> b!807333 (= lt!361498 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361497 lt!361493 mask!3266))))

(assert (=> b!807333 (= lt!361495 (seekEntryOrOpen!0 lt!361497 lt!361493 mask!3266))))

(assert (=> b!807333 (= lt!361497 (select (store (arr!21001 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807333 (= lt!361493 (array!43859 (store (arr!21001 a!3170) i!1163 k0!2044) (size!21421 a!3170)))))

(declare-fun b!807334 () Bool)

(declare-fun e!447165 () Bool)

(assert (=> b!807334 (= e!447162 e!447165)))

(declare-fun res!550902 () Bool)

(assert (=> b!807334 (=> (not res!550902) (not e!447165))))

(declare-fun lt!361494 () SeekEntryResult!8548)

(declare-fun lt!361499 () SeekEntryResult!8548)

(assert (=> b!807334 (= res!550902 (and (= lt!361499 lt!361494) (= lt!361494 (Found!8548 j!153)) (= (select (arr!21001 a!3170) index!1236) (select (arr!21001 a!3170) j!153))))))

(assert (=> b!807334 (= lt!361494 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21001 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807334 (= lt!361499 (seekEntryOrOpen!0 (select (arr!21001 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807335 () Bool)

(assert (=> b!807335 (= e!447165 (not true))))

(assert (=> b!807335 (= lt!361498 (Found!8548 index!1236))))

(declare-fun b!807336 () Bool)

(declare-fun res!550909 () Bool)

(assert (=> b!807336 (=> (not res!550909) (not e!447163))))

(declare-fun arrayContainsKey!0 (array!43858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807336 (= res!550909 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69326 res!550906) b!807329))

(assert (= (and b!807329 res!550901) b!807331))

(assert (= (and b!807331 res!550907) b!807330))

(assert (= (and b!807330 res!550911) b!807336))

(assert (= (and b!807336 res!550909) b!807332))

(assert (= (and b!807332 res!550908) b!807328))

(assert (= (and b!807328 res!550903) b!807327))

(assert (= (and b!807327 res!550910) b!807326))

(assert (= (and b!807326 res!550905) b!807333))

(assert (= (and b!807333 res!550904) b!807334))

(assert (= (and b!807334 res!550902) b!807335))

(declare-fun m!749617 () Bool)

(assert (=> b!807326 m!749617))

(declare-fun m!749619 () Bool)

(assert (=> b!807326 m!749619))

(declare-fun m!749621 () Bool)

(assert (=> b!807336 m!749621))

(declare-fun m!749623 () Bool)

(assert (=> b!807331 m!749623))

(assert (=> b!807331 m!749623))

(declare-fun m!749625 () Bool)

(assert (=> b!807331 m!749625))

(declare-fun m!749627 () Bool)

(assert (=> b!807330 m!749627))

(declare-fun m!749629 () Bool)

(assert (=> b!807333 m!749629))

(declare-fun m!749631 () Bool)

(assert (=> b!807333 m!749631))

(declare-fun m!749633 () Bool)

(assert (=> b!807333 m!749633))

(declare-fun m!749635 () Bool)

(assert (=> b!807333 m!749635))

(declare-fun m!749637 () Bool)

(assert (=> b!807334 m!749637))

(assert (=> b!807334 m!749623))

(assert (=> b!807334 m!749623))

(declare-fun m!749639 () Bool)

(assert (=> b!807334 m!749639))

(assert (=> b!807334 m!749623))

(declare-fun m!749641 () Bool)

(assert (=> b!807334 m!749641))

(declare-fun m!749643 () Bool)

(assert (=> b!807327 m!749643))

(declare-fun m!749645 () Bool)

(assert (=> start!69326 m!749645))

(declare-fun m!749647 () Bool)

(assert (=> start!69326 m!749647))

(declare-fun m!749649 () Bool)

(assert (=> b!807332 m!749649))

(declare-fun m!749651 () Bool)

(assert (=> b!807328 m!749651))

(check-sat (not start!69326) (not b!807328) (not b!807336) (not b!807331) (not b!807327) (not b!807332) (not b!807330) (not b!807333) (not b!807334))
(check-sat)
