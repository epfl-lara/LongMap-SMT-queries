; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123530 () Bool)

(assert start!123530)

(declare-fun b!1431983 () Bool)

(declare-fun e!808408 () Bool)

(declare-fun e!808409 () Bool)

(assert (=> b!1431983 (= e!808408 (not e!808409))))

(declare-fun res!965860 () Bool)

(assert (=> b!1431983 (=> res!965860 e!808409)))

(declare-datatypes ((array!97502 0))(
  ( (array!97503 (arr!47058 (Array (_ BitVec 32) (_ BitVec 64))) (size!47608 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97502)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1431983 (= res!965860 (or (= (select (arr!47058 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47058 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47058 a!2831) index!585) (select (arr!47058 a!2831) j!81)) (= (select (store (arr!47058 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808404 () Bool)

(assert (=> b!1431983 e!808404))

(declare-fun res!965858 () Bool)

(assert (=> b!1431983 (=> (not res!965858) (not e!808404))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97502 (_ BitVec 32)) Bool)

(assert (=> b!1431983 (= res!965858 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48420 0))(
  ( (Unit!48421) )
))
(declare-fun lt!630398 () Unit!48420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48420)

(assert (=> b!1431983 (= lt!630398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431984 () Bool)

(declare-fun res!965853 () Bool)

(declare-fun e!808407 () Bool)

(assert (=> b!1431984 (=> (not res!965853) (not e!808407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431984 (= res!965853 (validKeyInArray!0 (select (arr!47058 a!2831) j!81)))))

(declare-fun b!1431985 () Bool)

(declare-fun e!808406 () Bool)

(assert (=> b!1431985 (= e!808406 e!808408)))

(declare-fun res!965850 () Bool)

(assert (=> b!1431985 (=> (not res!965850) (not e!808408))))

(declare-fun lt!630397 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11337 0))(
  ( (MissingZero!11337 (index!47740 (_ BitVec 32))) (Found!11337 (index!47741 (_ BitVec 32))) (Intermediate!11337 (undefined!12149 Bool) (index!47742 (_ BitVec 32)) (x!129387 (_ BitVec 32))) (Undefined!11337) (MissingVacant!11337 (index!47743 (_ BitVec 32))) )
))
(declare-fun lt!630399 () SeekEntryResult!11337)

(declare-fun lt!630402 () array!97502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97502 (_ BitVec 32)) SeekEntryResult!11337)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431985 (= res!965850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630397 mask!2608) lt!630397 lt!630402 mask!2608) lt!630399))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431985 (= lt!630399 (Intermediate!11337 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431985 (= lt!630397 (select (store (arr!47058 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431985 (= lt!630402 (array!97503 (store (arr!47058 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47608 a!2831)))))

(declare-fun b!1431986 () Bool)

(declare-fun res!965856 () Bool)

(assert (=> b!1431986 (=> (not res!965856) (not e!808407))))

(assert (=> b!1431986 (= res!965856 (and (= (size!47608 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47608 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47608 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431987 () Bool)

(declare-fun res!965854 () Bool)

(assert (=> b!1431987 (=> (not res!965854) (not e!808407))))

(assert (=> b!1431987 (= res!965854 (validKeyInArray!0 (select (arr!47058 a!2831) i!982)))))

(declare-fun res!965849 () Bool)

(assert (=> start!123530 (=> (not res!965849) (not e!808407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123530 (= res!965849 (validMask!0 mask!2608))))

(assert (=> start!123530 e!808407))

(assert (=> start!123530 true))

(declare-fun array_inv!36086 (array!97502) Bool)

(assert (=> start!123530 (array_inv!36086 a!2831)))

(declare-fun b!1431988 () Bool)

(assert (=> b!1431988 (= e!808407 e!808406)))

(declare-fun res!965857 () Bool)

(assert (=> b!1431988 (=> (not res!965857) (not e!808406))))

(declare-fun lt!630401 () SeekEntryResult!11337)

(assert (=> b!1431988 (= res!965857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47058 a!2831) j!81) mask!2608) (select (arr!47058 a!2831) j!81) a!2831 mask!2608) lt!630401))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431988 (= lt!630401 (Intermediate!11337 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431989 () Bool)

(declare-fun res!965852 () Bool)

(assert (=> b!1431989 (=> (not res!965852) (not e!808407))))

(assert (=> b!1431989 (= res!965852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431990 () Bool)

(declare-fun res!965848 () Bool)

(assert (=> b!1431990 (=> (not res!965848) (not e!808408))))

(assert (=> b!1431990 (= res!965848 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431991 () Bool)

(declare-fun res!965847 () Bool)

(assert (=> b!1431991 (=> (not res!965847) (not e!808407))))

(declare-datatypes ((List!33568 0))(
  ( (Nil!33565) (Cons!33564 (h!34887 (_ BitVec 64)) (t!48262 List!33568)) )
))
(declare-fun arrayNoDuplicates!0 (array!97502 (_ BitVec 32) List!33568) Bool)

(assert (=> b!1431991 (= res!965847 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33565))))

(declare-fun b!1431992 () Bool)

(declare-fun res!965851 () Bool)

(assert (=> b!1431992 (=> (not res!965851) (not e!808408))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1431992 (= res!965851 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630397 lt!630402 mask!2608) lt!630399))))

(declare-fun b!1431993 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97502 (_ BitVec 32)) SeekEntryResult!11337)

(assert (=> b!1431993 (= e!808404 (= (seekEntryOrOpen!0 (select (arr!47058 a!2831) j!81) a!2831 mask!2608) (Found!11337 j!81)))))

(declare-fun b!1431994 () Bool)

(assert (=> b!1431994 (= e!808409 true)))

(declare-fun lt!630400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431994 (= lt!630400 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431995 () Bool)

(declare-fun res!965859 () Bool)

(assert (=> b!1431995 (=> (not res!965859) (not e!808407))))

(assert (=> b!1431995 (= res!965859 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47608 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47608 a!2831))))))

(declare-fun b!1431996 () Bool)

(declare-fun res!965855 () Bool)

(assert (=> b!1431996 (=> (not res!965855) (not e!808408))))

(assert (=> b!1431996 (= res!965855 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47058 a!2831) j!81) a!2831 mask!2608) lt!630401))))

(assert (= (and start!123530 res!965849) b!1431986))

(assert (= (and b!1431986 res!965856) b!1431987))

(assert (= (and b!1431987 res!965854) b!1431984))

(assert (= (and b!1431984 res!965853) b!1431989))

(assert (= (and b!1431989 res!965852) b!1431991))

(assert (= (and b!1431991 res!965847) b!1431995))

(assert (= (and b!1431995 res!965859) b!1431988))

(assert (= (and b!1431988 res!965857) b!1431985))

(assert (= (and b!1431985 res!965850) b!1431996))

(assert (= (and b!1431996 res!965855) b!1431992))

(assert (= (and b!1431992 res!965851) b!1431990))

(assert (= (and b!1431990 res!965848) b!1431983))

(assert (= (and b!1431983 res!965858) b!1431993))

(assert (= (and b!1431983 (not res!965860)) b!1431994))

(declare-fun m!1321769 () Bool)

(assert (=> start!123530 m!1321769))

(declare-fun m!1321771 () Bool)

(assert (=> start!123530 m!1321771))

(declare-fun m!1321773 () Bool)

(assert (=> b!1431993 m!1321773))

(assert (=> b!1431993 m!1321773))

(declare-fun m!1321775 () Bool)

(assert (=> b!1431993 m!1321775))

(declare-fun m!1321777 () Bool)

(assert (=> b!1431983 m!1321777))

(declare-fun m!1321779 () Bool)

(assert (=> b!1431983 m!1321779))

(declare-fun m!1321781 () Bool)

(assert (=> b!1431983 m!1321781))

(declare-fun m!1321783 () Bool)

(assert (=> b!1431983 m!1321783))

(assert (=> b!1431983 m!1321773))

(declare-fun m!1321785 () Bool)

(assert (=> b!1431983 m!1321785))

(declare-fun m!1321787 () Bool)

(assert (=> b!1431985 m!1321787))

(assert (=> b!1431985 m!1321787))

(declare-fun m!1321789 () Bool)

(assert (=> b!1431985 m!1321789))

(assert (=> b!1431985 m!1321777))

(declare-fun m!1321791 () Bool)

(assert (=> b!1431985 m!1321791))

(declare-fun m!1321793 () Bool)

(assert (=> b!1431987 m!1321793))

(assert (=> b!1431987 m!1321793))

(declare-fun m!1321795 () Bool)

(assert (=> b!1431987 m!1321795))

(assert (=> b!1431988 m!1321773))

(assert (=> b!1431988 m!1321773))

(declare-fun m!1321797 () Bool)

(assert (=> b!1431988 m!1321797))

(assert (=> b!1431988 m!1321797))

(assert (=> b!1431988 m!1321773))

(declare-fun m!1321799 () Bool)

(assert (=> b!1431988 m!1321799))

(declare-fun m!1321801 () Bool)

(assert (=> b!1431994 m!1321801))

(declare-fun m!1321803 () Bool)

(assert (=> b!1431992 m!1321803))

(assert (=> b!1431984 m!1321773))

(assert (=> b!1431984 m!1321773))

(declare-fun m!1321805 () Bool)

(assert (=> b!1431984 m!1321805))

(declare-fun m!1321807 () Bool)

(assert (=> b!1431989 m!1321807))

(declare-fun m!1321809 () Bool)

(assert (=> b!1431991 m!1321809))

(assert (=> b!1431996 m!1321773))

(assert (=> b!1431996 m!1321773))

(declare-fun m!1321811 () Bool)

(assert (=> b!1431996 m!1321811))

(check-sat (not b!1431985) (not b!1431994) (not b!1431991) (not b!1431993) (not b!1431983) (not b!1431989) (not b!1431984) (not b!1431992) (not b!1431996) (not b!1431988) (not start!123530) (not b!1431987))
(check-sat)
