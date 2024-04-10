; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68016 () Bool)

(assert start!68016)

(declare-fun b!791567 () Bool)

(declare-fun res!536300 () Bool)

(declare-fun e!439897 () Bool)

(assert (=> b!791567 (=> (not res!536300) (not e!439897))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791567 (= res!536300 (validKeyInArray!0 k!2044))))

(declare-fun b!791565 () Bool)

(declare-fun res!536302 () Bool)

(assert (=> b!791565 (=> (not res!536302) (not e!439897))))

(declare-datatypes ((array!42930 0))(
  ( (array!42931 (arr!20550 (Array (_ BitVec 32) (_ BitVec 64))) (size!20971 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42930)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791565 (= res!536302 (and (= (size!20971 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20971 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20971 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791566 () Bool)

(declare-fun res!536303 () Bool)

(assert (=> b!791566 (=> (not res!536303) (not e!439897))))

(assert (=> b!791566 (= res!536303 (validKeyInArray!0 (select (arr!20550 a!3170) j!153)))))

(declare-fun res!536301 () Bool)

(assert (=> start!68016 (=> (not res!536301) (not e!439897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68016 (= res!536301 (validMask!0 mask!3266))))

(assert (=> start!68016 e!439897))

(assert (=> start!68016 true))

(declare-fun array_inv!16346 (array!42930) Bool)

(assert (=> start!68016 (array_inv!16346 a!3170)))

(declare-fun b!791568 () Bool)

(assert (=> b!791568 (= e!439897 (and (bvslt #b00000000000000000000000000000000 (size!20971 a!3170)) (bvsge (size!20971 a!3170) #b01111111111111111111111111111111)))))

(assert (= (and start!68016 res!536301) b!791565))

(assert (= (and b!791565 res!536302) b!791566))

(assert (= (and b!791566 res!536303) b!791567))

(assert (= (and b!791567 res!536300) b!791568))

(declare-fun m!732311 () Bool)

(assert (=> b!791567 m!732311))

(declare-fun m!732313 () Bool)

(assert (=> b!791566 m!732313))

(assert (=> b!791566 m!732313))

(declare-fun m!732315 () Bool)

(assert (=> b!791566 m!732315))

(declare-fun m!732317 () Bool)

(assert (=> start!68016 m!732317))

(declare-fun m!732319 () Bool)

(assert (=> start!68016 m!732319))

(push 1)

(assert (not b!791566))

(assert (not b!791567))

(assert (not start!68016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

