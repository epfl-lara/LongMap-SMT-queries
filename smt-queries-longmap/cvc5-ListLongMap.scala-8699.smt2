; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105628 () Bool)

(assert start!105628)

(declare-fun b_free!27229 () Bool)

(declare-fun b_next!27229 () Bool)

(assert (=> start!105628 (= b_free!27229 (not b_next!27229))))

(declare-fun tp!95210 () Bool)

(declare-fun b_and!45103 () Bool)

(assert (=> start!105628 (= tp!95210 b_and!45103)))

(declare-fun b!1258225 () Bool)

(declare-fun e!715574 () Bool)

(declare-fun tp_is_empty!32131 () Bool)

(assert (=> b!1258225 (= e!715574 tp_is_empty!32131)))

(declare-fun mapIsEmpty!49990 () Bool)

(declare-fun mapRes!49990 () Bool)

(assert (=> mapIsEmpty!49990 mapRes!49990))

(declare-fun mapNonEmpty!49990 () Bool)

(declare-fun tp!95209 () Bool)

(assert (=> mapNonEmpty!49990 (= mapRes!49990 (and tp!95209 e!715574))))

(declare-fun mapKey!49990 () (_ BitVec 32))

(declare-datatypes ((V!48207 0))(
  ( (V!48208 (val!16128 Int)) )
))
(declare-datatypes ((ValueCell!15302 0))(
  ( (ValueCellFull!15302 (v!18830 V!48207)) (EmptyCell!15302) )
))
(declare-fun mapValue!49990 () ValueCell!15302)

(declare-fun mapRest!49990 () (Array (_ BitVec 32) ValueCell!15302))

(declare-datatypes ((array!81886 0))(
  ( (array!81887 (arr!39499 (Array (_ BitVec 32) ValueCell!15302)) (size!40035 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81886)

(assert (=> mapNonEmpty!49990 (= (arr!39499 _values!914) (store mapRest!49990 mapKey!49990 mapValue!49990))))

(declare-fun res!838635 () Bool)

(declare-fun e!715577 () Bool)

(assert (=> start!105628 (=> (not res!838635) (not e!715577))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105628 (= res!838635 (validMask!0 mask!1466))))

(assert (=> start!105628 e!715577))

(assert (=> start!105628 true))

(assert (=> start!105628 tp!95210))

(assert (=> start!105628 tp_is_empty!32131))

(declare-datatypes ((array!81888 0))(
  ( (array!81889 (arr!39500 (Array (_ BitVec 32) (_ BitVec 64))) (size!40036 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81888)

(declare-fun array_inv!30085 (array!81888) Bool)

(assert (=> start!105628 (array_inv!30085 _keys!1118)))

(declare-fun e!715575 () Bool)

(declare-fun array_inv!30086 (array!81886) Bool)

(assert (=> start!105628 (and (array_inv!30086 _values!914) e!715575)))

(declare-fun b!1258226 () Bool)

(declare-fun res!838634 () Bool)

(assert (=> b!1258226 (=> (not res!838634) (not e!715577))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258226 (= res!838634 (and (= (size!40035 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40036 _keys!1118) (size!40035 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258227 () Bool)

(declare-fun e!715572 () Bool)

(assert (=> b!1258227 (= e!715572 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20832 0))(
  ( (tuple2!20833 (_1!10427 (_ BitVec 64)) (_2!10427 V!48207)) )
))
(declare-datatypes ((List!28048 0))(
  ( (Nil!28045) (Cons!28044 (h!29253 tuple2!20832) (t!41541 List!28048)) )
))
(declare-datatypes ((ListLongMap!18705 0))(
  ( (ListLongMap!18706 (toList!9368 List!28048)) )
))
(declare-fun lt!569096 () ListLongMap!18705)

(declare-fun zeroValue!871 () V!48207)

(declare-fun minValueBefore!43 () V!48207)

(declare-fun getCurrentListMap!4573 (array!81888 array!81886 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18705)

(assert (=> b!1258227 (= lt!569096 (getCurrentListMap!4573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258228 () Bool)

(assert (=> b!1258228 (= e!715577 (not e!715572))))

(declare-fun res!838637 () Bool)

(assert (=> b!1258228 (=> res!838637 e!715572)))

(assert (=> b!1258228 (= res!838637 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569095 () ListLongMap!18705)

(declare-fun lt!569098 () ListLongMap!18705)

(assert (=> b!1258228 (= lt!569095 lt!569098)))

(declare-fun minValueAfter!43 () V!48207)

(declare-datatypes ((Unit!41920 0))(
  ( (Unit!41921) )
))
(declare-fun lt!569097 () Unit!41920)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1110 (array!81888 array!81886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 V!48207 V!48207 (_ BitVec 32) Int) Unit!41920)

(assert (=> b!1258228 (= lt!569097 (lemmaNoChangeToArrayThenSameMapNoExtras!1110 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5746 (array!81888 array!81886 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18705)

(assert (=> b!1258228 (= lt!569098 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258228 (= lt!569095 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258229 () Bool)

(declare-fun res!838633 () Bool)

(assert (=> b!1258229 (=> (not res!838633) (not e!715577))))

(declare-datatypes ((List!28049 0))(
  ( (Nil!28046) (Cons!28045 (h!29254 (_ BitVec 64)) (t!41542 List!28049)) )
))
(declare-fun arrayNoDuplicates!0 (array!81888 (_ BitVec 32) List!28049) Bool)

(assert (=> b!1258229 (= res!838633 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28046))))

(declare-fun b!1258230 () Bool)

(declare-fun res!838636 () Bool)

(assert (=> b!1258230 (=> (not res!838636) (not e!715577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81888 (_ BitVec 32)) Bool)

(assert (=> b!1258230 (= res!838636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258231 () Bool)

(declare-fun e!715576 () Bool)

(assert (=> b!1258231 (= e!715576 tp_is_empty!32131)))

(declare-fun b!1258232 () Bool)

(assert (=> b!1258232 (= e!715575 (and e!715576 mapRes!49990))))

(declare-fun condMapEmpty!49990 () Bool)

(declare-fun mapDefault!49990 () ValueCell!15302)

