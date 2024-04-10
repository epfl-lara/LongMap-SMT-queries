; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86214 () Bool)

(assert start!86214)

(declare-fun b!998151 () Bool)

(declare-fun e!562929 () Bool)

(assert (=> b!998151 (= e!562929 false)))

(declare-datatypes ((array!63117 0))(
  ( (array!63118 (arr!30387 (Array (_ BitVec 32) (_ BitVec 64))) (size!30889 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63117)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9319 0))(
  ( (MissingZero!9319 (index!39647 (_ BitVec 32))) (Found!9319 (index!39648 (_ BitVec 32))) (Intermediate!9319 (undefined!10131 Bool) (index!39649 (_ BitVec 32)) (x!87079 (_ BitVec 32))) (Undefined!9319) (MissingVacant!9319 (index!39650 (_ BitVec 32))) )
))
(declare-fun lt!441647 () SeekEntryResult!9319)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63117 (_ BitVec 32)) SeekEntryResult!9319)

(assert (=> b!998151 (= lt!441647 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30387 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998152 () Bool)

(declare-fun res!667954 () Bool)

(assert (=> b!998152 (=> (not res!667954) (not e!562929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63117 (_ BitVec 32)) Bool)

(assert (=> b!998152 (= res!667954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998153 () Bool)

(declare-fun res!667952 () Bool)

(assert (=> b!998153 (=> (not res!667952) (not e!562929))))

(declare-datatypes ((List!21063 0))(
  ( (Nil!21060) (Cons!21059 (h!22230 (_ BitVec 64)) (t!30064 List!21063)) )
))
(declare-fun arrayNoDuplicates!0 (array!63117 (_ BitVec 32) List!21063) Bool)

(assert (=> b!998153 (= res!667952 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21060))))

(declare-fun res!667953 () Bool)

(declare-fun e!562930 () Bool)

(assert (=> start!86214 (=> (not res!667953) (not e!562930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86214 (= res!667953 (validMask!0 mask!3464))))

(assert (=> start!86214 e!562930))

(declare-fun array_inv!23511 (array!63117) Bool)

(assert (=> start!86214 (array_inv!23511 a!3219)))

(assert (=> start!86214 true))

(declare-fun b!998154 () Bool)

(declare-fun res!667950 () Bool)

(assert (=> b!998154 (=> (not res!667950) (not e!562930))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998154 (= res!667950 (validKeyInArray!0 k!2224))))

(declare-fun b!998155 () Bool)

(declare-fun res!667947 () Bool)

(assert (=> b!998155 (=> (not res!667947) (not e!562929))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998155 (= res!667947 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30889 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30889 a!3219))))))

(declare-fun b!998156 () Bool)

(declare-fun res!667948 () Bool)

(assert (=> b!998156 (=> (not res!667948) (not e!562930))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998156 (= res!667948 (and (= (size!30889 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30889 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30889 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998157 () Bool)

(assert (=> b!998157 (= e!562930 e!562929)))

(declare-fun res!667949 () Bool)

(assert (=> b!998157 (=> (not res!667949) (not e!562929))))

(declare-fun lt!441646 () SeekEntryResult!9319)

(assert (=> b!998157 (= res!667949 (or (= lt!441646 (MissingVacant!9319 i!1194)) (= lt!441646 (MissingZero!9319 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63117 (_ BitVec 32)) SeekEntryResult!9319)

(assert (=> b!998157 (= lt!441646 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998158 () Bool)

(declare-fun res!667956 () Bool)

(assert (=> b!998158 (=> (not res!667956) (not e!562929))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998158 (= res!667956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30387 a!3219) j!170) mask!3464) (select (arr!30387 a!3219) j!170) a!3219 mask!3464) (Intermediate!9319 false resIndex!38 resX!38)))))

(declare-fun b!998159 () Bool)

(declare-fun res!667951 () Bool)

(assert (=> b!998159 (=> (not res!667951) (not e!562930))))

(declare-fun arrayContainsKey!0 (array!63117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998159 (= res!667951 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998160 () Bool)

(declare-fun res!667955 () Bool)

(assert (=> b!998160 (=> (not res!667955) (not e!562930))))

(assert (=> b!998160 (= res!667955 (validKeyInArray!0 (select (arr!30387 a!3219) j!170)))))

(assert (= (and start!86214 res!667953) b!998156))

(assert (= (and b!998156 res!667948) b!998160))

(assert (= (and b!998160 res!667955) b!998154))

(assert (= (and b!998154 res!667950) b!998159))

(assert (= (and b!998159 res!667951) b!998157))

(assert (= (and b!998157 res!667949) b!998152))

(assert (= (and b!998152 res!667954) b!998153))

(assert (= (and b!998153 res!667952) b!998155))

(assert (= (and b!998155 res!667947) b!998158))

(assert (= (and b!998158 res!667956) b!998151))

(declare-fun m!924749 () Bool)

(assert (=> b!998152 m!924749))

(declare-fun m!924751 () Bool)

(assert (=> b!998160 m!924751))

(assert (=> b!998160 m!924751))

(declare-fun m!924753 () Bool)

(assert (=> b!998160 m!924753))

(declare-fun m!924755 () Bool)

(assert (=> b!998154 m!924755))

(declare-fun m!924757 () Bool)

(assert (=> b!998153 m!924757))

(assert (=> b!998158 m!924751))

(assert (=> b!998158 m!924751))

(declare-fun m!924759 () Bool)

(assert (=> b!998158 m!924759))

(assert (=> b!998158 m!924759))

(assert (=> b!998158 m!924751))

(declare-fun m!924761 () Bool)

(assert (=> b!998158 m!924761))

(declare-fun m!924763 () Bool)

(assert (=> start!86214 m!924763))

(declare-fun m!924765 () Bool)

(assert (=> start!86214 m!924765))

(assert (=> b!998151 m!924751))

(assert (=> b!998151 m!924751))

(declare-fun m!924767 () Bool)

(assert (=> b!998151 m!924767))

(declare-fun m!924769 () Bool)

(assert (=> b!998159 m!924769))

(declare-fun m!924771 () Bool)

(assert (=> b!998157 m!924771))

(push 1)

(assert (not b!998152))

(assert (not b!998157))

(assert (not b!998160))

(assert (not b!998154))

(assert (not start!86214))

(assert (not b!998153))

(assert (not b!998159))

