; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20580 () Bool)

(assert start!20580)

(declare-fun b_free!5239 () Bool)

(declare-fun b_next!5239 () Bool)

(assert (=> start!20580 (= b_free!5239 (not b_next!5239))))

(declare-fun tp!18749 () Bool)

(declare-fun b_and!11985 () Bool)

(assert (=> start!20580 (= tp!18749 b_and!11985)))

(declare-fun mapNonEmpty!8711 () Bool)

(declare-fun mapRes!8711 () Bool)

(declare-fun tp!18748 () Bool)

(declare-fun e!134058 () Bool)

(assert (=> mapNonEmpty!8711 (= mapRes!8711 (and tp!18748 e!134058))))

(declare-datatypes ((V!6441 0))(
  ( (V!6442 (val!2592 Int)) )
))
(declare-datatypes ((ValueCell!2204 0))(
  ( (ValueCellFull!2204 (v!4562 V!6441)) (EmptyCell!2204) )
))
(declare-datatypes ((array!9403 0))(
  ( (array!9404 (arr!4452 (Array (_ BitVec 32) ValueCell!2204)) (size!4777 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9403)

(declare-fun mapRest!8711 () (Array (_ BitVec 32) ValueCell!2204))

(declare-fun mapValue!8711 () ValueCell!2204)

(declare-fun mapKey!8711 () (_ BitVec 32))

(assert (=> mapNonEmpty!8711 (= (arr!4452 _values!649) (store mapRest!8711 mapKey!8711 mapValue!8711))))

(declare-fun b!204948 () Bool)

(declare-fun tp_is_empty!5095 () Bool)

(assert (=> b!204948 (= e!134058 tp_is_empty!5095)))

(declare-fun res!98895 () Bool)

(declare-fun e!134061 () Bool)

(assert (=> start!20580 (=> (not res!98895) (not e!134061))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20580 (= res!98895 (validMask!0 mask!1149))))

(assert (=> start!20580 e!134061))

(declare-fun e!134060 () Bool)

(declare-fun array_inv!2939 (array!9403) Bool)

(assert (=> start!20580 (and (array_inv!2939 _values!649) e!134060)))

(assert (=> start!20580 true))

(assert (=> start!20580 tp_is_empty!5095))

(declare-datatypes ((array!9405 0))(
  ( (array!9406 (arr!4453 (Array (_ BitVec 32) (_ BitVec 64))) (size!4778 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9405)

(declare-fun array_inv!2940 (array!9405) Bool)

(assert (=> start!20580 (array_inv!2940 _keys!825)))

(assert (=> start!20580 tp!18749))

(declare-fun b!204949 () Bool)

(declare-fun res!98889 () Bool)

(assert (=> b!204949 (=> (not res!98889) (not e!134061))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204949 (= res!98889 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4778 _keys!825))))))

(declare-fun b!204950 () Bool)

(declare-fun res!98896 () Bool)

(assert (=> b!204950 (=> (not res!98896) (not e!134061))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!204950 (= res!98896 (= (select (arr!4453 _keys!825) i!601) k!843))))

(declare-fun b!204951 () Bool)

(declare-fun e!134062 () Bool)

(assert (=> b!204951 (= e!134061 (not e!134062))))

(declare-fun res!98890 () Bool)

(assert (=> b!204951 (=> res!98890 e!134062)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204951 (= res!98890 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3928 0))(
  ( (tuple2!3929 (_1!1975 (_ BitVec 64)) (_2!1975 V!6441)) )
))
(declare-datatypes ((List!2827 0))(
  ( (Nil!2824) (Cons!2823 (h!3465 tuple2!3928) (t!7758 List!2827)) )
))
(declare-datatypes ((ListLongMap!2841 0))(
  ( (ListLongMap!2842 (toList!1436 List!2827)) )
))
(declare-fun lt!104082 () ListLongMap!2841)

(declare-fun zeroValue!615 () V!6441)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6441)

(declare-fun getCurrentListMap!1009 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2841)

(assert (=> b!204951 (= lt!104082 (getCurrentListMap!1009 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104083 () array!9403)

(declare-fun lt!104084 () ListLongMap!2841)

(assert (=> b!204951 (= lt!104084 (getCurrentListMap!1009 _keys!825 lt!104083 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104085 () ListLongMap!2841)

(declare-fun lt!104090 () ListLongMap!2841)

(assert (=> b!204951 (and (= lt!104085 lt!104090) (= lt!104090 lt!104085))))

(declare-fun lt!104091 () ListLongMap!2841)

(declare-fun lt!104086 () tuple2!3928)

(declare-fun +!463 (ListLongMap!2841 tuple2!3928) ListLongMap!2841)

(assert (=> b!204951 (= lt!104090 (+!463 lt!104091 lt!104086))))

(declare-fun v!520 () V!6441)

(assert (=> b!204951 (= lt!104086 (tuple2!3929 k!843 v!520))))

(declare-datatypes ((Unit!6218 0))(
  ( (Unit!6219) )
))
(declare-fun lt!104080 () Unit!6218)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!122 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) (_ BitVec 64) V!6441 (_ BitVec 32) Int) Unit!6218)

(assert (=> b!204951 (= lt!104080 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!122 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!383 (array!9405 array!9403 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2841)

(assert (=> b!204951 (= lt!104085 (getCurrentListMapNoExtraKeys!383 _keys!825 lt!104083 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204951 (= lt!104083 (array!9404 (store (arr!4452 _values!649) i!601 (ValueCellFull!2204 v!520)) (size!4777 _values!649)))))

(assert (=> b!204951 (= lt!104091 (getCurrentListMapNoExtraKeys!383 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204952 () Bool)

(declare-fun e!134057 () Bool)

(assert (=> b!204952 (= e!134057 true)))

(declare-fun lt!104088 () ListLongMap!2841)

(declare-fun lt!104081 () ListLongMap!2841)

(assert (=> b!204952 (= lt!104088 (+!463 lt!104081 lt!104086))))

(declare-fun lt!104089 () Unit!6218)

(declare-fun addCommutativeForDiffKeys!168 (ListLongMap!2841 (_ BitVec 64) V!6441 (_ BitVec 64) V!6441) Unit!6218)

(assert (=> b!204952 (= lt!104089 (addCommutativeForDiffKeys!168 lt!104091 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204953 () Bool)

(assert (=> b!204953 (= e!134062 e!134057)))

(declare-fun res!98891 () Bool)

(assert (=> b!204953 (=> res!98891 e!134057)))

(assert (=> b!204953 (= res!98891 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204953 (= lt!104082 lt!104081)))

(declare-fun lt!104087 () tuple2!3928)

(assert (=> b!204953 (= lt!104081 (+!463 lt!104091 lt!104087))))

(assert (=> b!204953 (= lt!104084 lt!104088)))

(assert (=> b!204953 (= lt!104088 (+!463 lt!104090 lt!104087))))

(assert (=> b!204953 (= lt!104084 (+!463 lt!104085 lt!104087))))

(assert (=> b!204953 (= lt!104087 (tuple2!3929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204954 () Bool)

(declare-fun res!98888 () Bool)

(assert (=> b!204954 (=> (not res!98888) (not e!134061))))

(assert (=> b!204954 (= res!98888 (and (= (size!4777 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4778 _keys!825) (size!4777 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204955 () Bool)

(declare-fun res!98892 () Bool)

(assert (=> b!204955 (=> (not res!98892) (not e!134061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9405 (_ BitVec 32)) Bool)

(assert (=> b!204955 (= res!98892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204956 () Bool)

(declare-fun e!134059 () Bool)

(assert (=> b!204956 (= e!134059 tp_is_empty!5095)))

(declare-fun b!204957 () Bool)

(declare-fun res!98894 () Bool)

(assert (=> b!204957 (=> (not res!98894) (not e!134061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204957 (= res!98894 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8711 () Bool)

(assert (=> mapIsEmpty!8711 mapRes!8711))

(declare-fun b!204958 () Bool)

(declare-fun res!98893 () Bool)

(assert (=> b!204958 (=> (not res!98893) (not e!134061))))

(declare-datatypes ((List!2828 0))(
  ( (Nil!2825) (Cons!2824 (h!3466 (_ BitVec 64)) (t!7759 List!2828)) )
))
(declare-fun arrayNoDuplicates!0 (array!9405 (_ BitVec 32) List!2828) Bool)

(assert (=> b!204958 (= res!98893 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2825))))

(declare-fun b!204959 () Bool)

(assert (=> b!204959 (= e!134060 (and e!134059 mapRes!8711))))

(declare-fun condMapEmpty!8711 () Bool)

(declare-fun mapDefault!8711 () ValueCell!2204)

