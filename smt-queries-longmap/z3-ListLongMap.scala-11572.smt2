; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135246 () Bool)

(assert start!135246)

(declare-fun res!1074802 () Bool)

(declare-fun e!877940 () Bool)

(assert (=> start!135246 (=> (not res!1074802) (not e!877940))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135246 (= res!1074802 (validMask!0 mask!889))))

(assert (=> start!135246 e!877940))

(assert (=> start!135246 true))

(declare-datatypes ((array!105053 0))(
  ( (array!105054 (arr!50689 (Array (_ BitVec 32) (_ BitVec 64))) (size!51240 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105053)

(declare-fun array_inv!39644 (array!105053) Bool)

(assert (=> start!135246 (array_inv!39644 _keys!600)))

(declare-fun b!1574260 () Bool)

(declare-fun res!1074801 () Bool)

(assert (=> b!1574260 (=> (not res!1074801) (not e!877940))))

(assert (=> b!1574260 (= res!1074801 (= (size!51240 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574261 () Bool)

(declare-fun res!1074803 () Bool)

(assert (=> b!1574261 (=> (not res!1074803) (not e!877940))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574261 (= res!1074803 (validKeyInArray!0 k0!754))))

(declare-fun b!1574262 () Bool)

(declare-datatypes ((SeekEntryResult!13496 0))(
  ( (MissingZero!13496 (index!56382 (_ BitVec 32))) (Found!13496 (index!56383 (_ BitVec 32))) (Intermediate!13496 (undefined!14308 Bool) (index!56384 (_ BitVec 32)) (x!141359 (_ BitVec 32))) (Undefined!13496) (MissingVacant!13496 (index!56385 (_ BitVec 32))) )
))
(declare-fun lt!674661 () SeekEntryResult!13496)

(get-info :version)

(assert (=> b!1574262 (= e!877940 (and ((_ is Intermediate!13496) lt!674661) (not (undefined!14308 lt!674661)) (not (= (select (arr!50689 _keys!600) (index!56384 lt!674661)) k0!754)) (not (= (select (arr!50689 _keys!600) (index!56384 lt!674661)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50689 _keys!600) (index!56384 lt!674661)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56384 lt!674661) #b00000000000000000000000000000000) (bvslt (index!56384 lt!674661) (bvadd #b00000000000000000000000000000001 mask!889)) (bvslt mask!889 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105053 (_ BitVec 32)) SeekEntryResult!13496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574262 (= lt!674661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135246 res!1074802) b!1574260))

(assert (= (and b!1574260 res!1074801) b!1574261))

(assert (= (and b!1574261 res!1074803) b!1574262))

(declare-fun m!1447959 () Bool)

(assert (=> start!135246 m!1447959))

(declare-fun m!1447961 () Bool)

(assert (=> start!135246 m!1447961))

(declare-fun m!1447963 () Bool)

(assert (=> b!1574261 m!1447963))

(declare-fun m!1447965 () Bool)

(assert (=> b!1574262 m!1447965))

(declare-fun m!1447967 () Bool)

(assert (=> b!1574262 m!1447967))

(assert (=> b!1574262 m!1447967))

(declare-fun m!1447969 () Bool)

(assert (=> b!1574262 m!1447969))

(check-sat (not b!1574261) (not b!1574262) (not start!135246))
(check-sat)
