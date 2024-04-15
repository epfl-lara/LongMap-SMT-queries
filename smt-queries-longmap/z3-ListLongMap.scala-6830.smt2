; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86010 () Bool)

(assert start!86010)

(declare-fun b!996098 () Bool)

(declare-fun res!666342 () Bool)

(declare-fun e!562031 () Bool)

(assert (=> b!996098 (=> (not res!666342) (not e!562031))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996098 (= res!666342 (validKeyInArray!0 k0!2224))))

(declare-fun b!996099 () Bool)

(declare-fun res!666344 () Bool)

(assert (=> b!996099 (=> (not res!666344) (not e!562031))))

(declare-datatypes ((array!62962 0))(
  ( (array!62963 (arr!30312 (Array (_ BitVec 32) (_ BitVec 64))) (size!30816 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62962)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996099 (= res!666344 (and (= (size!30816 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30816 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30816 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996100 () Bool)

(declare-fun res!666339 () Bool)

(assert (=> b!996100 (=> (not res!666339) (not e!562031))))

(assert (=> b!996100 (= res!666339 (validKeyInArray!0 (select (arr!30312 a!3219) j!170)))))

(declare-fun b!996101 () Bool)

(declare-fun res!666343 () Bool)

(declare-fun e!562029 () Bool)

(assert (=> b!996101 (=> (not res!666343) (not e!562029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62962 (_ BitVec 32)) Bool)

(assert (=> b!996101 (= res!666343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996103 () Bool)

(assert (=> b!996103 (= e!562029 false)))

(declare-fun lt!440977 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996103 (= lt!440977 (toIndex!0 (select (arr!30312 a!3219) j!170) mask!3464))))

(declare-fun b!996104 () Bool)

(declare-fun res!666341 () Bool)

(assert (=> b!996104 (=> (not res!666341) (not e!562031))))

(declare-fun arrayContainsKey!0 (array!62962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996104 (= res!666341 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996105 () Bool)

(assert (=> b!996105 (= e!562031 e!562029)))

(declare-fun res!666337 () Bool)

(assert (=> b!996105 (=> (not res!666337) (not e!562029))))

(declare-datatypes ((SeekEntryResult!9269 0))(
  ( (MissingZero!9269 (index!39447 (_ BitVec 32))) (Found!9269 (index!39448 (_ BitVec 32))) (Intermediate!9269 (undefined!10081 Bool) (index!39449 (_ BitVec 32)) (x!86900 (_ BitVec 32))) (Undefined!9269) (MissingVacant!9269 (index!39450 (_ BitVec 32))) )
))
(declare-fun lt!440976 () SeekEntryResult!9269)

(assert (=> b!996105 (= res!666337 (or (= lt!440976 (MissingVacant!9269 i!1194)) (= lt!440976 (MissingZero!9269 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62962 (_ BitVec 32)) SeekEntryResult!9269)

(assert (=> b!996105 (= lt!440976 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996106 () Bool)

(declare-fun res!666340 () Bool)

(assert (=> b!996106 (=> (not res!666340) (not e!562029))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996106 (= res!666340 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30816 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30816 a!3219))))))

(declare-fun res!666336 () Bool)

(assert (=> start!86010 (=> (not res!666336) (not e!562031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86010 (= res!666336 (validMask!0 mask!3464))))

(assert (=> start!86010 e!562031))

(declare-fun array_inv!23455 (array!62962) Bool)

(assert (=> start!86010 (array_inv!23455 a!3219)))

(assert (=> start!86010 true))

(declare-fun b!996102 () Bool)

(declare-fun res!666338 () Bool)

(assert (=> b!996102 (=> (not res!666338) (not e!562029))))

(declare-datatypes ((List!21054 0))(
  ( (Nil!21051) (Cons!21050 (h!22215 (_ BitVec 64)) (t!30046 List!21054)) )
))
(declare-fun arrayNoDuplicates!0 (array!62962 (_ BitVec 32) List!21054) Bool)

(assert (=> b!996102 (= res!666338 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21051))))

(assert (= (and start!86010 res!666336) b!996099))

(assert (= (and b!996099 res!666344) b!996100))

(assert (= (and b!996100 res!666339) b!996098))

(assert (= (and b!996098 res!666342) b!996104))

(assert (= (and b!996104 res!666341) b!996105))

(assert (= (and b!996105 res!666337) b!996101))

(assert (= (and b!996101 res!666343) b!996102))

(assert (= (and b!996102 res!666338) b!996106))

(assert (= (and b!996106 res!666340) b!996103))

(declare-fun m!922735 () Bool)

(assert (=> b!996103 m!922735))

(assert (=> b!996103 m!922735))

(declare-fun m!922737 () Bool)

(assert (=> b!996103 m!922737))

(declare-fun m!922739 () Bool)

(assert (=> b!996098 m!922739))

(assert (=> b!996100 m!922735))

(assert (=> b!996100 m!922735))

(declare-fun m!922741 () Bool)

(assert (=> b!996100 m!922741))

(declare-fun m!922743 () Bool)

(assert (=> b!996102 m!922743))

(declare-fun m!922745 () Bool)

(assert (=> b!996105 m!922745))

(declare-fun m!922747 () Bool)

(assert (=> b!996104 m!922747))

(declare-fun m!922749 () Bool)

(assert (=> b!996101 m!922749))

(declare-fun m!922751 () Bool)

(assert (=> start!86010 m!922751))

(declare-fun m!922753 () Bool)

(assert (=> start!86010 m!922753))

(check-sat (not b!996098) (not b!996103) (not b!996104) (not b!996100) (not b!996102) (not start!86010) (not b!996101) (not b!996105))
(check-sat)
