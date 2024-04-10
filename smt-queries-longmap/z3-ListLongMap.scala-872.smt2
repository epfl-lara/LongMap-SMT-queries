; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20330 () Bool)

(assert start!20330)

(declare-fun b_free!4989 () Bool)

(declare-fun b_next!4989 () Bool)

(assert (=> start!20330 (= b_free!4989 (not b_next!4989))))

(declare-fun tp!17999 () Bool)

(declare-fun b_and!11735 () Bool)

(assert (=> start!20330 (= tp!17999 b_and!11735)))

(declare-fun b!200430 () Bool)

(declare-fun e!131438 () Bool)

(declare-fun tp_is_empty!4845 () Bool)

(assert (=> b!200430 (= e!131438 tp_is_empty!4845)))

(declare-fun res!95495 () Bool)

(declare-fun e!131432 () Bool)

(assert (=> start!20330 (=> (not res!95495) (not e!131432))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20330 (= res!95495 (validMask!0 mask!1149))))

(assert (=> start!20330 e!131432))

(declare-datatypes ((V!6107 0))(
  ( (V!6108 (val!2467 Int)) )
))
(declare-datatypes ((ValueCell!2079 0))(
  ( (ValueCellFull!2079 (v!4437 V!6107)) (EmptyCell!2079) )
))
(declare-datatypes ((array!8921 0))(
  ( (array!8922 (arr!4211 (Array (_ BitVec 32) ValueCell!2079)) (size!4536 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8921)

(declare-fun e!131436 () Bool)

(declare-fun array_inv!2771 (array!8921) Bool)

(assert (=> start!20330 (and (array_inv!2771 _values!649) e!131436)))

(assert (=> start!20330 true))

(assert (=> start!20330 tp_is_empty!4845))

(declare-datatypes ((array!8923 0))(
  ( (array!8924 (arr!4212 (Array (_ BitVec 32) (_ BitVec 64))) (size!4537 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8923)

(declare-fun array_inv!2772 (array!8923) Bool)

(assert (=> start!20330 (array_inv!2772 _keys!825)))

(assert (=> start!20330 tp!17999))

(declare-fun b!200431 () Bool)

(declare-fun e!131437 () Bool)

(assert (=> b!200431 (= e!131437 tp_is_empty!4845)))

(declare-fun b!200432 () Bool)

(declare-fun e!131433 () Bool)

(assert (=> b!200432 (= e!131432 (not e!131433))))

(declare-fun res!95498 () Bool)

(assert (=> b!200432 (=> res!95498 e!131433)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200432 (= res!95498 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3728 0))(
  ( (tuple2!3729 (_1!1875 (_ BitVec 64)) (_2!1875 V!6107)) )
))
(declare-datatypes ((List!2644 0))(
  ( (Nil!2641) (Cons!2640 (h!3282 tuple2!3728) (t!7575 List!2644)) )
))
(declare-datatypes ((ListLongMap!2641 0))(
  ( (ListLongMap!2642 (toList!1336 List!2644)) )
))
(declare-fun lt!99030 () ListLongMap!2641)

(declare-fun zeroValue!615 () V!6107)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6107)

(declare-fun getCurrentListMap!926 (array!8923 array!8921 (_ BitVec 32) (_ BitVec 32) V!6107 V!6107 (_ BitVec 32) Int) ListLongMap!2641)

(assert (=> b!200432 (= lt!99030 (getCurrentListMap!926 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99036 () array!8921)

(declare-fun lt!99035 () ListLongMap!2641)

(assert (=> b!200432 (= lt!99035 (getCurrentListMap!926 _keys!825 lt!99036 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99034 () ListLongMap!2641)

(declare-fun lt!99028 () ListLongMap!2641)

(assert (=> b!200432 (and (= lt!99034 lt!99028) (= lt!99028 lt!99034))))

(declare-fun lt!99024 () ListLongMap!2641)

(declare-fun lt!99031 () tuple2!3728)

(declare-fun +!363 (ListLongMap!2641 tuple2!3728) ListLongMap!2641)

(assert (=> b!200432 (= lt!99028 (+!363 lt!99024 lt!99031))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6107)

(assert (=> b!200432 (= lt!99031 (tuple2!3729 k0!843 v!520))))

(declare-datatypes ((Unit!6026 0))(
  ( (Unit!6027) )
))
(declare-fun lt!99033 () Unit!6026)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!39 (array!8923 array!8921 (_ BitVec 32) (_ BitVec 32) V!6107 V!6107 (_ BitVec 32) (_ BitVec 64) V!6107 (_ BitVec 32) Int) Unit!6026)

(assert (=> b!200432 (= lt!99033 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!39 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!300 (array!8923 array!8921 (_ BitVec 32) (_ BitVec 32) V!6107 V!6107 (_ BitVec 32) Int) ListLongMap!2641)

(assert (=> b!200432 (= lt!99034 (getCurrentListMapNoExtraKeys!300 _keys!825 lt!99036 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200432 (= lt!99036 (array!8922 (store (arr!4211 _values!649) i!601 (ValueCellFull!2079 v!520)) (size!4536 _values!649)))))

(assert (=> b!200432 (= lt!99024 (getCurrentListMapNoExtraKeys!300 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8336 () Bool)

(declare-fun mapRes!8336 () Bool)

(assert (=> mapIsEmpty!8336 mapRes!8336))

(declare-fun b!200433 () Bool)

(assert (=> b!200433 (= e!131436 (and e!131438 mapRes!8336))))

(declare-fun condMapEmpty!8336 () Bool)

(declare-fun mapDefault!8336 () ValueCell!2079)

(assert (=> b!200433 (= condMapEmpty!8336 (= (arr!4211 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2079)) mapDefault!8336)))))

(declare-fun b!200434 () Bool)

(declare-fun e!131435 () Bool)

(assert (=> b!200434 (= e!131435 true)))

(declare-fun lt!99029 () tuple2!3728)

(declare-fun lt!99026 () ListLongMap!2641)

(declare-fun lt!99025 () ListLongMap!2641)

(assert (=> b!200434 (= (+!363 lt!99025 lt!99029) (+!363 lt!99026 lt!99031))))

(declare-fun lt!99027 () ListLongMap!2641)

(declare-fun lt!99039 () Unit!6026)

(declare-fun addCommutativeForDiffKeys!87 (ListLongMap!2641 (_ BitVec 64) V!6107 (_ BitVec 64) V!6107) Unit!6026)

(assert (=> b!200434 (= lt!99039 (addCommutativeForDiffKeys!87 lt!99027 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200435 () Bool)

(declare-fun res!95500 () Bool)

(assert (=> b!200435 (=> (not res!95500) (not e!131432))))

(assert (=> b!200435 (= res!95500 (and (= (size!4536 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4537 _keys!825) (size!4536 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200436 () Bool)

(declare-fun res!95502 () Bool)

(assert (=> b!200436 (=> (not res!95502) (not e!131432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8923 (_ BitVec 32)) Bool)

(assert (=> b!200436 (= res!95502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8336 () Bool)

(declare-fun tp!17998 () Bool)

(assert (=> mapNonEmpty!8336 (= mapRes!8336 (and tp!17998 e!131437))))

(declare-fun mapValue!8336 () ValueCell!2079)

(declare-fun mapKey!8336 () (_ BitVec 32))

(declare-fun mapRest!8336 () (Array (_ BitVec 32) ValueCell!2079))

(assert (=> mapNonEmpty!8336 (= (arr!4211 _values!649) (store mapRest!8336 mapKey!8336 mapValue!8336))))

(declare-fun b!200437 () Bool)

(declare-fun res!95499 () Bool)

(assert (=> b!200437 (=> (not res!95499) (not e!131432))))

(assert (=> b!200437 (= res!95499 (= (select (arr!4212 _keys!825) i!601) k0!843))))

(declare-fun b!200438 () Bool)

(declare-fun res!95501 () Bool)

(assert (=> b!200438 (=> (not res!95501) (not e!131432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200438 (= res!95501 (validKeyInArray!0 k0!843))))

(declare-fun b!200439 () Bool)

(declare-fun res!95497 () Bool)

(assert (=> b!200439 (=> (not res!95497) (not e!131432))))

(assert (=> b!200439 (= res!95497 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4537 _keys!825))))))

(declare-fun b!200440 () Bool)

(declare-fun res!95496 () Bool)

(assert (=> b!200440 (=> (not res!95496) (not e!131432))))

(declare-datatypes ((List!2645 0))(
  ( (Nil!2642) (Cons!2641 (h!3283 (_ BitVec 64)) (t!7576 List!2645)) )
))
(declare-fun arrayNoDuplicates!0 (array!8923 (_ BitVec 32) List!2645) Bool)

(assert (=> b!200440 (= res!95496 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2642))))

(declare-fun b!200441 () Bool)

(assert (=> b!200441 (= e!131433 e!131435)))

(declare-fun res!95503 () Bool)

(assert (=> b!200441 (=> res!95503 e!131435)))

(assert (=> b!200441 (= res!95503 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99032 () ListLongMap!2641)

(assert (=> b!200441 (= lt!99032 lt!99025)))

(assert (=> b!200441 (= lt!99025 (+!363 lt!99027 lt!99031))))

(declare-fun lt!99038 () Unit!6026)

(assert (=> b!200441 (= lt!99038 (addCommutativeForDiffKeys!87 lt!99024 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200441 (= lt!99035 (+!363 lt!99032 lt!99029))))

(declare-fun lt!99037 () tuple2!3728)

(assert (=> b!200441 (= lt!99032 (+!363 lt!99028 lt!99037))))

(assert (=> b!200441 (= lt!99030 lt!99026)))

(assert (=> b!200441 (= lt!99026 (+!363 lt!99027 lt!99029))))

(assert (=> b!200441 (= lt!99027 (+!363 lt!99024 lt!99037))))

(assert (=> b!200441 (= lt!99035 (+!363 (+!363 lt!99034 lt!99037) lt!99029))))

(assert (=> b!200441 (= lt!99029 (tuple2!3729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200441 (= lt!99037 (tuple2!3729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20330 res!95495) b!200435))

(assert (= (and b!200435 res!95500) b!200436))

(assert (= (and b!200436 res!95502) b!200440))

(assert (= (and b!200440 res!95496) b!200439))

(assert (= (and b!200439 res!95497) b!200438))

(assert (= (and b!200438 res!95501) b!200437))

(assert (= (and b!200437 res!95499) b!200432))

(assert (= (and b!200432 (not res!95498)) b!200441))

(assert (= (and b!200441 (not res!95503)) b!200434))

(assert (= (and b!200433 condMapEmpty!8336) mapIsEmpty!8336))

(assert (= (and b!200433 (not condMapEmpty!8336)) mapNonEmpty!8336))

(get-info :version)

(assert (= (and mapNonEmpty!8336 ((_ is ValueCellFull!2079) mapValue!8336)) b!200431))

(assert (= (and b!200433 ((_ is ValueCellFull!2079) mapDefault!8336)) b!200430))

(assert (= start!20330 b!200433))

(declare-fun m!226907 () Bool)

(assert (=> b!200441 m!226907))

(declare-fun m!226909 () Bool)

(assert (=> b!200441 m!226909))

(declare-fun m!226911 () Bool)

(assert (=> b!200441 m!226911))

(declare-fun m!226913 () Bool)

(assert (=> b!200441 m!226913))

(declare-fun m!226915 () Bool)

(assert (=> b!200441 m!226915))

(assert (=> b!200441 m!226913))

(declare-fun m!226917 () Bool)

(assert (=> b!200441 m!226917))

(declare-fun m!226919 () Bool)

(assert (=> b!200441 m!226919))

(declare-fun m!226921 () Bool)

(assert (=> b!200441 m!226921))

(declare-fun m!226923 () Bool)

(assert (=> start!20330 m!226923))

(declare-fun m!226925 () Bool)

(assert (=> start!20330 m!226925))

(declare-fun m!226927 () Bool)

(assert (=> start!20330 m!226927))

(declare-fun m!226929 () Bool)

(assert (=> b!200436 m!226929))

(declare-fun m!226931 () Bool)

(assert (=> b!200440 m!226931))

(declare-fun m!226933 () Bool)

(assert (=> mapNonEmpty!8336 m!226933))

(declare-fun m!226935 () Bool)

(assert (=> b!200437 m!226935))

(declare-fun m!226937 () Bool)

(assert (=> b!200432 m!226937))

(declare-fun m!226939 () Bool)

(assert (=> b!200432 m!226939))

(declare-fun m!226941 () Bool)

(assert (=> b!200432 m!226941))

(declare-fun m!226943 () Bool)

(assert (=> b!200432 m!226943))

(declare-fun m!226945 () Bool)

(assert (=> b!200432 m!226945))

(declare-fun m!226947 () Bool)

(assert (=> b!200432 m!226947))

(declare-fun m!226949 () Bool)

(assert (=> b!200432 m!226949))

(declare-fun m!226951 () Bool)

(assert (=> b!200438 m!226951))

(declare-fun m!226953 () Bool)

(assert (=> b!200434 m!226953))

(declare-fun m!226955 () Bool)

(assert (=> b!200434 m!226955))

(declare-fun m!226957 () Bool)

(assert (=> b!200434 m!226957))

(check-sat tp_is_empty!4845 (not b!200441) (not b!200434) b_and!11735 (not b!200440) (not b!200432) (not b!200436) (not start!20330) (not b_next!4989) (not mapNonEmpty!8336) (not b!200438))
(check-sat b_and!11735 (not b_next!4989))
