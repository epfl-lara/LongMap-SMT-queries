; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110752 () Bool)

(assert start!110752)

(declare-fun b_free!29587 () Bool)

(declare-fun b_next!29587 () Bool)

(assert (=> start!110752 (= b_free!29587 (not b_next!29587))))

(declare-fun tp!104083 () Bool)

(declare-fun b_and!47795 () Bool)

(assert (=> start!110752 (= tp!104083 b_and!47795)))

(declare-fun b!1310831 () Bool)

(declare-fun res!870233 () Bool)

(declare-fun e!747766 () Bool)

(assert (=> b!1310831 (=> (not res!870233) (not e!747766))))

(declare-datatypes ((array!87622 0))(
  ( (array!87623 (arr!42291 (Array (_ BitVec 32) (_ BitVec 64))) (size!42841 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87622)

(declare-datatypes ((List!29992 0))(
  ( (Nil!29989) (Cons!29988 (h!31197 (_ BitVec 64)) (t!43598 List!29992)) )
))
(declare-fun arrayNoDuplicates!0 (array!87622 (_ BitVec 32) List!29992) Bool)

(assert (=> b!1310831 (= res!870233 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29989))))

(declare-fun mapIsEmpty!54604 () Bool)

(declare-fun mapRes!54604 () Bool)

(assert (=> mapIsEmpty!54604 mapRes!54604))

(declare-fun b!1310832 () Bool)

(declare-fun e!747764 () Bool)

(declare-fun tp_is_empty!35317 () Bool)

(assert (=> b!1310832 (= e!747764 tp_is_empty!35317)))

(declare-fun b!1310833 () Bool)

(declare-fun res!870235 () Bool)

(assert (=> b!1310833 (=> (not res!870235) (not e!747766))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87622 (_ BitVec 32)) Bool)

(assert (=> b!1310833 (= res!870235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310834 () Bool)

(assert (=> b!1310834 (= e!747766 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585399 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52193 0))(
  ( (V!52194 (val!17733 Int)) )
))
(declare-fun minValue!1296 () V!52193)

(declare-datatypes ((ValueCell!16760 0))(
  ( (ValueCellFull!16760 (v!20360 V!52193)) (EmptyCell!16760) )
))
(declare-datatypes ((array!87624 0))(
  ( (array!87625 (arr!42292 (Array (_ BitVec 32) ValueCell!16760)) (size!42842 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87624)

(declare-fun zeroValue!1296 () V!52193)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22852 0))(
  ( (tuple2!22853 (_1!11437 (_ BitVec 64)) (_2!11437 V!52193)) )
))
(declare-datatypes ((List!29993 0))(
  ( (Nil!29990) (Cons!29989 (h!31198 tuple2!22852) (t!43599 List!29993)) )
))
(declare-datatypes ((ListLongMap!20509 0))(
  ( (ListLongMap!20510 (toList!10270 List!29993)) )
))
(declare-fun contains!8420 (ListLongMap!20509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5283 (array!87622 array!87624 (_ BitVec 32) (_ BitVec 32) V!52193 V!52193 (_ BitVec 32) Int) ListLongMap!20509)

(assert (=> b!1310834 (= lt!585399 (contains!8420 (getCurrentListMap!5283 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310835 () Bool)

(declare-fun res!870236 () Bool)

(assert (=> b!1310835 (=> (not res!870236) (not e!747766))))

(assert (=> b!1310835 (= res!870236 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42841 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54604 () Bool)

(declare-fun tp!104082 () Bool)

(assert (=> mapNonEmpty!54604 (= mapRes!54604 (and tp!104082 e!747764))))

(declare-fun mapKey!54604 () (_ BitVec 32))

(declare-fun mapValue!54604 () ValueCell!16760)

(declare-fun mapRest!54604 () (Array (_ BitVec 32) ValueCell!16760))

(assert (=> mapNonEmpty!54604 (= (arr!42292 _values!1354) (store mapRest!54604 mapKey!54604 mapValue!54604))))

(declare-fun b!1310836 () Bool)

(declare-fun e!747763 () Bool)

(declare-fun e!747767 () Bool)

(assert (=> b!1310836 (= e!747763 (and e!747767 mapRes!54604))))

(declare-fun condMapEmpty!54604 () Bool)

(declare-fun mapDefault!54604 () ValueCell!16760)

