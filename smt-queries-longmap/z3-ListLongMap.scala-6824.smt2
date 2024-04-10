; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85894 () Bool)

(assert start!85894)

(declare-datatypes ((array!62983 0))(
  ( (array!62984 (arr!30326 (Array (_ BitVec 32) (_ BitVec 64))) (size!30828 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62983)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun e!561792 () Bool)

(declare-fun b!995564 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!995564 (= e!561792 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30828 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30828 a!3219)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!995565 () Bool)

(declare-fun res!665861 () Bool)

(assert (=> b!995565 (=> (not res!665861) (not e!561792))))

(declare-datatypes ((List!21002 0))(
  ( (Nil!20999) (Cons!20998 (h!22160 (_ BitVec 64)) (t!30003 List!21002)) )
))
(declare-fun arrayNoDuplicates!0 (array!62983 (_ BitVec 32) List!21002) Bool)

(assert (=> b!995565 (= res!665861 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20999))))

(declare-fun b!995566 () Bool)

(declare-fun res!665855 () Bool)

(declare-fun e!561793 () Bool)

(assert (=> b!995566 (=> (not res!665855) (not e!561793))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995566 (= res!665855 (and (= (size!30828 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30828 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30828 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665859 () Bool)

(assert (=> start!85894 (=> (not res!665859) (not e!561793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85894 (= res!665859 (validMask!0 mask!3464))))

(assert (=> start!85894 e!561793))

(declare-fun array_inv!23450 (array!62983) Bool)

(assert (=> start!85894 (array_inv!23450 a!3219)))

(assert (=> start!85894 true))

(declare-fun b!995567 () Bool)

(assert (=> b!995567 (= e!561793 e!561792)))

(declare-fun res!665858 () Bool)

(assert (=> b!995567 (=> (not res!665858) (not e!561792))))

(declare-datatypes ((SeekEntryResult!9258 0))(
  ( (MissingZero!9258 (index!39403 (_ BitVec 32))) (Found!9258 (index!39404 (_ BitVec 32))) (Intermediate!9258 (undefined!10070 Bool) (index!39405 (_ BitVec 32)) (x!86843 (_ BitVec 32))) (Undefined!9258) (MissingVacant!9258 (index!39406 (_ BitVec 32))) )
))
(declare-fun lt!440993 () SeekEntryResult!9258)

(assert (=> b!995567 (= res!665858 (or (= lt!440993 (MissingVacant!9258 i!1194)) (= lt!440993 (MissingZero!9258 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62983 (_ BitVec 32)) SeekEntryResult!9258)

(assert (=> b!995567 (= lt!440993 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995568 () Bool)

(declare-fun res!665860 () Bool)

(assert (=> b!995568 (=> (not res!665860) (not e!561793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995568 (= res!665860 (validKeyInArray!0 k0!2224))))

(declare-fun b!995569 () Bool)

(declare-fun res!665862 () Bool)

(assert (=> b!995569 (=> (not res!665862) (not e!561793))))

(declare-fun arrayContainsKey!0 (array!62983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995569 (= res!665862 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995570 () Bool)

(declare-fun res!665857 () Bool)

(assert (=> b!995570 (=> (not res!665857) (not e!561793))))

(assert (=> b!995570 (= res!665857 (validKeyInArray!0 (select (arr!30326 a!3219) j!170)))))

(declare-fun b!995571 () Bool)

(declare-fun res!665856 () Bool)

(assert (=> b!995571 (=> (not res!665856) (not e!561792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62983 (_ BitVec 32)) Bool)

(assert (=> b!995571 (= res!665856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!85894 res!665859) b!995566))

(assert (= (and b!995566 res!665855) b!995570))

(assert (= (and b!995570 res!665857) b!995568))

(assert (= (and b!995568 res!665860) b!995569))

(assert (= (and b!995569 res!665862) b!995567))

(assert (= (and b!995567 res!665858) b!995571))

(assert (= (and b!995571 res!665856) b!995565))

(assert (= (and b!995565 res!665861) b!995564))

(declare-fun m!922943 () Bool)

(assert (=> b!995569 m!922943))

(declare-fun m!922945 () Bool)

(assert (=> b!995571 m!922945))

(declare-fun m!922947 () Bool)

(assert (=> b!995565 m!922947))

(declare-fun m!922949 () Bool)

(assert (=> b!995570 m!922949))

(assert (=> b!995570 m!922949))

(declare-fun m!922951 () Bool)

(assert (=> b!995570 m!922951))

(declare-fun m!922953 () Bool)

(assert (=> start!85894 m!922953))

(declare-fun m!922955 () Bool)

(assert (=> start!85894 m!922955))

(declare-fun m!922957 () Bool)

(assert (=> b!995568 m!922957))

(declare-fun m!922959 () Bool)

(assert (=> b!995567 m!922959))

(check-sat (not b!995565) (not b!995569) (not b!995567) (not b!995571) (not b!995570) (not start!85894) (not b!995568))
(check-sat)
