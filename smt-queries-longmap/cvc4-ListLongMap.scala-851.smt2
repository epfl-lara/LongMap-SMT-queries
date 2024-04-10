; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20206 () Bool)

(assert start!20206)

(declare-fun b_free!4865 () Bool)

(declare-fun b_next!4865 () Bool)

(assert (=> start!20206 (= b_free!4865 (not b_next!4865))))

(declare-fun tp!17627 () Bool)

(declare-fun b_and!11611 () Bool)

(assert (=> start!20206 (= tp!17627 b_and!11611)))

(declare-fun b!198524 () Bool)

(declare-fun e!130469 () Bool)

(assert (=> b!198524 (= e!130469 false)))

(declare-datatypes ((V!5941 0))(
  ( (V!5942 (val!2405 Int)) )
))
(declare-datatypes ((tuple2!3648 0))(
  ( (tuple2!3649 (_1!1835 (_ BitVec 64)) (_2!1835 V!5941)) )
))
(declare-datatypes ((List!2562 0))(
  ( (Nil!2559) (Cons!2558 (h!3200 tuple2!3648) (t!7493 List!2562)) )
))
(declare-datatypes ((ListLongMap!2561 0))(
  ( (ListLongMap!2562 (toList!1296 List!2562)) )
))
(declare-fun lt!97934 () ListLongMap!2561)

(declare-datatypes ((ValueCell!2017 0))(
  ( (ValueCellFull!2017 (v!4375 V!5941)) (EmptyCell!2017) )
))
(declare-datatypes ((array!8691 0))(
  ( (array!8692 (arr!4096 (Array (_ BitVec 32) ValueCell!2017)) (size!4421 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8691)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5941)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5941)

(declare-datatypes ((array!8693 0))(
  ( (array!8694 (arr!4097 (Array (_ BitVec 32) (_ BitVec 64))) (size!4422 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8693)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5941)

(declare-fun getCurrentListMapNoExtraKeys!261 (array!8693 array!8691 (_ BitVec 32) (_ BitVec 32) V!5941 V!5941 (_ BitVec 32) Int) ListLongMap!2561)

(assert (=> b!198524 (= lt!97934 (getCurrentListMapNoExtraKeys!261 _keys!825 (array!8692 (store (arr!4096 _values!649) i!601 (ValueCellFull!2017 v!520)) (size!4421 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97935 () ListLongMap!2561)

(assert (=> b!198524 (= lt!97935 (getCurrentListMapNoExtraKeys!261 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198525 () Bool)

(declare-fun e!130468 () Bool)

(declare-fun tp_is_empty!4721 () Bool)

(assert (=> b!198525 (= e!130468 tp_is_empty!4721)))

(declare-fun b!198526 () Bool)

(declare-fun res!94151 () Bool)

(assert (=> b!198526 (=> (not res!94151) (not e!130469))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!198526 (= res!94151 (= (select (arr!4097 _keys!825) i!601) k!843))))

(declare-fun b!198527 () Bool)

(declare-fun e!130466 () Bool)

(assert (=> b!198527 (= e!130466 tp_is_empty!4721)))

(declare-fun b!198528 () Bool)

(declare-fun res!94149 () Bool)

(assert (=> b!198528 (=> (not res!94149) (not e!130469))))

(assert (=> b!198528 (= res!94149 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4422 _keys!825))))))

(declare-fun b!198529 () Bool)

(declare-fun res!94150 () Bool)

(assert (=> b!198529 (=> (not res!94150) (not e!130469))))

(declare-datatypes ((List!2563 0))(
  ( (Nil!2560) (Cons!2559 (h!3201 (_ BitVec 64)) (t!7494 List!2563)) )
))
(declare-fun arrayNoDuplicates!0 (array!8693 (_ BitVec 32) List!2563) Bool)

(assert (=> b!198529 (= res!94150 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2560))))

(declare-fun mapNonEmpty!8150 () Bool)

(declare-fun mapRes!8150 () Bool)

(declare-fun tp!17626 () Bool)

(assert (=> mapNonEmpty!8150 (= mapRes!8150 (and tp!17626 e!130466))))

(declare-fun mapKey!8150 () (_ BitVec 32))

(declare-fun mapRest!8150 () (Array (_ BitVec 32) ValueCell!2017))

(declare-fun mapValue!8150 () ValueCell!2017)

(assert (=> mapNonEmpty!8150 (= (arr!4096 _values!649) (store mapRest!8150 mapKey!8150 mapValue!8150))))

(declare-fun b!198530 () Bool)

(declare-fun res!94147 () Bool)

(assert (=> b!198530 (=> (not res!94147) (not e!130469))))

(assert (=> b!198530 (= res!94147 (and (= (size!4421 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4422 _keys!825) (size!4421 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198532 () Bool)

(declare-fun res!94152 () Bool)

(assert (=> b!198532 (=> (not res!94152) (not e!130469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198532 (= res!94152 (validKeyInArray!0 k!843))))

(declare-fun b!198533 () Bool)

(declare-fun res!94148 () Bool)

(assert (=> b!198533 (=> (not res!94148) (not e!130469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8693 (_ BitVec 32)) Bool)

(assert (=> b!198533 (= res!94148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8150 () Bool)

(assert (=> mapIsEmpty!8150 mapRes!8150))

(declare-fun res!94153 () Bool)

(assert (=> start!20206 (=> (not res!94153) (not e!130469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20206 (= res!94153 (validMask!0 mask!1149))))

(assert (=> start!20206 e!130469))

(declare-fun e!130465 () Bool)

(declare-fun array_inv!2683 (array!8691) Bool)

(assert (=> start!20206 (and (array_inv!2683 _values!649) e!130465)))

(assert (=> start!20206 true))

(assert (=> start!20206 tp_is_empty!4721))

(declare-fun array_inv!2684 (array!8693) Bool)

(assert (=> start!20206 (array_inv!2684 _keys!825)))

(assert (=> start!20206 tp!17627))

(declare-fun b!198531 () Bool)

(assert (=> b!198531 (= e!130465 (and e!130468 mapRes!8150))))

(declare-fun condMapEmpty!8150 () Bool)

(declare-fun mapDefault!8150 () ValueCell!2017)

