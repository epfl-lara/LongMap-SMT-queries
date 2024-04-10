; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71402 () Bool)

(assert start!71402)

(declare-fun b_free!13465 () Bool)

(declare-fun b_next!13465 () Bool)

(assert (=> start!71402 (= b_free!13465 (not b_next!13465))))

(declare-fun tp!47173 () Bool)

(declare-fun b_and!22459 () Bool)

(assert (=> start!71402 (= tp!47173 b_and!22459)))

(declare-fun mapNonEmpty!24406 () Bool)

(declare-fun mapRes!24406 () Bool)

(declare-fun tp!47172 () Bool)

(declare-fun e!462187 () Bool)

(assert (=> mapNonEmpty!24406 (= mapRes!24406 (and tp!47172 e!462187))))

(declare-datatypes ((V!25235 0))(
  ( (V!25236 (val!7635 Int)) )
))
(declare-datatypes ((ValueCell!7172 0))(
  ( (ValueCellFull!7172 (v!10074 V!25235)) (EmptyCell!7172) )
))
(declare-fun mapValue!24406 () ValueCell!7172)

(declare-fun mapKey!24406 () (_ BitVec 32))

(declare-datatypes ((array!46514 0))(
  ( (array!46515 (arr!22296 (Array (_ BitVec 32) ValueCell!7172)) (size!22717 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46514)

(declare-fun mapRest!24406 () (Array (_ BitVec 32) ValueCell!7172))

(assert (=> mapNonEmpty!24406 (= (arr!22296 _values!788) (store mapRest!24406 mapKey!24406 mapValue!24406))))

(declare-fun b!829232 () Bool)

(declare-fun res!564930 () Bool)

(declare-fun e!462186 () Bool)

(assert (=> b!829232 (=> (not res!564930) (not e!462186))))

(declare-datatypes ((array!46516 0))(
  ( (array!46517 (arr!22297 (Array (_ BitVec 32) (_ BitVec 64))) (size!22718 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46516)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46516 (_ BitVec 32)) Bool)

(assert (=> b!829232 (= res!564930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829233 () Bool)

(declare-fun res!564926 () Bool)

(assert (=> b!829233 (=> (not res!564926) (not e!462186))))

(declare-datatypes ((List!15917 0))(
  ( (Nil!15914) (Cons!15913 (h!17042 (_ BitVec 64)) (t!22276 List!15917)) )
))
(declare-fun arrayNoDuplicates!0 (array!46516 (_ BitVec 32) List!15917) Bool)

(assert (=> b!829233 (= res!564926 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15914))))

(declare-fun b!829234 () Bool)

(declare-fun e!462192 () Bool)

(declare-fun tp_is_empty!15175 () Bool)

(assert (=> b!829234 (= e!462192 tp_is_empty!15175)))

(declare-fun b!829235 () Bool)

(declare-fun e!462188 () Bool)

(declare-fun e!462189 () Bool)

(assert (=> b!829235 (= e!462188 e!462189)))

(declare-fun res!564928 () Bool)

(assert (=> b!829235 (=> res!564928 e!462189)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829235 (= res!564928 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun zeroValueBefore!34 () V!25235)

(declare-fun minValue!754 () V!25235)

(declare-fun b!829236 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10124 0))(
  ( (tuple2!10125 (_1!5073 (_ BitVec 64)) (_2!5073 V!25235)) )
))
(declare-datatypes ((List!15918 0))(
  ( (Nil!15915) (Cons!15914 (h!17043 tuple2!10124) (t!22277 List!15918)) )
))
(declare-datatypes ((ListLongMap!8947 0))(
  ( (ListLongMap!8948 (toList!4489 List!15918)) )
))
(declare-fun lt!375970 () ListLongMap!8947)

(declare-fun getCurrentListMap!2589 (array!46516 array!46514 (_ BitVec 32) (_ BitVec 32) V!25235 V!25235 (_ BitVec 32) Int) ListLongMap!8947)

(declare-fun +!1970 (ListLongMap!8947 tuple2!10124) ListLongMap!8947)

(assert (=> b!829236 (= e!462189 (= (getCurrentListMap!2589 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1970 lt!375970 (tuple2!10125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!462191 () Bool)

(declare-fun zeroValueAfter!34 () V!25235)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!829237 () Bool)

(assert (=> b!829237 (= e!462191 (= (getCurrentListMap!2589 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1970 (+!1970 lt!375970 (tuple2!10125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829238 () Bool)

(declare-fun e!462190 () Bool)

(assert (=> b!829238 (= e!462190 (and e!462192 mapRes!24406))))

(declare-fun condMapEmpty!24406 () Bool)

(declare-fun mapDefault!24406 () ValueCell!7172)

