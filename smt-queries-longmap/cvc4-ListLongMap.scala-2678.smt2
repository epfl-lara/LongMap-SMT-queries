; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39890 () Bool)

(assert start!39890)

(declare-fun b_free!10157 () Bool)

(declare-fun b_next!10157 () Bool)

(assert (=> start!39890 (= b_free!10157 (not b_next!10157))))

(declare-fun tp!36000 () Bool)

(declare-fun b_and!17973 () Bool)

(assert (=> start!39890 (= tp!36000 b_and!17973)))

(declare-fun b!432068 () Bool)

(declare-datatypes ((Unit!12751 0))(
  ( (Unit!12752) )
))
(declare-fun e!255614 () Unit!12751)

(declare-fun Unit!12753 () Unit!12751)

(assert (=> b!432068 (= e!255614 Unit!12753)))

(declare-fun lt!198047 () Unit!12751)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26451 0))(
  ( (array!26452 (arr!12675 (Array (_ BitVec 32) (_ BitVec 64))) (size!13027 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26451)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12751)

(assert (=> b!432068 (= lt!198047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432068 false))

(declare-fun b!432070 () Bool)

(declare-fun e!255619 () Bool)

(declare-fun e!255616 () Bool)

(assert (=> b!432070 (= e!255619 (not e!255616))))

(declare-fun res!254115 () Bool)

(assert (=> b!432070 (=> res!254115 e!255616)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432070 (= res!254115 (not (validKeyInArray!0 (select (arr!12675 _keys!709) from!863))))))

(declare-datatypes ((V!16183 0))(
  ( (V!16184 (val!5699 Int)) )
))
(declare-datatypes ((tuple2!7518 0))(
  ( (tuple2!7519 (_1!3770 (_ BitVec 64)) (_2!3770 V!16183)) )
))
(declare-datatypes ((List!7533 0))(
  ( (Nil!7530) (Cons!7529 (h!8385 tuple2!7518) (t!13139 List!7533)) )
))
(declare-datatypes ((ListLongMap!6431 0))(
  ( (ListLongMap!6432 (toList!3231 List!7533)) )
))
(declare-fun lt!198042 () ListLongMap!6431)

(declare-fun lt!198049 () ListLongMap!6431)

(assert (=> b!432070 (= lt!198042 lt!198049)))

(declare-fun lt!198046 () ListLongMap!6431)

(declare-fun lt!198040 () tuple2!7518)

(declare-fun +!1379 (ListLongMap!6431 tuple2!7518) ListLongMap!6431)

(assert (=> b!432070 (= lt!198049 (+!1379 lt!198046 lt!198040))))

(declare-datatypes ((ValueCell!5311 0))(
  ( (ValueCellFull!5311 (v!7946 V!16183)) (EmptyCell!5311) )
))
(declare-datatypes ((array!26453 0))(
  ( (array!26454 (arr!12676 (Array (_ BitVec 32) ValueCell!5311)) (size!13028 (_ BitVec 32))) )
))
(declare-fun lt!198039 () array!26453)

(declare-fun minValue!515 () V!16183)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198038 () array!26451)

(declare-fun zeroValue!515 () V!16183)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1429 (array!26451 array!26453 (_ BitVec 32) (_ BitVec 32) V!16183 V!16183 (_ BitVec 32) Int) ListLongMap!6431)

(assert (=> b!432070 (= lt!198042 (getCurrentListMapNoExtraKeys!1429 lt!198038 lt!198039 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16183)

(assert (=> b!432070 (= lt!198040 (tuple2!7519 k!794 v!412))))

(declare-fun _values!549 () array!26453)

(assert (=> b!432070 (= lt!198046 (getCurrentListMapNoExtraKeys!1429 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198048 () Unit!12751)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!564 (array!26451 array!26453 (_ BitVec 32) (_ BitVec 32) V!16183 V!16183 (_ BitVec 32) (_ BitVec 64) V!16183 (_ BitVec 32) Int) Unit!12751)

(assert (=> b!432070 (= lt!198048 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!564 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432071 () Bool)

(declare-fun res!254113 () Bool)

(declare-fun e!255615 () Bool)

(assert (=> b!432071 (=> (not res!254113) (not e!255615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432071 (= res!254113 (validMask!0 mask!1025))))

(declare-fun b!432072 () Bool)

(declare-fun res!254109 () Bool)

(assert (=> b!432072 (=> (not res!254109) (not e!255615))))

(declare-fun arrayContainsKey!0 (array!26451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432072 (= res!254109 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!432073 () Bool)

(declare-fun res!254101 () Bool)

(assert (=> b!432073 (=> (not res!254101) (not e!255615))))

(assert (=> b!432073 (= res!254101 (or (= (select (arr!12675 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12675 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432074 () Bool)

(declare-fun e!255618 () Bool)

(declare-fun tp_is_empty!11309 () Bool)

(assert (=> b!432074 (= e!255618 tp_is_empty!11309)))

(declare-fun b!432075 () Bool)

(declare-fun res!254103 () Bool)

(assert (=> b!432075 (=> (not res!254103) (not e!255615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26451 (_ BitVec 32)) Bool)

(assert (=> b!432075 (= res!254103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432076 () Bool)

(declare-fun e!255613 () Bool)

(assert (=> b!432076 (= e!255615 e!255613)))

(declare-fun res!254110 () Bool)

(assert (=> b!432076 (=> (not res!254110) (not e!255613))))

(assert (=> b!432076 (= res!254110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198038 mask!1025))))

(assert (=> b!432076 (= lt!198038 (array!26452 (store (arr!12675 _keys!709) i!563 k!794) (size!13027 _keys!709)))))

(declare-fun b!432077 () Bool)

(declare-fun res!254102 () Bool)

(assert (=> b!432077 (=> (not res!254102) (not e!255615))))

(declare-datatypes ((List!7534 0))(
  ( (Nil!7531) (Cons!7530 (h!8386 (_ BitVec 64)) (t!13140 List!7534)) )
))
(declare-fun arrayNoDuplicates!0 (array!26451 (_ BitVec 32) List!7534) Bool)

(assert (=> b!432077 (= res!254102 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7531))))

(declare-fun b!432078 () Bool)

(declare-fun res!254105 () Bool)

(assert (=> b!432078 (=> (not res!254105) (not e!255613))))

(assert (=> b!432078 (= res!254105 (bvsle from!863 i!563))))

(declare-fun b!432079 () Bool)

(declare-fun Unit!12754 () Unit!12751)

(assert (=> b!432079 (= e!255614 Unit!12754)))

(declare-fun mapNonEmpty!18585 () Bool)

(declare-fun mapRes!18585 () Bool)

(declare-fun tp!35999 () Bool)

(declare-fun e!255612 () Bool)

(assert (=> mapNonEmpty!18585 (= mapRes!18585 (and tp!35999 e!255612))))

(declare-fun mapRest!18585 () (Array (_ BitVec 32) ValueCell!5311))

(declare-fun mapValue!18585 () ValueCell!5311)

(declare-fun mapKey!18585 () (_ BitVec 32))

(assert (=> mapNonEmpty!18585 (= (arr!12676 _values!549) (store mapRest!18585 mapKey!18585 mapValue!18585))))

(declare-fun b!432080 () Bool)

(declare-fun e!255617 () Bool)

(assert (=> b!432080 (= e!255617 true)))

(declare-fun lt!198043 () tuple2!7518)

(declare-fun lt!198041 () ListLongMap!6431)

(assert (=> b!432080 (= lt!198041 (+!1379 (+!1379 lt!198046 lt!198043) lt!198040))))

(declare-fun lt!198045 () V!16183)

(declare-fun lt!198036 () Unit!12751)

(declare-fun addCommutativeForDiffKeys!370 (ListLongMap!6431 (_ BitVec 64) V!16183 (_ BitVec 64) V!16183) Unit!12751)

(assert (=> b!432080 (= lt!198036 (addCommutativeForDiffKeys!370 lt!198046 k!794 v!412 (select (arr!12675 _keys!709) from!863) lt!198045))))

(declare-fun b!432069 () Bool)

(declare-fun res!254114 () Bool)

(assert (=> b!432069 (=> (not res!254114) (not e!255615))))

(assert (=> b!432069 (= res!254114 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13027 _keys!709))))))

(declare-fun res!254111 () Bool)

(assert (=> start!39890 (=> (not res!254111) (not e!255615))))

(assert (=> start!39890 (= res!254111 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13027 _keys!709))))))

(assert (=> start!39890 e!255615))

(assert (=> start!39890 tp_is_empty!11309))

(assert (=> start!39890 tp!36000))

(assert (=> start!39890 true))

(declare-fun e!255620 () Bool)

(declare-fun array_inv!9222 (array!26453) Bool)

(assert (=> start!39890 (and (array_inv!9222 _values!549) e!255620)))

(declare-fun array_inv!9223 (array!26451) Bool)

(assert (=> start!39890 (array_inv!9223 _keys!709)))

(declare-fun b!432081 () Bool)

(assert (=> b!432081 (= e!255612 tp_is_empty!11309)))

(declare-fun b!432082 () Bool)

(declare-fun res!254104 () Bool)

(assert (=> b!432082 (=> (not res!254104) (not e!255613))))

(assert (=> b!432082 (= res!254104 (arrayNoDuplicates!0 lt!198038 #b00000000000000000000000000000000 Nil!7531))))

(declare-fun b!432083 () Bool)

(declare-fun res!254107 () Bool)

(assert (=> b!432083 (=> (not res!254107) (not e!255615))))

(assert (=> b!432083 (= res!254107 (and (= (size!13028 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13027 _keys!709) (size!13028 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432084 () Bool)

(assert (=> b!432084 (= e!255616 e!255617)))

(declare-fun res!254108 () Bool)

(assert (=> b!432084 (=> res!254108 e!255617)))

(assert (=> b!432084 (= res!254108 (= k!794 (select (arr!12675 _keys!709) from!863)))))

(assert (=> b!432084 (not (= (select (arr!12675 _keys!709) from!863) k!794))))

(declare-fun lt!198044 () Unit!12751)

(assert (=> b!432084 (= lt!198044 e!255614)))

(declare-fun c!55571 () Bool)

(assert (=> b!432084 (= c!55571 (= (select (arr!12675 _keys!709) from!863) k!794))))

(declare-fun lt!198037 () ListLongMap!6431)

(assert (=> b!432084 (= lt!198037 lt!198041)))

(assert (=> b!432084 (= lt!198041 (+!1379 lt!198049 lt!198043))))

(assert (=> b!432084 (= lt!198043 (tuple2!7519 (select (arr!12675 _keys!709) from!863) lt!198045))))

(declare-fun get!6299 (ValueCell!5311 V!16183) V!16183)

(declare-fun dynLambda!800 (Int (_ BitVec 64)) V!16183)

(assert (=> b!432084 (= lt!198045 (get!6299 (select (arr!12676 _values!549) from!863) (dynLambda!800 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432085 () Bool)

(assert (=> b!432085 (= e!255620 (and e!255618 mapRes!18585))))

(declare-fun condMapEmpty!18585 () Bool)

(declare-fun mapDefault!18585 () ValueCell!5311)

