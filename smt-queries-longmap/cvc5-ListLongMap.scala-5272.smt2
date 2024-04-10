; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70782 () Bool)

(assert start!70782)

(declare-fun b_free!13039 () Bool)

(declare-fun b_next!13039 () Bool)

(assert (=> start!70782 (= b_free!13039 (not b_next!13039))))

(declare-fun tp!45861 () Bool)

(declare-fun b_and!21911 () Bool)

(assert (=> start!70782 (= tp!45861 b_and!21911)))

(declare-fun res!560769 () Bool)

(declare-fun e!457041 () Bool)

(assert (=> start!70782 (=> (not res!560769) (not e!457041))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70782 (= res!560769 (validMask!0 mask!1312))))

(assert (=> start!70782 e!457041))

(declare-fun tp_is_empty!14749 () Bool)

(assert (=> start!70782 tp_is_empty!14749))

(declare-datatypes ((array!45692 0))(
  ( (array!45693 (arr!21896 (Array (_ BitVec 32) (_ BitVec 64))) (size!22317 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45692)

(declare-fun array_inv!17489 (array!45692) Bool)

(assert (=> start!70782 (array_inv!17489 _keys!976)))

(assert (=> start!70782 true))

(declare-datatypes ((V!24667 0))(
  ( (V!24668 (val!7422 Int)) )
))
(declare-datatypes ((ValueCell!6959 0))(
  ( (ValueCellFull!6959 (v!9853 V!24667)) (EmptyCell!6959) )
))
(declare-datatypes ((array!45694 0))(
  ( (array!45695 (arr!21897 (Array (_ BitVec 32) ValueCell!6959)) (size!22318 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45694)

(declare-fun e!457038 () Bool)

(declare-fun array_inv!17490 (array!45694) Bool)

(assert (=> start!70782 (and (array_inv!17490 _values!788) e!457038)))

(assert (=> start!70782 tp!45861))

(declare-fun b!822142 () Bool)

(declare-fun e!457039 () Bool)

(assert (=> b!822142 (= e!457039 true)))

(declare-datatypes ((tuple2!9798 0))(
  ( (tuple2!9799 (_1!4910 (_ BitVec 64)) (_2!4910 V!24667)) )
))
(declare-datatypes ((List!15613 0))(
  ( (Nil!15610) (Cons!15609 (h!16738 tuple2!9798) (t!21950 List!15613)) )
))
(declare-datatypes ((ListLongMap!8621 0))(
  ( (ListLongMap!8622 (toList!4326 List!15613)) )
))
(declare-fun lt!369744 () ListLongMap!8621)

(declare-fun lt!369739 () ListLongMap!8621)

(declare-fun lt!369738 () tuple2!9798)

(declare-fun +!1877 (ListLongMap!8621 tuple2!9798) ListLongMap!8621)

(assert (=> b!822142 (= lt!369744 (+!1877 lt!369739 lt!369738))))

(declare-fun zeroValueAfter!34 () V!24667)

(declare-fun minValue!754 () V!24667)

(declare-datatypes ((Unit!28116 0))(
  ( (Unit!28117) )
))
(declare-fun lt!369743 () Unit!28116)

(declare-fun lt!369747 () ListLongMap!8621)

(declare-fun addCommutativeForDiffKeys!440 (ListLongMap!8621 (_ BitVec 64) V!24667 (_ BitVec 64) V!24667) Unit!28116)

(assert (=> b!822142 (= lt!369743 (addCommutativeForDiffKeys!440 lt!369747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369745 () ListLongMap!8621)

(assert (=> b!822142 (= lt!369745 lt!369744)))

(declare-fun lt!369740 () tuple2!9798)

(assert (=> b!822142 (= lt!369744 (+!1877 (+!1877 lt!369747 lt!369738) lt!369740))))

(assert (=> b!822142 (= lt!369738 (tuple2!9799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369741 () ListLongMap!8621)

(assert (=> b!822142 (= lt!369741 lt!369739)))

(assert (=> b!822142 (= lt!369739 (+!1877 lt!369747 lt!369740))))

(assert (=> b!822142 (= lt!369740 (tuple2!9799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2491 (array!45692 array!45694 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8621)

(assert (=> b!822142 (= lt!369745 (getCurrentListMap!2491 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24667)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822142 (= lt!369741 (getCurrentListMap!2491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822143 () Bool)

(declare-fun res!560767 () Bool)

(assert (=> b!822143 (=> (not res!560767) (not e!457041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45692 (_ BitVec 32)) Bool)

(assert (=> b!822143 (= res!560767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822144 () Bool)

(declare-fun e!457040 () Bool)

(assert (=> b!822144 (= e!457040 tp_is_empty!14749)))

(declare-fun b!822145 () Bool)

(declare-fun res!560768 () Bool)

(assert (=> b!822145 (=> (not res!560768) (not e!457041))))

(assert (=> b!822145 (= res!560768 (and (= (size!22318 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22317 _keys!976) (size!22318 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23734 () Bool)

(declare-fun mapRes!23734 () Bool)

(assert (=> mapIsEmpty!23734 mapRes!23734))

(declare-fun b!822146 () Bool)

(declare-fun e!457036 () Bool)

(assert (=> b!822146 (= e!457036 tp_is_empty!14749)))

(declare-fun b!822147 () Bool)

(assert (=> b!822147 (= e!457041 (not e!457039))))

(declare-fun res!560766 () Bool)

(assert (=> b!822147 (=> res!560766 e!457039)))

(assert (=> b!822147 (= res!560766 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369742 () ListLongMap!8621)

(assert (=> b!822147 (= lt!369747 lt!369742)))

(declare-fun lt!369746 () Unit!28116)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!455 (array!45692 array!45694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 V!24667 V!24667 (_ BitVec 32) Int) Unit!28116)

(assert (=> b!822147 (= lt!369746 (lemmaNoChangeToArrayThenSameMapNoExtras!455 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2345 (array!45692 array!45694 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8621)

(assert (=> b!822147 (= lt!369742 (getCurrentListMapNoExtraKeys!2345 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822147 (= lt!369747 (getCurrentListMapNoExtraKeys!2345 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822148 () Bool)

(declare-fun res!560765 () Bool)

(assert (=> b!822148 (=> (not res!560765) (not e!457041))))

(declare-datatypes ((List!15614 0))(
  ( (Nil!15611) (Cons!15610 (h!16739 (_ BitVec 64)) (t!21951 List!15614)) )
))
(declare-fun arrayNoDuplicates!0 (array!45692 (_ BitVec 32) List!15614) Bool)

(assert (=> b!822148 (= res!560765 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15611))))

(declare-fun mapNonEmpty!23734 () Bool)

(declare-fun tp!45862 () Bool)

(assert (=> mapNonEmpty!23734 (= mapRes!23734 (and tp!45862 e!457040))))

(declare-fun mapValue!23734 () ValueCell!6959)

(declare-fun mapRest!23734 () (Array (_ BitVec 32) ValueCell!6959))

(declare-fun mapKey!23734 () (_ BitVec 32))

(assert (=> mapNonEmpty!23734 (= (arr!21897 _values!788) (store mapRest!23734 mapKey!23734 mapValue!23734))))

(declare-fun b!822149 () Bool)

(assert (=> b!822149 (= e!457038 (and e!457036 mapRes!23734))))

(declare-fun condMapEmpty!23734 () Bool)

(declare-fun mapDefault!23734 () ValueCell!6959)

