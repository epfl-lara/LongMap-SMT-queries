; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74942 () Bool)

(assert start!74942)

(declare-fun b_free!15461 () Bool)

(declare-fun b_next!15461 () Bool)

(assert (=> start!74942 (= b_free!15461 (not b_next!15461))))

(declare-fun tp!54085 () Bool)

(declare-fun b_and!25621 () Bool)

(assert (=> start!74942 (= tp!54085 b_and!25621)))

(declare-fun b!884033 () Bool)

(declare-fun e!491979 () Bool)

(declare-fun e!491975 () Bool)

(assert (=> b!884033 (= e!491979 (not e!491975))))

(declare-fun res!600579 () Bool)

(assert (=> b!884033 (=> res!600579 e!491975)))

(declare-datatypes ((array!51536 0))(
  ( (array!51537 (arr!24787 (Array (_ BitVec 32) (_ BitVec 64))) (size!25227 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51536)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884033 (= res!600579 (not (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053))))))

(declare-datatypes ((V!28653 0))(
  ( (V!28654 (val!8900 Int)) )
))
(declare-datatypes ((tuple2!11800 0))(
  ( (tuple2!11801 (_1!5911 (_ BitVec 64)) (_2!5911 V!28653)) )
))
(declare-datatypes ((List!17606 0))(
  ( (Nil!17603) (Cons!17602 (h!18733 tuple2!11800) (t!24869 List!17606)) )
))
(declare-datatypes ((ListLongMap!10569 0))(
  ( (ListLongMap!10570 (toList!5300 List!17606)) )
))
(declare-fun lt!400299 () ListLongMap!10569)

(declare-fun lt!400301 () ListLongMap!10569)

(assert (=> b!884033 (= lt!400299 lt!400301)))

(declare-fun lt!400303 () ListLongMap!10569)

(declare-fun lt!400307 () tuple2!11800)

(declare-fun +!2569 (ListLongMap!10569 tuple2!11800) ListLongMap!10569)

(assert (=> b!884033 (= lt!400301 (+!2569 lt!400303 lt!400307))))

(declare-datatypes ((ValueCell!8413 0))(
  ( (ValueCellFull!8413 (v!11369 V!28653)) (EmptyCell!8413) )
))
(declare-datatypes ((array!51538 0))(
  ( (array!51539 (arr!24788 (Array (_ BitVec 32) ValueCell!8413)) (size!25228 (_ BitVec 32))) )
))
(declare-fun lt!400296 () array!51538)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28653)

(declare-fun zeroValue!654 () V!28653)

(declare-fun getCurrentListMapNoExtraKeys!3259 (array!51536 array!51538 (_ BitVec 32) (_ BitVec 32) V!28653 V!28653 (_ BitVec 32) Int) ListLongMap!10569)

(assert (=> b!884033 (= lt!400299 (getCurrentListMapNoExtraKeys!3259 _keys!868 lt!400296 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!28653)

(assert (=> b!884033 (= lt!400307 (tuple2!11801 k!854 v!557))))

(declare-fun _values!688 () array!51538)

(assert (=> b!884033 (= lt!400303 (getCurrentListMapNoExtraKeys!3259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30181 0))(
  ( (Unit!30182) )
))
(declare-fun lt!400306 () Unit!30181)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!752 (array!51536 array!51538 (_ BitVec 32) (_ BitVec 32) V!28653 V!28653 (_ BitVec 32) (_ BitVec 64) V!28653 (_ BitVec 32) Int) Unit!30181)

(assert (=> b!884033 (= lt!400306 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884034 () Bool)

(declare-fun res!600580 () Bool)

(declare-fun e!491972 () Bool)

(assert (=> b!884034 (=> (not res!600580) (not e!491972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51536 (_ BitVec 32)) Bool)

(assert (=> b!884034 (= res!600580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884035 () Bool)

(declare-fun e!491974 () Bool)

(declare-fun tp_is_empty!17705 () Bool)

(assert (=> b!884035 (= e!491974 tp_is_empty!17705)))

(declare-fun b!884036 () Bool)

(declare-fun e!491977 () Bool)

(assert (=> b!884036 (= e!491977 (bvslt i!612 (size!25228 _values!688)))))

(declare-fun lt!400295 () ListLongMap!10569)

(declare-fun lt!400305 () tuple2!11800)

(assert (=> b!884036 (= lt!400295 (+!2569 (+!2569 lt!400303 lt!400305) lt!400307))))

(declare-fun lt!400310 () V!28653)

(declare-fun lt!400308 () Unit!30181)

(declare-fun addCommutativeForDiffKeys!552 (ListLongMap!10569 (_ BitVec 64) V!28653 (_ BitVec 64) V!28653) Unit!30181)

(assert (=> b!884036 (= lt!400308 (addCommutativeForDiffKeys!552 lt!400303 k!854 v!557 (select (arr!24787 _keys!868) from!1053) lt!400310))))

(declare-fun b!884037 () Bool)

(declare-fun res!600582 () Bool)

(assert (=> b!884037 (=> (not res!600582) (not e!491972))))

(assert (=> b!884037 (= res!600582 (and (= (select (arr!24787 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!884038 () Bool)

(declare-fun res!600572 () Bool)

(assert (=> b!884038 (=> (not res!600572) (not e!491972))))

(assert (=> b!884038 (= res!600572 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25227 _keys!868))))))

(declare-fun b!884039 () Bool)

(declare-fun res!600576 () Bool)

(assert (=> b!884039 (=> (not res!600576) (not e!491972))))

(declare-datatypes ((List!17607 0))(
  ( (Nil!17604) (Cons!17603 (h!18734 (_ BitVec 64)) (t!24870 List!17607)) )
))
(declare-fun arrayNoDuplicates!0 (array!51536 (_ BitVec 32) List!17607) Bool)

(assert (=> b!884039 (= res!600576 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17604))))

(declare-fun b!884040 () Bool)

(declare-fun res!600574 () Bool)

(assert (=> b!884040 (=> (not res!600574) (not e!491972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884040 (= res!600574 (validMask!0 mask!1196))))

(declare-fun b!884041 () Bool)

(declare-fun e!491978 () Bool)

(declare-fun e!491976 () Bool)

(declare-fun mapRes!28194 () Bool)

(assert (=> b!884041 (= e!491978 (and e!491976 mapRes!28194))))

(declare-fun condMapEmpty!28194 () Bool)

(declare-fun mapDefault!28194 () ValueCell!8413)

