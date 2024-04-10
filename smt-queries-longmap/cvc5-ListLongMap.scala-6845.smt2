; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86216 () Bool)

(assert start!86216)

(declare-fun b!998181 () Bool)

(declare-fun res!667978 () Bool)

(declare-fun e!562939 () Bool)

(assert (=> b!998181 (=> (not res!667978) (not e!562939))))

(declare-datatypes ((array!63119 0))(
  ( (array!63120 (arr!30388 (Array (_ BitVec 32) (_ BitVec 64))) (size!30890 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63119)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998181 (= res!667978 (and (= (size!30890 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30890 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30890 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998182 () Bool)

(declare-fun e!562938 () Bool)

(assert (=> b!998182 (= e!562939 e!562938)))

(declare-fun res!667979 () Bool)

(assert (=> b!998182 (=> (not res!667979) (not e!562938))))

(declare-datatypes ((SeekEntryResult!9320 0))(
  ( (MissingZero!9320 (index!39651 (_ BitVec 32))) (Found!9320 (index!39652 (_ BitVec 32))) (Intermediate!9320 (undefined!10132 Bool) (index!39653 (_ BitVec 32)) (x!87088 (_ BitVec 32))) (Undefined!9320) (MissingVacant!9320 (index!39654 (_ BitVec 32))) )
))
(declare-fun lt!441653 () SeekEntryResult!9320)

(assert (=> b!998182 (= res!667979 (or (= lt!441653 (MissingVacant!9320 i!1194)) (= lt!441653 (MissingZero!9320 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63119 (_ BitVec 32)) SeekEntryResult!9320)

(assert (=> b!998182 (= lt!441653 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998183 () Bool)

(declare-fun res!667986 () Bool)

(assert (=> b!998183 (=> (not res!667986) (not e!562939))))

(declare-fun arrayContainsKey!0 (array!63119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998183 (= res!667986 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998184 () Bool)

(declare-fun res!667981 () Bool)

(assert (=> b!998184 (=> (not res!667981) (not e!562938))))

(declare-datatypes ((List!21064 0))(
  ( (Nil!21061) (Cons!21060 (h!22231 (_ BitVec 64)) (t!30065 List!21064)) )
))
(declare-fun arrayNoDuplicates!0 (array!63119 (_ BitVec 32) List!21064) Bool)

(assert (=> b!998184 (= res!667981 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21061))))

(declare-fun b!998185 () Bool)

(declare-fun res!667980 () Bool)

(assert (=> b!998185 (=> (not res!667980) (not e!562938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63119 (_ BitVec 32)) Bool)

(assert (=> b!998185 (= res!667980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!667983 () Bool)

(assert (=> start!86216 (=> (not res!667983) (not e!562939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86216 (= res!667983 (validMask!0 mask!3464))))

(assert (=> start!86216 e!562939))

(declare-fun array_inv!23512 (array!63119) Bool)

(assert (=> start!86216 (array_inv!23512 a!3219)))

(assert (=> start!86216 true))

(declare-fun b!998186 () Bool)

(declare-fun res!667985 () Bool)

(assert (=> b!998186 (=> (not res!667985) (not e!562938))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998186 (= res!667985 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30890 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30890 a!3219))))))

(declare-fun b!998187 () Bool)

(assert (=> b!998187 (= e!562938 false)))

(declare-fun lt!441652 () SeekEntryResult!9320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63119 (_ BitVec 32)) SeekEntryResult!9320)

(assert (=> b!998187 (= lt!441652 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30388 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998188 () Bool)

(declare-fun res!667977 () Bool)

(assert (=> b!998188 (=> (not res!667977) (not e!562939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998188 (= res!667977 (validKeyInArray!0 (select (arr!30388 a!3219) j!170)))))

(declare-fun b!998189 () Bool)

(declare-fun res!667984 () Bool)

(assert (=> b!998189 (=> (not res!667984) (not e!562938))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998189 (= res!667984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30388 a!3219) j!170) mask!3464) (select (arr!30388 a!3219) j!170) a!3219 mask!3464) (Intermediate!9320 false resIndex!38 resX!38)))))

(declare-fun b!998190 () Bool)

(declare-fun res!667982 () Bool)

(assert (=> b!998190 (=> (not res!667982) (not e!562939))))

(assert (=> b!998190 (= res!667982 (validKeyInArray!0 k!2224))))

(assert (= (and start!86216 res!667983) b!998181))

(assert (= (and b!998181 res!667978) b!998188))

(assert (= (and b!998188 res!667977) b!998190))

(assert (= (and b!998190 res!667982) b!998183))

(assert (= (and b!998183 res!667986) b!998182))

(assert (= (and b!998182 res!667979) b!998185))

(assert (= (and b!998185 res!667980) b!998184))

(assert (= (and b!998184 res!667981) b!998186))

(assert (= (and b!998186 res!667985) b!998189))

(assert (= (and b!998189 res!667984) b!998187))

(declare-fun m!924773 () Bool)

(assert (=> b!998182 m!924773))

(declare-fun m!924775 () Bool)

(assert (=> b!998188 m!924775))

(assert (=> b!998188 m!924775))

(declare-fun m!924777 () Bool)

(assert (=> b!998188 m!924777))

(declare-fun m!924779 () Bool)

(assert (=> b!998183 m!924779))

(assert (=> b!998187 m!924775))

(assert (=> b!998187 m!924775))

(declare-fun m!924781 () Bool)

(assert (=> b!998187 m!924781))

(assert (=> b!998189 m!924775))

(assert (=> b!998189 m!924775))

(declare-fun m!924783 () Bool)

(assert (=> b!998189 m!924783))

(assert (=> b!998189 m!924783))

(assert (=> b!998189 m!924775))

(declare-fun m!924785 () Bool)

(assert (=> b!998189 m!924785))

(declare-fun m!924787 () Bool)

(assert (=> b!998184 m!924787))

(declare-fun m!924789 () Bool)

(assert (=> start!86216 m!924789))

(declare-fun m!924791 () Bool)

(assert (=> start!86216 m!924791))

(declare-fun m!924793 () Bool)

(assert (=> b!998185 m!924793))

(declare-fun m!924795 () Bool)

(assert (=> b!998190 m!924795))

(push 1)

(assert (not b!998185))

