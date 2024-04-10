; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70722 () Bool)

(assert start!70722)

(declare-fun b_free!12995 () Bool)

(declare-fun b_next!12995 () Bool)

(assert (=> start!70722 (= b_free!12995 (not b_next!12995))))

(declare-fun tp!45726 () Bool)

(declare-fun b_and!21857 () Bool)

(assert (=> start!70722 (= tp!45726 b_and!21857)))

(declare-fun b!821457 () Bool)

(declare-fun res!560370 () Bool)

(declare-fun e!456540 () Bool)

(assert (=> b!821457 (=> (not res!560370) (not e!456540))))

(declare-datatypes ((array!45606 0))(
  ( (array!45607 (arr!21854 (Array (_ BitVec 32) (_ BitVec 64))) (size!22275 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45606)

(declare-datatypes ((List!15580 0))(
  ( (Nil!15577) (Cons!15576 (h!16705 (_ BitVec 64)) (t!21915 List!15580)) )
))
(declare-fun arrayNoDuplicates!0 (array!45606 (_ BitVec 32) List!15580) Bool)

(assert (=> b!821457 (= res!560370 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15577))))

(declare-fun b!821458 () Bool)

(declare-fun res!560369 () Bool)

(assert (=> b!821458 (=> (not res!560369) (not e!456540))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24607 0))(
  ( (V!24608 (val!7400 Int)) )
))
(declare-datatypes ((ValueCell!6937 0))(
  ( (ValueCellFull!6937 (v!9831 V!24607)) (EmptyCell!6937) )
))
(declare-datatypes ((array!45608 0))(
  ( (array!45609 (arr!21855 (Array (_ BitVec 32) ValueCell!6937)) (size!22276 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45608)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821458 (= res!560369 (and (= (size!22276 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22275 _keys!976) (size!22276 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821459 () Bool)

(declare-fun e!456542 () Bool)

(assert (=> b!821459 (= e!456542 true)))

(declare-fun zeroValueBefore!34 () V!24607)

(declare-fun minValue!754 () V!24607)

(declare-datatypes ((tuple2!9762 0))(
  ( (tuple2!9763 (_1!4892 (_ BitVec 64)) (_2!4892 V!24607)) )
))
(declare-datatypes ((List!15581 0))(
  ( (Nil!15578) (Cons!15577 (h!16706 tuple2!9762) (t!21916 List!15581)) )
))
(declare-datatypes ((ListLongMap!8585 0))(
  ( (ListLongMap!8586 (toList!4308 List!15581)) )
))
(declare-fun lt!369231 () ListLongMap!8585)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2477 (array!45606 array!45608 (_ BitVec 32) (_ BitVec 32) V!24607 V!24607 (_ BitVec 32) Int) ListLongMap!8585)

(assert (=> b!821459 (= lt!369231 (getCurrentListMap!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821460 () Bool)

(declare-fun e!456539 () Bool)

(declare-fun tp_is_empty!14705 () Bool)

(assert (=> b!821460 (= e!456539 tp_is_empty!14705)))

(declare-fun b!821461 () Bool)

(declare-fun e!456537 () Bool)

(declare-fun mapRes!23665 () Bool)

(assert (=> b!821461 (= e!456537 (and e!456539 mapRes!23665))))

(declare-fun condMapEmpty!23665 () Bool)

(declare-fun mapDefault!23665 () ValueCell!6937)

