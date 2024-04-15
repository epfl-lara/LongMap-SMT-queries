; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86436 () Bool)

(assert start!86436)

(declare-fun res!670132 () Bool)

(declare-fun e!563864 () Bool)

(assert (=> start!86436 (=> (not res!670132) (not e!563864))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86436 (= res!670132 (validMask!0 mask!3464))))

(assert (=> start!86436 e!563864))

(declare-datatypes ((array!63184 0))(
  ( (array!63185 (arr!30417 (Array (_ BitVec 32) (_ BitVec 64))) (size!30921 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63184)

(declare-fun array_inv!23560 (array!63184) Bool)

(assert (=> start!86436 (array_inv!23560 a!3219)))

(assert (=> start!86436 true))

(declare-fun b!1000525 () Bool)

(declare-fun res!670130 () Bool)

(assert (=> b!1000525 (=> (not res!670130) (not e!563864))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000525 (= res!670130 (validKeyInArray!0 (select (arr!30417 a!3219) j!170)))))

(declare-fun b!1000526 () Bool)

(declare-fun res!670137 () Bool)

(declare-fun e!563866 () Bool)

(assert (=> b!1000526 (=> (not res!670137) (not e!563866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63184 (_ BitVec 32)) Bool)

(assert (=> b!1000526 (= res!670137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun e!563865 () Bool)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun b!1000527 () Bool)

(assert (=> b!1000527 (= e!563865 (not (validKeyInArray!0 (select (store (arr!30417 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!1000528 () Bool)

(declare-fun res!670133 () Bool)

(assert (=> b!1000528 (=> (not res!670133) (not e!563864))))

(assert (=> b!1000528 (= res!670133 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000529 () Bool)

(declare-fun res!670136 () Bool)

(assert (=> b!1000529 (=> (not res!670136) (not e!563865))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9374 0))(
  ( (MissingZero!9374 (index!39867 (_ BitVec 32))) (Found!9374 (index!39868 (_ BitVec 32))) (Intermediate!9374 (undefined!10186 Bool) (index!39869 (_ BitVec 32)) (x!87309 (_ BitVec 32))) (Undefined!9374) (MissingVacant!9374 (index!39870 (_ BitVec 32))) )
))
(declare-fun lt!442134 () SeekEntryResult!9374)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63184 (_ BitVec 32)) SeekEntryResult!9374)

(assert (=> b!1000529 (= res!670136 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30417 a!3219) j!170) a!3219 mask!3464) lt!442134))))

(declare-fun b!1000530 () Bool)

(declare-fun res!670131 () Bool)

(assert (=> b!1000530 (=> (not res!670131) (not e!563864))))

(declare-fun arrayContainsKey!0 (array!63184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000530 (= res!670131 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000531 () Bool)

(assert (=> b!1000531 (= e!563864 e!563866)))

(declare-fun res!670127 () Bool)

(assert (=> b!1000531 (=> (not res!670127) (not e!563866))))

(declare-fun lt!442135 () SeekEntryResult!9374)

(assert (=> b!1000531 (= res!670127 (or (= lt!442135 (MissingVacant!9374 i!1194)) (= lt!442135 (MissingZero!9374 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63184 (_ BitVec 32)) SeekEntryResult!9374)

(assert (=> b!1000531 (= lt!442135 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000532 () Bool)

(declare-fun res!670128 () Bool)

(assert (=> b!1000532 (=> (not res!670128) (not e!563864))))

(assert (=> b!1000532 (= res!670128 (and (= (size!30921 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30921 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30921 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000533 () Bool)

(declare-fun res!670138 () Bool)

(assert (=> b!1000533 (=> (not res!670138) (not e!563865))))

(declare-fun lt!442133 () SeekEntryResult!9374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000533 (= res!670138 (not (= lt!442133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30417 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30417 a!3219) i!1194 k0!2224) j!170) (array!63185 (store (arr!30417 a!3219) i!1194 k0!2224) (size!30921 a!3219)) mask!3464))))))

(declare-fun b!1000534 () Bool)

(assert (=> b!1000534 (= e!563866 e!563865)))

(declare-fun res!670134 () Bool)

(assert (=> b!1000534 (=> (not res!670134) (not e!563865))))

(assert (=> b!1000534 (= res!670134 (= lt!442133 lt!442134))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000534 (= lt!442134 (Intermediate!9374 false resIndex!38 resX!38))))

(assert (=> b!1000534 (= lt!442133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30417 a!3219) j!170) mask!3464) (select (arr!30417 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000535 () Bool)

(declare-fun res!670129 () Bool)

(assert (=> b!1000535 (=> (not res!670129) (not e!563865))))

(assert (=> b!1000535 (= res!670129 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsle x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000536 () Bool)

(declare-fun res!670139 () Bool)

(assert (=> b!1000536 (=> (not res!670139) (not e!563866))))

(declare-datatypes ((List!21159 0))(
  ( (Nil!21156) (Cons!21155 (h!22332 (_ BitVec 64)) (t!30151 List!21159)) )
))
(declare-fun arrayNoDuplicates!0 (array!63184 (_ BitVec 32) List!21159) Bool)

(assert (=> b!1000536 (= res!670139 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21156))))

(declare-fun b!1000537 () Bool)

(declare-fun res!670135 () Bool)

(assert (=> b!1000537 (=> (not res!670135) (not e!563866))))

(assert (=> b!1000537 (= res!670135 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30921 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30921 a!3219))))))

(assert (= (and start!86436 res!670132) b!1000532))

(assert (= (and b!1000532 res!670128) b!1000525))

(assert (= (and b!1000525 res!670130) b!1000528))

(assert (= (and b!1000528 res!670133) b!1000530))

(assert (= (and b!1000530 res!670131) b!1000531))

(assert (= (and b!1000531 res!670127) b!1000526))

(assert (= (and b!1000526 res!670137) b!1000536))

(assert (= (and b!1000536 res!670139) b!1000537))

(assert (= (and b!1000537 res!670135) b!1000534))

(assert (= (and b!1000534 res!670134) b!1000529))

(assert (= (and b!1000529 res!670136) b!1000533))

(assert (= (and b!1000533 res!670138) b!1000535))

(assert (= (and b!1000535 res!670129) b!1000527))

(declare-fun m!926149 () Bool)

(assert (=> b!1000527 m!926149))

(declare-fun m!926151 () Bool)

(assert (=> b!1000527 m!926151))

(assert (=> b!1000527 m!926151))

(declare-fun m!926153 () Bool)

(assert (=> b!1000527 m!926153))

(declare-fun m!926155 () Bool)

(assert (=> b!1000525 m!926155))

(assert (=> b!1000525 m!926155))

(declare-fun m!926157 () Bool)

(assert (=> b!1000525 m!926157))

(assert (=> b!1000529 m!926155))

(assert (=> b!1000529 m!926155))

(declare-fun m!926159 () Bool)

(assert (=> b!1000529 m!926159))

(assert (=> b!1000533 m!926149))

(assert (=> b!1000533 m!926151))

(assert (=> b!1000533 m!926151))

(declare-fun m!926161 () Bool)

(assert (=> b!1000533 m!926161))

(assert (=> b!1000533 m!926161))

(assert (=> b!1000533 m!926151))

(declare-fun m!926163 () Bool)

(assert (=> b!1000533 m!926163))

(declare-fun m!926165 () Bool)

(assert (=> b!1000536 m!926165))

(declare-fun m!926167 () Bool)

(assert (=> b!1000526 m!926167))

(declare-fun m!926169 () Bool)

(assert (=> start!86436 m!926169))

(declare-fun m!926171 () Bool)

(assert (=> start!86436 m!926171))

(declare-fun m!926173 () Bool)

(assert (=> b!1000528 m!926173))

(declare-fun m!926175 () Bool)

(assert (=> b!1000531 m!926175))

(assert (=> b!1000534 m!926155))

(assert (=> b!1000534 m!926155))

(declare-fun m!926177 () Bool)

(assert (=> b!1000534 m!926177))

(assert (=> b!1000534 m!926177))

(assert (=> b!1000534 m!926155))

(declare-fun m!926179 () Bool)

(assert (=> b!1000534 m!926179))

(declare-fun m!926181 () Bool)

(assert (=> b!1000530 m!926181))

(check-sat (not b!1000528) (not start!86436) (not b!1000530) (not b!1000529) (not b!1000527) (not b!1000526) (not b!1000533) (not b!1000531) (not b!1000534) (not b!1000525) (not b!1000536))
(check-sat)
