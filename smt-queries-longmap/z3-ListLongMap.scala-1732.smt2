; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31830 () Bool)

(assert start!31830)

(declare-fun b!318249 () Bool)

(declare-fun e!197766 () Bool)

(assert (=> b!318249 (= e!197766 (not true))))

(declare-fun e!197763 () Bool)

(assert (=> b!318249 e!197763))

(declare-fun res!172885 () Bool)

(assert (=> b!318249 (=> (not res!172885) (not e!197763))))

(declare-datatypes ((array!16214 0))(
  ( (array!16215 (arr!7672 (Array (_ BitVec 32) (_ BitVec 64))) (size!8024 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16214)

(declare-datatypes ((SeekEntryResult!2777 0))(
  ( (MissingZero!2777 (index!13284 (_ BitVec 32))) (Found!2777 (index!13285 (_ BitVec 32))) (Intermediate!2777 (undefined!3589 Bool) (index!13286 (_ BitVec 32)) (x!31647 (_ BitVec 32))) (Undefined!2777) (MissingVacant!2777 (index!13287 (_ BitVec 32))) )
))
(declare-fun lt!155316 () SeekEntryResult!2777)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155313 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16214 (_ BitVec 32)) SeekEntryResult!2777)

(assert (=> b!318249 (= res!172885 (= lt!155316 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155313 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318249 (= lt!155313 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!318250 () Bool)

(declare-fun e!197765 () Bool)

(assert (=> b!318250 (= e!197765 e!197766)))

(declare-fun res!172887 () Bool)

(assert (=> b!318250 (=> (not res!172887) (not e!197766))))

(declare-fun lt!155314 () SeekEntryResult!2777)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318250 (= res!172887 (and (= lt!155316 lt!155314) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7672 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318250 (= lt!155316 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318251 () Bool)

(declare-fun res!172886 () Bool)

(declare-fun e!197764 () Bool)

(assert (=> b!318251 (=> (not res!172886) (not e!197764))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16214 (_ BitVec 32)) SeekEntryResult!2777)

(assert (=> b!318251 (= res!172886 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2777 i!1240)))))

(declare-fun b!318252 () Bool)

(declare-fun res!172881 () Bool)

(assert (=> b!318252 (=> (not res!172881) (not e!197764))))

(declare-fun arrayContainsKey!0 (array!16214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318252 (= res!172881 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318253 () Bool)

(declare-fun lt!155315 () array!16214)

(assert (=> b!318253 (= e!197763 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155315 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155313 k0!2441 lt!155315 mask!3709)))))

(assert (=> b!318253 (= lt!155315 (array!16215 (store (arr!7672 a!3293) i!1240 k0!2441) (size!8024 a!3293)))))

(declare-fun b!318254 () Bool)

(declare-fun res!172882 () Bool)

(assert (=> b!318254 (=> (not res!172882) (not e!197764))))

(assert (=> b!318254 (= res!172882 (and (= (size!8024 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8024 a!3293))))))

(declare-fun b!318256 () Bool)

(assert (=> b!318256 (= e!197764 e!197765)))

(declare-fun res!172883 () Bool)

(assert (=> b!318256 (=> (not res!172883) (not e!197765))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318256 (= res!172883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155314))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318256 (= lt!155314 (Intermediate!2777 false resIndex!52 resX!52))))

(declare-fun b!318257 () Bool)

(declare-fun res!172884 () Bool)

(assert (=> b!318257 (=> (not res!172884) (not e!197764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318257 (= res!172884 (validKeyInArray!0 k0!2441))))

(declare-fun b!318258 () Bool)

(declare-fun res!172878 () Bool)

(assert (=> b!318258 (=> (not res!172878) (not e!197764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16214 (_ BitVec 32)) Bool)

(assert (=> b!318258 (= res!172878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318255 () Bool)

(declare-fun res!172879 () Bool)

(assert (=> b!318255 (=> (not res!172879) (not e!197765))))

(assert (=> b!318255 (= res!172879 (and (= (select (arr!7672 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8024 a!3293))))))

(declare-fun res!172880 () Bool)

(assert (=> start!31830 (=> (not res!172880) (not e!197764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31830 (= res!172880 (validMask!0 mask!3709))))

(assert (=> start!31830 e!197764))

(declare-fun array_inv!5622 (array!16214) Bool)

(assert (=> start!31830 (array_inv!5622 a!3293)))

(assert (=> start!31830 true))

(assert (= (and start!31830 res!172880) b!318254))

(assert (= (and b!318254 res!172882) b!318257))

(assert (= (and b!318257 res!172884) b!318252))

(assert (= (and b!318252 res!172881) b!318251))

(assert (= (and b!318251 res!172886) b!318258))

(assert (= (and b!318258 res!172878) b!318256))

(assert (= (and b!318256 res!172883) b!318255))

(assert (= (and b!318255 res!172879) b!318250))

(assert (= (and b!318250 res!172887) b!318249))

(assert (= (and b!318249 res!172885) b!318253))

(declare-fun m!327163 () Bool)

(assert (=> b!318253 m!327163))

(declare-fun m!327165 () Bool)

(assert (=> b!318253 m!327165))

(declare-fun m!327167 () Bool)

(assert (=> b!318253 m!327167))

(declare-fun m!327169 () Bool)

(assert (=> b!318250 m!327169))

(declare-fun m!327171 () Bool)

(assert (=> b!318250 m!327171))

(declare-fun m!327173 () Bool)

(assert (=> b!318258 m!327173))

(declare-fun m!327175 () Bool)

(assert (=> b!318255 m!327175))

(declare-fun m!327177 () Bool)

(assert (=> b!318249 m!327177))

(declare-fun m!327179 () Bool)

(assert (=> b!318249 m!327179))

(declare-fun m!327181 () Bool)

(assert (=> b!318256 m!327181))

(assert (=> b!318256 m!327181))

(declare-fun m!327183 () Bool)

(assert (=> b!318256 m!327183))

(declare-fun m!327185 () Bool)

(assert (=> start!31830 m!327185))

(declare-fun m!327187 () Bool)

(assert (=> start!31830 m!327187))

(declare-fun m!327189 () Bool)

(assert (=> b!318252 m!327189))

(declare-fun m!327191 () Bool)

(assert (=> b!318257 m!327191))

(declare-fun m!327193 () Bool)

(assert (=> b!318251 m!327193))

(check-sat (not b!318253) (not b!318258) (not b!318256) (not b!318251) (not start!31830) (not b!318249) (not b!318252) (not b!318250) (not b!318257))
(check-sat)
