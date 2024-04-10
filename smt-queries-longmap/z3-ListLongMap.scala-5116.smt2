; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69412 () Bool)

(assert start!69412)

(declare-fun b!809378 () Bool)

(declare-fun res!553109 () Bool)

(declare-fun e!448021 () Bool)

(assert (=> b!809378 (=> (not res!553109) (not e!448021))))

(declare-datatypes ((array!44010 0))(
  ( (array!44011 (arr!21079 (Array (_ BitVec 32) (_ BitVec 64))) (size!21500 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44010)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809378 (= res!553109 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809379 () Bool)

(declare-fun e!448022 () Bool)

(declare-fun e!448018 () Bool)

(assert (=> b!809379 (= e!448022 e!448018)))

(declare-fun res!553106 () Bool)

(assert (=> b!809379 (=> (not res!553106) (not e!448018))))

(declare-fun lt!362713 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362712 () array!44010)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8670 0))(
  ( (MissingZero!8670 (index!37048 (_ BitVec 32))) (Found!8670 (index!37049 (_ BitVec 32))) (Intermediate!8670 (undefined!9482 Bool) (index!37050 (_ BitVec 32)) (x!67854 (_ BitVec 32))) (Undefined!8670) (MissingVacant!8670 (index!37051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44010 (_ BitVec 32)) SeekEntryResult!8670)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44010 (_ BitVec 32)) SeekEntryResult!8670)

(assert (=> b!809379 (= res!553106 (= (seekEntryOrOpen!0 lt!362713 lt!362712 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362713 lt!362712 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809379 (= lt!362713 (select (store (arr!21079 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809379 (= lt!362712 (array!44011 (store (arr!21079 a!3170) i!1163 k0!2044) (size!21500 a!3170)))))

(declare-fun b!809380 () Bool)

(assert (=> b!809380 (= e!448021 e!448022)))

(declare-fun res!553105 () Bool)

(assert (=> b!809380 (=> (not res!553105) (not e!448022))))

(declare-fun lt!362716 () SeekEntryResult!8670)

(assert (=> b!809380 (= res!553105 (or (= lt!362716 (MissingZero!8670 i!1163)) (= lt!362716 (MissingVacant!8670 i!1163))))))

(assert (=> b!809380 (= lt!362716 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809381 () Bool)

(declare-fun res!553113 () Bool)

(assert (=> b!809381 (=> (not res!553113) (not e!448022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44010 (_ BitVec 32)) Bool)

(assert (=> b!809381 (= res!553113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809383 () Bool)

(declare-fun res!553112 () Bool)

(assert (=> b!809383 (=> (not res!553112) (not e!448022))))

(declare-datatypes ((List!15042 0))(
  ( (Nil!15039) (Cons!15038 (h!16167 (_ BitVec 64)) (t!21357 List!15042)) )
))
(declare-fun arrayNoDuplicates!0 (array!44010 (_ BitVec 32) List!15042) Bool)

(assert (=> b!809383 (= res!553112 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15039))))

(declare-fun b!809384 () Bool)

(declare-fun e!448019 () Bool)

(assert (=> b!809384 (= e!448018 e!448019)))

(declare-fun res!553108 () Bool)

(assert (=> b!809384 (=> (not res!553108) (not e!448019))))

(declare-fun lt!362715 () SeekEntryResult!8670)

(declare-fun lt!362714 () SeekEntryResult!8670)

(assert (=> b!809384 (= res!553108 (and (= lt!362714 lt!362715) (= lt!362715 (Found!8670 j!153)) (not (= (select (arr!21079 a!3170) index!1236) (select (arr!21079 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809384 (= lt!362715 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809384 (= lt!362714 (seekEntryOrOpen!0 (select (arr!21079 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809385 () Bool)

(declare-fun res!553110 () Bool)

(assert (=> b!809385 (=> (not res!553110) (not e!448021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809385 (= res!553110 (validKeyInArray!0 (select (arr!21079 a!3170) j!153)))))

(declare-fun b!809386 () Bool)

(declare-fun res!553111 () Bool)

(assert (=> b!809386 (=> (not res!553111) (not e!448021))))

(assert (=> b!809386 (= res!553111 (validKeyInArray!0 k0!2044))))

(declare-fun b!809387 () Bool)

(assert (=> b!809387 (= e!448019 false)))

(declare-fun lt!362717 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809387 (= lt!362717 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809388 () Bool)

(declare-fun res!553115 () Bool)

(assert (=> b!809388 (=> (not res!553115) (not e!448021))))

(assert (=> b!809388 (= res!553115 (and (= (size!21500 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21500 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21500 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809382 () Bool)

(declare-fun res!553114 () Bool)

(assert (=> b!809382 (=> (not res!553114) (not e!448022))))

(assert (=> b!809382 (= res!553114 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21500 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21079 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21500 a!3170)) (= (select (arr!21079 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!553107 () Bool)

(assert (=> start!69412 (=> (not res!553107) (not e!448021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69412 (= res!553107 (validMask!0 mask!3266))))

(assert (=> start!69412 e!448021))

(assert (=> start!69412 true))

(declare-fun array_inv!16875 (array!44010) Bool)

(assert (=> start!69412 (array_inv!16875 a!3170)))

(assert (= (and start!69412 res!553107) b!809388))

(assert (= (and b!809388 res!553115) b!809385))

(assert (= (and b!809385 res!553110) b!809386))

(assert (= (and b!809386 res!553111) b!809378))

(assert (= (and b!809378 res!553109) b!809380))

(assert (= (and b!809380 res!553105) b!809381))

(assert (= (and b!809381 res!553113) b!809383))

(assert (= (and b!809383 res!553112) b!809382))

(assert (= (and b!809382 res!553114) b!809379))

(assert (= (and b!809379 res!553106) b!809384))

(assert (= (and b!809384 res!553108) b!809387))

(declare-fun m!751561 () Bool)

(assert (=> b!809387 m!751561))

(declare-fun m!751563 () Bool)

(assert (=> b!809381 m!751563))

(declare-fun m!751565 () Bool)

(assert (=> b!809378 m!751565))

(declare-fun m!751567 () Bool)

(assert (=> b!809384 m!751567))

(declare-fun m!751569 () Bool)

(assert (=> b!809384 m!751569))

(assert (=> b!809384 m!751569))

(declare-fun m!751571 () Bool)

(assert (=> b!809384 m!751571))

(assert (=> b!809384 m!751569))

(declare-fun m!751573 () Bool)

(assert (=> b!809384 m!751573))

(declare-fun m!751575 () Bool)

(assert (=> b!809382 m!751575))

(declare-fun m!751577 () Bool)

(assert (=> b!809382 m!751577))

(declare-fun m!751579 () Bool)

(assert (=> b!809380 m!751579))

(declare-fun m!751581 () Bool)

(assert (=> start!69412 m!751581))

(declare-fun m!751583 () Bool)

(assert (=> start!69412 m!751583))

(declare-fun m!751585 () Bool)

(assert (=> b!809379 m!751585))

(declare-fun m!751587 () Bool)

(assert (=> b!809379 m!751587))

(declare-fun m!751589 () Bool)

(assert (=> b!809379 m!751589))

(declare-fun m!751591 () Bool)

(assert (=> b!809379 m!751591))

(declare-fun m!751593 () Bool)

(assert (=> b!809386 m!751593))

(assert (=> b!809385 m!751569))

(assert (=> b!809385 m!751569))

(declare-fun m!751595 () Bool)

(assert (=> b!809385 m!751595))

(declare-fun m!751597 () Bool)

(assert (=> b!809383 m!751597))

(check-sat (not start!69412) (not b!809383) (not b!809386) (not b!809380) (not b!809379) (not b!809381) (not b!809378) (not b!809384) (not b!809385) (not b!809387))
(check-sat)
