; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20676 () Bool)

(assert start!20676)

(declare-fun b_free!5335 () Bool)

(declare-fun b_next!5335 () Bool)

(assert (=> start!20676 (= b_free!5335 (not b_next!5335))))

(declare-fun tp!19037 () Bool)

(declare-fun b_and!12081 () Bool)

(assert (=> start!20676 (= tp!19037 b_and!12081)))

(declare-fun b!206636 () Bool)

(declare-fun res!100145 () Bool)

(declare-fun e!135028 () Bool)

(assert (=> b!206636 (=> (not res!100145) (not e!135028))))

(declare-datatypes ((array!9593 0))(
  ( (array!9594 (arr!4547 (Array (_ BitVec 32) (_ BitVec 64))) (size!4872 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9593)

(declare-datatypes ((List!2900 0))(
  ( (Nil!2897) (Cons!2896 (h!3538 (_ BitVec 64)) (t!7831 List!2900)) )
))
(declare-fun arrayNoDuplicates!0 (array!9593 (_ BitVec 32) List!2900) Bool)

(assert (=> b!206636 (= res!100145 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2897))))

(declare-fun b!206637 () Bool)

(declare-fun res!100150 () Bool)

(assert (=> b!206637 (=> (not res!100150) (not e!135028))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206637 (= res!100150 (validKeyInArray!0 k!843))))

(declare-fun b!206638 () Bool)

(assert (=> b!206638 (= e!135028 (not true))))

(declare-datatypes ((V!6569 0))(
  ( (V!6570 (val!2640 Int)) )
))
(declare-datatypes ((ValueCell!2252 0))(
  ( (ValueCellFull!2252 (v!4610 V!6569)) (EmptyCell!2252) )
))
(declare-datatypes ((array!9595 0))(
  ( (array!9596 (arr!4548 (Array (_ BitVec 32) ValueCell!2252)) (size!4873 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9595)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4008 0))(
  ( (tuple2!4009 (_1!2015 (_ BitVec 64)) (_2!2015 V!6569)) )
))
(declare-datatypes ((List!2901 0))(
  ( (Nil!2898) (Cons!2897 (h!3539 tuple2!4008) (t!7832 List!2901)) )
))
(declare-datatypes ((ListLongMap!2921 0))(
  ( (ListLongMap!2922 (toList!1476 List!2901)) )
))
(declare-fun lt!105713 () ListLongMap!2921)

(declare-fun zeroValue!615 () V!6569)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6569)

(declare-fun getCurrentListMap!1043 (array!9593 array!9595 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2921)

(assert (=> b!206638 (= lt!105713 (getCurrentListMap!1043 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105711 () array!9595)

(declare-fun lt!105710 () ListLongMap!2921)

(assert (=> b!206638 (= lt!105710 (getCurrentListMap!1043 _keys!825 lt!105711 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105712 () ListLongMap!2921)

(declare-fun lt!105709 () ListLongMap!2921)

(assert (=> b!206638 (and (= lt!105712 lt!105709) (= lt!105709 lt!105712))))

(declare-fun lt!105714 () ListLongMap!2921)

(declare-fun v!520 () V!6569)

(declare-fun +!503 (ListLongMap!2921 tuple2!4008) ListLongMap!2921)

(assert (=> b!206638 (= lt!105709 (+!503 lt!105714 (tuple2!4009 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6294 0))(
  ( (Unit!6295) )
))
(declare-fun lt!105708 () Unit!6294)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!156 (array!9593 array!9595 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) (_ BitVec 64) V!6569 (_ BitVec 32) Int) Unit!6294)

(assert (=> b!206638 (= lt!105708 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!156 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!417 (array!9593 array!9595 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2921)

(assert (=> b!206638 (= lt!105712 (getCurrentListMapNoExtraKeys!417 _keys!825 lt!105711 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206638 (= lt!105711 (array!9596 (store (arr!4548 _values!649) i!601 (ValueCellFull!2252 v!520)) (size!4873 _values!649)))))

(assert (=> b!206638 (= lt!105714 (getCurrentListMapNoExtraKeys!417 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!100144 () Bool)

(assert (=> start!20676 (=> (not res!100144) (not e!135028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20676 (= res!100144 (validMask!0 mask!1149))))

(assert (=> start!20676 e!135028))

(declare-fun e!135026 () Bool)

(declare-fun array_inv!3007 (array!9595) Bool)

(assert (=> start!20676 (and (array_inv!3007 _values!649) e!135026)))

(assert (=> start!20676 true))

(declare-fun tp_is_empty!5191 () Bool)

(assert (=> start!20676 tp_is_empty!5191))

(declare-fun array_inv!3008 (array!9593) Bool)

(assert (=> start!20676 (array_inv!3008 _keys!825)))

(assert (=> start!20676 tp!19037))

(declare-fun b!206639 () Bool)

(declare-fun e!135029 () Bool)

(assert (=> b!206639 (= e!135029 tp_is_empty!5191)))

(declare-fun b!206640 () Bool)

(declare-fun res!100147 () Bool)

(assert (=> b!206640 (=> (not res!100147) (not e!135028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9593 (_ BitVec 32)) Bool)

(assert (=> b!206640 (= res!100147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206641 () Bool)

(declare-fun e!135025 () Bool)

(declare-fun mapRes!8855 () Bool)

(assert (=> b!206641 (= e!135026 (and e!135025 mapRes!8855))))

(declare-fun condMapEmpty!8855 () Bool)

(declare-fun mapDefault!8855 () ValueCell!2252)

