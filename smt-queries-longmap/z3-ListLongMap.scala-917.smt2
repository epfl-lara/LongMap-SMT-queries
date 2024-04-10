; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20600 () Bool)

(assert start!20600)

(declare-fun b_free!5259 () Bool)

(declare-fun b_next!5259 () Bool)

(assert (=> start!20600 (= b_free!5259 (not b_next!5259))))

(declare-fun tp!18808 () Bool)

(declare-fun b_and!12005 () Bool)

(assert (=> start!20600 (= tp!18808 b_and!12005)))

(declare-fun b!205308 () Bool)

(declare-fun res!99165 () Bool)

(declare-fun e!134270 () Bool)

(assert (=> b!205308 (=> (not res!99165) (not e!134270))))

(declare-datatypes ((array!9443 0))(
  ( (array!9444 (arr!4472 (Array (_ BitVec 32) (_ BitVec 64))) (size!4797 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9443)

(declare-datatypes ((List!2844 0))(
  ( (Nil!2841) (Cons!2840 (h!3482 (_ BitVec 64)) (t!7775 List!2844)) )
))
(declare-fun arrayNoDuplicates!0 (array!9443 (_ BitVec 32) List!2844) Bool)

(assert (=> b!205308 (= res!99165 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2841))))

(declare-fun mapNonEmpty!8741 () Bool)

(declare-fun mapRes!8741 () Bool)

(declare-fun tp!18809 () Bool)

(declare-fun e!134272 () Bool)

(assert (=> mapNonEmpty!8741 (= mapRes!8741 (and tp!18809 e!134272))))

(declare-datatypes ((V!6467 0))(
  ( (V!6468 (val!2602 Int)) )
))
(declare-datatypes ((ValueCell!2214 0))(
  ( (ValueCellFull!2214 (v!4572 V!6467)) (EmptyCell!2214) )
))
(declare-fun mapValue!8741 () ValueCell!2214)

(declare-fun mapRest!8741 () (Array (_ BitVec 32) ValueCell!2214))

(declare-datatypes ((array!9445 0))(
  ( (array!9446 (arr!4473 (Array (_ BitVec 32) ValueCell!2214)) (size!4798 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9445)

(declare-fun mapKey!8741 () (_ BitVec 32))

(assert (=> mapNonEmpty!8741 (= (arr!4473 _values!649) (store mapRest!8741 mapKey!8741 mapValue!8741))))

(declare-fun b!205310 () Bool)

(declare-fun e!134267 () Bool)

(declare-fun tp_is_empty!5115 () Bool)

(assert (=> b!205310 (= e!134267 tp_is_empty!5115)))

(declare-fun b!205311 () Bool)

(declare-fun res!99166 () Bool)

(assert (=> b!205311 (=> (not res!99166) (not e!134270))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205311 (= res!99166 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4797 _keys!825))))))

(declare-fun b!205312 () Bool)

(declare-fun res!99160 () Bool)

(assert (=> b!205312 (=> (not res!99160) (not e!134270))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9443 (_ BitVec 32)) Bool)

(assert (=> b!205312 (= res!99160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8741 () Bool)

(assert (=> mapIsEmpty!8741 mapRes!8741))

(declare-fun b!205313 () Bool)

(assert (=> b!205313 (= e!134272 tp_is_empty!5115)))

(declare-fun b!205314 () Bool)

(declare-fun res!99164 () Bool)

(assert (=> b!205314 (=> (not res!99164) (not e!134270))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205314 (= res!99164 (validKeyInArray!0 k0!843))))

(declare-fun b!205315 () Bool)

(declare-fun e!134268 () Bool)

(assert (=> b!205315 (= e!134270 (not e!134268))))

(declare-fun res!99163 () Bool)

(assert (=> b!205315 (=> res!99163 e!134268)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205315 (= res!99163 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3946 0))(
  ( (tuple2!3947 (_1!1984 (_ BitVec 64)) (_2!1984 V!6467)) )
))
(declare-datatypes ((List!2845 0))(
  ( (Nil!2842) (Cons!2841 (h!3483 tuple2!3946) (t!7776 List!2845)) )
))
(declare-datatypes ((ListLongMap!2859 0))(
  ( (ListLongMap!2860 (toList!1445 List!2845)) )
))
(declare-fun lt!104442 () ListLongMap!2859)

(declare-fun zeroValue!615 () V!6467)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6467)

(declare-fun getCurrentListMap!1016 (array!9443 array!9445 (_ BitVec 32) (_ BitVec 32) V!6467 V!6467 (_ BitVec 32) Int) ListLongMap!2859)

(assert (=> b!205315 (= lt!104442 (getCurrentListMap!1016 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104450 () array!9445)

(declare-fun lt!104449 () ListLongMap!2859)

(assert (=> b!205315 (= lt!104449 (getCurrentListMap!1016 _keys!825 lt!104450 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104441 () ListLongMap!2859)

(declare-fun lt!104447 () ListLongMap!2859)

(assert (=> b!205315 (and (= lt!104441 lt!104447) (= lt!104447 lt!104441))))

(declare-fun lt!104443 () ListLongMap!2859)

(declare-fun lt!104451 () tuple2!3946)

(declare-fun +!472 (ListLongMap!2859 tuple2!3946) ListLongMap!2859)

(assert (=> b!205315 (= lt!104447 (+!472 lt!104443 lt!104451))))

(declare-fun v!520 () V!6467)

(assert (=> b!205315 (= lt!104451 (tuple2!3947 k0!843 v!520))))

(declare-datatypes ((Unit!6236 0))(
  ( (Unit!6237) )
))
(declare-fun lt!104446 () Unit!6236)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!129 (array!9443 array!9445 (_ BitVec 32) (_ BitVec 32) V!6467 V!6467 (_ BitVec 32) (_ BitVec 64) V!6467 (_ BitVec 32) Int) Unit!6236)

(assert (=> b!205315 (= lt!104446 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!129 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!390 (array!9443 array!9445 (_ BitVec 32) (_ BitVec 32) V!6467 V!6467 (_ BitVec 32) Int) ListLongMap!2859)

(assert (=> b!205315 (= lt!104441 (getCurrentListMapNoExtraKeys!390 _keys!825 lt!104450 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205315 (= lt!104450 (array!9446 (store (arr!4473 _values!649) i!601 (ValueCellFull!2214 v!520)) (size!4798 _values!649)))))

(assert (=> b!205315 (= lt!104443 (getCurrentListMapNoExtraKeys!390 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!99161 () Bool)

(assert (=> start!20600 (=> (not res!99161) (not e!134270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20600 (= res!99161 (validMask!0 mask!1149))))

(assert (=> start!20600 e!134270))

(declare-fun e!134273 () Bool)

(declare-fun array_inv!2955 (array!9445) Bool)

(assert (=> start!20600 (and (array_inv!2955 _values!649) e!134273)))

(assert (=> start!20600 true))

(assert (=> start!20600 tp_is_empty!5115))

(declare-fun array_inv!2956 (array!9443) Bool)

(assert (=> start!20600 (array_inv!2956 _keys!825)))

(assert (=> start!20600 tp!18808))

(declare-fun b!205309 () Bool)

(declare-fun e!134271 () Bool)

(assert (=> b!205309 (= e!134268 e!134271)))

(declare-fun res!99162 () Bool)

(assert (=> b!205309 (=> res!99162 e!134271)))

(assert (=> b!205309 (= res!99162 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104444 () ListLongMap!2859)

(assert (=> b!205309 (= lt!104442 lt!104444)))

(declare-fun lt!104440 () tuple2!3946)

(assert (=> b!205309 (= lt!104444 (+!472 lt!104443 lt!104440))))

(declare-fun lt!104445 () ListLongMap!2859)

(assert (=> b!205309 (= lt!104449 lt!104445)))

(assert (=> b!205309 (= lt!104445 (+!472 lt!104447 lt!104440))))

(assert (=> b!205309 (= lt!104449 (+!472 lt!104441 lt!104440))))

(assert (=> b!205309 (= lt!104440 (tuple2!3947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205316 () Bool)

(declare-fun res!99159 () Bool)

(assert (=> b!205316 (=> (not res!99159) (not e!134270))))

(assert (=> b!205316 (= res!99159 (= (select (arr!4472 _keys!825) i!601) k0!843))))

(declare-fun b!205317 () Bool)

(assert (=> b!205317 (= e!134271 true)))

(assert (=> b!205317 (= lt!104445 (+!472 lt!104444 lt!104451))))

(declare-fun lt!104448 () Unit!6236)

(declare-fun addCommutativeForDiffKeys!175 (ListLongMap!2859 (_ BitVec 64) V!6467 (_ BitVec 64) V!6467) Unit!6236)

(assert (=> b!205317 (= lt!104448 (addCommutativeForDiffKeys!175 lt!104443 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205318 () Bool)

(assert (=> b!205318 (= e!134273 (and e!134267 mapRes!8741))))

(declare-fun condMapEmpty!8741 () Bool)

(declare-fun mapDefault!8741 () ValueCell!2214)

(assert (=> b!205318 (= condMapEmpty!8741 (= (arr!4473 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2214)) mapDefault!8741)))))

(declare-fun b!205319 () Bool)

(declare-fun res!99158 () Bool)

(assert (=> b!205319 (=> (not res!99158) (not e!134270))))

(assert (=> b!205319 (= res!99158 (and (= (size!4798 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4797 _keys!825) (size!4798 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20600 res!99161) b!205319))

(assert (= (and b!205319 res!99158) b!205312))

(assert (= (and b!205312 res!99160) b!205308))

(assert (= (and b!205308 res!99165) b!205311))

(assert (= (and b!205311 res!99166) b!205314))

(assert (= (and b!205314 res!99164) b!205316))

(assert (= (and b!205316 res!99159) b!205315))

(assert (= (and b!205315 (not res!99163)) b!205309))

(assert (= (and b!205309 (not res!99162)) b!205317))

(assert (= (and b!205318 condMapEmpty!8741) mapIsEmpty!8741))

(assert (= (and b!205318 (not condMapEmpty!8741)) mapNonEmpty!8741))

(get-info :version)

(assert (= (and mapNonEmpty!8741 ((_ is ValueCellFull!2214) mapValue!8741)) b!205313))

(assert (= (and b!205318 ((_ is ValueCellFull!2214) mapDefault!8741)) b!205310))

(assert (= start!20600 b!205318))

(declare-fun m!232919 () Bool)

(assert (=> b!205308 m!232919))

(declare-fun m!232921 () Bool)

(assert (=> b!205315 m!232921))

(declare-fun m!232923 () Bool)

(assert (=> b!205315 m!232923))

(declare-fun m!232925 () Bool)

(assert (=> b!205315 m!232925))

(declare-fun m!232927 () Bool)

(assert (=> b!205315 m!232927))

(declare-fun m!232929 () Bool)

(assert (=> b!205315 m!232929))

(declare-fun m!232931 () Bool)

(assert (=> b!205315 m!232931))

(declare-fun m!232933 () Bool)

(assert (=> b!205315 m!232933))

(declare-fun m!232935 () Bool)

(assert (=> start!20600 m!232935))

(declare-fun m!232937 () Bool)

(assert (=> start!20600 m!232937))

(declare-fun m!232939 () Bool)

(assert (=> start!20600 m!232939))

(declare-fun m!232941 () Bool)

(assert (=> b!205309 m!232941))

(declare-fun m!232943 () Bool)

(assert (=> b!205309 m!232943))

(declare-fun m!232945 () Bool)

(assert (=> b!205309 m!232945))

(declare-fun m!232947 () Bool)

(assert (=> mapNonEmpty!8741 m!232947))

(declare-fun m!232949 () Bool)

(assert (=> b!205314 m!232949))

(declare-fun m!232951 () Bool)

(assert (=> b!205316 m!232951))

(declare-fun m!232953 () Bool)

(assert (=> b!205312 m!232953))

(declare-fun m!232955 () Bool)

(assert (=> b!205317 m!232955))

(declare-fun m!232957 () Bool)

(assert (=> b!205317 m!232957))

(check-sat (not b!205309) (not b!205312) (not b!205315) (not mapNonEmpty!8741) (not b!205314) b_and!12005 (not b!205317) (not b_next!5259) (not b!205308) (not start!20600) tp_is_empty!5115)
(check-sat b_and!12005 (not b_next!5259))
