; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70672 () Bool)

(assert start!70672)

(declare-fun b_free!12959 () Bool)

(declare-fun b_next!12959 () Bool)

(assert (=> start!70672 (= b_free!12959 (not b_next!12959))))

(declare-fun tp!45616 () Bool)

(declare-fun b_and!21813 () Bool)

(assert (=> start!70672 (= tp!45616 b_and!21813)))

(declare-fun res!560079 () Bool)

(declare-fun e!456171 () Bool)

(assert (=> start!70672 (=> (not res!560079) (not e!456171))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70672 (= res!560079 (validMask!0 mask!1312))))

(assert (=> start!70672 e!456171))

(declare-fun tp_is_empty!14669 () Bool)

(assert (=> start!70672 tp_is_empty!14669))

(declare-datatypes ((array!45532 0))(
  ( (array!45533 (arr!21818 (Array (_ BitVec 32) (_ BitVec 64))) (size!22239 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45532)

(declare-fun array_inv!17439 (array!45532) Bool)

(assert (=> start!70672 (array_inv!17439 _keys!976)))

(assert (=> start!70672 true))

(declare-datatypes ((V!24559 0))(
  ( (V!24560 (val!7382 Int)) )
))
(declare-datatypes ((ValueCell!6919 0))(
  ( (ValueCellFull!6919 (v!9813 V!24559)) (EmptyCell!6919) )
))
(declare-datatypes ((array!45534 0))(
  ( (array!45535 (arr!21819 (Array (_ BitVec 32) ValueCell!6919)) (size!22240 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45534)

(declare-fun e!456169 () Bool)

(declare-fun array_inv!17440 (array!45534) Bool)

(assert (=> start!70672 (and (array_inv!17440 _values!788) e!456169)))

(assert (=> start!70672 tp!45616))

(declare-fun b!820950 () Bool)

(declare-fun e!456172 () Bool)

(assert (=> b!820950 (= e!456172 tp_is_empty!14669)))

(declare-fun b!820951 () Bool)

(assert (=> b!820951 (= e!456171 (not true))))

(declare-datatypes ((tuple2!9734 0))(
  ( (tuple2!9735 (_1!4878 (_ BitVec 64)) (_2!4878 V!24559)) )
))
(declare-datatypes ((List!15553 0))(
  ( (Nil!15550) (Cons!15549 (h!16678 tuple2!9734) (t!21886 List!15553)) )
))
(declare-datatypes ((ListLongMap!8557 0))(
  ( (ListLongMap!8558 (toList!4294 List!15553)) )
))
(declare-fun lt!368985 () ListLongMap!8557)

(declare-fun lt!368986 () ListLongMap!8557)

(assert (=> b!820951 (= lt!368985 lt!368986)))

(declare-fun zeroValueBefore!34 () V!24559)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24559)

(declare-fun minValue!754 () V!24559)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28065 0))(
  ( (Unit!28066) )
))
(declare-fun lt!368984 () Unit!28065)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!430 (array!45532 array!45534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24559 V!24559 V!24559 V!24559 (_ BitVec 32) Int) Unit!28065)

(assert (=> b!820951 (= lt!368984 (lemmaNoChangeToArrayThenSameMapNoExtras!430 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2320 (array!45532 array!45534 (_ BitVec 32) (_ BitVec 32) V!24559 V!24559 (_ BitVec 32) Int) ListLongMap!8557)

(assert (=> b!820951 (= lt!368986 (getCurrentListMapNoExtraKeys!2320 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820951 (= lt!368985 (getCurrentListMapNoExtraKeys!2320 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820952 () Bool)

(declare-fun res!560078 () Bool)

(assert (=> b!820952 (=> (not res!560078) (not e!456171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45532 (_ BitVec 32)) Bool)

(assert (=> b!820952 (= res!560078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23608 () Bool)

(declare-fun mapRes!23608 () Bool)

(declare-fun tp!45615 () Bool)

(assert (=> mapNonEmpty!23608 (= mapRes!23608 (and tp!45615 e!456172))))

(declare-fun mapKey!23608 () (_ BitVec 32))

(declare-fun mapValue!23608 () ValueCell!6919)

(declare-fun mapRest!23608 () (Array (_ BitVec 32) ValueCell!6919))

(assert (=> mapNonEmpty!23608 (= (arr!21819 _values!788) (store mapRest!23608 mapKey!23608 mapValue!23608))))

(declare-fun mapIsEmpty!23608 () Bool)

(assert (=> mapIsEmpty!23608 mapRes!23608))

(declare-fun b!820953 () Bool)

(declare-fun res!560077 () Bool)

(assert (=> b!820953 (=> (not res!560077) (not e!456171))))

(declare-datatypes ((List!15554 0))(
  ( (Nil!15551) (Cons!15550 (h!16679 (_ BitVec 64)) (t!21887 List!15554)) )
))
(declare-fun arrayNoDuplicates!0 (array!45532 (_ BitVec 32) List!15554) Bool)

(assert (=> b!820953 (= res!560077 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15551))))

(declare-fun b!820954 () Bool)

(declare-fun e!456170 () Bool)

(assert (=> b!820954 (= e!456169 (and e!456170 mapRes!23608))))

(declare-fun condMapEmpty!23608 () Bool)

(declare-fun mapDefault!23608 () ValueCell!6919)

