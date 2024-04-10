; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41046 () Bool)

(assert start!41046)

(declare-fun b_free!10959 () Bool)

(declare-fun b_next!10959 () Bool)

(assert (=> start!41046 (= b_free!10959 (not b_next!10959))))

(declare-fun tp!38706 () Bool)

(declare-fun b_and!19125 () Bool)

(assert (=> start!41046 (= tp!38706 b_and!19125)))

(declare-fun b!457455 () Bool)

(declare-fun res!273139 () Bool)

(declare-fun e!267186 () Bool)

(assert (=> b!457455 (=> (not res!273139) (not e!267186))))

(declare-datatypes ((array!28395 0))(
  ( (array!28396 (arr!13640 (Array (_ BitVec 32) (_ BitVec 64))) (size!13992 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28395)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28395 (_ BitVec 32)) Bool)

(assert (=> b!457455 (= res!273139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457456 () Bool)

(declare-fun res!273142 () Bool)

(assert (=> b!457456 (=> (not res!273142) (not e!267186))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457456 (= res!273142 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13992 _keys!709))))))

(declare-fun mapNonEmpty!20089 () Bool)

(declare-fun mapRes!20089 () Bool)

(declare-fun tp!38707 () Bool)

(declare-fun e!267181 () Bool)

(assert (=> mapNonEmpty!20089 (= mapRes!20089 (and tp!38707 e!267181))))

(declare-fun mapKey!20089 () (_ BitVec 32))

(declare-datatypes ((V!17501 0))(
  ( (V!17502 (val!6193 Int)) )
))
(declare-datatypes ((ValueCell!5805 0))(
  ( (ValueCellFull!5805 (v!8463 V!17501)) (EmptyCell!5805) )
))
(declare-datatypes ((array!28397 0))(
  ( (array!28398 (arr!13641 (Array (_ BitVec 32) ValueCell!5805)) (size!13993 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28397)

(declare-fun mapValue!20089 () ValueCell!5805)

(declare-fun mapRest!20089 () (Array (_ BitVec 32) ValueCell!5805))

(assert (=> mapNonEmpty!20089 (= (arr!13641 _values!549) (store mapRest!20089 mapKey!20089 mapValue!20089))))

(declare-fun b!457457 () Bool)

(declare-fun e!267180 () Bool)

(declare-fun e!267184 () Bool)

(assert (=> b!457457 (= e!267180 e!267184)))

(declare-fun res!273146 () Bool)

(assert (=> b!457457 (=> (not res!273146) (not e!267184))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!457457 (= res!273146 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17501)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17501)

(declare-fun lt!206922 () array!28397)

(declare-fun lt!206923 () array!28395)

(declare-datatypes ((tuple2!8156 0))(
  ( (tuple2!8157 (_1!4089 (_ BitVec 64)) (_2!4089 V!17501)) )
))
(declare-datatypes ((List!8230 0))(
  ( (Nil!8227) (Cons!8226 (h!9082 tuple2!8156) (t!14068 List!8230)) )
))
(declare-datatypes ((ListLongMap!7069 0))(
  ( (ListLongMap!7070 (toList!3550 List!8230)) )
))
(declare-fun lt!206927 () ListLongMap!7069)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1733 (array!28395 array!28397 (_ BitVec 32) (_ BitVec 32) V!17501 V!17501 (_ BitVec 32) Int) ListLongMap!7069)

(assert (=> b!457457 (= lt!206927 (getCurrentListMapNoExtraKeys!1733 lt!206923 lt!206922 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17501)

(assert (=> b!457457 (= lt!206922 (array!28398 (store (arr!13641 _values!549) i!563 (ValueCellFull!5805 v!412)) (size!13993 _values!549)))))

(declare-fun lt!206924 () ListLongMap!7069)

(assert (=> b!457457 (= lt!206924 (getCurrentListMapNoExtraKeys!1733 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457458 () Bool)

(declare-fun res!273145 () Bool)

(assert (=> b!457458 (=> (not res!273145) (not e!267186))))

(declare-datatypes ((List!8231 0))(
  ( (Nil!8228) (Cons!8227 (h!9083 (_ BitVec 64)) (t!14069 List!8231)) )
))
(declare-fun arrayNoDuplicates!0 (array!28395 (_ BitVec 32) List!8231) Bool)

(assert (=> b!457458 (= res!273145 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8228))))

(declare-fun b!457459 () Bool)

(declare-fun e!267182 () Bool)

(declare-fun e!267179 () Bool)

(assert (=> b!457459 (= e!267182 (and e!267179 mapRes!20089))))

(declare-fun condMapEmpty!20089 () Bool)

(declare-fun mapDefault!20089 () ValueCell!5805)

(assert (=> b!457459 (= condMapEmpty!20089 (= (arr!13641 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5805)) mapDefault!20089)))))

(declare-fun mapIsEmpty!20089 () Bool)

(assert (=> mapIsEmpty!20089 mapRes!20089))

(declare-fun b!457460 () Bool)

(declare-fun e!267183 () Bool)

(assert (=> b!457460 (= e!267184 (not e!267183))))

(declare-fun res!273150 () Bool)

(assert (=> b!457460 (=> res!273150 e!267183)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457460 (= res!273150 (not (validKeyInArray!0 (select (arr!13640 _keys!709) from!863))))))

(declare-fun lt!206925 () ListLongMap!7069)

(declare-fun lt!206928 () ListLongMap!7069)

(assert (=> b!457460 (= lt!206925 lt!206928)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206926 () ListLongMap!7069)

(declare-fun +!1586 (ListLongMap!7069 tuple2!8156) ListLongMap!7069)

(assert (=> b!457460 (= lt!206928 (+!1586 lt!206926 (tuple2!8157 k0!794 v!412)))))

(assert (=> b!457460 (= lt!206925 (getCurrentListMapNoExtraKeys!1733 lt!206923 lt!206922 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457460 (= lt!206926 (getCurrentListMapNoExtraKeys!1733 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13294 0))(
  ( (Unit!13295) )
))
(declare-fun lt!206921 () Unit!13294)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!746 (array!28395 array!28397 (_ BitVec 32) (_ BitVec 32) V!17501 V!17501 (_ BitVec 32) (_ BitVec 64) V!17501 (_ BitVec 32) Int) Unit!13294)

(assert (=> b!457460 (= lt!206921 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457461 () Bool)

(declare-fun tp_is_empty!12297 () Bool)

(assert (=> b!457461 (= e!267181 tp_is_empty!12297)))

(declare-fun b!457462 () Bool)

(assert (=> b!457462 (= e!267183 (bvslt from!863 (size!13992 _keys!709)))))

(declare-fun get!6713 (ValueCell!5805 V!17501) V!17501)

(declare-fun dynLambda!877 (Int (_ BitVec 64)) V!17501)

(assert (=> b!457462 (= lt!206927 (+!1586 lt!206928 (tuple2!8157 (select (arr!13640 _keys!709) from!863) (get!6713 (select (arr!13641 _values!549) from!863) (dynLambda!877 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!273138 () Bool)

(assert (=> start!41046 (=> (not res!273138) (not e!267186))))

(assert (=> start!41046 (= res!273138 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13992 _keys!709))))))

(assert (=> start!41046 e!267186))

(assert (=> start!41046 tp_is_empty!12297))

(assert (=> start!41046 tp!38706))

(assert (=> start!41046 true))

(declare-fun array_inv!9876 (array!28397) Bool)

(assert (=> start!41046 (and (array_inv!9876 _values!549) e!267182)))

(declare-fun array_inv!9877 (array!28395) Bool)

(assert (=> start!41046 (array_inv!9877 _keys!709)))

(declare-fun b!457463 () Bool)

(declare-fun res!273140 () Bool)

(assert (=> b!457463 (=> (not res!273140) (not e!267186))))

(assert (=> b!457463 (= res!273140 (or (= (select (arr!13640 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13640 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457464 () Bool)

(declare-fun res!273149 () Bool)

(assert (=> b!457464 (=> (not res!273149) (not e!267180))))

(assert (=> b!457464 (= res!273149 (arrayNoDuplicates!0 lt!206923 #b00000000000000000000000000000000 Nil!8228))))

(declare-fun b!457465 () Bool)

(declare-fun res!273147 () Bool)

(assert (=> b!457465 (=> (not res!273147) (not e!267186))))

(assert (=> b!457465 (= res!273147 (and (= (size!13993 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13992 _keys!709) (size!13993 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457466 () Bool)

(declare-fun res!273141 () Bool)

(assert (=> b!457466 (=> (not res!273141) (not e!267186))))

(declare-fun arrayContainsKey!0 (array!28395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457466 (= res!273141 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457467 () Bool)

(declare-fun res!273137 () Bool)

(assert (=> b!457467 (=> (not res!273137) (not e!267186))))

(assert (=> b!457467 (= res!273137 (validKeyInArray!0 k0!794))))

(declare-fun b!457468 () Bool)

(assert (=> b!457468 (= e!267179 tp_is_empty!12297)))

(declare-fun b!457469 () Bool)

(assert (=> b!457469 (= e!267186 e!267180)))

(declare-fun res!273143 () Bool)

(assert (=> b!457469 (=> (not res!273143) (not e!267180))))

(assert (=> b!457469 (= res!273143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206923 mask!1025))))

(assert (=> b!457469 (= lt!206923 (array!28396 (store (arr!13640 _keys!709) i!563 k0!794) (size!13992 _keys!709)))))

(declare-fun b!457470 () Bool)

(declare-fun res!273144 () Bool)

(assert (=> b!457470 (=> (not res!273144) (not e!267186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457470 (= res!273144 (validMask!0 mask!1025))))

(declare-fun b!457471 () Bool)

(declare-fun res!273148 () Bool)

(assert (=> b!457471 (=> (not res!273148) (not e!267180))))

(assert (=> b!457471 (= res!273148 (bvsle from!863 i!563))))

(assert (= (and start!41046 res!273138) b!457470))

(assert (= (and b!457470 res!273144) b!457465))

(assert (= (and b!457465 res!273147) b!457455))

(assert (= (and b!457455 res!273139) b!457458))

(assert (= (and b!457458 res!273145) b!457456))

(assert (= (and b!457456 res!273142) b!457467))

(assert (= (and b!457467 res!273137) b!457463))

(assert (= (and b!457463 res!273140) b!457466))

(assert (= (and b!457466 res!273141) b!457469))

(assert (= (and b!457469 res!273143) b!457464))

(assert (= (and b!457464 res!273149) b!457471))

(assert (= (and b!457471 res!273148) b!457457))

(assert (= (and b!457457 res!273146) b!457460))

(assert (= (and b!457460 (not res!273150)) b!457462))

(assert (= (and b!457459 condMapEmpty!20089) mapIsEmpty!20089))

(assert (= (and b!457459 (not condMapEmpty!20089)) mapNonEmpty!20089))

(get-info :version)

(assert (= (and mapNonEmpty!20089 ((_ is ValueCellFull!5805) mapValue!20089)) b!457461))

(assert (= (and b!457459 ((_ is ValueCellFull!5805) mapDefault!20089)) b!457468))

(assert (= start!41046 b!457459))

(declare-fun b_lambda!9725 () Bool)

(assert (=> (not b_lambda!9725) (not b!457462)))

(declare-fun t!14067 () Bool)

(declare-fun tb!3795 () Bool)

(assert (=> (and start!41046 (= defaultEntry!557 defaultEntry!557) t!14067) tb!3795))

(declare-fun result!7131 () Bool)

(assert (=> tb!3795 (= result!7131 tp_is_empty!12297)))

(assert (=> b!457462 t!14067))

(declare-fun b_and!19127 () Bool)

(assert (= b_and!19125 (and (=> t!14067 result!7131) b_and!19127)))

(declare-fun m!440811 () Bool)

(assert (=> b!457466 m!440811))

(declare-fun m!440813 () Bool)

(assert (=> start!41046 m!440813))

(declare-fun m!440815 () Bool)

(assert (=> start!41046 m!440815))

(declare-fun m!440817 () Bool)

(assert (=> b!457458 m!440817))

(declare-fun m!440819 () Bool)

(assert (=> b!457464 m!440819))

(declare-fun m!440821 () Bool)

(assert (=> b!457470 m!440821))

(declare-fun m!440823 () Bool)

(assert (=> b!457460 m!440823))

(declare-fun m!440825 () Bool)

(assert (=> b!457460 m!440825))

(declare-fun m!440827 () Bool)

(assert (=> b!457460 m!440827))

(declare-fun m!440829 () Bool)

(assert (=> b!457460 m!440829))

(assert (=> b!457460 m!440823))

(declare-fun m!440831 () Bool)

(assert (=> b!457460 m!440831))

(declare-fun m!440833 () Bool)

(assert (=> b!457460 m!440833))

(declare-fun m!440835 () Bool)

(assert (=> b!457467 m!440835))

(declare-fun m!440837 () Bool)

(assert (=> b!457463 m!440837))

(declare-fun m!440839 () Bool)

(assert (=> b!457455 m!440839))

(declare-fun m!440841 () Bool)

(assert (=> b!457469 m!440841))

(declare-fun m!440843 () Bool)

(assert (=> b!457469 m!440843))

(declare-fun m!440845 () Bool)

(assert (=> mapNonEmpty!20089 m!440845))

(assert (=> b!457462 m!440823))

(declare-fun m!440847 () Bool)

(assert (=> b!457462 m!440847))

(declare-fun m!440849 () Bool)

(assert (=> b!457462 m!440849))

(declare-fun m!440851 () Bool)

(assert (=> b!457462 m!440851))

(assert (=> b!457462 m!440851))

(assert (=> b!457462 m!440849))

(declare-fun m!440853 () Bool)

(assert (=> b!457462 m!440853))

(declare-fun m!440855 () Bool)

(assert (=> b!457457 m!440855))

(declare-fun m!440857 () Bool)

(assert (=> b!457457 m!440857))

(declare-fun m!440859 () Bool)

(assert (=> b!457457 m!440859))

(check-sat (not b!457466) (not b!457462) (not b!457467) b_and!19127 (not start!41046) (not b!457455) (not b!457458) tp_is_empty!12297 (not mapNonEmpty!20089) (not b!457470) (not b_lambda!9725) (not b!457469) (not b!457464) (not b!457460) (not b!457457) (not b_next!10959))
(check-sat b_and!19127 (not b_next!10959))
