; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49200 () Bool)

(assert start!49200)

(declare-fun res!336531 () Bool)

(declare-fun e!313667 () Bool)

(assert (=> start!49200 (=> (not res!336531) (not e!313667))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49200 (= res!336531 (validMask!0 mask!3216))))

(assert (=> start!49200 e!313667))

(assert (=> start!49200 true))

(declare-datatypes ((array!34259 0))(
  ( (array!34260 (arr!16464 (Array (_ BitVec 32) (_ BitVec 64))) (size!16828 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34259)

(declare-fun array_inv!12260 (array!34259) Bool)

(assert (=> start!49200 (array_inv!12260 a!3154)))

(declare-fun b!541796 () Bool)

(declare-fun res!336533 () Bool)

(assert (=> b!541796 (=> (not res!336533) (not e!313667))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541796 (= res!336533 (validKeyInArray!0 k!1998))))

(declare-fun b!541797 () Bool)

(declare-fun res!336529 () Bool)

(declare-fun e!313666 () Bool)

(assert (=> b!541797 (=> (not res!336529) (not e!313666))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4922 0))(
  ( (MissingZero!4922 (index!21912 (_ BitVec 32))) (Found!4922 (index!21913 (_ BitVec 32))) (Intermediate!4922 (undefined!5734 Bool) (index!21914 (_ BitVec 32)) (x!50827 (_ BitVec 32))) (Undefined!4922) (MissingVacant!4922 (index!21915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34259 (_ BitVec 32)) SeekEntryResult!4922)

(assert (=> b!541797 (= res!336529 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16464 a!3154) j!147) a!3154 mask!3216) (Intermediate!4922 false resIndex!32 resX!32)))))

(declare-fun b!541798 () Bool)

(declare-fun res!336532 () Bool)

(assert (=> b!541798 (=> (not res!336532) (not e!313666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34259 (_ BitVec 32)) Bool)

(assert (=> b!541798 (= res!336532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541799 () Bool)

(declare-fun res!336526 () Bool)

(assert (=> b!541799 (=> (not res!336526) (not e!313667))))

(declare-fun arrayContainsKey!0 (array!34259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541799 (= res!336526 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541800 () Bool)

(declare-fun res!336530 () Bool)

(assert (=> b!541800 (=> (not res!336530) (not e!313667))))

(assert (=> b!541800 (= res!336530 (validKeyInArray!0 (select (arr!16464 a!3154) j!147)))))

(declare-fun b!541801 () Bool)

(assert (=> b!541801 (= e!313667 e!313666)))

(declare-fun res!336525 () Bool)

(assert (=> b!541801 (=> (not res!336525) (not e!313666))))

(declare-fun lt!247735 () SeekEntryResult!4922)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541801 (= res!336525 (or (= lt!247735 (MissingZero!4922 i!1153)) (= lt!247735 (MissingVacant!4922 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34259 (_ BitVec 32)) SeekEntryResult!4922)

(assert (=> b!541801 (= lt!247735 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541802 () Bool)

(declare-fun res!336528 () Bool)

(assert (=> b!541802 (=> (not res!336528) (not e!313666))))

(assert (=> b!541802 (= res!336528 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16828 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16828 a!3154)) (= (select (arr!16464 a!3154) resIndex!32) (select (arr!16464 a!3154) j!147))))))

(declare-fun b!541803 () Bool)

(assert (=> b!541803 (= e!313666 false)))

(declare-fun lt!247734 () SeekEntryResult!4922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541803 (= lt!247734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16464 a!3154) j!147) mask!3216) (select (arr!16464 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541804 () Bool)

(declare-fun res!336527 () Bool)

(assert (=> b!541804 (=> (not res!336527) (not e!313667))))

(assert (=> b!541804 (= res!336527 (and (= (size!16828 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16828 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16828 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541805 () Bool)

(declare-fun res!336524 () Bool)

(assert (=> b!541805 (=> (not res!336524) (not e!313666))))

(declare-datatypes ((List!10583 0))(
  ( (Nil!10580) (Cons!10579 (h!11531 (_ BitVec 64)) (t!16811 List!10583)) )
))
(declare-fun arrayNoDuplicates!0 (array!34259 (_ BitVec 32) List!10583) Bool)

(assert (=> b!541805 (= res!336524 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10580))))

(assert (= (and start!49200 res!336531) b!541804))

(assert (= (and b!541804 res!336527) b!541800))

(assert (= (and b!541800 res!336530) b!541796))

(assert (= (and b!541796 res!336533) b!541799))

(assert (= (and b!541799 res!336526) b!541801))

(assert (= (and b!541801 res!336525) b!541798))

(assert (= (and b!541798 res!336532) b!541805))

(assert (= (and b!541805 res!336524) b!541802))

(assert (= (and b!541802 res!336528) b!541797))

(assert (= (and b!541797 res!336529) b!541803))

(declare-fun m!520233 () Bool)

(assert (=> b!541801 m!520233))

(declare-fun m!520235 () Bool)

(assert (=> b!541800 m!520235))

(assert (=> b!541800 m!520235))

(declare-fun m!520237 () Bool)

(assert (=> b!541800 m!520237))

(declare-fun m!520239 () Bool)

(assert (=> b!541799 m!520239))

(declare-fun m!520241 () Bool)

(assert (=> start!49200 m!520241))

(declare-fun m!520243 () Bool)

(assert (=> start!49200 m!520243))

(assert (=> b!541803 m!520235))

(assert (=> b!541803 m!520235))

(declare-fun m!520245 () Bool)

(assert (=> b!541803 m!520245))

(assert (=> b!541803 m!520245))

(assert (=> b!541803 m!520235))

(declare-fun m!520247 () Bool)

(assert (=> b!541803 m!520247))

(assert (=> b!541797 m!520235))

(assert (=> b!541797 m!520235))

(declare-fun m!520249 () Bool)

(assert (=> b!541797 m!520249))

(declare-fun m!520251 () Bool)

(assert (=> b!541802 m!520251))

(assert (=> b!541802 m!520235))

(declare-fun m!520253 () Bool)

(assert (=> b!541796 m!520253))

(declare-fun m!520255 () Bool)

(assert (=> b!541805 m!520255))

(declare-fun m!520257 () Bool)

(assert (=> b!541798 m!520257))

(push 1)

