; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39956 () Bool)

(assert start!39956)

(declare-fun b_free!10237 () Bool)

(declare-fun b_next!10237 () Bool)

(assert (=> start!39956 (= b_free!10237 (not b_next!10237))))

(declare-fun tp!36239 () Bool)

(declare-fun b_and!18147 () Bool)

(assert (=> start!39956 (= tp!36239 b_and!18147)))

(declare-fun b!434499 () Bool)

(declare-fun res!255907 () Bool)

(declare-fun e!256788 () Bool)

(assert (=> b!434499 (=> (not res!255907) (not e!256788))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26614 0))(
  ( (array!26615 (arr!12756 (Array (_ BitVec 32) (_ BitVec 64))) (size!13108 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26614)

(assert (=> b!434499 (= res!255907 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13108 _keys!709))))))

(declare-fun b!434500 () Bool)

(declare-fun e!256783 () Bool)

(declare-fun e!256787 () Bool)

(declare-fun mapRes!18705 () Bool)

(assert (=> b!434500 (= e!256783 (and e!256787 mapRes!18705))))

(declare-fun condMapEmpty!18705 () Bool)

(declare-datatypes ((V!16291 0))(
  ( (V!16292 (val!5739 Int)) )
))
(declare-datatypes ((ValueCell!5351 0))(
  ( (ValueCellFull!5351 (v!7987 V!16291)) (EmptyCell!5351) )
))
(declare-datatypes ((array!26616 0))(
  ( (array!26617 (arr!12757 (Array (_ BitVec 32) ValueCell!5351)) (size!13109 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26616)

(declare-fun mapDefault!18705 () ValueCell!5351)

(assert (=> b!434500 (= condMapEmpty!18705 (= (arr!12757 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5351)) mapDefault!18705)))))

(declare-fun b!434502 () Bool)

(declare-datatypes ((Unit!12881 0))(
  ( (Unit!12882) )
))
(declare-fun e!256780 () Unit!12881)

(declare-fun Unit!12883 () Unit!12881)

(assert (=> b!434502 (= e!256780 Unit!12883)))

(declare-fun b!434503 () Bool)

(declare-fun e!256781 () Bool)

(declare-fun e!256782 () Bool)

(assert (=> b!434503 (= e!256781 e!256782)))

(declare-fun res!255905 () Bool)

(assert (=> b!434503 (=> res!255905 e!256782)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!434503 (= res!255905 (= k0!794 (select (arr!12756 _keys!709) from!863)))))

(assert (=> b!434503 (not (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-fun lt!199865 () Unit!12881)

(assert (=> b!434503 (= lt!199865 e!256780)))

(declare-fun c!55668 () Bool)

(assert (=> b!434503 (= c!55668 (= (select (arr!12756 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7496 0))(
  ( (tuple2!7497 (_1!3759 (_ BitVec 64)) (_2!3759 V!16291)) )
))
(declare-datatypes ((List!7487 0))(
  ( (Nil!7484) (Cons!7483 (h!8339 tuple2!7496) (t!13165 List!7487)) )
))
(declare-datatypes ((ListLongMap!6411 0))(
  ( (ListLongMap!6412 (toList!3221 List!7487)) )
))
(declare-fun lt!199856 () ListLongMap!6411)

(declare-fun lt!199864 () ListLongMap!6411)

(assert (=> b!434503 (= lt!199856 lt!199864)))

(declare-fun lt!199867 () ListLongMap!6411)

(declare-fun lt!199869 () tuple2!7496)

(declare-fun +!1426 (ListLongMap!6411 tuple2!7496) ListLongMap!6411)

(assert (=> b!434503 (= lt!199864 (+!1426 lt!199867 lt!199869))))

(declare-fun lt!199857 () V!16291)

(assert (=> b!434503 (= lt!199869 (tuple2!7497 (select (arr!12756 _keys!709) from!863) lt!199857))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6363 (ValueCell!5351 V!16291) V!16291)

(declare-fun dynLambda!830 (Int (_ BitVec 64)) V!16291)

(assert (=> b!434503 (= lt!199857 (get!6363 (select (arr!12757 _values!549) from!863) (dynLambda!830 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434504 () Bool)

(declare-fun res!255909 () Bool)

(assert (=> b!434504 (=> (not res!255909) (not e!256788))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26614 (_ BitVec 32)) Bool)

(assert (=> b!434504 (= res!255909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434505 () Bool)

(declare-fun e!256789 () Bool)

(declare-fun tp_is_empty!11389 () Bool)

(assert (=> b!434505 (= e!256789 tp_is_empty!11389)))

(declare-fun b!434506 () Bool)

(declare-fun res!255902 () Bool)

(assert (=> b!434506 (=> (not res!255902) (not e!256788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434506 (= res!255902 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18705 () Bool)

(declare-fun tp!36240 () Bool)

(assert (=> mapNonEmpty!18705 (= mapRes!18705 (and tp!36240 e!256789))))

(declare-fun mapKey!18705 () (_ BitVec 32))

(declare-fun mapRest!18705 () (Array (_ BitVec 32) ValueCell!5351))

(declare-fun mapValue!18705 () ValueCell!5351)

(assert (=> mapNonEmpty!18705 (= (arr!12757 _values!549) (store mapRest!18705 mapKey!18705 mapValue!18705))))

(declare-fun b!434507 () Bool)

(assert (=> b!434507 (= e!256782 true)))

(declare-fun lt!199859 () ListLongMap!6411)

(declare-fun lt!199855 () tuple2!7496)

(assert (=> b!434507 (= lt!199864 (+!1426 (+!1426 lt!199859 lt!199869) lt!199855))))

(declare-fun lt!199861 () Unit!12881)

(declare-fun v!412 () V!16291)

(declare-fun addCommutativeForDiffKeys!397 (ListLongMap!6411 (_ BitVec 64) V!16291 (_ BitVec 64) V!16291) Unit!12881)

(assert (=> b!434507 (= lt!199861 (addCommutativeForDiffKeys!397 lt!199859 k0!794 v!412 (select (arr!12756 _keys!709) from!863) lt!199857))))

(declare-fun b!434508 () Bool)

(declare-fun res!255900 () Bool)

(declare-fun e!256784 () Bool)

(assert (=> b!434508 (=> (not res!255900) (not e!256784))))

(assert (=> b!434508 (= res!255900 (bvsle from!863 i!563))))

(declare-fun b!434509 () Bool)

(assert (=> b!434509 (= e!256788 e!256784)))

(declare-fun res!255906 () Bool)

(assert (=> b!434509 (=> (not res!255906) (not e!256784))))

(declare-fun lt!199858 () array!26614)

(assert (=> b!434509 (= res!255906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199858 mask!1025))))

(assert (=> b!434509 (= lt!199858 (array!26615 (store (arr!12756 _keys!709) i!563 k0!794) (size!13108 _keys!709)))))

(declare-fun b!434510 () Bool)

(declare-fun res!255908 () Bool)

(assert (=> b!434510 (=> (not res!255908) (not e!256788))))

(declare-fun arrayContainsKey!0 (array!26614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434510 (= res!255908 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434511 () Bool)

(declare-fun Unit!12884 () Unit!12881)

(assert (=> b!434511 (= e!256780 Unit!12884)))

(declare-fun lt!199863 () Unit!12881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26614 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12881)

(assert (=> b!434511 (= lt!199863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434511 false))

(declare-fun b!434512 () Bool)

(declare-fun res!255911 () Bool)

(assert (=> b!434512 (=> (not res!255911) (not e!256784))))

(declare-datatypes ((List!7488 0))(
  ( (Nil!7485) (Cons!7484 (h!8340 (_ BitVec 64)) (t!13166 List!7488)) )
))
(declare-fun arrayNoDuplicates!0 (array!26614 (_ BitVec 32) List!7488) Bool)

(assert (=> b!434512 (= res!255911 (arrayNoDuplicates!0 lt!199858 #b00000000000000000000000000000000 Nil!7485))))

(declare-fun b!434513 () Bool)

(declare-fun res!255899 () Bool)

(assert (=> b!434513 (=> (not res!255899) (not e!256788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434513 (= res!255899 (validKeyInArray!0 k0!794))))

(declare-fun b!434514 () Bool)

(declare-fun e!256786 () Bool)

(assert (=> b!434514 (= e!256786 (not e!256781))))

(declare-fun res!255898 () Bool)

(assert (=> b!434514 (=> res!255898 e!256781)))

(assert (=> b!434514 (= res!255898 (not (validKeyInArray!0 (select (arr!12756 _keys!709) from!863))))))

(declare-fun lt!199860 () ListLongMap!6411)

(assert (=> b!434514 (= lt!199860 lt!199867)))

(assert (=> b!434514 (= lt!199867 (+!1426 lt!199859 lt!199855))))

(declare-fun minValue!515 () V!16291)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16291)

(declare-fun lt!199866 () array!26616)

(declare-fun getCurrentListMapNoExtraKeys!1457 (array!26614 array!26616 (_ BitVec 32) (_ BitVec 32) V!16291 V!16291 (_ BitVec 32) Int) ListLongMap!6411)

(assert (=> b!434514 (= lt!199860 (getCurrentListMapNoExtraKeys!1457 lt!199858 lt!199866 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434514 (= lt!199855 (tuple2!7497 k0!794 v!412))))

(assert (=> b!434514 (= lt!199859 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199868 () Unit!12881)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 (array!26614 array!26616 (_ BitVec 32) (_ BitVec 32) V!16291 V!16291 (_ BitVec 32) (_ BitVec 64) V!16291 (_ BitVec 32) Int) Unit!12881)

(assert (=> b!434514 (= lt!199868 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!255901 () Bool)

(assert (=> start!39956 (=> (not res!255901) (not e!256788))))

(assert (=> start!39956 (= res!255901 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13108 _keys!709))))))

(assert (=> start!39956 e!256788))

(assert (=> start!39956 tp_is_empty!11389))

(assert (=> start!39956 tp!36239))

(assert (=> start!39956 true))

(declare-fun array_inv!9332 (array!26616) Bool)

(assert (=> start!39956 (and (array_inv!9332 _values!549) e!256783)))

(declare-fun array_inv!9333 (array!26614) Bool)

(assert (=> start!39956 (array_inv!9333 _keys!709)))

(declare-fun b!434501 () Bool)

(declare-fun res!255904 () Bool)

(assert (=> b!434501 (=> (not res!255904) (not e!256788))))

(assert (=> b!434501 (= res!255904 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7485))))

(declare-fun b!434515 () Bool)

(assert (=> b!434515 (= e!256784 e!256786)))

(declare-fun res!255903 () Bool)

(assert (=> b!434515 (=> (not res!255903) (not e!256786))))

(assert (=> b!434515 (= res!255903 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434515 (= lt!199856 (getCurrentListMapNoExtraKeys!1457 lt!199858 lt!199866 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434515 (= lt!199866 (array!26617 (store (arr!12757 _values!549) i!563 (ValueCellFull!5351 v!412)) (size!13109 _values!549)))))

(declare-fun lt!199862 () ListLongMap!6411)

(assert (=> b!434515 (= lt!199862 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434516 () Bool)

(assert (=> b!434516 (= e!256787 tp_is_empty!11389)))

(declare-fun b!434517 () Bool)

(declare-fun res!255910 () Bool)

(assert (=> b!434517 (=> (not res!255910) (not e!256788))))

(assert (=> b!434517 (= res!255910 (or (= (select (arr!12756 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12756 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434518 () Bool)

(declare-fun res!255912 () Bool)

(assert (=> b!434518 (=> (not res!255912) (not e!256788))))

(assert (=> b!434518 (= res!255912 (and (= (size!13109 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13108 _keys!709) (size!13109 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18705 () Bool)

(assert (=> mapIsEmpty!18705 mapRes!18705))

(assert (= (and start!39956 res!255901) b!434506))

(assert (= (and b!434506 res!255902) b!434518))

(assert (= (and b!434518 res!255912) b!434504))

(assert (= (and b!434504 res!255909) b!434501))

(assert (= (and b!434501 res!255904) b!434499))

(assert (= (and b!434499 res!255907) b!434513))

(assert (= (and b!434513 res!255899) b!434517))

(assert (= (and b!434517 res!255910) b!434510))

(assert (= (and b!434510 res!255908) b!434509))

(assert (= (and b!434509 res!255906) b!434512))

(assert (= (and b!434512 res!255911) b!434508))

(assert (= (and b!434508 res!255900) b!434515))

(assert (= (and b!434515 res!255903) b!434514))

(assert (= (and b!434514 (not res!255898)) b!434503))

(assert (= (and b!434503 c!55668) b!434511))

(assert (= (and b!434503 (not c!55668)) b!434502))

(assert (= (and b!434503 (not res!255905)) b!434507))

(assert (= (and b!434500 condMapEmpty!18705) mapIsEmpty!18705))

(assert (= (and b!434500 (not condMapEmpty!18705)) mapNonEmpty!18705))

(get-info :version)

(assert (= (and mapNonEmpty!18705 ((_ is ValueCellFull!5351) mapValue!18705)) b!434505))

(assert (= (and b!434500 ((_ is ValueCellFull!5351) mapDefault!18705)) b!434516))

(assert (= start!39956 b!434500))

(declare-fun b_lambda!9347 () Bool)

(assert (=> (not b_lambda!9347) (not b!434503)))

(declare-fun t!13164 () Bool)

(declare-fun tb!3635 () Bool)

(assert (=> (and start!39956 (= defaultEntry!557 defaultEntry!557) t!13164) tb!3635))

(declare-fun result!6805 () Bool)

(assert (=> tb!3635 (= result!6805 tp_is_empty!11389)))

(assert (=> b!434503 t!13164))

(declare-fun b_and!18149 () Bool)

(assert (= b_and!18147 (and (=> t!13164 result!6805) b_and!18149)))

(declare-fun m!422711 () Bool)

(assert (=> b!434509 m!422711))

(declare-fun m!422713 () Bool)

(assert (=> b!434509 m!422713))

(declare-fun m!422715 () Bool)

(assert (=> b!434513 m!422715))

(declare-fun m!422717 () Bool)

(assert (=> b!434517 m!422717))

(declare-fun m!422719 () Bool)

(assert (=> b!434514 m!422719))

(declare-fun m!422721 () Bool)

(assert (=> b!434514 m!422721))

(declare-fun m!422723 () Bool)

(assert (=> b!434514 m!422723))

(declare-fun m!422725 () Bool)

(assert (=> b!434514 m!422725))

(assert (=> b!434514 m!422719))

(declare-fun m!422727 () Bool)

(assert (=> b!434514 m!422727))

(declare-fun m!422729 () Bool)

(assert (=> b!434514 m!422729))

(declare-fun m!422731 () Bool)

(assert (=> b!434515 m!422731))

(declare-fun m!422733 () Bool)

(assert (=> b!434515 m!422733))

(declare-fun m!422735 () Bool)

(assert (=> b!434515 m!422735))

(declare-fun m!422737 () Bool)

(assert (=> mapNonEmpty!18705 m!422737))

(declare-fun m!422739 () Bool)

(assert (=> b!434510 m!422739))

(declare-fun m!422741 () Bool)

(assert (=> b!434511 m!422741))

(declare-fun m!422743 () Bool)

(assert (=> b!434504 m!422743))

(declare-fun m!422745 () Bool)

(assert (=> b!434507 m!422745))

(assert (=> b!434507 m!422745))

(declare-fun m!422747 () Bool)

(assert (=> b!434507 m!422747))

(assert (=> b!434507 m!422719))

(assert (=> b!434507 m!422719))

(declare-fun m!422749 () Bool)

(assert (=> b!434507 m!422749))

(declare-fun m!422751 () Bool)

(assert (=> start!39956 m!422751))

(declare-fun m!422753 () Bool)

(assert (=> start!39956 m!422753))

(assert (=> b!434503 m!422719))

(declare-fun m!422755 () Bool)

(assert (=> b!434503 m!422755))

(declare-fun m!422757 () Bool)

(assert (=> b!434503 m!422757))

(declare-fun m!422759 () Bool)

(assert (=> b!434503 m!422759))

(assert (=> b!434503 m!422759))

(assert (=> b!434503 m!422757))

(declare-fun m!422761 () Bool)

(assert (=> b!434503 m!422761))

(declare-fun m!422763 () Bool)

(assert (=> b!434512 m!422763))

(declare-fun m!422765 () Bool)

(assert (=> b!434501 m!422765))

(declare-fun m!422767 () Bool)

(assert (=> b!434506 m!422767))

(check-sat tp_is_empty!11389 (not b!434515) b_and!18149 (not b!434504) (not b!434513) (not b!434507) (not b!434512) (not mapNonEmpty!18705) (not b!434514) (not b!434509) (not start!39956) (not b!434510) (not b_lambda!9347) (not b!434511) (not b!434501) (not b!434506) (not b_next!10237) (not b!434503))
(check-sat b_and!18149 (not b_next!10237))
