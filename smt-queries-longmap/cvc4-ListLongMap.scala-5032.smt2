; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68706 () Bool)

(assert start!68706)

(declare-fun b!800094 () Bool)

(declare-fun res!544619 () Bool)

(declare-fun e!443636 () Bool)

(assert (=> b!800094 (=> (not res!544619) (not e!443636))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43496 0))(
  ( (array!43497 (arr!20828 (Array (_ BitVec 32) (_ BitVec 64))) (size!21249 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43496)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800094 (= res!544619 (and (= (size!21249 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21249 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21249 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800095 () Bool)

(declare-fun e!443634 () Bool)

(assert (=> b!800095 (= e!443634 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8419 0))(
  ( (MissingZero!8419 (index!36044 (_ BitVec 32))) (Found!8419 (index!36045 (_ BitVec 32))) (Intermediate!8419 (undefined!9231 Bool) (index!36046 (_ BitVec 32)) (x!66913 (_ BitVec 32))) (Undefined!8419) (MissingVacant!8419 (index!36047 (_ BitVec 32))) )
))
(declare-fun lt!357398 () SeekEntryResult!8419)

(declare-fun lt!357394 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43496 (_ BitVec 32)) SeekEntryResult!8419)

(assert (=> b!800095 (= lt!357398 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357394 vacantBefore!23 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800096 () Bool)

(declare-fun e!443635 () Bool)

(declare-fun e!443632 () Bool)

(assert (=> b!800096 (= e!443635 e!443632)))

(declare-fun res!544622 () Bool)

(assert (=> b!800096 (=> (not res!544622) (not e!443632))))

(declare-fun lt!357397 () (_ BitVec 64))

(declare-fun lt!357399 () SeekEntryResult!8419)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357401 () array!43496)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!800096 (= res!544622 (= lt!357399 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357397 lt!357401 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43496 (_ BitVec 32)) SeekEntryResult!8419)

(assert (=> b!800096 (= lt!357399 (seekEntryOrOpen!0 lt!357397 lt!357401 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!800096 (= lt!357397 (select (store (arr!20828 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800096 (= lt!357401 (array!43497 (store (arr!20828 a!3170) i!1163 k!2044) (size!21249 a!3170)))))

(declare-fun b!800097 () Bool)

(declare-fun res!544614 () Bool)

(assert (=> b!800097 (=> (not res!544614) (not e!443635))))

(assert (=> b!800097 (= res!544614 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21249 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20828 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21249 a!3170)) (= (select (arr!20828 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800098 () Bool)

(declare-fun res!544625 () Bool)

(assert (=> b!800098 (=> (not res!544625) (not e!443635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43496 (_ BitVec 32)) Bool)

(assert (=> b!800098 (= res!544625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800099 () Bool)

(declare-fun e!443631 () Bool)

(assert (=> b!800099 (= e!443631 e!443634)))

(declare-fun res!544617 () Bool)

(assert (=> b!800099 (=> (not res!544617) (not e!443634))))

(assert (=> b!800099 (= res!544617 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357394 #b00000000000000000000000000000000) (bvslt lt!357394 (size!21249 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800099 (= lt!357394 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544624 () Bool)

(assert (=> start!68706 (=> (not res!544624) (not e!443636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68706 (= res!544624 (validMask!0 mask!3266))))

(assert (=> start!68706 e!443636))

(assert (=> start!68706 true))

(declare-fun array_inv!16624 (array!43496) Bool)

(assert (=> start!68706 (array_inv!16624 a!3170)))

(declare-fun b!800100 () Bool)

(assert (=> b!800100 (= e!443636 e!443635)))

(declare-fun res!544620 () Bool)

(assert (=> b!800100 (=> (not res!544620) (not e!443635))))

(declare-fun lt!357396 () SeekEntryResult!8419)

(assert (=> b!800100 (= res!544620 (or (= lt!357396 (MissingZero!8419 i!1163)) (= lt!357396 (MissingVacant!8419 i!1163))))))

(assert (=> b!800100 (= lt!357396 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800101 () Bool)

(declare-fun res!544618 () Bool)

(assert (=> b!800101 (=> (not res!544618) (not e!443636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800101 (= res!544618 (validKeyInArray!0 (select (arr!20828 a!3170) j!153)))))

(declare-fun b!800102 () Bool)

(assert (=> b!800102 (= e!443632 e!443631)))

(declare-fun res!544623 () Bool)

(assert (=> b!800102 (=> (not res!544623) (not e!443631))))

(declare-fun lt!357395 () SeekEntryResult!8419)

(declare-fun lt!357400 () SeekEntryResult!8419)

(assert (=> b!800102 (= res!544623 (and (= lt!357400 lt!357395) (= lt!357395 (Found!8419 j!153)) (not (= (select (arr!20828 a!3170) index!1236) (select (arr!20828 a!3170) j!153)))))))

(assert (=> b!800102 (= lt!357395 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800102 (= lt!357400 (seekEntryOrOpen!0 (select (arr!20828 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800103 () Bool)

(declare-fun res!544621 () Bool)

(assert (=> b!800103 (=> (not res!544621) (not e!443636))))

(assert (=> b!800103 (= res!544621 (validKeyInArray!0 k!2044))))

(declare-fun b!800104 () Bool)

(declare-fun res!544613 () Bool)

(assert (=> b!800104 (=> (not res!544613) (not e!443636))))

(declare-fun arrayContainsKey!0 (array!43496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800104 (= res!544613 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800105 () Bool)

(declare-fun res!544616 () Bool)

(assert (=> b!800105 (=> (not res!544616) (not e!443635))))

(declare-datatypes ((List!14791 0))(
  ( (Nil!14788) (Cons!14787 (h!15916 (_ BitVec 64)) (t!21106 List!14791)) )
))
(declare-fun arrayNoDuplicates!0 (array!43496 (_ BitVec 32) List!14791) Bool)

(assert (=> b!800105 (= res!544616 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14788))))

(declare-fun b!800106 () Bool)

(declare-fun res!544615 () Bool)

(assert (=> b!800106 (=> (not res!544615) (not e!443634))))

(assert (=> b!800106 (= res!544615 (= lt!357399 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357394 vacantAfter!23 lt!357397 lt!357401 mask!3266)))))

(assert (= (and start!68706 res!544624) b!800094))

(assert (= (and b!800094 res!544619) b!800101))

(assert (= (and b!800101 res!544618) b!800103))

(assert (= (and b!800103 res!544621) b!800104))

(assert (= (and b!800104 res!544613) b!800100))

(assert (= (and b!800100 res!544620) b!800098))

(assert (= (and b!800098 res!544625) b!800105))

(assert (= (and b!800105 res!544616) b!800097))

(assert (= (and b!800097 res!544614) b!800096))

(assert (= (and b!800096 res!544622) b!800102))

(assert (= (and b!800102 res!544623) b!800099))

(assert (= (and b!800099 res!544617) b!800106))

(assert (= (and b!800106 res!544615) b!800095))

(declare-fun m!741155 () Bool)

(assert (=> b!800105 m!741155))

(declare-fun m!741157 () Bool)

(assert (=> b!800095 m!741157))

(assert (=> b!800095 m!741157))

(declare-fun m!741159 () Bool)

(assert (=> b!800095 m!741159))

(declare-fun m!741161 () Bool)

(assert (=> b!800103 m!741161))

(declare-fun m!741163 () Bool)

(assert (=> b!800096 m!741163))

(declare-fun m!741165 () Bool)

(assert (=> b!800096 m!741165))

(declare-fun m!741167 () Bool)

(assert (=> b!800096 m!741167))

(declare-fun m!741169 () Bool)

(assert (=> b!800096 m!741169))

(declare-fun m!741171 () Bool)

(assert (=> b!800102 m!741171))

(assert (=> b!800102 m!741157))

(assert (=> b!800102 m!741157))

(declare-fun m!741173 () Bool)

(assert (=> b!800102 m!741173))

(assert (=> b!800102 m!741157))

(declare-fun m!741175 () Bool)

(assert (=> b!800102 m!741175))

(declare-fun m!741177 () Bool)

(assert (=> b!800106 m!741177))

(declare-fun m!741179 () Bool)

(assert (=> b!800097 m!741179))

(declare-fun m!741181 () Bool)

(assert (=> b!800097 m!741181))

(declare-fun m!741183 () Bool)

(assert (=> b!800104 m!741183))

(declare-fun m!741185 () Bool)

(assert (=> b!800099 m!741185))

(declare-fun m!741187 () Bool)

(assert (=> b!800100 m!741187))

(declare-fun m!741189 () Bool)

(assert (=> start!68706 m!741189))

(declare-fun m!741191 () Bool)

(assert (=> start!68706 m!741191))

(assert (=> b!800101 m!741157))

(assert (=> b!800101 m!741157))

(declare-fun m!741193 () Bool)

(assert (=> b!800101 m!741193))

(declare-fun m!741195 () Bool)

(assert (=> b!800098 m!741195))

(push 1)

