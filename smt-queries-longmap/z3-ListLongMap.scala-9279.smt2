; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111246 () Bool)

(assert start!111246)

(declare-fun b_free!29857 () Bool)

(declare-fun b_next!29857 () Bool)

(assert (=> start!111246 (= b_free!29857 (not b_next!29857))))

(declare-fun tp!104892 () Bool)

(declare-fun b_and!48067 () Bool)

(assert (=> start!111246 (= tp!104892 b_and!48067)))

(declare-fun b!1315758 () Bool)

(declare-fun e!750631 () Bool)

(assert (=> b!1315758 (= e!750631 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88201 0))(
  ( (array!88202 (arr!42576 (Array (_ BitVec 32) (_ BitVec 64))) (size!43127 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88201)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52553 0))(
  ( (V!52554 (val!17868 Int)) )
))
(declare-fun minValue!1296 () V!52553)

(declare-datatypes ((ValueCell!16895 0))(
  ( (ValueCellFull!16895 (v!20490 V!52553)) (EmptyCell!16895) )
))
(declare-datatypes ((array!88203 0))(
  ( (array!88204 (arr!42577 (Array (_ BitVec 32) ValueCell!16895)) (size!43128 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88203)

(declare-fun zeroValue!1296 () V!52553)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!586271 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23066 0))(
  ( (tuple2!23067 (_1!11544 (_ BitVec 64)) (_2!11544 V!52553)) )
))
(declare-datatypes ((List!30217 0))(
  ( (Nil!30214) (Cons!30213 (h!31431 tuple2!23066) (t!43815 List!30217)) )
))
(declare-datatypes ((ListLongMap!20731 0))(
  ( (ListLongMap!20732 (toList!10381 List!30217)) )
))
(declare-fun contains!8543 (ListLongMap!20731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5385 (array!88201 array!88203 (_ BitVec 32) (_ BitVec 32) V!52553 V!52553 (_ BitVec 32) Int) ListLongMap!20731)

(assert (=> b!1315758 (= lt!586271 (contains!8543 (getCurrentListMap!5385 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315759 () Bool)

(declare-fun res!873167 () Bool)

(assert (=> b!1315759 (=> (not res!873167) (not e!750631))))

(assert (=> b!1315759 (= res!873167 (and (= (size!43128 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43127 _keys!1628) (size!43128 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315760 () Bool)

(declare-fun e!750634 () Bool)

(declare-fun e!750633 () Bool)

(declare-fun mapRes!55009 () Bool)

(assert (=> b!1315760 (= e!750634 (and e!750633 mapRes!55009))))

(declare-fun condMapEmpty!55009 () Bool)

(declare-fun mapDefault!55009 () ValueCell!16895)

(assert (=> b!1315760 (= condMapEmpty!55009 (= (arr!42577 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16895)) mapDefault!55009)))))

(declare-fun mapIsEmpty!55009 () Bool)

(assert (=> mapIsEmpty!55009 mapRes!55009))

(declare-fun b!1315761 () Bool)

(declare-fun res!873163 () Bool)

(assert (=> b!1315761 (=> (not res!873163) (not e!750631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88201 (_ BitVec 32)) Bool)

(assert (=> b!1315761 (= res!873163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315762 () Bool)

(declare-fun res!873165 () Bool)

(assert (=> b!1315762 (=> (not res!873165) (not e!750631))))

(assert (=> b!1315762 (= res!873165 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43127 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55009 () Bool)

(declare-fun tp!104893 () Bool)

(declare-fun e!750635 () Bool)

(assert (=> mapNonEmpty!55009 (= mapRes!55009 (and tp!104893 e!750635))))

(declare-fun mapValue!55009 () ValueCell!16895)

(declare-fun mapKey!55009 () (_ BitVec 32))

(declare-fun mapRest!55009 () (Array (_ BitVec 32) ValueCell!16895))

(assert (=> mapNonEmpty!55009 (= (arr!42577 _values!1354) (store mapRest!55009 mapKey!55009 mapValue!55009))))

(declare-fun b!1315763 () Bool)

(declare-fun tp_is_empty!35587 () Bool)

(assert (=> b!1315763 (= e!750635 tp_is_empty!35587)))

(declare-fun b!1315764 () Bool)

(declare-fun res!873166 () Bool)

(assert (=> b!1315764 (=> (not res!873166) (not e!750631))))

(declare-datatypes ((List!30218 0))(
  ( (Nil!30215) (Cons!30214 (h!31432 (_ BitVec 64)) (t!43816 List!30218)) )
))
(declare-fun arrayNoDuplicates!0 (array!88201 (_ BitVec 32) List!30218) Bool)

(assert (=> b!1315764 (= res!873166 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30215))))

(declare-fun res!873164 () Bool)

(assert (=> start!111246 (=> (not res!873164) (not e!750631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111246 (= res!873164 (validMask!0 mask!2040))))

(assert (=> start!111246 e!750631))

(assert (=> start!111246 tp!104892))

(declare-fun array_inv!32423 (array!88201) Bool)

(assert (=> start!111246 (array_inv!32423 _keys!1628)))

(assert (=> start!111246 true))

(assert (=> start!111246 tp_is_empty!35587))

(declare-fun array_inv!32424 (array!88203) Bool)

(assert (=> start!111246 (and (array_inv!32424 _values!1354) e!750634)))

(declare-fun b!1315757 () Bool)

(assert (=> b!1315757 (= e!750633 tp_is_empty!35587)))

(assert (= (and start!111246 res!873164) b!1315759))

(assert (= (and b!1315759 res!873167) b!1315761))

(assert (= (and b!1315761 res!873163) b!1315764))

(assert (= (and b!1315764 res!873166) b!1315762))

(assert (= (and b!1315762 res!873165) b!1315758))

(assert (= (and b!1315760 condMapEmpty!55009) mapIsEmpty!55009))

(assert (= (and b!1315760 (not condMapEmpty!55009)) mapNonEmpty!55009))

(get-info :version)

(assert (= (and mapNonEmpty!55009 ((_ is ValueCellFull!16895) mapValue!55009)) b!1315763))

(assert (= (and b!1315760 ((_ is ValueCellFull!16895) mapDefault!55009)) b!1315757))

(assert (= start!111246 b!1315760))

(declare-fun m!1204571 () Bool)

(assert (=> b!1315758 m!1204571))

(assert (=> b!1315758 m!1204571))

(declare-fun m!1204573 () Bool)

(assert (=> b!1315758 m!1204573))

(declare-fun m!1204575 () Bool)

(assert (=> mapNonEmpty!55009 m!1204575))

(declare-fun m!1204577 () Bool)

(assert (=> b!1315761 m!1204577))

(declare-fun m!1204579 () Bool)

(assert (=> start!111246 m!1204579))

(declare-fun m!1204581 () Bool)

(assert (=> start!111246 m!1204581))

(declare-fun m!1204583 () Bool)

(assert (=> start!111246 m!1204583))

(declare-fun m!1204585 () Bool)

(assert (=> b!1315764 m!1204585))

(check-sat (not start!111246) b_and!48067 (not mapNonEmpty!55009) (not b!1315758) (not b!1315761) (not b!1315764) (not b_next!29857) tp_is_empty!35587)
(check-sat b_and!48067 (not b_next!29857))
