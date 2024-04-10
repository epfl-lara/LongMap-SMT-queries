; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40016 () Bool)

(assert start!40016)

(declare-fun b_free!10283 () Bool)

(declare-fun b_next!10283 () Bool)

(assert (=> start!40016 (= b_free!10283 (not b_next!10283))))

(declare-fun tp!36377 () Bool)

(declare-fun b_and!18225 () Bool)

(assert (=> start!40016 (= tp!36377 b_and!18225)))

(declare-fun b!435974 () Bool)

(declare-fun res!256948 () Bool)

(declare-fun e!257504 () Bool)

(assert (=> b!435974 (=> (not res!256948) (not e!257504))))

(declare-datatypes ((array!26697 0))(
  ( (array!26698 (arr!12798 (Array (_ BitVec 32) (_ BitVec 64))) (size!13150 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26697)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16351 0))(
  ( (V!16352 (val!5762 Int)) )
))
(declare-datatypes ((ValueCell!5374 0))(
  ( (ValueCellFull!5374 (v!8009 V!16351)) (EmptyCell!5374) )
))
(declare-datatypes ((array!26699 0))(
  ( (array!26700 (arr!12799 (Array (_ BitVec 32) ValueCell!5374)) (size!13151 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26699)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!435974 (= res!256948 (and (= (size!13151 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13150 _keys!709) (size!13151 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435975 () Bool)

(declare-fun res!256940 () Bool)

(assert (=> b!435975 (=> (not res!256940) (not e!257504))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435975 (= res!256940 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!435976 () Bool)

(declare-fun res!256937 () Bool)

(assert (=> b!435976 (=> (not res!256937) (not e!257504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26697 (_ BitVec 32)) Bool)

(assert (=> b!435976 (= res!256937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435977 () Bool)

(declare-fun e!257511 () Bool)

(declare-fun e!257505 () Bool)

(assert (=> b!435977 (= e!257511 (not e!257505))))

(declare-fun res!256943 () Bool)

(assert (=> b!435977 (=> res!256943 e!257505)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435977 (= res!256943 (not (validKeyInArray!0 (select (arr!12798 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7632 0))(
  ( (tuple2!7633 (_1!3827 (_ BitVec 64)) (_2!3827 V!16351)) )
))
(declare-datatypes ((List!7633 0))(
  ( (Nil!7630) (Cons!7629 (h!8485 tuple2!7632) (t!13365 List!7633)) )
))
(declare-datatypes ((ListLongMap!6545 0))(
  ( (ListLongMap!6546 (toList!3288 List!7633)) )
))
(declare-fun lt!200877 () ListLongMap!6545)

(declare-fun lt!200881 () ListLongMap!6545)

(assert (=> b!435977 (= lt!200877 lt!200881)))

(declare-fun lt!200872 () ListLongMap!6545)

(declare-fun lt!200875 () tuple2!7632)

(declare-fun +!1436 (ListLongMap!6545 tuple2!7632) ListLongMap!6545)

(assert (=> b!435977 (= lt!200881 (+!1436 lt!200872 lt!200875))))

(declare-fun minValue!515 () V!16351)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16351)

(declare-fun lt!200876 () array!26697)

(declare-fun lt!200874 () array!26699)

(declare-fun getCurrentListMapNoExtraKeys!1478 (array!26697 array!26699 (_ BitVec 32) (_ BitVec 32) V!16351 V!16351 (_ BitVec 32) Int) ListLongMap!6545)

(assert (=> b!435977 (= lt!200877 (getCurrentListMapNoExtraKeys!1478 lt!200876 lt!200874 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16351)

(assert (=> b!435977 (= lt!200875 (tuple2!7633 k!794 v!412))))

(assert (=> b!435977 (= lt!200872 (getCurrentListMapNoExtraKeys!1478 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12957 0))(
  ( (Unit!12958) )
))
(declare-fun lt!200871 () Unit!12957)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!607 (array!26697 array!26699 (_ BitVec 32) (_ BitVec 32) V!16351 V!16351 (_ BitVec 32) (_ BitVec 64) V!16351 (_ BitVec 32) Int) Unit!12957)

(assert (=> b!435977 (= lt!200871 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!607 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435978 () Bool)

(declare-fun e!257509 () Bool)

(declare-fun tp_is_empty!11435 () Bool)

(assert (=> b!435978 (= e!257509 tp_is_empty!11435)))

(declare-fun b!435979 () Bool)

(declare-fun e!257507 () Bool)

(assert (=> b!435979 (= e!257505 e!257507)))

(declare-fun res!256936 () Bool)

(assert (=> b!435979 (=> res!256936 e!257507)))

(assert (=> b!435979 (= res!256936 (= k!794 (select (arr!12798 _keys!709) from!863)))))

(assert (=> b!435979 (not (= (select (arr!12798 _keys!709) from!863) k!794))))

(declare-fun lt!200884 () Unit!12957)

(declare-fun e!257506 () Unit!12957)

(assert (=> b!435979 (= lt!200884 e!257506)))

(declare-fun c!55760 () Bool)

(assert (=> b!435979 (= c!55760 (= (select (arr!12798 _keys!709) from!863) k!794))))

(declare-fun lt!200883 () ListLongMap!6545)

(declare-fun lt!200882 () ListLongMap!6545)

(assert (=> b!435979 (= lt!200883 lt!200882)))

(declare-fun lt!200878 () tuple2!7632)

(assert (=> b!435979 (= lt!200882 (+!1436 lt!200881 lt!200878))))

(declare-fun lt!200873 () V!16351)

(assert (=> b!435979 (= lt!200878 (tuple2!7633 (select (arr!12798 _keys!709) from!863) lt!200873))))

(declare-fun get!6382 (ValueCell!5374 V!16351) V!16351)

(declare-fun dynLambda!841 (Int (_ BitVec 64)) V!16351)

(assert (=> b!435979 (= lt!200873 (get!6382 (select (arr!12799 _values!549) from!863) (dynLambda!841 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435980 () Bool)

(declare-fun e!257508 () Bool)

(assert (=> b!435980 (= e!257508 e!257511)))

(declare-fun res!256950 () Bool)

(assert (=> b!435980 (=> (not res!256950) (not e!257511))))

(assert (=> b!435980 (= res!256950 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435980 (= lt!200883 (getCurrentListMapNoExtraKeys!1478 lt!200876 lt!200874 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435980 (= lt!200874 (array!26700 (store (arr!12799 _values!549) i!563 (ValueCellFull!5374 v!412)) (size!13151 _values!549)))))

(declare-fun lt!200885 () ListLongMap!6545)

(assert (=> b!435980 (= lt!200885 (getCurrentListMapNoExtraKeys!1478 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435981 () Bool)

(declare-fun e!257510 () Bool)

(assert (=> b!435981 (= e!257510 tp_is_empty!11435)))

(declare-fun b!435982 () Bool)

(declare-fun res!256938 () Bool)

(assert (=> b!435982 (=> (not res!256938) (not e!257504))))

(assert (=> b!435982 (= res!256938 (or (= (select (arr!12798 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12798 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435983 () Bool)

(declare-fun res!256941 () Bool)

(assert (=> b!435983 (=> (not res!256941) (not e!257504))))

(assert (=> b!435983 (= res!256941 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13150 _keys!709))))))

(declare-fun b!435984 () Bool)

(declare-fun Unit!12959 () Unit!12957)

(assert (=> b!435984 (= e!257506 Unit!12959)))

(declare-fun lt!200880 () Unit!12957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12957)

(assert (=> b!435984 (= lt!200880 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435984 false))

(declare-fun b!435985 () Bool)

(declare-fun res!256949 () Bool)

(assert (=> b!435985 (=> (not res!256949) (not e!257508))))

(declare-datatypes ((List!7634 0))(
  ( (Nil!7631) (Cons!7630 (h!8486 (_ BitVec 64)) (t!13366 List!7634)) )
))
(declare-fun arrayNoDuplicates!0 (array!26697 (_ BitVec 32) List!7634) Bool)

(assert (=> b!435985 (= res!256949 (arrayNoDuplicates!0 lt!200876 #b00000000000000000000000000000000 Nil!7631))))

(declare-fun b!435986 () Bool)

(declare-fun res!256945 () Bool)

(assert (=> b!435986 (=> (not res!256945) (not e!257504))))

(assert (=> b!435986 (= res!256945 (validKeyInArray!0 k!794))))

(declare-fun res!256944 () Bool)

(assert (=> start!40016 (=> (not res!256944) (not e!257504))))

(assert (=> start!40016 (= res!256944 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13150 _keys!709))))))

(assert (=> start!40016 e!257504))

(assert (=> start!40016 tp_is_empty!11435))

(assert (=> start!40016 tp!36377))

(assert (=> start!40016 true))

(declare-fun e!257503 () Bool)

(declare-fun array_inv!9302 (array!26699) Bool)

(assert (=> start!40016 (and (array_inv!9302 _values!549) e!257503)))

(declare-fun array_inv!9303 (array!26697) Bool)

(assert (=> start!40016 (array_inv!9303 _keys!709)))

(declare-fun b!435987 () Bool)

(declare-fun res!256942 () Bool)

(assert (=> b!435987 (=> (not res!256942) (not e!257508))))

(assert (=> b!435987 (= res!256942 (bvsle from!863 i!563))))

(declare-fun b!435988 () Bool)

(assert (=> b!435988 (= e!257504 e!257508)))

(declare-fun res!256939 () Bool)

(assert (=> b!435988 (=> (not res!256939) (not e!257508))))

(assert (=> b!435988 (= res!256939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200876 mask!1025))))

(assert (=> b!435988 (= lt!200876 (array!26698 (store (arr!12798 _keys!709) i!563 k!794) (size!13150 _keys!709)))))

(declare-fun b!435989 () Bool)

(declare-fun Unit!12960 () Unit!12957)

(assert (=> b!435989 (= e!257506 Unit!12960)))

(declare-fun b!435990 () Bool)

(assert (=> b!435990 (= e!257507 true)))

(assert (=> b!435990 (= lt!200882 (+!1436 (+!1436 lt!200872 lt!200878) lt!200875))))

(declare-fun lt!200879 () Unit!12957)

(declare-fun addCommutativeForDiffKeys!418 (ListLongMap!6545 (_ BitVec 64) V!16351 (_ BitVec 64) V!16351) Unit!12957)

(assert (=> b!435990 (= lt!200879 (addCommutativeForDiffKeys!418 lt!200872 k!794 v!412 (select (arr!12798 _keys!709) from!863) lt!200873))))

(declare-fun b!435991 () Bool)

(declare-fun res!256946 () Bool)

(assert (=> b!435991 (=> (not res!256946) (not e!257504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435991 (= res!256946 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18774 () Bool)

(declare-fun mapRes!18774 () Bool)

(assert (=> mapIsEmpty!18774 mapRes!18774))

(declare-fun mapNonEmpty!18774 () Bool)

(declare-fun tp!36378 () Bool)

(assert (=> mapNonEmpty!18774 (= mapRes!18774 (and tp!36378 e!257510))))

(declare-fun mapRest!18774 () (Array (_ BitVec 32) ValueCell!5374))

(declare-fun mapValue!18774 () ValueCell!5374)

(declare-fun mapKey!18774 () (_ BitVec 32))

(assert (=> mapNonEmpty!18774 (= (arr!12799 _values!549) (store mapRest!18774 mapKey!18774 mapValue!18774))))

(declare-fun b!435992 () Bool)

(declare-fun res!256947 () Bool)

(assert (=> b!435992 (=> (not res!256947) (not e!257504))))

(assert (=> b!435992 (= res!256947 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7631))))

(declare-fun b!435993 () Bool)

(assert (=> b!435993 (= e!257503 (and e!257509 mapRes!18774))))

(declare-fun condMapEmpty!18774 () Bool)

(declare-fun mapDefault!18774 () ValueCell!5374)

