; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86904 () Bool)

(assert start!86904)

(declare-fun b!1007709 () Bool)

(declare-fun e!567068 () Bool)

(assert (=> b!1007709 (= e!567068 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445215 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007709 (= lt!445215 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007710 () Bool)

(declare-fun res!676733 () Bool)

(declare-fun e!567063 () Bool)

(assert (=> b!1007710 (=> (not res!676733) (not e!567063))))

(declare-datatypes ((array!63499 0))(
  ( (array!63500 (arr!30570 (Array (_ BitVec 32) (_ BitVec 64))) (size!31074 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63499)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007710 (= res!676733 (validKeyInArray!0 (select (arr!30570 a!3219) j!170)))))

(declare-fun b!1007711 () Bool)

(declare-fun res!676731 () Bool)

(assert (=> b!1007711 (=> (not res!676731) (not e!567063))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1007711 (= res!676731 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007712 () Bool)

(declare-fun e!567066 () Bool)

(declare-fun e!567064 () Bool)

(assert (=> b!1007712 (= e!567066 e!567064)))

(declare-fun res!676730 () Bool)

(assert (=> b!1007712 (=> (not res!676730) (not e!567064))))

(declare-datatypes ((SeekEntryResult!9527 0))(
  ( (MissingZero!9527 (index!40479 (_ BitVec 32))) (Found!9527 (index!40480 (_ BitVec 32))) (Intermediate!9527 (undefined!10339 Bool) (index!40481 (_ BitVec 32)) (x!87888 (_ BitVec 32))) (Undefined!9527) (MissingVacant!9527 (index!40482 (_ BitVec 32))) )
))
(declare-fun lt!445210 () SeekEntryResult!9527)

(declare-fun lt!445213 () SeekEntryResult!9527)

(assert (=> b!1007712 (= res!676730 (= lt!445210 lt!445213))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63499 (_ BitVec 32)) SeekEntryResult!9527)

(assert (=> b!1007712 (= lt!445210 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30570 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007713 () Bool)

(declare-fun res!676728 () Bool)

(declare-fun e!567067 () Bool)

(assert (=> b!1007713 (=> (not res!676728) (not e!567067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63499 (_ BitVec 32)) Bool)

(assert (=> b!1007713 (= res!676728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007714 () Bool)

(declare-fun res!676739 () Bool)

(assert (=> b!1007714 (=> (not res!676739) (not e!567063))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007714 (= res!676739 (and (= (size!31074 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31074 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31074 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007715 () Bool)

(assert (=> b!1007715 (= e!567064 e!567068)))

(declare-fun res!676727 () Bool)

(assert (=> b!1007715 (=> (not res!676727) (not e!567068))))

(declare-fun lt!445212 () array!63499)

(declare-fun lt!445216 () SeekEntryResult!9527)

(declare-fun lt!445211 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007715 (= res!676727 (not (= lt!445216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445211 mask!3464) lt!445211 lt!445212 mask!3464))))))

(assert (=> b!1007715 (= lt!445211 (select (store (arr!30570 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007715 (= lt!445212 (array!63500 (store (arr!30570 a!3219) i!1194 k0!2224) (size!31074 a!3219)))))

(declare-fun b!1007716 () Bool)

(declare-fun res!676737 () Bool)

(assert (=> b!1007716 (=> (not res!676737) (not e!567068))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007716 (= res!676737 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007717 () Bool)

(assert (=> b!1007717 (= e!567063 e!567067)))

(declare-fun res!676735 () Bool)

(assert (=> b!1007717 (=> (not res!676735) (not e!567067))))

(declare-fun lt!445214 () SeekEntryResult!9527)

(assert (=> b!1007717 (= res!676735 (or (= lt!445214 (MissingVacant!9527 i!1194)) (= lt!445214 (MissingZero!9527 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63499 (_ BitVec 32)) SeekEntryResult!9527)

(assert (=> b!1007717 (= lt!445214 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007718 () Bool)

(assert (=> b!1007718 (= e!567067 e!567066)))

(declare-fun res!676736 () Bool)

(assert (=> b!1007718 (=> (not res!676736) (not e!567066))))

(assert (=> b!1007718 (= res!676736 (= lt!445216 lt!445213))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007718 (= lt!445213 (Intermediate!9527 false resIndex!38 resX!38))))

(assert (=> b!1007718 (= lt!445216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30570 a!3219) j!170) mask!3464) (select (arr!30570 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!676734 () Bool)

(assert (=> start!86904 (=> (not res!676734) (not e!567063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86904 (= res!676734 (validMask!0 mask!3464))))

(assert (=> start!86904 e!567063))

(declare-fun array_inv!23713 (array!63499) Bool)

(assert (=> start!86904 (array_inv!23713 a!3219)))

(assert (=> start!86904 true))

(declare-fun b!1007719 () Bool)

(declare-fun res!676726 () Bool)

(assert (=> b!1007719 (=> (not res!676726) (not e!567067))))

(declare-datatypes ((List!21312 0))(
  ( (Nil!21309) (Cons!21308 (h!22494 (_ BitVec 64)) (t!30304 List!21312)) )
))
(declare-fun arrayNoDuplicates!0 (array!63499 (_ BitVec 32) List!21312) Bool)

(assert (=> b!1007719 (= res!676726 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21309))))

(declare-fun b!1007720 () Bool)

(declare-fun res!676729 () Bool)

(assert (=> b!1007720 (=> (not res!676729) (not e!567063))))

(declare-fun arrayContainsKey!0 (array!63499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007720 (= res!676729 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007721 () Bool)

(declare-fun res!676738 () Bool)

(assert (=> b!1007721 (=> (not res!676738) (not e!567067))))

(assert (=> b!1007721 (= res!676738 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31074 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31074 a!3219))))))

(declare-fun b!1007722 () Bool)

(declare-fun res!676732 () Bool)

(assert (=> b!1007722 (=> (not res!676732) (not e!567068))))

(assert (=> b!1007722 (= res!676732 (not (= lt!445210 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445211 lt!445212 mask!3464))))))

(assert (= (and start!86904 res!676734) b!1007714))

(assert (= (and b!1007714 res!676739) b!1007710))

(assert (= (and b!1007710 res!676733) b!1007711))

(assert (= (and b!1007711 res!676731) b!1007720))

(assert (= (and b!1007720 res!676729) b!1007717))

(assert (= (and b!1007717 res!676735) b!1007713))

(assert (= (and b!1007713 res!676728) b!1007719))

(assert (= (and b!1007719 res!676726) b!1007721))

(assert (= (and b!1007721 res!676738) b!1007718))

(assert (= (and b!1007718 res!676736) b!1007712))

(assert (= (and b!1007712 res!676730) b!1007715))

(assert (= (and b!1007715 res!676727) b!1007722))

(assert (= (and b!1007722 res!676732) b!1007716))

(assert (= (and b!1007716 res!676737) b!1007709))

(declare-fun m!932017 () Bool)

(assert (=> b!1007713 m!932017))

(declare-fun m!932019 () Bool)

(assert (=> b!1007711 m!932019))

(declare-fun m!932021 () Bool)

(assert (=> b!1007715 m!932021))

(assert (=> b!1007715 m!932021))

(declare-fun m!932023 () Bool)

(assert (=> b!1007715 m!932023))

(declare-fun m!932025 () Bool)

(assert (=> b!1007715 m!932025))

(declare-fun m!932027 () Bool)

(assert (=> b!1007715 m!932027))

(declare-fun m!932029 () Bool)

(assert (=> start!86904 m!932029))

(declare-fun m!932031 () Bool)

(assert (=> start!86904 m!932031))

(declare-fun m!932033 () Bool)

(assert (=> b!1007718 m!932033))

(assert (=> b!1007718 m!932033))

(declare-fun m!932035 () Bool)

(assert (=> b!1007718 m!932035))

(assert (=> b!1007718 m!932035))

(assert (=> b!1007718 m!932033))

(declare-fun m!932037 () Bool)

(assert (=> b!1007718 m!932037))

(declare-fun m!932039 () Bool)

(assert (=> b!1007720 m!932039))

(assert (=> b!1007712 m!932033))

(assert (=> b!1007712 m!932033))

(declare-fun m!932041 () Bool)

(assert (=> b!1007712 m!932041))

(declare-fun m!932043 () Bool)

(assert (=> b!1007722 m!932043))

(declare-fun m!932045 () Bool)

(assert (=> b!1007717 m!932045))

(declare-fun m!932047 () Bool)

(assert (=> b!1007709 m!932047))

(assert (=> b!1007710 m!932033))

(assert (=> b!1007710 m!932033))

(declare-fun m!932049 () Bool)

(assert (=> b!1007710 m!932049))

(declare-fun m!932051 () Bool)

(assert (=> b!1007719 m!932051))

(check-sat (not b!1007712) (not b!1007710) (not b!1007709) (not b!1007713) (not b!1007717) (not b!1007720) (not b!1007722) (not start!86904) (not b!1007719) (not b!1007715) (not b!1007711) (not b!1007718))
(check-sat)
