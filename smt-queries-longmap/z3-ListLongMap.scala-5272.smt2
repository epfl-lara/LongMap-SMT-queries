; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70762 () Bool)

(assert start!70762)

(declare-fun b_free!13039 () Bool)

(declare-fun b_next!13039 () Bool)

(assert (=> start!70762 (= b_free!13039 (not b_next!13039))))

(declare-fun tp!45861 () Bool)

(declare-fun b_and!21885 () Bool)

(assert (=> start!70762 (= tp!45861 b_and!21885)))

(declare-fun b!821896 () Bool)

(declare-fun e!456890 () Bool)

(declare-fun e!456887 () Bool)

(assert (=> b!821896 (= e!456890 (not e!456887))))

(declare-fun res!560659 () Bool)

(assert (=> b!821896 (=> res!560659 e!456887)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821896 (= res!560659 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24667 0))(
  ( (V!24668 (val!7422 Int)) )
))
(declare-datatypes ((tuple2!9802 0))(
  ( (tuple2!9803 (_1!4912 (_ BitVec 64)) (_2!4912 V!24667)) )
))
(declare-datatypes ((List!15614 0))(
  ( (Nil!15611) (Cons!15610 (h!16739 tuple2!9802) (t!21942 List!15614)) )
))
(declare-datatypes ((ListLongMap!8615 0))(
  ( (ListLongMap!8616 (toList!4323 List!15614)) )
))
(declare-fun lt!369503 () ListLongMap!8615)

(declare-fun lt!369504 () ListLongMap!8615)

(assert (=> b!821896 (= lt!369503 lt!369504)))

(declare-fun zeroValueBefore!34 () V!24667)

(declare-fun zeroValueAfter!34 () V!24667)

(declare-fun minValue!754 () V!24667)

(declare-datatypes ((ValueCell!6959 0))(
  ( (ValueCellFull!6959 (v!9847 V!24667)) (EmptyCell!6959) )
))
(declare-datatypes ((array!45659 0))(
  ( (array!45660 (arr!21880 (Array (_ BitVec 32) ValueCell!6959)) (size!22301 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45659)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!45661 0))(
  ( (array!45662 (arr!21881 (Array (_ BitVec 32) (_ BitVec 64))) (size!22302 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45661)

(declare-datatypes ((Unit!28066 0))(
  ( (Unit!28067) )
))
(declare-fun lt!369496 () Unit!28066)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!463 (array!45661 array!45659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 V!24667 V!24667 (_ BitVec 32) Int) Unit!28066)

(assert (=> b!821896 (= lt!369496 (lemmaNoChangeToArrayThenSameMapNoExtras!463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2370 (array!45661 array!45659 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8615)

(assert (=> b!821896 (= lt!369504 (getCurrentListMapNoExtraKeys!2370 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821896 (= lt!369503 (getCurrentListMapNoExtraKeys!2370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821897 () Bool)

(declare-fun res!560662 () Bool)

(assert (=> b!821897 (=> (not res!560662) (not e!456890))))

(declare-datatypes ((List!15615 0))(
  ( (Nil!15612) (Cons!15611 (h!16740 (_ BitVec 64)) (t!21943 List!15615)) )
))
(declare-fun arrayNoDuplicates!0 (array!45661 (_ BitVec 32) List!15615) Bool)

(assert (=> b!821897 (= res!560662 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15612))))

(declare-fun b!821898 () Bool)

(declare-fun res!560660 () Bool)

(assert (=> b!821898 (=> (not res!560660) (not e!456890))))

(assert (=> b!821898 (= res!560660 (and (= (size!22301 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22302 _keys!976) (size!22301 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23734 () Bool)

(declare-fun mapRes!23734 () Bool)

(assert (=> mapIsEmpty!23734 mapRes!23734))

(declare-fun b!821899 () Bool)

(declare-fun e!456889 () Bool)

(declare-fun tp_is_empty!14749 () Bool)

(assert (=> b!821899 (= e!456889 tp_is_empty!14749)))

(declare-fun b!821900 () Bool)

(declare-fun e!456891 () Bool)

(assert (=> b!821900 (= e!456891 tp_is_empty!14749)))

(declare-fun b!821901 () Bool)

(declare-fun res!560663 () Bool)

(assert (=> b!821901 (=> (not res!560663) (not e!456890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45661 (_ BitVec 32)) Bool)

(assert (=> b!821901 (= res!560663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560661 () Bool)

(assert (=> start!70762 (=> (not res!560661) (not e!456890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70762 (= res!560661 (validMask!0 mask!1312))))

(assert (=> start!70762 e!456890))

(assert (=> start!70762 tp_is_empty!14749))

(declare-fun array_inv!17545 (array!45661) Bool)

(assert (=> start!70762 (array_inv!17545 _keys!976)))

(assert (=> start!70762 true))

(declare-fun e!456888 () Bool)

(declare-fun array_inv!17546 (array!45659) Bool)

(assert (=> start!70762 (and (array_inv!17546 _values!788) e!456888)))

(assert (=> start!70762 tp!45861))

(declare-fun b!821902 () Bool)

(assert (=> b!821902 (= e!456888 (and e!456891 mapRes!23734))))

(declare-fun condMapEmpty!23734 () Bool)

(declare-fun mapDefault!23734 () ValueCell!6959)

(assert (=> b!821902 (= condMapEmpty!23734 (= (arr!21880 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6959)) mapDefault!23734)))))

(declare-fun mapNonEmpty!23734 () Bool)

(declare-fun tp!45862 () Bool)

(assert (=> mapNonEmpty!23734 (= mapRes!23734 (and tp!45862 e!456889))))

(declare-fun mapKey!23734 () (_ BitVec 32))

(declare-fun mapValue!23734 () ValueCell!6959)

(declare-fun mapRest!23734 () (Array (_ BitVec 32) ValueCell!6959))

(assert (=> mapNonEmpty!23734 (= (arr!21880 _values!788) (store mapRest!23734 mapKey!23734 mapValue!23734))))

(declare-fun b!821903 () Bool)

(assert (=> b!821903 (= e!456887 true)))

(declare-fun lt!369497 () ListLongMap!8615)

(declare-fun lt!369502 () ListLongMap!8615)

(declare-fun lt!369498 () tuple2!9802)

(declare-fun +!1906 (ListLongMap!8615 tuple2!9802) ListLongMap!8615)

(assert (=> b!821903 (= lt!369497 (+!1906 lt!369502 lt!369498))))

(declare-fun lt!369500 () Unit!28066)

(declare-fun addCommutativeForDiffKeys!437 (ListLongMap!8615 (_ BitVec 64) V!24667 (_ BitVec 64) V!24667) Unit!28066)

(assert (=> b!821903 (= lt!369500 (addCommutativeForDiffKeys!437 lt!369503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369499 () ListLongMap!8615)

(assert (=> b!821903 (= lt!369499 lt!369497)))

(declare-fun lt!369501 () tuple2!9802)

(assert (=> b!821903 (= lt!369497 (+!1906 (+!1906 lt!369503 lt!369498) lt!369501))))

(assert (=> b!821903 (= lt!369498 (tuple2!9803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369495 () ListLongMap!8615)

(assert (=> b!821903 (= lt!369495 lt!369502)))

(assert (=> b!821903 (= lt!369502 (+!1906 lt!369503 lt!369501))))

(assert (=> b!821903 (= lt!369501 (tuple2!9803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2448 (array!45661 array!45659 (_ BitVec 32) (_ BitVec 32) V!24667 V!24667 (_ BitVec 32) Int) ListLongMap!8615)

(assert (=> b!821903 (= lt!369499 (getCurrentListMap!2448 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821903 (= lt!369495 (getCurrentListMap!2448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70762 res!560661) b!821898))

(assert (= (and b!821898 res!560660) b!821901))

(assert (= (and b!821901 res!560663) b!821897))

(assert (= (and b!821897 res!560662) b!821896))

(assert (= (and b!821896 (not res!560659)) b!821903))

(assert (= (and b!821902 condMapEmpty!23734) mapIsEmpty!23734))

(assert (= (and b!821902 (not condMapEmpty!23734)) mapNonEmpty!23734))

(get-info :version)

(assert (= (and mapNonEmpty!23734 ((_ is ValueCellFull!6959) mapValue!23734)) b!821899))

(assert (= (and b!821902 ((_ is ValueCellFull!6959) mapDefault!23734)) b!821900))

(assert (= start!70762 b!821902))

(declare-fun m!763145 () Bool)

(assert (=> mapNonEmpty!23734 m!763145))

(declare-fun m!763147 () Bool)

(assert (=> b!821897 m!763147))

(declare-fun m!763149 () Bool)

(assert (=> b!821896 m!763149))

(declare-fun m!763151 () Bool)

(assert (=> b!821896 m!763151))

(declare-fun m!763153 () Bool)

(assert (=> b!821896 m!763153))

(declare-fun m!763155 () Bool)

(assert (=> b!821903 m!763155))

(declare-fun m!763157 () Bool)

(assert (=> b!821903 m!763157))

(declare-fun m!763159 () Bool)

(assert (=> b!821903 m!763159))

(declare-fun m!763161 () Bool)

(assert (=> b!821903 m!763161))

(declare-fun m!763163 () Bool)

(assert (=> b!821903 m!763163))

(assert (=> b!821903 m!763159))

(declare-fun m!763165 () Bool)

(assert (=> b!821903 m!763165))

(declare-fun m!763167 () Bool)

(assert (=> b!821903 m!763167))

(declare-fun m!763169 () Bool)

(assert (=> start!70762 m!763169))

(declare-fun m!763171 () Bool)

(assert (=> start!70762 m!763171))

(declare-fun m!763173 () Bool)

(assert (=> start!70762 m!763173))

(declare-fun m!763175 () Bool)

(assert (=> b!821901 m!763175))

(check-sat (not b!821897) (not start!70762) (not b!821896) b_and!21885 (not b_next!13039) (not b!821903) (not b!821901) tp_is_empty!14749 (not mapNonEmpty!23734))
(check-sat b_and!21885 (not b_next!13039))
