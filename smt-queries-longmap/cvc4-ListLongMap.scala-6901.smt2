; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86772 () Bool)

(assert start!86772)

(declare-fun res!675079 () Bool)

(declare-fun e!566333 () Bool)

(assert (=> start!86772 (=> (not res!675079) (not e!566333))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86772 (= res!675079 (validMask!0 mask!3464))))

(assert (=> start!86772 e!566333))

(declare-datatypes ((array!63471 0))(
  ( (array!63472 (arr!30558 (Array (_ BitVec 32) (_ BitVec 64))) (size!31060 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63471)

(declare-fun array_inv!23682 (array!63471) Bool)

(assert (=> start!86772 (array_inv!23682 a!3219)))

(assert (=> start!86772 true))

(declare-fun b!1005990 () Bool)

(declare-fun res!675083 () Bool)

(assert (=> b!1005990 (=> (not res!675083) (not e!566333))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005990 (= res!675083 (validKeyInArray!0 k!2224))))

(declare-fun b!1005991 () Bool)

(declare-fun e!566334 () Bool)

(assert (=> b!1005991 (= e!566334 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9490 0))(
  ( (MissingZero!9490 (index!40331 (_ BitVec 32))) (Found!9490 (index!40332 (_ BitVec 32))) (Intermediate!9490 (undefined!10302 Bool) (index!40333 (_ BitVec 32)) (x!87730 (_ BitVec 32))) (Undefined!9490) (MissingVacant!9490 (index!40334 (_ BitVec 32))) )
))
(declare-fun lt!444665 () SeekEntryResult!9490)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63471 (_ BitVec 32)) SeekEntryResult!9490)

(assert (=> b!1005991 (= lt!444665 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30558 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005992 () Bool)

(assert (=> b!1005992 (= e!566333 e!566334)))

(declare-fun res!675078 () Bool)

(assert (=> b!1005992 (=> (not res!675078) (not e!566334))))

(declare-fun lt!444664 () SeekEntryResult!9490)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005992 (= res!675078 (or (= lt!444664 (MissingVacant!9490 i!1194)) (= lt!444664 (MissingZero!9490 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63471 (_ BitVec 32)) SeekEntryResult!9490)

(assert (=> b!1005992 (= lt!444664 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005993 () Bool)

(declare-fun res!675080 () Bool)

(assert (=> b!1005993 (=> (not res!675080) (not e!566334))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005993 (= res!675080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30558 a!3219) j!170) mask!3464) (select (arr!30558 a!3219) j!170) a!3219 mask!3464) (Intermediate!9490 false resIndex!38 resX!38)))))

(declare-fun b!1005994 () Bool)

(declare-fun res!675084 () Bool)

(assert (=> b!1005994 (=> (not res!675084) (not e!566334))))

(assert (=> b!1005994 (= res!675084 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31060 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31060 a!3219))))))

(declare-fun b!1005995 () Bool)

(declare-fun res!675086 () Bool)

(assert (=> b!1005995 (=> (not res!675086) (not e!566333))))

(assert (=> b!1005995 (= res!675086 (and (= (size!31060 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31060 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31060 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005996 () Bool)

(declare-fun res!675081 () Bool)

(assert (=> b!1005996 (=> (not res!675081) (not e!566334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63471 (_ BitVec 32)) Bool)

(assert (=> b!1005996 (= res!675081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005997 () Bool)

(declare-fun res!675082 () Bool)

(assert (=> b!1005997 (=> (not res!675082) (not e!566334))))

(declare-datatypes ((List!21234 0))(
  ( (Nil!21231) (Cons!21230 (h!22413 (_ BitVec 64)) (t!30235 List!21234)) )
))
(declare-fun arrayNoDuplicates!0 (array!63471 (_ BitVec 32) List!21234) Bool)

(assert (=> b!1005997 (= res!675082 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21231))))

(declare-fun b!1005998 () Bool)

(declare-fun res!675085 () Bool)

(assert (=> b!1005998 (=> (not res!675085) (not e!566333))))

(assert (=> b!1005998 (= res!675085 (validKeyInArray!0 (select (arr!30558 a!3219) j!170)))))

(declare-fun b!1005999 () Bool)

(declare-fun res!675087 () Bool)

(assert (=> b!1005999 (=> (not res!675087) (not e!566333))))

(declare-fun arrayContainsKey!0 (array!63471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005999 (= res!675087 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86772 res!675079) b!1005995))

(assert (= (and b!1005995 res!675086) b!1005998))

(assert (= (and b!1005998 res!675085) b!1005990))

(assert (= (and b!1005990 res!675083) b!1005999))

(assert (= (and b!1005999 res!675087) b!1005992))

(assert (= (and b!1005992 res!675078) b!1005996))

(assert (= (and b!1005996 res!675081) b!1005997))

(assert (= (and b!1005997 res!675082) b!1005994))

(assert (= (and b!1005994 res!675084) b!1005993))

(assert (= (and b!1005993 res!675080) b!1005991))

(declare-fun m!931121 () Bool)

(assert (=> b!1005996 m!931121))

(declare-fun m!931123 () Bool)

(assert (=> b!1005997 m!931123))

(declare-fun m!931125 () Bool)

(assert (=> b!1005991 m!931125))

(assert (=> b!1005991 m!931125))

(declare-fun m!931127 () Bool)

(assert (=> b!1005991 m!931127))

(declare-fun m!931129 () Bool)

(assert (=> start!86772 m!931129))

(declare-fun m!931131 () Bool)

(assert (=> start!86772 m!931131))

(declare-fun m!931133 () Bool)

(assert (=> b!1005992 m!931133))

(assert (=> b!1005998 m!931125))

(assert (=> b!1005998 m!931125))

(declare-fun m!931135 () Bool)

(assert (=> b!1005998 m!931135))

(declare-fun m!931137 () Bool)

(assert (=> b!1005999 m!931137))

(declare-fun m!931139 () Bool)

(assert (=> b!1005990 m!931139))

(assert (=> b!1005993 m!931125))

(assert (=> b!1005993 m!931125))

(declare-fun m!931141 () Bool)

(assert (=> b!1005993 m!931141))

(assert (=> b!1005993 m!931141))

(assert (=> b!1005993 m!931125))

(declare-fun m!931143 () Bool)

(assert (=> b!1005993 m!931143))

(push 1)

(assert (not b!1005998))

(assert (not b!1005996))

(assert (not start!86772))

(assert (not b!1005993))

(assert (not b!1005990))

(assert (not b!1005991))

