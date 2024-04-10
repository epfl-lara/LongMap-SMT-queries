; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70678 () Bool)

(assert start!70678)

(declare-fun b_free!12965 () Bool)

(declare-fun b_next!12965 () Bool)

(assert (=> start!70678 (= b_free!12965 (not b_next!12965))))

(declare-fun tp!45633 () Bool)

(declare-fun b_and!21819 () Bool)

(assert (=> start!70678 (= tp!45633 b_and!21819)))

(declare-fun res!560116 () Bool)

(declare-fun e!456216 () Bool)

(assert (=> start!70678 (=> (not res!560116) (not e!456216))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70678 (= res!560116 (validMask!0 mask!1312))))

(assert (=> start!70678 e!456216))

(declare-fun tp_is_empty!14675 () Bool)

(assert (=> start!70678 tp_is_empty!14675))

(declare-datatypes ((array!45544 0))(
  ( (array!45545 (arr!21824 (Array (_ BitVec 32) (_ BitVec 64))) (size!22245 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45544)

(declare-fun array_inv!17445 (array!45544) Bool)

(assert (=> start!70678 (array_inv!17445 _keys!976)))

(assert (=> start!70678 true))

(declare-datatypes ((V!24567 0))(
  ( (V!24568 (val!7385 Int)) )
))
(declare-datatypes ((ValueCell!6922 0))(
  ( (ValueCellFull!6922 (v!9816 V!24567)) (EmptyCell!6922) )
))
(declare-datatypes ((array!45546 0))(
  ( (array!45547 (arr!21825 (Array (_ BitVec 32) ValueCell!6922)) (size!22246 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45546)

(declare-fun e!456217 () Bool)

(declare-fun array_inv!17446 (array!45546) Bool)

(assert (=> start!70678 (and (array_inv!17446 _values!788) e!456217)))

(assert (=> start!70678 tp!45633))

(declare-fun b!821013 () Bool)

(declare-fun res!560114 () Bool)

(assert (=> b!821013 (=> (not res!560114) (not e!456216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45544 (_ BitVec 32)) Bool)

(assert (=> b!821013 (= res!560114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821014 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821014 (= e!456216 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!22245 _keys!976)))))))

(declare-datatypes ((tuple2!9740 0))(
  ( (tuple2!9741 (_1!4881 (_ BitVec 64)) (_2!4881 V!24567)) )
))
(declare-datatypes ((List!15559 0))(
  ( (Nil!15556) (Cons!15555 (h!16684 tuple2!9740) (t!21892 List!15559)) )
))
(declare-datatypes ((ListLongMap!8563 0))(
  ( (ListLongMap!8564 (toList!4297 List!15559)) )
))
(declare-fun lt!369013 () ListLongMap!8563)

(declare-fun lt!369012 () ListLongMap!8563)

(assert (=> b!821014 (= lt!369013 lt!369012)))

(declare-fun zeroValueBefore!34 () V!24567)

(declare-fun zeroValueAfter!34 () V!24567)

(declare-fun minValue!754 () V!24567)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28071 0))(
  ( (Unit!28072) )
))
(declare-fun lt!369011 () Unit!28071)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!433 (array!45544 array!45546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24567 V!24567 V!24567 V!24567 (_ BitVec 32) Int) Unit!28071)

(assert (=> b!821014 (= lt!369011 (lemmaNoChangeToArrayThenSameMapNoExtras!433 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2323 (array!45544 array!45546 (_ BitVec 32) (_ BitVec 32) V!24567 V!24567 (_ BitVec 32) Int) ListLongMap!8563)

(assert (=> b!821014 (= lt!369012 (getCurrentListMapNoExtraKeys!2323 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821014 (= lt!369013 (getCurrentListMapNoExtraKeys!2323 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821015 () Bool)

(declare-fun e!456215 () Bool)

(assert (=> b!821015 (= e!456215 tp_is_empty!14675)))

(declare-fun mapNonEmpty!23617 () Bool)

(declare-fun mapRes!23617 () Bool)

(declare-fun tp!45634 () Bool)

(assert (=> mapNonEmpty!23617 (= mapRes!23617 (and tp!45634 e!456215))))

(declare-fun mapRest!23617 () (Array (_ BitVec 32) ValueCell!6922))

(declare-fun mapValue!23617 () ValueCell!6922)

(declare-fun mapKey!23617 () (_ BitVec 32))

(assert (=> mapNonEmpty!23617 (= (arr!21825 _values!788) (store mapRest!23617 mapKey!23617 mapValue!23617))))

(declare-fun b!821016 () Bool)

(declare-fun e!456214 () Bool)

(assert (=> b!821016 (= e!456217 (and e!456214 mapRes!23617))))

(declare-fun condMapEmpty!23617 () Bool)

(declare-fun mapDefault!23617 () ValueCell!6922)

