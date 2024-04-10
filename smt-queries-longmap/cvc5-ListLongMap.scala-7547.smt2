; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95602 () Bool)

(assert start!95602)

(declare-fun b_free!22255 () Bool)

(declare-fun b_next!22255 () Bool)

(assert (=> start!95602 (= b_free!22255 (not b_next!22255))))

(declare-fun tp!78613 () Bool)

(declare-fun b_and!35233 () Bool)

(assert (=> start!95602 (= tp!78613 b_and!35233)))

(declare-fun b!1080105 () Bool)

(declare-fun e!617472 () Bool)

(declare-fun tp_is_empty!26257 () Bool)

(assert (=> b!1080105 (= e!617472 tp_is_empty!26257)))

(declare-fun b!1080106 () Bool)

(declare-fun res!719845 () Bool)

(declare-fun e!617476 () Bool)

(assert (=> b!1080106 (=> (not res!719845) (not e!617476))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080106 (= res!719845 (validKeyInArray!0 k!904))))

(declare-fun b!1080107 () Bool)

(declare-fun res!719847 () Bool)

(assert (=> b!1080107 (=> (not res!719847) (not e!617476))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69467 0))(
  ( (array!69468 (arr!33407 (Array (_ BitVec 32) (_ BitVec 64))) (size!33943 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69467)

(assert (=> b!1080107 (= res!719847 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33943 _keys!1070))))))

(declare-fun res!719846 () Bool)

(assert (=> start!95602 (=> (not res!719846) (not e!617476))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95602 (= res!719846 (validMask!0 mask!1414))))

(assert (=> start!95602 e!617476))

(assert (=> start!95602 tp!78613))

(assert (=> start!95602 true))

(assert (=> start!95602 tp_is_empty!26257))

(declare-fun array_inv!25794 (array!69467) Bool)

(assert (=> start!95602 (array_inv!25794 _keys!1070)))

(declare-datatypes ((V!40137 0))(
  ( (V!40138 (val!13185 Int)) )
))
(declare-datatypes ((ValueCell!12419 0))(
  ( (ValueCellFull!12419 (v!15806 V!40137)) (EmptyCell!12419) )
))
(declare-datatypes ((array!69469 0))(
  ( (array!69470 (arr!33408 (Array (_ BitVec 32) ValueCell!12419)) (size!33944 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69469)

(declare-fun e!617473 () Bool)

(declare-fun array_inv!25795 (array!69469) Bool)

(assert (=> start!95602 (and (array_inv!25795 _values!874) e!617473)))

(declare-fun mapIsEmpty!41140 () Bool)

(declare-fun mapRes!41140 () Bool)

(assert (=> mapIsEmpty!41140 mapRes!41140))

(declare-fun b!1080108 () Bool)

(declare-fun e!617477 () Bool)

(assert (=> b!1080108 (= e!617476 e!617477)))

(declare-fun res!719844 () Bool)

(assert (=> b!1080108 (=> (not res!719844) (not e!617477))))

(declare-fun lt!478936 () array!69467)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69467 (_ BitVec 32)) Bool)

(assert (=> b!1080108 (= res!719844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478936 mask!1414))))

(assert (=> b!1080108 (= lt!478936 (array!69468 (store (arr!33407 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33943 _keys!1070)))))

(declare-fun b!1080109 () Bool)

(declare-fun res!719839 () Bool)

(assert (=> b!1080109 (=> (not res!719839) (not e!617476))))

(assert (=> b!1080109 (= res!719839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080110 () Bool)

(declare-fun res!719841 () Bool)

(assert (=> b!1080110 (=> (not res!719841) (not e!617477))))

(declare-datatypes ((List!23277 0))(
  ( (Nil!23274) (Cons!23273 (h!24482 (_ BitVec 64)) (t!32636 List!23277)) )
))
(declare-fun arrayNoDuplicates!0 (array!69467 (_ BitVec 32) List!23277) Bool)

(assert (=> b!1080110 (= res!719841 (arrayNoDuplicates!0 lt!478936 #b00000000000000000000000000000000 Nil!23274))))

(declare-fun b!1080111 () Bool)

(declare-fun res!719842 () Bool)

(assert (=> b!1080111 (=> (not res!719842) (not e!617476))))

(assert (=> b!1080111 (= res!719842 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23274))))

(declare-fun b!1080112 () Bool)

(assert (=> b!1080112 (= e!617477 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40137)

(declare-datatypes ((tuple2!16698 0))(
  ( (tuple2!16699 (_1!8360 (_ BitVec 64)) (_2!8360 V!40137)) )
))
(declare-datatypes ((List!23278 0))(
  ( (Nil!23275) (Cons!23274 (h!24483 tuple2!16698) (t!32637 List!23278)) )
))
(declare-datatypes ((ListLongMap!14667 0))(
  ( (ListLongMap!14668 (toList!7349 List!23278)) )
))
(declare-fun lt!478934 () ListLongMap!14667)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40137)

(declare-fun getCurrentListMapNoExtraKeys!3897 (array!69467 array!69469 (_ BitVec 32) (_ BitVec 32) V!40137 V!40137 (_ BitVec 32) Int) ListLongMap!14667)

(assert (=> b!1080112 (= lt!478934 (getCurrentListMapNoExtraKeys!3897 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080112 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35518 0))(
  ( (Unit!35519) )
))
(declare-fun lt!478935 () Unit!35518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69467 (_ BitVec 64) (_ BitVec 32)) Unit!35518)

(assert (=> b!1080112 (= lt!478935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080113 () Bool)

(declare-fun e!617474 () Bool)

(assert (=> b!1080113 (= e!617474 tp_is_empty!26257)))

(declare-fun b!1080114 () Bool)

(declare-fun res!719843 () Bool)

(assert (=> b!1080114 (=> (not res!719843) (not e!617476))))

(assert (=> b!1080114 (= res!719843 (= (select (arr!33407 _keys!1070) i!650) k!904))))

(declare-fun b!1080115 () Bool)

(assert (=> b!1080115 (= e!617473 (and e!617474 mapRes!41140))))

(declare-fun condMapEmpty!41140 () Bool)

(declare-fun mapDefault!41140 () ValueCell!12419)

