; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20842 () Bool)

(assert start!20842)

(declare-fun b_free!5495 () Bool)

(declare-fun b_next!5495 () Bool)

(assert (=> start!20842 (= b_free!5495 (not b_next!5495))))

(declare-fun tp!19526 () Bool)

(declare-fun b_and!12241 () Bool)

(assert (=> start!20842 (= tp!19526 b_and!12241)))

(declare-fun mapIsEmpty!9104 () Bool)

(declare-fun mapRes!9104 () Bool)

(assert (=> mapIsEmpty!9104 mapRes!9104))

(declare-fun b!209090 () Bool)

(declare-fun e!136270 () Bool)

(assert (=> b!209090 (= e!136270 false)))

(declare-datatypes ((V!6789 0))(
  ( (V!6790 (val!2723 Int)) )
))
(declare-datatypes ((tuple2!4118 0))(
  ( (tuple2!4119 (_1!2070 (_ BitVec 64)) (_2!2070 V!6789)) )
))
(declare-datatypes ((List!3014 0))(
  ( (Nil!3011) (Cons!3010 (h!3652 tuple2!4118) (t!7945 List!3014)) )
))
(declare-datatypes ((ListLongMap!3031 0))(
  ( (ListLongMap!3032 (toList!1531 List!3014)) )
))
(declare-fun lt!106916 () ListLongMap!3031)

(declare-datatypes ((ValueCell!2335 0))(
  ( (ValueCellFull!2335 (v!4693 V!6789)) (EmptyCell!2335) )
))
(declare-datatypes ((array!9915 0))(
  ( (array!9916 (arr!4708 (Array (_ BitVec 32) ValueCell!2335)) (size!5033 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9915)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6789)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6789)

(declare-datatypes ((array!9917 0))(
  ( (array!9918 (arr!4709 (Array (_ BitVec 32) (_ BitVec 64))) (size!5034 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9917)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6789)

(declare-fun getCurrentListMapNoExtraKeys!472 (array!9917 array!9915 (_ BitVec 32) (_ BitVec 32) V!6789 V!6789 (_ BitVec 32) Int) ListLongMap!3031)

(assert (=> b!209090 (= lt!106916 (getCurrentListMapNoExtraKeys!472 _keys!825 (array!9916 (store (arr!4708 _values!649) i!601 (ValueCellFull!2335 v!520)) (size!5033 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106917 () ListLongMap!3031)

(assert (=> b!209090 (= lt!106917 (getCurrentListMapNoExtraKeys!472 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209091 () Bool)

(declare-fun e!136272 () Bool)

(declare-fun tp_is_empty!5357 () Bool)

(assert (=> b!209091 (= e!136272 tp_is_empty!5357)))

(declare-fun b!209092 () Bool)

(declare-fun e!136271 () Bool)

(assert (=> b!209092 (= e!136271 (and e!136272 mapRes!9104))))

(declare-fun condMapEmpty!9104 () Bool)

(declare-fun mapDefault!9104 () ValueCell!2335)

