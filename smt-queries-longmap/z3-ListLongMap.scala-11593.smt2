; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135142 () Bool)

(assert start!135142)

(declare-fun b!1572902 () Bool)

(declare-fun e!877100 () Bool)

(declare-fun e!877099 () Bool)

(assert (=> b!1572902 (= e!877100 e!877099)))

(declare-fun res!1074711 () Bool)

(assert (=> b!1572902 (=> (not res!1074711) (not e!877099))))

(declare-datatypes ((SeekEntryResult!13612 0))(
  ( (MissingZero!13612 (index!56846 (_ BitVec 32))) (Found!13612 (index!56847 (_ BitVec 32))) (Intermediate!13612 (undefined!14424 Bool) (index!56848 (_ BitVec 32)) (x!141628 (_ BitVec 32))) (Undefined!13612) (MissingVacant!13612 (index!56849 (_ BitVec 32))) )
))
(declare-fun lt!674176 () SeekEntryResult!13612)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105077 0))(
  ( (array!105078 (arr!50699 (Array (_ BitVec 32) (_ BitVec 64))) (size!51249 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105077)

(get-info :version)

(assert (=> b!1572902 (= res!1074711 (and (not (undefined!14424 lt!674176)) ((_ is Intermediate!13612) lt!674176) (not (= (select (arr!50699 _keys!600) (index!56848 lt!674176)) k0!754)) (not (= (select (arr!50699 _keys!600) (index!56848 lt!674176)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50699 _keys!600) (index!56848 lt!674176)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56848 lt!674176) #b00000000000000000000000000000000) (bvslt (index!56848 lt!674176) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105077 (_ BitVec 32)) SeekEntryResult!13612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572902 (= lt!674176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572901 () Bool)

(declare-fun res!1074713 () Bool)

(assert (=> b!1572901 (=> (not res!1074713) (not e!877100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572901 (= res!1074713 (validKeyInArray!0 k0!754))))

(declare-fun res!1074714 () Bool)

(assert (=> start!135142 (=> (not res!1074714) (not e!877100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135142 (= res!1074714 (validMask!0 mask!889))))

(assert (=> start!135142 e!877100))

(assert (=> start!135142 true))

(declare-fun array_inv!39426 (array!105077) Bool)

(assert (=> start!135142 (array_inv!39426 _keys!600)))

(declare-fun b!1572900 () Bool)

(declare-fun res!1074712 () Bool)

(assert (=> b!1572900 (=> (not res!1074712) (not e!877100))))

(assert (=> b!1572900 (= res!1074712 (= (size!51249 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572903 () Bool)

(assert (=> b!1572903 (= e!877099 false)))

(declare-fun lt!674175 () SeekEntryResult!13612)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105077 (_ BitVec 32)) SeekEntryResult!13612)

(assert (=> b!1572903 (= lt!674175 (seekKeyOrZeroReturnVacant!0 (x!141628 lt!674176) (index!56848 lt!674176) (index!56848 lt!674176) k0!754 _keys!600 mask!889))))

(assert (= (and start!135142 res!1074714) b!1572900))

(assert (= (and b!1572900 res!1074712) b!1572901))

(assert (= (and b!1572901 res!1074713) b!1572902))

(assert (= (and b!1572902 res!1074711) b!1572903))

(declare-fun m!1446537 () Bool)

(assert (=> b!1572902 m!1446537))

(declare-fun m!1446539 () Bool)

(assert (=> b!1572902 m!1446539))

(assert (=> b!1572902 m!1446539))

(declare-fun m!1446541 () Bool)

(assert (=> b!1572902 m!1446541))

(declare-fun m!1446543 () Bool)

(assert (=> b!1572901 m!1446543))

(declare-fun m!1446545 () Bool)

(assert (=> start!135142 m!1446545))

(declare-fun m!1446547 () Bool)

(assert (=> start!135142 m!1446547))

(declare-fun m!1446549 () Bool)

(assert (=> b!1572903 m!1446549))

(check-sat (not b!1572901) (not b!1572902) (not start!135142) (not b!1572903))
(check-sat)
