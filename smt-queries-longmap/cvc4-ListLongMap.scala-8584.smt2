; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104738 () Bool)

(assert start!104738)

(declare-fun b_free!26543 () Bool)

(declare-fun b_next!26543 () Bool)

(assert (=> start!104738 (= b_free!26543 (not b_next!26543))))

(declare-fun tp!93119 () Bool)

(declare-fun b_and!44311 () Bool)

(assert (=> start!104738 (= tp!93119 b_and!44311)))

(declare-fun b!1248591 () Bool)

(declare-fun e!708529 () Bool)

(assert (=> b!1248591 (= e!708529 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47291 0))(
  ( (V!47292 (val!15785 Int)) )
))
(declare-fun minValueAfter!43 () V!47291)

(declare-datatypes ((tuple2!20330 0))(
  ( (tuple2!20331 (_1!10176 (_ BitVec 64)) (_2!10176 V!47291)) )
))
(declare-datatypes ((List!27578 0))(
  ( (Nil!27575) (Cons!27574 (h!28783 tuple2!20330) (t!41049 List!27578)) )
))
(declare-datatypes ((ListLongMap!18203 0))(
  ( (ListLongMap!18204 (toList!9117 List!27578)) )
))
(declare-fun lt!563458 () ListLongMap!18203)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47291)

(declare-datatypes ((array!80582 0))(
  ( (array!80583 (arr!38858 (Array (_ BitVec 32) (_ BitVec 64))) (size!39394 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80582)

(declare-datatypes ((ValueCell!14959 0))(
  ( (ValueCellFull!14959 (v!18481 V!47291)) (EmptyCell!14959) )
))
(declare-datatypes ((array!80584 0))(
  ( (array!80585 (arr!38859 (Array (_ BitVec 32) ValueCell!14959)) (size!39395 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80584)

(declare-fun getCurrentListMapNoExtraKeys!5524 (array!80582 array!80584 (_ BitVec 32) (_ BitVec 32) V!47291 V!47291 (_ BitVec 32) Int) ListLongMap!18203)

(assert (=> b!1248591 (= lt!563458 (getCurrentListMapNoExtraKeys!5524 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563457 () ListLongMap!18203)

(declare-fun minValueBefore!43 () V!47291)

(assert (=> b!1248591 (= lt!563457 (getCurrentListMapNoExtraKeys!5524 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248592 () Bool)

(declare-fun res!832980 () Bool)

(assert (=> b!1248592 (=> (not res!832980) (not e!708529))))

(assert (=> b!1248592 (= res!832980 (and (= (size!39395 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39394 _keys!1118) (size!39395 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832983 () Bool)

(assert (=> start!104738 (=> (not res!832983) (not e!708529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104738 (= res!832983 (validMask!0 mask!1466))))

(assert (=> start!104738 e!708529))

(assert (=> start!104738 true))

(assert (=> start!104738 tp!93119))

(declare-fun tp_is_empty!31445 () Bool)

(assert (=> start!104738 tp_is_empty!31445))

(declare-fun array_inv!29657 (array!80582) Bool)

(assert (=> start!104738 (array_inv!29657 _keys!1118)))

(declare-fun e!708532 () Bool)

(declare-fun array_inv!29658 (array!80584) Bool)

(assert (=> start!104738 (and (array_inv!29658 _values!914) e!708532)))

(declare-fun b!1248593 () Bool)

(declare-fun res!832981 () Bool)

(assert (=> b!1248593 (=> (not res!832981) (not e!708529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80582 (_ BitVec 32)) Bool)

(assert (=> b!1248593 (= res!832981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248594 () Bool)

(declare-fun res!832982 () Bool)

(assert (=> b!1248594 (=> (not res!832982) (not e!708529))))

(declare-datatypes ((List!27579 0))(
  ( (Nil!27576) (Cons!27575 (h!28784 (_ BitVec 64)) (t!41050 List!27579)) )
))
(declare-fun arrayNoDuplicates!0 (array!80582 (_ BitVec 32) List!27579) Bool)

(assert (=> b!1248594 (= res!832982 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27576))))

(declare-fun mapIsEmpty!48928 () Bool)

(declare-fun mapRes!48928 () Bool)

(assert (=> mapIsEmpty!48928 mapRes!48928))

(declare-fun mapNonEmpty!48928 () Bool)

(declare-fun tp!93118 () Bool)

(declare-fun e!708530 () Bool)

(assert (=> mapNonEmpty!48928 (= mapRes!48928 (and tp!93118 e!708530))))

(declare-fun mapKey!48928 () (_ BitVec 32))

(declare-fun mapRest!48928 () (Array (_ BitVec 32) ValueCell!14959))

(declare-fun mapValue!48928 () ValueCell!14959)

(assert (=> mapNonEmpty!48928 (= (arr!38859 _values!914) (store mapRest!48928 mapKey!48928 mapValue!48928))))

(declare-fun b!1248595 () Bool)

(declare-fun e!708528 () Bool)

(assert (=> b!1248595 (= e!708528 tp_is_empty!31445)))

(declare-fun b!1248596 () Bool)

(assert (=> b!1248596 (= e!708532 (and e!708528 mapRes!48928))))

(declare-fun condMapEmpty!48928 () Bool)

(declare-fun mapDefault!48928 () ValueCell!14959)

