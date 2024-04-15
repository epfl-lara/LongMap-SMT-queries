; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31008 () Bool)

(assert start!31008)

(declare-fun b!311592 () Bool)

(declare-fun res!168200 () Bool)

(declare-fun e!194357 () Bool)

(assert (=> b!311592 (=> (not res!168200) (not e!194357))))

(declare-datatypes ((array!15914 0))(
  ( (array!15915 (arr!7539 (Array (_ BitVec 32) (_ BitVec 64))) (size!7892 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15914)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311592 (= res!168200 (and (= (size!7892 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7892 a!3293))))))

(declare-fun b!311593 () Bool)

(declare-fun e!194359 () Bool)

(declare-fun e!194358 () Bool)

(assert (=> b!311593 (= e!194359 (not e!194358))))

(declare-fun res!168192 () Bool)

(assert (=> b!311593 (=> res!168192 e!194358)))

(declare-datatypes ((SeekEntryResult!2678 0))(
  ( (MissingZero!2678 (index!12888 (_ BitVec 32))) (Found!2678 (index!12889 (_ BitVec 32))) (Intermediate!2678 (undefined!3490 Bool) (index!12890 (_ BitVec 32)) (x!31118 (_ BitVec 32))) (Undefined!2678) (MissingVacant!2678 (index!12891 (_ BitVec 32))) )
))
(declare-fun lt!152342 () SeekEntryResult!2678)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!152337 () SeekEntryResult!2678)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152336 () (_ BitVec 32))

(assert (=> b!311593 (= res!168192 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152336 #b00000000000000000000000000000000) (bvsge lt!152336 (size!7892 a!3293)) (not (= lt!152337 lt!152342))))))

(declare-fun lt!152338 () SeekEntryResult!2678)

(declare-fun lt!152340 () SeekEntryResult!2678)

(assert (=> b!311593 (= lt!152338 lt!152340)))

(declare-fun lt!152335 () array!15914)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15914 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!311593 (= lt!152340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152336 k0!2441 lt!152335 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311593 (= lt!152338 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152335 mask!3709))))

(assert (=> b!311593 (= lt!152335 (array!15915 (store (arr!7539 a!3293) i!1240 k0!2441) (size!7892 a!3293)))))

(declare-fun lt!152339 () SeekEntryResult!2678)

(assert (=> b!311593 (= lt!152339 lt!152337)))

(assert (=> b!311593 (= lt!152337 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152336 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311593 (= lt!152336 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311594 () Bool)

(declare-fun res!168196 () Bool)

(assert (=> b!311594 (=> (not res!168196) (not e!194357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15914 (_ BitVec 32)) Bool)

(assert (=> b!311594 (= res!168196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311595 () Bool)

(declare-fun res!168197 () Bool)

(declare-fun e!194356 () Bool)

(assert (=> b!311595 (=> (not res!168197) (not e!194356))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311595 (= res!168197 (and (= (select (arr!7539 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7892 a!3293))))))

(declare-fun b!311596 () Bool)

(declare-fun res!168193 () Bool)

(assert (=> b!311596 (=> (not res!168193) (not e!194357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311596 (= res!168193 (validKeyInArray!0 k0!2441))))

(declare-fun b!311597 () Bool)

(assert (=> b!311597 (= e!194356 e!194359)))

(declare-fun res!168201 () Bool)

(assert (=> b!311597 (=> (not res!168201) (not e!194359))))

(assert (=> b!311597 (= res!168201 (and (= lt!152339 lt!152342) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7539 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311597 (= lt!152339 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311598 () Bool)

(declare-fun res!168198 () Bool)

(assert (=> b!311598 (=> (not res!168198) (not e!194357))))

(declare-fun arrayContainsKey!0 (array!15914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311598 (= res!168198 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311599 () Bool)

(assert (=> b!311599 (= e!194357 e!194356)))

(declare-fun res!168195 () Bool)

(assert (=> b!311599 (=> (not res!168195) (not e!194356))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311599 (= res!168195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152342))))

(assert (=> b!311599 (= lt!152342 (Intermediate!2678 false resIndex!52 resX!52))))

(declare-fun res!168194 () Bool)

(assert (=> start!31008 (=> (not res!168194) (not e!194357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31008 (= res!168194 (validMask!0 mask!3709))))

(assert (=> start!31008 e!194357))

(declare-fun array_inv!5511 (array!15914) Bool)

(assert (=> start!31008 (array_inv!5511 a!3293)))

(assert (=> start!31008 true))

(declare-fun b!311600 () Bool)

(declare-fun res!168199 () Bool)

(assert (=> b!311600 (=> (not res!168199) (not e!194357))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15914 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!311600 (= res!168199 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2678 i!1240)))))

(declare-fun b!311601 () Bool)

(assert (=> b!311601 (= e!194358 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!311601 (= lt!152340 lt!152337)))

(declare-datatypes ((Unit!9559 0))(
  ( (Unit!9560) )
))
(declare-fun lt!152341 () Unit!9559)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15914 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9559)

(assert (=> b!311601 (= lt!152341 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152336 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31008 res!168194) b!311592))

(assert (= (and b!311592 res!168200) b!311596))

(assert (= (and b!311596 res!168193) b!311598))

(assert (= (and b!311598 res!168198) b!311600))

(assert (= (and b!311600 res!168199) b!311594))

(assert (= (and b!311594 res!168196) b!311599))

(assert (= (and b!311599 res!168195) b!311595))

(assert (= (and b!311595 res!168197) b!311597))

(assert (= (and b!311597 res!168201) b!311593))

(assert (= (and b!311593 (not res!168192)) b!311601))

(declare-fun m!321145 () Bool)

(assert (=> b!311594 m!321145))

(declare-fun m!321147 () Bool)

(assert (=> b!311593 m!321147))

(declare-fun m!321149 () Bool)

(assert (=> b!311593 m!321149))

(declare-fun m!321151 () Bool)

(assert (=> b!311593 m!321151))

(declare-fun m!321153 () Bool)

(assert (=> b!311593 m!321153))

(declare-fun m!321155 () Bool)

(assert (=> b!311593 m!321155))

(declare-fun m!321157 () Bool)

(assert (=> b!311595 m!321157))

(declare-fun m!321159 () Bool)

(assert (=> b!311597 m!321159))

(declare-fun m!321161 () Bool)

(assert (=> b!311597 m!321161))

(declare-fun m!321163 () Bool)

(assert (=> b!311601 m!321163))

(declare-fun m!321165 () Bool)

(assert (=> b!311598 m!321165))

(declare-fun m!321167 () Bool)

(assert (=> start!31008 m!321167))

(declare-fun m!321169 () Bool)

(assert (=> start!31008 m!321169))

(declare-fun m!321171 () Bool)

(assert (=> b!311596 m!321171))

(declare-fun m!321173 () Bool)

(assert (=> b!311600 m!321173))

(declare-fun m!321175 () Bool)

(assert (=> b!311599 m!321175))

(assert (=> b!311599 m!321175))

(declare-fun m!321177 () Bool)

(assert (=> b!311599 m!321177))

(check-sat (not start!31008) (not b!311600) (not b!311599) (not b!311597) (not b!311596) (not b!311598) (not b!311593) (not b!311594) (not b!311601))
(check-sat)
