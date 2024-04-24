; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71538 () Bool)

(assert start!71538)

(declare-fun b_free!13453 () Bool)

(declare-fun b_next!13453 () Bool)

(assert (=> start!71538 (= b_free!13453 (not b_next!13453))))

(declare-fun tp!47133 () Bool)

(declare-fun b_and!22445 () Bool)

(assert (=> start!71538 (= tp!47133 b_and!22445)))

(declare-fun b!829789 () Bool)

(declare-fun e!462529 () Bool)

(declare-fun tp_is_empty!15163 () Bool)

(assert (=> b!829789 (= e!462529 tp_is_empty!15163)))

(declare-fun b!829790 () Bool)

(declare-fun e!462531 () Bool)

(declare-fun e!462527 () Bool)

(assert (=> b!829790 (= e!462531 (not e!462527))))

(declare-fun res!565092 () Bool)

(assert (=> b!829790 (=> res!565092 e!462527)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829790 (= res!565092 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25219 0))(
  ( (V!25220 (val!7629 Int)) )
))
(declare-datatypes ((tuple2!10040 0))(
  ( (tuple2!10041 (_1!5031 (_ BitVec 64)) (_2!5031 V!25219)) )
))
(declare-datatypes ((List!15814 0))(
  ( (Nil!15811) (Cons!15810 (h!16945 tuple2!10040) (t!22163 List!15814)) )
))
(declare-datatypes ((ListLongMap!8865 0))(
  ( (ListLongMap!8866 (toList!4448 List!15814)) )
))
(declare-fun lt!376085 () ListLongMap!8865)

(declare-fun lt!376081 () ListLongMap!8865)

(assert (=> b!829790 (= lt!376085 lt!376081)))

(declare-fun zeroValueBefore!34 () V!25219)

(declare-datatypes ((array!46503 0))(
  ( (array!46504 (arr!22287 (Array (_ BitVec 32) (_ BitVec 64))) (size!22707 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46503)

(declare-fun zeroValueAfter!34 () V!25219)

(declare-datatypes ((ValueCell!7166 0))(
  ( (ValueCellFull!7166 (v!10067 V!25219)) (EmptyCell!7166) )
))
(declare-datatypes ((array!46505 0))(
  ( (array!46506 (arr!22288 (Array (_ BitVec 32) ValueCell!7166)) (size!22708 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46505)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28412 0))(
  ( (Unit!28413) )
))
(declare-fun lt!376082 () Unit!28412)

(declare-fun minValue!754 () V!25219)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!591 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 V!25219 V!25219 (_ BitVec 32) Int) Unit!28412)

(assert (=> b!829790 (= lt!376082 (lemmaNoChangeToArrayThenSameMapNoExtras!591 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2524 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 (_ BitVec 32) Int) ListLongMap!8865)

(assert (=> b!829790 (= lt!376081 (getCurrentListMapNoExtraKeys!2524 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829790 (= lt!376085 (getCurrentListMapNoExtraKeys!2524 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829791 () Bool)

(declare-fun e!462530 () Bool)

(declare-fun e!462533 () Bool)

(declare-fun mapRes!24385 () Bool)

(assert (=> b!829791 (= e!462530 (and e!462533 mapRes!24385))))

(declare-fun condMapEmpty!24385 () Bool)

(declare-fun mapDefault!24385 () ValueCell!7166)

(assert (=> b!829791 (= condMapEmpty!24385 (= (arr!22288 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7166)) mapDefault!24385)))))

(declare-fun b!829792 () Bool)

(declare-fun res!565089 () Bool)

(assert (=> b!829792 (=> (not res!565089) (not e!462531))))

(declare-datatypes ((List!15815 0))(
  ( (Nil!15812) (Cons!15811 (h!16946 (_ BitVec 64)) (t!22164 List!15815)) )
))
(declare-fun arrayNoDuplicates!0 (array!46503 (_ BitVec 32) List!15815) Bool)

(assert (=> b!829792 (= res!565089 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15812))))

(declare-fun b!829793 () Bool)

(declare-fun res!565093 () Bool)

(assert (=> b!829793 (=> (not res!565093) (not e!462531))))

(assert (=> b!829793 (= res!565093 (and (= (size!22708 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22707 _keys!976) (size!22708 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829795 () Bool)

(declare-fun e!462528 () Bool)

(assert (=> b!829795 (= e!462527 e!462528)))

(declare-fun res!565095 () Bool)

(assert (=> b!829795 (=> res!565095 e!462528)))

(declare-fun lt!376086 () tuple2!10040)

(declare-fun lt!376087 () tuple2!10040)

(declare-fun lt!376083 () ListLongMap!8865)

(declare-fun +!1971 (ListLongMap!8865 tuple2!10040) ListLongMap!8865)

(assert (=> b!829795 (= res!565095 (not (= lt!376083 (+!1971 (+!1971 lt!376081 lt!376086) lt!376087))))))

(declare-fun lt!376080 () ListLongMap!8865)

(assert (=> b!829795 (= (+!1971 lt!376085 lt!376087) (+!1971 lt!376080 lt!376087))))

(declare-fun lt!376084 () Unit!28412)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!244 (ListLongMap!8865 (_ BitVec 64) V!25219 V!25219) Unit!28412)

(assert (=> b!829795 (= lt!376084 (addSameAsAddTwiceSameKeyDiffValues!244 lt!376085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!829795 (= lt!376087 (tuple2!10041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!462534 () Bool)

(assert (=> b!829795 e!462534))

(declare-fun res!565094 () Bool)

(assert (=> b!829795 (=> (not res!565094) (not e!462534))))

(declare-fun lt!376079 () ListLongMap!8865)

(assert (=> b!829795 (= res!565094 (= lt!376079 lt!376080))))

(assert (=> b!829795 (= lt!376080 (+!1971 lt!376085 lt!376086))))

(assert (=> b!829795 (= lt!376086 (tuple2!10041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2543 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 (_ BitVec 32) Int) ListLongMap!8865)

(assert (=> b!829795 (= lt!376083 (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829795 (= lt!376079 (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829796 () Bool)

(declare-fun res!565090 () Bool)

(assert (=> b!829796 (=> (not res!565090) (not e!462531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46503 (_ BitVec 32)) Bool)

(assert (=> b!829796 (= res!565090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24385 () Bool)

(declare-fun tp!47134 () Bool)

(assert (=> mapNonEmpty!24385 (= mapRes!24385 (and tp!47134 e!462529))))

(declare-fun mapKey!24385 () (_ BitVec 32))

(declare-fun mapRest!24385 () (Array (_ BitVec 32) ValueCell!7166))

(declare-fun mapValue!24385 () ValueCell!7166)

(assert (=> mapNonEmpty!24385 (= (arr!22288 _values!788) (store mapRest!24385 mapKey!24385 mapValue!24385))))

(declare-fun b!829797 () Bool)

(assert (=> b!829797 (= e!462533 tp_is_empty!15163)))

(declare-fun b!829798 () Bool)

(assert (=> b!829798 (= e!462534 (= lt!376083 (+!1971 lt!376081 (tuple2!10041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!24385 () Bool)

(assert (=> mapIsEmpty!24385 mapRes!24385))

(declare-fun res!565091 () Bool)

(assert (=> start!71538 (=> (not res!565091) (not e!462531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71538 (= res!565091 (validMask!0 mask!1312))))

(assert (=> start!71538 e!462531))

(assert (=> start!71538 tp_is_empty!15163))

(declare-fun array_inv!17797 (array!46503) Bool)

(assert (=> start!71538 (array_inv!17797 _keys!976)))

(assert (=> start!71538 true))

(declare-fun array_inv!17798 (array!46505) Bool)

(assert (=> start!71538 (and (array_inv!17798 _values!788) e!462530)))

(assert (=> start!71538 tp!47133))

(declare-fun b!829794 () Bool)

(assert (=> b!829794 (= e!462528 (= (+!1971 lt!376079 lt!376087) lt!376083))))

(assert (= (and start!71538 res!565091) b!829793))

(assert (= (and b!829793 res!565093) b!829796))

(assert (= (and b!829796 res!565090) b!829792))

(assert (= (and b!829792 res!565089) b!829790))

(assert (= (and b!829790 (not res!565092)) b!829795))

(assert (= (and b!829795 res!565094) b!829798))

(assert (= (and b!829795 (not res!565095)) b!829794))

(assert (= (and b!829791 condMapEmpty!24385) mapIsEmpty!24385))

(assert (= (and b!829791 (not condMapEmpty!24385)) mapNonEmpty!24385))

(get-info :version)

(assert (= (and mapNonEmpty!24385 ((_ is ValueCellFull!7166) mapValue!24385)) b!829789))

(assert (= (and b!829791 ((_ is ValueCellFull!7166) mapDefault!24385)) b!829797))

(assert (= start!71538 b!829791))

(declare-fun m!773133 () Bool)

(assert (=> start!71538 m!773133))

(declare-fun m!773135 () Bool)

(assert (=> start!71538 m!773135))

(declare-fun m!773137 () Bool)

(assert (=> start!71538 m!773137))

(declare-fun m!773139 () Bool)

(assert (=> mapNonEmpty!24385 m!773139))

(declare-fun m!773141 () Bool)

(assert (=> b!829792 m!773141))

(declare-fun m!773143 () Bool)

(assert (=> b!829796 m!773143))

(declare-fun m!773145 () Bool)

(assert (=> b!829790 m!773145))

(declare-fun m!773147 () Bool)

(assert (=> b!829790 m!773147))

(declare-fun m!773149 () Bool)

(assert (=> b!829790 m!773149))

(declare-fun m!773151 () Bool)

(assert (=> b!829795 m!773151))

(declare-fun m!773153 () Bool)

(assert (=> b!829795 m!773153))

(declare-fun m!773155 () Bool)

(assert (=> b!829795 m!773155))

(declare-fun m!773157 () Bool)

(assert (=> b!829795 m!773157))

(declare-fun m!773159 () Bool)

(assert (=> b!829795 m!773159))

(declare-fun m!773161 () Bool)

(assert (=> b!829795 m!773161))

(assert (=> b!829795 m!773151))

(declare-fun m!773163 () Bool)

(assert (=> b!829795 m!773163))

(declare-fun m!773165 () Bool)

(assert (=> b!829795 m!773165))

(declare-fun m!773167 () Bool)

(assert (=> b!829798 m!773167))

(declare-fun m!773169 () Bool)

(assert (=> b!829794 m!773169))

(check-sat (not b_next!13453) b_and!22445 (not b!829795) (not b!829798) tp_is_empty!15163 (not mapNonEmpty!24385) (not b!829790) (not b!829792) (not b!829794) (not start!71538) (not b!829796))
(check-sat b_and!22445 (not b_next!13453))
