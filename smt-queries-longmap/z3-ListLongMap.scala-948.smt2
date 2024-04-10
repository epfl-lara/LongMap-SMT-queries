; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20786 () Bool)

(assert start!20786)

(declare-fun b_free!5439 () Bool)

(declare-fun b_next!5439 () Bool)

(assert (=> start!20786 (= b_free!5439 (not b_next!5439))))

(declare-fun tp!19357 () Bool)

(declare-fun b_and!12185 () Bool)

(assert (=> start!20786 (= tp!19357 b_and!12185)))

(declare-fun b!208250 () Bool)

(declare-fun e!135853 () Bool)

(declare-fun e!135851 () Bool)

(declare-fun mapRes!9020 () Bool)

(assert (=> b!208250 (= e!135853 (and e!135851 mapRes!9020))))

(declare-fun condMapEmpty!9020 () Bool)

(declare-datatypes ((V!6715 0))(
  ( (V!6716 (val!2695 Int)) )
))
(declare-datatypes ((ValueCell!2307 0))(
  ( (ValueCellFull!2307 (v!4665 V!6715)) (EmptyCell!2307) )
))
(declare-datatypes ((array!9807 0))(
  ( (array!9808 (arr!4654 (Array (_ BitVec 32) ValueCell!2307)) (size!4979 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9807)

(declare-fun mapDefault!9020 () ValueCell!2307)

(assert (=> b!208250 (= condMapEmpty!9020 (= (arr!4654 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2307)) mapDefault!9020)))))

(declare-fun mapIsEmpty!9020 () Bool)

(assert (=> mapIsEmpty!9020 mapRes!9020))

(declare-fun b!208251 () Bool)

(declare-fun res!101269 () Bool)

(declare-fun e!135852 () Bool)

(assert (=> b!208251 (=> (not res!101269) (not e!135852))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9809 0))(
  ( (array!9810 (arr!4655 (Array (_ BitVec 32) (_ BitVec 64))) (size!4980 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9809)

(assert (=> b!208251 (= res!101269 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4980 _keys!825))))))

(declare-fun b!208252 () Bool)

(declare-fun tp_is_empty!5301 () Bool)

(assert (=> b!208252 (= e!135851 tp_is_empty!5301)))

(declare-fun b!208253 () Bool)

(declare-fun res!101263 () Bool)

(assert (=> b!208253 (=> (not res!101263) (not e!135852))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9809 (_ BitVec 32)) Bool)

(assert (=> b!208253 (= res!101263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208254 () Bool)

(assert (=> b!208254 (= e!135852 (bvsgt #b00000000000000000000000000000000 (size!4980 _keys!825)))))

(declare-fun v!520 () V!6715)

(declare-fun zeroValue!615 () V!6715)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6715)

(declare-datatypes ((tuple2!4084 0))(
  ( (tuple2!4085 (_1!2053 (_ BitVec 64)) (_2!2053 V!6715)) )
))
(declare-datatypes ((List!2980 0))(
  ( (Nil!2977) (Cons!2976 (h!3618 tuple2!4084) (t!7911 List!2980)) )
))
(declare-datatypes ((ListLongMap!2997 0))(
  ( (ListLongMap!2998 (toList!1514 List!2980)) )
))
(declare-fun lt!106749 () ListLongMap!2997)

(declare-fun getCurrentListMapNoExtraKeys!455 (array!9809 array!9807 (_ BitVec 32) (_ BitVec 32) V!6715 V!6715 (_ BitVec 32) Int) ListLongMap!2997)

(assert (=> b!208254 (= lt!106749 (getCurrentListMapNoExtraKeys!455 _keys!825 (array!9808 (store (arr!4654 _values!649) i!601 (ValueCellFull!2307 v!520)) (size!4979 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106748 () ListLongMap!2997)

(assert (=> b!208254 (= lt!106748 (getCurrentListMapNoExtraKeys!455 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208255 () Bool)

(declare-fun res!101268 () Bool)

(assert (=> b!208255 (=> (not res!101268) (not e!135852))))

(assert (=> b!208255 (= res!101268 (and (= (size!4979 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4980 _keys!825) (size!4979 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208256 () Bool)

(declare-fun e!135850 () Bool)

(assert (=> b!208256 (= e!135850 tp_is_empty!5301)))

(declare-fun mapNonEmpty!9020 () Bool)

(declare-fun tp!19358 () Bool)

(assert (=> mapNonEmpty!9020 (= mapRes!9020 (and tp!19358 e!135850))))

(declare-fun mapKey!9020 () (_ BitVec 32))

(declare-fun mapRest!9020 () (Array (_ BitVec 32) ValueCell!2307))

(declare-fun mapValue!9020 () ValueCell!2307)

(assert (=> mapNonEmpty!9020 (= (arr!4654 _values!649) (store mapRest!9020 mapKey!9020 mapValue!9020))))

(declare-fun b!208257 () Bool)

(declare-fun res!101267 () Bool)

(assert (=> b!208257 (=> (not res!101267) (not e!135852))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208257 (= res!101267 (validKeyInArray!0 k0!843))))

(declare-fun res!101266 () Bool)

(assert (=> start!20786 (=> (not res!101266) (not e!135852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20786 (= res!101266 (validMask!0 mask!1149))))

(assert (=> start!20786 e!135852))

(declare-fun array_inv!3085 (array!9807) Bool)

(assert (=> start!20786 (and (array_inv!3085 _values!649) e!135853)))

(assert (=> start!20786 true))

(assert (=> start!20786 tp_is_empty!5301))

(declare-fun array_inv!3086 (array!9809) Bool)

(assert (=> start!20786 (array_inv!3086 _keys!825)))

(assert (=> start!20786 tp!19357))

(declare-fun b!208258 () Bool)

(declare-fun res!101264 () Bool)

(assert (=> b!208258 (=> (not res!101264) (not e!135852))))

(declare-datatypes ((List!2981 0))(
  ( (Nil!2978) (Cons!2977 (h!3619 (_ BitVec 64)) (t!7912 List!2981)) )
))
(declare-fun arrayNoDuplicates!0 (array!9809 (_ BitVec 32) List!2981) Bool)

(assert (=> b!208258 (= res!101264 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2978))))

(declare-fun b!208259 () Bool)

(declare-fun res!101265 () Bool)

(assert (=> b!208259 (=> (not res!101265) (not e!135852))))

(assert (=> b!208259 (= res!101265 (= (select (arr!4655 _keys!825) i!601) k0!843))))

(assert (= (and start!20786 res!101266) b!208255))

(assert (= (and b!208255 res!101268) b!208253))

(assert (= (and b!208253 res!101263) b!208258))

(assert (= (and b!208258 res!101264) b!208251))

(assert (= (and b!208251 res!101269) b!208257))

(assert (= (and b!208257 res!101267) b!208259))

(assert (= (and b!208259 res!101265) b!208254))

(assert (= (and b!208250 condMapEmpty!9020) mapIsEmpty!9020))

(assert (= (and b!208250 (not condMapEmpty!9020)) mapNonEmpty!9020))

(get-info :version)

(assert (= (and mapNonEmpty!9020 ((_ is ValueCellFull!2307) mapValue!9020)) b!208256))

(assert (= (and b!208250 ((_ is ValueCellFull!2307) mapDefault!9020)) b!208252))

(assert (= start!20786 b!208250))

(declare-fun m!235931 () Bool)

(assert (=> b!208258 m!235931))

(declare-fun m!235933 () Bool)

(assert (=> start!20786 m!235933))

(declare-fun m!235935 () Bool)

(assert (=> start!20786 m!235935))

(declare-fun m!235937 () Bool)

(assert (=> start!20786 m!235937))

(declare-fun m!235939 () Bool)

(assert (=> b!208254 m!235939))

(declare-fun m!235941 () Bool)

(assert (=> b!208254 m!235941))

(declare-fun m!235943 () Bool)

(assert (=> b!208254 m!235943))

(declare-fun m!235945 () Bool)

(assert (=> b!208253 m!235945))

(declare-fun m!235947 () Bool)

(assert (=> mapNonEmpty!9020 m!235947))

(declare-fun m!235949 () Bool)

(assert (=> b!208257 m!235949))

(declare-fun m!235951 () Bool)

(assert (=> b!208259 m!235951))

(check-sat (not mapNonEmpty!9020) (not b!208257) (not b_next!5439) (not start!20786) (not b!208254) b_and!12185 tp_is_empty!5301 (not b!208258) (not b!208253))
(check-sat b_and!12185 (not b_next!5439))
