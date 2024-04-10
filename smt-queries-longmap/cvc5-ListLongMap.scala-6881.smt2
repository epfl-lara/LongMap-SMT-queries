; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86540 () Bool)

(assert start!86540)

(declare-fun b!1002909 () Bool)

(declare-fun e!564942 () Bool)

(declare-fun e!564938 () Bool)

(assert (=> b!1002909 (= e!564942 e!564938)))

(declare-fun res!672392 () Bool)

(assert (=> b!1002909 (=> (not res!672392) (not e!564938))))

(declare-datatypes ((SeekEntryResult!9428 0))(
  ( (MissingZero!9428 (index!40083 (_ BitVec 32))) (Found!9428 (index!40084 (_ BitVec 32))) (Intermediate!9428 (undefined!10240 Bool) (index!40085 (_ BitVec 32)) (x!87496 (_ BitVec 32))) (Undefined!9428) (MissingVacant!9428 (index!40086 (_ BitVec 32))) )
))
(declare-fun lt!443414 () SeekEntryResult!9428)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002909 (= res!672392 (or (= lt!443414 (MissingVacant!9428 i!1194)) (= lt!443414 (MissingZero!9428 i!1194))))))

(declare-datatypes ((array!63341 0))(
  ( (array!63342 (arr!30496 (Array (_ BitVec 32) (_ BitVec 64))) (size!30998 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63341)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63341 (_ BitVec 32)) SeekEntryResult!9428)

(assert (=> b!1002909 (= lt!443414 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002910 () Bool)

(declare-fun res!672388 () Bool)

(declare-fun e!564937 () Bool)

(assert (=> b!1002910 (=> (not res!672388) (not e!564937))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443417 () SeekEntryResult!9428)

(declare-fun lt!443412 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63341 (_ BitVec 32)) SeekEntryResult!9428)

(assert (=> b!1002910 (= res!672388 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443412 (select (arr!30496 a!3219) j!170) a!3219 mask!3464) lt!443417))))

(declare-fun b!1002911 () Bool)

(declare-fun e!564941 () Bool)

(declare-fun e!564943 () Bool)

(assert (=> b!1002911 (= e!564941 e!564943)))

(declare-fun res!672391 () Bool)

(assert (=> b!1002911 (=> (not res!672391) (not e!564943))))

(declare-fun lt!443413 () SeekEntryResult!9428)

(assert (=> b!1002911 (= res!672391 (= lt!443413 lt!443417))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002911 (= lt!443413 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30496 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002912 () Bool)

(declare-fun res!672395 () Bool)

(assert (=> b!1002912 (=> (not res!672395) (not e!564938))))

(declare-datatypes ((List!21172 0))(
  ( (Nil!21169) (Cons!21168 (h!22345 (_ BitVec 64)) (t!30173 List!21172)) )
))
(declare-fun arrayNoDuplicates!0 (array!63341 (_ BitVec 32) List!21172) Bool)

(assert (=> b!1002912 (= res!672395 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21169))))

(declare-fun b!1002913 () Bool)

(declare-fun res!672398 () Bool)

(assert (=> b!1002913 (=> (not res!672398) (not e!564938))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002913 (= res!672398 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30998 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30998 a!3219))))))

(declare-fun b!1002915 () Bool)

(declare-fun res!672396 () Bool)

(declare-fun e!564940 () Bool)

(assert (=> b!1002915 (=> (not res!672396) (not e!564940))))

(assert (=> b!1002915 (= res!672396 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002916 () Bool)

(assert (=> b!1002916 (= e!564937 false)))

(declare-fun lt!443415 () (_ BitVec 64))

(declare-fun lt!443416 () SeekEntryResult!9428)

(declare-fun lt!443411 () array!63341)

(assert (=> b!1002916 (= lt!443416 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443412 lt!443415 lt!443411 mask!3464))))

(declare-fun b!1002917 () Bool)

(assert (=> b!1002917 (= e!564938 e!564941)))

(declare-fun res!672397 () Bool)

(assert (=> b!1002917 (=> (not res!672397) (not e!564941))))

(declare-fun lt!443410 () SeekEntryResult!9428)

(assert (=> b!1002917 (= res!672397 (= lt!443410 lt!443417))))

(assert (=> b!1002917 (= lt!443417 (Intermediate!9428 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002917 (= lt!443410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30496 a!3219) j!170) mask!3464) (select (arr!30496 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002918 () Bool)

(declare-fun res!672400 () Bool)

(assert (=> b!1002918 (=> (not res!672400) (not e!564942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002918 (= res!672400 (validKeyInArray!0 k!2224))))

(declare-fun b!1002919 () Bool)

(assert (=> b!1002919 (= e!564940 e!564937)))

(declare-fun res!672399 () Bool)

(assert (=> b!1002919 (=> (not res!672399) (not e!564937))))

(assert (=> b!1002919 (= res!672399 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443412 #b00000000000000000000000000000000) (bvslt lt!443412 (size!30998 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002919 (= lt!443412 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002920 () Bool)

(assert (=> b!1002920 (= e!564943 e!564940)))

(declare-fun res!672387 () Bool)

(assert (=> b!1002920 (=> (not res!672387) (not e!564940))))

(assert (=> b!1002920 (= res!672387 (not (= lt!443410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443415 mask!3464) lt!443415 lt!443411 mask!3464))))))

(assert (=> b!1002920 (= lt!443415 (select (store (arr!30496 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002920 (= lt!443411 (array!63342 (store (arr!30496 a!3219) i!1194 k!2224) (size!30998 a!3219)))))

(declare-fun b!1002921 () Bool)

(declare-fun res!672402 () Bool)

(assert (=> b!1002921 (=> (not res!672402) (not e!564940))))

(assert (=> b!1002921 (= res!672402 (not (= lt!443413 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443415 lt!443411 mask!3464))))))

(declare-fun b!1002922 () Bool)

(declare-fun res!672394 () Bool)

(assert (=> b!1002922 (=> (not res!672394) (not e!564942))))

(declare-fun arrayContainsKey!0 (array!63341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002922 (= res!672394 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!672389 () Bool)

(assert (=> start!86540 (=> (not res!672389) (not e!564942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86540 (= res!672389 (validMask!0 mask!3464))))

(assert (=> start!86540 e!564942))

(declare-fun array_inv!23620 (array!63341) Bool)

(assert (=> start!86540 (array_inv!23620 a!3219)))

(assert (=> start!86540 true))

(declare-fun b!1002914 () Bool)

(declare-fun res!672401 () Bool)

(assert (=> b!1002914 (=> (not res!672401) (not e!564942))))

(assert (=> b!1002914 (= res!672401 (validKeyInArray!0 (select (arr!30496 a!3219) j!170)))))

(declare-fun b!1002923 () Bool)

(declare-fun res!672390 () Bool)

(assert (=> b!1002923 (=> (not res!672390) (not e!564938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63341 (_ BitVec 32)) Bool)

(assert (=> b!1002923 (= res!672390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002924 () Bool)

(declare-fun res!672393 () Bool)

(assert (=> b!1002924 (=> (not res!672393) (not e!564942))))

(assert (=> b!1002924 (= res!672393 (and (= (size!30998 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30998 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30998 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86540 res!672389) b!1002924))

(assert (= (and b!1002924 res!672393) b!1002914))

(assert (= (and b!1002914 res!672401) b!1002918))

(assert (= (and b!1002918 res!672400) b!1002922))

(assert (= (and b!1002922 res!672394) b!1002909))

(assert (= (and b!1002909 res!672392) b!1002923))

(assert (= (and b!1002923 res!672390) b!1002912))

(assert (= (and b!1002912 res!672395) b!1002913))

(assert (= (and b!1002913 res!672398) b!1002917))

(assert (= (and b!1002917 res!672397) b!1002911))

(assert (= (and b!1002911 res!672391) b!1002920))

(assert (= (and b!1002920 res!672387) b!1002921))

(assert (= (and b!1002921 res!672402) b!1002915))

(assert (= (and b!1002915 res!672396) b!1002919))

(assert (= (and b!1002919 res!672399) b!1002910))

(assert (= (and b!1002910 res!672388) b!1002916))

(declare-fun m!928709 () Bool)

(assert (=> b!1002922 m!928709))

(declare-fun m!928711 () Bool)

(assert (=> b!1002918 m!928711))

(declare-fun m!928713 () Bool)

(assert (=> b!1002920 m!928713))

(assert (=> b!1002920 m!928713))

(declare-fun m!928715 () Bool)

(assert (=> b!1002920 m!928715))

(declare-fun m!928717 () Bool)

(assert (=> b!1002920 m!928717))

(declare-fun m!928719 () Bool)

(assert (=> b!1002920 m!928719))

(declare-fun m!928721 () Bool)

(assert (=> b!1002916 m!928721))

(declare-fun m!928723 () Bool)

(assert (=> b!1002914 m!928723))

(assert (=> b!1002914 m!928723))

(declare-fun m!928725 () Bool)

(assert (=> b!1002914 m!928725))

(declare-fun m!928727 () Bool)

(assert (=> b!1002923 m!928727))

(assert (=> b!1002911 m!928723))

(assert (=> b!1002911 m!928723))

(declare-fun m!928729 () Bool)

(assert (=> b!1002911 m!928729))

(assert (=> b!1002917 m!928723))

(assert (=> b!1002917 m!928723))

(declare-fun m!928731 () Bool)

(assert (=> b!1002917 m!928731))

(assert (=> b!1002917 m!928731))

(assert (=> b!1002917 m!928723))

(declare-fun m!928733 () Bool)

(assert (=> b!1002917 m!928733))

(declare-fun m!928735 () Bool)

(assert (=> b!1002921 m!928735))

(declare-fun m!928737 () Bool)

(assert (=> b!1002912 m!928737))

(declare-fun m!928739 () Bool)

(assert (=> b!1002919 m!928739))

(declare-fun m!928741 () Bool)

(assert (=> start!86540 m!928741))

(declare-fun m!928743 () Bool)

(assert (=> start!86540 m!928743))

(declare-fun m!928745 () Bool)

(assert (=> b!1002909 m!928745))

(assert (=> b!1002910 m!928723))

(assert (=> b!1002910 m!928723))

(declare-fun m!928747 () Bool)

(assert (=> b!1002910 m!928747))

(push 1)

