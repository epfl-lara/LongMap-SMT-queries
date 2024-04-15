; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21086 () Bool)

(assert start!21086)

(declare-fun b_free!5593 () Bool)

(declare-fun b_next!5593 () Bool)

(assert (=> start!21086 (= b_free!5593 (not b_next!5593))))

(declare-fun tp!19840 () Bool)

(declare-fun b_and!12397 () Bool)

(assert (=> start!21086 (= tp!19840 b_and!12397)))

(declare-fun b!211944 () Bool)

(declare-fun e!137919 () Bool)

(declare-fun e!137921 () Bool)

(assert (=> b!211944 (= e!137919 (not e!137921))))

(declare-fun res!103567 () Bool)

(assert (=> b!211944 (=> res!103567 e!137921)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211944 (= res!103567 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6921 0))(
  ( (V!6922 (val!2772 Int)) )
))
(declare-datatypes ((tuple2!4166 0))(
  ( (tuple2!4167 (_1!2094 (_ BitVec 64)) (_2!2094 V!6921)) )
))
(declare-datatypes ((List!3074 0))(
  ( (Nil!3071) (Cons!3070 (h!3712 tuple2!4166) (t!8010 List!3074)) )
))
(declare-datatypes ((ListLongMap!3069 0))(
  ( (ListLongMap!3070 (toList!1550 List!3074)) )
))
(declare-fun lt!109055 () ListLongMap!3069)

(declare-datatypes ((ValueCell!2384 0))(
  ( (ValueCellFull!2384 (v!4764 V!6921)) (EmptyCell!2384) )
))
(declare-datatypes ((array!10103 0))(
  ( (array!10104 (arr!4794 (Array (_ BitVec 32) ValueCell!2384)) (size!5120 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10103)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6921)

(declare-datatypes ((array!10105 0))(
  ( (array!10106 (arr!4795 (Array (_ BitVec 32) (_ BitVec 64))) (size!5121 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10105)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6921)

(declare-fun getCurrentListMap!1062 (array!10105 array!10103 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3069)

(assert (=> b!211944 (= lt!109055 (getCurrentListMap!1062 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109057 () ListLongMap!3069)

(declare-fun lt!109059 () array!10103)

(assert (=> b!211944 (= lt!109057 (getCurrentListMap!1062 _keys!825 lt!109059 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109060 () ListLongMap!3069)

(declare-fun lt!109061 () ListLongMap!3069)

(assert (=> b!211944 (and (= lt!109060 lt!109061) (= lt!109061 lt!109060))))

(declare-fun lt!109051 () ListLongMap!3069)

(declare-fun lt!109053 () tuple2!4166)

(declare-fun +!574 (ListLongMap!3069 tuple2!4166) ListLongMap!3069)

(assert (=> b!211944 (= lt!109061 (+!574 lt!109051 lt!109053))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6921)

(assert (=> b!211944 (= lt!109053 (tuple2!4167 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6398 0))(
  ( (Unit!6399) )
))
(declare-fun lt!109050 () Unit!6398)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!223 (array!10105 array!10103 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) (_ BitVec 64) V!6921 (_ BitVec 32) Int) Unit!6398)

(assert (=> b!211944 (= lt!109050 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!223 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!499 (array!10105 array!10103 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3069)

(assert (=> b!211944 (= lt!109060 (getCurrentListMapNoExtraKeys!499 _keys!825 lt!109059 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211944 (= lt!109059 (array!10104 (store (arr!4794 _values!649) i!601 (ValueCellFull!2384 v!520)) (size!5120 _values!649)))))

(assert (=> b!211944 (= lt!109051 (getCurrentListMapNoExtraKeys!499 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9272 () Bool)

(declare-fun mapRes!9272 () Bool)

(assert (=> mapIsEmpty!9272 mapRes!9272))

(declare-fun b!211945 () Bool)

(declare-fun e!137922 () Bool)

(declare-fun e!137918 () Bool)

(assert (=> b!211945 (= e!137922 (and e!137918 mapRes!9272))))

(declare-fun condMapEmpty!9272 () Bool)

(declare-fun mapDefault!9272 () ValueCell!2384)

(assert (=> b!211945 (= condMapEmpty!9272 (= (arr!4794 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2384)) mapDefault!9272)))))

(declare-fun e!137916 () Bool)

(declare-fun b!211946 () Bool)

(assert (=> b!211946 (= e!137916 (= (+!574 lt!109055 lt!109053) lt!109057))))

(declare-fun lt!109056 () ListLongMap!3069)

(declare-fun lt!109052 () ListLongMap!3069)

(assert (=> b!211946 (= lt!109056 (+!574 lt!109052 lt!109053))))

(declare-fun lt!109058 () Unit!6398)

(declare-fun addCommutativeForDiffKeys!202 (ListLongMap!3069 (_ BitVec 64) V!6921 (_ BitVec 64) V!6921) Unit!6398)

(assert (=> b!211946 (= lt!109058 (addCommutativeForDiffKeys!202 lt!109051 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!103563 () Bool)

(assert (=> start!21086 (=> (not res!103563) (not e!137919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21086 (= res!103563 (validMask!0 mask!1149))))

(assert (=> start!21086 e!137919))

(declare-fun array_inv!3147 (array!10103) Bool)

(assert (=> start!21086 (and (array_inv!3147 _values!649) e!137922)))

(assert (=> start!21086 true))

(declare-fun tp_is_empty!5455 () Bool)

(assert (=> start!21086 tp_is_empty!5455))

(declare-fun array_inv!3148 (array!10105) Bool)

(assert (=> start!21086 (array_inv!3148 _keys!825)))

(assert (=> start!21086 tp!19840))

(declare-fun b!211947 () Bool)

(declare-fun res!103566 () Bool)

(assert (=> b!211947 (=> (not res!103566) (not e!137919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211947 (= res!103566 (validKeyInArray!0 k0!843))))

(declare-fun b!211948 () Bool)

(declare-fun res!103564 () Bool)

(assert (=> b!211948 (=> (not res!103564) (not e!137919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10105 (_ BitVec 32)) Bool)

(assert (=> b!211948 (= res!103564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211949 () Bool)

(assert (=> b!211949 (= e!137918 tp_is_empty!5455)))

(declare-fun b!211950 () Bool)

(declare-fun res!103562 () Bool)

(assert (=> b!211950 (=> (not res!103562) (not e!137919))))

(assert (=> b!211950 (= res!103562 (= (select (arr!4795 _keys!825) i!601) k0!843))))

(declare-fun b!211951 () Bool)

(declare-fun res!103560 () Bool)

(assert (=> b!211951 (=> (not res!103560) (not e!137919))))

(assert (=> b!211951 (= res!103560 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5121 _keys!825))))))

(declare-fun b!211952 () Bool)

(declare-fun res!103565 () Bool)

(assert (=> b!211952 (=> (not res!103565) (not e!137919))))

(declare-datatypes ((List!3075 0))(
  ( (Nil!3072) (Cons!3071 (h!3713 (_ BitVec 64)) (t!8011 List!3075)) )
))
(declare-fun arrayNoDuplicates!0 (array!10105 (_ BitVec 32) List!3075) Bool)

(assert (=> b!211952 (= res!103565 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3072))))

(declare-fun b!211953 () Bool)

(declare-fun res!103568 () Bool)

(assert (=> b!211953 (=> (not res!103568) (not e!137919))))

(assert (=> b!211953 (= res!103568 (and (= (size!5120 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5121 _keys!825) (size!5120 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211954 () Bool)

(declare-fun e!137920 () Bool)

(assert (=> b!211954 (= e!137920 tp_is_empty!5455)))

(declare-fun b!211955 () Bool)

(assert (=> b!211955 (= e!137921 e!137916)))

(declare-fun res!103561 () Bool)

(assert (=> b!211955 (=> res!103561 e!137916)))

(assert (=> b!211955 (= res!103561 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!211955 (= lt!109057 lt!109056)))

(declare-fun lt!109054 () tuple2!4166)

(assert (=> b!211955 (= lt!109056 (+!574 lt!109061 lt!109054))))

(assert (=> b!211955 (= lt!109055 lt!109052)))

(assert (=> b!211955 (= lt!109052 (+!574 lt!109051 lt!109054))))

(assert (=> b!211955 (= lt!109057 (+!574 lt!109060 lt!109054))))

(assert (=> b!211955 (= lt!109054 (tuple2!4167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!9272 () Bool)

(declare-fun tp!19841 () Bool)

(assert (=> mapNonEmpty!9272 (= mapRes!9272 (and tp!19841 e!137920))))

(declare-fun mapValue!9272 () ValueCell!2384)

(declare-fun mapRest!9272 () (Array (_ BitVec 32) ValueCell!2384))

(declare-fun mapKey!9272 () (_ BitVec 32))

(assert (=> mapNonEmpty!9272 (= (arr!4794 _values!649) (store mapRest!9272 mapKey!9272 mapValue!9272))))

(assert (= (and start!21086 res!103563) b!211953))

(assert (= (and b!211953 res!103568) b!211948))

(assert (= (and b!211948 res!103564) b!211952))

(assert (= (and b!211952 res!103565) b!211951))

(assert (= (and b!211951 res!103560) b!211947))

(assert (= (and b!211947 res!103566) b!211950))

(assert (= (and b!211950 res!103562) b!211944))

(assert (= (and b!211944 (not res!103567)) b!211955))

(assert (= (and b!211955 (not res!103561)) b!211946))

(assert (= (and b!211945 condMapEmpty!9272) mapIsEmpty!9272))

(assert (= (and b!211945 (not condMapEmpty!9272)) mapNonEmpty!9272))

(get-info :version)

(assert (= (and mapNonEmpty!9272 ((_ is ValueCellFull!2384) mapValue!9272)) b!211954))

(assert (= (and b!211945 ((_ is ValueCellFull!2384) mapDefault!9272)) b!211949))

(assert (= start!21086 b!211945))

(declare-fun m!239255 () Bool)

(assert (=> b!211947 m!239255))

(declare-fun m!239257 () Bool)

(assert (=> b!211944 m!239257))

(declare-fun m!239259 () Bool)

(assert (=> b!211944 m!239259))

(declare-fun m!239261 () Bool)

(assert (=> b!211944 m!239261))

(declare-fun m!239263 () Bool)

(assert (=> b!211944 m!239263))

(declare-fun m!239265 () Bool)

(assert (=> b!211944 m!239265))

(declare-fun m!239267 () Bool)

(assert (=> b!211944 m!239267))

(declare-fun m!239269 () Bool)

(assert (=> b!211944 m!239269))

(declare-fun m!239271 () Bool)

(assert (=> mapNonEmpty!9272 m!239271))

(declare-fun m!239273 () Bool)

(assert (=> b!211952 m!239273))

(declare-fun m!239275 () Bool)

(assert (=> b!211955 m!239275))

(declare-fun m!239277 () Bool)

(assert (=> b!211955 m!239277))

(declare-fun m!239279 () Bool)

(assert (=> b!211955 m!239279))

(declare-fun m!239281 () Bool)

(assert (=> b!211948 m!239281))

(declare-fun m!239283 () Bool)

(assert (=> b!211950 m!239283))

(declare-fun m!239285 () Bool)

(assert (=> b!211946 m!239285))

(declare-fun m!239287 () Bool)

(assert (=> b!211946 m!239287))

(declare-fun m!239289 () Bool)

(assert (=> b!211946 m!239289))

(declare-fun m!239291 () Bool)

(assert (=> start!21086 m!239291))

(declare-fun m!239293 () Bool)

(assert (=> start!21086 m!239293))

(declare-fun m!239295 () Bool)

(assert (=> start!21086 m!239295))

(check-sat (not b!211955) (not b_next!5593) tp_is_empty!5455 (not b!211947) (not b!211948) (not start!21086) (not b!211952) b_and!12397 (not b!211944) (not mapNonEmpty!9272) (not b!211946))
(check-sat b_and!12397 (not b_next!5593))
