; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48616 () Bool)

(assert start!48616)

(declare-fun b!533995 () Bool)

(declare-fun res!329260 () Bool)

(declare-fun e!310560 () Bool)

(assert (=> b!533995 (=> (not res!329260) (not e!310560))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33827 0))(
  ( (array!33828 (arr!16252 (Array (_ BitVec 32) (_ BitVec 64))) (size!16616 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33827)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4666 0))(
  ( (MissingZero!4666 (index!20888 (_ BitVec 32))) (Found!4666 (index!20889 (_ BitVec 32))) (Intermediate!4666 (undefined!5478 Bool) (index!20890 (_ BitVec 32)) (x!49998 (_ BitVec 32))) (Undefined!4666) (MissingVacant!4666 (index!20891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33827 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!533995 (= res!329260 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16252 a!3154) j!147) a!3154 mask!3216) (Intermediate!4666 false resIndex!32 resX!32)))))

(declare-fun res!329258 () Bool)

(declare-fun e!310558 () Bool)

(assert (=> start!48616 (=> (not res!329258) (not e!310558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48616 (= res!329258 (validMask!0 mask!3216))))

(assert (=> start!48616 e!310558))

(assert (=> start!48616 true))

(declare-fun array_inv!12111 (array!33827) Bool)

(assert (=> start!48616 (array_inv!12111 a!3154)))

(declare-fun b!533996 () Bool)

(declare-fun res!329255 () Bool)

(assert (=> b!533996 (=> (not res!329255) (not e!310560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33827 (_ BitVec 32)) Bool)

(assert (=> b!533996 (= res!329255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533997 () Bool)

(declare-fun res!329254 () Bool)

(assert (=> b!533997 (=> (not res!329254) (not e!310558))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533997 (= res!329254 (validKeyInArray!0 k0!1998))))

(declare-fun b!533998 () Bool)

(declare-fun res!329259 () Bool)

(assert (=> b!533998 (=> (not res!329259) (not e!310558))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533998 (= res!329259 (and (= (size!16616 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16616 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16616 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533999 () Bool)

(declare-fun res!329263 () Bool)

(assert (=> b!533999 (=> (not res!329263) (not e!310558))))

(declare-fun arrayContainsKey!0 (array!33827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533999 (= res!329263 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534000 () Bool)

(declare-fun res!329261 () Bool)

(assert (=> b!534000 (=> (not res!329261) (not e!310560))))

(declare-datatypes ((List!10278 0))(
  ( (Nil!10275) (Cons!10274 (h!11217 (_ BitVec 64)) (t!16498 List!10278)) )
))
(declare-fun arrayNoDuplicates!0 (array!33827 (_ BitVec 32) List!10278) Bool)

(assert (=> b!534000 (= res!329261 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10275))))

(declare-fun b!534001 () Bool)

(assert (=> b!534001 (= e!310558 e!310560)))

(declare-fun res!329262 () Bool)

(assert (=> b!534001 (=> (not res!329262) (not e!310560))))

(declare-fun lt!245568 () SeekEntryResult!4666)

(assert (=> b!534001 (= res!329262 (or (= lt!245568 (MissingZero!4666 i!1153)) (= lt!245568 (MissingVacant!4666 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33827 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!534001 (= lt!245568 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534002 () Bool)

(assert (=> b!534002 (= e!310560 false)))

(declare-fun lt!245569 () SeekEntryResult!4666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534002 (= lt!245569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16252 a!3154) j!147) mask!3216) (select (arr!16252 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534003 () Bool)

(declare-fun res!329257 () Bool)

(assert (=> b!534003 (=> (not res!329257) (not e!310558))))

(assert (=> b!534003 (= res!329257 (validKeyInArray!0 (select (arr!16252 a!3154) j!147)))))

(declare-fun b!534004 () Bool)

(declare-fun res!329256 () Bool)

(assert (=> b!534004 (=> (not res!329256) (not e!310560))))

(assert (=> b!534004 (= res!329256 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16616 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16616 a!3154)) (= (select (arr!16252 a!3154) resIndex!32) (select (arr!16252 a!3154) j!147))))))

(assert (= (and start!48616 res!329258) b!533998))

(assert (= (and b!533998 res!329259) b!534003))

(assert (= (and b!534003 res!329257) b!533997))

(assert (= (and b!533997 res!329254) b!533999))

(assert (= (and b!533999 res!329263) b!534001))

(assert (= (and b!534001 res!329262) b!533996))

(assert (= (and b!533996 res!329255) b!534000))

(assert (= (and b!534000 res!329261) b!534004))

(assert (= (and b!534004 res!329256) b!533995))

(assert (= (and b!533995 res!329260) b!534002))

(declare-fun m!514009 () Bool)

(assert (=> b!533995 m!514009))

(assert (=> b!533995 m!514009))

(declare-fun m!514011 () Bool)

(assert (=> b!533995 m!514011))

(declare-fun m!514013 () Bool)

(assert (=> b!533996 m!514013))

(declare-fun m!514015 () Bool)

(assert (=> b!534004 m!514015))

(assert (=> b!534004 m!514009))

(assert (=> b!534003 m!514009))

(assert (=> b!534003 m!514009))

(declare-fun m!514017 () Bool)

(assert (=> b!534003 m!514017))

(declare-fun m!514019 () Bool)

(assert (=> b!534000 m!514019))

(declare-fun m!514021 () Bool)

(assert (=> b!533997 m!514021))

(declare-fun m!514023 () Bool)

(assert (=> b!534001 m!514023))

(declare-fun m!514025 () Bool)

(assert (=> start!48616 m!514025))

(declare-fun m!514027 () Bool)

(assert (=> start!48616 m!514027))

(assert (=> b!534002 m!514009))

(assert (=> b!534002 m!514009))

(declare-fun m!514029 () Bool)

(assert (=> b!534002 m!514029))

(assert (=> b!534002 m!514029))

(assert (=> b!534002 m!514009))

(declare-fun m!514031 () Bool)

(assert (=> b!534002 m!514031))

(declare-fun m!514033 () Bool)

(assert (=> b!533999 m!514033))

(check-sat (not b!534001) (not b!533995) (not b!534003) (not b!534000) (not b!533997) (not b!534002) (not b!533999) (not b!533996) (not start!48616))
(check-sat)
