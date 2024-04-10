; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85950 () Bool)

(assert start!85950)

(declare-fun b!995894 () Bool)

(declare-fun res!666098 () Bool)

(declare-fun e!561962 () Bool)

(assert (=> b!995894 (=> (not res!666098) (not e!561962))))

(declare-datatypes ((array!63000 0))(
  ( (array!63001 (arr!30333 (Array (_ BitVec 32) (_ BitVec 64))) (size!30835 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63000)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995894 (= res!666098 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995895 () Bool)

(declare-fun res!666102 () Bool)

(assert (=> b!995895 (=> (not res!666102) (not e!561962))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995895 (= res!666102 (validKeyInArray!0 (select (arr!30333 a!3219) j!170)))))

(declare-fun b!995896 () Bool)

(declare-fun e!561964 () Bool)

(assert (=> b!995896 (= e!561962 e!561964)))

(declare-fun res!666100 () Bool)

(assert (=> b!995896 (=> (not res!666100) (not e!561964))))

(declare-datatypes ((SeekEntryResult!9265 0))(
  ( (MissingZero!9265 (index!39431 (_ BitVec 32))) (Found!9265 (index!39432 (_ BitVec 32))) (Intermediate!9265 (undefined!10077 Bool) (index!39433 (_ BitVec 32)) (x!86866 (_ BitVec 32))) (Undefined!9265) (MissingVacant!9265 (index!39434 (_ BitVec 32))) )
))
(declare-fun lt!441076 () SeekEntryResult!9265)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995896 (= res!666100 (or (= lt!441076 (MissingVacant!9265 i!1194)) (= lt!441076 (MissingZero!9265 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63000 (_ BitVec 32)) SeekEntryResult!9265)

(assert (=> b!995896 (= lt!441076 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995897 () Bool)

(declare-fun res!666095 () Bool)

(assert (=> b!995897 (=> (not res!666095) (not e!561964))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995897 (= res!666095 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30835 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30835 a!3219))))))

(declare-fun b!995898 () Bool)

(declare-fun res!666096 () Bool)

(assert (=> b!995898 (=> (not res!666096) (not e!561962))))

(assert (=> b!995898 (= res!666096 (validKeyInArray!0 k!2224))))

(declare-fun b!995899 () Bool)

(declare-fun res!666094 () Bool)

(assert (=> b!995899 (=> (not res!666094) (not e!561964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63000 (_ BitVec 32)) Bool)

(assert (=> b!995899 (= res!666094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!666099 () Bool)

(assert (=> start!85950 (=> (not res!666099) (not e!561962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85950 (= res!666099 (validMask!0 mask!3464))))

(assert (=> start!85950 e!561962))

(declare-fun array_inv!23457 (array!63000) Bool)

(assert (=> start!85950 (array_inv!23457 a!3219)))

(assert (=> start!85950 true))

(declare-fun b!995893 () Bool)

(declare-fun res!666101 () Bool)

(assert (=> b!995893 (=> (not res!666101) (not e!561964))))

(declare-datatypes ((List!21009 0))(
  ( (Nil!21006) (Cons!21005 (h!22167 (_ BitVec 64)) (t!30010 List!21009)) )
))
(declare-fun arrayNoDuplicates!0 (array!63000 (_ BitVec 32) List!21009) Bool)

(assert (=> b!995893 (= res!666101 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21006))))

(declare-fun b!995900 () Bool)

(declare-fun res!666097 () Bool)

(assert (=> b!995900 (=> (not res!666097) (not e!561962))))

(assert (=> b!995900 (= res!666097 (and (= (size!30835 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30835 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30835 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995901 () Bool)

(assert (=> b!995901 (= e!561964 false)))

(declare-fun lt!441077 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995901 (= lt!441077 (toIndex!0 (select (arr!30333 a!3219) j!170) mask!3464))))

(assert (= (and start!85950 res!666099) b!995900))

(assert (= (and b!995900 res!666097) b!995895))

(assert (= (and b!995895 res!666102) b!995898))

(assert (= (and b!995898 res!666096) b!995894))

(assert (= (and b!995894 res!666098) b!995896))

(assert (= (and b!995896 res!666100) b!995899))

(assert (= (and b!995899 res!666094) b!995893))

(assert (= (and b!995893 res!666101) b!995897))

(assert (= (and b!995897 res!666095) b!995901))

(declare-fun m!923169 () Bool)

(assert (=> b!995894 m!923169))

(declare-fun m!923171 () Bool)

(assert (=> start!85950 m!923171))

(declare-fun m!923173 () Bool)

(assert (=> start!85950 m!923173))

(declare-fun m!923175 () Bool)

(assert (=> b!995893 m!923175))

(declare-fun m!923177 () Bool)

(assert (=> b!995899 m!923177))

(declare-fun m!923179 () Bool)

(assert (=> b!995898 m!923179))

(declare-fun m!923181 () Bool)

(assert (=> b!995896 m!923181))

(declare-fun m!923183 () Bool)

(assert (=> b!995895 m!923183))

(assert (=> b!995895 m!923183))

(declare-fun m!923185 () Bool)

(assert (=> b!995895 m!923185))

(assert (=> b!995901 m!923183))

(assert (=> b!995901 m!923183))

(declare-fun m!923187 () Bool)

(assert (=> b!995901 m!923187))

(push 1)

(assert (not b!995901))

(assert (not b!995896))

(assert (not b!995898))

(assert (not b!995899))

(assert (not b!995894))

(assert (not b!995893))

(assert (not b!995895))

(assert (not start!85950))

(check-sat)

