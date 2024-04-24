; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86128 () Bool)

(assert start!86128)

(declare-fun b!996851 () Bool)

(declare-fun res!666489 () Bool)

(declare-fun e!562576 () Bool)

(assert (=> b!996851 (=> (not res!666489) (not e!562576))))

(declare-datatypes ((array!63048 0))(
  ( (array!63049 (arr!30352 (Array (_ BitVec 32) (_ BitVec 64))) (size!30855 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63048)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996851 (= res!666489 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30855 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30855 a!3219))))))

(declare-fun b!996852 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!996852 (= e!562576 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441448 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996852 (= lt!441448 (toIndex!0 (select (arr!30352 a!3219) j!170) mask!3464))))

(declare-fun res!666492 () Bool)

(declare-fun e!562578 () Bool)

(assert (=> start!86128 (=> (not res!666492) (not e!562578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86128 (= res!666492 (validMask!0 mask!3464))))

(assert (=> start!86128 e!562578))

(declare-fun array_inv!23488 (array!63048) Bool)

(assert (=> start!86128 (array_inv!23488 a!3219)))

(assert (=> start!86128 true))

(declare-fun b!996853 () Bool)

(declare-fun res!666490 () Bool)

(assert (=> b!996853 (=> (not res!666490) (not e!562578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996853 (= res!666490 (validKeyInArray!0 (select (arr!30352 a!3219) j!170)))))

(declare-fun b!996854 () Bool)

(declare-fun res!666491 () Bool)

(assert (=> b!996854 (=> (not res!666491) (not e!562578))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996854 (= res!666491 (and (= (size!30855 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30855 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30855 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996855 () Bool)

(declare-fun res!666486 () Bool)

(assert (=> b!996855 (=> (not res!666486) (not e!562578))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996855 (= res!666486 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996856 () Bool)

(declare-fun res!666494 () Bool)

(assert (=> b!996856 (=> (not res!666494) (not e!562576))))

(declare-datatypes ((List!20999 0))(
  ( (Nil!20996) (Cons!20995 (h!22163 (_ BitVec 64)) (t!29992 List!20999)) )
))
(declare-fun arrayNoDuplicates!0 (array!63048 (_ BitVec 32) List!20999) Bool)

(assert (=> b!996856 (= res!666494 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20996))))

(declare-fun b!996857 () Bool)

(declare-fun res!666488 () Bool)

(assert (=> b!996857 (=> (not res!666488) (not e!562578))))

(assert (=> b!996857 (= res!666488 (validKeyInArray!0 k0!2224))))

(declare-fun b!996858 () Bool)

(declare-fun res!666487 () Bool)

(assert (=> b!996858 (=> (not res!666487) (not e!562576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63048 (_ BitVec 32)) Bool)

(assert (=> b!996858 (= res!666487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996859 () Bool)

(assert (=> b!996859 (= e!562578 e!562576)))

(declare-fun res!666493 () Bool)

(assert (=> b!996859 (=> (not res!666493) (not e!562576))))

(declare-datatypes ((SeekEntryResult!9220 0))(
  ( (MissingZero!9220 (index!39251 (_ BitVec 32))) (Found!9220 (index!39252 (_ BitVec 32))) (Intermediate!9220 (undefined!10032 Bool) (index!39253 (_ BitVec 32)) (x!86843 (_ BitVec 32))) (Undefined!9220) (MissingVacant!9220 (index!39254 (_ BitVec 32))) )
))
(declare-fun lt!441449 () SeekEntryResult!9220)

(assert (=> b!996859 (= res!666493 (or (= lt!441449 (MissingVacant!9220 i!1194)) (= lt!441449 (MissingZero!9220 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63048 (_ BitVec 32)) SeekEntryResult!9220)

(assert (=> b!996859 (= lt!441449 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86128 res!666492) b!996854))

(assert (= (and b!996854 res!666491) b!996853))

(assert (= (and b!996853 res!666490) b!996857))

(assert (= (and b!996857 res!666488) b!996855))

(assert (= (and b!996855 res!666486) b!996859))

(assert (= (and b!996859 res!666493) b!996858))

(assert (= (and b!996858 res!666487) b!996856))

(assert (= (and b!996856 res!666494) b!996851))

(assert (= (and b!996851 res!666489) b!996852))

(declare-fun m!924527 () Bool)

(assert (=> b!996855 m!924527))

(declare-fun m!924529 () Bool)

(assert (=> b!996852 m!924529))

(assert (=> b!996852 m!924529))

(declare-fun m!924531 () Bool)

(assert (=> b!996852 m!924531))

(assert (=> b!996853 m!924529))

(assert (=> b!996853 m!924529))

(declare-fun m!924533 () Bool)

(assert (=> b!996853 m!924533))

(declare-fun m!924535 () Bool)

(assert (=> b!996857 m!924535))

(declare-fun m!924537 () Bool)

(assert (=> b!996858 m!924537))

(declare-fun m!924539 () Bool)

(assert (=> b!996856 m!924539))

(declare-fun m!924541 () Bool)

(assert (=> start!86128 m!924541))

(declare-fun m!924543 () Bool)

(assert (=> start!86128 m!924543))

(declare-fun m!924545 () Bool)

(assert (=> b!996859 m!924545))

(check-sat (not b!996858) (not b!996856) (not b!996859) (not b!996852) (not b!996857) (not start!86128) (not b!996855) (not b!996853))
(check-sat)
