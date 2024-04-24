; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45422 () Bool)

(assert start!45422)

(declare-fun b!499622 () Bool)

(declare-datatypes ((Unit!14947 0))(
  ( (Unit!14948) )
))
(declare-fun e!292760 () Unit!14947)

(declare-fun Unit!14949 () Unit!14947)

(assert (=> b!499622 (= e!292760 Unit!14949)))

(declare-fun b!499623 () Bool)

(declare-fun res!301612 () Bool)

(declare-fun e!292766 () Bool)

(assert (=> b!499623 (=> (not res!301612) (not e!292766))))

(declare-datatypes ((array!32248 0))(
  ( (array!32249 (arr!15505 (Array (_ BitVec 32) (_ BitVec 64))) (size!15869 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32248)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32248 (_ BitVec 32)) Bool)

(assert (=> b!499623 (= res!301612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301617 () Bool)

(declare-fun e!292764 () Bool)

(assert (=> start!45422 (=> (not res!301617) (not e!292764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45422 (= res!301617 (validMask!0 mask!3524))))

(assert (=> start!45422 e!292764))

(assert (=> start!45422 true))

(declare-fun array_inv!11364 (array!32248) Bool)

(assert (=> start!45422 (array_inv!11364 a!3235)))

(declare-fun e!292762 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!499624 () Bool)

(declare-datatypes ((SeekEntryResult!3928 0))(
  ( (MissingZero!3928 (index!17894 (_ BitVec 32))) (Found!3928 (index!17895 (_ BitVec 32))) (Intermediate!3928 (undefined!4740 Bool) (index!17896 (_ BitVec 32)) (x!47082 (_ BitVec 32))) (Undefined!3928) (MissingVacant!3928 (index!17897 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32248 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!499624 (= e!292762 (= (seekEntryOrOpen!0 (select (arr!15505 a!3235) j!176) a!3235 mask!3524) (Found!3928 j!176)))))

(declare-fun b!499625 () Bool)

(declare-fun res!301606 () Bool)

(assert (=> b!499625 (=> (not res!301606) (not e!292764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499625 (= res!301606 (validKeyInArray!0 (select (arr!15505 a!3235) j!176)))))

(declare-fun b!499626 () Bool)

(declare-fun res!301613 () Bool)

(declare-fun e!292763 () Bool)

(assert (=> b!499626 (=> res!301613 e!292763)))

(declare-fun lt!226626 () SeekEntryResult!3928)

(get-info :version)

(assert (=> b!499626 (= res!301613 (or (undefined!4740 lt!226626) (not ((_ is Intermediate!3928) lt!226626))))))

(declare-fun b!499627 () Bool)

(declare-fun res!301616 () Bool)

(assert (=> b!499627 (=> (not res!301616) (not e!292764))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499627 (= res!301616 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499628 () Bool)

(declare-fun res!301609 () Bool)

(assert (=> b!499628 (=> (not res!301609) (not e!292764))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499628 (= res!301609 (and (= (size!15869 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15869 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15869 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499629 () Bool)

(declare-fun e!292761 () Bool)

(assert (=> b!499629 (= e!292763 e!292761)))

(declare-fun res!301611 () Bool)

(assert (=> b!499629 (=> res!301611 e!292761)))

(declare-fun lt!226622 () (_ BitVec 32))

(assert (=> b!499629 (= res!301611 (or (bvsgt #b00000000000000000000000000000000 (x!47082 lt!226626)) (bvsgt (x!47082 lt!226626) #b01111111111111111111111111111110) (bvslt lt!226622 #b00000000000000000000000000000000) (bvsge lt!226622 (size!15869 a!3235)) (bvslt (index!17896 lt!226626) #b00000000000000000000000000000000) (bvsge (index!17896 lt!226626) (size!15869 a!3235)) (not (= lt!226626 (Intermediate!3928 false (index!17896 lt!226626) (x!47082 lt!226626))))))))

(assert (=> b!499629 (and (or (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226627 () Unit!14947)

(assert (=> b!499629 (= lt!226627 e!292760)))

(declare-fun c!59285 () Bool)

(assert (=> b!499629 (= c!59285 (= (select (arr!15505 a!3235) (index!17896 lt!226626)) (select (arr!15505 a!3235) j!176)))))

(assert (=> b!499629 (and (bvslt (x!47082 lt!226626) #b01111111111111111111111111111110) (or (= (select (arr!15505 a!3235) (index!17896 lt!226626)) (select (arr!15505 a!3235) j!176)) (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15505 a!3235) (index!17896 lt!226626)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499630 () Bool)

(declare-fun e!292765 () Bool)

(assert (=> b!499630 (= e!292765 false)))

(declare-fun b!499631 () Bool)

(assert (=> b!499631 (= e!292761 true)))

(declare-fun lt!226625 () SeekEntryResult!3928)

(declare-fun lt!226630 () array!32248)

(declare-fun lt!226628 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32248 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!499631 (= lt!226625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226622 lt!226628 lt!226630 mask!3524))))

(declare-fun b!499632 () Bool)

(declare-fun res!301610 () Bool)

(assert (=> b!499632 (=> (not res!301610) (not e!292764))))

(assert (=> b!499632 (= res!301610 (validKeyInArray!0 k0!2280))))

(declare-fun b!499633 () Bool)

(assert (=> b!499633 (= e!292766 (not e!292763))))

(declare-fun res!301607 () Bool)

(assert (=> b!499633 (=> res!301607 e!292763)))

(declare-fun lt!226624 () (_ BitVec 32))

(assert (=> b!499633 (= res!301607 (= lt!226626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226624 lt!226628 lt!226630 mask!3524)))))

(assert (=> b!499633 (= lt!226626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226622 (select (arr!15505 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499633 (= lt!226624 (toIndex!0 lt!226628 mask!3524))))

(assert (=> b!499633 (= lt!226628 (select (store (arr!15505 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499633 (= lt!226622 (toIndex!0 (select (arr!15505 a!3235) j!176) mask!3524))))

(assert (=> b!499633 (= lt!226630 (array!32249 (store (arr!15505 a!3235) i!1204 k0!2280) (size!15869 a!3235)))))

(assert (=> b!499633 e!292762))

(declare-fun res!301614 () Bool)

(assert (=> b!499633 (=> (not res!301614) (not e!292762))))

(assert (=> b!499633 (= res!301614 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226629 () Unit!14947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14947)

(assert (=> b!499633 (= lt!226629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499634 () Bool)

(declare-fun Unit!14950 () Unit!14947)

(assert (=> b!499634 (= e!292760 Unit!14950)))

(declare-fun lt!226623 () Unit!14947)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14947)

(assert (=> b!499634 (= lt!226623 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226622 #b00000000000000000000000000000000 (index!17896 lt!226626) (x!47082 lt!226626) mask!3524))))

(declare-fun res!301608 () Bool)

(assert (=> b!499634 (= res!301608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226622 lt!226628 lt!226630 mask!3524) (Intermediate!3928 false (index!17896 lt!226626) (x!47082 lt!226626))))))

(assert (=> b!499634 (=> (not res!301608) (not e!292765))))

(assert (=> b!499634 e!292765))

(declare-fun b!499635 () Bool)

(declare-fun res!301618 () Bool)

(assert (=> b!499635 (=> (not res!301618) (not e!292766))))

(declare-datatypes ((List!9570 0))(
  ( (Nil!9567) (Cons!9566 (h!10440 (_ BitVec 64)) (t!15790 List!9570)) )
))
(declare-fun arrayNoDuplicates!0 (array!32248 (_ BitVec 32) List!9570) Bool)

(assert (=> b!499635 (= res!301618 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9567))))

(declare-fun b!499636 () Bool)

(assert (=> b!499636 (= e!292764 e!292766)))

(declare-fun res!301615 () Bool)

(assert (=> b!499636 (=> (not res!301615) (not e!292766))))

(declare-fun lt!226621 () SeekEntryResult!3928)

(assert (=> b!499636 (= res!301615 (or (= lt!226621 (MissingZero!3928 i!1204)) (= lt!226621 (MissingVacant!3928 i!1204))))))

(assert (=> b!499636 (= lt!226621 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45422 res!301617) b!499628))

(assert (= (and b!499628 res!301609) b!499625))

(assert (= (and b!499625 res!301606) b!499632))

(assert (= (and b!499632 res!301610) b!499627))

(assert (= (and b!499627 res!301616) b!499636))

(assert (= (and b!499636 res!301615) b!499623))

(assert (= (and b!499623 res!301612) b!499635))

(assert (= (and b!499635 res!301618) b!499633))

(assert (= (and b!499633 res!301614) b!499624))

(assert (= (and b!499633 (not res!301607)) b!499626))

(assert (= (and b!499626 (not res!301613)) b!499629))

(assert (= (and b!499629 c!59285) b!499634))

(assert (= (and b!499629 (not c!59285)) b!499622))

(assert (= (and b!499634 res!301608) b!499630))

(assert (= (and b!499629 (not res!301611)) b!499631))

(declare-fun m!481051 () Bool)

(assert (=> b!499627 m!481051))

(declare-fun m!481053 () Bool)

(assert (=> b!499636 m!481053))

(declare-fun m!481055 () Bool)

(assert (=> b!499623 m!481055))

(declare-fun m!481057 () Bool)

(assert (=> b!499634 m!481057))

(declare-fun m!481059 () Bool)

(assert (=> b!499634 m!481059))

(declare-fun m!481061 () Bool)

(assert (=> start!45422 m!481061))

(declare-fun m!481063 () Bool)

(assert (=> start!45422 m!481063))

(declare-fun m!481065 () Bool)

(assert (=> b!499635 m!481065))

(declare-fun m!481067 () Bool)

(assert (=> b!499625 m!481067))

(assert (=> b!499625 m!481067))

(declare-fun m!481069 () Bool)

(assert (=> b!499625 m!481069))

(declare-fun m!481071 () Bool)

(assert (=> b!499632 m!481071))

(declare-fun m!481073 () Bool)

(assert (=> b!499629 m!481073))

(assert (=> b!499629 m!481067))

(declare-fun m!481075 () Bool)

(assert (=> b!499633 m!481075))

(declare-fun m!481077 () Bool)

(assert (=> b!499633 m!481077))

(declare-fun m!481079 () Bool)

(assert (=> b!499633 m!481079))

(declare-fun m!481081 () Bool)

(assert (=> b!499633 m!481081))

(assert (=> b!499633 m!481067))

(declare-fun m!481083 () Bool)

(assert (=> b!499633 m!481083))

(assert (=> b!499633 m!481067))

(declare-fun m!481085 () Bool)

(assert (=> b!499633 m!481085))

(assert (=> b!499633 m!481067))

(declare-fun m!481087 () Bool)

(assert (=> b!499633 m!481087))

(declare-fun m!481089 () Bool)

(assert (=> b!499633 m!481089))

(assert (=> b!499631 m!481059))

(assert (=> b!499624 m!481067))

(assert (=> b!499624 m!481067))

(declare-fun m!481091 () Bool)

(assert (=> b!499624 m!481091))

(check-sat (not b!499634) (not b!499631) (not start!45422) (not b!499627) (not b!499623) (not b!499636) (not b!499632) (not b!499633) (not b!499625) (not b!499635) (not b!499624))
(check-sat)
