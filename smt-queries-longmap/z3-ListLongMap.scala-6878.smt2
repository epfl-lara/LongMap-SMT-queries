; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86514 () Bool)

(assert start!86514)

(declare-fun b!1002259 () Bool)

(declare-fun e!564621 () Bool)

(declare-fun e!564620 () Bool)

(assert (=> b!1002259 (= e!564621 e!564620)))

(declare-fun res!671868 () Bool)

(assert (=> b!1002259 (=> (not res!671868) (not e!564620))))

(declare-datatypes ((SeekEntryResult!9413 0))(
  ( (MissingZero!9413 (index!40023 (_ BitVec 32))) (Found!9413 (index!40024 (_ BitVec 32))) (Intermediate!9413 (undefined!10225 Bool) (index!40025 (_ BitVec 32)) (x!87452 (_ BitVec 32))) (Undefined!9413) (MissingVacant!9413 (index!40026 (_ BitVec 32))) )
))
(declare-fun lt!442967 () SeekEntryResult!9413)

(declare-fun lt!442969 () SeekEntryResult!9413)

(assert (=> b!1002259 (= res!671868 (= lt!442967 lt!442969))))

(declare-datatypes ((array!63262 0))(
  ( (array!63263 (arr!30456 (Array (_ BitVec 32) (_ BitVec 64))) (size!30960 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63262)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63262 (_ BitVec 32)) SeekEntryResult!9413)

(assert (=> b!1002259 (= lt!442967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30456 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002260 () Bool)

(declare-fun e!564622 () Bool)

(assert (=> b!1002260 (= e!564622 false)))

(declare-fun lt!442964 () array!63262)

(declare-fun lt!442962 () (_ BitVec 64))

(declare-fun lt!442966 () SeekEntryResult!9413)

(declare-fun lt!442968 () (_ BitVec 32))

(assert (=> b!1002260 (= lt!442966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442968 lt!442962 lt!442964 mask!3464))))

(declare-fun res!671874 () Bool)

(declare-fun e!564623 () Bool)

(assert (=> start!86514 (=> (not res!671874) (not e!564623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86514 (= res!671874 (validMask!0 mask!3464))))

(assert (=> start!86514 e!564623))

(declare-fun array_inv!23599 (array!63262) Bool)

(assert (=> start!86514 (array_inv!23599 a!3219)))

(assert (=> start!86514 true))

(declare-fun b!1002261 () Bool)

(declare-fun res!671871 () Bool)

(declare-fun e!564619 () Bool)

(assert (=> b!1002261 (=> (not res!671871) (not e!564619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63262 (_ BitVec 32)) Bool)

(assert (=> b!1002261 (= res!671871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002262 () Bool)

(declare-fun e!564618 () Bool)

(assert (=> b!1002262 (= e!564620 e!564618)))

(declare-fun res!671861 () Bool)

(assert (=> b!1002262 (=> (not res!671861) (not e!564618))))

(declare-fun lt!442963 () SeekEntryResult!9413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002262 (= res!671861 (not (= lt!442963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442962 mask!3464) lt!442962 lt!442964 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1002262 (= lt!442962 (select (store (arr!30456 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002262 (= lt!442964 (array!63263 (store (arr!30456 a!3219) i!1194 k0!2224) (size!30960 a!3219)))))

(declare-fun b!1002263 () Bool)

(declare-fun res!671866 () Bool)

(assert (=> b!1002263 (=> (not res!671866) (not e!564623))))

(declare-fun arrayContainsKey!0 (array!63262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002263 (= res!671866 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002264 () Bool)

(declare-fun res!671865 () Bool)

(assert (=> b!1002264 (=> (not res!671865) (not e!564623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002264 (= res!671865 (validKeyInArray!0 (select (arr!30456 a!3219) j!170)))))

(declare-fun b!1002265 () Bool)

(declare-fun res!671870 () Bool)

(assert (=> b!1002265 (=> (not res!671870) (not e!564619))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002265 (= res!671870 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30960 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30960 a!3219))))))

(declare-fun b!1002266 () Bool)

(declare-fun res!671869 () Bool)

(assert (=> b!1002266 (=> (not res!671869) (not e!564622))))

(assert (=> b!1002266 (= res!671869 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442968 (select (arr!30456 a!3219) j!170) a!3219 mask!3464) lt!442969))))

(declare-fun b!1002267 () Bool)

(declare-fun res!671863 () Bool)

(assert (=> b!1002267 (=> (not res!671863) (not e!564619))))

(declare-datatypes ((List!21198 0))(
  ( (Nil!21195) (Cons!21194 (h!22371 (_ BitVec 64)) (t!30190 List!21198)) )
))
(declare-fun arrayNoDuplicates!0 (array!63262 (_ BitVec 32) List!21198) Bool)

(assert (=> b!1002267 (= res!671863 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21195))))

(declare-fun b!1002268 () Bool)

(declare-fun res!671875 () Bool)

(assert (=> b!1002268 (=> (not res!671875) (not e!564618))))

(assert (=> b!1002268 (= res!671875 (not (= lt!442967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442962 lt!442964 mask!3464))))))

(declare-fun b!1002269 () Bool)

(assert (=> b!1002269 (= e!564623 e!564619)))

(declare-fun res!671867 () Bool)

(assert (=> b!1002269 (=> (not res!671867) (not e!564619))))

(declare-fun lt!442965 () SeekEntryResult!9413)

(assert (=> b!1002269 (= res!671867 (or (= lt!442965 (MissingVacant!9413 i!1194)) (= lt!442965 (MissingZero!9413 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63262 (_ BitVec 32)) SeekEntryResult!9413)

(assert (=> b!1002269 (= lt!442965 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002270 () Bool)

(declare-fun res!671862 () Bool)

(assert (=> b!1002270 (=> (not res!671862) (not e!564623))))

(assert (=> b!1002270 (= res!671862 (and (= (size!30960 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30960 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30960 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002271 () Bool)

(declare-fun res!671873 () Bool)

(assert (=> b!1002271 (=> (not res!671873) (not e!564623))))

(assert (=> b!1002271 (= res!671873 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002272 () Bool)

(assert (=> b!1002272 (= e!564619 e!564621)))

(declare-fun res!671864 () Bool)

(assert (=> b!1002272 (=> (not res!671864) (not e!564621))))

(assert (=> b!1002272 (= res!671864 (= lt!442963 lt!442969))))

(assert (=> b!1002272 (= lt!442969 (Intermediate!9413 false resIndex!38 resX!38))))

(assert (=> b!1002272 (= lt!442963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30456 a!3219) j!170) mask!3464) (select (arr!30456 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002273 () Bool)

(assert (=> b!1002273 (= e!564618 e!564622)))

(declare-fun res!671876 () Bool)

(assert (=> b!1002273 (=> (not res!671876) (not e!564622))))

(assert (=> b!1002273 (= res!671876 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442968 #b00000000000000000000000000000000) (bvslt lt!442968 (size!30960 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002273 (= lt!442968 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002274 () Bool)

(declare-fun res!671872 () Bool)

(assert (=> b!1002274 (=> (not res!671872) (not e!564618))))

(assert (=> b!1002274 (= res!671872 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86514 res!671874) b!1002270))

(assert (= (and b!1002270 res!671862) b!1002264))

(assert (= (and b!1002264 res!671865) b!1002271))

(assert (= (and b!1002271 res!671873) b!1002263))

(assert (= (and b!1002263 res!671866) b!1002269))

(assert (= (and b!1002269 res!671867) b!1002261))

(assert (= (and b!1002261 res!671871) b!1002267))

(assert (= (and b!1002267 res!671863) b!1002265))

(assert (= (and b!1002265 res!671870) b!1002272))

(assert (= (and b!1002272 res!671864) b!1002259))

(assert (= (and b!1002259 res!671868) b!1002262))

(assert (= (and b!1002262 res!671861) b!1002268))

(assert (= (and b!1002268 res!671875) b!1002274))

(assert (= (and b!1002274 res!671872) b!1002273))

(assert (= (and b!1002273 res!671876) b!1002266))

(assert (= (and b!1002266 res!671869) b!1002260))

(declare-fun m!927619 () Bool)

(assert (=> b!1002271 m!927619))

(declare-fun m!927621 () Bool)

(assert (=> b!1002273 m!927621))

(declare-fun m!927623 () Bool)

(assert (=> b!1002262 m!927623))

(assert (=> b!1002262 m!927623))

(declare-fun m!927625 () Bool)

(assert (=> b!1002262 m!927625))

(declare-fun m!927627 () Bool)

(assert (=> b!1002262 m!927627))

(declare-fun m!927629 () Bool)

(assert (=> b!1002262 m!927629))

(declare-fun m!927631 () Bool)

(assert (=> b!1002261 m!927631))

(declare-fun m!927633 () Bool)

(assert (=> b!1002267 m!927633))

(declare-fun m!927635 () Bool)

(assert (=> b!1002268 m!927635))

(declare-fun m!927637 () Bool)

(assert (=> start!86514 m!927637))

(declare-fun m!927639 () Bool)

(assert (=> start!86514 m!927639))

(declare-fun m!927641 () Bool)

(assert (=> b!1002269 m!927641))

(declare-fun m!927643 () Bool)

(assert (=> b!1002272 m!927643))

(assert (=> b!1002272 m!927643))

(declare-fun m!927645 () Bool)

(assert (=> b!1002272 m!927645))

(assert (=> b!1002272 m!927645))

(assert (=> b!1002272 m!927643))

(declare-fun m!927647 () Bool)

(assert (=> b!1002272 m!927647))

(assert (=> b!1002264 m!927643))

(assert (=> b!1002264 m!927643))

(declare-fun m!927649 () Bool)

(assert (=> b!1002264 m!927649))

(declare-fun m!927651 () Bool)

(assert (=> b!1002260 m!927651))

(assert (=> b!1002259 m!927643))

(assert (=> b!1002259 m!927643))

(declare-fun m!927653 () Bool)

(assert (=> b!1002259 m!927653))

(declare-fun m!927655 () Bool)

(assert (=> b!1002263 m!927655))

(assert (=> b!1002266 m!927643))

(assert (=> b!1002266 m!927643))

(declare-fun m!927657 () Bool)

(assert (=> b!1002266 m!927657))

(check-sat (not b!1002267) (not b!1002266) (not b!1002259) (not b!1002260) (not b!1002271) (not b!1002269) (not b!1002264) (not b!1002268) (not b!1002273) (not b!1002263) (not start!86514) (not b!1002272) (not b!1002262) (not b!1002261))
(check-sat)
