; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48576 () Bool)

(assert start!48576)

(declare-fun b!533254 () Bool)

(declare-fun res!328603 () Bool)

(declare-fun e!310263 () Bool)

(assert (=> b!533254 (=> (not res!328603) (not e!310263))))

(declare-datatypes ((array!33798 0))(
  ( (array!33799 (arr!16238 (Array (_ BitVec 32) (_ BitVec 64))) (size!16603 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33798)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533254 (= res!328603 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533255 () Bool)

(declare-fun res!328610 () Bool)

(assert (=> b!533255 (=> (not res!328610) (not e!310263))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533255 (= res!328610 (and (= (size!16603 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16603 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16603 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533257 () Bool)

(declare-fun res!328601 () Bool)

(declare-fun e!310262 () Bool)

(assert (=> b!533257 (=> (not res!328601) (not e!310262))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4693 0))(
  ( (MissingZero!4693 (index!20996 (_ BitVec 32))) (Found!4693 (index!20997 (_ BitVec 32))) (Intermediate!4693 (undefined!5505 Bool) (index!20998 (_ BitVec 32)) (x!49975 (_ BitVec 32))) (Undefined!4693) (MissingVacant!4693 (index!20999 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33798 (_ BitVec 32)) SeekEntryResult!4693)

(assert (=> b!533257 (= res!328601 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16238 a!3154) j!147) a!3154 mask!3216) (Intermediate!4693 false resIndex!32 resX!32)))))

(declare-fun b!533258 () Bool)

(assert (=> b!533258 (= e!310262 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!533259 () Bool)

(assert (=> b!533259 (= e!310263 e!310262)))

(declare-fun res!328608 () Bool)

(assert (=> b!533259 (=> (not res!328608) (not e!310262))))

(declare-fun lt!245221 () SeekEntryResult!4693)

(assert (=> b!533259 (= res!328608 (or (= lt!245221 (MissingZero!4693 i!1153)) (= lt!245221 (MissingVacant!4693 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33798 (_ BitVec 32)) SeekEntryResult!4693)

(assert (=> b!533259 (= lt!245221 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533260 () Bool)

(declare-fun res!328606 () Bool)

(assert (=> b!533260 (=> (not res!328606) (not e!310262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33798 (_ BitVec 32)) Bool)

(assert (=> b!533260 (= res!328606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533261 () Bool)

(declare-fun res!328602 () Bool)

(assert (=> b!533261 (=> (not res!328602) (not e!310262))))

(declare-datatypes ((List!10396 0))(
  ( (Nil!10393) (Cons!10392 (h!11335 (_ BitVec 64)) (t!16615 List!10396)) )
))
(declare-fun arrayNoDuplicates!0 (array!33798 (_ BitVec 32) List!10396) Bool)

(assert (=> b!533261 (= res!328602 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10393))))

(declare-fun b!533262 () Bool)

(declare-fun res!328604 () Bool)

(assert (=> b!533262 (=> (not res!328604) (not e!310263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533262 (= res!328604 (validKeyInArray!0 (select (arr!16238 a!3154) j!147)))))

(declare-fun b!533263 () Bool)

(declare-fun res!328605 () Bool)

(assert (=> b!533263 (=> (not res!328605) (not e!310262))))

(assert (=> b!533263 (= res!328605 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16603 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16603 a!3154)) (= (select (arr!16238 a!3154) resIndex!32) (select (arr!16238 a!3154) j!147))))))

(declare-fun res!328607 () Bool)

(assert (=> start!48576 (=> (not res!328607) (not e!310263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48576 (= res!328607 (validMask!0 mask!3216))))

(assert (=> start!48576 e!310263))

(assert (=> start!48576 true))

(declare-fun array_inv!12121 (array!33798) Bool)

(assert (=> start!48576 (array_inv!12121 a!3154)))

(declare-fun b!533256 () Bool)

(declare-fun res!328609 () Bool)

(assert (=> b!533256 (=> (not res!328609) (not e!310263))))

(assert (=> b!533256 (= res!328609 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48576 res!328607) b!533255))

(assert (= (and b!533255 res!328610) b!533262))

(assert (= (and b!533262 res!328604) b!533256))

(assert (= (and b!533256 res!328609) b!533254))

(assert (= (and b!533254 res!328603) b!533259))

(assert (= (and b!533259 res!328608) b!533260))

(assert (= (and b!533260 res!328606) b!533261))

(assert (= (and b!533261 res!328602) b!533263))

(assert (= (and b!533263 res!328605) b!533257))

(assert (= (and b!533257 res!328601) b!533258))

(declare-fun m!512629 () Bool)

(assert (=> b!533256 m!512629))

(declare-fun m!512631 () Bool)

(assert (=> b!533260 m!512631))

(declare-fun m!512633 () Bool)

(assert (=> b!533259 m!512633))

(declare-fun m!512635 () Bool)

(assert (=> b!533254 m!512635))

(declare-fun m!512637 () Bool)

(assert (=> start!48576 m!512637))

(declare-fun m!512639 () Bool)

(assert (=> start!48576 m!512639))

(declare-fun m!512641 () Bool)

(assert (=> b!533257 m!512641))

(assert (=> b!533257 m!512641))

(declare-fun m!512643 () Bool)

(assert (=> b!533257 m!512643))

(assert (=> b!533262 m!512641))

(assert (=> b!533262 m!512641))

(declare-fun m!512645 () Bool)

(assert (=> b!533262 m!512645))

(declare-fun m!512647 () Bool)

(assert (=> b!533263 m!512647))

(assert (=> b!533263 m!512641))

(declare-fun m!512649 () Bool)

(assert (=> b!533261 m!512649))

(check-sat (not b!533256) (not start!48576) (not b!533259) (not b!533260) (not b!533261) (not b!533254) (not b!533257) (not b!533262))
(check-sat)
