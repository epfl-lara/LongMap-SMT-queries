; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4480 () Bool)

(assert start!4480)

(declare-fun b_free!1241 () Bool)

(declare-fun b_next!1241 () Bool)

(assert (=> start!4480 (= b_free!1241 (not b_next!1241))))

(declare-fun tp!5160 () Bool)

(declare-fun b_and!2063 () Bool)

(assert (=> start!4480 (= tp!5160 b_and!2063)))

(declare-fun b!34831 () Bool)

(declare-fun res!21164 () Bool)

(declare-fun e!22044 () Bool)

(assert (=> b!34831 (=> (not res!21164) (not e!22044))))

(declare-datatypes ((array!2403 0))(
  ( (array!2404 (arr!1149 (Array (_ BitVec 32) (_ BitVec 64))) (size!1250 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2403)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2403 (_ BitVec 32)) Bool)

(assert (=> b!34831 (= res!21164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34832 () Bool)

(declare-fun res!21162 () Bool)

(assert (=> b!34832 (=> (not res!21162) (not e!22044))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1951 0))(
  ( (V!1952 (val!824 Int)) )
))
(declare-datatypes ((ValueCell!598 0))(
  ( (ValueCellFull!598 (v!1919 V!1951)) (EmptyCell!598) )
))
(declare-datatypes ((array!2405 0))(
  ( (array!2406 (arr!1150 (Array (_ BitVec 32) ValueCell!598)) (size!1251 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2405)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1951)

(declare-fun minValue!1443 () V!1951)

(declare-datatypes ((tuple2!1334 0))(
  ( (tuple2!1335 (_1!678 (_ BitVec 64)) (_2!678 V!1951)) )
))
(declare-datatypes ((List!923 0))(
  ( (Nil!920) (Cons!919 (h!1486 tuple2!1334) (t!3628 List!923)) )
))
(declare-datatypes ((ListLongMap!911 0))(
  ( (ListLongMap!912 (toList!471 List!923)) )
))
(declare-fun contains!417 (ListLongMap!911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!295 (array!2403 array!2405 (_ BitVec 32) (_ BitVec 32) V!1951 V!1951 (_ BitVec 32) Int) ListLongMap!911)

(assert (=> b!34832 (= res!21162 (not (contains!417 (getCurrentListMap!295 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapIsEmpty!1939 () Bool)

(declare-fun mapRes!1939 () Bool)

(assert (=> mapIsEmpty!1939 mapRes!1939))

(declare-fun b!34834 () Bool)

(declare-fun res!21165 () Bool)

(assert (=> b!34834 (=> (not res!21165) (not e!22044))))

(declare-fun arrayContainsKey!0 (array!2403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34834 (= res!21165 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34835 () Bool)

(declare-fun res!21166 () Bool)

(assert (=> b!34835 (=> (not res!21166) (not e!22044))))

(assert (=> b!34835 (= res!21166 (and (= (size!1251 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1250 _keys!1833) (size!1251 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34836 () Bool)

(declare-fun e!22045 () Bool)

(declare-fun tp_is_empty!1595 () Bool)

(assert (=> b!34836 (= e!22045 tp_is_empty!1595)))

(declare-fun b!34837 () Bool)

(assert (=> b!34837 (= e!22044 false)))

(declare-datatypes ((SeekEntryResult!152 0))(
  ( (MissingZero!152 (index!2730 (_ BitVec 32))) (Found!152 (index!2731 (_ BitVec 32))) (Intermediate!152 (undefined!964 Bool) (index!2732 (_ BitVec 32)) (x!6954 (_ BitVec 32))) (Undefined!152) (MissingVacant!152 (index!2733 (_ BitVec 32))) )
))
(declare-fun lt!12819 () SeekEntryResult!152)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2403 (_ BitVec 32)) SeekEntryResult!152)

(assert (=> b!34837 (= lt!12819 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!34838 () Bool)

(declare-fun res!21168 () Bool)

(assert (=> b!34838 (=> (not res!21168) (not e!22044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34838 (= res!21168 (validKeyInArray!0 k!1304))))

(declare-fun b!34839 () Bool)

(declare-fun e!22043 () Bool)

(assert (=> b!34839 (= e!22043 tp_is_empty!1595)))

(declare-fun mapNonEmpty!1939 () Bool)

(declare-fun tp!5161 () Bool)

(assert (=> mapNonEmpty!1939 (= mapRes!1939 (and tp!5161 e!22043))))

(declare-fun mapRest!1939 () (Array (_ BitVec 32) ValueCell!598))

(declare-fun mapKey!1939 () (_ BitVec 32))

(declare-fun mapValue!1939 () ValueCell!598)

(assert (=> mapNonEmpty!1939 (= (arr!1150 _values!1501) (store mapRest!1939 mapKey!1939 mapValue!1939))))

(declare-fun b!34840 () Bool)

(declare-fun res!21167 () Bool)

(assert (=> b!34840 (=> (not res!21167) (not e!22044))))

(declare-datatypes ((List!924 0))(
  ( (Nil!921) (Cons!920 (h!1487 (_ BitVec 64)) (t!3629 List!924)) )
))
(declare-fun arrayNoDuplicates!0 (array!2403 (_ BitVec 32) List!924) Bool)

(assert (=> b!34840 (= res!21167 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!921))))

(declare-fun res!21163 () Bool)

(assert (=> start!4480 (=> (not res!21163) (not e!22044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4480 (= res!21163 (validMask!0 mask!2294))))

(assert (=> start!4480 e!22044))

(assert (=> start!4480 true))

(assert (=> start!4480 tp!5160))

(declare-fun e!22041 () Bool)

(declare-fun array_inv!813 (array!2405) Bool)

(assert (=> start!4480 (and (array_inv!813 _values!1501) e!22041)))

(declare-fun array_inv!814 (array!2403) Bool)

(assert (=> start!4480 (array_inv!814 _keys!1833)))

(assert (=> start!4480 tp_is_empty!1595))

(declare-fun b!34833 () Bool)

(assert (=> b!34833 (= e!22041 (and e!22045 mapRes!1939))))

(declare-fun condMapEmpty!1939 () Bool)

(declare-fun mapDefault!1939 () ValueCell!598)

