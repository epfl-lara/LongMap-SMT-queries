; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72752 () Bool)

(assert start!72752)

(declare-fun b!844361 () Bool)

(declare-fun e!471260 () Bool)

(assert (=> b!844361 (= e!471260 false)))

(declare-fun lt!381271 () Bool)

(declare-datatypes ((array!47840 0))(
  ( (array!47841 (arr!22951 (Array (_ BitVec 32) (_ BitVec 64))) (size!23391 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47840)

(declare-datatypes ((List!16269 0))(
  ( (Nil!16266) (Cons!16265 (h!17396 (_ BitVec 64)) (t!22640 List!16269)) )
))
(declare-fun arrayNoDuplicates!0 (array!47840 (_ BitVec 32) List!16269) Bool)

(assert (=> b!844361 (= lt!381271 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16266))))

(declare-fun b!844362 () Bool)

(declare-fun res!573686 () Bool)

(assert (=> b!844362 (=> (not res!573686) (not e!471260))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26117 0))(
  ( (V!26118 (val!7949 Int)) )
))
(declare-datatypes ((ValueCell!7462 0))(
  ( (ValueCellFull!7462 (v!10374 V!26117)) (EmptyCell!7462) )
))
(declare-datatypes ((array!47842 0))(
  ( (array!47843 (arr!22952 (Array (_ BitVec 32) ValueCell!7462)) (size!23392 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47842)

(assert (=> b!844362 (= res!573686 (and (= (size!23392 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23391 _keys!868) (size!23392 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25304 () Bool)

(declare-fun mapRes!25304 () Bool)

(assert (=> mapIsEmpty!25304 mapRes!25304))

(declare-fun b!844363 () Bool)

(declare-fun e!471258 () Bool)

(declare-fun tp_is_empty!15803 () Bool)

(assert (=> b!844363 (= e!471258 tp_is_empty!15803)))

(declare-fun mapNonEmpty!25304 () Bool)

(declare-fun tp!48622 () Bool)

(declare-fun e!471262 () Bool)

(assert (=> mapNonEmpty!25304 (= mapRes!25304 (and tp!48622 e!471262))))

(declare-fun mapRest!25304 () (Array (_ BitVec 32) ValueCell!7462))

(declare-fun mapValue!25304 () ValueCell!7462)

(declare-fun mapKey!25304 () (_ BitVec 32))

(assert (=> mapNonEmpty!25304 (= (arr!22952 _values!688) (store mapRest!25304 mapKey!25304 mapValue!25304))))

(declare-fun b!844364 () Bool)

(declare-fun res!573687 () Bool)

(assert (=> b!844364 (=> (not res!573687) (not e!471260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844364 (= res!573687 (validMask!0 mask!1196))))

(declare-fun b!844365 () Bool)

(assert (=> b!844365 (= e!471262 tp_is_empty!15803)))

(declare-fun res!573689 () Bool)

(assert (=> start!72752 (=> (not res!573689) (not e!471260))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72752 (= res!573689 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23391 _keys!868))))))

(assert (=> start!72752 e!471260))

(assert (=> start!72752 true))

(declare-fun array_inv!18252 (array!47840) Bool)

(assert (=> start!72752 (array_inv!18252 _keys!868)))

(declare-fun e!471259 () Bool)

(declare-fun array_inv!18253 (array!47842) Bool)

(assert (=> start!72752 (and (array_inv!18253 _values!688) e!471259)))

(declare-fun b!844366 () Bool)

(declare-fun res!573688 () Bool)

(assert (=> b!844366 (=> (not res!573688) (not e!471260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47840 (_ BitVec 32)) Bool)

(assert (=> b!844366 (= res!573688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844367 () Bool)

(assert (=> b!844367 (= e!471259 (and e!471258 mapRes!25304))))

(declare-fun condMapEmpty!25304 () Bool)

(declare-fun mapDefault!25304 () ValueCell!7462)

