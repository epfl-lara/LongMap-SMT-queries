; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70854 () Bool)

(assert start!70854)

(declare-fun b_free!13091 () Bool)

(declare-fun b_next!13091 () Bool)

(assert (=> start!70854 (= b_free!13091 (not b_next!13091))))

(declare-fun tp!46020 () Bool)

(declare-fun b_and!21975 () Bool)

(assert (=> start!70854 (= tp!46020 b_and!21975)))

(declare-fun b!822947 () Bool)

(declare-fun e!457622 () Bool)

(declare-fun tp_is_empty!14801 () Bool)

(assert (=> b!822947 (= e!457622 tp_is_empty!14801)))

(declare-fun b!822948 () Bool)

(declare-fun res!561237 () Bool)

(declare-fun e!457621 () Bool)

(assert (=> b!822948 (=> (not res!561237) (not e!457621))))

(declare-datatypes ((array!45796 0))(
  ( (array!45797 (arr!21947 (Array (_ BitVec 32) (_ BitVec 64))) (size!22368 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45796)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45796 (_ BitVec 32)) Bool)

(assert (=> b!822948 (= res!561237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23815 () Bool)

(declare-fun mapRes!23815 () Bool)

(assert (=> mapIsEmpty!23815 mapRes!23815))

(declare-fun res!561235 () Bool)

(assert (=> start!70854 (=> (not res!561235) (not e!457621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70854 (= res!561235 (validMask!0 mask!1312))))

(assert (=> start!70854 e!457621))

(assert (=> start!70854 tp_is_empty!14801))

(declare-fun array_inv!17531 (array!45796) Bool)

(assert (=> start!70854 (array_inv!17531 _keys!976)))

(assert (=> start!70854 true))

(declare-datatypes ((V!24735 0))(
  ( (V!24736 (val!7448 Int)) )
))
(declare-datatypes ((ValueCell!6985 0))(
  ( (ValueCellFull!6985 (v!9880 V!24735)) (EmptyCell!6985) )
))
(declare-datatypes ((array!45798 0))(
  ( (array!45799 (arr!21948 (Array (_ BitVec 32) ValueCell!6985)) (size!22369 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45798)

(declare-fun e!457619 () Bool)

(declare-fun array_inv!17532 (array!45798) Bool)

(assert (=> start!70854 (and (array_inv!17532 _values!788) e!457619)))

(assert (=> start!70854 tp!46020))

(declare-fun b!822949 () Bool)

(declare-fun e!457617 () Bool)

(assert (=> b!822949 (= e!457617 true)))

(declare-datatypes ((tuple2!9842 0))(
  ( (tuple2!9843 (_1!4932 (_ BitVec 64)) (_2!4932 V!24735)) )
))
(declare-datatypes ((List!15656 0))(
  ( (Nil!15653) (Cons!15652 (h!16781 tuple2!9842) (t!21995 List!15656)) )
))
(declare-datatypes ((ListLongMap!8665 0))(
  ( (ListLongMap!8666 (toList!4348 List!15656)) )
))
(declare-fun lt!370681 () ListLongMap!8665)

(declare-fun lt!370674 () ListLongMap!8665)

(declare-fun lt!370680 () tuple2!9842)

(declare-fun +!1897 (ListLongMap!8665 tuple2!9842) ListLongMap!8665)

(assert (=> b!822949 (= lt!370681 (+!1897 lt!370674 lt!370680))))

(declare-datatypes ((Unit!28162 0))(
  ( (Unit!28163) )
))
(declare-fun lt!370673 () Unit!28162)

(declare-fun zeroValueAfter!34 () V!24735)

(declare-fun minValue!754 () V!24735)

(declare-fun lt!370677 () ListLongMap!8665)

(declare-fun addCommutativeForDiffKeys!460 (ListLongMap!8665 (_ BitVec 64) V!24735 (_ BitVec 64) V!24735) Unit!28162)

(assert (=> b!822949 (= lt!370673 (addCommutativeForDiffKeys!460 lt!370677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370682 () ListLongMap!8665)

(assert (=> b!822949 (= lt!370682 lt!370681)))

(declare-fun lt!370678 () tuple2!9842)

(assert (=> b!822949 (= lt!370681 (+!1897 (+!1897 lt!370677 lt!370680) lt!370678))))

(assert (=> b!822949 (= lt!370680 (tuple2!9843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370679 () ListLongMap!8665)

(assert (=> b!822949 (= lt!370679 lt!370674)))

(assert (=> b!822949 (= lt!370674 (+!1897 lt!370677 lt!370678))))

(assert (=> b!822949 (= lt!370678 (tuple2!9843 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2511 (array!45796 array!45798 (_ BitVec 32) (_ BitVec 32) V!24735 V!24735 (_ BitVec 32) Int) ListLongMap!8665)

(assert (=> b!822949 (= lt!370682 (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24735)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822949 (= lt!370679 (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822950 () Bool)

(declare-fun res!561234 () Bool)

(assert (=> b!822950 (=> (not res!561234) (not e!457621))))

(declare-datatypes ((List!15657 0))(
  ( (Nil!15654) (Cons!15653 (h!16782 (_ BitVec 64)) (t!21996 List!15657)) )
))
(declare-fun arrayNoDuplicates!0 (array!45796 (_ BitVec 32) List!15657) Bool)

(assert (=> b!822950 (= res!561234 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15654))))

(declare-fun b!822951 () Bool)

(declare-fun res!561238 () Bool)

(assert (=> b!822951 (=> (not res!561238) (not e!457621))))

(assert (=> b!822951 (= res!561238 (and (= (size!22369 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22368 _keys!976) (size!22369 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822952 () Bool)

(declare-fun e!457618 () Bool)

(assert (=> b!822952 (= e!457618 tp_is_empty!14801)))

(declare-fun mapNonEmpty!23815 () Bool)

(declare-fun tp!46021 () Bool)

(assert (=> mapNonEmpty!23815 (= mapRes!23815 (and tp!46021 e!457622))))

(declare-fun mapRest!23815 () (Array (_ BitVec 32) ValueCell!6985))

(declare-fun mapValue!23815 () ValueCell!6985)

(declare-fun mapKey!23815 () (_ BitVec 32))

(assert (=> mapNonEmpty!23815 (= (arr!21948 _values!788) (store mapRest!23815 mapKey!23815 mapValue!23815))))

(declare-fun b!822953 () Bool)

(assert (=> b!822953 (= e!457621 (not e!457617))))

(declare-fun res!561236 () Bool)

(assert (=> b!822953 (=> res!561236 e!457617)))

(assert (=> b!822953 (= res!561236 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370675 () ListLongMap!8665)

(assert (=> b!822953 (= lt!370677 lt!370675)))

(declare-fun lt!370676 () Unit!28162)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!476 (array!45796 array!45798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24735 V!24735 V!24735 V!24735 (_ BitVec 32) Int) Unit!28162)

(assert (=> b!822953 (= lt!370676 (lemmaNoChangeToArrayThenSameMapNoExtras!476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2366 (array!45796 array!45798 (_ BitVec 32) (_ BitVec 32) V!24735 V!24735 (_ BitVec 32) Int) ListLongMap!8665)

(assert (=> b!822953 (= lt!370675 (getCurrentListMapNoExtraKeys!2366 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822953 (= lt!370677 (getCurrentListMapNoExtraKeys!2366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822954 () Bool)

(assert (=> b!822954 (= e!457619 (and e!457618 mapRes!23815))))

(declare-fun condMapEmpty!23815 () Bool)

(declare-fun mapDefault!23815 () ValueCell!6985)

