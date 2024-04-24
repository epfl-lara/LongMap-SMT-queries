; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86476 () Bool)

(assert start!86476)

(declare-fun b!999861 () Bool)

(declare-fun res!668936 () Bool)

(declare-fun e!563885 () Bool)

(assert (=> b!999861 (=> (not res!668936) (not e!563885))))

(declare-datatypes ((array!63198 0))(
  ( (array!63199 (arr!30421 (Array (_ BitVec 32) (_ BitVec 64))) (size!30924 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63198)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999861 (= res!668936 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999862 () Bool)

(declare-fun e!563884 () Bool)

(assert (=> b!999862 (= e!563884 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442226 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999862 (= lt!442226 (toIndex!0 (select (store (arr!30421 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!999863 () Bool)

(declare-fun e!563883 () Bool)

(assert (=> b!999863 (= e!563883 e!563884)))

(declare-fun res!668941 () Bool)

(assert (=> b!999863 (=> (not res!668941) (not e!563884))))

(declare-datatypes ((SeekEntryResult!9289 0))(
  ( (MissingZero!9289 (index!39527 (_ BitVec 32))) (Found!9289 (index!39528 (_ BitVec 32))) (Intermediate!9289 (undefined!10101 Bool) (index!39529 (_ BitVec 32)) (x!87117 (_ BitVec 32))) (Undefined!9289) (MissingVacant!9289 (index!39530 (_ BitVec 32))) )
))
(declare-fun lt!442225 () SeekEntryResult!9289)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63198 (_ BitVec 32)) SeekEntryResult!9289)

(assert (=> b!999863 (= res!668941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30421 a!3219) j!170) mask!3464) (select (arr!30421 a!3219) j!170) a!3219 mask!3464) lt!442225))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999863 (= lt!442225 (Intermediate!9289 false resIndex!38 resX!38))))

(declare-fun b!999864 () Bool)

(declare-fun res!668932 () Bool)

(assert (=> b!999864 (=> (not res!668932) (not e!563885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999864 (= res!668932 (validKeyInArray!0 k0!2224))))

(declare-fun b!999865 () Bool)

(declare-fun res!668939 () Bool)

(assert (=> b!999865 (=> (not res!668939) (not e!563883))))

(declare-datatypes ((List!21068 0))(
  ( (Nil!21065) (Cons!21064 (h!22244 (_ BitVec 64)) (t!30061 List!21068)) )
))
(declare-fun arrayNoDuplicates!0 (array!63198 (_ BitVec 32) List!21068) Bool)

(assert (=> b!999865 (= res!668939 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21065))))

(declare-fun b!999866 () Bool)

(declare-fun res!668937 () Bool)

(assert (=> b!999866 (=> (not res!668937) (not e!563884))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999866 (= res!668937 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30421 a!3219) j!170) a!3219 mask!3464) lt!442225))))

(declare-fun b!999867 () Bool)

(assert (=> b!999867 (= e!563885 e!563883)))

(declare-fun res!668942 () Bool)

(assert (=> b!999867 (=> (not res!668942) (not e!563883))))

(declare-fun lt!442224 () SeekEntryResult!9289)

(assert (=> b!999867 (= res!668942 (or (= lt!442224 (MissingVacant!9289 i!1194)) (= lt!442224 (MissingZero!9289 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63198 (_ BitVec 32)) SeekEntryResult!9289)

(assert (=> b!999867 (= lt!442224 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!668940 () Bool)

(assert (=> start!86476 (=> (not res!668940) (not e!563885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86476 (= res!668940 (validMask!0 mask!3464))))

(assert (=> start!86476 e!563885))

(declare-fun array_inv!23557 (array!63198) Bool)

(assert (=> start!86476 (array_inv!23557 a!3219)))

(assert (=> start!86476 true))

(declare-fun b!999868 () Bool)

(declare-fun res!668933 () Bool)

(assert (=> b!999868 (=> (not res!668933) (not e!563883))))

(assert (=> b!999868 (= res!668933 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30924 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30924 a!3219))))))

(declare-fun b!999869 () Bool)

(declare-fun res!668934 () Bool)

(assert (=> b!999869 (=> (not res!668934) (not e!563885))))

(assert (=> b!999869 (= res!668934 (and (= (size!30924 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30924 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30924 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999870 () Bool)

(declare-fun res!668935 () Bool)

(assert (=> b!999870 (=> (not res!668935) (not e!563883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63198 (_ BitVec 32)) Bool)

(assert (=> b!999870 (= res!668935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999871 () Bool)

(declare-fun res!668938 () Bool)

(assert (=> b!999871 (=> (not res!668938) (not e!563885))))

(assert (=> b!999871 (= res!668938 (validKeyInArray!0 (select (arr!30421 a!3219) j!170)))))

(assert (= (and start!86476 res!668940) b!999869))

(assert (= (and b!999869 res!668934) b!999871))

(assert (= (and b!999871 res!668938) b!999864))

(assert (= (and b!999864 res!668932) b!999861))

(assert (= (and b!999861 res!668936) b!999867))

(assert (= (and b!999867 res!668942) b!999870))

(assert (= (and b!999870 res!668935) b!999865))

(assert (= (and b!999865 res!668939) b!999868))

(assert (= (and b!999868 res!668933) b!999863))

(assert (= (and b!999863 res!668941) b!999866))

(assert (= (and b!999866 res!668937) b!999862))

(declare-fun m!926651 () Bool)

(assert (=> b!999864 m!926651))

(declare-fun m!926653 () Bool)

(assert (=> b!999866 m!926653))

(assert (=> b!999866 m!926653))

(declare-fun m!926655 () Bool)

(assert (=> b!999866 m!926655))

(declare-fun m!926657 () Bool)

(assert (=> start!86476 m!926657))

(declare-fun m!926659 () Bool)

(assert (=> start!86476 m!926659))

(assert (=> b!999863 m!926653))

(assert (=> b!999863 m!926653))

(declare-fun m!926661 () Bool)

(assert (=> b!999863 m!926661))

(assert (=> b!999863 m!926661))

(assert (=> b!999863 m!926653))

(declare-fun m!926663 () Bool)

(assert (=> b!999863 m!926663))

(declare-fun m!926665 () Bool)

(assert (=> b!999861 m!926665))

(declare-fun m!926667 () Bool)

(assert (=> b!999865 m!926667))

(declare-fun m!926669 () Bool)

(assert (=> b!999862 m!926669))

(declare-fun m!926671 () Bool)

(assert (=> b!999862 m!926671))

(assert (=> b!999862 m!926671))

(declare-fun m!926673 () Bool)

(assert (=> b!999862 m!926673))

(declare-fun m!926675 () Bool)

(assert (=> b!999867 m!926675))

(declare-fun m!926677 () Bool)

(assert (=> b!999870 m!926677))

(assert (=> b!999871 m!926653))

(assert (=> b!999871 m!926653))

(declare-fun m!926679 () Bool)

(assert (=> b!999871 m!926679))

(check-sat (not b!999862) (not b!999864) (not b!999870) (not b!999866) (not b!999871) (not start!86476) (not b!999867) (not b!999861) (not b!999865) (not b!999863))
(check-sat)
