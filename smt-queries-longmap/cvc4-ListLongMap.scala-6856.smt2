; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86394 () Bool)

(assert start!86394)

(declare-fun b!999869 () Bool)

(declare-fun res!669347 () Bool)

(declare-fun e!563697 () Bool)

(assert (=> b!999869 (=> (not res!669347) (not e!563697))))

(declare-datatypes ((array!63195 0))(
  ( (array!63196 (arr!30423 (Array (_ BitVec 32) (_ BitVec 64))) (size!30925 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63195)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999869 (= res!669347 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999870 () Bool)

(declare-fun res!669348 () Bool)

(assert (=> b!999870 (=> (not res!669348) (not e!563697))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999870 (= res!669348 (validKeyInArray!0 (select (arr!30423 a!3219) j!170)))))

(declare-fun b!999871 () Bool)

(declare-fun res!669349 () Bool)

(assert (=> b!999871 (=> (not res!669349) (not e!563697))))

(assert (=> b!999871 (= res!669349 (validKeyInArray!0 k!2224))))

(declare-fun b!999872 () Bool)

(declare-fun res!669351 () Bool)

(declare-fun e!563698 () Bool)

(assert (=> b!999872 (=> (not res!669351) (not e!563698))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63195 (_ BitVec 32)) Bool)

(assert (=> b!999872 (= res!669351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999873 () Bool)

(declare-fun e!563696 () Bool)

(assert (=> b!999873 (= e!563698 e!563696)))

(declare-fun res!669357 () Bool)

(assert (=> b!999873 (=> (not res!669357) (not e!563696))))

(declare-datatypes ((SeekEntryResult!9355 0))(
  ( (MissingZero!9355 (index!39791 (_ BitVec 32))) (Found!9355 (index!39792 (_ BitVec 32))) (Intermediate!9355 (undefined!10167 Bool) (index!39793 (_ BitVec 32)) (x!87223 (_ BitVec 32))) (Undefined!9355) (MissingVacant!9355 (index!39794 (_ BitVec 32))) )
))
(declare-fun lt!442140 () SeekEntryResult!9355)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63195 (_ BitVec 32)) SeekEntryResult!9355)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999873 (= res!669357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30423 a!3219) j!170) mask!3464) (select (arr!30423 a!3219) j!170) a!3219 mask!3464) lt!442140))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999873 (= lt!442140 (Intermediate!9355 false resIndex!38 resX!38))))

(declare-fun b!999874 () Bool)

(declare-fun res!669350 () Bool)

(assert (=> b!999874 (=> (not res!669350) (not e!563696))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999874 (= res!669350 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30423 a!3219) j!170) a!3219 mask!3464) lt!442140))))

(declare-fun b!999875 () Bool)

(assert (=> b!999875 (= e!563696 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!442142 () SeekEntryResult!9355)

(assert (=> b!999875 (= lt!442142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30423 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30423 a!3219) i!1194 k!2224) j!170) (array!63196 (store (arr!30423 a!3219) i!1194 k!2224) (size!30925 a!3219)) mask!3464))))

(declare-fun b!999876 () Bool)

(declare-fun res!669352 () Bool)

(assert (=> b!999876 (=> (not res!669352) (not e!563697))))

(assert (=> b!999876 (= res!669352 (and (= (size!30925 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30925 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30925 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999877 () Bool)

(declare-fun res!669356 () Bool)

(assert (=> b!999877 (=> (not res!669356) (not e!563698))))

(assert (=> b!999877 (= res!669356 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30925 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30925 a!3219))))))

(declare-fun res!669355 () Bool)

(assert (=> start!86394 (=> (not res!669355) (not e!563697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86394 (= res!669355 (validMask!0 mask!3464))))

(assert (=> start!86394 e!563697))

(declare-fun array_inv!23547 (array!63195) Bool)

(assert (=> start!86394 (array_inv!23547 a!3219)))

(assert (=> start!86394 true))

(declare-fun b!999878 () Bool)

(assert (=> b!999878 (= e!563697 e!563698)))

(declare-fun res!669354 () Bool)

(assert (=> b!999878 (=> (not res!669354) (not e!563698))))

(declare-fun lt!442141 () SeekEntryResult!9355)

(assert (=> b!999878 (= res!669354 (or (= lt!442141 (MissingVacant!9355 i!1194)) (= lt!442141 (MissingZero!9355 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63195 (_ BitVec 32)) SeekEntryResult!9355)

(assert (=> b!999878 (= lt!442141 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999879 () Bool)

(declare-fun res!669353 () Bool)

(assert (=> b!999879 (=> (not res!669353) (not e!563698))))

(declare-datatypes ((List!21099 0))(
  ( (Nil!21096) (Cons!21095 (h!22272 (_ BitVec 64)) (t!30100 List!21099)) )
))
(declare-fun arrayNoDuplicates!0 (array!63195 (_ BitVec 32) List!21099) Bool)

(assert (=> b!999879 (= res!669353 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21096))))

(assert (= (and start!86394 res!669355) b!999876))

(assert (= (and b!999876 res!669352) b!999870))

(assert (= (and b!999870 res!669348) b!999871))

(assert (= (and b!999871 res!669349) b!999869))

(assert (= (and b!999869 res!669347) b!999878))

(assert (= (and b!999878 res!669354) b!999872))

(assert (= (and b!999872 res!669351) b!999879))

(assert (= (and b!999879 res!669353) b!999877))

(assert (= (and b!999877 res!669356) b!999873))

(assert (= (and b!999873 res!669357) b!999874))

(assert (= (and b!999874 res!669350) b!999875))

(declare-fun m!926079 () Bool)

(assert (=> b!999872 m!926079))

(declare-fun m!926081 () Bool)

(assert (=> b!999873 m!926081))

(assert (=> b!999873 m!926081))

(declare-fun m!926083 () Bool)

(assert (=> b!999873 m!926083))

(assert (=> b!999873 m!926083))

(assert (=> b!999873 m!926081))

(declare-fun m!926085 () Bool)

(assert (=> b!999873 m!926085))

(assert (=> b!999874 m!926081))

(assert (=> b!999874 m!926081))

(declare-fun m!926087 () Bool)

(assert (=> b!999874 m!926087))

(declare-fun m!926089 () Bool)

(assert (=> b!999879 m!926089))

(assert (=> b!999870 m!926081))

(assert (=> b!999870 m!926081))

(declare-fun m!926091 () Bool)

(assert (=> b!999870 m!926091))

(declare-fun m!926093 () Bool)

(assert (=> b!999871 m!926093))

(declare-fun m!926095 () Bool)

(assert (=> b!999869 m!926095))

(declare-fun m!926097 () Bool)

(assert (=> start!86394 m!926097))

(declare-fun m!926099 () Bool)

(assert (=> start!86394 m!926099))

(declare-fun m!926101 () Bool)

(assert (=> b!999875 m!926101))

(declare-fun m!926103 () Bool)

(assert (=> b!999875 m!926103))

(assert (=> b!999875 m!926103))

(declare-fun m!926105 () Bool)

(assert (=> b!999875 m!926105))

(assert (=> b!999875 m!926105))

(assert (=> b!999875 m!926103))

(declare-fun m!926107 () Bool)

(assert (=> b!999875 m!926107))

(declare-fun m!926109 () Bool)

(assert (=> b!999878 m!926109))

(push 1)

(assert (not b!999870))

(assert (not b!999879))

(assert (not b!999872))

(assert (not b!999875))

(assert (not b!999869))

(assert (not b!999871))

(assert (not b!999873))

(assert (not start!86394))

(assert (not b!999874))

(assert (not b!999878))

(check-sat)

(pop 1)

