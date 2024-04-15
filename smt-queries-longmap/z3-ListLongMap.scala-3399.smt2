; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46974 () Bool)

(assert start!46974)

(declare-fun b!517764 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33125 0))(
  ( (array!33126 (arr!15926 (Array (_ BitVec 32) (_ BitVec 64))) (size!16291 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33125)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!302116 () Bool)

(declare-datatypes ((SeekEntryResult!4390 0))(
  ( (MissingZero!4390 (index!19748 (_ BitVec 32))) (Found!4390 (index!19749 (_ BitVec 32))) (Intermediate!4390 (undefined!5202 Bool) (index!19750 (_ BitVec 32)) (x!48726 (_ BitVec 32))) (Undefined!4390) (MissingVacant!4390 (index!19751 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33125 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!517764 (= e!302116 (= (seekEntryOrOpen!0 (select (arr!15926 a!3235) j!176) a!3235 mask!3524) (Found!4390 j!176)))))

(declare-fun lt!236901 () SeekEntryResult!4390)

(declare-fun lt!236900 () (_ BitVec 32))

(declare-fun b!517765 () Bool)

(declare-fun e!302117 () Bool)

(assert (=> b!517765 (= e!302117 (or (not (= (select (arr!15926 a!3235) (index!19750 lt!236901)) (select (arr!15926 a!3235) j!176))) (bvsgt (x!48726 lt!236901) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48726 lt!236901)) (bvslt lt!236900 #b00000000000000000000000000000000) (bvsge lt!236900 (size!16291 a!3235)) (bvslt (index!19750 lt!236901) #b00000000000000000000000000000000) (bvsge (index!19750 lt!236901) (size!16291 a!3235)) (= lt!236901 (Intermediate!4390 false (index!19750 lt!236901) (x!48726 lt!236901)))))))

(assert (=> b!517765 (and (bvslt (x!48726 lt!236901) #b01111111111111111111111111111110) (or (= (select (arr!15926 a!3235) (index!19750 lt!236901)) (select (arr!15926 a!3235) j!176)) (= (select (arr!15926 a!3235) (index!19750 lt!236901)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15926 a!3235) (index!19750 lt!236901)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517766 () Bool)

(declare-fun res!316927 () Bool)

(declare-fun e!302114 () Bool)

(assert (=> b!517766 (=> (not res!316927) (not e!302114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517766 (= res!316927 (validKeyInArray!0 (select (arr!15926 a!3235) j!176)))))

(declare-fun b!517767 () Bool)

(declare-fun e!302115 () Bool)

(assert (=> b!517767 (= e!302114 e!302115)))

(declare-fun res!316928 () Bool)

(assert (=> b!517767 (=> (not res!316928) (not e!302115))))

(declare-fun lt!236898 () SeekEntryResult!4390)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517767 (= res!316928 (or (= lt!236898 (MissingZero!4390 i!1204)) (= lt!236898 (MissingVacant!4390 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!517767 (= lt!236898 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517768 () Bool)

(declare-fun res!316929 () Bool)

(assert (=> b!517768 (=> res!316929 e!302117)))

(get-info :version)

(assert (=> b!517768 (= res!316929 (or (undefined!5202 lt!236901) (not ((_ is Intermediate!4390) lt!236901))))))

(declare-fun b!517769 () Bool)

(declare-fun res!316922 () Bool)

(assert (=> b!517769 (=> (not res!316922) (not e!302115))))

(declare-datatypes ((List!10123 0))(
  ( (Nil!10120) (Cons!10119 (h!11026 (_ BitVec 64)) (t!16342 List!10123)) )
))
(declare-fun arrayNoDuplicates!0 (array!33125 (_ BitVec 32) List!10123) Bool)

(assert (=> b!517769 (= res!316922 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10120))))

(declare-fun b!517770 () Bool)

(declare-fun res!316921 () Bool)

(assert (=> b!517770 (=> (not res!316921) (not e!302114))))

(assert (=> b!517770 (= res!316921 (validKeyInArray!0 k0!2280))))

(declare-fun res!316931 () Bool)

(assert (=> start!46974 (=> (not res!316931) (not e!302114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46974 (= res!316931 (validMask!0 mask!3524))))

(assert (=> start!46974 e!302114))

(assert (=> start!46974 true))

(declare-fun array_inv!11809 (array!33125) Bool)

(assert (=> start!46974 (array_inv!11809 a!3235)))

(declare-fun b!517771 () Bool)

(assert (=> b!517771 (= e!302115 (not e!302117))))

(declare-fun res!316923 () Bool)

(assert (=> b!517771 (=> res!316923 e!302117)))

(declare-fun lt!236902 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33125 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!517771 (= res!316923 (= lt!236901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236902 (select (store (arr!15926 a!3235) i!1204 k0!2280) j!176) (array!33126 (store (arr!15926 a!3235) i!1204 k0!2280) (size!16291 a!3235)) mask!3524)))))

(assert (=> b!517771 (= lt!236901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236900 (select (arr!15926 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517771 (= lt!236902 (toIndex!0 (select (store (arr!15926 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517771 (= lt!236900 (toIndex!0 (select (arr!15926 a!3235) j!176) mask!3524))))

(assert (=> b!517771 e!302116))

(declare-fun res!316926 () Bool)

(assert (=> b!517771 (=> (not res!316926) (not e!302116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33125 (_ BitVec 32)) Bool)

(assert (=> b!517771 (= res!316926 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16024 0))(
  ( (Unit!16025) )
))
(declare-fun lt!236899 () Unit!16024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16024)

(assert (=> b!517771 (= lt!236899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517772 () Bool)

(declare-fun res!316930 () Bool)

(assert (=> b!517772 (=> (not res!316930) (not e!302114))))

(declare-fun arrayContainsKey!0 (array!33125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517772 (= res!316930 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517773 () Bool)

(declare-fun res!316925 () Bool)

(assert (=> b!517773 (=> (not res!316925) (not e!302114))))

(assert (=> b!517773 (= res!316925 (and (= (size!16291 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16291 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16291 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517774 () Bool)

(declare-fun res!316924 () Bool)

(assert (=> b!517774 (=> (not res!316924) (not e!302115))))

(assert (=> b!517774 (= res!316924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46974 res!316931) b!517773))

(assert (= (and b!517773 res!316925) b!517766))

(assert (= (and b!517766 res!316927) b!517770))

(assert (= (and b!517770 res!316921) b!517772))

(assert (= (and b!517772 res!316930) b!517767))

(assert (= (and b!517767 res!316928) b!517774))

(assert (= (and b!517774 res!316924) b!517769))

(assert (= (and b!517769 res!316922) b!517771))

(assert (= (and b!517771 res!316926) b!517764))

(assert (= (and b!517771 (not res!316923)) b!517768))

(assert (= (and b!517768 (not res!316929)) b!517765))

(declare-fun m!498619 () Bool)

(assert (=> b!517774 m!498619))

(declare-fun m!498621 () Bool)

(assert (=> b!517765 m!498621))

(declare-fun m!498623 () Bool)

(assert (=> b!517765 m!498623))

(declare-fun m!498625 () Bool)

(assert (=> b!517772 m!498625))

(assert (=> b!517764 m!498623))

(assert (=> b!517764 m!498623))

(declare-fun m!498627 () Bool)

(assert (=> b!517764 m!498627))

(declare-fun m!498629 () Bool)

(assert (=> b!517770 m!498629))

(declare-fun m!498631 () Bool)

(assert (=> b!517771 m!498631))

(declare-fun m!498633 () Bool)

(assert (=> b!517771 m!498633))

(declare-fun m!498635 () Bool)

(assert (=> b!517771 m!498635))

(assert (=> b!517771 m!498623))

(declare-fun m!498637 () Bool)

(assert (=> b!517771 m!498637))

(assert (=> b!517771 m!498623))

(declare-fun m!498639 () Bool)

(assert (=> b!517771 m!498639))

(assert (=> b!517771 m!498623))

(assert (=> b!517771 m!498635))

(declare-fun m!498641 () Bool)

(assert (=> b!517771 m!498641))

(assert (=> b!517771 m!498635))

(declare-fun m!498643 () Bool)

(assert (=> b!517771 m!498643))

(declare-fun m!498645 () Bool)

(assert (=> b!517771 m!498645))

(declare-fun m!498647 () Bool)

(assert (=> b!517767 m!498647))

(declare-fun m!498649 () Bool)

(assert (=> b!517769 m!498649))

(assert (=> b!517766 m!498623))

(assert (=> b!517766 m!498623))

(declare-fun m!498651 () Bool)

(assert (=> b!517766 m!498651))

(declare-fun m!498653 () Bool)

(assert (=> start!46974 m!498653))

(declare-fun m!498655 () Bool)

(assert (=> start!46974 m!498655))

(check-sat (not start!46974) (not b!517764) (not b!517767) (not b!517772) (not b!517771) (not b!517770) (not b!517774) (not b!517766) (not b!517769))
(check-sat)
