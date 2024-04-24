; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64128 () Bool)

(assert start!64128)

(declare-fun b!719864 () Bool)

(declare-fun res!482114 () Bool)

(declare-fun e!403957 () Bool)

(assert (=> b!719864 (=> (not res!482114) (not e!403957))))

(declare-datatypes ((array!40756 0))(
  ( (array!40757 (arr!19501 (Array (_ BitVec 32) (_ BitVec 64))) (size!19921 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40756)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719864 (= res!482114 (and (= (size!19921 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19921 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19921 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719865 () Bool)

(declare-fun e!403959 () Bool)

(assert (=> b!719865 (= e!403959 false)))

(declare-datatypes ((SeekEntryResult!7057 0))(
  ( (MissingZero!7057 (index!30596 (_ BitVec 32))) (Found!7057 (index!30597 (_ BitVec 32))) (Intermediate!7057 (undefined!7869 Bool) (index!30598 (_ BitVec 32)) (x!61755 (_ BitVec 32))) (Undefined!7057) (MissingVacant!7057 (index!30599 (_ BitVec 32))) )
))
(declare-fun lt!319743 () SeekEntryResult!7057)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40756 (_ BitVec 32)) SeekEntryResult!7057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719865 (= lt!319743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19501 a!3186) j!159) mask!3328) (select (arr!19501 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719866 () Bool)

(assert (=> b!719866 (= e!403957 e!403959)))

(declare-fun res!482116 () Bool)

(assert (=> b!719866 (=> (not res!482116) (not e!403959))))

(declare-fun lt!319742 () SeekEntryResult!7057)

(assert (=> b!719866 (= res!482116 (or (= lt!319742 (MissingZero!7057 i!1173)) (= lt!319742 (MissingVacant!7057 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40756 (_ BitVec 32)) SeekEntryResult!7057)

(assert (=> b!719866 (= lt!319742 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719867 () Bool)

(declare-fun res!482109 () Bool)

(assert (=> b!719867 (=> (not res!482109) (not e!403957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719867 (= res!482109 (validKeyInArray!0 (select (arr!19501 a!3186) j!159)))))

(declare-fun b!719868 () Bool)

(declare-fun res!482113 () Bool)

(assert (=> b!719868 (=> (not res!482113) (not e!403959))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719868 (= res!482113 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19921 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19921 a!3186))))))

(declare-fun res!482111 () Bool)

(assert (=> start!64128 (=> (not res!482111) (not e!403957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64128 (= res!482111 (validMask!0 mask!3328))))

(assert (=> start!64128 e!403957))

(assert (=> start!64128 true))

(declare-fun array_inv!15360 (array!40756) Bool)

(assert (=> start!64128 (array_inv!15360 a!3186)))

(declare-fun b!719869 () Bool)

(declare-fun res!482110 () Bool)

(assert (=> b!719869 (=> (not res!482110) (not e!403957))))

(declare-fun arrayContainsKey!0 (array!40756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719869 (= res!482110 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719870 () Bool)

(declare-fun res!482115 () Bool)

(assert (=> b!719870 (=> (not res!482115) (not e!403957))))

(assert (=> b!719870 (= res!482115 (validKeyInArray!0 k0!2102))))

(declare-fun b!719871 () Bool)

(declare-fun res!482108 () Bool)

(assert (=> b!719871 (=> (not res!482108) (not e!403959))))

(declare-datatypes ((List!13410 0))(
  ( (Nil!13407) (Cons!13406 (h!14457 (_ BitVec 64)) (t!19717 List!13410)) )
))
(declare-fun arrayNoDuplicates!0 (array!40756 (_ BitVec 32) List!13410) Bool)

(assert (=> b!719871 (= res!482108 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13407))))

(declare-fun b!719872 () Bool)

(declare-fun res!482112 () Bool)

(assert (=> b!719872 (=> (not res!482112) (not e!403959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40756 (_ BitVec 32)) Bool)

(assert (=> b!719872 (= res!482112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64128 res!482111) b!719864))

(assert (= (and b!719864 res!482114) b!719867))

(assert (= (and b!719867 res!482109) b!719870))

(assert (= (and b!719870 res!482115) b!719869))

(assert (= (and b!719869 res!482110) b!719866))

(assert (= (and b!719866 res!482116) b!719872))

(assert (= (and b!719872 res!482112) b!719871))

(assert (= (and b!719871 res!482108) b!719868))

(assert (= (and b!719868 res!482113) b!719865))

(declare-fun m!675771 () Bool)

(assert (=> start!64128 m!675771))

(declare-fun m!675773 () Bool)

(assert (=> start!64128 m!675773))

(declare-fun m!675775 () Bool)

(assert (=> b!719870 m!675775))

(declare-fun m!675777 () Bool)

(assert (=> b!719871 m!675777))

(declare-fun m!675779 () Bool)

(assert (=> b!719869 m!675779))

(declare-fun m!675781 () Bool)

(assert (=> b!719872 m!675781))

(declare-fun m!675783 () Bool)

(assert (=> b!719867 m!675783))

(assert (=> b!719867 m!675783))

(declare-fun m!675785 () Bool)

(assert (=> b!719867 m!675785))

(assert (=> b!719865 m!675783))

(assert (=> b!719865 m!675783))

(declare-fun m!675787 () Bool)

(assert (=> b!719865 m!675787))

(assert (=> b!719865 m!675787))

(assert (=> b!719865 m!675783))

(declare-fun m!675789 () Bool)

(assert (=> b!719865 m!675789))

(declare-fun m!675791 () Bool)

(assert (=> b!719866 m!675791))

(check-sat (not b!719866) (not b!719870) (not b!719869) (not start!64128) (not b!719872) (not b!719871) (not b!719867) (not b!719865))
(check-sat)
