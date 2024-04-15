; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86724 () Bool)

(assert start!86724)

(declare-fun b!1005188 () Bool)

(declare-fun res!674408 () Bool)

(declare-fun e!566024 () Bool)

(assert (=> b!1005188 (=> (not res!674408) (not e!566024))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005188 (= res!674408 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005189 () Bool)

(declare-fun res!674407 () Bool)

(assert (=> b!1005189 (=> (not res!674407) (not e!566024))))

(declare-datatypes ((array!63370 0))(
  ( (array!63371 (arr!30507 (Array (_ BitVec 32) (_ BitVec 64))) (size!31011 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63370)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005189 (= res!674407 (validKeyInArray!0 (select (arr!30507 a!3219) j!170)))))

(declare-fun b!1005190 () Bool)

(declare-fun e!566022 () Bool)

(assert (=> b!1005190 (= e!566022 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!444312 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005190 (= lt!444312 (toIndex!0 (select (arr!30507 a!3219) j!170) mask!3464))))

(declare-fun b!1005191 () Bool)

(declare-fun res!674404 () Bool)

(assert (=> b!1005191 (=> (not res!674404) (not e!566022))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005191 (= res!674404 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31011 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31011 a!3219))))))

(declare-fun b!1005192 () Bool)

(declare-fun res!674403 () Bool)

(assert (=> b!1005192 (=> (not res!674403) (not e!566024))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005192 (= res!674403 (and (= (size!31011 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31011 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31011 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005193 () Bool)

(declare-fun res!674406 () Bool)

(assert (=> b!1005193 (=> (not res!674406) (not e!566022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63370 (_ BitVec 32)) Bool)

(assert (=> b!1005193 (= res!674406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005194 () Bool)

(declare-fun res!674400 () Bool)

(assert (=> b!1005194 (=> (not res!674400) (not e!566024))))

(declare-fun arrayContainsKey!0 (array!63370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005194 (= res!674400 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!674402 () Bool)

(assert (=> start!86724 (=> (not res!674402) (not e!566024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86724 (= res!674402 (validMask!0 mask!3464))))

(assert (=> start!86724 e!566024))

(declare-fun array_inv!23650 (array!63370) Bool)

(assert (=> start!86724 (array_inv!23650 a!3219)))

(assert (=> start!86724 true))

(declare-fun b!1005195 () Bool)

(assert (=> b!1005195 (= e!566024 e!566022)))

(declare-fun res!674405 () Bool)

(assert (=> b!1005195 (=> (not res!674405) (not e!566022))))

(declare-datatypes ((SeekEntryResult!9464 0))(
  ( (MissingZero!9464 (index!40227 (_ BitVec 32))) (Found!9464 (index!40228 (_ BitVec 32))) (Intermediate!9464 (undefined!10276 Bool) (index!40229 (_ BitVec 32)) (x!87651 (_ BitVec 32))) (Undefined!9464) (MissingVacant!9464 (index!40230 (_ BitVec 32))) )
))
(declare-fun lt!444313 () SeekEntryResult!9464)

(assert (=> b!1005195 (= res!674405 (or (= lt!444313 (MissingVacant!9464 i!1194)) (= lt!444313 (MissingZero!9464 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63370 (_ BitVec 32)) SeekEntryResult!9464)

(assert (=> b!1005195 (= lt!444313 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005196 () Bool)

(declare-fun res!674401 () Bool)

(assert (=> b!1005196 (=> (not res!674401) (not e!566022))))

(declare-datatypes ((List!21249 0))(
  ( (Nil!21246) (Cons!21245 (h!22428 (_ BitVec 64)) (t!30241 List!21249)) )
))
(declare-fun arrayNoDuplicates!0 (array!63370 (_ BitVec 32) List!21249) Bool)

(assert (=> b!1005196 (= res!674401 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21246))))

(assert (= (and start!86724 res!674402) b!1005192))

(assert (= (and b!1005192 res!674403) b!1005189))

(assert (= (and b!1005189 res!674407) b!1005188))

(assert (= (and b!1005188 res!674408) b!1005194))

(assert (= (and b!1005194 res!674400) b!1005195))

(assert (= (and b!1005195 res!674405) b!1005193))

(assert (= (and b!1005193 res!674406) b!1005196))

(assert (= (and b!1005196 res!674401) b!1005191))

(assert (= (and b!1005191 res!674404) b!1005190))

(declare-fun m!929929 () Bool)

(assert (=> start!86724 m!929929))

(declare-fun m!929931 () Bool)

(assert (=> start!86724 m!929931))

(declare-fun m!929933 () Bool)

(assert (=> b!1005195 m!929933))

(declare-fun m!929935 () Bool)

(assert (=> b!1005196 m!929935))

(declare-fun m!929937 () Bool)

(assert (=> b!1005193 m!929937))

(declare-fun m!929939 () Bool)

(assert (=> b!1005188 m!929939))

(declare-fun m!929941 () Bool)

(assert (=> b!1005190 m!929941))

(assert (=> b!1005190 m!929941))

(declare-fun m!929943 () Bool)

(assert (=> b!1005190 m!929943))

(assert (=> b!1005189 m!929941))

(assert (=> b!1005189 m!929941))

(declare-fun m!929945 () Bool)

(assert (=> b!1005189 m!929945))

(declare-fun m!929947 () Bool)

(assert (=> b!1005194 m!929947))

(check-sat (not b!1005189) (not b!1005194) (not b!1005190) (not b!1005188) (not b!1005195) (not b!1005196) (not start!86724) (not b!1005193))
(check-sat)
