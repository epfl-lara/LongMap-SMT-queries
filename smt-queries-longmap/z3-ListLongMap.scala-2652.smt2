; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39716 () Bool)

(assert start!39716)

(declare-fun b_free!9997 () Bool)

(declare-fun b_next!9997 () Bool)

(assert (=> start!39716 (= b_free!9997 (not b_next!9997))))

(declare-fun tp!35519 () Bool)

(declare-fun b_and!17627 () Bool)

(assert (=> start!39716 (= tp!35519 b_and!17627)))

(declare-fun b!427083 () Bool)

(declare-fun e!253239 () Bool)

(declare-fun tp_is_empty!11149 () Bool)

(assert (=> b!427083 (= e!253239 tp_is_empty!11149)))

(declare-fun mapNonEmpty!18345 () Bool)

(declare-fun mapRes!18345 () Bool)

(declare-fun tp!35520 () Bool)

(declare-fun e!253234 () Bool)

(assert (=> mapNonEmpty!18345 (= mapRes!18345 (and tp!35520 e!253234))))

(declare-fun mapKey!18345 () (_ BitVec 32))

(declare-datatypes ((V!15971 0))(
  ( (V!15972 (val!5619 Int)) )
))
(declare-datatypes ((ValueCell!5231 0))(
  ( (ValueCellFull!5231 (v!7860 V!15971)) (EmptyCell!5231) )
))
(declare-fun mapValue!18345 () ValueCell!5231)

(declare-datatypes ((array!26127 0))(
  ( (array!26128 (arr!12513 (Array (_ BitVec 32) ValueCell!5231)) (size!12866 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26127)

(declare-fun mapRest!18345 () (Array (_ BitVec 32) ValueCell!5231))

(assert (=> mapNonEmpty!18345 (= (arr!12513 _values!549) (store mapRest!18345 mapKey!18345 mapValue!18345))))

(declare-fun b!427085 () Bool)

(declare-fun res!250515 () Bool)

(declare-fun e!253236 () Bool)

(assert (=> b!427085 (=> (not res!250515) (not e!253236))))

(declare-datatypes ((array!26129 0))(
  ( (array!26130 (arr!12514 (Array (_ BitVec 32) (_ BitVec 64))) (size!12867 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26129)

(declare-datatypes ((List!7388 0))(
  ( (Nil!7385) (Cons!7384 (h!8240 (_ BitVec 64)) (t!12825 List!7388)) )
))
(declare-fun arrayNoDuplicates!0 (array!26129 (_ BitVec 32) List!7388) Bool)

(assert (=> b!427085 (= res!250515 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7385))))

(declare-fun b!427086 () Bool)

(declare-fun res!250521 () Bool)

(assert (=> b!427086 (=> (not res!250521) (not e!253236))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26129 (_ BitVec 32)) Bool)

(assert (=> b!427086 (= res!250521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427087 () Bool)

(declare-fun e!253238 () Bool)

(assert (=> b!427087 (= e!253238 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7384 0))(
  ( (tuple2!7385 (_1!3703 (_ BitVec 64)) (_2!3703 V!15971)) )
))
(declare-datatypes ((List!7389 0))(
  ( (Nil!7386) (Cons!7385 (h!8241 tuple2!7384) (t!12826 List!7389)) )
))
(declare-datatypes ((ListLongMap!6287 0))(
  ( (ListLongMap!6288 (toList!3159 List!7389)) )
))
(declare-fun lt!195023 () ListLongMap!6287)

(declare-fun lt!195018 () ListLongMap!6287)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1338 (ListLongMap!6287 tuple2!7384) ListLongMap!6287)

(declare-fun get!6187 (ValueCell!5231 V!15971) V!15971)

(declare-fun dynLambda!737 (Int (_ BitVec 64)) V!15971)

(assert (=> b!427087 (= lt!195023 (+!1338 lt!195018 (tuple2!7385 (select (arr!12514 _keys!709) from!863) (get!6187 (select (arr!12513 _values!549) from!863) (dynLambda!737 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427088 () Bool)

(declare-fun e!253235 () Bool)

(assert (=> b!427088 (= e!253235 (and e!253239 mapRes!18345))))

(declare-fun condMapEmpty!18345 () Bool)

(declare-fun mapDefault!18345 () ValueCell!5231)

(assert (=> b!427088 (= condMapEmpty!18345 (= (arr!12513 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5231)) mapDefault!18345)))))

(declare-fun b!427089 () Bool)

(declare-fun res!250517 () Bool)

(assert (=> b!427089 (=> (not res!250517) (not e!253236))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427089 (= res!250517 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427090 () Bool)

(declare-fun res!250520 () Bool)

(assert (=> b!427090 (=> (not res!250520) (not e!253236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427090 (= res!250520 (validKeyInArray!0 k0!794))))

(declare-fun b!427091 () Bool)

(declare-fun res!250516 () Bool)

(declare-fun e!253233 () Bool)

(assert (=> b!427091 (=> (not res!250516) (not e!253233))))

(declare-fun lt!195020 () array!26129)

(assert (=> b!427091 (= res!250516 (arrayNoDuplicates!0 lt!195020 #b00000000000000000000000000000000 Nil!7385))))

(declare-fun mapIsEmpty!18345 () Bool)

(assert (=> mapIsEmpty!18345 mapRes!18345))

(declare-fun b!427092 () Bool)

(declare-fun e!253232 () Bool)

(assert (=> b!427092 (= e!253232 (not e!253238))))

(declare-fun res!250514 () Bool)

(assert (=> b!427092 (=> res!250514 e!253238)))

(assert (=> b!427092 (= res!250514 (not (validKeyInArray!0 (select (arr!12514 _keys!709) from!863))))))

(declare-fun lt!195017 () ListLongMap!6287)

(assert (=> b!427092 (= lt!195017 lt!195018)))

(declare-fun lt!195021 () ListLongMap!6287)

(declare-fun v!412 () V!15971)

(assert (=> b!427092 (= lt!195018 (+!1338 lt!195021 (tuple2!7385 k0!794 v!412)))))

(declare-fun minValue!515 () V!15971)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15971)

(declare-fun lt!195016 () array!26127)

(declare-fun getCurrentListMapNoExtraKeys!1367 (array!26129 array!26127 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) Int) ListLongMap!6287)

(assert (=> b!427092 (= lt!195017 (getCurrentListMapNoExtraKeys!1367 lt!195020 lt!195016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427092 (= lt!195021 (getCurrentListMapNoExtraKeys!1367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12522 0))(
  ( (Unit!12523) )
))
(declare-fun lt!195022 () Unit!12522)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!509 (array!26129 array!26127 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) (_ BitVec 64) V!15971 (_ BitVec 32) Int) Unit!12522)

(assert (=> b!427092 (= lt!195022 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!509 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427084 () Bool)

(declare-fun res!250525 () Bool)

(assert (=> b!427084 (=> (not res!250525) (not e!253236))))

(assert (=> b!427084 (= res!250525 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12867 _keys!709))))))

(declare-fun res!250524 () Bool)

(assert (=> start!39716 (=> (not res!250524) (not e!253236))))

(assert (=> start!39716 (= res!250524 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12867 _keys!709))))))

(assert (=> start!39716 e!253236))

(assert (=> start!39716 tp_is_empty!11149))

(assert (=> start!39716 tp!35519))

(assert (=> start!39716 true))

(declare-fun array_inv!9146 (array!26127) Bool)

(assert (=> start!39716 (and (array_inv!9146 _values!549) e!253235)))

(declare-fun array_inv!9147 (array!26129) Bool)

(assert (=> start!39716 (array_inv!9147 _keys!709)))

(declare-fun b!427093 () Bool)

(declare-fun res!250526 () Bool)

(assert (=> b!427093 (=> (not res!250526) (not e!253236))))

(assert (=> b!427093 (= res!250526 (or (= (select (arr!12514 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12514 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427094 () Bool)

(declare-fun res!250522 () Bool)

(assert (=> b!427094 (=> (not res!250522) (not e!253236))))

(assert (=> b!427094 (= res!250522 (and (= (size!12866 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12867 _keys!709) (size!12866 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427095 () Bool)

(assert (=> b!427095 (= e!253234 tp_is_empty!11149)))

(declare-fun b!427096 () Bool)

(assert (=> b!427096 (= e!253233 e!253232)))

(declare-fun res!250519 () Bool)

(assert (=> b!427096 (=> (not res!250519) (not e!253232))))

(assert (=> b!427096 (= res!250519 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!427096 (= lt!195023 (getCurrentListMapNoExtraKeys!1367 lt!195020 lt!195016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427096 (= lt!195016 (array!26128 (store (arr!12513 _values!549) i!563 (ValueCellFull!5231 v!412)) (size!12866 _values!549)))))

(declare-fun lt!195019 () ListLongMap!6287)

(assert (=> b!427096 (= lt!195019 (getCurrentListMapNoExtraKeys!1367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427097 () Bool)

(declare-fun res!250518 () Bool)

(assert (=> b!427097 (=> (not res!250518) (not e!253236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427097 (= res!250518 (validMask!0 mask!1025))))

(declare-fun b!427098 () Bool)

(assert (=> b!427098 (= e!253236 e!253233)))

(declare-fun res!250523 () Bool)

(assert (=> b!427098 (=> (not res!250523) (not e!253233))))

(assert (=> b!427098 (= res!250523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195020 mask!1025))))

(assert (=> b!427098 (= lt!195020 (array!26130 (store (arr!12514 _keys!709) i!563 k0!794) (size!12867 _keys!709)))))

(declare-fun b!427099 () Bool)

(declare-fun res!250527 () Bool)

(assert (=> b!427099 (=> (not res!250527) (not e!253233))))

(assert (=> b!427099 (= res!250527 (bvsle from!863 i!563))))

(assert (= (and start!39716 res!250524) b!427097))

(assert (= (and b!427097 res!250518) b!427094))

(assert (= (and b!427094 res!250522) b!427086))

(assert (= (and b!427086 res!250521) b!427085))

(assert (= (and b!427085 res!250515) b!427084))

(assert (= (and b!427084 res!250525) b!427090))

(assert (= (and b!427090 res!250520) b!427093))

(assert (= (and b!427093 res!250526) b!427089))

(assert (= (and b!427089 res!250517) b!427098))

(assert (= (and b!427098 res!250523) b!427091))

(assert (= (and b!427091 res!250516) b!427099))

(assert (= (and b!427099 res!250527) b!427096))

(assert (= (and b!427096 res!250519) b!427092))

(assert (= (and b!427092 (not res!250514)) b!427087))

(assert (= (and b!427088 condMapEmpty!18345) mapIsEmpty!18345))

(assert (= (and b!427088 (not condMapEmpty!18345)) mapNonEmpty!18345))

(get-info :version)

(assert (= (and mapNonEmpty!18345 ((_ is ValueCellFull!5231) mapValue!18345)) b!427095))

(assert (= (and b!427088 ((_ is ValueCellFull!5231) mapDefault!18345)) b!427083))

(assert (= start!39716 b!427088))

(declare-fun b_lambda!9067 () Bool)

(assert (=> (not b_lambda!9067) (not b!427087)))

(declare-fun t!12824 () Bool)

(declare-fun tb!3395 () Bool)

(assert (=> (and start!39716 (= defaultEntry!557 defaultEntry!557) t!12824) tb!3395))

(declare-fun result!6325 () Bool)

(assert (=> tb!3395 (= result!6325 tp_is_empty!11149)))

(assert (=> b!427087 t!12824))

(declare-fun b_and!17629 () Bool)

(assert (= b_and!17627 (and (=> t!12824 result!6325) b_and!17629)))

(declare-fun m!415125 () Bool)

(assert (=> b!427087 m!415125))

(declare-fun m!415127 () Bool)

(assert (=> b!427087 m!415127))

(declare-fun m!415129 () Bool)

(assert (=> b!427087 m!415129))

(declare-fun m!415131 () Bool)

(assert (=> b!427087 m!415131))

(assert (=> b!427087 m!415131))

(assert (=> b!427087 m!415129))

(declare-fun m!415133 () Bool)

(assert (=> b!427087 m!415133))

(assert (=> b!427092 m!415125))

(declare-fun m!415135 () Bool)

(assert (=> b!427092 m!415135))

(declare-fun m!415137 () Bool)

(assert (=> b!427092 m!415137))

(declare-fun m!415139 () Bool)

(assert (=> b!427092 m!415139))

(assert (=> b!427092 m!415125))

(declare-fun m!415141 () Bool)

(assert (=> b!427092 m!415141))

(declare-fun m!415143 () Bool)

(assert (=> b!427092 m!415143))

(declare-fun m!415145 () Bool)

(assert (=> b!427097 m!415145))

(declare-fun m!415147 () Bool)

(assert (=> b!427096 m!415147))

(declare-fun m!415149 () Bool)

(assert (=> b!427096 m!415149))

(declare-fun m!415151 () Bool)

(assert (=> b!427096 m!415151))

(declare-fun m!415153 () Bool)

(assert (=> b!427085 m!415153))

(declare-fun m!415155 () Bool)

(assert (=> start!39716 m!415155))

(declare-fun m!415157 () Bool)

(assert (=> start!39716 m!415157))

(declare-fun m!415159 () Bool)

(assert (=> b!427086 m!415159))

(declare-fun m!415161 () Bool)

(assert (=> b!427089 m!415161))

(declare-fun m!415163 () Bool)

(assert (=> b!427098 m!415163))

(declare-fun m!415165 () Bool)

(assert (=> b!427098 m!415165))

(declare-fun m!415167 () Bool)

(assert (=> b!427091 m!415167))

(declare-fun m!415169 () Bool)

(assert (=> b!427093 m!415169))

(declare-fun m!415171 () Bool)

(assert (=> b!427090 m!415171))

(declare-fun m!415173 () Bool)

(assert (=> mapNonEmpty!18345 m!415173))

(check-sat (not b!427097) (not b!427092) (not b_lambda!9067) (not start!39716) (not b!427098) (not b!427096) (not b!427091) (not b!427086) (not b!427085) (not b!427087) (not b!427089) (not mapNonEmpty!18345) (not b!427090) b_and!17629 (not b_next!9997) tp_is_empty!11149)
(check-sat b_and!17629 (not b_next!9997))
