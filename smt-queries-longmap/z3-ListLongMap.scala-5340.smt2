; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71532 () Bool)

(assert start!71532)

(declare-fun b_free!13447 () Bool)

(declare-fun b_next!13447 () Bool)

(assert (=> start!71532 (= b_free!13447 (not b_next!13447))))

(declare-fun tp!47115 () Bool)

(declare-fun b_and!22439 () Bool)

(assert (=> start!71532 (= tp!47115 b_and!22439)))

(declare-fun mapIsEmpty!24376 () Bool)

(declare-fun mapRes!24376 () Bool)

(assert (=> mapIsEmpty!24376 mapRes!24376))

(declare-fun b!829706 () Bool)

(declare-fun res!565038 () Bool)

(declare-fun e!462468 () Bool)

(assert (=> b!829706 (=> (not res!565038) (not e!462468))))

(declare-datatypes ((array!46491 0))(
  ( (array!46492 (arr!22281 (Array (_ BitVec 32) (_ BitVec 64))) (size!22701 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46491)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25211 0))(
  ( (V!25212 (val!7626 Int)) )
))
(declare-datatypes ((ValueCell!7163 0))(
  ( (ValueCellFull!7163 (v!10064 V!25211)) (EmptyCell!7163) )
))
(declare-datatypes ((array!46493 0))(
  ( (array!46494 (arr!22282 (Array (_ BitVec 32) ValueCell!7163)) (size!22702 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46493)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829706 (= res!565038 (and (= (size!22702 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22701 _keys!976) (size!22702 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!565035 () Bool)

(assert (=> start!71532 (=> (not res!565035) (not e!462468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71532 (= res!565035 (validMask!0 mask!1312))))

(assert (=> start!71532 e!462468))

(declare-fun tp_is_empty!15157 () Bool)

(assert (=> start!71532 tp_is_empty!15157))

(declare-fun array_inv!17795 (array!46491) Bool)

(assert (=> start!71532 (array_inv!17795 _keys!976)))

(assert (=> start!71532 true))

(declare-fun e!462463 () Bool)

(declare-fun array_inv!17796 (array!46493) Bool)

(assert (=> start!71532 (and (array_inv!17796 _values!788) e!462463)))

(assert (=> start!71532 tp!47115))

(declare-datatypes ((tuple2!10034 0))(
  ( (tuple2!10035 (_1!5028 (_ BitVec 64)) (_2!5028 V!25211)) )
))
(declare-datatypes ((List!15810 0))(
  ( (Nil!15807) (Cons!15806 (h!16941 tuple2!10034) (t!22159 List!15810)) )
))
(declare-datatypes ((ListLongMap!8859 0))(
  ( (ListLongMap!8860 (toList!4445 List!15810)) )
))
(declare-fun lt!376001 () ListLongMap!8859)

(declare-fun b!829707 () Bool)

(declare-fun e!462465 () Bool)

(declare-fun lt!375999 () ListLongMap!8859)

(declare-fun lt!376005 () tuple2!10034)

(declare-fun lt!376002 () tuple2!10034)

(declare-fun +!1968 (ListLongMap!8859 tuple2!10034) ListLongMap!8859)

(assert (=> b!829707 (= e!462465 (= lt!376001 (+!1968 (+!1968 lt!375999 lt!376005) lt!376002)))))

(declare-fun lt!376006 () ListLongMap!8859)

(declare-fun lt!376004 () ListLongMap!8859)

(assert (=> b!829707 (= (+!1968 lt!376006 lt!376002) (+!1968 lt!376004 lt!376002))))

(declare-fun zeroValueBefore!34 () V!25211)

(declare-fun zeroValueAfter!34 () V!25211)

(declare-datatypes ((Unit!28406 0))(
  ( (Unit!28407) )
))
(declare-fun lt!376000 () Unit!28406)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!242 (ListLongMap!8859 (_ BitVec 64) V!25211 V!25211) Unit!28406)

(assert (=> b!829707 (= lt!376000 (addSameAsAddTwiceSameKeyDiffValues!242 lt!376006 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!829707 (= lt!376002 (tuple2!10035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!462464 () Bool)

(assert (=> b!829707 e!462464))

(declare-fun res!565033 () Bool)

(assert (=> b!829707 (=> (not res!565033) (not e!462464))))

(declare-fun lt!376003 () ListLongMap!8859)

(assert (=> b!829707 (= res!565033 (= lt!376003 lt!376004))))

(assert (=> b!829707 (= lt!376004 (+!1968 lt!376006 lt!376005))))

(assert (=> b!829707 (= lt!376005 (tuple2!10035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!25211)

(declare-fun getCurrentListMap!2541 (array!46491 array!46493 (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!829707 (= lt!376001 (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829707 (= lt!376003 (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829708 () Bool)

(declare-fun e!462467 () Bool)

(assert (=> b!829708 (= e!462467 tp_is_empty!15157)))

(declare-fun b!829709 () Bool)

(assert (=> b!829709 (= e!462468 (not e!462465))))

(declare-fun res!565034 () Bool)

(assert (=> b!829709 (=> res!565034 e!462465)))

(assert (=> b!829709 (= res!565034 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829709 (= lt!376006 lt!375999)))

(declare-fun lt!375998 () Unit!28406)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!588 (array!46491 array!46493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 V!25211 V!25211 (_ BitVec 32) Int) Unit!28406)

(assert (=> b!829709 (= lt!375998 (lemmaNoChangeToArrayThenSameMapNoExtras!588 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2521 (array!46491 array!46493 (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!829709 (= lt!375999 (getCurrentListMapNoExtraKeys!2521 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829709 (= lt!376006 (getCurrentListMapNoExtraKeys!2521 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829710 () Bool)

(declare-fun res!565036 () Bool)

(assert (=> b!829710 (=> (not res!565036) (not e!462468))))

(declare-datatypes ((List!15811 0))(
  ( (Nil!15808) (Cons!15807 (h!16942 (_ BitVec 64)) (t!22160 List!15811)) )
))
(declare-fun arrayNoDuplicates!0 (array!46491 (_ BitVec 32) List!15811) Bool)

(assert (=> b!829710 (= res!565036 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15808))))

(declare-fun b!829711 () Bool)

(declare-fun res!565037 () Bool)

(assert (=> b!829711 (=> (not res!565037) (not e!462468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46491 (_ BitVec 32)) Bool)

(assert (=> b!829711 (= res!565037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829712 () Bool)

(declare-fun e!462462 () Bool)

(assert (=> b!829712 (= e!462462 tp_is_empty!15157)))

(declare-fun mapNonEmpty!24376 () Bool)

(declare-fun tp!47116 () Bool)

(assert (=> mapNonEmpty!24376 (= mapRes!24376 (and tp!47116 e!462467))))

(declare-fun mapRest!24376 () (Array (_ BitVec 32) ValueCell!7163))

(declare-fun mapKey!24376 () (_ BitVec 32))

(declare-fun mapValue!24376 () ValueCell!7163)

(assert (=> mapNonEmpty!24376 (= (arr!22282 _values!788) (store mapRest!24376 mapKey!24376 mapValue!24376))))

(declare-fun b!829713 () Bool)

(assert (=> b!829713 (= e!462464 (= lt!376001 (+!1968 lt!375999 (tuple2!10035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!829714 () Bool)

(assert (=> b!829714 (= e!462463 (and e!462462 mapRes!24376))))

(declare-fun condMapEmpty!24376 () Bool)

(declare-fun mapDefault!24376 () ValueCell!7163)

(assert (=> b!829714 (= condMapEmpty!24376 (= (arr!22282 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7163)) mapDefault!24376)))))

(assert (= (and start!71532 res!565035) b!829706))

(assert (= (and b!829706 res!565038) b!829711))

(assert (= (and b!829711 res!565037) b!829710))

(assert (= (and b!829710 res!565036) b!829709))

(assert (= (and b!829709 (not res!565034)) b!829707))

(assert (= (and b!829707 res!565033) b!829713))

(assert (= (and b!829714 condMapEmpty!24376) mapIsEmpty!24376))

(assert (= (and b!829714 (not condMapEmpty!24376)) mapNonEmpty!24376))

(get-info :version)

(assert (= (and mapNonEmpty!24376 ((_ is ValueCellFull!7163) mapValue!24376)) b!829708))

(assert (= (and b!829714 ((_ is ValueCellFull!7163) mapDefault!24376)) b!829712))

(assert (= start!71532 b!829714))

(declare-fun m!773025 () Bool)

(assert (=> b!829709 m!773025))

(declare-fun m!773027 () Bool)

(assert (=> b!829709 m!773027))

(declare-fun m!773029 () Bool)

(assert (=> b!829709 m!773029))

(declare-fun m!773031 () Bool)

(assert (=> b!829713 m!773031))

(declare-fun m!773033 () Bool)

(assert (=> start!71532 m!773033))

(declare-fun m!773035 () Bool)

(assert (=> start!71532 m!773035))

(declare-fun m!773037 () Bool)

(assert (=> start!71532 m!773037))

(declare-fun m!773039 () Bool)

(assert (=> b!829711 m!773039))

(declare-fun m!773041 () Bool)

(assert (=> mapNonEmpty!24376 m!773041))

(declare-fun m!773043 () Bool)

(assert (=> b!829707 m!773043))

(declare-fun m!773045 () Bool)

(assert (=> b!829707 m!773045))

(declare-fun m!773047 () Bool)

(assert (=> b!829707 m!773047))

(declare-fun m!773049 () Bool)

(assert (=> b!829707 m!773049))

(declare-fun m!773051 () Bool)

(assert (=> b!829707 m!773051))

(assert (=> b!829707 m!773047))

(declare-fun m!773053 () Bool)

(assert (=> b!829707 m!773053))

(declare-fun m!773055 () Bool)

(assert (=> b!829707 m!773055))

(declare-fun m!773057 () Bool)

(assert (=> b!829707 m!773057))

(declare-fun m!773059 () Bool)

(assert (=> b!829710 m!773059))

(check-sat (not b!829710) tp_is_empty!15157 (not b!829711) (not b!829713) (not mapNonEmpty!24376) b_and!22439 (not start!71532) (not b_next!13447) (not b!829709) (not b!829707))
(check-sat b_and!22439 (not b_next!13447))
