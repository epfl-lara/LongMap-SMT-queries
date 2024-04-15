; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43340 () Bool)

(assert start!43340)

(declare-fun b_free!12181 () Bool)

(declare-fun b_next!12181 () Bool)

(assert (=> start!43340 (= b_free!12181 (not b_next!12181))))

(declare-fun tp!42819 () Bool)

(declare-fun b_and!20911 () Bool)

(assert (=> start!43340 (= tp!42819 b_and!20911)))

(declare-fun mapNonEmpty!22243 () Bool)

(declare-fun mapRes!22243 () Bool)

(declare-fun tp!42820 () Bool)

(declare-fun e!282391 () Bool)

(assert (=> mapNonEmpty!22243 (= mapRes!22243 (and tp!42820 e!282391))))

(declare-fun mapKey!22243 () (_ BitVec 32))

(declare-datatypes ((V!19329 0))(
  ( (V!19330 (val!6894 Int)) )
))
(declare-datatypes ((ValueCell!6485 0))(
  ( (ValueCellFull!6485 (v!9179 V!19329)) (EmptyCell!6485) )
))
(declare-fun mapValue!22243 () ValueCell!6485)

(declare-fun mapRest!22243 () (Array (_ BitVec 32) ValueCell!6485))

(declare-datatypes ((array!31049 0))(
  ( (array!31050 (arr!14929 (Array (_ BitVec 32) ValueCell!6485)) (size!15288 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31049)

(assert (=> mapNonEmpty!22243 (= (arr!14929 _values!1516) (store mapRest!22243 mapKey!22243 mapValue!22243))))

(declare-fun b!479928 () Bool)

(declare-fun res!286260 () Bool)

(declare-fun e!282390 () Bool)

(assert (=> b!479928 (=> (not res!286260) (not e!282390))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19329)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19329)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31051 0))(
  ( (array!31052 (arr!14930 (Array (_ BitVec 32) (_ BitVec 64))) (size!15289 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31051)

(declare-datatypes ((tuple2!9098 0))(
  ( (tuple2!9099 (_1!4560 (_ BitVec 64)) (_2!4560 V!19329)) )
))
(declare-datatypes ((List!9162 0))(
  ( (Nil!9159) (Cons!9158 (h!10014 tuple2!9098) (t!15363 List!9162)) )
))
(declare-datatypes ((ListLongMap!8001 0))(
  ( (ListLongMap!8002 (toList!4016 List!9162)) )
))
(declare-fun contains!2593 (ListLongMap!8001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2269 (array!31051 array!31049 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 32) Int) ListLongMap!8001)

(assert (=> b!479928 (= res!286260 (contains!2593 (getCurrentListMap!2269 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479929 () Bool)

(declare-fun e!282388 () Bool)

(assert (=> b!479929 (= e!282388 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22243 () Bool)

(assert (=> mapIsEmpty!22243 mapRes!22243))

(declare-fun b!479930 () Bool)

(declare-fun e!282392 () Bool)

(declare-fun e!282393 () Bool)

(assert (=> b!479930 (= e!282392 (and e!282393 mapRes!22243))))

(declare-fun condMapEmpty!22243 () Bool)

(declare-fun mapDefault!22243 () ValueCell!6485)

(assert (=> b!479930 (= condMapEmpty!22243 (= (arr!14929 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6485)) mapDefault!22243)))))

(declare-fun b!479931 () Bool)

(declare-fun res!286257 () Bool)

(assert (=> b!479931 (=> (not res!286257) (not e!282390))))

(declare-datatypes ((List!9163 0))(
  ( (Nil!9160) (Cons!9159 (h!10015 (_ BitVec 64)) (t!15364 List!9163)) )
))
(declare-fun arrayNoDuplicates!0 (array!31051 (_ BitVec 32) List!9163) Bool)

(assert (=> b!479931 (= res!286257 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9160))))

(declare-fun b!479932 () Bool)

(assert (=> b!479932 (= e!282390 (not true))))

(declare-fun lt!217873 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31051 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!479932 (= lt!217873 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!479932 e!282388))

(declare-fun c!57686 () Bool)

(assert (=> b!479932 (= c!57686 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14058 0))(
  ( (Unit!14059) )
))
(declare-fun lt!217872 () Unit!14058)

(declare-fun lemmaKeyInListMapIsInArray!118 (array!31051 array!31049 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 64) Int) Unit!14058)

(assert (=> b!479932 (= lt!217872 (lemmaKeyInListMapIsInArray!118 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!479933 () Bool)

(declare-fun tp_is_empty!13693 () Bool)

(assert (=> b!479933 (= e!282393 tp_is_empty!13693)))

(declare-fun b!479934 () Bool)

(declare-fun res!286258 () Bool)

(assert (=> b!479934 (=> (not res!286258) (not e!282390))))

(assert (=> b!479934 (= res!286258 (and (= (size!15288 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15289 _keys!1874) (size!15288 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286259 () Bool)

(assert (=> start!43340 (=> (not res!286259) (not e!282390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43340 (= res!286259 (validMask!0 mask!2352))))

(assert (=> start!43340 e!282390))

(assert (=> start!43340 true))

(assert (=> start!43340 tp_is_empty!13693))

(declare-fun array_inv!10862 (array!31049) Bool)

(assert (=> start!43340 (and (array_inv!10862 _values!1516) e!282392)))

(assert (=> start!43340 tp!42819))

(declare-fun array_inv!10863 (array!31051) Bool)

(assert (=> start!43340 (array_inv!10863 _keys!1874)))

(declare-fun b!479927 () Bool)

(declare-fun res!286255 () Bool)

(assert (=> b!479927 (=> (not res!286255) (not e!282390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31051 (_ BitVec 32)) Bool)

(assert (=> b!479927 (= res!286255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479935 () Bool)

(declare-fun arrayContainsKey!0 (array!31051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479935 (= e!282388 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479936 () Bool)

(declare-fun res!286256 () Bool)

(assert (=> b!479936 (=> (not res!286256) (not e!282390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479936 (= res!286256 (validKeyInArray!0 k0!1332))))

(declare-fun b!479937 () Bool)

(assert (=> b!479937 (= e!282391 tp_is_empty!13693)))

(assert (= (and start!43340 res!286259) b!479934))

(assert (= (and b!479934 res!286258) b!479927))

(assert (= (and b!479927 res!286255) b!479931))

(assert (= (and b!479931 res!286257) b!479928))

(assert (= (and b!479928 res!286260) b!479936))

(assert (= (and b!479936 res!286256) b!479932))

(assert (= (and b!479932 c!57686) b!479935))

(assert (= (and b!479932 (not c!57686)) b!479929))

(assert (= (and b!479930 condMapEmpty!22243) mapIsEmpty!22243))

(assert (= (and b!479930 (not condMapEmpty!22243)) mapNonEmpty!22243))

(get-info :version)

(assert (= (and mapNonEmpty!22243 ((_ is ValueCellFull!6485) mapValue!22243)) b!479937))

(assert (= (and b!479930 ((_ is ValueCellFull!6485) mapDefault!22243)) b!479933))

(assert (= start!43340 b!479930))

(declare-fun m!461181 () Bool)

(assert (=> b!479928 m!461181))

(assert (=> b!479928 m!461181))

(declare-fun m!461183 () Bool)

(assert (=> b!479928 m!461183))

(declare-fun m!461185 () Bool)

(assert (=> b!479932 m!461185))

(declare-fun m!461187 () Bool)

(assert (=> b!479932 m!461187))

(declare-fun m!461189 () Bool)

(assert (=> b!479931 m!461189))

(declare-fun m!461191 () Bool)

(assert (=> start!43340 m!461191))

(declare-fun m!461193 () Bool)

(assert (=> start!43340 m!461193))

(declare-fun m!461195 () Bool)

(assert (=> start!43340 m!461195))

(declare-fun m!461197 () Bool)

(assert (=> b!479936 m!461197))

(declare-fun m!461199 () Bool)

(assert (=> mapNonEmpty!22243 m!461199))

(declare-fun m!461201 () Bool)

(assert (=> b!479927 m!461201))

(declare-fun m!461203 () Bool)

(assert (=> b!479935 m!461203))

(check-sat (not b!479931) (not start!43340) (not b!479932) b_and!20911 (not b!479935) (not b!479927) (not b_next!12181) (not b!479928) (not mapNonEmpty!22243) tp_is_empty!13693 (not b!479936))
(check-sat b_and!20911 (not b_next!12181))
