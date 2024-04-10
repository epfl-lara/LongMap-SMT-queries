; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49202 () Bool)

(assert start!49202)

(declare-fun b!541826 () Bool)

(declare-fun res!336561 () Bool)

(declare-fun e!313676 () Bool)

(assert (=> b!541826 (=> (not res!336561) (not e!313676))))

(declare-datatypes ((array!34261 0))(
  ( (array!34262 (arr!16465 (Array (_ BitVec 32) (_ BitVec 64))) (size!16829 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34261)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34261 (_ BitVec 32)) Bool)

(assert (=> b!541826 (= res!336561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541827 () Bool)

(declare-fun res!336563 () Bool)

(assert (=> b!541827 (=> (not res!336563) (not e!313676))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4923 0))(
  ( (MissingZero!4923 (index!21916 (_ BitVec 32))) (Found!4923 (index!21917 (_ BitVec 32))) (Intermediate!4923 (undefined!5735 Bool) (index!21918 (_ BitVec 32)) (x!50828 (_ BitVec 32))) (Undefined!4923) (MissingVacant!4923 (index!21919 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34261 (_ BitVec 32)) SeekEntryResult!4923)

(assert (=> b!541827 (= res!336563 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16465 a!3154) j!147) a!3154 mask!3216) (Intermediate!4923 false resIndex!32 resX!32)))))

(declare-fun b!541828 () Bool)

(declare-fun res!336559 () Bool)

(declare-fun e!313677 () Bool)

(assert (=> b!541828 (=> (not res!336559) (not e!313677))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541828 (= res!336559 (and (= (size!16829 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16829 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16829 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541829 () Bool)

(assert (=> b!541829 (= e!313677 e!313676)))

(declare-fun res!336558 () Bool)

(assert (=> b!541829 (=> (not res!336558) (not e!313676))))

(declare-fun lt!247740 () SeekEntryResult!4923)

(assert (=> b!541829 (= res!336558 (or (= lt!247740 (MissingZero!4923 i!1153)) (= lt!247740 (MissingVacant!4923 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34261 (_ BitVec 32)) SeekEntryResult!4923)

(assert (=> b!541829 (= lt!247740 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541831 () Bool)

(declare-fun res!336560 () Bool)

(assert (=> b!541831 (=> (not res!336560) (not e!313676))))

(assert (=> b!541831 (= res!336560 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16829 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16829 a!3154)) (= (select (arr!16465 a!3154) resIndex!32) (select (arr!16465 a!3154) j!147))))))

(declare-fun b!541832 () Bool)

(declare-fun res!336555 () Bool)

(assert (=> b!541832 (=> (not res!336555) (not e!313676))))

(declare-datatypes ((List!10584 0))(
  ( (Nil!10581) (Cons!10580 (h!11532 (_ BitVec 64)) (t!16812 List!10584)) )
))
(declare-fun arrayNoDuplicates!0 (array!34261 (_ BitVec 32) List!10584) Bool)

(assert (=> b!541832 (= res!336555 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10581))))

(declare-fun b!541833 () Bool)

(declare-fun res!336556 () Bool)

(assert (=> b!541833 (=> (not res!336556) (not e!313677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541833 (= res!336556 (validKeyInArray!0 (select (arr!16465 a!3154) j!147)))))

(declare-fun b!541834 () Bool)

(declare-fun res!336557 () Bool)

(assert (=> b!541834 (=> (not res!336557) (not e!313677))))

(assert (=> b!541834 (= res!336557 (validKeyInArray!0 k0!1998))))

(declare-fun b!541835 () Bool)

(declare-fun res!336554 () Bool)

(assert (=> b!541835 (=> (not res!336554) (not e!313677))))

(declare-fun arrayContainsKey!0 (array!34261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541835 (= res!336554 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336562 () Bool)

(assert (=> start!49202 (=> (not res!336562) (not e!313677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49202 (= res!336562 (validMask!0 mask!3216))))

(assert (=> start!49202 e!313677))

(assert (=> start!49202 true))

(declare-fun array_inv!12261 (array!34261) Bool)

(assert (=> start!49202 (array_inv!12261 a!3154)))

(declare-fun b!541830 () Bool)

(assert (=> b!541830 (= e!313676 false)))

(declare-fun lt!247741 () SeekEntryResult!4923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541830 (= lt!247741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16465 a!3154) j!147) mask!3216) (select (arr!16465 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49202 res!336562) b!541828))

(assert (= (and b!541828 res!336559) b!541833))

(assert (= (and b!541833 res!336556) b!541834))

(assert (= (and b!541834 res!336557) b!541835))

(assert (= (and b!541835 res!336554) b!541829))

(assert (= (and b!541829 res!336558) b!541826))

(assert (= (and b!541826 res!336561) b!541832))

(assert (= (and b!541832 res!336555) b!541831))

(assert (= (and b!541831 res!336560) b!541827))

(assert (= (and b!541827 res!336563) b!541830))

(declare-fun m!520259 () Bool)

(assert (=> b!541827 m!520259))

(assert (=> b!541827 m!520259))

(declare-fun m!520261 () Bool)

(assert (=> b!541827 m!520261))

(assert (=> b!541833 m!520259))

(assert (=> b!541833 m!520259))

(declare-fun m!520263 () Bool)

(assert (=> b!541833 m!520263))

(assert (=> b!541830 m!520259))

(assert (=> b!541830 m!520259))

(declare-fun m!520265 () Bool)

(assert (=> b!541830 m!520265))

(assert (=> b!541830 m!520265))

(assert (=> b!541830 m!520259))

(declare-fun m!520267 () Bool)

(assert (=> b!541830 m!520267))

(declare-fun m!520269 () Bool)

(assert (=> b!541835 m!520269))

(declare-fun m!520271 () Bool)

(assert (=> start!49202 m!520271))

(declare-fun m!520273 () Bool)

(assert (=> start!49202 m!520273))

(declare-fun m!520275 () Bool)

(assert (=> b!541826 m!520275))

(declare-fun m!520277 () Bool)

(assert (=> b!541834 m!520277))

(declare-fun m!520279 () Bool)

(assert (=> b!541832 m!520279))

(declare-fun m!520281 () Bool)

(assert (=> b!541831 m!520281))

(assert (=> b!541831 m!520259))

(declare-fun m!520283 () Bool)

(assert (=> b!541829 m!520283))

(check-sat (not b!541833) (not start!49202) (not b!541832) (not b!541834) (not b!541830) (not b!541829) (not b!541835) (not b!541827) (not b!541826))
(check-sat)
