; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39074 () Bool)

(assert start!39074)

(declare-fun b_free!9355 () Bool)

(declare-fun b_next!9355 () Bool)

(assert (=> start!39074 (= b_free!9355 (not b_next!9355))))

(declare-fun tp!33594 () Bool)

(declare-fun b_and!16715 () Bool)

(assert (=> start!39074 (= tp!33594 b_and!16715)))

(declare-fun b!410321 () Bool)

(declare-fun res!237883 () Bool)

(declare-fun e!245893 () Bool)

(assert (=> b!410321 (=> (not res!237883) (not e!245893))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410321 (= res!237883 (validKeyInArray!0 k0!794))))

(declare-fun b!410322 () Bool)

(declare-fun e!245895 () Bool)

(assert (=> b!410322 (= e!245893 e!245895)))

(declare-fun res!237891 () Bool)

(assert (=> b!410322 (=> (not res!237891) (not e!245895))))

(declare-datatypes ((array!24871 0))(
  ( (array!24872 (arr!11885 (Array (_ BitVec 32) (_ BitVec 64))) (size!12238 (_ BitVec 32))) )
))
(declare-fun lt!188878 () array!24871)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24871 (_ BitVec 32)) Bool)

(assert (=> b!410322 (= res!237891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188878 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24871)

(assert (=> b!410322 (= lt!188878 (array!24872 (store (arr!11885 _keys!709) i!563 k0!794) (size!12238 _keys!709)))))

(declare-fun mapIsEmpty!17382 () Bool)

(declare-fun mapRes!17382 () Bool)

(assert (=> mapIsEmpty!17382 mapRes!17382))

(declare-fun b!410323 () Bool)

(declare-fun res!237885 () Bool)

(assert (=> b!410323 (=> (not res!237885) (not e!245893))))

(declare-datatypes ((List!6868 0))(
  ( (Nil!6865) (Cons!6864 (h!7720 (_ BitVec 64)) (t!12033 List!6868)) )
))
(declare-fun arrayNoDuplicates!0 (array!24871 (_ BitVec 32) List!6868) Bool)

(assert (=> b!410323 (= res!237885 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6865))))

(declare-fun b!410324 () Bool)

(declare-fun res!237894 () Bool)

(assert (=> b!410324 (=> (not res!237894) (not e!245893))))

(assert (=> b!410324 (= res!237894 (or (= (select (arr!11885 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11885 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!237890 () Bool)

(assert (=> start!39074 (=> (not res!237890) (not e!245893))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39074 (= res!237890 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12238 _keys!709))))))

(assert (=> start!39074 e!245893))

(declare-fun tp_is_empty!10507 () Bool)

(assert (=> start!39074 tp_is_empty!10507))

(assert (=> start!39074 tp!33594))

(assert (=> start!39074 true))

(declare-datatypes ((V!15115 0))(
  ( (V!15116 (val!5298 Int)) )
))
(declare-datatypes ((ValueCell!4910 0))(
  ( (ValueCellFull!4910 (v!7539 V!15115)) (EmptyCell!4910) )
))
(declare-datatypes ((array!24873 0))(
  ( (array!24874 (arr!11886 (Array (_ BitVec 32) ValueCell!4910)) (size!12239 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24873)

(declare-fun e!245894 () Bool)

(declare-fun array_inv!8716 (array!24873) Bool)

(assert (=> start!39074 (and (array_inv!8716 _values!549) e!245894)))

(declare-fun array_inv!8717 (array!24871) Bool)

(assert (=> start!39074 (array_inv!8717 _keys!709)))

(declare-fun b!410325 () Bool)

(declare-fun e!245896 () Bool)

(assert (=> b!410325 (= e!245896 tp_is_empty!10507)))

(declare-fun mapNonEmpty!17382 () Bool)

(declare-fun tp!33593 () Bool)

(declare-fun e!245897 () Bool)

(assert (=> mapNonEmpty!17382 (= mapRes!17382 (and tp!33593 e!245897))))

(declare-fun mapRest!17382 () (Array (_ BitVec 32) ValueCell!4910))

(declare-fun mapValue!17382 () ValueCell!4910)

(declare-fun mapKey!17382 () (_ BitVec 32))

(assert (=> mapNonEmpty!17382 (= (arr!11886 _values!549) (store mapRest!17382 mapKey!17382 mapValue!17382))))

(declare-fun b!410326 () Bool)

(assert (=> b!410326 (= e!245895 false)))

(declare-fun minValue!515 () V!15115)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15115)

(declare-fun v!412 () V!15115)

(declare-datatypes ((tuple2!6856 0))(
  ( (tuple2!6857 (_1!3439 (_ BitVec 64)) (_2!3439 V!15115)) )
))
(declare-datatypes ((List!6869 0))(
  ( (Nil!6866) (Cons!6865 (h!7721 tuple2!6856) (t!12034 List!6869)) )
))
(declare-datatypes ((ListLongMap!5759 0))(
  ( (ListLongMap!5760 (toList!2895 List!6869)) )
))
(declare-fun lt!188877 () ListLongMap!5759)

(declare-fun getCurrentListMapNoExtraKeys!1109 (array!24871 array!24873 (_ BitVec 32) (_ BitVec 32) V!15115 V!15115 (_ BitVec 32) Int) ListLongMap!5759)

(assert (=> b!410326 (= lt!188877 (getCurrentListMapNoExtraKeys!1109 lt!188878 (array!24874 (store (arr!11886 _values!549) i!563 (ValueCellFull!4910 v!412)) (size!12239 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188879 () ListLongMap!5759)

(assert (=> b!410326 (= lt!188879 (getCurrentListMapNoExtraKeys!1109 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410327 () Bool)

(declare-fun res!237886 () Bool)

(assert (=> b!410327 (=> (not res!237886) (not e!245893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410327 (= res!237886 (validMask!0 mask!1025))))

(declare-fun b!410328 () Bool)

(declare-fun res!237889 () Bool)

(assert (=> b!410328 (=> (not res!237889) (not e!245895))))

(assert (=> b!410328 (= res!237889 (bvsle from!863 i!563))))

(declare-fun b!410329 () Bool)

(assert (=> b!410329 (= e!245894 (and e!245896 mapRes!17382))))

(declare-fun condMapEmpty!17382 () Bool)

(declare-fun mapDefault!17382 () ValueCell!4910)

(assert (=> b!410329 (= condMapEmpty!17382 (= (arr!11886 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4910)) mapDefault!17382)))))

(declare-fun b!410330 () Bool)

(declare-fun res!237893 () Bool)

(assert (=> b!410330 (=> (not res!237893) (not e!245893))))

(assert (=> b!410330 (= res!237893 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12238 _keys!709))))))

(declare-fun b!410331 () Bool)

(declare-fun res!237887 () Bool)

(assert (=> b!410331 (=> (not res!237887) (not e!245893))))

(assert (=> b!410331 (= res!237887 (and (= (size!12239 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12238 _keys!709) (size!12239 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410332 () Bool)

(declare-fun res!237888 () Bool)

(assert (=> b!410332 (=> (not res!237888) (not e!245893))))

(assert (=> b!410332 (= res!237888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410333 () Bool)

(declare-fun res!237884 () Bool)

(assert (=> b!410333 (=> (not res!237884) (not e!245893))))

(declare-fun arrayContainsKey!0 (array!24871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410333 (= res!237884 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410334 () Bool)

(declare-fun res!237892 () Bool)

(assert (=> b!410334 (=> (not res!237892) (not e!245895))))

(assert (=> b!410334 (= res!237892 (arrayNoDuplicates!0 lt!188878 #b00000000000000000000000000000000 Nil!6865))))

(declare-fun b!410335 () Bool)

(assert (=> b!410335 (= e!245897 tp_is_empty!10507)))

(assert (= (and start!39074 res!237890) b!410327))

(assert (= (and b!410327 res!237886) b!410331))

(assert (= (and b!410331 res!237887) b!410332))

(assert (= (and b!410332 res!237888) b!410323))

(assert (= (and b!410323 res!237885) b!410330))

(assert (= (and b!410330 res!237893) b!410321))

(assert (= (and b!410321 res!237883) b!410324))

(assert (= (and b!410324 res!237894) b!410333))

(assert (= (and b!410333 res!237884) b!410322))

(assert (= (and b!410322 res!237891) b!410334))

(assert (= (and b!410334 res!237892) b!410328))

(assert (= (and b!410328 res!237889) b!410326))

(assert (= (and b!410329 condMapEmpty!17382) mapIsEmpty!17382))

(assert (= (and b!410329 (not condMapEmpty!17382)) mapNonEmpty!17382))

(get-info :version)

(assert (= (and mapNonEmpty!17382 ((_ is ValueCellFull!4910) mapValue!17382)) b!410335))

(assert (= (and b!410329 ((_ is ValueCellFull!4910) mapDefault!17382)) b!410325))

(assert (= start!39074 b!410329))

(declare-fun m!400299 () Bool)

(assert (=> b!410332 m!400299))

(declare-fun m!400301 () Bool)

(assert (=> b!410326 m!400301))

(declare-fun m!400303 () Bool)

(assert (=> b!410326 m!400303))

(declare-fun m!400305 () Bool)

(assert (=> b!410326 m!400305))

(declare-fun m!400307 () Bool)

(assert (=> start!39074 m!400307))

(declare-fun m!400309 () Bool)

(assert (=> start!39074 m!400309))

(declare-fun m!400311 () Bool)

(assert (=> b!410334 m!400311))

(declare-fun m!400313 () Bool)

(assert (=> b!410321 m!400313))

(declare-fun m!400315 () Bool)

(assert (=> b!410324 m!400315))

(declare-fun m!400317 () Bool)

(assert (=> b!410323 m!400317))

(declare-fun m!400319 () Bool)

(assert (=> b!410333 m!400319))

(declare-fun m!400321 () Bool)

(assert (=> mapNonEmpty!17382 m!400321))

(declare-fun m!400323 () Bool)

(assert (=> b!410327 m!400323))

(declare-fun m!400325 () Bool)

(assert (=> b!410322 m!400325))

(declare-fun m!400327 () Bool)

(assert (=> b!410322 m!400327))

(check-sat (not start!39074) (not b!410332) (not b!410327) b_and!16715 (not b!410323) (not b!410333) (not b!410326) (not b!410321) tp_is_empty!10507 (not mapNonEmpty!17382) (not b!410322) (not b_next!9355) (not b!410334))
(check-sat b_and!16715 (not b_next!9355))
