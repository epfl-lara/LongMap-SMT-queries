; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105732 () Bool)

(assert start!105732)

(declare-fun b_free!27317 () Bool)

(declare-fun b_next!27317 () Bool)

(assert (=> start!105732 (= b_free!27317 (not b_next!27317))))

(declare-fun tp!95476 () Bool)

(declare-fun b_and!45201 () Bool)

(assert (=> start!105732 (= tp!95476 b_and!45201)))

(declare-fun b!1259500 () Bool)

(declare-fun e!716531 () Bool)

(declare-fun e!716534 () Bool)

(assert (=> b!1259500 (= e!716531 (not e!716534))))

(declare-fun res!839425 () Bool)

(assert (=> b!1259500 (=> res!839425 e!716534)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259500 (= res!839425 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48323 0))(
  ( (V!48324 (val!16172 Int)) )
))
(declare-datatypes ((tuple2!20906 0))(
  ( (tuple2!20907 (_1!10464 (_ BitVec 64)) (_2!10464 V!48323)) )
))
(declare-datatypes ((List!28113 0))(
  ( (Nil!28110) (Cons!28109 (h!29318 tuple2!20906) (t!41608 List!28113)) )
))
(declare-datatypes ((ListLongMap!18779 0))(
  ( (ListLongMap!18780 (toList!9405 List!28113)) )
))
(declare-fun lt!570144 () ListLongMap!18779)

(declare-fun lt!570142 () ListLongMap!18779)

(assert (=> b!1259500 (= lt!570144 lt!570142)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48323)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48323)

(declare-datatypes ((array!82056 0))(
  ( (array!82057 (arr!39583 (Array (_ BitVec 32) (_ BitVec 64))) (size!40119 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82056)

(declare-datatypes ((ValueCell!15346 0))(
  ( (ValueCellFull!15346 (v!18874 V!48323)) (EmptyCell!15346) )
))
(declare-datatypes ((array!82058 0))(
  ( (array!82059 (arr!39584 (Array (_ BitVec 32) ValueCell!15346)) (size!40120 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82058)

(declare-datatypes ((Unit!41993 0))(
  ( (Unit!41994) )
))
(declare-fun lt!570139 () Unit!41993)

(declare-fun minValueBefore!43 () V!48323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1145 (array!82056 array!82058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48323 V!48323 V!48323 V!48323 (_ BitVec 32) Int) Unit!41993)

(assert (=> b!1259500 (= lt!570139 (lemmaNoChangeToArrayThenSameMapNoExtras!1145 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5781 (array!82056 array!82058 (_ BitVec 32) (_ BitVec 32) V!48323 V!48323 (_ BitVec 32) Int) ListLongMap!18779)

(assert (=> b!1259500 (= lt!570142 (getCurrentListMapNoExtraKeys!5781 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259500 (= lt!570144 (getCurrentListMapNoExtraKeys!5781 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839422 () Bool)

(assert (=> start!105732 (=> (not res!839422) (not e!716531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105732 (= res!839422 (validMask!0 mask!1466))))

(assert (=> start!105732 e!716531))

(assert (=> start!105732 true))

(assert (=> start!105732 tp!95476))

(declare-fun tp_is_empty!32219 () Bool)

(assert (=> start!105732 tp_is_empty!32219))

(declare-fun array_inv!30137 (array!82056) Bool)

(assert (=> start!105732 (array_inv!30137 _keys!1118)))

(declare-fun e!716533 () Bool)

(declare-fun array_inv!30138 (array!82058) Bool)

(assert (=> start!105732 (and (array_inv!30138 _values!914) e!716533)))

(declare-fun b!1259501 () Bool)

(declare-fun e!716529 () Bool)

(assert (=> b!1259501 (= e!716529 tp_is_empty!32219)))

(declare-fun b!1259502 () Bool)

(declare-fun mapRes!50125 () Bool)

(assert (=> b!1259502 (= e!716533 (and e!716529 mapRes!50125))))

(declare-fun condMapEmpty!50125 () Bool)

(declare-fun mapDefault!50125 () ValueCell!15346)

