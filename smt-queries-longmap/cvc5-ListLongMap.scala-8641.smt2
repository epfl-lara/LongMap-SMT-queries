; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105164 () Bool)

(assert start!105164)

(declare-fun b_free!26881 () Bool)

(declare-fun b_next!26881 () Bool)

(assert (=> start!105164 (= b_free!26881 (not b_next!26881))))

(declare-fun tp!94148 () Bool)

(declare-fun b_and!44695 () Bool)

(assert (=> start!105164 (= tp!94148 b_and!44695)))

(declare-fun b!1253190 () Bool)

(declare-fun e!711887 () Bool)

(assert (=> b!1253190 (= e!711887 true)))

(declare-fun lt!565743 () Bool)

(declare-datatypes ((V!47743 0))(
  ( (V!47744 (val!15954 Int)) )
))
(declare-datatypes ((tuple2!20584 0))(
  ( (tuple2!20585 (_1!10303 (_ BitVec 64)) (_2!10303 V!47743)) )
))
(declare-datatypes ((List!27816 0))(
  ( (Nil!27813) (Cons!27812 (h!29021 tuple2!20584) (t!41297 List!27816)) )
))
(declare-datatypes ((ListLongMap!18457 0))(
  ( (ListLongMap!18458 (toList!9244 List!27816)) )
))
(declare-fun lt!565745 () ListLongMap!18457)

(declare-fun contains!7517 (ListLongMap!18457 (_ BitVec 64)) Bool)

(assert (=> b!1253190 (= lt!565743 (contains!7517 lt!565745 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!711891 () Bool)

(assert (=> b!1253190 e!711891))

(declare-fun res!835669 () Bool)

(assert (=> b!1253190 (=> (not res!835669) (not e!711891))))

(declare-fun lt!565741 () ListLongMap!18457)

(declare-fun minValueBefore!43 () V!47743)

(declare-fun +!4141 (ListLongMap!18457 tuple2!20584) ListLongMap!18457)

(assert (=> b!1253190 (= res!835669 (= lt!565741 (+!4141 lt!565745 (tuple2!20585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!565746 () ListLongMap!18457)

(declare-fun minValueAfter!43 () V!47743)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47743)

(declare-datatypes ((array!81226 0))(
  ( (array!81227 (arr!39175 (Array (_ BitVec 32) (_ BitVec 64))) (size!39711 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81226)

(declare-datatypes ((ValueCell!15128 0))(
  ( (ValueCellFull!15128 (v!18652 V!47743)) (EmptyCell!15128) )
))
(declare-datatypes ((array!81228 0))(
  ( (array!81229 (arr!39176 (Array (_ BitVec 32) ValueCell!15128)) (size!39712 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81228)

(declare-fun getCurrentListMap!4489 (array!81226 array!81228 (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 (_ BitVec 32) Int) ListLongMap!18457)

(assert (=> b!1253190 (= lt!565746 (getCurrentListMap!4489 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253190 (= lt!565741 (getCurrentListMap!4489 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49450 () Bool)

(declare-fun mapRes!49450 () Bool)

(assert (=> mapIsEmpty!49450 mapRes!49450))

(declare-fun b!1253191 () Bool)

(declare-fun e!711890 () Bool)

(declare-fun e!711888 () Bool)

(assert (=> b!1253191 (= e!711890 (and e!711888 mapRes!49450))))

(declare-fun condMapEmpty!49450 () Bool)

(declare-fun mapDefault!49450 () ValueCell!15128)

