; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122714 () Bool)

(assert start!122714)

(declare-fun b!1421811 () Bool)

(declare-fun res!957299 () Bool)

(declare-fun e!803868 () Bool)

(assert (=> b!1421811 (=> (not res!957299) (not e!803868))))

(declare-datatypes ((array!97032 0))(
  ( (array!97033 (arr!46834 (Array (_ BitVec 32) (_ BitVec 64))) (size!47386 (_ BitVec 32))) )
))
(declare-fun lt!626255 () array!97032)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11146 0))(
  ( (MissingZero!11146 (index!46976 (_ BitVec 32))) (Found!11146 (index!46977 (_ BitVec 32))) (Intermediate!11146 (undefined!11958 Bool) (index!46978 (_ BitVec 32)) (x!128617 (_ BitVec 32))) (Undefined!11146) (MissingVacant!11146 (index!46979 (_ BitVec 32))) )
))
(declare-fun lt!626251 () SeekEntryResult!11146)

(declare-fun lt!626254 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97032 (_ BitVec 32)) SeekEntryResult!11146)

(assert (=> b!1421811 (= res!957299 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626254 lt!626255 mask!2608) lt!626251))))

(declare-fun b!1421812 () Bool)

(declare-fun res!957300 () Bool)

(declare-fun e!803869 () Bool)

(assert (=> b!1421812 (=> (not res!957300) (not e!803869))))

(declare-fun a!2831 () array!97032)

(declare-datatypes ((List!33422 0))(
  ( (Nil!33419) (Cons!33418 (h!34720 (_ BitVec 64)) (t!48108 List!33422)) )
))
(declare-fun arrayNoDuplicates!0 (array!97032 (_ BitVec 32) List!33422) Bool)

(assert (=> b!1421812 (= res!957300 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33419))))

(declare-fun b!1421813 () Bool)

(declare-fun res!957297 () Bool)

(assert (=> b!1421813 (=> (not res!957297) (not e!803868))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421813 (= res!957297 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421814 () Bool)

(declare-fun res!957307 () Bool)

(assert (=> b!1421814 (=> (not res!957307) (not e!803869))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421814 (= res!957307 (validKeyInArray!0 (select (arr!46834 a!2831) j!81)))))

(declare-fun b!1421815 () Bool)

(declare-fun res!957296 () Bool)

(assert (=> b!1421815 (=> (not res!957296) (not e!803869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97032 (_ BitVec 32)) Bool)

(assert (=> b!1421815 (= res!957296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421816 () Bool)

(declare-fun res!957301 () Bool)

(assert (=> b!1421816 (=> (not res!957301) (not e!803869))))

(assert (=> b!1421816 (= res!957301 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47386 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47386 a!2831))))))

(declare-fun b!1421817 () Bool)

(declare-fun e!803867 () Bool)

(assert (=> b!1421817 (= e!803869 e!803867)))

(declare-fun res!957305 () Bool)

(assert (=> b!1421817 (=> (not res!957305) (not e!803867))))

(declare-fun lt!626252 () SeekEntryResult!11146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421817 (= res!957305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46834 a!2831) j!81) mask!2608) (select (arr!46834 a!2831) j!81) a!2831 mask!2608) lt!626252))))

(assert (=> b!1421817 (= lt!626252 (Intermediate!11146 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!957304 () Bool)

(assert (=> start!122714 (=> (not res!957304) (not e!803869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122714 (= res!957304 (validMask!0 mask!2608))))

(assert (=> start!122714 e!803869))

(assert (=> start!122714 true))

(declare-fun array_inv!36067 (array!97032) Bool)

(assert (=> start!122714 (array_inv!36067 a!2831)))

(declare-fun b!1421818 () Bool)

(declare-fun res!957302 () Bool)

(assert (=> b!1421818 (=> (not res!957302) (not e!803869))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421818 (= res!957302 (validKeyInArray!0 (select (arr!46834 a!2831) i!982)))))

(declare-fun b!1421819 () Bool)

(declare-fun res!957306 () Bool)

(assert (=> b!1421819 (=> (not res!957306) (not e!803868))))

(assert (=> b!1421819 (= res!957306 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46834 a!2831) j!81) a!2831 mask!2608) lt!626252))))

(declare-fun b!1421820 () Bool)

(declare-fun e!803870 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97032 (_ BitVec 32)) SeekEntryResult!11146)

(assert (=> b!1421820 (= e!803870 (= (seekEntryOrOpen!0 (select (arr!46834 a!2831) j!81) a!2831 mask!2608) (Found!11146 j!81)))))

(declare-fun b!1421821 () Bool)

(assert (=> b!1421821 (= e!803867 e!803868)))

(declare-fun res!957298 () Bool)

(assert (=> b!1421821 (=> (not res!957298) (not e!803868))))

(assert (=> b!1421821 (= res!957298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626254 mask!2608) lt!626254 lt!626255 mask!2608) lt!626251))))

(assert (=> b!1421821 (= lt!626251 (Intermediate!11146 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421821 (= lt!626254 (select (store (arr!46834 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421821 (= lt!626255 (array!97033 (store (arr!46834 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47386 a!2831)))))

(declare-fun b!1421822 () Bool)

(assert (=> b!1421822 (= e!803868 (not true))))

(assert (=> b!1421822 e!803870))

(declare-fun res!957303 () Bool)

(assert (=> b!1421822 (=> (not res!957303) (not e!803870))))

(assert (=> b!1421822 (= res!957303 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47967 0))(
  ( (Unit!47968) )
))
(declare-fun lt!626253 () Unit!47967)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47967)

(assert (=> b!1421822 (= lt!626253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421823 () Bool)

(declare-fun res!957295 () Bool)

(assert (=> b!1421823 (=> (not res!957295) (not e!803869))))

(assert (=> b!1421823 (= res!957295 (and (= (size!47386 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47386 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47386 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122714 res!957304) b!1421823))

(assert (= (and b!1421823 res!957295) b!1421818))

(assert (= (and b!1421818 res!957302) b!1421814))

(assert (= (and b!1421814 res!957307) b!1421815))

(assert (= (and b!1421815 res!957296) b!1421812))

(assert (= (and b!1421812 res!957300) b!1421816))

(assert (= (and b!1421816 res!957301) b!1421817))

(assert (= (and b!1421817 res!957305) b!1421821))

(assert (= (and b!1421821 res!957298) b!1421819))

(assert (= (and b!1421819 res!957306) b!1421811))

(assert (= (and b!1421811 res!957299) b!1421813))

(assert (= (and b!1421813 res!957297) b!1421822))

(assert (= (and b!1421822 res!957303) b!1421820))

(declare-fun m!1311897 () Bool)

(assert (=> b!1421814 m!1311897))

(assert (=> b!1421814 m!1311897))

(declare-fun m!1311899 () Bool)

(assert (=> b!1421814 m!1311899))

(declare-fun m!1311901 () Bool)

(assert (=> b!1421811 m!1311901))

(declare-fun m!1311903 () Bool)

(assert (=> b!1421812 m!1311903))

(assert (=> b!1421819 m!1311897))

(assert (=> b!1421819 m!1311897))

(declare-fun m!1311905 () Bool)

(assert (=> b!1421819 m!1311905))

(declare-fun m!1311907 () Bool)

(assert (=> b!1421821 m!1311907))

(assert (=> b!1421821 m!1311907))

(declare-fun m!1311909 () Bool)

(assert (=> b!1421821 m!1311909))

(declare-fun m!1311911 () Bool)

(assert (=> b!1421821 m!1311911))

(declare-fun m!1311913 () Bool)

(assert (=> b!1421821 m!1311913))

(assert (=> b!1421820 m!1311897))

(assert (=> b!1421820 m!1311897))

(declare-fun m!1311915 () Bool)

(assert (=> b!1421820 m!1311915))

(declare-fun m!1311917 () Bool)

(assert (=> b!1421815 m!1311917))

(declare-fun m!1311919 () Bool)

(assert (=> b!1421818 m!1311919))

(assert (=> b!1421818 m!1311919))

(declare-fun m!1311921 () Bool)

(assert (=> b!1421818 m!1311921))

(declare-fun m!1311923 () Bool)

(assert (=> start!122714 m!1311923))

(declare-fun m!1311925 () Bool)

(assert (=> start!122714 m!1311925))

(declare-fun m!1311927 () Bool)

(assert (=> b!1421822 m!1311927))

(declare-fun m!1311929 () Bool)

(assert (=> b!1421822 m!1311929))

(assert (=> b!1421817 m!1311897))

(assert (=> b!1421817 m!1311897))

(declare-fun m!1311931 () Bool)

(assert (=> b!1421817 m!1311931))

(assert (=> b!1421817 m!1311931))

(assert (=> b!1421817 m!1311897))

(declare-fun m!1311933 () Bool)

(assert (=> b!1421817 m!1311933))

(check-sat (not b!1421821) (not b!1421814) (not b!1421819) (not b!1421812) (not b!1421822) (not start!122714) (not b!1421815) (not b!1421818) (not b!1421811) (not b!1421817) (not b!1421820))
(check-sat)
