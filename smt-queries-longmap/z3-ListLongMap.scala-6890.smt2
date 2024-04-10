; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86596 () Bool)

(assert start!86596)

(declare-fun b!1004253 () Bool)

(declare-fun e!565528 () Bool)

(assert (=> b!1004253 (= e!565528 false)))

(declare-datatypes ((SeekEntryResult!9456 0))(
  ( (MissingZero!9456 (index!40195 (_ BitVec 32))) (Found!9456 (index!40196 (_ BitVec 32))) (Intermediate!9456 (undefined!10268 Bool) (index!40197 (_ BitVec 32)) (x!87596 (_ BitVec 32))) (Undefined!9456) (MissingVacant!9456 (index!40198 (_ BitVec 32))) )
))
(declare-fun lt!444085 () SeekEntryResult!9456)

(declare-fun lt!444087 () (_ BitVec 32))

(declare-datatypes ((array!63397 0))(
  ( (array!63398 (arr!30524 (Array (_ BitVec 32) (_ BitVec 64))) (size!31026 (_ BitVec 32))) )
))
(declare-fun lt!444084 () array!63397)

(declare-fun lt!444083 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63397 (_ BitVec 32)) SeekEntryResult!9456)

(assert (=> b!1004253 (= lt!444085 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444087 lt!444083 lt!444084 mask!3464))))

(declare-fun b!1004254 () Bool)

(declare-fun res!673742 () Bool)

(assert (=> b!1004254 (=> (not res!673742) (not e!565528))))

(declare-fun a!3219 () array!63397)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!444082 () SeekEntryResult!9456)

(assert (=> b!1004254 (= res!673742 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444087 (select (arr!30524 a!3219) j!170) a!3219 mask!3464) lt!444082))))

(declare-fun b!1004255 () Bool)

(declare-fun e!565525 () Bool)

(declare-fun e!565527 () Bool)

(assert (=> b!1004255 (= e!565525 e!565527)))

(declare-fun res!673741 () Bool)

(assert (=> b!1004255 (=> (not res!673741) (not e!565527))))

(declare-fun lt!444089 () SeekEntryResult!9456)

(assert (=> b!1004255 (= res!673741 (= lt!444089 lt!444082))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004255 (= lt!444082 (Intermediate!9456 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004255 (= lt!444089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30524 a!3219) j!170) mask!3464) (select (arr!30524 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004256 () Bool)

(declare-fun e!565526 () Bool)

(assert (=> b!1004256 (= e!565526 e!565525)))

(declare-fun res!673738 () Bool)

(assert (=> b!1004256 (=> (not res!673738) (not e!565525))))

(declare-fun lt!444088 () SeekEntryResult!9456)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004256 (= res!673738 (or (= lt!444088 (MissingVacant!9456 i!1194)) (= lt!444088 (MissingZero!9456 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63397 (_ BitVec 32)) SeekEntryResult!9456)

(assert (=> b!1004256 (= lt!444088 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004257 () Bool)

(declare-fun res!673746 () Bool)

(assert (=> b!1004257 (=> (not res!673746) (not e!565526))))

(declare-fun arrayContainsKey!0 (array!63397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004257 (= res!673746 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004259 () Bool)

(declare-fun res!673736 () Bool)

(assert (=> b!1004259 (=> (not res!673736) (not e!565526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004259 (= res!673736 (validKeyInArray!0 (select (arr!30524 a!3219) j!170)))))

(declare-fun b!1004260 () Bool)

(declare-fun res!673743 () Bool)

(assert (=> b!1004260 (=> (not res!673743) (not e!565526))))

(assert (=> b!1004260 (= res!673743 (and (= (size!31026 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31026 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31026 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004261 () Bool)

(declare-fun res!673734 () Bool)

(assert (=> b!1004261 (=> (not res!673734) (not e!565525))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1004261 (= res!673734 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31026 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31026 a!3219))))))

(declare-fun b!1004262 () Bool)

(declare-fun e!565530 () Bool)

(assert (=> b!1004262 (= e!565530 e!565528)))

(declare-fun res!673737 () Bool)

(assert (=> b!1004262 (=> (not res!673737) (not e!565528))))

(assert (=> b!1004262 (= res!673737 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444087 #b00000000000000000000000000000000) (bvslt lt!444087 (size!31026 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004262 (= lt!444087 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004263 () Bool)

(declare-fun res!673735 () Bool)

(assert (=> b!1004263 (=> (not res!673735) (not e!565525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63397 (_ BitVec 32)) Bool)

(assert (=> b!1004263 (= res!673735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004264 () Bool)

(declare-fun e!565531 () Bool)

(assert (=> b!1004264 (= e!565531 e!565530)))

(declare-fun res!673739 () Bool)

(assert (=> b!1004264 (=> (not res!673739) (not e!565530))))

(assert (=> b!1004264 (= res!673739 (not (= lt!444089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444083 mask!3464) lt!444083 lt!444084 mask!3464))))))

(assert (=> b!1004264 (= lt!444083 (select (store (arr!30524 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004264 (= lt!444084 (array!63398 (store (arr!30524 a!3219) i!1194 k0!2224) (size!31026 a!3219)))))

(declare-fun b!1004265 () Bool)

(declare-fun res!673731 () Bool)

(assert (=> b!1004265 (=> (not res!673731) (not e!565525))))

(declare-datatypes ((List!21200 0))(
  ( (Nil!21197) (Cons!21196 (h!22373 (_ BitVec 64)) (t!30201 List!21200)) )
))
(declare-fun arrayNoDuplicates!0 (array!63397 (_ BitVec 32) List!21200) Bool)

(assert (=> b!1004265 (= res!673731 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21197))))

(declare-fun b!1004266 () Bool)

(declare-fun res!673732 () Bool)

(assert (=> b!1004266 (=> (not res!673732) (not e!565530))))

(declare-fun lt!444086 () SeekEntryResult!9456)

(assert (=> b!1004266 (= res!673732 (not (= lt!444086 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444083 lt!444084 mask!3464))))))

(declare-fun res!673745 () Bool)

(assert (=> start!86596 (=> (not res!673745) (not e!565526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86596 (= res!673745 (validMask!0 mask!3464))))

(assert (=> start!86596 e!565526))

(declare-fun array_inv!23648 (array!63397) Bool)

(assert (=> start!86596 (array_inv!23648 a!3219)))

(assert (=> start!86596 true))

(declare-fun b!1004258 () Bool)

(declare-fun res!673744 () Bool)

(assert (=> b!1004258 (=> (not res!673744) (not e!565530))))

(assert (=> b!1004258 (= res!673744 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004267 () Bool)

(assert (=> b!1004267 (= e!565527 e!565531)))

(declare-fun res!673733 () Bool)

(assert (=> b!1004267 (=> (not res!673733) (not e!565531))))

(assert (=> b!1004267 (= res!673733 (= lt!444086 lt!444082))))

(assert (=> b!1004267 (= lt!444086 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30524 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004268 () Bool)

(declare-fun res!673740 () Bool)

(assert (=> b!1004268 (=> (not res!673740) (not e!565526))))

(assert (=> b!1004268 (= res!673740 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86596 res!673745) b!1004260))

(assert (= (and b!1004260 res!673743) b!1004259))

(assert (= (and b!1004259 res!673736) b!1004268))

(assert (= (and b!1004268 res!673740) b!1004257))

(assert (= (and b!1004257 res!673746) b!1004256))

(assert (= (and b!1004256 res!673738) b!1004263))

(assert (= (and b!1004263 res!673735) b!1004265))

(assert (= (and b!1004265 res!673731) b!1004261))

(assert (= (and b!1004261 res!673734) b!1004255))

(assert (= (and b!1004255 res!673741) b!1004267))

(assert (= (and b!1004267 res!673733) b!1004264))

(assert (= (and b!1004264 res!673739) b!1004266))

(assert (= (and b!1004266 res!673732) b!1004258))

(assert (= (and b!1004258 res!673744) b!1004262))

(assert (= (and b!1004262 res!673737) b!1004254))

(assert (= (and b!1004254 res!673742) b!1004253))

(declare-fun m!929829 () Bool)

(assert (=> b!1004254 m!929829))

(assert (=> b!1004254 m!929829))

(declare-fun m!929831 () Bool)

(assert (=> b!1004254 m!929831))

(declare-fun m!929833 () Bool)

(assert (=> b!1004264 m!929833))

(assert (=> b!1004264 m!929833))

(declare-fun m!929835 () Bool)

(assert (=> b!1004264 m!929835))

(declare-fun m!929837 () Bool)

(assert (=> b!1004264 m!929837))

(declare-fun m!929839 () Bool)

(assert (=> b!1004264 m!929839))

(declare-fun m!929841 () Bool)

(assert (=> b!1004256 m!929841))

(declare-fun m!929843 () Bool)

(assert (=> b!1004266 m!929843))

(assert (=> b!1004255 m!929829))

(assert (=> b!1004255 m!929829))

(declare-fun m!929845 () Bool)

(assert (=> b!1004255 m!929845))

(assert (=> b!1004255 m!929845))

(assert (=> b!1004255 m!929829))

(declare-fun m!929847 () Bool)

(assert (=> b!1004255 m!929847))

(assert (=> b!1004267 m!929829))

(assert (=> b!1004267 m!929829))

(declare-fun m!929849 () Bool)

(assert (=> b!1004267 m!929849))

(declare-fun m!929851 () Bool)

(assert (=> b!1004257 m!929851))

(declare-fun m!929853 () Bool)

(assert (=> b!1004253 m!929853))

(declare-fun m!929855 () Bool)

(assert (=> b!1004262 m!929855))

(declare-fun m!929857 () Bool)

(assert (=> b!1004263 m!929857))

(declare-fun m!929859 () Bool)

(assert (=> start!86596 m!929859))

(declare-fun m!929861 () Bool)

(assert (=> start!86596 m!929861))

(declare-fun m!929863 () Bool)

(assert (=> b!1004265 m!929863))

(declare-fun m!929865 () Bool)

(assert (=> b!1004268 m!929865))

(assert (=> b!1004259 m!929829))

(assert (=> b!1004259 m!929829))

(declare-fun m!929867 () Bool)

(assert (=> b!1004259 m!929867))

(check-sat (not b!1004262) (not b!1004256) (not b!1004268) (not b!1004266) (not b!1004255) (not b!1004267) (not b!1004265) (not b!1004263) (not b!1004254) (not b!1004257) (not b!1004264) (not start!86596) (not b!1004253) (not b!1004259))
(check-sat)
