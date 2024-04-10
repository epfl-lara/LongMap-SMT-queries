; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20588 () Bool)

(assert start!20588)

(declare-fun b_free!5247 () Bool)

(declare-fun b_next!5247 () Bool)

(assert (=> start!20588 (= b_free!5247 (not b_next!5247))))

(declare-fun tp!18773 () Bool)

(declare-fun b_and!11993 () Bool)

(assert (=> start!20588 (= tp!18773 b_and!11993)))

(declare-fun mapIsEmpty!8723 () Bool)

(declare-fun mapRes!8723 () Bool)

(assert (=> mapIsEmpty!8723 mapRes!8723))

(declare-fun b!205092 () Bool)

(declare-fun e!134143 () Bool)

(declare-fun tp_is_empty!5103 () Bool)

(assert (=> b!205092 (= e!134143 tp_is_empty!5103)))

(declare-fun b!205093 () Bool)

(declare-fun res!99004 () Bool)

(declare-fun e!134147 () Bool)

(assert (=> b!205093 (=> (not res!99004) (not e!134147))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9419 0))(
  ( (array!9420 (arr!4460 (Array (_ BitVec 32) (_ BitVec 64))) (size!4785 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9419)

(assert (=> b!205093 (= res!99004 (= (select (arr!4460 _keys!825) i!601) k0!843))))

(declare-fun b!205094 () Bool)

(declare-fun res!98996 () Bool)

(assert (=> b!205094 (=> (not res!98996) (not e!134147))))

(assert (=> b!205094 (= res!98996 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4785 _keys!825))))))

(declare-fun b!205095 () Bool)

(declare-fun e!134144 () Bool)

(assert (=> b!205095 (= e!134144 tp_is_empty!5103)))

(declare-fun b!205096 () Bool)

(declare-fun e!134146 () Bool)

(assert (=> b!205096 (= e!134147 (not e!134146))))

(declare-fun res!98998 () Bool)

(assert (=> b!205096 (=> res!98998 e!134146)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205096 (= res!98998 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6451 0))(
  ( (V!6452 (val!2596 Int)) )
))
(declare-datatypes ((ValueCell!2208 0))(
  ( (ValueCellFull!2208 (v!4566 V!6451)) (EmptyCell!2208) )
))
(declare-datatypes ((array!9421 0))(
  ( (array!9422 (arr!4461 (Array (_ BitVec 32) ValueCell!2208)) (size!4786 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9421)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6451)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6451)

(declare-datatypes ((tuple2!3934 0))(
  ( (tuple2!3935 (_1!1978 (_ BitVec 64)) (_2!1978 V!6451)) )
))
(declare-datatypes ((List!2834 0))(
  ( (Nil!2831) (Cons!2830 (h!3472 tuple2!3934) (t!7765 List!2834)) )
))
(declare-datatypes ((ListLongMap!2847 0))(
  ( (ListLongMap!2848 (toList!1439 List!2834)) )
))
(declare-fun lt!104224 () ListLongMap!2847)

(declare-fun getCurrentListMap!1011 (array!9419 array!9421 (_ BitVec 32) (_ BitVec 32) V!6451 V!6451 (_ BitVec 32) Int) ListLongMap!2847)

(assert (=> b!205096 (= lt!104224 (getCurrentListMap!1011 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104228 () ListLongMap!2847)

(declare-fun lt!104232 () array!9421)

(assert (=> b!205096 (= lt!104228 (getCurrentListMap!1011 _keys!825 lt!104232 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104225 () ListLongMap!2847)

(declare-fun lt!104234 () ListLongMap!2847)

(assert (=> b!205096 (and (= lt!104225 lt!104234) (= lt!104234 lt!104225))))

(declare-fun lt!104230 () ListLongMap!2847)

(declare-fun lt!104226 () tuple2!3934)

(declare-fun +!466 (ListLongMap!2847 tuple2!3934) ListLongMap!2847)

(assert (=> b!205096 (= lt!104234 (+!466 lt!104230 lt!104226))))

(declare-fun v!520 () V!6451)

(assert (=> b!205096 (= lt!104226 (tuple2!3935 k0!843 v!520))))

(declare-datatypes ((Unit!6224 0))(
  ( (Unit!6225) )
))
(declare-fun lt!104233 () Unit!6224)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 (array!9419 array!9421 (_ BitVec 32) (_ BitVec 32) V!6451 V!6451 (_ BitVec 32) (_ BitVec 64) V!6451 (_ BitVec 32) Int) Unit!6224)

(assert (=> b!205096 (= lt!104233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!385 (array!9419 array!9421 (_ BitVec 32) (_ BitVec 32) V!6451 V!6451 (_ BitVec 32) Int) ListLongMap!2847)

(assert (=> b!205096 (= lt!104225 (getCurrentListMapNoExtraKeys!385 _keys!825 lt!104232 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205096 (= lt!104232 (array!9422 (store (arr!4461 _values!649) i!601 (ValueCellFull!2208 v!520)) (size!4786 _values!649)))))

(assert (=> b!205096 (= lt!104230 (getCurrentListMapNoExtraKeys!385 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205097 () Bool)

(declare-fun res!98997 () Bool)

(assert (=> b!205097 (=> (not res!98997) (not e!134147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205097 (= res!98997 (validKeyInArray!0 k0!843))))

(declare-fun b!205099 () Bool)

(declare-fun res!98999 () Bool)

(assert (=> b!205099 (=> (not res!98999) (not e!134147))))

(assert (=> b!205099 (= res!98999 (and (= (size!4786 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4785 _keys!825) (size!4786 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8723 () Bool)

(declare-fun tp!18772 () Bool)

(assert (=> mapNonEmpty!8723 (= mapRes!8723 (and tp!18772 e!134143))))

(declare-fun mapRest!8723 () (Array (_ BitVec 32) ValueCell!2208))

(declare-fun mapKey!8723 () (_ BitVec 32))

(declare-fun mapValue!8723 () ValueCell!2208)

(assert (=> mapNonEmpty!8723 (= (arr!4461 _values!649) (store mapRest!8723 mapKey!8723 mapValue!8723))))

(declare-fun b!205100 () Bool)

(declare-fun e!134141 () Bool)

(assert (=> b!205100 (= e!134141 (and e!134144 mapRes!8723))))

(declare-fun condMapEmpty!8723 () Bool)

(declare-fun mapDefault!8723 () ValueCell!2208)

(assert (=> b!205100 (= condMapEmpty!8723 (= (arr!4461 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2208)) mapDefault!8723)))))

(declare-fun b!205101 () Bool)

(declare-fun res!99002 () Bool)

(assert (=> b!205101 (=> (not res!99002) (not e!134147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9419 (_ BitVec 32)) Bool)

(assert (=> b!205101 (= res!99002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205102 () Bool)

(declare-fun res!99000 () Bool)

(assert (=> b!205102 (=> (not res!99000) (not e!134147))))

(declare-datatypes ((List!2835 0))(
  ( (Nil!2832) (Cons!2831 (h!3473 (_ BitVec 64)) (t!7766 List!2835)) )
))
(declare-fun arrayNoDuplicates!0 (array!9419 (_ BitVec 32) List!2835) Bool)

(assert (=> b!205102 (= res!99000 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2832))))

(declare-fun b!205103 () Bool)

(declare-fun e!134145 () Bool)

(assert (=> b!205103 (= e!134146 e!134145)))

(declare-fun res!99001 () Bool)

(assert (=> b!205103 (=> res!99001 e!134145)))

(assert (=> b!205103 (= res!99001 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104229 () ListLongMap!2847)

(assert (=> b!205103 (= lt!104224 lt!104229)))

(declare-fun lt!104231 () tuple2!3934)

(assert (=> b!205103 (= lt!104229 (+!466 lt!104230 lt!104231))))

(declare-fun lt!104235 () ListLongMap!2847)

(assert (=> b!205103 (= lt!104228 lt!104235)))

(assert (=> b!205103 (= lt!104235 (+!466 lt!104234 lt!104231))))

(assert (=> b!205103 (= lt!104228 (+!466 lt!104225 lt!104231))))

(assert (=> b!205103 (= lt!104231 (tuple2!3935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99003 () Bool)

(assert (=> start!20588 (=> (not res!99003) (not e!134147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20588 (= res!99003 (validMask!0 mask!1149))))

(assert (=> start!20588 e!134147))

(declare-fun array_inv!2945 (array!9421) Bool)

(assert (=> start!20588 (and (array_inv!2945 _values!649) e!134141)))

(assert (=> start!20588 true))

(assert (=> start!20588 tp_is_empty!5103))

(declare-fun array_inv!2946 (array!9419) Bool)

(assert (=> start!20588 (array_inv!2946 _keys!825)))

(assert (=> start!20588 tp!18773))

(declare-fun b!205098 () Bool)

(assert (=> b!205098 (= e!134145 true)))

(assert (=> b!205098 (= lt!104235 (+!466 lt!104229 lt!104226))))

(declare-fun lt!104227 () Unit!6224)

(declare-fun addCommutativeForDiffKeys!171 (ListLongMap!2847 (_ BitVec 64) V!6451 (_ BitVec 64) V!6451) Unit!6224)

(assert (=> b!205098 (= lt!104227 (addCommutativeForDiffKeys!171 lt!104230 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20588 res!99003) b!205099))

(assert (= (and b!205099 res!98999) b!205101))

(assert (= (and b!205101 res!99002) b!205102))

(assert (= (and b!205102 res!99000) b!205094))

(assert (= (and b!205094 res!98996) b!205097))

(assert (= (and b!205097 res!98997) b!205093))

(assert (= (and b!205093 res!99004) b!205096))

(assert (= (and b!205096 (not res!98998)) b!205103))

(assert (= (and b!205103 (not res!99001)) b!205098))

(assert (= (and b!205100 condMapEmpty!8723) mapIsEmpty!8723))

(assert (= (and b!205100 (not condMapEmpty!8723)) mapNonEmpty!8723))

(get-info :version)

(assert (= (and mapNonEmpty!8723 ((_ is ValueCellFull!2208) mapValue!8723)) b!205092))

(assert (= (and b!205100 ((_ is ValueCellFull!2208) mapDefault!8723)) b!205095))

(assert (= start!20588 b!205100))

(declare-fun m!232679 () Bool)

(assert (=> start!20588 m!232679))

(declare-fun m!232681 () Bool)

(assert (=> start!20588 m!232681))

(declare-fun m!232683 () Bool)

(assert (=> start!20588 m!232683))

(declare-fun m!232685 () Bool)

(assert (=> b!205103 m!232685))

(declare-fun m!232687 () Bool)

(assert (=> b!205103 m!232687))

(declare-fun m!232689 () Bool)

(assert (=> b!205103 m!232689))

(declare-fun m!232691 () Bool)

(assert (=> b!205097 m!232691))

(declare-fun m!232693 () Bool)

(assert (=> b!205102 m!232693))

(declare-fun m!232695 () Bool)

(assert (=> b!205101 m!232695))

(declare-fun m!232697 () Bool)

(assert (=> b!205098 m!232697))

(declare-fun m!232699 () Bool)

(assert (=> b!205098 m!232699))

(declare-fun m!232701 () Bool)

(assert (=> b!205096 m!232701))

(declare-fun m!232703 () Bool)

(assert (=> b!205096 m!232703))

(declare-fun m!232705 () Bool)

(assert (=> b!205096 m!232705))

(declare-fun m!232707 () Bool)

(assert (=> b!205096 m!232707))

(declare-fun m!232709 () Bool)

(assert (=> b!205096 m!232709))

(declare-fun m!232711 () Bool)

(assert (=> b!205096 m!232711))

(declare-fun m!232713 () Bool)

(assert (=> b!205096 m!232713))

(declare-fun m!232715 () Bool)

(assert (=> b!205093 m!232715))

(declare-fun m!232717 () Bool)

(assert (=> mapNonEmpty!8723 m!232717))

(check-sat (not b!205101) (not b!205096) (not b!205097) (not b!205102) (not b!205103) b_and!11993 (not start!20588) tp_is_empty!5103 (not b_next!5247) (not mapNonEmpty!8723) (not b!205098))
(check-sat b_and!11993 (not b_next!5247))
