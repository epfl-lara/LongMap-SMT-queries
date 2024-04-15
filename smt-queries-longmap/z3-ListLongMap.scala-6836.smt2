; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86046 () Bool)

(assert start!86046)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun e!562193 () Bool)

(declare-fun b!996604 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!996604 (= e!562193 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun res!666844 () Bool)

(declare-fun e!562192 () Bool)

(assert (=> start!86046 (=> (not res!666844) (not e!562192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86046 (= res!666844 (validMask!0 mask!3464))))

(assert (=> start!86046 e!562192))

(declare-datatypes ((array!62998 0))(
  ( (array!62999 (arr!30330 (Array (_ BitVec 32) (_ BitVec 64))) (size!30834 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62998)

(declare-fun array_inv!23473 (array!62998) Bool)

(assert (=> start!86046 (array_inv!23473 a!3219)))

(assert (=> start!86046 true))

(declare-fun b!996605 () Bool)

(declare-fun res!666843 () Bool)

(assert (=> b!996605 (=> (not res!666843) (not e!562193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62998 (_ BitVec 32)) Bool)

(assert (=> b!996605 (= res!666843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996606 () Bool)

(declare-fun res!666849 () Bool)

(assert (=> b!996606 (=> (not res!666849) (not e!562193))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9287 0))(
  ( (MissingZero!9287 (index!39519 (_ BitVec 32))) (Found!9287 (index!39520 (_ BitVec 32))) (Intermediate!9287 (undefined!10099 Bool) (index!39521 (_ BitVec 32)) (x!86966 (_ BitVec 32))) (Undefined!9287) (MissingVacant!9287 (index!39522 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62998 (_ BitVec 32)) SeekEntryResult!9287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996606 (= res!666849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30330 a!3219) j!170) mask!3464) (select (arr!30330 a!3219) j!170) a!3219 mask!3464) (Intermediate!9287 false resIndex!38 resX!38)))))

(declare-fun b!996607 () Bool)

(declare-fun res!666847 () Bool)

(assert (=> b!996607 (=> (not res!666847) (not e!562193))))

(assert (=> b!996607 (= res!666847 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30834 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30834 a!3219))))))

(declare-fun b!996608 () Bool)

(declare-fun res!666851 () Bool)

(assert (=> b!996608 (=> (not res!666851) (not e!562192))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996608 (= res!666851 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996609 () Bool)

(declare-fun res!666845 () Bool)

(assert (=> b!996609 (=> (not res!666845) (not e!562193))))

(declare-datatypes ((List!21072 0))(
  ( (Nil!21069) (Cons!21068 (h!22233 (_ BitVec 64)) (t!30064 List!21072)) )
))
(declare-fun arrayNoDuplicates!0 (array!62998 (_ BitVec 32) List!21072) Bool)

(assert (=> b!996609 (= res!666845 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21069))))

(declare-fun b!996610 () Bool)

(declare-fun res!666846 () Bool)

(assert (=> b!996610 (=> (not res!666846) (not e!562192))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996610 (= res!666846 (and (= (size!30834 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30834 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30834 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996611 () Bool)

(assert (=> b!996611 (= e!562192 e!562193)))

(declare-fun res!666848 () Bool)

(assert (=> b!996611 (=> (not res!666848) (not e!562193))))

(declare-fun lt!441064 () SeekEntryResult!9287)

(assert (=> b!996611 (= res!666848 (or (= lt!441064 (MissingVacant!9287 i!1194)) (= lt!441064 (MissingZero!9287 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62998 (_ BitVec 32)) SeekEntryResult!9287)

(assert (=> b!996611 (= lt!441064 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996612 () Bool)

(declare-fun res!666850 () Bool)

(assert (=> b!996612 (=> (not res!666850) (not e!562192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996612 (= res!666850 (validKeyInArray!0 (select (arr!30330 a!3219) j!170)))))

(declare-fun b!996613 () Bool)

(declare-fun res!666842 () Bool)

(assert (=> b!996613 (=> (not res!666842) (not e!562192))))

(assert (=> b!996613 (= res!666842 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86046 res!666844) b!996610))

(assert (= (and b!996610 res!666846) b!996612))

(assert (= (and b!996612 res!666850) b!996613))

(assert (= (and b!996613 res!666842) b!996608))

(assert (= (and b!996608 res!666851) b!996611))

(assert (= (and b!996611 res!666848) b!996605))

(assert (= (and b!996605 res!666843) b!996609))

(assert (= (and b!996609 res!666845) b!996607))

(assert (= (and b!996607 res!666847) b!996606))

(assert (= (and b!996606 res!666849) b!996604))

(declare-fun m!923119 () Bool)

(assert (=> b!996605 m!923119))

(declare-fun m!923121 () Bool)

(assert (=> b!996613 m!923121))

(declare-fun m!923123 () Bool)

(assert (=> b!996612 m!923123))

(assert (=> b!996612 m!923123))

(declare-fun m!923125 () Bool)

(assert (=> b!996612 m!923125))

(declare-fun m!923127 () Bool)

(assert (=> b!996611 m!923127))

(declare-fun m!923129 () Bool)

(assert (=> b!996608 m!923129))

(declare-fun m!923131 () Bool)

(assert (=> b!996609 m!923131))

(declare-fun m!923133 () Bool)

(assert (=> start!86046 m!923133))

(declare-fun m!923135 () Bool)

(assert (=> start!86046 m!923135))

(assert (=> b!996606 m!923123))

(assert (=> b!996606 m!923123))

(declare-fun m!923137 () Bool)

(assert (=> b!996606 m!923137))

(assert (=> b!996606 m!923137))

(assert (=> b!996606 m!923123))

(declare-fun m!923139 () Bool)

(assert (=> b!996606 m!923139))

(check-sat (not b!996612) (not b!996609) (not start!86046) (not b!996613) (not b!996605) (not b!996611) (not b!996608) (not b!996606))
(check-sat)
