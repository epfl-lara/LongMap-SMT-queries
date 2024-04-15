; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48612 () Bool)

(assert start!48612)

(declare-fun b!533785 () Bool)

(declare-fun res!329135 () Bool)

(declare-fun e!310424 () Bool)

(assert (=> b!533785 (=> (not res!329135) (not e!310424))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33834 0))(
  ( (array!33835 (arr!16256 (Array (_ BitVec 32) (_ BitVec 64))) (size!16621 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33834)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533785 (= res!329135 (and (= (size!16621 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16621 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16621 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533786 () Bool)

(declare-fun res!329140 () Bool)

(declare-fun e!310423 () Bool)

(assert (=> b!533786 (=> (not res!329140) (not e!310423))))

(declare-datatypes ((List!10414 0))(
  ( (Nil!10411) (Cons!10410 (h!11353 (_ BitVec 64)) (t!16633 List!10414)) )
))
(declare-fun arrayNoDuplicates!0 (array!33834 (_ BitVec 32) List!10414) Bool)

(assert (=> b!533786 (= res!329140 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10411))))

(declare-fun b!533787 () Bool)

(declare-fun res!329138 () Bool)

(assert (=> b!533787 (=> (not res!329138) (not e!310424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533787 (= res!329138 (validKeyInArray!0 (select (arr!16256 a!3154) j!147)))))

(declare-fun b!533788 () Bool)

(declare-fun res!329136 () Bool)

(assert (=> b!533788 (=> (not res!329136) (not e!310423))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4711 0))(
  ( (MissingZero!4711 (index!21068 (_ BitVec 32))) (Found!4711 (index!21069 (_ BitVec 32))) (Intermediate!4711 (undefined!5523 Bool) (index!21070 (_ BitVec 32)) (x!50041 (_ BitVec 32))) (Undefined!4711) (MissingVacant!4711 (index!21071 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33834 (_ BitVec 32)) SeekEntryResult!4711)

(assert (=> b!533788 (= res!329136 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16256 a!3154) j!147) a!3154 mask!3216) (Intermediate!4711 false resIndex!32 resX!32)))))

(declare-fun b!533789 () Bool)

(declare-fun res!329139 () Bool)

(assert (=> b!533789 (=> (not res!329139) (not e!310424))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!533789 (= res!329139 (validKeyInArray!0 k0!1998))))

(declare-fun b!533790 () Bool)

(assert (=> b!533790 (= e!310423 false)))

(declare-fun lt!245323 () SeekEntryResult!4711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533790 (= lt!245323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16256 a!3154) j!147) mask!3216) (select (arr!16256 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!329133 () Bool)

(assert (=> start!48612 (=> (not res!329133) (not e!310424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48612 (= res!329133 (validMask!0 mask!3216))))

(assert (=> start!48612 e!310424))

(assert (=> start!48612 true))

(declare-fun array_inv!12139 (array!33834) Bool)

(assert (=> start!48612 (array_inv!12139 a!3154)))

(declare-fun b!533791 () Bool)

(declare-fun res!329141 () Bool)

(assert (=> b!533791 (=> (not res!329141) (not e!310424))))

(declare-fun arrayContainsKey!0 (array!33834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533791 (= res!329141 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533792 () Bool)

(assert (=> b!533792 (= e!310424 e!310423)))

(declare-fun res!329137 () Bool)

(assert (=> b!533792 (=> (not res!329137) (not e!310423))))

(declare-fun lt!245322 () SeekEntryResult!4711)

(assert (=> b!533792 (= res!329137 (or (= lt!245322 (MissingZero!4711 i!1153)) (= lt!245322 (MissingVacant!4711 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33834 (_ BitVec 32)) SeekEntryResult!4711)

(assert (=> b!533792 (= lt!245322 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533793 () Bool)

(declare-fun res!329132 () Bool)

(assert (=> b!533793 (=> (not res!329132) (not e!310423))))

(assert (=> b!533793 (= res!329132 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16621 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16621 a!3154)) (= (select (arr!16256 a!3154) resIndex!32) (select (arr!16256 a!3154) j!147))))))

(declare-fun b!533794 () Bool)

(declare-fun res!329134 () Bool)

(assert (=> b!533794 (=> (not res!329134) (not e!310423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33834 (_ BitVec 32)) Bool)

(assert (=> b!533794 (= res!329134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48612 res!329133) b!533785))

(assert (= (and b!533785 res!329135) b!533787))

(assert (= (and b!533787 res!329138) b!533789))

(assert (= (and b!533789 res!329139) b!533791))

(assert (= (and b!533791 res!329141) b!533792))

(assert (= (and b!533792 res!329137) b!533794))

(assert (= (and b!533794 res!329134) b!533786))

(assert (= (and b!533786 res!329140) b!533793))

(assert (= (and b!533793 res!329132) b!533788))

(assert (= (and b!533788 res!329136) b!533790))

(declare-fun m!513073 () Bool)

(assert (=> b!533786 m!513073))

(declare-fun m!513075 () Bool)

(assert (=> b!533790 m!513075))

(assert (=> b!533790 m!513075))

(declare-fun m!513077 () Bool)

(assert (=> b!533790 m!513077))

(assert (=> b!533790 m!513077))

(assert (=> b!533790 m!513075))

(declare-fun m!513079 () Bool)

(assert (=> b!533790 m!513079))

(declare-fun m!513081 () Bool)

(assert (=> b!533793 m!513081))

(assert (=> b!533793 m!513075))

(declare-fun m!513083 () Bool)

(assert (=> start!48612 m!513083))

(declare-fun m!513085 () Bool)

(assert (=> start!48612 m!513085))

(declare-fun m!513087 () Bool)

(assert (=> b!533792 m!513087))

(assert (=> b!533788 m!513075))

(assert (=> b!533788 m!513075))

(declare-fun m!513089 () Bool)

(assert (=> b!533788 m!513089))

(declare-fun m!513091 () Bool)

(assert (=> b!533794 m!513091))

(declare-fun m!513093 () Bool)

(assert (=> b!533791 m!513093))

(assert (=> b!533787 m!513075))

(assert (=> b!533787 m!513075))

(declare-fun m!513095 () Bool)

(assert (=> b!533787 m!513095))

(declare-fun m!513097 () Bool)

(assert (=> b!533789 m!513097))

(check-sat (not b!533788) (not b!533790) (not start!48612) (not b!533794) (not b!533791) (not b!533792) (not b!533786) (not b!533787) (not b!533789))
(check-sat)
