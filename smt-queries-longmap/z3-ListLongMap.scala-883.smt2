; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20398 () Bool)

(assert start!20398)

(declare-fun b_free!5053 () Bool)

(declare-fun b_next!5053 () Bool)

(assert (=> start!20398 (= b_free!5053 (not b_next!5053))))

(declare-fun tp!18190 () Bool)

(declare-fun b_and!11773 () Bool)

(assert (=> start!20398 (= tp!18190 b_and!11773)))

(declare-fun b!201435 () Bool)

(declare-fun res!96272 () Bool)

(declare-fun e!132007 () Bool)

(assert (=> b!201435 (=> (not res!96272) (not e!132007))))

(declare-datatypes ((array!9031 0))(
  ( (array!9032 (arr!4265 (Array (_ BitVec 32) (_ BitVec 64))) (size!4591 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9031)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201435 (= res!96272 (= (select (arr!4265 _keys!825) i!601) k0!843))))

(declare-fun b!201436 () Bool)

(declare-fun e!132006 () Bool)

(declare-fun tp_is_empty!4909 () Bool)

(assert (=> b!201436 (= e!132006 tp_is_empty!4909)))

(declare-fun b!201437 () Bool)

(declare-fun e!132004 () Bool)

(assert (=> b!201437 (= e!132007 (not e!132004))))

(declare-fun res!96267 () Bool)

(assert (=> b!201437 (=> res!96267 e!132004)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201437 (= res!96267 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6193 0))(
  ( (V!6194 (val!2499 Int)) )
))
(declare-datatypes ((tuple2!3756 0))(
  ( (tuple2!3757 (_1!1889 (_ BitVec 64)) (_2!1889 V!6193)) )
))
(declare-datatypes ((List!2675 0))(
  ( (Nil!2672) (Cons!2671 (h!3313 tuple2!3756) (t!7597 List!2675)) )
))
(declare-datatypes ((ListLongMap!2659 0))(
  ( (ListLongMap!2660 (toList!1345 List!2675)) )
))
(declare-fun lt!100380 () ListLongMap!2659)

(declare-datatypes ((ValueCell!2111 0))(
  ( (ValueCellFull!2111 (v!4463 V!6193)) (EmptyCell!2111) )
))
(declare-datatypes ((array!9033 0))(
  ( (array!9034 (arr!4266 (Array (_ BitVec 32) ValueCell!2111)) (size!4592 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9033)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6193)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6193)

(declare-fun getCurrentListMap!907 (array!9031 array!9033 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2659)

(assert (=> b!201437 (= lt!100380 (getCurrentListMap!907 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100379 () ListLongMap!2659)

(declare-fun lt!100386 () array!9033)

(assert (=> b!201437 (= lt!100379 (getCurrentListMap!907 _keys!825 lt!100386 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100388 () ListLongMap!2659)

(declare-fun lt!100383 () ListLongMap!2659)

(assert (=> b!201437 (and (= lt!100388 lt!100383) (= lt!100383 lt!100388))))

(declare-fun lt!100387 () ListLongMap!2659)

(declare-fun lt!100389 () tuple2!3756)

(declare-fun +!394 (ListLongMap!2659 tuple2!3756) ListLongMap!2659)

(assert (=> b!201437 (= lt!100383 (+!394 lt!100387 lt!100389))))

(declare-fun v!520 () V!6193)

(assert (=> b!201437 (= lt!100389 (tuple2!3757 k0!843 v!520))))

(declare-datatypes ((Unit!6040 0))(
  ( (Unit!6041) )
))
(declare-fun lt!100381 () Unit!6040)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 (array!9031 array!9033 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) (_ BitVec 64) V!6193 (_ BitVec 32) Int) Unit!6040)

(assert (=> b!201437 (= lt!100381 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!317 (array!9031 array!9033 (_ BitVec 32) (_ BitVec 32) V!6193 V!6193 (_ BitVec 32) Int) ListLongMap!2659)

(assert (=> b!201437 (= lt!100388 (getCurrentListMapNoExtraKeys!317 _keys!825 lt!100386 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201437 (= lt!100386 (array!9034 (store (arr!4266 _values!649) i!601 (ValueCellFull!2111 v!520)) (size!4592 _values!649)))))

(assert (=> b!201437 (= lt!100387 (getCurrentListMapNoExtraKeys!317 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201438 () Bool)

(declare-fun res!96265 () Bool)

(assert (=> b!201438 (=> (not res!96265) (not e!132007))))

(assert (=> b!201438 (= res!96265 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4591 _keys!825))))))

(declare-fun mapIsEmpty!8432 () Bool)

(declare-fun mapRes!8432 () Bool)

(assert (=> mapIsEmpty!8432 mapRes!8432))

(declare-fun b!201439 () Bool)

(declare-fun e!132009 () Bool)

(assert (=> b!201439 (= e!132004 e!132009)))

(declare-fun res!96269 () Bool)

(assert (=> b!201439 (=> res!96269 e!132009)))

(assert (=> b!201439 (= res!96269 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100384 () ListLongMap!2659)

(declare-fun lt!100382 () ListLongMap!2659)

(assert (=> b!201439 (= lt!100384 lt!100382)))

(declare-fun lt!100393 () ListLongMap!2659)

(assert (=> b!201439 (= lt!100382 (+!394 lt!100393 lt!100389))))

(declare-fun lt!100390 () Unit!6040)

(declare-fun addCommutativeForDiffKeys!103 (ListLongMap!2659 (_ BitVec 64) V!6193 (_ BitVec 64) V!6193) Unit!6040)

(assert (=> b!201439 (= lt!100390 (addCommutativeForDiffKeys!103 lt!100387 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100385 () tuple2!3756)

(assert (=> b!201439 (= lt!100379 (+!394 lt!100384 lt!100385))))

(declare-fun lt!100392 () tuple2!3756)

(assert (=> b!201439 (= lt!100384 (+!394 lt!100383 lt!100392))))

(declare-fun lt!100394 () ListLongMap!2659)

(assert (=> b!201439 (= lt!100380 lt!100394)))

(assert (=> b!201439 (= lt!100394 (+!394 lt!100393 lt!100385))))

(assert (=> b!201439 (= lt!100393 (+!394 lt!100387 lt!100392))))

(assert (=> b!201439 (= lt!100379 (+!394 (+!394 lt!100388 lt!100392) lt!100385))))

(assert (=> b!201439 (= lt!100385 (tuple2!3757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201439 (= lt!100392 (tuple2!3757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201440 () Bool)

(declare-fun res!96270 () Bool)

(assert (=> b!201440 (=> (not res!96270) (not e!132007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9031 (_ BitVec 32)) Bool)

(assert (=> b!201440 (= res!96270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!96266 () Bool)

(assert (=> start!20398 (=> (not res!96266) (not e!132007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20398 (= res!96266 (validMask!0 mask!1149))))

(assert (=> start!20398 e!132007))

(declare-fun e!132003 () Bool)

(declare-fun array_inv!2791 (array!9033) Bool)

(assert (=> start!20398 (and (array_inv!2791 _values!649) e!132003)))

(assert (=> start!20398 true))

(assert (=> start!20398 tp_is_empty!4909))

(declare-fun array_inv!2792 (array!9031) Bool)

(assert (=> start!20398 (array_inv!2792 _keys!825)))

(assert (=> start!20398 tp!18190))

(declare-fun mapNonEmpty!8432 () Bool)

(declare-fun tp!18191 () Bool)

(declare-fun e!132008 () Bool)

(assert (=> mapNonEmpty!8432 (= mapRes!8432 (and tp!18191 e!132008))))

(declare-fun mapKey!8432 () (_ BitVec 32))

(declare-fun mapValue!8432 () ValueCell!2111)

(declare-fun mapRest!8432 () (Array (_ BitVec 32) ValueCell!2111))

(assert (=> mapNonEmpty!8432 (= (arr!4266 _values!649) (store mapRest!8432 mapKey!8432 mapValue!8432))))

(declare-fun b!201441 () Bool)

(assert (=> b!201441 (= e!132003 (and e!132006 mapRes!8432))))

(declare-fun condMapEmpty!8432 () Bool)

(declare-fun mapDefault!8432 () ValueCell!2111)

(assert (=> b!201441 (= condMapEmpty!8432 (= (arr!4266 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2111)) mapDefault!8432)))))

(declare-fun b!201442 () Bool)

(declare-fun res!96271 () Bool)

(assert (=> b!201442 (=> (not res!96271) (not e!132007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201442 (= res!96271 (validKeyInArray!0 k0!843))))

(declare-fun b!201443 () Bool)

(declare-fun res!96264 () Bool)

(assert (=> b!201443 (=> (not res!96264) (not e!132007))))

(declare-datatypes ((List!2676 0))(
  ( (Nil!2673) (Cons!2672 (h!3314 (_ BitVec 64)) (t!7598 List!2676)) )
))
(declare-fun arrayNoDuplicates!0 (array!9031 (_ BitVec 32) List!2676) Bool)

(assert (=> b!201443 (= res!96264 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2673))))

(declare-fun b!201444 () Bool)

(assert (=> b!201444 (= e!132008 tp_is_empty!4909)))

(declare-fun b!201445 () Bool)

(assert (=> b!201445 (= e!132009 true)))

(assert (=> b!201445 (= (+!394 lt!100382 lt!100385) (+!394 lt!100394 lt!100389))))

(declare-fun lt!100391 () Unit!6040)

(assert (=> b!201445 (= lt!100391 (addCommutativeForDiffKeys!103 lt!100393 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201446 () Bool)

(declare-fun res!96268 () Bool)

(assert (=> b!201446 (=> (not res!96268) (not e!132007))))

(assert (=> b!201446 (= res!96268 (and (= (size!4592 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4591 _keys!825) (size!4592 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20398 res!96266) b!201446))

(assert (= (and b!201446 res!96268) b!201440))

(assert (= (and b!201440 res!96270) b!201443))

(assert (= (and b!201443 res!96264) b!201438))

(assert (= (and b!201438 res!96265) b!201442))

(assert (= (and b!201442 res!96271) b!201435))

(assert (= (and b!201435 res!96272) b!201437))

(assert (= (and b!201437 (not res!96267)) b!201439))

(assert (= (and b!201439 (not res!96269)) b!201445))

(assert (= (and b!201441 condMapEmpty!8432) mapIsEmpty!8432))

(assert (= (and b!201441 (not condMapEmpty!8432)) mapNonEmpty!8432))

(get-info :version)

(assert (= (and mapNonEmpty!8432 ((_ is ValueCellFull!2111) mapValue!8432)) b!201444))

(assert (= (and b!201441 ((_ is ValueCellFull!2111) mapDefault!8432)) b!201436))

(assert (= start!20398 b!201441))

(declare-fun m!227955 () Bool)

(assert (=> b!201440 m!227955))

(declare-fun m!227957 () Bool)

(assert (=> b!201445 m!227957))

(declare-fun m!227959 () Bool)

(assert (=> b!201445 m!227959))

(declare-fun m!227961 () Bool)

(assert (=> b!201445 m!227961))

(declare-fun m!227963 () Bool)

(assert (=> mapNonEmpty!8432 m!227963))

(declare-fun m!227965 () Bool)

(assert (=> start!20398 m!227965))

(declare-fun m!227967 () Bool)

(assert (=> start!20398 m!227967))

(declare-fun m!227969 () Bool)

(assert (=> start!20398 m!227969))

(declare-fun m!227971 () Bool)

(assert (=> b!201443 m!227971))

(declare-fun m!227973 () Bool)

(assert (=> b!201435 m!227973))

(declare-fun m!227975 () Bool)

(assert (=> b!201442 m!227975))

(declare-fun m!227977 () Bool)

(assert (=> b!201439 m!227977))

(declare-fun m!227979 () Bool)

(assert (=> b!201439 m!227979))

(declare-fun m!227981 () Bool)

(assert (=> b!201439 m!227981))

(declare-fun m!227983 () Bool)

(assert (=> b!201439 m!227983))

(declare-fun m!227985 () Bool)

(assert (=> b!201439 m!227985))

(declare-fun m!227987 () Bool)

(assert (=> b!201439 m!227987))

(assert (=> b!201439 m!227985))

(declare-fun m!227989 () Bool)

(assert (=> b!201439 m!227989))

(declare-fun m!227991 () Bool)

(assert (=> b!201439 m!227991))

(declare-fun m!227993 () Bool)

(assert (=> b!201437 m!227993))

(declare-fun m!227995 () Bool)

(assert (=> b!201437 m!227995))

(declare-fun m!227997 () Bool)

(assert (=> b!201437 m!227997))

(declare-fun m!227999 () Bool)

(assert (=> b!201437 m!227999))

(declare-fun m!228001 () Bool)

(assert (=> b!201437 m!228001))

(declare-fun m!228003 () Bool)

(assert (=> b!201437 m!228003))

(declare-fun m!228005 () Bool)

(assert (=> b!201437 m!228005))

(check-sat (not b_next!5053) b_and!11773 tp_is_empty!4909 (not b!201445) (not b!201443) (not b!201439) (not b!201440) (not start!20398) (not b!201437) (not mapNonEmpty!8432) (not b!201442))
(check-sat b_and!11773 (not b_next!5053))
