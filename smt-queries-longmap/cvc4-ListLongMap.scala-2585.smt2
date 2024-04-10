; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39332 () Bool)

(assert start!39332)

(declare-fun b_free!9599 () Bool)

(declare-fun b_next!9599 () Bool)

(assert (=> start!39332 (= b_free!9599 (not b_next!9599))))

(declare-fun tp!34326 () Bool)

(declare-fun b_and!17073 () Bool)

(assert (=> start!39332 (= tp!34326 b_and!17073)))

(declare-fun mapNonEmpty!17748 () Bool)

(declare-fun mapRes!17748 () Bool)

(declare-fun tp!34325 () Bool)

(declare-fun e!248839 () Bool)

(assert (=> mapNonEmpty!17748 (= mapRes!17748 (and tp!34325 e!248839))))

(declare-datatypes ((V!15439 0))(
  ( (V!15440 (val!5420 Int)) )
))
(declare-datatypes ((ValueCell!5032 0))(
  ( (ValueCellFull!5032 (v!7667 V!15439)) (EmptyCell!5032) )
))
(declare-fun mapRest!17748 () (Array (_ BitVec 32) ValueCell!5032))

(declare-fun mapValue!17748 () ValueCell!5032)

(declare-datatypes ((array!25357 0))(
  ( (array!25358 (arr!12128 (Array (_ BitVec 32) ValueCell!5032)) (size!12480 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25357)

(declare-fun mapKey!17748 () (_ BitVec 32))

(assert (=> mapNonEmpty!17748 (= (arr!12128 _values!549) (store mapRest!17748 mapKey!17748 mapValue!17748))))

(declare-fun b!416959 () Bool)

(declare-fun res!242769 () Bool)

(declare-fun e!248841 () Bool)

(assert (=> b!416959 (=> (not res!242769) (not e!248841))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416959 (= res!242769 (validMask!0 mask!1025))))

(declare-fun b!416960 () Bool)

(declare-fun e!248837 () Bool)

(declare-fun e!248844 () Bool)

(assert (=> b!416960 (= e!248837 (not e!248844))))

(declare-fun res!242767 () Bool)

(assert (=> b!416960 (=> res!242767 e!248844)))

(declare-datatypes ((array!25359 0))(
  ( (array!25360 (arr!12129 (Array (_ BitVec 32) (_ BitVec 64))) (size!12481 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25359)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416960 (= res!242767 (validKeyInArray!0 (select (arr!12129 _keys!709) from!863)))))

(declare-fun e!248836 () Bool)

(assert (=> b!416960 e!248836))

(declare-fun c!55112 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416960 (= c!55112 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15439)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15439)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12324 0))(
  ( (Unit!12325) )
))
(declare-fun lt!190962 () Unit!12324)

(declare-fun v!412 () V!15439)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 (array!25359 array!25357 (_ BitVec 32) (_ BitVec 32) V!15439 V!15439 (_ BitVec 32) (_ BitVec 64) V!15439 (_ BitVec 32) Int) Unit!12324)

(assert (=> b!416960 (= lt!190962 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416961 () Bool)

(declare-datatypes ((tuple2!7074 0))(
  ( (tuple2!7075 (_1!3548 (_ BitVec 64)) (_2!3548 V!15439)) )
))
(declare-datatypes ((List!7092 0))(
  ( (Nil!7089) (Cons!7088 (h!7944 tuple2!7074) (t!12356 List!7092)) )
))
(declare-datatypes ((ListLongMap!5987 0))(
  ( (ListLongMap!5988 (toList!3009 List!7092)) )
))
(declare-fun call!28976 () ListLongMap!5987)

(declare-fun call!28975 () ListLongMap!5987)

(assert (=> b!416961 (= e!248836 (= call!28976 call!28975))))

(declare-fun b!416962 () Bool)

(declare-fun +!1211 (ListLongMap!5987 tuple2!7074) ListLongMap!5987)

(assert (=> b!416962 (= e!248836 (= call!28975 (+!1211 call!28976 (tuple2!7075 k!794 v!412))))))

(declare-fun mapIsEmpty!17748 () Bool)

(assert (=> mapIsEmpty!17748 mapRes!17748))

(declare-fun b!416963 () Bool)

(assert (=> b!416963 (= e!248844 true)))

(declare-fun lt!190959 () V!15439)

(declare-fun lt!190960 () ListLongMap!5987)

(declare-fun lt!190967 () tuple2!7074)

(assert (=> b!416963 (= (+!1211 lt!190960 lt!190967) (+!1211 (+!1211 lt!190960 (tuple2!7075 k!794 lt!190959)) lt!190967))))

(declare-fun lt!190963 () V!15439)

(assert (=> b!416963 (= lt!190967 (tuple2!7075 k!794 lt!190963))))

(declare-fun lt!190964 () Unit!12324)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!14 (ListLongMap!5987 (_ BitVec 64) V!15439 V!15439) Unit!12324)

(assert (=> b!416963 (= lt!190964 (addSameAsAddTwiceSameKeyDiffValues!14 lt!190960 k!794 lt!190959 lt!190963))))

(declare-fun lt!190966 () V!15439)

(declare-fun get!5998 (ValueCell!5032 V!15439) V!15439)

(assert (=> b!416963 (= lt!190959 (get!5998 (select (arr!12128 _values!549) from!863) lt!190966))))

(declare-fun lt!190957 () ListLongMap!5987)

(declare-fun lt!190958 () array!25359)

(assert (=> b!416963 (= lt!190957 (+!1211 lt!190960 (tuple2!7075 (select (arr!12129 lt!190958) from!863) lt!190963)))))

(assert (=> b!416963 (= lt!190963 (get!5998 (select (store (arr!12128 _values!549) i!563 (ValueCellFull!5032 v!412)) from!863) lt!190966))))

(declare-fun dynLambda!685 (Int (_ BitVec 64)) V!15439)

(assert (=> b!416963 (= lt!190966 (dynLambda!685 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!190961 () array!25357)

(declare-fun getCurrentListMapNoExtraKeys!1214 (array!25359 array!25357 (_ BitVec 32) (_ BitVec 32) V!15439 V!15439 (_ BitVec 32) Int) ListLongMap!5987)

(assert (=> b!416963 (= lt!190960 (getCurrentListMapNoExtraKeys!1214 lt!190958 lt!190961 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416964 () Bool)

(declare-fun res!242773 () Bool)

(assert (=> b!416964 (=> (not res!242773) (not e!248841))))

(declare-datatypes ((List!7093 0))(
  ( (Nil!7090) (Cons!7089 (h!7945 (_ BitVec 64)) (t!12357 List!7093)) )
))
(declare-fun arrayNoDuplicates!0 (array!25359 (_ BitVec 32) List!7093) Bool)

(assert (=> b!416964 (= res!242773 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7090))))

(declare-fun bm!28972 () Bool)

(assert (=> bm!28972 (= call!28976 (getCurrentListMapNoExtraKeys!1214 (ite c!55112 _keys!709 lt!190958) (ite c!55112 _values!549 lt!190961) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416965 () Bool)

(declare-fun res!242775 () Bool)

(assert (=> b!416965 (=> (not res!242775) (not e!248841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25359 (_ BitVec 32)) Bool)

(assert (=> b!416965 (= res!242775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416966 () Bool)

(declare-fun res!242765 () Bool)

(declare-fun e!248842 () Bool)

(assert (=> b!416966 (=> (not res!242765) (not e!248842))))

(assert (=> b!416966 (= res!242765 (arrayNoDuplicates!0 lt!190958 #b00000000000000000000000000000000 Nil!7090))))

(declare-fun b!416967 () Bool)

(declare-fun e!248840 () Bool)

(declare-fun e!248838 () Bool)

(assert (=> b!416967 (= e!248840 (and e!248838 mapRes!17748))))

(declare-fun condMapEmpty!17748 () Bool)

(declare-fun mapDefault!17748 () ValueCell!5032)

