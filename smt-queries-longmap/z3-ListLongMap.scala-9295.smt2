; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111120 () Bool)

(assert start!111120)

(declare-fun b_free!29955 () Bool)

(declare-fun b_next!29955 () Bool)

(assert (=> start!111120 (= b_free!29955 (not b_next!29955))))

(declare-fun tp!105187 () Bool)

(declare-fun b_and!48163 () Bool)

(assert (=> start!111120 (= tp!105187 b_and!48163)))

(declare-fun b!1315670 () Bool)

(declare-fun e!750527 () Bool)

(declare-fun tp_is_empty!35685 () Bool)

(assert (=> b!1315670 (= e!750527 tp_is_empty!35685)))

(declare-fun mapIsEmpty!55156 () Bool)

(declare-fun mapRes!55156 () Bool)

(assert (=> mapIsEmpty!55156 mapRes!55156))

(declare-fun res!873416 () Bool)

(declare-fun e!750523 () Bool)

(assert (=> start!111120 (=> (not res!873416) (not e!750523))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111120 (= res!873416 (validMask!0 mask!2040))))

(assert (=> start!111120 e!750523))

(assert (=> start!111120 tp!105187))

(declare-datatypes ((array!88332 0))(
  ( (array!88333 (arr!42646 (Array (_ BitVec 32) (_ BitVec 64))) (size!43196 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88332)

(declare-fun array_inv!32209 (array!88332) Bool)

(assert (=> start!111120 (array_inv!32209 _keys!1628)))

(assert (=> start!111120 true))

(assert (=> start!111120 tp_is_empty!35685))

(declare-datatypes ((V!52683 0))(
  ( (V!52684 (val!17917 Int)) )
))
(declare-datatypes ((ValueCell!16944 0))(
  ( (ValueCellFull!16944 (v!20544 V!52683)) (EmptyCell!16944) )
))
(declare-datatypes ((array!88334 0))(
  ( (array!88335 (arr!42647 (Array (_ BitVec 32) ValueCell!16944)) (size!43197 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88334)

(declare-fun e!750526 () Bool)

(declare-fun array_inv!32210 (array!88334) Bool)

(assert (=> start!111120 (and (array_inv!32210 _values!1354) e!750526)))

(declare-fun b!1315671 () Bool)

(declare-fun res!873420 () Bool)

(assert (=> b!1315671 (=> (not res!873420) (not e!750523))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315671 (= res!873420 (and (= (size!43197 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43196 _keys!1628) (size!43197 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315672 () Bool)

(declare-fun e!750525 () Bool)

(assert (=> b!1315672 (= e!750526 (and e!750525 mapRes!55156))))

(declare-fun condMapEmpty!55156 () Bool)

(declare-fun mapDefault!55156 () ValueCell!16944)

(assert (=> b!1315672 (= condMapEmpty!55156 (= (arr!42647 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16944)) mapDefault!55156)))))

(declare-fun b!1315673 () Bool)

(declare-fun res!873418 () Bool)

(assert (=> b!1315673 (=> (not res!873418) (not e!750523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88332 (_ BitVec 32)) Bool)

(assert (=> b!1315673 (= res!873418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315674 () Bool)

(assert (=> b!1315674 (= e!750525 tp_is_empty!35685)))

(declare-fun b!1315675 () Bool)

(declare-fun res!873417 () Bool)

(assert (=> b!1315675 (=> (not res!873417) (not e!750523))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1315675 (= res!873417 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43196 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315676 () Bool)

(assert (=> b!1315676 (= e!750523 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52683)

(declare-fun zeroValue!1296 () V!52683)

(declare-fun lt!585942 () Bool)

(declare-datatypes ((tuple2!23118 0))(
  ( (tuple2!23119 (_1!11570 (_ BitVec 64)) (_2!11570 V!52683)) )
))
(declare-datatypes ((List!30253 0))(
  ( (Nil!30250) (Cons!30249 (h!31458 tuple2!23118) (t!43859 List!30253)) )
))
(declare-datatypes ((ListLongMap!20775 0))(
  ( (ListLongMap!20776 (toList!10403 List!30253)) )
))
(declare-fun contains!8553 (ListLongMap!20775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5416 (array!88332 array!88334 (_ BitVec 32) (_ BitVec 32) V!52683 V!52683 (_ BitVec 32) Int) ListLongMap!20775)

(assert (=> b!1315676 (= lt!585942 (contains!8553 (getCurrentListMap!5416 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55156 () Bool)

(declare-fun tp!105186 () Bool)

(assert (=> mapNonEmpty!55156 (= mapRes!55156 (and tp!105186 e!750527))))

(declare-fun mapRest!55156 () (Array (_ BitVec 32) ValueCell!16944))

(declare-fun mapValue!55156 () ValueCell!16944)

(declare-fun mapKey!55156 () (_ BitVec 32))

(assert (=> mapNonEmpty!55156 (= (arr!42647 _values!1354) (store mapRest!55156 mapKey!55156 mapValue!55156))))

(declare-fun b!1315677 () Bool)

(declare-fun res!873419 () Bool)

(assert (=> b!1315677 (=> (not res!873419) (not e!750523))))

(declare-datatypes ((List!30254 0))(
  ( (Nil!30251) (Cons!30250 (h!31459 (_ BitVec 64)) (t!43860 List!30254)) )
))
(declare-fun arrayNoDuplicates!0 (array!88332 (_ BitVec 32) List!30254) Bool)

(assert (=> b!1315677 (= res!873419 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30251))))

(assert (= (and start!111120 res!873416) b!1315671))

(assert (= (and b!1315671 res!873420) b!1315673))

(assert (= (and b!1315673 res!873418) b!1315677))

(assert (= (and b!1315677 res!873419) b!1315675))

(assert (= (and b!1315675 res!873417) b!1315676))

(assert (= (and b!1315672 condMapEmpty!55156) mapIsEmpty!55156))

(assert (= (and b!1315672 (not condMapEmpty!55156)) mapNonEmpty!55156))

(get-info :version)

(assert (= (and mapNonEmpty!55156 ((_ is ValueCellFull!16944) mapValue!55156)) b!1315670))

(assert (= (and b!1315672 ((_ is ValueCellFull!16944) mapDefault!55156)) b!1315674))

(assert (= start!111120 b!1315672))

(declare-fun m!1203787 () Bool)

(assert (=> b!1315673 m!1203787))

(declare-fun m!1203789 () Bool)

(assert (=> b!1315677 m!1203789))

(declare-fun m!1203791 () Bool)

(assert (=> b!1315676 m!1203791))

(assert (=> b!1315676 m!1203791))

(declare-fun m!1203793 () Bool)

(assert (=> b!1315676 m!1203793))

(declare-fun m!1203795 () Bool)

(assert (=> mapNonEmpty!55156 m!1203795))

(declare-fun m!1203797 () Bool)

(assert (=> start!111120 m!1203797))

(declare-fun m!1203799 () Bool)

(assert (=> start!111120 m!1203799))

(declare-fun m!1203801 () Bool)

(assert (=> start!111120 m!1203801))

(check-sat (not b!1315673) (not mapNonEmpty!55156) tp_is_empty!35685 b_and!48163 (not b!1315677) (not b_next!29955) (not start!111120) (not b!1315676))
(check-sat b_and!48163 (not b_next!29955))
