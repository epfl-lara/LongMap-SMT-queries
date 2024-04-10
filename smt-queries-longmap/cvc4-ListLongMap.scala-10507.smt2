; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123802 () Bool)

(assert start!123802)

(declare-fun res!968137 () Bool)

(declare-fun e!809836 () Bool)

(assert (=> start!123802 (=> (not res!968137) (not e!809836))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123802 (= res!968137 (validMask!0 mask!2608))))

(assert (=> start!123802 e!809836))

(assert (=> start!123802 true))

(declare-datatypes ((array!97603 0))(
  ( (array!97604 (arr!47104 (Array (_ BitVec 32) (_ BitVec 64))) (size!47654 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97603)

(declare-fun array_inv!36132 (array!97603) Bool)

(assert (=> start!123802 (array_inv!36132 a!2831)))

(declare-fun b!1434894 () Bool)

(declare-fun res!968138 () Bool)

(declare-fun e!809831 () Bool)

(assert (=> b!1434894 (=> (not res!968138) (not e!809831))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434894 (= res!968138 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun lt!631657 () array!97603)

(declare-fun lt!631654 () (_ BitVec 32))

(declare-fun b!1434895 () Bool)

(declare-fun lt!631658 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11383 0))(
  ( (MissingZero!11383 (index!47924 (_ BitVec 32))) (Found!11383 (index!47925 (_ BitVec 32))) (Intermediate!11383 (undefined!12195 Bool) (index!47926 (_ BitVec 32)) (x!129580 (_ BitVec 32))) (Undefined!11383) (MissingVacant!11383 (index!47927 (_ BitVec 32))) )
))
(declare-fun lt!631656 () SeekEntryResult!11383)

(declare-fun e!809832 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97603 (_ BitVec 32)) SeekEntryResult!11383)

(assert (=> b!1434895 (= e!809832 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631654 lt!631658 lt!631657 mask!2608) lt!631656))))

(declare-fun b!1434896 () Bool)

(declare-fun res!968152 () Bool)

(assert (=> b!1434896 (=> (not res!968152) (not e!809831))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434896 (= res!968152 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631658 lt!631657 mask!2608) lt!631656))))

(declare-fun b!1434897 () Bool)

(declare-fun e!809833 () Bool)

(assert (=> b!1434897 (= e!809836 e!809833)))

(declare-fun res!968145 () Bool)

(assert (=> b!1434897 (=> (not res!968145) (not e!809833))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!631659 () SeekEntryResult!11383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434897 (= res!968145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631659))))

(assert (=> b!1434897 (= lt!631659 (Intermediate!11383 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434898 () Bool)

(declare-fun e!809835 () Bool)

(assert (=> b!1434898 (= e!809831 (not e!809835))))

(declare-fun res!968143 () Bool)

(assert (=> b!1434898 (=> res!968143 e!809835)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434898 (= res!968143 (or (= (select (arr!47104 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47104 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47104 a!2831) index!585) (select (arr!47104 a!2831) j!81)) (= (select (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809834 () Bool)

(assert (=> b!1434898 e!809834))

(declare-fun res!968141 () Bool)

(assert (=> b!1434898 (=> (not res!968141) (not e!809834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97603 (_ BitVec 32)) Bool)

(assert (=> b!1434898 (= res!968141 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48512 0))(
  ( (Unit!48513) )
))
(declare-fun lt!631655 () Unit!48512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48512)

(assert (=> b!1434898 (= lt!631655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434899 () Bool)

(declare-fun res!968139 () Bool)

(assert (=> b!1434899 (=> (not res!968139) (not e!809836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434899 (= res!968139 (validKeyInArray!0 (select (arr!47104 a!2831) i!982)))))

(declare-fun b!1434900 () Bool)

(declare-fun res!968142 () Bool)

(assert (=> b!1434900 (=> (not res!968142) (not e!809836))))

(assert (=> b!1434900 (= res!968142 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47654 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47654 a!2831))))))

(declare-fun b!1434901 () Bool)

(declare-fun res!968150 () Bool)

(assert (=> b!1434901 (=> (not res!968150) (not e!809836))))

(declare-datatypes ((List!33614 0))(
  ( (Nil!33611) (Cons!33610 (h!34942 (_ BitVec 64)) (t!48308 List!33614)) )
))
(declare-fun arrayNoDuplicates!0 (array!97603 (_ BitVec 32) List!33614) Bool)

(assert (=> b!1434901 (= res!968150 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33611))))

(declare-fun b!1434902 () Bool)

(declare-fun res!968144 () Bool)

(assert (=> b!1434902 (=> (not res!968144) (not e!809831))))

(assert (=> b!1434902 (= res!968144 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631659))))

(declare-fun b!1434903 () Bool)

(declare-fun res!968151 () Bool)

(assert (=> b!1434903 (=> (not res!968151) (not e!809836))))

(assert (=> b!1434903 (= res!968151 (validKeyInArray!0 (select (arr!47104 a!2831) j!81)))))

(declare-fun b!1434904 () Bool)

(assert (=> b!1434904 (= e!809833 e!809831)))

(declare-fun res!968148 () Bool)

(assert (=> b!1434904 (=> (not res!968148) (not e!809831))))

(assert (=> b!1434904 (= res!968148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631658 mask!2608) lt!631658 lt!631657 mask!2608) lt!631656))))

(assert (=> b!1434904 (= lt!631656 (Intermediate!11383 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434904 (= lt!631658 (select (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434904 (= lt!631657 (array!97604 (store (arr!47104 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47654 a!2831)))))

(declare-fun b!1434905 () Bool)

(declare-fun res!968146 () Bool)

(assert (=> b!1434905 (=> res!968146 e!809832)))

(assert (=> b!1434905 (= res!968146 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631654 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631659)))))

(declare-fun b!1434906 () Bool)

(declare-fun res!968149 () Bool)

(assert (=> b!1434906 (=> (not res!968149) (not e!809836))))

(assert (=> b!1434906 (= res!968149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434907 () Bool)

(assert (=> b!1434907 (= e!809835 e!809832)))

(declare-fun res!968147 () Bool)

(assert (=> b!1434907 (=> res!968147 e!809832)))

(assert (=> b!1434907 (= res!968147 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631654 #b00000000000000000000000000000000) (bvsge lt!631654 (size!47654 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434907 (= lt!631654 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434908 () Bool)

(declare-fun res!968140 () Bool)

(assert (=> b!1434908 (=> (not res!968140) (not e!809836))))

(assert (=> b!1434908 (= res!968140 (and (= (size!47654 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47654 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47654 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434909 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97603 (_ BitVec 32)) SeekEntryResult!11383)

(assert (=> b!1434909 (= e!809834 (= (seekEntryOrOpen!0 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) (Found!11383 j!81)))))

(assert (= (and start!123802 res!968137) b!1434908))

(assert (= (and b!1434908 res!968140) b!1434899))

(assert (= (and b!1434899 res!968139) b!1434903))

(assert (= (and b!1434903 res!968151) b!1434906))

(assert (= (and b!1434906 res!968149) b!1434901))

(assert (= (and b!1434901 res!968150) b!1434900))

(assert (= (and b!1434900 res!968142) b!1434897))

(assert (= (and b!1434897 res!968145) b!1434904))

(assert (= (and b!1434904 res!968148) b!1434902))

(assert (= (and b!1434902 res!968144) b!1434896))

(assert (= (and b!1434896 res!968152) b!1434894))

(assert (= (and b!1434894 res!968138) b!1434898))

(assert (= (and b!1434898 res!968141) b!1434909))

(assert (= (and b!1434898 (not res!968143)) b!1434907))

(assert (= (and b!1434907 (not res!968147)) b!1434905))

(assert (= (and b!1434905 (not res!968146)) b!1434895))

(declare-fun m!1324389 () Bool)

(assert (=> b!1434909 m!1324389))

(assert (=> b!1434909 m!1324389))

(declare-fun m!1324391 () Bool)

(assert (=> b!1434909 m!1324391))

(declare-fun m!1324393 () Bool)

(assert (=> b!1434906 m!1324393))

(declare-fun m!1324395 () Bool)

(assert (=> b!1434901 m!1324395))

(assert (=> b!1434902 m!1324389))

(assert (=> b!1434902 m!1324389))

(declare-fun m!1324397 () Bool)

(assert (=> b!1434902 m!1324397))

(assert (=> b!1434905 m!1324389))

(assert (=> b!1434905 m!1324389))

(declare-fun m!1324399 () Bool)

(assert (=> b!1434905 m!1324399))

(declare-fun m!1324401 () Bool)

(assert (=> b!1434904 m!1324401))

(assert (=> b!1434904 m!1324401))

(declare-fun m!1324403 () Bool)

(assert (=> b!1434904 m!1324403))

(declare-fun m!1324405 () Bool)

(assert (=> b!1434904 m!1324405))

(declare-fun m!1324407 () Bool)

(assert (=> b!1434904 m!1324407))

(declare-fun m!1324409 () Bool)

(assert (=> start!123802 m!1324409))

(declare-fun m!1324411 () Bool)

(assert (=> start!123802 m!1324411))

(assert (=> b!1434898 m!1324405))

(declare-fun m!1324413 () Bool)

(assert (=> b!1434898 m!1324413))

(declare-fun m!1324415 () Bool)

(assert (=> b!1434898 m!1324415))

(declare-fun m!1324417 () Bool)

(assert (=> b!1434898 m!1324417))

(assert (=> b!1434898 m!1324389))

(declare-fun m!1324419 () Bool)

(assert (=> b!1434898 m!1324419))

(assert (=> b!1434903 m!1324389))

(assert (=> b!1434903 m!1324389))

(declare-fun m!1324421 () Bool)

(assert (=> b!1434903 m!1324421))

(declare-fun m!1324423 () Bool)

(assert (=> b!1434907 m!1324423))

(declare-fun m!1324425 () Bool)

(assert (=> b!1434899 m!1324425))

(assert (=> b!1434899 m!1324425))

(declare-fun m!1324427 () Bool)

(assert (=> b!1434899 m!1324427))

(assert (=> b!1434897 m!1324389))

(assert (=> b!1434897 m!1324389))

(declare-fun m!1324429 () Bool)

(assert (=> b!1434897 m!1324429))

(assert (=> b!1434897 m!1324429))

(assert (=> b!1434897 m!1324389))

(declare-fun m!1324431 () Bool)

(assert (=> b!1434897 m!1324431))

(declare-fun m!1324433 () Bool)

(assert (=> b!1434896 m!1324433))

(declare-fun m!1324435 () Bool)

(assert (=> b!1434895 m!1324435))

(push 1)

(assert (not b!1434896))

(assert (not b!1434902))

(assert (not b!1434909))

(assert (not b!1434905))

(assert (not b!1434906))

(assert (not start!123802))

(assert (not b!1434901))

(assert (not b!1434903))

(assert (not b!1434899))

(assert (not b!1434907))

(assert (not b!1434904))

(assert (not b!1434895))

(assert (not b!1434897))

(assert (not b!1434898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154297 () Bool)

(declare-fun lt!631682 () SeekEntryResult!11383)

(assert (=> d!154297 (and (or (is-Undefined!11383 lt!631682) (not (is-Found!11383 lt!631682)) (and (bvsge (index!47925 lt!631682) #b00000000000000000000000000000000) (bvslt (index!47925 lt!631682) (size!47654 a!2831)))) (or (is-Undefined!11383 lt!631682) (is-Found!11383 lt!631682) (not (is-MissingZero!11383 lt!631682)) (and (bvsge (index!47924 lt!631682) #b00000000000000000000000000000000) (bvslt (index!47924 lt!631682) (size!47654 a!2831)))) (or (is-Undefined!11383 lt!631682) (is-Found!11383 lt!631682) (is-MissingZero!11383 lt!631682) (not (is-MissingVacant!11383 lt!631682)) (and (bvsge (index!47927 lt!631682) #b00000000000000000000000000000000) (bvslt (index!47927 lt!631682) (size!47654 a!2831)))) (or (is-Undefined!11383 lt!631682) (ite (is-Found!11383 lt!631682) (= (select (arr!47104 a!2831) (index!47925 lt!631682)) (select (arr!47104 a!2831) j!81)) (ite (is-MissingZero!11383 lt!631682) (= (select (arr!47104 a!2831) (index!47924 lt!631682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11383 lt!631682) (= (select (arr!47104 a!2831) (index!47927 lt!631682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809884 () SeekEntryResult!11383)

(assert (=> d!154297 (= lt!631682 e!809884)))

(declare-fun c!132905 () Bool)

(declare-fun lt!631680 () SeekEntryResult!11383)

(assert (=> d!154297 (= c!132905 (and (is-Intermediate!11383 lt!631680) (undefined!12195 lt!631680)))))

(assert (=> d!154297 (= lt!631680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154297 (validMask!0 mask!2608)))

(assert (=> d!154297 (= (seekEntryOrOpen!0 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631682)))

(declare-fun b!1434981 () Bool)

(declare-fun e!809882 () SeekEntryResult!11383)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97603 (_ BitVec 32)) SeekEntryResult!11383)

(assert (=> b!1434981 (= e!809882 (seekKeyOrZeroReturnVacant!0 (x!129580 lt!631680) (index!47926 lt!631680) (index!47926 lt!631680) (select (arr!47104 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434982 () Bool)

(assert (=> b!1434982 (= e!809884 Undefined!11383)))

(declare-fun b!1434983 () Bool)

(declare-fun c!132903 () Bool)

(declare-fun lt!631681 () (_ BitVec 64))

(assert (=> b!1434983 (= c!132903 (= lt!631681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809883 () SeekEntryResult!11383)

(assert (=> b!1434983 (= e!809883 e!809882)))

(declare-fun b!1434984 () Bool)

(assert (=> b!1434984 (= e!809884 e!809883)))

(assert (=> b!1434984 (= lt!631681 (select (arr!47104 a!2831) (index!47926 lt!631680)))))

(declare-fun c!132904 () Bool)

(assert (=> b!1434984 (= c!132904 (= lt!631681 (select (arr!47104 a!2831) j!81)))))

(declare-fun b!1434985 () Bool)

(assert (=> b!1434985 (= e!809882 (MissingZero!11383 (index!47926 lt!631680)))))

(declare-fun b!1434986 () Bool)

(assert (=> b!1434986 (= e!809883 (Found!11383 (index!47926 lt!631680)))))

(assert (= (and d!154297 c!132905) b!1434982))

(assert (= (and d!154297 (not c!132905)) b!1434984))

(assert (= (and b!1434984 c!132904) b!1434986))

(assert (= (and b!1434984 (not c!132904)) b!1434983))

(assert (= (and b!1434983 c!132903) b!1434985))

(assert (= (and b!1434983 (not c!132903)) b!1434981))

(declare-fun m!1324459 () Bool)

(assert (=> d!154297 m!1324459))

(assert (=> d!154297 m!1324389))

(assert (=> d!154297 m!1324429))

(declare-fun m!1324461 () Bool)

(assert (=> d!154297 m!1324461))

(assert (=> d!154297 m!1324429))

(assert (=> d!154297 m!1324389))

(assert (=> d!154297 m!1324431))

(assert (=> d!154297 m!1324409))

(declare-fun m!1324463 () Bool)

(assert (=> d!154297 m!1324463))

(assert (=> b!1434981 m!1324389))

(declare-fun m!1324465 () Bool)

(assert (=> b!1434981 m!1324465))

(declare-fun m!1324467 () Bool)

(assert (=> b!1434984 m!1324467))

(assert (=> b!1434909 d!154297))

(declare-fun d!154305 () Bool)

(declare-fun res!968184 () Bool)

(declare-fun e!809894 () Bool)

(assert (=> d!154305 (=> res!968184 e!809894)))

(assert (=> d!154305 (= res!968184 (bvsge j!81 (size!47654 a!2831)))))

(assert (=> d!154305 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809894)))

(declare-fun call!67549 () Bool)

(declare-fun bm!67546 () Bool)

(assert (=> bm!67546 (= call!67549 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434999 () Bool)

(declare-fun e!809895 () Bool)

(assert (=> b!1434999 (= e!809895 call!67549)))

(declare-fun b!1435000 () Bool)

(declare-fun e!809896 () Bool)

(assert (=> b!1435000 (= e!809894 e!809896)))

(declare-fun c!132909 () Bool)

(assert (=> b!1435000 (= c!132909 (validKeyInArray!0 (select (arr!47104 a!2831) j!81)))))

(declare-fun b!1435001 () Bool)

(assert (=> b!1435001 (= e!809896 e!809895)))

(declare-fun lt!631697 () (_ BitVec 64))

(assert (=> b!1435001 (= lt!631697 (select (arr!47104 a!2831) j!81))))

(declare-fun lt!631696 () Unit!48512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97603 (_ BitVec 64) (_ BitVec 32)) Unit!48512)

(assert (=> b!1435001 (= lt!631696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631697 j!81))))

(declare-fun arrayContainsKey!0 (array!97603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435001 (arrayContainsKey!0 a!2831 lt!631697 #b00000000000000000000000000000000)))

(declare-fun lt!631695 () Unit!48512)

(assert (=> b!1435001 (= lt!631695 lt!631696)))

(declare-fun res!968185 () Bool)

(assert (=> b!1435001 (= res!968185 (= (seekEntryOrOpen!0 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) (Found!11383 j!81)))))

(assert (=> b!1435001 (=> (not res!968185) (not e!809895))))

(declare-fun b!1435002 () Bool)

(assert (=> b!1435002 (= e!809896 call!67549)))

(assert (= (and d!154305 (not res!968184)) b!1435000))

(assert (= (and b!1435000 c!132909) b!1435001))

(assert (= (and b!1435000 (not c!132909)) b!1435002))

(assert (= (and b!1435001 res!968185) b!1434999))

(assert (= (or b!1434999 b!1435002) bm!67546))

(declare-fun m!1324477 () Bool)

(assert (=> bm!67546 m!1324477))

(assert (=> b!1435000 m!1324389))

(assert (=> b!1435000 m!1324389))

(assert (=> b!1435000 m!1324421))

(assert (=> b!1435001 m!1324389))

(declare-fun m!1324479 () Bool)

(assert (=> b!1435001 m!1324479))

(declare-fun m!1324481 () Bool)

(assert (=> b!1435001 m!1324481))

(assert (=> b!1435001 m!1324389))

(assert (=> b!1435001 m!1324391))

(assert (=> b!1434898 d!154305))

(declare-fun d!154313 () Bool)

(assert (=> d!154313 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631700 () Unit!48512)

(declare-fun choose!38 (array!97603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48512)

(assert (=> d!154313 (= lt!631700 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154313 (validMask!0 mask!2608)))

(assert (=> d!154313 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631700)))

(declare-fun bs!41772 () Bool)

(assert (= bs!41772 d!154313))

(assert (=> bs!41772 m!1324417))

(declare-fun m!1324483 () Bool)

(assert (=> bs!41772 m!1324483))

(assert (=> bs!41772 m!1324409))

(assert (=> b!1434898 d!154313))

(declare-fun d!154315 () Bool)

(assert (=> d!154315 (= (validKeyInArray!0 (select (arr!47104 a!2831) i!982)) (and (not (= (select (arr!47104 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47104 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434899 d!154315))

(declare-fun b!1435042 () Bool)

(declare-fun lt!631723 () SeekEntryResult!11383)

(assert (=> b!1435042 (and (bvsge (index!47926 lt!631723) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631723) (size!47654 a!2831)))))

(declare-fun res!968201 () Bool)

(assert (=> b!1435042 (= res!968201 (= (select (arr!47104 a!2831) (index!47926 lt!631723)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809923 () Bool)

(assert (=> b!1435042 (=> res!968201 e!809923)))

(declare-fun b!1435043 () Bool)

(assert (=> b!1435043 (and (bvsge (index!47926 lt!631723) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631723) (size!47654 a!2831)))))

(assert (=> b!1435043 (= e!809923 (= (select (arr!47104 a!2831) (index!47926 lt!631723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809921 () SeekEntryResult!11383)

(declare-fun b!1435044 () Bool)

(assert (=> b!1435044 (= e!809921 (Intermediate!11383 false (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435045 () Bool)

(declare-fun e!809925 () Bool)

(assert (=> b!1435045 (= e!809925 (bvsge (x!129580 lt!631723) #b01111111111111111111111111111110))))

(declare-fun b!1435047 () Bool)

(declare-fun e!809924 () Bool)

(assert (=> b!1435047 (= e!809925 e!809924)))

(declare-fun res!968203 () Bool)

(assert (=> b!1435047 (= res!968203 (and (is-Intermediate!11383 lt!631723) (not (undefined!12195 lt!631723)) (bvslt (x!129580 lt!631723) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631723) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631723) #b00000000000000000000000000000000)))))

(assert (=> b!1435047 (=> (not res!968203) (not e!809924))))

(declare-fun b!1435048 () Bool)

(declare-fun e!809922 () SeekEntryResult!11383)

(assert (=> b!1435048 (= e!809922 e!809921)))

(declare-fun c!132924 () Bool)

(declare-fun lt!631722 () (_ BitVec 64))

(assert (=> b!1435048 (= c!132924 (or (= lt!631722 (select (arr!47104 a!2831) j!81)) (= (bvadd lt!631722 lt!631722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435049 () Bool)

(assert (=> b!1435049 (= e!809922 (Intermediate!11383 true (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435050 () Bool)

(assert (=> b!1435050 (= e!809921 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435046 () Bool)

(assert (=> b!1435046 (and (bvsge (index!47926 lt!631723) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631723) (size!47654 a!2831)))))

(declare-fun res!968202 () Bool)

(assert (=> b!1435046 (= res!968202 (= (select (arr!47104 a!2831) (index!47926 lt!631723)) (select (arr!47104 a!2831) j!81)))))

(assert (=> b!1435046 (=> res!968202 e!809923)))

(assert (=> b!1435046 (= e!809924 e!809923)))

(declare-fun d!154317 () Bool)

(assert (=> d!154317 e!809925))

(declare-fun c!132923 () Bool)

(assert (=> d!154317 (= c!132923 (and (is-Intermediate!11383 lt!631723) (undefined!12195 lt!631723)))))

(assert (=> d!154317 (= lt!631723 e!809922)))

(declare-fun c!132922 () Bool)

(assert (=> d!154317 (= c!132922 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154317 (= lt!631722 (select (arr!47104 a!2831) (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608)))))

(assert (=> d!154317 (validMask!0 mask!2608)))

(assert (=> d!154317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631723)))

(assert (= (and d!154317 c!132922) b!1435049))

(assert (= (and d!154317 (not c!132922)) b!1435048))

(assert (= (and b!1435048 c!132924) b!1435044))

(assert (= (and b!1435048 (not c!132924)) b!1435050))

(assert (= (and d!154317 c!132923) b!1435045))

(assert (= (and d!154317 (not c!132923)) b!1435047))

(assert (= (and b!1435047 res!968203) b!1435046))

(assert (= (and b!1435046 (not res!968202)) b!1435042))

(assert (= (and b!1435042 (not res!968201)) b!1435043))

(declare-fun m!1324501 () Bool)

(assert (=> b!1435046 m!1324501))

(assert (=> b!1435050 m!1324429))

(declare-fun m!1324503 () Bool)

(assert (=> b!1435050 m!1324503))

(assert (=> b!1435050 m!1324503))

(assert (=> b!1435050 m!1324389))

(declare-fun m!1324505 () Bool)

(assert (=> b!1435050 m!1324505))

(assert (=> b!1435042 m!1324501))

(assert (=> d!154317 m!1324429))

(declare-fun m!1324507 () Bool)

(assert (=> d!154317 m!1324507))

(assert (=> d!154317 m!1324409))

(assert (=> b!1435043 m!1324501))

(assert (=> b!1434897 d!154317))

(declare-fun d!154339 () Bool)

(declare-fun lt!631738 () (_ BitVec 32))

(declare-fun lt!631737 () (_ BitVec 32))

(assert (=> d!154339 (= lt!631738 (bvmul (bvxor lt!631737 (bvlshr lt!631737 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154339 (= lt!631737 ((_ extract 31 0) (bvand (bvxor (select (arr!47104 a!2831) j!81) (bvlshr (select (arr!47104 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154339 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968204 (let ((h!34943 ((_ extract 31 0) (bvand (bvxor (select (arr!47104 a!2831) j!81) (bvlshr (select (arr!47104 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129584 (bvmul (bvxor h!34943 (bvlshr h!34943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129584 (bvlshr x!129584 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968204 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968204 #b00000000000000000000000000000000))))))

(assert (=> d!154339 (= (toIndex!0 (select (arr!47104 a!2831) j!81) mask!2608) (bvand (bvxor lt!631738 (bvlshr lt!631738 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434897 d!154339))

(declare-fun d!154341 () Bool)

(declare-fun res!968205 () Bool)

(declare-fun e!809935 () Bool)

(assert (=> d!154341 (=> res!968205 e!809935)))

(assert (=> d!154341 (= res!968205 (bvsge #b00000000000000000000000000000000 (size!47654 a!2831)))))

(assert (=> d!154341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809935)))

(declare-fun bm!67550 () Bool)

(declare-fun call!67553 () Bool)

(assert (=> bm!67550 (= call!67553 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1435069 () Bool)

(declare-fun e!809936 () Bool)

(assert (=> b!1435069 (= e!809936 call!67553)))

(declare-fun b!1435070 () Bool)

(declare-fun e!809937 () Bool)

(assert (=> b!1435070 (= e!809935 e!809937)))

(declare-fun c!132934 () Bool)

(assert (=> b!1435070 (= c!132934 (validKeyInArray!0 (select (arr!47104 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435071 () Bool)

(assert (=> b!1435071 (= e!809937 e!809936)))

(declare-fun lt!631741 () (_ BitVec 64))

(assert (=> b!1435071 (= lt!631741 (select (arr!47104 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631740 () Unit!48512)

(assert (=> b!1435071 (= lt!631740 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631741 #b00000000000000000000000000000000))))

(assert (=> b!1435071 (arrayContainsKey!0 a!2831 lt!631741 #b00000000000000000000000000000000)))

(declare-fun lt!631739 () Unit!48512)

(assert (=> b!1435071 (= lt!631739 lt!631740)))

(declare-fun res!968206 () Bool)

(assert (=> b!1435071 (= res!968206 (= (seekEntryOrOpen!0 (select (arr!47104 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11383 #b00000000000000000000000000000000)))))

(assert (=> b!1435071 (=> (not res!968206) (not e!809936))))

(declare-fun b!1435072 () Bool)

(assert (=> b!1435072 (= e!809937 call!67553)))

(assert (= (and d!154341 (not res!968205)) b!1435070))

(assert (= (and b!1435070 c!132934) b!1435071))

(assert (= (and b!1435070 (not c!132934)) b!1435072))

(assert (= (and b!1435071 res!968206) b!1435069))

(assert (= (or b!1435069 b!1435072) bm!67550))

(declare-fun m!1324519 () Bool)

(assert (=> bm!67550 m!1324519))

(declare-fun m!1324521 () Bool)

(assert (=> b!1435070 m!1324521))

(assert (=> b!1435070 m!1324521))

(declare-fun m!1324523 () Bool)

(assert (=> b!1435070 m!1324523))

(assert (=> b!1435071 m!1324521))

(declare-fun m!1324525 () Bool)

(assert (=> b!1435071 m!1324525))

(declare-fun m!1324527 () Bool)

(assert (=> b!1435071 m!1324527))

(assert (=> b!1435071 m!1324521))

(declare-fun m!1324529 () Bool)

(assert (=> b!1435071 m!1324529))

(assert (=> b!1434906 d!154341))

(declare-fun d!154345 () Bool)

(declare-fun lt!631746 () (_ BitVec 32))

(assert (=> d!154345 (and (bvsge lt!631746 #b00000000000000000000000000000000) (bvslt lt!631746 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154345 (= lt!631746 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154345 (validMask!0 mask!2608)))

(assert (=> d!154345 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631746)))

(declare-fun bs!41775 () Bool)

(assert (= bs!41775 d!154345))

(declare-fun m!1324539 () Bool)

(assert (=> bs!41775 m!1324539))

(assert (=> bs!41775 m!1324409))

(assert (=> b!1434907 d!154345))

(declare-fun b!1435082 () Bool)

(declare-fun lt!631748 () SeekEntryResult!11383)

(assert (=> b!1435082 (and (bvsge (index!47926 lt!631748) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631748) (size!47654 lt!631657)))))

(declare-fun res!968211 () Bool)

(assert (=> b!1435082 (= res!968211 (= (select (arr!47104 lt!631657) (index!47926 lt!631748)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809945 () Bool)

(assert (=> b!1435082 (=> res!968211 e!809945)))

(declare-fun b!1435083 () Bool)

(assert (=> b!1435083 (and (bvsge (index!47926 lt!631748) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631748) (size!47654 lt!631657)))))

(assert (=> b!1435083 (= e!809945 (= (select (arr!47104 lt!631657) (index!47926 lt!631748)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435084 () Bool)

(declare-fun e!809943 () SeekEntryResult!11383)

(assert (=> b!1435084 (= e!809943 (Intermediate!11383 false index!585 x!605))))

(declare-fun b!1435085 () Bool)

(declare-fun e!809947 () Bool)

(assert (=> b!1435085 (= e!809947 (bvsge (x!129580 lt!631748) #b01111111111111111111111111111110))))

(declare-fun b!1435087 () Bool)

(declare-fun e!809946 () Bool)

(assert (=> b!1435087 (= e!809947 e!809946)))

(declare-fun res!968213 () Bool)

(assert (=> b!1435087 (= res!968213 (and (is-Intermediate!11383 lt!631748) (not (undefined!12195 lt!631748)) (bvslt (x!129580 lt!631748) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631748) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631748) x!605)))))

(assert (=> b!1435087 (=> (not res!968213) (not e!809946))))

(declare-fun b!1435088 () Bool)

(declare-fun e!809944 () SeekEntryResult!11383)

(assert (=> b!1435088 (= e!809944 e!809943)))

(declare-fun c!132940 () Bool)

(declare-fun lt!631747 () (_ BitVec 64))

(assert (=> b!1435088 (= c!132940 (or (= lt!631747 lt!631658) (= (bvadd lt!631747 lt!631747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435089 () Bool)

(assert (=> b!1435089 (= e!809944 (Intermediate!11383 true index!585 x!605))))

(declare-fun b!1435090 () Bool)

(assert (=> b!1435090 (= e!809943 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631658 lt!631657 mask!2608))))

(declare-fun b!1435086 () Bool)

(assert (=> b!1435086 (and (bvsge (index!47926 lt!631748) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631748) (size!47654 lt!631657)))))

(declare-fun res!968212 () Bool)

(assert (=> b!1435086 (= res!968212 (= (select (arr!47104 lt!631657) (index!47926 lt!631748)) lt!631658))))

(assert (=> b!1435086 (=> res!968212 e!809945)))

(assert (=> b!1435086 (= e!809946 e!809945)))

(declare-fun d!154349 () Bool)

(assert (=> d!154349 e!809947))

(declare-fun c!132939 () Bool)

(assert (=> d!154349 (= c!132939 (and (is-Intermediate!11383 lt!631748) (undefined!12195 lt!631748)))))

(assert (=> d!154349 (= lt!631748 e!809944)))

(declare-fun c!132938 () Bool)

(assert (=> d!154349 (= c!132938 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154349 (= lt!631747 (select (arr!47104 lt!631657) index!585))))

(assert (=> d!154349 (validMask!0 mask!2608)))

(assert (=> d!154349 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631658 lt!631657 mask!2608) lt!631748)))

(assert (= (and d!154349 c!132938) b!1435089))

(assert (= (and d!154349 (not c!132938)) b!1435088))

(assert (= (and b!1435088 c!132940) b!1435084))

(assert (= (and b!1435088 (not c!132940)) b!1435090))

(assert (= (and d!154349 c!132939) b!1435085))

(assert (= (and d!154349 (not c!132939)) b!1435087))

(assert (= (and b!1435087 res!968213) b!1435086))

(assert (= (and b!1435086 (not res!968212)) b!1435082))

(assert (= (and b!1435082 (not res!968211)) b!1435083))

(declare-fun m!1324541 () Bool)

(assert (=> b!1435086 m!1324541))

(assert (=> b!1435090 m!1324423))

(assert (=> b!1435090 m!1324423))

(declare-fun m!1324543 () Bool)

(assert (=> b!1435090 m!1324543))

(assert (=> b!1435082 m!1324541))

(declare-fun m!1324545 () Bool)

(assert (=> d!154349 m!1324545))

(assert (=> d!154349 m!1324409))

(assert (=> b!1435083 m!1324541))

(assert (=> b!1434896 d!154349))

(declare-fun b!1435099 () Bool)

(declare-fun lt!631754 () SeekEntryResult!11383)

(assert (=> b!1435099 (and (bvsge (index!47926 lt!631754) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631754) (size!47654 a!2831)))))

(declare-fun res!968214 () Bool)

(assert (=> b!1435099 (= res!968214 (= (select (arr!47104 a!2831) (index!47926 lt!631754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809954 () Bool)

(assert (=> b!1435099 (=> res!968214 e!809954)))

(declare-fun b!1435100 () Bool)

(assert (=> b!1435100 (and (bvsge (index!47926 lt!631754) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631754) (size!47654 a!2831)))))

(assert (=> b!1435100 (= e!809954 (= (select (arr!47104 a!2831) (index!47926 lt!631754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435101 () Bool)

(declare-fun e!809952 () SeekEntryResult!11383)

(assert (=> b!1435101 (= e!809952 (Intermediate!11383 false lt!631654 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435102 () Bool)

(declare-fun e!809956 () Bool)

(assert (=> b!1435102 (= e!809956 (bvsge (x!129580 lt!631754) #b01111111111111111111111111111110))))

(declare-fun b!1435104 () Bool)

(declare-fun e!809955 () Bool)

(assert (=> b!1435104 (= e!809956 e!809955)))

(declare-fun res!968216 () Bool)

(assert (=> b!1435104 (= res!968216 (and (is-Intermediate!11383 lt!631754) (not (undefined!12195 lt!631754)) (bvslt (x!129580 lt!631754) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631754) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631754) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435104 (=> (not res!968216) (not e!809955))))

(declare-fun b!1435105 () Bool)

(declare-fun e!809953 () SeekEntryResult!11383)

(assert (=> b!1435105 (= e!809953 e!809952)))

(declare-fun lt!631753 () (_ BitVec 64))

(declare-fun c!132947 () Bool)

(assert (=> b!1435105 (= c!132947 (or (= lt!631753 (select (arr!47104 a!2831) j!81)) (= (bvadd lt!631753 lt!631753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435106 () Bool)

(assert (=> b!1435106 (= e!809953 (Intermediate!11383 true lt!631654 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435107 () Bool)

(assert (=> b!1435107 (= e!809952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631654 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435103 () Bool)

(assert (=> b!1435103 (and (bvsge (index!47926 lt!631754) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631754) (size!47654 a!2831)))))

(declare-fun res!968215 () Bool)

(assert (=> b!1435103 (= res!968215 (= (select (arr!47104 a!2831) (index!47926 lt!631754)) (select (arr!47104 a!2831) j!81)))))

(assert (=> b!1435103 (=> res!968215 e!809954)))

(assert (=> b!1435103 (= e!809955 e!809954)))

(declare-fun d!154351 () Bool)

(assert (=> d!154351 e!809956))

(declare-fun c!132946 () Bool)

(assert (=> d!154351 (= c!132946 (and (is-Intermediate!11383 lt!631754) (undefined!12195 lt!631754)))))

(assert (=> d!154351 (= lt!631754 e!809953)))

(declare-fun c!132945 () Bool)

(assert (=> d!154351 (= c!132945 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154351 (= lt!631753 (select (arr!47104 a!2831) lt!631654))))

(assert (=> d!154351 (validMask!0 mask!2608)))

(assert (=> d!154351 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631654 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631754)))

(assert (= (and d!154351 c!132945) b!1435106))

(assert (= (and d!154351 (not c!132945)) b!1435105))

(assert (= (and b!1435105 c!132947) b!1435101))

(assert (= (and b!1435105 (not c!132947)) b!1435107))

(assert (= (and d!154351 c!132946) b!1435102))

(assert (= (and d!154351 (not c!132946)) b!1435104))

(assert (= (and b!1435104 res!968216) b!1435103))

(assert (= (and b!1435103 (not res!968215)) b!1435099))

(assert (= (and b!1435099 (not res!968214)) b!1435100))

(declare-fun m!1324547 () Bool)

(assert (=> b!1435103 m!1324547))

(declare-fun m!1324549 () Bool)

(assert (=> b!1435107 m!1324549))

(assert (=> b!1435107 m!1324549))

(assert (=> b!1435107 m!1324389))

(declare-fun m!1324551 () Bool)

(assert (=> b!1435107 m!1324551))

(assert (=> b!1435099 m!1324547))

(declare-fun m!1324553 () Bool)

(assert (=> d!154351 m!1324553))

(assert (=> d!154351 m!1324409))

(assert (=> b!1435100 m!1324547))

(assert (=> b!1434905 d!154351))

(declare-fun b!1435112 () Bool)

(declare-fun lt!631760 () SeekEntryResult!11383)

(assert (=> b!1435112 (and (bvsge (index!47926 lt!631760) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631760) (size!47654 lt!631657)))))

(declare-fun res!968219 () Bool)

(assert (=> b!1435112 (= res!968219 (= (select (arr!47104 lt!631657) (index!47926 lt!631760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809963 () Bool)

(assert (=> b!1435112 (=> res!968219 e!809963)))

(declare-fun b!1435113 () Bool)

(assert (=> b!1435113 (and (bvsge (index!47926 lt!631760) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631760) (size!47654 lt!631657)))))

(assert (=> b!1435113 (= e!809963 (= (select (arr!47104 lt!631657) (index!47926 lt!631760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435114 () Bool)

(declare-fun e!809961 () SeekEntryResult!11383)

(assert (=> b!1435114 (= e!809961 (Intermediate!11383 false lt!631654 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435115 () Bool)

(declare-fun e!809965 () Bool)

(assert (=> b!1435115 (= e!809965 (bvsge (x!129580 lt!631760) #b01111111111111111111111111111110))))

(declare-fun b!1435117 () Bool)

(declare-fun e!809964 () Bool)

(assert (=> b!1435117 (= e!809965 e!809964)))

(declare-fun res!968221 () Bool)

(assert (=> b!1435117 (= res!968221 (and (is-Intermediate!11383 lt!631760) (not (undefined!12195 lt!631760)) (bvslt (x!129580 lt!631760) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631760) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631760) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435117 (=> (not res!968221) (not e!809964))))

(declare-fun b!1435118 () Bool)

(declare-fun e!809962 () SeekEntryResult!11383)

(assert (=> b!1435118 (= e!809962 e!809961)))

(declare-fun c!132952 () Bool)

(declare-fun lt!631759 () (_ BitVec 64))

(assert (=> b!1435118 (= c!132952 (or (= lt!631759 lt!631658) (= (bvadd lt!631759 lt!631759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435120 () Bool)

(assert (=> b!1435120 (= e!809962 (Intermediate!11383 true lt!631654 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435121 () Bool)

(assert (=> b!1435121 (= e!809961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631654 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631658 lt!631657 mask!2608))))

(declare-fun b!1435116 () Bool)

(assert (=> b!1435116 (and (bvsge (index!47926 lt!631760) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631760) (size!47654 lt!631657)))))

(declare-fun res!968220 () Bool)

(assert (=> b!1435116 (= res!968220 (= (select (arr!47104 lt!631657) (index!47926 lt!631760)) lt!631658))))

(assert (=> b!1435116 (=> res!968220 e!809963)))

(assert (=> b!1435116 (= e!809964 e!809963)))

(declare-fun d!154353 () Bool)

(assert (=> d!154353 e!809965))

(declare-fun c!132951 () Bool)

(assert (=> d!154353 (= c!132951 (and (is-Intermediate!11383 lt!631760) (undefined!12195 lt!631760)))))

(assert (=> d!154353 (= lt!631760 e!809962)))

(declare-fun c!132950 () Bool)

(assert (=> d!154353 (= c!132950 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154353 (= lt!631759 (select (arr!47104 lt!631657) lt!631654))))

(assert (=> d!154353 (validMask!0 mask!2608)))

(assert (=> d!154353 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631654 lt!631658 lt!631657 mask!2608) lt!631760)))

(assert (= (and d!154353 c!132950) b!1435120))

(assert (= (and d!154353 (not c!132950)) b!1435118))

(assert (= (and b!1435118 c!132952) b!1435114))

(assert (= (and b!1435118 (not c!132952)) b!1435121))

(assert (= (and d!154353 c!132951) b!1435115))

(assert (= (and d!154353 (not c!132951)) b!1435117))

(assert (= (and b!1435117 res!968221) b!1435116))

(assert (= (and b!1435116 (not res!968220)) b!1435112))

(assert (= (and b!1435112 (not res!968219)) b!1435113))

(declare-fun m!1324555 () Bool)

(assert (=> b!1435116 m!1324555))

(assert (=> b!1435121 m!1324549))

(assert (=> b!1435121 m!1324549))

(declare-fun m!1324557 () Bool)

(assert (=> b!1435121 m!1324557))

(assert (=> b!1435112 m!1324555))

(declare-fun m!1324559 () Bool)

(assert (=> d!154353 m!1324559))

(assert (=> d!154353 m!1324409))

(assert (=> b!1435113 m!1324555))

(assert (=> b!1434895 d!154353))

(declare-fun b!1435131 () Bool)

(declare-fun lt!631767 () SeekEntryResult!11383)

(assert (=> b!1435131 (and (bvsge (index!47926 lt!631767) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631767) (size!47654 lt!631657)))))

(declare-fun res!968228 () Bool)

(assert (=> b!1435131 (= res!968228 (= (select (arr!47104 lt!631657) (index!47926 lt!631767)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809973 () Bool)

(assert (=> b!1435131 (=> res!968228 e!809973)))

(declare-fun b!1435132 () Bool)

(assert (=> b!1435132 (and (bvsge (index!47926 lt!631767) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631767) (size!47654 lt!631657)))))

(assert (=> b!1435132 (= e!809973 (= (select (arr!47104 lt!631657) (index!47926 lt!631767)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435133 () Bool)

(declare-fun e!809971 () SeekEntryResult!11383)

(assert (=> b!1435133 (= e!809971 (Intermediate!11383 false (toIndex!0 lt!631658 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435134 () Bool)

(declare-fun e!809975 () Bool)

(assert (=> b!1435134 (= e!809975 (bvsge (x!129580 lt!631767) #b01111111111111111111111111111110))))

(declare-fun b!1435136 () Bool)

(declare-fun e!809974 () Bool)

(assert (=> b!1435136 (= e!809975 e!809974)))

(declare-fun res!968230 () Bool)

(assert (=> b!1435136 (= res!968230 (and (is-Intermediate!11383 lt!631767) (not (undefined!12195 lt!631767)) (bvslt (x!129580 lt!631767) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631767) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631767) #b00000000000000000000000000000000)))))

(assert (=> b!1435136 (=> (not res!968230) (not e!809974))))

(declare-fun b!1435137 () Bool)

(declare-fun e!809972 () SeekEntryResult!11383)

(assert (=> b!1435137 (= e!809972 e!809971)))

(declare-fun c!132956 () Bool)

(declare-fun lt!631766 () (_ BitVec 64))

(assert (=> b!1435137 (= c!132956 (or (= lt!631766 lt!631658) (= (bvadd lt!631766 lt!631766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435138 () Bool)

(assert (=> b!1435138 (= e!809972 (Intermediate!11383 true (toIndex!0 lt!631658 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435139 () Bool)

(assert (=> b!1435139 (= e!809971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631658 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631658 lt!631657 mask!2608))))

(declare-fun b!1435135 () Bool)

(assert (=> b!1435135 (and (bvsge (index!47926 lt!631767) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631767) (size!47654 lt!631657)))))

(declare-fun res!968229 () Bool)

(assert (=> b!1435135 (= res!968229 (= (select (arr!47104 lt!631657) (index!47926 lt!631767)) lt!631658))))

(assert (=> b!1435135 (=> res!968229 e!809973)))

(assert (=> b!1435135 (= e!809974 e!809973)))

(declare-fun d!154357 () Bool)

(assert (=> d!154357 e!809975))

(declare-fun c!132955 () Bool)

(assert (=> d!154357 (= c!132955 (and (is-Intermediate!11383 lt!631767) (undefined!12195 lt!631767)))))

(assert (=> d!154357 (= lt!631767 e!809972)))

(declare-fun c!132954 () Bool)

(assert (=> d!154357 (= c!132954 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154357 (= lt!631766 (select (arr!47104 lt!631657) (toIndex!0 lt!631658 mask!2608)))))

(assert (=> d!154357 (validMask!0 mask!2608)))

(assert (=> d!154357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631658 mask!2608) lt!631658 lt!631657 mask!2608) lt!631767)))

(assert (= (and d!154357 c!132954) b!1435138))

(assert (= (and d!154357 (not c!132954)) b!1435137))

(assert (= (and b!1435137 c!132956) b!1435133))

(assert (= (and b!1435137 (not c!132956)) b!1435139))

(assert (= (and d!154357 c!132955) b!1435134))

(assert (= (and d!154357 (not c!132955)) b!1435136))

(assert (= (and b!1435136 res!968230) b!1435135))

(assert (= (and b!1435135 (not res!968229)) b!1435131))

(assert (= (and b!1435131 (not res!968228)) b!1435132))

(declare-fun m!1324569 () Bool)

(assert (=> b!1435135 m!1324569))

(assert (=> b!1435139 m!1324401))

(declare-fun m!1324571 () Bool)

(assert (=> b!1435139 m!1324571))

(assert (=> b!1435139 m!1324571))

(declare-fun m!1324573 () Bool)

(assert (=> b!1435139 m!1324573))

(assert (=> b!1435131 m!1324569))

(assert (=> d!154357 m!1324401))

(declare-fun m!1324575 () Bool)

(assert (=> d!154357 m!1324575))

(assert (=> d!154357 m!1324409))

(assert (=> b!1435132 m!1324569))

(assert (=> b!1434904 d!154357))

(declare-fun d!154361 () Bool)

(declare-fun lt!631771 () (_ BitVec 32))

(declare-fun lt!631770 () (_ BitVec 32))

(assert (=> d!154361 (= lt!631771 (bvmul (bvxor lt!631770 (bvlshr lt!631770 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154361 (= lt!631770 ((_ extract 31 0) (bvand (bvxor lt!631658 (bvlshr lt!631658 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154361 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968204 (let ((h!34943 ((_ extract 31 0) (bvand (bvxor lt!631658 (bvlshr lt!631658 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129584 (bvmul (bvxor h!34943 (bvlshr h!34943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129584 (bvlshr x!129584 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968204 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968204 #b00000000000000000000000000000000))))))

(assert (=> d!154361 (= (toIndex!0 lt!631658 mask!2608) (bvand (bvxor lt!631771 (bvlshr lt!631771 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434904 d!154361))

(declare-fun d!154363 () Bool)

(assert (=> d!154363 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123802 d!154363))

(declare-fun d!154377 () Bool)

(assert (=> d!154377 (= (array_inv!36132 a!2831) (bvsge (size!47654 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123802 d!154377))

(declare-fun b!1435185 () Bool)

(declare-fun lt!631791 () SeekEntryResult!11383)

(assert (=> b!1435185 (and (bvsge (index!47926 lt!631791) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631791) (size!47654 a!2831)))))

(declare-fun res!968247 () Bool)

(assert (=> b!1435185 (= res!968247 (= (select (arr!47104 a!2831) (index!47926 lt!631791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810003 () Bool)

(assert (=> b!1435185 (=> res!968247 e!810003)))

(declare-fun b!1435186 () Bool)

(assert (=> b!1435186 (and (bvsge (index!47926 lt!631791) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631791) (size!47654 a!2831)))))

(assert (=> b!1435186 (= e!810003 (= (select (arr!47104 a!2831) (index!47926 lt!631791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435187 () Bool)

(declare-fun e!810001 () SeekEntryResult!11383)

(assert (=> b!1435187 (= e!810001 (Intermediate!11383 false index!585 x!605))))

(declare-fun b!1435188 () Bool)

(declare-fun e!810005 () Bool)

(assert (=> b!1435188 (= e!810005 (bvsge (x!129580 lt!631791) #b01111111111111111111111111111110))))

(declare-fun b!1435190 () Bool)

(declare-fun e!810004 () Bool)

(assert (=> b!1435190 (= e!810005 e!810004)))

(declare-fun res!968249 () Bool)

(assert (=> b!1435190 (= res!968249 (and (is-Intermediate!11383 lt!631791) (not (undefined!12195 lt!631791)) (bvslt (x!129580 lt!631791) #b01111111111111111111111111111110) (bvsge (x!129580 lt!631791) #b00000000000000000000000000000000) (bvsge (x!129580 lt!631791) x!605)))))

(assert (=> b!1435190 (=> (not res!968249) (not e!810004))))

(declare-fun b!1435191 () Bool)

(declare-fun e!810002 () SeekEntryResult!11383)

(assert (=> b!1435191 (= e!810002 e!810001)))

(declare-fun c!132974 () Bool)

(declare-fun lt!631790 () (_ BitVec 64))

(assert (=> b!1435191 (= c!132974 (or (= lt!631790 (select (arr!47104 a!2831) j!81)) (= (bvadd lt!631790 lt!631790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435192 () Bool)

(assert (=> b!1435192 (= e!810002 (Intermediate!11383 true index!585 x!605))))

(declare-fun b!1435193 () Bool)

(assert (=> b!1435193 (= e!810001 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47104 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435189 () Bool)

(assert (=> b!1435189 (and (bvsge (index!47926 lt!631791) #b00000000000000000000000000000000) (bvslt (index!47926 lt!631791) (size!47654 a!2831)))))

(declare-fun res!968248 () Bool)

(assert (=> b!1435189 (= res!968248 (= (select (arr!47104 a!2831) (index!47926 lt!631791)) (select (arr!47104 a!2831) j!81)))))

(assert (=> b!1435189 (=> res!968248 e!810003)))

(assert (=> b!1435189 (= e!810004 e!810003)))

(declare-fun d!154383 () Bool)

(assert (=> d!154383 e!810005))

(declare-fun c!132973 () Bool)

(assert (=> d!154383 (= c!132973 (and (is-Intermediate!11383 lt!631791) (undefined!12195 lt!631791)))))

(assert (=> d!154383 (= lt!631791 e!810002)))

(declare-fun c!132972 () Bool)

(assert (=> d!154383 (= c!132972 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154383 (= lt!631790 (select (arr!47104 a!2831) index!585))))

(assert (=> d!154383 (validMask!0 mask!2608)))

(assert (=> d!154383 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47104 a!2831) j!81) a!2831 mask!2608) lt!631791)))

(assert (= (and d!154383 c!132972) b!1435192))

(assert (= (and d!154383 (not c!132972)) b!1435191))

(assert (= (and b!1435191 c!132974) b!1435187))

(assert (= (and b!1435191 (not c!132974)) b!1435193))

(assert (= (and d!154383 c!132973) b!1435188))

(assert (= (and d!154383 (not c!132973)) b!1435190))

(assert (= (and b!1435190 res!968249) b!1435189))

(assert (= (and b!1435189 (not res!968248)) b!1435185))

(assert (= (and b!1435185 (not res!968247)) b!1435186))

(declare-fun m!1324611 () Bool)

(assert (=> b!1435189 m!1324611))

(assert (=> b!1435193 m!1324423))

(assert (=> b!1435193 m!1324423))

(assert (=> b!1435193 m!1324389))

(declare-fun m!1324613 () Bool)

(assert (=> b!1435193 m!1324613))

(assert (=> b!1435185 m!1324611))

(assert (=> d!154383 m!1324415))

(assert (=> d!154383 m!1324409))

(assert (=> b!1435186 m!1324611))

(assert (=> b!1434902 d!154383))

(declare-fun d!154385 () Bool)

(assert (=> d!154385 (= (validKeyInArray!0 (select (arr!47104 a!2831) j!81)) (and (not (= (select (arr!47104 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47104 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434903 d!154385))

(declare-fun b!1435204 () Bool)

(declare-fun e!810016 () Bool)

(declare-fun e!810015 () Bool)

(assert (=> b!1435204 (= e!810016 e!810015)))

(declare-fun c!132977 () Bool)

(assert (=> b!1435204 (= c!132977 (validKeyInArray!0 (select (arr!47104 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435205 () Bool)

(declare-fun call!67557 () Bool)

(assert (=> b!1435205 (= e!810015 call!67557)))

(declare-fun d!154387 () Bool)

(declare-fun res!968257 () Bool)

(declare-fun e!810014 () Bool)

(assert (=> d!154387 (=> res!968257 e!810014)))

(assert (=> d!154387 (= res!968257 (bvsge #b00000000000000000000000000000000 (size!47654 a!2831)))))

(assert (=> d!154387 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33611) e!810014)))

(declare-fun b!1435206 () Bool)

(assert (=> b!1435206 (= e!810015 call!67557)))

(declare-fun b!1435207 () Bool)

(declare-fun e!810017 () Bool)

(declare-fun contains!9876 (List!33614 (_ BitVec 64)) Bool)

(assert (=> b!1435207 (= e!810017 (contains!9876 Nil!33611 (select (arr!47104 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435208 () Bool)

(assert (=> b!1435208 (= e!810014 e!810016)))

(declare-fun res!968258 () Bool)

(assert (=> b!1435208 (=> (not res!968258) (not e!810016))))

(assert (=> b!1435208 (= res!968258 (not e!810017))))

(declare-fun res!968256 () Bool)

(assert (=> b!1435208 (=> (not res!968256) (not e!810017))))

(assert (=> b!1435208 (= res!968256 (validKeyInArray!0 (select (arr!47104 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67554 () Bool)

(assert (=> bm!67554 (= call!67557 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132977 (Cons!33610 (select (arr!47104 a!2831) #b00000000000000000000000000000000) Nil!33611) Nil!33611)))))

(assert (= (and d!154387 (not res!968257)) b!1435208))

(assert (= (and b!1435208 res!968256) b!1435207))

(assert (= (and b!1435208 res!968258) b!1435204))

(assert (= (and b!1435204 c!132977) b!1435206))

(assert (= (and b!1435204 (not c!132977)) b!1435205))

(assert (= (or b!1435206 b!1435205) bm!67554))

(assert (=> b!1435204 m!1324521))

(assert (=> b!1435204 m!1324521))

(assert (=> b!1435204 m!1324523))

(assert (=> b!1435207 m!1324521))

(assert (=> b!1435207 m!1324521))

(declare-fun m!1324615 () Bool)

(assert (=> b!1435207 m!1324615))

(assert (=> b!1435208 m!1324521))

(assert (=> b!1435208 m!1324521))

(assert (=> b!1435208 m!1324523))

(assert (=> bm!67554 m!1324521))

(declare-fun m!1324617 () Bool)

(assert (=> bm!67554 m!1324617))

(assert (=> b!1434901 d!154387))

(push 1)

(assert (not d!154383))

(assert (not d!154297))

(assert (not b!1435204))

(assert (not b!1435107))

(assert (not b!1435071))

(assert (not b!1435208))

(assert (not b!1435121))

(assert (not b!1435139))

(assert (not d!154313))

(assert (not b!1434981))

(assert (not b!1435090))

(assert (not b!1435207))

(assert (not b!1435001))

(assert (not b!1435000))

(assert (not d!154357))

(assert (not d!154345))

(assert (not d!154317))

(assert (not d!154353))

(assert (not bm!67546))

(assert (not bm!67554))

(assert (not b!1435193))

(assert (not b!1435050))

(assert (not bm!67550))

(assert (not d!154351))

(assert (not d!154349))

(assert (not b!1435070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

