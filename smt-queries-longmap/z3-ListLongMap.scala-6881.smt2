; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86542 () Bool)

(assert start!86542)

(declare-fun b!1002957 () Bool)

(declare-fun res!672448 () Bool)

(declare-fun e!564961 () Bool)

(assert (=> b!1002957 (=> (not res!672448) (not e!564961))))

(declare-datatypes ((array!63343 0))(
  ( (array!63344 (arr!30497 (Array (_ BitVec 32) (_ BitVec 64))) (size!30999 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63343)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9429 0))(
  ( (MissingZero!9429 (index!40087 (_ BitVec 32))) (Found!9429 (index!40088 (_ BitVec 32))) (Intermediate!9429 (undefined!10241 Bool) (index!40089 (_ BitVec 32)) (x!87497 (_ BitVec 32))) (Undefined!9429) (MissingVacant!9429 (index!40090 (_ BitVec 32))) )
))
(declare-fun lt!443435 () SeekEntryResult!9429)

(declare-fun lt!443441 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63343 (_ BitVec 32)) SeekEntryResult!9429)

(assert (=> b!1002957 (= res!672448 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443441 (select (arr!30497 a!3219) j!170) a!3219 mask!3464) lt!443435))))

(declare-fun b!1002958 () Bool)

(declare-fun e!564959 () Bool)

(declare-fun e!564958 () Bool)

(assert (=> b!1002958 (= e!564959 e!564958)))

(declare-fun res!672437 () Bool)

(assert (=> b!1002958 (=> (not res!672437) (not e!564958))))

(declare-fun lt!443436 () SeekEntryResult!9429)

(assert (=> b!1002958 (= res!672437 (= lt!443436 lt!443435))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002958 (= lt!443435 (Intermediate!9429 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002958 (= lt!443436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30497 a!3219) j!170) mask!3464) (select (arr!30497 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002959 () Bool)

(declare-fun res!672440 () Bool)

(assert (=> b!1002959 (=> (not res!672440) (not e!564959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63343 (_ BitVec 32)) Bool)

(assert (=> b!1002959 (= res!672440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002960 () Bool)

(declare-fun e!564963 () Bool)

(assert (=> b!1002960 (= e!564963 e!564959)))

(declare-fun res!672439 () Bool)

(assert (=> b!1002960 (=> (not res!672439) (not e!564959))))

(declare-fun lt!443439 () SeekEntryResult!9429)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002960 (= res!672439 (or (= lt!443439 (MissingVacant!9429 i!1194)) (= lt!443439 (MissingZero!9429 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63343 (_ BitVec 32)) SeekEntryResult!9429)

(assert (=> b!1002960 (= lt!443439 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002961 () Bool)

(declare-fun res!672441 () Bool)

(declare-fun e!564964 () Bool)

(assert (=> b!1002961 (=> (not res!672441) (not e!564964))))

(declare-fun lt!443434 () array!63343)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443438 () SeekEntryResult!9429)

(declare-fun lt!443440 () (_ BitVec 64))

(assert (=> b!1002961 (= res!672441 (not (= lt!443438 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443440 lt!443434 mask!3464))))))

(declare-fun b!1002962 () Bool)

(declare-fun res!672447 () Bool)

(assert (=> b!1002962 (=> (not res!672447) (not e!564964))))

(assert (=> b!1002962 (= res!672447 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002963 () Bool)

(declare-fun res!672444 () Bool)

(assert (=> b!1002963 (=> (not res!672444) (not e!564959))))

(assert (=> b!1002963 (= res!672444 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30999 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30999 a!3219))))))

(declare-fun b!1002964 () Bool)

(declare-fun res!672436 () Bool)

(assert (=> b!1002964 (=> (not res!672436) (not e!564963))))

(assert (=> b!1002964 (= res!672436 (and (= (size!30999 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30999 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30999 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002965 () Bool)

(declare-fun res!672445 () Bool)

(assert (=> b!1002965 (=> (not res!672445) (not e!564963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002965 (= res!672445 (validKeyInArray!0 (select (arr!30497 a!3219) j!170)))))

(declare-fun b!1002966 () Bool)

(declare-fun e!564962 () Bool)

(assert (=> b!1002966 (= e!564962 e!564964)))

(declare-fun res!672443 () Bool)

(assert (=> b!1002966 (=> (not res!672443) (not e!564964))))

(assert (=> b!1002966 (= res!672443 (not (= lt!443436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443440 mask!3464) lt!443440 lt!443434 mask!3464))))))

(assert (=> b!1002966 (= lt!443440 (select (store (arr!30497 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002966 (= lt!443434 (array!63344 (store (arr!30497 a!3219) i!1194 k0!2224) (size!30999 a!3219)))))

(declare-fun res!672450 () Bool)

(assert (=> start!86542 (=> (not res!672450) (not e!564963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86542 (= res!672450 (validMask!0 mask!3464))))

(assert (=> start!86542 e!564963))

(declare-fun array_inv!23621 (array!63343) Bool)

(assert (=> start!86542 (array_inv!23621 a!3219)))

(assert (=> start!86542 true))

(declare-fun b!1002967 () Bool)

(declare-fun res!672438 () Bool)

(assert (=> b!1002967 (=> (not res!672438) (not e!564959))))

(declare-datatypes ((List!21173 0))(
  ( (Nil!21170) (Cons!21169 (h!22346 (_ BitVec 64)) (t!30174 List!21173)) )
))
(declare-fun arrayNoDuplicates!0 (array!63343 (_ BitVec 32) List!21173) Bool)

(assert (=> b!1002967 (= res!672438 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21170))))

(declare-fun b!1002968 () Bool)

(assert (=> b!1002968 (= e!564961 false)))

(declare-fun lt!443437 () SeekEntryResult!9429)

(assert (=> b!1002968 (= lt!443437 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443441 lt!443440 lt!443434 mask!3464))))

(declare-fun b!1002969 () Bool)

(assert (=> b!1002969 (= e!564964 e!564961)))

(declare-fun res!672435 () Bool)

(assert (=> b!1002969 (=> (not res!672435) (not e!564961))))

(assert (=> b!1002969 (= res!672435 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443441 #b00000000000000000000000000000000) (bvslt lt!443441 (size!30999 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002969 (= lt!443441 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002970 () Bool)

(assert (=> b!1002970 (= e!564958 e!564962)))

(declare-fun res!672446 () Bool)

(assert (=> b!1002970 (=> (not res!672446) (not e!564962))))

(assert (=> b!1002970 (= res!672446 (= lt!443438 lt!443435))))

(assert (=> b!1002970 (= lt!443438 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30497 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002971 () Bool)

(declare-fun res!672442 () Bool)

(assert (=> b!1002971 (=> (not res!672442) (not e!564963))))

(declare-fun arrayContainsKey!0 (array!63343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002971 (= res!672442 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002972 () Bool)

(declare-fun res!672449 () Bool)

(assert (=> b!1002972 (=> (not res!672449) (not e!564963))))

(assert (=> b!1002972 (= res!672449 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86542 res!672450) b!1002964))

(assert (= (and b!1002964 res!672436) b!1002965))

(assert (= (and b!1002965 res!672445) b!1002972))

(assert (= (and b!1002972 res!672449) b!1002971))

(assert (= (and b!1002971 res!672442) b!1002960))

(assert (= (and b!1002960 res!672439) b!1002959))

(assert (= (and b!1002959 res!672440) b!1002967))

(assert (= (and b!1002967 res!672438) b!1002963))

(assert (= (and b!1002963 res!672444) b!1002958))

(assert (= (and b!1002958 res!672437) b!1002970))

(assert (= (and b!1002970 res!672446) b!1002966))

(assert (= (and b!1002966 res!672443) b!1002961))

(assert (= (and b!1002961 res!672441) b!1002962))

(assert (= (and b!1002962 res!672447) b!1002969))

(assert (= (and b!1002969 res!672435) b!1002957))

(assert (= (and b!1002957 res!672448) b!1002968))

(declare-fun m!928749 () Bool)

(assert (=> b!1002961 m!928749))

(declare-fun m!928751 () Bool)

(assert (=> b!1002968 m!928751))

(declare-fun m!928753 () Bool)

(assert (=> b!1002971 m!928753))

(declare-fun m!928755 () Bool)

(assert (=> start!86542 m!928755))

(declare-fun m!928757 () Bool)

(assert (=> start!86542 m!928757))

(declare-fun m!928759 () Bool)

(assert (=> b!1002969 m!928759))

(declare-fun m!928761 () Bool)

(assert (=> b!1002960 m!928761))

(declare-fun m!928763 () Bool)

(assert (=> b!1002967 m!928763))

(declare-fun m!928765 () Bool)

(assert (=> b!1002957 m!928765))

(assert (=> b!1002957 m!928765))

(declare-fun m!928767 () Bool)

(assert (=> b!1002957 m!928767))

(declare-fun m!928769 () Bool)

(assert (=> b!1002972 m!928769))

(declare-fun m!928771 () Bool)

(assert (=> b!1002966 m!928771))

(assert (=> b!1002966 m!928771))

(declare-fun m!928773 () Bool)

(assert (=> b!1002966 m!928773))

(declare-fun m!928775 () Bool)

(assert (=> b!1002966 m!928775))

(declare-fun m!928777 () Bool)

(assert (=> b!1002966 m!928777))

(assert (=> b!1002965 m!928765))

(assert (=> b!1002965 m!928765))

(declare-fun m!928779 () Bool)

(assert (=> b!1002965 m!928779))

(assert (=> b!1002958 m!928765))

(assert (=> b!1002958 m!928765))

(declare-fun m!928781 () Bool)

(assert (=> b!1002958 m!928781))

(assert (=> b!1002958 m!928781))

(assert (=> b!1002958 m!928765))

(declare-fun m!928783 () Bool)

(assert (=> b!1002958 m!928783))

(assert (=> b!1002970 m!928765))

(assert (=> b!1002970 m!928765))

(declare-fun m!928785 () Bool)

(assert (=> b!1002970 m!928785))

(declare-fun m!928787 () Bool)

(assert (=> b!1002959 m!928787))

(check-sat (not b!1002972) (not b!1002957) (not b!1002966) (not b!1002958) (not b!1002969) (not b!1002968) (not b!1002959) (not b!1002971) (not start!86542) (not b!1002967) (not b!1002970) (not b!1002960) (not b!1002965) (not b!1002961))
(check-sat)
