; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21124 () Bool)

(assert start!21124)

(declare-fun b_free!5615 () Bool)

(declare-fun b_next!5615 () Bool)

(assert (=> start!21124 (= b_free!5615 (not b_next!5615))))

(declare-fun tp!19910 () Bool)

(declare-fun b_and!12457 () Bool)

(assert (=> start!21124 (= tp!19910 b_and!12457)))

(declare-fun b!212655 () Bool)

(declare-fun e!138349 () Bool)

(declare-fun e!138347 () Bool)

(assert (=> b!212655 (= e!138349 (not e!138347))))

(declare-fun res!104018 () Bool)

(assert (=> b!212655 (=> res!104018 e!138347)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212655 (= res!104018 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6949 0))(
  ( (V!6950 (val!2783 Int)) )
))
(declare-datatypes ((ValueCell!2395 0))(
  ( (ValueCellFull!2395 (v!4785 V!6949)) (EmptyCell!2395) )
))
(declare-datatypes ((array!10157 0))(
  ( (array!10158 (arr!4821 (Array (_ BitVec 32) ValueCell!2395)) (size!5146 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10157)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4214 0))(
  ( (tuple2!4215 (_1!2118 (_ BitVec 64)) (_2!2118 V!6949)) )
))
(declare-datatypes ((List!3102 0))(
  ( (Nil!3099) (Cons!3098 (h!3740 tuple2!4214) (t!8049 List!3102)) )
))
(declare-datatypes ((ListLongMap!3127 0))(
  ( (ListLongMap!3128 (toList!1579 List!3102)) )
))
(declare-fun lt!109660 () ListLongMap!3127)

(declare-fun zeroValue!615 () V!6949)

(declare-datatypes ((array!10159 0))(
  ( (array!10160 (arr!4822 (Array (_ BitVec 32) (_ BitVec 64))) (size!5147 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10159)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6949)

(declare-fun getCurrentListMap!1110 (array!10159 array!10157 (_ BitVec 32) (_ BitVec 32) V!6949 V!6949 (_ BitVec 32) Int) ListLongMap!3127)

(assert (=> b!212655 (= lt!109660 (getCurrentListMap!1110 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109664 () array!10157)

(declare-fun lt!109663 () ListLongMap!3127)

(assert (=> b!212655 (= lt!109663 (getCurrentListMap!1110 _keys!825 lt!109664 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109659 () ListLongMap!3127)

(declare-fun lt!109665 () ListLongMap!3127)

(assert (=> b!212655 (and (= lt!109659 lt!109665) (= lt!109665 lt!109659))))

(declare-fun lt!109658 () ListLongMap!3127)

(declare-fun v!520 () V!6949)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!582 (ListLongMap!3127 tuple2!4214) ListLongMap!3127)

(assert (=> b!212655 (= lt!109665 (+!582 lt!109658 (tuple2!4215 k!843 v!520)))))

(declare-datatypes ((Unit!6456 0))(
  ( (Unit!6457) )
))
(declare-fun lt!109661 () Unit!6456)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!227 (array!10159 array!10157 (_ BitVec 32) (_ BitVec 32) V!6949 V!6949 (_ BitVec 32) (_ BitVec 64) V!6949 (_ BitVec 32) Int) Unit!6456)

(assert (=> b!212655 (= lt!109661 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!227 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!512 (array!10159 array!10157 (_ BitVec 32) (_ BitVec 32) V!6949 V!6949 (_ BitVec 32) Int) ListLongMap!3127)

(assert (=> b!212655 (= lt!109659 (getCurrentListMapNoExtraKeys!512 _keys!825 lt!109664 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212655 (= lt!109664 (array!10158 (store (arr!4821 _values!649) i!601 (ValueCellFull!2395 v!520)) (size!5146 _values!649)))))

(assert (=> b!212655 (= lt!109658 (getCurrentListMapNoExtraKeys!512 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212656 () Bool)

(declare-fun e!138351 () Bool)

(declare-fun e!138350 () Bool)

(declare-fun mapRes!9308 () Bool)

(assert (=> b!212656 (= e!138351 (and e!138350 mapRes!9308))))

(declare-fun condMapEmpty!9308 () Bool)

(declare-fun mapDefault!9308 () ValueCell!2395)

