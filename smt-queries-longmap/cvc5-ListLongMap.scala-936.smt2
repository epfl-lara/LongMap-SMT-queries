; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20712 () Bool)

(assert start!20712)

(declare-fun b_free!5371 () Bool)

(declare-fun b_next!5371 () Bool)

(assert (=> start!20712 (= b_free!5371 (not b_next!5371))))

(declare-fun tp!19144 () Bool)

(declare-fun b_and!12117 () Bool)

(assert (=> start!20712 (= tp!19144 b_and!12117)))

(declare-fun b!207176 () Bool)

(declare-fun res!100525 () Bool)

(declare-fun e!135296 () Bool)

(assert (=> b!207176 (=> (not res!100525) (not e!135296))))

(declare-datatypes ((array!9663 0))(
  ( (array!9664 (arr!4582 (Array (_ BitVec 32) (_ BitVec 64))) (size!4907 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9663)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6617 0))(
  ( (V!6618 (val!2658 Int)) )
))
(declare-datatypes ((ValueCell!2270 0))(
  ( (ValueCellFull!2270 (v!4628 V!6617)) (EmptyCell!2270) )
))
(declare-datatypes ((array!9665 0))(
  ( (array!9666 (arr!4583 (Array (_ BitVec 32) ValueCell!2270)) (size!4908 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9665)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207176 (= res!100525 (and (= (size!4908 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4907 _keys!825) (size!4908 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100523 () Bool)

(assert (=> start!20712 (=> (not res!100523) (not e!135296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20712 (= res!100523 (validMask!0 mask!1149))))

(assert (=> start!20712 e!135296))

(declare-fun e!135295 () Bool)

(declare-fun array_inv!3033 (array!9665) Bool)

(assert (=> start!20712 (and (array_inv!3033 _values!649) e!135295)))

(assert (=> start!20712 true))

(declare-fun tp_is_empty!5227 () Bool)

(assert (=> start!20712 tp_is_empty!5227))

(declare-fun array_inv!3034 (array!9663) Bool)

(assert (=> start!20712 (array_inv!3034 _keys!825)))

(assert (=> start!20712 tp!19144))

(declare-fun mapNonEmpty!8909 () Bool)

(declare-fun mapRes!8909 () Bool)

(declare-fun tp!19145 () Bool)

(declare-fun e!135299 () Bool)

(assert (=> mapNonEmpty!8909 (= mapRes!8909 (and tp!19145 e!135299))))

(declare-fun mapRest!8909 () (Array (_ BitVec 32) ValueCell!2270))

(declare-fun mapValue!8909 () ValueCell!2270)

(declare-fun mapKey!8909 () (_ BitVec 32))

(assert (=> mapNonEmpty!8909 (= (arr!4583 _values!649) (store mapRest!8909 mapKey!8909 mapValue!8909))))

(declare-fun b!207177 () Bool)

(declare-fun res!100524 () Bool)

(assert (=> b!207177 (=> (not res!100524) (not e!135296))))

(declare-datatypes ((List!2927 0))(
  ( (Nil!2924) (Cons!2923 (h!3565 (_ BitVec 64)) (t!7858 List!2927)) )
))
(declare-fun arrayNoDuplicates!0 (array!9663 (_ BitVec 32) List!2927) Bool)

(assert (=> b!207177 (= res!100524 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2924))))

(declare-fun b!207178 () Bool)

(declare-fun res!100528 () Bool)

(assert (=> b!207178 (=> (not res!100528) (not e!135296))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207178 (= res!100528 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4907 _keys!825))))))

(declare-fun mapIsEmpty!8909 () Bool)

(assert (=> mapIsEmpty!8909 mapRes!8909))

(declare-fun b!207179 () Bool)

(declare-datatypes ((tuple2!4036 0))(
  ( (tuple2!4037 (_1!2029 (_ BitVec 64)) (_2!2029 V!6617)) )
))
(declare-datatypes ((List!2928 0))(
  ( (Nil!2925) (Cons!2924 (h!3566 tuple2!4036) (t!7859 List!2928)) )
))
(declare-datatypes ((ListLongMap!2949 0))(
  ( (ListLongMap!2950 (toList!1490 List!2928)) )
))
(declare-fun lt!106088 () ListLongMap!2949)

(declare-fun lt!106089 () Bool)

(declare-fun lt!106093 () ListLongMap!2949)

(assert (=> b!207179 (= e!135296 (not (or (and (not lt!106089) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106089) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106089) (not (= lt!106093 lt!106088)) (bvsle #b00000000000000000000000000000000 (size!4907 _keys!825)))))))

(assert (=> b!207179 (= lt!106089 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!106090 () ListLongMap!2949)

(declare-fun zeroValue!615 () V!6617)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6617)

(declare-fun getCurrentListMap!1057 (array!9663 array!9665 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2949)

(assert (=> b!207179 (= lt!106090 (getCurrentListMap!1057 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106094 () array!9665)

(assert (=> b!207179 (= lt!106093 (getCurrentListMap!1057 _keys!825 lt!106094 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106092 () ListLongMap!2949)

(assert (=> b!207179 (and (= lt!106088 lt!106092) (= lt!106092 lt!106088))))

(declare-fun v!520 () V!6617)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!106095 () ListLongMap!2949)

(declare-fun +!517 (ListLongMap!2949 tuple2!4036) ListLongMap!2949)

(assert (=> b!207179 (= lt!106092 (+!517 lt!106095 (tuple2!4037 k!843 v!520)))))

(declare-datatypes ((Unit!6322 0))(
  ( (Unit!6323) )
))
(declare-fun lt!106091 () Unit!6322)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 (array!9663 array!9665 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) (_ BitVec 64) V!6617 (_ BitVec 32) Int) Unit!6322)

(assert (=> b!207179 (= lt!106091 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!431 (array!9663 array!9665 (_ BitVec 32) (_ BitVec 32) V!6617 V!6617 (_ BitVec 32) Int) ListLongMap!2949)

(assert (=> b!207179 (= lt!106088 (getCurrentListMapNoExtraKeys!431 _keys!825 lt!106094 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207179 (= lt!106094 (array!9666 (store (arr!4583 _values!649) i!601 (ValueCellFull!2270 v!520)) (size!4908 _values!649)))))

(assert (=> b!207179 (= lt!106095 (getCurrentListMapNoExtraKeys!431 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207180 () Bool)

(declare-fun res!100527 () Bool)

(assert (=> b!207180 (=> (not res!100527) (not e!135296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9663 (_ BitVec 32)) Bool)

(assert (=> b!207180 (= res!100527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207181 () Bool)

(declare-fun res!100526 () Bool)

(assert (=> b!207181 (=> (not res!100526) (not e!135296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207181 (= res!100526 (validKeyInArray!0 k!843))))

(declare-fun b!207182 () Bool)

(declare-fun e!135298 () Bool)

(assert (=> b!207182 (= e!135295 (and e!135298 mapRes!8909))))

(declare-fun condMapEmpty!8909 () Bool)

(declare-fun mapDefault!8909 () ValueCell!2270)

