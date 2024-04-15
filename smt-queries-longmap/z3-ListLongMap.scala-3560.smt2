; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48918 () Bool)

(assert start!48918)

(declare-fun b!539088 () Bool)

(declare-fun res!334436 () Bool)

(declare-fun e!312469 () Bool)

(assert (=> b!539088 (=> (not res!334436) (not e!312469))))

(declare-datatypes ((array!34140 0))(
  ( (array!34141 (arr!16409 (Array (_ BitVec 32) (_ BitVec 64))) (size!16774 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34140)

(declare-datatypes ((List!10567 0))(
  ( (Nil!10564) (Cons!10563 (h!11506 (_ BitVec 64)) (t!16786 List!10567)) )
))
(declare-fun arrayNoDuplicates!0 (array!34140 (_ BitVec 32) List!10567) Bool)

(assert (=> b!539088 (= res!334436 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10564))))

(declare-fun b!539089 () Bool)

(declare-fun res!334437 () Bool)

(declare-fun e!312468 () Bool)

(assert (=> b!539089 (=> (not res!334437) (not e!312468))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539089 (= res!334437 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539090 () Bool)

(declare-fun res!334440 () Bool)

(declare-fun e!312471 () Bool)

(assert (=> b!539090 (=> (not res!334440) (not e!312471))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4864 0))(
  ( (MissingZero!4864 (index!21680 (_ BitVec 32))) (Found!4864 (index!21681 (_ BitVec 32))) (Intermediate!4864 (undefined!5676 Bool) (index!21682 (_ BitVec 32)) (x!50602 (_ BitVec 32))) (Undefined!4864) (MissingVacant!4864 (index!21683 (_ BitVec 32))) )
))
(declare-fun lt!246889 () SeekEntryResult!4864)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34140 (_ BitVec 32)) SeekEntryResult!4864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539090 (= res!334440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16409 a!3154) j!147) mask!3216) (select (arr!16409 a!3154) j!147) a!3154 mask!3216) lt!246889))))

(declare-fun b!539091 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!539091 (= e!312471 (bvslt (bvsub #b01111111111111111111111111111110 x!1030) #b00000000000000000000000000000000))))

(declare-fun b!539092 () Bool)

(declare-fun res!334443 () Bool)

(assert (=> b!539092 (=> (not res!334443) (not e!312468))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539092 (= res!334443 (and (= (size!16774 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16774 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16774 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539093 () Bool)

(assert (=> b!539093 (= e!312468 e!312469)))

(declare-fun res!334435 () Bool)

(assert (=> b!539093 (=> (not res!334435) (not e!312469))))

(declare-fun lt!246888 () SeekEntryResult!4864)

(assert (=> b!539093 (= res!334435 (or (= lt!246888 (MissingZero!4864 i!1153)) (= lt!246888 (MissingVacant!4864 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34140 (_ BitVec 32)) SeekEntryResult!4864)

(assert (=> b!539093 (= lt!246888 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539094 () Bool)

(declare-fun res!334439 () Bool)

(assert (=> b!539094 (=> (not res!334439) (not e!312468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539094 (= res!334439 (validKeyInArray!0 (select (arr!16409 a!3154) j!147)))))

(declare-fun b!539095 () Bool)

(declare-fun res!334441 () Bool)

(assert (=> b!539095 (=> (not res!334441) (not e!312469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34140 (_ BitVec 32)) Bool)

(assert (=> b!539095 (= res!334441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539096 () Bool)

(assert (=> b!539096 (= e!312469 e!312471)))

(declare-fun res!334445 () Bool)

(assert (=> b!539096 (=> (not res!334445) (not e!312471))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539096 (= res!334445 (= lt!246889 (Intermediate!4864 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!539096 (= lt!246889 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16409 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539098 () Bool)

(declare-fun res!334442 () Bool)

(assert (=> b!539098 (=> (not res!334442) (not e!312469))))

(assert (=> b!539098 (= res!334442 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16774 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16774 a!3154)) (= (select (arr!16409 a!3154) resIndex!32) (select (arr!16409 a!3154) j!147))))))

(declare-fun res!334438 () Bool)

(assert (=> start!48918 (=> (not res!334438) (not e!312468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48918 (= res!334438 (validMask!0 mask!3216))))

(assert (=> start!48918 e!312468))

(assert (=> start!48918 true))

(declare-fun array_inv!12292 (array!34140) Bool)

(assert (=> start!48918 (array_inv!12292 a!3154)))

(declare-fun b!539097 () Bool)

(declare-fun res!334444 () Bool)

(assert (=> b!539097 (=> (not res!334444) (not e!312468))))

(assert (=> b!539097 (= res!334444 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48918 res!334438) b!539092))

(assert (= (and b!539092 res!334443) b!539094))

(assert (= (and b!539094 res!334439) b!539097))

(assert (= (and b!539097 res!334444) b!539089))

(assert (= (and b!539089 res!334437) b!539093))

(assert (= (and b!539093 res!334435) b!539095))

(assert (= (and b!539095 res!334441) b!539088))

(assert (= (and b!539088 res!334436) b!539098))

(assert (= (and b!539098 res!334442) b!539096))

(assert (= (and b!539096 res!334445) b!539090))

(assert (= (and b!539090 res!334440) b!539091))

(declare-fun m!517645 () Bool)

(assert (=> b!539090 m!517645))

(assert (=> b!539090 m!517645))

(declare-fun m!517647 () Bool)

(assert (=> b!539090 m!517647))

(assert (=> b!539090 m!517647))

(assert (=> b!539090 m!517645))

(declare-fun m!517649 () Bool)

(assert (=> b!539090 m!517649))

(assert (=> b!539094 m!517645))

(assert (=> b!539094 m!517645))

(declare-fun m!517651 () Bool)

(assert (=> b!539094 m!517651))

(declare-fun m!517653 () Bool)

(assert (=> b!539097 m!517653))

(declare-fun m!517655 () Bool)

(assert (=> b!539089 m!517655))

(declare-fun m!517657 () Bool)

(assert (=> b!539093 m!517657))

(assert (=> b!539096 m!517645))

(assert (=> b!539096 m!517645))

(declare-fun m!517659 () Bool)

(assert (=> b!539096 m!517659))

(declare-fun m!517661 () Bool)

(assert (=> start!48918 m!517661))

(declare-fun m!517663 () Bool)

(assert (=> start!48918 m!517663))

(declare-fun m!517665 () Bool)

(assert (=> b!539098 m!517665))

(assert (=> b!539098 m!517645))

(declare-fun m!517667 () Bool)

(assert (=> b!539095 m!517667))

(declare-fun m!517669 () Bool)

(assert (=> b!539088 m!517669))

(check-sat (not b!539095) (not b!539093) (not start!48918) (not b!539089) (not b!539094) (not b!539097) (not b!539090) (not b!539088) (not b!539096))
(check-sat)
