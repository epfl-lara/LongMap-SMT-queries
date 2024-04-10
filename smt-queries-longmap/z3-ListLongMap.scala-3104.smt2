; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43610 () Bool)

(assert start!43610)

(declare-fun b_free!12345 () Bool)

(declare-fun b_next!12345 () Bool)

(assert (=> start!43610 (= b_free!12345 (not b_next!12345))))

(declare-fun tp!43323 () Bool)

(declare-fun b_and!21109 () Bool)

(assert (=> start!43610 (= tp!43323 b_and!21109)))

(declare-fun b!483096 () Bool)

(declare-fun res!287910 () Bool)

(declare-fun e!284304 () Bool)

(assert (=> b!483096 (=> (not res!287910) (not e!284304))))

(declare-datatypes ((array!31375 0))(
  ( (array!31376 (arr!15088 (Array (_ BitVec 32) (_ BitVec 64))) (size!15446 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31375)

(declare-datatypes ((List!9238 0))(
  ( (Nil!9235) (Cons!9234 (h!10090 (_ BitVec 64)) (t!15456 List!9238)) )
))
(declare-fun arrayNoDuplicates!0 (array!31375 (_ BitVec 32) List!9238) Bool)

(assert (=> b!483096 (= res!287910 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9235))))

(declare-fun b!483097 () Bool)

(declare-fun e!284301 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!483097 (= e!284301 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483098 () Bool)

(assert (=> b!483098 (= e!284304 (not true))))

(declare-fun lt!218983 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31375 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483098 (= lt!218983 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483098 e!284301))

(declare-fun c!58056 () Bool)

(assert (=> b!483098 (= c!58056 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((Unit!14164 0))(
  ( (Unit!14165) )
))
(declare-fun lt!218982 () Unit!14164)

(declare-datatypes ((V!19547 0))(
  ( (V!19548 (val!6976 Int)) )
))
(declare-fun minValue!1458 () V!19547)

(declare-fun zeroValue!1458 () V!19547)

(declare-datatypes ((ValueCell!6567 0))(
  ( (ValueCellFull!6567 (v!9271 V!19547)) (EmptyCell!6567) )
))
(declare-datatypes ((array!31377 0))(
  ( (array!31378 (arr!15089 (Array (_ BitVec 32) ValueCell!6567)) (size!15447 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31377)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!151 (array!31375 array!31377 (_ BitVec 32) (_ BitVec 32) V!19547 V!19547 (_ BitVec 64) Int) Unit!14164)

(assert (=> b!483098 (= lt!218982 (lemmaKeyInListMapIsInArray!151 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!483099 () Bool)

(declare-fun res!287907 () Bool)

(assert (=> b!483099 (=> (not res!287907) (not e!284304))))

(declare-datatypes ((tuple2!9158 0))(
  ( (tuple2!9159 (_1!4590 (_ BitVec 64)) (_2!4590 V!19547)) )
))
(declare-datatypes ((List!9239 0))(
  ( (Nil!9236) (Cons!9235 (h!10091 tuple2!9158) (t!15457 List!9239)) )
))
(declare-datatypes ((ListLongMap!8071 0))(
  ( (ListLongMap!8072 (toList!4051 List!9239)) )
))
(declare-fun contains!2667 (ListLongMap!8071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2370 (array!31375 array!31377 (_ BitVec 32) (_ BitVec 32) V!19547 V!19547 (_ BitVec 32) Int) ListLongMap!8071)

(assert (=> b!483099 (= res!287907 (contains!2667 (getCurrentListMap!2370 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22501 () Bool)

(declare-fun mapRes!22501 () Bool)

(declare-fun tp!43324 () Bool)

(declare-fun e!284303 () Bool)

(assert (=> mapNonEmpty!22501 (= mapRes!22501 (and tp!43324 e!284303))))

(declare-fun mapValue!22501 () ValueCell!6567)

(declare-fun mapKey!22501 () (_ BitVec 32))

(declare-fun mapRest!22501 () (Array (_ BitVec 32) ValueCell!6567))

(assert (=> mapNonEmpty!22501 (= (arr!15089 _values!1516) (store mapRest!22501 mapKey!22501 mapValue!22501))))

(declare-fun b!483100 () Bool)

(declare-fun tp_is_empty!13857 () Bool)

(assert (=> b!483100 (= e!284303 tp_is_empty!13857)))

(declare-fun res!287908 () Bool)

(assert (=> start!43610 (=> (not res!287908) (not e!284304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43610 (= res!287908 (validMask!0 mask!2352))))

(assert (=> start!43610 e!284304))

(assert (=> start!43610 true))

(assert (=> start!43610 tp_is_empty!13857))

(declare-fun e!284300 () Bool)

(declare-fun array_inv!10886 (array!31377) Bool)

(assert (=> start!43610 (and (array_inv!10886 _values!1516) e!284300)))

(assert (=> start!43610 tp!43323))

(declare-fun array_inv!10887 (array!31375) Bool)

(assert (=> start!43610 (array_inv!10887 _keys!1874)))

(declare-fun b!483101 () Bool)

(declare-fun res!287909 () Bool)

(assert (=> b!483101 (=> (not res!287909) (not e!284304))))

(assert (=> b!483101 (= res!287909 (and (= (size!15447 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15446 _keys!1874) (size!15447 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22501 () Bool)

(assert (=> mapIsEmpty!22501 mapRes!22501))

(declare-fun b!483102 () Bool)

(declare-fun arrayContainsKey!0 (array!31375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483102 (= e!284301 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483103 () Bool)

(declare-fun e!284299 () Bool)

(assert (=> b!483103 (= e!284300 (and e!284299 mapRes!22501))))

(declare-fun condMapEmpty!22501 () Bool)

(declare-fun mapDefault!22501 () ValueCell!6567)

(assert (=> b!483103 (= condMapEmpty!22501 (= (arr!15089 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6567)) mapDefault!22501)))))

(declare-fun b!483104 () Bool)

(assert (=> b!483104 (= e!284299 tp_is_empty!13857)))

(declare-fun b!483105 () Bool)

(declare-fun res!287906 () Bool)

(assert (=> b!483105 (=> (not res!287906) (not e!284304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483105 (= res!287906 (validKeyInArray!0 k0!1332))))

(declare-fun b!483106 () Bool)

(declare-fun res!287911 () Bool)

(assert (=> b!483106 (=> (not res!287911) (not e!284304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31375 (_ BitVec 32)) Bool)

(assert (=> b!483106 (= res!287911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43610 res!287908) b!483101))

(assert (= (and b!483101 res!287909) b!483106))

(assert (= (and b!483106 res!287911) b!483096))

(assert (= (and b!483096 res!287910) b!483099))

(assert (= (and b!483099 res!287907) b!483105))

(assert (= (and b!483105 res!287906) b!483098))

(assert (= (and b!483098 c!58056) b!483102))

(assert (= (and b!483098 (not c!58056)) b!483097))

(assert (= (and b!483103 condMapEmpty!22501) mapIsEmpty!22501))

(assert (= (and b!483103 (not condMapEmpty!22501)) mapNonEmpty!22501))

(get-info :version)

(assert (= (and mapNonEmpty!22501 ((_ is ValueCellFull!6567) mapValue!22501)) b!483100))

(assert (= (and b!483103 ((_ is ValueCellFull!6567) mapDefault!22501)) b!483104))

(assert (= start!43610 b!483103))

(declare-fun m!464155 () Bool)

(assert (=> b!483098 m!464155))

(declare-fun m!464157 () Bool)

(assert (=> b!483098 m!464157))

(declare-fun m!464159 () Bool)

(assert (=> b!483099 m!464159))

(assert (=> b!483099 m!464159))

(declare-fun m!464161 () Bool)

(assert (=> b!483099 m!464161))

(declare-fun m!464163 () Bool)

(assert (=> b!483102 m!464163))

(declare-fun m!464165 () Bool)

(assert (=> b!483096 m!464165))

(declare-fun m!464167 () Bool)

(assert (=> b!483105 m!464167))

(declare-fun m!464169 () Bool)

(assert (=> mapNonEmpty!22501 m!464169))

(declare-fun m!464171 () Bool)

(assert (=> start!43610 m!464171))

(declare-fun m!464173 () Bool)

(assert (=> start!43610 m!464173))

(declare-fun m!464175 () Bool)

(assert (=> start!43610 m!464175))

(declare-fun m!464177 () Bool)

(assert (=> b!483106 m!464177))

(check-sat tp_is_empty!13857 (not b!483096) (not b!483099) (not b_next!12345) (not mapNonEmpty!22501) (not b!483106) b_and!21109 (not b!483105) (not b!483102) (not start!43610) (not b!483098))
(check-sat b_and!21109 (not b_next!12345))
