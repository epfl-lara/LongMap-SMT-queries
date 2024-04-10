; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21210 () Bool)

(assert start!21210)

(declare-fun b_free!5641 () Bool)

(declare-fun b_next!5641 () Bool)

(assert (=> start!21210 (= b_free!5641 (not b_next!5641))))

(declare-fun tp!19996 () Bool)

(declare-fun b_and!12519 () Bool)

(assert (=> start!21210 (= tp!19996 b_and!12519)))

(declare-fun b!213674 () Bool)

(declare-fun res!104592 () Bool)

(declare-fun e!138954 () Bool)

(assert (=> b!213674 (=> (not res!104592) (not e!138954))))

(declare-datatypes ((array!10211 0))(
  ( (array!10212 (arr!4845 (Array (_ BitVec 32) (_ BitVec 64))) (size!5170 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10211)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213674 (= res!104592 (= (select (arr!4845 _keys!825) i!601) k!843))))

(declare-fun b!213675 () Bool)

(declare-fun e!138952 () Bool)

(declare-fun tp_is_empty!5503 () Bool)

(assert (=> b!213675 (= e!138952 tp_is_empty!5503)))

(declare-fun b!213676 () Bool)

(declare-fun e!138955 () Bool)

(assert (=> b!213676 (= e!138955 tp_is_empty!5503)))

(declare-fun mapIsEmpty!9356 () Bool)

(declare-fun mapRes!9356 () Bool)

(assert (=> mapIsEmpty!9356 mapRes!9356))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6985 0))(
  ( (V!6986 (val!2796 Int)) )
))
(declare-datatypes ((tuple2!4234 0))(
  ( (tuple2!4235 (_1!2128 (_ BitVec 64)) (_2!2128 V!6985)) )
))
(declare-datatypes ((List!3119 0))(
  ( (Nil!3116) (Cons!3115 (h!3757 tuple2!4234) (t!8072 List!3119)) )
))
(declare-datatypes ((ListLongMap!3147 0))(
  ( (ListLongMap!3148 (toList!1589 List!3119)) )
))
(declare-fun lt!110486 () ListLongMap!3147)

(declare-fun b!213677 () Bool)

(declare-datatypes ((ValueCell!2408 0))(
  ( (ValueCellFull!2408 (v!4810 V!6985)) (EmptyCell!2408) )
))
(declare-datatypes ((array!10213 0))(
  ( (array!10214 (arr!4846 (Array (_ BitVec 32) ValueCell!2408)) (size!5171 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10213)

(declare-fun lt!110493 () Bool)

(declare-fun lt!110489 () ListLongMap!3147)

(assert (=> b!213677 (= e!138954 (not (or (and (not lt!110493) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110493) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110493) (not (= lt!110486 lt!110489)) (bvslt i!601 (size!5171 _values!649)))))))

(assert (=> b!213677 (= lt!110493 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110490 () ListLongMap!3147)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6985)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6985)

(declare-fun getCurrentListMap!1117 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3147)

(assert (=> b!213677 (= lt!110490 (getCurrentListMap!1117 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110492 () array!10213)

(assert (=> b!213677 (= lt!110486 (getCurrentListMap!1117 _keys!825 lt!110492 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110488 () ListLongMap!3147)

(assert (=> b!213677 (and (= lt!110489 lt!110488) (= lt!110488 lt!110489))))

(declare-fun v!520 () V!6985)

(declare-fun lt!110487 () ListLongMap!3147)

(declare-fun +!592 (ListLongMap!3147 tuple2!4234) ListLongMap!3147)

(assert (=> b!213677 (= lt!110488 (+!592 lt!110487 (tuple2!4235 k!843 v!520)))))

(declare-datatypes ((Unit!6478 0))(
  ( (Unit!6479) )
))
(declare-fun lt!110491 () Unit!6478)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) (_ BitVec 64) V!6985 (_ BitVec 32) Int) Unit!6478)

(assert (=> b!213677 (= lt!110491 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!519 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3147)

(assert (=> b!213677 (= lt!110489 (getCurrentListMapNoExtraKeys!519 _keys!825 lt!110492 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213677 (= lt!110492 (array!10214 (store (arr!4846 _values!649) i!601 (ValueCellFull!2408 v!520)) (size!5171 _values!649)))))

(assert (=> b!213677 (= lt!110487 (getCurrentListMapNoExtraKeys!519 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213678 () Bool)

(declare-fun res!104591 () Bool)

(assert (=> b!213678 (=> (not res!104591) (not e!138954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213678 (= res!104591 (validKeyInArray!0 k!843))))

(declare-fun b!213679 () Bool)

(declare-fun e!138953 () Bool)

(assert (=> b!213679 (= e!138953 (and e!138955 mapRes!9356))))

(declare-fun condMapEmpty!9356 () Bool)

(declare-fun mapDefault!9356 () ValueCell!2408)

