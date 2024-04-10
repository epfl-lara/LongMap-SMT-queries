; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112798 () Bool)

(assert start!112798)

(declare-fun b_free!31051 () Bool)

(declare-fun b_next!31051 () Bool)

(assert (=> start!112798 (= b_free!31051 (not b_next!31051))))

(declare-fun tp!108800 () Bool)

(declare-fun b_and!50049 () Bool)

(assert (=> start!112798 (= tp!108800 b_and!50049)))

(declare-fun mapIsEmpty!57126 () Bool)

(declare-fun mapRes!57126 () Bool)

(assert (=> mapIsEmpty!57126 mapRes!57126))

(declare-fun b!1337773 () Bool)

(declare-fun e!761758 () Bool)

(declare-fun tp_is_empty!36961 () Bool)

(assert (=> b!1337773 (= e!761758 tp_is_empty!36961)))

(declare-fun b!1337774 () Bool)

(declare-fun res!887693 () Bool)

(declare-fun e!761759 () Bool)

(assert (=> b!1337774 (=> (not res!887693) (not e!761759))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90780 0))(
  ( (array!90781 (arr!43853 (Array (_ BitVec 32) (_ BitVec 64))) (size!44403 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90780)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1337774 (= res!887693 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44403 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57126 () Bool)

(declare-fun tp!108801 () Bool)

(assert (=> mapNonEmpty!57126 (= mapRes!57126 (and tp!108801 e!761758))))

(declare-datatypes ((V!54385 0))(
  ( (V!54386 (val!18555 Int)) )
))
(declare-datatypes ((ValueCell!17582 0))(
  ( (ValueCellFull!17582 (v!21199 V!54385)) (EmptyCell!17582) )
))
(declare-datatypes ((array!90782 0))(
  ( (array!90783 (arr!43854 (Array (_ BitVec 32) ValueCell!17582)) (size!44404 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90782)

(declare-fun mapKey!57126 () (_ BitVec 32))

(declare-fun mapRest!57126 () (Array (_ BitVec 32) ValueCell!17582))

(declare-fun mapValue!57126 () ValueCell!17582)

(assert (=> mapNonEmpty!57126 (= (arr!43854 _values!1320) (store mapRest!57126 mapKey!57126 mapValue!57126))))

(declare-fun b!1337775 () Bool)

(declare-fun res!887696 () Bool)

(assert (=> b!1337775 (=> (not res!887696) (not e!761759))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54385)

(declare-fun zeroValue!1262 () V!54385)

(declare-datatypes ((tuple2!23936 0))(
  ( (tuple2!23937 (_1!11979 (_ BitVec 64)) (_2!11979 V!54385)) )
))
(declare-datatypes ((List!31078 0))(
  ( (Nil!31075) (Cons!31074 (h!32283 tuple2!23936) (t!45398 List!31078)) )
))
(declare-datatypes ((ListLongMap!21593 0))(
  ( (ListLongMap!21594 (toList!10812 List!31078)) )
))
(declare-fun contains!8981 (ListLongMap!21593 (_ BitVec 64)) Bool)

(declare-fun +!4748 (ListLongMap!21593 tuple2!23936) ListLongMap!21593)

(declare-fun getCurrentListMapNoExtraKeys!6390 (array!90780 array!90782 (_ BitVec 32) (_ BitVec 32) V!54385 V!54385 (_ BitVec 32) Int) ListLongMap!21593)

(declare-fun get!22136 (ValueCell!17582 V!54385) V!54385)

(declare-fun dynLambda!3687 (Int (_ BitVec 64)) V!54385)

(assert (=> b!1337775 (= res!887696 (contains!8981 (+!4748 (getCurrentListMapNoExtraKeys!6390 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23937 (select (arr!43853 _keys!1590) from!1980) (get!22136 (select (arr!43854 _values!1320) from!1980) (dynLambda!3687 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153))))

(declare-fun b!1337776 () Bool)

(declare-fun res!887689 () Bool)

(assert (=> b!1337776 (=> (not res!887689) (not e!761759))))

(assert (=> b!1337776 (= res!887689 (not (= (select (arr!43853 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1337777 () Bool)

(declare-fun res!887690 () Bool)

(assert (=> b!1337777 (=> (not res!887690) (not e!761759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337777 (= res!887690 (validKeyInArray!0 (select (arr!43853 _keys!1590) from!1980)))))

(declare-fun b!1337778 () Bool)

(declare-fun res!887691 () Bool)

(assert (=> b!1337778 (=> (not res!887691) (not e!761759))))

(assert (=> b!1337778 (= res!887691 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337779 () Bool)

(declare-fun res!887692 () Bool)

(assert (=> b!1337779 (=> (not res!887692) (not e!761759))))

(assert (=> b!1337779 (= res!887692 (and (= (size!44404 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44403 _keys!1590) (size!44404 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337780 () Bool)

(assert (=> b!1337780 (= e!761759 (= k!1153 (select (arr!43853 _keys!1590) from!1980)))))

(declare-fun res!887695 () Bool)

(assert (=> start!112798 (=> (not res!887695) (not e!761759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112798 (= res!887695 (validMask!0 mask!1998))))

(assert (=> start!112798 e!761759))

(declare-fun e!761756 () Bool)

(declare-fun array_inv!33071 (array!90782) Bool)

(assert (=> start!112798 (and (array_inv!33071 _values!1320) e!761756)))

(assert (=> start!112798 true))

(declare-fun array_inv!33072 (array!90780) Bool)

(assert (=> start!112798 (array_inv!33072 _keys!1590)))

(assert (=> start!112798 tp!108800))

(assert (=> start!112798 tp_is_empty!36961))

(declare-fun b!1337772 () Bool)

(declare-fun res!887698 () Bool)

(assert (=> b!1337772 (=> (not res!887698) (not e!761759))))

(declare-datatypes ((List!31079 0))(
  ( (Nil!31076) (Cons!31075 (h!32284 (_ BitVec 64)) (t!45399 List!31079)) )
))
(declare-fun arrayNoDuplicates!0 (array!90780 (_ BitVec 32) List!31079) Bool)

(assert (=> b!1337772 (= res!887698 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31076))))

(declare-fun b!1337781 () Bool)

(declare-fun e!761757 () Bool)

(assert (=> b!1337781 (= e!761757 tp_is_empty!36961)))

(declare-fun b!1337782 () Bool)

(assert (=> b!1337782 (= e!761756 (and e!761757 mapRes!57126))))

(declare-fun condMapEmpty!57126 () Bool)

(declare-fun mapDefault!57126 () ValueCell!17582)

