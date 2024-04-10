; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86420 () Bool)

(assert start!86420)

(declare-fun b!1000318 () Bool)

(declare-fun e!563854 () Bool)

(declare-fun e!563852 () Bool)

(assert (=> b!1000318 (= e!563854 e!563852)))

(declare-fun res!669798 () Bool)

(assert (=> b!1000318 (=> (not res!669798) (not e!563852))))

(declare-datatypes ((SeekEntryResult!9368 0))(
  ( (MissingZero!9368 (index!39843 (_ BitVec 32))) (Found!9368 (index!39844 (_ BitVec 32))) (Intermediate!9368 (undefined!10180 Bool) (index!39845 (_ BitVec 32)) (x!87276 (_ BitVec 32))) (Undefined!9368) (MissingVacant!9368 (index!39846 (_ BitVec 32))) )
))
(declare-fun lt!442257 () SeekEntryResult!9368)

(declare-fun lt!442258 () SeekEntryResult!9368)

(assert (=> b!1000318 (= res!669798 (= lt!442257 lt!442258))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000318 (= lt!442258 (Intermediate!9368 false resIndex!38 resX!38))))

(declare-datatypes ((array!63221 0))(
  ( (array!63222 (arr!30436 (Array (_ BitVec 32) (_ BitVec 64))) (size!30938 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63221)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63221 (_ BitVec 32)) SeekEntryResult!9368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000318 (= lt!442257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30436 a!3219) j!170) mask!3464) (select (arr!30436 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000319 () Bool)

(declare-fun res!669807 () Bool)

(assert (=> b!1000319 (=> (not res!669807) (not e!563854))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000319 (= res!669807 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30938 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30938 a!3219))))))

(declare-fun b!1000320 () Bool)

(declare-fun res!669802 () Bool)

(assert (=> b!1000320 (=> (not res!669802) (not e!563854))))

(declare-datatypes ((List!21112 0))(
  ( (Nil!21109) (Cons!21108 (h!22285 (_ BitVec 64)) (t!30113 List!21112)) )
))
(declare-fun arrayNoDuplicates!0 (array!63221 (_ BitVec 32) List!21112) Bool)

(assert (=> b!1000320 (= res!669802 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21109))))

(declare-fun b!1000321 () Bool)

(declare-fun res!669799 () Bool)

(declare-fun e!563853 () Bool)

(assert (=> b!1000321 (=> (not res!669799) (not e!563853))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000321 (= res!669799 (and (= (size!30938 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30938 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30938 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000322 () Bool)

(declare-fun res!669803 () Bool)

(assert (=> b!1000322 (=> (not res!669803) (not e!563852))))

(assert (=> b!1000322 (= res!669803 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30436 a!3219) j!170) a!3219 mask!3464) lt!442258))))

(declare-fun res!669796 () Bool)

(assert (=> start!86420 (=> (not res!669796) (not e!563853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86420 (= res!669796 (validMask!0 mask!3464))))

(assert (=> start!86420 e!563853))

(declare-fun array_inv!23560 (array!63221) Bool)

(assert (=> start!86420 (array_inv!23560 a!3219)))

(assert (=> start!86420 true))

(declare-fun b!1000323 () Bool)

(declare-fun res!669800 () Bool)

(assert (=> b!1000323 (=> (not res!669800) (not e!563853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000323 (= res!669800 (validKeyInArray!0 (select (arr!30436 a!3219) j!170)))))

(declare-fun b!1000324 () Bool)

(declare-fun res!669804 () Bool)

(assert (=> b!1000324 (=> (not res!669804) (not e!563854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63221 (_ BitVec 32)) Bool)

(assert (=> b!1000324 (= res!669804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000325 () Bool)

(assert (=> b!1000325 (= e!563853 e!563854)))

(declare-fun res!669806 () Bool)

(assert (=> b!1000325 (=> (not res!669806) (not e!563854))))

(declare-fun lt!442259 () SeekEntryResult!9368)

(assert (=> b!1000325 (= res!669806 (or (= lt!442259 (MissingVacant!9368 i!1194)) (= lt!442259 (MissingZero!9368 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63221 (_ BitVec 32)) SeekEntryResult!9368)

(assert (=> b!1000325 (= lt!442259 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000326 () Bool)

(declare-fun res!669801 () Bool)

(assert (=> b!1000326 (=> (not res!669801) (not e!563853))))

(assert (=> b!1000326 (= res!669801 (validKeyInArray!0 k!2224))))

(declare-fun b!1000327 () Bool)

(declare-fun res!669805 () Bool)

(assert (=> b!1000327 (=> (not res!669805) (not e!563853))))

(declare-fun arrayContainsKey!0 (array!63221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000327 (= res!669805 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000328 () Bool)

(declare-fun res!669797 () Bool)

(assert (=> b!1000328 (=> (not res!669797) (not e!563852))))

(assert (=> b!1000328 (= res!669797 (not (= lt!442257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30436 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30436 a!3219) i!1194 k!2224) j!170) (array!63222 (store (arr!30436 a!3219) i!1194 k!2224) (size!30938 a!3219)) mask!3464))))))

(declare-fun b!1000329 () Bool)

(assert (=> b!1000329 (= e!563852 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!86420 res!669796) b!1000321))

(assert (= (and b!1000321 res!669799) b!1000323))

(assert (= (and b!1000323 res!669800) b!1000326))

(assert (= (and b!1000326 res!669801) b!1000327))

(assert (= (and b!1000327 res!669805) b!1000325))

(assert (= (and b!1000325 res!669806) b!1000324))

(assert (= (and b!1000324 res!669804) b!1000320))

(assert (= (and b!1000320 res!669802) b!1000319))

(assert (= (and b!1000319 res!669807) b!1000318))

(assert (= (and b!1000318 res!669798) b!1000322))

(assert (= (and b!1000322 res!669803) b!1000328))

(assert (= (and b!1000328 res!669797) b!1000329))

(declare-fun m!926495 () Bool)

(assert (=> start!86420 m!926495))

(declare-fun m!926497 () Bool)

(assert (=> start!86420 m!926497))

(declare-fun m!926499 () Bool)

(assert (=> b!1000324 m!926499))

(declare-fun m!926501 () Bool)

(assert (=> b!1000318 m!926501))

(assert (=> b!1000318 m!926501))

(declare-fun m!926503 () Bool)

(assert (=> b!1000318 m!926503))

(assert (=> b!1000318 m!926503))

(assert (=> b!1000318 m!926501))

(declare-fun m!926505 () Bool)

(assert (=> b!1000318 m!926505))

(assert (=> b!1000322 m!926501))

(assert (=> b!1000322 m!926501))

(declare-fun m!926507 () Bool)

(assert (=> b!1000322 m!926507))

(declare-fun m!926509 () Bool)

(assert (=> b!1000320 m!926509))

(assert (=> b!1000323 m!926501))

(assert (=> b!1000323 m!926501))

(declare-fun m!926511 () Bool)

(assert (=> b!1000323 m!926511))

(declare-fun m!926513 () Bool)

(assert (=> b!1000327 m!926513))

(declare-fun m!926515 () Bool)

(assert (=> b!1000325 m!926515))

(declare-fun m!926517 () Bool)

(assert (=> b!1000326 m!926517))

(declare-fun m!926519 () Bool)

(assert (=> b!1000328 m!926519))

(declare-fun m!926521 () Bool)

(assert (=> b!1000328 m!926521))

(assert (=> b!1000328 m!926521))

(declare-fun m!926523 () Bool)

(assert (=> b!1000328 m!926523))

(assert (=> b!1000328 m!926523))

(assert (=> b!1000328 m!926521))

(declare-fun m!926525 () Bool)

(assert (=> b!1000328 m!926525))

(push 1)

