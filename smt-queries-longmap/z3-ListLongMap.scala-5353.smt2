; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71672 () Bool)

(assert start!71672)

(declare-fun b_free!13525 () Bool)

(declare-fun b_next!13525 () Bool)

(assert (=> start!71672 (= b_free!13525 (not b_next!13525))))

(declare-fun tp!47371 () Bool)

(declare-fun b_and!22585 () Bool)

(assert (=> start!71672 (= tp!47371 b_and!22585)))

(declare-fun b!833521 () Bool)

(declare-fun e!465006 () Bool)

(declare-fun e!465000 () Bool)

(assert (=> b!833521 (= e!465006 e!465000)))

(declare-fun res!566837 () Bool)

(assert (=> b!833521 (=> res!566837 e!465000)))

(declare-datatypes ((V!25315 0))(
  ( (V!25316 (val!7665 Int)) )
))
(declare-datatypes ((tuple2!10186 0))(
  ( (tuple2!10187 (_1!5104 (_ BitVec 64)) (_2!5104 V!25315)) )
))
(declare-datatypes ((List!15967 0))(
  ( (Nil!15964) (Cons!15963 (h!17094 tuple2!10186) (t!22329 List!15967)) )
))
(declare-datatypes ((ListLongMap!8999 0))(
  ( (ListLongMap!9000 (toList!4515 List!15967)) )
))
(declare-fun lt!378310 () ListLongMap!8999)

(declare-fun lt!378303 () tuple2!10186)

(declare-fun lt!378306 () tuple2!10186)

(declare-fun lt!378302 () ListLongMap!8999)

(declare-fun +!2023 (ListLongMap!8999 tuple2!10186) ListLongMap!8999)

(assert (=> b!833521 (= res!566837 (not (= lt!378302 (+!2023 (+!2023 lt!378310 lt!378306) lt!378303))))))

(declare-fun lt!378305 () ListLongMap!8999)

(declare-fun lt!378301 () ListLongMap!8999)

(assert (=> b!833521 (and (= lt!378305 lt!378301) (= lt!378302 lt!378301) (= lt!378302 lt!378305))))

(declare-fun lt!378299 () ListLongMap!8999)

(assert (=> b!833521 (= lt!378301 (+!2023 lt!378299 lt!378306))))

(declare-fun lt!378309 () ListLongMap!8999)

(assert (=> b!833521 (= lt!378305 (+!2023 lt!378309 lt!378306))))

(declare-datatypes ((Unit!28523 0))(
  ( (Unit!28524) )
))
(declare-fun lt!378307 () Unit!28523)

(declare-fun zeroValueAfter!34 () V!25315)

(declare-fun zeroValueBefore!34 () V!25315)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!255 (ListLongMap!8999 (_ BitVec 64) V!25315 V!25315) Unit!28523)

(assert (=> b!833521 (= lt!378307 (addSameAsAddTwiceSameKeyDiffValues!255 lt!378309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465004 () Bool)

(assert (=> b!833521 e!465004))

(declare-fun res!566842 () Bool)

(assert (=> b!833521 (=> (not res!566842) (not e!465004))))

(declare-fun lt!378304 () ListLongMap!8999)

(assert (=> b!833521 (= res!566842 (= lt!378304 lt!378299))))

(declare-fun lt!378308 () tuple2!10186)

(assert (=> b!833521 (= lt!378299 (+!2023 lt!378309 lt!378308))))

(assert (=> b!833521 (= lt!378309 (+!2023 lt!378310 lt!378303))))

(assert (=> b!833521 (= lt!378306 (tuple2!10187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465005 () Bool)

(assert (=> b!833521 e!465005))

(declare-fun res!566839 () Bool)

(assert (=> b!833521 (=> (not res!566839) (not e!465005))))

(assert (=> b!833521 (= res!566839 (= lt!378304 (+!2023 (+!2023 lt!378310 lt!378308) lt!378303)))))

(declare-fun minValue!754 () V!25315)

(assert (=> b!833521 (= lt!378303 (tuple2!10187 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833521 (= lt!378308 (tuple2!10187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46613 0))(
  ( (array!46614 (arr!22341 (Array (_ BitVec 32) (_ BitVec 64))) (size!22762 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46613)

(declare-datatypes ((ValueCell!7202 0))(
  ( (ValueCellFull!7202 (v!10107 V!25315)) (EmptyCell!7202) )
))
(declare-datatypes ((array!46615 0))(
  ( (array!46616 (arr!22342 (Array (_ BitVec 32) ValueCell!7202)) (size!22763 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46615)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2562 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 (_ BitVec 32) Int) ListLongMap!8999)

(assert (=> b!833521 (= lt!378302 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833521 (= lt!378304 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833522 () Bool)

(assert (=> b!833522 (= e!465000 (= (+!2023 lt!378304 lt!378306) lt!378302))))

(declare-fun lt!378298 () ListLongMap!8999)

(declare-fun b!833523 () Bool)

(assert (=> b!833523 (= e!465005 (= lt!378302 (+!2023 (+!2023 lt!378298 (tuple2!10187 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378303)))))

(declare-fun b!833524 () Bool)

(declare-fun e!464998 () Bool)

(declare-fun tp_is_empty!15235 () Bool)

(assert (=> b!833524 (= e!464998 tp_is_empty!15235)))

(declare-fun b!833525 () Bool)

(declare-fun res!566835 () Bool)

(declare-fun e!465002 () Bool)

(assert (=> b!833525 (=> (not res!566835) (not e!465002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46613 (_ BitVec 32)) Bool)

(assert (=> b!833525 (= res!566835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833526 () Bool)

(assert (=> b!833526 (= e!465004 (= lt!378302 (+!2023 (+!2023 lt!378298 lt!378303) lt!378306)))))

(declare-fun res!566840 () Bool)

(assert (=> start!71672 (=> (not res!566840) (not e!465002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71672 (= res!566840 (validMask!0 mask!1312))))

(assert (=> start!71672 e!465002))

(assert (=> start!71672 tp_is_empty!15235))

(declare-fun array_inv!17855 (array!46613) Bool)

(assert (=> start!71672 (array_inv!17855 _keys!976)))

(assert (=> start!71672 true))

(declare-fun e!465003 () Bool)

(declare-fun array_inv!17856 (array!46615) Bool)

(assert (=> start!71672 (and (array_inv!17856 _values!788) e!465003)))

(assert (=> start!71672 tp!47371))

(declare-fun b!833527 () Bool)

(assert (=> b!833527 (= e!465002 (not e!465006))))

(declare-fun res!566838 () Bool)

(assert (=> b!833527 (=> res!566838 e!465006)))

(assert (=> b!833527 (= res!566838 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!833527 (= lt!378310 lt!378298)))

(declare-fun lt!378300 () Unit!28523)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!610 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 V!25315 V!25315 (_ BitVec 32) Int) Unit!28523)

(assert (=> b!833527 (= lt!378300 (lemmaNoChangeToArrayThenSameMapNoExtras!610 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2540 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 (_ BitVec 32) Int) ListLongMap!8999)

(assert (=> b!833527 (= lt!378298 (getCurrentListMapNoExtraKeys!2540 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833527 (= lt!378310 (getCurrentListMapNoExtraKeys!2540 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24515 () Bool)

(declare-fun mapRes!24515 () Bool)

(declare-fun tp!47372 () Bool)

(assert (=> mapNonEmpty!24515 (= mapRes!24515 (and tp!47372 e!464998))))

(declare-fun mapKey!24515 () (_ BitVec 32))

(declare-fun mapRest!24515 () (Array (_ BitVec 32) ValueCell!7202))

(declare-fun mapValue!24515 () ValueCell!7202)

(assert (=> mapNonEmpty!24515 (= (arr!22342 _values!788) (store mapRest!24515 mapKey!24515 mapValue!24515))))

(declare-fun b!833528 () Bool)

(declare-fun e!464999 () Bool)

(assert (=> b!833528 (= e!464999 tp_is_empty!15235)))

(declare-fun mapIsEmpty!24515 () Bool)

(assert (=> mapIsEmpty!24515 mapRes!24515))

(declare-fun b!833529 () Bool)

(assert (=> b!833529 (= e!465003 (and e!464999 mapRes!24515))))

(declare-fun condMapEmpty!24515 () Bool)

(declare-fun mapDefault!24515 () ValueCell!7202)

(assert (=> b!833529 (= condMapEmpty!24515 (= (arr!22342 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7202)) mapDefault!24515)))))

(declare-fun b!833530 () Bool)

(declare-fun res!566841 () Bool)

(assert (=> b!833530 (=> (not res!566841) (not e!465002))))

(declare-datatypes ((List!15968 0))(
  ( (Nil!15965) (Cons!15964 (h!17095 (_ BitVec 64)) (t!22330 List!15968)) )
))
(declare-fun arrayNoDuplicates!0 (array!46613 (_ BitVec 32) List!15968) Bool)

(assert (=> b!833530 (= res!566841 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15965))))

(declare-fun b!833531 () Bool)

(declare-fun res!566836 () Bool)

(assert (=> b!833531 (=> (not res!566836) (not e!465002))))

(assert (=> b!833531 (= res!566836 (and (= (size!22763 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22762 _keys!976) (size!22763 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71672 res!566840) b!833531))

(assert (= (and b!833531 res!566836) b!833525))

(assert (= (and b!833525 res!566835) b!833530))

(assert (= (and b!833530 res!566841) b!833527))

(assert (= (and b!833527 (not res!566838)) b!833521))

(assert (= (and b!833521 res!566839) b!833523))

(assert (= (and b!833521 res!566842) b!833526))

(assert (= (and b!833521 (not res!566837)) b!833522))

(assert (= (and b!833529 condMapEmpty!24515) mapIsEmpty!24515))

(assert (= (and b!833529 (not condMapEmpty!24515)) mapNonEmpty!24515))

(get-info :version)

(assert (= (and mapNonEmpty!24515 ((_ is ValueCellFull!7202) mapValue!24515)) b!833524))

(assert (= (and b!833529 ((_ is ValueCellFull!7202) mapDefault!24515)) b!833528))

(assert (= start!71672 b!833529))

(declare-fun m!777935 () Bool)

(assert (=> b!833530 m!777935))

(declare-fun m!777937 () Bool)

(assert (=> b!833526 m!777937))

(assert (=> b!833526 m!777937))

(declare-fun m!777939 () Bool)

(assert (=> b!833526 m!777939))

(declare-fun m!777941 () Bool)

(assert (=> b!833523 m!777941))

(assert (=> b!833523 m!777941))

(declare-fun m!777943 () Bool)

(assert (=> b!833523 m!777943))

(declare-fun m!777945 () Bool)

(assert (=> b!833521 m!777945))

(declare-fun m!777947 () Bool)

(assert (=> b!833521 m!777947))

(declare-fun m!777949 () Bool)

(assert (=> b!833521 m!777949))

(declare-fun m!777951 () Bool)

(assert (=> b!833521 m!777951))

(assert (=> b!833521 m!777949))

(declare-fun m!777953 () Bool)

(assert (=> b!833521 m!777953))

(declare-fun m!777955 () Bool)

(assert (=> b!833521 m!777955))

(assert (=> b!833521 m!777945))

(declare-fun m!777957 () Bool)

(assert (=> b!833521 m!777957))

(declare-fun m!777959 () Bool)

(assert (=> b!833521 m!777959))

(declare-fun m!777961 () Bool)

(assert (=> b!833521 m!777961))

(declare-fun m!777963 () Bool)

(assert (=> b!833521 m!777963))

(declare-fun m!777965 () Bool)

(assert (=> b!833521 m!777965))

(declare-fun m!777967 () Bool)

(assert (=> start!71672 m!777967))

(declare-fun m!777969 () Bool)

(assert (=> start!71672 m!777969))

(declare-fun m!777971 () Bool)

(assert (=> start!71672 m!777971))

(declare-fun m!777973 () Bool)

(assert (=> b!833525 m!777973))

(declare-fun m!777975 () Bool)

(assert (=> b!833522 m!777975))

(declare-fun m!777977 () Bool)

(assert (=> b!833527 m!777977))

(declare-fun m!777979 () Bool)

(assert (=> b!833527 m!777979))

(declare-fun m!777981 () Bool)

(assert (=> b!833527 m!777981))

(declare-fun m!777983 () Bool)

(assert (=> mapNonEmpty!24515 m!777983))

(check-sat tp_is_empty!15235 (not b!833521) (not b!833523) b_and!22585 (not start!71672) (not b!833525) (not b!833526) (not b_next!13525) (not mapNonEmpty!24515) (not b!833522) (not b!833527) (not b!833530))
(check-sat b_and!22585 (not b_next!13525))
