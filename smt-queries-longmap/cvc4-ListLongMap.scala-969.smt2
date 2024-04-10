; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20996 () Bool)

(assert start!20996)

(declare-fun b_free!5567 () Bool)

(declare-fun b_next!5567 () Bool)

(assert (=> start!20996 (= b_free!5567 (not b_next!5567))))

(declare-fun tp!19754 () Bool)

(declare-fun b_and!12361 () Bool)

(assert (=> start!20996 (= tp!19754 b_and!12361)))

(declare-fun b!211060 () Bool)

(declare-fun res!103070 () Bool)

(declare-fun e!137401 () Bool)

(assert (=> b!211060 (=> (not res!103070) (not e!137401))))

(declare-datatypes ((array!10057 0))(
  ( (array!10058 (arr!4775 (Array (_ BitVec 32) (_ BitVec 64))) (size!5100 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10057)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211060 (= res!103070 (= (select (arr!4775 _keys!825) i!601) k!843))))

(declare-fun b!211062 () Bool)

(declare-fun e!137405 () Bool)

(assert (=> b!211062 (= e!137401 (not e!137405))))

(declare-fun res!103071 () Bool)

(assert (=> b!211062 (=> res!103071 e!137405)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211062 (= res!103071 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6885 0))(
  ( (V!6886 (val!2759 Int)) )
))
(declare-datatypes ((tuple2!4170 0))(
  ( (tuple2!4171 (_1!2096 (_ BitVec 64)) (_2!2096 V!6885)) )
))
(declare-datatypes ((List!3063 0))(
  ( (Nil!3060) (Cons!3059 (h!3701 tuple2!4170) (t!8002 List!3063)) )
))
(declare-datatypes ((ListLongMap!3083 0))(
  ( (ListLongMap!3084 (toList!1557 List!3063)) )
))
(declare-fun lt!108436 () ListLongMap!3083)

(declare-datatypes ((ValueCell!2371 0))(
  ( (ValueCellFull!2371 (v!4745 V!6885)) (EmptyCell!2371) )
))
(declare-datatypes ((array!10059 0))(
  ( (array!10060 (arr!4776 (Array (_ BitVec 32) ValueCell!2371)) (size!5101 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10059)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6885)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6885)

(declare-fun getCurrentListMap!1091 (array!10057 array!10059 (_ BitVec 32) (_ BitVec 32) V!6885 V!6885 (_ BitVec 32) Int) ListLongMap!3083)

(assert (=> b!211062 (= lt!108436 (getCurrentListMap!1091 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108437 () array!10059)

(declare-fun lt!108438 () ListLongMap!3083)

(assert (=> b!211062 (= lt!108438 (getCurrentListMap!1091 _keys!825 lt!108437 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108434 () ListLongMap!3083)

(declare-fun lt!108433 () ListLongMap!3083)

(assert (=> b!211062 (and (= lt!108434 lt!108433) (= lt!108433 lt!108434))))

(declare-fun lt!108435 () ListLongMap!3083)

(declare-fun v!520 () V!6885)

(declare-fun +!560 (ListLongMap!3083 tuple2!4170) ListLongMap!3083)

(assert (=> b!211062 (= lt!108433 (+!560 lt!108435 (tuple2!4171 k!843 v!520)))))

(declare-datatypes ((Unit!6410 0))(
  ( (Unit!6411) )
))
(declare-fun lt!108432 () Unit!6410)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 (array!10057 array!10059 (_ BitVec 32) (_ BitVec 32) V!6885 V!6885 (_ BitVec 32) (_ BitVec 64) V!6885 (_ BitVec 32) Int) Unit!6410)

(assert (=> b!211062 (= lt!108432 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!493 (array!10057 array!10059 (_ BitVec 32) (_ BitVec 32) V!6885 V!6885 (_ BitVec 32) Int) ListLongMap!3083)

(assert (=> b!211062 (= lt!108434 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108437 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211062 (= lt!108437 (array!10060 (store (arr!4776 _values!649) i!601 (ValueCellFull!2371 v!520)) (size!5101 _values!649)))))

(assert (=> b!211062 (= lt!108435 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211063 () Bool)

(declare-fun res!103068 () Bool)

(assert (=> b!211063 (=> (not res!103068) (not e!137401))))

(assert (=> b!211063 (= res!103068 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5100 _keys!825))))))

(declare-fun b!211064 () Bool)

(declare-fun res!103067 () Bool)

(assert (=> b!211064 (=> (not res!103067) (not e!137401))))

(declare-datatypes ((List!3064 0))(
  ( (Nil!3061) (Cons!3060 (h!3702 (_ BitVec 64)) (t!8003 List!3064)) )
))
(declare-fun arrayNoDuplicates!0 (array!10057 (_ BitVec 32) List!3064) Bool)

(assert (=> b!211064 (= res!103067 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3061))))

(declare-fun b!211065 () Bool)

(declare-fun e!137402 () Bool)

(declare-fun e!137403 () Bool)

(declare-fun mapRes!9224 () Bool)

(assert (=> b!211065 (= e!137402 (and e!137403 mapRes!9224))))

(declare-fun condMapEmpty!9224 () Bool)

(declare-fun mapDefault!9224 () ValueCell!2371)

