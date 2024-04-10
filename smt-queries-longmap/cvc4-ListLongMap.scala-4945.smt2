; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68062 () Bool)

(assert start!68062)

(declare-fun b!791822 () Bool)

(declare-fun res!536559 () Bool)

(declare-fun e!439999 () Bool)

(assert (=> b!791822 (=> (not res!536559) (not e!439999))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791822 (= res!536559 (validKeyInArray!0 k!2044))))

(declare-fun res!536558 () Bool)

(assert (=> start!68062 (=> (not res!536558) (not e!439999))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68062 (= res!536558 (validMask!0 mask!3266))))

(assert (=> start!68062 e!439999))

(assert (=> start!68062 true))

(declare-datatypes ((array!42965 0))(
  ( (array!42966 (arr!20567 (Array (_ BitVec 32) (_ BitVec 64))) (size!20988 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42965)

(declare-fun array_inv!16363 (array!42965) Bool)

(assert (=> start!68062 (array_inv!16363 a!3170)))

(declare-fun b!791823 () Bool)

(declare-fun res!536557 () Bool)

(assert (=> b!791823 (=> (not res!536557) (not e!439999))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791823 (= res!536557 (and (= (size!20988 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20988 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20988 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791824 () Bool)

(declare-fun res!536561 () Bool)

(assert (=> b!791824 (=> (not res!536561) (not e!439999))))

(assert (=> b!791824 (= res!536561 (validKeyInArray!0 (select (arr!20567 a!3170) j!153)))))

(declare-fun b!791825 () Bool)

(assert (=> b!791825 (= e!439999 false)))

(declare-datatypes ((SeekEntryResult!8158 0))(
  ( (MissingZero!8158 (index!35000 (_ BitVec 32))) (Found!8158 (index!35001 (_ BitVec 32))) (Intermediate!8158 (undefined!8970 Bool) (index!35002 (_ BitVec 32)) (x!65956 (_ BitVec 32))) (Undefined!8158) (MissingVacant!8158 (index!35003 (_ BitVec 32))) )
))
(declare-fun lt!353312 () SeekEntryResult!8158)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42965 (_ BitVec 32)) SeekEntryResult!8158)

(assert (=> b!791825 (= lt!353312 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791826 () Bool)

(declare-fun res!536560 () Bool)

(assert (=> b!791826 (=> (not res!536560) (not e!439999))))

(declare-fun arrayContainsKey!0 (array!42965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791826 (= res!536560 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68062 res!536558) b!791823))

(assert (= (and b!791823 res!536557) b!791824))

(assert (= (and b!791824 res!536561) b!791822))

(assert (= (and b!791822 res!536559) b!791826))

(assert (= (and b!791826 res!536560) b!791825))

(declare-fun m!732531 () Bool)

(assert (=> b!791824 m!732531))

(assert (=> b!791824 m!732531))

(declare-fun m!732533 () Bool)

(assert (=> b!791824 m!732533))

(declare-fun m!732535 () Bool)

(assert (=> b!791822 m!732535))

(declare-fun m!732537 () Bool)

(assert (=> b!791826 m!732537))

(declare-fun m!732539 () Bool)

(assert (=> b!791825 m!732539))

(declare-fun m!732541 () Bool)

(assert (=> start!68062 m!732541))

(declare-fun m!732543 () Bool)

(assert (=> start!68062 m!732543))

(push 1)

(assert (not b!791822))

(assert (not b!791825))

(assert (not b!791826))

(assert (not b!791824))

