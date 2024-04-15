; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70990 () Bool)

(assert start!70990)

(declare-fun b_free!13213 () Bool)

(declare-fun b_next!13213 () Bool)

(assert (=> start!70990 (= b_free!13213 (not b_next!13213))))

(declare-fun tp!46392 () Bool)

(declare-fun b_and!22091 () Bool)

(assert (=> start!70990 (= tp!46392 b_and!22091)))

(declare-fun b!824350 () Bool)

(declare-fun res!562074 () Bool)

(declare-fun e!458654 () Bool)

(assert (=> b!824350 (=> (not res!562074) (not e!458654))))

(declare-datatypes ((array!46003 0))(
  ( (array!46004 (arr!22049 (Array (_ BitVec 32) (_ BitVec 64))) (size!22470 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46003)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46003 (_ BitVec 32)) Bool)

(assert (=> b!824350 (= res!562074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24004 () Bool)

(declare-fun mapRes!24004 () Bool)

(assert (=> mapIsEmpty!24004 mapRes!24004))

(declare-fun mapNonEmpty!24004 () Bool)

(declare-fun tp!46393 () Bool)

(declare-fun e!458657 () Bool)

(assert (=> mapNonEmpty!24004 (= mapRes!24004 (and tp!46393 e!458657))))

(declare-datatypes ((V!24899 0))(
  ( (V!24900 (val!7509 Int)) )
))
(declare-datatypes ((ValueCell!7046 0))(
  ( (ValueCellFull!7046 (v!9936 V!24899)) (EmptyCell!7046) )
))
(declare-fun mapRest!24004 () (Array (_ BitVec 32) ValueCell!7046))

(declare-fun mapValue!24004 () ValueCell!7046)

(declare-datatypes ((array!46005 0))(
  ( (array!46006 (arr!22050 (Array (_ BitVec 32) ValueCell!7046)) (size!22471 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46005)

(declare-fun mapKey!24004 () (_ BitVec 32))

(assert (=> mapNonEmpty!24004 (= (arr!22050 _values!788) (store mapRest!24004 mapKey!24004 mapValue!24004))))

(declare-fun b!824351 () Bool)

(declare-fun res!562072 () Bool)

(assert (=> b!824351 (=> (not res!562072) (not e!458654))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824351 (= res!562072 (and (= (size!22471 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22470 _keys!976) (size!22471 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824352 () Bool)

(declare-fun e!458655 () Bool)

(assert (=> b!824352 (= e!458654 (not e!458655))))

(declare-fun res!562076 () Bool)

(assert (=> b!824352 (=> res!562076 e!458655)))

(assert (=> b!824352 (= res!562076 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9940 0))(
  ( (tuple2!9941 (_1!4981 (_ BitVec 64)) (_2!4981 V!24899)) )
))
(declare-datatypes ((List!15740 0))(
  ( (Nil!15737) (Cons!15736 (h!16865 tuple2!9940) (t!22074 List!15740)) )
))
(declare-datatypes ((ListLongMap!8753 0))(
  ( (ListLongMap!8754 (toList!4392 List!15740)) )
))
(declare-fun lt!371663 () ListLongMap!8753)

(declare-fun lt!371660 () ListLongMap!8753)

(assert (=> b!824352 (= lt!371663 lt!371660)))

(declare-fun zeroValueBefore!34 () V!24899)

(declare-fun zeroValueAfter!34 () V!24899)

(declare-fun minValue!754 () V!24899)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28208 0))(
  ( (Unit!28209) )
))
(declare-fun lt!371662 () Unit!28208)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!529 (array!46003 array!46005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 V!24899 V!24899 (_ BitVec 32) Int) Unit!28208)

(assert (=> b!824352 (= lt!371662 (lemmaNoChangeToArrayThenSameMapNoExtras!529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2436 (array!46003 array!46005 (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 (_ BitVec 32) Int) ListLongMap!8753)

(assert (=> b!824352 (= lt!371660 (getCurrentListMapNoExtraKeys!2436 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824352 (= lt!371663 (getCurrentListMapNoExtraKeys!2436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824354 () Bool)

(declare-fun res!562073 () Bool)

(assert (=> b!824354 (=> (not res!562073) (not e!458654))))

(declare-datatypes ((List!15741 0))(
  ( (Nil!15738) (Cons!15737 (h!16866 (_ BitVec 64)) (t!22075 List!15741)) )
))
(declare-fun arrayNoDuplicates!0 (array!46003 (_ BitVec 32) List!15741) Bool)

(assert (=> b!824354 (= res!562073 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15738))))

(declare-fun b!824355 () Bool)

(declare-fun e!458652 () Bool)

(declare-fun tp_is_empty!14923 () Bool)

(assert (=> b!824355 (= e!458652 tp_is_empty!14923)))

(declare-fun b!824356 () Bool)

(assert (=> b!824356 (= e!458655 true)))

(declare-fun lt!371661 () ListLongMap!8753)

(declare-fun getCurrentListMap!2488 (array!46003 array!46005 (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 (_ BitVec 32) Int) ListLongMap!8753)

(assert (=> b!824356 (= lt!371661 (getCurrentListMap!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824357 () Bool)

(declare-fun e!458653 () Bool)

(assert (=> b!824357 (= e!458653 (and e!458652 mapRes!24004))))

(declare-fun condMapEmpty!24004 () Bool)

(declare-fun mapDefault!24004 () ValueCell!7046)

(assert (=> b!824357 (= condMapEmpty!24004 (= (arr!22050 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7046)) mapDefault!24004)))))

(declare-fun res!562075 () Bool)

(assert (=> start!70990 (=> (not res!562075) (not e!458654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70990 (= res!562075 (validMask!0 mask!1312))))

(assert (=> start!70990 e!458654))

(assert (=> start!70990 tp_is_empty!14923))

(declare-fun array_inv!17659 (array!46003) Bool)

(assert (=> start!70990 (array_inv!17659 _keys!976)))

(assert (=> start!70990 true))

(declare-fun array_inv!17660 (array!46005) Bool)

(assert (=> start!70990 (and (array_inv!17660 _values!788) e!458653)))

(assert (=> start!70990 tp!46392))

(declare-fun b!824353 () Bool)

(assert (=> b!824353 (= e!458657 tp_is_empty!14923)))

(assert (= (and start!70990 res!562075) b!824351))

(assert (= (and b!824351 res!562072) b!824350))

(assert (= (and b!824350 res!562074) b!824354))

(assert (= (and b!824354 res!562073) b!824352))

(assert (= (and b!824352 (not res!562076)) b!824356))

(assert (= (and b!824357 condMapEmpty!24004) mapIsEmpty!24004))

(assert (= (and b!824357 (not condMapEmpty!24004)) mapNonEmpty!24004))

(get-info :version)

(assert (= (and mapNonEmpty!24004 ((_ is ValueCellFull!7046) mapValue!24004)) b!824353))

(assert (= (and b!824357 ((_ is ValueCellFull!7046) mapDefault!24004)) b!824355))

(assert (= start!70990 b!824357))

(declare-fun m!765905 () Bool)

(assert (=> b!824350 m!765905))

(declare-fun m!765907 () Bool)

(assert (=> b!824356 m!765907))

(declare-fun m!765909 () Bool)

(assert (=> b!824354 m!765909))

(declare-fun m!765911 () Bool)

(assert (=> mapNonEmpty!24004 m!765911))

(declare-fun m!765913 () Bool)

(assert (=> b!824352 m!765913))

(declare-fun m!765915 () Bool)

(assert (=> b!824352 m!765915))

(declare-fun m!765917 () Bool)

(assert (=> b!824352 m!765917))

(declare-fun m!765919 () Bool)

(assert (=> start!70990 m!765919))

(declare-fun m!765921 () Bool)

(assert (=> start!70990 m!765921))

(declare-fun m!765923 () Bool)

(assert (=> start!70990 m!765923))

(check-sat b_and!22091 (not b!824356) (not start!70990) (not b!824350) (not b!824354) tp_is_empty!14923 (not b_next!13213) (not mapNonEmpty!24004) (not b!824352))
(check-sat b_and!22091 (not b_next!13213))
