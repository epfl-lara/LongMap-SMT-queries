; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30546 () Bool)

(assert start!30546)

(declare-fun res!162996 () Bool)

(declare-fun e!191892 () Bool)

(assert (=> start!30546 (=> (not res!162996) (not e!191892))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30546 (= res!162996 (validMask!0 mask!3709))))

(assert (=> start!30546 e!191892))

(declare-datatypes ((array!15554 0))(
  ( (array!15555 (arr!7362 (Array (_ BitVec 32) (_ BitVec 64))) (size!7715 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15554)

(declare-fun array_inv!5334 (array!15554) Bool)

(assert (=> start!30546 (array_inv!5334 a!3293)))

(assert (=> start!30546 true))

(declare-fun b!305849 () Bool)

(declare-fun e!191891 () Bool)

(assert (=> b!305849 (= e!191892 e!191891)))

(declare-fun res!162994 () Bool)

(assert (=> b!305849 (=> (not res!162994) (not e!191891))))

(declare-datatypes ((SeekEntryResult!2501 0))(
  ( (MissingZero!2501 (index!12180 (_ BitVec 32))) (Found!2501 (index!12181 (_ BitVec 32))) (Intermediate!2501 (undefined!3313 Bool) (index!12182 (_ BitVec 32)) (x!30451 (_ BitVec 32))) (Undefined!2501) (MissingVacant!2501 (index!12183 (_ BitVec 32))) )
))
(declare-fun lt!150661 () SeekEntryResult!2501)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15554 (_ BitVec 32)) SeekEntryResult!2501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305849 (= res!162994 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150661))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305849 (= lt!150661 (Intermediate!2501 false resIndex!52 resX!52))))

(declare-fun b!305850 () Bool)

(declare-fun res!162998 () Bool)

(assert (=> b!305850 (=> (not res!162998) (not e!191892))))

(declare-fun arrayContainsKey!0 (array!15554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305850 (= res!162998 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305851 () Bool)

(assert (=> b!305851 (= e!191891 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305851 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9436 0))(
  ( (Unit!9437) )
))
(declare-fun lt!150660 () Unit!9436)

(declare-fun e!191894 () Unit!9436)

(assert (=> b!305851 (= lt!150660 e!191894)))

(declare-fun c!49030 () Bool)

(assert (=> b!305851 (= c!49030 (not (= resIndex!52 index!1781)))))

(declare-fun b!305852 () Bool)

(assert (=> b!305852 false))

(declare-fun lt!150662 () SeekEntryResult!2501)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305852 (= lt!150662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun e!191893 () Unit!9436)

(declare-fun Unit!9438 () Unit!9436)

(assert (=> b!305852 (= e!191893 Unit!9438)))

(declare-fun b!305853 () Bool)

(declare-fun res!162997 () Bool)

(assert (=> b!305853 (=> (not res!162997) (not e!191892))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305853 (= res!162997 (and (= (size!7715 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7715 a!3293))))))

(declare-fun b!305854 () Bool)

(declare-fun res!163001 () Bool)

(assert (=> b!305854 (=> (not res!163001) (not e!191892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15554 (_ BitVec 32)) Bool)

(assert (=> b!305854 (= res!163001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305855 () Bool)

(declare-fun res!162993 () Bool)

(assert (=> b!305855 (=> (not res!162993) (not e!191891))))

(assert (=> b!305855 (= res!162993 (and (= (select (arr!7362 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7715 a!3293))))))

(declare-fun b!305856 () Bool)

(assert (=> b!305856 (= e!191894 e!191893)))

(declare-fun c!49031 () Bool)

(assert (=> b!305856 (= c!49031 (or (= (select (arr!7362 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7362 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305857 () Bool)

(assert (=> b!305857 false))

(declare-fun Unit!9439 () Unit!9436)

(assert (=> b!305857 (= e!191893 Unit!9439)))

(declare-fun b!305858 () Bool)

(declare-fun Unit!9440 () Unit!9436)

(assert (=> b!305858 (= e!191894 Unit!9440)))

(declare-fun b!305859 () Bool)

(declare-fun res!162999 () Bool)

(assert (=> b!305859 (=> (not res!162999) (not e!191891))))

(assert (=> b!305859 (= res!162999 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7362 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305860 () Bool)

(declare-fun res!163002 () Bool)

(assert (=> b!305860 (=> (not res!163002) (not e!191892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305860 (= res!163002 (validKeyInArray!0 k0!2441))))

(declare-fun b!305861 () Bool)

(declare-fun res!163000 () Bool)

(assert (=> b!305861 (=> (not res!163000) (not e!191891))))

(assert (=> b!305861 (= res!163000 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150661))))

(declare-fun b!305862 () Bool)

(declare-fun res!162995 () Bool)

(assert (=> b!305862 (=> (not res!162995) (not e!191892))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15554 (_ BitVec 32)) SeekEntryResult!2501)

(assert (=> b!305862 (= res!162995 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2501 i!1240)))))

(assert (= (and start!30546 res!162996) b!305853))

(assert (= (and b!305853 res!162997) b!305860))

(assert (= (and b!305860 res!163002) b!305850))

(assert (= (and b!305850 res!162998) b!305862))

(assert (= (and b!305862 res!162995) b!305854))

(assert (= (and b!305854 res!163001) b!305849))

(assert (= (and b!305849 res!162994) b!305855))

(assert (= (and b!305855 res!162993) b!305861))

(assert (= (and b!305861 res!163000) b!305859))

(assert (= (and b!305859 res!162999) b!305851))

(assert (= (and b!305851 c!49030) b!305856))

(assert (= (and b!305851 (not c!49030)) b!305858))

(assert (= (and b!305856 c!49031) b!305857))

(assert (= (and b!305856 (not c!49031)) b!305852))

(declare-fun m!316105 () Bool)

(assert (=> b!305860 m!316105))

(declare-fun m!316107 () Bool)

(assert (=> b!305855 m!316107))

(declare-fun m!316109 () Bool)

(assert (=> b!305862 m!316109))

(declare-fun m!316111 () Bool)

(assert (=> b!305861 m!316111))

(declare-fun m!316113 () Bool)

(assert (=> start!30546 m!316113))

(declare-fun m!316115 () Bool)

(assert (=> start!30546 m!316115))

(declare-fun m!316117 () Bool)

(assert (=> b!305852 m!316117))

(assert (=> b!305852 m!316117))

(declare-fun m!316119 () Bool)

(assert (=> b!305852 m!316119))

(declare-fun m!316121 () Bool)

(assert (=> b!305850 m!316121))

(declare-fun m!316123 () Bool)

(assert (=> b!305849 m!316123))

(assert (=> b!305849 m!316123))

(declare-fun m!316125 () Bool)

(assert (=> b!305849 m!316125))

(declare-fun m!316127 () Bool)

(assert (=> b!305854 m!316127))

(declare-fun m!316129 () Bool)

(assert (=> b!305856 m!316129))

(assert (=> b!305859 m!316129))

(check-sat (not b!305852) (not b!305861) (not b!305849) (not start!30546) (not b!305862) (not b!305860) (not b!305854) (not b!305850))
(check-sat)
