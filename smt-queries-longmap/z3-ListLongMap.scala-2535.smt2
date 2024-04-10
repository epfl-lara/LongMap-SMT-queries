; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39030 () Bool)

(assert start!39030)

(declare-fun b_free!9297 () Bool)

(declare-fun b_next!9297 () Bool)

(assert (=> start!39030 (= b_free!9297 (not b_next!9297))))

(declare-fun tp!33419 () Bool)

(declare-fun b_and!16683 () Bool)

(assert (=> start!39030 (= tp!33419 b_and!16683)))

(declare-fun mapIsEmpty!17295 () Bool)

(declare-fun mapRes!17295 () Bool)

(assert (=> mapIsEmpty!17295 mapRes!17295))

(declare-fun res!236973 () Bool)

(declare-fun e!245546 () Bool)

(assert (=> start!39030 (=> (not res!236973) (not e!245546))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24771 0))(
  ( (array!24772 (arr!11835 (Array (_ BitVec 32) (_ BitVec 64))) (size!12187 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24771)

(assert (=> start!39030 (= res!236973 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12187 _keys!709))))))

(assert (=> start!39030 e!245546))

(declare-fun tp_is_empty!10449 () Bool)

(assert (=> start!39030 tp_is_empty!10449))

(assert (=> start!39030 tp!33419))

(assert (=> start!39030 true))

(declare-datatypes ((V!15037 0))(
  ( (V!15038 (val!5269 Int)) )
))
(declare-datatypes ((ValueCell!4881 0))(
  ( (ValueCellFull!4881 (v!7516 V!15037)) (EmptyCell!4881) )
))
(declare-datatypes ((array!24773 0))(
  ( (array!24774 (arr!11836 (Array (_ BitVec 32) ValueCell!4881)) (size!12188 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24773)

(declare-fun e!245550 () Bool)

(declare-fun array_inv!8638 (array!24773) Bool)

(assert (=> start!39030 (and (array_inv!8638 _values!549) e!245550)))

(declare-fun array_inv!8639 (array!24771) Bool)

(assert (=> start!39030 (array_inv!8639 _keys!709)))

(declare-fun b!409287 () Bool)

(declare-fun res!236978 () Bool)

(assert (=> b!409287 (=> (not res!236978) (not e!245546))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409287 (= res!236978 (validKeyInArray!0 k0!794))))

(declare-fun b!409288 () Bool)

(declare-fun e!245547 () Bool)

(assert (=> b!409288 (= e!245547 tp_is_empty!10449)))

(declare-fun b!409289 () Bool)

(declare-fun res!236975 () Bool)

(assert (=> b!409289 (=> (not res!236975) (not e!245546))))

(declare-datatypes ((List!6851 0))(
  ( (Nil!6848) (Cons!6847 (h!7703 (_ BitVec 64)) (t!12025 List!6851)) )
))
(declare-fun arrayNoDuplicates!0 (array!24771 (_ BitVec 32) List!6851) Bool)

(assert (=> b!409289 (= res!236975 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6848))))

(declare-fun b!409290 () Bool)

(declare-fun res!236976 () Bool)

(assert (=> b!409290 (=> (not res!236976) (not e!245546))))

(declare-fun arrayContainsKey!0 (array!24771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409290 (= res!236976 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409291 () Bool)

(declare-fun res!236970 () Bool)

(declare-fun e!245548 () Bool)

(assert (=> b!409291 (=> (not res!236970) (not e!245548))))

(declare-fun lt!188926 () array!24771)

(assert (=> b!409291 (= res!236970 (arrayNoDuplicates!0 lt!188926 #b00000000000000000000000000000000 Nil!6848))))

(declare-fun b!409292 () Bool)

(declare-fun res!236972 () Bool)

(assert (=> b!409292 (=> (not res!236972) (not e!245546))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409292 (= res!236972 (or (= (select (arr!11835 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11835 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409293 () Bool)

(declare-fun res!236974 () Bool)

(assert (=> b!409293 (=> (not res!236974) (not e!245546))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409293 (= res!236974 (and (= (size!12188 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12187 _keys!709) (size!12188 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409294 () Bool)

(declare-fun e!245549 () Bool)

(assert (=> b!409294 (= e!245549 tp_is_empty!10449)))

(declare-fun b!409295 () Bool)

(declare-fun res!236969 () Bool)

(assert (=> b!409295 (=> (not res!236969) (not e!245546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24771 (_ BitVec 32)) Bool)

(assert (=> b!409295 (= res!236969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409296 () Bool)

(declare-fun res!236979 () Bool)

(assert (=> b!409296 (=> (not res!236979) (not e!245546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409296 (= res!236979 (validMask!0 mask!1025))))

(declare-fun b!409297 () Bool)

(assert (=> b!409297 (= e!245550 (and e!245547 mapRes!17295))))

(declare-fun condMapEmpty!17295 () Bool)

(declare-fun mapDefault!17295 () ValueCell!4881)

(assert (=> b!409297 (= condMapEmpty!17295 (= (arr!11836 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4881)) mapDefault!17295)))))

(declare-fun mapNonEmpty!17295 () Bool)

(declare-fun tp!33420 () Bool)

(assert (=> mapNonEmpty!17295 (= mapRes!17295 (and tp!33420 e!245549))))

(declare-fun mapKey!17295 () (_ BitVec 32))

(declare-fun mapValue!17295 () ValueCell!4881)

(declare-fun mapRest!17295 () (Array (_ BitVec 32) ValueCell!4881))

(assert (=> mapNonEmpty!17295 (= (arr!11836 _values!549) (store mapRest!17295 mapKey!17295 mapValue!17295))))

(declare-fun b!409298 () Bool)

(declare-fun res!236971 () Bool)

(assert (=> b!409298 (=> (not res!236971) (not e!245546))))

(assert (=> b!409298 (= res!236971 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12187 _keys!709))))))

(declare-fun b!409299 () Bool)

(declare-fun res!236968 () Bool)

(assert (=> b!409299 (=> (not res!236968) (not e!245548))))

(assert (=> b!409299 (= res!236968 (bvsle from!863 i!563))))

(declare-fun b!409300 () Bool)

(assert (=> b!409300 (= e!245548 false)))

(declare-fun minValue!515 () V!15037)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15037)

(declare-datatypes ((tuple2!6828 0))(
  ( (tuple2!6829 (_1!3425 (_ BitVec 64)) (_2!3425 V!15037)) )
))
(declare-datatypes ((List!6852 0))(
  ( (Nil!6849) (Cons!6848 (h!7704 tuple2!6828) (t!12026 List!6852)) )
))
(declare-datatypes ((ListLongMap!5741 0))(
  ( (ListLongMap!5742 (toList!2886 List!6852)) )
))
(declare-fun lt!188927 () ListLongMap!5741)

(declare-fun getCurrentListMapNoExtraKeys!1094 (array!24771 array!24773 (_ BitVec 32) (_ BitVec 32) V!15037 V!15037 (_ BitVec 32) Int) ListLongMap!5741)

(assert (=> b!409300 (= lt!188927 (getCurrentListMapNoExtraKeys!1094 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409301 () Bool)

(assert (=> b!409301 (= e!245546 e!245548)))

(declare-fun res!236977 () Bool)

(assert (=> b!409301 (=> (not res!236977) (not e!245548))))

(assert (=> b!409301 (= res!236977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188926 mask!1025))))

(assert (=> b!409301 (= lt!188926 (array!24772 (store (arr!11835 _keys!709) i!563 k0!794) (size!12187 _keys!709)))))

(assert (= (and start!39030 res!236973) b!409296))

(assert (= (and b!409296 res!236979) b!409293))

(assert (= (and b!409293 res!236974) b!409295))

(assert (= (and b!409295 res!236969) b!409289))

(assert (= (and b!409289 res!236975) b!409298))

(assert (= (and b!409298 res!236971) b!409287))

(assert (= (and b!409287 res!236978) b!409292))

(assert (= (and b!409292 res!236972) b!409290))

(assert (= (and b!409290 res!236976) b!409301))

(assert (= (and b!409301 res!236977) b!409291))

(assert (= (and b!409291 res!236970) b!409299))

(assert (= (and b!409299 res!236968) b!409300))

(assert (= (and b!409297 condMapEmpty!17295) mapIsEmpty!17295))

(assert (= (and b!409297 (not condMapEmpty!17295)) mapNonEmpty!17295))

(get-info :version)

(assert (= (and mapNonEmpty!17295 ((_ is ValueCellFull!4881) mapValue!17295)) b!409294))

(assert (= (and b!409297 ((_ is ValueCellFull!4881) mapDefault!17295)) b!409288))

(assert (= start!39030 b!409297))

(declare-fun m!400257 () Bool)

(assert (=> b!409292 m!400257))

(declare-fun m!400259 () Bool)

(assert (=> b!409301 m!400259))

(declare-fun m!400261 () Bool)

(assert (=> b!409301 m!400261))

(declare-fun m!400263 () Bool)

(assert (=> b!409289 m!400263))

(declare-fun m!400265 () Bool)

(assert (=> b!409295 m!400265))

(declare-fun m!400267 () Bool)

(assert (=> b!409287 m!400267))

(declare-fun m!400269 () Bool)

(assert (=> b!409290 m!400269))

(declare-fun m!400271 () Bool)

(assert (=> b!409291 m!400271))

(declare-fun m!400273 () Bool)

(assert (=> b!409296 m!400273))

(declare-fun m!400275 () Bool)

(assert (=> b!409300 m!400275))

(declare-fun m!400277 () Bool)

(assert (=> start!39030 m!400277))

(declare-fun m!400279 () Bool)

(assert (=> start!39030 m!400279))

(declare-fun m!400281 () Bool)

(assert (=> mapNonEmpty!17295 m!400281))

(check-sat (not b!409290) (not mapNonEmpty!17295) (not start!39030) (not b!409301) (not b!409295) (not b!409289) tp_is_empty!10449 (not b!409287) (not b!409296) b_and!16683 (not b_next!9297) (not b!409291) (not b!409300))
(check-sat b_and!16683 (not b_next!9297))
