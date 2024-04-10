; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86210 () Bool)

(assert start!86210)

(declare-fun b!998091 () Bool)

(declare-fun res!667890 () Bool)

(declare-fun e!562911 () Bool)

(assert (=> b!998091 (=> (not res!667890) (not e!562911))))

(declare-datatypes ((array!63113 0))(
  ( (array!63114 (arr!30385 (Array (_ BitVec 32) (_ BitVec 64))) (size!30887 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63113)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9317 0))(
  ( (MissingZero!9317 (index!39639 (_ BitVec 32))) (Found!9317 (index!39640 (_ BitVec 32))) (Intermediate!9317 (undefined!10129 Bool) (index!39641 (_ BitVec 32)) (x!87077 (_ BitVec 32))) (Undefined!9317) (MissingVacant!9317 (index!39642 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63113 (_ BitVec 32)) SeekEntryResult!9317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998091 (= res!667890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30385 a!3219) j!170) mask!3464) (select (arr!30385 a!3219) j!170) a!3219 mask!3464) (Intermediate!9317 false resIndex!38 resX!38)))))

(declare-fun b!998092 () Bool)

(declare-fun res!667896 () Bool)

(assert (=> b!998092 (=> (not res!667896) (not e!562911))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!998092 (= res!667896 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30887 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30887 a!3219))))))

(declare-fun b!998093 () Bool)

(declare-fun res!667891 () Bool)

(declare-fun e!562912 () Bool)

(assert (=> b!998093 (=> (not res!667891) (not e!562912))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998093 (= res!667891 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998094 () Bool)

(declare-fun res!667887 () Bool)

(assert (=> b!998094 (=> (not res!667887) (not e!562912))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998094 (= res!667887 (and (= (size!30887 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30887 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30887 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998095 () Bool)

(declare-fun res!667892 () Bool)

(assert (=> b!998095 (=> (not res!667892) (not e!562912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998095 (= res!667892 (validKeyInArray!0 (select (arr!30385 a!3219) j!170)))))

(declare-fun b!998096 () Bool)

(declare-fun res!667889 () Bool)

(assert (=> b!998096 (=> (not res!667889) (not e!562912))))

(assert (=> b!998096 (= res!667889 (validKeyInArray!0 k!2224))))

(declare-fun res!667895 () Bool)

(assert (=> start!86210 (=> (not res!667895) (not e!562912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86210 (= res!667895 (validMask!0 mask!3464))))

(assert (=> start!86210 e!562912))

(declare-fun array_inv!23509 (array!63113) Bool)

(assert (=> start!86210 (array_inv!23509 a!3219)))

(assert (=> start!86210 true))

(declare-fun b!998097 () Bool)

(declare-fun res!667894 () Bool)

(assert (=> b!998097 (=> (not res!667894) (not e!562911))))

(declare-datatypes ((List!21061 0))(
  ( (Nil!21058) (Cons!21057 (h!22228 (_ BitVec 64)) (t!30062 List!21061)) )
))
(declare-fun arrayNoDuplicates!0 (array!63113 (_ BitVec 32) List!21061) Bool)

(assert (=> b!998097 (= res!667894 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21058))))

(declare-fun b!998098 () Bool)

(assert (=> b!998098 (= e!562912 e!562911)))

(declare-fun res!667893 () Bool)

(assert (=> b!998098 (=> (not res!667893) (not e!562911))))

(declare-fun lt!441634 () SeekEntryResult!9317)

(assert (=> b!998098 (= res!667893 (or (= lt!441634 (MissingVacant!9317 i!1194)) (= lt!441634 (MissingZero!9317 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63113 (_ BitVec 32)) SeekEntryResult!9317)

(assert (=> b!998098 (= lt!441634 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998099 () Bool)

(declare-fun res!667888 () Bool)

(assert (=> b!998099 (=> (not res!667888) (not e!562911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63113 (_ BitVec 32)) Bool)

(assert (=> b!998099 (= res!667888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998100 () Bool)

(assert (=> b!998100 (= e!562911 false)))

(declare-fun lt!441635 () SeekEntryResult!9317)

(assert (=> b!998100 (= lt!441635 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30385 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86210 res!667895) b!998094))

(assert (= (and b!998094 res!667887) b!998095))

(assert (= (and b!998095 res!667892) b!998096))

(assert (= (and b!998096 res!667889) b!998093))

(assert (= (and b!998093 res!667891) b!998098))

(assert (= (and b!998098 res!667893) b!998099))

(assert (= (and b!998099 res!667888) b!998097))

(assert (= (and b!998097 res!667894) b!998092))

(assert (= (and b!998092 res!667896) b!998091))

(assert (= (and b!998091 res!667890) b!998100))

(declare-fun m!924701 () Bool)

(assert (=> b!998096 m!924701))

(declare-fun m!924703 () Bool)

(assert (=> b!998095 m!924703))

(assert (=> b!998095 m!924703))

(declare-fun m!924705 () Bool)

(assert (=> b!998095 m!924705))

(assert (=> b!998100 m!924703))

(assert (=> b!998100 m!924703))

(declare-fun m!924707 () Bool)

(assert (=> b!998100 m!924707))

(assert (=> b!998091 m!924703))

(assert (=> b!998091 m!924703))

(declare-fun m!924709 () Bool)

(assert (=> b!998091 m!924709))

(assert (=> b!998091 m!924709))

(assert (=> b!998091 m!924703))

(declare-fun m!924711 () Bool)

(assert (=> b!998091 m!924711))

(declare-fun m!924713 () Bool)

(assert (=> b!998099 m!924713))

(declare-fun m!924715 () Bool)

(assert (=> b!998098 m!924715))

(declare-fun m!924717 () Bool)

(assert (=> b!998097 m!924717))

(declare-fun m!924719 () Bool)

(assert (=> b!998093 m!924719))

(declare-fun m!924721 () Bool)

(assert (=> start!86210 m!924721))

(declare-fun m!924723 () Bool)

(assert (=> start!86210 m!924723))

(push 1)

