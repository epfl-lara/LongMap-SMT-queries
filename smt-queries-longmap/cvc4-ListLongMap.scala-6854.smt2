; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86382 () Bool)

(assert start!86382)

(declare-fun b!999662 () Bool)

(declare-fun res!669150 () Bool)

(declare-fun e!563624 () Bool)

(assert (=> b!999662 (=> (not res!669150) (not e!563624))))

(declare-datatypes ((array!63183 0))(
  ( (array!63184 (arr!30417 (Array (_ BitVec 32) (_ BitVec 64))) (size!30919 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63183)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9349 0))(
  ( (MissingZero!9349 (index!39767 (_ BitVec 32))) (Found!9349 (index!39768 (_ BitVec 32))) (Intermediate!9349 (undefined!10161 Bool) (index!39769 (_ BitVec 32)) (x!87201 (_ BitVec 32))) (Undefined!9349) (MissingVacant!9349 (index!39770 (_ BitVec 32))) )
))
(declare-fun lt!442087 () SeekEntryResult!9349)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63183 (_ BitVec 32)) SeekEntryResult!9349)

(assert (=> b!999662 (= res!669150 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30417 a!3219) j!170) a!3219 mask!3464) lt!442087))))

(declare-fun b!999663 () Bool)

(declare-fun res!669143 () Bool)

(declare-fun e!563623 () Bool)

(assert (=> b!999663 (=> (not res!669143) (not e!563623))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999663 (= res!669143 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999664 () Bool)

(assert (=> b!999664 (= e!563624 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!442086 () SeekEntryResult!9349)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999664 (= lt!442086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30417 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30417 a!3219) i!1194 k!2224) j!170) (array!63184 (store (arr!30417 a!3219) i!1194 k!2224) (size!30919 a!3219)) mask!3464))))

(declare-fun b!999665 () Bool)

(declare-fun e!563626 () Bool)

(assert (=> b!999665 (= e!563623 e!563626)))

(declare-fun res!669146 () Bool)

(assert (=> b!999665 (=> (not res!669146) (not e!563626))))

(declare-fun lt!442088 () SeekEntryResult!9349)

(assert (=> b!999665 (= res!669146 (or (= lt!442088 (MissingVacant!9349 i!1194)) (= lt!442088 (MissingZero!9349 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63183 (_ BitVec 32)) SeekEntryResult!9349)

(assert (=> b!999665 (= lt!442088 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!669147 () Bool)

(assert (=> start!86382 (=> (not res!669147) (not e!563623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86382 (= res!669147 (validMask!0 mask!3464))))

(assert (=> start!86382 e!563623))

(declare-fun array_inv!23541 (array!63183) Bool)

(assert (=> start!86382 (array_inv!23541 a!3219)))

(assert (=> start!86382 true))

(declare-fun b!999666 () Bool)

(declare-fun res!669149 () Bool)

(assert (=> b!999666 (=> (not res!669149) (not e!563626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63183 (_ BitVec 32)) Bool)

(assert (=> b!999666 (= res!669149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999667 () Bool)

(declare-fun res!669142 () Bool)

(assert (=> b!999667 (=> (not res!669142) (not e!563626))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999667 (= res!669142 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30919 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30919 a!3219))))))

(declare-fun b!999668 () Bool)

(declare-fun res!669148 () Bool)

(assert (=> b!999668 (=> (not res!669148) (not e!563623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999668 (= res!669148 (validKeyInArray!0 (select (arr!30417 a!3219) j!170)))))

(declare-fun b!999669 () Bool)

(declare-fun res!669144 () Bool)

(assert (=> b!999669 (=> (not res!669144) (not e!563623))))

(assert (=> b!999669 (= res!669144 (validKeyInArray!0 k!2224))))

(declare-fun b!999670 () Bool)

(assert (=> b!999670 (= e!563626 e!563624)))

(declare-fun res!669141 () Bool)

(assert (=> b!999670 (=> (not res!669141) (not e!563624))))

(assert (=> b!999670 (= res!669141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30417 a!3219) j!170) mask!3464) (select (arr!30417 a!3219) j!170) a!3219 mask!3464) lt!442087))))

(assert (=> b!999670 (= lt!442087 (Intermediate!9349 false resIndex!38 resX!38))))

(declare-fun b!999671 () Bool)

(declare-fun res!669145 () Bool)

(assert (=> b!999671 (=> (not res!669145) (not e!563626))))

(declare-datatypes ((List!21093 0))(
  ( (Nil!21090) (Cons!21089 (h!22266 (_ BitVec 64)) (t!30094 List!21093)) )
))
(declare-fun arrayNoDuplicates!0 (array!63183 (_ BitVec 32) List!21093) Bool)

(assert (=> b!999671 (= res!669145 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21090))))

(declare-fun b!999672 () Bool)

(declare-fun res!669140 () Bool)

(assert (=> b!999672 (=> (not res!669140) (not e!563623))))

(assert (=> b!999672 (= res!669140 (and (= (size!30919 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30919 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30919 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86382 res!669147) b!999672))

(assert (= (and b!999672 res!669140) b!999668))

(assert (= (and b!999668 res!669148) b!999669))

(assert (= (and b!999669 res!669144) b!999663))

(assert (= (and b!999663 res!669143) b!999665))

(assert (= (and b!999665 res!669146) b!999666))

(assert (= (and b!999666 res!669149) b!999671))

(assert (= (and b!999671 res!669145) b!999667))

(assert (= (and b!999667 res!669142) b!999670))

(assert (= (and b!999670 res!669141) b!999662))

(assert (= (and b!999662 res!669150) b!999664))

(declare-fun m!925887 () Bool)

(assert (=> b!999664 m!925887))

(declare-fun m!925889 () Bool)

(assert (=> b!999664 m!925889))

(assert (=> b!999664 m!925889))

(declare-fun m!925891 () Bool)

(assert (=> b!999664 m!925891))

(assert (=> b!999664 m!925891))

(assert (=> b!999664 m!925889))

(declare-fun m!925893 () Bool)

(assert (=> b!999664 m!925893))

(declare-fun m!925895 () Bool)

(assert (=> b!999668 m!925895))

(assert (=> b!999668 m!925895))

(declare-fun m!925897 () Bool)

(assert (=> b!999668 m!925897))

(declare-fun m!925899 () Bool)

(assert (=> b!999663 m!925899))

(declare-fun m!925901 () Bool)

(assert (=> b!999671 m!925901))

(declare-fun m!925903 () Bool)

(assert (=> start!86382 m!925903))

(declare-fun m!925905 () Bool)

(assert (=> start!86382 m!925905))

(declare-fun m!925907 () Bool)

(assert (=> b!999669 m!925907))

(declare-fun m!925909 () Bool)

(assert (=> b!999666 m!925909))

(assert (=> b!999662 m!925895))

(assert (=> b!999662 m!925895))

(declare-fun m!925911 () Bool)

(assert (=> b!999662 m!925911))

(assert (=> b!999670 m!925895))

(assert (=> b!999670 m!925895))

(declare-fun m!925913 () Bool)

(assert (=> b!999670 m!925913))

(assert (=> b!999670 m!925913))

(assert (=> b!999670 m!925895))

(declare-fun m!925915 () Bool)

(assert (=> b!999670 m!925915))

(declare-fun m!925917 () Bool)

(assert (=> b!999665 m!925917))

(push 1)

(assert (not b!999670))

(assert (not b!999662))

(assert (not b!999668))

(assert (not b!999665))

(assert (not b!999669))

(assert (not b!999663))

(assert (not b!999666))

(assert (not start!86382))

(assert (not b!999671))

(assert (not b!999664))

