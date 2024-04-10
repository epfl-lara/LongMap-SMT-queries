; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20194 () Bool)

(assert start!20194)

(declare-fun b_free!4853 () Bool)

(declare-fun b_next!4853 () Bool)

(assert (=> start!20194 (= b_free!4853 (not b_next!4853))))

(declare-fun tp!17590 () Bool)

(declare-fun b_and!11599 () Bool)

(assert (=> start!20194 (= tp!17590 b_and!11599)))

(declare-fun b!198344 () Bool)

(declare-fun res!94021 () Bool)

(declare-fun e!130375 () Bool)

(assert (=> b!198344 (=> (not res!94021) (not e!130375))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198344 (= res!94021 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8132 () Bool)

(declare-fun mapRes!8132 () Bool)

(assert (=> mapIsEmpty!8132 mapRes!8132))

(declare-fun res!94022 () Bool)

(assert (=> start!20194 (=> (not res!94022) (not e!130375))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20194 (= res!94022 (validMask!0 mask!1149))))

(assert (=> start!20194 e!130375))

(declare-datatypes ((V!5925 0))(
  ( (V!5926 (val!2399 Int)) )
))
(declare-datatypes ((ValueCell!2011 0))(
  ( (ValueCellFull!2011 (v!4369 V!5925)) (EmptyCell!2011) )
))
(declare-datatypes ((array!8667 0))(
  ( (array!8668 (arr!4084 (Array (_ BitVec 32) ValueCell!2011)) (size!4409 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8667)

(declare-fun e!130377 () Bool)

(declare-fun array_inv!2673 (array!8667) Bool)

(assert (=> start!20194 (and (array_inv!2673 _values!649) e!130377)))

(assert (=> start!20194 true))

(declare-fun tp_is_empty!4709 () Bool)

(assert (=> start!20194 tp_is_empty!4709))

(declare-datatypes ((array!8669 0))(
  ( (array!8670 (arr!4085 (Array (_ BitVec 32) (_ BitVec 64))) (size!4410 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8669)

(declare-fun array_inv!2674 (array!8669) Bool)

(assert (=> start!20194 (array_inv!2674 _keys!825)))

(assert (=> start!20194 tp!17590))

(declare-fun b!198345 () Bool)

(declare-fun res!94025 () Bool)

(assert (=> b!198345 (=> (not res!94025) (not e!130375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8669 (_ BitVec 32)) Bool)

(assert (=> b!198345 (= res!94025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198346 () Bool)

(declare-fun res!94027 () Bool)

(assert (=> b!198346 (=> (not res!94027) (not e!130375))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198346 (= res!94027 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4410 _keys!825))))))

(declare-fun b!198347 () Bool)

(declare-fun e!130376 () Bool)

(assert (=> b!198347 (= e!130376 tp_is_empty!4709)))

(declare-fun b!198348 () Bool)

(declare-fun res!94023 () Bool)

(assert (=> b!198348 (=> (not res!94023) (not e!130375))))

(declare-datatypes ((List!2554 0))(
  ( (Nil!2551) (Cons!2550 (h!3192 (_ BitVec 64)) (t!7485 List!2554)) )
))
(declare-fun arrayNoDuplicates!0 (array!8669 (_ BitVec 32) List!2554) Bool)

(assert (=> b!198348 (= res!94023 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2551))))

(declare-fun b!198349 () Bool)

(declare-fun res!94024 () Bool)

(assert (=> b!198349 (=> (not res!94024) (not e!130375))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198349 (= res!94024 (and (= (size!4409 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4410 _keys!825) (size!4409 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198350 () Bool)

(declare-fun res!94026 () Bool)

(assert (=> b!198350 (=> (not res!94026) (not e!130375))))

(assert (=> b!198350 (= res!94026 (= (select (arr!4085 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8132 () Bool)

(declare-fun tp!17591 () Bool)

(assert (=> mapNonEmpty!8132 (= mapRes!8132 (and tp!17591 e!130376))))

(declare-fun mapKey!8132 () (_ BitVec 32))

(declare-fun mapValue!8132 () ValueCell!2011)

(declare-fun mapRest!8132 () (Array (_ BitVec 32) ValueCell!2011))

(assert (=> mapNonEmpty!8132 (= (arr!4084 _values!649) (store mapRest!8132 mapKey!8132 mapValue!8132))))

(declare-fun b!198351 () Bool)

(assert (=> b!198351 (= e!130375 false)))

(declare-fun v!520 () V!5925)

(declare-fun zeroValue!615 () V!5925)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5925)

(declare-datatypes ((tuple2!3640 0))(
  ( (tuple2!3641 (_1!1831 (_ BitVec 64)) (_2!1831 V!5925)) )
))
(declare-datatypes ((List!2555 0))(
  ( (Nil!2552) (Cons!2551 (h!3193 tuple2!3640) (t!7486 List!2555)) )
))
(declare-datatypes ((ListLongMap!2553 0))(
  ( (ListLongMap!2554 (toList!1292 List!2555)) )
))
(declare-fun lt!97899 () ListLongMap!2553)

(declare-fun getCurrentListMapNoExtraKeys!257 (array!8669 array!8667 (_ BitVec 32) (_ BitVec 32) V!5925 V!5925 (_ BitVec 32) Int) ListLongMap!2553)

(assert (=> b!198351 (= lt!97899 (getCurrentListMapNoExtraKeys!257 _keys!825 (array!8668 (store (arr!4084 _values!649) i!601 (ValueCellFull!2011 v!520)) (size!4409 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97898 () ListLongMap!2553)

(assert (=> b!198351 (= lt!97898 (getCurrentListMapNoExtraKeys!257 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198352 () Bool)

(declare-fun e!130379 () Bool)

(assert (=> b!198352 (= e!130377 (and e!130379 mapRes!8132))))

(declare-fun condMapEmpty!8132 () Bool)

(declare-fun mapDefault!8132 () ValueCell!2011)

