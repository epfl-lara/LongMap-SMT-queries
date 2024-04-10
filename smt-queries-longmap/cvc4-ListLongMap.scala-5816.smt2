; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75002 () Bool)

(assert start!75002)

(declare-fun b_free!15491 () Bool)

(declare-fun b_next!15491 () Bool)

(assert (=> start!75002 (= b_free!15491 (not b_next!15491))))

(declare-fun tp!54178 () Bool)

(declare-fun b_and!25681 () Bool)

(assert (=> start!75002 (= tp!54178 b_and!25681)))

(declare-fun b!884827 () Bool)

(declare-fun res!601098 () Bool)

(declare-fun e!492414 () Bool)

(assert (=> b!884827 (=> (not res!601098) (not e!492414))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28693 0))(
  ( (V!28694 (val!8915 Int)) )
))
(declare-datatypes ((ValueCell!8428 0))(
  ( (ValueCellFull!8428 (v!11388 V!28693)) (EmptyCell!8428) )
))
(declare-datatypes ((array!51594 0))(
  ( (array!51595 (arr!24815 (Array (_ BitVec 32) ValueCell!8428)) (size!25255 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51594)

(declare-datatypes ((array!51596 0))(
  ( (array!51597 (arr!24816 (Array (_ BitVec 32) (_ BitVec 64))) (size!25256 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51596)

(assert (=> b!884827 (= res!601098 (and (= (size!25255 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25256 _keys!868) (size!25255 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884828 () Bool)

(declare-fun res!601104 () Bool)

(assert (=> b!884828 (=> (not res!601104) (not e!492414))))

(declare-datatypes ((List!17630 0))(
  ( (Nil!17627) (Cons!17626 (h!18757 (_ BitVec 64)) (t!24905 List!17630)) )
))
(declare-fun arrayNoDuplicates!0 (array!51596 (_ BitVec 32) List!17630) Bool)

(assert (=> b!884828 (= res!601104 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17627))))

(declare-fun b!884829 () Bool)

(declare-datatypes ((tuple2!11824 0))(
  ( (tuple2!11825 (_1!5923 (_ BitVec 64)) (_2!5923 V!28693)) )
))
(declare-datatypes ((List!17631 0))(
  ( (Nil!17628) (Cons!17627 (h!18758 tuple2!11824) (t!24906 List!17631)) )
))
(declare-datatypes ((ListLongMap!10593 0))(
  ( (ListLongMap!10594 (toList!5312 List!17631)) )
))
(declare-fun lt!400809 () ListLongMap!10593)

(declare-fun e!492410 () Bool)

(declare-fun lt!400808 () tuple2!11824)

(declare-fun lt!400805 () ListLongMap!10593)

(declare-fun +!2580 (ListLongMap!10593 tuple2!11824) ListLongMap!10593)

(assert (=> b!884829 (= e!492410 (= lt!400809 (+!2580 lt!400805 lt!400808)))))

(declare-fun mapIsEmpty!28242 () Bool)

(declare-fun mapRes!28242 () Bool)

(assert (=> mapIsEmpty!28242 mapRes!28242))

(declare-fun mapNonEmpty!28242 () Bool)

(declare-fun tp!54179 () Bool)

(declare-fun e!492411 () Bool)

(assert (=> mapNonEmpty!28242 (= mapRes!28242 (and tp!54179 e!492411))))

(declare-fun mapRest!28242 () (Array (_ BitVec 32) ValueCell!8428))

(declare-fun mapValue!28242 () ValueCell!8428)

(declare-fun mapKey!28242 () (_ BitVec 32))

(assert (=> mapNonEmpty!28242 (= (arr!24815 _values!688) (store mapRest!28242 mapKey!28242 mapValue!28242))))

(declare-fun b!884830 () Bool)

(declare-fun res!601101 () Bool)

(assert (=> b!884830 (=> (not res!601101) (not e!492414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51596 (_ BitVec 32)) Bool)

(assert (=> b!884830 (= res!601101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884831 () Bool)

(declare-fun tp_is_empty!17735 () Bool)

(assert (=> b!884831 (= e!492411 tp_is_empty!17735)))

(declare-fun b!884832 () Bool)

(declare-fun res!601100 () Bool)

(assert (=> b!884832 (=> (not res!601100) (not e!492414))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884832 (= res!601100 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25256 _keys!868))))))

(declare-fun b!884833 () Bool)

(declare-fun e!492415 () Bool)

(assert (=> b!884833 (= e!492415 (not e!492410))))

(declare-fun res!601103 () Bool)

(assert (=> b!884833 (=> res!601103 e!492410)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884833 (= res!601103 (validKeyInArray!0 (select (arr!24816 _keys!868) from!1053)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!400807 () array!51594)

(declare-fun minValue!654 () V!28693)

(declare-fun zeroValue!654 () V!28693)

(declare-fun getCurrentListMapNoExtraKeys!3270 (array!51596 array!51594 (_ BitVec 32) (_ BitVec 32) V!28693 V!28693 (_ BitVec 32) Int) ListLongMap!10593)

(assert (=> b!884833 (= (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!400807 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2580 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400808))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!28693)

(assert (=> b!884833 (= lt!400808 (tuple2!11825 k!854 v!557))))

(declare-datatypes ((Unit!30214 0))(
  ( (Unit!30215) )
))
(declare-fun lt!400806 () Unit!30214)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!762 (array!51596 array!51594 (_ BitVec 32) (_ BitVec 32) V!28693 V!28693 (_ BitVec 32) (_ BitVec 64) V!28693 (_ BitVec 32) Int) Unit!30214)

(assert (=> b!884833 (= lt!400806 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!762 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!601102 () Bool)

(assert (=> start!75002 (=> (not res!601102) (not e!492414))))

(assert (=> start!75002 (= res!601102 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25256 _keys!868))))))

(assert (=> start!75002 e!492414))

(assert (=> start!75002 tp_is_empty!17735))

(assert (=> start!75002 true))

(assert (=> start!75002 tp!54178))

(declare-fun array_inv!19538 (array!51596) Bool)

(assert (=> start!75002 (array_inv!19538 _keys!868)))

(declare-fun e!492413 () Bool)

(declare-fun array_inv!19539 (array!51594) Bool)

(assert (=> start!75002 (and (array_inv!19539 _values!688) e!492413)))

(declare-fun b!884834 () Bool)

(assert (=> b!884834 (= e!492414 e!492415)))

(declare-fun res!601099 () Bool)

(assert (=> b!884834 (=> (not res!601099) (not e!492415))))

(assert (=> b!884834 (= res!601099 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884834 (= lt!400809 (getCurrentListMapNoExtraKeys!3270 _keys!868 lt!400807 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884834 (= lt!400807 (array!51595 (store (arr!24815 _values!688) i!612 (ValueCellFull!8428 v!557)) (size!25255 _values!688)))))

(assert (=> b!884834 (= lt!400805 (getCurrentListMapNoExtraKeys!3270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884835 () Bool)

(declare-fun e!492416 () Bool)

(assert (=> b!884835 (= e!492413 (and e!492416 mapRes!28242))))

(declare-fun condMapEmpty!28242 () Bool)

(declare-fun mapDefault!28242 () ValueCell!8428)

