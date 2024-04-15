; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45798 () Bool)

(assert start!45798)

(declare-fun e!296631 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!506877 () Bool)

(declare-datatypes ((array!32564 0))(
  ( (array!32565 (arr!15662 (Array (_ BitVec 32) (_ BitVec 64))) (size!16027 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32564)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4126 0))(
  ( (MissingZero!4126 (index!18692 (_ BitVec 32))) (Found!4126 (index!18693 (_ BitVec 32))) (Intermediate!4126 (undefined!4938 Bool) (index!18694 (_ BitVec 32)) (x!47698 (_ BitVec 32))) (Undefined!4126) (MissingVacant!4126 (index!18695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32564 (_ BitVec 32)) SeekEntryResult!4126)

(assert (=> b!506877 (= e!296631 (= (seekEntryOrOpen!0 (select (arr!15662 a!3235) j!176) a!3235 mask!3524) (Found!4126 j!176)))))

(declare-fun b!506878 () Bool)

(declare-fun e!296629 () Bool)

(declare-fun e!296630 () Bool)

(assert (=> b!506878 (= e!296629 e!296630)))

(declare-fun res!307984 () Bool)

(assert (=> b!506878 (=> (not res!307984) (not e!296630))))

(declare-fun lt!231252 () SeekEntryResult!4126)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506878 (= res!307984 (or (= lt!231252 (MissingZero!4126 i!1204)) (= lt!231252 (MissingVacant!4126 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!506878 (= lt!231252 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506879 () Bool)

(declare-fun e!296632 () Bool)

(assert (=> b!506879 (= e!296632 true)))

(declare-fun lt!231258 () (_ BitVec 64))

(declare-fun lt!231259 () array!32564)

(declare-fun lt!231255 () SeekEntryResult!4126)

(assert (=> b!506879 (= lt!231255 (seekEntryOrOpen!0 lt!231258 lt!231259 mask!3524))))

(assert (=> b!506879 false))

(declare-fun b!506880 () Bool)

(declare-fun res!307981 () Bool)

(assert (=> b!506880 (=> (not res!307981) (not e!296630))))

(declare-datatypes ((List!9859 0))(
  ( (Nil!9856) (Cons!9855 (h!10732 (_ BitVec 64)) (t!16078 List!9859)) )
))
(declare-fun arrayNoDuplicates!0 (array!32564 (_ BitVec 32) List!9859) Bool)

(assert (=> b!506880 (= res!307981 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9856))))

(declare-fun b!506881 () Bool)

(declare-fun res!307987 () Bool)

(assert (=> b!506881 (=> (not res!307987) (not e!296629))))

(declare-fun arrayContainsKey!0 (array!32564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506881 (= res!307987 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506882 () Bool)

(declare-fun res!307980 () Bool)

(assert (=> b!506882 (=> (not res!307980) (not e!296629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506882 (= res!307980 (validKeyInArray!0 (select (arr!15662 a!3235) j!176)))))

(declare-fun res!307985 () Bool)

(assert (=> start!45798 (=> (not res!307985) (not e!296629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45798 (= res!307985 (validMask!0 mask!3524))))

(assert (=> start!45798 e!296629))

(assert (=> start!45798 true))

(declare-fun array_inv!11545 (array!32564) Bool)

(assert (=> start!45798 (array_inv!11545 a!3235)))

(declare-fun b!506883 () Bool)

(declare-fun e!296633 () Bool)

(assert (=> b!506883 (= e!296630 (not e!296633))))

(declare-fun res!307986 () Bool)

(assert (=> b!506883 (=> res!307986 e!296633)))

(declare-fun lt!231251 () SeekEntryResult!4126)

(declare-fun lt!231253 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32564 (_ BitVec 32)) SeekEntryResult!4126)

(assert (=> b!506883 (= res!307986 (= lt!231251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231253 lt!231258 lt!231259 mask!3524)))))

(declare-fun lt!231254 () (_ BitVec 32))

(assert (=> b!506883 (= lt!231251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231254 (select (arr!15662 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506883 (= lt!231253 (toIndex!0 lt!231258 mask!3524))))

(assert (=> b!506883 (= lt!231258 (select (store (arr!15662 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506883 (= lt!231254 (toIndex!0 (select (arr!15662 a!3235) j!176) mask!3524))))

(assert (=> b!506883 (= lt!231259 (array!32565 (store (arr!15662 a!3235) i!1204 k0!2280) (size!16027 a!3235)))))

(assert (=> b!506883 e!296631))

(declare-fun res!307978 () Bool)

(assert (=> b!506883 (=> (not res!307978) (not e!296631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32564 (_ BitVec 32)) Bool)

(assert (=> b!506883 (= res!307978 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15526 0))(
  ( (Unit!15527) )
))
(declare-fun lt!231257 () Unit!15526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15526)

(assert (=> b!506883 (= lt!231257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506884 () Bool)

(declare-fun res!307988 () Bool)

(assert (=> b!506884 (=> (not res!307988) (not e!296630))))

(assert (=> b!506884 (= res!307988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506885 () Bool)

(assert (=> b!506885 (= e!296633 e!296632)))

(declare-fun res!307982 () Bool)

(assert (=> b!506885 (=> res!307982 e!296632)))

(declare-fun lt!231256 () Bool)

(assert (=> b!506885 (= res!307982 (or (and (not lt!231256) (undefined!4938 lt!231251)) (and (not lt!231256) (not (undefined!4938 lt!231251)))))))

(get-info :version)

(assert (=> b!506885 (= lt!231256 (not ((_ is Intermediate!4126) lt!231251)))))

(declare-fun b!506886 () Bool)

(declare-fun res!307979 () Bool)

(assert (=> b!506886 (=> (not res!307979) (not e!296629))))

(assert (=> b!506886 (= res!307979 (and (= (size!16027 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16027 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16027 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506887 () Bool)

(declare-fun res!307983 () Bool)

(assert (=> b!506887 (=> (not res!307983) (not e!296629))))

(assert (=> b!506887 (= res!307983 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45798 res!307985) b!506886))

(assert (= (and b!506886 res!307979) b!506882))

(assert (= (and b!506882 res!307980) b!506887))

(assert (= (and b!506887 res!307983) b!506881))

(assert (= (and b!506881 res!307987) b!506878))

(assert (= (and b!506878 res!307984) b!506884))

(assert (= (and b!506884 res!307988) b!506880))

(assert (= (and b!506880 res!307981) b!506883))

(assert (= (and b!506883 res!307978) b!506877))

(assert (= (and b!506883 (not res!307986)) b!506885))

(assert (= (and b!506885 (not res!307982)) b!506879))

(declare-fun m!487123 () Bool)

(assert (=> b!506882 m!487123))

(assert (=> b!506882 m!487123))

(declare-fun m!487125 () Bool)

(assert (=> b!506882 m!487125))

(declare-fun m!487127 () Bool)

(assert (=> b!506881 m!487127))

(declare-fun m!487129 () Bool)

(assert (=> b!506887 m!487129))

(declare-fun m!487131 () Bool)

(assert (=> b!506883 m!487131))

(declare-fun m!487133 () Bool)

(assert (=> b!506883 m!487133))

(declare-fun m!487135 () Bool)

(assert (=> b!506883 m!487135))

(declare-fun m!487137 () Bool)

(assert (=> b!506883 m!487137))

(assert (=> b!506883 m!487123))

(declare-fun m!487139 () Bool)

(assert (=> b!506883 m!487139))

(assert (=> b!506883 m!487123))

(declare-fun m!487141 () Bool)

(assert (=> b!506883 m!487141))

(declare-fun m!487143 () Bool)

(assert (=> b!506883 m!487143))

(assert (=> b!506883 m!487123))

(declare-fun m!487145 () Bool)

(assert (=> b!506883 m!487145))

(declare-fun m!487147 () Bool)

(assert (=> b!506880 m!487147))

(declare-fun m!487149 () Bool)

(assert (=> b!506884 m!487149))

(assert (=> b!506877 m!487123))

(assert (=> b!506877 m!487123))

(declare-fun m!487151 () Bool)

(assert (=> b!506877 m!487151))

(declare-fun m!487153 () Bool)

(assert (=> b!506879 m!487153))

(declare-fun m!487155 () Bool)

(assert (=> start!45798 m!487155))

(declare-fun m!487157 () Bool)

(assert (=> start!45798 m!487157))

(declare-fun m!487159 () Bool)

(assert (=> b!506878 m!487159))

(check-sat (not b!506883) (not b!506884) (not b!506882) (not b!506887) (not b!506881) (not b!506878) (not start!45798) (not b!506879) (not b!506880) (not b!506877))
(check-sat)
