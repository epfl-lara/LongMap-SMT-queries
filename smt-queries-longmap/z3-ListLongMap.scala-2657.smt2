; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39746 () Bool)

(assert start!39746)

(declare-fun b_free!10027 () Bool)

(declare-fun b_next!10027 () Bool)

(assert (=> start!39746 (= b_free!10027 (not b_next!10027))))

(declare-fun tp!35609 () Bool)

(declare-fun b_and!17687 () Bool)

(assert (=> start!39746 (= tp!35609 b_and!17687)))

(declare-fun b!427878 () Bool)

(declare-fun res!251155 () Bool)

(declare-fun e!253593 () Bool)

(assert (=> b!427878 (=> (not res!251155) (not e!253593))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26187 0))(
  ( (array!26188 (arr!12543 (Array (_ BitVec 32) (_ BitVec 64))) (size!12896 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26187)

(assert (=> b!427878 (= res!251155 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12896 _keys!709))))))

(declare-fun b!427879 () Bool)

(declare-fun e!253599 () Bool)

(assert (=> b!427879 (= e!253599 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16011 0))(
  ( (V!16012 (val!5634 Int)) )
))
(declare-datatypes ((tuple2!7412 0))(
  ( (tuple2!7413 (_1!3717 (_ BitVec 64)) (_2!3717 V!16011)) )
))
(declare-datatypes ((List!7414 0))(
  ( (Nil!7411) (Cons!7410 (h!8266 tuple2!7412) (t!12881 List!7414)) )
))
(declare-datatypes ((ListLongMap!6315 0))(
  ( (ListLongMap!6316 (toList!3173 List!7414)) )
))
(declare-fun lt!195381 () ListLongMap!6315)

(declare-datatypes ((ValueCell!5246 0))(
  ( (ValueCellFull!5246 (v!7875 V!16011)) (EmptyCell!5246) )
))
(declare-datatypes ((array!26189 0))(
  ( (array!26190 (arr!12544 (Array (_ BitVec 32) ValueCell!5246)) (size!12897 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26189)

(declare-fun lt!195377 () ListLongMap!6315)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1352 (ListLongMap!6315 tuple2!7412) ListLongMap!6315)

(declare-fun get!6211 (ValueCell!5246 V!16011) V!16011)

(declare-fun dynLambda!751 (Int (_ BitVec 64)) V!16011)

(assert (=> b!427879 (= lt!195381 (+!1352 lt!195377 (tuple2!7413 (select (arr!12543 _keys!709) from!863) (get!6211 (select (arr!12544 _values!549) from!863) (dynLambda!751 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427880 () Bool)

(declare-fun res!251149 () Bool)

(declare-fun e!253596 () Bool)

(assert (=> b!427880 (=> (not res!251149) (not e!253596))))

(assert (=> b!427880 (= res!251149 (bvsle from!863 i!563))))

(declare-fun b!427881 () Bool)

(declare-fun e!253595 () Bool)

(assert (=> b!427881 (= e!253596 e!253595)))

(declare-fun res!251148 () Bool)

(assert (=> b!427881 (=> (not res!251148) (not e!253595))))

(assert (=> b!427881 (= res!251148 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16011)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195376 () array!26189)

(declare-fun lt!195378 () array!26187)

(declare-fun zeroValue!515 () V!16011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1380 (array!26187 array!26189 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) Int) ListLongMap!6315)

(assert (=> b!427881 (= lt!195381 (getCurrentListMapNoExtraKeys!1380 lt!195378 lt!195376 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16011)

(assert (=> b!427881 (= lt!195376 (array!26190 (store (arr!12544 _values!549) i!563 (ValueCellFull!5246 v!412)) (size!12897 _values!549)))))

(declare-fun lt!195382 () ListLongMap!6315)

(assert (=> b!427881 (= lt!195382 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427882 () Bool)

(declare-fun res!251146 () Bool)

(assert (=> b!427882 (=> (not res!251146) (not e!253593))))

(assert (=> b!427882 (= res!251146 (or (= (select (arr!12543 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12543 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!251157 () Bool)

(assert (=> start!39746 (=> (not res!251157) (not e!253593))))

(assert (=> start!39746 (= res!251157 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12896 _keys!709))))))

(assert (=> start!39746 e!253593))

(declare-fun tp_is_empty!11179 () Bool)

(assert (=> start!39746 tp_is_empty!11179))

(assert (=> start!39746 tp!35609))

(assert (=> start!39746 true))

(declare-fun e!253597 () Bool)

(declare-fun array_inv!9170 (array!26189) Bool)

(assert (=> start!39746 (and (array_inv!9170 _values!549) e!253597)))

(declare-fun array_inv!9171 (array!26187) Bool)

(assert (=> start!39746 (array_inv!9171 _keys!709)))

(declare-fun b!427883 () Bool)

(declare-fun res!251144 () Bool)

(assert (=> b!427883 (=> (not res!251144) (not e!253596))))

(declare-datatypes ((List!7415 0))(
  ( (Nil!7412) (Cons!7411 (h!8267 (_ BitVec 64)) (t!12882 List!7415)) )
))
(declare-fun arrayNoDuplicates!0 (array!26187 (_ BitVec 32) List!7415) Bool)

(assert (=> b!427883 (= res!251144 (arrayNoDuplicates!0 lt!195378 #b00000000000000000000000000000000 Nil!7412))))

(declare-fun b!427884 () Bool)

(declare-fun res!251152 () Bool)

(assert (=> b!427884 (=> (not res!251152) (not e!253593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26187 (_ BitVec 32)) Bool)

(assert (=> b!427884 (= res!251152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427885 () Bool)

(declare-fun e!253592 () Bool)

(declare-fun mapRes!18390 () Bool)

(assert (=> b!427885 (= e!253597 (and e!253592 mapRes!18390))))

(declare-fun condMapEmpty!18390 () Bool)

(declare-fun mapDefault!18390 () ValueCell!5246)

(assert (=> b!427885 (= condMapEmpty!18390 (= (arr!12544 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5246)) mapDefault!18390)))))

(declare-fun b!427886 () Bool)

(declare-fun e!253598 () Bool)

(assert (=> b!427886 (= e!253598 tp_is_empty!11179)))

(declare-fun b!427887 () Bool)

(declare-fun res!251150 () Bool)

(assert (=> b!427887 (=> (not res!251150) (not e!253593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427887 (= res!251150 (validMask!0 mask!1025))))

(declare-fun b!427888 () Bool)

(assert (=> b!427888 (= e!253592 tp_is_empty!11179)))

(declare-fun b!427889 () Bool)

(assert (=> b!427889 (= e!253593 e!253596)))

(declare-fun res!251151 () Bool)

(assert (=> b!427889 (=> (not res!251151) (not e!253596))))

(assert (=> b!427889 (= res!251151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195378 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!427889 (= lt!195378 (array!26188 (store (arr!12543 _keys!709) i!563 k0!794) (size!12896 _keys!709)))))

(declare-fun b!427890 () Bool)

(declare-fun res!251153 () Bool)

(assert (=> b!427890 (=> (not res!251153) (not e!253593))))

(assert (=> b!427890 (= res!251153 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7412))))

(declare-fun b!427891 () Bool)

(assert (=> b!427891 (= e!253595 (not e!253599))))

(declare-fun res!251154 () Bool)

(assert (=> b!427891 (=> res!251154 e!253599)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427891 (= res!251154 (not (validKeyInArray!0 (select (arr!12543 _keys!709) from!863))))))

(declare-fun lt!195379 () ListLongMap!6315)

(assert (=> b!427891 (= lt!195379 lt!195377)))

(declare-fun lt!195383 () ListLongMap!6315)

(assert (=> b!427891 (= lt!195377 (+!1352 lt!195383 (tuple2!7413 k0!794 v!412)))))

(assert (=> b!427891 (= lt!195379 (getCurrentListMapNoExtraKeys!1380 lt!195378 lt!195376 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427891 (= lt!195383 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12542 0))(
  ( (Unit!12543) )
))
(declare-fun lt!195380 () Unit!12542)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!519 (array!26187 array!26189 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) (_ BitVec 64) V!16011 (_ BitVec 32) Int) Unit!12542)

(assert (=> b!427891 (= lt!195380 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!519 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427892 () Bool)

(declare-fun res!251147 () Bool)

(assert (=> b!427892 (=> (not res!251147) (not e!253593))))

(declare-fun arrayContainsKey!0 (array!26187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427892 (= res!251147 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18390 () Bool)

(assert (=> mapIsEmpty!18390 mapRes!18390))

(declare-fun b!427893 () Bool)

(declare-fun res!251145 () Bool)

(assert (=> b!427893 (=> (not res!251145) (not e!253593))))

(assert (=> b!427893 (= res!251145 (validKeyInArray!0 k0!794))))

(declare-fun b!427894 () Bool)

(declare-fun res!251156 () Bool)

(assert (=> b!427894 (=> (not res!251156) (not e!253593))))

(assert (=> b!427894 (= res!251156 (and (= (size!12897 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12896 _keys!709) (size!12897 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18390 () Bool)

(declare-fun tp!35610 () Bool)

(assert (=> mapNonEmpty!18390 (= mapRes!18390 (and tp!35610 e!253598))))

(declare-fun mapValue!18390 () ValueCell!5246)

(declare-fun mapRest!18390 () (Array (_ BitVec 32) ValueCell!5246))

(declare-fun mapKey!18390 () (_ BitVec 32))

(assert (=> mapNonEmpty!18390 (= (arr!12544 _values!549) (store mapRest!18390 mapKey!18390 mapValue!18390))))

(assert (= (and start!39746 res!251157) b!427887))

(assert (= (and b!427887 res!251150) b!427894))

(assert (= (and b!427894 res!251156) b!427884))

(assert (= (and b!427884 res!251152) b!427890))

(assert (= (and b!427890 res!251153) b!427878))

(assert (= (and b!427878 res!251155) b!427893))

(assert (= (and b!427893 res!251145) b!427882))

(assert (= (and b!427882 res!251146) b!427892))

(assert (= (and b!427892 res!251147) b!427889))

(assert (= (and b!427889 res!251151) b!427883))

(assert (= (and b!427883 res!251144) b!427880))

(assert (= (and b!427880 res!251149) b!427881))

(assert (= (and b!427881 res!251148) b!427891))

(assert (= (and b!427891 (not res!251154)) b!427879))

(assert (= (and b!427885 condMapEmpty!18390) mapIsEmpty!18390))

(assert (= (and b!427885 (not condMapEmpty!18390)) mapNonEmpty!18390))

(get-info :version)

(assert (= (and mapNonEmpty!18390 ((_ is ValueCellFull!5246) mapValue!18390)) b!427886))

(assert (= (and b!427885 ((_ is ValueCellFull!5246) mapDefault!18390)) b!427888))

(assert (= start!39746 b!427885))

(declare-fun b_lambda!9097 () Bool)

(assert (=> (not b_lambda!9097) (not b!427879)))

(declare-fun t!12880 () Bool)

(declare-fun tb!3425 () Bool)

(assert (=> (and start!39746 (= defaultEntry!557 defaultEntry!557) t!12880) tb!3425))

(declare-fun result!6385 () Bool)

(assert (=> tb!3425 (= result!6385 tp_is_empty!11179)))

(assert (=> b!427879 t!12880))

(declare-fun b_and!17689 () Bool)

(assert (= b_and!17687 (and (=> t!12880 result!6385) b_and!17689)))

(declare-fun m!415875 () Bool)

(assert (=> b!427884 m!415875))

(declare-fun m!415877 () Bool)

(assert (=> start!39746 m!415877))

(declare-fun m!415879 () Bool)

(assert (=> start!39746 m!415879))

(declare-fun m!415881 () Bool)

(assert (=> mapNonEmpty!18390 m!415881))

(declare-fun m!415883 () Bool)

(assert (=> b!427883 m!415883))

(declare-fun m!415885 () Bool)

(assert (=> b!427881 m!415885))

(declare-fun m!415887 () Bool)

(assert (=> b!427881 m!415887))

(declare-fun m!415889 () Bool)

(assert (=> b!427881 m!415889))

(declare-fun m!415891 () Bool)

(assert (=> b!427892 m!415891))

(declare-fun m!415893 () Bool)

(assert (=> b!427889 m!415893))

(declare-fun m!415895 () Bool)

(assert (=> b!427889 m!415895))

(declare-fun m!415897 () Bool)

(assert (=> b!427882 m!415897))

(declare-fun m!415899 () Bool)

(assert (=> b!427879 m!415899))

(declare-fun m!415901 () Bool)

(assert (=> b!427879 m!415901))

(declare-fun m!415903 () Bool)

(assert (=> b!427879 m!415903))

(assert (=> b!427879 m!415901))

(declare-fun m!415905 () Bool)

(assert (=> b!427879 m!415905))

(declare-fun m!415907 () Bool)

(assert (=> b!427879 m!415907))

(assert (=> b!427879 m!415903))

(assert (=> b!427891 m!415899))

(declare-fun m!415909 () Bool)

(assert (=> b!427891 m!415909))

(declare-fun m!415911 () Bool)

(assert (=> b!427891 m!415911))

(assert (=> b!427891 m!415899))

(declare-fun m!415913 () Bool)

(assert (=> b!427891 m!415913))

(declare-fun m!415915 () Bool)

(assert (=> b!427891 m!415915))

(declare-fun m!415917 () Bool)

(assert (=> b!427891 m!415917))

(declare-fun m!415919 () Bool)

(assert (=> b!427890 m!415919))

(declare-fun m!415921 () Bool)

(assert (=> b!427893 m!415921))

(declare-fun m!415923 () Bool)

(assert (=> b!427887 m!415923))

(check-sat (not b!427889) (not b!427884) (not b!427883) (not b!427881) (not start!39746) (not b!427890) (not b!427887) (not b_next!10027) (not b_lambda!9097) (not b!427892) (not b!427893) tp_is_empty!11179 (not mapNonEmpty!18390) (not b!427891) (not b!427879) b_and!17689)
(check-sat b_and!17689 (not b_next!10027))
