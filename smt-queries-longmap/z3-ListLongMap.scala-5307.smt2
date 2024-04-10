; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71064 () Bool)

(assert start!71064)

(declare-fun b_free!13251 () Bool)

(declare-fun b_next!13251 () Bool)

(assert (=> start!71064 (= b_free!13251 (not b_next!13251))))

(declare-fun tp!46509 () Bool)

(declare-fun b_and!22165 () Bool)

(assert (=> start!71064 (= tp!46509 b_and!22165)))

(declare-fun b!825228 () Bool)

(declare-fun e!459270 () Bool)

(declare-fun e!459273 () Bool)

(declare-fun mapRes!24064 () Bool)

(assert (=> b!825228 (= e!459270 (and e!459273 mapRes!24064))))

(declare-fun condMapEmpty!24064 () Bool)

(declare-datatypes ((V!24949 0))(
  ( (V!24950 (val!7528 Int)) )
))
(declare-datatypes ((ValueCell!7065 0))(
  ( (ValueCellFull!7065 (v!9961 V!24949)) (EmptyCell!7065) )
))
(declare-datatypes ((array!46108 0))(
  ( (array!46109 (arr!22100 (Array (_ BitVec 32) ValueCell!7065)) (size!22521 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46108)

(declare-fun mapDefault!24064 () ValueCell!7065)

(assert (=> b!825228 (= condMapEmpty!24064 (= (arr!22100 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7065)) mapDefault!24064)))))

(declare-fun b!825229 () Bool)

(declare-fun res!562553 () Bool)

(declare-fun e!459268 () Bool)

(assert (=> b!825229 (=> (not res!562553) (not e!459268))))

(declare-datatypes ((array!46110 0))(
  ( (array!46111 (arr!22101 (Array (_ BitVec 32) (_ BitVec 64))) (size!22522 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46110)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46110 (_ BitVec 32)) Bool)

(assert (=> b!825229 (= res!562553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun e!459271 () Bool)

(declare-fun b!825230 () Bool)

(declare-datatypes ((tuple2!9964 0))(
  ( (tuple2!9965 (_1!4993 (_ BitVec 64)) (_2!4993 V!24949)) )
))
(declare-datatypes ((List!15769 0))(
  ( (Nil!15766) (Cons!15765 (h!16894 tuple2!9964) (t!22114 List!15769)) )
))
(declare-datatypes ((ListLongMap!8787 0))(
  ( (ListLongMap!8788 (toList!4409 List!15769)) )
))
(declare-fun lt!372390 () ListLongMap!8787)

(declare-fun lt!372388 () tuple2!9964)

(declare-fun lt!372386 () ListLongMap!8787)

(declare-fun lt!372385 () tuple2!9964)

(declare-fun +!1918 (ListLongMap!8787 tuple2!9964) ListLongMap!8787)

(assert (=> b!825230 (= e!459271 (= lt!372386 (+!1918 (+!1918 lt!372390 lt!372385) lt!372388)))))

(declare-fun b!825231 () Bool)

(declare-fun e!459266 () Bool)

(assert (=> b!825231 (= e!459266 true)))

(declare-fun lt!372381 () ListLongMap!8787)

(declare-fun lt!372378 () ListLongMap!8787)

(assert (=> b!825231 (= lt!372378 (+!1918 (+!1918 lt!372381 lt!372388) lt!372385))))

(declare-fun lt!372389 () ListLongMap!8787)

(declare-fun lt!372384 () ListLongMap!8787)

(assert (=> b!825231 (and (= lt!372389 lt!372384) (= lt!372386 lt!372384) (= lt!372386 lt!372389))))

(declare-fun lt!372382 () ListLongMap!8787)

(assert (=> b!825231 (= lt!372384 (+!1918 lt!372382 lt!372388))))

(declare-fun lt!372379 () ListLongMap!8787)

(assert (=> b!825231 (= lt!372389 (+!1918 lt!372379 lt!372388))))

(declare-fun zeroValueAfter!34 () V!24949)

(declare-datatypes ((Unit!28283 0))(
  ( (Unit!28284) )
))
(declare-fun lt!372380 () Unit!28283)

(declare-fun zeroValueBefore!34 () V!24949)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!205 (ListLongMap!8787 (_ BitVec 64) V!24949 V!24949) Unit!28283)

(assert (=> b!825231 (= lt!372380 (addSameAsAddTwiceSameKeyDiffValues!205 lt!372379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825231 e!459271))

(declare-fun res!562549 () Bool)

(assert (=> b!825231 (=> (not res!562549) (not e!459271))))

(declare-fun lt!372377 () ListLongMap!8787)

(assert (=> b!825231 (= res!562549 (= lt!372377 lt!372382))))

(declare-fun lt!372387 () tuple2!9964)

(assert (=> b!825231 (= lt!372382 (+!1918 lt!372379 lt!372387))))

(assert (=> b!825231 (= lt!372379 (+!1918 lt!372381 lt!372385))))

(assert (=> b!825231 (= lt!372388 (tuple2!9965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459269 () Bool)

(assert (=> b!825231 e!459269))

(declare-fun res!562554 () Bool)

(assert (=> b!825231 (=> (not res!562554) (not e!459269))))

(assert (=> b!825231 (= res!562554 (= lt!372377 (+!1918 (+!1918 lt!372381 lt!372387) lt!372385)))))

(declare-fun minValue!754 () V!24949)

(assert (=> b!825231 (= lt!372385 (tuple2!9965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825231 (= lt!372387 (tuple2!9965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2545 (array!46110 array!46108 (_ BitVec 32) (_ BitVec 32) V!24949 V!24949 (_ BitVec 32) Int) ListLongMap!8787)

(assert (=> b!825231 (= lt!372386 (getCurrentListMap!2545 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825231 (= lt!372377 (getCurrentListMap!2545 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825232 () Bool)

(assert (=> b!825232 (= e!459268 (not e!459266))))

(declare-fun res!562555 () Bool)

(assert (=> b!825232 (=> res!562555 e!459266)))

(assert (=> b!825232 (= res!562555 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825232 (= lt!372381 lt!372390)))

(declare-fun lt!372383 () Unit!28283)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!532 (array!46110 array!46108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24949 V!24949 V!24949 V!24949 (_ BitVec 32) Int) Unit!28283)

(assert (=> b!825232 (= lt!372383 (lemmaNoChangeToArrayThenSameMapNoExtras!532 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2422 (array!46110 array!46108 (_ BitVec 32) (_ BitVec 32) V!24949 V!24949 (_ BitVec 32) Int) ListLongMap!8787)

(assert (=> b!825232 (= lt!372390 (getCurrentListMapNoExtraKeys!2422 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825232 (= lt!372381 (getCurrentListMapNoExtraKeys!2422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825233 () Bool)

(declare-fun res!562552 () Bool)

(assert (=> b!825233 (=> (not res!562552) (not e!459268))))

(assert (=> b!825233 (= res!562552 (and (= (size!22521 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22522 _keys!976) (size!22521 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24064 () Bool)

(declare-fun tp!46510 () Bool)

(declare-fun e!459267 () Bool)

(assert (=> mapNonEmpty!24064 (= mapRes!24064 (and tp!46510 e!459267))))

(declare-fun mapRest!24064 () (Array (_ BitVec 32) ValueCell!7065))

(declare-fun mapValue!24064 () ValueCell!7065)

(declare-fun mapKey!24064 () (_ BitVec 32))

(assert (=> mapNonEmpty!24064 (= (arr!22100 _values!788) (store mapRest!24064 mapKey!24064 mapValue!24064))))

(declare-fun b!825234 () Bool)

(assert (=> b!825234 (= e!459269 (= lt!372386 (+!1918 (+!1918 lt!372390 (tuple2!9965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372385)))))

(declare-fun res!562550 () Bool)

(assert (=> start!71064 (=> (not res!562550) (not e!459268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71064 (= res!562550 (validMask!0 mask!1312))))

(assert (=> start!71064 e!459268))

(declare-fun tp_is_empty!14961 () Bool)

(assert (=> start!71064 tp_is_empty!14961))

(declare-fun array_inv!17623 (array!46110) Bool)

(assert (=> start!71064 (array_inv!17623 _keys!976)))

(assert (=> start!71064 true))

(declare-fun array_inv!17624 (array!46108) Bool)

(assert (=> start!71064 (and (array_inv!17624 _values!788) e!459270)))

(assert (=> start!71064 tp!46509))

(declare-fun b!825235 () Bool)

(declare-fun res!562551 () Bool)

(assert (=> b!825235 (=> (not res!562551) (not e!459268))))

(declare-datatypes ((List!15770 0))(
  ( (Nil!15767) (Cons!15766 (h!16895 (_ BitVec 64)) (t!22115 List!15770)) )
))
(declare-fun arrayNoDuplicates!0 (array!46110 (_ BitVec 32) List!15770) Bool)

(assert (=> b!825235 (= res!562551 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15767))))

(declare-fun b!825236 () Bool)

(assert (=> b!825236 (= e!459273 tp_is_empty!14961)))

(declare-fun b!825237 () Bool)

(assert (=> b!825237 (= e!459267 tp_is_empty!14961)))

(declare-fun mapIsEmpty!24064 () Bool)

(assert (=> mapIsEmpty!24064 mapRes!24064))

(assert (= (and start!71064 res!562550) b!825233))

(assert (= (and b!825233 res!562552) b!825229))

(assert (= (and b!825229 res!562553) b!825235))

(assert (= (and b!825235 res!562551) b!825232))

(assert (= (and b!825232 (not res!562555)) b!825231))

(assert (= (and b!825231 res!562554) b!825234))

(assert (= (and b!825231 res!562549) b!825230))

(assert (= (and b!825228 condMapEmpty!24064) mapIsEmpty!24064))

(assert (= (and b!825228 (not condMapEmpty!24064)) mapNonEmpty!24064))

(get-info :version)

(assert (= (and mapNonEmpty!24064 ((_ is ValueCellFull!7065) mapValue!24064)) b!825237))

(assert (= (and b!825228 ((_ is ValueCellFull!7065) mapDefault!24064)) b!825236))

(assert (= start!71064 b!825228))

(declare-fun m!767261 () Bool)

(assert (=> b!825231 m!767261))

(declare-fun m!767263 () Bool)

(assert (=> b!825231 m!767263))

(declare-fun m!767265 () Bool)

(assert (=> b!825231 m!767265))

(declare-fun m!767267 () Bool)

(assert (=> b!825231 m!767267))

(declare-fun m!767269 () Bool)

(assert (=> b!825231 m!767269))

(declare-fun m!767271 () Bool)

(assert (=> b!825231 m!767271))

(declare-fun m!767273 () Bool)

(assert (=> b!825231 m!767273))

(declare-fun m!767275 () Bool)

(assert (=> b!825231 m!767275))

(assert (=> b!825231 m!767269))

(declare-fun m!767277 () Bool)

(assert (=> b!825231 m!767277))

(declare-fun m!767279 () Bool)

(assert (=> b!825231 m!767279))

(assert (=> b!825231 m!767277))

(declare-fun m!767281 () Bool)

(assert (=> b!825231 m!767281))

(declare-fun m!767283 () Bool)

(assert (=> b!825230 m!767283))

(assert (=> b!825230 m!767283))

(declare-fun m!767285 () Bool)

(assert (=> b!825230 m!767285))

(declare-fun m!767287 () Bool)

(assert (=> b!825232 m!767287))

(declare-fun m!767289 () Bool)

(assert (=> b!825232 m!767289))

(declare-fun m!767291 () Bool)

(assert (=> b!825232 m!767291))

(declare-fun m!767293 () Bool)

(assert (=> start!71064 m!767293))

(declare-fun m!767295 () Bool)

(assert (=> start!71064 m!767295))

(declare-fun m!767297 () Bool)

(assert (=> start!71064 m!767297))

(declare-fun m!767299 () Bool)

(assert (=> mapNonEmpty!24064 m!767299))

(declare-fun m!767301 () Bool)

(assert (=> b!825235 m!767301))

(declare-fun m!767303 () Bool)

(assert (=> b!825229 m!767303))

(declare-fun m!767305 () Bool)

(assert (=> b!825234 m!767305))

(assert (=> b!825234 m!767305))

(declare-fun m!767307 () Bool)

(assert (=> b!825234 m!767307))

(check-sat (not b!825230) (not b!825229) (not mapNonEmpty!24064) (not start!71064) b_and!22165 (not b_next!13251) (not b!825232) (not b!825234) (not b!825231) (not b!825235) tp_is_empty!14961)
(check-sat b_and!22165 (not b_next!13251))
