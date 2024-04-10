; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104628 () Bool)

(assert start!104628)

(declare-fun mapNonEmpty!48790 () Bool)

(declare-fun mapRes!48790 () Bool)

(declare-fun tp!92891 () Bool)

(declare-fun e!707793 () Bool)

(assert (=> mapNonEmpty!48790 (= mapRes!48790 (and tp!92891 e!707793))))

(declare-fun mapKey!48790 () (_ BitVec 32))

(declare-datatypes ((V!47175 0))(
  ( (V!47176 (val!15741 Int)) )
))
(declare-datatypes ((ValueCell!14915 0))(
  ( (ValueCellFull!14915 (v!18437 V!47175)) (EmptyCell!14915) )
))
(declare-datatypes ((array!80410 0))(
  ( (array!80411 (arr!38774 (Array (_ BitVec 32) ValueCell!14915)) (size!39310 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80410)

(declare-fun mapValue!48790 () ValueCell!14915)

(declare-fun mapRest!48790 () (Array (_ BitVec 32) ValueCell!14915))

(assert (=> mapNonEmpty!48790 (= (arr!38774 _values!914) (store mapRest!48790 mapKey!48790 mapValue!48790))))

(declare-fun b!1247593 () Bool)

(declare-fun res!832446 () Bool)

(declare-fun e!707794 () Bool)

(assert (=> b!1247593 (=> (not res!832446) (not e!707794))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80412 0))(
  ( (array!80413 (arr!38775 (Array (_ BitVec 32) (_ BitVec 64))) (size!39311 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80412)

(assert (=> b!1247593 (= res!832446 (and (= (size!39310 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39311 _keys!1118) (size!39310 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247594 () Bool)

(assert (=> b!1247594 (= e!707794 false)))

(declare-fun lt!563287 () Bool)

(declare-datatypes ((List!27532 0))(
  ( (Nil!27529) (Cons!27528 (h!28737 (_ BitVec 64)) (t!41001 List!27532)) )
))
(declare-fun arrayNoDuplicates!0 (array!80412 (_ BitVec 32) List!27532) Bool)

(assert (=> b!1247594 (= lt!563287 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27529))))

(declare-fun b!1247595 () Bool)

(declare-fun e!707797 () Bool)

(declare-fun e!707796 () Bool)

(assert (=> b!1247595 (= e!707797 (and e!707796 mapRes!48790))))

(declare-fun condMapEmpty!48790 () Bool)

(declare-fun mapDefault!48790 () ValueCell!14915)

