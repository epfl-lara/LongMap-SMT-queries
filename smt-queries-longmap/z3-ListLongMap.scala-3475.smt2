; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48194 () Bool)

(assert start!48194)

(declare-fun res!326360 () Bool)

(declare-fun e!309146 () Bool)

(assert (=> start!48194 (=> (not res!326360) (not e!309146))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48194 (= res!326360 (validMask!0 mask!3216))))

(assert (=> start!48194 e!309146))

(assert (=> start!48194 true))

(declare-datatypes ((array!33619 0))(
  ( (array!33620 (arr!16156 (Array (_ BitVec 32) (_ BitVec 64))) (size!16520 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33619)

(declare-fun array_inv!11952 (array!33619) Bool)

(assert (=> start!48194 (array_inv!11952 a!3154)))

(declare-fun b!530653 () Bool)

(declare-fun res!326359 () Bool)

(assert (=> b!530653 (=> (not res!326359) (not e!309146))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530653 (= res!326359 (validKeyInArray!0 (select (arr!16156 a!3154) j!147)))))

(declare-fun b!530654 () Bool)

(declare-fun res!326361 () Bool)

(assert (=> b!530654 (=> (not res!326361) (not e!309146))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530654 (= res!326361 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530655 () Bool)

(declare-fun res!326362 () Bool)

(assert (=> b!530655 (=> (not res!326362) (not e!309146))))

(assert (=> b!530655 (= res!326362 (validKeyInArray!0 k0!1998))))

(declare-fun b!530656 () Bool)

(declare-fun res!326363 () Bool)

(assert (=> b!530656 (=> (not res!326363) (not e!309146))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530656 (= res!326363 (and (= (size!16520 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16520 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16520 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530657 () Bool)

(assert (=> b!530657 (= e!309146 false)))

(declare-datatypes ((SeekEntryResult!4614 0))(
  ( (MissingZero!4614 (index!20680 (_ BitVec 32))) (Found!4614 (index!20681 (_ BitVec 32))) (Intermediate!4614 (undefined!5426 Bool) (index!20682 (_ BitVec 32)) (x!49668 (_ BitVec 32))) (Undefined!4614) (MissingVacant!4614 (index!20683 (_ BitVec 32))) )
))
(declare-fun lt!244771 () SeekEntryResult!4614)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33619 (_ BitVec 32)) SeekEntryResult!4614)

(assert (=> b!530657 (= lt!244771 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48194 res!326360) b!530656))

(assert (= (and b!530656 res!326363) b!530653))

(assert (= (and b!530653 res!326359) b!530655))

(assert (= (and b!530655 res!326362) b!530654))

(assert (= (and b!530654 res!326361) b!530657))

(declare-fun m!511211 () Bool)

(assert (=> b!530655 m!511211))

(declare-fun m!511213 () Bool)

(assert (=> b!530653 m!511213))

(assert (=> b!530653 m!511213))

(declare-fun m!511215 () Bool)

(assert (=> b!530653 m!511215))

(declare-fun m!511217 () Bool)

(assert (=> b!530654 m!511217))

(declare-fun m!511219 () Bool)

(assert (=> b!530657 m!511219))

(declare-fun m!511221 () Bool)

(assert (=> start!48194 m!511221))

(declare-fun m!511223 () Bool)

(assert (=> start!48194 m!511223))

(check-sat (not b!530657) (not start!48194) (not b!530653) (not b!530655) (not b!530654))
