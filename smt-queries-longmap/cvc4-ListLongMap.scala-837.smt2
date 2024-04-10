; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20122 () Bool)

(assert start!20122)

(declare-fun b_free!4781 () Bool)

(declare-fun b_next!4781 () Bool)

(assert (=> start!20122 (= b_free!4781 (not b_next!4781))))

(declare-fun tp!17374 () Bool)

(declare-fun b_and!11527 () Bool)

(assert (=> start!20122 (= tp!17374 b_and!11527)))

(declare-fun b!197264 () Bool)

(declare-fun res!93271 () Bool)

(declare-fun e!129835 () Bool)

(assert (=> b!197264 (=> (not res!93271) (not e!129835))))

(declare-datatypes ((array!8527 0))(
  ( (array!8528 (arr!4014 (Array (_ BitVec 32) (_ BitVec 64))) (size!4339 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8527)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5829 0))(
  ( (V!5830 (val!2363 Int)) )
))
(declare-datatypes ((ValueCell!1975 0))(
  ( (ValueCellFull!1975 (v!4333 V!5829)) (EmptyCell!1975) )
))
(declare-datatypes ((array!8529 0))(
  ( (array!8530 (arr!4015 (Array (_ BitVec 32) ValueCell!1975)) (size!4340 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8529)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197264 (= res!93271 (and (= (size!4340 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4339 _keys!825) (size!4340 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197265 () Bool)

(assert (=> b!197265 (= e!129835 false)))

(declare-datatypes ((tuple2!3594 0))(
  ( (tuple2!3595 (_1!1808 (_ BitVec 64)) (_2!1808 V!5829)) )
))
(declare-datatypes ((List!2506 0))(
  ( (Nil!2503) (Cons!2502 (h!3144 tuple2!3594) (t!7437 List!2506)) )
))
(declare-datatypes ((ListLongMap!2507 0))(
  ( (ListLongMap!2508 (toList!1269 List!2506)) )
))
(declare-fun lt!97701 () ListLongMap!2507)

(declare-fun zeroValue!615 () V!5829)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5829)

(declare-fun getCurrentListMapNoExtraKeys!234 (array!8527 array!8529 (_ BitVec 32) (_ BitVec 32) V!5829 V!5829 (_ BitVec 32) Int) ListLongMap!2507)

(assert (=> b!197265 (= lt!97701 (getCurrentListMapNoExtraKeys!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197266 () Bool)

(declare-fun e!129836 () Bool)

(declare-fun e!129839 () Bool)

(declare-fun mapRes!8024 () Bool)

(assert (=> b!197266 (= e!129836 (and e!129839 mapRes!8024))))

(declare-fun condMapEmpty!8024 () Bool)

(declare-fun mapDefault!8024 () ValueCell!1975)

