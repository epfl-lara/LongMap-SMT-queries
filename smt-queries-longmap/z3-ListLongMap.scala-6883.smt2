; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86782 () Bool)

(assert start!86782)

(declare-fun b!1004443 () Bool)

(declare-fun res!673162 () Bool)

(declare-fun e!565869 () Bool)

(assert (=> b!1004443 (=> (not res!673162) (not e!565869))))

(declare-datatypes ((array!63402 0))(
  ( (array!63403 (arr!30520 (Array (_ BitVec 32) (_ BitVec 64))) (size!31023 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63402)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004443 (= res!673162 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004444 () Bool)

(declare-fun res!673172 () Bool)

(assert (=> b!1004444 (=> (not res!673172) (not e!565869))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004444 (= res!673172 (and (= (size!31023 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31023 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31023 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004445 () Bool)

(declare-fun e!565868 () Bool)

(assert (=> b!1004445 (= e!565868 false)))

(declare-fun lt!444035 () (_ BitVec 64))

(declare-fun lt!444038 () array!63402)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!444040 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9388 0))(
  ( (MissingZero!9388 (index!39923 (_ BitVec 32))) (Found!9388 (index!39924 (_ BitVec 32))) (Intermediate!9388 (undefined!10200 Bool) (index!39925 (_ BitVec 32)) (x!87492 (_ BitVec 32))) (Undefined!9388) (MissingVacant!9388 (index!39926 (_ BitVec 32))) )
))
(declare-fun lt!444036 () SeekEntryResult!9388)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63402 (_ BitVec 32)) SeekEntryResult!9388)

(assert (=> b!1004445 (= lt!444036 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444040 lt!444035 lt!444038 mask!3464))))

(declare-fun b!1004446 () Bool)

(declare-fun e!565867 () Bool)

(declare-fun e!565870 () Bool)

(assert (=> b!1004446 (= e!565867 e!565870)))

(declare-fun res!673166 () Bool)

(assert (=> b!1004446 (=> (not res!673166) (not e!565870))))

(declare-fun lt!444037 () SeekEntryResult!9388)

(declare-fun lt!444034 () SeekEntryResult!9388)

(assert (=> b!1004446 (= res!673166 (= lt!444037 lt!444034))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004446 (= lt!444034 (Intermediate!9388 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004446 (= lt!444037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30520 a!3219) j!170) mask!3464) (select (arr!30520 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004447 () Bool)

(declare-fun e!565871 () Bool)

(assert (=> b!1004447 (= e!565870 e!565871)))

(declare-fun res!673169 () Bool)

(assert (=> b!1004447 (=> (not res!673169) (not e!565871))))

(declare-fun lt!444041 () SeekEntryResult!9388)

(assert (=> b!1004447 (= res!673169 (= lt!444041 lt!444034))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1004447 (= lt!444041 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30520 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004448 () Bool)

(declare-fun res!673164 () Bool)

(assert (=> b!1004448 (=> (not res!673164) (not e!565867))))

(declare-datatypes ((List!21167 0))(
  ( (Nil!21164) (Cons!21163 (h!22349 (_ BitVec 64)) (t!30160 List!21167)) )
))
(declare-fun arrayNoDuplicates!0 (array!63402 (_ BitVec 32) List!21167) Bool)

(assert (=> b!1004448 (= res!673164 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21164))))

(declare-fun b!1004449 () Bool)

(declare-fun e!565866 () Bool)

(assert (=> b!1004449 (= e!565866 e!565868)))

(declare-fun res!673163 () Bool)

(assert (=> b!1004449 (=> (not res!673163) (not e!565868))))

(assert (=> b!1004449 (= res!673163 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444040 #b00000000000000000000000000000000) (bvslt lt!444040 (size!31023 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004449 (= lt!444040 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004450 () Bool)

(declare-fun res!673161 () Bool)

(assert (=> b!1004450 (=> (not res!673161) (not e!565867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63402 (_ BitVec 32)) Bool)

(assert (=> b!1004450 (= res!673161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004451 () Bool)

(assert (=> b!1004451 (= e!565869 e!565867)))

(declare-fun res!673160 () Bool)

(assert (=> b!1004451 (=> (not res!673160) (not e!565867))))

(declare-fun lt!444039 () SeekEntryResult!9388)

(assert (=> b!1004451 (= res!673160 (or (= lt!444039 (MissingVacant!9388 i!1194)) (= lt!444039 (MissingZero!9388 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63402 (_ BitVec 32)) SeekEntryResult!9388)

(assert (=> b!1004451 (= lt!444039 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004452 () Bool)

(assert (=> b!1004452 (= e!565871 e!565866)))

(declare-fun res!673170 () Bool)

(assert (=> b!1004452 (=> (not res!673170) (not e!565866))))

(assert (=> b!1004452 (= res!673170 (not (= lt!444037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444035 mask!3464) lt!444035 lt!444038 mask!3464))))))

(assert (=> b!1004452 (= lt!444035 (select (store (arr!30520 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004452 (= lt!444038 (array!63403 (store (arr!30520 a!3219) i!1194 k0!2224) (size!31023 a!3219)))))

(declare-fun res!673165 () Bool)

(assert (=> start!86782 (=> (not res!673165) (not e!565869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86782 (= res!673165 (validMask!0 mask!3464))))

(assert (=> start!86782 e!565869))

(declare-fun array_inv!23656 (array!63402) Bool)

(assert (=> start!86782 (array_inv!23656 a!3219)))

(assert (=> start!86782 true))

(declare-fun b!1004453 () Bool)

(declare-fun res!673173 () Bool)

(assert (=> b!1004453 (=> (not res!673173) (not e!565868))))

(assert (=> b!1004453 (= res!673173 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444040 (select (arr!30520 a!3219) j!170) a!3219 mask!3464) lt!444034))))

(declare-fun b!1004454 () Bool)

(declare-fun res!673174 () Bool)

(assert (=> b!1004454 (=> (not res!673174) (not e!565866))))

(assert (=> b!1004454 (= res!673174 (not (= lt!444041 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444035 lt!444038 mask!3464))))))

(declare-fun b!1004455 () Bool)

(declare-fun res!673175 () Bool)

(assert (=> b!1004455 (=> (not res!673175) (not e!565867))))

(assert (=> b!1004455 (= res!673175 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31023 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31023 a!3219))))))

(declare-fun b!1004456 () Bool)

(declare-fun res!673168 () Bool)

(assert (=> b!1004456 (=> (not res!673168) (not e!565869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004456 (= res!673168 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004457 () Bool)

(declare-fun res!673167 () Bool)

(assert (=> b!1004457 (=> (not res!673167) (not e!565866))))

(assert (=> b!1004457 (= res!673167 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004458 () Bool)

(declare-fun res!673171 () Bool)

(assert (=> b!1004458 (=> (not res!673171) (not e!565869))))

(assert (=> b!1004458 (= res!673171 (validKeyInArray!0 (select (arr!30520 a!3219) j!170)))))

(assert (= (and start!86782 res!673165) b!1004444))

(assert (= (and b!1004444 res!673172) b!1004458))

(assert (= (and b!1004458 res!673171) b!1004456))

(assert (= (and b!1004456 res!673168) b!1004443))

(assert (= (and b!1004443 res!673162) b!1004451))

(assert (= (and b!1004451 res!673160) b!1004450))

(assert (= (and b!1004450 res!673161) b!1004448))

(assert (= (and b!1004448 res!673164) b!1004455))

(assert (= (and b!1004455 res!673175) b!1004446))

(assert (= (and b!1004446 res!673166) b!1004447))

(assert (= (and b!1004447 res!673169) b!1004452))

(assert (= (and b!1004452 res!673170) b!1004454))

(assert (= (and b!1004454 res!673174) b!1004457))

(assert (= (and b!1004457 res!673167) b!1004449))

(assert (= (and b!1004449 res!673163) b!1004453))

(assert (= (and b!1004453 res!673173) b!1004445))

(declare-fun m!930473 () Bool)

(assert (=> b!1004443 m!930473))

(declare-fun m!930475 () Bool)

(assert (=> b!1004448 m!930475))

(declare-fun m!930477 () Bool)

(assert (=> b!1004450 m!930477))

(declare-fun m!930479 () Bool)

(assert (=> b!1004447 m!930479))

(assert (=> b!1004447 m!930479))

(declare-fun m!930481 () Bool)

(assert (=> b!1004447 m!930481))

(declare-fun m!930483 () Bool)

(assert (=> start!86782 m!930483))

(declare-fun m!930485 () Bool)

(assert (=> start!86782 m!930485))

(declare-fun m!930487 () Bool)

(assert (=> b!1004451 m!930487))

(declare-fun m!930489 () Bool)

(assert (=> b!1004456 m!930489))

(declare-fun m!930491 () Bool)

(assert (=> b!1004449 m!930491))

(assert (=> b!1004453 m!930479))

(assert (=> b!1004453 m!930479))

(declare-fun m!930493 () Bool)

(assert (=> b!1004453 m!930493))

(assert (=> b!1004446 m!930479))

(assert (=> b!1004446 m!930479))

(declare-fun m!930495 () Bool)

(assert (=> b!1004446 m!930495))

(assert (=> b!1004446 m!930495))

(assert (=> b!1004446 m!930479))

(declare-fun m!930497 () Bool)

(assert (=> b!1004446 m!930497))

(assert (=> b!1004458 m!930479))

(assert (=> b!1004458 m!930479))

(declare-fun m!930499 () Bool)

(assert (=> b!1004458 m!930499))

(declare-fun m!930501 () Bool)

(assert (=> b!1004452 m!930501))

(assert (=> b!1004452 m!930501))

(declare-fun m!930503 () Bool)

(assert (=> b!1004452 m!930503))

(declare-fun m!930505 () Bool)

(assert (=> b!1004452 m!930505))

(declare-fun m!930507 () Bool)

(assert (=> b!1004452 m!930507))

(declare-fun m!930509 () Bool)

(assert (=> b!1004454 m!930509))

(declare-fun m!930511 () Bool)

(assert (=> b!1004445 m!930511))

(check-sat (not b!1004446) (not b!1004447) (not b!1004450) (not b!1004449) (not b!1004453) (not b!1004443) (not b!1004454) (not b!1004448) (not b!1004458) (not b!1004452) (not start!86782) (not b!1004445) (not b!1004451) (not b!1004456))
(check-sat)
