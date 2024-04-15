; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68652 () Bool)

(assert start!68652)

(declare-fun b!799181 () Bool)

(declare-fun e!443171 () Bool)

(declare-fun e!443176 () Bool)

(assert (=> b!799181 (= e!443171 e!443176)))

(declare-fun res!543847 () Bool)

(assert (=> b!799181 (=> (not res!543847) (not e!443176))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43459 0))(
  ( (array!43460 (arr!20810 (Array (_ BitVec 32) (_ BitVec 64))) (size!21231 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43459)

(declare-fun lt!356749 () (_ BitVec 32))

(assert (=> b!799181 (= res!543847 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356749 #b00000000000000000000000000000000) (bvslt lt!356749 (size!21231 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799181 (= lt!356749 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799183 () Bool)

(declare-fun e!443174 () Bool)

(declare-fun e!443173 () Bool)

(assert (=> b!799183 (= e!443174 e!443173)))

(declare-fun res!543850 () Bool)

(assert (=> b!799183 (=> (not res!543850) (not e!443173))))

(declare-fun lt!356751 () array!43459)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8398 0))(
  ( (MissingZero!8398 (index!35960 (_ BitVec 32))) (Found!8398 (index!35961 (_ BitVec 32))) (Intermediate!8398 (undefined!9210 Bool) (index!35962 (_ BitVec 32)) (x!66847 (_ BitVec 32))) (Undefined!8398) (MissingVacant!8398 (index!35963 (_ BitVec 32))) )
))
(declare-fun lt!356753 () SeekEntryResult!8398)

(declare-fun lt!356748 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43459 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!799183 (= res!543850 (= lt!356753 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356748 lt!356751 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43459 (_ BitVec 32)) SeekEntryResult!8398)

(assert (=> b!799183 (= lt!356753 (seekEntryOrOpen!0 lt!356748 lt!356751 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799183 (= lt!356748 (select (store (arr!20810 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799183 (= lt!356751 (array!43460 (store (arr!20810 a!3170) i!1163 k0!2044) (size!21231 a!3170)))))

(declare-fun b!799184 () Bool)

(declare-fun res!543840 () Bool)

(assert (=> b!799184 (=> (not res!543840) (not e!443174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43459 (_ BitVec 32)) Bool)

(assert (=> b!799184 (= res!543840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799185 () Bool)

(declare-fun res!543852 () Bool)

(declare-fun e!443175 () Bool)

(assert (=> b!799185 (=> (not res!543852) (not e!443175))))

(assert (=> b!799185 (= res!543852 (and (= (size!21231 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21231 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21231 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799186 () Bool)

(declare-fun res!543842 () Bool)

(assert (=> b!799186 (=> (not res!543842) (not e!443176))))

(assert (=> b!799186 (= res!543842 (= lt!356753 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356749 vacantAfter!23 lt!356748 lt!356751 mask!3266)))))

(declare-fun b!799187 () Bool)

(assert (=> b!799187 (= e!443175 e!443174)))

(declare-fun res!543846 () Bool)

(assert (=> b!799187 (=> (not res!543846) (not e!443174))))

(declare-fun lt!356746 () SeekEntryResult!8398)

(assert (=> b!799187 (= res!543846 (or (= lt!356746 (MissingZero!8398 i!1163)) (= lt!356746 (MissingVacant!8398 i!1163))))))

(assert (=> b!799187 (= lt!356746 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799188 () Bool)

(declare-fun res!543848 () Bool)

(assert (=> b!799188 (=> (not res!543848) (not e!443174))))

(declare-datatypes ((List!14812 0))(
  ( (Nil!14809) (Cons!14808 (h!15937 (_ BitVec 64)) (t!21118 List!14812)) )
))
(declare-fun arrayNoDuplicates!0 (array!43459 (_ BitVec 32) List!14812) Bool)

(assert (=> b!799188 (= res!543848 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14809))))

(declare-fun b!799189 () Bool)

(declare-fun res!543845 () Bool)

(assert (=> b!799189 (=> (not res!543845) (not e!443175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799189 (= res!543845 (validKeyInArray!0 k0!2044))))

(declare-fun b!799190 () Bool)

(assert (=> b!799190 (= e!443173 e!443171)))

(declare-fun res!543851 () Bool)

(assert (=> b!799190 (=> (not res!543851) (not e!443171))))

(declare-fun lt!356750 () SeekEntryResult!8398)

(declare-fun lt!356747 () SeekEntryResult!8398)

(assert (=> b!799190 (= res!543851 (and (= lt!356747 lt!356750) (= lt!356750 (Found!8398 j!153)) (not (= (select (arr!20810 a!3170) index!1236) (select (arr!20810 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799190 (= lt!356750 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799190 (= lt!356747 (seekEntryOrOpen!0 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799191 () Bool)

(declare-fun res!543843 () Bool)

(assert (=> b!799191 (=> (not res!543843) (not e!443174))))

(assert (=> b!799191 (= res!543843 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21231 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20810 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21231 a!3170)) (= (select (arr!20810 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799182 () Bool)

(declare-fun res!543844 () Bool)

(assert (=> b!799182 (=> (not res!543844) (not e!443175))))

(assert (=> b!799182 (= res!543844 (validKeyInArray!0 (select (arr!20810 a!3170) j!153)))))

(declare-fun res!543849 () Bool)

(assert (=> start!68652 (=> (not res!543849) (not e!443175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68652 (= res!543849 (validMask!0 mask!3266))))

(assert (=> start!68652 e!443175))

(assert (=> start!68652 true))

(declare-fun array_inv!16693 (array!43459) Bool)

(assert (=> start!68652 (array_inv!16693 a!3170)))

(declare-fun b!799192 () Bool)

(assert (=> b!799192 (= e!443176 false)))

(declare-fun lt!356752 () SeekEntryResult!8398)

(assert (=> b!799192 (= lt!356752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356749 vacantBefore!23 (select (arr!20810 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799193 () Bool)

(declare-fun res!543841 () Bool)

(assert (=> b!799193 (=> (not res!543841) (not e!443175))))

(declare-fun arrayContainsKey!0 (array!43459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799193 (= res!543841 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68652 res!543849) b!799185))

(assert (= (and b!799185 res!543852) b!799182))

(assert (= (and b!799182 res!543844) b!799189))

(assert (= (and b!799189 res!543845) b!799193))

(assert (= (and b!799193 res!543841) b!799187))

(assert (= (and b!799187 res!543846) b!799184))

(assert (= (and b!799184 res!543840) b!799188))

(assert (= (and b!799188 res!543848) b!799191))

(assert (= (and b!799191 res!543843) b!799183))

(assert (= (and b!799183 res!543850) b!799190))

(assert (= (and b!799190 res!543851) b!799181))

(assert (= (and b!799181 res!543847) b!799186))

(assert (= (and b!799186 res!543842) b!799192))

(declare-fun m!739699 () Bool)

(assert (=> start!68652 m!739699))

(declare-fun m!739701 () Bool)

(assert (=> start!68652 m!739701))

(declare-fun m!739703 () Bool)

(assert (=> b!799191 m!739703))

(declare-fun m!739705 () Bool)

(assert (=> b!799191 m!739705))

(declare-fun m!739707 () Bool)

(assert (=> b!799187 m!739707))

(declare-fun m!739709 () Bool)

(assert (=> b!799186 m!739709))

(declare-fun m!739711 () Bool)

(assert (=> b!799182 m!739711))

(assert (=> b!799182 m!739711))

(declare-fun m!739713 () Bool)

(assert (=> b!799182 m!739713))

(declare-fun m!739715 () Bool)

(assert (=> b!799183 m!739715))

(declare-fun m!739717 () Bool)

(assert (=> b!799183 m!739717))

(declare-fun m!739719 () Bool)

(assert (=> b!799183 m!739719))

(declare-fun m!739721 () Bool)

(assert (=> b!799183 m!739721))

(assert (=> b!799192 m!739711))

(assert (=> b!799192 m!739711))

(declare-fun m!739723 () Bool)

(assert (=> b!799192 m!739723))

(declare-fun m!739725 () Bool)

(assert (=> b!799188 m!739725))

(declare-fun m!739727 () Bool)

(assert (=> b!799189 m!739727))

(declare-fun m!739729 () Bool)

(assert (=> b!799190 m!739729))

(assert (=> b!799190 m!739711))

(assert (=> b!799190 m!739711))

(declare-fun m!739731 () Bool)

(assert (=> b!799190 m!739731))

(assert (=> b!799190 m!739711))

(declare-fun m!739733 () Bool)

(assert (=> b!799190 m!739733))

(declare-fun m!739735 () Bool)

(assert (=> b!799181 m!739735))

(declare-fun m!739737 () Bool)

(assert (=> b!799193 m!739737))

(declare-fun m!739739 () Bool)

(assert (=> b!799184 m!739739))

(check-sat (not b!799192) (not b!799183) (not b!799181) (not b!799184) (not b!799190) (not start!68652) (not b!799182) (not b!799186) (not b!799188) (not b!799187) (not b!799189) (not b!799193))
(check-sat)
