; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39234 () Bool)

(assert start!39234)

(declare-fun b_free!9501 () Bool)

(declare-fun b_next!9501 () Bool)

(assert (=> start!39234 (= b_free!9501 (not b_next!9501))))

(declare-fun tp!34031 () Bool)

(declare-fun b_and!16887 () Bool)

(assert (=> start!39234 (= tp!34031 b_and!16887)))

(declare-datatypes ((array!25163 0))(
  ( (array!25164 (arr!12031 (Array (_ BitVec 32) (_ BitVec 64))) (size!12383 (_ BitVec 32))) )
))
(declare-fun lt!189908 () array!25163)

(declare-datatypes ((V!15309 0))(
  ( (V!15310 (val!5371 Int)) )
))
(declare-fun minValue!515 () V!15309)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4983 0))(
  ( (ValueCellFull!4983 (v!7618 V!15309)) (EmptyCell!4983) )
))
(declare-datatypes ((array!25165 0))(
  ( (array!25166 (arr!12032 (Array (_ BitVec 32) ValueCell!4983)) (size!12384 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25165)

(declare-fun zeroValue!515 () V!15309)

(declare-fun lt!189904 () array!25165)

(declare-fun bm!28678 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25163)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54965 () Bool)

(declare-datatypes ((tuple2!6982 0))(
  ( (tuple2!6983 (_1!3502 (_ BitVec 64)) (_2!3502 V!15309)) )
))
(declare-datatypes ((List!7005 0))(
  ( (Nil!7002) (Cons!7001 (h!7857 tuple2!6982) (t!12179 List!7005)) )
))
(declare-datatypes ((ListLongMap!5895 0))(
  ( (ListLongMap!5896 (toList!2963 List!7005)) )
))
(declare-fun call!28682 () ListLongMap!5895)

(declare-fun getCurrentListMapNoExtraKeys!1170 (array!25163 array!25165 (_ BitVec 32) (_ BitVec 32) V!15309 V!15309 (_ BitVec 32) Int) ListLongMap!5895)

(assert (=> bm!28678 (= call!28682 (getCurrentListMapNoExtraKeys!1170 (ite c!54965 lt!189908 _keys!709) (ite c!54965 lt!189904 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414081 () Bool)

(declare-fun res!240717 () Bool)

(declare-fun e!247520 () Bool)

(assert (=> b!414081 (=> (not res!240717) (not e!247520))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414081 (= res!240717 (validKeyInArray!0 k0!794))))

(declare-fun b!414082 () Bool)

(declare-fun e!247519 () Bool)

(declare-fun e!247518 () Bool)

(declare-fun mapRes!17601 () Bool)

(assert (=> b!414082 (= e!247519 (and e!247518 mapRes!17601))))

(declare-fun condMapEmpty!17601 () Bool)

(declare-fun mapDefault!17601 () ValueCell!4983)

(assert (=> b!414082 (= condMapEmpty!17601 (= (arr!12032 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4983)) mapDefault!17601)))))

(declare-fun b!414083 () Bool)

(declare-fun res!240718 () Bool)

(assert (=> b!414083 (=> (not res!240718) (not e!247520))))

(assert (=> b!414083 (= res!240718 (and (= (size!12384 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12383 _keys!709) (size!12384 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414084 () Bool)

(declare-fun res!240708 () Bool)

(assert (=> b!414084 (=> (not res!240708) (not e!247520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414084 (= res!240708 (validMask!0 mask!1025))))

(declare-fun b!414085 () Bool)

(declare-fun res!240710 () Bool)

(assert (=> b!414085 (=> (not res!240710) (not e!247520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25163 (_ BitVec 32)) Bool)

(assert (=> b!414085 (= res!240710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414087 () Bool)

(declare-fun e!247524 () Bool)

(declare-fun tp_is_empty!10653 () Bool)

(assert (=> b!414087 (= e!247524 tp_is_empty!10653)))

(declare-fun b!414088 () Bool)

(declare-fun e!247521 () Bool)

(declare-fun e!247522 () Bool)

(assert (=> b!414088 (= e!247521 e!247522)))

(declare-fun res!240720 () Bool)

(assert (=> b!414088 (=> (not res!240720) (not e!247522))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414088 (= res!240720 (= from!863 i!563))))

(declare-fun lt!189905 () ListLongMap!5895)

(assert (=> b!414088 (= lt!189905 (getCurrentListMapNoExtraKeys!1170 lt!189908 lt!189904 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15309)

(assert (=> b!414088 (= lt!189904 (array!25166 (store (arr!12032 _values!549) i!563 (ValueCellFull!4983 v!412)) (size!12384 _values!549)))))

(declare-fun lt!189906 () ListLongMap!5895)

(assert (=> b!414088 (= lt!189906 (getCurrentListMapNoExtraKeys!1170 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414089 () Bool)

(declare-fun res!240712 () Bool)

(assert (=> b!414089 (=> (not res!240712) (not e!247520))))

(declare-datatypes ((List!7006 0))(
  ( (Nil!7003) (Cons!7002 (h!7858 (_ BitVec 64)) (t!12180 List!7006)) )
))
(declare-fun arrayNoDuplicates!0 (array!25163 (_ BitVec 32) List!7006) Bool)

(assert (=> b!414089 (= res!240712 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7003))))

(declare-fun b!414090 () Bool)

(declare-fun e!247517 () Bool)

(declare-fun call!28681 () ListLongMap!5895)

(assert (=> b!414090 (= e!247517 (= call!28681 call!28682))))

(declare-fun mapNonEmpty!17601 () Bool)

(declare-fun tp!34032 () Bool)

(assert (=> mapNonEmpty!17601 (= mapRes!17601 (and tp!34032 e!247524))))

(declare-fun mapRest!17601 () (Array (_ BitVec 32) ValueCell!4983))

(declare-fun mapKey!17601 () (_ BitVec 32))

(declare-fun mapValue!17601 () ValueCell!4983)

(assert (=> mapNonEmpty!17601 (= (arr!12032 _values!549) (store mapRest!17601 mapKey!17601 mapValue!17601))))

(declare-fun b!414091 () Bool)

(assert (=> b!414091 (= e!247522 (not true))))

(assert (=> b!414091 e!247517))

(assert (=> b!414091 (= c!54965 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12248 0))(
  ( (Unit!12249) )
))
(declare-fun lt!189907 () Unit!12248)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!382 (array!25163 array!25165 (_ BitVec 32) (_ BitVec 32) V!15309 V!15309 (_ BitVec 32) (_ BitVec 64) V!15309 (_ BitVec 32) Int) Unit!12248)

(assert (=> b!414091 (= lt!189907 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!382 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414092 () Bool)

(declare-fun res!240709 () Bool)

(assert (=> b!414092 (=> (not res!240709) (not e!247520))))

(assert (=> b!414092 (= res!240709 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12383 _keys!709))))))

(declare-fun mapIsEmpty!17601 () Bool)

(assert (=> mapIsEmpty!17601 mapRes!17601))

(declare-fun b!414093 () Bool)

(declare-fun res!240711 () Bool)

(assert (=> b!414093 (=> (not res!240711) (not e!247521))))

(assert (=> b!414093 (= res!240711 (arrayNoDuplicates!0 lt!189908 #b00000000000000000000000000000000 Nil!7003))))

(declare-fun b!414094 () Bool)

(declare-fun +!1170 (ListLongMap!5895 tuple2!6982) ListLongMap!5895)

(assert (=> b!414094 (= e!247517 (= call!28682 (+!1170 call!28681 (tuple2!6983 k0!794 v!412))))))

(declare-fun bm!28679 () Bool)

(assert (=> bm!28679 (= call!28681 (getCurrentListMapNoExtraKeys!1170 (ite c!54965 _keys!709 lt!189908) (ite c!54965 _values!549 lt!189904) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414086 () Bool)

(declare-fun res!240716 () Bool)

(assert (=> b!414086 (=> (not res!240716) (not e!247520))))

(assert (=> b!414086 (= res!240716 (or (= (select (arr!12031 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12031 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!240713 () Bool)

(assert (=> start!39234 (=> (not res!240713) (not e!247520))))

(assert (=> start!39234 (= res!240713 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12383 _keys!709))))))

(assert (=> start!39234 e!247520))

(assert (=> start!39234 tp_is_empty!10653))

(assert (=> start!39234 tp!34031))

(assert (=> start!39234 true))

(declare-fun array_inv!8774 (array!25165) Bool)

(assert (=> start!39234 (and (array_inv!8774 _values!549) e!247519)))

(declare-fun array_inv!8775 (array!25163) Bool)

(assert (=> start!39234 (array_inv!8775 _keys!709)))

(declare-fun b!414095 () Bool)

(assert (=> b!414095 (= e!247520 e!247521)))

(declare-fun res!240719 () Bool)

(assert (=> b!414095 (=> (not res!240719) (not e!247521))))

(assert (=> b!414095 (= res!240719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189908 mask!1025))))

(assert (=> b!414095 (= lt!189908 (array!25164 (store (arr!12031 _keys!709) i!563 k0!794) (size!12383 _keys!709)))))

(declare-fun b!414096 () Bool)

(declare-fun res!240714 () Bool)

(assert (=> b!414096 (=> (not res!240714) (not e!247520))))

(declare-fun arrayContainsKey!0 (array!25163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414096 (= res!240714 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414097 () Bool)

(assert (=> b!414097 (= e!247518 tp_is_empty!10653)))

(declare-fun b!414098 () Bool)

(declare-fun res!240715 () Bool)

(assert (=> b!414098 (=> (not res!240715) (not e!247521))))

(assert (=> b!414098 (= res!240715 (bvsle from!863 i!563))))

(assert (= (and start!39234 res!240713) b!414084))

(assert (= (and b!414084 res!240708) b!414083))

(assert (= (and b!414083 res!240718) b!414085))

(assert (= (and b!414085 res!240710) b!414089))

(assert (= (and b!414089 res!240712) b!414092))

(assert (= (and b!414092 res!240709) b!414081))

(assert (= (and b!414081 res!240717) b!414086))

(assert (= (and b!414086 res!240716) b!414096))

(assert (= (and b!414096 res!240714) b!414095))

(assert (= (and b!414095 res!240719) b!414093))

(assert (= (and b!414093 res!240711) b!414098))

(assert (= (and b!414098 res!240715) b!414088))

(assert (= (and b!414088 res!240720) b!414091))

(assert (= (and b!414091 c!54965) b!414094))

(assert (= (and b!414091 (not c!54965)) b!414090))

(assert (= (or b!414094 b!414090) bm!28678))

(assert (= (or b!414094 b!414090) bm!28679))

(assert (= (and b!414082 condMapEmpty!17601) mapIsEmpty!17601))

(assert (= (and b!414082 (not condMapEmpty!17601)) mapNonEmpty!17601))

(get-info :version)

(assert (= (and mapNonEmpty!17601 ((_ is ValueCellFull!4983) mapValue!17601)) b!414087))

(assert (= (and b!414082 ((_ is ValueCellFull!4983) mapDefault!17601)) b!414097))

(assert (= start!39234 b!414082))

(declare-fun m!403389 () Bool)

(assert (=> mapNonEmpty!17601 m!403389))

(declare-fun m!403391 () Bool)

(assert (=> b!414094 m!403391))

(declare-fun m!403393 () Bool)

(assert (=> b!414088 m!403393))

(declare-fun m!403395 () Bool)

(assert (=> b!414088 m!403395))

(declare-fun m!403397 () Bool)

(assert (=> b!414088 m!403397))

(declare-fun m!403399 () Bool)

(assert (=> b!414084 m!403399))

(declare-fun m!403401 () Bool)

(assert (=> b!414081 m!403401))

(declare-fun m!403403 () Bool)

(assert (=> b!414096 m!403403))

(declare-fun m!403405 () Bool)

(assert (=> b!414093 m!403405))

(declare-fun m!403407 () Bool)

(assert (=> b!414086 m!403407))

(declare-fun m!403409 () Bool)

(assert (=> b!414089 m!403409))

(declare-fun m!403411 () Bool)

(assert (=> bm!28678 m!403411))

(declare-fun m!403413 () Bool)

(assert (=> bm!28679 m!403413))

(declare-fun m!403415 () Bool)

(assert (=> start!39234 m!403415))

(declare-fun m!403417 () Bool)

(assert (=> start!39234 m!403417))

(declare-fun m!403419 () Bool)

(assert (=> b!414095 m!403419))

(declare-fun m!403421 () Bool)

(assert (=> b!414095 m!403421))

(declare-fun m!403423 () Bool)

(assert (=> b!414085 m!403423))

(declare-fun m!403425 () Bool)

(assert (=> b!414091 m!403425))

(check-sat (not bm!28679) (not b!414091) (not mapNonEmpty!17601) (not bm!28678) (not b!414088) (not b!414093) (not b!414095) (not b!414096) b_and!16887 (not b!414085) (not b!414094) (not b!414089) tp_is_empty!10653 (not b_next!9501) (not b!414081) (not b!414084) (not start!39234))
(check-sat b_and!16887 (not b_next!9501))
