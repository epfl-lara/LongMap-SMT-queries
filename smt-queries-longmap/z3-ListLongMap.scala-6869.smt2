; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86460 () Bool)

(assert start!86460)

(declare-fun b!1000984 () Bool)

(declare-fun res!670597 () Bool)

(declare-fun e!564060 () Bool)

(assert (=> b!1000984 (=> (not res!670597) (not e!564060))))

(declare-datatypes ((array!63208 0))(
  ( (array!63209 (arr!30429 (Array (_ BitVec 32) (_ BitVec 64))) (size!30933 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63208)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000984 (= res!670597 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000985 () Bool)

(declare-fun res!670586 () Bool)

(assert (=> b!1000985 (=> (not res!670586) (not e!564060))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000985 (= res!670586 (validKeyInArray!0 (select (arr!30429 a!3219) j!170)))))

(declare-fun b!1000986 () Bool)

(declare-fun e!564059 () Bool)

(declare-fun e!564058 () Bool)

(assert (=> b!1000986 (= e!564059 e!564058)))

(declare-fun res!670594 () Bool)

(assert (=> b!1000986 (=> (not res!670594) (not e!564058))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9386 0))(
  ( (MissingZero!9386 (index!39915 (_ BitVec 32))) (Found!9386 (index!39916 (_ BitVec 32))) (Intermediate!9386 (undefined!10198 Bool) (index!39917 (_ BitVec 32)) (x!87353 (_ BitVec 32))) (Undefined!9386) (MissingVacant!9386 (index!39918 (_ BitVec 32))) )
))
(declare-fun lt!442332 () SeekEntryResult!9386)

(declare-fun lt!442331 () (_ BitVec 64))

(declare-fun lt!442330 () array!63208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63208 (_ BitVec 32)) SeekEntryResult!9386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000986 (= res!670594 (not (= lt!442332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442331 mask!3464) lt!442331 lt!442330 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000986 (= lt!442331 (select (store (arr!30429 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1000986 (= lt!442330 (array!63209 (store (arr!30429 a!3219) i!1194 k0!2224) (size!30933 a!3219)))))

(declare-fun b!1000987 () Bool)

(declare-fun res!670595 () Bool)

(declare-fun e!564057 () Bool)

(assert (=> b!1000987 (=> (not res!670595) (not e!564057))))

(declare-datatypes ((List!21171 0))(
  ( (Nil!21168) (Cons!21167 (h!22344 (_ BitVec 64)) (t!30163 List!21171)) )
))
(declare-fun arrayNoDuplicates!0 (array!63208 (_ BitVec 32) List!21171) Bool)

(assert (=> b!1000987 (= res!670595 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21168))))

(declare-fun b!1000988 () Bool)

(declare-fun res!670593 () Bool)

(assert (=> b!1000988 (=> (not res!670593) (not e!564058))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442333 () SeekEntryResult!9386)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000988 (= res!670593 (not (= lt!442333 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442331 lt!442330 mask!3464))))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!1000989 () Bool)

(assert (=> b!1000989 (= e!564058 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000990 () Bool)

(declare-fun res!670591 () Bool)

(assert (=> b!1000990 (=> (not res!670591) (not e!564057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63208 (_ BitVec 32)) Bool)

(assert (=> b!1000990 (= res!670591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000991 () Bool)

(declare-fun e!564061 () Bool)

(assert (=> b!1000991 (= e!564061 e!564059)))

(declare-fun res!670589 () Bool)

(assert (=> b!1000991 (=> (not res!670589) (not e!564059))))

(declare-fun lt!442329 () SeekEntryResult!9386)

(assert (=> b!1000991 (= res!670589 (= lt!442333 lt!442329))))

(assert (=> b!1000991 (= lt!442333 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30429 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000992 () Bool)

(declare-fun res!670590 () Bool)

(assert (=> b!1000992 (=> (not res!670590) (not e!564057))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000992 (= res!670590 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30933 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30933 a!3219))))))

(declare-fun res!670588 () Bool)

(assert (=> start!86460 (=> (not res!670588) (not e!564060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86460 (= res!670588 (validMask!0 mask!3464))))

(assert (=> start!86460 e!564060))

(declare-fun array_inv!23572 (array!63208) Bool)

(assert (=> start!86460 (array_inv!23572 a!3219)))

(assert (=> start!86460 true))

(declare-fun b!1000993 () Bool)

(assert (=> b!1000993 (= e!564057 e!564061)))

(declare-fun res!670587 () Bool)

(assert (=> b!1000993 (=> (not res!670587) (not e!564061))))

(assert (=> b!1000993 (= res!670587 (= lt!442332 lt!442329))))

(assert (=> b!1000993 (= lt!442329 (Intermediate!9386 false resIndex!38 resX!38))))

(assert (=> b!1000993 (= lt!442332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30429 a!3219) j!170) mask!3464) (select (arr!30429 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000994 () Bool)

(assert (=> b!1000994 (= e!564060 e!564057)))

(declare-fun res!670598 () Bool)

(assert (=> b!1000994 (=> (not res!670598) (not e!564057))))

(declare-fun lt!442328 () SeekEntryResult!9386)

(assert (=> b!1000994 (= res!670598 (or (= lt!442328 (MissingVacant!9386 i!1194)) (= lt!442328 (MissingZero!9386 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63208 (_ BitVec 32)) SeekEntryResult!9386)

(assert (=> b!1000994 (= lt!442328 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000995 () Bool)

(declare-fun res!670592 () Bool)

(assert (=> b!1000995 (=> (not res!670592) (not e!564060))))

(assert (=> b!1000995 (= res!670592 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000996 () Bool)

(declare-fun res!670596 () Bool)

(assert (=> b!1000996 (=> (not res!670596) (not e!564060))))

(assert (=> b!1000996 (= res!670596 (and (= (size!30933 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30933 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30933 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86460 res!670588) b!1000996))

(assert (= (and b!1000996 res!670596) b!1000985))

(assert (= (and b!1000985 res!670586) b!1000995))

(assert (= (and b!1000995 res!670592) b!1000984))

(assert (= (and b!1000984 res!670597) b!1000994))

(assert (= (and b!1000994 res!670598) b!1000990))

(assert (= (and b!1000990 res!670591) b!1000987))

(assert (= (and b!1000987 res!670595) b!1000992))

(assert (= (and b!1000992 res!670590) b!1000993))

(assert (= (and b!1000993 res!670587) b!1000991))

(assert (= (and b!1000991 res!670589) b!1000986))

(assert (= (and b!1000986 res!670594) b!1000988))

(assert (= (and b!1000988 res!670593) b!1000989))

(declare-fun m!926557 () Bool)

(assert (=> b!1000990 m!926557))

(declare-fun m!926559 () Bool)

(assert (=> b!1000985 m!926559))

(assert (=> b!1000985 m!926559))

(declare-fun m!926561 () Bool)

(assert (=> b!1000985 m!926561))

(declare-fun m!926563 () Bool)

(assert (=> b!1000994 m!926563))

(declare-fun m!926565 () Bool)

(assert (=> b!1000986 m!926565))

(assert (=> b!1000986 m!926565))

(declare-fun m!926567 () Bool)

(assert (=> b!1000986 m!926567))

(declare-fun m!926569 () Bool)

(assert (=> b!1000986 m!926569))

(declare-fun m!926571 () Bool)

(assert (=> b!1000986 m!926571))

(assert (=> b!1000993 m!926559))

(assert (=> b!1000993 m!926559))

(declare-fun m!926573 () Bool)

(assert (=> b!1000993 m!926573))

(assert (=> b!1000993 m!926573))

(assert (=> b!1000993 m!926559))

(declare-fun m!926575 () Bool)

(assert (=> b!1000993 m!926575))

(declare-fun m!926577 () Bool)

(assert (=> b!1000984 m!926577))

(declare-fun m!926579 () Bool)

(assert (=> b!1000987 m!926579))

(assert (=> b!1000991 m!926559))

(assert (=> b!1000991 m!926559))

(declare-fun m!926581 () Bool)

(assert (=> b!1000991 m!926581))

(declare-fun m!926583 () Bool)

(assert (=> b!1000995 m!926583))

(declare-fun m!926585 () Bool)

(assert (=> start!86460 m!926585))

(declare-fun m!926587 () Bool)

(assert (=> start!86460 m!926587))

(declare-fun m!926589 () Bool)

(assert (=> b!1000988 m!926589))

(check-sat (not b!1000985) (not b!1000995) (not b!1000988) (not start!86460) (not b!1000987) (not b!1000984) (not b!1000986) (not b!1000991) (not b!1000994) (not b!1000990) (not b!1000993))
(check-sat)
