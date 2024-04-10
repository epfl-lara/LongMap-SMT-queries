; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4140 () Bool)

(assert start!4140)

(declare-fun b_free!1045 () Bool)

(declare-fun b_next!1045 () Bool)

(assert (=> start!4140 (= b_free!1045 (not b_next!1045))))

(declare-fun tp!4554 () Bool)

(declare-fun b_and!1855 () Bool)

(assert (=> start!4140 (= tp!4554 b_and!1855)))

(declare-fun b!31094 () Bool)

(declare-fun e!19901 () Bool)

(declare-fun tp_is_empty!1399 () Bool)

(assert (=> b!31094 (= e!19901 tp_is_empty!1399)))

(declare-fun b!31095 () Bool)

(declare-fun e!19903 () Bool)

(declare-datatypes ((array!2021 0))(
  ( (array!2022 (arr!964 (Array (_ BitVec 32) (_ BitVec 64))) (size!1065 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2021)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31095 (= e!19903 (not (= (size!1065 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!31096 () Bool)

(declare-fun res!18816 () Bool)

(assert (=> b!31096 (=> (not res!18816) (not e!19903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2021 (_ BitVec 32)) Bool)

(assert (=> b!31096 (= res!18816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18809 () Bool)

(assert (=> start!4140 (=> (not res!18809) (not e!19903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4140 (= res!18809 (validMask!0 mask!2294))))

(assert (=> start!4140 e!19903))

(assert (=> start!4140 true))

(assert (=> start!4140 tp!4554))

(declare-datatypes ((V!1691 0))(
  ( (V!1692 (val!726 Int)) )
))
(declare-datatypes ((ValueCell!500 0))(
  ( (ValueCellFull!500 (v!1815 V!1691)) (EmptyCell!500) )
))
(declare-datatypes ((array!2023 0))(
  ( (array!2024 (arr!965 (Array (_ BitVec 32) ValueCell!500)) (size!1066 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2023)

(declare-fun e!19902 () Bool)

(declare-fun array_inv!673 (array!2023) Bool)

(assert (=> start!4140 (and (array_inv!673 _values!1501) e!19902)))

(declare-fun array_inv!674 (array!2021) Bool)

(assert (=> start!4140 (array_inv!674 _keys!1833)))

(assert (=> start!4140 tp_is_empty!1399))

(declare-fun b!31097 () Bool)

(declare-fun e!19904 () Bool)

(assert (=> b!31097 (= e!19904 tp_is_empty!1399)))

(declare-fun b!31098 () Bool)

(declare-fun res!18814 () Bool)

(assert (=> b!31098 (=> (not res!18814) (not e!19903))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31098 (= res!18814 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1627 () Bool)

(declare-fun mapRes!1627 () Bool)

(declare-fun tp!4555 () Bool)

(assert (=> mapNonEmpty!1627 (= mapRes!1627 (and tp!4555 e!19904))))

(declare-fun mapKey!1627 () (_ BitVec 32))

(declare-fun mapValue!1627 () ValueCell!500)

(declare-fun mapRest!1627 () (Array (_ BitVec 32) ValueCell!500))

(assert (=> mapNonEmpty!1627 (= (arr!965 _values!1501) (store mapRest!1627 mapKey!1627 mapValue!1627))))

(declare-fun b!31099 () Bool)

(declare-fun res!18811 () Bool)

(assert (=> b!31099 (=> (not res!18811) (not e!19903))))

(declare-datatypes ((SeekEntryResult!117 0))(
  ( (MissingZero!117 (index!2590 (_ BitVec 32))) (Found!117 (index!2591 (_ BitVec 32))) (Intermediate!117 (undefined!929 Bool) (index!2592 (_ BitVec 32)) (x!6603 (_ BitVec 32))) (Undefined!117) (MissingVacant!117 (index!2593 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!2021 (_ BitVec 32)) SeekEntryResult!117)

(assert (=> b!31099 (= res!18811 (not (is-Found!117 (seekEntry!0 k!1304 _keys!1833 mask!2294))))))

(declare-fun b!31100 () Bool)

(declare-fun res!18812 () Bool)

(assert (=> b!31100 (=> (not res!18812) (not e!19903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31100 (= res!18812 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1627 () Bool)

(assert (=> mapIsEmpty!1627 mapRes!1627))

(declare-fun b!31101 () Bool)

(declare-fun res!18815 () Bool)

(assert (=> b!31101 (=> (not res!18815) (not e!19903))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1691)

(declare-fun minValue!1443 () V!1691)

(declare-datatypes ((tuple2!1190 0))(
  ( (tuple2!1191 (_1!606 (_ BitVec 64)) (_2!606 V!1691)) )
))
(declare-datatypes ((List!783 0))(
  ( (Nil!780) (Cons!779 (h!1346 tuple2!1190) (t!3476 List!783)) )
))
(declare-datatypes ((ListLongMap!767 0))(
  ( (ListLongMap!768 (toList!399 List!783)) )
))
(declare-fun contains!339 (ListLongMap!767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!227 (array!2021 array!2023 (_ BitVec 32) (_ BitVec 32) V!1691 V!1691 (_ BitVec 32) Int) ListLongMap!767)

(assert (=> b!31101 (= res!18815 (not (contains!339 (getCurrentListMap!227 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31102 () Bool)

(declare-fun res!18810 () Bool)

(assert (=> b!31102 (=> (not res!18810) (not e!19903))))

(assert (=> b!31102 (= res!18810 (and (= (size!1066 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1065 _keys!1833) (size!1066 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31103 () Bool)

(assert (=> b!31103 (= e!19902 (and e!19901 mapRes!1627))))

(declare-fun condMapEmpty!1627 () Bool)

(declare-fun mapDefault!1627 () ValueCell!500)

