; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68834 () Bool)

(assert start!68834)

(declare-fun b!800202 () Bool)

(declare-fun e!443847 () Bool)

(declare-fun e!443846 () Bool)

(assert (=> b!800202 (= e!443847 e!443846)))

(declare-fun res!544176 () Bool)

(assert (=> b!800202 (=> (not res!544176) (not e!443846))))

(declare-datatypes ((SeekEntryResult!8350 0))(
  ( (MissingZero!8350 (index!35768 (_ BitVec 32))) (Found!8350 (index!35769 (_ BitVec 32))) (Intermediate!8350 (undefined!9162 Bool) (index!35770 (_ BitVec 32)) (x!66810 (_ BitVec 32))) (Undefined!8350) (MissingVacant!8350 (index!35771 (_ BitVec 32))) )
))
(declare-fun lt!357276 () SeekEntryResult!8350)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800202 (= res!544176 (or (= lt!357276 (MissingZero!8350 i!1163)) (= lt!357276 (MissingVacant!8350 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43456 0))(
  ( (array!43457 (arr!20803 (Array (_ BitVec 32) (_ BitVec 64))) (size!21223 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43456)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43456 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!800202 (= lt!357276 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800203 () Bool)

(declare-fun e!443848 () Bool)

(declare-fun e!443844 () Bool)

(assert (=> b!800203 (= e!443848 e!443844)))

(declare-fun res!544178 () Bool)

(assert (=> b!800203 (=> (not res!544178) (not e!443844))))

(declare-fun lt!357274 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!800203 (= res!544178 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357274 #b00000000000000000000000000000000) (bvslt lt!357274 (size!21223 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800203 (= lt!357274 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800204 () Bool)

(declare-fun res!544182 () Bool)

(assert (=> b!800204 (=> (not res!544182) (not e!443847))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800204 (= res!544182 (and (= (size!21223 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21223 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21223 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800205 () Bool)

(declare-fun res!544174 () Bool)

(assert (=> b!800205 (=> (not res!544174) (not e!443847))))

(declare-fun arrayContainsKey!0 (array!43456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800205 (= res!544174 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800206 () Bool)

(assert (=> b!800206 (= e!443844 false)))

(declare-fun lt!357277 () SeekEntryResult!8350)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43456 (_ BitVec 32)) SeekEntryResult!8350)

(assert (=> b!800206 (= lt!357277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357274 vacantBefore!23 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800207 () Bool)

(declare-fun e!443843 () Bool)

(assert (=> b!800207 (= e!443846 e!443843)))

(declare-fun res!544177 () Bool)

(assert (=> b!800207 (=> (not res!544177) (not e!443843))))

(declare-fun lt!357273 () (_ BitVec 64))

(declare-fun lt!357278 () array!43456)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357272 () SeekEntryResult!8350)

(assert (=> b!800207 (= res!544177 (= lt!357272 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357273 lt!357278 mask!3266)))))

(assert (=> b!800207 (= lt!357272 (seekEntryOrOpen!0 lt!357273 lt!357278 mask!3266))))

(assert (=> b!800207 (= lt!357273 (select (store (arr!20803 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800207 (= lt!357278 (array!43457 (store (arr!20803 a!3170) i!1163 k0!2044) (size!21223 a!3170)))))

(declare-fun b!800208 () Bool)

(declare-fun res!544184 () Bool)

(assert (=> b!800208 (=> (not res!544184) (not e!443846))))

(assert (=> b!800208 (= res!544184 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21223 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20803 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21223 a!3170)) (= (select (arr!20803 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800209 () Bool)

(declare-fun res!544173 () Bool)

(assert (=> b!800209 (=> (not res!544173) (not e!443847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800209 (= res!544173 (validKeyInArray!0 k0!2044))))

(declare-fun res!544179 () Bool)

(assert (=> start!68834 (=> (not res!544179) (not e!443847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68834 (= res!544179 (validMask!0 mask!3266))))

(assert (=> start!68834 e!443847))

(assert (=> start!68834 true))

(declare-fun array_inv!16662 (array!43456) Bool)

(assert (=> start!68834 (array_inv!16662 a!3170)))

(declare-fun b!800210 () Bool)

(declare-fun res!544175 () Bool)

(assert (=> b!800210 (=> (not res!544175) (not e!443846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43456 (_ BitVec 32)) Bool)

(assert (=> b!800210 (= res!544175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800211 () Bool)

(declare-fun res!544180 () Bool)

(assert (=> b!800211 (=> (not res!544180) (not e!443846))))

(declare-datatypes ((List!14673 0))(
  ( (Nil!14670) (Cons!14669 (h!15804 (_ BitVec 64)) (t!20980 List!14673)) )
))
(declare-fun arrayNoDuplicates!0 (array!43456 (_ BitVec 32) List!14673) Bool)

(assert (=> b!800211 (= res!544180 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14670))))

(declare-fun b!800212 () Bool)

(assert (=> b!800212 (= e!443843 e!443848)))

(declare-fun res!544185 () Bool)

(assert (=> b!800212 (=> (not res!544185) (not e!443848))))

(declare-fun lt!357271 () SeekEntryResult!8350)

(declare-fun lt!357275 () SeekEntryResult!8350)

(assert (=> b!800212 (= res!544185 (and (= lt!357271 lt!357275) (= lt!357275 (Found!8350 j!153)) (not (= (select (arr!20803 a!3170) index!1236) (select (arr!20803 a!3170) j!153)))))))

(assert (=> b!800212 (= lt!357275 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800212 (= lt!357271 (seekEntryOrOpen!0 (select (arr!20803 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800213 () Bool)

(declare-fun res!544183 () Bool)

(assert (=> b!800213 (=> (not res!544183) (not e!443847))))

(assert (=> b!800213 (= res!544183 (validKeyInArray!0 (select (arr!20803 a!3170) j!153)))))

(declare-fun b!800214 () Bool)

(declare-fun res!544181 () Bool)

(assert (=> b!800214 (=> (not res!544181) (not e!443844))))

(assert (=> b!800214 (= res!544181 (= lt!357272 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357274 vacantAfter!23 lt!357273 lt!357278 mask!3266)))))

(assert (= (and start!68834 res!544179) b!800204))

(assert (= (and b!800204 res!544182) b!800213))

(assert (= (and b!800213 res!544183) b!800209))

(assert (= (and b!800209 res!544173) b!800205))

(assert (= (and b!800205 res!544174) b!800202))

(assert (= (and b!800202 res!544176) b!800210))

(assert (= (and b!800210 res!544175) b!800211))

(assert (= (and b!800211 res!544180) b!800208))

(assert (= (and b!800208 res!544184) b!800207))

(assert (= (and b!800207 res!544177) b!800212))

(assert (= (and b!800212 res!544185) b!800203))

(assert (= (and b!800203 res!544178) b!800214))

(assert (= (and b!800214 res!544181) b!800206))

(declare-fun m!741571 () Bool)

(assert (=> b!800205 m!741571))

(declare-fun m!741573 () Bool)

(assert (=> b!800209 m!741573))

(declare-fun m!741575 () Bool)

(assert (=> b!800208 m!741575))

(declare-fun m!741577 () Bool)

(assert (=> b!800208 m!741577))

(declare-fun m!741579 () Bool)

(assert (=> b!800211 m!741579))

(declare-fun m!741581 () Bool)

(assert (=> b!800213 m!741581))

(assert (=> b!800213 m!741581))

(declare-fun m!741583 () Bool)

(assert (=> b!800213 m!741583))

(declare-fun m!741585 () Bool)

(assert (=> b!800207 m!741585))

(declare-fun m!741587 () Bool)

(assert (=> b!800207 m!741587))

(declare-fun m!741589 () Bool)

(assert (=> b!800207 m!741589))

(declare-fun m!741591 () Bool)

(assert (=> b!800207 m!741591))

(declare-fun m!741593 () Bool)

(assert (=> b!800210 m!741593))

(assert (=> b!800206 m!741581))

(assert (=> b!800206 m!741581))

(declare-fun m!741595 () Bool)

(assert (=> b!800206 m!741595))

(declare-fun m!741597 () Bool)

(assert (=> b!800203 m!741597))

(declare-fun m!741599 () Bool)

(assert (=> b!800202 m!741599))

(declare-fun m!741601 () Bool)

(assert (=> b!800212 m!741601))

(assert (=> b!800212 m!741581))

(assert (=> b!800212 m!741581))

(declare-fun m!741603 () Bool)

(assert (=> b!800212 m!741603))

(assert (=> b!800212 m!741581))

(declare-fun m!741605 () Bool)

(assert (=> b!800212 m!741605))

(declare-fun m!741607 () Bool)

(assert (=> b!800214 m!741607))

(declare-fun m!741609 () Bool)

(assert (=> start!68834 m!741609))

(declare-fun m!741611 () Bool)

(assert (=> start!68834 m!741611))

(check-sat (not b!800205) (not b!800214) (not start!68834) (not b!800202) (not b!800206) (not b!800210) (not b!800211) (not b!800203) (not b!800207) (not b!800213) (not b!800212) (not b!800209))
(check-sat)
