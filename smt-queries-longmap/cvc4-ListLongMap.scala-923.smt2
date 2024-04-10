; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20638 () Bool)

(assert start!20638)

(declare-fun b_free!5297 () Bool)

(declare-fun b_next!5297 () Bool)

(assert (=> start!20638 (= b_free!5297 (not b_next!5297))))

(declare-fun tp!18923 () Bool)

(declare-fun b_and!12043 () Bool)

(assert (=> start!20638 (= tp!18923 b_and!12043)))

(declare-fun b!205992 () Bool)

(declare-fun res!99672 () Bool)

(declare-fun e!134671 () Bool)

(assert (=> b!205992 (=> (not res!99672) (not e!134671))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9517 0))(
  ( (array!9518 (arr!4509 (Array (_ BitVec 32) (_ BitVec 64))) (size!4834 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9517)

(assert (=> b!205992 (= res!99672 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4834 _keys!825))))))

(declare-fun b!205993 () Bool)

(declare-fun res!99678 () Bool)

(assert (=> b!205993 (=> (not res!99678) (not e!134671))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!205993 (= res!99678 (= (select (arr!4509 _keys!825) i!601) k!843))))

(declare-fun b!205994 () Bool)

(declare-fun res!99675 () Bool)

(assert (=> b!205994 (=> (not res!99675) (not e!134671))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9517 (_ BitVec 32)) Bool)

(assert (=> b!205994 (= res!99675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8798 () Bool)

(declare-fun mapRes!8798 () Bool)

(declare-fun tp!18922 () Bool)

(declare-fun e!134670 () Bool)

(assert (=> mapNonEmpty!8798 (= mapRes!8798 (and tp!18922 e!134670))))

(declare-fun mapKey!8798 () (_ BitVec 32))

(declare-datatypes ((V!6517 0))(
  ( (V!6518 (val!2621 Int)) )
))
(declare-datatypes ((ValueCell!2233 0))(
  ( (ValueCellFull!2233 (v!4591 V!6517)) (EmptyCell!2233) )
))
(declare-datatypes ((array!9519 0))(
  ( (array!9520 (arr!4510 (Array (_ BitVec 32) ValueCell!2233)) (size!4835 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9519)

(declare-fun mapValue!8798 () ValueCell!2233)

(declare-fun mapRest!8798 () (Array (_ BitVec 32) ValueCell!2233))

(assert (=> mapNonEmpty!8798 (= (arr!4510 _values!649) (store mapRest!8798 mapKey!8798 mapValue!8798))))

(declare-fun b!205995 () Bool)

(declare-fun res!99677 () Bool)

(assert (=> b!205995 (=> (not res!99677) (not e!134671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205995 (= res!99677 (validKeyInArray!0 k!843))))

(declare-fun b!205996 () Bool)

(declare-fun e!134667 () Bool)

(assert (=> b!205996 (= e!134671 (not e!134667))))

(declare-fun res!99676 () Bool)

(assert (=> b!205996 (=> res!99676 e!134667)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205996 (= res!99676 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6517)

(declare-fun zeroValue!615 () V!6517)

(declare-datatypes ((tuple2!3978 0))(
  ( (tuple2!3979 (_1!2000 (_ BitVec 64)) (_2!2000 V!6517)) )
))
(declare-datatypes ((List!2871 0))(
  ( (Nil!2868) (Cons!2867 (h!3509 tuple2!3978) (t!7802 List!2871)) )
))
(declare-datatypes ((ListLongMap!2891 0))(
  ( (ListLongMap!2892 (toList!1461 List!2871)) )
))
(declare-fun lt!105127 () ListLongMap!2891)

(declare-fun getCurrentListMap!1031 (array!9517 array!9519 (_ BitVec 32) (_ BitVec 32) V!6517 V!6517 (_ BitVec 32) Int) ListLongMap!2891)

(assert (=> b!205996 (= lt!105127 (getCurrentListMap!1031 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105129 () ListLongMap!2891)

(declare-fun lt!105134 () array!9519)

(assert (=> b!205996 (= lt!105129 (getCurrentListMap!1031 _keys!825 lt!105134 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105130 () ListLongMap!2891)

(declare-fun lt!105125 () ListLongMap!2891)

(assert (=> b!205996 (and (= lt!105130 lt!105125) (= lt!105125 lt!105130))))

(declare-fun lt!105135 () ListLongMap!2891)

(declare-fun lt!105131 () tuple2!3978)

(declare-fun +!488 (ListLongMap!2891 tuple2!3978) ListLongMap!2891)

(assert (=> b!205996 (= lt!105125 (+!488 lt!105135 lt!105131))))

(declare-fun v!520 () V!6517)

(assert (=> b!205996 (= lt!105131 (tuple2!3979 k!843 v!520))))

(declare-datatypes ((Unit!6266 0))(
  ( (Unit!6267) )
))
(declare-fun lt!105128 () Unit!6266)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 (array!9517 array!9519 (_ BitVec 32) (_ BitVec 32) V!6517 V!6517 (_ BitVec 32) (_ BitVec 64) V!6517 (_ BitVec 32) Int) Unit!6266)

(assert (=> b!205996 (= lt!105128 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!405 (array!9517 array!9519 (_ BitVec 32) (_ BitVec 32) V!6517 V!6517 (_ BitVec 32) Int) ListLongMap!2891)

(assert (=> b!205996 (= lt!105130 (getCurrentListMapNoExtraKeys!405 _keys!825 lt!105134 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205996 (= lt!105134 (array!9520 (store (arr!4510 _values!649) i!601 (ValueCellFull!2233 v!520)) (size!4835 _values!649)))))

(assert (=> b!205996 (= lt!105135 (getCurrentListMapNoExtraKeys!405 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205997 () Bool)

(declare-fun e!134672 () Bool)

(assert (=> b!205997 (= e!134667 e!134672)))

(declare-fun res!99679 () Bool)

(assert (=> b!205997 (=> res!99679 e!134672)))

(assert (=> b!205997 (= res!99679 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105124 () ListLongMap!2891)

(assert (=> b!205997 (= lt!105127 lt!105124)))

(declare-fun lt!105126 () tuple2!3978)

(assert (=> b!205997 (= lt!105124 (+!488 lt!105135 lt!105126))))

(declare-fun lt!105133 () ListLongMap!2891)

(assert (=> b!205997 (= lt!105129 lt!105133)))

(assert (=> b!205997 (= lt!105133 (+!488 lt!105125 lt!105126))))

(assert (=> b!205997 (= lt!105129 (+!488 lt!105130 lt!105126))))

(assert (=> b!205997 (= lt!105126 (tuple2!3979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205998 () Bool)

(declare-fun res!99674 () Bool)

(assert (=> b!205998 (=> (not res!99674) (not e!134671))))

(assert (=> b!205998 (= res!99674 (and (= (size!4835 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4834 _keys!825) (size!4835 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205999 () Bool)

(declare-fun tp_is_empty!5153 () Bool)

(assert (=> b!205999 (= e!134670 tp_is_empty!5153)))

(declare-fun b!206001 () Bool)

(declare-fun e!134666 () Bool)

(assert (=> b!206001 (= e!134666 tp_is_empty!5153)))

(declare-fun b!206002 () Bool)

(declare-fun res!99673 () Bool)

(assert (=> b!206002 (=> (not res!99673) (not e!134671))))

(declare-datatypes ((List!2872 0))(
  ( (Nil!2869) (Cons!2868 (h!3510 (_ BitVec 64)) (t!7803 List!2872)) )
))
(declare-fun arrayNoDuplicates!0 (array!9517 (_ BitVec 32) List!2872) Bool)

(assert (=> b!206002 (= res!99673 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2869))))

(declare-fun b!206003 () Bool)

(assert (=> b!206003 (= e!134672 true)))

(assert (=> b!206003 (= lt!105133 (+!488 lt!105124 lt!105131))))

(declare-fun lt!105132 () Unit!6266)

(declare-fun addCommutativeForDiffKeys!187 (ListLongMap!2891 (_ BitVec 64) V!6517 (_ BitVec 64) V!6517) Unit!6266)

(assert (=> b!206003 (= lt!105132 (addCommutativeForDiffKeys!187 lt!105135 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8798 () Bool)

(assert (=> mapIsEmpty!8798 mapRes!8798))

(declare-fun b!206000 () Bool)

(declare-fun e!134669 () Bool)

(assert (=> b!206000 (= e!134669 (and e!134666 mapRes!8798))))

(declare-fun condMapEmpty!8798 () Bool)

(declare-fun mapDefault!8798 () ValueCell!2233)

