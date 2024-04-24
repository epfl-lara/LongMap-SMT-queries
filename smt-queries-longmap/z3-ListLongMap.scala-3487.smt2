; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48382 () Bool)

(assert start!48382)

(declare-fun b!531658 () Bool)

(declare-fun res!327205 () Bool)

(declare-fun e!309658 () Bool)

(assert (=> b!531658 (=> (not res!327205) (not e!309658))))

(declare-datatypes ((array!33689 0))(
  ( (array!33690 (arr!16186 (Array (_ BitVec 32) (_ BitVec 64))) (size!16550 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33689)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531658 (= res!327205 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531659 () Bool)

(declare-fun res!327203 () Bool)

(assert (=> b!531659 (=> (not res!327203) (not e!309658))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531659 (= res!327203 (and (= (size!16550 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16550 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16550 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531660 () Bool)

(declare-fun res!327206 () Bool)

(assert (=> b!531660 (=> (not res!327206) (not e!309658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531660 (= res!327206 (validKeyInArray!0 k0!1998))))

(declare-fun b!531661 () Bool)

(declare-fun e!309659 () Bool)

(assert (=> b!531661 (= e!309658 e!309659)))

(declare-fun res!327207 () Bool)

(assert (=> b!531661 (=> (not res!327207) (not e!309659))))

(declare-datatypes ((SeekEntryResult!4600 0))(
  ( (MissingZero!4600 (index!20624 (_ BitVec 32))) (Found!4600 (index!20625 (_ BitVec 32))) (Intermediate!4600 (undefined!5412 Bool) (index!20626 (_ BitVec 32)) (x!49747 (_ BitVec 32))) (Undefined!4600) (MissingVacant!4600 (index!20627 (_ BitVec 32))) )
))
(declare-fun lt!245074 () SeekEntryResult!4600)

(assert (=> b!531661 (= res!327207 (or (= lt!245074 (MissingZero!4600 i!1153)) (= lt!245074 (MissingVacant!4600 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33689 (_ BitVec 32)) SeekEntryResult!4600)

(assert (=> b!531661 (= lt!245074 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531662 () Bool)

(declare-fun res!327208 () Bool)

(assert (=> b!531662 (=> (not res!327208) (not e!309659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33689 (_ BitVec 32)) Bool)

(assert (=> b!531662 (= res!327208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531663 () Bool)

(assert (=> b!531663 (= e!309659 false)))

(declare-fun lt!245073 () Bool)

(declare-datatypes ((List!10212 0))(
  ( (Nil!10209) (Cons!10208 (h!11148 (_ BitVec 64)) (t!16432 List!10212)) )
))
(declare-fun arrayNoDuplicates!0 (array!33689 (_ BitVec 32) List!10212) Bool)

(assert (=> b!531663 (= lt!245073 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10209))))

(declare-fun res!327202 () Bool)

(assert (=> start!48382 (=> (not res!327202) (not e!309658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48382 (= res!327202 (validMask!0 mask!3216))))

(assert (=> start!48382 e!309658))

(assert (=> start!48382 true))

(declare-fun array_inv!12045 (array!33689) Bool)

(assert (=> start!48382 (array_inv!12045 a!3154)))

(declare-fun b!531664 () Bool)

(declare-fun res!327204 () Bool)

(assert (=> b!531664 (=> (not res!327204) (not e!309658))))

(assert (=> b!531664 (= res!327204 (validKeyInArray!0 (select (arr!16186 a!3154) j!147)))))

(assert (= (and start!48382 res!327202) b!531659))

(assert (= (and b!531659 res!327203) b!531664))

(assert (= (and b!531664 res!327204) b!531660))

(assert (= (and b!531660 res!327206) b!531658))

(assert (= (and b!531658 res!327205) b!531661))

(assert (= (and b!531661 res!327207) b!531662))

(assert (= (and b!531662 res!327208) b!531663))

(declare-fun m!512269 () Bool)

(assert (=> b!531661 m!512269))

(declare-fun m!512271 () Bool)

(assert (=> b!531662 m!512271))

(declare-fun m!512273 () Bool)

(assert (=> b!531664 m!512273))

(assert (=> b!531664 m!512273))

(declare-fun m!512275 () Bool)

(assert (=> b!531664 m!512275))

(declare-fun m!512277 () Bool)

(assert (=> b!531658 m!512277))

(declare-fun m!512279 () Bool)

(assert (=> b!531663 m!512279))

(declare-fun m!512281 () Bool)

(assert (=> b!531660 m!512281))

(declare-fun m!512283 () Bool)

(assert (=> start!48382 m!512283))

(declare-fun m!512285 () Bool)

(assert (=> start!48382 m!512285))

(check-sat (not b!531658) (not b!531662) (not b!531664) (not start!48382) (not b!531663) (not b!531660) (not b!531661))
(check-sat)
