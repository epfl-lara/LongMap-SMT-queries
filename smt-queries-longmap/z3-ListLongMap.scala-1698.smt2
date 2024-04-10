; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31078 () Bool)

(assert start!31078)

(declare-fun b!312707 () Bool)

(declare-fun res!169163 () Bool)

(declare-fun e!194954 () Bool)

(assert (=> b!312707 (=> (not res!169163) (not e!194954))))

(declare-datatypes ((array!15980 0))(
  ( (array!15981 (arr!7572 (Array (_ BitVec 32) (_ BitVec 64))) (size!7924 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15980)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312707 (= res!169163 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!194956 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!312708 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312708 (= e!194956 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(declare-datatypes ((SeekEntryResult!2712 0))(
  ( (MissingZero!2712 (index!13024 (_ BitVec 32))) (Found!2712 (index!13025 (_ BitVec 32))) (Intermediate!2712 (undefined!3524 Bool) (index!13026 (_ BitVec 32)) (x!31229 (_ BitVec 32))) (Undefined!2712) (MissingVacant!2712 (index!13027 (_ BitVec 32))) )
))
(declare-fun lt!153246 () SeekEntryResult!2712)

(declare-fun lt!153242 () SeekEntryResult!2712)

(assert (=> b!312708 (= lt!153246 lt!153242)))

(declare-fun lt!153243 () (_ BitVec 32))

(declare-datatypes ((Unit!9655 0))(
  ( (Unit!9656) )
))
(declare-fun lt!153248 () Unit!9655)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15980 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9655)

(assert (=> b!312708 (= lt!153248 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153243 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312709 () Bool)

(declare-fun e!194952 () Bool)

(declare-fun e!194953 () Bool)

(assert (=> b!312709 (= e!194952 e!194953)))

(declare-fun res!169166 () Bool)

(assert (=> b!312709 (=> (not res!169166) (not e!194953))))

(declare-fun lt!153247 () SeekEntryResult!2712)

(declare-fun lt!153244 () SeekEntryResult!2712)

(assert (=> b!312709 (= res!169166 (and (= lt!153247 lt!153244) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7572 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15980 (_ BitVec 32)) SeekEntryResult!2712)

(assert (=> b!312709 (= lt!153247 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312710 () Bool)

(declare-fun res!169167 () Bool)

(assert (=> b!312710 (=> (not res!169167) (not e!194952))))

(assert (=> b!312710 (= res!169167 (and (= (select (arr!7572 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7924 a!3293))))))

(declare-fun b!312711 () Bool)

(declare-fun res!169170 () Bool)

(assert (=> b!312711 (=> (not res!169170) (not e!194954))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15980 (_ BitVec 32)) SeekEntryResult!2712)

(assert (=> b!312711 (= res!169170 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2712 i!1240)))))

(declare-fun b!312712 () Bool)

(declare-fun res!169164 () Bool)

(assert (=> b!312712 (=> (not res!169164) (not e!194954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15980 (_ BitVec 32)) Bool)

(assert (=> b!312712 (= res!169164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312713 () Bool)

(declare-fun res!169162 () Bool)

(assert (=> b!312713 (=> (not res!169162) (not e!194954))))

(assert (=> b!312713 (= res!169162 (and (= (size!7924 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7924 a!3293))))))

(declare-fun b!312714 () Bool)

(declare-fun res!169161 () Bool)

(assert (=> b!312714 (=> (not res!169161) (not e!194954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312714 (= res!169161 (validKeyInArray!0 k0!2441))))

(declare-fun res!169165 () Bool)

(assert (=> start!31078 (=> (not res!169165) (not e!194954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31078 (= res!169165 (validMask!0 mask!3709))))

(assert (=> start!31078 e!194954))

(declare-fun array_inv!5535 (array!15980) Bool)

(assert (=> start!31078 (array_inv!5535 a!3293)))

(assert (=> start!31078 true))

(declare-fun b!312715 () Bool)

(assert (=> b!312715 (= e!194954 e!194952)))

(declare-fun res!169168 () Bool)

(assert (=> b!312715 (=> (not res!169168) (not e!194952))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312715 (= res!169168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153244))))

(assert (=> b!312715 (= lt!153244 (Intermediate!2712 false resIndex!52 resX!52))))

(declare-fun b!312716 () Bool)

(assert (=> b!312716 (= e!194953 (not e!194956))))

(declare-fun res!169169 () Bool)

(assert (=> b!312716 (=> res!169169 e!194956)))

(assert (=> b!312716 (= res!169169 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153243 #b00000000000000000000000000000000) (bvsge lt!153243 (size!7924 a!3293)) (not (= lt!153242 lt!153244))))))

(declare-fun lt!153245 () SeekEntryResult!2712)

(assert (=> b!312716 (= lt!153245 lt!153246)))

(declare-fun lt!153249 () array!15980)

(assert (=> b!312716 (= lt!153246 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153243 k0!2441 lt!153249 mask!3709))))

(assert (=> b!312716 (= lt!153245 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153249 mask!3709))))

(assert (=> b!312716 (= lt!153249 (array!15981 (store (arr!7572 a!3293) i!1240 k0!2441) (size!7924 a!3293)))))

(assert (=> b!312716 (= lt!153247 lt!153242)))

(assert (=> b!312716 (= lt!153242 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153243 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312716 (= lt!153243 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31078 res!169165) b!312713))

(assert (= (and b!312713 res!169162) b!312714))

(assert (= (and b!312714 res!169161) b!312707))

(assert (= (and b!312707 res!169163) b!312711))

(assert (= (and b!312711 res!169170) b!312712))

(assert (= (and b!312712 res!169164) b!312715))

(assert (= (and b!312715 res!169168) b!312710))

(assert (= (and b!312710 res!169167) b!312709))

(assert (= (and b!312709 res!169166) b!312716))

(assert (= (and b!312716 (not res!169169)) b!312708))

(declare-fun m!322827 () Bool)

(assert (=> b!312711 m!322827))

(declare-fun m!322829 () Bool)

(assert (=> b!312715 m!322829))

(assert (=> b!312715 m!322829))

(declare-fun m!322831 () Bool)

(assert (=> b!312715 m!322831))

(declare-fun m!322833 () Bool)

(assert (=> b!312710 m!322833))

(declare-fun m!322835 () Bool)

(assert (=> b!312714 m!322835))

(declare-fun m!322837 () Bool)

(assert (=> b!312712 m!322837))

(declare-fun m!322839 () Bool)

(assert (=> start!31078 m!322839))

(declare-fun m!322841 () Bool)

(assert (=> start!31078 m!322841))

(declare-fun m!322843 () Bool)

(assert (=> b!312709 m!322843))

(declare-fun m!322845 () Bool)

(assert (=> b!312709 m!322845))

(declare-fun m!322847 () Bool)

(assert (=> b!312707 m!322847))

(declare-fun m!322849 () Bool)

(assert (=> b!312708 m!322849))

(declare-fun m!322851 () Bool)

(assert (=> b!312716 m!322851))

(declare-fun m!322853 () Bool)

(assert (=> b!312716 m!322853))

(declare-fun m!322855 () Bool)

(assert (=> b!312716 m!322855))

(declare-fun m!322857 () Bool)

(assert (=> b!312716 m!322857))

(declare-fun m!322859 () Bool)

(assert (=> b!312716 m!322859))

(check-sat (not b!312714) (not b!312716) (not b!312712) (not b!312715) (not start!31078) (not b!312708) (not b!312707) (not b!312711) (not b!312709))
(check-sat)
