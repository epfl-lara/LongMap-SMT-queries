; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42266 () Bool)

(assert start!42266)

(declare-fun b_free!11771 () Bool)

(declare-fun b_next!11771 () Bool)

(assert (=> start!42266 (= b_free!11771 (not b_next!11771))))

(declare-fun tp!41341 () Bool)

(declare-fun b_and!20209 () Bool)

(assert (=> start!42266 (= tp!41341 b_and!20209)))

(declare-fun b!471646 () Bool)

(declare-fun e!276450 () Bool)

(declare-fun tp_is_empty!13199 () Bool)

(assert (=> b!471646 (= e!276450 tp_is_empty!13199)))

(declare-fun b!471647 () Bool)

(declare-fun e!276447 () Bool)

(assert (=> b!471647 (= e!276447 (not true))))

(declare-datatypes ((V!18703 0))(
  ( (V!18704 (val!6644 Int)) )
))
(declare-datatypes ((tuple2!8744 0))(
  ( (tuple2!8745 (_1!4383 (_ BitVec 64)) (_2!4383 V!18703)) )
))
(declare-datatypes ((List!8827 0))(
  ( (Nil!8824) (Cons!8823 (h!9679 tuple2!8744) (t!14793 List!8827)) )
))
(declare-datatypes ((ListLongMap!7657 0))(
  ( (ListLongMap!7658 (toList!3844 List!8827)) )
))
(declare-fun lt!213980 () ListLongMap!7657)

(declare-fun lt!213978 () ListLongMap!7657)

(assert (=> b!471647 (= lt!213980 lt!213978)))

(declare-fun minValueBefore!38 () V!18703)

(declare-fun zeroValue!794 () V!18703)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13847 0))(
  ( (Unit!13848) )
))
(declare-fun lt!213979 () Unit!13847)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30159 0))(
  ( (array!30160 (arr!14501 (Array (_ BitVec 32) (_ BitVec 64))) (size!14853 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30159)

(declare-datatypes ((ValueCell!6256 0))(
  ( (ValueCellFull!6256 (v!8935 V!18703)) (EmptyCell!6256) )
))
(declare-datatypes ((array!30161 0))(
  ( (array!30162 (arr!14502 (Array (_ BitVec 32) ValueCell!6256)) (size!14854 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30161)

(declare-fun minValueAfter!38 () V!18703)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!187 (array!30159 array!30161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18703 V!18703 V!18703 V!18703 (_ BitVec 32) Int) Unit!13847)

(assert (=> b!471647 (= lt!213979 (lemmaNoChangeToArrayThenSameMapNoExtras!187 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2007 (array!30159 array!30161 (_ BitVec 32) (_ BitVec 32) V!18703 V!18703 (_ BitVec 32) Int) ListLongMap!7657)

(assert (=> b!471647 (= lt!213978 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471647 (= lt!213980 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281755 () Bool)

(assert (=> start!42266 (=> (not res!281755) (not e!276447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42266 (= res!281755 (validMask!0 mask!1365))))

(assert (=> start!42266 e!276447))

(assert (=> start!42266 tp_is_empty!13199))

(assert (=> start!42266 tp!41341))

(assert (=> start!42266 true))

(declare-fun array_inv!10452 (array!30159) Bool)

(assert (=> start!42266 (array_inv!10452 _keys!1025)))

(declare-fun e!276448 () Bool)

(declare-fun array_inv!10453 (array!30161) Bool)

(assert (=> start!42266 (and (array_inv!10453 _values!833) e!276448)))

(declare-fun b!471648 () Bool)

(declare-fun res!281754 () Bool)

(assert (=> b!471648 (=> (not res!281754) (not e!276447))))

(declare-datatypes ((List!8828 0))(
  ( (Nil!8825) (Cons!8824 (h!9680 (_ BitVec 64)) (t!14794 List!8828)) )
))
(declare-fun arrayNoDuplicates!0 (array!30159 (_ BitVec 32) List!8828) Bool)

(assert (=> b!471648 (= res!281754 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8825))))

(declare-fun b!471649 () Bool)

(declare-fun e!276449 () Bool)

(declare-fun mapRes!21505 () Bool)

(assert (=> b!471649 (= e!276448 (and e!276449 mapRes!21505))))

(declare-fun condMapEmpty!21505 () Bool)

(declare-fun mapDefault!21505 () ValueCell!6256)

