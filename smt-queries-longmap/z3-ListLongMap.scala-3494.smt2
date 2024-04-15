; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48468 () Bool)

(assert start!48468)

(declare-fun b!532228 () Bool)

(declare-fun e!309866 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532228 (= e!309866 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33741 0))(
  ( (array!33742 (arr!16211 (Array (_ BitVec 32) (_ BitVec 64))) (size!16576 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33741)

(declare-fun lt!244990 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532228 (= lt!244990 (toIndex!0 (select (arr!16211 a!3154) j!147) mask!3216))))

(declare-fun res!327722 () Bool)

(declare-fun e!309865 () Bool)

(assert (=> start!48468 (=> (not res!327722) (not e!309865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48468 (= res!327722 (validMask!0 mask!3216))))

(assert (=> start!48468 e!309865))

(assert (=> start!48468 true))

(declare-fun array_inv!12094 (array!33741) Bool)

(assert (=> start!48468 (array_inv!12094 a!3154)))

(declare-fun b!532229 () Bool)

(declare-fun res!327724 () Bool)

(assert (=> b!532229 (=> (not res!327724) (not e!309866))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532229 (= res!327724 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16576 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16576 a!3154)) (= (select (arr!16211 a!3154) resIndex!32) (select (arr!16211 a!3154) j!147))))))

(declare-fun b!532230 () Bool)

(declare-fun res!327716 () Bool)

(assert (=> b!532230 (=> (not res!327716) (not e!309865))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532230 (= res!327716 (validKeyInArray!0 k0!1998))))

(declare-fun b!532231 () Bool)

(declare-fun res!327723 () Bool)

(assert (=> b!532231 (=> (not res!327723) (not e!309865))))

(declare-fun arrayContainsKey!0 (array!33741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532231 (= res!327723 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532232 () Bool)

(declare-fun res!327717 () Bool)

(assert (=> b!532232 (=> (not res!327717) (not e!309865))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532232 (= res!327717 (and (= (size!16576 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16576 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16576 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532233 () Bool)

(assert (=> b!532233 (= e!309865 e!309866)))

(declare-fun res!327721 () Bool)

(assert (=> b!532233 (=> (not res!327721) (not e!309866))))

(declare-datatypes ((SeekEntryResult!4666 0))(
  ( (MissingZero!4666 (index!20888 (_ BitVec 32))) (Found!4666 (index!20889 (_ BitVec 32))) (Intermediate!4666 (undefined!5478 Bool) (index!20890 (_ BitVec 32)) (x!49870 (_ BitVec 32))) (Undefined!4666) (MissingVacant!4666 (index!20891 (_ BitVec 32))) )
))
(declare-fun lt!244989 () SeekEntryResult!4666)

(assert (=> b!532233 (= res!327721 (or (= lt!244989 (MissingZero!4666 i!1153)) (= lt!244989 (MissingVacant!4666 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33741 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!532233 (= lt!244989 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532234 () Bool)

(declare-fun res!327725 () Bool)

(assert (=> b!532234 (=> (not res!327725) (not e!309865))))

(assert (=> b!532234 (= res!327725 (validKeyInArray!0 (select (arr!16211 a!3154) j!147)))))

(declare-fun b!532235 () Bool)

(declare-fun res!327720 () Bool)

(assert (=> b!532235 (=> (not res!327720) (not e!309866))))

(declare-datatypes ((List!10369 0))(
  ( (Nil!10366) (Cons!10365 (h!11305 (_ BitVec 64)) (t!16588 List!10369)) )
))
(declare-fun arrayNoDuplicates!0 (array!33741 (_ BitVec 32) List!10369) Bool)

(assert (=> b!532235 (= res!327720 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10366))))

(declare-fun b!532236 () Bool)

(declare-fun res!327719 () Bool)

(assert (=> b!532236 (=> (not res!327719) (not e!309866))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33741 (_ BitVec 32)) SeekEntryResult!4666)

(assert (=> b!532236 (= res!327719 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16211 a!3154) j!147) a!3154 mask!3216) (Intermediate!4666 false resIndex!32 resX!32)))))

(declare-fun b!532237 () Bool)

(declare-fun res!327718 () Bool)

(assert (=> b!532237 (=> (not res!327718) (not e!309866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33741 (_ BitVec 32)) Bool)

(assert (=> b!532237 (= res!327718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48468 res!327722) b!532232))

(assert (= (and b!532232 res!327717) b!532234))

(assert (= (and b!532234 res!327725) b!532230))

(assert (= (and b!532230 res!327716) b!532231))

(assert (= (and b!532231 res!327723) b!532233))

(assert (= (and b!532233 res!327721) b!532237))

(assert (= (and b!532237 res!327718) b!532235))

(assert (= (and b!532235 res!327720) b!532229))

(assert (= (and b!532229 res!327724) b!532236))

(assert (= (and b!532236 res!327719) b!532228))

(declare-fun m!511885 () Bool)

(assert (=> b!532235 m!511885))

(declare-fun m!511887 () Bool)

(assert (=> b!532234 m!511887))

(assert (=> b!532234 m!511887))

(declare-fun m!511889 () Bool)

(assert (=> b!532234 m!511889))

(declare-fun m!511891 () Bool)

(assert (=> b!532229 m!511891))

(assert (=> b!532229 m!511887))

(declare-fun m!511893 () Bool)

(assert (=> b!532230 m!511893))

(declare-fun m!511895 () Bool)

(assert (=> b!532237 m!511895))

(assert (=> b!532236 m!511887))

(assert (=> b!532236 m!511887))

(declare-fun m!511897 () Bool)

(assert (=> b!532236 m!511897))

(assert (=> b!532228 m!511887))

(assert (=> b!532228 m!511887))

(declare-fun m!511899 () Bool)

(assert (=> b!532228 m!511899))

(declare-fun m!511901 () Bool)

(assert (=> b!532231 m!511901))

(declare-fun m!511903 () Bool)

(assert (=> start!48468 m!511903))

(declare-fun m!511905 () Bool)

(assert (=> start!48468 m!511905))

(declare-fun m!511907 () Bool)

(assert (=> b!532233 m!511907))

(check-sat (not b!532236) (not b!532234) (not b!532233) (not b!532231) (not b!532235) (not b!532230) (not start!48468) (not b!532228) (not b!532237))
(check-sat)
