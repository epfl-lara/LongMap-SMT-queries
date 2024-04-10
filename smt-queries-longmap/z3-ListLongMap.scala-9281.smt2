; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111036 () Bool)

(assert start!111036)

(declare-fun b_free!29871 () Bool)

(declare-fun b_next!29871 () Bool)

(assert (=> start!111036 (= b_free!29871 (not b_next!29871))))

(declare-fun tp!104934 () Bool)

(declare-fun b_and!48079 () Bool)

(assert (=> start!111036 (= tp!104934 b_and!48079)))

(declare-fun b!1314626 () Bool)

(declare-fun e!749893 () Bool)

(declare-fun tp_is_empty!35601 () Bool)

(assert (=> b!1314626 (= e!749893 tp_is_empty!35601)))

(declare-fun b!1314627 () Bool)

(declare-fun e!749894 () Bool)

(declare-fun mapRes!55030 () Bool)

(assert (=> b!1314627 (= e!749894 (and e!749893 mapRes!55030))))

(declare-fun condMapEmpty!55030 () Bool)

(declare-datatypes ((V!52571 0))(
  ( (V!52572 (val!17875 Int)) )
))
(declare-datatypes ((ValueCell!16902 0))(
  ( (ValueCellFull!16902 (v!20502 V!52571)) (EmptyCell!16902) )
))
(declare-datatypes ((array!88170 0))(
  ( (array!88171 (arr!42565 (Array (_ BitVec 32) ValueCell!16902)) (size!43115 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88170)

(declare-fun mapDefault!55030 () ValueCell!16902)

(assert (=> b!1314627 (= condMapEmpty!55030 (= (arr!42565 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16902)) mapDefault!55030)))))

(declare-fun b!1314628 () Bool)

(declare-fun res!872750 () Bool)

(declare-fun e!749896 () Bool)

(assert (=> b!1314628 (=> (not res!872750) (not e!749896))))

(declare-datatypes ((array!88172 0))(
  ( (array!88173 (arr!42566 (Array (_ BitVec 32) (_ BitVec 64))) (size!43116 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88172)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314628 (= res!872750 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43116 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314629 () Bool)

(declare-fun res!872754 () Bool)

(assert (=> b!1314629 (=> (not res!872754) (not e!749896))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88172 (_ BitVec 32)) Bool)

(assert (=> b!1314629 (= res!872754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314630 () Bool)

(declare-fun res!872753 () Bool)

(assert (=> b!1314630 (=> (not res!872753) (not e!749896))))

(declare-datatypes ((List!30187 0))(
  ( (Nil!30184) (Cons!30183 (h!31392 (_ BitVec 64)) (t!43793 List!30187)) )
))
(declare-fun arrayNoDuplicates!0 (array!88172 (_ BitVec 32) List!30187) Bool)

(assert (=> b!1314630 (= res!872753 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30184))))

(declare-fun b!1314631 () Bool)

(assert (=> b!1314631 (= e!749896 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52571)

(declare-fun zeroValue!1296 () V!52571)

(declare-fun lt!585816 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23050 0))(
  ( (tuple2!23051 (_1!11536 (_ BitVec 64)) (_2!11536 V!52571)) )
))
(declare-datatypes ((List!30188 0))(
  ( (Nil!30185) (Cons!30184 (h!31393 tuple2!23050) (t!43794 List!30188)) )
))
(declare-datatypes ((ListLongMap!20707 0))(
  ( (ListLongMap!20708 (toList!10369 List!30188)) )
))
(declare-fun contains!8519 (ListLongMap!20707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5382 (array!88172 array!88170 (_ BitVec 32) (_ BitVec 32) V!52571 V!52571 (_ BitVec 32) Int) ListLongMap!20707)

(assert (=> b!1314631 (= lt!585816 (contains!8519 (getCurrentListMap!5382 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314632 () Bool)

(declare-fun e!749895 () Bool)

(assert (=> b!1314632 (= e!749895 tp_is_empty!35601)))

(declare-fun res!872752 () Bool)

(assert (=> start!111036 (=> (not res!872752) (not e!749896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111036 (= res!872752 (validMask!0 mask!2040))))

(assert (=> start!111036 e!749896))

(assert (=> start!111036 tp!104934))

(declare-fun array_inv!32145 (array!88172) Bool)

(assert (=> start!111036 (array_inv!32145 _keys!1628)))

(assert (=> start!111036 true))

(assert (=> start!111036 tp_is_empty!35601))

(declare-fun array_inv!32146 (array!88170) Bool)

(assert (=> start!111036 (and (array_inv!32146 _values!1354) e!749894)))

(declare-fun b!1314633 () Bool)

(declare-fun res!872751 () Bool)

(assert (=> b!1314633 (=> (not res!872751) (not e!749896))))

(assert (=> b!1314633 (= res!872751 (and (= (size!43115 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43116 _keys!1628) (size!43115 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55030 () Bool)

(assert (=> mapIsEmpty!55030 mapRes!55030))

(declare-fun mapNonEmpty!55030 () Bool)

(declare-fun tp!104935 () Bool)

(assert (=> mapNonEmpty!55030 (= mapRes!55030 (and tp!104935 e!749895))))

(declare-fun mapKey!55030 () (_ BitVec 32))

(declare-fun mapRest!55030 () (Array (_ BitVec 32) ValueCell!16902))

(declare-fun mapValue!55030 () ValueCell!16902)

(assert (=> mapNonEmpty!55030 (= (arr!42565 _values!1354) (store mapRest!55030 mapKey!55030 mapValue!55030))))

(assert (= (and start!111036 res!872752) b!1314633))

(assert (= (and b!1314633 res!872751) b!1314629))

(assert (= (and b!1314629 res!872754) b!1314630))

(assert (= (and b!1314630 res!872753) b!1314628))

(assert (= (and b!1314628 res!872750) b!1314631))

(assert (= (and b!1314627 condMapEmpty!55030) mapIsEmpty!55030))

(assert (= (and b!1314627 (not condMapEmpty!55030)) mapNonEmpty!55030))

(get-info :version)

(assert (= (and mapNonEmpty!55030 ((_ is ValueCellFull!16902) mapValue!55030)) b!1314632))

(assert (= (and b!1314627 ((_ is ValueCellFull!16902) mapDefault!55030)) b!1314626))

(assert (= start!111036 b!1314627))

(declare-fun m!1203085 () Bool)

(assert (=> b!1314631 m!1203085))

(assert (=> b!1314631 m!1203085))

(declare-fun m!1203087 () Bool)

(assert (=> b!1314631 m!1203087))

(declare-fun m!1203089 () Bool)

(assert (=> mapNonEmpty!55030 m!1203089))

(declare-fun m!1203091 () Bool)

(assert (=> b!1314629 m!1203091))

(declare-fun m!1203093 () Bool)

(assert (=> b!1314630 m!1203093))

(declare-fun m!1203095 () Bool)

(assert (=> start!111036 m!1203095))

(declare-fun m!1203097 () Bool)

(assert (=> start!111036 m!1203097))

(declare-fun m!1203099 () Bool)

(assert (=> start!111036 m!1203099))

(check-sat (not start!111036) (not b_next!29871) (not b!1314631) (not mapNonEmpty!55030) b_and!48079 (not b!1314630) (not b!1314629) tp_is_empty!35601)
(check-sat b_and!48079 (not b_next!29871))
