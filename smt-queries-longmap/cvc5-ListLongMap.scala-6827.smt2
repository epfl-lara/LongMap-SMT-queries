; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85952 () Bool)

(assert start!85952)

(declare-fun b!995920 () Bool)

(declare-fun res!666127 () Bool)

(declare-fun e!561971 () Bool)

(assert (=> b!995920 (=> (not res!666127) (not e!561971))))

(declare-datatypes ((array!63002 0))(
  ( (array!63003 (arr!30334 (Array (_ BitVec 32) (_ BitVec 64))) (size!30836 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63002)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995920 (= res!666127 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!666126 () Bool)

(assert (=> start!85952 (=> (not res!666126) (not e!561971))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85952 (= res!666126 (validMask!0 mask!3464))))

(assert (=> start!85952 e!561971))

(declare-fun array_inv!23458 (array!63002) Bool)

(assert (=> start!85952 (array_inv!23458 a!3219)))

(assert (=> start!85952 true))

(declare-fun b!995921 () Bool)

(declare-fun res!666124 () Bool)

(assert (=> b!995921 (=> (not res!666124) (not e!561971))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995921 (= res!666124 (and (= (size!30836 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30836 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30836 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995922 () Bool)

(declare-fun res!666129 () Bool)

(declare-fun e!561973 () Bool)

(assert (=> b!995922 (=> (not res!666129) (not e!561973))))

(declare-datatypes ((List!21010 0))(
  ( (Nil!21007) (Cons!21006 (h!22168 (_ BitVec 64)) (t!30011 List!21010)) )
))
(declare-fun arrayNoDuplicates!0 (array!63002 (_ BitVec 32) List!21010) Bool)

(assert (=> b!995922 (= res!666129 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21007))))

(declare-fun b!995923 () Bool)

(declare-fun res!666121 () Bool)

(assert (=> b!995923 (=> (not res!666121) (not e!561973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63002 (_ BitVec 32)) Bool)

(assert (=> b!995923 (= res!666121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995924 () Bool)

(assert (=> b!995924 (= e!561973 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441082 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995924 (= lt!441082 (toIndex!0 (select (arr!30334 a!3219) j!170) mask!3464))))

(declare-fun b!995925 () Bool)

(declare-fun res!666123 () Bool)

(assert (=> b!995925 (=> (not res!666123) (not e!561971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995925 (= res!666123 (validKeyInArray!0 (select (arr!30334 a!3219) j!170)))))

(declare-fun b!995926 () Bool)

(declare-fun res!666122 () Bool)

(assert (=> b!995926 (=> (not res!666122) (not e!561973))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995926 (= res!666122 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30836 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30836 a!3219))))))

(declare-fun b!995927 () Bool)

(declare-fun res!666125 () Bool)

(assert (=> b!995927 (=> (not res!666125) (not e!561971))))

(assert (=> b!995927 (= res!666125 (validKeyInArray!0 k!2224))))

(declare-fun b!995928 () Bool)

(assert (=> b!995928 (= e!561971 e!561973)))

(declare-fun res!666128 () Bool)

(assert (=> b!995928 (=> (not res!666128) (not e!561973))))

(declare-datatypes ((SeekEntryResult!9266 0))(
  ( (MissingZero!9266 (index!39435 (_ BitVec 32))) (Found!9266 (index!39436 (_ BitVec 32))) (Intermediate!9266 (undefined!10078 Bool) (index!39437 (_ BitVec 32)) (x!86875 (_ BitVec 32))) (Undefined!9266) (MissingVacant!9266 (index!39438 (_ BitVec 32))) )
))
(declare-fun lt!441083 () SeekEntryResult!9266)

(assert (=> b!995928 (= res!666128 (or (= lt!441083 (MissingVacant!9266 i!1194)) (= lt!441083 (MissingZero!9266 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63002 (_ BitVec 32)) SeekEntryResult!9266)

(assert (=> b!995928 (= lt!441083 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85952 res!666126) b!995921))

(assert (= (and b!995921 res!666124) b!995925))

(assert (= (and b!995925 res!666123) b!995927))

(assert (= (and b!995927 res!666125) b!995920))

(assert (= (and b!995920 res!666127) b!995928))

(assert (= (and b!995928 res!666128) b!995923))

(assert (= (and b!995923 res!666121) b!995922))

(assert (= (and b!995922 res!666129) b!995926))

(assert (= (and b!995926 res!666122) b!995924))

(declare-fun m!923189 () Bool)

(assert (=> b!995925 m!923189))

(assert (=> b!995925 m!923189))

(declare-fun m!923191 () Bool)

(assert (=> b!995925 m!923191))

(declare-fun m!923193 () Bool)

(assert (=> b!995927 m!923193))

(declare-fun m!923195 () Bool)

(assert (=> b!995923 m!923195))

(declare-fun m!923197 () Bool)

(assert (=> b!995922 m!923197))

(declare-fun m!923199 () Bool)

(assert (=> b!995920 m!923199))

(declare-fun m!923201 () Bool)

(assert (=> start!85952 m!923201))

(declare-fun m!923203 () Bool)

(assert (=> start!85952 m!923203))

(assert (=> b!995924 m!923189))

(assert (=> b!995924 m!923189))

(declare-fun m!923205 () Bool)

(assert (=> b!995924 m!923205))

(declare-fun m!923207 () Bool)

(assert (=> b!995928 m!923207))

(push 1)

(assert (not b!995925))

(assert (not b!995923))

