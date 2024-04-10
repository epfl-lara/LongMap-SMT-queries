; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69202 () Bool)

(assert start!69202)

(declare-fun res!551296 () Bool)

(declare-fun e!446931 () Bool)

(assert (=> start!69202 (=> (not res!551296) (not e!446931))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69202 (= res!551296 (validMask!0 mask!3266))))

(assert (=> start!69202 e!446931))

(assert (=> start!69202 true))

(declare-datatypes ((array!43902 0))(
  ( (array!43903 (arr!21028 (Array (_ BitVec 32) (_ BitVec 64))) (size!21449 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43902)

(declare-fun array_inv!16824 (array!43902) Bool)

(assert (=> start!69202 (array_inv!16824 a!3170)))

(declare-fun b!807173 () Bool)

(declare-fun res!551303 () Bool)

(assert (=> b!807173 (=> (not res!551303) (not e!446931))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807173 (= res!551303 (and (= (size!21449 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21449 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21449 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807174 () Bool)

(declare-fun res!551297 () Bool)

(assert (=> b!807174 (=> (not res!551297) (not e!446931))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807174 (= res!551297 (validKeyInArray!0 k0!2044))))

(declare-fun b!807175 () Bool)

(declare-fun res!551301 () Bool)

(declare-fun e!446932 () Bool)

(assert (=> b!807175 (=> (not res!551301) (not e!446932))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807175 (= res!551301 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21449 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21028 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21449 a!3170)) (= (select (arr!21028 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807176 () Bool)

(declare-fun res!551305 () Bool)

(assert (=> b!807176 (=> (not res!551305) (not e!446932))))

(declare-datatypes ((List!14991 0))(
  ( (Nil!14988) (Cons!14987 (h!16116 (_ BitVec 64)) (t!21306 List!14991)) )
))
(declare-fun arrayNoDuplicates!0 (array!43902 (_ BitVec 32) List!14991) Bool)

(assert (=> b!807176 (= res!551305 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14988))))

(declare-fun b!807177 () Bool)

(declare-fun res!551304 () Bool)

(assert (=> b!807177 (=> (not res!551304) (not e!446931))))

(assert (=> b!807177 (= res!551304 (validKeyInArray!0 (select (arr!21028 a!3170) j!153)))))

(declare-fun b!807178 () Bool)

(assert (=> b!807178 (= e!446931 e!446932)))

(declare-fun res!551300 () Bool)

(assert (=> b!807178 (=> (not res!551300) (not e!446932))))

(declare-datatypes ((SeekEntryResult!8619 0))(
  ( (MissingZero!8619 (index!36844 (_ BitVec 32))) (Found!8619 (index!36845 (_ BitVec 32))) (Intermediate!8619 (undefined!9431 Bool) (index!36846 (_ BitVec 32)) (x!67655 (_ BitVec 32))) (Undefined!8619) (MissingVacant!8619 (index!36847 (_ BitVec 32))) )
))
(declare-fun lt!361588 () SeekEntryResult!8619)

(assert (=> b!807178 (= res!551300 (or (= lt!361588 (MissingZero!8619 i!1163)) (= lt!361588 (MissingVacant!8619 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43902 (_ BitVec 32)) SeekEntryResult!8619)

(assert (=> b!807178 (= lt!361588 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807179 () Bool)

(declare-fun e!446930 () Bool)

(assert (=> b!807179 (= e!446932 e!446930)))

(declare-fun res!551302 () Bool)

(assert (=> b!807179 (=> (not res!551302) (not e!446930))))

(declare-fun lt!361587 () array!43902)

(declare-fun lt!361589 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43902 (_ BitVec 32)) SeekEntryResult!8619)

(assert (=> b!807179 (= res!551302 (= (seekEntryOrOpen!0 lt!361589 lt!361587 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361589 lt!361587 mask!3266)))))

(assert (=> b!807179 (= lt!361589 (select (store (arr!21028 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807179 (= lt!361587 (array!43903 (store (arr!21028 a!3170) i!1163 k0!2044) (size!21449 a!3170)))))

(declare-fun b!807180 () Bool)

(declare-fun res!551298 () Bool)

(assert (=> b!807180 (=> (not res!551298) (not e!446931))))

(declare-fun arrayContainsKey!0 (array!43902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807180 (= res!551298 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807181 () Bool)

(declare-fun e!446933 () Bool)

(assert (=> b!807181 (= e!446930 e!446933)))

(declare-fun res!551306 () Bool)

(assert (=> b!807181 (=> (not res!551306) (not e!446933))))

(declare-fun lt!361585 () SeekEntryResult!8619)

(declare-fun lt!361584 () SeekEntryResult!8619)

(assert (=> b!807181 (= res!551306 (and (= lt!361584 lt!361585) (= lt!361585 (Found!8619 j!153)) (not (= (select (arr!21028 a!3170) index!1236) (select (arr!21028 a!3170) j!153)))))))

(assert (=> b!807181 (= lt!361585 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21028 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807181 (= lt!361584 (seekEntryOrOpen!0 (select (arr!21028 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807182 () Bool)

(declare-fun res!551299 () Bool)

(assert (=> b!807182 (=> (not res!551299) (not e!446932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43902 (_ BitVec 32)) Bool)

(assert (=> b!807182 (= res!551299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807183 () Bool)

(assert (=> b!807183 (= e!446933 false)))

(declare-fun lt!361586 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807183 (= lt!361586 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69202 res!551296) b!807173))

(assert (= (and b!807173 res!551303) b!807177))

(assert (= (and b!807177 res!551304) b!807174))

(assert (= (and b!807174 res!551297) b!807180))

(assert (= (and b!807180 res!551298) b!807178))

(assert (= (and b!807178 res!551300) b!807182))

(assert (= (and b!807182 res!551299) b!807176))

(assert (= (and b!807176 res!551305) b!807175))

(assert (= (and b!807175 res!551301) b!807179))

(assert (= (and b!807179 res!551302) b!807181))

(assert (= (and b!807181 res!551306) b!807183))

(declare-fun m!749167 () Bool)

(assert (=> b!807181 m!749167))

(declare-fun m!749169 () Bool)

(assert (=> b!807181 m!749169))

(assert (=> b!807181 m!749169))

(declare-fun m!749171 () Bool)

(assert (=> b!807181 m!749171))

(assert (=> b!807181 m!749169))

(declare-fun m!749173 () Bool)

(assert (=> b!807181 m!749173))

(declare-fun m!749175 () Bool)

(assert (=> start!69202 m!749175))

(declare-fun m!749177 () Bool)

(assert (=> start!69202 m!749177))

(assert (=> b!807177 m!749169))

(assert (=> b!807177 m!749169))

(declare-fun m!749179 () Bool)

(assert (=> b!807177 m!749179))

(declare-fun m!749181 () Bool)

(assert (=> b!807178 m!749181))

(declare-fun m!749183 () Bool)

(assert (=> b!807176 m!749183))

(declare-fun m!749185 () Bool)

(assert (=> b!807180 m!749185))

(declare-fun m!749187 () Bool)

(assert (=> b!807183 m!749187))

(declare-fun m!749189 () Bool)

(assert (=> b!807179 m!749189))

(declare-fun m!749191 () Bool)

(assert (=> b!807179 m!749191))

(declare-fun m!749193 () Bool)

(assert (=> b!807179 m!749193))

(declare-fun m!749195 () Bool)

(assert (=> b!807179 m!749195))

(declare-fun m!749197 () Bool)

(assert (=> b!807174 m!749197))

(declare-fun m!749199 () Bool)

(assert (=> b!807175 m!749199))

(declare-fun m!749201 () Bool)

(assert (=> b!807175 m!749201))

(declare-fun m!749203 () Bool)

(assert (=> b!807182 m!749203))

(check-sat (not b!807180) (not b!807181) (not start!69202) (not b!807174) (not b!807182) (not b!807178) (not b!807179) (not b!807177) (not b!807183) (not b!807176))
(check-sat)
