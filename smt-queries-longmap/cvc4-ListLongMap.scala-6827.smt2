; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85956 () Bool)

(assert start!85956)

(declare-fun b!995974 () Bool)

(declare-fun res!666182 () Bool)

(declare-fun e!561991 () Bool)

(assert (=> b!995974 (=> (not res!666182) (not e!561991))))

(declare-datatypes ((array!63006 0))(
  ( (array!63007 (arr!30336 (Array (_ BitVec 32) (_ BitVec 64))) (size!30838 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63006)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995974 (= res!666182 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30838 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30838 a!3219))))))

(declare-fun b!995975 () Bool)

(declare-fun res!666177 () Bool)

(declare-fun e!561990 () Bool)

(assert (=> b!995975 (=> (not res!666177) (not e!561990))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995975 (= res!666177 (validKeyInArray!0 k!2224))))

(declare-fun b!995976 () Bool)

(assert (=> b!995976 (= e!561990 e!561991)))

(declare-fun res!666183 () Bool)

(assert (=> b!995976 (=> (not res!666183) (not e!561991))))

(declare-datatypes ((SeekEntryResult!9268 0))(
  ( (MissingZero!9268 (index!39443 (_ BitVec 32))) (Found!9268 (index!39444 (_ BitVec 32))) (Intermediate!9268 (undefined!10080 Bool) (index!39445 (_ BitVec 32)) (x!86877 (_ BitVec 32))) (Undefined!9268) (MissingVacant!9268 (index!39446 (_ BitVec 32))) )
))
(declare-fun lt!441094 () SeekEntryResult!9268)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995976 (= res!666183 (or (= lt!441094 (MissingVacant!9268 i!1194)) (= lt!441094 (MissingZero!9268 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63006 (_ BitVec 32)) SeekEntryResult!9268)

(assert (=> b!995976 (= lt!441094 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995977 () Bool)

(declare-fun res!666180 () Bool)

(assert (=> b!995977 (=> (not res!666180) (not e!561990))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995977 (= res!666180 (validKeyInArray!0 (select (arr!30336 a!3219) j!170)))))

(declare-fun b!995978 () Bool)

(declare-fun res!666176 () Bool)

(assert (=> b!995978 (=> (not res!666176) (not e!561990))))

(assert (=> b!995978 (= res!666176 (and (= (size!30838 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30838 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30838 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995979 () Bool)

(declare-fun res!666179 () Bool)

(assert (=> b!995979 (=> (not res!666179) (not e!561990))))

(declare-fun arrayContainsKey!0 (array!63006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995979 (= res!666179 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!666178 () Bool)

(assert (=> start!85956 (=> (not res!666178) (not e!561990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85956 (= res!666178 (validMask!0 mask!3464))))

(assert (=> start!85956 e!561990))

(declare-fun array_inv!23460 (array!63006) Bool)

(assert (=> start!85956 (array_inv!23460 a!3219)))

(assert (=> start!85956 true))

(declare-fun b!995980 () Bool)

(assert (=> b!995980 (= e!561991 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441095 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995980 (= lt!441095 (toIndex!0 (select (arr!30336 a!3219) j!170) mask!3464))))

(declare-fun b!995981 () Bool)

(declare-fun res!666175 () Bool)

(assert (=> b!995981 (=> (not res!666175) (not e!561991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63006 (_ BitVec 32)) Bool)

(assert (=> b!995981 (= res!666175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995982 () Bool)

(declare-fun res!666181 () Bool)

(assert (=> b!995982 (=> (not res!666181) (not e!561991))))

(declare-datatypes ((List!21012 0))(
  ( (Nil!21009) (Cons!21008 (h!22170 (_ BitVec 64)) (t!30013 List!21012)) )
))
(declare-fun arrayNoDuplicates!0 (array!63006 (_ BitVec 32) List!21012) Bool)

(assert (=> b!995982 (= res!666181 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21009))))

(assert (= (and start!85956 res!666178) b!995978))

(assert (= (and b!995978 res!666176) b!995977))

(assert (= (and b!995977 res!666180) b!995975))

(assert (= (and b!995975 res!666177) b!995979))

(assert (= (and b!995979 res!666179) b!995976))

(assert (= (and b!995976 res!666183) b!995981))

(assert (= (and b!995981 res!666175) b!995982))

(assert (= (and b!995982 res!666181) b!995974))

(assert (= (and b!995974 res!666182) b!995980))

(declare-fun m!923229 () Bool)

(assert (=> b!995976 m!923229))

(declare-fun m!923231 () Bool)

(assert (=> b!995981 m!923231))

(declare-fun m!923233 () Bool)

(assert (=> b!995979 m!923233))

(declare-fun m!923235 () Bool)

(assert (=> b!995982 m!923235))

(declare-fun m!923237 () Bool)

(assert (=> b!995975 m!923237))

(declare-fun m!923239 () Bool)

(assert (=> start!85956 m!923239))

(declare-fun m!923241 () Bool)

(assert (=> start!85956 m!923241))

(declare-fun m!923243 () Bool)

(assert (=> b!995977 m!923243))

(assert (=> b!995977 m!923243))

(declare-fun m!923245 () Bool)

(assert (=> b!995977 m!923245))

(assert (=> b!995980 m!923243))

(assert (=> b!995980 m!923243))

(declare-fun m!923247 () Bool)

(assert (=> b!995980 m!923247))

(push 1)

(assert (not start!85956))

(assert (not b!995976))

(assert (not b!995982))

(assert (not b!995977))

(assert (not b!995981))

(assert (not b!995980))

(assert (not b!995979))

(assert (not b!995975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

