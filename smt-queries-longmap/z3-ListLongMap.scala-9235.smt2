; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110760 () Bool)

(assert start!110760)

(declare-fun b_free!29595 () Bool)

(declare-fun b_next!29595 () Bool)

(assert (=> start!110760 (= b_free!29595 (not b_next!29595))))

(declare-fun tp!104107 () Bool)

(declare-fun b_and!47803 () Bool)

(assert (=> start!110760 (= tp!104107 b_and!47803)))

(declare-fun b!1310927 () Bool)

(declare-fun e!747824 () Bool)

(declare-fun e!747823 () Bool)

(declare-fun mapRes!54616 () Bool)

(assert (=> b!1310927 (= e!747824 (and e!747823 mapRes!54616))))

(declare-fun condMapEmpty!54616 () Bool)

(declare-datatypes ((V!52203 0))(
  ( (V!52204 (val!17737 Int)) )
))
(declare-datatypes ((ValueCell!16764 0))(
  ( (ValueCellFull!16764 (v!20364 V!52203)) (EmptyCell!16764) )
))
(declare-datatypes ((array!87638 0))(
  ( (array!87639 (arr!42299 (Array (_ BitVec 32) ValueCell!16764)) (size!42849 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87638)

(declare-fun mapDefault!54616 () ValueCell!16764)

(assert (=> b!1310927 (= condMapEmpty!54616 (= (arr!42299 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16764)) mapDefault!54616)))))

(declare-fun b!1310928 () Bool)

(declare-fun res!870294 () Bool)

(declare-fun e!747825 () Bool)

(assert (=> b!1310928 (=> (not res!870294) (not e!747825))))

(declare-datatypes ((array!87640 0))(
  ( (array!87641 (arr!42300 (Array (_ BitVec 32) (_ BitVec 64))) (size!42850 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87640)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87640 (_ BitVec 32)) Bool)

(assert (=> b!1310928 (= res!870294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310929 () Bool)

(declare-fun res!870295 () Bool)

(assert (=> b!1310929 (=> (not res!870295) (not e!747825))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310929 (= res!870295 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42850 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54616 () Bool)

(declare-fun tp!104106 () Bool)

(declare-fun e!747826 () Bool)

(assert (=> mapNonEmpty!54616 (= mapRes!54616 (and tp!104106 e!747826))))

(declare-fun mapValue!54616 () ValueCell!16764)

(declare-fun mapKey!54616 () (_ BitVec 32))

(declare-fun mapRest!54616 () (Array (_ BitVec 32) ValueCell!16764))

(assert (=> mapNonEmpty!54616 (= (arr!42299 _values!1354) (store mapRest!54616 mapKey!54616 mapValue!54616))))

(declare-fun mapIsEmpty!54616 () Bool)

(assert (=> mapIsEmpty!54616 mapRes!54616))

(declare-fun b!1310931 () Bool)

(assert (=> b!1310931 (= e!747825 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52203)

(declare-fun lt!585411 () Bool)

(declare-fun zeroValue!1296 () V!52203)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22858 0))(
  ( (tuple2!22859 (_1!11440 (_ BitVec 64)) (_2!11440 V!52203)) )
))
(declare-datatypes ((List!29997 0))(
  ( (Nil!29994) (Cons!29993 (h!31202 tuple2!22858) (t!43603 List!29997)) )
))
(declare-datatypes ((ListLongMap!20515 0))(
  ( (ListLongMap!20516 (toList!10273 List!29997)) )
))
(declare-fun contains!8423 (ListLongMap!20515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5286 (array!87640 array!87638 (_ BitVec 32) (_ BitVec 32) V!52203 V!52203 (_ BitVec 32) Int) ListLongMap!20515)

(assert (=> b!1310931 (= lt!585411 (contains!8423 (getCurrentListMap!5286 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310932 () Bool)

(declare-fun tp_is_empty!35325 () Bool)

(assert (=> b!1310932 (= e!747826 tp_is_empty!35325)))

(declare-fun b!1310933 () Bool)

(declare-fun res!870293 () Bool)

(assert (=> b!1310933 (=> (not res!870293) (not e!747825))))

(declare-datatypes ((List!29998 0))(
  ( (Nil!29995) (Cons!29994 (h!31203 (_ BitVec 64)) (t!43604 List!29998)) )
))
(declare-fun arrayNoDuplicates!0 (array!87640 (_ BitVec 32) List!29998) Bool)

(assert (=> b!1310933 (= res!870293 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29995))))

(declare-fun b!1310934 () Bool)

(assert (=> b!1310934 (= e!747823 tp_is_empty!35325)))

(declare-fun res!870296 () Bool)

(assert (=> start!110760 (=> (not res!870296) (not e!747825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110760 (= res!870296 (validMask!0 mask!2040))))

(assert (=> start!110760 e!747825))

(assert (=> start!110760 tp!104107))

(declare-fun array_inv!31963 (array!87640) Bool)

(assert (=> start!110760 (array_inv!31963 _keys!1628)))

(assert (=> start!110760 true))

(assert (=> start!110760 tp_is_empty!35325))

(declare-fun array_inv!31964 (array!87638) Bool)

(assert (=> start!110760 (and (array_inv!31964 _values!1354) e!747824)))

(declare-fun b!1310930 () Bool)

(declare-fun res!870297 () Bool)

(assert (=> b!1310930 (=> (not res!870297) (not e!747825))))

(assert (=> b!1310930 (= res!870297 (and (= (size!42849 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42850 _keys!1628) (size!42849 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110760 res!870296) b!1310930))

(assert (= (and b!1310930 res!870297) b!1310928))

(assert (= (and b!1310928 res!870294) b!1310933))

(assert (= (and b!1310933 res!870293) b!1310929))

(assert (= (and b!1310929 res!870295) b!1310931))

(assert (= (and b!1310927 condMapEmpty!54616) mapIsEmpty!54616))

(assert (= (and b!1310927 (not condMapEmpty!54616)) mapNonEmpty!54616))

(get-info :version)

(assert (= (and mapNonEmpty!54616 ((_ is ValueCellFull!16764) mapValue!54616)) b!1310932))

(assert (= (and b!1310927 ((_ is ValueCellFull!16764) mapDefault!54616)) b!1310934))

(assert (= start!110760 b!1310927))

(declare-fun m!1200565 () Bool)

(assert (=> b!1310931 m!1200565))

(assert (=> b!1310931 m!1200565))

(declare-fun m!1200567 () Bool)

(assert (=> b!1310931 m!1200567))

(declare-fun m!1200569 () Bool)

(assert (=> mapNonEmpty!54616 m!1200569))

(declare-fun m!1200571 () Bool)

(assert (=> b!1310933 m!1200571))

(declare-fun m!1200573 () Bool)

(assert (=> b!1310928 m!1200573))

(declare-fun m!1200575 () Bool)

(assert (=> start!110760 m!1200575))

(declare-fun m!1200577 () Bool)

(assert (=> start!110760 m!1200577))

(declare-fun m!1200579 () Bool)

(assert (=> start!110760 m!1200579))

(check-sat (not b_next!29595) (not b!1310933) tp_is_empty!35325 (not b!1310928) (not b!1310931) (not start!110760) (not mapNonEmpty!54616) b_and!47803)
(check-sat b_and!47803 (not b_next!29595))
