; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120338 () Bool)

(assert start!120338)

(declare-fun b!1400570 () Bool)

(declare-fun e!792997 () Bool)

(declare-fun e!792996 () Bool)

(assert (=> b!1400570 (= e!792997 e!792996)))

(declare-fun res!939134 () Bool)

(assert (=> b!1400570 (=> res!939134 e!792996)))

(declare-datatypes ((SeekEntryResult!10544 0))(
  ( (MissingZero!10544 (index!44553 (_ BitVec 32))) (Found!10544 (index!44554 (_ BitVec 32))) (Intermediate!10544 (undefined!11356 Bool) (index!44555 (_ BitVec 32)) (x!126192 (_ BitVec 32))) (Undefined!10544) (MissingVacant!10544 (index!44556 (_ BitVec 32))) )
))
(declare-fun lt!616168 () SeekEntryResult!10544)

(declare-fun lt!616171 () SeekEntryResult!10544)

(get-info :version)

(assert (=> b!1400570 (= res!939134 (or (= lt!616168 lt!616171) (not ((_ is Intermediate!10544) lt!616171))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616174 () (_ BitVec 64))

(declare-datatypes ((array!95700 0))(
  ( (array!95701 (arr!46201 (Array (_ BitVec 32) (_ BitVec 64))) (size!46753 (_ BitVec 32))) )
))
(declare-fun lt!616172 () array!95700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95700 (_ BitVec 32)) SeekEntryResult!10544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400570 (= lt!616171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616174 mask!2840) lt!616174 lt!616172 mask!2840))))

(declare-fun a!2901 () array!95700)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400570 (= lt!616174 (select (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400570 (= lt!616172 (array!95701 (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46753 a!2901)))))

(declare-fun b!1400571 () Bool)

(declare-fun res!939140 () Bool)

(declare-fun e!792994 () Bool)

(assert (=> b!1400571 (=> (not res!939140) (not e!792994))))

(declare-datatypes ((List!32798 0))(
  ( (Nil!32795) (Cons!32794 (h!34042 (_ BitVec 64)) (t!47484 List!32798)) )
))
(declare-fun arrayNoDuplicates!0 (array!95700 (_ BitVec 32) List!32798) Bool)

(assert (=> b!1400571 (= res!939140 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32795))))

(declare-fun res!939137 () Bool)

(assert (=> start!120338 (=> (not res!939137) (not e!792994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120338 (= res!939137 (validMask!0 mask!2840))))

(assert (=> start!120338 e!792994))

(assert (=> start!120338 true))

(declare-fun array_inv!35434 (array!95700) Bool)

(assert (=> start!120338 (array_inv!35434 a!2901)))

(declare-fun b!1400572 () Bool)

(declare-fun res!939138 () Bool)

(assert (=> b!1400572 (=> (not res!939138) (not e!792994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400572 (= res!939138 (validKeyInArray!0 (select (arr!46201 a!2901) j!112)))))

(declare-fun e!792992 () Bool)

(declare-fun b!1400573 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95700 (_ BitVec 32)) SeekEntryResult!10544)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95700 (_ BitVec 32)) SeekEntryResult!10544)

(assert (=> b!1400573 (= e!792992 (= (seekEntryOrOpen!0 lt!616174 lt!616172 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126192 lt!616171) (index!44555 lt!616171) (index!44555 lt!616171) (select (arr!46201 a!2901) j!112) lt!616172 mask!2840)))))

(declare-fun e!792998 () Bool)

(declare-fun b!1400574 () Bool)

(assert (=> b!1400574 (= e!792998 (= (seekEntryOrOpen!0 (select (arr!46201 a!2901) j!112) a!2901 mask!2840) (Found!10544 j!112)))))

(declare-fun b!1400575 () Bool)

(declare-fun res!939142 () Bool)

(assert (=> b!1400575 (=> (not res!939142) (not e!792994))))

(assert (=> b!1400575 (= res!939142 (and (= (size!46753 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46753 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46753 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400576 () Bool)

(assert (=> b!1400576 (= e!792994 (not e!792997))))

(declare-fun res!939135 () Bool)

(assert (=> b!1400576 (=> res!939135 e!792997)))

(assert (=> b!1400576 (= res!939135 (or (not ((_ is Intermediate!10544) lt!616168)) (undefined!11356 lt!616168)))))

(assert (=> b!1400576 e!792998))

(declare-fun res!939132 () Bool)

(assert (=> b!1400576 (=> (not res!939132) (not e!792998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95700 (_ BitVec 32)) Bool)

(assert (=> b!1400576 (= res!939132 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46935 0))(
  ( (Unit!46936) )
))
(declare-fun lt!616170 () Unit!46935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46935)

(assert (=> b!1400576 (= lt!616170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616175 () (_ BitVec 32))

(assert (=> b!1400576 (= lt!616168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616175 (select (arr!46201 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400576 (= lt!616175 (toIndex!0 (select (arr!46201 a!2901) j!112) mask!2840))))

(declare-fun b!1400577 () Bool)

(declare-fun e!792993 () Bool)

(assert (=> b!1400577 (= e!792993 true)))

(declare-fun lt!616173 () SeekEntryResult!10544)

(assert (=> b!1400577 (= lt!616173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616175 lt!616174 lt!616172 mask!2840))))

(declare-fun b!1400578 () Bool)

(declare-fun res!939141 () Bool)

(assert (=> b!1400578 (=> (not res!939141) (not e!792994))))

(assert (=> b!1400578 (= res!939141 (validKeyInArray!0 (select (arr!46201 a!2901) i!1037)))))

(declare-fun b!1400579 () Bool)

(declare-fun res!939136 () Bool)

(assert (=> b!1400579 (=> (not res!939136) (not e!792994))))

(assert (=> b!1400579 (= res!939136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400580 () Bool)

(assert (=> b!1400580 (= e!792996 e!792993)))

(declare-fun res!939133 () Bool)

(assert (=> b!1400580 (=> res!939133 e!792993)))

(assert (=> b!1400580 (= res!939133 (or (bvslt (x!126192 lt!616168) #b00000000000000000000000000000000) (bvsgt (x!126192 lt!616168) #b01111111111111111111111111111110) (bvslt (x!126192 lt!616171) #b00000000000000000000000000000000) (bvsgt (x!126192 lt!616171) #b01111111111111111111111111111110) (bvslt lt!616175 #b00000000000000000000000000000000) (bvsge lt!616175 (size!46753 a!2901)) (bvslt (index!44555 lt!616168) #b00000000000000000000000000000000) (bvsge (index!44555 lt!616168) (size!46753 a!2901)) (bvslt (index!44555 lt!616171) #b00000000000000000000000000000000) (bvsge (index!44555 lt!616171) (size!46753 a!2901)) (not (= lt!616168 (Intermediate!10544 false (index!44555 lt!616168) (x!126192 lt!616168)))) (not (= lt!616171 (Intermediate!10544 false (index!44555 lt!616171) (x!126192 lt!616171))))))))

(assert (=> b!1400580 e!792992))

(declare-fun res!939139 () Bool)

(assert (=> b!1400580 (=> (not res!939139) (not e!792992))))

(assert (=> b!1400580 (= res!939139 (and (not (undefined!11356 lt!616171)) (= (index!44555 lt!616171) i!1037) (bvslt (x!126192 lt!616171) (x!126192 lt!616168)) (= (select (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44555 lt!616171)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616169 () Unit!46935)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46935)

(assert (=> b!1400580 (= lt!616169 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616175 (x!126192 lt!616168) (index!44555 lt!616168) (x!126192 lt!616171) (index!44555 lt!616171) (undefined!11356 lt!616171) mask!2840))))

(assert (= (and start!120338 res!939137) b!1400575))

(assert (= (and b!1400575 res!939142) b!1400578))

(assert (= (and b!1400578 res!939141) b!1400572))

(assert (= (and b!1400572 res!939138) b!1400579))

(assert (= (and b!1400579 res!939136) b!1400571))

(assert (= (and b!1400571 res!939140) b!1400576))

(assert (= (and b!1400576 res!939132) b!1400574))

(assert (= (and b!1400576 (not res!939135)) b!1400570))

(assert (= (and b!1400570 (not res!939134)) b!1400580))

(assert (= (and b!1400580 res!939139) b!1400573))

(assert (= (and b!1400580 (not res!939133)) b!1400577))

(declare-fun m!1287637 () Bool)

(assert (=> b!1400574 m!1287637))

(assert (=> b!1400574 m!1287637))

(declare-fun m!1287639 () Bool)

(assert (=> b!1400574 m!1287639))

(assert (=> b!1400572 m!1287637))

(assert (=> b!1400572 m!1287637))

(declare-fun m!1287641 () Bool)

(assert (=> b!1400572 m!1287641))

(assert (=> b!1400576 m!1287637))

(declare-fun m!1287643 () Bool)

(assert (=> b!1400576 m!1287643))

(assert (=> b!1400576 m!1287637))

(assert (=> b!1400576 m!1287637))

(declare-fun m!1287645 () Bool)

(assert (=> b!1400576 m!1287645))

(declare-fun m!1287647 () Bool)

(assert (=> b!1400576 m!1287647))

(declare-fun m!1287649 () Bool)

(assert (=> b!1400576 m!1287649))

(declare-fun m!1287651 () Bool)

(assert (=> b!1400573 m!1287651))

(assert (=> b!1400573 m!1287637))

(assert (=> b!1400573 m!1287637))

(declare-fun m!1287653 () Bool)

(assert (=> b!1400573 m!1287653))

(declare-fun m!1287655 () Bool)

(assert (=> b!1400579 m!1287655))

(declare-fun m!1287657 () Bool)

(assert (=> b!1400578 m!1287657))

(assert (=> b!1400578 m!1287657))

(declare-fun m!1287659 () Bool)

(assert (=> b!1400578 m!1287659))

(declare-fun m!1287661 () Bool)

(assert (=> b!1400580 m!1287661))

(declare-fun m!1287663 () Bool)

(assert (=> b!1400580 m!1287663))

(declare-fun m!1287665 () Bool)

(assert (=> b!1400580 m!1287665))

(declare-fun m!1287667 () Bool)

(assert (=> b!1400571 m!1287667))

(declare-fun m!1287669 () Bool)

(assert (=> b!1400577 m!1287669))

(declare-fun m!1287671 () Bool)

(assert (=> b!1400570 m!1287671))

(assert (=> b!1400570 m!1287671))

(declare-fun m!1287673 () Bool)

(assert (=> b!1400570 m!1287673))

(assert (=> b!1400570 m!1287661))

(declare-fun m!1287675 () Bool)

(assert (=> b!1400570 m!1287675))

(declare-fun m!1287677 () Bool)

(assert (=> start!120338 m!1287677))

(declare-fun m!1287679 () Bool)

(assert (=> start!120338 m!1287679))

(check-sat (not b!1400576) (not b!1400574) (not b!1400580) (not b!1400573) (not start!120338) (not b!1400579) (not b!1400571) (not b!1400578) (not b!1400572) (not b!1400577) (not b!1400570))
(check-sat)
