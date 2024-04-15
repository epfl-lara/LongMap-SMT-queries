; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41122 () Bool)

(assert start!41122)

(declare-fun b_free!11005 () Bool)

(declare-fun b_next!11005 () Bool)

(assert (=> start!41122 (= b_free!11005 (not b_next!11005))))

(declare-fun tp!38851 () Bool)

(declare-fun b_and!19223 () Bool)

(assert (=> start!41122 (= tp!38851 b_and!19223)))

(declare-fun b!458717 () Bool)

(declare-fun res!274118 () Bool)

(declare-fun e!267777 () Bool)

(assert (=> b!458717 (=> (not res!274118) (not e!267777))))

(declare-datatypes ((array!28483 0))(
  ( (array!28484 (arr!13682 (Array (_ BitVec 32) (_ BitVec 64))) (size!14035 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28483)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28483 (_ BitVec 32)) Bool)

(assert (=> b!458717 (= res!274118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458718 () Bool)

(declare-fun res!274117 () Bool)

(assert (=> b!458718 (=> (not res!274117) (not e!267777))))

(declare-datatypes ((List!8285 0))(
  ( (Nil!8282) (Cons!8281 (h!9137 (_ BitVec 64)) (t!14160 List!8285)) )
))
(declare-fun arrayNoDuplicates!0 (array!28483 (_ BitVec 32) List!8285) Bool)

(assert (=> b!458718 (= res!274117 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8282))))

(declare-fun b!458719 () Bool)

(declare-fun res!274129 () Bool)

(assert (=> b!458719 (=> (not res!274129) (not e!267777))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17563 0))(
  ( (V!17564 (val!6216 Int)) )
))
(declare-datatypes ((ValueCell!5828 0))(
  ( (ValueCellFull!5828 (v!8488 V!17563)) (EmptyCell!5828) )
))
(declare-datatypes ((array!28485 0))(
  ( (array!28486 (arr!13683 (Array (_ BitVec 32) ValueCell!5828)) (size!14036 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28485)

(assert (=> b!458719 (= res!274129 (and (= (size!14036 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14035 _keys!709) (size!14036 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458720 () Bool)

(declare-fun res!274124 () Bool)

(declare-fun e!267775 () Bool)

(assert (=> b!458720 (=> (not res!274124) (not e!267775))))

(declare-fun lt!207401 () array!28483)

(assert (=> b!458720 (= res!274124 (arrayNoDuplicates!0 lt!207401 #b00000000000000000000000000000000 Nil!8282))))

(declare-fun b!458721 () Bool)

(declare-fun res!274121 () Bool)

(assert (=> b!458721 (=> (not res!274121) (not e!267775))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458721 (= res!274121 (bvsle from!863 i!563))))

(declare-fun b!458722 () Bool)

(declare-datatypes ((Unit!13303 0))(
  ( (Unit!13304) )
))
(declare-fun e!267774 () Unit!13303)

(declare-fun Unit!13305 () Unit!13303)

(assert (=> b!458722 (= e!267774 Unit!13305)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!207402 () Unit!13303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28483 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13303)

(assert (=> b!458722 (= lt!207402 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!458722 false))

(declare-fun b!458723 () Bool)

(declare-fun res!274119 () Bool)

(assert (=> b!458723 (=> (not res!274119) (not e!267777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458723 (= res!274119 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20164 () Bool)

(declare-fun mapRes!20164 () Bool)

(declare-fun tp!38850 () Bool)

(declare-fun e!267772 () Bool)

(assert (=> mapNonEmpty!20164 (= mapRes!20164 (and tp!38850 e!267772))))

(declare-fun mapKey!20164 () (_ BitVec 32))

(declare-fun mapRest!20164 () (Array (_ BitVec 32) ValueCell!5828))

(declare-fun mapValue!20164 () ValueCell!5828)

(assert (=> mapNonEmpty!20164 (= (arr!13683 _values!549) (store mapRest!20164 mapKey!20164 mapValue!20164))))

(declare-fun res!274123 () Bool)

(assert (=> start!41122 (=> (not res!274123) (not e!267777))))

(assert (=> start!41122 (= res!274123 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14035 _keys!709))))))

(assert (=> start!41122 e!267777))

(declare-fun tp_is_empty!12343 () Bool)

(assert (=> start!41122 tp_is_empty!12343))

(assert (=> start!41122 tp!38851))

(assert (=> start!41122 true))

(declare-fun e!267773 () Bool)

(declare-fun array_inv!9964 (array!28485) Bool)

(assert (=> start!41122 (and (array_inv!9964 _values!549) e!267773)))

(declare-fun array_inv!9965 (array!28483) Bool)

(assert (=> start!41122 (array_inv!9965 _keys!709)))

(declare-fun b!458724 () Bool)

(declare-fun e!267769 () Bool)

(assert (=> b!458724 (= e!267769 (bvslt from!863 (size!14035 _keys!709)))))

(declare-fun lt!207400 () Unit!13303)

(assert (=> b!458724 (= lt!207400 e!267774)))

(declare-fun c!56385 () Bool)

(assert (=> b!458724 (= c!56385 (= (select (arr!13682 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8222 0))(
  ( (tuple2!8223 (_1!4122 (_ BitVec 64)) (_2!4122 V!17563)) )
))
(declare-datatypes ((List!8286 0))(
  ( (Nil!8283) (Cons!8282 (h!9138 tuple2!8222) (t!14161 List!8286)) )
))
(declare-datatypes ((ListLongMap!7125 0))(
  ( (ListLongMap!7126 (toList!3578 List!8286)) )
))
(declare-fun lt!207406 () ListLongMap!7125)

(declare-fun lt!207399 () ListLongMap!7125)

(declare-fun +!1630 (ListLongMap!7125 tuple2!8222) ListLongMap!7125)

(declare-fun get!6750 (ValueCell!5828 V!17563) V!17563)

(declare-fun dynLambda!891 (Int (_ BitVec 64)) V!17563)

(assert (=> b!458724 (= lt!207406 (+!1630 lt!207399 (tuple2!8223 (select (arr!13682 _keys!709) from!863) (get!6750 (select (arr!13683 _values!549) from!863) (dynLambda!891 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458725 () Bool)

(assert (=> b!458725 (= e!267777 e!267775)))

(declare-fun res!274127 () Bool)

(assert (=> b!458725 (=> (not res!274127) (not e!267775))))

(assert (=> b!458725 (= res!274127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207401 mask!1025))))

(assert (=> b!458725 (= lt!207401 (array!28484 (store (arr!13682 _keys!709) i!563 k0!794) (size!14035 _keys!709)))))

(declare-fun mapIsEmpty!20164 () Bool)

(assert (=> mapIsEmpty!20164 mapRes!20164))

(declare-fun b!458726 () Bool)

(assert (=> b!458726 (= e!267772 tp_is_empty!12343)))

(declare-fun b!458727 () Bool)

(declare-fun Unit!13306 () Unit!13303)

(assert (=> b!458727 (= e!267774 Unit!13306)))

(declare-fun b!458728 () Bool)

(declare-fun e!267771 () Bool)

(assert (=> b!458728 (= e!267771 tp_is_empty!12343)))

(declare-fun b!458729 () Bool)

(declare-fun res!274126 () Bool)

(assert (=> b!458729 (=> (not res!274126) (not e!267777))))

(assert (=> b!458729 (= res!274126 (or (= (select (arr!13682 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13682 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458730 () Bool)

(declare-fun e!267776 () Bool)

(assert (=> b!458730 (= e!267775 e!267776)))

(declare-fun res!274122 () Bool)

(assert (=> b!458730 (=> (not res!274122) (not e!267776))))

(assert (=> b!458730 (= res!274122 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17563)

(declare-fun zeroValue!515 () V!17563)

(declare-fun lt!207398 () array!28485)

(declare-fun getCurrentListMapNoExtraKeys!1772 (array!28483 array!28485 (_ BitVec 32) (_ BitVec 32) V!17563 V!17563 (_ BitVec 32) Int) ListLongMap!7125)

(assert (=> b!458730 (= lt!207406 (getCurrentListMapNoExtraKeys!1772 lt!207401 lt!207398 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17563)

(assert (=> b!458730 (= lt!207398 (array!28486 (store (arr!13683 _values!549) i!563 (ValueCellFull!5828 v!412)) (size!14036 _values!549)))))

(declare-fun lt!207405 () ListLongMap!7125)

(assert (=> b!458730 (= lt!207405 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458731 () Bool)

(assert (=> b!458731 (= e!267776 (not e!267769))))

(declare-fun res!274120 () Bool)

(assert (=> b!458731 (=> res!274120 e!267769)))

(assert (=> b!458731 (= res!274120 (not (validKeyInArray!0 (select (arr!13682 _keys!709) from!863))))))

(declare-fun lt!207407 () ListLongMap!7125)

(assert (=> b!458731 (= lt!207407 lt!207399)))

(declare-fun lt!207404 () ListLongMap!7125)

(assert (=> b!458731 (= lt!207399 (+!1630 lt!207404 (tuple2!8223 k0!794 v!412)))))

(assert (=> b!458731 (= lt!207407 (getCurrentListMapNoExtraKeys!1772 lt!207401 lt!207398 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458731 (= lt!207404 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207403 () Unit!13303)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!764 (array!28483 array!28485 (_ BitVec 32) (_ BitVec 32) V!17563 V!17563 (_ BitVec 32) (_ BitVec 64) V!17563 (_ BitVec 32) Int) Unit!13303)

(assert (=> b!458731 (= lt!207403 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458732 () Bool)

(declare-fun res!274116 () Bool)

(assert (=> b!458732 (=> (not res!274116) (not e!267777))))

(assert (=> b!458732 (= res!274116 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14035 _keys!709))))))

(declare-fun b!458733 () Bool)

(declare-fun res!274125 () Bool)

(assert (=> b!458733 (=> (not res!274125) (not e!267777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458733 (= res!274125 (validMask!0 mask!1025))))

(declare-fun b!458734 () Bool)

(declare-fun res!274128 () Bool)

(assert (=> b!458734 (=> (not res!274128) (not e!267777))))

(declare-fun arrayContainsKey!0 (array!28483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458734 (= res!274128 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458735 () Bool)

(assert (=> b!458735 (= e!267773 (and e!267771 mapRes!20164))))

(declare-fun condMapEmpty!20164 () Bool)

(declare-fun mapDefault!20164 () ValueCell!5828)

(assert (=> b!458735 (= condMapEmpty!20164 (= (arr!13683 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5828)) mapDefault!20164)))))

(assert (= (and start!41122 res!274123) b!458733))

(assert (= (and b!458733 res!274125) b!458719))

(assert (= (and b!458719 res!274129) b!458717))

(assert (= (and b!458717 res!274118) b!458718))

(assert (= (and b!458718 res!274117) b!458732))

(assert (= (and b!458732 res!274116) b!458723))

(assert (= (and b!458723 res!274119) b!458729))

(assert (= (and b!458729 res!274126) b!458734))

(assert (= (and b!458734 res!274128) b!458725))

(assert (= (and b!458725 res!274127) b!458720))

(assert (= (and b!458720 res!274124) b!458721))

(assert (= (and b!458721 res!274121) b!458730))

(assert (= (and b!458730 res!274122) b!458731))

(assert (= (and b!458731 (not res!274120)) b!458724))

(assert (= (and b!458724 c!56385) b!458722))

(assert (= (and b!458724 (not c!56385)) b!458727))

(assert (= (and b!458735 condMapEmpty!20164) mapIsEmpty!20164))

(assert (= (and b!458735 (not condMapEmpty!20164)) mapNonEmpty!20164))

(get-info :version)

(assert (= (and mapNonEmpty!20164 ((_ is ValueCellFull!5828) mapValue!20164)) b!458726))

(assert (= (and b!458735 ((_ is ValueCellFull!5828) mapDefault!20164)) b!458728))

(assert (= start!41122 b!458735))

(declare-fun b_lambda!9821 () Bool)

(assert (=> (not b_lambda!9821) (not b!458724)))

(declare-fun t!14159 () Bool)

(declare-fun tb!3833 () Bool)

(assert (=> (and start!41122 (= defaultEntry!557 defaultEntry!557) t!14159) tb!3833))

(declare-fun result!7219 () Bool)

(assert (=> tb!3833 (= result!7219 tp_is_empty!12343)))

(assert (=> b!458724 t!14159))

(declare-fun b_and!19225 () Bool)

(assert (= b_and!19223 (and (=> t!14159 result!7219) b_and!19225)))

(declare-fun m!441589 () Bool)

(assert (=> b!458723 m!441589))

(declare-fun m!441591 () Bool)

(assert (=> b!458720 m!441591))

(declare-fun m!441593 () Bool)

(assert (=> b!458718 m!441593))

(declare-fun m!441595 () Bool)

(assert (=> b!458717 m!441595))

(declare-fun m!441597 () Bool)

(assert (=> b!458725 m!441597))

(declare-fun m!441599 () Bool)

(assert (=> b!458725 m!441599))

(declare-fun m!441601 () Bool)

(assert (=> b!458730 m!441601))

(declare-fun m!441603 () Bool)

(assert (=> b!458730 m!441603))

(declare-fun m!441605 () Bool)

(assert (=> b!458730 m!441605))

(declare-fun m!441607 () Bool)

(assert (=> b!458734 m!441607))

(declare-fun m!441609 () Bool)

(assert (=> mapNonEmpty!20164 m!441609))

(declare-fun m!441611 () Bool)

(assert (=> b!458729 m!441611))

(declare-fun m!441613 () Bool)

(assert (=> b!458724 m!441613))

(declare-fun m!441615 () Bool)

(assert (=> b!458724 m!441615))

(declare-fun m!441617 () Bool)

(assert (=> b!458724 m!441617))

(declare-fun m!441619 () Bool)

(assert (=> b!458724 m!441619))

(assert (=> b!458724 m!441619))

(assert (=> b!458724 m!441617))

(declare-fun m!441621 () Bool)

(assert (=> b!458724 m!441621))

(declare-fun m!441623 () Bool)

(assert (=> start!41122 m!441623))

(declare-fun m!441625 () Bool)

(assert (=> start!41122 m!441625))

(declare-fun m!441627 () Bool)

(assert (=> b!458733 m!441627))

(declare-fun m!441629 () Bool)

(assert (=> b!458722 m!441629))

(assert (=> b!458731 m!441613))

(declare-fun m!441631 () Bool)

(assert (=> b!458731 m!441631))

(declare-fun m!441633 () Bool)

(assert (=> b!458731 m!441633))

(assert (=> b!458731 m!441613))

(declare-fun m!441635 () Bool)

(assert (=> b!458731 m!441635))

(declare-fun m!441637 () Bool)

(assert (=> b!458731 m!441637))

(declare-fun m!441639 () Bool)

(assert (=> b!458731 m!441639))

(check-sat (not b!458731) (not b!458718) (not b!458720) tp_is_empty!12343 (not b!458730) (not b!458717) (not b_next!11005) (not b!458734) b_and!19225 (not start!41122) (not b!458733) (not b!458725) (not b_lambda!9821) (not b!458722) (not b!458723) (not mapNonEmpty!20164) (not b!458724))
(check-sat b_and!19225 (not b_next!11005))
