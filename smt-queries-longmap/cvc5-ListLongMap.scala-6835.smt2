; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86048 () Bool)

(assert start!86048)

(declare-fun b!996732 () Bool)

(declare-fun res!666849 () Bool)

(declare-fun e!562297 () Bool)

(assert (=> b!996732 (=> (not res!666849) (not e!562297))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996732 (= res!666849 (validKeyInArray!0 k!2224))))

(declare-fun b!996733 () Bool)

(declare-fun res!666853 () Bool)

(declare-fun e!562296 () Bool)

(assert (=> b!996733 (=> (not res!666853) (not e!562296))))

(declare-datatypes ((array!63053 0))(
  ( (array!63054 (arr!30358 (Array (_ BitVec 32) (_ BitVec 64))) (size!30860 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63053)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9290 0))(
  ( (MissingZero!9290 (index!39531 (_ BitVec 32))) (Found!9290 (index!39532 (_ BitVec 32))) (Intermediate!9290 (undefined!10102 Bool) (index!39533 (_ BitVec 32)) (x!86966 (_ BitVec 32))) (Undefined!9290) (MissingVacant!9290 (index!39534 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63053 (_ BitVec 32)) SeekEntryResult!9290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996733 (= res!666853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30358 a!3219) j!170) mask!3464) (select (arr!30358 a!3219) j!170) a!3219 mask!3464) (Intermediate!9290 false resIndex!38 resX!38)))))

(declare-fun res!666846 () Bool)

(assert (=> start!86048 (=> (not res!666846) (not e!562297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86048 (= res!666846 (validMask!0 mask!3464))))

(assert (=> start!86048 e!562297))

(declare-fun array_inv!23482 (array!63053) Bool)

(assert (=> start!86048 (array_inv!23482 a!3219)))

(assert (=> start!86048 true))

(declare-fun b!996734 () Bool)

(declare-fun res!666854 () Bool)

(assert (=> b!996734 (=> (not res!666854) (not e!562296))))

(declare-datatypes ((List!21034 0))(
  ( (Nil!21031) (Cons!21030 (h!22195 (_ BitVec 64)) (t!30035 List!21034)) )
))
(declare-fun arrayNoDuplicates!0 (array!63053 (_ BitVec 32) List!21034) Bool)

(assert (=> b!996734 (= res!666854 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21031))))

(declare-fun b!996735 () Bool)

(assert (=> b!996735 (= e!562297 e!562296)))

(declare-fun res!666847 () Bool)

(assert (=> b!996735 (=> (not res!666847) (not e!562296))))

(declare-fun lt!441287 () SeekEntryResult!9290)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996735 (= res!666847 (or (= lt!441287 (MissingVacant!9290 i!1194)) (= lt!441287 (MissingZero!9290 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63053 (_ BitVec 32)) SeekEntryResult!9290)

(assert (=> b!996735 (= lt!441287 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996736 () Bool)

(declare-fun res!666850 () Bool)

(assert (=> b!996736 (=> (not res!666850) (not e!562297))))

(declare-fun arrayContainsKey!0 (array!63053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996736 (= res!666850 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996737 () Bool)

(declare-fun res!666848 () Bool)

(assert (=> b!996737 (=> (not res!666848) (not e!562297))))

(assert (=> b!996737 (= res!666848 (validKeyInArray!0 (select (arr!30358 a!3219) j!170)))))

(declare-fun b!996738 () Bool)

(declare-fun res!666852 () Bool)

(assert (=> b!996738 (=> (not res!666852) (not e!562296))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996738 (= res!666852 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30860 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30860 a!3219))))))

(declare-fun b!996739 () Bool)

(assert (=> b!996739 (= e!562296 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!996740 () Bool)

(declare-fun res!666855 () Bool)

(assert (=> b!996740 (=> (not res!666855) (not e!562296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63053 (_ BitVec 32)) Bool)

(assert (=> b!996740 (= res!666855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996741 () Bool)

(declare-fun res!666851 () Bool)

(assert (=> b!996741 (=> (not res!666851) (not e!562297))))

(assert (=> b!996741 (= res!666851 (and (= (size!30860 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30860 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30860 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86048 res!666846) b!996741))

(assert (= (and b!996741 res!666851) b!996737))

(assert (= (and b!996737 res!666848) b!996732))

(assert (= (and b!996732 res!666849) b!996736))

(assert (= (and b!996736 res!666850) b!996735))

(assert (= (and b!996735 res!666847) b!996740))

(assert (= (and b!996740 res!666855) b!996734))

(assert (= (and b!996734 res!666854) b!996738))

(assert (= (and b!996738 res!666852) b!996733))

(assert (= (and b!996733 res!666853) b!996739))

(declare-fun m!923783 () Bool)

(assert (=> start!86048 m!923783))

(declare-fun m!923785 () Bool)

(assert (=> start!86048 m!923785))

(declare-fun m!923787 () Bool)

(assert (=> b!996733 m!923787))

(assert (=> b!996733 m!923787))

(declare-fun m!923789 () Bool)

(assert (=> b!996733 m!923789))

(assert (=> b!996733 m!923789))

(assert (=> b!996733 m!923787))

(declare-fun m!923791 () Bool)

(assert (=> b!996733 m!923791))

(declare-fun m!923793 () Bool)

(assert (=> b!996732 m!923793))

(declare-fun m!923795 () Bool)

(assert (=> b!996735 m!923795))

(assert (=> b!996737 m!923787))

(assert (=> b!996737 m!923787))

(declare-fun m!923797 () Bool)

(assert (=> b!996737 m!923797))

(declare-fun m!923799 () Bool)

(assert (=> b!996736 m!923799))

(declare-fun m!923801 () Bool)

(assert (=> b!996740 m!923801))

(declare-fun m!923803 () Bool)

(assert (=> b!996734 m!923803))

(push 1)

(assert (not b!996734))

(assert (not start!86048))

(assert (not b!996737))

(assert (not b!996740))

(assert (not b!996733))

(assert (not b!996736))

(assert (not b!996735))

(assert (not b!996732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

