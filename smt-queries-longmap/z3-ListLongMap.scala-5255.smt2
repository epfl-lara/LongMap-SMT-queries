; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70652 () Bool)

(assert start!70652)

(declare-fun b_free!12939 () Bool)

(declare-fun b_next!12939 () Bool)

(assert (=> start!70652 (= b_free!12939 (not b_next!12939))))

(declare-fun tp!45556 () Bool)

(declare-fun b_and!21793 () Bool)

(assert (=> start!70652 (= tp!45556 b_and!21793)))

(declare-fun b!820740 () Bool)

(declare-fun res!559960 () Bool)

(declare-fun e!456021 () Bool)

(assert (=> b!820740 (=> (not res!559960) (not e!456021))))

(declare-datatypes ((array!45492 0))(
  ( (array!45493 (arr!21798 (Array (_ BitVec 32) (_ BitVec 64))) (size!22219 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45492)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45492 (_ BitVec 32)) Bool)

(assert (=> b!820740 (= res!559960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23578 () Bool)

(declare-fun mapRes!23578 () Bool)

(assert (=> mapIsEmpty!23578 mapRes!23578))

(declare-fun b!820741 () Bool)

(declare-fun e!456018 () Bool)

(declare-fun tp_is_empty!14649 () Bool)

(assert (=> b!820741 (= e!456018 tp_is_empty!14649)))

(declare-fun b!820742 () Bool)

(declare-fun e!456019 () Bool)

(assert (=> b!820742 (= e!456019 tp_is_empty!14649)))

(declare-fun b!820743 () Bool)

(declare-fun e!456022 () Bool)

(assert (=> b!820743 (= e!456022 (and e!456019 mapRes!23578))))

(declare-fun condMapEmpty!23578 () Bool)

(declare-datatypes ((V!24533 0))(
  ( (V!24534 (val!7372 Int)) )
))
(declare-datatypes ((ValueCell!6909 0))(
  ( (ValueCellFull!6909 (v!9803 V!24533)) (EmptyCell!6909) )
))
(declare-datatypes ((array!45494 0))(
  ( (array!45495 (arr!21799 (Array (_ BitVec 32) ValueCell!6909)) (size!22220 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45494)

(declare-fun mapDefault!23578 () ValueCell!6909)

(assert (=> b!820743 (= condMapEmpty!23578 (= (arr!21799 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6909)) mapDefault!23578)))))

(declare-fun b!820744 () Bool)

(assert (=> b!820744 (= e!456021 (not true))))

(declare-datatypes ((tuple2!9714 0))(
  ( (tuple2!9715 (_1!4868 (_ BitVec 64)) (_2!4868 V!24533)) )
))
(declare-datatypes ((List!15534 0))(
  ( (Nil!15531) (Cons!15530 (h!16659 tuple2!9714) (t!21867 List!15534)) )
))
(declare-datatypes ((ListLongMap!8537 0))(
  ( (ListLongMap!8538 (toList!4284 List!15534)) )
))
(declare-fun lt!368896 () ListLongMap!8537)

(declare-fun lt!368895 () ListLongMap!8537)

(assert (=> b!820744 (= lt!368896 lt!368895)))

(declare-fun zeroValueBefore!34 () V!24533)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24533)

(declare-fun minValue!754 () V!24533)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28045 0))(
  ( (Unit!28046) )
))
(declare-fun lt!368894 () Unit!28045)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!420 (array!45492 array!45494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24533 V!24533 V!24533 V!24533 (_ BitVec 32) Int) Unit!28045)

(assert (=> b!820744 (= lt!368894 (lemmaNoChangeToArrayThenSameMapNoExtras!420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2310 (array!45492 array!45494 (_ BitVec 32) (_ BitVec 32) V!24533 V!24533 (_ BitVec 32) Int) ListLongMap!8537)

(assert (=> b!820744 (= lt!368895 (getCurrentListMapNoExtraKeys!2310 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820744 (= lt!368896 (getCurrentListMapNoExtraKeys!2310 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820745 () Bool)

(declare-fun res!559958 () Bool)

(assert (=> b!820745 (=> (not res!559958) (not e!456021))))

(declare-datatypes ((List!15535 0))(
  ( (Nil!15532) (Cons!15531 (h!16660 (_ BitVec 64)) (t!21868 List!15535)) )
))
(declare-fun arrayNoDuplicates!0 (array!45492 (_ BitVec 32) List!15535) Bool)

(assert (=> b!820745 (= res!559958 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15532))))

(declare-fun res!559959 () Bool)

(assert (=> start!70652 (=> (not res!559959) (not e!456021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70652 (= res!559959 (validMask!0 mask!1312))))

(assert (=> start!70652 e!456021))

(assert (=> start!70652 tp_is_empty!14649))

(declare-fun array_inv!17423 (array!45492) Bool)

(assert (=> start!70652 (array_inv!17423 _keys!976)))

(assert (=> start!70652 true))

(declare-fun array_inv!17424 (array!45494) Bool)

(assert (=> start!70652 (and (array_inv!17424 _values!788) e!456022)))

(assert (=> start!70652 tp!45556))

(declare-fun b!820746 () Bool)

(declare-fun res!559957 () Bool)

(assert (=> b!820746 (=> (not res!559957) (not e!456021))))

(assert (=> b!820746 (= res!559957 (and (= (size!22220 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22219 _keys!976) (size!22220 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23578 () Bool)

(declare-fun tp!45555 () Bool)

(assert (=> mapNonEmpty!23578 (= mapRes!23578 (and tp!45555 e!456018))))

(declare-fun mapKey!23578 () (_ BitVec 32))

(declare-fun mapRest!23578 () (Array (_ BitVec 32) ValueCell!6909))

(declare-fun mapValue!23578 () ValueCell!6909)

(assert (=> mapNonEmpty!23578 (= (arr!21799 _values!788) (store mapRest!23578 mapKey!23578 mapValue!23578))))

(assert (= (and start!70652 res!559959) b!820746))

(assert (= (and b!820746 res!559957) b!820740))

(assert (= (and b!820740 res!559960) b!820745))

(assert (= (and b!820745 res!559958) b!820744))

(assert (= (and b!820743 condMapEmpty!23578) mapIsEmpty!23578))

(assert (= (and b!820743 (not condMapEmpty!23578)) mapNonEmpty!23578))

(get-info :version)

(assert (= (and mapNonEmpty!23578 ((_ is ValueCellFull!6909) mapValue!23578)) b!820741))

(assert (= (and b!820743 ((_ is ValueCellFull!6909) mapDefault!23578)) b!820742))

(assert (= start!70652 b!820743))

(declare-fun m!762651 () Bool)

(assert (=> b!820740 m!762651))

(declare-fun m!762653 () Bool)

(assert (=> mapNonEmpty!23578 m!762653))

(declare-fun m!762655 () Bool)

(assert (=> b!820745 m!762655))

(declare-fun m!762657 () Bool)

(assert (=> b!820744 m!762657))

(declare-fun m!762659 () Bool)

(assert (=> b!820744 m!762659))

(declare-fun m!762661 () Bool)

(assert (=> b!820744 m!762661))

(declare-fun m!762663 () Bool)

(assert (=> start!70652 m!762663))

(declare-fun m!762665 () Bool)

(assert (=> start!70652 m!762665))

(declare-fun m!762667 () Bool)

(assert (=> start!70652 m!762667))

(check-sat (not b!820740) (not mapNonEmpty!23578) (not b!820744) (not b!820745) (not start!70652) tp_is_empty!14649 b_and!21793 (not b_next!12939))
(check-sat b_and!21793 (not b_next!12939))
