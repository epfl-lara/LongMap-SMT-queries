; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86544 () Bool)

(assert start!86544)

(declare-fun b!1002979 () Bool)

(declare-fun res!672596 () Bool)

(declare-fun e!564938 () Bool)

(assert (=> b!1002979 (=> (not res!672596) (not e!564938))))

(declare-datatypes ((array!63292 0))(
  ( (array!63293 (arr!30471 (Array (_ BitVec 32) (_ BitVec 64))) (size!30975 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63292)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002979 (= res!672596 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30975 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30975 a!3219))))))

(declare-fun b!1002980 () Bool)

(declare-fun res!672581 () Bool)

(declare-fun e!564933 () Bool)

(assert (=> b!1002980 (=> (not res!672581) (not e!564933))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002980 (= res!672581 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002981 () Bool)

(assert (=> b!1002981 (= e!564933 e!564938)))

(declare-fun res!672591 () Bool)

(assert (=> b!1002981 (=> (not res!672591) (not e!564938))))

(declare-datatypes ((SeekEntryResult!9428 0))(
  ( (MissingZero!9428 (index!40083 (_ BitVec 32))) (Found!9428 (index!40084 (_ BitVec 32))) (Intermediate!9428 (undefined!10240 Bool) (index!40085 (_ BitVec 32)) (x!87507 (_ BitVec 32))) (Undefined!9428) (MissingVacant!9428 (index!40086 (_ BitVec 32))) )
))
(declare-fun lt!443329 () SeekEntryResult!9428)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002981 (= res!672591 (or (= lt!443329 (MissingVacant!9428 i!1194)) (= lt!443329 (MissingZero!9428 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63292 (_ BitVec 32)) SeekEntryResult!9428)

(assert (=> b!1002981 (= lt!443329 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002982 () Bool)

(declare-fun res!672589 () Bool)

(assert (=> b!1002982 (=> (not res!672589) (not e!564938))))

(declare-datatypes ((List!21213 0))(
  ( (Nil!21210) (Cons!21209 (h!22386 (_ BitVec 64)) (t!30205 List!21213)) )
))
(declare-fun arrayNoDuplicates!0 (array!63292 (_ BitVec 32) List!21213) Bool)

(assert (=> b!1002982 (= res!672589 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21210))))

(declare-fun b!1002983 () Bool)

(declare-fun e!564937 () Bool)

(declare-fun e!564936 () Bool)

(assert (=> b!1002983 (= e!564937 e!564936)))

(declare-fun res!672588 () Bool)

(assert (=> b!1002983 (=> (not res!672588) (not e!564936))))

(declare-fun lt!443322 () SeekEntryResult!9428)

(declare-fun lt!443328 () array!63292)

(declare-fun lt!443325 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63292 (_ BitVec 32)) SeekEntryResult!9428)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002983 (= res!672588 (not (= lt!443322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443325 mask!3464) lt!443325 lt!443328 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1002983 (= lt!443325 (select (store (arr!30471 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002983 (= lt!443328 (array!63293 (store (arr!30471 a!3219) i!1194 k0!2224) (size!30975 a!3219)))))

(declare-fun b!1002984 () Bool)

(declare-fun e!564935 () Bool)

(assert (=> b!1002984 (= e!564935 false)))

(declare-fun lt!443326 () SeekEntryResult!9428)

(declare-fun lt!443323 () (_ BitVec 32))

(assert (=> b!1002984 (= lt!443326 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443323 lt!443325 lt!443328 mask!3464))))

(declare-fun b!1002985 () Bool)

(declare-fun res!672583 () Bool)

(assert (=> b!1002985 (=> (not res!672583) (not e!564933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002985 (= res!672583 (validKeyInArray!0 (select (arr!30471 a!3219) j!170)))))

(declare-fun b!1002986 () Bool)

(declare-fun res!672590 () Bool)

(assert (=> b!1002986 (=> (not res!672590) (not e!564936))))

(assert (=> b!1002986 (= res!672590 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002987 () Bool)

(declare-fun e!564934 () Bool)

(assert (=> b!1002987 (= e!564938 e!564934)))

(declare-fun res!672582 () Bool)

(assert (=> b!1002987 (=> (not res!672582) (not e!564934))))

(declare-fun lt!443324 () SeekEntryResult!9428)

(assert (=> b!1002987 (= res!672582 (= lt!443322 lt!443324))))

(assert (=> b!1002987 (= lt!443324 (Intermediate!9428 false resIndex!38 resX!38))))

(assert (=> b!1002987 (= lt!443322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30471 a!3219) j!170) mask!3464) (select (arr!30471 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002988 () Bool)

(declare-fun res!672587 () Bool)

(assert (=> b!1002988 (=> (not res!672587) (not e!564938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63292 (_ BitVec 32)) Bool)

(assert (=> b!1002988 (= res!672587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!672584 () Bool)

(assert (=> start!86544 (=> (not res!672584) (not e!564933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86544 (= res!672584 (validMask!0 mask!3464))))

(assert (=> start!86544 e!564933))

(declare-fun array_inv!23614 (array!63292) Bool)

(assert (=> start!86544 (array_inv!23614 a!3219)))

(assert (=> start!86544 true))

(declare-fun b!1002989 () Bool)

(assert (=> b!1002989 (= e!564934 e!564937)))

(declare-fun res!672592 () Bool)

(assert (=> b!1002989 (=> (not res!672592) (not e!564937))))

(declare-fun lt!443327 () SeekEntryResult!9428)

(assert (=> b!1002989 (= res!672592 (= lt!443327 lt!443324))))

(assert (=> b!1002989 (= lt!443327 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30471 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002990 () Bool)

(assert (=> b!1002990 (= e!564936 e!564935)))

(declare-fun res!672595 () Bool)

(assert (=> b!1002990 (=> (not res!672595) (not e!564935))))

(assert (=> b!1002990 (= res!672595 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443323 #b00000000000000000000000000000000) (bvslt lt!443323 (size!30975 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002990 (= lt!443323 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002991 () Bool)

(declare-fun res!672585 () Bool)

(assert (=> b!1002991 (=> (not res!672585) (not e!564933))))

(assert (=> b!1002991 (= res!672585 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002992 () Bool)

(declare-fun res!672594 () Bool)

(assert (=> b!1002992 (=> (not res!672594) (not e!564936))))

(assert (=> b!1002992 (= res!672594 (not (= lt!443327 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443325 lt!443328 mask!3464))))))

(declare-fun b!1002993 () Bool)

(declare-fun res!672593 () Bool)

(assert (=> b!1002993 (=> (not res!672593) (not e!564933))))

(assert (=> b!1002993 (= res!672593 (and (= (size!30975 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30975 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30975 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002994 () Bool)

(declare-fun res!672586 () Bool)

(assert (=> b!1002994 (=> (not res!672586) (not e!564935))))

(assert (=> b!1002994 (= res!672586 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443323 (select (arr!30471 a!3219) j!170) a!3219 mask!3464) lt!443324))))

(assert (= (and start!86544 res!672584) b!1002993))

(assert (= (and b!1002993 res!672593) b!1002985))

(assert (= (and b!1002985 res!672583) b!1002991))

(assert (= (and b!1002991 res!672585) b!1002980))

(assert (= (and b!1002980 res!672581) b!1002981))

(assert (= (and b!1002981 res!672591) b!1002988))

(assert (= (and b!1002988 res!672587) b!1002982))

(assert (= (and b!1002982 res!672589) b!1002979))

(assert (= (and b!1002979 res!672596) b!1002987))

(assert (= (and b!1002987 res!672582) b!1002989))

(assert (= (and b!1002989 res!672592) b!1002983))

(assert (= (and b!1002983 res!672588) b!1002992))

(assert (= (and b!1002992 res!672594) b!1002986))

(assert (= (and b!1002986 res!672590) b!1002990))

(assert (= (and b!1002990 res!672595) b!1002994))

(assert (= (and b!1002994 res!672586) b!1002984))

(declare-fun m!928219 () Bool)

(assert (=> b!1002984 m!928219))

(declare-fun m!928221 () Bool)

(assert (=> b!1002992 m!928221))

(declare-fun m!928223 () Bool)

(assert (=> b!1002982 m!928223))

(declare-fun m!928225 () Bool)

(assert (=> b!1002988 m!928225))

(declare-fun m!928227 () Bool)

(assert (=> b!1002990 m!928227))

(declare-fun m!928229 () Bool)

(assert (=> b!1002989 m!928229))

(assert (=> b!1002989 m!928229))

(declare-fun m!928231 () Bool)

(assert (=> b!1002989 m!928231))

(assert (=> b!1002994 m!928229))

(assert (=> b!1002994 m!928229))

(declare-fun m!928233 () Bool)

(assert (=> b!1002994 m!928233))

(assert (=> b!1002985 m!928229))

(assert (=> b!1002985 m!928229))

(declare-fun m!928235 () Bool)

(assert (=> b!1002985 m!928235))

(declare-fun m!928237 () Bool)

(assert (=> start!86544 m!928237))

(declare-fun m!928239 () Bool)

(assert (=> start!86544 m!928239))

(declare-fun m!928241 () Bool)

(assert (=> b!1002980 m!928241))

(declare-fun m!928243 () Bool)

(assert (=> b!1002991 m!928243))

(assert (=> b!1002987 m!928229))

(assert (=> b!1002987 m!928229))

(declare-fun m!928245 () Bool)

(assert (=> b!1002987 m!928245))

(assert (=> b!1002987 m!928245))

(assert (=> b!1002987 m!928229))

(declare-fun m!928247 () Bool)

(assert (=> b!1002987 m!928247))

(declare-fun m!928249 () Bool)

(assert (=> b!1002981 m!928249))

(declare-fun m!928251 () Bool)

(assert (=> b!1002983 m!928251))

(assert (=> b!1002983 m!928251))

(declare-fun m!928253 () Bool)

(assert (=> b!1002983 m!928253))

(declare-fun m!928255 () Bool)

(assert (=> b!1002983 m!928255))

(declare-fun m!928257 () Bool)

(assert (=> b!1002983 m!928257))

(check-sat (not b!1002992) (not b!1002984) (not b!1002982) (not b!1002987) (not b!1002980) (not b!1002985) (not b!1002983) (not b!1002989) (not b!1002991) (not b!1002990) (not b!1002994) (not b!1002981) (not start!86544) (not b!1002988))
(check-sat)
