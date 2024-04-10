; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40226 () Bool)

(assert start!40226)

(declare-fun b_free!10493 () Bool)

(declare-fun b_next!10493 () Bool)

(assert (=> start!40226 (= b_free!10493 (not b_next!10493))))

(declare-fun tp!37008 () Bool)

(declare-fun b_and!18461 () Bool)

(assert (=> start!40226 (= tp!37008 b_and!18461)))

(declare-fun b!441188 () Bool)

(declare-fun res!261110 () Bool)

(declare-fun e!259819 () Bool)

(assert (=> b!441188 (=> (not res!261110) (not e!259819))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441188 (= res!261110 (validKeyInArray!0 k!794))))

(declare-fun b!441189 () Bool)

(declare-fun e!259820 () Bool)

(assert (=> b!441189 (= e!259820 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16631 0))(
  ( (V!16632 (val!5867 Int)) )
))
(declare-datatypes ((ValueCell!5479 0))(
  ( (ValueCellFull!5479 (v!8114 V!16631)) (EmptyCell!5479) )
))
(declare-datatypes ((array!27103 0))(
  ( (array!27104 (arr!13001 (Array (_ BitVec 32) ValueCell!5479)) (size!13353 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27103)

(declare-fun zeroValue!515 () V!16631)

(declare-datatypes ((array!27105 0))(
  ( (array!27106 (arr!13002 (Array (_ BitVec 32) (_ BitVec 64))) (size!13354 (_ BitVec 32))) )
))
(declare-fun lt!202817 () array!27105)

(declare-fun v!412 () V!16631)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27105)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202819 () array!27103)

(declare-fun minValue!515 () V!16631)

(declare-datatypes ((tuple2!7806 0))(
  ( (tuple2!7807 (_1!3914 (_ BitVec 64)) (_2!3914 V!16631)) )
))
(declare-datatypes ((List!7801 0))(
  ( (Nil!7798) (Cons!7797 (h!8653 tuple2!7806) (t!13557 List!7801)) )
))
(declare-datatypes ((ListLongMap!6719 0))(
  ( (ListLongMap!6720 (toList!3375 List!7801)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1564 (array!27105 array!27103 (_ BitVec 32) (_ BitVec 32) V!16631 V!16631 (_ BitVec 32) Int) ListLongMap!6719)

(declare-fun +!1511 (ListLongMap!6719 tuple2!7806) ListLongMap!6719)

(assert (=> b!441189 (= (getCurrentListMapNoExtraKeys!1564 lt!202817 lt!202819 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1511 (getCurrentListMapNoExtraKeys!1564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7807 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13126 0))(
  ( (Unit!13127) )
))
(declare-fun lt!202816 () Unit!13126)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!680 (array!27105 array!27103 (_ BitVec 32) (_ BitVec 32) V!16631 V!16631 (_ BitVec 32) (_ BitVec 64) V!16631 (_ BitVec 32) Int) Unit!13126)

(assert (=> b!441189 (= lt!202816 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441190 () Bool)

(declare-fun res!261117 () Bool)

(assert (=> b!441190 (=> (not res!261117) (not e!259819))))

(declare-fun arrayContainsKey!0 (array!27105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441190 (= res!261117 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441191 () Bool)

(declare-fun e!259822 () Bool)

(assert (=> b!441191 (= e!259819 e!259822)))

(declare-fun res!261116 () Bool)

(assert (=> b!441191 (=> (not res!261116) (not e!259822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27105 (_ BitVec 32)) Bool)

(assert (=> b!441191 (= res!261116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202817 mask!1025))))

(assert (=> b!441191 (= lt!202817 (array!27106 (store (arr!13002 _keys!709) i!563 k!794) (size!13354 _keys!709)))))

(declare-fun b!441192 () Bool)

(declare-fun res!261111 () Bool)

(assert (=> b!441192 (=> (not res!261111) (not e!259819))))

(assert (=> b!441192 (= res!261111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441193 () Bool)

(declare-fun res!261105 () Bool)

(assert (=> b!441193 (=> (not res!261105) (not e!259819))))

(assert (=> b!441193 (= res!261105 (or (= (select (arr!13002 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13002 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441194 () Bool)

(declare-fun res!261115 () Bool)

(assert (=> b!441194 (=> (not res!261115) (not e!259819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441194 (= res!261115 (validMask!0 mask!1025))))

(declare-fun b!441196 () Bool)

(declare-fun res!261109 () Bool)

(assert (=> b!441196 (=> (not res!261109) (not e!259819))))

(assert (=> b!441196 (= res!261109 (and (= (size!13353 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13354 _keys!709) (size!13353 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19089 () Bool)

(declare-fun mapRes!19089 () Bool)

(declare-fun tp!37007 () Bool)

(declare-fun e!259821 () Bool)

(assert (=> mapNonEmpty!19089 (= mapRes!19089 (and tp!37007 e!259821))))

(declare-fun mapKey!19089 () (_ BitVec 32))

(declare-fun mapRest!19089 () (Array (_ BitVec 32) ValueCell!5479))

(declare-fun mapValue!19089 () ValueCell!5479)

(assert (=> mapNonEmpty!19089 (= (arr!13001 _values!549) (store mapRest!19089 mapKey!19089 mapValue!19089))))

(declare-fun b!441197 () Bool)

(declare-fun res!261113 () Bool)

(assert (=> b!441197 (=> (not res!261113) (not e!259819))))

(declare-datatypes ((List!7802 0))(
  ( (Nil!7799) (Cons!7798 (h!8654 (_ BitVec 64)) (t!13558 List!7802)) )
))
(declare-fun arrayNoDuplicates!0 (array!27105 (_ BitVec 32) List!7802) Bool)

(assert (=> b!441197 (= res!261113 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun b!441198 () Bool)

(declare-fun res!261107 () Bool)

(assert (=> b!441198 (=> (not res!261107) (not e!259822))))

(assert (=> b!441198 (= res!261107 (bvsle from!863 i!563))))

(declare-fun b!441199 () Bool)

(declare-fun e!259824 () Bool)

(declare-fun tp_is_empty!11645 () Bool)

(assert (=> b!441199 (= e!259824 tp_is_empty!11645)))

(declare-fun b!441200 () Bool)

(declare-fun res!261106 () Bool)

(assert (=> b!441200 (=> (not res!261106) (not e!259822))))

(assert (=> b!441200 (= res!261106 (arrayNoDuplicates!0 lt!202817 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun b!441201 () Bool)

(declare-fun res!261112 () Bool)

(assert (=> b!441201 (=> (not res!261112) (not e!259819))))

(assert (=> b!441201 (= res!261112 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13354 _keys!709))))))

(declare-fun b!441202 () Bool)

(assert (=> b!441202 (= e!259822 e!259820)))

(declare-fun res!261108 () Bool)

(assert (=> b!441202 (=> (not res!261108) (not e!259820))))

(assert (=> b!441202 (= res!261108 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202818 () ListLongMap!6719)

(assert (=> b!441202 (= lt!202818 (getCurrentListMapNoExtraKeys!1564 lt!202817 lt!202819 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441202 (= lt!202819 (array!27104 (store (arr!13001 _values!549) i!563 (ValueCellFull!5479 v!412)) (size!13353 _values!549)))))

(declare-fun lt!202820 () ListLongMap!6719)

(assert (=> b!441202 (= lt!202820 (getCurrentListMapNoExtraKeys!1564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441203 () Bool)

(assert (=> b!441203 (= e!259821 tp_is_empty!11645)))

(declare-fun mapIsEmpty!19089 () Bool)

(assert (=> mapIsEmpty!19089 mapRes!19089))

(declare-fun b!441195 () Bool)

(declare-fun e!259823 () Bool)

(assert (=> b!441195 (= e!259823 (and e!259824 mapRes!19089))))

(declare-fun condMapEmpty!19089 () Bool)

(declare-fun mapDefault!19089 () ValueCell!5479)

