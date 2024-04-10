; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104638 () Bool)

(assert start!104638)

(declare-fun mapNonEmpty!48805 () Bool)

(declare-fun mapRes!48805 () Bool)

(declare-fun tp!92906 () Bool)

(declare-fun e!707872 () Bool)

(assert (=> mapNonEmpty!48805 (= mapRes!48805 (and tp!92906 e!707872))))

(declare-datatypes ((V!47187 0))(
  ( (V!47188 (val!15746 Int)) )
))
(declare-datatypes ((ValueCell!14920 0))(
  ( (ValueCellFull!14920 (v!18442 V!47187)) (EmptyCell!14920) )
))
(declare-fun mapRest!48805 () (Array (_ BitVec 32) ValueCell!14920))

(declare-fun mapValue!48805 () ValueCell!14920)

(declare-datatypes ((array!80428 0))(
  ( (array!80429 (arr!38783 (Array (_ BitVec 32) ValueCell!14920)) (size!39319 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80428)

(declare-fun mapKey!48805 () (_ BitVec 32))

(assert (=> mapNonEmpty!48805 (= (arr!38783 _values!914) (store mapRest!48805 mapKey!48805 mapValue!48805))))

(declare-fun b!1247683 () Bool)

(declare-fun e!707868 () Bool)

(assert (=> b!1247683 (= e!707868 false)))

(declare-fun lt!563302 () Bool)

(declare-datatypes ((array!80430 0))(
  ( (array!80431 (arr!38784 (Array (_ BitVec 32) (_ BitVec 64))) (size!39320 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80430)

(declare-datatypes ((List!27535 0))(
  ( (Nil!27532) (Cons!27531 (h!28740 (_ BitVec 64)) (t!41004 List!27535)) )
))
(declare-fun arrayNoDuplicates!0 (array!80430 (_ BitVec 32) List!27535) Bool)

(assert (=> b!1247683 (= lt!563302 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27532))))

(declare-fun b!1247684 () Bool)

(declare-fun tp_is_empty!31367 () Bool)

(assert (=> b!1247684 (= e!707872 tp_is_empty!31367)))

(declare-fun b!1247685 () Bool)

(declare-fun res!832490 () Bool)

(assert (=> b!1247685 (=> (not res!832490) (not e!707868))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247685 (= res!832490 (and (= (size!39319 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39320 _keys!1118) (size!39319 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247686 () Bool)

(declare-fun res!832491 () Bool)

(assert (=> b!1247686 (=> (not res!832491) (not e!707868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80430 (_ BitVec 32)) Bool)

(assert (=> b!1247686 (= res!832491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247687 () Bool)

(declare-fun e!707871 () Bool)

(declare-fun e!707869 () Bool)

(assert (=> b!1247687 (= e!707871 (and e!707869 mapRes!48805))))

(declare-fun condMapEmpty!48805 () Bool)

(declare-fun mapDefault!48805 () ValueCell!14920)

