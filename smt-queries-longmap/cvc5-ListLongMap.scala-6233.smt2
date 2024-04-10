; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79670 () Bool)

(assert start!79670)

(declare-fun b_free!17719 () Bool)

(declare-fun b_next!17719 () Bool)

(assert (=> start!79670 (= b_free!17719 (not b_next!17719))))

(declare-fun tp!61612 () Bool)

(declare-fun b_and!29029 () Bool)

(assert (=> start!79670 (= tp!61612 b_and!29029)))

(declare-fun b!936938 () Bool)

(declare-fun res!630744 () Bool)

(declare-fun e!526107 () Bool)

(assert (=> b!936938 (=> (not res!630744) (not e!526107))))

(declare-datatypes ((array!56394 0))(
  ( (array!56395 (arr!27137 (Array (_ BitVec 32) (_ BitVec 64))) (size!27596 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56394)

(declare-datatypes ((List!19128 0))(
  ( (Nil!19125) (Cons!19124 (h!20270 (_ BitVec 64)) (t!27391 List!19128)) )
))
(declare-fun arrayNoDuplicates!0 (array!56394 (_ BitVec 32) List!19128) Bool)

(assert (=> b!936938 (= res!630744 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19125))))

(declare-fun b!936939 () Bool)

(declare-fun e!526113 () Bool)

(declare-fun tp_is_empty!20227 () Bool)

(assert (=> b!936939 (= e!526113 tp_is_empty!20227)))

(declare-fun b!936940 () Bool)

(declare-fun e!526112 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!936940 (= e!526112 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936941 () Bool)

(declare-fun res!630748 () Bool)

(assert (=> b!936941 (=> (not res!630748) (not e!526107))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31935 0))(
  ( (V!31936 (val!10164 Int)) )
))
(declare-datatypes ((ValueCell!9632 0))(
  ( (ValueCellFull!9632 (v!12689 V!31935)) (EmptyCell!9632) )
))
(declare-datatypes ((array!56396 0))(
  ( (array!56397 (arr!27138 (Array (_ BitVec 32) ValueCell!9632)) (size!27597 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56396)

(assert (=> b!936941 (= res!630748 (and (= (size!27597 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27596 _keys!1487) (size!27597 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!630745 () Bool)

(assert (=> start!79670 (=> (not res!630745) (not e!526107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79670 (= res!630745 (validMask!0 mask!1881))))

(assert (=> start!79670 e!526107))

(assert (=> start!79670 true))

(assert (=> start!79670 tp_is_empty!20227))

(declare-fun e!526111 () Bool)

(declare-fun array_inv!21114 (array!56396) Bool)

(assert (=> start!79670 (and (array_inv!21114 _values!1231) e!526111)))

(assert (=> start!79670 tp!61612))

(declare-fun array_inv!21115 (array!56394) Bool)

(assert (=> start!79670 (array_inv!21115 _keys!1487)))

(declare-fun b!936942 () Bool)

(declare-fun e!526109 () Bool)

(assert (=> b!936942 (= e!526109 tp_is_empty!20227)))

(declare-fun b!936943 () Bool)

(declare-fun mapRes!32112 () Bool)

(assert (=> b!936943 (= e!526111 (and e!526109 mapRes!32112))))

(declare-fun condMapEmpty!32112 () Bool)

(declare-fun mapDefault!32112 () ValueCell!9632)

