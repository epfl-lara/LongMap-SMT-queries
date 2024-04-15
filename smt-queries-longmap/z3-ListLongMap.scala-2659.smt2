; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39758 () Bool)

(assert start!39758)

(declare-fun b_free!10039 () Bool)

(declare-fun b_next!10039 () Bool)

(assert (=> start!39758 (= b_free!10039 (not b_next!10039))))

(declare-fun tp!35646 () Bool)

(declare-fun b_and!17711 () Bool)

(assert (=> start!39758 (= tp!35646 b_and!17711)))

(declare-fun b!428218 () Bool)

(declare-fun res!251403 () Bool)

(declare-fun e!253751 () Bool)

(assert (=> b!428218 (=> (not res!251403) (not e!253751))))

(declare-datatypes ((array!26211 0))(
  ( (array!26212 (arr!12555 (Array (_ BitVec 32) (_ BitVec 64))) (size!12908 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26211)

(declare-datatypes ((List!7424 0))(
  ( (Nil!7421) (Cons!7420 (h!8276 (_ BitVec 64)) (t!12903 List!7424)) )
))
(declare-fun arrayNoDuplicates!0 (array!26211 (_ BitVec 32) List!7424) Bool)

(assert (=> b!428218 (= res!251403 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7421))))

(declare-fun res!251408 () Bool)

(assert (=> start!39758 (=> (not res!251408) (not e!253751))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39758 (= res!251408 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12908 _keys!709))))))

(assert (=> start!39758 e!253751))

(declare-fun tp_is_empty!11191 () Bool)

(assert (=> start!39758 tp_is_empty!11191))

(assert (=> start!39758 tp!35646))

(assert (=> start!39758 true))

(declare-datatypes ((V!16027 0))(
  ( (V!16028 (val!5640 Int)) )
))
(declare-datatypes ((ValueCell!5252 0))(
  ( (ValueCellFull!5252 (v!7881 V!16027)) (EmptyCell!5252) )
))
(declare-datatypes ((array!26213 0))(
  ( (array!26214 (arr!12556 (Array (_ BitVec 32) ValueCell!5252)) (size!12909 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26213)

(declare-fun e!253749 () Bool)

(declare-fun array_inv!9180 (array!26213) Bool)

(assert (=> start!39758 (and (array_inv!9180 _values!549) e!253749)))

(declare-fun array_inv!9181 (array!26211) Bool)

(assert (=> start!39758 (array_inv!9181 _keys!709)))

(declare-fun b!428219 () Bool)

(declare-fun res!251402 () Bool)

(declare-fun e!253752 () Bool)

(assert (=> b!428219 (=> (not res!251402) (not e!253752))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428219 (= res!251402 (bvsle from!863 i!563))))

(declare-fun b!428220 () Bool)

(declare-datatypes ((Unit!12558 0))(
  ( (Unit!12559) )
))
(declare-fun e!253748 () Unit!12558)

(declare-fun Unit!12560 () Unit!12558)

(assert (=> b!428220 (= e!253748 Unit!12560)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!195549 () Unit!12558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12558)

(assert (=> b!428220 (= lt!195549 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428220 false))

(declare-fun b!428221 () Bool)

(declare-fun res!251406 () Bool)

(assert (=> b!428221 (=> (not res!251406) (not e!253751))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428221 (= res!251406 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18408 () Bool)

(declare-fun mapRes!18408 () Bool)

(declare-fun tp!35645 () Bool)

(declare-fun e!253753 () Bool)

(assert (=> mapNonEmpty!18408 (= mapRes!18408 (and tp!35645 e!253753))))

(declare-fun mapRest!18408 () (Array (_ BitVec 32) ValueCell!5252))

(declare-fun mapValue!18408 () ValueCell!5252)

(declare-fun mapKey!18408 () (_ BitVec 32))

(assert (=> mapNonEmpty!18408 (= (arr!12556 _values!549) (store mapRest!18408 mapKey!18408 mapValue!18408))))

(declare-fun b!428222 () Bool)

(declare-fun res!251399 () Bool)

(assert (=> b!428222 (=> (not res!251399) (not e!253751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428222 (= res!251399 (validKeyInArray!0 k0!794))))

(declare-fun b!428223 () Bool)

(declare-fun e!253750 () Bool)

(assert (=> b!428223 (= e!253750 true)))

(assert (=> b!428223 (not (= (select (arr!12555 _keys!709) from!863) k0!794))))

(declare-fun lt!195547 () Unit!12558)

(assert (=> b!428223 (= lt!195547 e!253748)))

(declare-fun c!55323 () Bool)

(assert (=> b!428223 (= c!55323 (= (select (arr!12555 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7424 0))(
  ( (tuple2!7425 (_1!3723 (_ BitVec 64)) (_2!3723 V!16027)) )
))
(declare-datatypes ((List!7425 0))(
  ( (Nil!7422) (Cons!7421 (h!8277 tuple2!7424) (t!12904 List!7425)) )
))
(declare-datatypes ((ListLongMap!6327 0))(
  ( (ListLongMap!6328 (toList!3179 List!7425)) )
))
(declare-fun lt!195544 () ListLongMap!6327)

(declare-fun lt!195548 () ListLongMap!6327)

(declare-fun +!1358 (ListLongMap!6327 tuple2!7424) ListLongMap!6327)

(declare-fun get!6221 (ValueCell!5252 V!16027) V!16027)

(declare-fun dynLambda!757 (Int (_ BitVec 64)) V!16027)

(assert (=> b!428223 (= lt!195544 (+!1358 lt!195548 (tuple2!7425 (select (arr!12555 _keys!709) from!863) (get!6221 (select (arr!12556 _values!549) from!863) (dynLambda!757 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428224 () Bool)

(declare-fun e!253755 () Bool)

(assert (=> b!428224 (= e!253749 (and e!253755 mapRes!18408))))

(declare-fun condMapEmpty!18408 () Bool)

(declare-fun mapDefault!18408 () ValueCell!5252)

(assert (=> b!428224 (= condMapEmpty!18408 (= (arr!12556 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5252)) mapDefault!18408)))))

(declare-fun b!428225 () Bool)

(declare-fun res!251401 () Bool)

(assert (=> b!428225 (=> (not res!251401) (not e!253751))))

(declare-fun arrayContainsKey!0 (array!26211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428225 (= res!251401 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428226 () Bool)

(declare-fun res!251400 () Bool)

(assert (=> b!428226 (=> (not res!251400) (not e!253751))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!428226 (= res!251400 (and (= (size!12909 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12908 _keys!709) (size!12909 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428227 () Bool)

(assert (=> b!428227 (= e!253753 tp_is_empty!11191)))

(declare-fun b!428228 () Bool)

(declare-fun res!251405 () Bool)

(assert (=> b!428228 (=> (not res!251405) (not e!253751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26211 (_ BitVec 32)) Bool)

(assert (=> b!428228 (= res!251405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428229 () Bool)

(declare-fun res!251407 () Bool)

(assert (=> b!428229 (=> (not res!251407) (not e!253752))))

(declare-fun lt!195543 () array!26211)

(assert (=> b!428229 (= res!251407 (arrayNoDuplicates!0 lt!195543 #b00000000000000000000000000000000 Nil!7421))))

(declare-fun b!428230 () Bool)

(declare-fun e!253754 () Bool)

(assert (=> b!428230 (= e!253754 (not e!253750))))

(declare-fun res!251397 () Bool)

(assert (=> b!428230 (=> res!251397 e!253750)))

(assert (=> b!428230 (= res!251397 (not (validKeyInArray!0 (select (arr!12555 _keys!709) from!863))))))

(declare-fun lt!195551 () ListLongMap!6327)

(assert (=> b!428230 (= lt!195551 lt!195548)))

(declare-fun lt!195542 () ListLongMap!6327)

(declare-fun v!412 () V!16027)

(assert (=> b!428230 (= lt!195548 (+!1358 lt!195542 (tuple2!7425 k0!794 v!412)))))

(declare-fun minValue!515 () V!16027)

(declare-fun zeroValue!515 () V!16027)

(declare-fun lt!195550 () array!26213)

(declare-fun getCurrentListMapNoExtraKeys!1386 (array!26211 array!26213 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) Int) ListLongMap!6327)

(assert (=> b!428230 (= lt!195551 (getCurrentListMapNoExtraKeys!1386 lt!195543 lt!195550 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428230 (= lt!195542 (getCurrentListMapNoExtraKeys!1386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195545 () Unit!12558)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 (array!26211 array!26213 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) (_ BitVec 64) V!16027 (_ BitVec 32) Int) Unit!12558)

(assert (=> b!428230 (= lt!195545 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428231 () Bool)

(declare-fun Unit!12561 () Unit!12558)

(assert (=> b!428231 (= e!253748 Unit!12561)))

(declare-fun mapIsEmpty!18408 () Bool)

(assert (=> mapIsEmpty!18408 mapRes!18408))

(declare-fun b!428232 () Bool)

(declare-fun res!251409 () Bool)

(assert (=> b!428232 (=> (not res!251409) (not e!253751))))

(assert (=> b!428232 (= res!251409 (or (= (select (arr!12555 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12555 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428233 () Bool)

(declare-fun res!251396 () Bool)

(assert (=> b!428233 (=> (not res!251396) (not e!253751))))

(assert (=> b!428233 (= res!251396 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12908 _keys!709))))))

(declare-fun b!428234 () Bool)

(assert (=> b!428234 (= e!253751 e!253752)))

(declare-fun res!251398 () Bool)

(assert (=> b!428234 (=> (not res!251398) (not e!253752))))

(assert (=> b!428234 (= res!251398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195543 mask!1025))))

(assert (=> b!428234 (= lt!195543 (array!26212 (store (arr!12555 _keys!709) i!563 k0!794) (size!12908 _keys!709)))))

(declare-fun b!428235 () Bool)

(assert (=> b!428235 (= e!253755 tp_is_empty!11191)))

(declare-fun b!428236 () Bool)

(assert (=> b!428236 (= e!253752 e!253754)))

(declare-fun res!251404 () Bool)

(assert (=> b!428236 (=> (not res!251404) (not e!253754))))

(assert (=> b!428236 (= res!251404 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428236 (= lt!195544 (getCurrentListMapNoExtraKeys!1386 lt!195543 lt!195550 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428236 (= lt!195550 (array!26214 (store (arr!12556 _values!549) i!563 (ValueCellFull!5252 v!412)) (size!12909 _values!549)))))

(declare-fun lt!195546 () ListLongMap!6327)

(assert (=> b!428236 (= lt!195546 (getCurrentListMapNoExtraKeys!1386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39758 res!251408) b!428221))

(assert (= (and b!428221 res!251406) b!428226))

(assert (= (and b!428226 res!251400) b!428228))

(assert (= (and b!428228 res!251405) b!428218))

(assert (= (and b!428218 res!251403) b!428233))

(assert (= (and b!428233 res!251396) b!428222))

(assert (= (and b!428222 res!251399) b!428232))

(assert (= (and b!428232 res!251409) b!428225))

(assert (= (and b!428225 res!251401) b!428234))

(assert (= (and b!428234 res!251398) b!428229))

(assert (= (and b!428229 res!251407) b!428219))

(assert (= (and b!428219 res!251402) b!428236))

(assert (= (and b!428236 res!251404) b!428230))

(assert (= (and b!428230 (not res!251397)) b!428223))

(assert (= (and b!428223 c!55323) b!428220))

(assert (= (and b!428223 (not c!55323)) b!428231))

(assert (= (and b!428224 condMapEmpty!18408) mapIsEmpty!18408))

(assert (= (and b!428224 (not condMapEmpty!18408)) mapNonEmpty!18408))

(get-info :version)

(assert (= (and mapNonEmpty!18408 ((_ is ValueCellFull!5252) mapValue!18408)) b!428227))

(assert (= (and b!428224 ((_ is ValueCellFull!5252) mapDefault!18408)) b!428235))

(assert (= start!39758 b!428224))

(declare-fun b_lambda!9109 () Bool)

(assert (=> (not b_lambda!9109) (not b!428223)))

(declare-fun t!12902 () Bool)

(declare-fun tb!3437 () Bool)

(assert (=> (and start!39758 (= defaultEntry!557 defaultEntry!557) t!12902) tb!3437))

(declare-fun result!6409 () Bool)

(assert (=> tb!3437 (= result!6409 tp_is_empty!11191)))

(assert (=> b!428223 t!12902))

(declare-fun b_and!17713 () Bool)

(assert (= b_and!17711 (and (=> t!12902 result!6409) b_and!17713)))

(declare-fun m!416181 () Bool)

(assert (=> b!428218 m!416181))

(declare-fun m!416183 () Bool)

(assert (=> start!39758 m!416183))

(declare-fun m!416185 () Bool)

(assert (=> start!39758 m!416185))

(declare-fun m!416187 () Bool)

(assert (=> b!428232 m!416187))

(declare-fun m!416189 () Bool)

(assert (=> b!428220 m!416189))

(declare-fun m!416191 () Bool)

(assert (=> b!428234 m!416191))

(declare-fun m!416193 () Bool)

(assert (=> b!428234 m!416193))

(declare-fun m!416195 () Bool)

(assert (=> b!428225 m!416195))

(declare-fun m!416197 () Bool)

(assert (=> b!428230 m!416197))

(declare-fun m!416199 () Bool)

(assert (=> b!428230 m!416199))

(declare-fun m!416201 () Bool)

(assert (=> b!428230 m!416201))

(assert (=> b!428230 m!416197))

(declare-fun m!416203 () Bool)

(assert (=> b!428230 m!416203))

(declare-fun m!416205 () Bool)

(assert (=> b!428230 m!416205))

(declare-fun m!416207 () Bool)

(assert (=> b!428230 m!416207))

(assert (=> b!428223 m!416197))

(declare-fun m!416209 () Bool)

(assert (=> b!428223 m!416209))

(declare-fun m!416211 () Bool)

(assert (=> b!428223 m!416211))

(declare-fun m!416213 () Bool)

(assert (=> b!428223 m!416213))

(assert (=> b!428223 m!416213))

(assert (=> b!428223 m!416209))

(declare-fun m!416215 () Bool)

(assert (=> b!428223 m!416215))

(declare-fun m!416217 () Bool)

(assert (=> b!428228 m!416217))

(declare-fun m!416219 () Bool)

(assert (=> b!428236 m!416219))

(declare-fun m!416221 () Bool)

(assert (=> b!428236 m!416221))

(declare-fun m!416223 () Bool)

(assert (=> b!428236 m!416223))

(declare-fun m!416225 () Bool)

(assert (=> mapNonEmpty!18408 m!416225))

(declare-fun m!416227 () Bool)

(assert (=> b!428222 m!416227))

(declare-fun m!416229 () Bool)

(assert (=> b!428229 m!416229))

(declare-fun m!416231 () Bool)

(assert (=> b!428221 m!416231))

(check-sat (not b!428234) (not b!428221) (not b!428236) tp_is_empty!11191 (not b!428222) (not b_lambda!9109) (not b_next!10039) (not b!428223) (not b!428228) b_and!17713 (not b!428225) (not start!39758) (not b!428220) (not b!428218) (not mapNonEmpty!18408) (not b!428230) (not b!428229))
(check-sat b_and!17713 (not b_next!10039))
