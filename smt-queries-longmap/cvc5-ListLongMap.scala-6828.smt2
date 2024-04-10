; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85958 () Bool)

(assert start!85958)

(declare-fun b!996001 () Bool)

(declare-fun res!666205 () Bool)

(declare-fun e!561998 () Bool)

(assert (=> b!996001 (=> (not res!666205) (not e!561998))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996001 (= res!666205 (validKeyInArray!0 k!2224))))

(declare-fun b!996002 () Bool)

(declare-fun res!666203 () Bool)

(declare-fun e!561999 () Bool)

(assert (=> b!996002 (=> (not res!666203) (not e!561999))))

(declare-datatypes ((array!63008 0))(
  ( (array!63009 (arr!30337 (Array (_ BitVec 32) (_ BitVec 64))) (size!30839 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63008)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63008 (_ BitVec 32)) Bool)

(assert (=> b!996002 (= res!666203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996003 () Bool)

(declare-fun res!666210 () Bool)

(assert (=> b!996003 (=> (not res!666210) (not e!561999))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996003 (= res!666210 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30839 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30839 a!3219))))))

(declare-fun b!996004 () Bool)

(declare-fun res!666207 () Bool)

(assert (=> b!996004 (=> (not res!666207) (not e!561998))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996004 (= res!666207 (validKeyInArray!0 (select (arr!30337 a!3219) j!170)))))

(declare-fun res!666204 () Bool)

(assert (=> start!85958 (=> (not res!666204) (not e!561998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85958 (= res!666204 (validMask!0 mask!3464))))

(assert (=> start!85958 e!561998))

(declare-fun array_inv!23461 (array!63008) Bool)

(assert (=> start!85958 (array_inv!23461 a!3219)))

(assert (=> start!85958 true))

(declare-fun b!996005 () Bool)

(assert (=> b!996005 (= e!561998 e!561999)))

(declare-fun res!666202 () Bool)

(assert (=> b!996005 (=> (not res!666202) (not e!561999))))

(declare-datatypes ((SeekEntryResult!9269 0))(
  ( (MissingZero!9269 (index!39447 (_ BitVec 32))) (Found!9269 (index!39448 (_ BitVec 32))) (Intermediate!9269 (undefined!10081 Bool) (index!39449 (_ BitVec 32)) (x!86886 (_ BitVec 32))) (Undefined!9269) (MissingVacant!9269 (index!39450 (_ BitVec 32))) )
))
(declare-fun lt!441101 () SeekEntryResult!9269)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996005 (= res!666202 (or (= lt!441101 (MissingVacant!9269 i!1194)) (= lt!441101 (MissingZero!9269 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63008 (_ BitVec 32)) SeekEntryResult!9269)

(assert (=> b!996005 (= lt!441101 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996006 () Bool)

(declare-fun res!666208 () Bool)

(assert (=> b!996006 (=> (not res!666208) (not e!561998))))

(declare-fun arrayContainsKey!0 (array!63008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996006 (= res!666208 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996007 () Bool)

(declare-fun res!666206 () Bool)

(assert (=> b!996007 (=> (not res!666206) (not e!561998))))

(assert (=> b!996007 (= res!666206 (and (= (size!30839 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30839 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30839 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996008 () Bool)

(declare-fun res!666209 () Bool)

(assert (=> b!996008 (=> (not res!666209) (not e!561999))))

(declare-datatypes ((List!21013 0))(
  ( (Nil!21010) (Cons!21009 (h!22171 (_ BitVec 64)) (t!30014 List!21013)) )
))
(declare-fun arrayNoDuplicates!0 (array!63008 (_ BitVec 32) List!21013) Bool)

(assert (=> b!996008 (= res!666209 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21010))))

(declare-fun b!996009 () Bool)

(assert (=> b!996009 (= e!561999 false)))

(declare-fun lt!441100 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996009 (= lt!441100 (toIndex!0 (select (arr!30337 a!3219) j!170) mask!3464))))

(assert (= (and start!85958 res!666204) b!996007))

(assert (= (and b!996007 res!666206) b!996004))

(assert (= (and b!996004 res!666207) b!996001))

(assert (= (and b!996001 res!666205) b!996006))

(assert (= (and b!996006 res!666208) b!996005))

(assert (= (and b!996005 res!666202) b!996002))

(assert (= (and b!996002 res!666203) b!996008))

(assert (= (and b!996008 res!666209) b!996003))

(assert (= (and b!996003 res!666210) b!996009))

(declare-fun m!923249 () Bool)

(assert (=> b!996008 m!923249))

(declare-fun m!923251 () Bool)

(assert (=> b!996001 m!923251))

(declare-fun m!923253 () Bool)

(assert (=> b!996004 m!923253))

(assert (=> b!996004 m!923253))

(declare-fun m!923255 () Bool)

(assert (=> b!996004 m!923255))

(assert (=> b!996009 m!923253))

(assert (=> b!996009 m!923253))

(declare-fun m!923257 () Bool)

(assert (=> b!996009 m!923257))

(declare-fun m!923259 () Bool)

(assert (=> b!996002 m!923259))

(declare-fun m!923261 () Bool)

(assert (=> b!996005 m!923261))

(declare-fun m!923263 () Bool)

(assert (=> start!85958 m!923263))

(declare-fun m!923265 () Bool)

(assert (=> start!85958 m!923265))

(declare-fun m!923267 () Bool)

(assert (=> b!996006 m!923267))

(push 1)

