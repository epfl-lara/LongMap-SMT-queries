; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85698 () Bool)

(assert start!85698)

(declare-fun b!994523 () Bool)

(declare-fun e!561256 () Bool)

(assert (=> b!994523 (= e!561256 false)))

(declare-datatypes ((array!62904 0))(
  ( (array!62905 (arr!30291 (Array (_ BitVec 32) (_ BitVec 64))) (size!30793 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62904)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9223 0))(
  ( (MissingZero!9223 (index!39263 (_ BitVec 32))) (Found!9223 (index!39264 (_ BitVec 32))) (Intermediate!9223 (undefined!10035 Bool) (index!39265 (_ BitVec 32)) (x!86712 (_ BitVec 32))) (Undefined!9223) (MissingVacant!9223 (index!39266 (_ BitVec 32))) )
))
(declare-fun lt!440723 () SeekEntryResult!9223)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62904 (_ BitVec 32)) SeekEntryResult!9223)

(assert (=> b!994523 (= lt!440723 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!665033 () Bool)

(assert (=> start!85698 (=> (not res!665033) (not e!561256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85698 (= res!665033 (validMask!0 mask!3464))))

(assert (=> start!85698 e!561256))

(declare-fun array_inv!23415 (array!62904) Bool)

(assert (=> start!85698 (array_inv!23415 a!3219)))

(assert (=> start!85698 true))

(declare-fun b!994524 () Bool)

(declare-fun res!665031 () Bool)

(assert (=> b!994524 (=> (not res!665031) (not e!561256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994524 (= res!665031 (validKeyInArray!0 k!2224))))

(declare-fun b!994525 () Bool)

(declare-fun res!665032 () Bool)

(assert (=> b!994525 (=> (not res!665032) (not e!561256))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994525 (= res!665032 (and (= (size!30793 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30793 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30793 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994526 () Bool)

(declare-fun res!665034 () Bool)

(assert (=> b!994526 (=> (not res!665034) (not e!561256))))

(assert (=> b!994526 (= res!665034 (validKeyInArray!0 (select (arr!30291 a!3219) j!170)))))

(declare-fun b!994527 () Bool)

(declare-fun res!665030 () Bool)

(assert (=> b!994527 (=> (not res!665030) (not e!561256))))

(declare-fun arrayContainsKey!0 (array!62904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994527 (= res!665030 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85698 res!665033) b!994525))

(assert (= (and b!994525 res!665032) b!994526))

(assert (= (and b!994526 res!665034) b!994524))

(assert (= (and b!994524 res!665031) b!994527))

(assert (= (and b!994527 res!665030) b!994523))

(declare-fun m!922095 () Bool)

(assert (=> start!85698 m!922095))

(declare-fun m!922097 () Bool)

(assert (=> start!85698 m!922097))

(declare-fun m!922099 () Bool)

(assert (=> b!994527 m!922099))

(declare-fun m!922101 () Bool)

(assert (=> b!994523 m!922101))

(declare-fun m!922103 () Bool)

(assert (=> b!994524 m!922103))

(declare-fun m!922105 () Bool)

(assert (=> b!994526 m!922105))

(assert (=> b!994526 m!922105))

(declare-fun m!922107 () Bool)

(assert (=> b!994526 m!922107))

(push 1)

(assert (not b!994524))

(assert (not b!994527))

(assert (not b!994523))

(assert (not b!994526))

(assert (not start!85698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

