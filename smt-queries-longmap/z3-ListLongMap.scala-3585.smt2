; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49284 () Bool)

(assert start!49284)

(declare-fun b!542555 () Bool)

(declare-fun e!313920 () Bool)

(assert (=> b!542555 (= e!313920 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!247784 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542555 (= lt!247784 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542556 () Bool)

(declare-fun res!337256 () Bool)

(declare-fun e!313921 () Bool)

(assert (=> b!542556 (=> (not res!337256) (not e!313921))))

(declare-datatypes ((array!34302 0))(
  ( (array!34303 (arr!16484 (Array (_ BitVec 32) (_ BitVec 64))) (size!16849 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34302)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542556 (= res!337256 (validKeyInArray!0 (select (arr!16484 a!3154) j!147)))))

(declare-fun b!542557 () Bool)

(declare-fun res!337249 () Bool)

(declare-fun e!313922 () Bool)

(assert (=> b!542557 (=> (not res!337249) (not e!313922))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542557 (= res!337249 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16849 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16849 a!3154)) (= (select (arr!16484 a!3154) resIndex!32) (select (arr!16484 a!3154) j!147))))))

(declare-fun b!542558 () Bool)

(declare-fun res!337257 () Bool)

(assert (=> b!542558 (=> (not res!337257) (not e!313922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34302 (_ BitVec 32)) Bool)

(assert (=> b!542558 (= res!337257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542559 () Bool)

(declare-fun res!337248 () Bool)

(assert (=> b!542559 (=> (not res!337248) (not e!313920))))

(declare-datatypes ((SeekEntryResult!4939 0))(
  ( (MissingZero!4939 (index!21980 (_ BitVec 32))) (Found!4939 (index!21981 (_ BitVec 32))) (Intermediate!4939 (undefined!5751 Bool) (index!21982 (_ BitVec 32)) (x!50901 (_ BitVec 32))) (Undefined!4939) (MissingVacant!4939 (index!21983 (_ BitVec 32))) )
))
(declare-fun lt!247785 () SeekEntryResult!4939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34302 (_ BitVec 32)) SeekEntryResult!4939)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542559 (= res!337248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16484 a!3154) j!147) mask!3216) (select (arr!16484 a!3154) j!147) a!3154 mask!3216) lt!247785))))

(declare-fun b!542560 () Bool)

(declare-fun res!337259 () Bool)

(assert (=> b!542560 (=> (not res!337259) (not e!313921))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542560 (= res!337259 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542561 () Bool)

(declare-fun res!337255 () Bool)

(assert (=> b!542561 (=> (not res!337255) (not e!313921))))

(assert (=> b!542561 (= res!337255 (validKeyInArray!0 k0!1998))))

(declare-fun b!542562 () Bool)

(declare-fun res!337252 () Bool)

(assert (=> b!542562 (=> (not res!337252) (not e!313921))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542562 (= res!337252 (and (= (size!16849 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16849 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16849 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!337254 () Bool)

(assert (=> start!49284 (=> (not res!337254) (not e!313921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49284 (= res!337254 (validMask!0 mask!3216))))

(assert (=> start!49284 e!313921))

(assert (=> start!49284 true))

(declare-fun array_inv!12367 (array!34302) Bool)

(assert (=> start!49284 (array_inv!12367 a!3154)))

(declare-fun b!542563 () Bool)

(declare-fun res!337250 () Bool)

(assert (=> b!542563 (=> (not res!337250) (not e!313920))))

(assert (=> b!542563 (= res!337250 (and (not (= (select (arr!16484 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16484 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16484 a!3154) index!1177) (select (arr!16484 a!3154) j!147)))))))

(declare-fun b!542564 () Bool)

(assert (=> b!542564 (= e!313922 e!313920)))

(declare-fun res!337253 () Bool)

(assert (=> b!542564 (=> (not res!337253) (not e!313920))))

(assert (=> b!542564 (= res!337253 (= lt!247785 (Intermediate!4939 false resIndex!32 resX!32)))))

(assert (=> b!542564 (= lt!247785 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16484 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542565 () Bool)

(declare-fun res!337251 () Bool)

(assert (=> b!542565 (=> (not res!337251) (not e!313922))))

(declare-datatypes ((List!10642 0))(
  ( (Nil!10639) (Cons!10638 (h!11593 (_ BitVec 64)) (t!16861 List!10642)) )
))
(declare-fun arrayNoDuplicates!0 (array!34302 (_ BitVec 32) List!10642) Bool)

(assert (=> b!542565 (= res!337251 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10639))))

(declare-fun b!542566 () Bool)

(assert (=> b!542566 (= e!313921 e!313922)))

(declare-fun res!337258 () Bool)

(assert (=> b!542566 (=> (not res!337258) (not e!313922))))

(declare-fun lt!247786 () SeekEntryResult!4939)

(assert (=> b!542566 (= res!337258 (or (= lt!247786 (MissingZero!4939 i!1153)) (= lt!247786 (MissingVacant!4939 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34302 (_ BitVec 32)) SeekEntryResult!4939)

(assert (=> b!542566 (= lt!247786 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49284 res!337254) b!542562))

(assert (= (and b!542562 res!337252) b!542556))

(assert (= (and b!542556 res!337256) b!542561))

(assert (= (and b!542561 res!337255) b!542560))

(assert (= (and b!542560 res!337259) b!542566))

(assert (= (and b!542566 res!337258) b!542558))

(assert (= (and b!542558 res!337257) b!542565))

(assert (= (and b!542565 res!337251) b!542557))

(assert (= (and b!542557 res!337249) b!542564))

(assert (= (and b!542564 res!337253) b!542559))

(assert (= (and b!542559 res!337248) b!542563))

(assert (= (and b!542563 res!337250) b!542555))

(declare-fun m!520267 () Bool)

(assert (=> b!542566 m!520267))

(declare-fun m!520269 () Bool)

(assert (=> b!542555 m!520269))

(declare-fun m!520271 () Bool)

(assert (=> b!542564 m!520271))

(assert (=> b!542564 m!520271))

(declare-fun m!520273 () Bool)

(assert (=> b!542564 m!520273))

(assert (=> b!542559 m!520271))

(assert (=> b!542559 m!520271))

(declare-fun m!520275 () Bool)

(assert (=> b!542559 m!520275))

(assert (=> b!542559 m!520275))

(assert (=> b!542559 m!520271))

(declare-fun m!520277 () Bool)

(assert (=> b!542559 m!520277))

(declare-fun m!520279 () Bool)

(assert (=> b!542557 m!520279))

(assert (=> b!542557 m!520271))

(declare-fun m!520281 () Bool)

(assert (=> b!542558 m!520281))

(declare-fun m!520283 () Bool)

(assert (=> b!542563 m!520283))

(assert (=> b!542563 m!520271))

(declare-fun m!520285 () Bool)

(assert (=> start!49284 m!520285))

(declare-fun m!520287 () Bool)

(assert (=> start!49284 m!520287))

(assert (=> b!542556 m!520271))

(assert (=> b!542556 m!520271))

(declare-fun m!520289 () Bool)

(assert (=> b!542556 m!520289))

(declare-fun m!520291 () Bool)

(assert (=> b!542565 m!520291))

(declare-fun m!520293 () Bool)

(assert (=> b!542560 m!520293))

(declare-fun m!520295 () Bool)

(assert (=> b!542561 m!520295))

(check-sat (not start!49284) (not b!542555) (not b!542566) (not b!542556) (not b!542564) (not b!542565) (not b!542559) (not b!542560) (not b!542561) (not b!542558))
(check-sat)
