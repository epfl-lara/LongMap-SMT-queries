; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71238 () Bool)

(assert start!71238)

(declare-fun b_free!13385 () Bool)

(declare-fun b_next!13385 () Bool)

(assert (=> start!71238 (= b_free!13385 (not b_next!13385))))

(declare-fun tp!46917 () Bool)

(declare-fun b_and!22323 () Bool)

(assert (=> start!71238 (= tp!46917 b_and!22323)))

(declare-fun b!827491 () Bool)

(declare-fun e!460978 () Bool)

(declare-fun tp_is_empty!15095 () Bool)

(assert (=> b!827491 (= e!460978 tp_is_empty!15095)))

(declare-fun mapNonEmpty!24271 () Bool)

(declare-fun mapRes!24271 () Bool)

(declare-fun tp!46918 () Bool)

(declare-fun e!460975 () Bool)

(assert (=> mapNonEmpty!24271 (= mapRes!24271 (and tp!46918 e!460975))))

(declare-datatypes ((V!25127 0))(
  ( (V!25128 (val!7595 Int)) )
))
(declare-datatypes ((ValueCell!7132 0))(
  ( (ValueCellFull!7132 (v!10030 V!25127)) (EmptyCell!7132) )
))
(declare-fun mapValue!24271 () ValueCell!7132)

(declare-fun mapKey!24271 () (_ BitVec 32))

(declare-datatypes ((array!46364 0))(
  ( (array!46365 (arr!22226 (Array (_ BitVec 32) ValueCell!7132)) (size!22647 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46364)

(declare-fun mapRest!24271 () (Array (_ BitVec 32) ValueCell!7132))

(assert (=> mapNonEmpty!24271 (= (arr!22226 _values!788) (store mapRest!24271 mapKey!24271 mapValue!24271))))

(declare-fun b!827492 () Bool)

(declare-fun res!564008 () Bool)

(declare-fun e!460979 () Bool)

(assert (=> b!827492 (=> (not res!564008) (not e!460979))))

(declare-datatypes ((array!46366 0))(
  ( (array!46367 (arr!22227 (Array (_ BitVec 32) (_ BitVec 64))) (size!22648 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46366)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827492 (= res!564008 (and (= (size!22647 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22648 _keys!976) (size!22647 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!564005 () Bool)

(assert (=> start!71238 (=> (not res!564005) (not e!460979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71238 (= res!564005 (validMask!0 mask!1312))))

(assert (=> start!71238 e!460979))

(assert (=> start!71238 tp_is_empty!15095))

(declare-fun array_inv!17711 (array!46366) Bool)

(assert (=> start!71238 (array_inv!17711 _keys!976)))

(assert (=> start!71238 true))

(declare-fun e!460977 () Bool)

(declare-fun array_inv!17712 (array!46364) Bool)

(assert (=> start!71238 (and (array_inv!17712 _values!788) e!460977)))

(assert (=> start!71238 tp!46917))

(declare-fun mapIsEmpty!24271 () Bool)

(assert (=> mapIsEmpty!24271 mapRes!24271))

(declare-fun b!827493 () Bool)

(declare-fun res!564006 () Bool)

(assert (=> b!827493 (=> (not res!564006) (not e!460979))))

(declare-datatypes ((List!15865 0))(
  ( (Nil!15862) (Cons!15861 (h!16990 (_ BitVec 64)) (t!22214 List!15865)) )
))
(declare-fun arrayNoDuplicates!0 (array!46366 (_ BitVec 32) List!15865) Bool)

(assert (=> b!827493 (= res!564006 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15862))))

(declare-fun b!827494 () Bool)

(assert (=> b!827494 (= e!460975 tp_is_empty!15095)))

(declare-fun b!827495 () Bool)

(declare-fun res!564007 () Bool)

(assert (=> b!827495 (=> (not res!564007) (not e!460979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46366 (_ BitVec 32)) Bool)

(assert (=> b!827495 (= res!564007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827496 () Bool)

(assert (=> b!827496 (= e!460979 false)))

(declare-fun zeroValueAfter!34 () V!25127)

(declare-fun minValue!754 () V!25127)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10070 0))(
  ( (tuple2!10071 (_1!5046 (_ BitVec 64)) (_2!5046 V!25127)) )
))
(declare-datatypes ((List!15866 0))(
  ( (Nil!15863) (Cons!15862 (h!16991 tuple2!10070) (t!22215 List!15866)) )
))
(declare-datatypes ((ListLongMap!8893 0))(
  ( (ListLongMap!8894 (toList!4462 List!15866)) )
))
(declare-fun lt!374920 () ListLongMap!8893)

(declare-fun getCurrentListMapNoExtraKeys!2464 (array!46366 array!46364 (_ BitVec 32) (_ BitVec 32) V!25127 V!25127 (_ BitVec 32) Int) ListLongMap!8893)

(assert (=> b!827496 (= lt!374920 (getCurrentListMapNoExtraKeys!2464 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25127)

(declare-fun lt!374921 () ListLongMap!8893)

(assert (=> b!827496 (= lt!374921 (getCurrentListMapNoExtraKeys!2464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827497 () Bool)

(assert (=> b!827497 (= e!460977 (and e!460978 mapRes!24271))))

(declare-fun condMapEmpty!24271 () Bool)

(declare-fun mapDefault!24271 () ValueCell!7132)

