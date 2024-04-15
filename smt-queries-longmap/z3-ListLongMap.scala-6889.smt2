; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86580 () Bool)

(assert start!86580)

(declare-fun b!1003843 () Bool)

(declare-fun res!673457 () Bool)

(declare-fun e!565312 () Bool)

(assert (=> b!1003843 (=> (not res!673457) (not e!565312))))

(declare-datatypes ((array!63328 0))(
  ( (array!63329 (arr!30489 (Array (_ BitVec 32) (_ BitVec 64))) (size!30993 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63328)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003843 (= res!673457 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30993 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30993 a!3219))))))

(declare-fun b!1003844 () Bool)

(declare-fun res!673451 () Bool)

(declare-fun e!565314 () Bool)

(assert (=> b!1003844 (=> (not res!673451) (not e!565314))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9446 0))(
  ( (MissingZero!9446 (index!40155 (_ BitVec 32))) (Found!9446 (index!40156 (_ BitVec 32))) (Intermediate!9446 (undefined!10258 Bool) (index!40157 (_ BitVec 32)) (x!87573 (_ BitVec 32))) (Undefined!9446) (MissingVacant!9446 (index!40158 (_ BitVec 32))) )
))
(declare-fun lt!443757 () SeekEntryResult!9446)

(declare-fun lt!443755 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63328 (_ BitVec 32)) SeekEntryResult!9446)

(assert (=> b!1003844 (= res!673451 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443755 (select (arr!30489 a!3219) j!170) a!3219 mask!3464) lt!443757))))

(declare-fun b!1003845 () Bool)

(declare-fun res!673454 () Bool)

(declare-fun e!565313 () Bool)

(assert (=> b!1003845 (=> (not res!673454) (not e!565313))))

(declare-fun lt!443754 () (_ BitVec 64))

(declare-fun lt!443756 () SeekEntryResult!9446)

(declare-fun lt!443758 () array!63328)

(assert (=> b!1003845 (= res!673454 (not (= lt!443756 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443754 lt!443758 mask!3464))))))

(declare-fun b!1003846 () Bool)

(declare-fun res!673448 () Bool)

(assert (=> b!1003846 (=> (not res!673448) (not e!565313))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003846 (= res!673448 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!673445 () Bool)

(declare-fun e!565316 () Bool)

(assert (=> start!86580 (=> (not res!673445) (not e!565316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86580 (= res!673445 (validMask!0 mask!3464))))

(assert (=> start!86580 e!565316))

(declare-fun array_inv!23632 (array!63328) Bool)

(assert (=> start!86580 (array_inv!23632 a!3219)))

(assert (=> start!86580 true))

(declare-fun b!1003847 () Bool)

(declare-fun e!565311 () Bool)

(assert (=> b!1003847 (= e!565311 e!565313)))

(declare-fun res!673456 () Bool)

(assert (=> b!1003847 (=> (not res!673456) (not e!565313))))

(declare-fun lt!443759 () SeekEntryResult!9446)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003847 (= res!673456 (not (= lt!443759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443754 mask!3464) lt!443754 lt!443758 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1003847 (= lt!443754 (select (store (arr!30489 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003847 (= lt!443758 (array!63329 (store (arr!30489 a!3219) i!1194 k0!2224) (size!30993 a!3219)))))

(declare-fun b!1003848 () Bool)

(declare-fun res!673446 () Bool)

(assert (=> b!1003848 (=> (not res!673446) (not e!565316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003848 (= res!673446 (validKeyInArray!0 (select (arr!30489 a!3219) j!170)))))

(declare-fun b!1003849 () Bool)

(declare-fun res!673453 () Bool)

(assert (=> b!1003849 (=> (not res!673453) (not e!565316))))

(assert (=> b!1003849 (= res!673453 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003850 () Bool)

(assert (=> b!1003850 (= e!565314 false)))

(declare-fun lt!443760 () SeekEntryResult!9446)

(assert (=> b!1003850 (= lt!443760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443755 lt!443754 lt!443758 mask!3464))))

(declare-fun b!1003851 () Bool)

(declare-fun res!673449 () Bool)

(assert (=> b!1003851 (=> (not res!673449) (not e!565312))))

(declare-datatypes ((List!21231 0))(
  ( (Nil!21228) (Cons!21227 (h!22404 (_ BitVec 64)) (t!30223 List!21231)) )
))
(declare-fun arrayNoDuplicates!0 (array!63328 (_ BitVec 32) List!21231) Bool)

(assert (=> b!1003851 (= res!673449 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21228))))

(declare-fun b!1003852 () Bool)

(declare-fun res!673447 () Bool)

(assert (=> b!1003852 (=> (not res!673447) (not e!565316))))

(assert (=> b!1003852 (= res!673447 (and (= (size!30993 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30993 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30993 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003853 () Bool)

(assert (=> b!1003853 (= e!565316 e!565312)))

(declare-fun res!673459 () Bool)

(assert (=> b!1003853 (=> (not res!673459) (not e!565312))))

(declare-fun lt!443761 () SeekEntryResult!9446)

(assert (=> b!1003853 (= res!673459 (or (= lt!443761 (MissingVacant!9446 i!1194)) (= lt!443761 (MissingZero!9446 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63328 (_ BitVec 32)) SeekEntryResult!9446)

(assert (=> b!1003853 (= lt!443761 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003854 () Bool)

(declare-fun res!673455 () Bool)

(assert (=> b!1003854 (=> (not res!673455) (not e!565316))))

(declare-fun arrayContainsKey!0 (array!63328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003854 (= res!673455 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003855 () Bool)

(declare-fun e!565315 () Bool)

(assert (=> b!1003855 (= e!565315 e!565311)))

(declare-fun res!673452 () Bool)

(assert (=> b!1003855 (=> (not res!673452) (not e!565311))))

(assert (=> b!1003855 (= res!673452 (= lt!443756 lt!443757))))

(assert (=> b!1003855 (= lt!443756 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30489 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003856 () Bool)

(declare-fun res!673458 () Bool)

(assert (=> b!1003856 (=> (not res!673458) (not e!565312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63328 (_ BitVec 32)) Bool)

(assert (=> b!1003856 (= res!673458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003857 () Bool)

(assert (=> b!1003857 (= e!565313 e!565314)))

(declare-fun res!673450 () Bool)

(assert (=> b!1003857 (=> (not res!673450) (not e!565314))))

(assert (=> b!1003857 (= res!673450 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443755 #b00000000000000000000000000000000) (bvslt lt!443755 (size!30993 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003857 (= lt!443755 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003858 () Bool)

(assert (=> b!1003858 (= e!565312 e!565315)))

(declare-fun res!673460 () Bool)

(assert (=> b!1003858 (=> (not res!673460) (not e!565315))))

(assert (=> b!1003858 (= res!673460 (= lt!443759 lt!443757))))

(assert (=> b!1003858 (= lt!443757 (Intermediate!9446 false resIndex!38 resX!38))))

(assert (=> b!1003858 (= lt!443759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30489 a!3219) j!170) mask!3464) (select (arr!30489 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86580 res!673445) b!1003852))

(assert (= (and b!1003852 res!673447) b!1003848))

(assert (= (and b!1003848 res!673446) b!1003849))

(assert (= (and b!1003849 res!673453) b!1003854))

(assert (= (and b!1003854 res!673455) b!1003853))

(assert (= (and b!1003853 res!673459) b!1003856))

(assert (= (and b!1003856 res!673458) b!1003851))

(assert (= (and b!1003851 res!673449) b!1003843))

(assert (= (and b!1003843 res!673457) b!1003858))

(assert (= (and b!1003858 res!673460) b!1003855))

(assert (= (and b!1003855 res!673452) b!1003847))

(assert (= (and b!1003847 res!673456) b!1003845))

(assert (= (and b!1003845 res!673454) b!1003846))

(assert (= (and b!1003846 res!673448) b!1003857))

(assert (= (and b!1003857 res!673450) b!1003844))

(assert (= (and b!1003844 res!673451) b!1003850))

(declare-fun m!928939 () Bool)

(assert (=> b!1003848 m!928939))

(assert (=> b!1003848 m!928939))

(declare-fun m!928941 () Bool)

(assert (=> b!1003848 m!928941))

(declare-fun m!928943 () Bool)

(assert (=> start!86580 m!928943))

(declare-fun m!928945 () Bool)

(assert (=> start!86580 m!928945))

(declare-fun m!928947 () Bool)

(assert (=> b!1003850 m!928947))

(declare-fun m!928949 () Bool)

(assert (=> b!1003857 m!928949))

(declare-fun m!928951 () Bool)

(assert (=> b!1003845 m!928951))

(assert (=> b!1003858 m!928939))

(assert (=> b!1003858 m!928939))

(declare-fun m!928953 () Bool)

(assert (=> b!1003858 m!928953))

(assert (=> b!1003858 m!928953))

(assert (=> b!1003858 m!928939))

(declare-fun m!928955 () Bool)

(assert (=> b!1003858 m!928955))

(declare-fun m!928957 () Bool)

(assert (=> b!1003856 m!928957))

(assert (=> b!1003855 m!928939))

(assert (=> b!1003855 m!928939))

(declare-fun m!928959 () Bool)

(assert (=> b!1003855 m!928959))

(declare-fun m!928961 () Bool)

(assert (=> b!1003853 m!928961))

(declare-fun m!928963 () Bool)

(assert (=> b!1003851 m!928963))

(declare-fun m!928965 () Bool)

(assert (=> b!1003849 m!928965))

(declare-fun m!928967 () Bool)

(assert (=> b!1003847 m!928967))

(assert (=> b!1003847 m!928967))

(declare-fun m!928969 () Bool)

(assert (=> b!1003847 m!928969))

(declare-fun m!928971 () Bool)

(assert (=> b!1003847 m!928971))

(declare-fun m!928973 () Bool)

(assert (=> b!1003847 m!928973))

(declare-fun m!928975 () Bool)

(assert (=> b!1003854 m!928975))

(assert (=> b!1003844 m!928939))

(assert (=> b!1003844 m!928939))

(declare-fun m!928977 () Bool)

(assert (=> b!1003844 m!928977))

(check-sat (not b!1003850) (not b!1003851) (not b!1003845) (not b!1003856) (not b!1003858) (not b!1003854) (not b!1003849) (not b!1003847) (not start!86580) (not b!1003857) (not b!1003855) (not b!1003844) (not b!1003853) (not b!1003848))
(check-sat)
