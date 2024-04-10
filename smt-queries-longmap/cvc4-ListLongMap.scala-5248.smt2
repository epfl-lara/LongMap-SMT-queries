; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70592 () Bool)

(assert start!70592)

(declare-fun b_free!12899 () Bool)

(declare-fun b_next!12899 () Bool)

(assert (=> start!70592 (= b_free!12899 (not b_next!12899))))

(declare-fun tp!45432 () Bool)

(declare-fun b_and!21741 () Bool)

(assert (=> start!70592 (= tp!45432 b_and!21741)))

(declare-fun res!559590 () Bool)

(declare-fun e!455557 () Bool)

(assert (=> start!70592 (=> (not res!559590) (not e!455557))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70592 (= res!559590 (validMask!0 mask!1312))))

(assert (=> start!70592 e!455557))

(declare-fun tp_is_empty!14609 () Bool)

(assert (=> start!70592 tp_is_empty!14609))

(declare-datatypes ((array!45412 0))(
  ( (array!45413 (arr!21759 (Array (_ BitVec 32) (_ BitVec 64))) (size!22180 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45412)

(declare-fun array_inv!17393 (array!45412) Bool)

(assert (=> start!70592 (array_inv!17393 _keys!976)))

(assert (=> start!70592 true))

(declare-datatypes ((V!24479 0))(
  ( (V!24480 (val!7352 Int)) )
))
(declare-datatypes ((ValueCell!6889 0))(
  ( (ValueCellFull!6889 (v!9782 V!24479)) (EmptyCell!6889) )
))
(declare-datatypes ((array!45414 0))(
  ( (array!45415 (arr!21760 (Array (_ BitVec 32) ValueCell!6889)) (size!22181 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45414)

(declare-fun e!455559 () Bool)

(declare-fun array_inv!17394 (array!45414) Bool)

(assert (=> start!70592 (and (array_inv!17394 _values!788) e!455559)))

(assert (=> start!70592 tp!45432))

(declare-fun b!820088 () Bool)

(declare-fun e!455556 () Bool)

(assert (=> b!820088 (= e!455556 tp_is_empty!14609)))

(declare-datatypes ((tuple2!9682 0))(
  ( (tuple2!9683 (_1!4852 (_ BitVec 64)) (_2!4852 V!24479)) )
))
(declare-datatypes ((List!15505 0))(
  ( (Nil!15502) (Cons!15501 (h!16630 tuple2!9682) (t!21836 List!15505)) )
))
(declare-datatypes ((ListLongMap!8505 0))(
  ( (ListLongMap!8506 (toList!4268 List!15505)) )
))
(declare-fun lt!368431 () ListLongMap!8505)

(declare-fun zeroValueAfter!34 () V!24479)

(declare-fun lt!368430 () ListLongMap!8505)

(declare-fun b!820089 () Bool)

(declare-fun e!455560 () Bool)

(declare-fun +!1863 (ListLongMap!8505 tuple2!9682) ListLongMap!8505)

(assert (=> b!820089 (= e!455560 (= lt!368431 (+!1863 lt!368430 (tuple2!9683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820090 () Bool)

(declare-fun res!559589 () Bool)

(assert (=> b!820090 (=> (not res!559589) (not e!455557))))

(declare-datatypes ((List!15506 0))(
  ( (Nil!15503) (Cons!15502 (h!16631 (_ BitVec 64)) (t!21837 List!15506)) )
))
(declare-fun arrayNoDuplicates!0 (array!45412 (_ BitVec 32) List!15506) Bool)

(assert (=> b!820090 (= res!559589 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15503))))

(declare-fun b!820091 () Bool)

(declare-fun res!559588 () Bool)

(assert (=> b!820091 (=> (not res!559588) (not e!455557))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820091 (= res!559588 (and (= (size!22181 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22180 _keys!976) (size!22181 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820092 () Bool)

(declare-fun res!559592 () Bool)

(assert (=> b!820092 (=> (not res!559592) (not e!455557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45412 (_ BitVec 32)) Bool)

(assert (=> b!820092 (= res!559592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820093 () Bool)

(declare-fun e!455558 () Bool)

(assert (=> b!820093 (= e!455558 tp_is_empty!14609)))

(declare-fun mapNonEmpty!23515 () Bool)

(declare-fun mapRes!23515 () Bool)

(declare-fun tp!45433 () Bool)

(assert (=> mapNonEmpty!23515 (= mapRes!23515 (and tp!45433 e!455558))))

(declare-fun mapRest!23515 () (Array (_ BitVec 32) ValueCell!6889))

(declare-fun mapKey!23515 () (_ BitVec 32))

(declare-fun mapValue!23515 () ValueCell!6889)

(assert (=> mapNonEmpty!23515 (= (arr!21760 _values!788) (store mapRest!23515 mapKey!23515 mapValue!23515))))

(declare-fun b!820094 () Bool)

(assert (=> b!820094 (= e!455559 (and e!455556 mapRes!23515))))

(declare-fun condMapEmpty!23515 () Bool)

(declare-fun mapDefault!23515 () ValueCell!6889)

