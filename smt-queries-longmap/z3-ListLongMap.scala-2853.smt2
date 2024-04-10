; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41150 () Bool)

(assert start!41150)

(declare-fun b_free!11019 () Bool)

(declare-fun b_next!11019 () Bool)

(assert (=> start!41150 (= b_free!11019 (not b_next!11019))))

(declare-fun tp!38893 () Bool)

(declare-fun b_and!19277 () Bool)

(assert (=> start!41150 (= tp!38893 b_and!19277)))

(declare-fun b!459401 () Bool)

(declare-fun res!274540 () Bool)

(declare-fun e!268137 () Bool)

(assert (=> b!459401 (=> (not res!274540) (not e!268137))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459401 (= res!274540 (validKeyInArray!0 k0!794))))

(declare-fun b!459402 () Bool)

(declare-fun e!268135 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28515 0))(
  ( (array!28516 (arr!13698 (Array (_ BitVec 32) (_ BitVec 64))) (size!14050 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28515)

(assert (=> b!459402 (= e!268135 (bvslt from!863 (size!14050 _keys!709)))))

(assert (=> b!459402 (not (= (select (arr!13698 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13351 0))(
  ( (Unit!13352) )
))
(declare-fun lt!207846 () Unit!13351)

(declare-fun e!268138 () Unit!13351)

(assert (=> b!459402 (= lt!207846 e!268138)))

(declare-fun c!56477 () Bool)

(assert (=> b!459402 (= c!56477 (= (select (arr!13698 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!17581 0))(
  ( (V!17582 (val!6223 Int)) )
))
(declare-datatypes ((tuple2!8208 0))(
  ( (tuple2!8209 (_1!4115 (_ BitVec 64)) (_2!4115 V!17581)) )
))
(declare-datatypes ((List!8278 0))(
  ( (Nil!8275) (Cons!8274 (h!9130 tuple2!8208) (t!14176 List!8278)) )
))
(declare-datatypes ((ListLongMap!7121 0))(
  ( (ListLongMap!7122 (toList!3576 List!8278)) )
))
(declare-fun lt!207851 () ListLongMap!7121)

(declare-datatypes ((ValueCell!5835 0))(
  ( (ValueCellFull!5835 (v!8501 V!17581)) (EmptyCell!5835) )
))
(declare-datatypes ((array!28517 0))(
  ( (array!28518 (arr!13699 (Array (_ BitVec 32) ValueCell!5835)) (size!14051 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28517)

(declare-fun lt!207842 () ListLongMap!7121)

(declare-fun +!1612 (ListLongMap!7121 tuple2!8208) ListLongMap!7121)

(declare-fun get!6758 (ValueCell!5835 V!17581) V!17581)

(declare-fun dynLambda!898 (Int (_ BitVec 64)) V!17581)

(assert (=> b!459402 (= lt!207851 (+!1612 lt!207842 (tuple2!8209 (select (arr!13698 _keys!709) from!863) (get!6758 (select (arr!13699 _values!549) from!863) (dynLambda!898 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459403 () Bool)

(declare-fun e!268133 () Bool)

(assert (=> b!459403 (= e!268137 e!268133)))

(declare-fun res!274542 () Bool)

(assert (=> b!459403 (=> (not res!274542) (not e!268133))))

(declare-fun lt!207850 () array!28515)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28515 (_ BitVec 32)) Bool)

(assert (=> b!459403 (= res!274542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207850 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459403 (= lt!207850 (array!28516 (store (arr!13698 _keys!709) i!563 k0!794) (size!14050 _keys!709)))))

(declare-fun b!459405 () Bool)

(declare-fun e!268140 () Bool)

(assert (=> b!459405 (= e!268140 (not e!268135))))

(declare-fun res!274544 () Bool)

(assert (=> b!459405 (=> res!274544 e!268135)))

(assert (=> b!459405 (= res!274544 (not (validKeyInArray!0 (select (arr!13698 _keys!709) from!863))))))

(declare-fun lt!207848 () ListLongMap!7121)

(assert (=> b!459405 (= lt!207848 lt!207842)))

(declare-fun lt!207849 () ListLongMap!7121)

(declare-fun v!412 () V!17581)

(assert (=> b!459405 (= lt!207842 (+!1612 lt!207849 (tuple2!8209 k0!794 v!412)))))

(declare-fun minValue!515 () V!17581)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17581)

(declare-fun lt!207845 () array!28517)

(declare-fun getCurrentListMapNoExtraKeys!1756 (array!28515 array!28517 (_ BitVec 32) (_ BitVec 32) V!17581 V!17581 (_ BitVec 32) Int) ListLongMap!7121)

(assert (=> b!459405 (= lt!207848 (getCurrentListMapNoExtraKeys!1756 lt!207850 lt!207845 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459405 (= lt!207849 (getCurrentListMapNoExtraKeys!1756 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207843 () Unit!13351)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!768 (array!28515 array!28517 (_ BitVec 32) (_ BitVec 32) V!17581 V!17581 (_ BitVec 32) (_ BitVec 64) V!17581 (_ BitVec 32) Int) Unit!13351)

(assert (=> b!459405 (= lt!207843 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!768 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459406 () Bool)

(assert (=> b!459406 (= e!268133 e!268140)))

(declare-fun res!274550 () Bool)

(assert (=> b!459406 (=> (not res!274550) (not e!268140))))

(assert (=> b!459406 (= res!274550 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!459406 (= lt!207851 (getCurrentListMapNoExtraKeys!1756 lt!207850 lt!207845 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459406 (= lt!207845 (array!28518 (store (arr!13699 _values!549) i!563 (ValueCellFull!5835 v!412)) (size!14051 _values!549)))))

(declare-fun lt!207847 () ListLongMap!7121)

(assert (=> b!459406 (= lt!207847 (getCurrentListMapNoExtraKeys!1756 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459407 () Bool)

(declare-fun res!274546 () Bool)

(assert (=> b!459407 (=> (not res!274546) (not e!268137))))

(declare-fun arrayContainsKey!0 (array!28515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459407 (= res!274546 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459408 () Bool)

(declare-fun res!274539 () Bool)

(assert (=> b!459408 (=> (not res!274539) (not e!268137))))

(assert (=> b!459408 (= res!274539 (or (= (select (arr!13698 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13698 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459409 () Bool)

(declare-fun res!274545 () Bool)

(assert (=> b!459409 (=> (not res!274545) (not e!268137))))

(assert (=> b!459409 (= res!274545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459410 () Bool)

(declare-fun Unit!13353 () Unit!13351)

(assert (=> b!459410 (= e!268138 Unit!13353)))

(declare-fun lt!207844 () Unit!13351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13351)

(assert (=> b!459410 (= lt!207844 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459410 false))

(declare-fun b!459411 () Bool)

(declare-fun res!274549 () Bool)

(assert (=> b!459411 (=> (not res!274549) (not e!268133))))

(assert (=> b!459411 (= res!274549 (bvsle from!863 i!563))))

(declare-fun b!459412 () Bool)

(declare-fun e!268136 () Bool)

(declare-fun e!268139 () Bool)

(declare-fun mapRes!20185 () Bool)

(assert (=> b!459412 (= e!268136 (and e!268139 mapRes!20185))))

(declare-fun condMapEmpty!20185 () Bool)

(declare-fun mapDefault!20185 () ValueCell!5835)

(assert (=> b!459412 (= condMapEmpty!20185 (= (arr!13699 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5835)) mapDefault!20185)))))

(declare-fun b!459413 () Bool)

(declare-fun res!274552 () Bool)

(assert (=> b!459413 (=> (not res!274552) (not e!268137))))

(assert (=> b!459413 (= res!274552 (and (= (size!14051 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14050 _keys!709) (size!14051 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459414 () Bool)

(declare-fun res!274543 () Bool)

(assert (=> b!459414 (=> (not res!274543) (not e!268137))))

(declare-datatypes ((List!8279 0))(
  ( (Nil!8276) (Cons!8275 (h!9131 (_ BitVec 64)) (t!14177 List!8279)) )
))
(declare-fun arrayNoDuplicates!0 (array!28515 (_ BitVec 32) List!8279) Bool)

(assert (=> b!459414 (= res!274543 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8276))))

(declare-fun mapIsEmpty!20185 () Bool)

(assert (=> mapIsEmpty!20185 mapRes!20185))

(declare-fun res!274551 () Bool)

(assert (=> start!41150 (=> (not res!274551) (not e!268137))))

(assert (=> start!41150 (= res!274551 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14050 _keys!709))))))

(assert (=> start!41150 e!268137))

(declare-fun tp_is_empty!12357 () Bool)

(assert (=> start!41150 tp_is_empty!12357))

(assert (=> start!41150 tp!38893))

(assert (=> start!41150 true))

(declare-fun array_inv!9908 (array!28517) Bool)

(assert (=> start!41150 (and (array_inv!9908 _values!549) e!268136)))

(declare-fun array_inv!9909 (array!28515) Bool)

(assert (=> start!41150 (array_inv!9909 _keys!709)))

(declare-fun b!459404 () Bool)

(declare-fun res!274541 () Bool)

(assert (=> b!459404 (=> (not res!274541) (not e!268137))))

(assert (=> b!459404 (= res!274541 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14050 _keys!709))))))

(declare-fun b!459415 () Bool)

(assert (=> b!459415 (= e!268139 tp_is_empty!12357)))

(declare-fun mapNonEmpty!20185 () Bool)

(declare-fun tp!38892 () Bool)

(declare-fun e!268134 () Bool)

(assert (=> mapNonEmpty!20185 (= mapRes!20185 (and tp!38892 e!268134))))

(declare-fun mapValue!20185 () ValueCell!5835)

(declare-fun mapRest!20185 () (Array (_ BitVec 32) ValueCell!5835))

(declare-fun mapKey!20185 () (_ BitVec 32))

(assert (=> mapNonEmpty!20185 (= (arr!13699 _values!549) (store mapRest!20185 mapKey!20185 mapValue!20185))))

(declare-fun b!459416 () Bool)

(assert (=> b!459416 (= e!268134 tp_is_empty!12357)))

(declare-fun b!459417 () Bool)

(declare-fun Unit!13354 () Unit!13351)

(assert (=> b!459417 (= e!268138 Unit!13354)))

(declare-fun b!459418 () Bool)

(declare-fun res!274548 () Bool)

(assert (=> b!459418 (=> (not res!274548) (not e!268137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459418 (= res!274548 (validMask!0 mask!1025))))

(declare-fun b!459419 () Bool)

(declare-fun res!274547 () Bool)

(assert (=> b!459419 (=> (not res!274547) (not e!268133))))

(assert (=> b!459419 (= res!274547 (arrayNoDuplicates!0 lt!207850 #b00000000000000000000000000000000 Nil!8276))))

(assert (= (and start!41150 res!274551) b!459418))

(assert (= (and b!459418 res!274548) b!459413))

(assert (= (and b!459413 res!274552) b!459409))

(assert (= (and b!459409 res!274545) b!459414))

(assert (= (and b!459414 res!274543) b!459404))

(assert (= (and b!459404 res!274541) b!459401))

(assert (= (and b!459401 res!274540) b!459408))

(assert (= (and b!459408 res!274539) b!459407))

(assert (= (and b!459407 res!274546) b!459403))

(assert (= (and b!459403 res!274542) b!459419))

(assert (= (and b!459419 res!274547) b!459411))

(assert (= (and b!459411 res!274549) b!459406))

(assert (= (and b!459406 res!274550) b!459405))

(assert (= (and b!459405 (not res!274544)) b!459402))

(assert (= (and b!459402 c!56477) b!459410))

(assert (= (and b!459402 (not c!56477)) b!459417))

(assert (= (and b!459412 condMapEmpty!20185) mapIsEmpty!20185))

(assert (= (and b!459412 (not condMapEmpty!20185)) mapNonEmpty!20185))

(get-info :version)

(assert (= (and mapNonEmpty!20185 ((_ is ValueCellFull!5835) mapValue!20185)) b!459416))

(assert (= (and b!459412 ((_ is ValueCellFull!5835) mapDefault!20185)) b!459415))

(assert (= start!41150 b!459412))

(declare-fun b_lambda!9853 () Bool)

(assert (=> (not b_lambda!9853) (not b!459402)))

(declare-fun t!14175 () Bool)

(declare-fun tb!3855 () Bool)

(assert (=> (and start!41150 (= defaultEntry!557 defaultEntry!557) t!14175) tb!3855))

(declare-fun result!7255 () Bool)

(assert (=> tb!3855 (= result!7255 tp_is_empty!12357)))

(assert (=> b!459402 t!14175))

(declare-fun b_and!19279 () Bool)

(assert (= b_and!19277 (and (=> t!14175 result!7255) b_and!19279)))

(declare-fun m!442687 () Bool)

(assert (=> start!41150 m!442687))

(declare-fun m!442689 () Bool)

(assert (=> start!41150 m!442689))

(declare-fun m!442691 () Bool)

(assert (=> b!459410 m!442691))

(declare-fun m!442693 () Bool)

(assert (=> b!459414 m!442693))

(declare-fun m!442695 () Bool)

(assert (=> mapNonEmpty!20185 m!442695))

(declare-fun m!442697 () Bool)

(assert (=> b!459407 m!442697))

(declare-fun m!442699 () Bool)

(assert (=> b!459419 m!442699))

(declare-fun m!442701 () Bool)

(assert (=> b!459409 m!442701))

(declare-fun m!442703 () Bool)

(assert (=> b!459408 m!442703))

(declare-fun m!442705 () Bool)

(assert (=> b!459405 m!442705))

(declare-fun m!442707 () Bool)

(assert (=> b!459405 m!442707))

(declare-fun m!442709 () Bool)

(assert (=> b!459405 m!442709))

(declare-fun m!442711 () Bool)

(assert (=> b!459405 m!442711))

(assert (=> b!459405 m!442705))

(declare-fun m!442713 () Bool)

(assert (=> b!459405 m!442713))

(declare-fun m!442715 () Bool)

(assert (=> b!459405 m!442715))

(declare-fun m!442717 () Bool)

(assert (=> b!459401 m!442717))

(declare-fun m!442719 () Bool)

(assert (=> b!459403 m!442719))

(declare-fun m!442721 () Bool)

(assert (=> b!459403 m!442721))

(assert (=> b!459402 m!442705))

(declare-fun m!442723 () Bool)

(assert (=> b!459402 m!442723))

(declare-fun m!442725 () Bool)

(assert (=> b!459402 m!442725))

(declare-fun m!442727 () Bool)

(assert (=> b!459402 m!442727))

(assert (=> b!459402 m!442727))

(assert (=> b!459402 m!442725))

(declare-fun m!442729 () Bool)

(assert (=> b!459402 m!442729))

(declare-fun m!442731 () Bool)

(assert (=> b!459406 m!442731))

(declare-fun m!442733 () Bool)

(assert (=> b!459406 m!442733))

(declare-fun m!442735 () Bool)

(assert (=> b!459406 m!442735))

(declare-fun m!442737 () Bool)

(assert (=> b!459418 m!442737))

(check-sat (not b_lambda!9853) (not mapNonEmpty!20185) (not b!459403) (not b!459410) b_and!19279 (not b!459418) (not b!459406) (not b!459419) (not b!459409) tp_is_empty!12357 (not b!459401) (not b!459402) (not b_next!11019) (not start!41150) (not b!459407) (not b!459405) (not b!459414))
(check-sat b_and!19279 (not b_next!11019))
