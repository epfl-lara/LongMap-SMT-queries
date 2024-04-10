; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71078 () Bool)

(assert start!71078)

(declare-fun b_free!13265 () Bool)

(declare-fun b_next!13265 () Bool)

(assert (=> start!71078 (= b_free!13265 (not b_next!13265))))

(declare-fun tp!46552 () Bool)

(declare-fun b_and!22179 () Bool)

(assert (=> start!71078 (= tp!46552 b_and!22179)))

(declare-fun b!825438 () Bool)

(declare-fun res!562700 () Bool)

(declare-fun e!459435 () Bool)

(assert (=> b!825438 (=> (not res!562700) (not e!459435))))

(declare-datatypes ((array!46134 0))(
  ( (array!46135 (arr!22113 (Array (_ BitVec 32) (_ BitVec 64))) (size!22534 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46134)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24967 0))(
  ( (V!24968 (val!7535 Int)) )
))
(declare-datatypes ((ValueCell!7072 0))(
  ( (ValueCellFull!7072 (v!9968 V!24967)) (EmptyCell!7072) )
))
(declare-datatypes ((array!46136 0))(
  ( (array!46137 (arr!22114 (Array (_ BitVec 32) ValueCell!7072)) (size!22535 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46136)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825438 (= res!562700 (and (= (size!22535 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22534 _keys!976) (size!22535 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825439 () Bool)

(declare-fun e!459441 () Bool)

(declare-fun tp_is_empty!14975 () Bool)

(assert (=> b!825439 (= e!459441 tp_is_empty!14975)))

(declare-datatypes ((tuple2!9974 0))(
  ( (tuple2!9975 (_1!4998 (_ BitVec 64)) (_2!4998 V!24967)) )
))
(declare-datatypes ((List!15779 0))(
  ( (Nil!15776) (Cons!15775 (h!16904 tuple2!9974) (t!22124 List!15779)) )
))
(declare-datatypes ((ListLongMap!8797 0))(
  ( (ListLongMap!8798 (toList!4414 List!15779)) )
))
(declare-fun lt!372679 () ListLongMap!8797)

(declare-fun e!459440 () Bool)

(declare-fun lt!372678 () tuple2!9974)

(declare-fun lt!372672 () ListLongMap!8797)

(declare-fun b!825440 () Bool)

(declare-fun zeroValueAfter!34 () V!24967)

(declare-fun +!1921 (ListLongMap!8797 tuple2!9974) ListLongMap!8797)

(assert (=> b!825440 (= e!459440 (= lt!372679 (+!1921 (+!1921 lt!372672 (tuple2!9975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372678)))))

(declare-fun b!825442 () Bool)

(declare-fun res!562699 () Bool)

(assert (=> b!825442 (=> (not res!562699) (not e!459435))))

(declare-datatypes ((List!15780 0))(
  ( (Nil!15777) (Cons!15776 (h!16905 (_ BitVec 64)) (t!22125 List!15780)) )
))
(declare-fun arrayNoDuplicates!0 (array!46134 (_ BitVec 32) List!15780) Bool)

(assert (=> b!825442 (= res!562699 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15777))))

(declare-fun mapNonEmpty!24085 () Bool)

(declare-fun mapRes!24085 () Bool)

(declare-fun tp!46551 () Bool)

(assert (=> mapNonEmpty!24085 (= mapRes!24085 (and tp!46551 e!459441))))

(declare-fun mapValue!24085 () ValueCell!7072)

(declare-fun mapRest!24085 () (Array (_ BitVec 32) ValueCell!7072))

(declare-fun mapKey!24085 () (_ BitVec 32))

(assert (=> mapNonEmpty!24085 (= (arr!22114 _values!788) (store mapRest!24085 mapKey!24085 mapValue!24085))))

(declare-fun b!825443 () Bool)

(declare-fun e!459438 () Bool)

(declare-fun e!459439 () Bool)

(assert (=> b!825443 (= e!459438 (and e!459439 mapRes!24085))))

(declare-fun condMapEmpty!24085 () Bool)

(declare-fun mapDefault!24085 () ValueCell!7072)

