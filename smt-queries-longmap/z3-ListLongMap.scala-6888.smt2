; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86574 () Bool)

(assert start!86574)

(declare-fun b!1003699 () Bool)

(declare-fun e!565247 () Bool)

(declare-fun e!565248 () Bool)

(assert (=> b!1003699 (= e!565247 e!565248)))

(declare-fun res!673306 () Bool)

(assert (=> b!1003699 (=> (not res!673306) (not e!565248))))

(declare-datatypes ((array!63322 0))(
  ( (array!63323 (arr!30486 (Array (_ BitVec 32) (_ BitVec 64))) (size!30990 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63322)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443684 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003699 (= res!673306 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443684 #b00000000000000000000000000000000) (bvslt lt!443684 (size!30990 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003699 (= lt!443684 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003700 () Bool)

(declare-fun res!673305 () Bool)

(assert (=> b!1003700 (=> (not res!673305) (not e!565247))))

(declare-fun lt!443682 () array!63322)

(declare-datatypes ((SeekEntryResult!9443 0))(
  ( (MissingZero!9443 (index!40143 (_ BitVec 32))) (Found!9443 (index!40144 (_ BitVec 32))) (Intermediate!9443 (undefined!10255 Bool) (index!40145 (_ BitVec 32)) (x!87562 (_ BitVec 32))) (Undefined!9443) (MissingVacant!9443 (index!40146 (_ BitVec 32))) )
))
(declare-fun lt!443689 () SeekEntryResult!9443)

(declare-fun lt!443686 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63322 (_ BitVec 32)) SeekEntryResult!9443)

(assert (=> b!1003700 (= res!673305 (not (= lt!443689 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443686 lt!443682 mask!3464))))))

(declare-fun b!1003701 () Bool)

(declare-fun res!673310 () Bool)

(declare-fun e!565250 () Bool)

(assert (=> b!1003701 (=> (not res!673310) (not e!565250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63322 (_ BitVec 32)) Bool)

(assert (=> b!1003701 (= res!673310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003703 () Bool)

(declare-fun res!673302 () Bool)

(assert (=> b!1003703 (=> (not res!673302) (not e!565248))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443688 () SeekEntryResult!9443)

(assert (=> b!1003703 (= res!673302 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443684 (select (arr!30486 a!3219) j!170) a!3219 mask!3464) lt!443688))))

(declare-fun b!1003704 () Bool)

(declare-fun res!673304 () Bool)

(declare-fun e!565252 () Bool)

(assert (=> b!1003704 (=> (not res!673304) (not e!565252))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003704 (= res!673304 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003705 () Bool)

(declare-fun res!673312 () Bool)

(assert (=> b!1003705 (=> (not res!673312) (not e!565252))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003705 (= res!673312 (and (= (size!30990 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30990 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30990 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003706 () Bool)

(declare-fun res!673311 () Bool)

(assert (=> b!1003706 (=> (not res!673311) (not e!565250))))

(declare-datatypes ((List!21228 0))(
  ( (Nil!21225) (Cons!21224 (h!22401 (_ BitVec 64)) (t!30220 List!21228)) )
))
(declare-fun arrayNoDuplicates!0 (array!63322 (_ BitVec 32) List!21228) Bool)

(assert (=> b!1003706 (= res!673311 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21225))))

(declare-fun b!1003707 () Bool)

(declare-fun e!565249 () Bool)

(assert (=> b!1003707 (= e!565250 e!565249)))

(declare-fun res!673314 () Bool)

(assert (=> b!1003707 (=> (not res!673314) (not e!565249))))

(declare-fun lt!443683 () SeekEntryResult!9443)

(assert (=> b!1003707 (= res!673314 (= lt!443683 lt!443688))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003707 (= lt!443688 (Intermediate!9443 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003707 (= lt!443683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30486 a!3219) j!170) mask!3464) (select (arr!30486 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!673301 () Bool)

(assert (=> start!86574 (=> (not res!673301) (not e!565252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86574 (= res!673301 (validMask!0 mask!3464))))

(assert (=> start!86574 e!565252))

(declare-fun array_inv!23629 (array!63322) Bool)

(assert (=> start!86574 (array_inv!23629 a!3219)))

(assert (=> start!86574 true))

(declare-fun b!1003702 () Bool)

(assert (=> b!1003702 (= e!565252 e!565250)))

(declare-fun res!673303 () Bool)

(assert (=> b!1003702 (=> (not res!673303) (not e!565250))))

(declare-fun lt!443687 () SeekEntryResult!9443)

(assert (=> b!1003702 (= res!673303 (or (= lt!443687 (MissingVacant!9443 i!1194)) (= lt!443687 (MissingZero!9443 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63322 (_ BitVec 32)) SeekEntryResult!9443)

(assert (=> b!1003702 (= lt!443687 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003708 () Bool)

(declare-fun e!565253 () Bool)

(assert (=> b!1003708 (= e!565249 e!565253)))

(declare-fun res!673307 () Bool)

(assert (=> b!1003708 (=> (not res!673307) (not e!565253))))

(assert (=> b!1003708 (= res!673307 (= lt!443689 lt!443688))))

(assert (=> b!1003708 (= lt!443689 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30486 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003709 () Bool)

(assert (=> b!1003709 (= e!565248 false)))

(declare-fun lt!443685 () SeekEntryResult!9443)

(assert (=> b!1003709 (= lt!443685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443684 lt!443686 lt!443682 mask!3464))))

(declare-fun b!1003710 () Bool)

(declare-fun res!673309 () Bool)

(assert (=> b!1003710 (=> (not res!673309) (not e!565250))))

(assert (=> b!1003710 (= res!673309 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30990 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30990 a!3219))))))

(declare-fun b!1003711 () Bool)

(declare-fun res!673308 () Bool)

(assert (=> b!1003711 (=> (not res!673308) (not e!565252))))

(assert (=> b!1003711 (= res!673308 (validKeyInArray!0 (select (arr!30486 a!3219) j!170)))))

(declare-fun b!1003712 () Bool)

(declare-fun res!673313 () Bool)

(assert (=> b!1003712 (=> (not res!673313) (not e!565247))))

(assert (=> b!1003712 (= res!673313 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003713 () Bool)

(declare-fun res!673315 () Bool)

(assert (=> b!1003713 (=> (not res!673315) (not e!565252))))

(declare-fun arrayContainsKey!0 (array!63322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003713 (= res!673315 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003714 () Bool)

(assert (=> b!1003714 (= e!565253 e!565247)))

(declare-fun res!673316 () Bool)

(assert (=> b!1003714 (=> (not res!673316) (not e!565247))))

(assert (=> b!1003714 (= res!673316 (not (= lt!443683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443686 mask!3464) lt!443686 lt!443682 mask!3464))))))

(assert (=> b!1003714 (= lt!443686 (select (store (arr!30486 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003714 (= lt!443682 (array!63323 (store (arr!30486 a!3219) i!1194 k0!2224) (size!30990 a!3219)))))

(assert (= (and start!86574 res!673301) b!1003705))

(assert (= (and b!1003705 res!673312) b!1003711))

(assert (= (and b!1003711 res!673308) b!1003704))

(assert (= (and b!1003704 res!673304) b!1003713))

(assert (= (and b!1003713 res!673315) b!1003702))

(assert (= (and b!1003702 res!673303) b!1003701))

(assert (= (and b!1003701 res!673310) b!1003706))

(assert (= (and b!1003706 res!673311) b!1003710))

(assert (= (and b!1003710 res!673309) b!1003707))

(assert (= (and b!1003707 res!673314) b!1003708))

(assert (= (and b!1003708 res!673307) b!1003714))

(assert (= (and b!1003714 res!673316) b!1003700))

(assert (= (and b!1003700 res!673305) b!1003712))

(assert (= (and b!1003712 res!673313) b!1003699))

(assert (= (and b!1003699 res!673306) b!1003703))

(assert (= (and b!1003703 res!673302) b!1003709))

(declare-fun m!928819 () Bool)

(assert (=> b!1003700 m!928819))

(declare-fun m!928821 () Bool)

(assert (=> b!1003709 m!928821))

(declare-fun m!928823 () Bool)

(assert (=> b!1003711 m!928823))

(assert (=> b!1003711 m!928823))

(declare-fun m!928825 () Bool)

(assert (=> b!1003711 m!928825))

(assert (=> b!1003708 m!928823))

(assert (=> b!1003708 m!928823))

(declare-fun m!928827 () Bool)

(assert (=> b!1003708 m!928827))

(declare-fun m!928829 () Bool)

(assert (=> b!1003701 m!928829))

(declare-fun m!928831 () Bool)

(assert (=> b!1003706 m!928831))

(assert (=> b!1003707 m!928823))

(assert (=> b!1003707 m!928823))

(declare-fun m!928833 () Bool)

(assert (=> b!1003707 m!928833))

(assert (=> b!1003707 m!928833))

(assert (=> b!1003707 m!928823))

(declare-fun m!928835 () Bool)

(assert (=> b!1003707 m!928835))

(declare-fun m!928837 () Bool)

(assert (=> b!1003704 m!928837))

(declare-fun m!928839 () Bool)

(assert (=> b!1003702 m!928839))

(declare-fun m!928841 () Bool)

(assert (=> b!1003699 m!928841))

(declare-fun m!928843 () Bool)

(assert (=> b!1003714 m!928843))

(assert (=> b!1003714 m!928843))

(declare-fun m!928845 () Bool)

(assert (=> b!1003714 m!928845))

(declare-fun m!928847 () Bool)

(assert (=> b!1003714 m!928847))

(declare-fun m!928849 () Bool)

(assert (=> b!1003714 m!928849))

(declare-fun m!928851 () Bool)

(assert (=> b!1003713 m!928851))

(assert (=> b!1003703 m!928823))

(assert (=> b!1003703 m!928823))

(declare-fun m!928853 () Bool)

(assert (=> b!1003703 m!928853))

(declare-fun m!928855 () Bool)

(assert (=> start!86574 m!928855))

(declare-fun m!928857 () Bool)

(assert (=> start!86574 m!928857))

(check-sat (not b!1003703) (not b!1003701) (not b!1003699) (not b!1003711) (not b!1003713) (not b!1003706) (not b!1003702) (not start!86574) (not b!1003704) (not b!1003709) (not b!1003714) (not b!1003708) (not b!1003707) (not b!1003700))
(check-sat)
