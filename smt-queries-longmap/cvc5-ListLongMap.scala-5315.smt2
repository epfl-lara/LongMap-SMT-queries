; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71130 () Bool)

(assert start!71130)

(declare-fun b_free!13297 () Bool)

(declare-fun b_next!13297 () Bool)

(assert (=> start!71130 (= b_free!13297 (not b_next!13297))))

(declare-fun tp!46650 () Bool)

(declare-fun b_and!22223 () Bool)

(assert (=> start!71130 (= tp!46650 b_and!22223)))

(declare-fun mapNonEmpty!24136 () Bool)

(declare-fun mapRes!24136 () Bool)

(declare-fun tp!46651 () Bool)

(declare-fun e!459955 () Bool)

(assert (=> mapNonEmpty!24136 (= mapRes!24136 (and tp!46651 e!459955))))

(declare-datatypes ((V!25011 0))(
  ( (V!25012 (val!7551 Int)) )
))
(declare-datatypes ((ValueCell!7088 0))(
  ( (ValueCellFull!7088 (v!9985 V!25011)) (EmptyCell!7088) )
))
(declare-datatypes ((array!46198 0))(
  ( (array!46199 (arr!22144 (Array (_ BitVec 32) ValueCell!7088)) (size!22565 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46198)

(declare-fun mapValue!24136 () ValueCell!7088)

(declare-fun mapKey!24136 () (_ BitVec 32))

(declare-fun mapRest!24136 () (Array (_ BitVec 32) ValueCell!7088))

(assert (=> mapNonEmpty!24136 (= (arr!22144 _values!788) (store mapRest!24136 mapKey!24136 mapValue!24136))))

(declare-fun res!563137 () Bool)

(declare-fun e!459954 () Bool)

(assert (=> start!71130 (=> (not res!563137) (not e!459954))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71130 (= res!563137 (validMask!0 mask!1312))))

(assert (=> start!71130 e!459954))

(declare-fun tp_is_empty!15007 () Bool)

(assert (=> start!71130 tp_is_empty!15007))

(declare-datatypes ((array!46200 0))(
  ( (array!46201 (arr!22145 (Array (_ BitVec 32) (_ BitVec 64))) (size!22566 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46200)

(declare-fun array_inv!17653 (array!46200) Bool)

(assert (=> start!71130 (array_inv!17653 _keys!976)))

(assert (=> start!71130 true))

(declare-fun e!459951 () Bool)

(declare-fun array_inv!17654 (array!46198) Bool)

(assert (=> start!71130 (and (array_inv!17654 _values!788) e!459951)))

(assert (=> start!71130 tp!46650))

(declare-fun b!826124 () Bool)

(declare-fun res!563139 () Bool)

(assert (=> b!826124 (=> (not res!563139) (not e!459954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46200 (_ BitVec 32)) Bool)

(assert (=> b!826124 (= res!563139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826125 () Bool)

(declare-fun e!459953 () Bool)

(assert (=> b!826125 (= e!459954 (not e!459953))))

(declare-fun res!563142 () Bool)

(assert (=> b!826125 (=> res!563142 e!459953)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826125 (= res!563142 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10002 0))(
  ( (tuple2!10003 (_1!5012 (_ BitVec 64)) (_2!5012 V!25011)) )
))
(declare-datatypes ((List!15802 0))(
  ( (Nil!15799) (Cons!15798 (h!16927 tuple2!10002) (t!22149 List!15802)) )
))
(declare-datatypes ((ListLongMap!8825 0))(
  ( (ListLongMap!8826 (toList!4428 List!15802)) )
))
(declare-fun lt!373527 () ListLongMap!8825)

(declare-fun lt!373523 () ListLongMap!8825)

(assert (=> b!826125 (= lt!373527 lt!373523)))

(declare-fun zeroValueBefore!34 () V!25011)

(declare-fun zeroValueAfter!34 () V!25011)

(declare-fun minValue!754 () V!25011)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28319 0))(
  ( (Unit!28320) )
))
(declare-fun lt!373524 () Unit!28319)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!547 (array!46200 array!46198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 V!25011 V!25011 (_ BitVec 32) Int) Unit!28319)

(assert (=> b!826125 (= lt!373524 (lemmaNoChangeToArrayThenSameMapNoExtras!547 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2437 (array!46200 array!46198 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8825)

(assert (=> b!826125 (= lt!373523 (getCurrentListMapNoExtraKeys!2437 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826125 (= lt!373527 (getCurrentListMapNoExtraKeys!2437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826126 () Bool)

(declare-fun lt!373531 () ListLongMap!8825)

(declare-fun lt!373521 () tuple2!10002)

(declare-fun e!459948 () Bool)

(declare-fun +!1935 (ListLongMap!8825 tuple2!10002) ListLongMap!8825)

(assert (=> b!826126 (= e!459948 (= lt!373531 (+!1935 (+!1935 lt!373523 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373521)))))

(declare-fun b!826127 () Bool)

(assert (=> b!826127 (= e!459953 true)))

(declare-fun lt!373526 () ListLongMap!8825)

(declare-fun lt!373533 () tuple2!10002)

(assert (=> b!826127 (= lt!373526 (+!1935 (+!1935 lt!373527 lt!373533) lt!373521))))

(declare-fun lt!373525 () ListLongMap!8825)

(declare-fun lt!373530 () ListLongMap!8825)

(assert (=> b!826127 (and (= lt!373525 lt!373530) (= lt!373531 lt!373530) (= lt!373531 lt!373525))))

(declare-fun lt!373528 () ListLongMap!8825)

(assert (=> b!826127 (= lt!373530 (+!1935 lt!373528 lt!373533))))

(declare-fun lt!373529 () ListLongMap!8825)

(assert (=> b!826127 (= lt!373525 (+!1935 lt!373529 lt!373533))))

(declare-fun lt!373532 () Unit!28319)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!218 (ListLongMap!8825 (_ BitVec 64) V!25011 V!25011) Unit!28319)

(assert (=> b!826127 (= lt!373532 (addSameAsAddTwiceSameKeyDiffValues!218 lt!373529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459952 () Bool)

(assert (=> b!826127 e!459952))

(declare-fun res!563136 () Bool)

(assert (=> b!826127 (=> (not res!563136) (not e!459952))))

(declare-fun lt!373522 () ListLongMap!8825)

(assert (=> b!826127 (= res!563136 (= lt!373522 lt!373528))))

(declare-fun lt!373534 () tuple2!10002)

(assert (=> b!826127 (= lt!373528 (+!1935 lt!373529 lt!373534))))

(assert (=> b!826127 (= lt!373529 (+!1935 lt!373527 lt!373521))))

(assert (=> b!826127 (= lt!373533 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826127 e!459948))

(declare-fun res!563141 () Bool)

(assert (=> b!826127 (=> (not res!563141) (not e!459948))))

(assert (=> b!826127 (= res!563141 (= lt!373522 (+!1935 (+!1935 lt!373527 lt!373534) lt!373521)))))

(assert (=> b!826127 (= lt!373521 (tuple2!10003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826127 (= lt!373534 (tuple2!10003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2558 (array!46200 array!46198 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8825)

(assert (=> b!826127 (= lt!373531 (getCurrentListMap!2558 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826127 (= lt!373522 (getCurrentListMap!2558 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24136 () Bool)

(assert (=> mapIsEmpty!24136 mapRes!24136))

(declare-fun b!826128 () Bool)

(declare-fun e!459950 () Bool)

(assert (=> b!826128 (= e!459950 tp_is_empty!15007)))

(declare-fun b!826129 () Bool)

(assert (=> b!826129 (= e!459951 (and e!459950 mapRes!24136))))

(declare-fun condMapEmpty!24136 () Bool)

(declare-fun mapDefault!24136 () ValueCell!7088)

