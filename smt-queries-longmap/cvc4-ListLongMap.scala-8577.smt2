; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104684 () Bool)

(assert start!104684)

(declare-fun b_free!26501 () Bool)

(declare-fun b_next!26501 () Bool)

(assert (=> start!104684 (= b_free!26501 (not b_next!26501))))

(declare-fun tp!92990 () Bool)

(declare-fun b_and!44265 () Bool)

(assert (=> start!104684 (= tp!92990 b_and!44265)))

(declare-fun b!1248077 () Bool)

(declare-fun res!832702 () Bool)

(declare-fun e!708167 () Bool)

(assert (=> b!1248077 (=> (not res!832702) (not e!708167))))

(declare-datatypes ((array!80498 0))(
  ( (array!80499 (arr!38817 (Array (_ BitVec 32) (_ BitVec 64))) (size!39353 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80498)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80498 (_ BitVec 32)) Bool)

(assert (=> b!1248077 (= res!832702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48862 () Bool)

(declare-fun mapRes!48862 () Bool)

(declare-fun tp!92989 () Bool)

(declare-fun e!708169 () Bool)

(assert (=> mapNonEmpty!48862 (= mapRes!48862 (and tp!92989 e!708169))))

(declare-datatypes ((V!47235 0))(
  ( (V!47236 (val!15764 Int)) )
))
(declare-datatypes ((ValueCell!14938 0))(
  ( (ValueCellFull!14938 (v!18460 V!47235)) (EmptyCell!14938) )
))
(declare-fun mapValue!48862 () ValueCell!14938)

(declare-fun mapKey!48862 () (_ BitVec 32))

(declare-fun mapRest!48862 () (Array (_ BitVec 32) ValueCell!14938))

(declare-datatypes ((array!80500 0))(
  ( (array!80501 (arr!38818 (Array (_ BitVec 32) ValueCell!14938)) (size!39354 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80500)

(assert (=> mapNonEmpty!48862 (= (arr!38818 _values!914) (store mapRest!48862 mapKey!48862 mapValue!48862))))

(declare-fun b!1248078 () Bool)

(declare-fun res!832703 () Bool)

(assert (=> b!1248078 (=> (not res!832703) (not e!708167))))

(declare-datatypes ((List!27553 0))(
  ( (Nil!27550) (Cons!27549 (h!28758 (_ BitVec 64)) (t!41022 List!27553)) )
))
(declare-fun arrayNoDuplicates!0 (array!80498 (_ BitVec 32) List!27553) Bool)

(assert (=> b!1248078 (= res!832703 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27550))))

(declare-fun b!1248079 () Bool)

(declare-fun tp_is_empty!31403 () Bool)

(assert (=> b!1248079 (= e!708169 tp_is_empty!31403)))

(declare-fun b!1248080 () Bool)

(declare-fun e!708168 () Bool)

(assert (=> b!1248080 (= e!708168 tp_is_empty!31403)))

(declare-fun mapIsEmpty!48862 () Bool)

(assert (=> mapIsEmpty!48862 mapRes!48862))

(declare-fun b!1248081 () Bool)

(declare-fun e!708165 () Bool)

(assert (=> b!1248081 (= e!708165 (and e!708168 mapRes!48862))))

(declare-fun condMapEmpty!48862 () Bool)

(declare-fun mapDefault!48862 () ValueCell!14938)

