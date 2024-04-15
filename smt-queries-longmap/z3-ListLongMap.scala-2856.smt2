; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41152 () Bool)

(assert start!41152)

(declare-fun b_free!11035 () Bool)

(declare-fun b_next!11035 () Bool)

(assert (=> start!41152 (= b_free!11035 (not b_next!11035))))

(declare-fun tp!38941 () Bool)

(declare-fun b_and!19283 () Bool)

(assert (=> start!41152 (= tp!38941 b_and!19283)))

(declare-fun b!459604 () Bool)

(declare-fun res!274752 () Bool)

(declare-fun e!268185 () Bool)

(assert (=> b!459604 (=> (not res!274752) (not e!268185))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459604 (= res!274752 (validKeyInArray!0 k0!794))))

(declare-fun b!459605 () Bool)

(declare-fun e!268181 () Bool)

(assert (=> b!459605 (= e!268185 e!268181)))

(declare-fun res!274750 () Bool)

(assert (=> b!459605 (=> (not res!274750) (not e!268181))))

(declare-datatypes ((array!28543 0))(
  ( (array!28544 (arr!13712 (Array (_ BitVec 32) (_ BitVec 64))) (size!14065 (_ BitVec 32))) )
))
(declare-fun lt!207871 () array!28543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28543 (_ BitVec 32)) Bool)

(assert (=> b!459605 (= res!274750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207871 mask!1025))))

(declare-fun _keys!709 () array!28543)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459605 (= lt!207871 (array!28544 (store (arr!13712 _keys!709) i!563 k0!794) (size!14065 _keys!709)))))

(declare-fun b!459606 () Bool)

(declare-fun e!268177 () Bool)

(declare-fun e!268178 () Bool)

(declare-fun mapRes!20209 () Bool)

(assert (=> b!459606 (= e!268177 (and e!268178 mapRes!20209))))

(declare-fun condMapEmpty!20209 () Bool)

(declare-datatypes ((V!17603 0))(
  ( (V!17604 (val!6231 Int)) )
))
(declare-datatypes ((ValueCell!5843 0))(
  ( (ValueCellFull!5843 (v!8503 V!17603)) (EmptyCell!5843) )
))
(declare-datatypes ((array!28545 0))(
  ( (array!28546 (arr!13713 (Array (_ BitVec 32) ValueCell!5843)) (size!14066 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28545)

(declare-fun mapDefault!20209 () ValueCell!5843)

(assert (=> b!459606 (= condMapEmpty!20209 (= (arr!13713 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5843)) mapDefault!20209)))))

(declare-fun res!274757 () Bool)

(assert (=> start!41152 (=> (not res!274757) (not e!268185))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41152 (= res!274757 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14065 _keys!709))))))

(assert (=> start!41152 e!268185))

(declare-fun tp_is_empty!12373 () Bool)

(assert (=> start!41152 tp_is_empty!12373))

(assert (=> start!41152 tp!38941))

(assert (=> start!41152 true))

(declare-fun array_inv!9982 (array!28545) Bool)

(assert (=> start!41152 (and (array_inv!9982 _values!549) e!268177)))

(declare-fun array_inv!9983 (array!28543) Bool)

(assert (=> start!41152 (array_inv!9983 _keys!709)))

(declare-fun b!459607 () Bool)

(declare-fun res!274749 () Bool)

(assert (=> b!459607 (=> (not res!274749) (not e!268185))))

(declare-fun arrayContainsKey!0 (array!28543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459607 (= res!274749 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459608 () Bool)

(declare-fun res!274758 () Bool)

(assert (=> b!459608 (=> (not res!274758) (not e!268185))))

(assert (=> b!459608 (= res!274758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459609 () Bool)

(declare-fun e!268180 () Bool)

(declare-fun e!268183 () Bool)

(assert (=> b!459609 (= e!268180 (not e!268183))))

(declare-fun res!274755 () Bool)

(assert (=> b!459609 (=> res!274755 e!268183)))

(assert (=> b!459609 (= res!274755 (not (validKeyInArray!0 (select (arr!13712 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8244 0))(
  ( (tuple2!8245 (_1!4133 (_ BitVec 64)) (_2!4133 V!17603)) )
))
(declare-datatypes ((List!8305 0))(
  ( (Nil!8302) (Cons!8301 (h!9157 tuple2!8244) (t!14210 List!8305)) )
))
(declare-datatypes ((ListLongMap!7147 0))(
  ( (ListLongMap!7148 (toList!3589 List!8305)) )
))
(declare-fun lt!207872 () ListLongMap!7147)

(declare-fun lt!207868 () ListLongMap!7147)

(assert (=> b!459609 (= lt!207872 lt!207868)))

(declare-fun lt!207860 () ListLongMap!7147)

(declare-fun lt!207865 () tuple2!8244)

(declare-fun +!1641 (ListLongMap!7147 tuple2!8244) ListLongMap!7147)

(assert (=> b!459609 (= lt!207868 (+!1641 lt!207860 lt!207865))))

(declare-fun minValue!515 () V!17603)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17603)

(declare-fun lt!207858 () array!28545)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1782 (array!28543 array!28545 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) Int) ListLongMap!7147)

(assert (=> b!459609 (= lt!207872 (getCurrentListMapNoExtraKeys!1782 lt!207871 lt!207858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17603)

(assert (=> b!459609 (= lt!207865 (tuple2!8245 k0!794 v!412))))

(assert (=> b!459609 (= lt!207860 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13340 0))(
  ( (Unit!13341) )
))
(declare-fun lt!207864 () Unit!13340)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!773 (array!28543 array!28545 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) (_ BitVec 64) V!17603 (_ BitVec 32) Int) Unit!13340)

(assert (=> b!459609 (= lt!207864 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!773 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459610 () Bool)

(declare-fun e!268176 () Unit!13340)

(declare-fun Unit!13342 () Unit!13340)

(assert (=> b!459610 (= e!268176 Unit!13342)))

(declare-fun mapNonEmpty!20209 () Bool)

(declare-fun tp!38940 () Bool)

(declare-fun e!268184 () Bool)

(assert (=> mapNonEmpty!20209 (= mapRes!20209 (and tp!38940 e!268184))))

(declare-fun mapRest!20209 () (Array (_ BitVec 32) ValueCell!5843))

(declare-fun mapKey!20209 () (_ BitVec 32))

(declare-fun mapValue!20209 () ValueCell!5843)

(assert (=> mapNonEmpty!20209 (= (arr!13713 _values!549) (store mapRest!20209 mapKey!20209 mapValue!20209))))

(declare-fun mapIsEmpty!20209 () Bool)

(assert (=> mapIsEmpty!20209 mapRes!20209))

(declare-fun b!459611 () Bool)

(declare-fun res!274762 () Bool)

(assert (=> b!459611 (=> (not res!274762) (not e!268185))))

(assert (=> b!459611 (= res!274762 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14065 _keys!709))))))

(declare-fun b!459612 () Bool)

(declare-fun res!274760 () Bool)

(assert (=> b!459612 (=> (not res!274760) (not e!268181))))

(assert (=> b!459612 (= res!274760 (bvsle from!863 i!563))))

(declare-fun b!459613 () Bool)

(declare-fun e!268182 () Bool)

(assert (=> b!459613 (= e!268182 true)))

(declare-fun lt!207862 () tuple2!8244)

(declare-fun lt!207863 () ListLongMap!7147)

(assert (=> b!459613 (= lt!207863 (+!1641 (+!1641 lt!207860 lt!207862) lt!207865))))

(declare-fun lt!207870 () V!17603)

(declare-fun lt!207867 () Unit!13340)

(declare-fun addCommutativeForDiffKeys!423 (ListLongMap!7147 (_ BitVec 64) V!17603 (_ BitVec 64) V!17603) Unit!13340)

(assert (=> b!459613 (= lt!207867 (addCommutativeForDiffKeys!423 lt!207860 k0!794 v!412 (select (arr!13712 _keys!709) from!863) lt!207870))))

(declare-fun b!459614 () Bool)

(assert (=> b!459614 (= e!268184 tp_is_empty!12373)))

(declare-fun b!459615 () Bool)

(assert (=> b!459615 (= e!268183 e!268182)))

(declare-fun res!274756 () Bool)

(assert (=> b!459615 (=> res!274756 e!268182)))

(assert (=> b!459615 (= res!274756 (= k0!794 (select (arr!13712 _keys!709) from!863)))))

(assert (=> b!459615 (not (= (select (arr!13712 _keys!709) from!863) k0!794))))

(declare-fun lt!207866 () Unit!13340)

(assert (=> b!459615 (= lt!207866 e!268176)))

(declare-fun c!56430 () Bool)

(assert (=> b!459615 (= c!56430 (= (select (arr!13712 _keys!709) from!863) k0!794))))

(declare-fun lt!207861 () ListLongMap!7147)

(assert (=> b!459615 (= lt!207861 lt!207863)))

(assert (=> b!459615 (= lt!207863 (+!1641 lt!207868 lt!207862))))

(assert (=> b!459615 (= lt!207862 (tuple2!8245 (select (arr!13712 _keys!709) from!863) lt!207870))))

(declare-fun get!6770 (ValueCell!5843 V!17603) V!17603)

(declare-fun dynLambda!901 (Int (_ BitVec 64)) V!17603)

(assert (=> b!459615 (= lt!207870 (get!6770 (select (arr!13713 _values!549) from!863) (dynLambda!901 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459616 () Bool)

(declare-fun res!274754 () Bool)

(assert (=> b!459616 (=> (not res!274754) (not e!268185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459616 (= res!274754 (validMask!0 mask!1025))))

(declare-fun b!459617 () Bool)

(assert (=> b!459617 (= e!268178 tp_is_empty!12373)))

(declare-fun b!459618 () Bool)

(declare-fun Unit!13343 () Unit!13340)

(assert (=> b!459618 (= e!268176 Unit!13343)))

(declare-fun lt!207869 () Unit!13340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13340)

(assert (=> b!459618 (= lt!207869 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459618 false))

(declare-fun b!459619 () Bool)

(declare-fun res!274759 () Bool)

(assert (=> b!459619 (=> (not res!274759) (not e!268185))))

(assert (=> b!459619 (= res!274759 (and (= (size!14066 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14065 _keys!709) (size!14066 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459620 () Bool)

(declare-fun res!274751 () Bool)

(assert (=> b!459620 (=> (not res!274751) (not e!268185))))

(assert (=> b!459620 (= res!274751 (or (= (select (arr!13712 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13712 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459621 () Bool)

(declare-fun res!274761 () Bool)

(assert (=> b!459621 (=> (not res!274761) (not e!268185))))

(declare-datatypes ((List!8306 0))(
  ( (Nil!8303) (Cons!8302 (h!9158 (_ BitVec 64)) (t!14211 List!8306)) )
))
(declare-fun arrayNoDuplicates!0 (array!28543 (_ BitVec 32) List!8306) Bool)

(assert (=> b!459621 (= res!274761 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8303))))

(declare-fun b!459622 () Bool)

(declare-fun res!274748 () Bool)

(assert (=> b!459622 (=> (not res!274748) (not e!268181))))

(assert (=> b!459622 (= res!274748 (arrayNoDuplicates!0 lt!207871 #b00000000000000000000000000000000 Nil!8303))))

(declare-fun b!459623 () Bool)

(assert (=> b!459623 (= e!268181 e!268180)))

(declare-fun res!274753 () Bool)

(assert (=> b!459623 (=> (not res!274753) (not e!268180))))

(assert (=> b!459623 (= res!274753 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!459623 (= lt!207861 (getCurrentListMapNoExtraKeys!1782 lt!207871 lt!207858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459623 (= lt!207858 (array!28546 (store (arr!13713 _values!549) i!563 (ValueCellFull!5843 v!412)) (size!14066 _values!549)))))

(declare-fun lt!207859 () ListLongMap!7147)

(assert (=> b!459623 (= lt!207859 (getCurrentListMapNoExtraKeys!1782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41152 res!274757) b!459616))

(assert (= (and b!459616 res!274754) b!459619))

(assert (= (and b!459619 res!274759) b!459608))

(assert (= (and b!459608 res!274758) b!459621))

(assert (= (and b!459621 res!274761) b!459611))

(assert (= (and b!459611 res!274762) b!459604))

(assert (= (and b!459604 res!274752) b!459620))

(assert (= (and b!459620 res!274751) b!459607))

(assert (= (and b!459607 res!274749) b!459605))

(assert (= (and b!459605 res!274750) b!459622))

(assert (= (and b!459622 res!274748) b!459612))

(assert (= (and b!459612 res!274760) b!459623))

(assert (= (and b!459623 res!274753) b!459609))

(assert (= (and b!459609 (not res!274755)) b!459615))

(assert (= (and b!459615 c!56430) b!459618))

(assert (= (and b!459615 (not c!56430)) b!459610))

(assert (= (and b!459615 (not res!274756)) b!459613))

(assert (= (and b!459606 condMapEmpty!20209) mapIsEmpty!20209))

(assert (= (and b!459606 (not condMapEmpty!20209)) mapNonEmpty!20209))

(get-info :version)

(assert (= (and mapNonEmpty!20209 ((_ is ValueCellFull!5843) mapValue!20209)) b!459614))

(assert (= (and b!459606 ((_ is ValueCellFull!5843) mapDefault!20209)) b!459617))

(assert (= start!41152 b!459606))

(declare-fun b_lambda!9851 () Bool)

(assert (=> (not b_lambda!9851) (not b!459615)))

(declare-fun t!14209 () Bool)

(declare-fun tb!3863 () Bool)

(assert (=> (and start!41152 (= defaultEntry!557 defaultEntry!557) t!14209) tb!3863))

(declare-fun result!7279 () Bool)

(assert (=> tb!3863 (= result!7279 tp_is_empty!12373)))

(assert (=> b!459615 t!14209))

(declare-fun b_and!19285 () Bool)

(assert (= b_and!19283 (and (=> t!14209 result!7279) b_and!19285)))

(declare-fun m!442369 () Bool)

(assert (=> b!459620 m!442369))

(declare-fun m!442371 () Bool)

(assert (=> b!459621 m!442371))

(declare-fun m!442373 () Bool)

(assert (=> b!459613 m!442373))

(assert (=> b!459613 m!442373))

(declare-fun m!442375 () Bool)

(assert (=> b!459613 m!442375))

(declare-fun m!442377 () Bool)

(assert (=> b!459613 m!442377))

(assert (=> b!459613 m!442377))

(declare-fun m!442379 () Bool)

(assert (=> b!459613 m!442379))

(declare-fun m!442381 () Bool)

(assert (=> b!459622 m!442381))

(declare-fun m!442383 () Bool)

(assert (=> b!459604 m!442383))

(assert (=> b!459609 m!442377))

(declare-fun m!442385 () Bool)

(assert (=> b!459609 m!442385))

(declare-fun m!442387 () Bool)

(assert (=> b!459609 m!442387))

(declare-fun m!442389 () Bool)

(assert (=> b!459609 m!442389))

(assert (=> b!459609 m!442377))

(declare-fun m!442391 () Bool)

(assert (=> b!459609 m!442391))

(declare-fun m!442393 () Bool)

(assert (=> b!459609 m!442393))

(declare-fun m!442395 () Bool)

(assert (=> b!459605 m!442395))

(declare-fun m!442397 () Bool)

(assert (=> b!459605 m!442397))

(declare-fun m!442399 () Bool)

(assert (=> b!459607 m!442399))

(declare-fun m!442401 () Bool)

(assert (=> b!459623 m!442401))

(declare-fun m!442403 () Bool)

(assert (=> b!459623 m!442403))

(declare-fun m!442405 () Bool)

(assert (=> b!459623 m!442405))

(declare-fun m!442407 () Bool)

(assert (=> mapNonEmpty!20209 m!442407))

(declare-fun m!442409 () Bool)

(assert (=> b!459616 m!442409))

(declare-fun m!442411 () Bool)

(assert (=> b!459618 m!442411))

(assert (=> b!459615 m!442377))

(declare-fun m!442413 () Bool)

(assert (=> b!459615 m!442413))

(declare-fun m!442415 () Bool)

(assert (=> b!459615 m!442415))

(declare-fun m!442417 () Bool)

(assert (=> b!459615 m!442417))

(assert (=> b!459615 m!442415))

(assert (=> b!459615 m!442413))

(declare-fun m!442419 () Bool)

(assert (=> b!459615 m!442419))

(declare-fun m!442421 () Bool)

(assert (=> b!459608 m!442421))

(declare-fun m!442423 () Bool)

(assert (=> start!41152 m!442423))

(declare-fun m!442425 () Bool)

(assert (=> start!41152 m!442425))

(check-sat tp_is_empty!12373 (not b!459605) (not b_lambda!9851) (not b!459621) (not b!459608) (not b!459613) (not b!459618) (not mapNonEmpty!20209) (not b_next!11035) (not b!459607) (not b!459622) (not b!459623) (not b!459609) (not b!459604) (not b!459615) b_and!19285 (not start!41152) (not b!459616))
(check-sat b_and!19285 (not b_next!11035))
