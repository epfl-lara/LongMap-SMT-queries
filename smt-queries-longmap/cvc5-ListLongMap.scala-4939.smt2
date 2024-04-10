; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68010 () Bool)

(assert start!68010)

(declare-fun b!791532 () Bool)

(declare-fun e!439880 () Bool)

(declare-datatypes ((array!42924 0))(
  ( (array!42925 (arr!20547 (Array (_ BitVec 32) (_ BitVec 64))) (size!20968 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42924)

(assert (=> b!791532 (= e!439880 (bvsge #b00000000000000000000000000000000 (size!20968 a!3170)))))

(declare-fun b!791529 () Bool)

(declare-fun res!536266 () Bool)

(assert (=> b!791529 (=> (not res!536266) (not e!439880))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791529 (= res!536266 (and (= (size!20968 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20968 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20968 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791531 () Bool)

(declare-fun res!536265 () Bool)

(assert (=> b!791531 (=> (not res!536265) (not e!439880))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791531 (= res!536265 (validKeyInArray!0 k!2044))))

(declare-fun res!536267 () Bool)

(assert (=> start!68010 (=> (not res!536267) (not e!439880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68010 (= res!536267 (validMask!0 mask!3266))))

(assert (=> start!68010 e!439880))

(assert (=> start!68010 true))

(declare-fun array_inv!16343 (array!42924) Bool)

(assert (=> start!68010 (array_inv!16343 a!3170)))

(declare-fun b!791530 () Bool)

(declare-fun res!536264 () Bool)

(assert (=> b!791530 (=> (not res!536264) (not e!439880))))

(assert (=> b!791530 (= res!536264 (validKeyInArray!0 (select (arr!20547 a!3170) j!153)))))

(assert (= (and start!68010 res!536267) b!791529))

(assert (= (and b!791529 res!536266) b!791530))

(assert (= (and b!791530 res!536264) b!791531))

(assert (= (and b!791531 res!536265) b!791532))

(declare-fun m!732281 () Bool)

(assert (=> b!791531 m!732281))

(declare-fun m!732283 () Bool)

(assert (=> start!68010 m!732283))

(declare-fun m!732285 () Bool)

(assert (=> start!68010 m!732285))

(declare-fun m!732287 () Bool)

(assert (=> b!791530 m!732287))

(assert (=> b!791530 m!732287))

(declare-fun m!732289 () Bool)

(assert (=> b!791530 m!732289))

(push 1)

(assert (not start!68010))

(assert (not b!791531))

(assert (not b!791530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

