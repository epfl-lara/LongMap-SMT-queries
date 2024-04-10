; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20476 () Bool)

(assert start!20476)

(declare-fun b_free!5135 () Bool)

(declare-fun b_next!5135 () Bool)

(assert (=> start!20476 (= b_free!5135 (not b_next!5135))))

(declare-fun tp!18436 () Bool)

(declare-fun b_and!11881 () Bool)

(assert (=> start!20476 (= tp!18436 b_and!11881)))

(declare-fun b!203067 () Bool)

(declare-fun res!97480 () Bool)

(declare-fun e!132967 () Bool)

(assert (=> b!203067 (=> (not res!97480) (not e!132967))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9207 0))(
  ( (array!9208 (arr!4354 (Array (_ BitVec 32) (_ BitVec 64))) (size!4679 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9207)

(assert (=> b!203067 (= res!97480 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4679 _keys!825))))))

(declare-fun b!203068 () Bool)

(declare-fun res!97475 () Bool)

(assert (=> b!203068 (=> (not res!97475) (not e!132967))))

(declare-datatypes ((List!2756 0))(
  ( (Nil!2753) (Cons!2752 (h!3394 (_ BitVec 64)) (t!7687 List!2756)) )
))
(declare-fun arrayNoDuplicates!0 (array!9207 (_ BitVec 32) List!2756) Bool)

(assert (=> b!203068 (= res!97475 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2753))))

(declare-fun b!203069 () Bool)

(declare-fun e!132971 () Bool)

(declare-fun tp_is_empty!4991 () Bool)

(assert (=> b!203069 (= e!132971 tp_is_empty!4991)))

(declare-fun mapIsEmpty!8555 () Bool)

(declare-fun mapRes!8555 () Bool)

(assert (=> mapIsEmpty!8555 mapRes!8555))

(declare-fun b!203070 () Bool)

(declare-fun e!132965 () Bool)

(declare-fun e!132968 () Bool)

(assert (=> b!203070 (= e!132965 e!132968)))

(declare-fun res!97478 () Bool)

(assert (=> b!203070 (=> res!97478 e!132968)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!203070 (= res!97478 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6301 0))(
  ( (V!6302 (val!2540 Int)) )
))
(declare-datatypes ((tuple2!3852 0))(
  ( (tuple2!3853 (_1!1937 (_ BitVec 64)) (_2!1937 V!6301)) )
))
(declare-datatypes ((List!2757 0))(
  ( (Nil!2754) (Cons!2753 (h!3395 tuple2!3852) (t!7688 List!2757)) )
))
(declare-datatypes ((ListLongMap!2765 0))(
  ( (ListLongMap!2766 (toList!1398 List!2757)) )
))
(declare-fun lt!102253 () ListLongMap!2765)

(declare-fun lt!102246 () ListLongMap!2765)

(assert (=> b!203070 (= lt!102253 lt!102246)))

(declare-fun lt!102249 () ListLongMap!2765)

(declare-fun lt!102252 () tuple2!3852)

(declare-fun +!425 (ListLongMap!2765 tuple2!3852) ListLongMap!2765)

(assert (=> b!203070 (= lt!102246 (+!425 lt!102249 lt!102252))))

(declare-fun lt!102244 () ListLongMap!2765)

(declare-fun lt!102251 () ListLongMap!2765)

(assert (=> b!203070 (= lt!102244 lt!102251)))

(declare-fun lt!102254 () ListLongMap!2765)

(assert (=> b!203070 (= lt!102251 (+!425 lt!102254 lt!102252))))

(declare-fun lt!102245 () ListLongMap!2765)

(assert (=> b!203070 (= lt!102253 (+!425 lt!102245 lt!102252))))

(declare-fun zeroValue!615 () V!6301)

(assert (=> b!203070 (= lt!102252 (tuple2!3853 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8555 () Bool)

(declare-fun tp!18437 () Bool)

(declare-fun e!132970 () Bool)

(assert (=> mapNonEmpty!8555 (= mapRes!8555 (and tp!18437 e!132970))))

(declare-datatypes ((ValueCell!2152 0))(
  ( (ValueCellFull!2152 (v!4510 V!6301)) (EmptyCell!2152) )
))
(declare-fun mapValue!8555 () ValueCell!2152)

(declare-datatypes ((array!9209 0))(
  ( (array!9210 (arr!4355 (Array (_ BitVec 32) ValueCell!2152)) (size!4680 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9209)

(declare-fun mapKey!8555 () (_ BitVec 32))

(declare-fun mapRest!8555 () (Array (_ BitVec 32) ValueCell!2152))

(assert (=> mapNonEmpty!8555 (= (arr!4355 _values!649) (store mapRest!8555 mapKey!8555 mapValue!8555))))

(declare-fun b!203071 () Bool)

(declare-fun res!97481 () Bool)

(assert (=> b!203071 (=> (not res!97481) (not e!132967))))

(assert (=> b!203071 (= res!97481 (= (select (arr!4354 _keys!825) i!601) k!843))))

(declare-fun res!97482 () Bool)

(assert (=> start!20476 (=> (not res!97482) (not e!132967))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20476 (= res!97482 (validMask!0 mask!1149))))

(assert (=> start!20476 e!132967))

(declare-fun e!132966 () Bool)

(declare-fun array_inv!2877 (array!9209) Bool)

(assert (=> start!20476 (and (array_inv!2877 _values!649) e!132966)))

(assert (=> start!20476 true))

(assert (=> start!20476 tp_is_empty!4991))

(declare-fun array_inv!2878 (array!9207) Bool)

(assert (=> start!20476 (array_inv!2878 _keys!825)))

(assert (=> start!20476 tp!18436))

(declare-fun b!203072 () Bool)

(assert (=> b!203072 (= e!132968 true)))

(declare-fun lt!102255 () tuple2!3852)

(assert (=> b!203072 (= lt!102246 (+!425 lt!102251 lt!102255))))

(declare-datatypes ((Unit!6144 0))(
  ( (Unit!6145) )
))
(declare-fun lt!102250 () Unit!6144)

(declare-fun v!520 () V!6301)

(declare-fun addCommutativeForDiffKeys!141 (ListLongMap!2765 (_ BitVec 64) V!6301 (_ BitVec 64) V!6301) Unit!6144)

(assert (=> b!203072 (= lt!102250 (addCommutativeForDiffKeys!141 lt!102254 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203073 () Bool)

(assert (=> b!203073 (= e!132970 tp_is_empty!4991)))

(declare-fun b!203074 () Bool)

(declare-fun res!97479 () Bool)

(assert (=> b!203074 (=> (not res!97479) (not e!132967))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203074 (= res!97479 (and (= (size!4680 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4679 _keys!825) (size!4680 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203075 () Bool)

(assert (=> b!203075 (= e!132966 (and e!132971 mapRes!8555))))

(declare-fun condMapEmpty!8555 () Bool)

(declare-fun mapDefault!8555 () ValueCell!2152)

