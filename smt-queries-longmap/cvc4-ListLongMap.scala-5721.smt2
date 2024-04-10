; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74126 () Bool)

(assert start!74126)

(declare-fun b!872026 () Bool)

(declare-fun res!592719 () Bool)

(declare-fun e!485545 () Bool)

(assert (=> b!872026 (=> (not res!592719) (not e!485545))))

(declare-datatypes ((array!50464 0))(
  ( (array!50465 (arr!24262 (Array (_ BitVec 32) (_ BitVec 64))) (size!24702 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50464)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50464 (_ BitVec 32)) Bool)

(assert (=> b!872026 (= res!592719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592718 () Bool)

(assert (=> start!74126 (=> (not res!592718) (not e!485545))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74126 (= res!592718 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24702 _keys!868))))))

(assert (=> start!74126 e!485545))

(assert (=> start!74126 true))

(declare-fun array_inv!19154 (array!50464) Bool)

(assert (=> start!74126 (array_inv!19154 _keys!868)))

(declare-datatypes ((V!27933 0))(
  ( (V!27934 (val!8630 Int)) )
))
(declare-datatypes ((ValueCell!8143 0))(
  ( (ValueCellFull!8143 (v!11055 V!27933)) (EmptyCell!8143) )
))
(declare-datatypes ((array!50466 0))(
  ( (array!50467 (arr!24263 (Array (_ BitVec 32) ValueCell!8143)) (size!24703 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50466)

(declare-fun e!485542 () Bool)

(declare-fun array_inv!19155 (array!50466) Bool)

(assert (=> start!74126 (and (array_inv!19155 _values!688) e!485542)))

(declare-fun b!872027 () Bool)

(declare-fun e!485544 () Bool)

(declare-fun tp_is_empty!17165 () Bool)

(assert (=> b!872027 (= e!485544 tp_is_empty!17165)))

(declare-fun b!872028 () Bool)

(assert (=> b!872028 (= e!485545 false)))

(declare-fun lt!395563 () Bool)

(declare-datatypes ((List!17249 0))(
  ( (Nil!17246) (Cons!17245 (h!18376 (_ BitVec 64)) (t!24286 List!17249)) )
))
(declare-fun arrayNoDuplicates!0 (array!50464 (_ BitVec 32) List!17249) Bool)

(assert (=> b!872028 (= lt!395563 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17246))))

(declare-fun b!872029 () Bool)

(declare-fun e!485541 () Bool)

(declare-fun mapRes!27350 () Bool)

(assert (=> b!872029 (= e!485542 (and e!485541 mapRes!27350))))

(declare-fun condMapEmpty!27350 () Bool)

(declare-fun mapDefault!27350 () ValueCell!8143)

