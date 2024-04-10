; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111346 () Bool)

(assert start!111346)

(declare-fun mapIsEmpty!55382 () Bool)

(declare-fun mapRes!55382 () Bool)

(assert (=> mapIsEmpty!55382 mapRes!55382))

(declare-fun b!1317560 () Bool)

(declare-fun res!874448 () Bool)

(declare-fun e!751862 () Bool)

(assert (=> b!1317560 (=> (not res!874448) (not e!751862))))

(declare-datatypes ((array!88600 0))(
  ( (array!88601 (arr!42774 (Array (_ BitVec 32) (_ BitVec 64))) (size!43324 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88600)

(declare-datatypes ((List!30310 0))(
  ( (Nil!30307) (Cons!30306 (h!31515 (_ BitVec 64)) (t!43918 List!30310)) )
))
(declare-fun arrayNoDuplicates!0 (array!88600 (_ BitVec 32) List!30310) Bool)

(assert (=> b!1317560 (= res!874448 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30307))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1317561 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1317561 (= e!751862 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43324 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2000 (size!43324 _keys!1609))))))

(declare-fun b!1317562 () Bool)

(declare-fun res!874445 () Bool)

(assert (=> b!1317562 (=> (not res!874445) (not e!751862))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88600 (_ BitVec 32)) Bool)

(assert (=> b!1317562 (= res!874445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317563 () Bool)

(declare-fun e!751863 () Bool)

(declare-fun tp_is_empty!35823 () Bool)

(assert (=> b!1317563 (= e!751863 tp_is_empty!35823)))

(declare-fun mapNonEmpty!55382 () Bool)

(declare-fun tp!105488 () Bool)

(assert (=> mapNonEmpty!55382 (= mapRes!55382 (and tp!105488 e!751863))))

(declare-datatypes ((V!52867 0))(
  ( (V!52868 (val!17986 Int)) )
))
(declare-datatypes ((ValueCell!17013 0))(
  ( (ValueCellFull!17013 (v!20616 V!52867)) (EmptyCell!17013) )
))
(declare-fun mapValue!55382 () ValueCell!17013)

(declare-fun mapRest!55382 () (Array (_ BitVec 32) ValueCell!17013))

(declare-fun mapKey!55382 () (_ BitVec 32))

(declare-datatypes ((array!88602 0))(
  ( (array!88603 (arr!42775 (Array (_ BitVec 32) ValueCell!17013)) (size!43325 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88602)

(assert (=> mapNonEmpty!55382 (= (arr!42775 _values!1337) (store mapRest!55382 mapKey!55382 mapValue!55382))))

(declare-fun res!874447 () Bool)

(assert (=> start!111346 (=> (not res!874447) (not e!751862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111346 (= res!874447 (validMask!0 mask!2019))))

(assert (=> start!111346 e!751862))

(declare-fun array_inv!32307 (array!88600) Bool)

(assert (=> start!111346 (array_inv!32307 _keys!1609)))

(assert (=> start!111346 true))

(declare-fun e!751864 () Bool)

(declare-fun array_inv!32308 (array!88602) Bool)

(assert (=> start!111346 (and (array_inv!32308 _values!1337) e!751864)))

(declare-fun b!1317564 () Bool)

(declare-fun res!874446 () Bool)

(assert (=> b!1317564 (=> (not res!874446) (not e!751862))))

(assert (=> b!1317564 (= res!874446 (and (= (size!43325 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43324 _keys!1609) (size!43325 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317565 () Bool)

(declare-fun e!751860 () Bool)

(assert (=> b!1317565 (= e!751860 tp_is_empty!35823)))

(declare-fun b!1317566 () Bool)

(assert (=> b!1317566 (= e!751864 (and e!751860 mapRes!55382))))

(declare-fun condMapEmpty!55382 () Bool)

(declare-fun mapDefault!55382 () ValueCell!17013)

(assert (=> b!1317566 (= condMapEmpty!55382 (= (arr!42775 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17013)) mapDefault!55382)))))

(assert (= (and start!111346 res!874447) b!1317564))

(assert (= (and b!1317564 res!874446) b!1317562))

(assert (= (and b!1317562 res!874445) b!1317560))

(assert (= (and b!1317560 res!874448) b!1317561))

(assert (= (and b!1317566 condMapEmpty!55382) mapIsEmpty!55382))

(assert (= (and b!1317566 (not condMapEmpty!55382)) mapNonEmpty!55382))

(get-info :version)

(assert (= (and mapNonEmpty!55382 ((_ is ValueCellFull!17013) mapValue!55382)) b!1317563))

(assert (= (and b!1317566 ((_ is ValueCellFull!17013) mapDefault!55382)) b!1317565))

(assert (= start!111346 b!1317566))

(declare-fun m!1205379 () Bool)

(assert (=> b!1317560 m!1205379))

(declare-fun m!1205381 () Bool)

(assert (=> b!1317562 m!1205381))

(declare-fun m!1205383 () Bool)

(assert (=> mapNonEmpty!55382 m!1205383))

(declare-fun m!1205385 () Bool)

(assert (=> start!111346 m!1205385))

(declare-fun m!1205387 () Bool)

(assert (=> start!111346 m!1205387))

(declare-fun m!1205389 () Bool)

(assert (=> start!111346 m!1205389))

(check-sat (not mapNonEmpty!55382) (not b!1317562) (not b!1317560) (not start!111346) tp_is_empty!35823)
(check-sat)
