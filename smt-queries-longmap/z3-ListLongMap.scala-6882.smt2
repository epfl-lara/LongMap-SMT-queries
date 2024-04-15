; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86538 () Bool)

(assert start!86538)

(declare-fun b!1002835 () Bool)

(declare-fun e!564873 () Bool)

(declare-fun e!564875 () Bool)

(assert (=> b!1002835 (= e!564873 e!564875)))

(declare-fun res!672443 () Bool)

(assert (=> b!1002835 (=> (not res!672443) (not e!564875))))

(declare-datatypes ((SeekEntryResult!9425 0))(
  ( (MissingZero!9425 (index!40071 (_ BitVec 32))) (Found!9425 (index!40072 (_ BitVec 32))) (Intermediate!9425 (undefined!10237 Bool) (index!40073 (_ BitVec 32)) (x!87496 (_ BitVec 32))) (Undefined!9425) (MissingVacant!9425 (index!40074 (_ BitVec 32))) )
))
(declare-fun lt!443253 () SeekEntryResult!9425)

(declare-fun lt!443251 () SeekEntryResult!9425)

(assert (=> b!1002835 (= res!672443 (= lt!443253 lt!443251))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002835 (= lt!443251 (Intermediate!9425 false resIndex!38 resX!38))))

(declare-datatypes ((array!63286 0))(
  ( (array!63287 (arr!30468 (Array (_ BitVec 32) (_ BitVec 64))) (size!30972 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63286)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63286 (_ BitVec 32)) SeekEntryResult!9425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002835 (= lt!443253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30468 a!3219) j!170) mask!3464) (select (arr!30468 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002836 () Bool)

(declare-fun res!672448 () Bool)

(declare-fun e!564870 () Bool)

(assert (=> b!1002836 (=> (not res!672448) (not e!564870))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002836 (= res!672448 (validKeyInArray!0 k0!2224))))

(declare-fun res!672449 () Bool)

(assert (=> start!86538 (=> (not res!672449) (not e!564870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86538 (= res!672449 (validMask!0 mask!3464))))

(assert (=> start!86538 e!564870))

(declare-fun array_inv!23611 (array!63286) Bool)

(assert (=> start!86538 (array_inv!23611 a!3219)))

(assert (=> start!86538 true))

(declare-fun b!1002837 () Bool)

(declare-fun res!672441 () Bool)

(declare-fun e!564874 () Bool)

(assert (=> b!1002837 (=> (not res!672441) (not e!564874))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002837 (= res!672441 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002838 () Bool)

(declare-fun res!672451 () Bool)

(assert (=> b!1002838 (=> (not res!672451) (not e!564873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63286 (_ BitVec 32)) Bool)

(assert (=> b!1002838 (= res!672451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002839 () Bool)

(declare-fun e!564871 () Bool)

(assert (=> b!1002839 (= e!564875 e!564871)))

(declare-fun res!672438 () Bool)

(assert (=> b!1002839 (=> (not res!672438) (not e!564871))))

(declare-fun lt!443250 () SeekEntryResult!9425)

(assert (=> b!1002839 (= res!672438 (= lt!443250 lt!443251))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002839 (= lt!443250 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30468 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002840 () Bool)

(declare-fun res!672439 () Bool)

(assert (=> b!1002840 (=> (not res!672439) (not e!564870))))

(assert (=> b!1002840 (= res!672439 (and (= (size!30972 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30972 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30972 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002841 () Bool)

(declare-fun e!564869 () Bool)

(assert (=> b!1002841 (= e!564869 false)))

(declare-fun lt!443256 () array!63286)

(declare-fun lt!443257 () (_ BitVec 32))

(declare-fun lt!443254 () SeekEntryResult!9425)

(declare-fun lt!443255 () (_ BitVec 64))

(assert (=> b!1002841 (= lt!443254 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443257 lt!443255 lt!443256 mask!3464))))

(declare-fun b!1002842 () Bool)

(declare-fun res!672445 () Bool)

(assert (=> b!1002842 (=> (not res!672445) (not e!564869))))

(assert (=> b!1002842 (= res!672445 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443257 (select (arr!30468 a!3219) j!170) a!3219 mask!3464) lt!443251))))

(declare-fun b!1002843 () Bool)

(assert (=> b!1002843 (= e!564871 e!564874)))

(declare-fun res!672444 () Bool)

(assert (=> b!1002843 (=> (not res!672444) (not e!564874))))

(assert (=> b!1002843 (= res!672444 (not (= lt!443253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443255 mask!3464) lt!443255 lt!443256 mask!3464))))))

(assert (=> b!1002843 (= lt!443255 (select (store (arr!30468 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002843 (= lt!443256 (array!63287 (store (arr!30468 a!3219) i!1194 k0!2224) (size!30972 a!3219)))))

(declare-fun b!1002844 () Bool)

(declare-fun res!672440 () Bool)

(assert (=> b!1002844 (=> (not res!672440) (not e!564873))))

(assert (=> b!1002844 (= res!672440 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30972 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30972 a!3219))))))

(declare-fun b!1002845 () Bool)

(declare-fun res!672442 () Bool)

(assert (=> b!1002845 (=> (not res!672442) (not e!564870))))

(assert (=> b!1002845 (= res!672442 (validKeyInArray!0 (select (arr!30468 a!3219) j!170)))))

(declare-fun b!1002846 () Bool)

(declare-fun res!672447 () Bool)

(assert (=> b!1002846 (=> (not res!672447) (not e!564873))))

(declare-datatypes ((List!21210 0))(
  ( (Nil!21207) (Cons!21206 (h!22383 (_ BitVec 64)) (t!30202 List!21210)) )
))
(declare-fun arrayNoDuplicates!0 (array!63286 (_ BitVec 32) List!21210) Bool)

(assert (=> b!1002846 (= res!672447 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21207))))

(declare-fun b!1002847 () Bool)

(assert (=> b!1002847 (= e!564870 e!564873)))

(declare-fun res!672450 () Bool)

(assert (=> b!1002847 (=> (not res!672450) (not e!564873))))

(declare-fun lt!443252 () SeekEntryResult!9425)

(assert (=> b!1002847 (= res!672450 (or (= lt!443252 (MissingVacant!9425 i!1194)) (= lt!443252 (MissingZero!9425 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63286 (_ BitVec 32)) SeekEntryResult!9425)

(assert (=> b!1002847 (= lt!443252 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002848 () Bool)

(declare-fun res!672446 () Bool)

(assert (=> b!1002848 (=> (not res!672446) (not e!564874))))

(assert (=> b!1002848 (= res!672446 (not (= lt!443250 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443255 lt!443256 mask!3464))))))

(declare-fun b!1002849 () Bool)

(declare-fun res!672452 () Bool)

(assert (=> b!1002849 (=> (not res!672452) (not e!564870))))

(declare-fun arrayContainsKey!0 (array!63286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002849 (= res!672452 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002850 () Bool)

(assert (=> b!1002850 (= e!564874 e!564869)))

(declare-fun res!672437 () Bool)

(assert (=> b!1002850 (=> (not res!672437) (not e!564869))))

(assert (=> b!1002850 (= res!672437 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443257 #b00000000000000000000000000000000) (bvslt lt!443257 (size!30972 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002850 (= lt!443257 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86538 res!672449) b!1002840))

(assert (= (and b!1002840 res!672439) b!1002845))

(assert (= (and b!1002845 res!672442) b!1002836))

(assert (= (and b!1002836 res!672448) b!1002849))

(assert (= (and b!1002849 res!672452) b!1002847))

(assert (= (and b!1002847 res!672450) b!1002838))

(assert (= (and b!1002838 res!672451) b!1002846))

(assert (= (and b!1002846 res!672447) b!1002844))

(assert (= (and b!1002844 res!672440) b!1002835))

(assert (= (and b!1002835 res!672443) b!1002839))

(assert (= (and b!1002839 res!672438) b!1002843))

(assert (= (and b!1002843 res!672444) b!1002848))

(assert (= (and b!1002848 res!672446) b!1002837))

(assert (= (and b!1002837 res!672441) b!1002850))

(assert (= (and b!1002850 res!672437) b!1002842))

(assert (= (and b!1002842 res!672445) b!1002841))

(declare-fun m!928099 () Bool)

(assert (=> b!1002847 m!928099))

(declare-fun m!928101 () Bool)

(assert (=> b!1002849 m!928101))

(declare-fun m!928103 () Bool)

(assert (=> b!1002838 m!928103))

(declare-fun m!928105 () Bool)

(assert (=> b!1002848 m!928105))

(declare-fun m!928107 () Bool)

(assert (=> b!1002839 m!928107))

(assert (=> b!1002839 m!928107))

(declare-fun m!928109 () Bool)

(assert (=> b!1002839 m!928109))

(declare-fun m!928111 () Bool)

(assert (=> start!86538 m!928111))

(declare-fun m!928113 () Bool)

(assert (=> start!86538 m!928113))

(declare-fun m!928115 () Bool)

(assert (=> b!1002843 m!928115))

(assert (=> b!1002843 m!928115))

(declare-fun m!928117 () Bool)

(assert (=> b!1002843 m!928117))

(declare-fun m!928119 () Bool)

(assert (=> b!1002843 m!928119))

(declare-fun m!928121 () Bool)

(assert (=> b!1002843 m!928121))

(assert (=> b!1002845 m!928107))

(assert (=> b!1002845 m!928107))

(declare-fun m!928123 () Bool)

(assert (=> b!1002845 m!928123))

(declare-fun m!928125 () Bool)

(assert (=> b!1002850 m!928125))

(declare-fun m!928127 () Bool)

(assert (=> b!1002841 m!928127))

(assert (=> b!1002842 m!928107))

(assert (=> b!1002842 m!928107))

(declare-fun m!928129 () Bool)

(assert (=> b!1002842 m!928129))

(declare-fun m!928131 () Bool)

(assert (=> b!1002836 m!928131))

(declare-fun m!928133 () Bool)

(assert (=> b!1002846 m!928133))

(assert (=> b!1002835 m!928107))

(assert (=> b!1002835 m!928107))

(declare-fun m!928135 () Bool)

(assert (=> b!1002835 m!928135))

(assert (=> b!1002835 m!928135))

(assert (=> b!1002835 m!928107))

(declare-fun m!928137 () Bool)

(assert (=> b!1002835 m!928137))

(check-sat (not b!1002842) (not b!1002850) (not b!1002838) (not b!1002848) (not b!1002836) (not start!86538) (not b!1002845) (not b!1002846) (not b!1002841) (not b!1002849) (not b!1002839) (not b!1002835) (not b!1002843) (not b!1002847))
(check-sat)
