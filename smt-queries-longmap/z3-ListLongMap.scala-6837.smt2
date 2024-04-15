; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86052 () Bool)

(assert start!86052)

(declare-fun b!996692 () Bool)

(declare-fun res!666937 () Bool)

(declare-fun e!562218 () Bool)

(assert (=> b!996692 (=> (not res!666937) (not e!562218))))

(declare-datatypes ((array!63004 0))(
  ( (array!63005 (arr!30333 (Array (_ BitVec 32) (_ BitVec 64))) (size!30837 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63004)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63004 (_ BitVec 32)) Bool)

(assert (=> b!996692 (= res!666937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996693 () Bool)

(assert (=> b!996693 (= e!562218 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9290 0))(
  ( (MissingZero!9290 (index!39531 (_ BitVec 32))) (Found!9290 (index!39532 (_ BitVec 32))) (Intermediate!9290 (undefined!10102 Bool) (index!39533 (_ BitVec 32)) (x!86977 (_ BitVec 32))) (Undefined!9290) (MissingVacant!9290 (index!39534 (_ BitVec 32))) )
))
(declare-fun lt!441076 () SeekEntryResult!9290)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63004 (_ BitVec 32)) SeekEntryResult!9290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996693 (= lt!441076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30333 a!3219) j!170) mask!3464) (select (arr!30333 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996694 () Bool)

(declare-fun e!562220 () Bool)

(assert (=> b!996694 (= e!562220 e!562218)))

(declare-fun res!666933 () Bool)

(assert (=> b!996694 (=> (not res!666933) (not e!562218))))

(declare-fun lt!441075 () SeekEntryResult!9290)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996694 (= res!666933 (or (= lt!441075 (MissingVacant!9290 i!1194)) (= lt!441075 (MissingZero!9290 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63004 (_ BitVec 32)) SeekEntryResult!9290)

(assert (=> b!996694 (= lt!441075 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996696 () Bool)

(declare-fun res!666935 () Bool)

(assert (=> b!996696 (=> (not res!666935) (not e!562218))))

(declare-datatypes ((List!21075 0))(
  ( (Nil!21072) (Cons!21071 (h!22236 (_ BitVec 64)) (t!30067 List!21075)) )
))
(declare-fun arrayNoDuplicates!0 (array!63004 (_ BitVec 32) List!21075) Bool)

(assert (=> b!996696 (= res!666935 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21072))))

(declare-fun b!996697 () Bool)

(declare-fun res!666930 () Bool)

(assert (=> b!996697 (=> (not res!666930) (not e!562218))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996697 (= res!666930 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30837 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30837 a!3219))))))

(declare-fun b!996698 () Bool)

(declare-fun res!666936 () Bool)

(assert (=> b!996698 (=> (not res!666936) (not e!562220))))

(assert (=> b!996698 (= res!666936 (and (= (size!30837 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30837 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30837 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996699 () Bool)

(declare-fun res!666932 () Bool)

(assert (=> b!996699 (=> (not res!666932) (not e!562220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996699 (= res!666932 (validKeyInArray!0 k0!2224))))

(declare-fun b!996700 () Bool)

(declare-fun res!666931 () Bool)

(assert (=> b!996700 (=> (not res!666931) (not e!562220))))

(assert (=> b!996700 (= res!666931 (validKeyInArray!0 (select (arr!30333 a!3219) j!170)))))

(declare-fun res!666938 () Bool)

(assert (=> start!86052 (=> (not res!666938) (not e!562220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86052 (= res!666938 (validMask!0 mask!3464))))

(assert (=> start!86052 e!562220))

(declare-fun array_inv!23476 (array!63004) Bool)

(assert (=> start!86052 (array_inv!23476 a!3219)))

(assert (=> start!86052 true))

(declare-fun b!996695 () Bool)

(declare-fun res!666934 () Bool)

(assert (=> b!996695 (=> (not res!666934) (not e!562220))))

(declare-fun arrayContainsKey!0 (array!63004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996695 (= res!666934 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86052 res!666938) b!996698))

(assert (= (and b!996698 res!666936) b!996700))

(assert (= (and b!996700 res!666931) b!996699))

(assert (= (and b!996699 res!666932) b!996695))

(assert (= (and b!996695 res!666934) b!996694))

(assert (= (and b!996694 res!666933) b!996692))

(assert (= (and b!996692 res!666937) b!996696))

(assert (= (and b!996696 res!666935) b!996697))

(assert (= (and b!996697 res!666930) b!996693))

(declare-fun m!923185 () Bool)

(assert (=> b!996700 m!923185))

(assert (=> b!996700 m!923185))

(declare-fun m!923187 () Bool)

(assert (=> b!996700 m!923187))

(declare-fun m!923189 () Bool)

(assert (=> b!996694 m!923189))

(declare-fun m!923191 () Bool)

(assert (=> b!996696 m!923191))

(declare-fun m!923193 () Bool)

(assert (=> start!86052 m!923193))

(declare-fun m!923195 () Bool)

(assert (=> start!86052 m!923195))

(declare-fun m!923197 () Bool)

(assert (=> b!996695 m!923197))

(assert (=> b!996693 m!923185))

(assert (=> b!996693 m!923185))

(declare-fun m!923199 () Bool)

(assert (=> b!996693 m!923199))

(assert (=> b!996693 m!923199))

(assert (=> b!996693 m!923185))

(declare-fun m!923201 () Bool)

(assert (=> b!996693 m!923201))

(declare-fun m!923203 () Bool)

(assert (=> b!996692 m!923203))

(declare-fun m!923205 () Bool)

(assert (=> b!996699 m!923205))

(check-sat (not b!996695) (not b!996700) (not b!996692) (not b!996696) (not b!996699) (not start!86052) (not b!996693) (not b!996694))
(check-sat)
