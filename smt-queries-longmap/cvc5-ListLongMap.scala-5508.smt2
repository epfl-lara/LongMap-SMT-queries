; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72832 () Bool)

(assert start!72832)

(declare-fun b_free!13747 () Bool)

(declare-fun b_next!13747 () Bool)

(assert (=> start!72832 (= b_free!13747 (not b_next!13747))))

(declare-fun tp!48745 () Bool)

(declare-fun b_and!22833 () Bool)

(assert (=> start!72832 (= tp!48745 b_and!22833)))

(declare-fun b!845209 () Bool)

(declare-fun res!574176 () Bool)

(declare-fun e!471859 () Bool)

(assert (=> b!845209 (=> (not res!574176) (not e!471859))))

(declare-datatypes ((array!47986 0))(
  ( (array!47987 (arr!23024 (Array (_ BitVec 32) (_ BitVec 64))) (size!23464 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47986)

(declare-datatypes ((List!16297 0))(
  ( (Nil!16294) (Cons!16293 (h!17424 (_ BitVec 64)) (t!22668 List!16297)) )
))
(declare-fun arrayNoDuplicates!0 (array!47986 (_ BitVec 32) List!16297) Bool)

(assert (=> b!845209 (= res!574176 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16294))))

(declare-fun b!845210 () Bool)

(declare-fun e!471862 () Bool)

(declare-fun tp_is_empty!15883 () Bool)

(assert (=> b!845210 (= e!471862 tp_is_empty!15883)))

(declare-fun b!845211 () Bool)

(assert (=> b!845211 (= e!471859 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26225 0))(
  ( (V!26226 (val!7989 Int)) )
))
(declare-datatypes ((ValueCell!7502 0))(
  ( (ValueCellFull!7502 (v!10414 V!26225)) (EmptyCell!7502) )
))
(declare-datatypes ((array!47988 0))(
  ( (array!47989 (arr!23025 (Array (_ BitVec 32) ValueCell!7502)) (size!23465 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47988)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26225)

(declare-fun zeroValue!654 () V!26225)

(declare-datatypes ((tuple2!10434 0))(
  ( (tuple2!10435 (_1!5228 (_ BitVec 64)) (_2!5228 V!26225)) )
))
(declare-datatypes ((List!16298 0))(
  ( (Nil!16295) (Cons!16294 (h!17425 tuple2!10434) (t!22669 List!16298)) )
))
(declare-datatypes ((ListLongMap!9203 0))(
  ( (ListLongMap!9204 (toList!4617 List!16298)) )
))
(declare-fun lt!381391 () ListLongMap!9203)

(declare-fun getCurrentListMapNoExtraKeys!2602 (array!47986 array!47988 (_ BitVec 32) (_ BitVec 32) V!26225 V!26225 (_ BitVec 32) Int) ListLongMap!9203)

(assert (=> b!845211 (= lt!381391 (getCurrentListMapNoExtraKeys!2602 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845212 () Bool)

(declare-fun e!471861 () Bool)

(assert (=> b!845212 (= e!471861 tp_is_empty!15883)))

(declare-fun mapNonEmpty!25424 () Bool)

(declare-fun mapRes!25424 () Bool)

(declare-fun tp!48744 () Bool)

(assert (=> mapNonEmpty!25424 (= mapRes!25424 (and tp!48744 e!471862))))

(declare-fun mapRest!25424 () (Array (_ BitVec 32) ValueCell!7502))

(declare-fun mapValue!25424 () ValueCell!7502)

(declare-fun mapKey!25424 () (_ BitVec 32))

(assert (=> mapNonEmpty!25424 (= (arr!23025 _values!688) (store mapRest!25424 mapKey!25424 mapValue!25424))))

(declare-fun b!845213 () Bool)

(declare-fun e!471860 () Bool)

(assert (=> b!845213 (= e!471860 (and e!471861 mapRes!25424))))

(declare-fun condMapEmpty!25424 () Bool)

(declare-fun mapDefault!25424 () ValueCell!7502)

