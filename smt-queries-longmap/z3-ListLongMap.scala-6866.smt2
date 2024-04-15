; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86442 () Bool)

(assert start!86442)

(declare-fun b!1000640 () Bool)

(declare-fun res!670249 () Bool)

(declare-fun e!563904 () Bool)

(assert (=> b!1000640 (=> (not res!670249) (not e!563904))))

(declare-datatypes ((array!63190 0))(
  ( (array!63191 (arr!30420 (Array (_ BitVec 32) (_ BitVec 64))) (size!30924 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63190)

(declare-datatypes ((List!21162 0))(
  ( (Nil!21159) (Cons!21158 (h!22335 (_ BitVec 64)) (t!30154 List!21162)) )
))
(declare-fun arrayNoDuplicates!0 (array!63190 (_ BitVec 32) List!21162) Bool)

(assert (=> b!1000640 (= res!670249 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21159))))

(declare-fun res!670242 () Bool)

(declare-fun e!563905 () Bool)

(assert (=> start!86442 (=> (not res!670242) (not e!563905))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86442 (= res!670242 (validMask!0 mask!3464))))

(assert (=> start!86442 e!563905))

(declare-fun array_inv!23563 (array!63190) Bool)

(assert (=> start!86442 (array_inv!23563 a!3219)))

(assert (=> start!86442 true))

(declare-fun b!1000641 () Bool)

(declare-fun e!563902 () Bool)

(declare-fun e!563903 () Bool)

(assert (=> b!1000641 (= e!563902 e!563903)))

(declare-fun res!670244 () Bool)

(assert (=> b!1000641 (=> (not res!670244) (not e!563903))))

(declare-fun lt!442166 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9377 0))(
  ( (MissingZero!9377 (index!39879 (_ BitVec 32))) (Found!9377 (index!39880 (_ BitVec 32))) (Intermediate!9377 (undefined!10189 Bool) (index!39881 (_ BitVec 32)) (x!87320 (_ BitVec 32))) (Undefined!9377) (MissingVacant!9377 (index!39882 (_ BitVec 32))) )
))
(declare-fun lt!442167 () SeekEntryResult!9377)

(declare-fun lt!442168 () array!63190)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63190 (_ BitVec 32)) SeekEntryResult!9377)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000641 (= res!670244 (not (= lt!442167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442166 mask!3464) lt!442166 lt!442168 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1000641 (= lt!442166 (select (store (arr!30420 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1000641 (= lt!442168 (array!63191 (store (arr!30420 a!3219) i!1194 k0!2224) (size!30924 a!3219)))))

(declare-fun b!1000642 () Bool)

(assert (=> b!1000642 (= e!563903 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442170 () SeekEntryResult!9377)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000642 (= lt!442170 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442166 lt!442168 mask!3464))))

(declare-fun b!1000643 () Bool)

(assert (=> b!1000643 (= e!563905 e!563904)))

(declare-fun res!670246 () Bool)

(assert (=> b!1000643 (=> (not res!670246) (not e!563904))))

(declare-fun lt!442169 () SeekEntryResult!9377)

(assert (=> b!1000643 (= res!670246 (or (= lt!442169 (MissingVacant!9377 i!1194)) (= lt!442169 (MissingZero!9377 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63190 (_ BitVec 32)) SeekEntryResult!9377)

(assert (=> b!1000643 (= lt!442169 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000644 () Bool)

(declare-fun res!670245 () Bool)

(assert (=> b!1000644 (=> (not res!670245) (not e!563902))))

(declare-fun lt!442171 () SeekEntryResult!9377)

(assert (=> b!1000644 (= res!670245 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30420 a!3219) j!170) a!3219 mask!3464) lt!442171))))

(declare-fun b!1000645 () Bool)

(declare-fun res!670250 () Bool)

(assert (=> b!1000645 (=> (not res!670250) (not e!563905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000645 (= res!670250 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000646 () Bool)

(declare-fun res!670248 () Bool)

(assert (=> b!1000646 (=> (not res!670248) (not e!563905))))

(assert (=> b!1000646 (= res!670248 (and (= (size!30924 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30924 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30924 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000647 () Bool)

(declare-fun res!670243 () Bool)

(assert (=> b!1000647 (=> (not res!670243) (not e!563905))))

(declare-fun arrayContainsKey!0 (array!63190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000647 (= res!670243 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000648 () Bool)

(declare-fun res!670253 () Bool)

(assert (=> b!1000648 (=> (not res!670253) (not e!563904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63190 (_ BitVec 32)) Bool)

(assert (=> b!1000648 (= res!670253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000649 () Bool)

(assert (=> b!1000649 (= e!563904 e!563902)))

(declare-fun res!670252 () Bool)

(assert (=> b!1000649 (=> (not res!670252) (not e!563902))))

(assert (=> b!1000649 (= res!670252 (= lt!442167 lt!442171))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000649 (= lt!442171 (Intermediate!9377 false resIndex!38 resX!38))))

(assert (=> b!1000649 (= lt!442167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30420 a!3219) j!170) mask!3464) (select (arr!30420 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000650 () Bool)

(declare-fun res!670251 () Bool)

(assert (=> b!1000650 (=> (not res!670251) (not e!563904))))

(assert (=> b!1000650 (= res!670251 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30924 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30924 a!3219))))))

(declare-fun b!1000651 () Bool)

(declare-fun res!670247 () Bool)

(assert (=> b!1000651 (=> (not res!670247) (not e!563905))))

(assert (=> b!1000651 (= res!670247 (validKeyInArray!0 (select (arr!30420 a!3219) j!170)))))

(assert (= (and start!86442 res!670242) b!1000646))

(assert (= (and b!1000646 res!670248) b!1000651))

(assert (= (and b!1000651 res!670247) b!1000645))

(assert (= (and b!1000645 res!670250) b!1000647))

(assert (= (and b!1000647 res!670243) b!1000643))

(assert (= (and b!1000643 res!670246) b!1000648))

(assert (= (and b!1000648 res!670253) b!1000640))

(assert (= (and b!1000640 res!670249) b!1000650))

(assert (= (and b!1000650 res!670251) b!1000649))

(assert (= (and b!1000649 res!670252) b!1000644))

(assert (= (and b!1000644 res!670245) b!1000641))

(assert (= (and b!1000641 res!670244) b!1000642))

(declare-fun m!926251 () Bool)

(assert (=> b!1000649 m!926251))

(assert (=> b!1000649 m!926251))

(declare-fun m!926253 () Bool)

(assert (=> b!1000649 m!926253))

(assert (=> b!1000649 m!926253))

(assert (=> b!1000649 m!926251))

(declare-fun m!926255 () Bool)

(assert (=> b!1000649 m!926255))

(assert (=> b!1000651 m!926251))

(assert (=> b!1000651 m!926251))

(declare-fun m!926257 () Bool)

(assert (=> b!1000651 m!926257))

(declare-fun m!926259 () Bool)

(assert (=> b!1000641 m!926259))

(assert (=> b!1000641 m!926259))

(declare-fun m!926261 () Bool)

(assert (=> b!1000641 m!926261))

(declare-fun m!926263 () Bool)

(assert (=> b!1000641 m!926263))

(declare-fun m!926265 () Bool)

(assert (=> b!1000641 m!926265))

(declare-fun m!926267 () Bool)

(assert (=> b!1000640 m!926267))

(declare-fun m!926269 () Bool)

(assert (=> b!1000648 m!926269))

(declare-fun m!926271 () Bool)

(assert (=> b!1000645 m!926271))

(declare-fun m!926273 () Bool)

(assert (=> start!86442 m!926273))

(declare-fun m!926275 () Bool)

(assert (=> start!86442 m!926275))

(declare-fun m!926277 () Bool)

(assert (=> b!1000643 m!926277))

(declare-fun m!926279 () Bool)

(assert (=> b!1000642 m!926279))

(assert (=> b!1000644 m!926251))

(assert (=> b!1000644 m!926251))

(declare-fun m!926281 () Bool)

(assert (=> b!1000644 m!926281))

(declare-fun m!926283 () Bool)

(assert (=> b!1000647 m!926283))

(check-sat (not b!1000648) (not start!86442) (not b!1000644) (not b!1000645) (not b!1000642) (not b!1000647) (not b!1000643) (not b!1000651) (not b!1000649) (not b!1000640) (not b!1000641))
(check-sat)
