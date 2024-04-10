; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111020 () Bool)

(assert start!111020)

(declare-fun b_free!29855 () Bool)

(declare-fun b_next!29855 () Bool)

(assert (=> start!111020 (= b_free!29855 (not b_next!29855))))

(declare-fun tp!104887 () Bool)

(declare-fun b_and!48063 () Bool)

(assert (=> start!111020 (= tp!104887 b_and!48063)))

(declare-fun b!1314434 () Bool)

(declare-fun e!749776 () Bool)

(declare-fun tp_is_empty!35585 () Bool)

(assert (=> b!1314434 (= e!749776 tp_is_empty!35585)))

(declare-fun b!1314435 () Bool)

(declare-fun res!872630 () Bool)

(declare-fun e!749773 () Bool)

(assert (=> b!1314435 (=> (not res!872630) (not e!749773))))

(declare-datatypes ((array!88140 0))(
  ( (array!88141 (arr!42550 (Array (_ BitVec 32) (_ BitVec 64))) (size!43100 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88140)

(declare-datatypes ((List!30176 0))(
  ( (Nil!30173) (Cons!30172 (h!31381 (_ BitVec 64)) (t!43782 List!30176)) )
))
(declare-fun arrayNoDuplicates!0 (array!88140 (_ BitVec 32) List!30176) Bool)

(assert (=> b!1314435 (= res!872630 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30173))))

(declare-fun mapIsEmpty!55006 () Bool)

(declare-fun mapRes!55006 () Bool)

(assert (=> mapIsEmpty!55006 mapRes!55006))

(declare-fun b!1314436 () Bool)

(declare-fun res!872633 () Bool)

(assert (=> b!1314436 (=> (not res!872633) (not e!749773))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88140 (_ BitVec 32)) Bool)

(assert (=> b!1314436 (= res!872633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314437 () Bool)

(assert (=> b!1314437 (= e!749773 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52549 0))(
  ( (V!52550 (val!17867 Int)) )
))
(declare-fun minValue!1296 () V!52549)

(declare-datatypes ((ValueCell!16894 0))(
  ( (ValueCellFull!16894 (v!20494 V!52549)) (EmptyCell!16894) )
))
(declare-datatypes ((array!88142 0))(
  ( (array!88143 (arr!42551 (Array (_ BitVec 32) ValueCell!16894)) (size!43101 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88142)

(declare-fun zeroValue!1296 () V!52549)

(declare-fun lt!585792 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23040 0))(
  ( (tuple2!23041 (_1!11531 (_ BitVec 64)) (_2!11531 V!52549)) )
))
(declare-datatypes ((List!30177 0))(
  ( (Nil!30174) (Cons!30173 (h!31382 tuple2!23040) (t!43783 List!30177)) )
))
(declare-datatypes ((ListLongMap!20697 0))(
  ( (ListLongMap!20698 (toList!10364 List!30177)) )
))
(declare-fun contains!8514 (ListLongMap!20697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5377 (array!88140 array!88142 (_ BitVec 32) (_ BitVec 32) V!52549 V!52549 (_ BitVec 32) Int) ListLongMap!20697)

(assert (=> b!1314437 (= lt!585792 (contains!8514 (getCurrentListMap!5377 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314438 () Bool)

(declare-fun res!872634 () Bool)

(assert (=> b!1314438 (=> (not res!872634) (not e!749773))))

(assert (=> b!1314438 (= res!872634 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43100 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314439 () Bool)

(declare-fun e!749775 () Bool)

(declare-fun e!749777 () Bool)

(assert (=> b!1314439 (= e!749775 (and e!749777 mapRes!55006))))

(declare-fun condMapEmpty!55006 () Bool)

(declare-fun mapDefault!55006 () ValueCell!16894)

