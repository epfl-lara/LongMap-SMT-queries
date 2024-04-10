; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20748 () Bool)

(assert start!20748)

(declare-fun b_free!5407 () Bool)

(declare-fun b_next!5407 () Bool)

(assert (=> start!20748 (= b_free!5407 (not b_next!5407))))

(declare-fun tp!19253 () Bool)

(declare-fun b_and!12153 () Bool)

(assert (=> start!20748 (= tp!19253 b_and!12153)))

(declare-fun b!207716 () Bool)

(declare-fun res!100904 () Bool)

(declare-fun e!135567 () Bool)

(assert (=> b!207716 (=> (not res!100904) (not e!135567))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207716 (= res!100904 (validKeyInArray!0 k!843))))

(declare-fun b!207717 () Bool)

(declare-fun e!135569 () Bool)

(declare-fun tp_is_empty!5263 () Bool)

(assert (=> b!207717 (= e!135569 tp_is_empty!5263)))

(declare-fun b!207718 () Bool)

(declare-fun res!100905 () Bool)

(assert (=> b!207718 (=> (not res!100905) (not e!135567))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9733 0))(
  ( (array!9734 (arr!4617 (Array (_ BitVec 32) (_ BitVec 64))) (size!4942 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9733)

(assert (=> b!207718 (= res!100905 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4942 _keys!825))))))

(declare-fun b!207719 () Bool)

(declare-fun res!100900 () Bool)

(assert (=> b!207719 (=> (not res!100900) (not e!135567))))

(assert (=> b!207719 (= res!100900 (= (select (arr!4617 _keys!825) i!601) k!843))))

(declare-fun b!207720 () Bool)

(declare-fun res!100906 () Bool)

(assert (=> b!207720 (=> (not res!100906) (not e!135567))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9733 (_ BitVec 32)) Bool)

(assert (=> b!207720 (= res!100906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207721 () Bool)

(declare-fun e!135566 () Bool)

(assert (=> b!207721 (= e!135566 tp_is_empty!5263)))

(declare-fun b!207722 () Bool)

(declare-fun res!100902 () Bool)

(assert (=> b!207722 (=> (not res!100902) (not e!135567))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6665 0))(
  ( (V!6666 (val!2676 Int)) )
))
(declare-datatypes ((ValueCell!2288 0))(
  ( (ValueCellFull!2288 (v!4646 V!6665)) (EmptyCell!2288) )
))
(declare-datatypes ((array!9735 0))(
  ( (array!9736 (arr!4618 (Array (_ BitVec 32) ValueCell!2288)) (size!4943 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9735)

(assert (=> b!207722 (= res!100902 (and (= (size!4943 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4942 _keys!825) (size!4943 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100901 () Bool)

(assert (=> start!20748 (=> (not res!100901) (not e!135567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20748 (= res!100901 (validMask!0 mask!1149))))

(assert (=> start!20748 e!135567))

(declare-fun e!135568 () Bool)

(declare-fun array_inv!3059 (array!9735) Bool)

(assert (=> start!20748 (and (array_inv!3059 _values!649) e!135568)))

(assert (=> start!20748 true))

(assert (=> start!20748 tp_is_empty!5263))

(declare-fun array_inv!3060 (array!9733) Bool)

(assert (=> start!20748 (array_inv!3060 _keys!825)))

(assert (=> start!20748 tp!19253))

(declare-fun mapNonEmpty!8963 () Bool)

(declare-fun mapRes!8963 () Bool)

(declare-fun tp!19252 () Bool)

(assert (=> mapNonEmpty!8963 (= mapRes!8963 (and tp!19252 e!135569))))

(declare-fun mapValue!8963 () ValueCell!2288)

(declare-fun mapKey!8963 () (_ BitVec 32))

(declare-fun mapRest!8963 () (Array (_ BitVec 32) ValueCell!2288))

(assert (=> mapNonEmpty!8963 (= (arr!4618 _values!649) (store mapRest!8963 mapKey!8963 mapValue!8963))))

(declare-fun b!207723 () Bool)

(assert (=> b!207723 (= e!135567 (not true))))

(declare-datatypes ((tuple2!4060 0))(
  ( (tuple2!4061 (_1!2041 (_ BitVec 64)) (_2!2041 V!6665)) )
))
(declare-datatypes ((List!2953 0))(
  ( (Nil!2950) (Cons!2949 (h!3591 tuple2!4060) (t!7884 List!2953)) )
))
(declare-datatypes ((ListLongMap!2973 0))(
  ( (ListLongMap!2974 (toList!1502 List!2953)) )
))
(declare-fun lt!106474 () ListLongMap!2973)

(declare-fun zeroValue!615 () V!6665)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6665)

(declare-fun getCurrentListMap!1069 (array!9733 array!9735 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2973)

(assert (=> b!207723 (= lt!106474 (getCurrentListMap!1069 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106477 () array!9735)

(declare-fun lt!106475 () ListLongMap!2973)

(assert (=> b!207723 (= lt!106475 (getCurrentListMap!1069 _keys!825 lt!106477 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106476 () ListLongMap!2973)

(declare-fun lt!106478 () ListLongMap!2973)

(assert (=> b!207723 (and (= lt!106476 lt!106478) (= lt!106478 lt!106476))))

(declare-fun lt!106479 () ListLongMap!2973)

(declare-fun v!520 () V!6665)

(declare-fun +!529 (ListLongMap!2973 tuple2!4060) ListLongMap!2973)

(assert (=> b!207723 (= lt!106478 (+!529 lt!106479 (tuple2!4061 k!843 v!520)))))

(declare-datatypes ((Unit!6346 0))(
  ( (Unit!6347) )
))
(declare-fun lt!106473 () Unit!6346)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!182 (array!9733 array!9735 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) (_ BitVec 64) V!6665 (_ BitVec 32) Int) Unit!6346)

(assert (=> b!207723 (= lt!106473 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!182 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!443 (array!9733 array!9735 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2973)

(assert (=> b!207723 (= lt!106476 (getCurrentListMapNoExtraKeys!443 _keys!825 lt!106477 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207723 (= lt!106477 (array!9736 (store (arr!4618 _values!649) i!601 (ValueCellFull!2288 v!520)) (size!4943 _values!649)))))

(assert (=> b!207723 (= lt!106479 (getCurrentListMapNoExtraKeys!443 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207724 () Bool)

(declare-fun res!100903 () Bool)

(assert (=> b!207724 (=> (not res!100903) (not e!135567))))

(declare-datatypes ((List!2954 0))(
  ( (Nil!2951) (Cons!2950 (h!3592 (_ BitVec 64)) (t!7885 List!2954)) )
))
(declare-fun arrayNoDuplicates!0 (array!9733 (_ BitVec 32) List!2954) Bool)

(assert (=> b!207724 (= res!100903 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2951))))

(declare-fun b!207725 () Bool)

(assert (=> b!207725 (= e!135568 (and e!135566 mapRes!8963))))

(declare-fun condMapEmpty!8963 () Bool)

(declare-fun mapDefault!8963 () ValueCell!2288)

