; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111364 () Bool)

(assert start!111364)

(declare-fun b_free!30021 () Bool)

(declare-fun b_next!30021 () Bool)

(assert (=> start!111364 (= b_free!30021 (not b_next!30021))))

(declare-fun tp!105538 () Bool)

(declare-fun b_and!48241 () Bool)

(assert (=> start!111364 (= tp!105538 b_and!48241)))

(declare-fun b!1317772 () Bool)

(declare-fun res!874577 () Bool)

(declare-fun e!751997 () Bool)

(assert (=> b!1317772 (=> (not res!874577) (not e!751997))))

(declare-datatypes ((array!88634 0))(
  ( (array!88635 (arr!42791 (Array (_ BitVec 32) (_ BitVec 64))) (size!43341 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88634)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88634 (_ BitVec 32)) Bool)

(assert (=> b!1317772 (= res!874577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317773 () Bool)

(declare-fun e!751996 () Bool)

(declare-fun e!751995 () Bool)

(declare-fun mapRes!55409 () Bool)

(assert (=> b!1317773 (= e!751996 (and e!751995 mapRes!55409))))

(declare-fun condMapEmpty!55409 () Bool)

(declare-datatypes ((V!52891 0))(
  ( (V!52892 (val!17995 Int)) )
))
(declare-datatypes ((ValueCell!17022 0))(
  ( (ValueCellFull!17022 (v!20625 V!52891)) (EmptyCell!17022) )
))
(declare-datatypes ((array!88636 0))(
  ( (array!88637 (arr!42792 (Array (_ BitVec 32) ValueCell!17022)) (size!43342 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88636)

(declare-fun mapDefault!55409 () ValueCell!17022)

(assert (=> b!1317773 (= condMapEmpty!55409 (= (arr!42792 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17022)) mapDefault!55409)))))

(declare-fun b!1317774 () Bool)

(declare-fun tp_is_empty!35841 () Bool)

(assert (=> b!1317774 (= e!751995 tp_is_empty!35841)))

(declare-fun b!1317775 () Bool)

(declare-fun res!874579 () Bool)

(assert (=> b!1317775 (=> (not res!874579) (not e!751997))))

(declare-datatypes ((List!30317 0))(
  ( (Nil!30314) (Cons!30313 (h!31522 (_ BitVec 64)) (t!43925 List!30317)) )
))
(declare-fun arrayNoDuplicates!0 (array!88634 (_ BitVec 32) List!30317) Bool)

(assert (=> b!1317775 (= res!874579 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30314))))

(declare-fun b!1317776 () Bool)

(declare-fun res!874580 () Bool)

(assert (=> b!1317776 (=> (not res!874580) (not e!751997))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317776 (= res!874580 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43341 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317777 () Bool)

(assert (=> b!1317777 (= e!751997 false)))

(declare-fun zeroValue!1279 () V!52891)

(declare-fun minValue!1279 () V!52891)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586407 () Bool)

(declare-datatypes ((tuple2!23160 0))(
  ( (tuple2!23161 (_1!11591 (_ BitVec 64)) (_2!11591 V!52891)) )
))
(declare-datatypes ((List!30318 0))(
  ( (Nil!30315) (Cons!30314 (h!31523 tuple2!23160) (t!43926 List!30318)) )
))
(declare-datatypes ((ListLongMap!20817 0))(
  ( (ListLongMap!20818 (toList!10424 List!30318)) )
))
(declare-fun contains!8579 (ListLongMap!20817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5437 (array!88634 array!88636 (_ BitVec 32) (_ BitVec 32) V!52891 V!52891 (_ BitVec 32) Int) ListLongMap!20817)

(assert (=> b!1317777 (= lt!586407 (contains!8579 (getCurrentListMap!5437 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55409 () Bool)

(assert (=> mapIsEmpty!55409 mapRes!55409))

(declare-fun res!874578 () Bool)

(assert (=> start!111364 (=> (not res!874578) (not e!751997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111364 (= res!874578 (validMask!0 mask!2019))))

(assert (=> start!111364 e!751997))

(declare-fun array_inv!32319 (array!88634) Bool)

(assert (=> start!111364 (array_inv!32319 _keys!1609)))

(assert (=> start!111364 true))

(assert (=> start!111364 tp_is_empty!35841))

(declare-fun array_inv!32320 (array!88636) Bool)

(assert (=> start!111364 (and (array_inv!32320 _values!1337) e!751996)))

(assert (=> start!111364 tp!105538))

(declare-fun mapNonEmpty!55409 () Bool)

(declare-fun tp!105539 () Bool)

(declare-fun e!751999 () Bool)

(assert (=> mapNonEmpty!55409 (= mapRes!55409 (and tp!105539 e!751999))))

(declare-fun mapValue!55409 () ValueCell!17022)

(declare-fun mapKey!55409 () (_ BitVec 32))

(declare-fun mapRest!55409 () (Array (_ BitVec 32) ValueCell!17022))

(assert (=> mapNonEmpty!55409 (= (arr!42792 _values!1337) (store mapRest!55409 mapKey!55409 mapValue!55409))))

(declare-fun b!1317778 () Bool)

(assert (=> b!1317778 (= e!751999 tp_is_empty!35841)))

(declare-fun b!1317779 () Bool)

(declare-fun res!874576 () Bool)

(assert (=> b!1317779 (=> (not res!874576) (not e!751997))))

(assert (=> b!1317779 (= res!874576 (and (= (size!43342 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43341 _keys!1609) (size!43342 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111364 res!874578) b!1317779))

(assert (= (and b!1317779 res!874576) b!1317772))

(assert (= (and b!1317772 res!874577) b!1317775))

(assert (= (and b!1317775 res!874579) b!1317776))

(assert (= (and b!1317776 res!874580) b!1317777))

(assert (= (and b!1317773 condMapEmpty!55409) mapIsEmpty!55409))

(assert (= (and b!1317773 (not condMapEmpty!55409)) mapNonEmpty!55409))

(get-info :version)

(assert (= (and mapNonEmpty!55409 ((_ is ValueCellFull!17022) mapValue!55409)) b!1317778))

(assert (= (and b!1317773 ((_ is ValueCellFull!17022) mapDefault!55409)) b!1317774))

(assert (= start!111364 b!1317773))

(declare-fun m!1205515 () Bool)

(assert (=> b!1317777 m!1205515))

(assert (=> b!1317777 m!1205515))

(declare-fun m!1205517 () Bool)

(assert (=> b!1317777 m!1205517))

(declare-fun m!1205519 () Bool)

(assert (=> b!1317775 m!1205519))

(declare-fun m!1205521 () Bool)

(assert (=> start!111364 m!1205521))

(declare-fun m!1205523 () Bool)

(assert (=> start!111364 m!1205523))

(declare-fun m!1205525 () Bool)

(assert (=> start!111364 m!1205525))

(declare-fun m!1205527 () Bool)

(assert (=> mapNonEmpty!55409 m!1205527))

(declare-fun m!1205529 () Bool)

(assert (=> b!1317772 m!1205529))

(check-sat tp_is_empty!35841 (not b_next!30021) (not b!1317775) b_and!48241 (not start!111364) (not b!1317772) (not mapNonEmpty!55409) (not b!1317777))
(check-sat b_and!48241 (not b_next!30021))
