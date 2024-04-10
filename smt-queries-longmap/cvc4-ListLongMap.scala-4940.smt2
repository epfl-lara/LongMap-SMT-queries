; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68020 () Bool)

(assert start!68020)

(declare-fun b!791591 () Bool)

(declare-fun res!536325 () Bool)

(declare-fun e!439909 () Bool)

(assert (=> b!791591 (=> (not res!536325) (not e!439909))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791591 (= res!536325 (validKeyInArray!0 k!2044))))

(declare-fun b!791590 () Bool)

(declare-fun res!536327 () Bool)

(assert (=> b!791590 (=> (not res!536327) (not e!439909))))

(declare-datatypes ((array!42934 0))(
  ( (array!42935 (arr!20552 (Array (_ BitVec 32) (_ BitVec 64))) (size!20973 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42934)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791590 (= res!536327 (validKeyInArray!0 (select (arr!20552 a!3170) j!153)))))

(declare-fun b!791589 () Bool)

(declare-fun res!536326 () Bool)

(assert (=> b!791589 (=> (not res!536326) (not e!439909))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791589 (= res!536326 (and (= (size!20973 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20973 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20973 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536324 () Bool)

(assert (=> start!68020 (=> (not res!536324) (not e!439909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68020 (= res!536324 (validMask!0 mask!3266))))

(assert (=> start!68020 e!439909))

(assert (=> start!68020 true))

(declare-fun array_inv!16348 (array!42934) Bool)

(assert (=> start!68020 (array_inv!16348 a!3170)))

(declare-fun b!791592 () Bool)

(assert (=> b!791592 (= e!439909 (and (bvslt #b00000000000000000000000000000000 (size!20973 a!3170)) (bvsge (size!20973 a!3170) #b01111111111111111111111111111111)))))

(assert (= (and start!68020 res!536324) b!791589))

(assert (= (and b!791589 res!536326) b!791590))

(assert (= (and b!791590 res!536327) b!791591))

(assert (= (and b!791591 res!536325) b!791592))

(declare-fun m!732331 () Bool)

(assert (=> b!791591 m!732331))

(declare-fun m!732333 () Bool)

(assert (=> b!791590 m!732333))

(assert (=> b!791590 m!732333))

(declare-fun m!732335 () Bool)

(assert (=> b!791590 m!732335))

(declare-fun m!732337 () Bool)

(assert (=> start!68020 m!732337))

(declare-fun m!732339 () Bool)

(assert (=> start!68020 m!732339))

(push 1)

(assert (not start!68020))

(assert (not b!791590))

(assert (not b!791591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

