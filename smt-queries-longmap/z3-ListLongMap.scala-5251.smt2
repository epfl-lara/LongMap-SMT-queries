; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70628 () Bool)

(assert start!70628)

(declare-fun b_free!12915 () Bool)

(declare-fun b_next!12915 () Bool)

(assert (=> start!70628 (= b_free!12915 (not b_next!12915))))

(declare-fun tp!45484 () Bool)

(declare-fun b_and!21769 () Bool)

(assert (=> start!70628 (= tp!45484 b_and!21769)))

(declare-fun b!820488 () Bool)

(declare-fun res!559814 () Bool)

(declare-fun e!455838 () Bool)

(assert (=> b!820488 (=> (not res!559814) (not e!455838))))

(declare-datatypes ((array!45444 0))(
  ( (array!45445 (arr!21774 (Array (_ BitVec 32) (_ BitVec 64))) (size!22195 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45444)

(declare-datatypes ((List!15517 0))(
  ( (Nil!15514) (Cons!15513 (h!16642 (_ BitVec 64)) (t!21850 List!15517)) )
))
(declare-fun arrayNoDuplicates!0 (array!45444 (_ BitVec 32) List!15517) Bool)

(assert (=> b!820488 (= res!559814 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15514))))

(declare-fun res!559815 () Bool)

(assert (=> start!70628 (=> (not res!559815) (not e!455838))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70628 (= res!559815 (validMask!0 mask!1312))))

(assert (=> start!70628 e!455838))

(declare-fun tp_is_empty!14625 () Bool)

(assert (=> start!70628 tp_is_empty!14625))

(declare-fun array_inv!17403 (array!45444) Bool)

(assert (=> start!70628 (array_inv!17403 _keys!976)))

(assert (=> start!70628 true))

(declare-datatypes ((V!24501 0))(
  ( (V!24502 (val!7360 Int)) )
))
(declare-datatypes ((ValueCell!6897 0))(
  ( (ValueCellFull!6897 (v!9791 V!24501)) (EmptyCell!6897) )
))
(declare-datatypes ((array!45446 0))(
  ( (array!45447 (arr!21775 (Array (_ BitVec 32) ValueCell!6897)) (size!22196 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45446)

(declare-fun e!455840 () Bool)

(declare-fun array_inv!17404 (array!45446) Bool)

(assert (=> start!70628 (and (array_inv!17404 _values!788) e!455840)))

(assert (=> start!70628 tp!45484))

(declare-fun b!820489 () Bool)

(declare-fun e!455839 () Bool)

(declare-fun mapRes!23542 () Bool)

(assert (=> b!820489 (= e!455840 (and e!455839 mapRes!23542))))

(declare-fun condMapEmpty!23542 () Bool)

(declare-fun mapDefault!23542 () ValueCell!6897)

(assert (=> b!820489 (= condMapEmpty!23542 (= (arr!21775 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6897)) mapDefault!23542)))))

(declare-fun b!820490 () Bool)

(assert (=> b!820490 (= e!455838 (not true))))

(declare-datatypes ((tuple2!9696 0))(
  ( (tuple2!9697 (_1!4859 (_ BitVec 64)) (_2!4859 V!24501)) )
))
(declare-datatypes ((List!15518 0))(
  ( (Nil!15515) (Cons!15514 (h!16643 tuple2!9696) (t!21851 List!15518)) )
))
(declare-datatypes ((ListLongMap!8519 0))(
  ( (ListLongMap!8520 (toList!4275 List!15518)) )
))
(declare-fun lt!368787 () ListLongMap!8519)

(declare-fun lt!368786 () ListLongMap!8519)

(assert (=> b!820490 (= lt!368787 lt!368786)))

(declare-datatypes ((Unit!28027 0))(
  ( (Unit!28028) )
))
(declare-fun lt!368788 () Unit!28027)

(declare-fun zeroValueBefore!34 () V!24501)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24501)

(declare-fun minValue!754 () V!24501)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!411 (array!45444 array!45446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24501 V!24501 V!24501 V!24501 (_ BitVec 32) Int) Unit!28027)

(assert (=> b!820490 (= lt!368788 (lemmaNoChangeToArrayThenSameMapNoExtras!411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2301 (array!45444 array!45446 (_ BitVec 32) (_ BitVec 32) V!24501 V!24501 (_ BitVec 32) Int) ListLongMap!8519)

(assert (=> b!820490 (= lt!368786 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820490 (= lt!368787 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23542 () Bool)

(declare-fun tp!45483 () Bool)

(declare-fun e!455842 () Bool)

(assert (=> mapNonEmpty!23542 (= mapRes!23542 (and tp!45483 e!455842))))

(declare-fun mapKey!23542 () (_ BitVec 32))

(declare-fun mapRest!23542 () (Array (_ BitVec 32) ValueCell!6897))

(declare-fun mapValue!23542 () ValueCell!6897)

(assert (=> mapNonEmpty!23542 (= (arr!21775 _values!788) (store mapRest!23542 mapKey!23542 mapValue!23542))))

(declare-fun b!820491 () Bool)

(declare-fun res!559813 () Bool)

(assert (=> b!820491 (=> (not res!559813) (not e!455838))))

(assert (=> b!820491 (= res!559813 (and (= (size!22196 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22195 _keys!976) (size!22196 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820492 () Bool)

(assert (=> b!820492 (= e!455842 tp_is_empty!14625)))

(declare-fun b!820493 () Bool)

(declare-fun res!559816 () Bool)

(assert (=> b!820493 (=> (not res!559816) (not e!455838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45444 (_ BitVec 32)) Bool)

(assert (=> b!820493 (= res!559816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23542 () Bool)

(assert (=> mapIsEmpty!23542 mapRes!23542))

(declare-fun b!820494 () Bool)

(assert (=> b!820494 (= e!455839 tp_is_empty!14625)))

(assert (= (and start!70628 res!559815) b!820491))

(assert (= (and b!820491 res!559813) b!820493))

(assert (= (and b!820493 res!559816) b!820488))

(assert (= (and b!820488 res!559814) b!820490))

(assert (= (and b!820489 condMapEmpty!23542) mapIsEmpty!23542))

(assert (= (and b!820489 (not condMapEmpty!23542)) mapNonEmpty!23542))

(get-info :version)

(assert (= (and mapNonEmpty!23542 ((_ is ValueCellFull!6897) mapValue!23542)) b!820492))

(assert (= (and b!820489 ((_ is ValueCellFull!6897) mapDefault!23542)) b!820494))

(assert (= start!70628 b!820489))

(declare-fun m!762435 () Bool)

(assert (=> b!820493 m!762435))

(declare-fun m!762437 () Bool)

(assert (=> start!70628 m!762437))

(declare-fun m!762439 () Bool)

(assert (=> start!70628 m!762439))

(declare-fun m!762441 () Bool)

(assert (=> start!70628 m!762441))

(declare-fun m!762443 () Bool)

(assert (=> mapNonEmpty!23542 m!762443))

(declare-fun m!762445 () Bool)

(assert (=> b!820490 m!762445))

(declare-fun m!762447 () Bool)

(assert (=> b!820490 m!762447))

(declare-fun m!762449 () Bool)

(assert (=> b!820490 m!762449))

(declare-fun m!762451 () Bool)

(assert (=> b!820488 m!762451))

(check-sat b_and!21769 (not mapNonEmpty!23542) (not start!70628) (not b_next!12915) (not b!820488) tp_is_empty!14625 (not b!820490) (not b!820493))
(check-sat b_and!21769 (not b_next!12915))
