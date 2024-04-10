; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41226 () Bool)

(assert start!41226)

(declare-fun b_free!11069 () Bool)

(declare-fun b_next!11069 () Bool)

(assert (=> start!41226 (= b_free!11069 (not b_next!11069))))

(declare-fun tp!39046 () Bool)

(declare-fun b_and!19389 () Bool)

(assert (=> start!41226 (= tp!39046 b_and!19389)))

(declare-fun b!461044 () Bool)

(declare-fun res!275696 () Bool)

(declare-fun e!268937 () Bool)

(assert (=> b!461044 (=> (not res!275696) (not e!268937))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28615 0))(
  ( (array!28616 (arr!13747 (Array (_ BitVec 32) (_ BitVec 64))) (size!14099 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28615)

(assert (=> b!461044 (= res!275696 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14099 _keys!709))))))

(declare-fun b!461045 () Bool)

(declare-fun res!275693 () Bool)

(assert (=> b!461045 (=> (not res!275693) (not e!268937))))

(assert (=> b!461045 (= res!275693 (or (= (select (arr!13747 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13747 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461046 () Bool)

(declare-fun e!268935 () Bool)

(assert (=> b!461046 (= e!268937 e!268935)))

(declare-fun res!275703 () Bool)

(assert (=> b!461046 (=> (not res!275703) (not e!268935))))

(declare-fun lt!208868 () array!28615)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28615 (_ BitVec 32)) Bool)

(assert (=> b!461046 (= res!275703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208868 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!461046 (= lt!208868 (array!28616 (store (arr!13747 _keys!709) i!563 k!794) (size!14099 _keys!709)))))

(declare-fun b!461047 () Bool)

(declare-fun e!268934 () Bool)

(assert (=> b!461047 (= e!268934 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17647 0))(
  ( (V!17648 (val!6248 Int)) )
))
(declare-datatypes ((ValueCell!5860 0))(
  ( (ValueCellFull!5860 (v!8530 V!17647)) (EmptyCell!5860) )
))
(declare-datatypes ((array!28617 0))(
  ( (array!28618 (arr!13748 (Array (_ BitVec 32) ValueCell!5860)) (size!14100 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28617)

(declare-fun zeroValue!515 () V!17647)

(declare-fun v!412 () V!17647)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17647)

(declare-fun lt!208871 () array!28617)

(declare-datatypes ((tuple2!8246 0))(
  ( (tuple2!8247 (_1!4134 (_ BitVec 64)) (_2!4134 V!17647)) )
))
(declare-datatypes ((List!8317 0))(
  ( (Nil!8314) (Cons!8313 (h!9169 tuple2!8246) (t!14259 List!8317)) )
))
(declare-datatypes ((ListLongMap!7159 0))(
  ( (ListLongMap!7160 (toList!3595 List!8317)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1775 (array!28615 array!28617 (_ BitVec 32) (_ BitVec 32) V!17647 V!17647 (_ BitVec 32) Int) ListLongMap!7159)

(declare-fun +!1630 (ListLongMap!7159 tuple2!8246) ListLongMap!7159)

(assert (=> b!461047 (= (getCurrentListMapNoExtraKeys!1775 lt!208868 lt!208871 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1630 (getCurrentListMapNoExtraKeys!1775 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8247 k!794 v!412)))))

(declare-datatypes ((Unit!13426 0))(
  ( (Unit!13427) )
))
(declare-fun lt!208872 () Unit!13426)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!786 (array!28615 array!28617 (_ BitVec 32) (_ BitVec 32) V!17647 V!17647 (_ BitVec 32) (_ BitVec 64) V!17647 (_ BitVec 32) Int) Unit!13426)

(assert (=> b!461047 (= lt!208872 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!786 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461048 () Bool)

(declare-fun e!268940 () Bool)

(declare-fun tp_is_empty!12407 () Bool)

(assert (=> b!461048 (= e!268940 tp_is_empty!12407)))

(declare-fun b!461049 () Bool)

(assert (=> b!461049 (= e!268935 e!268934)))

(declare-fun res!275700 () Bool)

(assert (=> b!461049 (=> (not res!275700) (not e!268934))))

(assert (=> b!461049 (= res!275700 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208869 () ListLongMap!7159)

(assert (=> b!461049 (= lt!208869 (getCurrentListMapNoExtraKeys!1775 lt!208868 lt!208871 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!461049 (= lt!208871 (array!28618 (store (arr!13748 _values!549) i!563 (ValueCellFull!5860 v!412)) (size!14100 _values!549)))))

(declare-fun lt!208870 () ListLongMap!7159)

(assert (=> b!461049 (= lt!208870 (getCurrentListMapNoExtraKeys!1775 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!20263 () Bool)

(declare-fun mapRes!20263 () Bool)

(declare-fun tp!39045 () Bool)

(declare-fun e!268936 () Bool)

(assert (=> mapNonEmpty!20263 (= mapRes!20263 (and tp!39045 e!268936))))

(declare-fun mapRest!20263 () (Array (_ BitVec 32) ValueCell!5860))

(declare-fun mapValue!20263 () ValueCell!5860)

(declare-fun mapKey!20263 () (_ BitVec 32))

(assert (=> mapNonEmpty!20263 (= (arr!13748 _values!549) (store mapRest!20263 mapKey!20263 mapValue!20263))))

(declare-fun b!461050 () Bool)

(declare-fun res!275702 () Bool)

(assert (=> b!461050 (=> (not res!275702) (not e!268937))))

(declare-fun arrayContainsKey!0 (array!28615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461050 (= res!275702 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!461051 () Bool)

(declare-fun res!275697 () Bool)

(assert (=> b!461051 (=> (not res!275697) (not e!268937))))

(assert (=> b!461051 (= res!275697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461052 () Bool)

(declare-fun res!275699 () Bool)

(assert (=> b!461052 (=> (not res!275699) (not e!268937))))

(declare-datatypes ((List!8318 0))(
  ( (Nil!8315) (Cons!8314 (h!9170 (_ BitVec 64)) (t!14260 List!8318)) )
))
(declare-fun arrayNoDuplicates!0 (array!28615 (_ BitVec 32) List!8318) Bool)

(assert (=> b!461052 (= res!275699 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8315))))

(declare-fun b!461053 () Bool)

(assert (=> b!461053 (= e!268936 tp_is_empty!12407)))

(declare-fun b!461054 () Bool)

(declare-fun res!275695 () Bool)

(assert (=> b!461054 (=> (not res!275695) (not e!268937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461054 (= res!275695 (validKeyInArray!0 k!794))))

(declare-fun b!461055 () Bool)

(declare-fun res!275698 () Bool)

(assert (=> b!461055 (=> (not res!275698) (not e!268935))))

(assert (=> b!461055 (= res!275698 (bvsle from!863 i!563))))

(declare-fun res!275694 () Bool)

(assert (=> start!41226 (=> (not res!275694) (not e!268937))))

(assert (=> start!41226 (= res!275694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14099 _keys!709))))))

(assert (=> start!41226 e!268937))

(assert (=> start!41226 tp_is_empty!12407))

(assert (=> start!41226 tp!39046))

(assert (=> start!41226 true))

(declare-fun e!268939 () Bool)

(declare-fun array_inv!9944 (array!28617) Bool)

(assert (=> start!41226 (and (array_inv!9944 _values!549) e!268939)))

(declare-fun array_inv!9945 (array!28615) Bool)

(assert (=> start!41226 (array_inv!9945 _keys!709)))

(declare-fun b!461056 () Bool)

(declare-fun res!275704 () Bool)

(assert (=> b!461056 (=> (not res!275704) (not e!268937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461056 (= res!275704 (validMask!0 mask!1025))))

(declare-fun b!461057 () Bool)

(declare-fun res!275701 () Bool)

(assert (=> b!461057 (=> (not res!275701) (not e!268935))))

(assert (=> b!461057 (= res!275701 (arrayNoDuplicates!0 lt!208868 #b00000000000000000000000000000000 Nil!8315))))

(declare-fun b!461058 () Bool)

(declare-fun res!275705 () Bool)

(assert (=> b!461058 (=> (not res!275705) (not e!268937))))

(assert (=> b!461058 (= res!275705 (and (= (size!14100 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14099 _keys!709) (size!14100 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20263 () Bool)

(assert (=> mapIsEmpty!20263 mapRes!20263))

(declare-fun b!461059 () Bool)

(assert (=> b!461059 (= e!268939 (and e!268940 mapRes!20263))))

(declare-fun condMapEmpty!20263 () Bool)

(declare-fun mapDefault!20263 () ValueCell!5860)

