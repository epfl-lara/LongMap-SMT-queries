; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3736 () Bool)

(assert start!3736)

(declare-fun b!26071 () Bool)

(declare-fun res!15500 () Bool)

(declare-fun e!16926 () Bool)

(assert (=> b!26071 (=> (not res!15500) (not e!16926))))

(declare-datatypes ((array!1383 0))(
  ( (array!1384 (arr!650 (Array (_ BitVec 32) (_ BitVec 64))) (size!751 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1383)

(assert (=> b!26071 (= res!15500 (and (bvsle #b00000000000000000000000000000000 (size!751 _keys!1833)) (bvslt (size!751 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26072 () Bool)

(declare-fun e!16929 () Bool)

(declare-fun tp_is_empty!1069 () Bool)

(assert (=> b!26072 (= e!16929 tp_is_empty!1069)))

(declare-fun res!15499 () Bool)

(assert (=> start!3736 (=> (not res!15499) (not e!16926))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3736 (= res!15499 (validMask!0 mask!2294))))

(assert (=> start!3736 e!16926))

(assert (=> start!3736 true))

(declare-datatypes ((V!1251 0))(
  ( (V!1252 (val!561 Int)) )
))
(declare-datatypes ((ValueCell!335 0))(
  ( (ValueCellFull!335 (v!1646 V!1251)) (EmptyCell!335) )
))
(declare-datatypes ((array!1385 0))(
  ( (array!1386 (arr!651 (Array (_ BitVec 32) ValueCell!335)) (size!752 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1385)

(declare-fun e!16925 () Bool)

(declare-fun array_inv!439 (array!1385) Bool)

(assert (=> start!3736 (and (array_inv!439 _values!1501) e!16925)))

(declare-fun array_inv!440 (array!1383) Bool)

(assert (=> start!3736 (array_inv!440 _keys!1833)))

(declare-fun b!26073 () Bool)

(declare-fun e!16924 () Bool)

(declare-datatypes ((List!578 0))(
  ( (Nil!575) (Cons!574 (h!1141 (_ BitVec 64)) (t!3265 List!578)) )
))
(declare-fun contains!236 (List!578 (_ BitVec 64)) Bool)

(assert (=> b!26073 (= e!16924 (contains!236 Nil!575 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26074 () Bool)

(declare-fun res!15498 () Bool)

(assert (=> b!26074 (=> (not res!15498) (not e!16926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1383 (_ BitVec 32)) Bool)

(assert (=> b!26074 (= res!15498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26075 () Bool)

(declare-fun res!15502 () Bool)

(assert (=> b!26075 (=> (not res!15502) (not e!16926))))

(declare-fun noDuplicate!13 (List!578) Bool)

(assert (=> b!26075 (= res!15502 (noDuplicate!13 Nil!575))))

(declare-fun mapNonEmpty!1117 () Bool)

(declare-fun mapRes!1117 () Bool)

(declare-fun tp!3637 () Bool)

(assert (=> mapNonEmpty!1117 (= mapRes!1117 (and tp!3637 e!16929))))

(declare-fun mapRest!1117 () (Array (_ BitVec 32) ValueCell!335))

(declare-fun mapValue!1117 () ValueCell!335)

(declare-fun mapKey!1117 () (_ BitVec 32))

(assert (=> mapNonEmpty!1117 (= (arr!651 _values!1501) (store mapRest!1117 mapKey!1117 mapValue!1117))))

(declare-fun b!26076 () Bool)

(declare-fun res!15501 () Bool)

(assert (=> b!26076 (=> (not res!15501) (not e!16926))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26076 (= res!15501 (and (= (size!752 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!751 _keys!1833) (size!752 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26077 () Bool)

(declare-fun e!16928 () Bool)

(assert (=> b!26077 (= e!16928 tp_is_empty!1069)))

(declare-fun b!26078 () Bool)

(assert (=> b!26078 (= e!16926 e!16924)))

(declare-fun res!15497 () Bool)

(assert (=> b!26078 (=> res!15497 e!16924)))

(assert (=> b!26078 (= res!15497 (contains!236 Nil!575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!1117 () Bool)

(assert (=> mapIsEmpty!1117 mapRes!1117))

(declare-fun b!26079 () Bool)

(assert (=> b!26079 (= e!16925 (and e!16928 mapRes!1117))))

(declare-fun condMapEmpty!1117 () Bool)

(declare-fun mapDefault!1117 () ValueCell!335)

