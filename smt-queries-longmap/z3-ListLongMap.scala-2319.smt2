; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37362 () Bool)

(assert start!37362)

(declare-fun b_free!8503 () Bool)

(declare-fun b_next!8503 () Bool)

(assert (=> start!37362 (= b_free!8503 (not b_next!8503))))

(declare-fun tp!30224 () Bool)

(declare-fun b_and!15759 () Bool)

(assert (=> start!37362 (= tp!30224 b_and!15759)))

(declare-fun b!379721 () Bool)

(declare-fun e!231001 () Bool)

(declare-fun e!231003 () Bool)

(declare-fun mapRes!15291 () Bool)

(assert (=> b!379721 (= e!231001 (and e!231003 mapRes!15291))))

(declare-fun condMapEmpty!15291 () Bool)

(declare-datatypes ((V!13307 0))(
  ( (V!13308 (val!4620 Int)) )
))
(declare-datatypes ((ValueCell!4232 0))(
  ( (ValueCellFull!4232 (v!6818 V!13307)) (EmptyCell!4232) )
))
(declare-datatypes ((array!22208 0))(
  ( (array!22209 (arr!10572 (Array (_ BitVec 32) ValueCell!4232)) (size!10924 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22208)

(declare-fun mapDefault!15291 () ValueCell!4232)

(assert (=> b!379721 (= condMapEmpty!15291 (= (arr!10572 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4232)) mapDefault!15291)))))

(declare-fun b!379722 () Bool)

(declare-fun res!215411 () Bool)

(declare-fun e!231005 () Bool)

(assert (=> b!379722 (=> (not res!215411) (not e!231005))))

(declare-datatypes ((array!22210 0))(
  ( (array!22211 (arr!10573 (Array (_ BitVec 32) (_ BitVec 64))) (size!10925 (_ BitVec 32))) )
))
(declare-fun lt!177498 () array!22210)

(declare-datatypes ((List!5913 0))(
  ( (Nil!5910) (Cons!5909 (h!6765 (_ BitVec 64)) (t!11055 List!5913)) )
))
(declare-fun arrayNoDuplicates!0 (array!22210 (_ BitVec 32) List!5913) Bool)

(assert (=> b!379722 (= res!215411 (arrayNoDuplicates!0 lt!177498 #b00000000000000000000000000000000 Nil!5910))))

(declare-fun mapNonEmpty!15291 () Bool)

(declare-fun tp!30225 () Bool)

(declare-fun e!231000 () Bool)

(assert (=> mapNonEmpty!15291 (= mapRes!15291 (and tp!30225 e!231000))))

(declare-fun mapValue!15291 () ValueCell!4232)

(declare-fun mapRest!15291 () (Array (_ BitVec 32) ValueCell!4232))

(declare-fun mapKey!15291 () (_ BitVec 32))

(assert (=> mapNonEmpty!15291 (= (arr!10572 _values!506) (store mapRest!15291 mapKey!15291 mapValue!15291))))

(declare-fun b!379723 () Bool)

(declare-fun res!215416 () Bool)

(declare-fun e!231004 () Bool)

(assert (=> b!379723 (=> (not res!215416) (not e!231004))))

(declare-fun _keys!658 () array!22210)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22210 (_ BitVec 32)) Bool)

(assert (=> b!379723 (= res!215416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379724 () Bool)

(declare-fun tp_is_empty!9151 () Bool)

(assert (=> b!379724 (= e!231003 tp_is_empty!9151)))

(declare-fun b!379725 () Bool)

(declare-fun res!215414 () Bool)

(assert (=> b!379725 (=> (not res!215414) (not e!231004))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379725 (= res!215414 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10925 _keys!658))))))

(declare-fun b!379726 () Bool)

(assert (=> b!379726 (= e!231000 tp_is_empty!9151)))

(declare-fun b!379727 () Bool)

(declare-fun res!215418 () Bool)

(assert (=> b!379727 (=> (not res!215418) (not e!231004))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379727 (= res!215418 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379728 () Bool)

(declare-fun res!215410 () Bool)

(assert (=> b!379728 (=> (not res!215410) (not e!231004))))

(assert (=> b!379728 (= res!215410 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5910))))

(declare-fun b!379729 () Bool)

(declare-fun e!231006 () Bool)

(assert (=> b!379729 (= e!231005 (not e!231006))))

(declare-fun res!215415 () Bool)

(assert (=> b!379729 (=> res!215415 e!231006)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379729 (= res!215415 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6076 0))(
  ( (tuple2!6077 (_1!3049 (_ BitVec 64)) (_2!3049 V!13307)) )
))
(declare-datatypes ((List!5914 0))(
  ( (Nil!5911) (Cons!5910 (h!6766 tuple2!6076) (t!11056 List!5914)) )
))
(declare-datatypes ((ListLongMap!4991 0))(
  ( (ListLongMap!4992 (toList!2511 List!5914)) )
))
(declare-fun lt!177491 () ListLongMap!4991)

(declare-fun zeroValue!472 () V!13307)

(declare-fun minValue!472 () V!13307)

(declare-fun getCurrentListMap!1950 (array!22210 array!22208 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) Int) ListLongMap!4991)

(assert (=> b!379729 (= lt!177491 (getCurrentListMap!1950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177501 () array!22208)

(declare-fun lt!177497 () ListLongMap!4991)

(assert (=> b!379729 (= lt!177497 (getCurrentListMap!1950 lt!177498 lt!177501 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177493 () ListLongMap!4991)

(declare-fun lt!177490 () ListLongMap!4991)

(assert (=> b!379729 (and (= lt!177493 lt!177490) (= lt!177490 lt!177493))))

(declare-fun lt!177496 () ListLongMap!4991)

(declare-fun lt!177494 () tuple2!6076)

(declare-fun +!907 (ListLongMap!4991 tuple2!6076) ListLongMap!4991)

(assert (=> b!379729 (= lt!177490 (+!907 lt!177496 lt!177494))))

(declare-fun v!373 () V!13307)

(assert (=> b!379729 (= lt!177494 (tuple2!6077 k0!778 v!373))))

(declare-datatypes ((Unit!11695 0))(
  ( (Unit!11696) )
))
(declare-fun lt!177499 () Unit!11695)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!137 (array!22210 array!22208 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) (_ BitVec 64) V!13307 (_ BitVec 32) Int) Unit!11695)

(assert (=> b!379729 (= lt!177499 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!137 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!797 (array!22210 array!22208 (_ BitVec 32) (_ BitVec 32) V!13307 V!13307 (_ BitVec 32) Int) ListLongMap!4991)

(assert (=> b!379729 (= lt!177493 (getCurrentListMapNoExtraKeys!797 lt!177498 lt!177501 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379729 (= lt!177501 (array!22209 (store (arr!10572 _values!506) i!548 (ValueCellFull!4232 v!373)) (size!10924 _values!506)))))

(assert (=> b!379729 (= lt!177496 (getCurrentListMapNoExtraKeys!797 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379730 () Bool)

(assert (=> b!379730 (= e!231004 e!231005)))

(declare-fun res!215409 () Bool)

(assert (=> b!379730 (=> (not res!215409) (not e!231005))))

(assert (=> b!379730 (= res!215409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177498 mask!970))))

(assert (=> b!379730 (= lt!177498 (array!22211 (store (arr!10573 _keys!658) i!548 k0!778) (size!10925 _keys!658)))))

(declare-fun res!215413 () Bool)

(assert (=> start!37362 (=> (not res!215413) (not e!231004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37362 (= res!215413 (validMask!0 mask!970))))

(assert (=> start!37362 e!231004))

(declare-fun array_inv!7832 (array!22208) Bool)

(assert (=> start!37362 (and (array_inv!7832 _values!506) e!231001)))

(assert (=> start!37362 tp!30224))

(assert (=> start!37362 true))

(assert (=> start!37362 tp_is_empty!9151))

(declare-fun array_inv!7833 (array!22210) Bool)

(assert (=> start!37362 (array_inv!7833 _keys!658)))

(declare-fun b!379731 () Bool)

(declare-fun e!231002 () Bool)

(assert (=> b!379731 (= e!231002 true)))

(declare-fun lt!177502 () ListLongMap!4991)

(declare-fun lt!177492 () ListLongMap!4991)

(assert (=> b!379731 (= lt!177502 (+!907 lt!177492 lt!177494))))

(declare-fun lt!177495 () Unit!11695)

(declare-fun addCommutativeForDiffKeys!318 (ListLongMap!4991 (_ BitVec 64) V!13307 (_ BitVec 64) V!13307) Unit!11695)

(assert (=> b!379731 (= lt!177495 (addCommutativeForDiffKeys!318 lt!177496 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379732 () Bool)

(declare-fun res!215417 () Bool)

(assert (=> b!379732 (=> (not res!215417) (not e!231004))))

(assert (=> b!379732 (= res!215417 (or (= (select (arr!10573 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10573 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379733 () Bool)

(declare-fun res!215419 () Bool)

(assert (=> b!379733 (=> (not res!215419) (not e!231004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379733 (= res!215419 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15291 () Bool)

(assert (=> mapIsEmpty!15291 mapRes!15291))

(declare-fun b!379734 () Bool)

(declare-fun res!215412 () Bool)

(assert (=> b!379734 (=> (not res!215412) (not e!231004))))

(assert (=> b!379734 (= res!215412 (and (= (size!10924 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10925 _keys!658) (size!10924 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379735 () Bool)

(assert (=> b!379735 (= e!231006 e!231002)))

(declare-fun res!215420 () Bool)

(assert (=> b!379735 (=> res!215420 e!231002)))

(assert (=> b!379735 (= res!215420 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379735 (= lt!177491 lt!177492)))

(declare-fun lt!177500 () tuple2!6076)

(assert (=> b!379735 (= lt!177492 (+!907 lt!177496 lt!177500))))

(assert (=> b!379735 (= lt!177497 lt!177502)))

(assert (=> b!379735 (= lt!177502 (+!907 lt!177490 lt!177500))))

(assert (=> b!379735 (= lt!177497 (+!907 lt!177493 lt!177500))))

(assert (=> b!379735 (= lt!177500 (tuple2!6077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37362 res!215413) b!379734))

(assert (= (and b!379734 res!215412) b!379723))

(assert (= (and b!379723 res!215416) b!379728))

(assert (= (and b!379728 res!215410) b!379725))

(assert (= (and b!379725 res!215414) b!379733))

(assert (= (and b!379733 res!215419) b!379732))

(assert (= (and b!379732 res!215417) b!379727))

(assert (= (and b!379727 res!215418) b!379730))

(assert (= (and b!379730 res!215409) b!379722))

(assert (= (and b!379722 res!215411) b!379729))

(assert (= (and b!379729 (not res!215415)) b!379735))

(assert (= (and b!379735 (not res!215420)) b!379731))

(assert (= (and b!379721 condMapEmpty!15291) mapIsEmpty!15291))

(assert (= (and b!379721 (not condMapEmpty!15291)) mapNonEmpty!15291))

(get-info :version)

(assert (= (and mapNonEmpty!15291 ((_ is ValueCellFull!4232) mapValue!15291)) b!379726))

(assert (= (and b!379721 ((_ is ValueCellFull!4232) mapDefault!15291)) b!379724))

(assert (= start!37362 b!379721))

(declare-fun m!376901 () Bool)

(assert (=> start!37362 m!376901))

(declare-fun m!376903 () Bool)

(assert (=> start!37362 m!376903))

(declare-fun m!376905 () Bool)

(assert (=> start!37362 m!376905))

(declare-fun m!376907 () Bool)

(assert (=> b!379722 m!376907))

(declare-fun m!376909 () Bool)

(assert (=> mapNonEmpty!15291 m!376909))

(declare-fun m!376911 () Bool)

(assert (=> b!379730 m!376911))

(declare-fun m!376913 () Bool)

(assert (=> b!379730 m!376913))

(declare-fun m!376915 () Bool)

(assert (=> b!379728 m!376915))

(declare-fun m!376917 () Bool)

(assert (=> b!379731 m!376917))

(declare-fun m!376919 () Bool)

(assert (=> b!379731 m!376919))

(declare-fun m!376921 () Bool)

(assert (=> b!379732 m!376921))

(declare-fun m!376923 () Bool)

(assert (=> b!379723 m!376923))

(declare-fun m!376925 () Bool)

(assert (=> b!379727 m!376925))

(declare-fun m!376927 () Bool)

(assert (=> b!379733 m!376927))

(declare-fun m!376929 () Bool)

(assert (=> b!379735 m!376929))

(declare-fun m!376931 () Bool)

(assert (=> b!379735 m!376931))

(declare-fun m!376933 () Bool)

(assert (=> b!379735 m!376933))

(declare-fun m!376935 () Bool)

(assert (=> b!379729 m!376935))

(declare-fun m!376937 () Bool)

(assert (=> b!379729 m!376937))

(declare-fun m!376939 () Bool)

(assert (=> b!379729 m!376939))

(declare-fun m!376941 () Bool)

(assert (=> b!379729 m!376941))

(declare-fun m!376943 () Bool)

(assert (=> b!379729 m!376943))

(declare-fun m!376945 () Bool)

(assert (=> b!379729 m!376945))

(declare-fun m!376947 () Bool)

(assert (=> b!379729 m!376947))

(check-sat tp_is_empty!9151 (not b!379723) (not b!379727) (not b!379735) (not b!379733) (not b!379729) (not b!379730) (not b!379728) (not b_next!8503) (not b!379722) (not mapNonEmpty!15291) b_and!15759 (not start!37362) (not b!379731))
(check-sat b_and!15759 (not b_next!8503))
