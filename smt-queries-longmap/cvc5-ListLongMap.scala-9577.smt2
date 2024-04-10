; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113324 () Bool)

(assert start!113324)

(declare-fun b_free!31375 () Bool)

(declare-fun b_next!31375 () Bool)

(assert (=> start!113324 (= b_free!31375 (not b_next!31375))))

(declare-fun tp!109929 () Bool)

(declare-fun b_and!50603 () Bool)

(assert (=> start!113324 (= tp!109929 b_and!50603)))

(declare-fun b!1344668 () Bool)

(declare-fun res!892163 () Bool)

(declare-fun e!765292 () Bool)

(assert (=> b!1344668 (=> (not res!892163) (not e!765292))))

(declare-datatypes ((array!91590 0))(
  ( (array!91591 (arr!44251 (Array (_ BitVec 32) (_ BitVec 64))) (size!44801 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91590)

(declare-datatypes ((List!31336 0))(
  ( (Nil!31333) (Cons!31332 (h!32541 (_ BitVec 64)) (t!45868 List!31336)) )
))
(declare-fun arrayNoDuplicates!0 (array!91590 (_ BitVec 32) List!31336) Bool)

(assert (=> b!1344668 (= res!892163 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31333))))

(declare-fun mapIsEmpty!57769 () Bool)

(declare-fun mapRes!57769 () Bool)

(assert (=> mapIsEmpty!57769 mapRes!57769))

(declare-fun b!1344669 () Bool)

(declare-fun res!892168 () Bool)

(assert (=> b!1344669 (=> (not res!892168) (not e!765292))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54937 0))(
  ( (V!54938 (val!18762 Int)) )
))
(declare-datatypes ((ValueCell!17789 0))(
  ( (ValueCellFull!17789 (v!21410 V!54937)) (EmptyCell!17789) )
))
(declare-datatypes ((array!91592 0))(
  ( (array!91593 (arr!44252 (Array (_ BitVec 32) ValueCell!17789)) (size!44802 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91592)

(assert (=> b!1344669 (= res!892168 (and (= (size!44802 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44801 _keys!1571) (size!44802 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57769 () Bool)

(declare-fun tp!109930 () Bool)

(declare-fun e!765291 () Bool)

(assert (=> mapNonEmpty!57769 (= mapRes!57769 (and tp!109930 e!765291))))

(declare-fun mapValue!57769 () ValueCell!17789)

(declare-fun mapKey!57769 () (_ BitVec 32))

(declare-fun mapRest!57769 () (Array (_ BitVec 32) ValueCell!17789))

(assert (=> mapNonEmpty!57769 (= (arr!44252 _values!1303) (store mapRest!57769 mapKey!57769 mapValue!57769))))

(declare-fun b!1344670 () Bool)

(declare-fun res!892165 () Bool)

(assert (=> b!1344670 (=> (not res!892165) (not e!765292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91590 (_ BitVec 32)) Bool)

(assert (=> b!1344670 (= res!892165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344671 () Bool)

(declare-fun res!892170 () Bool)

(assert (=> b!1344671 (=> (not res!892170) (not e!765292))))

(declare-fun zeroValue!1245 () V!54937)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun minValue!1245 () V!54937)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24180 0))(
  ( (tuple2!24181 (_1!12101 (_ BitVec 64)) (_2!12101 V!54937)) )
))
(declare-datatypes ((List!31337 0))(
  ( (Nil!31334) (Cons!31333 (h!32542 tuple2!24180) (t!45869 List!31337)) )
))
(declare-datatypes ((ListLongMap!21837 0))(
  ( (ListLongMap!21838 (toList!10934 List!31337)) )
))
(declare-fun contains!9110 (ListLongMap!21837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5890 (array!91590 array!91592 (_ BitVec 32) (_ BitVec 32) V!54937 V!54937 (_ BitVec 32) Int) ListLongMap!21837)

(assert (=> b!1344671 (= res!892170 (contains!9110 (getCurrentListMap!5890 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344672 () Bool)

(declare-fun tp_is_empty!37375 () Bool)

(assert (=> b!1344672 (= e!765291 tp_is_empty!37375)))

(declare-fun b!1344673 () Bool)

(declare-fun e!765293 () Bool)

(declare-fun e!765290 () Bool)

(assert (=> b!1344673 (= e!765293 (and e!765290 mapRes!57769))))

(declare-fun condMapEmpty!57769 () Bool)

(declare-fun mapDefault!57769 () ValueCell!17789)

