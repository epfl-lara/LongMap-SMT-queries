; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86570 () Bool)

(assert start!86570)

(declare-fun res!673118 () Bool)

(declare-fun e!565254 () Bool)

(assert (=> start!86570 (=> (not res!673118) (not e!565254))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86570 (= res!673118 (validMask!0 mask!3464))))

(assert (=> start!86570 e!565254))

(declare-datatypes ((array!63371 0))(
  ( (array!63372 (arr!30511 (Array (_ BitVec 32) (_ BitVec 64))) (size!31013 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63371)

(declare-fun array_inv!23635 (array!63371) Bool)

(assert (=> start!86570 (array_inv!23635 a!3219)))

(assert (=> start!86570 true))

(declare-fun b!1003629 () Bool)

(declare-fun e!565257 () Bool)

(declare-fun e!565256 () Bool)

(assert (=> b!1003629 (= e!565257 e!565256)))

(declare-fun res!673112 () Bool)

(assert (=> b!1003629 (=> (not res!673112) (not e!565256))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443777 () (_ BitVec 32))

(assert (=> b!1003629 (= res!673112 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443777 #b00000000000000000000000000000000) (bvslt lt!443777 (size!31013 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003629 (= lt!443777 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003630 () Bool)

(declare-fun res!673114 () Bool)

(declare-fun e!565255 () Bool)

(assert (=> b!1003630 (=> (not res!673114) (not e!565255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63371 (_ BitVec 32)) Bool)

(assert (=> b!1003630 (= res!673114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003631 () Bool)

(declare-fun res!673120 () Bool)

(assert (=> b!1003631 (=> (not res!673120) (not e!565254))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003631 (= res!673120 (validKeyInArray!0 (select (arr!30511 a!3219) j!170)))))

(declare-fun b!1003632 () Bool)

(assert (=> b!1003632 (= e!565256 false)))

(declare-fun lt!443771 () (_ BitVec 64))

(declare-fun lt!443775 () array!63371)

(declare-datatypes ((SeekEntryResult!9443 0))(
  ( (MissingZero!9443 (index!40143 (_ BitVec 32))) (Found!9443 (index!40144 (_ BitVec 32))) (Intermediate!9443 (undefined!10255 Bool) (index!40145 (_ BitVec 32)) (x!87551 (_ BitVec 32))) (Undefined!9443) (MissingVacant!9443 (index!40146 (_ BitVec 32))) )
))
(declare-fun lt!443772 () SeekEntryResult!9443)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63371 (_ BitVec 32)) SeekEntryResult!9443)

(assert (=> b!1003632 (= lt!443772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443777 lt!443771 lt!443775 mask!3464))))

(declare-fun b!1003633 () Bool)

(assert (=> b!1003633 (= e!565254 e!565255)))

(declare-fun res!673116 () Bool)

(assert (=> b!1003633 (=> (not res!673116) (not e!565255))))

(declare-fun lt!443770 () SeekEntryResult!9443)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003633 (= res!673116 (or (= lt!443770 (MissingVacant!9443 i!1194)) (= lt!443770 (MissingZero!9443 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63371 (_ BitVec 32)) SeekEntryResult!9443)

(assert (=> b!1003633 (= lt!443770 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003634 () Bool)

(declare-fun res!673111 () Bool)

(assert (=> b!1003634 (=> (not res!673111) (not e!565254))))

(declare-fun arrayContainsKey!0 (array!63371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003634 (= res!673111 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003635 () Bool)

(declare-fun res!673115 () Bool)

(assert (=> b!1003635 (=> (not res!673115) (not e!565254))))

(assert (=> b!1003635 (= res!673115 (and (= (size!31013 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31013 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31013 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003636 () Bool)

(declare-fun e!565253 () Bool)

(assert (=> b!1003636 (= e!565253 e!565257)))

(declare-fun res!673121 () Bool)

(assert (=> b!1003636 (=> (not res!673121) (not e!565257))))

(declare-fun lt!443773 () SeekEntryResult!9443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003636 (= res!673121 (not (= lt!443773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443771 mask!3464) lt!443771 lt!443775 mask!3464))))))

(assert (=> b!1003636 (= lt!443771 (select (store (arr!30511 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003636 (= lt!443775 (array!63372 (store (arr!30511 a!3219) i!1194 k!2224) (size!31013 a!3219)))))

(declare-fun b!1003637 () Bool)

(declare-fun res!673119 () Bool)

(assert (=> b!1003637 (=> (not res!673119) (not e!565257))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003637 (= res!673119 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003638 () Bool)

(declare-fun res!673108 () Bool)

(assert (=> b!1003638 (=> (not res!673108) (not e!565254))))

(assert (=> b!1003638 (= res!673108 (validKeyInArray!0 k!2224))))

(declare-fun b!1003639 () Bool)

(declare-fun res!673117 () Bool)

(assert (=> b!1003639 (=> (not res!673117) (not e!565256))))

(declare-fun lt!443776 () SeekEntryResult!9443)

(assert (=> b!1003639 (= res!673117 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443777 (select (arr!30511 a!3219) j!170) a!3219 mask!3464) lt!443776))))

(declare-fun b!1003640 () Bool)

(declare-fun res!673110 () Bool)

(assert (=> b!1003640 (=> (not res!673110) (not e!565255))))

(assert (=> b!1003640 (= res!673110 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31013 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31013 a!3219))))))

(declare-fun b!1003641 () Bool)

(declare-fun res!673107 () Bool)

(assert (=> b!1003641 (=> (not res!673107) (not e!565255))))

(declare-datatypes ((List!21187 0))(
  ( (Nil!21184) (Cons!21183 (h!22360 (_ BitVec 64)) (t!30188 List!21187)) )
))
(declare-fun arrayNoDuplicates!0 (array!63371 (_ BitVec 32) List!21187) Bool)

(assert (=> b!1003641 (= res!673107 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21184))))

(declare-fun b!1003642 () Bool)

(declare-fun e!565258 () Bool)

(assert (=> b!1003642 (= e!565258 e!565253)))

(declare-fun res!673109 () Bool)

(assert (=> b!1003642 (=> (not res!673109) (not e!565253))))

(declare-fun lt!443774 () SeekEntryResult!9443)

(assert (=> b!1003642 (= res!673109 (= lt!443774 lt!443776))))

(assert (=> b!1003642 (= lt!443774 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30511 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003643 () Bool)

(assert (=> b!1003643 (= e!565255 e!565258)))

(declare-fun res!673122 () Bool)

(assert (=> b!1003643 (=> (not res!673122) (not e!565258))))

(assert (=> b!1003643 (= res!673122 (= lt!443773 lt!443776))))

(assert (=> b!1003643 (= lt!443776 (Intermediate!9443 false resIndex!38 resX!38))))

(assert (=> b!1003643 (= lt!443773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30511 a!3219) j!170) mask!3464) (select (arr!30511 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003644 () Bool)

(declare-fun res!673113 () Bool)

(assert (=> b!1003644 (=> (not res!673113) (not e!565257))))

(assert (=> b!1003644 (= res!673113 (not (= lt!443774 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443771 lt!443775 mask!3464))))))

(assert (= (and start!86570 res!673118) b!1003635))

(assert (= (and b!1003635 res!673115) b!1003631))

(assert (= (and b!1003631 res!673120) b!1003638))

(assert (= (and b!1003638 res!673108) b!1003634))

(assert (= (and b!1003634 res!673111) b!1003633))

(assert (= (and b!1003633 res!673116) b!1003630))

(assert (= (and b!1003630 res!673114) b!1003641))

(assert (= (and b!1003641 res!673107) b!1003640))

(assert (= (and b!1003640 res!673110) b!1003643))

(assert (= (and b!1003643 res!673122) b!1003642))

(assert (= (and b!1003642 res!673109) b!1003636))

(assert (= (and b!1003636 res!673121) b!1003644))

(assert (= (and b!1003644 res!673113) b!1003637))

(assert (= (and b!1003637 res!673119) b!1003629))

(assert (= (and b!1003629 res!673112) b!1003639))

(assert (= (and b!1003639 res!673117) b!1003632))

(declare-fun m!929309 () Bool)

(assert (=> b!1003634 m!929309))

(declare-fun m!929311 () Bool)

(assert (=> b!1003632 m!929311))

(declare-fun m!929313 () Bool)

(assert (=> start!86570 m!929313))

(declare-fun m!929315 () Bool)

(assert (=> start!86570 m!929315))

(declare-fun m!929317 () Bool)

(assert (=> b!1003641 m!929317))

(declare-fun m!929319 () Bool)

(assert (=> b!1003643 m!929319))

(assert (=> b!1003643 m!929319))

(declare-fun m!929321 () Bool)

(assert (=> b!1003643 m!929321))

(assert (=> b!1003643 m!929321))

(assert (=> b!1003643 m!929319))

(declare-fun m!929323 () Bool)

(assert (=> b!1003643 m!929323))

(declare-fun m!929325 () Bool)

(assert (=> b!1003638 m!929325))

(assert (=> b!1003642 m!929319))

(assert (=> b!1003642 m!929319))

(declare-fun m!929327 () Bool)

(assert (=> b!1003642 m!929327))

(declare-fun m!929329 () Bool)

(assert (=> b!1003644 m!929329))

(declare-fun m!929331 () Bool)

(assert (=> b!1003633 m!929331))

(declare-fun m!929333 () Bool)

(assert (=> b!1003636 m!929333))

(assert (=> b!1003636 m!929333))

(declare-fun m!929335 () Bool)

(assert (=> b!1003636 m!929335))

(declare-fun m!929337 () Bool)

(assert (=> b!1003636 m!929337))

(declare-fun m!929339 () Bool)

(assert (=> b!1003636 m!929339))

(declare-fun m!929341 () Bool)

(assert (=> b!1003630 m!929341))

(assert (=> b!1003631 m!929319))

(assert (=> b!1003631 m!929319))

(declare-fun m!929343 () Bool)

(assert (=> b!1003631 m!929343))

(declare-fun m!929345 () Bool)

(assert (=> b!1003629 m!929345))

(assert (=> b!1003639 m!929319))

(assert (=> b!1003639 m!929319))

(declare-fun m!929347 () Bool)

(assert (=> b!1003639 m!929347))

(push 1)

