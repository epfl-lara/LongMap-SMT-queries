; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70230 () Bool)

(assert start!70230)

(declare-fun b_free!12623 () Bool)

(declare-fun b_next!12623 () Bool)

(assert (=> start!70230 (= b_free!12623 (not b_next!12623))))

(declare-fun tp!44589 () Bool)

(declare-fun b_and!21411 () Bool)

(assert (=> start!70230 (= tp!44589 b_and!21411)))

(declare-fun b!815919 () Bool)

(declare-fun e!452517 () Bool)

(assert (=> b!815919 (= e!452517 true)))

(declare-datatypes ((array!44866 0))(
  ( (array!44867 (arr!21491 (Array (_ BitVec 32) (_ BitVec 64))) (size!21912 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44866)

(declare-datatypes ((V!24111 0))(
  ( (V!24112 (val!7214 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24111)

(declare-fun minValue!754 () V!24111)

(declare-datatypes ((ValueCell!6751 0))(
  ( (ValueCellFull!6751 (v!9641 V!24111)) (EmptyCell!6751) )
))
(declare-datatypes ((array!44868 0))(
  ( (array!44869 (arr!21492 (Array (_ BitVec 32) ValueCell!6751)) (size!21913 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44868)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9468 0))(
  ( (tuple2!9469 (_1!4745 (_ BitVec 64)) (_2!4745 V!24111)) )
))
(declare-datatypes ((List!15299 0))(
  ( (Nil!15296) (Cons!15295 (h!16424 tuple2!9468) (t!21620 List!15299)) )
))
(declare-datatypes ((ListLongMap!8291 0))(
  ( (ListLongMap!8292 (toList!4161 List!15299)) )
))
(declare-fun lt!365344 () ListLongMap!8291)

(declare-fun getCurrentListMap!2389 (array!44866 array!44868 (_ BitVec 32) (_ BitVec 32) V!24111 V!24111 (_ BitVec 32) Int) ListLongMap!8291)

(assert (=> b!815919 (= lt!365344 (getCurrentListMap!2389 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365341 () ListLongMap!8291)

(declare-fun zeroValueBefore!34 () V!24111)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1795 (ListLongMap!8291 tuple2!9468) ListLongMap!8291)

(assert (=> b!815919 (= lt!365341 (+!1795 (getCurrentListMap!2389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23086 () Bool)

(declare-fun mapRes!23086 () Bool)

(assert (=> mapIsEmpty!23086 mapRes!23086))

(declare-fun b!815920 () Bool)

(declare-fun e!452520 () Bool)

(declare-fun tp_is_empty!14333 () Bool)

(assert (=> b!815920 (= e!452520 tp_is_empty!14333)))

(declare-fun b!815921 () Bool)

(declare-fun res!557111 () Bool)

(declare-fun e!452518 () Bool)

(assert (=> b!815921 (=> (not res!557111) (not e!452518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44866 (_ BitVec 32)) Bool)

(assert (=> b!815921 (= res!557111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815922 () Bool)

(declare-fun e!452522 () Bool)

(assert (=> b!815922 (= e!452522 tp_is_empty!14333)))

(declare-fun res!557113 () Bool)

(assert (=> start!70230 (=> (not res!557113) (not e!452518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70230 (= res!557113 (validMask!0 mask!1312))))

(assert (=> start!70230 e!452518))

(assert (=> start!70230 tp_is_empty!14333))

(declare-fun array_inv!17199 (array!44866) Bool)

(assert (=> start!70230 (array_inv!17199 _keys!976)))

(assert (=> start!70230 true))

(declare-fun e!452519 () Bool)

(declare-fun array_inv!17200 (array!44868) Bool)

(assert (=> start!70230 (and (array_inv!17200 _values!788) e!452519)))

(assert (=> start!70230 tp!44589))

(declare-fun mapNonEmpty!23086 () Bool)

(declare-fun tp!44590 () Bool)

(assert (=> mapNonEmpty!23086 (= mapRes!23086 (and tp!44590 e!452522))))

(declare-fun mapKey!23086 () (_ BitVec 32))

(declare-fun mapRest!23086 () (Array (_ BitVec 32) ValueCell!6751))

(declare-fun mapValue!23086 () ValueCell!6751)

(assert (=> mapNonEmpty!23086 (= (arr!21492 _values!788) (store mapRest!23086 mapKey!23086 mapValue!23086))))

(declare-fun b!815923 () Bool)

(declare-fun res!557110 () Bool)

(assert (=> b!815923 (=> (not res!557110) (not e!452518))))

(declare-datatypes ((List!15300 0))(
  ( (Nil!15297) (Cons!15296 (h!16425 (_ BitVec 64)) (t!21621 List!15300)) )
))
(declare-fun arrayNoDuplicates!0 (array!44866 (_ BitVec 32) List!15300) Bool)

(assert (=> b!815923 (= res!557110 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15297))))

(declare-fun b!815924 () Bool)

(assert (=> b!815924 (= e!452519 (and e!452520 mapRes!23086))))

(declare-fun condMapEmpty!23086 () Bool)

(declare-fun mapDefault!23086 () ValueCell!6751)

