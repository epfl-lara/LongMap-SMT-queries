; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43346 () Bool)

(assert start!43346)

(declare-fun b_free!12187 () Bool)

(declare-fun b_next!12187 () Bool)

(assert (=> start!43346 (= b_free!12187 (not b_next!12187))))

(declare-fun tp!42837 () Bool)

(declare-fun b_and!20917 () Bool)

(assert (=> start!43346 (= tp!42837 b_and!20917)))

(declare-fun b!480026 () Bool)

(declare-fun e!282443 () Bool)

(declare-fun tp_is_empty!13699 () Bool)

(assert (=> b!480026 (= e!282443 tp_is_empty!13699)))

(declare-fun b!480027 () Bool)

(declare-fun res!286310 () Bool)

(declare-fun e!282447 () Bool)

(assert (=> b!480027 (=> (not res!286310) (not e!282447))))

(declare-datatypes ((array!31061 0))(
  ( (array!31062 (arr!14935 (Array (_ BitVec 32) (_ BitVec 64))) (size!15294 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31061)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31061 (_ BitVec 32)) Bool)

(assert (=> b!480027 (= res!286310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480028 () Bool)

(declare-fun res!286311 () Bool)

(assert (=> b!480028 (=> (not res!286311) (not e!282447))))

(declare-datatypes ((List!9165 0))(
  ( (Nil!9162) (Cons!9161 (h!10017 (_ BitVec 64)) (t!15366 List!9165)) )
))
(declare-fun arrayNoDuplicates!0 (array!31061 (_ BitVec 32) List!9165) Bool)

(assert (=> b!480028 (= res!286311 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9162))))

(declare-fun mapIsEmpty!22252 () Bool)

(declare-fun mapRes!22252 () Bool)

(assert (=> mapIsEmpty!22252 mapRes!22252))

(declare-fun b!480029 () Bool)

(assert (=> b!480029 (= e!282447 (not true))))

(declare-fun lt!217890 () (_ BitVec 32))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31061 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480029 (= lt!217890 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282445 () Bool)

(assert (=> b!480029 e!282445))

(declare-fun c!57695 () Bool)

(assert (=> b!480029 (= c!57695 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!19337 0))(
  ( (V!19338 (val!6897 Int)) )
))
(declare-fun minValue!1458 () V!19337)

(declare-fun zeroValue!1458 () V!19337)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((Unit!14062 0))(
  ( (Unit!14063) )
))
(declare-fun lt!217891 () Unit!14062)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6488 0))(
  ( (ValueCellFull!6488 (v!9182 V!19337)) (EmptyCell!6488) )
))
(declare-datatypes ((array!31063 0))(
  ( (array!31064 (arr!14936 (Array (_ BitVec 32) ValueCell!6488)) (size!15295 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31063)

(declare-fun lemmaKeyInListMapIsInArray!120 (array!31061 array!31063 (_ BitVec 32) (_ BitVec 32) V!19337 V!19337 (_ BitVec 64) Int) Unit!14062)

(assert (=> b!480029 (= lt!217891 (lemmaKeyInListMapIsInArray!120 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun res!286314 () Bool)

(assert (=> start!43346 (=> (not res!286314) (not e!282447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43346 (= res!286314 (validMask!0 mask!2352))))

(assert (=> start!43346 e!282447))

(assert (=> start!43346 true))

(assert (=> start!43346 tp_is_empty!13699))

(declare-fun e!282444 () Bool)

(declare-fun array_inv!10864 (array!31063) Bool)

(assert (=> start!43346 (and (array_inv!10864 _values!1516) e!282444)))

(assert (=> start!43346 tp!42837))

(declare-fun array_inv!10865 (array!31061) Bool)

(assert (=> start!43346 (array_inv!10865 _keys!1874)))

(declare-fun b!480030 () Bool)

(assert (=> b!480030 (= e!282445 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480031 () Bool)

(declare-fun res!286309 () Bool)

(assert (=> b!480031 (=> (not res!286309) (not e!282447))))

(assert (=> b!480031 (= res!286309 (and (= (size!15295 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15294 _keys!1874) (size!15295 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480032 () Bool)

(assert (=> b!480032 (= e!282444 (and e!282443 mapRes!22252))))

(declare-fun condMapEmpty!22252 () Bool)

(declare-fun mapDefault!22252 () ValueCell!6488)

(assert (=> b!480032 (= condMapEmpty!22252 (= (arr!14936 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6488)) mapDefault!22252)))))

(declare-fun b!480033 () Bool)

(declare-fun res!286312 () Bool)

(assert (=> b!480033 (=> (not res!286312) (not e!282447))))

(declare-datatypes ((tuple2!9100 0))(
  ( (tuple2!9101 (_1!4561 (_ BitVec 64)) (_2!4561 V!19337)) )
))
(declare-datatypes ((List!9166 0))(
  ( (Nil!9163) (Cons!9162 (h!10018 tuple2!9100) (t!15367 List!9166)) )
))
(declare-datatypes ((ListLongMap!8003 0))(
  ( (ListLongMap!8004 (toList!4017 List!9166)) )
))
(declare-fun contains!2594 (ListLongMap!8003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2270 (array!31061 array!31063 (_ BitVec 32) (_ BitVec 32) V!19337 V!19337 (_ BitVec 32) Int) ListLongMap!8003)

(assert (=> b!480033 (= res!286312 (contains!2594 (getCurrentListMap!2270 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480034 () Bool)

(declare-fun e!282446 () Bool)

(assert (=> b!480034 (= e!282446 tp_is_empty!13699)))

(declare-fun mapNonEmpty!22252 () Bool)

(declare-fun tp!42838 () Bool)

(assert (=> mapNonEmpty!22252 (= mapRes!22252 (and tp!42838 e!282446))))

(declare-fun mapRest!22252 () (Array (_ BitVec 32) ValueCell!6488))

(declare-fun mapKey!22252 () (_ BitVec 32))

(declare-fun mapValue!22252 () ValueCell!6488)

(assert (=> mapNonEmpty!22252 (= (arr!14936 _values!1516) (store mapRest!22252 mapKey!22252 mapValue!22252))))

(declare-fun b!480035 () Bool)

(declare-fun arrayContainsKey!0 (array!31061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480035 (= e!282445 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480036 () Bool)

(declare-fun res!286313 () Bool)

(assert (=> b!480036 (=> (not res!286313) (not e!282447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480036 (= res!286313 (validKeyInArray!0 k0!1332))))

(assert (= (and start!43346 res!286314) b!480031))

(assert (= (and b!480031 res!286309) b!480027))

(assert (= (and b!480027 res!286310) b!480028))

(assert (= (and b!480028 res!286311) b!480033))

(assert (= (and b!480033 res!286312) b!480036))

(assert (= (and b!480036 res!286313) b!480029))

(assert (= (and b!480029 c!57695) b!480035))

(assert (= (and b!480029 (not c!57695)) b!480030))

(assert (= (and b!480032 condMapEmpty!22252) mapIsEmpty!22252))

(assert (= (and b!480032 (not condMapEmpty!22252)) mapNonEmpty!22252))

(get-info :version)

(assert (= (and mapNonEmpty!22252 ((_ is ValueCellFull!6488) mapValue!22252)) b!480034))

(assert (= (and b!480032 ((_ is ValueCellFull!6488) mapDefault!22252)) b!480026))

(assert (= start!43346 b!480032))

(declare-fun m!461253 () Bool)

(assert (=> b!480027 m!461253))

(declare-fun m!461255 () Bool)

(assert (=> b!480029 m!461255))

(declare-fun m!461257 () Bool)

(assert (=> b!480029 m!461257))

(declare-fun m!461259 () Bool)

(assert (=> b!480035 m!461259))

(declare-fun m!461261 () Bool)

(assert (=> b!480036 m!461261))

(declare-fun m!461263 () Bool)

(assert (=> mapNonEmpty!22252 m!461263))

(declare-fun m!461265 () Bool)

(assert (=> b!480033 m!461265))

(assert (=> b!480033 m!461265))

(declare-fun m!461267 () Bool)

(assert (=> b!480033 m!461267))

(declare-fun m!461269 () Bool)

(assert (=> b!480028 m!461269))

(declare-fun m!461271 () Bool)

(assert (=> start!43346 m!461271))

(declare-fun m!461273 () Bool)

(assert (=> start!43346 m!461273))

(declare-fun m!461275 () Bool)

(assert (=> start!43346 m!461275))

(check-sat b_and!20917 (not b!480027) (not b!480036) (not start!43346) (not b!480035) (not b_next!12187) (not b!480028) tp_is_empty!13699 (not b!480033) (not mapNonEmpty!22252) (not b!480029))
(check-sat b_and!20917 (not b_next!12187))
